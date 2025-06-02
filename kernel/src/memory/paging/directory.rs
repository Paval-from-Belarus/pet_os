use crate::memory::{Page, PhysicalAddress};

use super::{table::DirEntry, PageDirectoryEntries, DIRECTORY_ENTRIES_COUNT};

#[derive(Debug)]
pub struct PageDirectory<'page_dir, 'page_table> {
    pub entries:
        &'page_dir mut [DirEntry<'page_table>; DIRECTORY_ENTRIES_COUNT],
    pub physical_offset: PhysicalAddress,
}

impl<'page_dir, 'page_table> PageDirectory<'page_dir, 'page_table> {
    //set that pages are used by another process
    //this method should return page entries for PageMarker
    #[must_use]
    pub unsafe fn share_entries(
        &'page_dir self,
    ) -> &'page_dir PageDirectoryEntries<'page_table> {
        for table_entry in self.entries.iter() {
            let _ = Page::take(table_entry.table_offset());

            let Some(table) = table_entry.page_table() else {
                continue;
            };

            for page_entry in table.iter() {
                if page_entry.has_page() {
                    Page::take(page_entry.page_offset());
                }
            }
        }
        self.entries
    }
}
