## The project target layout
- `target/loader/` ― the binary files of Dos loaders
  - Should be two files: `MBR.bin` and `OsLoader.bin`
- `target/apps` ― user defined (prebuilt) programs that will be available from the scratch
  - Files will be stored in `Programs` directory
- `target/kernel` ― should contain only one file `kernel.bin`
  - File will be initially bootstrap and loaded into real mode
  - Obviously, the file size should not exceed two MiB (the real mode restrictions)
- `target/images` ― holds bootable images of PetOS
  - At least, holds image.iso file that available to be run via CD-ROM
- `target/logs` ― the additional info about compilation process
  - Used by any compiler to save debug info


- Linux use cases
1. Two kind of deferrable actions:
  - Running in interrupt context
  - Running in process context
2. Methods over deferrable actions:
  - Initialize (create structure)
  - Activate | Schedule action (submit action to execution)
  - Mask | Unmask execution
3. Using Soft IRQ tasks
  - There is a dedicated thread on cpu to handle interrupt actions (a kind of IO Worker)
  - Specific interrupt can raise specific kind of work
  - Statically allocated
```C
  enum
  {
    HI_SOFTIRQ=0,
    TIMER_SOFTIRQ,
    NET_TX_SOFTIRQ,
    NET_RX_SOFTIRQ,
    BLOCK_SOFTIRQ,
    IRQ_POLL_SOFTIRQ,
    TASKLET_SOFTIRQ,
    SCHED_SOFTIRQ,
    HRTIMER_SOFTIRQ,
    RCU_SOFTIRQ,    /* Preferable RCU should always be the last softirq */
  
    NR_SOFTIRQS
  };
```
### Taskslets
- Deferred work running in interrupt context
- Implemented over `TASKLET_SOFITIRQ` and `HI_SOFTIRQ`
- Methods:
  - `init`
  - `schedule`
  - `enable` | `disable`
### Workqueu
- Deferred work running in process context
- Methods:
  - `init`
  - `schedule_work`
### Timer
- Implemented over `TIMER_SOFTIRQ`
 


```bash
  set root(hd0,msdos1)
  multiboot2 /sys/io.sys
  boot
```

issue list:
1. Unhandled IRQ6 cause system be in not working state
2. physicall alloc use too many physical pages
3. physical dealloc works poorly (not working)

4. user tasks are not tested
5. relocation is not tested
8. отладить исполнение задач
10. Добавить поддержку grub command line
11. Проверка на некорректный дескриптор объекта


6. communication is not tested
12. return from process should do something reasonable

Баг pop gs почему-то не работает. Он порождает exception.


Когда:
1. Переключаемся на задачу пользовательского режима
2. Вытесняемся на задачу пользовательского режима 


Наблюдение
ss = KERNEL_DATA
esp = USER_STACK

task2 вытеснена таской, которая добровольно отпустилась -- работает

task2 вытеснила рабочую таску. потом таск2 была вытеснена доброльно освобождённой. Контекст таски2 поломался

надо отладить, почему не возможно созад


1. userspace



Проблема:
- постепенно сжимается стек задачи ядра для user-space
