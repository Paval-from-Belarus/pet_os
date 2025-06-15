
target/i686-unknown-linux-gnu/release/keyboard:     file format elf32-i386


Disassembly of section .note.gnu.build-id:

00000194 <.note.gnu.build-id>:
 194:	04 00                	add    $0x0,%al
 196:	00 00                	add    %al,(%eax)
 198:	14 00                	adc    $0x0,%al
 19a:	00 00                	add    %al,(%eax)
 19c:	03 00                	add    (%eax),%eax
 19e:	00 00                	add    %al,(%eax)
 1a0:	47                   	inc    %edi
 1a1:	4e                   	dec    %esi
 1a2:	55                   	push   %ebp
 1a3:	00 34 4b             	add    %dh,(%ebx,%ecx,2)
 1a6:	3e 4a                	ds dec %edx
 1a8:	0d 2d ef ac 79       	or     $0x79acef2d,%eax
 1ad:	2c d3                	sub    $0xd3,%al
 1af:	80 88 60 52 62 19 15 	orb    $0x15,0x19625260(%eax)
 1b6:	b7 e7                	mov    $0xe7,%bh

Disassembly of section .text:

00001000 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler>:
    1000:	53                   	push   %ebx
    1001:	83 ec 08             	sub    $0x8,%esp
    1004:	e8 00 00 00 00       	call   1009 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler+0x9>
    1009:	5b                   	pop    %ebx
    100a:	81 c3 eb 8f 00 00    	add    $0x8feb,%ebx
    1010:	e8 6b 00 00 00       	call   1080 <_RNvCs9xNfxAkRhBx_7___rustc9___rdl_oom>

00001015 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE>:
    1015:	53                   	push   %ebx
    1016:	83 ec 08             	sub    $0x8,%esp
    1019:	e8 00 00 00 00       	call   101e <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE+0x9>
    101e:	5b                   	pop    %ebx
    101f:	81 c3 d6 8f 00 00    	add    $0x8fd6,%ebx
    1025:	e8 d6 ff ff ff       	call   1000 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler>
    102a:	66 90                	xchg   %ax,%ax
    102c:	66 90                	xchg   %ax,%ax
    102e:	66 90                	xchg   %ax,%ax

00001030 <_ZN5alloc7raw_vec17capacity_overflow17hf4854d1cf84712dcE>:
    1030:	53                   	push   %ebx
    1031:	83 ec 18             	sub    $0x18,%esp
    1034:	e8 00 00 00 00       	call   1039 <_ZN5alloc7raw_vec17capacity_overflow17hf4854d1cf84712dcE+0x9>
    1039:	5b                   	pop    %ebx
    103a:	81 c3 bb 8f 00 00    	add    $0x8fbb,%ebx
    1040:	8d 83 28 fd ff ff    	lea    -0x2d8(%ebx),%eax
    1046:	89 04 24             	mov    %eax,(%esp)
    1049:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1050:	00 
    1051:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1058:	00 
    1059:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    1060:	00 
    1061:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1068:	00 
    1069:	8d 93 78 fe ff ff    	lea    -0x188(%ebx),%edx
    106f:	89 e1                	mov    %esp,%ecx
    1071:	e8 ba 00 00 00       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    1076:	66 90                	xchg   %ax,%ax
    1078:	66 90                	xchg   %ax,%ax
    107a:	66 90                	xchg   %ax,%ax
    107c:	66 90                	xchg   %ax,%ax
    107e:	66 90                	xchg   %ax,%ax

00001080 <_RNvCs9xNfxAkRhBx_7___rustc9___rdl_oom>:
    1080:	53                   	push   %ebx
    1081:	83 ec 28             	sub    $0x28,%esp
    1084:	e8 00 00 00 00       	call   1089 <_RNvCs9xNfxAkRhBx_7___rustc9___rdl_oom+0x9>
    1089:	5b                   	pop    %ebx
    108a:	81 c3 6b 8f 00 00    	add    $0x8f6b,%ebx
    1090:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1094:	8d 44 24 04          	lea    0x4(%esp),%eax
    1098:	89 44 24 08          	mov    %eax,0x8(%esp)
    109c:	8d 83 8c 8d ff ff    	lea    -0x7274(%ebx),%eax
    10a2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    10a6:	8d 83 30 fd ff ff    	lea    -0x2d0(%ebx),%eax
    10ac:	89 44 24 10          	mov    %eax,0x10(%esp)
    10b0:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    10b7:	00 
    10b8:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    10bf:	00 
    10c0:	8d 44 24 08          	lea    0x8(%esp),%eax
    10c4:	89 44 24 18          	mov    %eax,0x18(%esp)
    10c8:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    10cf:	00 
    10d0:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    10d4:	e8 b7 02 00 00       	call   1390 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E>

000010d9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>:
    10d9:	53                   	push   %ebx
    10da:	56                   	push   %esi
    10db:	83 ec 34             	sub    $0x34,%esp
    10de:	e8 00 00 00 00       	call   10e3 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E+0xa>
    10e3:	5b                   	pop    %ebx
    10e4:	81 c3 11 8f 00 00    	add    $0x8f11,%ebx
    10ea:	8d 44 24 04          	lea    0x4(%esp),%eax
    10ee:	89 08                	mov    %ecx,(%eax)
    10f0:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    10f4:	89 11                	mov    %edx,(%ecx)
    10f6:	8d 74 24 0c          	lea    0xc(%esp),%esi
    10fa:	89 0e                	mov    %ecx,(%esi)
    10fc:	8d 93 8c 8d ff ff    	lea    -0x7274(%ebx),%edx
    1102:	89 56 04             	mov    %edx,0x4(%esi)
    1105:	89 46 08             	mov    %eax,0x8(%esi)
    1108:	8d 83 68 fd ff ff    	lea    -0x298(%ebx),%eax
    110e:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    1112:	89 01                	mov    %eax,(%ecx)
    1114:	6a 02                	push   $0x2
    1116:	58                   	pop    %eax
    1117:	89 41 04             	mov    %eax,0x4(%ecx)
    111a:	83 61 10 00          	andl   $0x0,0x10(%ecx)
    111e:	89 56 0c             	mov    %edx,0xc(%esi)
    1121:	8b 54 24 40          	mov    0x40(%esp),%edx
    1125:	89 71 08             	mov    %esi,0x8(%ecx)
    1128:	89 41 0c             	mov    %eax,0xc(%ecx)
    112b:	e8 00 00 00 00       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>

00001130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>:
    1130:	53                   	push   %ebx
    1131:	83 ec 18             	sub    $0x18,%esp
    1134:	e8 00 00 00 00       	call   1139 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE+0x9>
    1139:	5b                   	pop    %ebx
    113a:	81 c3 bb 8e 00 00    	add    $0x8ebb,%ebx
    1140:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1144:	89 54 24 10          	mov    %edx,0x10(%esp)
    1148:	66 c7 44 24 14 01 00 	movw   $0x1,0x14(%esp)
    114f:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    1153:	e8 68 3f 00 00       	call   50c0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>
    1158:	66 90                	xchg   %ax,%ax
    115a:	66 90                	xchg   %ax,%ax
    115c:	66 90                	xchg   %ax,%ax
    115e:	66 90                	xchg   %ax,%ax

00001160 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E>:
    1160:	53                   	push   %ebx
    1161:	83 ec 08             	sub    $0x8,%esp
    1164:	e8 00 00 00 00       	call   1169 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E+0x9>
    1169:	5b                   	pop    %ebx
    116a:	81 c3 8b 8e 00 00    	add    $0x8e8b,%ebx
    1170:	e8 0b 00 00 00       	call   1180 <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h4789dd0a006d5905E>
    1175:	66 90                	xchg   %ax,%ax
    1177:	66 90                	xchg   %ax,%ax
    1179:	66 90                	xchg   %ax,%ax
    117b:	66 90                	xchg   %ax,%ax
    117d:	66 90                	xchg   %ax,%ax
    117f:	90                   	nop

00001180 <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h4789dd0a006d5905E>:
    1180:	53                   	push   %ebx
    1181:	83 ec 38             	sub    $0x38,%esp
    1184:	e8 00 00 00 00       	call   1189 <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h4789dd0a006d5905E+0x9>
    1189:	5b                   	pop    %ebx
    118a:	81 c3 6b 8e 00 00    	add    $0x8e6b,%ebx
    1190:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1194:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1198:	8d 44 24 08          	lea    0x8(%esp),%eax
    119c:	89 44 24 10          	mov    %eax,0x10(%esp)
    11a0:	8d 83 8c 8d ff ff    	lea    -0x7274(%ebx),%eax
    11a6:	89 44 24 14          	mov    %eax,0x14(%esp)
    11aa:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    11ae:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    11b2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    11b6:	8d 83 c0 fd ff ff    	lea    -0x240(%ebx),%eax
    11bc:	89 44 24 20          	mov    %eax,0x20(%esp)
    11c0:	c7 44 24 24 02 00 00 	movl   $0x2,0x24(%esp)
    11c7:	00 
    11c8:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    11cf:	00 
    11d0:	8d 44 24 10          	lea    0x10(%esp),%eax
    11d4:	89 44 24 28          	mov    %eax,0x28(%esp)
    11d8:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    11df:	00 
    11e0:	8d 93 a0 fd ff ff    	lea    -0x260(%ebx),%edx
    11e6:	8d 4c 24 20          	lea    0x20(%esp),%ecx
    11ea:	e8 41 ff ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    11ef:	90                   	nop

000011f0 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>:
    11f0:	53                   	push   %ebx
    11f1:	83 ec 28             	sub    $0x28,%esp
    11f4:	e8 00 00 00 00       	call   11f9 <_ZN4core9panicking5panic17hdc0bb452f89252d5E+0x9>
    11f9:	5b                   	pop    %ebx
    11fa:	81 c3 fb 8d 00 00    	add    $0x8dfb,%ebx
    1200:	8b 44 24 30          	mov    0x30(%esp),%eax
    1204:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1208:	89 54 24 0c          	mov    %edx,0xc(%esp)
    120c:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    1210:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1214:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    121b:	00 
    121c:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    1223:	00 
    1224:	c7 44 24 18 04 00 00 	movl   $0x4,0x18(%esp)
    122b:	00 
    122c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1233:	00 
    1234:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    1238:	89 c2                	mov    %eax,%edx
    123a:	e8 f1 fe ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    123f:	90                   	nop

00001240 <_ZN4core5slice5index22slice_index_order_fail17h3a5e48f4441e7556E>:
    1240:	53                   	push   %ebx
    1241:	83 ec 08             	sub    $0x8,%esp
    1244:	e8 00 00 00 00       	call   1249 <_ZN4core5slice5index22slice_index_order_fail17h3a5e48f4441e7556E+0x9>
    1249:	5b                   	pop    %ebx
    124a:	81 c3 ab 8d 00 00    	add    $0x8dab,%ebx
    1250:	e8 3b 00 00 00       	call   1290 <_ZN4core5slice5index22slice_index_order_fail8do_panic7runtime17h5d63dcd23c3ff4bfE>
    1255:	66 90                	xchg   %ax,%ax
    1257:	66 90                	xchg   %ax,%ax
    1259:	66 90                	xchg   %ax,%ax
    125b:	66 90                	xchg   %ax,%ax
    125d:	66 90                	xchg   %ax,%ax
    125f:	90                   	nop

00001260 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E>:
    1260:	53                   	push   %ebx
    1261:	83 ec 08             	sub    $0x8,%esp
    1264:	e8 00 00 00 00       	call   1269 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E+0x9>
    1269:	5b                   	pop    %ebx
    126a:	81 c3 8b 8d 00 00    	add    $0x8d8b,%ebx
    1270:	89 0c 24             	mov    %ecx,(%esp)
    1273:	8d 8b b3 db ff ff    	lea    -0x244d(%ebx),%ecx
    1279:	ba 2b 00 00 00       	mov    $0x2b,%edx
    127e:	e8 6d ff ff ff       	call   11f0 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    1283:	66 90                	xchg   %ax,%ax
    1285:	66 90                	xchg   %ax,%ax
    1287:	66 90                	xchg   %ax,%ax
    1289:	66 90                	xchg   %ax,%ax
    128b:	66 90                	xchg   %ax,%ax
    128d:	66 90                	xchg   %ax,%ax
    128f:	90                   	nop

00001290 <_ZN4core5slice5index22slice_index_order_fail8do_panic7runtime17h5d63dcd23c3ff4bfE>:
    1290:	53                   	push   %ebx
    1291:	83 ec 38             	sub    $0x38,%esp
    1294:	e8 00 00 00 00       	call   1299 <_ZN4core5slice5index22slice_index_order_fail8do_panic7runtime17h5d63dcd23c3ff4bfE+0x9>
    1299:	5b                   	pop    %ebx
    129a:	81 c3 5b 8d 00 00    	add    $0x8d5b,%ebx
    12a0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    12a4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    12a8:	8d 44 24 08          	lea    0x8(%esp),%eax
    12ac:	89 44 24 10          	mov    %eax,0x10(%esp)
    12b0:	8d 83 8c 8d ff ff    	lea    -0x7274(%ebx),%eax
    12b6:	89 44 24 14          	mov    %eax,0x14(%esp)
    12ba:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    12be:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    12c2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    12c6:	8d 83 d0 fd ff ff    	lea    -0x230(%ebx),%eax
    12cc:	89 44 24 20          	mov    %eax,0x20(%esp)
    12d0:	c7 44 24 24 02 00 00 	movl   $0x2,0x24(%esp)
    12d7:	00 
    12d8:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    12df:	00 
    12e0:	8d 44 24 10          	lea    0x10(%esp),%eax
    12e4:	89 44 24 28          	mov    %eax,0x28(%esp)
    12e8:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    12ef:	00 
    12f0:	8d 93 a0 fd ff ff    	lea    -0x260(%ebx),%edx
    12f6:	8d 4c 24 20          	lea    0x20(%esp),%ecx
    12fa:	e8 31 fe ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    12ff:	90                   	nop

00001300 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>:
    1300:	53                   	push   %ebx
    1301:	57                   	push   %edi
    1302:	56                   	push   %esi
    1303:	83 ec 40             	sub    $0x40,%esp
    1306:	89 d0                	mov    %edx,%eax
    1308:	e8 00 00 00 00       	call   130d <_ZN4core6result13unwrap_failed17he01453759a0dabd3E+0xd>
    130d:	5b                   	pop    %ebx
    130e:	81 c3 e7 8c 00 00    	add    $0x8ce7,%ebx
    1314:	8b 54 24 58          	mov    0x58(%esp),%edx
    1318:	8b 74 24 54          	mov    0x54(%esp),%esi
    131c:	8b 7c 24 50          	mov    0x50(%esp),%edi
    1320:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1324:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1328:	89 7c 24 10          	mov    %edi,0x10(%esp)
    132c:	89 74 24 14          	mov    %esi,0x14(%esp)
    1330:	8d 44 24 08          	lea    0x8(%esp),%eax
    1334:	89 44 24 18          	mov    %eax,0x18(%esp)
    1338:	8d 83 1c 97 ff ff    	lea    -0x68e4(%ebx),%eax
    133e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1342:	8d 44 24 10          	lea    0x10(%esp),%eax
    1346:	89 44 24 20          	mov    %eax,0x20(%esp)
    134a:	8d 83 4c 97 ff ff    	lea    -0x68b4(%ebx),%eax
    1350:	89 44 24 24          	mov    %eax,0x24(%esp)
    1354:	8d 83 78 fd ff ff    	lea    -0x288(%ebx),%eax
    135a:	89 44 24 28          	mov    %eax,0x28(%esp)
    135e:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    1365:	00 
    1366:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
    136d:	00 
    136e:	8d 44 24 18          	lea    0x18(%esp),%eax
    1372:	89 44 24 30          	mov    %eax,0x30(%esp)
    1376:	c7 44 24 34 02 00 00 	movl   $0x2,0x34(%esp)
    137d:	00 
    137e:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    1382:	e8 a9 fd ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    1387:	66 90                	xchg   %ax,%ax
    1389:	66 90                	xchg   %ax,%ax
    138b:	66 90                	xchg   %ax,%ax
    138d:	66 90                	xchg   %ax,%ax
    138f:	90                   	nop

00001390 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E>:
    1390:	53                   	push   %ebx
    1391:	83 ec 28             	sub    $0x28,%esp
    1394:	e8 00 00 00 00       	call   1399 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E+0x9>
    1399:	5b                   	pop    %ebx
    139a:	81 c3 5b 8c 00 00    	add    $0x8c5b,%ebx
    13a0:	8b 41 14             	mov    0x14(%ecx),%eax
    13a3:	89 44 24 24          	mov    %eax,0x24(%esp)
    13a7:	8b 41 10             	mov    0x10(%ecx),%eax
    13aa:	89 44 24 20          	mov    %eax,0x20(%esp)
    13ae:	8b 41 0c             	mov    0xc(%ecx),%eax
    13b1:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    13b5:	8b 41 08             	mov    0x8(%ecx),%eax
    13b8:	89 44 24 18          	mov    %eax,0x18(%esp)
    13bc:	8b 01                	mov    (%ecx),%eax
    13be:	8b 49 04             	mov    0x4(%ecx),%ecx
    13c1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    13c5:	89 44 24 10          	mov    %eax,0x10(%esp)
    13c9:	8d 44 24 10          	lea    0x10(%esp),%eax
    13cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    13d1:	8d 83 40 fd ff ff    	lea    -0x2c0(%ebx),%eax
    13d7:	89 44 24 08          	mov    %eax,0x8(%esp)
    13db:	66 c7 44 24 0c 00 00 	movw   $0x0,0xc(%esp)
    13e2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    13e6:	e8 d5 3c 00 00       	call   50c0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>
    13eb:	66 90                	xchg   %ax,%ax
    13ed:	66 90                	xchg   %ax,%ax
    13ef:	90                   	nop

000013f0 <init>:
    13f0:	55                   	push   %ebp
    13f1:	53                   	push   %ebx
    13f2:	57                   	push   %edi
    13f3:	56                   	push   %esi
    13f4:	81 ec 3c 01 00 00    	sub    $0x13c,%esp
    13fa:	e8 00 00 00 00       	call   13ff <init+0xf>
    13ff:	5b                   	pop    %ebx
    1400:	81 c3 f5 8b 00 00    	add    $0x8bf5,%ebx
    1406:	b9 01 00 00 00       	mov    $0x1,%ecx
    140b:	31 c0                	xor    %eax,%eax
    140d:	f0 0f b1 8b 40 27 00 	lock cmpxchg %ecx,0x2740(%ebx)
    1414:	00 
    1415:	0f 85 80 00 00 00    	jne    149b <init+0xab>
    141b:	8d 83 6c e5 ff ff    	lea    -0x1a94(%ebx),%eax
    1421:	89 83 24 00 00 00    	mov    %eax,0x24(%ebx)
    1427:	8d 83 28 fe ff ff    	lea    -0x1d8(%ebx),%eax
    142d:	89 83 28 00 00 00    	mov    %eax,0x28(%ebx)
    1433:	c7 83 40 27 00 00 02 	movl   $0x2,0x2740(%ebx)
    143a:	00 00 00 
    143d:	c7 83 44 27 00 00 04 	movl   $0x4,0x2744(%ebx)
    1444:	00 00 00 
    1447:	c7 44 24 3c 06 00 00 	movl   $0x6,0x3c(%esp)
    144e:	00 
    144f:	c7 44 24 40 6b 65 79 	movl   $0x6279656b,0x40(%esp)
    1456:	62 
    1457:	66 c7 44 24 44 72 64 	movw   $0x6472,0x44(%esp)
    145e:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    1465:	00 
    1466:	8d 74 24 3c          	lea    0x3c(%esp),%esi
    146a:	b8 81 00 00 00       	mov    $0x81,%eax
    146f:	89 f2                	mov    %esi,%edx
    1471:	cd 80                	int    $0x80
    1473:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1476:	83 f9 0a             	cmp    $0xa,%ecx
    1479:	73 63                	jae    14de <init+0xee>
    147b:	89 c7                	mov    %eax,%edi
    147d:	bd 02 00 00 00       	mov    $0x2,%ebp
    1482:	83 fd 04             	cmp    $0x4,%ebp
    1485:	0f 85 9c 04 00 00    	jne    1927 <init+0x537>
    148b:	8d 93 6c a4 ff ff    	lea    -0x5b94(%ebx),%edx
    1491:	b9 02 00 00 00       	mov    $0x2,%ecx
    1496:	e8 55 3e 00 00       	call   52f0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>
    149b:	83 f8 01             	cmp    $0x1,%eax
    149e:	75 18                	jne    14b8 <init+0xc8>
    14a0:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    14a6:	83 f8 01             	cmp    $0x1,%eax
    14a9:	75 0d                	jne    14b8 <init+0xc8>
    14ab:	f3 90                	pause
    14ad:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    14b3:	83 f8 01             	cmp    $0x1,%eax
    14b6:	74 f3                	je     14ab <init+0xbb>
    14b8:	83 ec 04             	sub    $0x4,%esp
    14bb:	8d 83 10 fd ff ff    	lea    -0x2f0(%ebx),%eax
    14c1:	8d b3 50 fc ff ff    	lea    -0x3b0(%ebx),%esi
    14c7:	8d 7c 24 18          	lea    0x18(%esp),%edi
    14cb:	8d 8b 64 e4 ff ff    	lea    -0x1b9c(%ebx),%ecx
    14d1:	ba 2b 00 00 00       	mov    $0x2b,%edx
    14d6:	50                   	push   %eax
    14d7:	56                   	push   %esi
    14d8:	57                   	push   %edi
    14d9:	e8 22 fe ff ff       	call   1300 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    14de:	bf 42 00 00 00       	mov    $0x42,%edi
    14e3:	85 c0                	test   %eax,%eax
    14e5:	75 96                	jne    147d <init+0x8d>
    14e7:	c6 44 24 1c 01       	movb   $0x1,0x1c(%esp)
    14ec:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    14f3:	00 
    14f4:	c7 44 24 20 06 00 00 	movl   $0x6,0x20(%esp)
    14fb:	00 
    14fc:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1503:	00 
    1504:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    1508:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    150c:	b8 8b 00 00 00       	mov    $0x8b,%eax
    1511:	cd 80                	int    $0x80
    1513:	89 c7                	mov    %eax,%edi
    1515:	48                   	dec    %eax
    1516:	83 f8 0a             	cmp    $0xa,%eax
    1519:	73 07                	jae    1522 <init+0x132>
    151b:	31 ed                	xor    %ebp,%ebp
    151d:	e9 60 ff ff ff       	jmp    1482 <init+0x92>
    1522:	85 ff                	test   %edi,%edi
    1524:	bf 42 00 00 00       	mov    $0x42,%edi
    1529:	75 f0                	jne    151b <init+0x12b>
    152b:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1531:	83 f8 04             	cmp    $0x4,%eax
    1534:	0f 82 d2 00 00 00    	jb     160c <init+0x21c>
    153a:	8d 44 24 10          	lea    0x10(%esp),%eax
    153e:	89 44 24 14          	mov    %eax,0x14(%esp)
    1542:	8d 83 dc a4 ff ff    	lea    -0x5b24(%ebx),%eax
    1548:	89 44 24 18          	mov    %eax,0x18(%esp)
    154c:	c7 44 24 5c 04 00 00 	movl   $0x4,0x5c(%esp)
    1553:	00 
    1554:	8d 83 5e e5 ff ff    	lea    -0x1aa2(%ebx),%eax
    155a:	89 44 24 60          	mov    %eax,0x60(%esp)
    155e:	c7 44 24 64 0e 00 00 	movl   $0xe,0x64(%esp)
    1565:	00 
    1566:	8d 8b 20 fe ff ff    	lea    -0x1e0(%ebx),%ecx
    156c:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    1570:	c7 44 24 6c 01 00 00 	movl   $0x1,0x6c(%esp)
    1577:	00 
    1578:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    157c:	89 4c 24 70          	mov    %ecx,0x70(%esp)
    1580:	c7 44 24 74 01 00 00 	movl   $0x1,0x74(%esp)
    1587:	00 
    1588:	8d 8b 04 e5 ff ff    	lea    -0x1afc(%ebx),%ecx
    158e:	89 4c 24 78          	mov    %ecx,0x78(%esp)
    1592:	c7 44 24 7c 01 00 00 	movl   $0x1,0x7c(%esp)
    1599:	00 
    159a:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    15a1:	00 
    15a2:	89 44 24 48          	mov    %eax,0x48(%esp)
    15a6:	c7 44 24 4c 0e 00 00 	movl   $0xe,0x4c(%esp)
    15ad:	00 
    15ae:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    15b5:	00 
    15b6:	8d 83 1c e5 ff ff    	lea    -0x1ae4(%ebx),%eax
    15bc:	89 44 24 54          	mov    %eax,0x54(%esp)
    15c0:	c7 44 24 58 42 00 00 	movl   $0x42,0x58(%esp)
    15c7:	00 
    15c8:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    15cf:	00 
    15d0:	c7 44 24 40 1e 00 00 	movl   $0x1e,0x40(%esp)
    15d7:	00 
    15d8:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    15de:	83 f8 02             	cmp    $0x2,%eax
    15e1:	74 08                	je     15eb <init+0x1fb>
    15e3:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    15e9:	eb 06                	jmp    15f1 <init+0x201>
    15eb:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    15f1:	74 08                	je     15fb <init+0x20b>
    15f3:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    15f9:	eb 06                	jmp    1601 <init+0x211>
    15fb:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    1601:	83 ec 08             	sub    $0x8,%esp
    1604:	56                   	push   %esi
    1605:	51                   	push   %ecx
    1606:	ff 50 10             	call   *0x10(%eax)
    1609:	83 c4 10             	add    $0x10,%esp
    160c:	8b 44 24 10          	mov    0x10(%esp),%eax
    1610:	89 44 24 30          	mov    %eax,0x30(%esp)
    1614:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    161b:	00 
    161c:	8d 6c 24 14          	lea    0x14(%esp),%ebp
    1620:	b8 90 00 00 00       	mov    $0x90,%eax
    1625:	89 ea                	mov    %ebp,%edx
    1627:	cd 80                	int    $0x80
    1629:	89 c7                	mov    %eax,%edi
    162b:	48                   	dec    %eax
    162c:	83 f8 0a             	cmp    $0xa,%eax
    162f:	73 13                	jae    1644 <init+0x254>
    1631:	bd 02 00 00 00       	mov    $0x2,%ebp
    1636:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    163a:	e8 c1 54 00 00       	call   6b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    163f:	e9 3e fe ff ff       	jmp    1482 <init+0x92>
    1644:	85 ff                	test   %edi,%edi
    1646:	bf 42 00 00 00       	mov    $0x42,%edi
    164b:	75 e4                	jne    1631 <init+0x241>
    164d:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1653:	83 f8 04             	cmp    $0x4,%eax
    1656:	0f 82 ce 00 00 00    	jb     172a <init+0x33a>
    165c:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
    1660:	8d 83 dc a4 ff ff    	lea    -0x5b24(%ebx),%eax
    1666:	89 44 24 20          	mov    %eax,0x20(%esp)
    166a:	c7 44 24 5c 04 00 00 	movl   $0x4,0x5c(%esp)
    1671:	00 
    1672:	8d 83 be e6 ff ff    	lea    -0x1942(%ebx),%eax
    1678:	89 44 24 60          	mov    %eax,0x60(%esp)
    167c:	c7 44 24 64 19 00 00 	movl   $0x19,0x64(%esp)
    1683:	00 
    1684:	8d 8b 60 fe ff ff    	lea    -0x1a0(%ebx),%ecx
    168a:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    168e:	c7 44 24 6c 01 00 00 	movl   $0x1,0x6c(%esp)
    1695:	00 
    1696:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    169a:	89 4c 24 70          	mov    %ecx,0x70(%esp)
    169e:	c7 44 24 74 01 00 00 	movl   $0x1,0x74(%esp)
    16a5:	00 
    16a6:	8d 8b 04 e5 ff ff    	lea    -0x1afc(%ebx),%ecx
    16ac:	89 4c 24 78          	mov    %ecx,0x78(%esp)
    16b0:	c7 44 24 7c 01 00 00 	movl   $0x1,0x7c(%esp)
    16b7:	00 
    16b8:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    16bf:	00 
    16c0:	89 44 24 48          	mov    %eax,0x48(%esp)
    16c4:	c7 44 24 4c 19 00 00 	movl   $0x19,0x4c(%esp)
    16cb:	00 
    16cc:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    16d3:	00 
    16d4:	8d 83 76 e6 ff ff    	lea    -0x198a(%ebx),%eax
    16da:	89 44 24 54          	mov    %eax,0x54(%esp)
    16de:	c7 44 24 58 48 00 00 	movl   $0x48,0x58(%esp)
    16e5:	00 
    16e6:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    16ed:	00 
    16ee:	c7 44 24 40 11 00 00 	movl   $0x11,0x40(%esp)
    16f5:	00 
    16f6:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    16fc:	83 f8 02             	cmp    $0x2,%eax
    16ff:	74 08                	je     1709 <init+0x319>
    1701:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    1707:	eb 06                	jmp    170f <init+0x31f>
    1709:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    170f:	74 08                	je     1719 <init+0x329>
    1711:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    1717:	eb 06                	jmp    171f <init+0x32f>
    1719:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    171f:	83 ec 08             	sub    $0x8,%esp
    1722:	56                   	push   %esi
    1723:	51                   	push   %ecx
    1724:	ff 50 10             	call   *0x10(%eax)
    1727:	83 c4 10             	add    $0x10,%esp
    172a:	8b 7c 24 14          	mov    0x14(%esp),%edi
    172e:	0f b6 83 3c 27 00 00 	movzbl 0x273c(%ebx),%eax
    1735:	b1 01                	mov    $0x1,%cl
    1737:	90                   	nop
    1738:	90                   	nop
    1739:	90                   	nop
    173a:	90                   	nop
    173b:	90                   	nop
    173c:	90                   	nop
    173d:	90                   	nop
    173e:	90                   	nop
    173f:	90                   	nop
    1740:	31 c0                	xor    %eax,%eax
    1742:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    1749:	00 
    174a:	74 1e                	je     176a <init+0x37a>
    174c:	90                   	nop
    174d:	90                   	nop
    174e:	90                   	nop
    174f:	90                   	nop
    1750:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    1757:	84 c0                	test   %al,%al
    1759:	74 e5                	je     1740 <init+0x350>
    175b:	f3 90                	pause
    175d:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    1764:	84 c0                	test   %al,%al
    1766:	75 f3                	jne    175b <init+0x36b>
    1768:	eb d6                	jmp    1740 <init+0x350>
    176a:	b9 04 00 00 00       	mov    $0x4,%ecx
    176f:	ba 1c 01 00 00       	mov    $0x11c,%edx
    1774:	e8 37 31 00 00       	call   48b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>
    1779:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    1780:	85 c0                	test   %eax,%eax
    1782:	75 1a                	jne    179e <init+0x3ae>
    1784:	89 f9                	mov    %edi,%ecx
    1786:	e8 75 53 00 00       	call   6b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    178b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    178f:	e8 6c 53 00 00       	call   6b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    1794:	bd 03 00 00 00       	mov    $0x3,%ebp
    1799:	e9 e4 fc ff ff       	jmp    1482 <init+0x92>
    179e:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    17a4:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    17ab:	c6 40 08 00          	movb   $0x0,0x8(%eax)
    17af:	89 44 24 0c          	mov    %eax,0xc(%esp)
    17b3:	0f b7 44 24 1c       	movzwl 0x1c(%esp),%eax
    17b8:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    17bc:	66 89 41 09          	mov    %ax,0x9(%ecx)
    17c0:	0f b6 44 24 1e       	movzbl 0x1e(%esp),%eax
    17c5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    17c9:	88 41 0b             	mov    %al,0xb(%ecx)
    17cc:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17d0:	89 78 0c             	mov    %edi,0xc(%eax)
    17d3:	8b 44 24 30          	mov    0x30(%esp),%eax
    17d7:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    17db:	89 41 10             	mov    %eax,0x10(%ecx)
    17de:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17e2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
    17e9:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17ed:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
    17f4:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17f8:	83 c0 1c             	add    $0x1c,%eax
    17fb:	83 ec 04             	sub    $0x4,%esp
    17fe:	68 ff 00 00 00       	push   $0xff
    1803:	56                   	push   %esi
    1804:	50                   	push   %eax
    1805:	e8 46 56 00 00       	call   6e50 <memcpy>
    180a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    180e:	83 c4 10             	add    $0x10,%esp
    1811:	c6 80 1b 01 00 00 00 	movb   $0x0,0x11b(%eax)
    1818:	f0 ff 00             	lock incl (%eax)
    181b:	7f 02                	jg     181f <init+0x42f>
    181d:	0f 0b                	ud2
    181f:	83 c0 08             	add    $0x8,%eax
    1822:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    1826:	8d 83 1c 7a ff ff    	lea    -0x85e4(%ebx),%eax
    182c:	89 44 24 40          	mov    %eax,0x40(%esp)
    1830:	66 c7 44 24 44 03 00 	movw   $0x3,0x44(%esp)
    1837:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    183e:	00 
    183f:	8d 4c 24 3c          	lea    0x3c(%esp),%ecx
    1843:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    1847:	b8 8a 00 00 00       	mov    $0x8a,%eax
    184c:	cd 80                	int    $0x80
    184e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1851:	83 f9 0a             	cmp    $0xa,%ecx
    1854:	73 22                	jae    1878 <init+0x488>
    1856:	89 c7                	mov    %eax,%edi
    1858:	bd 02 00 00 00       	mov    $0x2,%ebp
    185d:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1861:	f0 ff 08             	lock decl (%eax)
    1864:	0f 85 18 fc ff ff    	jne    1482 <init+0x92>
    186a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    186e:	e8 bd 09 00 00       	call   2230 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E>
    1873:	e9 0a fc ff ff       	jmp    1482 <init+0x92>
    1878:	bf 42 00 00 00       	mov    $0x42,%edi
    187d:	85 c0                	test   %eax,%eax
    187f:	75 d7                	jne    1858 <init+0x468>
    1881:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1885:	89 44 24 10          	mov    %eax,0x10(%esp)
    1889:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    188f:	83 f8 02             	cmp    $0x2,%eax
    1892:	76 6d                	jbe    1901 <init+0x511>
    1894:	8d 44 24 10          	lea    0x10(%esp),%eax
    1898:	89 44 24 14          	mov    %eax,0x14(%esp)
    189c:	8d 83 8c 8d ff ff    	lea    -0x7274(%ebx),%eax
    18a2:	89 44 24 18          	mov    %eax,0x18(%esp)
    18a6:	8d 83 b0 fc ff ff    	lea    -0x350(%ebx),%eax
    18ac:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    18b0:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    18b7:	00 
    18b8:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    18bf:	00 
    18c0:	89 6c 24 44          	mov    %ebp,0x44(%esp)
    18c4:	c7 44 24 48 01 00 00 	movl   $0x1,0x48(%esp)
    18cb:	00 
    18cc:	8d 83 bb d7 ff ff    	lea    -0x2845(%ebx),%eax
    18d2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    18d6:	c7 44 24 20 08 00 00 	movl   $0x8,0x20(%esp)
    18dd:	00 
    18de:	89 44 24 24          	mov    %eax,0x24(%esp)
    18e2:	c7 44 24 28 08 00 00 	movl   $0x8,0x28(%esp)
    18e9:	00 
    18ea:	8d 83 b8 fc ff ff    	lea    -0x348(%ebx),%eax
    18f0:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    18f4:	8d 4c 24 3c          	lea    0x3c(%esp),%ecx
    18f8:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    18fc:	e8 9f 09 00 00       	call   22a0 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E>
    1901:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1905:	f0 ff 08             	lock decl (%eax)
    1908:	0f 85 7d fb ff ff    	jne    148b <init+0x9b>
    190e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    1912:	e8 19 09 00 00       	call   2230 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E>
    1917:	8d 93 6c a4 ff ff    	lea    -0x5b94(%ebx),%edx
    191d:	b9 02 00 00 00       	mov    $0x2,%ecx
    1922:	e8 c9 39 00 00       	call   52f0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>
    1927:	89 6c 24 34          	mov    %ebp,0x34(%esp)
    192b:	89 7c 24 38          	mov    %edi,0x38(%esp)
    192f:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1935:	85 c0                	test   %eax,%eax
    1937:	0f 84 c8 00 00 00    	je     1a05 <init+0x615>
    193d:	8d 44 24 34          	lea    0x34(%esp),%eax
    1941:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1945:	8d 83 6c c9 ff ff    	lea    -0x3694(%ebx),%eax
    194b:	89 44 24 20          	mov    %eax,0x20(%esp)
    194f:	c7 44 24 5c 01 00 00 	movl   $0x1,0x5c(%esp)
    1956:	00 
    1957:	8d 83 bb d7 ff ff    	lea    -0x2845(%ebx),%eax
    195d:	89 44 24 60          	mov    %eax,0x60(%esp)
    1961:	c7 44 24 64 08 00 00 	movl   $0x8,0x64(%esp)
    1968:	00 
    1969:	8d 8b 20 fd ff ff    	lea    -0x2e0(%ebx),%ecx
    196f:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    1973:	c7 44 24 6c 01 00 00 	movl   $0x1,0x6c(%esp)
    197a:	00 
    197b:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    197f:	89 4c 24 70          	mov    %ecx,0x70(%esp)
    1983:	c7 44 24 74 01 00 00 	movl   $0x1,0x74(%esp)
    198a:	00 
    198b:	c7 44 24 78 00 00 00 	movl   $0x0,0x78(%esp)
    1992:	00 
    1993:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    199a:	00 
    199b:	89 44 24 48          	mov    %eax,0x48(%esp)
    199f:	c7 44 24 4c 08 00 00 	movl   $0x8,0x4c(%esp)
    19a6:	00 
    19a7:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    19ae:	00 
    19af:	8d 83 67 d7 ff ff    	lea    -0x2899(%ebx),%eax
    19b5:	89 44 24 54          	mov    %eax,0x54(%esp)
    19b9:	c7 44 24 58 14 00 00 	movl   $0x14,0x58(%esp)
    19c0:	00 
    19c1:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    19c8:	00 
    19c9:	c7 44 24 40 18 00 00 	movl   $0x18,0x40(%esp)
    19d0:	00 
    19d1:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    19d7:	83 f8 02             	cmp    $0x2,%eax
    19da:	74 08                	je     19e4 <init+0x5f4>
    19dc:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    19e2:	eb 06                	jmp    19ea <init+0x5fa>
    19e4:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    19ea:	74 08                	je     19f4 <init+0x604>
    19ec:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    19f2:	eb 06                	jmp    19fa <init+0x60a>
    19f4:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    19fa:	83 ec 08             	sub    $0x8,%esp
    19fd:	56                   	push   %esi
    19fe:	51                   	push   %ecx
    19ff:	ff 50 10             	call   *0x10(%eax)
    1a02:	83 c4 10             	add    $0x10,%esp
    1a05:	b8 01 00 00 00       	mov    $0x1,%eax
    1a0a:	89 c0                	mov    %eax,%eax
    1a0c:	cd 81                	int    $0x81
    1a0e:	0f 0b                	ud2

00001a10 <_ZN8keyboard10handle_irq17hf44868b823578babE>:
    1a10:	55                   	push   %ebp
    1a11:	53                   	push   %ebx
    1a12:	57                   	push   %edi
    1a13:	56                   	push   %esi
    1a14:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
    1a1a:	e8 00 00 00 00       	call   1a1f <_ZN8keyboard10handle_irq17hf44868b823578babE+0xf>
    1a1f:	5b                   	pop    %ebx
    1a20:	81 c3 d5 85 00 00    	add    $0x85d5,%ebx
    1a26:	8b b4 24 b0 00 00 00 	mov    0xb0(%esp),%esi
    1a2d:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1a33:	8d 8b bb d7 ff ff    	lea    -0x2845(%ebx),%ecx
    1a39:	89 4c 24 60          	mov    %ecx,0x60(%esp)
    1a3d:	83 f8 03             	cmp    $0x3,%eax
    1a40:	0f 86 b7 00 00 00    	jbe    1afd <_ZN8keyboard10handle_irq17hf44868b823578babE+0xed>
    1a46:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    1a4d:	00 
    1a4e:	8b 4c 24 60          	mov    0x60(%esp),%ecx
    1a52:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    1a56:	c7 44 24 38 08 00 00 	movl   $0x8,0x38(%esp)
    1a5d:	00 
    1a5e:	8d 83 c8 fc ff ff    	lea    -0x338(%ebx),%eax
    1a64:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    1a68:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    1a6f:	00 
    1a70:	c7 44 24 44 04 00 00 	movl   $0x4,0x44(%esp)
    1a77:	00 
    1a78:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    1a7f:	00 
    1a80:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    1a87:	00 
    1a88:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1a8f:	00 
    1a90:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    1a94:	c7 44 24 20 08 00 00 	movl   $0x8,0x20(%esp)
    1a9b:	00 
    1a9c:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    1aa3:	00 
    1aa4:	8d 83 67 d7 ff ff    	lea    -0x2899(%ebx),%eax
    1aaa:	89 44 24 28          	mov    %eax,0x28(%esp)
    1aae:	c7 44 24 2c 14 00 00 	movl   $0x14,0x2c(%esp)
    1ab5:	00 
    1ab6:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1abd:	00 
    1abe:	c7 44 24 14 48 00 00 	movl   $0x48,0x14(%esp)
    1ac5:	00 
    1ac6:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    1acc:	83 f8 02             	cmp    $0x2,%eax
    1acf:	74 10                	je     1ae1 <_ZN8keyboard10handle_irq17hf44868b823578babE+0xd1>
    1ad1:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    1ad7:	75 10                	jne    1ae9 <_ZN8keyboard10handle_irq17hf44868b823578babE+0xd9>
    1ad9:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    1adf:	eb 0e                	jmp    1aef <_ZN8keyboard10handle_irq17hf44868b823578babE+0xdf>
    1ae1:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    1ae7:	74 f0                	je     1ad9 <_ZN8keyboard10handle_irq17hf44868b823578babE+0xc9>
    1ae9:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    1aef:	8d 54 24 10          	lea    0x10(%esp),%edx
    1af3:	89 54 24 04          	mov    %edx,0x4(%esp)
    1af7:	89 0c 24             	mov    %ecx,(%esp)
    1afa:	ff 50 10             	call   *0x10(%eax)
    1afd:	b1 01                	mov    $0x1,%cl
    1aff:	31 c0                	xor    %eax,%eax
    1b01:	f0 0f b0 0e          	lock cmpxchg %cl,(%esi)
    1b05:	0f 85 57 06 00 00    	jne    2162 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x752>
    1b0b:	8b 56 08             	mov    0x8(%esi),%edx
    1b0e:	b8 83 00 00 00       	mov    $0x83,%eax
    1b13:	89 94 24 98 00 00 00 	mov    %edx,0x98(%esp)
    1b1a:	cd 80                	int    $0x80
    1b1c:	85 c0                	test   %eax,%eax
    1b1e:	0f 85 7b 06 00 00    	jne    219f <_ZN8keyboard10handle_irq17hf44868b823578babE+0x78f>
    1b24:	c6 06 00             	movb   $0x0,(%esi)
    1b27:	8d 6c 24 58          	lea    0x58(%esp),%ebp
    1b2b:	8d 83 ac c3 ff ff    	lea    -0x3c54(%ebx),%eax
    1b31:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
    1b38:	8d bb 47 e4 ff ff    	lea    -0x1bb9(%ebx),%edi
    1b3e:	8d 83 e0 fd ff ff    	lea    -0x220(%ebx),%eax
    1b44:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
    1b4b:	8d 83 e0 e3 ff ff    	lea    -0x1c20(%ebx),%eax
    1b51:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
    1b58:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    1b5e:	89 44 24 74          	mov    %eax,0x74(%esp)
    1b62:	8d 83 9b ea ff ff    	lea    -0x1565(%ebx),%eax
    1b68:	89 44 24 70          	mov    %eax,0x70(%esp)
    1b6c:	8d 74 24 10          	lea    0x10(%esp),%esi
    1b70:	8d 83 fc a0 ff ff    	lea    -0x5f04(%ebx),%eax
    1b76:	89 84 24 88 00 00 00 	mov    %eax,0x88(%esp)
    1b7d:	8d 83 58 d7 ff ff    	lea    -0x28a8(%ebx),%eax
    1b83:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    1b87:	8d 83 60 fc ff ff    	lea    -0x3a0(%ebx),%eax
    1b8d:	89 84 24 84 00 00 00 	mov    %eax,0x84(%esp)
    1b94:	8d 83 46 d7 ff ff    	lea    -0x28ba(%ebx),%eax
    1b9a:	89 44 24 68          	mov    %eax,0x68(%esp)
    1b9e:	89 bc 24 80 00 00 00 	mov    %edi,0x80(%esp)
    1ba5:	eb 19                	jmp    1bc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x1b0>
    1ba7:	90                   	nop
    1ba8:	90                   	nop
    1ba9:	90                   	nop
    1baa:	90                   	nop
    1bab:	90                   	nop
    1bac:	90                   	nop
    1bad:	90                   	nop
    1bae:	90                   	nop
    1baf:	90                   	nop
    1bb0:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    1bb6:	89 74 24 04          	mov    %esi,0x4(%esp)
    1bba:	89 0c 24             	mov    %ecx,(%esp)
    1bbd:	ff 50 10             	call   *0x10(%eax)
    1bc0:	b8 8e 00 00 00       	mov    $0x8e,%eax
    1bc5:	8b 8c 24 98 00 00 00 	mov    0x98(%esp),%ecx
    1bcc:	8d 54 24 67          	lea    0x67(%esp),%edx
    1bd0:	cd 80                	int    $0x80
    1bd2:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1bd5:	83 f9 0a             	cmp    $0xa,%ecx
    1bd8:	0f 83 44 02 00 00    	jae    1e22 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x412>
    1bde:	89 c1                	mov    %eax,%ecx
    1be0:	89 4c 24 78          	mov    %ecx,0x78(%esp)
    1be4:	8d 44 24 78          	lea    0x78(%esp),%eax
    1be8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1bec:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1bf2:	85 c0                	test   %eax,%eax
    1bf4:	0f 84 9d 04 00 00    	je     2097 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x687>
    1bfa:	8d 44 24 0c          	lea    0xc(%esp),%eax
    1bfe:	89 44 24 58          	mov    %eax,0x58(%esp)
    1c02:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
    1c09:	89 44 24 5c          	mov    %eax,0x5c(%esp)
    1c0d:	c7 44 24 30 01 00 00 	movl   $0x1,0x30(%esp)
    1c14:	00 
    1c15:	89 7c 24 34          	mov    %edi,0x34(%esp)
    1c19:	c7 44 24 38 1b 00 00 	movl   $0x1b,0x38(%esp)
    1c20:	00 
    1c21:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    1c28:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    1c2c:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    1c33:	00 
    1c34:	89 6c 24 44          	mov    %ebp,0x44(%esp)
    1c38:	c7 44 24 48 01 00 00 	movl   $0x1,0x48(%esp)
    1c3f:	00 
    1c40:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    1c47:	00 
    1c48:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1c4f:	00 
    1c50:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    1c54:	c7 44 24 20 1b 00 00 	movl   $0x1b,0x20(%esp)
    1c5b:	00 
    1c5c:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    1c63:	00 
    1c64:	8b 84 24 8c 00 00 00 	mov    0x8c(%esp),%eax
    1c6b:	89 44 24 28          	mov    %eax,0x28(%esp)
    1c6f:	c7 44 24 2c 4a 00 00 	movl   $0x4a,0x2c(%esp)
    1c76:	00 
    1c77:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1c7e:	00 
    1c7f:	c7 44 24 14 23 00 00 	movl   $0x23,0x14(%esp)
    1c86:	00 
    1c87:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    1c8d:	83 f8 02             	cmp    $0x2,%eax
    1c90:	74 0e                	je     1ca0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x290>
    1c92:	8b 44 24 74          	mov    0x74(%esp),%eax
    1c96:	75 10                	jne    1ca8 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x298>
    1c98:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    1c9e:	eb 0c                	jmp    1cac <_ZN8keyboard10handle_irq17hf44868b823578babE+0x29c>
    1ca0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    1ca6:	74 f0                	je     1c98 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x288>
    1ca8:	8b 4c 24 70          	mov    0x70(%esp),%ecx
    1cac:	89 74 24 04          	mov    %esi,0x4(%esp)
    1cb0:	89 0c 24             	mov    %ecx,(%esp)
    1cb3:	ff 50 10             	call   *0x10(%eax)
    1cb6:	83 7c 24 78 00       	cmpl   $0x0,0x78(%esp)
    1cbb:	0f 85 d6 03 00 00    	jne    2097 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x687>
    1cc1:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1cc8:	00 
    1cc9:	c6 44 24 58 00       	movb   $0x0,0x58(%esp)
    1cce:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    1cd2:	b8 02 00 60 00       	mov    $0x600002,%eax
    1cd7:	89 44 24 10          	mov    %eax,0x10(%esp)
    1cdb:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
    1ce2:	00 
    1ce3:	b8 84 00 00 00       	mov    $0x84,%eax
    1ce8:	b9 01 00 00 00       	mov    $0x1,%ecx
    1ced:	89 f2                	mov    %esi,%edx
    1cef:	cd 80                	int    $0x80
    1cf1:	85 c0                	test   %eax,%eax
    1cf3:	0f 85 74 04 00 00    	jne    216d <_ZN8keyboard10handle_irq17hf44868b823578babE+0x75d>
    1cf9:	0f b6 54 24 58       	movzbl 0x58(%esp),%edx
    1cfe:	88 54 24 0c          	mov    %dl,0xc(%esp)
    1d02:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1d08:	83 f8 03             	cmp    $0x3,%eax
    1d0b:	0f 86 d4 00 00 00    	jbe    1de5 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x3d5>
    1d11:	8d 44 24 0c          	lea    0xc(%esp),%eax
    1d15:	89 44 24 58          	mov    %eax,0x58(%esp)
    1d19:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
    1d20:	89 44 24 5c          	mov    %eax,0x5c(%esp)
    1d24:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    1d2b:	00 
    1d2c:	8b 44 24 6c          	mov    0x6c(%esp),%eax
    1d30:	89 44 24 34          	mov    %eax,0x34(%esp)
    1d34:	c7 44 24 38 0c 00 00 	movl   $0xc,0x38(%esp)
    1d3b:	00 
    1d3c:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    1d43:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
    1d47:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    1d4e:	00 
    1d4f:	89 6c 24 44          	mov    %ebp,0x44(%esp)
    1d53:	c7 44 24 48 01 00 00 	movl   $0x1,0x48(%esp)
    1d5a:	00 
    1d5b:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    1d62:	00 
    1d63:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1d6a:	00 
    1d6b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1d6f:	c7 44 24 20 0c 00 00 	movl   $0xc,0x20(%esp)
    1d76:	00 
    1d77:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    1d7e:	00 
    1d7f:	8b 44 24 68          	mov    0x68(%esp),%eax
    1d83:	89 44 24 28          	mov    %eax,0x28(%esp)
    1d87:	c7 44 24 2c 12 00 00 	movl   $0x12,0x2c(%esp)
    1d8e:	00 
    1d8f:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1d96:	00 
    1d97:	c7 44 24 14 11 00 00 	movl   $0x11,0x14(%esp)
    1d9e:	00 
    1d9f:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    1da5:	83 f8 02             	cmp    $0x2,%eax
    1da8:	74 16                	je     1dc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x3b0>
    1daa:	8b 44 24 74          	mov    0x74(%esp),%eax
    1dae:	89 ef                	mov    %ebp,%edi
    1db0:	89 d5                	mov    %edx,%ebp
    1db2:	75 18                	jne    1dcc <_ZN8keyboard10handle_irq17hf44868b823578babE+0x3bc>
    1db4:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    1dba:	eb 14                	jmp    1dd0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x3c0>
    1dbc:	90                   	nop
    1dbd:	90                   	nop
    1dbe:	90                   	nop
    1dbf:	90                   	nop
    1dc0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    1dc6:	89 ef                	mov    %ebp,%edi
    1dc8:	89 d5                	mov    %edx,%ebp
    1dca:	74 e8                	je     1db4 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x3a4>
    1dcc:	8b 4c 24 70          	mov    0x70(%esp),%ecx
    1dd0:	89 74 24 04          	mov    %esi,0x4(%esp)
    1dd4:	89 0c 24             	mov    %ecx,(%esp)
    1dd7:	ff 50 10             	call   *0x10(%eax)
    1dda:	89 ea                	mov    %ebp,%edx
    1ddc:	89 fd                	mov    %edi,%ebp
    1dde:	8b bc 24 80 00 00 00 	mov    0x80(%esp),%edi
    1de5:	8d 4a f2             	lea    -0xe(%edx),%ecx
    1de8:	83 f9 2b             	cmp    $0x2b,%ecx
    1deb:	77 23                	ja     1e10 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x400>
    1ded:	b8 0a 00 00 00       	mov    $0xa,%eax
    1df2:	8b 8c 8b f4 d2 ff ff 	mov    -0x2d0c(%ebx,%ecx,4),%ecx
    1df9:	01 d9                	add    %ebx,%ecx
    1dfb:	ff e1                	jmp    *%ecx
    1dfd:	b8 0d 00 00 00       	mov    $0xd,%eax
    1e02:	e9 b9 01 00 00       	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1e07:	90                   	nop
    1e08:	90                   	nop
    1e09:	90                   	nop
    1e0a:	90                   	nop
    1e0b:	90                   	nop
    1e0c:	90                   	nop
    1e0d:	90                   	nop
    1e0e:	90                   	nop
    1e0f:	90                   	nop
    1e10:	81 fa b5 00 00 00    	cmp    $0xb5,%edx
    1e16:	75 1c                	jne    1e34 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x424>
    1e18:	b8 2f 00 00 00       	mov    $0x2f,%eax
    1e1d:	e9 9e 01 00 00       	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1e22:	b9 42 00 00 00       	mov    $0x42,%ecx
    1e27:	85 c0                	test   %eax,%eax
    1e29:	0f 84 92 fe ff ff    	je     1cc1 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x2b1>
    1e2f:	e9 ac fd ff ff       	jmp    1be0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x1d0>
    1e34:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
    1e39:	89 c8                	mov    %ecx,%eax
    1e3b:	04 fe                	add    $0xfe,%al
    1e3d:	3c 09                	cmp    $0x9,%al
    1e3f:	73 3a                	jae    1e7b <_ZN8keyboard10handle_irq17hf44868b823578babE+0x46b>
    1e41:	80 c2 fe             	add    $0xfe,%dl
    1e44:	0f b6 ca             	movzbl %dl,%ecx
    1e47:	80 fa 09             	cmp    $0x9,%dl
    1e4a:	0f 83 86 03 00 00    	jae    21d6 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x7c6>
    1e50:	0f b6 84 0b dd d6 ff 	movzbl -0x2923(%ebx,%ecx,1),%eax
    1e57:	ff 
    1e58:	e9 63 01 00 00       	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1e5d:	b8 20 00 00 00       	mov    $0x20,%eax
    1e62:	e9 59 01 00 00       	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1e67:	b8 30 00 00 00       	mov    $0x30,%eax
    1e6c:	e9 4f 01 00 00       	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1e71:	b8 2e 00 00 00       	mov    $0x2e,%eax
    1e76:	e9 45 01 00 00       	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1e7b:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1e81:	83 f8 03             	cmp    $0x3,%eax
    1e84:	0f 86 c2 00 00 00    	jbe    1f4c <_ZN8keyboard10handle_irq17hf44868b823578babE+0x53c>
    1e8a:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    1e91:	00 
    1e92:	8b 4c 24 6c          	mov    0x6c(%esp),%ecx
    1e96:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    1e9a:	c7 44 24 38 0c 00 00 	movl   $0xc,0x38(%esp)
    1ea1:	00 
    1ea2:	8d 83 68 fc ff ff    	lea    -0x398(%ebx),%eax
    1ea8:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    1eac:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    1eb3:	00 
    1eb4:	c7 44 24 44 04 00 00 	movl   $0x4,0x44(%esp)
    1ebb:	00 
    1ebc:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    1ec3:	00 
    1ec4:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    1ecb:	00 
    1ecc:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1ed3:	00 
    1ed4:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    1ed8:	c7 44 24 20 0c 00 00 	movl   $0xc,0x20(%esp)
    1edf:	00 
    1ee0:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    1ee7:	00 
    1ee8:	8b 44 24 68          	mov    0x68(%esp),%eax
    1eec:	89 44 24 28          	mov    %eax,0x28(%esp)
    1ef0:	c7 44 24 2c 12 00 00 	movl   $0x12,0x2c(%esp)
    1ef7:	00 
    1ef8:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1eff:	00 
    1f00:	c7 44 24 14 2e 00 00 	movl   $0x2e,0x14(%esp)
    1f07:	00 
    1f08:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    1f0e:	83 f8 02             	cmp    $0x2,%eax
    1f11:	74 14                	je     1f27 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x517>
    1f13:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    1f19:	89 54 24 7c          	mov    %edx,0x7c(%esp)
    1f1d:	75 14                	jne    1f33 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x523>
    1f1f:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    1f25:	eb 12                	jmp    1f39 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x529>
    1f27:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    1f2d:	89 54 24 7c          	mov    %edx,0x7c(%esp)
    1f31:	74 ec                	je     1f1f <_ZN8keyboard10handle_irq17hf44868b823578babE+0x50f>
    1f33:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    1f39:	89 74 24 04          	mov    %esi,0x4(%esp)
    1f3d:	89 0c 24             	mov    %ecx,(%esp)
    1f40:	ff 50 10             	call   *0x10(%eax)
    1f43:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
    1f48:	8b 54 24 7c          	mov    0x7c(%esp),%edx
    1f4c:	89 c8                	mov    %ecx,%eax
    1f4e:	04 f0                	add    $0xf0,%al
    1f50:	3c 0d                	cmp    $0xd,%al
    1f52:	73 19                	jae    1f6d <_ZN8keyboard10handle_irq17hf44868b823578babE+0x55d>
    1f54:	80 c2 f0             	add    $0xf0,%dl
    1f57:	0f b6 ca             	movzbl %dl,%ecx
    1f5a:	80 fa 0a             	cmp    $0xa,%dl
    1f5d:	0f 83 8d 02 00 00    	jae    21f0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x7e0>
    1f63:	0f b6 84 0b c3 d6 ff 	movzbl -0x293d(%ebx,%ecx,1),%eax
    1f6a:	ff 
    1f6b:	eb 53                	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1f6d:	89 c8                	mov    %ecx,%eax
    1f6f:	04 e2                	add    $0xe2,%al
    1f71:	3c 09                	cmp    $0x9,%al
    1f73:	73 19                	jae    1f8e <_ZN8keyboard10handle_irq17hf44868b823578babE+0x57e>
    1f75:	80 c2 e2             	add    $0xe2,%dl
    1f78:	0f b6 ca             	movzbl %dl,%ecx
    1f7b:	80 fa 09             	cmp    $0x9,%dl
    1f7e:	0f 83 7f 02 00 00    	jae    2203 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x7f3>
    1f84:	0f b6 84 0b d4 d6 ff 	movzbl -0x292c(%ebx,%ecx,1),%eax
    1f8b:	ff 
    1f8c:	eb 32                	jmp    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1f8e:	80 c1 d4             	add    $0xd4,%cl
    1f91:	b8 00 00 11 00       	mov    $0x110000,%eax
    1f96:	80 f9 07             	cmp    $0x7,%cl
    1f99:	73 25                	jae    1fc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x5b0>
    1f9b:	80 c2 d4             	add    $0xd4,%dl
    1f9e:	0f b6 ca             	movzbl %dl,%ecx
    1fa1:	80 fa 06             	cmp    $0x6,%dl
    1fa4:	0f 87 6c 02 00 00    	ja     2216 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x806>
    1faa:	0f b6 84 0b cd d6 ff 	movzbl -0x2933(%ebx,%ecx,1),%eax
    1fb1:	ff 
    1fb2:	90                   	nop
    1fb3:	90                   	nop
    1fb4:	90                   	nop
    1fb5:	90                   	nop
    1fb6:	90                   	nop
    1fb7:	90                   	nop
    1fb8:	90                   	nop
    1fb9:	90                   	nop
    1fba:	90                   	nop
    1fbb:	90                   	nop
    1fbc:	90                   	nop
    1fbd:	90                   	nop
    1fbe:	90                   	nop
    1fbf:	90                   	nop
    1fc0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1fc4:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1fca:	83 f8 03             	cmp    $0x3,%eax
    1fcd:	0f 86 ed fb ff ff    	jbe    1bc0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x1b0>
    1fd3:	8d 44 24 0c          	lea    0xc(%esp),%eax
    1fd7:	89 44 24 58          	mov    %eax,0x58(%esp)
    1fdb:	8d 83 3c 84 ff ff    	lea    -0x7bc4(%ebx),%eax
    1fe1:	89 44 24 5c          	mov    %eax,0x5c(%esp)
    1fe5:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    1fec:	00 
    1fed:	8b 4c 24 60          	mov    0x60(%esp),%ecx
    1ff1:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    1ff5:	c7 44 24 38 08 00 00 	movl   $0x8,0x38(%esp)
    1ffc:	00 
    1ffd:	8d 83 00 fd ff ff    	lea    -0x300(%ebx),%eax
    2003:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    2007:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    200e:	00 
    200f:	89 6c 24 44          	mov    %ebp,0x44(%esp)
    2013:	c7 44 24 48 01 00 00 	movl   $0x1,0x48(%esp)
    201a:	00 
    201b:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    2022:	00 
    2023:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    202a:	00 
    202b:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    202f:	c7 44 24 20 08 00 00 	movl   $0x8,0x20(%esp)
    2036:	00 
    2037:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    203e:	00 
    203f:	8d 83 67 d7 ff ff    	lea    -0x2899(%ebx),%eax
    2045:	89 44 24 28          	mov    %eax,0x28(%esp)
    2049:	c7 44 24 2c 14 00 00 	movl   $0x14,0x2c(%esp)
    2050:	00 
    2051:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    2058:	00 
    2059:	c7 44 24 14 53 00 00 	movl   $0x53,0x14(%esp)
    2060:	00 
    2061:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    2067:	83 f8 02             	cmp    $0x2,%eax
    206a:	74 14                	je     2080 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x670>
    206c:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    2072:	0f 85 38 fb ff ff    	jne    1bb0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x1a0>
    2078:	eb 12                	jmp    208c <_ZN8keyboard10handle_irq17hf44868b823578babE+0x67c>
    207a:	90                   	nop
    207b:	90                   	nop
    207c:	90                   	nop
    207d:	90                   	nop
    207e:	90                   	nop
    207f:	90                   	nop
    2080:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2086:	0f 85 24 fb ff ff    	jne    1bb0 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x1a0>
    208c:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2092:	e9 1f fb ff ff       	jmp    1bb6 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x1a6>
    2097:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    209d:	83 f8 04             	cmp    $0x4,%eax
    20a0:	0f 82 ba 00 00 00    	jb     2160 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x750>
    20a6:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    20ad:	00 
    20ae:	8b 4c 24 60          	mov    0x60(%esp),%ecx
    20b2:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    20b6:	c7 44 24 38 08 00 00 	movl   $0x8,0x38(%esp)
    20bd:	00 
    20be:	8d 83 08 fd ff ff    	lea    -0x2f8(%ebx),%eax
    20c4:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    20c8:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    20cf:	00 
    20d0:	c7 44 24 44 04 00 00 	movl   $0x4,0x44(%esp)
    20d7:	00 
    20d8:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    20df:	00 
    20e0:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    20e7:	00 
    20e8:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    20ef:	00 
    20f0:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    20f4:	c7 44 24 20 08 00 00 	movl   $0x8,0x20(%esp)
    20fb:	00 
    20fc:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    2103:	00 
    2104:	8d 83 67 d7 ff ff    	lea    -0x2899(%ebx),%eax
    210a:	89 44 24 28          	mov    %eax,0x28(%esp)
    210e:	c7 44 24 2c 14 00 00 	movl   $0x14,0x2c(%esp)
    2115:	00 
    2116:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    211d:	00 
    211e:	c7 44 24 14 56 00 00 	movl   $0x56,0x14(%esp)
    2125:	00 
    2126:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    212c:	83 f8 02             	cmp    $0x2,%eax
    212f:	74 10                	je     2141 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x731>
    2131:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    2137:	75 10                	jne    2149 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x739>
    2139:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    213f:	eb 0e                	jmp    214f <_ZN8keyboard10handle_irq17hf44868b823578babE+0x73f>
    2141:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2147:	74 f0                	je     2139 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x729>
    2149:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    214f:	89 74 24 04          	mov    %esi,0x4(%esp)
    2153:	89 0c 24             	mov    %ecx,(%esp)
    2156:	ff 50 10             	call   *0x10(%eax)
    2159:	90                   	nop
    215a:	90                   	nop
    215b:	90                   	nop
    215c:	90                   	nop
    215d:	90                   	nop
    215e:	90                   	nop
    215f:	90                   	nop
    2160:	eb fe                	jmp    2160 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x750>
    2162:	8d 8b d0 fc ff ff    	lea    -0x330(%ebx),%ecx
    2168:	e8 f3 f0 ff ff       	call   1260 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E>
    216d:	89 c1                	mov    %eax,%ecx
    216f:	e8 5c 4c 00 00       	call   6dd0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    2174:	89 44 24 10          	mov    %eax,0x10(%esp)
    2178:	8d 83 f0 fc ff ff    	lea    -0x310(%ebx),%eax
    217e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2182:	8d 83 30 fc ff ff    	lea    -0x3d0(%ebx),%eax
    2188:	89 44 24 04          	mov    %eax,0x4(%esp)
    218c:	89 34 24             	mov    %esi,(%esp)
    218f:	8d 8b e2 d7 ff ff    	lea    -0x281e(%ebx),%ecx
    2195:	ba 18 00 00 00       	mov    $0x18,%edx
    219a:	e8 61 f1 ff ff       	call   1300 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    219f:	8d 48 ff             	lea    -0x1(%eax),%ecx
    21a2:	83 f9 09             	cmp    $0x9,%ecx
    21a5:	77 42                	ja     21e9 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x7d9>
    21a7:	89 44 24 10          	mov    %eax,0x10(%esp)
    21ab:	8d 83 e0 fc ff ff    	lea    -0x320(%ebx),%eax
    21b1:	89 44 24 08          	mov    %eax,0x8(%esp)
    21b5:	8d 83 40 fc ff ff    	lea    -0x3c0(%ebx),%eax
    21bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    21bf:	8d 44 24 10          	lea    0x10(%esp),%eax
    21c3:	89 04 24             	mov    %eax,(%esp)
    21c6:	8d 8b 64 e4 ff ff    	lea    -0x1b9c(%ebx),%ecx
    21cc:	ba 2b 00 00 00       	mov    $0x2b,%edx
    21d1:	e8 2a f1 ff ff       	call   1300 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    21d6:	8d 83 a0 fc ff ff    	lea    -0x360(%ebx),%eax
    21dc:	89 04 24             	mov    %eax,(%esp)
    21df:	ba 09 00 00 00       	mov    $0x9,%edx
    21e4:	e8 f0 ee ff ff       	call   10d9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>
    21e9:	b8 42 00 00 00       	mov    $0x42,%eax
    21ee:	eb b7                	jmp    21a7 <_ZN8keyboard10handle_irq17hf44868b823578babE+0x797>
    21f0:	8d 83 90 fc ff ff    	lea    -0x370(%ebx),%eax
    21f6:	89 04 24             	mov    %eax,(%esp)
    21f9:	ba 0a 00 00 00       	mov    $0xa,%edx
    21fe:	e8 d6 ee ff ff       	call   10d9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>
    2203:	8d 83 80 fc ff ff    	lea    -0x380(%ebx),%eax
    2209:	89 04 24             	mov    %eax,(%esp)
    220c:	ba 09 00 00 00       	mov    $0x9,%edx
    2211:	e8 c3 ee ff ff       	call   10d9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>
    2216:	8d 83 70 fc ff ff    	lea    -0x390(%ebx),%eax
    221c:	89 04 24             	mov    %eax,(%esp)
    221f:	ba 07 00 00 00       	mov    $0x7,%edx
    2224:	e8 b0 ee ff ff       	call   10d9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>
    2229:	66 90                	xchg   %ax,%ax
    222b:	66 90                	xchg   %ax,%ax
    222d:	66 90                	xchg   %ax,%ax
    222f:	90                   	nop

00002230 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E>:
    2230:	53                   	push   %ebx
    2231:	56                   	push   %esi
    2232:	50                   	push   %eax
    2233:	89 ce                	mov    %ecx,%esi
    2235:	e8 00 00 00 00       	call   223a <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0xa>
    223a:	5b                   	pop    %ebx
    223b:	81 c3 ba 7d 00 00    	add    $0x7dba,%ebx
    2241:	8b 49 0c             	mov    0xc(%ecx),%ecx
    2244:	e8 b7 48 00 00       	call   6b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    2249:	8b 4e 10             	mov    0x10(%esi),%ecx
    224c:	e8 af 48 00 00       	call   6b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    2251:	83 fe ff             	cmp    $0xffffffff,%esi
    2254:	74 3c                	je     2292 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x62>
    2256:	f0 ff 4e 04          	lock decl 0x4(%esi)
    225a:	75 36                	jne    2292 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x62>
    225c:	b1 01                	mov    $0x1,%cl
    225e:	90                   	nop
    225f:	90                   	nop
    2260:	31 c0                	xor    %eax,%eax
    2262:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    2269:	00 
    226a:	75 06                	jne    2272 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x42>
    226c:	eb 11                	jmp    227f <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x4f>
    226e:	90                   	nop
    226f:	90                   	nop
    2270:	f3 90                	pause
    2272:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    2279:	84 c0                	test   %al,%al
    227b:	75 f3                	jne    2270 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x40>
    227d:	eb e1                	jmp    2260 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x30>
    227f:	89 f1                	mov    %esi,%ecx
    2281:	ba 1c 01 00 00       	mov    $0x11c,%edx
    2286:	e8 c5 1f 00 00       	call   4250 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE>
    228b:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    2292:	83 c4 04             	add    $0x4,%esp
    2295:	5e                   	pop    %esi
    2296:	5b                   	pop    %ebx
    2297:	c3                   	ret
    2298:	66 90                	xchg   %ax,%ax
    229a:	66 90                	xchg   %ax,%ax
    229c:	66 90                	xchg   %ax,%ax
    229e:	66 90                	xchg   %ax,%ax

000022a0 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E>:
    22a0:	53                   	push   %ebx
    22a1:	57                   	push   %edi
    22a2:	56                   	push   %esi
    22a3:	83 ec 50             	sub    $0x50,%esp
    22a6:	8b 1a                	mov    (%edx),%ebx
    22a8:	8b 42 10             	mov    0x10(%edx),%eax
    22ab:	8b 30                	mov    (%eax),%esi
    22ad:	8b 78 04             	mov    0x4(%eax),%edi
    22b0:	8b 40 08             	mov    0x8(%eax),%eax
    22b3:	c7 44 24 2c 03 00 00 	movl   $0x3,0x2c(%esp)
    22ba:	00 
    22bb:	89 5c 24 30          	mov    %ebx,0x30(%esp)
    22bf:	8b 5a 04             	mov    0x4(%edx),%ebx
    22c2:	89 5c 24 34          	mov    %ebx,0x34(%esp)
    22c6:	8b 19                	mov    (%ecx),%ebx
    22c8:	89 5c 24 38          	mov    %ebx,0x38(%esp)
    22cc:	8b 59 04             	mov    0x4(%ecx),%ebx
    22cf:	89 5c 24 3c          	mov    %ebx,0x3c(%esp)
    22d3:	8b 59 08             	mov    0x8(%ecx),%ebx
    22d6:	89 5c 24 40          	mov    %ebx,0x40(%esp)
    22da:	8b 59 0c             	mov    0xc(%ecx),%ebx
    22dd:	89 5c 24 44          	mov    %ebx,0x44(%esp)
    22e1:	8b 59 10             	mov    0x10(%ecx),%ebx
    22e4:	89 5c 24 48          	mov    %ebx,0x48(%esp)
    22e8:	8b 49 14             	mov    0x14(%ecx),%ecx
    22eb:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
    22ef:	8b 4a 08             	mov    0x8(%edx),%ecx
    22f2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    22f9:	00 
    22fa:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    22fe:	8b 4a 0c             	mov    0xc(%edx),%ecx
    2301:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2305:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    230c:	00 
    230d:	89 74 24 24          	mov    %esi,0x24(%esp)
    2311:	89 7c 24 28          	mov    %edi,0x28(%esp)
    2315:	e8 00 00 00 00       	call   231a <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0x7a>
    231a:	5b                   	pop    %ebx
    231b:	81 c3 da 7c 00 00    	add    $0x7cda,%ebx
    2321:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2328:	00 
    2329:	89 44 24 10          	mov    %eax,0x10(%esp)
    232d:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    2333:	83 f8 02             	cmp    $0x2,%eax
    2336:	74 10                	je     2348 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xa8>
    2338:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    233e:	75 10                	jne    2350 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xb0>
    2340:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2346:	eb 0e                	jmp    2356 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xb6>
    2348:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    234e:	74 f0                	je     2340 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xa0>
    2350:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    2356:	83 ec 08             	sub    $0x8,%esp
    2359:	8d 54 24 14          	lea    0x14(%esp),%edx
    235d:	52                   	push   %edx
    235e:	51                   	push   %ecx
    235f:	ff 50 10             	call   *0x10(%eax)
    2362:	83 c4 60             	add    $0x60,%esp
    2365:	5e                   	pop    %esi
    2366:	5f                   	pop    %edi
    2367:	5b                   	pop    %ebx
    2368:	c3                   	ret
    2369:	66 90                	xchg   %ax,%ax
    236b:	66 90                	xchg   %ax,%ax
    236d:	66 90                	xchg   %ax,%ax
    236f:	90                   	nop

00002370 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>:
    2370:	53                   	push   %ebx
    2371:	56                   	push   %esi
    2372:	50                   	push   %eax
    2373:	e8 00 00 00 00       	call   2378 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0x8>
    2378:	5b                   	pop    %ebx
    2379:	81 c3 7c 7c 00 00    	add    $0x7c7c,%ebx
    237f:	8b 44 24 10          	mov    0x10(%esp),%eax
    2383:	8b 10                	mov    (%eax),%edx
    2385:	8d 83 23 ea ff ff    	lea    -0x15dd(%ebx),%eax
    238b:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2390:	4a                   	dec    %edx
    2391:	8b 94 93 a4 d3 ff ff 	mov    -0x2c5c(%ebx,%edx,4),%edx
    2398:	01 da                	add    %ebx,%edx
    239a:	ff e2                	jmp    *%edx
    239c:	8d 83 2f ea ff ff    	lea    -0x15d1(%ebx),%eax
    23a2:	b9 0b 00 00 00       	mov    $0xb,%ecx
    23a7:	eb 69                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23a9:	8d 83 cb d7 ff ff    	lea    -0x2835(%ebx),%eax
    23af:	b9 08 00 00 00       	mov    $0x8,%ecx
    23b4:	eb 5c                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23b6:	8d 83 74 ea ff ff    	lea    -0x158c(%ebx),%eax
    23bc:	b9 0f 00 00 00       	mov    $0xf,%ecx
    23c1:	eb 4f                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23c3:	8d 83 3a ea ff ff    	lea    -0x15c6(%ebx),%eax
    23c9:	b9 0f 00 00 00       	mov    $0xf,%ecx
    23ce:	eb 42                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23d0:	8d 83 49 ea ff ff    	lea    -0x15b7(%ebx),%eax
    23d6:	eb 3a                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23d8:	8d 83 36 d7 ff ff    	lea    -0x28ca(%ebx),%eax
    23de:	b9 10 00 00 00       	mov    $0x10,%ecx
    23e3:	eb 2d                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23e5:	8d 83 83 ea ff ff    	lea    -0x157d(%ebx),%eax
    23eb:	b9 06 00 00 00       	mov    $0x6,%ecx
    23f0:	eb 20                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23f2:	8d 83 26 d7 ff ff    	lea    -0x28da(%ebx),%eax
    23f8:	b9 10 00 00 00       	mov    $0x10,%ecx
    23fd:	eb 13                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23ff:	8d 83 55 ea ff ff    	lea    -0x15ab(%ebx),%eax
    2405:	eb 0b                	jmp    2412 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2407:	8d 83 61 ea ff ff    	lea    -0x159f(%ebx),%eax
    240d:	b9 13 00 00 00       	mov    $0x13,%ecx
    2412:	8b 54 24 14          	mov    0x14(%esp),%edx
    2416:	8b 72 04             	mov    0x4(%edx),%esi
    2419:	83 ec 04             	sub    $0x4,%esp
    241c:	51                   	push   %ecx
    241d:	50                   	push   %eax
    241e:	ff 32                	push   (%edx)
    2420:	ff 56 0c             	call   *0xc(%esi)
    2423:	83 c4 14             	add    $0x14,%esp
    2426:	5e                   	pop    %esi
    2427:	5b                   	pop    %ebx
    2428:	c3                   	ret
    2429:	0f 0b                	ud2
    242b:	66 90                	xchg   %ax,%ax
    242d:	66 90                	xchg   %ax,%ax
    242f:	90                   	nop

00002430 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E>:
    2430:	55                   	push   %ebp
    2431:	53                   	push   %ebx
    2432:	57                   	push   %edi
    2433:	56                   	push   %esi
    2434:	83 ec 1c             	sub    $0x1c,%esp
    2437:	e8 00 00 00 00       	call   243c <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xc>
    243c:	5b                   	pop    %ebx
    243d:	81 c3 b8 7b 00 00    	add    $0x7bb8,%ebx
    2443:	8b 74 24 34          	mov    0x34(%esp),%esi
    2447:	8b 44 24 30          	mov    0x30(%esp),%eax
    244b:	81 38 00 00 11 00    	cmpl   $0x110000,(%eax)
    2451:	75 1c                	jne    246f <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x3f>
    2453:	8b 46 04             	mov    0x4(%esi),%eax
    2456:	83 ec 04             	sub    $0x4,%esp
    2459:	8d 8b a2 d6 ff ff    	lea    -0x295e(%ebx),%ecx
    245f:	6a 04                	push   $0x4
    2461:	51                   	push   %ecx
    2462:	ff 36                	push   (%esi)
    2464:	ff 50 0c             	call   *0xc(%eax)
    2467:	83 c4 2c             	add    $0x2c,%esp
    246a:	e9 f8 00 00 00       	jmp    2567 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x137>
    246f:	8b 0e                	mov    (%esi),%ecx
    2471:	8b 46 04             	mov    0x4(%esi),%eax
    2474:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2478:	8b 50 0c             	mov    0xc(%eax),%edx
    247b:	83 ec 04             	sub    $0x4,%esp
    247e:	8d 83 a6 d6 ff ff    	lea    -0x295a(%ebx),%eax
    2484:	6a 04                	push   $0x4
    2486:	50                   	push   %eax
    2487:	89 cf                	mov    %ecx,%edi
    2489:	51                   	push   %ecx
    248a:	89 d5                	mov    %edx,%ebp
    248c:	ff d2                	call   *%edx
    248e:	83 c4 10             	add    $0x10,%esp
    2491:	b1 01                	mov    $0x1,%cl
    2493:	84 c0                	test   %al,%al
    2495:	0f 85 c7 00 00 00    	jne    2562 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    249b:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    249f:	75 3b                	jne    24dc <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xac>
    24a1:	83 ec 04             	sub    $0x4,%esp
    24a4:	8d 83 0d dc ff ff    	lea    -0x23f3(%ebx),%eax
    24aa:	6a 01                	push   $0x1
    24ac:	50                   	push   %eax
    24ad:	89 fe                	mov    %edi,%esi
    24af:	57                   	push   %edi
    24b0:	89 ef                	mov    %ebp,%edi
    24b2:	ff d5                	call   *%ebp
    24b4:	83 c4 10             	add    $0x10,%esp
    24b7:	84 c0                	test   %al,%al
    24b9:	75 74                	jne    252f <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xff>
    24bb:	83 ec 0c             	sub    $0xc,%esp
    24be:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    24c2:	89 f2                	mov    %esi,%edx
    24c4:	ff 74 24 18          	push   0x18(%esp)
    24c8:	e8 a3 00 00 00       	call   2570 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E>
    24cd:	83 c4 10             	add    $0x10,%esp
    24d0:	84 c0                	test   %al,%al
    24d2:	b1 01                	mov    $0x1,%cl
    24d4:	0f 85 88 00 00 00    	jne    2562 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    24da:	eb 72                	jmp    254e <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x11e>
    24dc:	83 ec 04             	sub    $0x4,%esp
    24df:	8d 83 0e dc ff ff    	lea    -0x23f2(%ebx),%eax
    24e5:	6a 02                	push   $0x2
    24e7:	50                   	push   %eax
    24e8:	89 fe                	mov    %edi,%esi
    24ea:	57                   	push   %edi
    24eb:	89 ef                	mov    %ebp,%edi
    24ed:	ff d5                	call   *%ebp
    24ef:	83 c4 10             	add    $0x10,%esp
    24f2:	84 c0                	test   %al,%al
    24f4:	75 39                	jne    252f <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xff>
    24f6:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    24fb:	89 74 24 10          	mov    %esi,0x10(%esp)
    24ff:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2503:	89 44 24 14          	mov    %eax,0x14(%esp)
    2507:	8d 44 24 0b          	lea    0xb(%esp),%eax
    250b:	89 44 24 18          	mov    %eax,0x18(%esp)
    250f:	83 ec 0c             	sub    $0xc,%esp
    2512:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    2518:	8d 6c 24 1c          	lea    0x1c(%esp),%ebp
    251c:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    2520:	89 ea                	mov    %ebp,%edx
    2522:	50                   	push   %eax
    2523:	e8 48 00 00 00       	call   2570 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E>
    2528:	83 c4 10             	add    $0x10,%esp
    252b:	84 c0                	test   %al,%al
    252d:	74 04                	je     2533 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x103>
    252f:	b1 01                	mov    $0x1,%cl
    2531:	eb 2f                	jmp    2562 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    2533:	83 ec 04             	sub    $0x4,%esp
    2536:	8d 83 08 dc ff ff    	lea    -0x23f8(%ebx),%eax
    253c:	6a 02                	push   $0x2
    253e:	50                   	push   %eax
    253f:	55                   	push   %ebp
    2540:	e8 9b 18 00 00       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    2545:	83 c4 10             	add    $0x10,%esp
    2548:	84 c0                	test   %al,%al
    254a:	b1 01                	mov    $0x1,%cl
    254c:	75 14                	jne    2562 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    254e:	83 ec 04             	sub    $0x4,%esp
    2551:	8d 83 b1 db ff ff    	lea    -0x244f(%ebx),%eax
    2557:	6a 01                	push   $0x1
    2559:	50                   	push   %eax
    255a:	56                   	push   %esi
    255b:	ff d7                	call   *%edi
    255d:	83 c4 10             	add    $0x10,%esp
    2560:	89 c1                	mov    %eax,%ecx
    2562:	89 c8                	mov    %ecx,%eax
    2564:	83 c4 1c             	add    $0x1c,%esp
    2567:	5e                   	pop    %esi
    2568:	5f                   	pop    %edi
    2569:	5b                   	pop    %ebx
    256a:	5d                   	pop    %ebp
    256b:	c3                   	ret
    256c:	66 90                	xchg   %ax,%ax
    256e:	66 90                	xchg   %ax,%ax

00002570 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E>:
    2570:	55                   	push   %ebp
    2571:	53                   	push   %ebx
    2572:	57                   	push   %edi
    2573:	56                   	push   %esi
    2574:	83 ec 3c             	sub    $0x3c,%esp
    2577:	89 d6                	mov    %edx,%esi
    2579:	e8 00 00 00 00       	call   257e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0xe>
    257e:	5b                   	pop    %ebx
    257f:	81 c3 76 7a 00 00    	add    $0x7a76,%ebx
    2585:	8b 44 24 50          	mov    0x50(%esp),%eax
    2589:	8b 29                	mov    (%ecx),%ebp
    258b:	8b 78 10             	mov    0x10(%eax),%edi
    258e:	83 ec 08             	sub    $0x8,%esp
    2591:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    2595:	6a 27                	push   $0x27
    2597:	52                   	push   %edx
    2598:	ff d7                	call   *%edi
    259a:	83 c4 10             	add    $0x10,%esp
    259d:	89 c1                	mov    %eax,%ecx
    259f:	b0 01                	mov    $0x1,%al
    25a1:	84 c9                	test   %cl,%cl
    25a3:	0f 85 9c 03 00 00    	jne    2945 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3d5>
    25a9:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    25ad:	89 7c 24 38          	mov    %edi,0x38(%esp)
    25b1:	83 fd 27             	cmp    $0x27,%ebp
    25b4:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    25b8:	77 1b                	ja     25d5 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x65>
    25ba:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    25be:	8b 84 a9 ac d4 ff ff 	mov    -0x2b54(%ecx,%ebp,4),%eax
    25c5:	01 c8                	add    %ecx,%eax
    25c7:	ff e0                	jmp    *%eax
    25c9:	66 c7 44 24 10 5c 30 	movw   $0x305c,0x10(%esp)
    25d0:	e9 0e 01 00 00       	jmp    26e3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    25d5:	83 fd 5c             	cmp    $0x5c,%ebp
    25d8:	75 0c                	jne    25e6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x76>
    25da:	66 c7 44 24 10 5c 5c 	movw   $0x5c5c,0x10(%esp)
    25e1:	e9 fd 00 00 00       	jmp    26e3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    25e6:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    25ea:	81 f9 ff 02 00 00    	cmp    $0x2ff,%ecx
    25f0:	0f 86 50 01 00 00    	jbe    2746 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1d6>
    25f6:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    25fa:	89 cf                	mov    %ecx,%edi
    25fc:	e8 cf 14 00 00       	call   3ad0 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE>
    2601:	84 c0                	test   %al,%al
    2603:	0f 84 1d 02 00 00    	je     2826 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x2b6>
    2609:	89 f8                	mov    %edi,%eax
    260b:	83 c8 01             	or     $0x1,%eax
    260e:	0f bd c8             	bsr    %eax,%ecx
    2611:	83 f1 1c             	xor    $0x1c,%ecx
    2614:	c1 e9 02             	shr    $0x2,%ecx
    2617:	8d 71 fe             	lea    -0x2(%ecx),%esi
    261a:	c6 44 24 22 00       	movb   $0x0,0x22(%esp)
    261f:	66 c7 44 24 20 00 00 	movw   $0x0,0x20(%esp)
    2626:	89 f8                	mov    %edi,%eax
    2628:	c1 e8 14             	shr    $0x14,%eax
    262b:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    2632:	ff 
    2633:	88 44 24 23          	mov    %al,0x23(%esp)
    2637:	89 f8                	mov    %edi,%eax
    2639:	c1 e8 10             	shr    $0x10,%eax
    263c:	83 e0 0f             	and    $0xf,%eax
    263f:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    2646:	ff 
    2647:	88 44 24 24          	mov    %al,0x24(%esp)
    264b:	89 f8                	mov    %edi,%eax
    264d:	c1 e8 0c             	shr    $0xc,%eax
    2650:	83 e0 0f             	and    $0xf,%eax
    2653:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    265a:	ff 
    265b:	88 44 24 25          	mov    %al,0x25(%esp)
    265f:	89 f8                	mov    %edi,%eax
    2661:	c1 e8 08             	shr    $0x8,%eax
    2664:	83 e0 0f             	and    $0xf,%eax
    2667:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    266e:	ff 
    266f:	88 44 24 26          	mov    %al,0x26(%esp)
    2673:	89 f8                	mov    %edi,%eax
    2675:	c1 e8 04             	shr    $0x4,%eax
    2678:	83 e0 0f             	and    $0xf,%eax
    267b:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    2682:	ff 
    2683:	88 44 24 27          	mov    %al,0x27(%esp)
    2687:	83 e7 0f             	and    $0xf,%edi
    268a:	0f b6 84 3b f6 d6 ff 	movzbl -0x290a(%ebx,%edi,1),%eax
    2691:	ff 
    2692:	88 44 24 28          	mov    %al,0x28(%esp)
    2696:	c6 44 24 29 7d       	movb   $0x7d,0x29(%esp)
    269b:	66 c7 44 0c 1e 5c 75 	movw   $0x755c,0x1e(%esp,%ecx,1)
    26a2:	c6 44 0c 20 7b       	movb   $0x7b,0x20(%esp,%ecx,1)
    26a7:	8b 44 24 20          	mov    0x20(%esp),%eax
    26ab:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    26af:	89 44 24 10          	mov    %eax,0x10(%esp)
    26b3:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    26b7:	0f b7 44 24 28       	movzwl 0x28(%esp),%eax
    26bc:	e9 49 01 00 00       	jmp    280a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x29a>
    26c1:	66 c7 44 24 10 5c 74 	movw   $0x745c,0x10(%esp)
    26c8:	eb 19                	jmp    26e3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    26ca:	66 c7 44 24 10 5c 27 	movw   $0x275c,0x10(%esp)
    26d1:	eb 10                	jmp    26e3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    26d3:	66 c7 44 24 10 5c 6e 	movw   $0x6e5c,0x10(%esp)
    26da:	eb 07                	jmp    26e3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    26dc:	66 c7 44 24 10 5c 72 	movw   $0x725c,0x10(%esp)
    26e3:	c7 44 24 16 00 00 00 	movl   $0x0,0x16(%esp)
    26ea:	00 
    26eb:	c7 44 24 12 00 00 00 	movl   $0x0,0x12(%esp)
    26f2:	00 
    26f3:	31 d2                	xor    %edx,%edx
    26f5:	b9 02 00 00 00       	mov    $0x2,%ecx
    26fa:	c6 44 24 0c 02       	movb   $0x2,0xc(%esp)
    26ff:	31 c0                	xor    %eax,%eax
    2701:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    2705:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2709:	88 54 24 1a          	mov    %dl,0x1a(%esp)
    270d:	0f b6 54 24 0c       	movzbl 0xc(%esp),%edx
    2712:	88 54 24 1b          	mov    %dl,0x1b(%esp)
    2716:	80 7c 24 10 80       	cmpb   $0x80,0x10(%esp)
    271b:	8b 7c 24 38          	mov    0x38(%esp),%edi
    271f:	8b 54 24 50          	mov    0x50(%esp),%edx
    2723:	75 09                	jne    272e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1be>
    2725:	8b 44 24 14          	mov    0x14(%esp),%eax
    2729:	e9 fa 01 00 00       	jmp    2928 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3b8>
    272e:	0f b6 c0             	movzbl %al,%eax
    2731:	29 c1                	sub    %eax,%ecx
    2733:	01 e0                	add    %esp,%eax
    2735:	83 c0 10             	add    $0x10,%eax
    2738:	83 ec 04             	sub    $0x4,%esp
    273b:	51                   	push   %ecx
    273c:	50                   	push   %eax
    273d:	56                   	push   %esi
    273e:	ff 52 0c             	call   *0xc(%edx)
    2741:	e9 e9 01 00 00       	jmp    292f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3bf>
    2746:	83 f9 20             	cmp    $0x20,%ecx
    2749:	0f 83 b9 01 00 00    	jae    2908 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x398>
    274f:	8b 54 24 0c          	mov    0xc(%esp),%edx
    2753:	89 d0                	mov    %edx,%eax
    2755:	83 c8 01             	or     $0x1,%eax
    2758:	0f bd c8             	bsr    %eax,%ecx
    275b:	83 f1 1c             	xor    $0x1c,%ecx
    275e:	c1 e9 02             	shr    $0x2,%ecx
    2761:	8d 71 fe             	lea    -0x2(%ecx),%esi
    2764:	c6 44 24 2e 00       	movb   $0x0,0x2e(%esp)
    2769:	66 c7 44 24 2c 00 00 	movw   $0x0,0x2c(%esp)
    2770:	89 d0                	mov    %edx,%eax
    2772:	c1 e8 14             	shr    $0x14,%eax
    2775:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2779:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    2780:	ff 
    2781:	88 44 24 2f          	mov    %al,0x2f(%esp)
    2785:	89 d0                	mov    %edx,%eax
    2787:	c1 e8 10             	shr    $0x10,%eax
    278a:	83 e0 0f             	and    $0xf,%eax
    278d:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    2794:	ff 
    2795:	88 44 24 30          	mov    %al,0x30(%esp)
    2799:	89 d0                	mov    %edx,%eax
    279b:	c1 e8 0c             	shr    $0xc,%eax
    279e:	83 e0 0f             	and    $0xf,%eax
    27a1:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    27a8:	ff 
    27a9:	88 44 24 31          	mov    %al,0x31(%esp)
    27ad:	89 d0                	mov    %edx,%eax
    27af:	c1 e8 08             	shr    $0x8,%eax
    27b2:	83 e0 0f             	and    $0xf,%eax
    27b5:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    27bc:	ff 
    27bd:	88 44 24 32          	mov    %al,0x32(%esp)
    27c1:	89 d0                	mov    %edx,%eax
    27c3:	c1 e8 04             	shr    $0x4,%eax
    27c6:	83 e0 0f             	and    $0xf,%eax
    27c9:	0f b6 84 03 f6 d6 ff 	movzbl -0x290a(%ebx,%eax,1),%eax
    27d0:	ff 
    27d1:	88 44 24 33          	mov    %al,0x33(%esp)
    27d5:	83 e2 0f             	and    $0xf,%edx
    27d8:	0f b6 84 13 f6 d6 ff 	movzbl -0x290a(%ebx,%edx,1),%eax
    27df:	ff 
    27e0:	88 44 24 34          	mov    %al,0x34(%esp)
    27e4:	c6 44 24 35 7d       	movb   $0x7d,0x35(%esp)
    27e9:	66 c7 44 0c 2a 5c 75 	movw   $0x755c,0x2a(%esp,%ecx,1)
    27f0:	c6 44 0c 2c 7b       	movb   $0x7b,0x2c(%esp,%ecx,1)
    27f5:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    27f9:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    27fd:	89 44 24 10          	mov    %eax,0x10(%esp)
    2801:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2805:	0f b7 44 24 34       	movzwl 0x34(%esp),%eax
    280a:	66 89 44 24 18       	mov    %ax,0x18(%esp)
    280f:	b9 0a 00 00 00       	mov    $0xa,%ecx
    2814:	c6 44 24 0c 0a       	movb   $0xa,0xc(%esp)
    2819:	89 f2                	mov    %esi,%edx
    281b:	89 f0                	mov    %esi,%eax
    281d:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    2821:	e9 e3 fe ff ff       	jmp    2709 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x199>
    2826:	81 ff 00 00 01 00    	cmp    $0x10000,%edi
    282c:	0f 82 1b 01 00 00    	jb     294d <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3dd>
    2832:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    2836:	81 ff 00 00 02 00    	cmp    $0x20000,%edi
    283c:	0f 83 e0 01 00 00    	jae    2a22 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4b2>
    2842:	31 c9                	xor    %ecx,%ecx
    2844:	31 db                	xor    %ebx,%ebx
    2846:	89 de                	mov    %ebx,%esi
    2848:	8b 7c 24 08          	mov    0x8(%esp),%edi
    284c:	0f b6 ac 1f 53 dd ff 	movzbl -0x22ad(%edi,%ebx,1),%ebp
    2853:	ff 
    2854:	83 c3 02             	add    $0x2,%ebx
    2857:	8d 14 29             	lea    (%ecx,%ebp,1),%edx
    285a:	8b 44 24 0c          	mov    0xc(%esp),%eax
    285e:	38 a4 37 52 dd ff ff 	cmp    %ah,-0x22ae(%edi,%esi,1)
    2865:	75 3a                	jne    28a1 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x331>
    2867:	39 ca                	cmp    %ecx,%edx
    2869:	0f 82 56 02 00 00    	jb     2ac5 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x555>
    286f:	81 fa d0 00 00 00    	cmp    $0xd0,%edx
    2875:	0f 87 63 02 00 00    	ja     2ade <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x56e>
    287b:	8b 44 24 08          	mov    0x8(%esp),%eax
    287f:	8d 34 08             	lea    (%eax,%ecx,1),%esi
    2882:	81 c6 aa dd ff ff    	add    $0xffffddaa,%esi
    2888:	31 c0                	xor    %eax,%eax
    288a:	39 c5                	cmp    %eax,%ebp
    288c:	74 15                	je     28a3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x333>
    288e:	8d 78 01             	lea    0x1(%eax),%edi
    2891:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    2895:	38 0c 06             	cmp    %cl,(%esi,%eax,1)
    2898:	89 f8                	mov    %edi,%eax
    289a:	75 ee                	jne    288a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x31a>
    289c:	e9 ae fe ff ff       	jmp    274f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    28a1:	77 07                	ja     28aa <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x33a>
    28a3:	89 d1                	mov    %edx,%ecx
    28a5:	83 fb 58             	cmp    $0x58,%ebx
    28a8:	75 9c                	jne    2846 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x2d6>
    28aa:	0f b7 4c 24 0c       	movzwl 0xc(%esp),%ecx
    28af:	31 d2                	xor    %edx,%edx
    28b1:	b3 01                	mov    $0x1,%bl
    28b3:	8b 74 24 08          	mov    0x8(%esp),%esi
    28b7:	8d 42 01             	lea    0x1(%edx),%eax
    28ba:	0f be ac 16 7a de ff 	movsbl -0x2186(%esi,%edx,1),%ebp
    28c1:	ff 
    28c2:	85 ed                	test   %ebp,%ebp
    28c4:	78 04                	js     28ca <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x35a>
    28c6:	89 c2                	mov    %eax,%edx
    28c8:	eb 22                	jmp    28ec <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x37c>
    28ca:	3d e6 01 00 00       	cmp    $0x1e6,%eax
    28cf:	0f 84 19 02 00 00    	je     2aee <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x57e>
    28d5:	8b 44 24 08          	mov    0x8(%esp),%eax
    28d9:	0f b6 84 10 7b de ff 	movzbl -0x2185(%eax,%edx,1),%eax
    28e0:	ff 
    28e1:	83 c2 02             	add    $0x2,%edx
    28e4:	83 e5 7f             	and    $0x7f,%ebp
    28e7:	c1 e5 08             	shl    $0x8,%ebp
    28ea:	09 c5                	or     %eax,%ebp
    28ec:	29 e9                	sub    %ebp,%ecx
    28ee:	0f 88 20 01 00 00    	js     2a14 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4a4>
    28f4:	80 f3 01             	xor    $0x1,%bl
    28f7:	81 fa e6 01 00 00    	cmp    $0x1e6,%edx
    28fd:	8b 74 24 08          	mov    0x8(%esp),%esi
    2901:	75 b4                	jne    28b7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x347>
    2903:	e9 0c 01 00 00       	jmp    2a14 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4a4>
    2908:	83 7c 24 0c 7f       	cmpl   $0x7f,0xc(%esp)
    290d:	73 3e                	jae    294d <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3dd>
    290f:	c6 44 24 10 80       	movb   $0x80,0x10(%esp)
    2914:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2918:	89 44 24 14          	mov    %eax,0x14(%esp)
    291c:	8b 7c 24 38          	mov    0x38(%esp),%edi
    2920:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    2924:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2928:	83 ec 08             	sub    $0x8,%esp
    292b:	50                   	push   %eax
    292c:	56                   	push   %esi
    292d:	ff d7                	call   *%edi
    292f:	83 c4 10             	add    $0x10,%esp
    2932:	89 c1                	mov    %eax,%ecx
    2934:	b0 01                	mov    $0x1,%al
    2936:	84 c9                	test   %cl,%cl
    2938:	75 0b                	jne    2945 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3d5>
    293a:	83 ec 08             	sub    $0x8,%esp
    293d:	6a 27                	push   $0x27
    293f:	56                   	push   %esi
    2940:	ff d7                	call   *%edi
    2942:	83 c4 10             	add    $0x10,%esp
    2945:	83 c4 3c             	add    $0x3c,%esp
    2948:	5e                   	pop    %esi
    2949:	5f                   	pop    %edi
    294a:	5b                   	pop    %ebx
    294b:	5d                   	pop    %ebp
    294c:	c3                   	ret
    294d:	31 c9                	xor    %ecx,%ecx
    294f:	31 db                	xor    %ebx,%ebx
    2951:	89 de                	mov    %ebx,%esi
    2953:	8b 7c 24 08          	mov    0x8(%esp),%edi
    2957:	0f b6 ac 1f 61 e0 ff 	movzbl -0x1f9f(%edi,%ebx,1),%ebp
    295e:	ff 
    295f:	83 c3 02             	add    $0x2,%ebx
    2962:	8d 14 29             	lea    (%ecx,%ebp,1),%edx
    2965:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2969:	38 a4 37 60 e0 ff ff 	cmp    %ah,-0x1fa0(%edi,%esi,1)
    2970:	75 45                	jne    29b7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x447>
    2972:	39 ca                	cmp    %ecx,%edx
    2974:	0f 82 4b 01 00 00    	jb     2ac5 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x555>
    297a:	81 fa 22 01 00 00    	cmp    $0x122,%edx
    2980:	0f 87 48 01 00 00    	ja     2ace <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x55e>
    2986:	8b 44 24 08          	mov    0x8(%esp),%eax
    298a:	8d 34 08             	lea    (%eax,%ecx,1),%esi
    298d:	81 c6 b0 e0 ff ff    	add    $0xffffe0b0,%esi
    2993:	31 c0                	xor    %eax,%eax
    2995:	90                   	nop
    2996:	90                   	nop
    2997:	90                   	nop
    2998:	90                   	nop
    2999:	90                   	nop
    299a:	90                   	nop
    299b:	90                   	nop
    299c:	90                   	nop
    299d:	90                   	nop
    299e:	90                   	nop
    299f:	90                   	nop
    29a0:	39 c5                	cmp    %eax,%ebp
    29a2:	74 15                	je     29b9 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x449>
    29a4:	8d 78 01             	lea    0x1(%eax),%edi
    29a7:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    29ab:	38 0c 06             	cmp    %cl,(%esi,%eax,1)
    29ae:	89 f8                	mov    %edi,%eax
    29b0:	75 ee                	jne    29a0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x430>
    29b2:	e9 98 fd ff ff       	jmp    274f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    29b7:	77 07                	ja     29c0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x450>
    29b9:	89 d1                	mov    %edx,%ecx
    29bb:	83 fb 50             	cmp    $0x50,%ebx
    29be:	75 91                	jne    2951 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3e1>
    29c0:	31 c0                	xor    %eax,%eax
    29c2:	b3 01                	mov    $0x1,%bl
    29c4:	8b 54 24 0c          	mov    0xc(%esp),%edx
    29c8:	8b 74 24 08          	mov    0x8(%esp),%esi
    29cc:	8d 48 01             	lea    0x1(%eax),%ecx
    29cf:	0f be ac 06 d2 e1 ff 	movsbl -0x1e2e(%esi,%eax,1),%ebp
    29d6:	ff 
    29d7:	85 ed                	test   %ebp,%ebp
    29d9:	78 04                	js     29df <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x46f>
    29db:	89 c8                	mov    %ecx,%eax
    29dd:	eb 23                	jmp    2a02 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x492>
    29df:	81 f9 29 01 00 00    	cmp    $0x129,%ecx
    29e5:	0f 84 03 01 00 00    	je     2aee <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x57e>
    29eb:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    29ef:	0f b6 8c 01 d3 e1 ff 	movzbl -0x1e2d(%ecx,%eax,1),%ecx
    29f6:	ff 
    29f7:	83 c0 02             	add    $0x2,%eax
    29fa:	83 e5 7f             	and    $0x7f,%ebp
    29fd:	c1 e5 08             	shl    $0x8,%ebp
    2a00:	09 cd                	or     %ecx,%ebp
    2a02:	29 ea                	sub    %ebp,%edx
    2a04:	78 0e                	js     2a14 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4a4>
    2a06:	80 f3 01             	xor    $0x1,%bl
    2a09:	3d 29 01 00 00       	cmp    $0x129,%eax
    2a0e:	8b 74 24 08          	mov    0x8(%esp),%esi
    2a12:	75 b8                	jne    29cc <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x45c>
    2a14:	f6 c3 01             	test   $0x1,%bl
    2a17:	0f 84 32 fd ff ff    	je     274f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    2a1d:	e9 ed fe ff ff       	jmp    290f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x39f>
    2a22:	89 f8                	mov    %edi,%eax
    2a24:	25 e0 ff 1f 00       	and    $0x1fffe0,%eax
    2a29:	3d e0 a6 02 00       	cmp    $0x2a6e0,%eax
    2a2e:	0f 95 c0             	setne  %al
    2a31:	8d 8f c0 48 fd ff    	lea    -0x2b740(%edi),%ecx
    2a37:	83 f9 fa             	cmp    $0xfffffffa,%ecx
    2a3a:	0f 92 c1             	setb   %cl
    2a3d:	89 fa                	mov    %edi,%edx
    2a3f:	81 e2 fe ff 1f 00    	and    $0x1ffffe,%edx
    2a45:	81 fa 1e b8 02 00    	cmp    $0x2b81e,%edx
    2a4b:	0f 95 c2             	setne  %dl
    2a4e:	20 c2                	and    %al,%dl
    2a50:	8d 87 50 31 fd ff    	lea    -0x2ceb0(%edi),%eax
    2a56:	83 f8 f2             	cmp    $0xfffffff2,%eax
    2a59:	0f 92 c0             	setb   %al
    2a5c:	20 c8                	and    %cl,%al
    2a5e:	20 d0                	and    %dl,%al
    2a60:	8d 8f 10 14 fd ff    	lea    -0x2ebf0(%edi),%ecx
    2a66:	83 f9 f1             	cmp    $0xfffffff1,%ecx
    2a69:	0f 92 c1             	setb   %cl
    2a6c:	8d 97 00 08 fd ff    	lea    -0x2f800(%edi),%edx
    2a72:	81 fa 5e f6 ff ff    	cmp    $0xfffff65e,%edx
    2a78:	0f 92 c2             	setb   %dl
    2a7b:	20 ca                	and    %cl,%dl
    2a7d:	8d 8f 00 00 fd ff    	lea    -0x30000(%edi),%ecx
    2a83:	81 f9 1e fa ff ff    	cmp    $0xfffffa1e,%ecx
    2a89:	0f 92 c1             	setb   %cl
    2a8c:	20 d1                	and    %dl,%cl
    2a8e:	20 c1                	and    %al,%cl
    2a90:	8d 87 b0 ec fc ff    	lea    -0x31350(%edi),%eax
    2a96:	83 f8 fb             	cmp    $0xfffffffb,%eax
    2a99:	0f 92 c0             	setb   %al
    2a9c:	8d 97 00 ff f1 ff    	lea    -0xe0100(%edi),%edx
    2aa2:	81 fa b0 22 f5 ff    	cmp    $0xfff522b0,%edx
    2aa8:	0f 92 c2             	setb   %dl
    2aab:	20 c2                	and    %al,%dl
    2aad:	20 ca                	and    %cl,%dl
    2aaf:	81 ff f0 01 0e 00    	cmp    $0xe01f0,%edi
    2ab5:	0f 92 c0             	setb   %al
    2ab8:	84 c2                	test   %al,%dl
    2aba:	0f 84 8f fc ff ff    	je     274f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    2ac0:	e9 4a fe ff ff       	jmp    290f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x39f>
    2ac5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2ac9:	e8 72 e7 ff ff       	call   1240 <_ZN4core5slice5index22slice_index_order_fail17h3a5e48f4441e7556E>
    2ace:	89 d1                	mov    %edx,%ecx
    2ad0:	ba 22 01 00 00       	mov    $0x122,%edx
    2ad5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2ad9:	e8 82 e6 ff ff       	call   1160 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E>
    2ade:	89 d1                	mov    %edx,%ecx
    2ae0:	ba d0 00 00 00       	mov    $0xd0,%edx
    2ae5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2ae9:	e8 72 e6 ff ff       	call   1160 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E>
    2aee:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2af2:	8d 8b b0 fd ff ff    	lea    -0x250(%ebx),%ecx
    2af8:	e8 63 e7 ff ff       	call   1260 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E>
    2afd:	66 90                	xchg   %ax,%ax
    2aff:	90                   	nop

00002b00 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E>:
    2b00:	55                   	push   %ebp
    2b01:	53                   	push   %ebx
    2b02:	57                   	push   %edi
    2b03:	56                   	push   %esi
    2b04:	83 ec 2c             	sub    $0x2c,%esp
    2b07:	e8 00 00 00 00       	call   2b0c <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xc>
    2b0c:	5b                   	pop    %ebx
    2b0d:	81 c3 e8 74 00 00    	add    $0x74e8,%ebx
    2b13:	8b 6c 24 44          	mov    0x44(%esp),%ebp
    2b17:	8b 44 24 40          	mov    0x40(%esp),%eax
    2b1b:	83 38 00             	cmpl   $0x0,(%eax)
    2b1e:	74 6a                	je     2b8a <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x8a>
    2b20:	8b 75 00             	mov    0x0(%ebp),%esi
    2b23:	8b 7d 04             	mov    0x4(%ebp),%edi
    2b26:	8b 4f 0c             	mov    0xc(%edi),%ecx
    2b29:	83 ec 04             	sub    $0x4,%esp
    2b2c:	8d 83 b6 d6 ff ff    	lea    -0x294a(%ebx),%eax
    2b32:	6a 0d                	push   $0xd
    2b34:	50                   	push   %eax
    2b35:	56                   	push   %esi
    2b36:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2b3a:	ff d1                	call   *%ecx
    2b3c:	83 c4 10             	add    $0x10,%esp
    2b3f:	b1 01                	mov    $0x1,%cl
    2b41:	84 c0                	test   %al,%al
    2b43:	0f 85 f8 00 00 00    	jne    2c41 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    2b49:	f6 45 0a 80          	testb  $0x80,0xa(%ebp)
    2b4d:	75 58                	jne    2ba7 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xa7>
    2b4f:	83 ec 04             	sub    $0x4,%esp
    2b52:	8d 83 0d dc ff ff    	lea    -0x23f3(%ebx),%eax
    2b58:	6a 01                	push   $0x1
    2b5a:	50                   	push   %eax
    2b5b:	56                   	push   %esi
    2b5c:	ff 54 24 1c          	call   *0x1c(%esp)
    2b60:	83 c4 10             	add    $0x10,%esp
    2b63:	84 c0                	test   %al,%al
    2b65:	0f 85 a1 00 00 00    	jne    2c0c <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x10c>
    2b6b:	83 ec 08             	sub    $0x8,%esp
    2b6e:	55                   	push   %ebp
    2b6f:	ff 74 24 4c          	push   0x4c(%esp)
    2b73:	e8 f8 f7 ff ff       	call   2370 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>
    2b78:	83 c4 10             	add    $0x10,%esp
    2b7b:	84 c0                	test   %al,%al
    2b7d:	b1 01                	mov    $0x1,%cl
    2b7f:	0f 85 bc 00 00 00    	jne    2c41 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    2b85:	e9 a1 00 00 00       	jmp    2c2b <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x12b>
    2b8a:	8b 45 04             	mov    0x4(%ebp),%eax
    2b8d:	83 ec 04             	sub    $0x4,%esp
    2b90:	8d 8b 23 ea ff ff    	lea    -0x15dd(%ebx),%ecx
    2b96:	6a 0c                	push   $0xc
    2b98:	51                   	push   %ecx
    2b99:	ff 75 00             	push   0x0(%ebp)
    2b9c:	ff 50 0c             	call   *0xc(%eax)
    2b9f:	83 c4 3c             	add    $0x3c,%esp
    2ba2:	e9 9f 00 00 00       	jmp    2c46 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x146>
    2ba7:	83 ec 04             	sub    $0x4,%esp
    2baa:	8d 83 0e dc ff ff    	lea    -0x23f2(%ebx),%eax
    2bb0:	6a 02                	push   $0x2
    2bb2:	50                   	push   %eax
    2bb3:	56                   	push   %esi
    2bb4:	ff 54 24 1c          	call   *0x1c(%esp)
    2bb8:	83 c4 10             	add    $0x10,%esp
    2bbb:	84 c0                	test   %al,%al
    2bbd:	75 4d                	jne    2c0c <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x10c>
    2bbf:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    2bc4:	89 74 24 10          	mov    %esi,0x10(%esp)
    2bc8:	89 7c 24 14          	mov    %edi,0x14(%esp)
    2bcc:	8d 44 24 0b          	lea    0xb(%esp),%eax
    2bd0:	89 44 24 18          	mov    %eax,0x18(%esp)
    2bd4:	8b 45 08             	mov    0x8(%ebp),%eax
    2bd7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2bda:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    2bde:	89 44 24 24          	mov    %eax,0x24(%esp)
    2be2:	8d 7c 24 10          	lea    0x10(%esp),%edi
    2be6:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    2bea:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    2bf0:	89 44 24 20          	mov    %eax,0x20(%esp)
    2bf4:	83 ec 08             	sub    $0x8,%esp
    2bf7:	8d 44 24 24          	lea    0x24(%esp),%eax
    2bfb:	50                   	push   %eax
    2bfc:	ff 74 24 4c          	push   0x4c(%esp)
    2c00:	e8 6b f7 ff ff       	call   2370 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>
    2c05:	83 c4 10             	add    $0x10,%esp
    2c08:	84 c0                	test   %al,%al
    2c0a:	74 04                	je     2c10 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x110>
    2c0c:	b1 01                	mov    $0x1,%cl
    2c0e:	eb 31                	jmp    2c41 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    2c10:	83 ec 04             	sub    $0x4,%esp
    2c13:	8d 83 08 dc ff ff    	lea    -0x23f8(%ebx),%eax
    2c19:	6a 02                	push   $0x2
    2c1b:	50                   	push   %eax
    2c1c:	57                   	push   %edi
    2c1d:	e8 be 11 00 00       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    2c22:	83 c4 10             	add    $0x10,%esp
    2c25:	84 c0                	test   %al,%al
    2c27:	b1 01                	mov    $0x1,%cl
    2c29:	75 16                	jne    2c41 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    2c2b:	83 ec 04             	sub    $0x4,%esp
    2c2e:	8d 83 b1 db ff ff    	lea    -0x244f(%ebx),%eax
    2c34:	6a 01                	push   $0x1
    2c36:	50                   	push   %eax
    2c37:	56                   	push   %esi
    2c38:	ff 54 24 1c          	call   *0x1c(%esp)
    2c3c:	83 c4 10             	add    $0x10,%esp
    2c3f:	89 c1                	mov    %eax,%ecx
    2c41:	89 c8                	mov    %ecx,%eax
    2c43:	83 c4 2c             	add    $0x2c,%esp
    2c46:	5e                   	pop    %esi
    2c47:	5f                   	pop    %edi
    2c48:	5b                   	pop    %ebx
    2c49:	5d                   	pop    %ebp
    2c4a:	c3                   	ret
    2c4b:	66 90                	xchg   %ax,%ax
    2c4d:	66 90                	xchg   %ax,%ax
    2c4f:	90                   	nop

00002c50 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E>:
    2c50:	55                   	push   %ebp
    2c51:	53                   	push   %ebx
    2c52:	57                   	push   %edi
    2c53:	56                   	push   %esi
    2c54:	83 ec 2c             	sub    $0x2c,%esp
    2c57:	e8 00 00 00 00       	call   2c5c <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xc>
    2c5c:	5b                   	pop    %ebx
    2c5d:	81 c3 98 73 00 00    	add    $0x7398,%ebx
    2c63:	8b 74 24 44          	mov    0x44(%esp),%esi
    2c67:	8b 3e                	mov    (%esi),%edi
    2c69:	8b 6e 04             	mov    0x4(%esi),%ebp
    2c6c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2c6f:	83 ec 04             	sub    $0x4,%esp
    2c72:	8d 83 94 d6 ff ff    	lea    -0x296c(%ebx),%eax
    2c78:	6a 0e                	push   $0xe
    2c7a:	50                   	push   %eax
    2c7b:	57                   	push   %edi
    2c7c:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2c80:	ff d1                	call   *%ecx
    2c82:	83 c4 10             	add    $0x10,%esp
    2c85:	b1 01                	mov    $0x1,%cl
    2c87:	84 c0                	test   %al,%al
    2c89:	0f 85 e3 00 00 00    	jne    2d72 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2c8f:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    2c93:	75 40                	jne    2cd5 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x85>
    2c95:	83 ec 04             	sub    $0x4,%esp
    2c98:	8d 83 0d dc ff ff    	lea    -0x23f3(%ebx),%eax
    2c9e:	6a 01                	push   $0x1
    2ca0:	50                   	push   %eax
    2ca1:	57                   	push   %edi
    2ca2:	ff 54 24 1c          	call   *0x1c(%esp)
    2ca6:	83 c4 10             	add    $0x10,%esp
    2ca9:	84 c0                	test   %al,%al
    2cab:	0f 85 8c 00 00 00    	jne    2d3d <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    2cb1:	83 ec 0c             	sub    $0xc,%esp
    2cb4:	8d 93 62 e4 ff ff    	lea    -0x1b9e(%ebx),%edx
    2cba:	89 f1                	mov    %esi,%ecx
    2cbc:	6a 02                	push   $0x2
    2cbe:	e8 cd 04 00 00       	call   3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    2cc3:	83 c4 10             	add    $0x10,%esp
    2cc6:	84 c0                	test   %al,%al
    2cc8:	b1 01                	mov    $0x1,%cl
    2cca:	0f 84 8c 00 00 00    	je     2d5c <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x10c>
    2cd0:	e9 9d 00 00 00       	jmp    2d72 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2cd5:	83 ec 04             	sub    $0x4,%esp
    2cd8:	8d 83 0e dc ff ff    	lea    -0x23f2(%ebx),%eax
    2cde:	6a 02                	push   $0x2
    2ce0:	50                   	push   %eax
    2ce1:	57                   	push   %edi
    2ce2:	ff 54 24 1c          	call   *0x1c(%esp)
    2ce6:	83 c4 10             	add    $0x10,%esp
    2ce9:	84 c0                	test   %al,%al
    2ceb:	75 50                	jne    2d3d <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    2ced:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    2cf2:	89 7c 24 10          	mov    %edi,0x10(%esp)
    2cf6:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    2cfa:	8d 44 24 0b          	lea    0xb(%esp),%eax
    2cfe:	89 44 24 18          	mov    %eax,0x18(%esp)
    2d02:	8b 46 08             	mov    0x8(%esi),%eax
    2d05:	8b 4e 0c             	mov    0xc(%esi),%ecx
    2d08:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    2d0c:	89 44 24 24          	mov    %eax,0x24(%esp)
    2d10:	8d 74 24 10          	lea    0x10(%esp),%esi
    2d14:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    2d18:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    2d1e:	89 44 24 20          	mov    %eax,0x20(%esp)
    2d22:	83 ec 0c             	sub    $0xc,%esp
    2d25:	8d 93 62 e4 ff ff    	lea    -0x1b9e(%ebx),%edx
    2d2b:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    2d2f:	6a 02                	push   $0x2
    2d31:	e8 5a 04 00 00       	call   3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    2d36:	83 c4 10             	add    $0x10,%esp
    2d39:	84 c0                	test   %al,%al
    2d3b:	74 04                	je     2d41 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xf1>
    2d3d:	b1 01                	mov    $0x1,%cl
    2d3f:	eb 31                	jmp    2d72 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2d41:	83 ec 04             	sub    $0x4,%esp
    2d44:	8d 83 08 dc ff ff    	lea    -0x23f8(%ebx),%eax
    2d4a:	6a 02                	push   $0x2
    2d4c:	50                   	push   %eax
    2d4d:	56                   	push   %esi
    2d4e:	e8 8d 10 00 00       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    2d53:	83 c4 10             	add    $0x10,%esp
    2d56:	84 c0                	test   %al,%al
    2d58:	b1 01                	mov    $0x1,%cl
    2d5a:	75 16                	jne    2d72 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2d5c:	83 ec 04             	sub    $0x4,%esp
    2d5f:	8d 83 b1 db ff ff    	lea    -0x244f(%ebx),%eax
    2d65:	6a 01                	push   $0x1
    2d67:	50                   	push   %eax
    2d68:	57                   	push   %edi
    2d69:	ff 54 24 1c          	call   *0x1c(%esp)
    2d6d:	83 c4 10             	add    $0x10,%esp
    2d70:	89 c1                	mov    %eax,%ecx
    2d72:	89 c8                	mov    %ecx,%eax
    2d74:	83 c4 2c             	add    $0x2c,%esp
    2d77:	5e                   	pop    %esi
    2d78:	5f                   	pop    %edi
    2d79:	5b                   	pop    %ebx
    2d7a:	5d                   	pop    %ebp
    2d7b:	c3                   	ret
    2d7c:	66 90                	xchg   %ax,%ax
    2d7e:	66 90                	xchg   %ax,%ax

00002d80 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>:
    2d80:	55                   	push   %ebp
    2d81:	53                   	push   %ebx
    2d82:	57                   	push   %edi
    2d83:	56                   	push   %esi
    2d84:	83 ec 1c             	sub    $0x1c,%esp
    2d87:	e8 00 00 00 00       	call   2d8c <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xc>
    2d8c:	5b                   	pop    %ebx
    2d8d:	81 c3 68 72 00 00    	add    $0x7268,%ebx
    2d93:	8b 44 24 30          	mov    0x30(%esp),%eax
    2d97:	8b 08                	mov    (%eax),%ecx
    2d99:	b8 0a 00 00 00       	mov    $0xa,%eax
    2d9e:	89 ca                	mov    %ecx,%edx
    2da0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2da4:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
    2daa:	72 64                	jb     2e10 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0x90>
    2dac:	bd 0a 00 00 00       	mov    $0xa,%ebp
    2db1:	8b 74 24 0c          	mov    0xc(%esp),%esi
    2db5:	90                   	nop
    2db6:	90                   	nop
    2db7:	90                   	nop
    2db8:	90                   	nop
    2db9:	90                   	nop
    2dba:	90                   	nop
    2dbb:	90                   	nop
    2dbc:	90                   	nop
    2dbd:	90                   	nop
    2dbe:	90                   	nop
    2dbf:	90                   	nop
    2dc0:	89 f0                	mov    %esi,%eax
    2dc2:	b9 59 17 b7 d1       	mov    $0xd1b71759,%ecx
    2dc7:	f7 e1                	mul    %ecx
    2dc9:	c1 ea 0d             	shr    $0xd,%edx
    2dcc:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    2dd2:	89 f1                	mov    %esi,%ecx
    2dd4:	29 c1                	sub    %eax,%ecx
    2dd6:	69 c1 7b 14 00 00    	imul   $0x147b,%ecx,%eax
    2ddc:	c1 e8 13             	shr    $0x13,%eax
    2ddf:	6b f8 64             	imul   $0x64,%eax,%edi
    2de2:	29 f9                	sub    %edi,%ecx
    2de4:	0f b7 84 43 12 dc ff 	movzwl -0x23ee(%ebx,%eax,2),%eax
    2deb:	ff 
    2dec:	66 89 44 2c 0e       	mov    %ax,0xe(%esp,%ebp,1)
    2df1:	0f b7 c1             	movzwl %cx,%eax
    2df4:	0f b7 84 43 12 dc ff 	movzwl -0x23ee(%ebx,%eax,2),%eax
    2dfb:	ff 
    2dfc:	66 89 44 2c 10       	mov    %ax,0x10(%esp,%ebp,1)
    2e01:	8d 45 fc             	lea    -0x4(%ebp),%eax
    2e04:	89 c5                	mov    %eax,%ebp
    2e06:	81 fe 7f 96 98 00    	cmp    $0x98967f,%esi
    2e0c:	89 d6                	mov    %edx,%esi
    2e0e:	77 b0                	ja     2dc0 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0x40>
    2e10:	83 fa 09             	cmp    $0x9,%edx
    2e13:	76 29                	jbe    2e3e <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xbe>
    2e15:	0f b7 ca             	movzwl %dx,%ecx
    2e18:	c1 e9 02             	shr    $0x2,%ecx
    2e1b:	69 c9 7b 14 00 00    	imul   $0x147b,%ecx,%ecx
    2e21:	c1 e9 11             	shr    $0x11,%ecx
    2e24:	6b f1 64             	imul   $0x64,%ecx,%esi
    2e27:	29 f2                	sub    %esi,%edx
    2e29:	0f b7 d2             	movzwl %dx,%edx
    2e2c:	0f b7 94 53 12 dc ff 	movzwl -0x23ee(%ebx,%edx,2),%edx
    2e33:	ff 
    2e34:	66 89 54 04 10       	mov    %dx,0x10(%esp,%eax,1)
    2e39:	83 c0 fe             	add    $0xfffffffe,%eax
    2e3c:	89 ca                	mov    %ecx,%edx
    2e3e:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    2e42:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    2e47:	74 04                	je     2e4d <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xcd>
    2e49:	85 d2                	test   %edx,%edx
    2e4b:	74 10                	je     2e5d <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xdd>
    2e4d:	83 e2 0f             	and    $0xf,%edx
    2e50:	0f b6 94 53 13 dc ff 	movzbl -0x23ed(%ebx,%edx,2),%edx
    2e57:	ff 
    2e58:	88 54 04 11          	mov    %dl,0x11(%esp,%eax,1)
    2e5c:	48                   	dec    %eax
    2e5d:	be 0a 00 00 00       	mov    $0xa,%esi
    2e62:	29 c6                	sub    %eax,%esi
    2e64:	01 e0                	add    %esp,%eax
    2e66:	83 c0 12             	add    $0x12,%eax
    2e69:	ba 01 00 00 00       	mov    $0x1,%edx
    2e6e:	56                   	push   %esi
    2e6f:	50                   	push   %eax
    2e70:	6a 00                	push   $0x0
    2e72:	6a 01                	push   $0x1
    2e74:	e8 17 00 00 00       	call   2e90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    2e79:	83 c4 2c             	add    $0x2c,%esp
    2e7c:	5e                   	pop    %esi
    2e7d:	5f                   	pop    %edi
    2e7e:	5b                   	pop    %ebx
    2e7f:	5d                   	pop    %ebp
    2e80:	c3                   	ret
    2e81:	66 90                	xchg   %ax,%ax
    2e83:	66 90                	xchg   %ax,%ax
    2e85:	66 90                	xchg   %ax,%ax
    2e87:	66 90                	xchg   %ax,%ax
    2e89:	66 90                	xchg   %ax,%ax
    2e8b:	66 90                	xchg   %ax,%ax
    2e8d:	66 90                	xchg   %ax,%ax
    2e8f:	90                   	nop

00002e90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>:
    2e90:	55                   	push   %ebp
    2e91:	53                   	push   %ebx
    2e92:	57                   	push   %edi
    2e93:	56                   	push   %esi
    2e94:	83 ec 1c             	sub    $0x1c,%esp
    2e97:	e8 00 00 00 00       	call   2e9c <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xc>
    2e9c:	5b                   	pop    %ebx
    2e9d:	81 c3 58 71 00 00    	add    $0x7158,%ebx
    2ea3:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    2ea7:	85 d2                	test   %edx,%edx
    2ea9:	74 65                	je     2f10 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x80>
    2eab:	8b 79 08             	mov    0x8(%ecx),%edi
    2eae:	89 fa                	mov    %edi,%edx
    2eb0:	c7 44 24 04 00 00 11 	movl   $0x110000,0x4(%esp)
    2eb7:	00 
    2eb8:	81 e2 00 00 20 00    	and    $0x200000,%edx
    2ebe:	74 08                	je     2ec8 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x38>
    2ec0:	c7 44 24 04 2b 00 00 	movl   $0x2b,0x4(%esp)
    2ec7:	00 
    2ec8:	c1 ea 15             	shr    $0x15,%edx
    2ecb:	01 c2                	add    %eax,%edx
    2ecd:	8b 74 24 34          	mov    0x34(%esp),%esi
    2ed1:	f7 c7 00 00 80 00    	test   $0x800000,%edi
    2ed7:	74 51                	je     2f2a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x9a>
    2ed9:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    2edd:	85 f6                	test   %esi,%esi
    2edf:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    2ee3:	0f 84 91 00 00 00    	je     2f7a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xea>
    2ee9:	31 c0                	xor    %eax,%eax
    2eeb:	80 7d 00 c0          	cmpb   $0xc0,0x0(%ebp)
    2eef:	0f 9d c0             	setge  %al
    2ef2:	83 fe 01             	cmp    $0x1,%esi
    2ef5:	0f 84 81 00 00 00    	je     2f7c <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xec>
    2efb:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2eff:	31 d2                	xor    %edx,%edx
    2f01:	80 7d 01 c0          	cmpb   $0xc0,0x1(%ebp)
    2f05:	0f 9d c2             	setge  %dl
    2f08:	01 d0                	add    %edx,%eax
    2f0a:	8b 54 24 0c          	mov    0xc(%esp),%edx
    2f0e:	eb 6c                	jmp    2f7c <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xec>
    2f10:	8d 50 01             	lea    0x1(%eax),%edx
    2f13:	8b 79 08             	mov    0x8(%ecx),%edi
    2f16:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
    2f1d:	00 
    2f1e:	8b 74 24 34          	mov    0x34(%esp),%esi
    2f22:	f7 c7 00 00 80 00    	test   $0x800000,%edi
    2f28:	75 af                	jne    2ed9 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x49>
    2f2a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2f31:	00 
    2f32:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    2f36:	39 ea                	cmp    %ebp,%edx
    2f38:	72 50                	jb     2f8a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xfa>
    2f3a:	89 c5                	mov    %eax,%ebp
    2f3c:	8b 39                	mov    (%ecx),%edi
    2f3e:	8b 71 04             	mov    0x4(%ecx),%esi
    2f41:	83 ec 04             	sub    $0x4,%esp
    2f44:	89 f9                	mov    %edi,%ecx
    2f46:	89 f2                	mov    %esi,%edx
    2f48:	ff 74 24 38          	push   0x38(%esp)
    2f4c:	ff 74 24 18          	push   0x18(%esp)
    2f50:	ff 74 24 10          	push   0x10(%esp)
    2f54:	e8 d7 01 00 00       	call   3130 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    2f59:	83 c4 10             	add    $0x10,%esp
    2f5c:	b1 01                	mov    $0x1,%cl
    2f5e:	84 c0                	test   %al,%al
    2f60:	0f 85 ba 01 00 00    	jne    3120 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2f66:	83 ec 04             	sub    $0x4,%esp
    2f69:	55                   	push   %ebp
    2f6a:	ff 74 24 40          	push   0x40(%esp)
    2f6e:	57                   	push   %edi
    2f6f:	ff 56 0c             	call   *0xc(%esi)
    2f72:	83 c4 2c             	add    $0x2c,%esp
    2f75:	e9 ab 01 00 00       	jmp    3125 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x295>
    2f7a:	31 c0                	xor    %eax,%eax
    2f7c:	01 c2                	add    %eax,%edx
    2f7e:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    2f82:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    2f86:	39 ea                	cmp    %ebp,%edx
    2f88:	73 b0                	jae    2f3a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xaa>
    2f8a:	f7 c7 00 00 00 01    	test   $0x1000000,%edi
    2f90:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2f94:	75 20                	jne    2fb6 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x126>
    2f96:	89 ee                	mov    %ebp,%esi
    2f98:	29 d6                	sub    %edx,%esi
    2f9a:	89 f8                	mov    %edi,%eax
    2f9c:	c1 e8 1d             	shr    $0x1d,%eax
    2f9f:	83 e0 03             	and    $0x3,%eax
    2fa2:	31 d2                	xor    %edx,%edx
    2fa4:	8b 84 83 4c d5 ff ff 	mov    -0x2ab4(%ebx,%eax,4),%eax
    2fab:	01 d8                	add    %ebx,%eax
    2fad:	ff e0                	jmp    *%eax
    2faf:	89 f2                	mov    %esi,%edx
    2fb1:	e9 a9 00 00 00       	jmp    305f <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x1cf>
    2fb6:	8b 41 0c             	mov    0xc(%ecx),%eax
    2fb9:	89 44 24 14          	mov    %eax,0x14(%esp)
    2fbd:	8b 41 08             	mov    0x8(%ecx),%eax
    2fc0:	89 04 24             	mov    %eax,(%esp)
    2fc3:	25 00 00 e0 9f       	and    $0x9fe00000,%eax
    2fc8:	0d 30 00 00 20       	or     $0x20000030,%eax
    2fcd:	89 41 08             	mov    %eax,0x8(%ecx)
    2fd0:	8b 39                	mov    (%ecx),%edi
    2fd2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2fd6:	8b 71 04             	mov    0x4(%ecx),%esi
    2fd9:	83 ec 04             	sub    $0x4,%esp
    2fdc:	89 f9                	mov    %edi,%ecx
    2fde:	89 f2                	mov    %esi,%edx
    2fe0:	ff 74 24 38          	push   0x38(%esp)
    2fe4:	ff 74 24 18          	push   0x18(%esp)
    2fe8:	ff 74 24 10          	push   0x10(%esp)
    2fec:	e8 3f 01 00 00       	call   3130 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    2ff1:	83 c4 10             	add    $0x10,%esp
    2ff4:	b1 01                	mov    $0x1,%cl
    2ff6:	84 c0                	test   %al,%al
    2ff8:	0f 85 22 01 00 00    	jne    3120 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2ffe:	2b 6c 24 0c          	sub    0xc(%esp),%ebp
    3002:	45                   	inc    %ebp
    3003:	90                   	nop
    3004:	90                   	nop
    3005:	90                   	nop
    3006:	90                   	nop
    3007:	90                   	nop
    3008:	90                   	nop
    3009:	90                   	nop
    300a:	90                   	nop
    300b:	90                   	nop
    300c:	90                   	nop
    300d:	90                   	nop
    300e:	90                   	nop
    300f:	90                   	nop
    3010:	66 4d                	dec    %bp
    3012:	74 12                	je     3026 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x196>
    3014:	83 ec 08             	sub    $0x8,%esp
    3017:	6a 30                	push   $0x30
    3019:	57                   	push   %edi
    301a:	ff 56 10             	call   *0x10(%esi)
    301d:	83 c4 10             	add    $0x10,%esp
    3020:	84 c0                	test   %al,%al
    3022:	74 ec                	je     3010 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x180>
    3024:	eb 73                	jmp    3099 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x209>
    3026:	83 ec 04             	sub    $0x4,%esp
    3029:	ff 74 24 40          	push   0x40(%esp)
    302d:	ff 74 24 40          	push   0x40(%esp)
    3031:	57                   	push   %edi
    3032:	ff 56 0c             	call   *0xc(%esi)
    3035:	83 c4 10             	add    $0x10,%esp
    3038:	84 c0                	test   %al,%al
    303a:	b1 01                	mov    $0x1,%cl
    303c:	0f 85 de 00 00 00    	jne    3120 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    3042:	8b 44 24 08          	mov    0x8(%esp),%eax
    3046:	8b 0c 24             	mov    (%esp),%ecx
    3049:	89 48 08             	mov    %ecx,0x8(%eax)
    304c:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    3050:	89 48 0c             	mov    %ecx,0xc(%eax)
    3053:	31 c9                	xor    %ecx,%ecx
    3055:	e9 c6 00 00 00       	jmp    3120 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    305a:	0f b7 d6             	movzwl %si,%edx
    305d:	d1 ea                	shr    $1,%edx
    305f:	89 34 24             	mov    %esi,(%esp)
    3062:	81 e7 ff ff 1f 00    	and    $0x1fffff,%edi
    3068:	89 7c 24 14          	mov    %edi,0x14(%esp)
    306c:	8b 01                	mov    (%ecx),%eax
    306e:	89 44 24 08          	mov    %eax,0x8(%esp)
    3072:	8b 79 04             	mov    0x4(%ecx),%edi
    3075:	89 54 24 18          	mov    %edx,0x18(%esp)
    3079:	8d 72 01             	lea    0x1(%edx),%esi
    307c:	90                   	nop
    307d:	90                   	nop
    307e:	90                   	nop
    307f:	90                   	nop
    3080:	66 4e                	dec    %si
    3082:	74 1c                	je     30a0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x210>
    3084:	83 ec 08             	sub    $0x8,%esp
    3087:	ff 74 24 1c          	push   0x1c(%esp)
    308b:	ff 74 24 14          	push   0x14(%esp)
    308f:	ff 57 10             	call   *0x10(%edi)
    3092:	83 c4 10             	add    $0x10,%esp
    3095:	84 c0                	test   %al,%al
    3097:	74 e7                	je     3080 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x1f0>
    3099:	b1 01                	mov    $0x1,%cl
    309b:	e9 80 00 00 00       	jmp    3120 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    30a0:	83 ec 04             	sub    $0x4,%esp
    30a3:	8b 74 24 0c          	mov    0xc(%esp),%esi
    30a7:	89 f1                	mov    %esi,%ecx
    30a9:	89 fa                	mov    %edi,%edx
    30ab:	ff 74 24 38          	push   0x38(%esp)
    30af:	ff 74 24 18          	push   0x18(%esp)
    30b3:	ff 74 24 10          	push   0x10(%esp)
    30b7:	e8 74 00 00 00       	call   3130 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    30bc:	83 c4 10             	add    $0x10,%esp
    30bf:	b1 01                	mov    $0x1,%cl
    30c1:	84 c0                	test   %al,%al
    30c3:	75 5b                	jne    3120 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    30c5:	83 ec 04             	sub    $0x4,%esp
    30c8:	ff 74 24 40          	push   0x40(%esp)
    30cc:	ff 74 24 40          	push   0x40(%esp)
    30d0:	56                   	push   %esi
    30d1:	ff 57 0c             	call   *0xc(%edi)
    30d4:	b1 01                	mov    $0x1,%cl
    30d6:	83 c4 10             	add    $0x10,%esp
    30d9:	84 c0                	test   %al,%al
    30db:	75 43                	jne    3120 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    30dd:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    30e1:	29 0c 24             	sub    %ecx,(%esp)
    30e4:	03 4c 24 0c          	add    0xc(%esp),%ecx
    30e8:	29 e9                	sub    %ebp,%ecx
    30ea:	66 bd ff ff          	mov    $0xffff,%bp
    30ee:	90                   	nop
    30ef:	90                   	nop
    30f0:	8d 04 29             	lea    (%ecx,%ebp,1),%eax
    30f3:	66 83 f8 ff          	cmp    $0xffff,%ax
    30f7:	74 1d                	je     3116 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x286>
    30f9:	83 ec 08             	sub    $0x8,%esp
    30fc:	ff 74 24 1c          	push   0x1c(%esp)
    3100:	56                   	push   %esi
    3101:	89 ce                	mov    %ecx,%esi
    3103:	ff 57 10             	call   *0x10(%edi)
    3106:	89 f1                	mov    %esi,%ecx
    3108:	8b 74 24 18          	mov    0x18(%esp),%esi
    310c:	83 c4 10             	add    $0x10,%esp
    310f:	45                   	inc    %ebp
    3110:	84 c0                	test   %al,%al
    3112:	74 dc                	je     30f0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x260>
    3114:	eb 03                	jmp    3119 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x289>
    3116:	8b 2c 24             	mov    (%esp),%ebp
    3119:	66 3b 2c 24          	cmp    (%esp),%bp
    311d:	0f 92 c1             	setb   %cl
    3120:	89 c8                	mov    %ecx,%eax
    3122:	83 c4 1c             	add    $0x1c,%esp
    3125:	5e                   	pop    %esi
    3126:	5f                   	pop    %edi
    3127:	5b                   	pop    %ebx
    3128:	5d                   	pop    %ebp
    3129:	c3                   	ret
    312a:	66 90                	xchg   %ax,%ax
    312c:	66 90                	xchg   %ax,%ax
    312e:	66 90                	xchg   %ax,%ax

00003130 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>:
    3130:	53                   	push   %ebx
    3131:	57                   	push   %edi
    3132:	56                   	push   %esi
    3133:	89 d6                	mov    %edx,%esi
    3135:	89 cf                	mov    %ecx,%edi
    3137:	e8 00 00 00 00       	call   313c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0xc>
    313c:	5b                   	pop    %ebx
    313d:	81 c3 b8 6e 00 00    	add    $0x6eb8,%ebx
    3143:	8b 44 24 10          	mov    0x10(%esp),%eax
    3147:	3d 00 00 11 00       	cmp    $0x110000,%eax
    314c:	74 13                	je     3161 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x31>
    314e:	83 ec 08             	sub    $0x8,%esp
    3151:	50                   	push   %eax
    3152:	57                   	push   %edi
    3153:	ff 56 10             	call   *0x10(%esi)
    3156:	83 c4 10             	add    $0x10,%esp
    3159:	89 c1                	mov    %eax,%ecx
    315b:	b0 01                	mov    $0x1,%al
    315d:	84 c9                	test   %cl,%cl
    315f:	75 1d                	jne    317e <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4e>
    3161:	8b 44 24 14          	mov    0x14(%esp),%eax
    3165:	85 c0                	test   %eax,%eax
    3167:	74 13                	je     317c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4c>
    3169:	83 ec 04             	sub    $0x4,%esp
    316c:	ff 74 24 1c          	push   0x1c(%esp)
    3170:	50                   	push   %eax
    3171:	57                   	push   %edi
    3172:	ff 56 0c             	call   *0xc(%esi)
    3175:	83 c4 10             	add    $0x10,%esp
    3178:	5e                   	pop    %esi
    3179:	5f                   	pop    %edi
    317a:	5b                   	pop    %ebx
    317b:	c3                   	ret
    317c:	31 c0                	xor    %eax,%eax
    317e:	5e                   	pop    %esi
    317f:	5f                   	pop    %edi
    3180:	5b                   	pop    %ebx
    3181:	c3                   	ret
    3182:	66 90                	xchg   %ax,%ax
    3184:	66 90                	xchg   %ax,%ax
    3186:	66 90                	xchg   %ax,%ax
    3188:	66 90                	xchg   %ax,%ax
    318a:	66 90                	xchg   %ax,%ax
    318c:	66 90                	xchg   %ax,%ax
    318e:	66 90                	xchg   %ax,%ax

00003190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>:
    3190:	55                   	push   %ebp
    3191:	53                   	push   %ebx
    3192:	57                   	push   %edi
    3193:	56                   	push   %esi
    3194:	83 ec 2c             	sub    $0x2c,%esp
    3197:	89 cd                	mov    %ecx,%ebp
    3199:	e8 00 00 00 00       	call   319e <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xe>
    319e:	58                   	pop    %eax
    319f:	81 c0 56 6e 00 00    	add    $0x6e56,%eax
    31a5:	89 44 24 24          	mov    %eax,0x24(%esp)
    31a9:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    31ad:	8b 7d 08             	mov    0x8(%ebp),%edi
    31b0:	f7 c7 00 00 00 18    	test   $0x18000000,%edi
    31b6:	74 3c                	je     31f4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x64>
    31b8:	f7 c7 00 00 00 10    	test   $0x10000000,%edi
    31be:	89 54 24 0c          	mov    %edx,0xc(%esp)
    31c2:	75 40                	jne    3204 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x74>
    31c4:	83 f9 10             	cmp    $0x10,%ecx
    31c7:	0f 83 9f 00 00 00    	jae    326c <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xdc>
    31cd:	85 c9                	test   %ecx,%ecx
    31cf:	0f 84 1a 01 00 00    	je     32ef <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x15f>
    31d5:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    31d9:	89 7c 24 14          	mov    %edi,0x14(%esp)
    31dd:	89 ce                	mov    %ecx,%esi
    31df:	83 e6 03             	and    $0x3,%esi
    31e2:	83 f9 04             	cmp    $0x4,%ecx
    31e5:	0f 83 19 01 00 00    	jae    3304 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x174>
    31eb:	31 c9                	xor    %ecx,%ecx
    31ed:	31 db                	xor    %ebx,%ebx
    31ef:	e9 65 01 00 00       	jmp    3359 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1c9>
    31f4:	8b 45 04             	mov    0x4(%ebp),%eax
    31f7:	83 ec 04             	sub    $0x4,%esp
    31fa:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    31fe:	51                   	push   %ecx
    31ff:	e9 ef 04 00 00       	jmp    36f3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x563>
    3204:	0f b7 45 0e          	movzwl 0xe(%ebp),%eax
    3208:	89 44 24 18          	mov    %eax,0x18(%esp)
    320c:	85 c0                	test   %eax,%eax
    320e:	0f 84 a4 00 00 00    	je     32b8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x128>
    3214:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    3218:	89 7c 24 14          	mov    %edi,0x14(%esp)
    321c:	01 d1                	add    %edx,%ecx
    321e:	89 cd                	mov    %ecx,%ebp
    3220:	89 d1                	mov    %edx,%ecx
    3222:	31 f6                	xor    %esi,%esi
    3224:	31 c0                	xor    %eax,%eax
    3226:	eb 1e                	jmp    3246 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xb6>
    3228:	90                   	nop
    3229:	90                   	nop
    322a:	90                   	nop
    322b:	90                   	nop
    322c:	90                   	nop
    322d:	90                   	nop
    322e:	90                   	nop
    322f:	90                   	nop
    3230:	8d 79 01             	lea    0x1(%ecx),%edi
    3233:	89 fe                	mov    %edi,%esi
    3235:	29 ce                	sub    %ecx,%esi
    3237:	01 d6                	add    %edx,%esi
    3239:	40                   	inc    %eax
    323a:	89 f9                	mov    %edi,%ecx
    323c:	39 44 24 18          	cmp    %eax,0x18(%esp)
    3240:	0f 84 82 00 00 00    	je     32c8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x138>
    3246:	89 f2                	mov    %esi,%edx
    3248:	39 e9                	cmp    %ebp,%ecx
    324a:	74 72                	je     32be <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x12e>
    324c:	0f b6 19             	movzbl (%ecx),%ebx
    324f:	84 db                	test   %bl,%bl
    3251:	79 dd                	jns    3230 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa0>
    3253:	80 fb e0             	cmp    $0xe0,%bl
    3256:	72 0a                	jb     3262 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd2>
    3258:	80 fb f0             	cmp    $0xf0,%bl
    325b:	72 0a                	jb     3267 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd7>
    325d:	8d 79 04             	lea    0x4(%ecx),%edi
    3260:	eb d1                	jmp    3233 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    3262:	8d 79 02             	lea    0x2(%ecx),%edi
    3265:	eb cc                	jmp    3233 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    3267:	8d 79 03             	lea    0x3(%ecx),%edi
    326a:	eb c7                	jmp    3233 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    326c:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    3270:	89 7c 24 14          	mov    %edi,0x14(%esp)
    3274:	8d 6a 03             	lea    0x3(%edx),%ebp
    3277:	83 e5 fc             	and    $0xfffffffc,%ebp
    327a:	89 e8                	mov    %ebp,%eax
    327c:	29 d0                	sub    %edx,%eax
    327e:	89 cb                	mov    %ecx,%ebx
    3280:	29 c3                	sub    %eax,%ebx
    3282:	89 d8                	mov    %ebx,%eax
    3284:	83 e0 03             	and    $0x3,%eax
    3287:	89 44 24 18          	mov    %eax,0x18(%esp)
    328b:	89 ef                	mov    %ebp,%edi
    328d:	b8 00 00 00 00       	mov    $0x0,%eax
    3292:	29 d7                	sub    %edx,%edi
    3294:	0f 84 76 01 00 00    	je     3410 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x280>
    329a:	89 5c 24 20          	mov    %ebx,0x20(%esp)
    329e:	8b 74 24 0c          	mov    0xc(%esp),%esi
    32a2:	89 f0                	mov    %esi,%eax
    32a4:	29 e8                	sub    %ebp,%eax
    32a6:	83 f8 fc             	cmp    $0xfffffffc,%eax
    32a9:	0f 86 ee 00 00 00    	jbe    339d <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x20d>
    32af:	31 c0                	xor    %eax,%eax
    32b1:	31 d2                	xor    %edx,%edx
    32b3:	e9 2c 01 00 00       	jmp    33e4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x254>
    32b8:	31 f6                	xor    %esi,%esi
    32ba:	31 c9                	xor    %ecx,%ecx
    32bc:	eb 14                	jmp    32d2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x142>
    32be:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    32c2:	29 c1                	sub    %eax,%ecx
    32c4:	89 d6                	mov    %edx,%esi
    32c6:	eb 02                	jmp    32ca <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x13a>
    32c8:	31 c9                	xor    %ecx,%ecx
    32ca:	8b 7c 24 14          	mov    0x14(%esp),%edi
    32ce:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    32d2:	8b 44 24 18          	mov    0x18(%esp),%eax
    32d6:	29 c8                	sub    %ecx,%eax
    32d8:	89 c1                	mov    %eax,%ecx
    32da:	8b 54 24 0c          	mov    0xc(%esp),%edx
    32de:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    32e2:	39 c1                	cmp    %eax,%ecx
    32e4:	0f 82 7c 02 00 00    	jb     3566 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    32ea:	e9 f9 03 00 00       	jmp    36e8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    32ef:	31 f6                	xor    %esi,%esi
    32f1:	31 c9                	xor    %ecx,%ecx
    32f3:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    32f7:	39 c1                	cmp    %eax,%ecx
    32f9:	0f 82 67 02 00 00    	jb     3566 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    32ff:	e9 e4 03 00 00       	jmp    36e8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    3304:	89 cf                	mov    %ecx,%edi
    3306:	83 e7 0c             	and    $0xc,%edi
    3309:	31 c9                	xor    %ecx,%ecx
    330b:	31 db                	xor    %ebx,%ebx
    330d:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    3311:	90                   	nop
    3312:	90                   	nop
    3313:	90                   	nop
    3314:	90                   	nop
    3315:	90                   	nop
    3316:	90                   	nop
    3317:	90                   	nop
    3318:	90                   	nop
    3319:	90                   	nop
    331a:	90                   	nop
    331b:	90                   	nop
    331c:	90                   	nop
    331d:	90                   	nop
    331e:	90                   	nop
    331f:	90                   	nop
    3320:	89 c8                	mov    %ecx,%eax
    3322:	31 c9                	xor    %ecx,%ecx
    3324:	80 7c 1d 00 c0       	cmpb   $0xc0,0x0(%ebp,%ebx,1)
    3329:	0f 9d c1             	setge  %cl
    332c:	01 c1                	add    %eax,%ecx
    332e:	31 d2                	xor    %edx,%edx
    3330:	80 7c 1d 01 c0       	cmpb   $0xc0,0x1(%ebp,%ebx,1)
    3335:	0f 9d c2             	setge  %dl
    3338:	31 c0                	xor    %eax,%eax
    333a:	80 7c 1d 02 c0       	cmpb   $0xc0,0x2(%ebp,%ebx,1)
    333f:	0f 9d c0             	setge  %al
    3342:	01 d0                	add    %edx,%eax
    3344:	01 c8                	add    %ecx,%eax
    3346:	31 c9                	xor    %ecx,%ecx
    3348:	80 7c 1d 03 c0       	cmpb   $0xc0,0x3(%ebp,%ebx,1)
    334d:	0f 9d c1             	setge  %cl
    3350:	01 c1                	add    %eax,%ecx
    3352:	83 c3 04             	add    $0x4,%ebx
    3355:	39 df                	cmp    %ebx,%edi
    3357:	75 c7                	jne    3320 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x190>
    3359:	85 f6                	test   %esi,%esi
    335b:	0f 84 e9 01 00 00    	je     354a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3ba>
    3361:	03 5c 24 0c          	add    0xc(%esp),%ebx
    3365:	31 d2                	xor    %edx,%edx
    3367:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    336b:	90                   	nop
    336c:	90                   	nop
    336d:	90                   	nop
    336e:	90                   	nop
    336f:	90                   	nop
    3370:	31 c0                	xor    %eax,%eax
    3372:	80 3c 13 c0          	cmpb   $0xc0,(%ebx,%edx,1)
    3376:	0f 9d c0             	setge  %al
    3379:	01 c1                	add    %eax,%ecx
    337b:	42                   	inc    %edx
    337c:	39 d6                	cmp    %edx,%esi
    337e:	75 f0                	jne    3370 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1e0>
    3380:	8b 7c 24 14          	mov    0x14(%esp),%edi
    3384:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3388:	8b 74 24 40          	mov    0x40(%esp),%esi
    338c:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    3390:	39 c1                	cmp    %eax,%ecx
    3392:	0f 82 ce 01 00 00    	jb     3566 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    3398:	e9 4b 03 00 00       	jmp    36e8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    339d:	31 c0                	xor    %eax,%eax
    339f:	31 d2                	xor    %edx,%edx
    33a1:	90                   	nop
    33a2:	90                   	nop
    33a3:	90                   	nop
    33a4:	90                   	nop
    33a5:	90                   	nop
    33a6:	90                   	nop
    33a7:	90                   	nop
    33a8:	90                   	nop
    33a9:	90                   	nop
    33aa:	90                   	nop
    33ab:	90                   	nop
    33ac:	90                   	nop
    33ad:	90                   	nop
    33ae:	90                   	nop
    33af:	90                   	nop
    33b0:	31 db                	xor    %ebx,%ebx
    33b2:	80 3c 16 c0          	cmpb   $0xc0,(%esi,%edx,1)
    33b6:	0f 9d c3             	setge  %bl
    33b9:	01 c3                	add    %eax,%ebx
    33bb:	31 c0                	xor    %eax,%eax
    33bd:	80 7c 16 01 c0       	cmpb   $0xc0,0x1(%esi,%edx,1)
    33c2:	0f 9d c0             	setge  %al
    33c5:	31 c9                	xor    %ecx,%ecx
    33c7:	80 7c 16 02 c0       	cmpb   $0xc0,0x2(%esi,%edx,1)
    33cc:	0f 9d c1             	setge  %cl
    33cf:	01 c1                	add    %eax,%ecx
    33d1:	01 d9                	add    %ebx,%ecx
    33d3:	31 c0                	xor    %eax,%eax
    33d5:	80 7c 16 03 c0       	cmpb   $0xc0,0x3(%esi,%edx,1)
    33da:	0f 9d c0             	setge  %al
    33dd:	01 c8                	add    %ecx,%eax
    33df:	83 c2 04             	add    $0x4,%edx
    33e2:	75 cc                	jne    33b0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x220>
    33e4:	39 f5                	cmp    %esi,%ebp
    33e6:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    33ea:	74 24                	je     3410 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x280>
    33ec:	03 54 24 0c          	add    0xc(%esp),%edx
    33f0:	31 f6                	xor    %esi,%esi
    33f2:	90                   	nop
    33f3:	90                   	nop
    33f4:	90                   	nop
    33f5:	90                   	nop
    33f6:	90                   	nop
    33f7:	90                   	nop
    33f8:	90                   	nop
    33f9:	90                   	nop
    33fa:	90                   	nop
    33fb:	90                   	nop
    33fc:	90                   	nop
    33fd:	90                   	nop
    33fe:	90                   	nop
    33ff:	90                   	nop
    3400:	31 c9                	xor    %ecx,%ecx
    3402:	80 3c 32 c0          	cmpb   $0xc0,(%edx,%esi,1)
    3406:	0f 9d c1             	setge  %cl
    3409:	01 c8                	add    %ecx,%eax
    340b:	46                   	inc    %esi
    340c:	39 f7                	cmp    %esi,%edi
    340e:	75 f0                	jne    3400 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x270>
    3410:	8b 7c 24 18          	mov    0x18(%esp),%edi
    3414:	85 ff                	test   %edi,%edi
    3416:	b9 00 00 00 00       	mov    $0x0,%ecx
    341b:	74 35                	je     3452 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c2>
    341d:	89 da                	mov    %ebx,%edx
    341f:	83 e2 fc             	and    $0xfffffffc,%edx
    3422:	31 c9                	xor    %ecx,%ecx
    3424:	80 7c 15 00 c0       	cmpb   $0xc0,0x0(%ebp,%edx,1)
    3429:	0f 9d c1             	setge  %cl
    342c:	83 ff 01             	cmp    $0x1,%edi
    342f:	74 21                	je     3452 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c2>
    3431:	89 ce                	mov    %ecx,%esi
    3433:	31 c9                	xor    %ecx,%ecx
    3435:	80 7c 15 01 c0       	cmpb   $0xc0,0x1(%ebp,%edx,1)
    343a:	0f 9d c1             	setge  %cl
    343d:	01 ce                	add    %ecx,%esi
    343f:	83 ff 02             	cmp    $0x2,%edi
    3442:	74 0c                	je     3450 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c0>
    3444:	31 c9                	xor    %ecx,%ecx
    3446:	80 7c 15 02 c0       	cmpb   $0xc0,0x2(%ebp,%edx,1)
    344b:	0f 9d c1             	setge  %cl
    344e:	01 ce                	add    %ecx,%esi
    3450:	89 f1                	mov    %esi,%ecx
    3452:	01 c1                	add    %eax,%ecx
    3454:	c1 eb 02             	shr    $0x2,%ebx
    3457:	eb 43                	jmp    349c <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x30c>
    3459:	90                   	nop
    345a:	90                   	nop
    345b:	90                   	nop
    345c:	90                   	nop
    345d:	90                   	nop
    345e:	90                   	nop
    345f:	90                   	nop
    3460:	89 f0                	mov    %esi,%eax
    3462:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    3467:	c1 ee 08             	shr    $0x8,%esi
    346a:	81 e6 ff 00 ff 00    	and    $0xff00ff,%esi
    3470:	01 c6                	add    %eax,%esi
    3472:	89 f0                	mov    %esi,%eax
    3474:	c1 e0 10             	shl    $0x10,%eax
    3477:	01 f0                	add    %esi,%eax
    3479:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    347d:	8d 2c ba             	lea    (%edx,%edi,4),%ebp
    3480:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    3484:	29 fb                	sub    %edi,%ebx
    3486:	c1 e8 10             	shr    $0x10,%eax
    3489:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    348d:	01 c1                	add    %eax,%ecx
    348f:	89 fe                	mov    %edi,%esi
    3491:	83 e6 03             	and    $0x3,%esi
    3494:	85 f6                	test   %esi,%esi
    3496:	0f 85 95 01 00 00    	jne    3631 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4a1>
    349c:	85 db                	test   %ebx,%ebx
    349e:	0f 84 a6 00 00 00    	je     354a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3ba>
    34a4:	89 ea                	mov    %ebp,%edx
    34a6:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    34aa:	89 d8                	mov    %ebx,%eax
    34ac:	81 fb c0 00 00 00    	cmp    $0xc0,%ebx
    34b2:	72 05                	jb     34b9 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x329>
    34b4:	b8 c0 00 00 00       	mov    $0xc0,%eax
    34b9:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    34bd:	31 f6                	xor    %esi,%esi
    34bf:	89 5c 24 20          	mov    %ebx,0x20(%esp)
    34c3:	83 fb 04             	cmp    $0x4,%ebx
    34c6:	72 98                	jb     3460 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2d0>
    34c8:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    34cc:	c1 e9 02             	shr    $0x2,%ecx
    34cf:	c1 e1 04             	shl    $0x4,%ecx
    34d2:	31 ed                	xor    %ebp,%ebp
    34d4:	31 f6                	xor    %esi,%esi
    34d6:	90                   	nop
    34d7:	90                   	nop
    34d8:	90                   	nop
    34d9:	90                   	nop
    34da:	90                   	nop
    34db:	90                   	nop
    34dc:	90                   	nop
    34dd:	90                   	nop
    34de:	90                   	nop
    34df:	90                   	nop
    34e0:	8b 04 2a             	mov    (%edx,%ebp,1),%eax
    34e3:	8b 5c 2a 04          	mov    0x4(%edx,%ebp,1),%ebx
    34e7:	89 c7                	mov    %eax,%edi
    34e9:	f7 d7                	not    %edi
    34eb:	c1 ef 07             	shr    $0x7,%edi
    34ee:	c1 e8 06             	shr    $0x6,%eax
    34f1:	09 f8                	or     %edi,%eax
    34f3:	25 01 01 01 01       	and    $0x1010101,%eax
    34f8:	01 f0                	add    %esi,%eax
    34fa:	89 de                	mov    %ebx,%esi
    34fc:	f7 d6                	not    %esi
    34fe:	c1 ee 07             	shr    $0x7,%esi
    3501:	c1 eb 06             	shr    $0x6,%ebx
    3504:	09 f3                	or     %esi,%ebx
    3506:	81 e3 01 01 01 01    	and    $0x1010101,%ebx
    350c:	8b 7c 2a 08          	mov    0x8(%edx,%ebp,1),%edi
    3510:	89 fe                	mov    %edi,%esi
    3512:	f7 d6                	not    %esi
    3514:	c1 ee 07             	shr    $0x7,%esi
    3517:	c1 ef 06             	shr    $0x6,%edi
    351a:	09 f7                	or     %esi,%edi
    351c:	81 e7 01 01 01 01    	and    $0x1010101,%edi
    3522:	01 df                	add    %ebx,%edi
    3524:	01 c7                	add    %eax,%edi
    3526:	8b 74 2a 0c          	mov    0xc(%edx,%ebp,1),%esi
    352a:	89 f0                	mov    %esi,%eax
    352c:	f7 d0                	not    %eax
    352e:	c1 e8 07             	shr    $0x7,%eax
    3531:	c1 ee 06             	shr    $0x6,%esi
    3534:	09 c6                	or     %eax,%esi
    3536:	81 e6 01 01 01 01    	and    $0x1010101,%esi
    353c:	01 fe                	add    %edi,%esi
    353e:	83 c5 10             	add    $0x10,%ebp
    3541:	39 e9                	cmp    %ebp,%ecx
    3543:	75 9b                	jne    34e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x350>
    3545:	e9 16 ff ff ff       	jmp    3460 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2d0>
    354a:	8b 7c 24 14          	mov    0x14(%esp),%edi
    354e:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3552:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    3556:	8b 74 24 40          	mov    0x40(%esp),%esi
    355a:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    355e:	39 c1                	cmp    %eax,%ecx
    3560:	0f 83 82 01 00 00    	jae    36e8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    3566:	89 74 24 10          	mov    %esi,0x10(%esp)
    356a:	89 44 24 28          	mov    %eax,0x28(%esp)
    356e:	89 c2                	mov    %eax,%edx
    3570:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3574:	29 ca                	sub    %ecx,%edx
    3576:	89 f8                	mov    %edi,%eax
    3578:	c1 e8 1d             	shr    $0x1d,%eax
    357b:	83 e0 03             	and    $0x3,%eax
    357e:	31 f6                	xor    %esi,%esi
    3580:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    3584:	8b 84 81 5c d5 ff ff 	mov    -0x2aa4(%ecx,%eax,4),%eax
    358b:	89 cb                	mov    %ecx,%ebx
    358d:	01 c8                	add    %ecx,%eax
    358f:	ff e0                	jmp    *%eax
    3591:	89 d6                	mov    %edx,%esi
    3593:	eb 05                	jmp    359a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x40a>
    3595:	0f b7 f2             	movzwl %dx,%esi
    3598:	d1 ee                	shr    $1,%esi
    359a:	89 54 24 20          	mov    %edx,0x20(%esp)
    359e:	81 e7 ff ff 1f 00    	and    $0x1fffff,%edi
    35a4:	89 7c 24 14          	mov    %edi,0x14(%esp)
    35a8:	8b 7d 00             	mov    0x0(%ebp),%edi
    35ab:	8b 6d 04             	mov    0x4(%ebp),%ebp
    35ae:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    35b2:	46                   	inc    %esi
    35b3:	90                   	nop
    35b4:	90                   	nop
    35b5:	90                   	nop
    35b6:	90                   	nop
    35b7:	90                   	nop
    35b8:	90                   	nop
    35b9:	90                   	nop
    35ba:	90                   	nop
    35bb:	90                   	nop
    35bc:	90                   	nop
    35bd:	90                   	nop
    35be:	90                   	nop
    35bf:	90                   	nop
    35c0:	66 4e                	dec    %si
    35c2:	74 19                	je     35dd <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x44d>
    35c4:	83 ec 08             	sub    $0x8,%esp
    35c7:	ff 74 24 1c          	push   0x1c(%esp)
    35cb:	57                   	push   %edi
    35cc:	ff 55 10             	call   *0x10(%ebp)
    35cf:	83 c4 10             	add    $0x10,%esp
    35d2:	84 c0                	test   %al,%al
    35d4:	74 ea                	je     35c0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x430>
    35d6:	b0 01                	mov    $0x1,%al
    35d8:	e9 8c 00 00 00       	jmp    3669 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d9>
    35dd:	83 ec 04             	sub    $0x4,%esp
    35e0:	ff 74 24 14          	push   0x14(%esp)
    35e4:	ff 74 24 14          	push   0x14(%esp)
    35e8:	57                   	push   %edi
    35e9:	ff 55 0c             	call   *0xc(%ebp)
    35ec:	83 c4 10             	add    $0x10,%esp
    35ef:	89 c1                	mov    %eax,%ecx
    35f1:	b0 01                	mov    $0x1,%al
    35f3:	84 c9                	test   %cl,%cl
    35f5:	75 72                	jne    3669 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d9>
    35f7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    35fb:	29 44 24 20          	sub    %eax,0x20(%esp)
    35ff:	03 44 24 18          	add    0x18(%esp),%eax
    3603:	2b 44 24 28          	sub    0x28(%esp),%eax
    3607:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    360b:	66 be ff ff          	mov    $0xffff,%si
    360f:	90                   	nop
    3610:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3614:	01 f0                	add    %esi,%eax
    3616:	66 83 f8 ff          	cmp    $0xffff,%ax
    361a:	74 41                	je     365d <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4cd>
    361c:	83 ec 08             	sub    $0x8,%esp
    361f:	ff 74 24 1c          	push   0x1c(%esp)
    3623:	57                   	push   %edi
    3624:	ff 55 10             	call   *0x10(%ebp)
    3627:	83 c4 10             	add    $0x10,%esp
    362a:	46                   	inc    %esi
    362b:	84 c0                	test   %al,%al
    362d:	74 e1                	je     3610 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x480>
    362f:	eb 30                	jmp    3661 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d1>
    3631:	89 cb                	mov    %ecx,%ebx
    3633:	81 e7 fc 00 00 00    	and    $0xfc,%edi
    3639:	8b 0c ba             	mov    (%edx,%edi,4),%ecx
    363c:	89 c8                	mov    %ecx,%eax
    363e:	f7 d0                	not    %eax
    3640:	c1 e8 07             	shr    $0x7,%eax
    3643:	c1 e9 06             	shr    $0x6,%ecx
    3646:	09 c1                	or     %eax,%ecx
    3648:	81 e1 01 01 01 01    	and    $0x1010101,%ecx
    364e:	83 fe 01             	cmp    $0x1,%esi
    3651:	75 1e                	jne    3671 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4e1>
    3653:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3657:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    365b:	eb 57                	jmp    36b4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x524>
    365d:	8b 74 24 20          	mov    0x20(%esp),%esi
    3661:	66 3b 74 24 20       	cmp    0x20(%esp),%si
    3666:	0f 92 c0             	setb   %al
    3669:	83 c4 2c             	add    $0x2c,%esp
    366c:	e9 8c 00 00 00       	jmp    36fd <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x56d>
    3671:	8b 44 ba 04          	mov    0x4(%edx,%edi,4),%eax
    3675:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    3679:	89 c7                	mov    %eax,%edi
    367b:	f7 d7                	not    %edi
    367d:	c1 ef 07             	shr    $0x7,%edi
    3680:	c1 e8 06             	shr    $0x6,%eax
    3683:	09 f8                	or     %edi,%eax
    3685:	25 01 01 01 01       	and    $0x1010101,%eax
    368a:	01 c1                	add    %eax,%ecx
    368c:	83 fe 02             	cmp    $0x2,%esi
    368f:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    3693:	74 1b                	je     36b0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x520>
    3695:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3699:	8b 44 82 08          	mov    0x8(%edx,%eax,4),%eax
    369d:	89 c2                	mov    %eax,%edx
    369f:	f7 d2                	not    %edx
    36a1:	c1 ea 07             	shr    $0x7,%edx
    36a4:	c1 e8 06             	shr    $0x6,%eax
    36a7:	09 d0                	or     %edx,%eax
    36a9:	25 01 01 01 01       	and    $0x1010101,%eax
    36ae:	01 c1                	add    %eax,%ecx
    36b0:	8b 54 24 0c          	mov    0xc(%esp),%edx
    36b4:	89 c8                	mov    %ecx,%eax
    36b6:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    36bb:	c1 e9 08             	shr    $0x8,%ecx
    36be:	81 e1 ff 00 07 00    	and    $0x700ff,%ecx
    36c4:	01 c1                	add    %eax,%ecx
    36c6:	89 c8                	mov    %ecx,%eax
    36c8:	c1 e0 10             	shl    $0x10,%eax
    36cb:	01 c8                	add    %ecx,%eax
    36cd:	c1 e8 10             	shr    $0x10,%eax
    36d0:	89 d9                	mov    %ebx,%ecx
    36d2:	01 c1                	add    %eax,%ecx
    36d4:	8b 7c 24 14          	mov    0x14(%esp),%edi
    36d8:	8b 74 24 40          	mov    0x40(%esp),%esi
    36dc:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    36e0:	39 c1                	cmp    %eax,%ecx
    36e2:	0f 82 7e fe ff ff    	jb     3566 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    36e8:	8b 45 04             	mov    0x4(%ebp),%eax
    36eb:	83 ec 04             	sub    $0x4,%esp
    36ee:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    36f2:	56                   	push   %esi
    36f3:	52                   	push   %edx
    36f4:	ff 75 00             	push   0x0(%ebp)
    36f7:	ff 50 0c             	call   *0xc(%eax)
    36fa:	83 c4 3c             	add    $0x3c,%esp
    36fd:	5e                   	pop    %esi
    36fe:	5f                   	pop    %edi
    36ff:	5b                   	pop    %ebx
    3700:	5d                   	pop    %ebp
    3701:	c3                   	ret
    3702:	66 90                	xchg   %ax,%ax
    3704:	66 90                	xchg   %ax,%ax
    3706:	66 90                	xchg   %ax,%ax
    3708:	66 90                	xchg   %ax,%ax
    370a:	66 90                	xchg   %ax,%ax
    370c:	66 90                	xchg   %ax,%ax
    370e:	66 90                	xchg   %ax,%ax

00003710 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE>:
    3710:	53                   	push   %ebx
    3711:	83 ec 08             	sub    $0x8,%esp
    3714:	e8 00 00 00 00       	call   3719 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE+0x9>
    3719:	5b                   	pop    %ebx
    371a:	81 c3 db 68 00 00    	add    $0x68db,%ebx
    3720:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    3724:	8b 44 24 10          	mov    0x10(%esp),%eax
    3728:	8b 10                	mov    (%eax),%edx
    372a:	8b 40 04             	mov    0x4(%eax),%eax
    372d:	89 04 24             	mov    %eax,(%esp)
    3730:	e8 5b fa ff ff       	call   3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    3735:	83 c4 08             	add    $0x8,%esp
    3738:	5b                   	pop    %ebx
    3739:	c3                   	ret
    373a:	66 90                	xchg   %ax,%ax
    373c:	66 90                	xchg   %ax,%ax
    373e:	66 90                	xchg   %ax,%ax

00003740 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE>:
    3740:	53                   	push   %ebx
    3741:	83 ec 08             	sub    $0x8,%esp
    3744:	e8 00 00 00 00       	call   3749 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE+0x9>
    3749:	5b                   	pop    %ebx
    374a:	81 c3 ab 68 00 00    	add    $0x68ab,%ebx
    3750:	8b 44 24 10          	mov    0x10(%esp),%eax
    3754:	8b 48 04             	mov    0x4(%eax),%ecx
    3757:	83 ec 08             	sub    $0x8,%esp
    375a:	ff 74 24 1c          	push   0x1c(%esp)
    375e:	ff 30                	push   (%eax)
    3760:	ff 51 0c             	call   *0xc(%ecx)
    3763:	83 c4 18             	add    $0x18,%esp
    3766:	5b                   	pop    %ebx
    3767:	c3                   	ret
    3768:	66 90                	xchg   %ax,%ax
    376a:	66 90                	xchg   %ax,%ax
    376c:	66 90                	xchg   %ax,%ax
    376e:	66 90                	xchg   %ax,%ax

00003770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>:
    3770:	55                   	push   %ebp
    3771:	53                   	push   %ebx
    3772:	57                   	push   %edi
    3773:	56                   	push   %esi
    3774:	83 ec 2c             	sub    $0x2c,%esp
    3777:	e8 00 00 00 00       	call   377c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc>
    377c:	5b                   	pop    %ebx
    377d:	81 c3 78 68 00 00    	add    $0x6878,%ebx
    3783:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    3787:	c7 44 24 20 20 00 00 	movl   $0xe0000020,0x20(%esp)
    378e:	e0 
    378f:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    3796:	00 
    3797:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    379b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    379f:	8b 7d 10             	mov    0x10(%ebp),%edi
    37a2:	85 ff                	test   %edi,%edi
    37a4:	0f 84 10 01 00 00    	je     38ba <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x14a>
    37aa:	8b 4d 14             	mov    0x14(%ebp),%ecx
    37ad:	85 c9                	test   %ecx,%ecx
    37af:	0f 84 9e 01 00 00    	je     3953 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    37b5:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
    37b8:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    37bb:	89 44 24 14          	mov    %eax,0x14(%esp)
    37bf:	8d 47 18             	lea    0x18(%edi),%eax
    37c2:	8b 55 00             	mov    0x0(%ebp),%edx
    37c5:	8b 75 08             	mov    0x8(%ebp),%esi
    37c8:	89 74 24 10          	mov    %esi,0x10(%esp)
    37cc:	49                   	dec    %ecx
    37cd:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    37d3:	41                   	inc    %ecx
    37d4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    37d8:	31 f6                	xor    %esi,%esi
    37da:	89 54 24 28          	mov    %edx,0x28(%esp)
    37de:	eb 11                	jmp    37f1 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x81>
    37e0:	46                   	inc    %esi
    37e1:	89 ef                	mov    %ebp,%edi
    37e3:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    37e7:	8b 54 24 28          	mov    0x28(%esp),%edx
    37eb:	0f 84 4f 01 00 00    	je     3940 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1d0>
    37f1:	89 c5                	mov    %eax,%ebp
    37f3:	8b 44 f2 04          	mov    0x4(%edx,%esi,8),%eax
    37f7:	85 c0                	test   %eax,%eax
    37f9:	74 1d                	je     3818 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xa8>
    37fb:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    37ff:	83 ec 04             	sub    $0x4,%esp
    3802:	50                   	push   %eax
    3803:	ff 34 f2             	push   (%edx,%esi,8)
    3806:	ff 74 24 24          	push   0x24(%esp)
    380a:	ff 51 0c             	call   *0xc(%ecx)
    380d:	83 c4 10             	add    $0x10,%esp
    3810:	84 c0                	test   %al,%al
    3812:	0f 85 37 01 00 00    	jne    394f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    3818:	0f b7 47 08          	movzwl 0x8(%edi),%eax
    381c:	85 c0                	test   %eax,%eax
    381e:	74 30                	je     3850 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xe0>
    3820:	83 f8 01             	cmp    $0x1,%eax
    3823:	75 3b                	jne    3860 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf0>
    3825:	8b 47 0c             	mov    0xc(%edi),%eax
    3828:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    382c:	0f b7 44 c1 04       	movzwl 0x4(%ecx,%eax,8),%eax
    3831:	0f b7 0f             	movzwl (%edi),%ecx
    3834:	83 f9 02             	cmp    $0x2,%ecx
    3837:	74 23                	je     385c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xec>
    3839:	83 f9 01             	cmp    $0x1,%ecx
    383c:	75 32                	jne    3870 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x100>
    383e:	8b 4f 04             	mov    0x4(%edi),%ecx
    3841:	8b 54 24 10          	mov    0x10(%esp),%edx
    3845:	0f b7 4c ca 04       	movzwl 0x4(%edx,%ecx,8),%ecx
    384a:	eb 28                	jmp    3874 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x104>
    384c:	90                   	nop
    384d:	90                   	nop
    384e:	90                   	nop
    384f:	90                   	nop
    3850:	0f b7 47 0a          	movzwl 0xa(%edi),%eax
    3854:	0f b7 0f             	movzwl (%edi),%ecx
    3857:	83 f9 02             	cmp    $0x2,%ecx
    385a:	75 dd                	jne    3839 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc9>
    385c:	31 c9                	xor    %ecx,%ecx
    385e:	eb 14                	jmp    3874 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x104>
    3860:	31 c0                	xor    %eax,%eax
    3862:	0f b7 0f             	movzwl (%edi),%ecx
    3865:	83 f9 02             	cmp    $0x2,%ecx
    3868:	75 cf                	jne    3839 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc9>
    386a:	eb f0                	jmp    385c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xec>
    386c:	90                   	nop
    386d:	90                   	nop
    386e:	90                   	nop
    386f:	90                   	nop
    3870:	0f b7 4f 02          	movzwl 0x2(%edi),%ecx
    3874:	8b 57 10             	mov    0x10(%edi),%edx
    3877:	8b 7f 14             	mov    0x14(%edi),%edi
    387a:	89 7c 24 20          	mov    %edi,0x20(%esp)
    387e:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    3883:	66 89 4c 24 26       	mov    %cx,0x26(%esp)
    3888:	83 ec 08             	sub    $0x8,%esp
    388b:	8d 44 24 20          	lea    0x20(%esp),%eax
    388f:	50                   	push   %eax
    3890:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3894:	ff 34 d0             	push   (%eax,%edx,8)
    3897:	ff 54 d0 04          	call   *0x4(%eax,%edx,8)
    389b:	83 c4 10             	add    $0x10,%esp
    389e:	84 c0                	test   %al,%al
    38a0:	0f 85 a9 00 00 00    	jne    394f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    38a6:	89 e8                	mov    %ebp,%eax
    38a8:	3b 6c 24 14          	cmp    0x14(%esp),%ebp
    38ac:	0f 84 2e ff ff ff    	je     37e0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    38b2:	8d 45 18             	lea    0x18(%ebp),%eax
    38b5:	e9 26 ff ff ff       	jmp    37e0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    38ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    38bd:	85 c0                	test   %eax,%eax
    38bf:	0f 84 8e 00 00 00    	je     3953 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    38c5:	89 c1                	mov    %eax,%ecx
    38c7:	8b 75 08             	mov    0x8(%ebp),%esi
    38ca:	8d 04 c6             	lea    (%esi,%eax,8),%eax
    38cd:	89 44 24 10          	mov    %eax,0x10(%esp)
    38d1:	8d 46 08             	lea    0x8(%esi),%eax
    38d4:	8b 55 00             	mov    0x0(%ebp),%edx
    38d7:	49                   	dec    %ecx
    38d8:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    38de:	41                   	inc    %ecx
    38df:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    38e3:	31 ed                	xor    %ebp,%ebp
    38e5:	89 54 24 14          	mov    %edx,0x14(%esp)
    38e9:	90                   	nop
    38ea:	90                   	nop
    38eb:	90                   	nop
    38ec:	90                   	nop
    38ed:	90                   	nop
    38ee:	90                   	nop
    38ef:	90                   	nop
    38f0:	89 c7                	mov    %eax,%edi
    38f2:	8b 44 ea 04          	mov    0x4(%edx,%ebp,8),%eax
    38f6:	85 c0                	test   %eax,%eax
    38f8:	74 19                	je     3913 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1a3>
    38fa:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    38fe:	83 ec 04             	sub    $0x4,%esp
    3901:	50                   	push   %eax
    3902:	ff 34 ea             	push   (%edx,%ebp,8)
    3905:	ff 74 24 24          	push   0x24(%esp)
    3909:	ff 51 0c             	call   *0xc(%ecx)
    390c:	83 c4 10             	add    $0x10,%esp
    390f:	84 c0                	test   %al,%al
    3911:	75 3c                	jne    394f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    3913:	83 ec 08             	sub    $0x8,%esp
    3916:	8d 44 24 20          	lea    0x20(%esp),%eax
    391a:	50                   	push   %eax
    391b:	ff 36                	push   (%esi)
    391d:	ff 56 04             	call   *0x4(%esi)
    3920:	83 c4 10             	add    $0x10,%esp
    3923:	84 c0                	test   %al,%al
    3925:	75 28                	jne    394f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    3927:	45                   	inc    %ebp
    3928:	31 c0                	xor    %eax,%eax
    392a:	3b 7c 24 10          	cmp    0x10(%esp),%edi
    392e:	0f 95 c0             	setne  %al
    3931:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    3934:	89 fe                	mov    %edi,%esi
    3936:	39 6c 24 0c          	cmp    %ebp,0xc(%esp)
    393a:	8b 54 24 14          	mov    0x14(%esp),%edx
    393e:	75 b0                	jne    38f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x180>
    3940:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    3944:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3948:	3b 55 04             	cmp    0x4(%ebp),%edx
    394b:	72 0d                	jb     395a <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1ea>
    394d:	eb 2e                	jmp    397d <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    394f:	b0 01                	mov    $0x1,%al
    3951:	eb 2c                	jmp    397f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    3953:	31 d2                	xor    %edx,%edx
    3955:	3b 55 04             	cmp    0x4(%ebp),%edx
    3958:	73 23                	jae    397d <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    395a:	8b 45 00             	mov    0x0(%ebp),%eax
    395d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    3961:	83 ec 04             	sub    $0x4,%esp
    3964:	ff 74 d0 04          	push   0x4(%eax,%edx,8)
    3968:	ff 34 d0             	push   (%eax,%edx,8)
    396b:	ff 74 24 24          	push   0x24(%esp)
    396f:	ff 51 0c             	call   *0xc(%ecx)
    3972:	83 c4 10             	add    $0x10,%esp
    3975:	89 c1                	mov    %eax,%ecx
    3977:	b0 01                	mov    $0x1,%al
    3979:	84 c9                	test   %cl,%cl
    397b:	75 02                	jne    397f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    397d:	31 c0                	xor    %eax,%eax
    397f:	83 c4 2c             	add    $0x2c,%esp
    3982:	5e                   	pop    %esi
    3983:	5f                   	pop    %edi
    3984:	5b                   	pop    %ebx
    3985:	5d                   	pop    %ebp
    3986:	c3                   	ret
    3987:	66 90                	xchg   %ax,%ax
    3989:	66 90                	xchg   %ax,%ax
    398b:	66 90                	xchg   %ax,%ax
    398d:	66 90                	xchg   %ax,%ax
    398f:	90                   	nop

00003990 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E>:
    3990:	53                   	push   %ebx
    3991:	83 ec 08             	sub    $0x8,%esp
    3994:	e8 00 00 00 00       	call   3999 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x9>
    3999:	5b                   	pop    %ebx
    399a:	81 c3 5b 66 00 00    	add    $0x665b,%ebx
    39a0:	8b 44 24 14          	mov    0x14(%esp),%eax
    39a4:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    39a8:	8b 09                	mov    (%ecx),%ecx
    39aa:	89 04 24             	mov    %eax,(%esp)
    39ad:	ba 01 00 00 00       	mov    $0x1,%edx
    39b2:	e8 09 00 00 00       	call   39c0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>
    39b7:	83 c4 08             	add    $0x8,%esp
    39ba:	5b                   	pop    %ebx
    39bb:	c3                   	ret
    39bc:	66 90                	xchg   %ax,%ax
    39be:	66 90                	xchg   %ax,%ax

000039c0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>:
    39c0:	55                   	push   %ebp
    39c1:	53                   	push   %ebx
    39c2:	57                   	push   %edi
    39c3:	56                   	push   %esi
    39c4:	83 ec 1c             	sub    $0x1c,%esp
    39c7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    39cb:	e8 00 00 00 00       	call   39d0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x10>
    39d0:	5b                   	pop    %ebx
    39d1:	81 c3 24 66 00 00    	add    $0x6624,%ebx
    39d7:	b8 0a 00 00 00       	mov    $0xa,%eax
    39dc:	89 ca                	mov    %ecx,%edx
    39de:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    39e2:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
    39e8:	72 66                	jb     3a50 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x90>
    39ea:	bf 0a 00 00 00       	mov    $0xa,%edi
    39ef:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    39f3:	90                   	nop
    39f4:	90                   	nop
    39f5:	90                   	nop
    39f6:	90                   	nop
    39f7:	90                   	nop
    39f8:	90                   	nop
    39f9:	90                   	nop
    39fa:	90                   	nop
    39fb:	90                   	nop
    39fc:	90                   	nop
    39fd:	90                   	nop
    39fe:	90                   	nop
    39ff:	90                   	nop
    3a00:	89 c8                	mov    %ecx,%eax
    3a02:	ba 59 17 b7 d1       	mov    $0xd1b71759,%edx
    3a07:	f7 e2                	mul    %edx
    3a09:	c1 ea 0d             	shr    $0xd,%edx
    3a0c:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    3a12:	89 ce                	mov    %ecx,%esi
    3a14:	29 c6                	sub    %eax,%esi
    3a16:	69 c6 7b 14 00 00    	imul   $0x147b,%esi,%eax
    3a1c:	c1 e8 13             	shr    $0x13,%eax
    3a1f:	6b e8 64             	imul   $0x64,%eax,%ebp
    3a22:	29 ee                	sub    %ebp,%esi
    3a24:	0f b7 84 43 12 dc ff 	movzwl -0x23ee(%ebx,%eax,2),%eax
    3a2b:	ff 
    3a2c:	66 89 44 3c 0e       	mov    %ax,0xe(%esp,%edi,1)
    3a31:	0f b7 c6             	movzwl %si,%eax
    3a34:	0f b7 84 43 12 dc ff 	movzwl -0x23ee(%ebx,%eax,2),%eax
    3a3b:	ff 
    3a3c:	66 89 44 3c 10       	mov    %ax,0x10(%esp,%edi,1)
    3a41:	8d 47 fc             	lea    -0x4(%edi),%eax
    3a44:	89 c7                	mov    %eax,%edi
    3a46:	81 f9 7f 96 98 00    	cmp    $0x98967f,%ecx
    3a4c:	89 d1                	mov    %edx,%ecx
    3a4e:	77 b0                	ja     3a00 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x40>
    3a50:	83 fa 09             	cmp    $0x9,%edx
    3a53:	76 29                	jbe    3a7e <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xbe>
    3a55:	0f b7 ca             	movzwl %dx,%ecx
    3a58:	c1 e9 02             	shr    $0x2,%ecx
    3a5b:	69 c9 7b 14 00 00    	imul   $0x147b,%ecx,%ecx
    3a61:	c1 e9 11             	shr    $0x11,%ecx
    3a64:	6b f1 64             	imul   $0x64,%ecx,%esi
    3a67:	29 f2                	sub    %esi,%edx
    3a69:	0f b7 d2             	movzwl %dx,%edx
    3a6c:	0f b7 94 53 12 dc ff 	movzwl -0x23ee(%ebx,%edx,2),%edx
    3a73:	ff 
    3a74:	66 89 54 04 10       	mov    %dx,0x10(%esp,%eax,1)
    3a79:	83 c0 fe             	add    $0xfffffffe,%eax
    3a7c:	89 ca                	mov    %ecx,%edx
    3a7e:	8b 74 24 30          	mov    0x30(%esp),%esi
    3a82:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    3a87:	74 04                	je     3a8d <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xcd>
    3a89:	85 d2                	test   %edx,%edx
    3a8b:	74 10                	je     3a9d <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xdd>
    3a8d:	83 e2 0f             	and    $0xf,%edx
    3a90:	0f b6 8c 53 13 dc ff 	movzbl -0x23ed(%ebx,%edx,2),%ecx
    3a97:	ff 
    3a98:	88 4c 04 11          	mov    %cl,0x11(%esp,%eax,1)
    3a9c:	48                   	dec    %eax
    3a9d:	bf 0a 00 00 00       	mov    $0xa,%edi
    3aa2:	29 c7                	sub    %eax,%edi
    3aa4:	01 e0                	add    %esp,%eax
    3aa6:	83 c0 12             	add    $0x12,%eax
    3aa9:	0f b6 54 24 0c       	movzbl 0xc(%esp),%edx
    3aae:	89 f1                	mov    %esi,%ecx
    3ab0:	57                   	push   %edi
    3ab1:	50                   	push   %eax
    3ab2:	6a 00                	push   $0x0
    3ab4:	6a 01                	push   $0x1
    3ab6:	e8 d5 f3 ff ff       	call   2e90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    3abb:	83 c4 2c             	add    $0x2c,%esp
    3abe:	5e                   	pop    %esi
    3abf:	5f                   	pop    %edi
    3ac0:	5b                   	pop    %ebx
    3ac1:	5d                   	pop    %ebp
    3ac2:	c3                   	ret
    3ac3:	66 90                	xchg   %ax,%ax
    3ac5:	66 90                	xchg   %ax,%ax
    3ac7:	66 90                	xchg   %ax,%ax
    3ac9:	66 90                	xchg   %ax,%ax
    3acb:	66 90                	xchg   %ax,%ax
    3acd:	66 90                	xchg   %ax,%ax
    3acf:	90                   	nop

00003ad0 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE>:
    3ad0:	53                   	push   %ebx
    3ad1:	57                   	push   %edi
    3ad2:	56                   	push   %esi
    3ad3:	e8 00 00 00 00       	call   3ad8 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x8>
    3ad8:	5a                   	pop    %edx
    3ad9:	81 c2 1c 65 00 00    	add    $0x651c,%edx
    3adf:	89 ce                	mov    %ecx,%esi
    3ae1:	c1 e6 0b             	shl    $0xb,%esi
    3ae4:	31 c0                	xor    %eax,%eax
    3ae6:	81 f9 2f 18 01 00    	cmp    $0x1182f,%ecx
    3aec:	0f 83 d5 00 00 00    	jae    3bc7 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf7>
    3af2:	8b bc 82 78 e3 ff ff 	mov    -0x1c88(%edx,%eax,4),%edi
    3af9:	c1 e7 0b             	shl    $0xb,%edi
    3afc:	39 f7                	cmp    %esi,%edi
    3afe:	0f 86 da 00 00 00    	jbe    3bde <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x10e>
    3b04:	8b bc 82 68 e3 ff ff 	mov    -0x1c98(%edx,%eax,4),%edi
    3b0b:	c1 e7 0b             	shl    $0xb,%edi
    3b0e:	39 f7                	cmp    %esi,%edi
    3b10:	0f 86 dd 00 00 00    	jbe    3bf3 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x123>
    3b16:	8b bc 82 60 e3 ff ff 	mov    -0x1ca0(%edx,%eax,4),%edi
    3b1d:	c1 e7 0b             	shl    $0xb,%edi
    3b20:	39 f7                	cmp    %esi,%edi
    3b22:	0f 86 e0 00 00 00    	jbe    3c08 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x138>
    3b28:	8b bc 82 5c e3 ff ff 	mov    -0x1ca4(%edx,%eax,4),%edi
    3b2f:	c1 e7 0b             	shl    $0xb,%edi
    3b32:	39 f7                	cmp    %esi,%edi
    3b34:	0f 86 e3 00 00 00    	jbe    3c1d <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x14d>
    3b3a:	8b bc 82 5c e3 ff ff 	mov    -0x1ca4(%edx,%eax,4),%edi
    3b41:	c1 e7 0b             	shl    $0xb,%edi
    3b44:	39 f7                	cmp    %esi,%edi
    3b46:	77 01                	ja     3b49 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x79>
    3b48:	40                   	inc    %eax
    3b49:	8b bc 82 58 e3 ff ff 	mov    -0x1ca8(%edx,%eax,4),%edi
    3b50:	c1 e7 0b             	shl    $0xb,%edi
    3b53:	31 db                	xor    %ebx,%ebx
    3b55:	39 f7                	cmp    %esi,%edi
    3b57:	0f 94 c3             	sete   %bl
    3b5a:	11 c3                	adc    %eax,%ebx
    3b5c:	8b 84 9a 58 e3 ff ff 	mov    -0x1ca8(%edx,%ebx,4),%eax
    3b63:	c1 e8 15             	shr    $0x15,%eax
    3b66:	be ef 02 00 00       	mov    $0x2ef,%esi
    3b6b:	83 fb 20             	cmp    $0x20,%ebx
    3b6e:	77 12                	ja     3b82 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xb2>
    3b70:	8b b4 9a 5c e3 ff ff 	mov    -0x1ca4(%edx,%ebx,4),%esi
    3b77:	c1 ee 15             	shr    $0x15,%esi
    3b7a:	85 db                	test   %ebx,%ebx
    3b7c:	0f 84 b3 00 00 00    	je     3c35 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x165>
    3b82:	bf ff ff 1f 00       	mov    $0x1fffff,%edi
    3b87:	23 bc 9a 54 e3 ff ff 	and    -0x1cac(%edx,%ebx,4),%edi
    3b8e:	89 c3                	mov    %eax,%ebx
    3b90:	f7 d3                	not    %ebx
    3b92:	01 f3                	add    %esi,%ebx
    3b94:	74 2b                	je     3bc1 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf1>
    3b96:	29 f9                	sub    %edi,%ecx
    3b98:	4e                   	dec    %esi
    3b99:	01 c2                	add    %eax,%edx
    3b9b:	81 c2 c2 d8 ff ff    	add    $0xffffd8c2,%edx
    3ba1:	31 ff                	xor    %edi,%edi
    3ba3:	90                   	nop
    3ba4:	90                   	nop
    3ba5:	90                   	nop
    3ba6:	90                   	nop
    3ba7:	90                   	nop
    3ba8:	90                   	nop
    3ba9:	90                   	nop
    3baa:	90                   	nop
    3bab:	90                   	nop
    3bac:	90                   	nop
    3bad:	90                   	nop
    3bae:	90                   	nop
    3baf:	90                   	nop
    3bb0:	89 fb                	mov    %edi,%ebx
    3bb2:	0f b6 3a             	movzbl (%edx),%edi
    3bb5:	01 df                	add    %ebx,%edi
    3bb7:	39 cf                	cmp    %ecx,%edi
    3bb9:	77 06                	ja     3bc1 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf1>
    3bbb:	40                   	inc    %eax
    3bbc:	42                   	inc    %edx
    3bbd:	39 c6                	cmp    %eax,%esi
    3bbf:	75 ef                	jne    3bb0 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xe0>
    3bc1:	24 01                	and    $0x1,%al
    3bc3:	5e                   	pop    %esi
    3bc4:	5f                   	pop    %edi
    3bc5:	5b                   	pop    %ebx
    3bc6:	c3                   	ret
    3bc7:	b8 11 00 00 00       	mov    $0x11,%eax
    3bcc:	8b bc 82 78 e3 ff ff 	mov    -0x1c88(%edx,%eax,4),%edi
    3bd3:	c1 e7 0b             	shl    $0xb,%edi
    3bd6:	39 f7                	cmp    %esi,%edi
    3bd8:	0f 87 26 ff ff ff    	ja     3b04 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x34>
    3bde:	83 c8 08             	or     $0x8,%eax
    3be1:	8b bc 82 68 e3 ff ff 	mov    -0x1c98(%edx,%eax,4),%edi
    3be8:	c1 e7 0b             	shl    $0xb,%edi
    3beb:	39 f7                	cmp    %esi,%edi
    3bed:	0f 87 23 ff ff ff    	ja     3b16 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x46>
    3bf3:	83 c8 04             	or     $0x4,%eax
    3bf6:	8b bc 82 60 e3 ff ff 	mov    -0x1ca0(%edx,%eax,4),%edi
    3bfd:	c1 e7 0b             	shl    $0xb,%edi
    3c00:	39 f7                	cmp    %esi,%edi
    3c02:	0f 87 20 ff ff ff    	ja     3b28 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x58>
    3c08:	83 c8 02             	or     $0x2,%eax
    3c0b:	8b bc 82 5c e3 ff ff 	mov    -0x1ca4(%edx,%eax,4),%edi
    3c12:	c1 e7 0b             	shl    $0xb,%edi
    3c15:	39 f7                	cmp    %esi,%edi
    3c17:	0f 87 1d ff ff ff    	ja     3b3a <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x6a>
    3c1d:	40                   	inc    %eax
    3c1e:	8b bc 82 5c e3 ff ff 	mov    -0x1ca4(%edx,%eax,4),%edi
    3c25:	c1 e7 0b             	shl    $0xb,%edi
    3c28:	39 f7                	cmp    %esi,%edi
    3c2a:	0f 86 18 ff ff ff    	jbe    3b48 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x78>
    3c30:	e9 14 ff ff ff       	jmp    3b49 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x79>
    3c35:	31 ff                	xor    %edi,%edi
    3c37:	89 c3                	mov    %eax,%ebx
    3c39:	f7 d3                	not    %ebx
    3c3b:	01 f3                	add    %esi,%ebx
    3c3d:	0f 85 53 ff ff ff    	jne    3b96 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xc6>
    3c43:	e9 79 ff ff ff       	jmp    3bc1 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf1>
    3c48:	66 90                	xchg   %ax,%ax
    3c4a:	66 90                	xchg   %ax,%ax
    3c4c:	66 90                	xchg   %ax,%ax
    3c4e:	66 90                	xchg   %ax,%ax

00003c50 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>:
    3c50:	55                   	push   %ebp
    3c51:	53                   	push   %ebx
    3c52:	57                   	push   %edi
    3c53:	56                   	push   %esi
    3c54:	83 ec 2c             	sub    $0x2c,%esp
    3c57:	89 ce                	mov    %ecx,%esi
    3c59:	e8 00 00 00 00       	call   3c5e <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0xe>
    3c5e:	5b                   	pop    %ebx
    3c5f:	81 c3 96 63 00 00    	add    $0x6396,%ebx
    3c65:	b1 01                	mov    $0x1,%cl
    3c67:	80 7e 04 00          	cmpb   $0x0,0x4(%esi)
    3c6b:	0f 85 23 01 00 00    	jne    3d94 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3c71:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3c75:	8b 3e                	mov    (%esi),%edi
    3c77:	f6 47 0a 80          	testb  $0x80,0xa(%edi)
    3c7b:	0f b6 4e 05          	movzbl 0x5(%esi),%ecx
    3c7f:	75 1b                	jne    3c9c <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x4c>
    3c81:	0f b6 c1             	movzbl %cl,%eax
    3c84:	83 f0 03             	xor    $0x3,%eax
    3c87:	89 d5                	mov    %edx,%ebp
    3c89:	84 c9                	test   %cl,%cl
    3c8b:	0f 85 ce 00 00 00    	jne    3d5f <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x10f>
    3c91:	8d 8b 00 dc ff ff    	lea    -0x2400(%ebx),%ecx
    3c97:	e9 c9 00 00 00       	jmp    3d65 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x115>
    3c9c:	84 c9                	test   %cl,%cl
    3c9e:	75 29                	jne    3cc9 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x79>
    3ca0:	8b 47 04             	mov    0x4(%edi),%eax
    3ca3:	83 ec 04             	sub    $0x4,%esp
    3ca6:	8d 8b 05 dc ff ff    	lea    -0x23fb(%ebx),%ecx
    3cac:	6a 03                	push   $0x3
    3cae:	51                   	push   %ecx
    3caf:	ff 37                	push   (%edi)
    3cb1:	89 d5                	mov    %edx,%ebp
    3cb3:	ff 50 0c             	call   *0xc(%eax)
    3cb6:	89 ea                	mov    %ebp,%edx
    3cb8:	8b 6c 24 58          	mov    0x58(%esp),%ebp
    3cbc:	83 c4 10             	add    $0x10,%esp
    3cbf:	b1 01                	mov    $0x1,%cl
    3cc1:	84 c0                	test   %al,%al
    3cc3:	0f 85 cb 00 00 00    	jne    3d94 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3cc9:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    3cce:	8b 07                	mov    (%edi),%eax
    3cd0:	8b 4f 04             	mov    0x4(%edi),%ecx
    3cd3:	89 44 24 20          	mov    %eax,0x20(%esp)
    3cd7:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    3cdb:	8d 44 24 0f          	lea    0xf(%esp),%eax
    3cdf:	89 44 24 28          	mov    %eax,0x28(%esp)
    3ce3:	8b 47 08             	mov    0x8(%edi),%eax
    3ce6:	8b 4f 0c             	mov    0xc(%edi),%ecx
    3ce9:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    3ced:	89 44 24 18          	mov    %eax,0x18(%esp)
    3cf1:	8d 7c 24 20          	lea    0x20(%esp),%edi
    3cf5:	89 7c 24 10          	mov    %edi,0x10(%esp)
    3cf9:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    3cff:	89 44 24 14          	mov    %eax,0x14(%esp)
    3d03:	83 ec 04             	sub    $0x4,%esp
    3d06:	ff 74 24 44          	push   0x44(%esp)
    3d0a:	52                   	push   %edx
    3d0b:	57                   	push   %edi
    3d0c:	e8 cf 00 00 00       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    3d11:	83 c4 10             	add    $0x10,%esp
    3d14:	84 c0                	test   %al,%al
    3d16:	75 7a                	jne    3d92 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    3d18:	83 ec 04             	sub    $0x4,%esp
    3d1b:	8d 83 fe db ff ff    	lea    -0x2402(%ebx),%eax
    3d21:	6a 02                	push   $0x2
    3d23:	50                   	push   %eax
    3d24:	57                   	push   %edi
    3d25:	e8 b6 00 00 00       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    3d2a:	83 c4 10             	add    $0x10,%esp
    3d2d:	84 c0                	test   %al,%al
    3d2f:	75 61                	jne    3d92 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    3d31:	83 ec 08             	sub    $0x8,%esp
    3d34:	8d 44 24 18          	lea    0x18(%esp),%eax
    3d38:	50                   	push   %eax
    3d39:	ff 74 24 50          	push   0x50(%esp)
    3d3d:	ff d5                	call   *%ebp
    3d3f:	83 c4 10             	add    $0x10,%esp
    3d42:	84 c0                	test   %al,%al
    3d44:	75 4c                	jne    3d92 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    3d46:	8b 44 24 14          	mov    0x14(%esp),%eax
    3d4a:	83 ec 04             	sub    $0x4,%esp
    3d4d:	8d 8b 08 dc ff ff    	lea    -0x23f8(%ebx),%ecx
    3d53:	6a 02                	push   $0x2
    3d55:	51                   	push   %ecx
    3d56:	ff 74 24 1c          	push   0x1c(%esp)
    3d5a:	ff 50 0c             	call   *0xc(%eax)
    3d5d:	eb 71                	jmp    3dd0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x180>
    3d5f:	8d 8b 03 dc ff ff    	lea    -0x23fd(%ebx),%ecx
    3d65:	8b 57 04             	mov    0x4(%edi),%edx
    3d68:	83 ec 04             	sub    $0x4,%esp
    3d6b:	50                   	push   %eax
    3d6c:	51                   	push   %ecx
    3d6d:	ff 37                	push   (%edi)
    3d6f:	ff 52 0c             	call   *0xc(%edx)
    3d72:	83 c4 10             	add    $0x10,%esp
    3d75:	b1 01                	mov    $0x1,%cl
    3d77:	84 c0                	test   %al,%al
    3d79:	75 19                	jne    3d94 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3d7b:	8b 47 04             	mov    0x4(%edi),%eax
    3d7e:	83 ec 04             	sub    $0x4,%esp
    3d81:	ff 74 24 44          	push   0x44(%esp)
    3d85:	55                   	push   %ebp
    3d86:	ff 37                	push   (%edi)
    3d88:	ff 50 0c             	call   *0xc(%eax)
    3d8b:	83 c4 10             	add    $0x10,%esp
    3d8e:	84 c0                	test   %al,%al
    3d90:	74 13                	je     3da5 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x155>
    3d92:	b1 01                	mov    $0x1,%cl
    3d94:	88 4e 04             	mov    %cl,0x4(%esi)
    3d97:	c6 46 05 01          	movb   $0x1,0x5(%esi)
    3d9b:	89 f0                	mov    %esi,%eax
    3d9d:	83 c4 2c             	add    $0x2c,%esp
    3da0:	5e                   	pop    %esi
    3da1:	5f                   	pop    %edi
    3da2:	5b                   	pop    %ebx
    3da3:	5d                   	pop    %ebp
    3da4:	c3                   	ret
    3da5:	8b 47 04             	mov    0x4(%edi),%eax
    3da8:	83 ec 04             	sub    $0x4,%esp
    3dab:	8d 8b fe db ff ff    	lea    -0x2402(%ebx),%ecx
    3db1:	6a 02                	push   $0x2
    3db3:	51                   	push   %ecx
    3db4:	ff 37                	push   (%edi)
    3db6:	ff 50 0c             	call   *0xc(%eax)
    3db9:	83 c4 10             	add    $0x10,%esp
    3dbc:	84 c0                	test   %al,%al
    3dbe:	8b 44 24 48          	mov    0x48(%esp),%eax
    3dc2:	b1 01                	mov    $0x1,%cl
    3dc4:	75 ce                	jne    3d94 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3dc6:	83 ec 08             	sub    $0x8,%esp
    3dc9:	57                   	push   %edi
    3dca:	ff 74 24 50          	push   0x50(%esp)
    3dce:	ff d0                	call   *%eax
    3dd0:	83 c4 10             	add    $0x10,%esp
    3dd3:	89 c1                	mov    %eax,%ecx
    3dd5:	eb bd                	jmp    3d94 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3dd7:	66 90                	xchg   %ax,%ax
    3dd9:	66 90                	xchg   %ax,%ax
    3ddb:	66 90                	xchg   %ax,%ax
    3ddd:	66 90                	xchg   %ax,%ax
    3ddf:	90                   	nop

00003de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>:
    3de0:	55                   	push   %ebp
    3de1:	53                   	push   %ebx
    3de2:	57                   	push   %edi
    3de3:	56                   	push   %esi
    3de4:	83 ec 2c             	sub    $0x2c,%esp
    3de7:	e8 00 00 00 00       	call   3dec <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc>
    3dec:	5b                   	pop    %ebx
    3ded:	81 c3 08 62 00 00    	add    $0x6208,%ebx
    3df3:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3df7:	8b 74 24 44          	mov    0x44(%esp),%esi
    3dfb:	8b 44 24 40          	mov    0x40(%esp),%eax
    3dff:	8b 48 08             	mov    0x8(%eax),%ecx
    3e02:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    3e06:	8b 08                	mov    (%eax),%ecx
    3e08:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    3e0c:	8b 40 04             	mov    0x4(%eax),%eax
    3e0f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3e13:	31 d2                	xor    %edx,%edx
    3e15:	8d 83 aa d6 ff ff    	lea    -0x2956(%ebx),%eax
    3e1b:	89 44 24 28          	mov    %eax,0x28(%esp)
    3e1f:	31 c0                	xor    %eax,%eax
    3e21:	31 c9                	xor    %ecx,%ecx
    3e23:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    3e27:	eb 48                	jmp    3e71 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x91>
    3e29:	90                   	nop
    3e2a:	90                   	nop
    3e2b:	90                   	nop
    3e2c:	90                   	nop
    3e2d:	90                   	nop
    3e2e:	90                   	nop
    3e2f:	90                   	nop
    3e30:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    3e34:	80 7c 31 ff 0a       	cmpb   $0xa,-0x1(%ecx,%esi,1)
    3e39:	89 ce                	mov    %ecx,%esi
    3e3b:	0f 94 c1             	sete   %cl
    3e3e:	01 f2                	add    %esi,%edx
    3e40:	89 d5                	mov    %edx,%ebp
    3e42:	8b 54 24 24          	mov    0x24(%esp),%edx
    3e46:	88 0a                	mov    %cl,(%edx)
    3e48:	83 ec 04             	sub    $0x4,%esp
    3e4b:	50                   	push   %eax
    3e4c:	55                   	push   %ebp
    3e4d:	ff 74 24 2c          	push   0x2c(%esp)
    3e51:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    3e55:	ff 50 0c             	call   *0xc(%eax)
    3e58:	83 c4 10             	add    $0x10,%esp
    3e5b:	89 fa                	mov    %edi,%edx
    3e5d:	84 c0                	test   %al,%al
    3e5f:	8b 44 24 10          	mov    0x10(%esp),%eax
    3e63:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3e67:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    3e6b:	0f 85 d0 01 00 00    	jne    4041 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x261>
    3e71:	f6 c1 01             	test   $0x1,%cl
    3e74:	0f 85 c3 01 00 00    	jne    403d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x25d>
    3e7a:	39 c5                	cmp    %eax,%ebp
    3e7c:	73 12                	jae    3e90 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xb0>
    3e7e:	89 c7                	mov    %eax,%edi
    3e80:	e9 5b 01 00 00       	jmp    3fe0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    3e85:	90                   	nop
    3e86:	90                   	nop
    3e87:	90                   	nop
    3e88:	90                   	nop
    3e89:	90                   	nop
    3e8a:	90                   	nop
    3e8b:	90                   	nop
    3e8c:	90                   	nop
    3e8d:	90                   	nop
    3e8e:	90                   	nop
    3e8f:	90                   	nop
    3e90:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3e94:	eb 18                	jmp    3eae <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xce>
    3e96:	90                   	nop
    3e97:	90                   	nop
    3e98:	90                   	nop
    3e99:	90                   	nop
    3e9a:	90                   	nop
    3e9b:	90                   	nop
    3e9c:	90                   	nop
    3e9d:	90                   	nop
    3e9e:	90                   	nop
    3e9f:	90                   	nop
    3ea0:	89 f8                	mov    %edi,%eax
    3ea2:	39 ef                	cmp    %ebp,%edi
    3ea4:	8b 74 24 44          	mov    0x44(%esp),%esi
    3ea8:	0f 87 32 01 00 00    	ja     3fe0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    3eae:	89 e9                	mov    %ebp,%ecx
    3eb0:	29 c1                	sub    %eax,%ecx
    3eb2:	89 c7                	mov    %eax,%edi
    3eb4:	01 f0                	add    %esi,%eax
    3eb6:	83 f9 07             	cmp    $0x7,%ecx
    3eb9:	89 7c 24 10          	mov    %edi,0x10(%esp)
    3ebd:	77 31                	ja     3ef0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x110>
    3ebf:	39 fd                	cmp    %edi,%ebp
    3ec1:	0f 84 09 01 00 00    	je     3fd0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f0>
    3ec7:	31 f6                	xor    %esi,%esi
    3ec9:	90                   	nop
    3eca:	90                   	nop
    3ecb:	90                   	nop
    3ecc:	90                   	nop
    3ecd:	90                   	nop
    3ece:	90                   	nop
    3ecf:	90                   	nop
    3ed0:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    3ed4:	0f 84 c9 00 00 00    	je     3fa3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1c3>
    3eda:	46                   	inc    %esi
    3edb:	39 f1                	cmp    %esi,%ecx
    3edd:	75 f1                	jne    3ed0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xf0>
    3edf:	e9 ec 00 00 00       	jmp    3fd0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f0>
    3ee4:	90                   	nop
    3ee5:	90                   	nop
    3ee6:	90                   	nop
    3ee7:	90                   	nop
    3ee8:	90                   	nop
    3ee9:	90                   	nop
    3eea:	90                   	nop
    3eeb:	90                   	nop
    3eec:	90                   	nop
    3eed:	90                   	nop
    3eee:	90                   	nop
    3eef:	90                   	nop
    3ef0:	8d 78 03             	lea    0x3(%eax),%edi
    3ef3:	83 e7 fc             	and    $0xfffffffc,%edi
    3ef6:	89 fa                	mov    %edi,%edx
    3ef8:	29 c2                	sub    %eax,%edx
    3efa:	74 20                	je     3f1c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x13c>
    3efc:	31 f6                	xor    %esi,%esi
    3efe:	90                   	nop
    3eff:	90                   	nop
    3f00:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    3f04:	0f 84 95 00 00 00    	je     3f9f <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bf>
    3f0a:	46                   	inc    %esi
    3f0b:	39 f2                	cmp    %esi,%edx
    3f0d:	75 f1                	jne    3f00 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x120>
    3f0f:	8d 71 f8             	lea    -0x8(%ecx),%esi
    3f12:	89 74 24 14          	mov    %esi,0x14(%esp)
    3f16:	39 f2                	cmp    %esi,%edx
    3f18:	76 09                	jbe    3f23 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x143>
    3f1a:	eb 51                	jmp    3f6d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    3f1c:	8d 71 f8             	lea    -0x8(%ecx),%esi
    3f1f:	89 74 24 14          	mov    %esi,0x14(%esp)
    3f23:	be 04 00 00 00       	mov    $0x4,%esi
    3f28:	01 f7                	add    %esi,%edi
    3f2a:	90                   	nop
    3f2b:	90                   	nop
    3f2c:	90                   	nop
    3f2d:	90                   	nop
    3f2e:	90                   	nop
    3f2f:	90                   	nop
    3f30:	8b 5f fc             	mov    -0x4(%edi),%ebx
    3f33:	8b 37                	mov    (%edi),%esi
    3f35:	89 dd                	mov    %ebx,%ebp
    3f37:	81 f5 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebp
    3f3d:	81 c5 01 01 01 01    	add    $0x1010101,%ebp
    3f43:	09 dd                	or     %ebx,%ebp
    3f45:	89 f3                	mov    %esi,%ebx
    3f47:	81 f3 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebx
    3f4d:	81 c3 01 01 01 01    	add    $0x1010101,%ebx
    3f53:	09 f3                	or     %esi,%ebx
    3f55:	21 eb                	and    %ebp,%ebx
    3f57:	f7 d3                	not    %ebx
    3f59:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
    3f5f:	75 0c                	jne    3f6d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    3f61:	83 c2 08             	add    $0x8,%edx
    3f64:	83 c7 08             	add    $0x8,%edi
    3f67:	3b 54 24 14          	cmp    0x14(%esp),%edx
    3f6b:	76 c3                	jbe    3f30 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x150>
    3f6d:	39 d1                	cmp    %edx,%ecx
    3f6f:	0f 84 bc 00 00 00    	je     4031 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x251>
    3f75:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    3f78:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3f7c:	89 ef                	mov    %ebp,%edi
    3f7e:	29 d7                	sub    %edx,%edi
    3f80:	2b 7c 24 10          	sub    0x10(%esp),%edi
    3f84:	31 f6                	xor    %esi,%esi
    3f86:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    3f8a:	90                   	nop
    3f8b:	90                   	nop
    3f8c:	90                   	nop
    3f8d:	90                   	nop
    3f8e:	90                   	nop
    3f8f:	90                   	nop
    3f90:	80 3c 31 0a          	cmpb   $0xa,(%ecx,%esi,1)
    3f94:	74 07                	je     3f9d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bd>
    3f96:	46                   	inc    %esi
    3f97:	39 f7                	cmp    %esi,%edi
    3f99:	75 f5                	jne    3f90 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1b0>
    3f9b:	eb 37                	jmp    3fd4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f4>
    3f9d:	01 d6                	add    %edx,%esi
    3f9f:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3fa3:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    3fa7:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
    3faa:	47                   	inc    %edi
    3fab:	01 f1                	add    %esi,%ecx
    3fad:	39 e9                	cmp    %ebp,%ecx
    3faf:	0f 83 eb fe ff ff    	jae    3ea0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    3fb5:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    3fb9:	0f 85 e1 fe ff ff    	jne    3ea0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    3fbf:	31 c9                	xor    %ecx,%ecx
    3fc1:	89 f8                	mov    %edi,%eax
    3fc3:	89 fe                	mov    %edi,%esi
    3fc5:	eb 25                	jmp    3fec <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x20c>
    3fc7:	90                   	nop
    3fc8:	90                   	nop
    3fc9:	90                   	nop
    3fca:	90                   	nop
    3fcb:	90                   	nop
    3fcc:	90                   	nop
    3fcd:	90                   	nop
    3fce:	90                   	nop
    3fcf:	90                   	nop
    3fd0:	89 ef                	mov    %ebp,%edi
    3fd2:	eb 0c                	jmp    3fe0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    3fd4:	89 ef                	mov    %ebp,%edi
    3fd6:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3fda:	90                   	nop
    3fdb:	90                   	nop
    3fdc:	90                   	nop
    3fdd:	90                   	nop
    3fde:	90                   	nop
    3fdf:	90                   	nop
    3fe0:	89 f8                	mov    %edi,%eax
    3fe2:	b1 01                	mov    $0x1,%cl
    3fe4:	89 d7                	mov    %edx,%edi
    3fe6:	89 ee                	mov    %ebp,%esi
    3fe8:	39 d5                	cmp    %edx,%ebp
    3fea:	74 51                	je     403d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x25d>
    3fec:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3ff0:	89 44 24 10          	mov    %eax,0x10(%esp)
    3ff4:	8b 44 24 24          	mov    0x24(%esp),%eax
    3ff8:	80 38 00             	cmpb   $0x0,(%eax)
    3ffb:	74 1f                	je     401c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x23c>
    3ffd:	83 ec 04             	sub    $0x4,%esp
    4000:	6a 04                	push   $0x4
    4002:	ff 74 24 30          	push   0x30(%esp)
    4006:	ff 74 24 2c          	push   0x2c(%esp)
    400a:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    400e:	89 d5                	mov    %edx,%ebp
    4010:	ff 50 0c             	call   *0xc(%eax)
    4013:	89 ea                	mov    %ebp,%edx
    4015:	83 c4 10             	add    $0x10,%esp
    4018:	84 c0                	test   %al,%al
    401a:	75 25                	jne    4041 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x261>
    401c:	89 f0                	mov    %esi,%eax
    401e:	29 d0                	sub    %edx,%eax
    4020:	0f 85 0a fe ff ff    	jne    3e30 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x50>
    4026:	31 c9                	xor    %ecx,%ecx
    4028:	8b 74 24 44          	mov    0x44(%esp),%esi
    402c:	e9 0d fe ff ff       	jmp    3e3e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x5e>
    4031:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    4035:	89 ef                	mov    %ebp,%edi
    4037:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    403b:	eb 99                	jmp    3fd6 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f6>
    403d:	31 c0                	xor    %eax,%eax
    403f:	eb 02                	jmp    4043 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x263>
    4041:	b0 01                	mov    $0x1,%al
    4043:	83 c4 2c             	add    $0x2c,%esp
    4046:	5e                   	pop    %esi
    4047:	5f                   	pop    %edi
    4048:	5b                   	pop    %ebx
    4049:	5d                   	pop    %ebp
    404a:	c3                   	ret
    404b:	66 90                	xchg   %ax,%ax
    404d:	66 90                	xchg   %ax,%ax
    404f:	90                   	nop

00004050 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E>:
    4050:	55                   	push   %ebp
    4051:	53                   	push   %ebx
    4052:	57                   	push   %edi
    4053:	56                   	push   %esi
    4054:	83 ec 0c             	sub    $0xc,%esp
    4057:	e8 00 00 00 00       	call   405c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0xc>
    405c:	5b                   	pop    %ebx
    405d:	81 c3 98 5f 00 00    	add    $0x5f98,%ebx
    4063:	8b 44 24 20          	mov    0x20(%esp),%eax
    4067:	8b 68 08             	mov    0x8(%eax),%ebp
    406a:	8b 38                	mov    (%eax),%edi
    406c:	8b 70 04             	mov    0x4(%eax),%esi
    406f:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
    4073:	74 1e                	je     4093 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    4075:	83 ec 04             	sub    $0x4,%esp
    4078:	8d 83 aa d6 ff ff    	lea    -0x2956(%ebx),%eax
    407e:	6a 04                	push   $0x4
    4080:	50                   	push   %eax
    4081:	57                   	push   %edi
    4082:	ff 56 0c             	call   *0xc(%esi)
    4085:	83 c4 10             	add    $0x10,%esp
    4088:	84 c0                	test   %al,%al
    408a:	74 07                	je     4093 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    408c:	b0 01                	mov    $0x1,%al
    408e:	83 c4 0c             	add    $0xc,%esp
    4091:	eb 16                	jmp    40a9 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x59>
    4093:	8b 44 24 24          	mov    0x24(%esp),%eax
    4097:	83 f8 0a             	cmp    $0xa,%eax
    409a:	0f 94 45 00          	sete   0x0(%ebp)
    409e:	83 ec 08             	sub    $0x8,%esp
    40a1:	50                   	push   %eax
    40a2:	57                   	push   %edi
    40a3:	ff 56 10             	call   *0x10(%esi)
    40a6:	83 c4 1c             	add    $0x1c,%esp
    40a9:	5e                   	pop    %esi
    40aa:	5f                   	pop    %edi
    40ab:	5b                   	pop    %ebx
    40ac:	5d                   	pop    %ebp
    40ad:	c3                   	ret
    40ae:	66 90                	xchg   %ax,%ax

000040b0 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE>:
    40b0:	53                   	push   %ebx
    40b1:	83 ec 08             	sub    $0x8,%esp
    40b4:	e8 00 00 00 00       	call   40b9 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x9>
    40b9:	5b                   	pop    %ebx
    40ba:	81 c3 3b 5f 00 00    	add    $0x5f3b,%ebx
    40c0:	8b 44 24 14          	mov    0x14(%esp),%eax
    40c4:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    40c8:	8b 50 04             	mov    0x4(%eax),%edx
    40cb:	83 fa 01             	cmp    $0x1,%edx
    40ce:	74 02                	je     40d2 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x22>
    40d0:	85 d2                	test   %edx,%edx
    40d2:	89 04 24             	mov    %eax,(%esp)
    40d5:	8d 93 88 fd ff ff    	lea    -0x278(%ebx),%edx
    40db:	e8 90 f6 ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    40e0:	83 c4 08             	add    $0x8,%esp
    40e3:	5b                   	pop    %ebx
    40e4:	c3                   	ret
    40e5:	66 90                	xchg   %ax,%ax
    40e7:	66 90                	xchg   %ax,%ax
    40e9:	66 90                	xchg   %ax,%ax
    40eb:	66 90                	xchg   %ax,%ax
    40ed:	66 90                	xchg   %ax,%ax
    40ef:	90                   	nop

000040f0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17hb093d7c5ea18d275E>:
    40f0:	53                   	push   %ebx
    40f1:	57                   	push   %edi
    40f2:	56                   	push   %esi
    40f3:	81 ec 80 00 00 00    	sub    $0x80,%esp
    40f9:	e8 00 00 00 00       	call   40fe <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17hb093d7c5ea18d275E+0xe>
    40fe:	5b                   	pop    %ebx
    40ff:	81 c3 f6 5e 00 00    	add    $0x5ef6,%ebx
    4105:	8b 8c 24 94 00 00 00 	mov    0x94(%esp),%ecx
    410c:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    4113:	0f b6 10             	movzbl (%eax),%edx
    4116:	be 81 00 00 00       	mov    $0x81,%esi
    411b:	eb 19                	jmp    4136 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17hb093d7c5ea18d275E+0x46>
    411d:	90                   	nop
    411e:	90                   	nop
    411f:	90                   	nop
    4120:	80 c4 57             	add    $0x57,%ah
    4123:	88 d0                	mov    %dl,%al
    4125:	c0 e8 04             	shr    $0x4,%al
    4128:	88 64 3c fe          	mov    %ah,-0x2(%esp,%edi,1)
    412c:	8d 77 ff             	lea    -0x1(%edi),%esi
    412f:	80 fa 0f             	cmp    $0xf,%dl
    4132:	89 c2                	mov    %eax,%edx
    4134:	76 11                	jbe    4147 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17hb093d7c5ea18d275E+0x57>
    4136:	89 f7                	mov    %esi,%edi
    4138:	88 d4                	mov    %dl,%ah
    413a:	80 e4 0f             	and    $0xf,%ah
    413d:	80 fc 0a             	cmp    $0xa,%ah
    4140:	73 de                	jae    4120 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17hb093d7c5ea18d275E+0x30>
    4142:	80 cc 30             	or     $0x30,%ah
    4145:	eb dc                	jmp    4123 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$u8$GT$3fmt17hb093d7c5ea18d275E+0x33>
    4147:	83 c7 fe             	add    $0xfffffffe,%edi
    414a:	8d 04 3c             	lea    (%esp,%edi,1),%eax
    414d:	bf 81 00 00 00       	mov    $0x81,%edi
    4152:	29 f7                	sub    %esi,%edi
    4154:	8d b3 10 dc ff ff    	lea    -0x23f0(%ebx),%esi
    415a:	ba 01 00 00 00       	mov    $0x1,%edx
    415f:	57                   	push   %edi
    4160:	50                   	push   %eax
    4161:	6a 02                	push   $0x2
    4163:	56                   	push   %esi
    4164:	e8 27 ed ff ff       	call   2e90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    4169:	81 c4 90 00 00 00    	add    $0x90,%esp
    416f:	5e                   	pop    %esi
    4170:	5f                   	pop    %edi
    4171:	5b                   	pop    %ebx
    4172:	c3                   	ret
    4173:	66 90                	xchg   %ax,%ax
    4175:	66 90                	xchg   %ax,%ax
    4177:	66 90                	xchg   %ax,%ax
    4179:	66 90                	xchg   %ax,%ax
    417b:	66 90                	xchg   %ax,%ax
    417d:	66 90                	xchg   %ax,%ax
    417f:	90                   	nop

00004180 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E>:
    4180:	53                   	push   %ebx
    4181:	57                   	push   %edi
    4182:	56                   	push   %esi
    4183:	81 ec 80 00 00 00    	sub    $0x80,%esp
    4189:	e8 00 00 00 00       	call   418e <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0xe>
    418e:	5b                   	pop    %ebx
    418f:	81 c3 66 5e 00 00    	add    $0x5e66,%ebx
    4195:	8b 8c 24 94 00 00 00 	mov    0x94(%esp),%ecx
    419c:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    41a3:	8b 00                	mov    (%eax),%eax
    41a5:	ba 81 00 00 00       	mov    $0x81,%edx
    41aa:	eb 1a                	jmp    41c6 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x46>
    41ac:	90                   	nop
    41ad:	90                   	nop
    41ae:	90                   	nop
    41af:	90                   	nop
    41b0:	80 c2 37             	add    $0x37,%dl
    41b3:	89 c7                	mov    %eax,%edi
    41b5:	c1 ef 04             	shr    $0x4,%edi
    41b8:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    41bc:	8d 56 ff             	lea    -0x1(%esi),%edx
    41bf:	83 f8 0f             	cmp    $0xf,%eax
    41c2:	89 f8                	mov    %edi,%eax
    41c4:	76 11                	jbe    41d7 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x57>
    41c6:	89 d6                	mov    %edx,%esi
    41c8:	89 c2                	mov    %eax,%edx
    41ca:	80 e2 0f             	and    $0xf,%dl
    41cd:	80 fa 0a             	cmp    $0xa,%dl
    41d0:	73 de                	jae    41b0 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x30>
    41d2:	80 ca 30             	or     $0x30,%dl
    41d5:	eb dc                	jmp    41b3 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x33>
    41d7:	83 c6 fe             	add    $0xfffffffe,%esi
    41da:	8d 04 34             	lea    (%esp,%esi,1),%eax
    41dd:	be 81 00 00 00       	mov    $0x81,%esi
    41e2:	29 d6                	sub    %edx,%esi
    41e4:	8d bb 10 dc ff ff    	lea    -0x23f0(%ebx),%edi
    41ea:	ba 01 00 00 00       	mov    $0x1,%edx
    41ef:	56                   	push   %esi
    41f0:	50                   	push   %eax
    41f1:	6a 02                	push   $0x2
    41f3:	57                   	push   %edi
    41f4:	e8 97 ec ff ff       	call   2e90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    41f9:	81 c4 90 00 00 00    	add    $0x90,%esp
    41ff:	5e                   	pop    %esi
    4200:	5f                   	pop    %edi
    4201:	5b                   	pop    %ebx
    4202:	c3                   	ret
    4203:	66 90                	xchg   %ax,%ax
    4205:	66 90                	xchg   %ax,%ax
    4207:	66 90                	xchg   %ax,%ax
    4209:	66 90                	xchg   %ax,%ax
    420b:	66 90                	xchg   %ax,%ax
    420d:	66 90                	xchg   %ax,%ax
    420f:	90                   	nop

00004210 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h66eca3aabc4e6005E>:
    4210:	53                   	push   %ebx
    4211:	56                   	push   %esi
    4212:	50                   	push   %eax
    4213:	e8 00 00 00 00       	call   4218 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h66eca3aabc4e6005E+0x8>
    4218:	5b                   	pop    %ebx
    4219:	81 c3 dc 5d 00 00    	add    $0x5ddc,%ebx
    421f:	8b 44 24 14          	mov    0x14(%esp),%eax
    4223:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4227:	8b 11                	mov    (%ecx),%edx
    4229:	89 d6                	mov    %edx,%esi
    422b:	c1 fe 1f             	sar    $0x1f,%esi
    422e:	89 d1                	mov    %edx,%ecx
    4230:	31 f1                	xor    %esi,%ecx
    4232:	29 f1                	sub    %esi,%ecx
    4234:	89 04 24             	mov    %eax,(%esp)
    4237:	f7 d2                	not    %edx
    4239:	c1 ea 1f             	shr    $0x1f,%edx
    423c:	e8 7f f7 ff ff       	call   39c0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>
    4241:	83 c4 04             	add    $0x4,%esp
    4244:	5e                   	pop    %esi
    4245:	5b                   	pop    %ebx
    4246:	c3                   	ret
    4247:	66 90                	xchg   %ax,%ax
    4249:	66 90                	xchg   %ax,%ax
    424b:	66 90                	xchg   %ax,%ax
    424d:	66 90                	xchg   %ax,%ax
    424f:	90                   	nop

00004250 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE>:
    4250:	55                   	push   %ebp
    4251:	53                   	push   %ebx
    4252:	57                   	push   %edi
    4253:	56                   	push   %esi
    4254:	83 ec 08             	sub    $0x8,%esp
    4257:	e8 00 00 00 00       	call   425c <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xc>
    425c:	5f                   	pop    %edi
    425d:	81 c7 98 5d 00 00    	add    $0x5d98,%edi
    4263:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    4266:	83 c0 03             	add    $0x3,%eax
    4269:	83 e0 fc             	and    $0xfffffffc,%eax
    426c:	8b 18                	mov    (%eax),%ebx
    426e:	39 c3                	cmp    %eax,%ebx
    4270:	76 04                	jbe    4276 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x26>
    4272:	8b 0b                	mov    (%ebx),%ecx
    4274:	eb 04                	jmp    427a <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x2a>
    4276:	89 d9                	mov    %ebx,%ecx
    4278:	89 c3                	mov    %eax,%ebx
    427a:	89 ce                	mov    %ecx,%esi
    427c:	83 e6 fc             	and    $0xfffffffc,%esi
    427f:	8b 46 fc             	mov    -0x4(%esi),%eax
    4282:	a8 01                	test   $0x1,%al
    4284:	75 12                	jne    4298 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x48>
    4286:	29 c6                	sub    %eax,%esi
    4288:	83 f8 40             	cmp    $0x40,%eax
    428b:	89 0c 24             	mov    %ecx,(%esp)
    428e:	73 1b                	jae    42ab <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x5b>
    4290:	83 c0 f4             	add    $0xfffffff4,%eax
    4293:	c1 e8 02             	shr    $0x2,%eax
    4296:	eb 3f                	jmp    42d7 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x87>
    4298:	83 c0 02             	add    $0x2,%eax
    429b:	89 46 fc             	mov    %eax,-0x4(%esi)
    429e:	8d 53 04             	lea    0x4(%ebx),%edx
    42a1:	f6 c1 02             	test   $0x2,%cl
    42a4:	74 56                	je     42fc <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xac>
    42a6:	e9 90 00 00 00       	jmp    433b <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xeb>
    42ab:	3d 80 00 00 00       	cmp    $0x80,%eax
    42b0:	73 08                	jae    42ba <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x6a>
    42b2:	c1 e8 03             	shr    $0x3,%eax
    42b5:	83 c0 05             	add    $0x5,%eax
    42b8:	eb 1d                	jmp    42d7 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x87>
    42ba:	0f bd d0             	bsr    %eax,%edx
    42bd:	83 f2 1f             	xor    $0x1f,%edx
    42c0:	b1 1e                	mov    $0x1e,%cl
    42c2:	28 d1                	sub    %dl,%cl
    42c4:	d3 e8                	shr    %cl,%eax
    42c6:	01 d2                	add    %edx,%edx
    42c8:	29 d0                	sub    %edx,%eax
    42ca:	83 c0 43             	add    $0x43,%eax
    42cd:	83 f8 3f             	cmp    $0x3f,%eax
    42d0:	72 05                	jb     42d7 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x87>
    42d2:	b8 3f 00 00 00       	mov    $0x3f,%eax
    42d7:	8b 0e                	mov    (%esi),%ecx
    42d9:	8b 56 04             	mov    0x4(%esi),%edx
    42dc:	89 0a                	mov    %ecx,(%edx)
    42de:	85 c9                	test   %ecx,%ecx
    42e0:	74 03                	je     42e5 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x95>
    42e2:	89 51 04             	mov    %edx,0x4(%ecx)
    42e5:	8b 8f 20 00 00 00    	mov    0x20(%edi),%ecx
    42eb:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
    42ef:	74 23                	je     4314 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xc4>
    42f1:	8b 0c 24             	mov    (%esp),%ecx
    42f4:	8d 53 04             	lea    0x4(%ebx),%edx
    42f7:	f6 c1 02             	test   $0x2,%cl
    42fa:	75 3f                	jne    433b <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xeb>
    42fc:	89 d3                	mov    %edx,%ebx
    42fe:	29 f3                	sub    %esi,%ebx
    4300:	83 fb 40             	cmp    $0x40,%ebx
    4303:	0f 83 c3 00 00 00    	jae    43cc <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x17c>
    4309:	8d 43 f4             	lea    -0xc(%ebx),%eax
    430c:	c1 e8 02             	shr    $0x2,%eax
    430f:	e9 ed 00 00 00       	jmp    4401 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1b1>
    4314:	31 d2                	xor    %edx,%edx
    4316:	83 f8 20             	cmp    $0x20,%eax
    4319:	0f 93 c2             	setae  %dl
    431c:	89 fd                	mov    %edi,%ebp
    431e:	bf 01 00 00 00       	mov    $0x1,%edi
    4323:	89 c1                	mov    %eax,%ecx
    4325:	d3 e7                	shl    %cl,%edi
    4327:	31 bc 95 18 00 00 00 	xor    %edi,0x18(%ebp,%edx,4)
    432e:	89 ef                	mov    %ebp,%edi
    4330:	8b 0c 24             	mov    (%esp),%ecx
    4333:	8d 53 04             	lea    0x4(%ebx),%edx
    4336:	f6 c1 02             	test   $0x2,%cl
    4339:	74 c1                	je     42fc <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xac>
    433b:	8b 6b 0c             	mov    0xc(%ebx),%ebp
    433e:	83 fd 40             	cmp    $0x40,%ebp
    4341:	89 54 24 04          	mov    %edx,0x4(%esp)
    4345:	73 08                	jae    434f <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xff>
    4347:	8d 45 f4             	lea    -0xc(%ebp),%eax
    434a:	c1 e8 02             	shr    $0x2,%eax
    434d:	eb 37                	jmp    4386 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x136>
    434f:	81 fd 80 00 00 00    	cmp    $0x80,%ebp
    4355:	73 0a                	jae    4361 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x111>
    4357:	89 e8                	mov    %ebp,%eax
    4359:	c1 e8 03             	shr    $0x3,%eax
    435c:	83 c0 05             	add    $0x5,%eax
    435f:	eb 25                	jmp    4386 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x136>
    4361:	0f bd c5             	bsr    %ebp,%eax
    4364:	83 f0 1f             	xor    $0x1f,%eax
    4367:	89 04 24             	mov    %eax,(%esp)
    436a:	b1 1e                	mov    $0x1e,%cl
    436c:	28 c1                	sub    %al,%cl
    436e:	89 e8                	mov    %ebp,%eax
    4370:	d3 e8                	shr    %cl,%eax
    4372:	8b 0c 24             	mov    (%esp),%ecx
    4375:	01 c9                	add    %ecx,%ecx
    4377:	29 c8                	sub    %ecx,%eax
    4379:	83 c0 43             	add    $0x43,%eax
    437c:	83 f8 3f             	cmp    $0x3f,%eax
    437f:	72 05                	jb     4386 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x136>
    4381:	b8 3f 00 00 00       	mov    $0x3f,%eax
    4386:	8b 4b 04             	mov    0x4(%ebx),%ecx
    4389:	8b 53 08             	mov    0x8(%ebx),%edx
    438c:	89 0a                	mov    %ecx,(%edx)
    438e:	85 c9                	test   %ecx,%ecx
    4390:	74 03                	je     4395 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x145>
    4392:	89 51 04             	mov    %edx,0x4(%ecx)
    4395:	8b 8f 20 00 00 00    	mov    0x20(%edi),%ecx
    439b:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
    439f:	75 18                	jne    43b9 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x169>
    43a1:	31 d2                	xor    %edx,%edx
    43a3:	83 f8 20             	cmp    $0x20,%eax
    43a6:	0f 93 c2             	setae  %dl
    43a9:	bb 01 00 00 00       	mov    $0x1,%ebx
    43ae:	89 c1                	mov    %eax,%ecx
    43b0:	d3 e3                	shl    %cl,%ebx
    43b2:	31 9c 97 18 00 00 00 	xor    %ebx,0x18(%edi,%edx,4)
    43b9:	8b 54 24 04          	mov    0x4(%esp),%edx
    43bd:	01 ea                	add    %ebp,%edx
    43bf:	89 d3                	mov    %edx,%ebx
    43c1:	29 f3                	sub    %esi,%ebx
    43c3:	83 fb 40             	cmp    $0x40,%ebx
    43c6:	0f 82 3d ff ff ff    	jb     4309 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xb9>
    43cc:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
    43d2:	73 0a                	jae    43de <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x18e>
    43d4:	89 d8                	mov    %ebx,%eax
    43d6:	c1 e8 03             	shr    $0x3,%eax
    43d9:	83 c0 05             	add    $0x5,%eax
    43dc:	eb 23                	jmp    4401 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1b1>
    43de:	89 d5                	mov    %edx,%ebp
    43e0:	0f bd d3             	bsr    %ebx,%edx
    43e3:	83 f2 1f             	xor    $0x1f,%edx
    43e6:	b1 1e                	mov    $0x1e,%cl
    43e8:	28 d1                	sub    %dl,%cl
    43ea:	89 d8                	mov    %ebx,%eax
    43ec:	d3 e8                	shr    %cl,%eax
    43ee:	01 d2                	add    %edx,%edx
    43f0:	29 d0                	sub    %edx,%eax
    43f2:	83 c0 43             	add    $0x43,%eax
    43f5:	83 f8 3f             	cmp    $0x3f,%eax
    43f8:	72 05                	jb     43ff <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1af>
    43fa:	b8 3f 00 00 00       	mov    $0x3f,%eax
    43ff:	89 ea                	mov    %ebp,%edx
    4401:	8b 8f 20 00 00 00    	mov    0x20(%edi),%ecx
    4407:	8d 2c 81             	lea    (%ecx,%eax,4),%ebp
    440a:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    440d:	85 c9                	test   %ecx,%ecx
    440f:	74 0d                	je     441e <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1ce>
    4411:	89 0e                	mov    %ecx,(%esi)
    4413:	89 6e 04             	mov    %ebp,0x4(%esi)
    4416:	89 75 00             	mov    %esi,0x0(%ebp)
    4419:	89 71 04             	mov    %esi,0x4(%ecx)
    441c:	eb 32                	jmp    4450 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x200>
    441e:	89 54 24 04          	mov    %edx,0x4(%esp)
    4422:	31 d2                	xor    %edx,%edx
    4424:	83 f8 20             	cmp    $0x20,%eax
    4427:	0f 93 c2             	setae  %dl
    442a:	89 3c 24             	mov    %edi,(%esp)
    442d:	bf 01 00 00 00       	mov    $0x1,%edi
    4432:	89 c1                	mov    %eax,%ecx
    4434:	d3 e7                	shl    %cl,%edi
    4436:	8b 04 24             	mov    (%esp),%eax
    4439:	31 bc 90 18 00 00 00 	xor    %edi,0x18(%eax,%edx,4)
    4440:	8b 54 24 04          	mov    0x4(%esp),%edx
    4444:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    444a:	89 6e 04             	mov    %ebp,0x4(%esi)
    444d:	89 75 00             	mov    %esi,0x0(%ebp)
    4450:	89 5e 08             	mov    %ebx,0x8(%esi)
    4453:	89 5a fc             	mov    %ebx,-0x4(%edx)
    4456:	83 c4 08             	add    $0x8,%esp
    4459:	5e                   	pop    %esi
    445a:	5f                   	pop    %edi
    445b:	5b                   	pop    %ebx
    445c:	5d                   	pop    %ebp
    445d:	c3                   	ret
    445e:	66 90                	xchg   %ax,%ax

00004460 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE>:
    4460:	53                   	push   %ebx
    4461:	57                   	push   %edi
    4462:	56                   	push   %esi
    4463:	e8 00 00 00 00       	call   4468 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x8>
    4468:	5b                   	pop    %ebx
    4469:	81 c3 8c 5b 00 00    	add    $0x5b8c,%ebx
    446f:	8b 74 24 10          	mov    0x10(%esp),%esi
    4473:	8b 44 24 14          	mov    0x14(%esp),%eax
    4477:	8b 10                	mov    (%eax),%edx
    4479:	85 d2                	test   %edx,%edx
    447b:	74 40                	je     44bd <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x5d>
    447d:	8b 78 04             	mov    0x4(%eax),%edi
    4480:	b1 01                	mov    $0x1,%cl
    4482:	90                   	nop
    4483:	90                   	nop
    4484:	90                   	nop
    4485:	90                   	nop
    4486:	90                   	nop
    4487:	90                   	nop
    4488:	90                   	nop
    4489:	90                   	nop
    448a:	90                   	nop
    448b:	90                   	nop
    448c:	90                   	nop
    448d:	90                   	nop
    448e:	90                   	nop
    448f:	90                   	nop
    4490:	31 c0                	xor    %eax,%eax
    4492:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    4499:	00 
    449a:	75 06                	jne    44a2 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x42>
    449c:	eb 11                	jmp    44af <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x4f>
    449e:	90                   	nop
    449f:	90                   	nop
    44a0:	f3 90                	pause
    44a2:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    44a9:	84 c0                	test   %al,%al
    44ab:	75 f3                	jne    44a0 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x40>
    44ad:	eb e1                	jmp    4490 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x30>
    44af:	89 f9                	mov    %edi,%ecx
    44b1:	e8 9a fd ff ff       	call   4250 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE>
    44b6:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    44bd:	8b 0e                	mov    (%esi),%ecx
    44bf:	e8 3c 26 00 00       	call   6b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    44c4:	b0 01                	mov    $0x1,%al
    44c6:	5e                   	pop    %esi
    44c7:	5f                   	pop    %edi
    44c8:	5b                   	pop    %ebx
    44c9:	c3                   	ret
    44ca:	66 90                	xchg   %ax,%ax
    44cc:	66 90                	xchg   %ax,%ax
    44ce:	66 90                	xchg   %ax,%ax

000044d0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96>:
    44d0:	53                   	push   %ebx
    44d1:	57                   	push   %edi
    44d2:	56                   	push   %esi
    44d3:	81 ec 80 00 00 00    	sub    $0x80,%esp
    44d9:	e8 00 00 00 00       	call   44de <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0xe>
    44de:	5b                   	pop    %ebx
    44df:	81 c3 16 5b 00 00    	add    $0x5b16,%ebx
    44e5:	8b 8c 24 94 00 00 00 	mov    0x94(%esp),%ecx
    44ec:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    44f3:	8b 51 08             	mov    0x8(%ecx),%edx
    44f6:	f7 c2 00 00 00 02    	test   $0x2000000,%edx
    44fc:	75 16                	jne    4514 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x44>
    44fe:	f7 c2 00 00 00 04    	test   $0x4000000,%edx
    4504:	75 41                	jne    4547 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x77>
    4506:	81 c4 80 00 00 00    	add    $0x80,%esp
    450c:	5e                   	pop    %esi
    450d:	5f                   	pop    %edi
    450e:	5b                   	pop    %ebx
    450f:	e9 6c e8 ff ff       	jmp    2d80 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>
    4514:	8b 00                	mov    (%eax),%eax
    4516:	ba 81 00 00 00       	mov    $0x81,%edx
    451b:	eb 19                	jmp    4536 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x66>
    451d:	90                   	nop
    451e:	90                   	nop
    451f:	90                   	nop
    4520:	80 c2 57             	add    $0x57,%dl
    4523:	89 c7                	mov    %eax,%edi
    4525:	c1 ef 04             	shr    $0x4,%edi
    4528:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    452c:	8d 56 ff             	lea    -0x1(%esi),%edx
    452f:	83 f8 0f             	cmp    $0xf,%eax
    4532:	89 f8                	mov    %edi,%eax
    4534:	76 41                	jbe    4577 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0xa7>
    4536:	89 d6                	mov    %edx,%esi
    4538:	89 c2                	mov    %eax,%edx
    453a:	80 e2 0f             	and    $0xf,%dl
    453d:	80 fa 0a             	cmp    $0xa,%dl
    4540:	73 de                	jae    4520 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x50>
    4542:	80 ca 30             	or     $0x30,%dl
    4545:	eb dc                	jmp    4523 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x53>
    4547:	8b 00                	mov    (%eax),%eax
    4549:	ba 81 00 00 00       	mov    $0x81,%edx
    454e:	eb 16                	jmp    4566 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x96>
    4550:	80 c2 37             	add    $0x37,%dl
    4553:	89 c7                	mov    %eax,%edi
    4555:	c1 ef 04             	shr    $0x4,%edi
    4558:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    455c:	8d 56 ff             	lea    -0x1(%esi),%edx
    455f:	83 f8 0f             	cmp    $0xf,%eax
    4562:	89 f8                	mov    %edi,%eax
    4564:	76 11                	jbe    4577 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0xa7>
    4566:	89 d6                	mov    %edx,%esi
    4568:	89 c2                	mov    %eax,%edx
    456a:	80 e2 0f             	and    $0xf,%dl
    456d:	80 fa 0a             	cmp    $0xa,%dl
    4570:	73 de                	jae    4550 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x80>
    4572:	80 ca 30             	or     $0x30,%dl
    4575:	eb dc                	jmp    4553 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x83>
    4577:	83 c6 fe             	add    $0xfffffffe,%esi
    457a:	8d 04 34             	lea    (%esp,%esi,1),%eax
    457d:	be 81 00 00 00       	mov    $0x81,%esi
    4582:	29 d6                	sub    %edx,%esi
    4584:	8d bb 10 dc ff ff    	lea    -0x23f0(%ebx),%edi
    458a:	ba 01 00 00 00       	mov    $0x1,%edx
    458f:	56                   	push   %esi
    4590:	50                   	push   %eax
    4591:	6a 02                	push   $0x2
    4593:	57                   	push   %edi
    4594:	e8 f7 e8 ff ff       	call   2e90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    4599:	83 c4 10             	add    $0x10,%esp
    459c:	81 c4 80 00 00 00    	add    $0x80,%esp
    45a2:	5e                   	pop    %esi
    45a3:	5f                   	pop    %edi
    45a4:	5b                   	pop    %ebx
    45a5:	c3                   	ret
    45a6:	66 90                	xchg   %ax,%ax
    45a8:	66 90                	xchg   %ax,%ax
    45aa:	66 90                	xchg   %ax,%ax
    45ac:	66 90                	xchg   %ax,%ax
    45ae:	66 90                	xchg   %ax,%ax

000045b0 <_ZN4core3ptr56drop_in_place$LT$kernel_lib..logging..BufferedLogger$GT$17hb439f433930cd200E>:
    45b0:	c3                   	ret
    45b1:	66 90                	xchg   %ax,%ax
    45b3:	66 90                	xchg   %ax,%ax
    45b5:	66 90                	xchg   %ax,%ax
    45b7:	66 90                	xchg   %ax,%ax
    45b9:	66 90                	xchg   %ax,%ax
    45bb:	66 90                	xchg   %ax,%ax
    45bd:	66 90                	xchg   %ax,%ax
    45bf:	90                   	nop

000045c0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$7enabled17h50b3bf6b8eccac4aE>:
    45c0:	b0 01                	mov    $0x1,%al
    45c2:	c3                   	ret
    45c3:	66 90                	xchg   %ax,%ax
    45c5:	66 90                	xchg   %ax,%ax
    45c7:	66 90                	xchg   %ax,%ax
    45c9:	66 90                	xchg   %ax,%ax
    45cb:	66 90                	xchg   %ax,%ax
    45cd:	66 90                	xchg   %ax,%ax
    45cf:	90                   	nop

000045d0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h291c1b72f6b70707E>:
    45d0:	53                   	push   %ebx
    45d1:	81 ec 48 01 00 00    	sub    $0x148,%esp
    45d7:	e8 00 00 00 00       	call   45dc <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h291c1b72f6b70707E+0xc>
    45dc:	5b                   	pop    %ebx
    45dd:	81 c3 18 5a 00 00    	add    $0x5a18,%ebx
    45e3:	8b 84 24 54 01 00 00 	mov    0x154(%esp),%eax
    45ea:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    45f1:	00 
    45f2:	8b 48 20             	mov    0x20(%eax),%ecx
    45f5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    45f9:	8b 48 24             	mov    0x24(%eax),%ecx
    45fc:	8b 50 28             	mov    0x28(%eax),%edx
    45ff:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    4603:	89 54 24 28          	mov    %edx,0x28(%esp)
    4607:	83 c0 2c             	add    $0x2c,%eax
    460a:	89 44 24 08          	mov    %eax,0x8(%esp)
    460e:	8d 44 24 04          	lea    0x4(%esp),%eax
    4612:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4616:	8d 83 ec cd ff ff    	lea    -0x3214(%ebx),%eax
    461c:	89 44 24 10          	mov    %eax,0x10(%esp)
    4620:	8d 44 24 24          	lea    0x24(%esp),%eax
    4624:	89 44 24 14          	mov    %eax,0x14(%esp)
    4628:	8d 83 1c 97 ff ff    	lea    -0x68e4(%ebx),%eax
    462e:	89 44 24 18          	mov    %eax,0x18(%esp)
    4632:	8d 44 24 08          	lea    0x8(%esp),%eax
    4636:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    463a:	8d 83 bc a6 ff ff    	lea    -0x5944(%ebx),%eax
    4640:	89 44 24 20          	mov    %eax,0x20(%esp)
    4644:	8d 83 40 fe ff ff    	lea    -0x1c0(%ebx),%eax
    464a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    464e:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    4655:	00 
    4656:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
    465d:	00 
    465e:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4662:	89 44 24 34          	mov    %eax,0x34(%esp)
    4666:	c7 44 24 38 03 00 00 	movl   $0x3,0x38(%esp)
    466d:	00 
    466e:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    4672:	89 04 24             	mov    %eax,(%esp)
    4675:	8d 93 f8 fd ff ff    	lea    -0x208(%ebx),%edx
    467b:	8d 4c 24 44          	lea    0x44(%esp),%ecx
    467f:	e8 ec f0 ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    4684:	8d 44 24 48          	lea    0x48(%esp),%eax
    4688:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    468c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4690:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4694:	89 44 24 14          	mov    %eax,0x14(%esp)
    4698:	8d 54 24 0c          	lea    0xc(%esp),%edx
    469c:	b8 02 00 00 00       	mov    $0x2,%eax
    46a1:	cd 80                	int    $0x80
    46a3:	81 c4 48 01 00 00    	add    $0x148,%esp
    46a9:	5b                   	pop    %ebx
    46aa:	c3                   	ret
    46ab:	66 90                	xchg   %ax,%ax
    46ad:	66 90                	xchg   %ax,%ax
    46af:	90                   	nop

000046b0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9455cc26f8a63d55E>:
    46b0:	53                   	push   %ebx
    46b1:	56                   	push   %esi
    46b2:	50                   	push   %eax
    46b3:	e8 00 00 00 00       	call   46b8 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9455cc26f8a63d55E+0x8>
    46b8:	5b                   	pop    %ebx
    46b9:	81 c3 3c 59 00 00    	add    $0x593c,%ebx
    46bf:	8b 44 24 14          	mov    0x14(%esp),%eax
    46c3:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    46c7:	8b 31                	mov    (%ecx),%esi
    46c9:	8b 08                	mov    (%eax),%ecx
    46cb:	8b 50 04             	mov    0x4(%eax),%edx
    46ce:	89 34 24             	mov    %esi,(%esp)
    46d1:	e8 9a f0 ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    46d6:	83 c4 04             	add    $0x4,%esp
    46d9:	5e                   	pop    %esi
    46da:	5b                   	pop    %ebx
    46db:	c3                   	ret
    46dc:	66 90                	xchg   %ax,%ax
    46de:	66 90                	xchg   %ax,%ax

000046e0 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E>:
    46e0:	53                   	push   %ebx
    46e1:	57                   	push   %edi
    46e2:	56                   	push   %esi
    46e3:	e8 00 00 00 00       	call   46e8 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E+0x8>
    46e8:	5b                   	pop    %ebx
    46e9:	81 c3 0c 59 00 00    	add    $0x590c,%ebx
    46ef:	8b 44 24 18          	mov    0x18(%esp),%eax
    46f3:	8b 7c 24 10          	mov    0x10(%esp),%edi
    46f7:	8b 0f                	mov    (%edi),%ecx
    46f9:	8d 34 01             	lea    (%ecx,%eax,1),%esi
    46fc:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    4702:	0f 93 c2             	setae  %dl
    4705:	85 c0                	test   %eax,%eax
    4707:	0f 94 c6             	sete   %dh
    470a:	08 d6                	or     %dl,%dh
    470c:	75 18                	jne    4726 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E+0x46>
    470e:	01 f9                	add    %edi,%ecx
    4710:	83 c1 04             	add    $0x4,%ecx
    4713:	83 ec 04             	sub    $0x4,%esp
    4716:	50                   	push   %eax
    4717:	ff 74 24 1c          	push   0x1c(%esp)
    471b:	51                   	push   %ecx
    471c:	e8 2f 27 00 00       	call   6e50 <memcpy>
    4721:	83 c4 10             	add    $0x10,%esp
    4724:	89 37                	mov    %esi,(%edi)
    4726:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    472c:	0f 93 c0             	setae  %al
    472f:	5e                   	pop    %esi
    4730:	5f                   	pop    %edi
    4731:	5b                   	pop    %ebx
    4732:	c3                   	ret
    4733:	66 90                	xchg   %ax,%ax
    4735:	66 90                	xchg   %ax,%ax
    4737:	66 90                	xchg   %ax,%ax
    4739:	66 90                	xchg   %ax,%ax
    473b:	66 90                	xchg   %ax,%ax
    473d:	66 90                	xchg   %ax,%ax
    473f:	90                   	nop

00004740 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E>:
    4740:	53                   	push   %ebx
    4741:	57                   	push   %edi
    4742:	56                   	push   %esi
    4743:	83 ec 10             	sub    $0x10,%esp
    4746:	e8 00 00 00 00       	call   474b <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xb>
    474b:	5b                   	pop    %ebx
    474c:	81 c3 a9 58 00 00    	add    $0x58a9,%ebx
    4752:	8b 44 24 24          	mov    0x24(%esp),%eax
    4756:	8b 74 24 20          	mov    0x20(%esp),%esi
    475a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4761:	00 
    4762:	3d 80 00 00 00       	cmp    $0x80,%eax
    4767:	73 1f                	jae    4788 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x48>
    4769:	88 44 24 0c          	mov    %al,0xc(%esp)
    476d:	b8 01 00 00 00       	mov    $0x1,%eax
    4772:	8b 0e                	mov    (%esi),%ecx
    4774:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    4777:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    477d:	0f 86 b9 00 00 00    	jbe    483c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    4783:	e9 cd 00 00 00       	jmp    4855 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    4788:	89 c1                	mov    %eax,%ecx
    478a:	3d 00 08 00 00       	cmp    $0x800,%eax
    478f:	73 2d                	jae    47be <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x7e>
    4791:	c1 e9 06             	shr    $0x6,%ecx
    4794:	80 c9 c0             	or     $0xc0,%cl
    4797:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    479b:	24 3f                	and    $0x3f,%al
    479d:	0c 80                	or     $0x80,%al
    479f:	88 44 24 0d          	mov    %al,0xd(%esp)
    47a3:	b8 02 00 00 00       	mov    $0x2,%eax
    47a8:	8b 0e                	mov    (%esi),%ecx
    47aa:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    47ad:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    47b3:	0f 86 83 00 00 00    	jbe    483c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    47b9:	e9 97 00 00 00       	jmp    4855 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    47be:	3d 00 00 01 00       	cmp    $0x10000,%eax
    47c3:	73 35                	jae    47fa <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xba>
    47c5:	c1 e9 0c             	shr    $0xc,%ecx
    47c8:	80 c9 e0             	or     $0xe0,%cl
    47cb:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    47cf:	89 c1                	mov    %eax,%ecx
    47d1:	c1 e9 06             	shr    $0x6,%ecx
    47d4:	80 e1 3f             	and    $0x3f,%cl
    47d7:	80 c9 80             	or     $0x80,%cl
    47da:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    47de:	24 3f                	and    $0x3f,%al
    47e0:	0c 80                	or     $0x80,%al
    47e2:	88 44 24 0e          	mov    %al,0xe(%esp)
    47e6:	b8 03 00 00 00       	mov    $0x3,%eax
    47eb:	8b 0e                	mov    (%esi),%ecx
    47ed:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    47f0:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    47f6:	76 44                	jbe    483c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    47f8:	eb 5b                	jmp    4855 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    47fa:	c1 e9 12             	shr    $0x12,%ecx
    47fd:	80 c9 f0             	or     $0xf0,%cl
    4800:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    4804:	89 c1                	mov    %eax,%ecx
    4806:	c1 e9 0c             	shr    $0xc,%ecx
    4809:	80 e1 3f             	and    $0x3f,%cl
    480c:	80 c9 80             	or     $0x80,%cl
    480f:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    4813:	89 c1                	mov    %eax,%ecx
    4815:	c1 e9 06             	shr    $0x6,%ecx
    4818:	80 e1 3f             	and    $0x3f,%cl
    481b:	80 c9 80             	or     $0x80,%cl
    481e:	88 4c 24 0e          	mov    %cl,0xe(%esp)
    4822:	24 3f                	and    $0x3f,%al
    4824:	0c 80                	or     $0x80,%al
    4826:	88 44 24 0f          	mov    %al,0xf(%esp)
    482a:	b8 04 00 00 00       	mov    $0x4,%eax
    482f:	8b 0e                	mov    (%esi),%ecx
    4831:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    4834:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    483a:	77 19                	ja     4855 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    483c:	01 f1                	add    %esi,%ecx
    483e:	83 c1 04             	add    $0x4,%ecx
    4841:	83 ec 04             	sub    $0x4,%esp
    4844:	8d 54 24 10          	lea    0x10(%esp),%edx
    4848:	50                   	push   %eax
    4849:	52                   	push   %edx
    484a:	51                   	push   %ecx
    484b:	e8 00 26 00 00       	call   6e50 <memcpy>
    4850:	83 c4 10             	add    $0x10,%esp
    4853:	89 3e                	mov    %edi,(%esi)
    4855:	81 ff 00 01 00 00    	cmp    $0x100,%edi
    485b:	0f 93 c0             	setae  %al
    485e:	83 c4 10             	add    $0x10,%esp
    4861:	5e                   	pop    %esi
    4862:	5f                   	pop    %edi
    4863:	5b                   	pop    %ebx
    4864:	c3                   	ret
    4865:	66 90                	xchg   %ax,%ax
    4867:	66 90                	xchg   %ax,%ax
    4869:	66 90                	xchg   %ax,%ax
    486b:	66 90                	xchg   %ax,%ax
    486d:	66 90                	xchg   %ax,%ax
    486f:	90                   	nop

00004870 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE>:
    4870:	53                   	push   %ebx
    4871:	83 ec 08             	sub    $0x8,%esp
    4874:	e8 00 00 00 00       	call   4879 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE+0x9>
    4879:	5b                   	pop    %ebx
    487a:	81 c3 7b 57 00 00    	add    $0x577b,%ebx
    4880:	8b 44 24 14          	mov    0x14(%esp),%eax
    4884:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4888:	8b 50 04             	mov    0x4(%eax),%edx
    488b:	83 fa 01             	cmp    $0x1,%edx
    488e:	74 02                	je     4892 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE+0x22>
    4890:	85 d2                	test   %edx,%edx
    4892:	89 04 24             	mov    %eax,(%esp)
    4895:	8d 93 f8 fd ff ff    	lea    -0x208(%ebx),%edx
    489b:	e8 d0 ee ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    48a0:	83 c4 08             	add    $0x8,%esp
    48a3:	5b                   	pop    %ebx
    48a4:	c3                   	ret
    48a5:	66 90                	xchg   %ax,%ax
    48a7:	66 90                	xchg   %ax,%ax
    48a9:	66 90                	xchg   %ax,%ax
    48ab:	66 90                	xchg   %ax,%ax
    48ad:	66 90                	xchg   %ax,%ax
    48af:	90                   	nop

000048b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>:
    48b0:	55                   	push   %ebp
    48b1:	53                   	push   %ebx
    48b2:	57                   	push   %edi
    48b3:	56                   	push   %esi
    48b4:	83 ec 4c             	sub    $0x4c,%esp
    48b7:	e8 00 00 00 00       	call   48bc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xc>
    48bc:	5d                   	pop    %ebp
    48bd:	81 c5 38 57 00 00    	add    $0x5738,%ebp
    48c3:	bf 0c 00 00 00       	mov    $0xc,%edi
    48c8:	89 54 24 20          	mov    %edx,0x20(%esp)
    48cc:	83 fa 09             	cmp    $0x9,%edx
    48cf:	72 0a                	jb     48db <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x2b>
    48d1:	8b 44 24 20          	mov    0x20(%esp),%eax
    48d5:	8d 78 07             	lea    0x7(%eax),%edi
    48d8:	83 e7 fc             	and    $0xfffffffc,%edi
    48db:	0f bd c7             	bsr    %edi,%eax
    48de:	83 f0 1f             	xor    $0x1f,%eax
    48e1:	b1 1e                	mov    $0x1e,%cl
    48e3:	28 c1                	sub    %al,%cl
    48e5:	89 fa                	mov    %edi,%edx
    48e7:	d3 ea                	shr    %cl,%edx
    48e9:	01 c0                	add    %eax,%eax
    48eb:	29 c2                	sub    %eax,%edx
    48ed:	83 c2 43             	add    $0x43,%edx
    48f0:	83 fa 3f             	cmp    $0x3f,%edx
    48f3:	72 05                	jb     48fa <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4a>
    48f5:	ba 3f 00 00 00       	mov    $0x3f,%edx
    48fa:	89 f9                	mov    %edi,%ecx
    48fc:	83 e1 c0             	and    $0xffffffc0,%ecx
    48ff:	83 ff 40             	cmp    $0x40,%edi
    4902:	73 06                	jae    490a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5a>
    4904:	8d 57 f4             	lea    -0xc(%edi),%edx
    4907:	c1 ea 02             	shr    $0x2,%edx
    490a:	83 fa 20             	cmp    $0x20,%edx
    490d:	0f 92 c0             	setb   %al
    4910:	83 f9 40             	cmp    $0x40,%ecx
    4913:	0f 94 c1             	sete   %cl
    4916:	74 06                	je     491e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6e>
    4918:	89 54 24 18          	mov    %edx,0x18(%esp)
    491c:	eb 0c                	jmp    492a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x7a>
    491e:	89 fe                	mov    %edi,%esi
    4920:	c1 ee 03             	shr    $0x3,%esi
    4923:	83 c6 05             	add    $0x5,%esi
    4926:	89 74 24 18          	mov    %esi,0x18(%esp)
    492a:	89 d6                	mov    %edx,%esi
    492c:	83 e6 1f             	and    $0x1f,%esi
    492f:	89 74 24 30          	mov    %esi,0x30(%esp)
    4933:	08 c1                	or     %al,%cl
    4935:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    4939:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    493d:	88 4c 24 0b          	mov    %cl,0xb(%esp)
    4941:	84 c9                	test   %cl,%cl
    4943:	74 3b                	je     4980 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xd0>
    4945:	8b 85 18 00 00 00    	mov    0x18(%ebp),%eax
    494b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    494f:	8b 54 24 18          	mov    0x18(%esp),%edx
    4953:	89 d1                	mov    %edx,%ecx
    4955:	d3 e8                	shr    %cl,%eax
    4957:	85 c0                	test   %eax,%eax
    4959:	74 75                	je     49d0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x120>
    495b:	f3 0f bc c8          	tzcnt  %eax,%ecx
    495f:	01 d1                	add    %edx,%ecx
    4961:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    4967:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    496d:	85 d2                	test   %edx,%edx
    496f:	75 4e                	jne    49bf <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x10f>
    4971:	e9 02 01 00 00       	jmp    4a78 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c8>
    4976:	90                   	nop
    4977:	90                   	nop
    4978:	90                   	nop
    4979:	90                   	nop
    497a:	90                   	nop
    497b:	90                   	nop
    497c:	90                   	nop
    497d:	90                   	nop
    497e:	90                   	nop
    497f:	90                   	nop
    4980:	83 fa 3f             	cmp    $0x3f,%edx
    4983:	0f 87 37 01 00 00    	ja     4ac0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4989:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    498f:	89 d0                	mov    %edx,%eax
    4991:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    4995:	d3 e8                	shr    %cl,%eax
    4997:	85 c0                	test   %eax,%eax
    4999:	0f 84 21 01 00 00    	je     4ac0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    499f:	f3 0f bc c8          	tzcnt  %eax,%ecx
    49a3:	03 4c 24 1c          	add    0x1c(%esp),%ecx
    49a7:	8b 85 18 00 00 00    	mov    0x18(%ebp),%eax
    49ad:	89 44 24 0c          	mov    %eax,0xc(%esp)
    49b1:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    49b7:	85 d2                	test   %edx,%edx
    49b9:	0f 84 b9 00 00 00    	je     4a78 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c8>
    49bf:	f3 0f bc c2          	tzcnt  %edx,%eax
    49c3:	83 c8 20             	or     $0x20,%eax
    49c6:	89 44 24 14          	mov    %eax,0x14(%esp)
    49ca:	eb 24                	jmp    49f0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    49cc:	90                   	nop
    49cd:	90                   	nop
    49ce:	90                   	nop
    49cf:	90                   	nop
    49d0:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    49d6:	85 d2                	test   %edx,%edx
    49d8:	0f 84 e2 00 00 00    	je     4ac0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    49de:	f3 0f bc ca          	tzcnt  %edx,%ecx
    49e2:	83 c9 20             	or     $0x20,%ecx
    49e5:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    49eb:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    49ef:	90                   	nop
    49f0:	89 eb                	mov    %ebp,%ebx
    49f2:	8d 6c 8d 00          	lea    0x0(%ebp,%ecx,4),%ebp
    49f6:	89 e8                	mov    %ebp,%eax
    49f8:	90                   	nop
    49f9:	90                   	nop
    49fa:	90                   	nop
    49fb:	90                   	nop
    49fc:	90                   	nop
    49fd:	90                   	nop
    49fe:	90                   	nop
    49ff:	90                   	nop
    4a00:	8b 00                	mov    (%eax),%eax
    4a02:	85 c0                	test   %eax,%eax
    4a04:	74 1a                	je     4a20 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x170>
    4a06:	8b 70 08             	mov    0x8(%eax),%esi
    4a09:	39 fe                	cmp    %edi,%esi
    4a0b:	72 f3                	jb     4a00 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x150>
    4a0d:	e9 5f 03 00 00       	jmp    4d71 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4c1>
    4a12:	90                   	nop
    4a13:	90                   	nop
    4a14:	90                   	nop
    4a15:	90                   	nop
    4a16:	90                   	nop
    4a17:	90                   	nop
    4a18:	90                   	nop
    4a19:	90                   	nop
    4a1a:	90                   	nop
    4a1b:	90                   	nop
    4a1c:	90                   	nop
    4a1d:	90                   	nop
    4a1e:	90                   	nop
    4a1f:	90                   	nop
    4a20:	8d 41 01             	lea    0x1(%ecx),%eax
    4a23:	83 f9 1f             	cmp    $0x1f,%ecx
    4a26:	73 28                	jae    4a50 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1a0>
    4a28:	8b 74 24 0c          	mov    0xc(%esp),%esi
    4a2c:	89 c1                	mov    %eax,%ecx
    4a2e:	d3 ee                	shr    %cl,%esi
    4a30:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    4a34:	85 f6                	test   %esi,%esi
    4a36:	89 dd                	mov    %ebx,%ebp
    4a38:	74 b6                	je     49f0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    4a3a:	f3 0f bc ce          	tzcnt  %esi,%ecx
    4a3e:	01 c1                	add    %eax,%ecx
    4a40:	eb ae                	jmp    49f0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    4a42:	90                   	nop
    4a43:	90                   	nop
    4a44:	90                   	nop
    4a45:	90                   	nop
    4a46:	90                   	nop
    4a47:	90                   	nop
    4a48:	90                   	nop
    4a49:	90                   	nop
    4a4a:	90                   	nop
    4a4b:	90                   	nop
    4a4c:	90                   	nop
    4a4d:	90                   	nop
    4a4e:	90                   	nop
    4a4f:	90                   	nop
    4a50:	83 f9 3e             	cmp    $0x3e,%ecx
    4a53:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4a57:	77 67                	ja     4ac0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4a59:	89 d6                	mov    %edx,%esi
    4a5b:	89 c1                	mov    %eax,%ecx
    4a5d:	d3 ee                	shr    %cl,%esi
    4a5f:	85 f6                	test   %esi,%esi
    4a61:	74 5d                	je     4ac0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4a63:	f3 0f bc ce          	tzcnt  %esi,%ecx
    4a67:	01 c1                	add    %eax,%ecx
    4a69:	89 dd                	mov    %ebx,%ebp
    4a6b:	eb 83                	jmp    49f0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    4a6d:	90                   	nop
    4a6e:	90                   	nop
    4a6f:	90                   	nop
    4a70:	f3 0f bc c0          	tzcnt  %eax,%eax
    4a74:	01 c1                	add    %eax,%ecx
    4a76:	89 d5                	mov    %edx,%ebp
    4a78:	89 ea                	mov    %ebp,%edx
    4a7a:	8d 6c 8d 00          	lea    0x0(%ebp,%ecx,4),%ebp
    4a7e:	89 e8                	mov    %ebp,%eax
    4a80:	8b 00                	mov    (%eax),%eax
    4a82:	85 c0                	test   %eax,%eax
    4a84:	74 1a                	je     4aa0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1f0>
    4a86:	8b 70 08             	mov    0x8(%eax),%esi
    4a89:	39 fe                	cmp    %edi,%esi
    4a8b:	72 f3                	jb     4a80 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1d0>
    4a8d:	e9 df 02 00 00       	jmp    4d71 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4c1>
    4a92:	90                   	nop
    4a93:	90                   	nop
    4a94:	90                   	nop
    4a95:	90                   	nop
    4a96:	90                   	nop
    4a97:	90                   	nop
    4a98:	90                   	nop
    4a99:	90                   	nop
    4a9a:	90                   	nop
    4a9b:	90                   	nop
    4a9c:	90                   	nop
    4a9d:	90                   	nop
    4a9e:	90                   	nop
    4a9f:	90                   	nop
    4aa0:	83 f9 1e             	cmp    $0x1e,%ecx
    4aa3:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4aa7:	77 17                	ja     4ac0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4aa9:	41                   	inc    %ecx
    4aaa:	8b 44 24 0c          	mov    0xc(%esp),%eax
    4aae:	d3 e8                	shr    %cl,%eax
    4ab0:	85 c0                	test   %eax,%eax
    4ab2:	75 bc                	jne    4a70 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c0>
    4ab4:	90                   	nop
    4ab5:	90                   	nop
    4ab6:	90                   	nop
    4ab7:	90                   	nop
    4ab8:	90                   	nop
    4ab9:	90                   	nop
    4aba:	90                   	nop
    4abb:	90                   	nop
    4abc:	90                   	nop
    4abd:	90                   	nop
    4abe:	90                   	nop
    4abf:	90                   	nop
    4ac0:	8b b5 10 00 00 00    	mov    0x10(%ebp),%esi
    4ac6:	8b ad 14 00 00 00    	mov    0x14(%ebp),%ebp
    4acc:	31 c0                	xor    %eax,%eax
    4ace:	39 f5                	cmp    %esi,%ebp
    4ad0:	0f 86 98 04 00 00    	jbe    4f6e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4ad6:	85 f6                	test   %esi,%esi
    4ad8:	0f 84 98 04 00 00    	je     4f76 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6c6>
    4ade:	83 fe fb             	cmp    $0xfffffffb,%esi
    4ae1:	0f 87 87 04 00 00    	ja     4f6e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4ae7:	83 c6 03             	add    $0x3,%esi
    4aea:	83 e6 fc             	and    $0xfffffffc,%esi
    4aed:	83 e5 fc             	and    $0xfffffffc,%ebp
    4af0:	89 e9                	mov    %ebp,%ecx
    4af2:	29 f1                	sub    %esi,%ecx
    4af4:	0f 86 74 04 00 00    	jbe    4f6e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4afa:	8b 54 24 10          	mov    0x10(%esp),%edx
    4afe:	8b 9a 20 00 00 00    	mov    0x20(%edx),%ebx
    4b04:	85 db                	test   %ebx,%ebx
    4b06:	74 38                	je     4b40 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x290>
    4b08:	83 f9 0f             	cmp    $0xf,%ecx
    4b0b:	0f 86 5d 04 00 00    	jbe    4f6e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4b11:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
    4b17:	8d 46 04             	lea    0x4(%esi),%eax
    4b1a:	89 ea                	mov    %ebp,%edx
    4b1c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4b20:	29 c2                	sub    %eax,%edx
    4b22:	83 fa 40             	cmp    $0x40,%edx
    4b25:	0f 83 84 00 00 00    	jae    4baf <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x2ff>
    4b2b:	8d 42 f4             	lea    -0xc(%edx),%eax
    4b2e:	c1 e8 02             	shr    $0x2,%eax
    4b31:	e9 cf 00 00 00       	jmp    4c05 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x355>
    4b36:	90                   	nop
    4b37:	90                   	nop
    4b38:	90                   	nop
    4b39:	90                   	nop
    4b3a:	90                   	nop
    4b3b:	90                   	nop
    4b3c:	90                   	nop
    4b3d:	90                   	nop
    4b3e:	90                   	nop
    4b3f:	90                   	nop
    4b40:	81 f9 07 01 00 00    	cmp    $0x107,%ecx
    4b46:	0f 86 22 04 00 00    	jbe    4f6e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4b4c:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
    4b52:	8d 46 04             	lea    0x4(%esi),%eax
    4b55:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4b59:	83 ec 04             	sub    $0x4,%esp
    4b5c:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    4b60:	68 00 01 00 00       	push   $0x100
    4b65:	6a 00                	push   $0x0
    4b67:	50                   	push   %eax
    4b68:	e8 a3 23 00 00       	call   6f10 <memset>
    4b6d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    4b71:	83 c4 10             	add    $0x10,%esp
    4b74:	89 8b 20 00 00 00    	mov    %ecx,0x20(%ebx)
    4b7a:	8d 86 08 01 00 00    	lea    0x108(%esi),%eax
    4b80:	89 ea                	mov    %ebp,%edx
    4b82:	29 c2                	sub    %eax,%edx
    4b84:	83 fa 0b             	cmp    $0xb,%edx
    4b87:	76 38                	jbe    4bc1 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x311>
    4b89:	83 fa 40             	cmp    $0x40,%edx
    4b8c:	89 44 24 14          	mov    %eax,0x14(%esp)
    4b90:	0f 83 05 01 00 00    	jae    4c9b <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3eb>
    4b96:	8d 42 f4             	lea    -0xc(%edx),%eax
    4b99:	c1 e8 02             	shr    $0x2,%eax
    4b9c:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    4b9f:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    4ba2:	85 c9                	test   %ecx,%ecx
    4ba4:	0f 85 0b 01 00 00    	jne    4cb5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x405>
    4baa:	e9 4d 01 00 00       	jmp    4cfc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x44c>
    4baf:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    4bb5:	73 27                	jae    4bde <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x32e>
    4bb7:	89 d0                	mov    %edx,%eax
    4bb9:	c1 e8 03             	shr    $0x3,%eax
    4bbc:	83 c0 05             	add    $0x5,%eax
    4bbf:	eb 44                	jmp    4c05 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x355>
    4bc1:	8d 86 04 01 00 00    	lea    0x104(%esi),%eax
    4bc7:	83 c5 fc             	add    $0xfffffffc,%ebp
    4bca:	39 c5                	cmp    %eax,%ebp
    4bcc:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    4bd1:	74 02                	je     4bd5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x325>
    4bd3:	89 28                	mov    %ebp,(%eax)
    4bd5:	46                   	inc    %esi
    4bd6:	89 75 00             	mov    %esi,0x0(%ebp)
    4bd9:	e9 94 00 00 00       	jmp    4c72 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3c2>
    4bde:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4be2:	0f bd da             	bsr    %edx,%ebx
    4be5:	83 f3 1f             	xor    $0x1f,%ebx
    4be8:	b1 1e                	mov    $0x1e,%cl
    4bea:	28 d9                	sub    %bl,%cl
    4bec:	89 d0                	mov    %edx,%eax
    4bee:	d3 e8                	shr    %cl,%eax
    4bf0:	01 db                	add    %ebx,%ebx
    4bf2:	29 d8                	sub    %ebx,%eax
    4bf4:	83 c0 43             	add    $0x43,%eax
    4bf7:	83 f8 3f             	cmp    $0x3f,%eax
    4bfa:	72 05                	jb     4c01 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x351>
    4bfc:	b8 3f 00 00 00       	mov    $0x3f,%eax
    4c01:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    4c05:	89 d9                	mov    %ebx,%ecx
    4c07:	8d 1c 83             	lea    (%ebx,%eax,4),%ebx
    4c0a:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    4c0d:	85 c9                	test   %ecx,%ecx
    4c0f:	74 11                	je     4c22 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x372>
    4c11:	89 4e 04             	mov    %ecx,0x4(%esi)
    4c14:	89 5e 08             	mov    %ebx,0x8(%esi)
    4c17:	8b 44 24 0c          	mov    0xc(%esp),%eax
    4c1b:	89 03                	mov    %eax,(%ebx)
    4c1d:	89 41 04             	mov    %eax,0x4(%ecx)
    4c20:	eb 45                	jmp    4c67 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3b7>
    4c22:	31 c9                	xor    %ecx,%ecx
    4c24:	83 f8 20             	cmp    $0x20,%eax
    4c27:	0f 93 c1             	setae  %cl
    4c2a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    4c2e:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    4c35:	00 
    4c36:	89 c1                	mov    %eax,%ecx
    4c38:	d3 64 24 14          	shll   %cl,0x14(%esp)
    4c3c:	8b 44 24 10          	mov    0x10(%esp),%eax
    4c40:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    4c44:	89 5c 24 24          	mov    %ebx,0x24(%esp)
    4c48:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    4c4c:	31 9c 88 18 00 00 00 	xor    %ebx,0x18(%eax,%ecx,4)
    4c53:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
    4c5a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    4c5e:	89 4e 08             	mov    %ecx,0x8(%esi)
    4c61:	8b 44 24 0c          	mov    0xc(%esp),%eax
    4c65:	89 01                	mov    %eax,(%ecx)
    4c67:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    4c6c:	89 56 0c             	mov    %edx,0xc(%esi)
    4c6f:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4c72:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4c76:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4c7a:	c7 85 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
    4c81:	00 00 00 
    4c84:	c7 85 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
    4c8b:	00 00 00 
    4c8e:	84 c9                	test   %cl,%cl
    4c90:	0f 84 ea fc ff ff    	je     4980 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xd0>
    4c96:	e9 aa fc ff ff       	jmp    4945 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x95>
    4c9b:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    4ca1:	73 2c                	jae    4ccf <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x41f>
    4ca3:	89 d0                	mov    %edx,%eax
    4ca5:	c1 e8 03             	shr    $0x3,%eax
    4ca8:	83 c0 05             	add    $0x5,%eax
    4cab:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    4cae:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    4cb1:	85 c9                	test   %ecx,%ecx
    4cb3:	74 47                	je     4cfc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x44c>
    4cb5:	89 8e 08 01 00 00    	mov    %ecx,0x108(%esi)
    4cbb:	89 9e 0c 01 00 00    	mov    %ebx,0x10c(%esi)
    4cc1:	8b 44 24 14          	mov    0x14(%esp),%eax
    4cc5:	89 03                	mov    %eax,(%ebx)
    4cc7:	89 41 04             	mov    %eax,0x4(%ecx)
    4cca:	e9 82 00 00 00       	jmp    4d51 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4a1>
    4ccf:	0f bd da             	bsr    %edx,%ebx
    4cd2:	83 f3 1f             	xor    $0x1f,%ebx
    4cd5:	b1 1e                	mov    $0x1e,%cl
    4cd7:	28 d9                	sub    %bl,%cl
    4cd9:	89 d0                	mov    %edx,%eax
    4cdb:	d3 e8                	shr    %cl,%eax
    4cdd:	01 db                	add    %ebx,%ebx
    4cdf:	29 d8                	sub    %ebx,%eax
    4ce1:	83 c0 43             	add    $0x43,%eax
    4ce4:	83 f8 3f             	cmp    $0x3f,%eax
    4ce7:	72 05                	jb     4cee <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x43e>
    4ce9:	b8 3f 00 00 00       	mov    $0x3f,%eax
    4cee:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    4cf2:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    4cf5:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    4cf8:	85 c9                	test   %ecx,%ecx
    4cfa:	75 b9                	jne    4cb5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x405>
    4cfc:	31 c9                	xor    %ecx,%ecx
    4cfe:	83 f8 20             	cmp    $0x20,%eax
    4d01:	0f 93 c1             	setae  %cl
    4d04:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    4d08:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4d0f:	00 
    4d10:	89 c1                	mov    %eax,%ecx
    4d12:	d3 64 24 0c          	shll   %cl,0xc(%esp)
    4d16:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4d1a:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
    4d1e:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    4d22:	89 44 24 24          	mov    %eax,0x24(%esp)
    4d26:	8b 44 24 0c          	mov    0xc(%esp),%eax
    4d2a:	31 84 99 18 00 00 00 	xor    %eax,0x18(%ecx,%ebx,4)
    4d31:	c7 86 08 01 00 00 00 	movl   $0x0,0x108(%esi)
    4d38:	00 00 00 
    4d3b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    4d3f:	89 86 0c 01 00 00    	mov    %eax,0x10c(%esi)
    4d45:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    4d49:	8b 44 24 24          	mov    0x24(%esp),%eax
    4d4d:	89 4c 86 04          	mov    %ecx,0x4(%esi,%eax,4)
    4d51:	89 96 10 01 00 00    	mov    %edx,0x110(%esi)
    4d57:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4d5a:	8d 46 03             	lea    0x3(%esi),%eax
    4d5d:	89 86 04 01 00 00    	mov    %eax,0x104(%esi)
    4d63:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4d67:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    4d6c:	e9 05 ff ff ff       	jmp    4c76 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3c6>
    4d71:	8b 10                	mov    (%eax),%edx
    4d73:	8b 78 04             	mov    0x4(%eax),%edi
    4d76:	89 17                	mov    %edx,(%edi)
    4d78:	85 d2                	test   %edx,%edx
    4d7a:	74 03                	je     4d7f <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4cf>
    4d7c:	89 7a 04             	mov    %edi,0x4(%edx)
    4d7f:	83 7d 00 00          	cmpl   $0x0,0x0(%ebp)
    4d83:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4d87:	74 24                	je     4dad <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4fd>
    4d89:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
    4d8c:	83 c1 f4             	add    $0xfffffff4,%ecx
    4d8f:	39 c1                	cmp    %eax,%ecx
    4d91:	73 3a                	jae    4dcd <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x51d>
    4d93:	89 cf                	mov    %ecx,%edi
    4d95:	29 c7                	sub    %eax,%edi
    4d97:	83 ff 0b             	cmp    $0xb,%edi
    4d9a:	76 3c                	jbe    4dd8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x528>
    4d9c:	83 ff 40             	cmp    $0x40,%edi
    4d9f:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    4da3:	73 3e                	jae    4de3 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x533>
    4da5:	8d 57 f4             	lea    -0xc(%edi),%edx
    4da8:	c1 ea 02             	shr    $0x2,%edx
    4dab:	eb 67                	jmp    4e14 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    4dad:	31 d2                	xor    %edx,%edx
    4daf:	83 f9 20             	cmp    $0x20,%ecx
    4db2:	0f 93 c2             	setae  %dl
    4db5:	bf 01 00 00 00       	mov    $0x1,%edi
    4dba:	d3 e7                	shl    %cl,%edi
    4dbc:	31 bc 95 18 00 00 00 	xor    %edi,0x18(%ebp,%edx,4)
    4dc3:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
    4dc6:	83 c1 f4             	add    $0xfffffff4,%ecx
    4dc9:	39 c1                	cmp    %eax,%ecx
    4dcb:	72 c6                	jb     4d93 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4e3>
    4dcd:	89 c1                	mov    %eax,%ecx
    4dcf:	89 cf                	mov    %ecx,%edi
    4dd1:	29 c7                	sub    %eax,%edi
    4dd3:	83 ff 0b             	cmp    $0xb,%edi
    4dd6:	77 c4                	ja     4d9c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4ec>
    4dd8:	83 40 fc fe          	addl   $0xfffffffe,-0x4(%eax)
    4ddc:	89 c3                	mov    %eax,%ebx
    4dde:	e9 86 00 00 00       	jmp    4e69 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5b9>
    4de3:	81 ff 80 00 00 00    	cmp    $0x80,%edi
    4de9:	73 0a                	jae    4df5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x545>
    4deb:	89 fa                	mov    %edi,%edx
    4ded:	c1 ea 03             	shr    $0x3,%edx
    4df0:	83 c2 05             	add    $0x5,%edx
    4df3:	eb 1f                	jmp    4e14 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    4df5:	0f bd df             	bsr    %edi,%ebx
    4df8:	83 f3 1f             	xor    $0x1f,%ebx
    4dfb:	b1 1e                	mov    $0x1e,%cl
    4dfd:	28 d9                	sub    %bl,%cl
    4dff:	89 fa                	mov    %edi,%edx
    4e01:	d3 ea                	shr    %cl,%edx
    4e03:	01 db                	add    %ebx,%ebx
    4e05:	29 da                	sub    %ebx,%edx
    4e07:	83 c2 43             	add    $0x43,%edx
    4e0a:	83 fa 3f             	cmp    $0x3f,%edx
    4e0d:	72 05                	jb     4e14 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    4e0f:	ba 3f 00 00 00       	mov    $0x3f,%edx
    4e14:	8b 8d 20 00 00 00    	mov    0x20(%ebp),%ecx
    4e1a:	8d 1c 91             	lea    (%ecx,%edx,4),%ebx
    4e1d:	8b 0c 91             	mov    (%ecx,%edx,4),%ecx
    4e20:	85 c9                	test   %ecx,%ecx
    4e22:	74 0c                	je     4e30 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x580>
    4e24:	89 08                	mov    %ecx,(%eax)
    4e26:	89 58 04             	mov    %ebx,0x4(%eax)
    4e29:	89 03                	mov    %eax,(%ebx)
    4e2b:	89 41 04             	mov    %eax,0x4(%ecx)
    4e2e:	eb 2f                	jmp    4e5f <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5af>
    4e30:	31 c9                	xor    %ecx,%ecx
    4e32:	83 fa 20             	cmp    $0x20,%edx
    4e35:	0f 93 c1             	setae  %cl
    4e38:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4e3c:	bd 01 00 00 00       	mov    $0x1,%ebp
    4e41:	89 d1                	mov    %edx,%ecx
    4e43:	d3 e5                	shl    %cl,%ebp
    4e45:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4e49:	8b 54 24 10          	mov    0x10(%esp),%edx
    4e4d:	31 ac 8a 18 00 00 00 	xor    %ebp,0x18(%edx,%ecx,4)
    4e54:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    4e5a:	89 58 04             	mov    %ebx,0x4(%eax)
    4e5d:	89 03                	mov    %eax,(%ebx)
    4e5f:	89 78 08             	mov    %edi,0x8(%eax)
    4e62:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    4e66:	89 7b fc             	mov    %edi,-0x4(%ebx)
    4e69:	01 c6                	add    %eax,%esi
    4e6b:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    4e6f:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
    4e72:	83 c7 03             	add    $0x3,%edi
    4e75:	83 e7 fc             	and    $0xfffffffc,%edi
    4e78:	8d 6b 08             	lea    0x8(%ebx),%ebp
    4e7b:	39 ef                	cmp    %ebp,%edi
    4e7d:	72 02                	jb     4e81 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5d1>
    4e7f:	89 fd                	mov    %edi,%ebp
    4e81:	8d 4d 04             	lea    0x4(%ebp),%ecx
    4e84:	89 f2                	mov    %esi,%edx
    4e86:	29 ca                	sub    %ecx,%edx
    4e88:	83 fa 0b             	cmp    $0xb,%edx
    4e8b:	76 19                	jbe    4ea6 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5f6>
    4e8d:	83 fa 40             	cmp    $0x40,%edx
    4e90:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    4e94:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    4e98:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    4e9c:	73 1e                	jae    4ebc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x60c>
    4e9e:	8d 5a f4             	lea    -0xc(%edx),%ebx
    4ea1:	c1 eb 02             	shr    $0x2,%ebx
    4ea4:	eb 4f                	jmp    4ef5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    4ea6:	43                   	inc    %ebx
    4ea7:	89 5e fc             	mov    %ebx,-0x4(%esi)
    4eaa:	83 c6 fc             	add    $0xfffffffc,%esi
    4ead:	89 f5                	mov    %esi,%ebp
    4eaf:	39 fd                	cmp    %edi,%ebp
    4eb1:	0f 85 b5 00 00 00    	jne    4f6c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6bc>
    4eb7:	e9 b2 00 00 00       	jmp    4f6e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4ebc:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    4ec2:	73 0a                	jae    4ece <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x61e>
    4ec4:	89 d3                	mov    %edx,%ebx
    4ec6:	c1 eb 03             	shr    $0x3,%ebx
    4ec9:	83 c3 05             	add    $0x5,%ebx
    4ecc:	eb 27                	jmp    4ef5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    4ece:	0f bd da             	bsr    %edx,%ebx
    4ed1:	83 f3 1f             	xor    $0x1f,%ebx
    4ed4:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    4ed8:	b1 1e                	mov    $0x1e,%cl
    4eda:	28 d9                	sub    %bl,%cl
    4edc:	89 d3                	mov    %edx,%ebx
    4ede:	d3 eb                	shr    %cl,%ebx
    4ee0:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4ee4:	01 c9                	add    %ecx,%ecx
    4ee6:	29 cb                	sub    %ecx,%ebx
    4ee8:	83 c3 43             	add    $0x43,%ebx
    4eeb:	83 fb 3f             	cmp    $0x3f,%ebx
    4eee:	72 05                	jb     4ef5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    4ef0:	bb 3f 00 00 00       	mov    $0x3f,%ebx
    4ef5:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4ef9:	8b 89 20 00 00 00    	mov    0x20(%ecx),%ecx
    4eff:	8d 3c 99             	lea    (%ecx,%ebx,4),%edi
    4f02:	89 7c 24 18          	mov    %edi,0x18(%esp)
    4f06:	8b 0c 99             	mov    (%ecx,%ebx,4),%ecx
    4f09:	85 c9                	test   %ecx,%ecx
    4f0b:	74 15                	je     4f22 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x672>
    4f0d:	89 4d 04             	mov    %ecx,0x4(%ebp)
    4f10:	8b 7c 24 18          	mov    0x18(%esp),%edi
    4f14:	89 7d 08             	mov    %edi,0x8(%ebp)
    4f17:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    4f1b:	89 1f                	mov    %ebx,(%edi)
    4f1d:	89 59 04             	mov    %ebx,0x4(%ecx)
    4f20:	eb 32                	jmp    4f54 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6a4>
    4f22:	31 c9                	xor    %ecx,%ecx
    4f24:	83 fb 20             	cmp    $0x20,%ebx
    4f27:	0f 93 c1             	setae  %cl
    4f2a:	89 cf                	mov    %ecx,%edi
    4f2c:	89 d9                	mov    %ebx,%ecx
    4f2e:	bb 01 00 00 00       	mov    $0x1,%ebx
    4f33:	d3 e3                	shl    %cl,%ebx
    4f35:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4f39:	31 9c b9 18 00 00 00 	xor    %ebx,0x18(%ecx,%edi,4)
    4f40:	c7 45 04 00 00 00 00 	movl   $0x0,0x4(%ebp)
    4f47:	8b 7c 24 18          	mov    0x18(%esp),%edi
    4f4b:	89 7d 08             	mov    %edi,0x8(%ebp)
    4f4e:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    4f52:	89 0f                	mov    %ecx,(%edi)
    4f54:	89 55 0c             	mov    %edx,0xc(%ebp)
    4f57:	89 56 fc             	mov    %edx,-0x4(%esi)
    4f5a:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    4f5e:	83 c1 03             	add    $0x3,%ecx
    4f61:	89 4d 00             	mov    %ecx,0x0(%ebp)
    4f64:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    4f68:	39 fd                	cmp    %edi,%ebp
    4f6a:	74 02                	je     4f6e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4f6c:	89 2f                	mov    %ebp,(%edi)
    4f6e:	83 c4 4c             	add    $0x4c,%esp
    4f71:	5e                   	pop    %esi
    4f72:	5f                   	pop    %edi
    4f73:	5b                   	pop    %ebx
    4f74:	5d                   	pop    %ebp
    4f75:	c3                   	ret
    4f76:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    4f7a:	8d 83 60 ff ff ff    	lea    -0xa0(%ebx),%eax
    4f80:	89 44 24 34          	mov    %eax,0x34(%esp)
    4f84:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    4f8b:	00 
    4f8c:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    4f93:	00 
    4f94:	c7 44 24 3c 04 00 00 	movl   $0x4,0x3c(%esp)
    4f9b:	00 
    4f9c:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
    4fa3:	00 
    4fa4:	8d 93 68 ff ff ff    	lea    -0x98(%ebx),%edx
    4faa:	8d 4c 24 34          	lea    0x34(%esp),%ecx
    4fae:	e8 7d c1 ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    4fb3:	66 90                	xchg   %ax,%ax
    4fb5:	66 90                	xchg   %ax,%ax
    4fb7:	66 90                	xchg   %ax,%ax
    4fb9:	66 90                	xchg   %ax,%ax
    4fbb:	66 90                	xchg   %ax,%ax
    4fbd:	66 90                	xchg   %ax,%ax
    4fbf:	90                   	nop

00004fc0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>:
    4fc0:	53                   	push   %ebx
    4fc1:	83 ec 58             	sub    $0x58,%esp
    4fc4:	e8 00 00 00 00       	call   4fc9 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0x9>
    4fc9:	5b                   	pop    %ebx
    4fca:	81 c3 2b 50 00 00    	add    $0x502b,%ebx
    4fd0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4fd4:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    4fda:	83 f8 02             	cmp    $0x2,%eax
    4fdd:	0f 86 d0 00 00 00    	jbe    50b3 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xf3>
    4fe3:	8d 44 24 08          	lea    0x8(%esp),%eax
    4fe7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4feb:	8d 83 1c a2 ff ff    	lea    -0x5de4(%ebx),%eax
    4ff1:	89 44 24 10          	mov    %eax,0x10(%esp)
    4ff5:	c7 44 24 34 03 00 00 	movl   $0x3,0x34(%esp)
    4ffc:	00 
    4ffd:	8d 83 db e7 ff ff    	lea    -0x1825(%ebx),%eax
    5003:	89 44 24 38          	mov    %eax,0x38(%esp)
    5007:	c7 44 24 3c 13 00 00 	movl   $0x13,0x3c(%esp)
    500e:	00 
    500f:	8d 8b 88 fe ff ff    	lea    -0x178(%ebx),%ecx
    5015:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    5019:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5020:	00 
    5021:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    5025:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    5029:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    5030:	00 
    5031:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    5038:	00 
    5039:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    5040:	00 
    5041:	89 44 24 20          	mov    %eax,0x20(%esp)
    5045:	c7 44 24 24 13 00 00 	movl   $0x13,0x24(%esp)
    504c:	00 
    504d:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    5054:	00 
    5055:	8d 83 94 e7 ff ff    	lea    -0x186c(%ebx),%eax
    505b:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    505f:	c7 44 24 30 47 00 00 	movl   $0x47,0x30(%esp)
    5066:	00 
    5067:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    506e:	00 
    506f:	c7 44 24 18 04 00 00 	movl   $0x4,0x18(%esp)
    5076:	00 
    5077:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    507d:	83 f8 02             	cmp    $0x2,%eax
    5080:	74 10                	je     5092 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xd2>
    5082:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5088:	75 10                	jne    509a <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xda>
    508a:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5090:	eb 0e                	jmp    50a0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xe0>
    5092:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5098:	74 f0                	je     508a <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xca>
    509a:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    50a0:	83 ec 08             	sub    $0x8,%esp
    50a3:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    50a7:	52                   	push   %edx
    50a8:	51                   	push   %ecx
    50a9:	ff 50 10             	call   *0x10(%eax)
    50ac:	83 c4 10             	add    $0x10,%esp
    50af:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    50b3:	b8 89 00 00 00       	mov    $0x89,%eax
    50b8:	89 ca                	mov    %ecx,%edx
    50ba:	cd 50                	int    $0x50
    50bc:	0f 0b                	ud2
    50be:	66 90                	xchg   %ax,%ax

000050c0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>:
    50c0:	53                   	push   %ebx
    50c1:	83 ec 58             	sub    $0x58,%esp
    50c4:	e8 00 00 00 00       	call   50c9 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0x9>
    50c9:	5b                   	pop    %ebx
    50ca:	81 c3 2b 4f 00 00    	add    $0x4f2b,%ebx
    50d0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    50d4:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    50da:	85 c0                	test   %eax,%eax
    50dc:	0f 84 ce 00 00 00    	je     51b0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    50e2:	8d 44 24 08          	lea    0x8(%esp),%eax
    50e6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    50ea:	8d 83 cc b1 ff ff    	lea    -0x4e34(%ebx),%eax
    50f0:	89 44 24 10          	mov    %eax,0x10(%esp)
    50f4:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%esp)
    50fb:	00 
    50fc:	8d 83 d9 e8 ff ff    	lea    -0x1727(%ebx),%eax
    5102:	89 44 24 38          	mov    %eax,0x38(%esp)
    5106:	c7 44 24 3c 0a 00 00 	movl   $0xa,0x3c(%esp)
    510d:	00 
    510e:	8d 8b e0 fe ff ff    	lea    -0x120(%ebx),%ecx
    5114:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    5118:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    511f:	00 
    5120:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    5124:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    5128:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    512f:	00 
    5130:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    5137:	00 
    5138:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    513f:	00 
    5140:	89 44 24 20          	mov    %eax,0x20(%esp)
    5144:	c7 44 24 24 0a 00 00 	movl   $0xa,0x24(%esp)
    514b:	00 
    514c:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    5153:	00 
    5154:	8d 83 9a e8 ff ff    	lea    -0x1766(%ebx),%eax
    515a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    515e:	c7 44 24 30 3f 00 00 	movl   $0x3f,0x30(%esp)
    5165:	00 
    5166:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    516d:	00 
    516e:	c7 44 24 18 1d 00 00 	movl   $0x1d,0x18(%esp)
    5175:	00 
    5176:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    517c:	83 f8 02             	cmp    $0x2,%eax
    517f:	74 10                	je     5191 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xd1>
    5181:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5187:	75 10                	jne    5199 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xd9>
    5189:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    518f:	eb 0e                	jmp    519f <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xdf>
    5191:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5197:	74 f0                	je     5189 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xc9>
    5199:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    519f:	83 ec 08             	sub    $0x8,%esp
    51a2:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    51a6:	52                   	push   %edx
    51a7:	51                   	push   %ecx
    51a8:	ff 50 10             	call   *0x10(%eax)
    51ab:	83 c4 10             	add    $0x10,%esp
    51ae:	90                   	nop
    51af:	90                   	nop
    51b0:	eb fe                	jmp    51b0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    51b2:	66 90                	xchg   %ax,%ax
    51b4:	66 90                	xchg   %ax,%ax
    51b6:	66 90                	xchg   %ax,%ax
    51b8:	66 90                	xchg   %ax,%ax
    51ba:	66 90                	xchg   %ax,%ax
    51bc:	66 90                	xchg   %ax,%ax
    51be:	66 90                	xchg   %ax,%ax

000051c0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E>:
    51c0:	55                   	push   %ebp
    51c1:	53                   	push   %ebx
    51c2:	57                   	push   %edi
    51c3:	56                   	push   %esi
    51c4:	83 ec 3c             	sub    $0x3c,%esp
    51c7:	e8 00 00 00 00       	call   51cc <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0xc>
    51cc:	5b                   	pop    %ebx
    51cd:	81 c3 28 4e 00 00    	add    $0x4e28,%ebx
    51d3:	8b 44 24 54          	mov    0x54(%esp),%eax
    51d7:	8b 4c 24 50          	mov    0x50(%esp),%ecx
    51db:	8b 09                	mov    (%ecx),%ecx
    51dd:	8b 11                	mov    (%ecx),%edx
    51df:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    51e3:	8b 79 04             	mov    0x4(%ecx),%edi
    51e6:	8b 28                	mov    (%eax),%ebp
    51e8:	8b 70 04             	mov    0x4(%eax),%esi
    51eb:	8b 4e 0c             	mov    0xc(%esi),%ecx
    51ee:	83 ec 04             	sub    $0x4,%esp
    51f1:	8d 83 de db ff ff    	lea    -0x2422(%ebx),%eax
    51f7:	6a 0c                	push   $0xc
    51f9:	50                   	push   %eax
    51fa:	55                   	push   %ebp
    51fb:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    51ff:	ff d1                	call   *%ecx
    5201:	83 c4 10             	add    $0x10,%esp
    5204:	b1 01                	mov    $0x1,%cl
    5206:	84 c0                	test   %al,%al
    5208:	0f 85 d0 00 00 00    	jne    52de <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    520e:	8d 47 08             	lea    0x8(%edi),%eax
    5211:	89 7c 24 04          	mov    %edi,0x4(%esp)
    5215:	83 c7 0c             	add    $0xc,%edi
    5218:	8d 8b 1c 97 ff ff    	lea    -0x68e4(%ebx),%ecx
    521e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    5222:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5226:	8d 83 9c 99 ff ff    	lea    -0x6664(%ebx),%eax
    522c:	89 44 24 10          	mov    %eax,0x10(%esp)
    5230:	89 7c 24 14          	mov    %edi,0x14(%esp)
    5234:	89 44 24 18          	mov    %eax,0x18(%esp)
    5238:	8d 83 50 fd ff ff    	lea    -0x2b0(%ebx),%eax
    523e:	89 44 24 24          	mov    %eax,0x24(%esp)
    5242:	c7 44 24 28 03 00 00 	movl   $0x3,0x28(%esp)
    5249:	00 
    524a:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
    5251:	00 
    5252:	8d 7c 24 04          	lea    0x4(%esp),%edi
    5256:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    525a:	c7 44 24 30 03 00 00 	movl   $0x3,0x30(%esp)
    5261:	00 
    5262:	83 ec 0c             	sub    $0xc,%esp
    5265:	8d 44 24 30          	lea    0x30(%esp),%eax
    5269:	89 e9                	mov    %ebp,%ecx
    526b:	89 f2                	mov    %esi,%edx
    526d:	50                   	push   %eax
    526e:	e8 fd e4 ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    5273:	83 c4 10             	add    $0x10,%esp
    5276:	84 c0                	test   %al,%al
    5278:	74 04                	je     527e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0xbe>
    527a:	b1 01                	mov    $0x1,%cl
    527c:	eb 60                	jmp    52de <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    527e:	83 ec 04             	sub    $0x4,%esp
    5281:	8d 83 ea db ff ff    	lea    -0x2416(%ebx),%eax
    5287:	6a 02                	push   $0x2
    5289:	50                   	push   %eax
    528a:	55                   	push   %ebp
    528b:	ff 54 24 30          	call   *0x30(%esp)
    528f:	83 c4 10             	add    $0x10,%esp
    5292:	84 c0                	test   %al,%al
    5294:	b1 01                	mov    $0x1,%cl
    5296:	75 46                	jne    52de <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    5298:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    529c:	8b 42 14             	mov    0x14(%edx),%eax
    529f:	89 44 24 18          	mov    %eax,0x18(%esp)
    52a3:	8b 42 10             	mov    0x10(%edx),%eax
    52a6:	89 44 24 14          	mov    %eax,0x14(%esp)
    52aa:	8b 42 0c             	mov    0xc(%edx),%eax
    52ad:	89 44 24 10          	mov    %eax,0x10(%esp)
    52b1:	8b 42 08             	mov    0x8(%edx),%eax
    52b4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    52b8:	8b 0a                	mov    (%edx),%ecx
    52ba:	8b 42 04             	mov    0x4(%edx),%eax
    52bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    52c1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    52c5:	83 f8 01             	cmp    $0x1,%eax
    52c8:	74 02                	je     52cc <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x10c>
    52ca:	85 c0                	test   %eax,%eax
    52cc:	83 ec 0c             	sub    $0xc,%esp
    52cf:	89 e9                	mov    %ebp,%ecx
    52d1:	89 f2                	mov    %esi,%edx
    52d3:	57                   	push   %edi
    52d4:	e8 97 e4 ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    52d9:	83 c4 10             	add    $0x10,%esp
    52dc:	89 c1                	mov    %eax,%ecx
    52de:	89 c8                	mov    %ecx,%eax
    52e0:	83 c4 3c             	add    $0x3c,%esp
    52e3:	5e                   	pop    %esi
    52e4:	5f                   	pop    %edi
    52e5:	5b                   	pop    %ebx
    52e6:	5d                   	pop    %ebp
    52e7:	c3                   	ret
    52e8:	66 90                	xchg   %ax,%ax
    52ea:	66 90                	xchg   %ax,%ax
    52ec:	66 90                	xchg   %ax,%ax
    52ee:	66 90                	xchg   %ax,%ax

000052f0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>:
    52f0:	53                   	push   %ebx
    52f1:	83 ec 08             	sub    $0x8,%esp
    52f4:	e8 00 00 00 00       	call   52f9 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E+0x9>
    52f9:	5b                   	pop    %ebx
    52fa:	81 c3 fb 4c 00 00    	add    $0x4cfb,%ebx
    5300:	e8 0b 00 00 00       	call   5310 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E>
    5305:	66 90                	xchg   %ax,%ax
    5307:	66 90                	xchg   %ax,%ax
    5309:	66 90                	xchg   %ax,%ax
    530b:	66 90                	xchg   %ax,%ax
    530d:	66 90                	xchg   %ax,%ax
    530f:	90                   	nop

00005310 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E>:
    5310:	55                   	push   %ebp
    5311:	53                   	push   %ebx
    5312:	57                   	push   %edi
    5313:	56                   	push   %esi
    5314:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
    531a:	89 d6                	mov    %edx,%esi
    531c:	89 cd                	mov    %ecx,%ebp
    531e:	e8 00 00 00 00       	call   5323 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x13>
    5323:	5b                   	pop    %ebx
    5324:	81 c3 d1 4c 00 00    	add    $0x4cd1,%ebx
    532a:	8d 54 24 08          	lea    0x8(%esp),%edx
    532e:	b8 87 00 00 00       	mov    $0x87,%eax
    5333:	cd 80                	int    $0x80
    5335:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5338:	83 f9 0a             	cmp    $0xa,%ecx
    533b:	0f 83 f0 00 00 00    	jae    5431 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x121>
    5341:	89 c1                	mov    %eax,%ecx
    5343:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    5347:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    534d:	85 c0                	test   %eax,%eax
    534f:	75 0a                	jne    535b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4b>
    5351:	b9 20 00 00 00       	mov    $0x20,%ecx
    5356:	e8 65 fc ff ff       	call   4fc0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    535b:	8d 44 24 68          	lea    0x68(%esp),%eax
    535f:	89 44 24 50          	mov    %eax,0x50(%esp)
    5363:	8d 83 7c 83 ff ff    	lea    -0x7c84(%ebx),%eax
    5369:	89 44 24 54          	mov    %eax,0x54(%esp)
    536d:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    5374:	00 
    5375:	8d 83 4e e8 ff ff    	lea    -0x17b2(%ebx),%eax
    537b:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    537f:	c7 44 24 30 0e 00 00 	movl   $0xe,0x30(%esp)
    5386:	00 
    5387:	8d 8b 90 fe ff ff    	lea    -0x170(%ebx),%ecx
    538d:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    5391:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5398:	00 
    5399:	8d 4c 24 50          	lea    0x50(%esp),%ecx
    539d:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
    53a1:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    53a8:	00 
    53a9:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    53b0:	00 
    53b1:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    53b8:	00 
    53b9:	89 44 24 14          	mov    %eax,0x14(%esp)
    53bd:	c7 44 24 18 0e 00 00 	movl   $0xe,0x18(%esp)
    53c4:	00 
    53c5:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    53cc:	00 
    53cd:	8d 83 0c e8 ff ff    	lea    -0x17f4(%ebx),%eax
    53d3:	89 44 24 20          	mov    %eax,0x20(%esp)
    53d7:	c7 44 24 24 42 00 00 	movl   $0x42,0x24(%esp)
    53de:	00 
    53df:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    53e6:	00 
    53e7:	c7 44 24 0c 38 00 00 	movl   $0x38,0xc(%esp)
    53ee:	00 
    53ef:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    53f5:	83 f8 02             	cmp    $0x2,%eax
    53f8:	74 10                	je     540a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa>
    53fa:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5400:	75 10                	jne    5412 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x102>
    5402:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5408:	eb 0e                	jmp    5418 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x108>
    540a:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5410:	74 f0                	je     5402 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf2>
    5412:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    5418:	83 ec 08             	sub    $0x8,%esp
    541b:	8d 54 24 10          	lea    0x10(%esp),%edx
    541f:	52                   	push   %edx
    5420:	51                   	push   %ecx
    5421:	ff 50 10             	call   *0x10(%eax)
    5424:	83 c4 10             	add    $0x10,%esp
    5427:	b9 20 00 00 00       	mov    $0x20,%ecx
    542c:	e8 8f fb ff ff       	call   4fc0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    5431:	b9 42 00 00 00       	mov    $0x42,%ecx
    5436:	85 c0                	test   %eax,%eax
    5438:	0f 85 05 ff ff ff    	jne    5343 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x33>
    543e:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    5442:	8b 44 24 0c          	mov    0xc(%esp),%eax
    5446:	8b 54 24 10          	mov    0x10(%esp),%edx
    544a:	89 94 24 84 00 00 00 	mov    %edx,0x84(%esp)
    5451:	8b 84 83 6c d5 ff ff 	mov    -0x2a94(%ebx,%eax,4),%eax
    5458:	01 d8                	add    %ebx,%eax
    545a:	ff e0                	jmp    *%eax
    545c:	83 fd 01             	cmp    $0x1,%ebp
    545f:	0f 85 17 08 00 00    	jne    5c7c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x96c>
    5465:	8d 83 ac c3 ff ff    	lea    -0x3c54(%ebx),%eax
    546b:	89 44 24 64          	mov    %eax,0x64(%esp)
    546f:	8d ab 47 e4 ff ff    	lea    -0x1bb9(%ebx),%ebp
    5475:	8d 83 e0 fd ff ff    	lea    -0x220(%ebx),%eax
    547b:	89 44 24 60          	mov    %eax,0x60(%esp)
    547f:	8d b3 e0 e3 ff ff    	lea    -0x1c20(%ebx),%esi
    5485:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    548b:	89 44 24 78          	mov    %eax,0x78(%esp)
    548f:	8d 83 9b ea ff ff    	lea    -0x1565(%ebx),%eax
    5495:	89 44 24 7c          	mov    %eax,0x7c(%esp)
    5499:	8d 83 8c a1 ff ff    	lea    -0x5e74(%ebx),%eax
    549f:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
    54a6:	8d bb e6 e9 ff ff    	lea    -0x161a(%ebx),%edi
    54ac:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
    54b2:	89 84 24 88 00 00 00 	mov    %eax,0x88(%esp)
    54b9:	8d 83 7e e9 ff ff    	lea    -0x1682(%ebx),%eax
    54bf:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
    54c6:	8d 83 1c cd ff ff    	lea    -0x32e4(%ebx),%eax
    54cc:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
    54d3:	8d 83 10 ff ff ff    	lea    -0xf0(%ebx),%eax
    54d9:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
    54e0:	eb 15                	jmp    54f7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1e7>
    54e2:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    54e8:	83 ec 08             	sub    $0x8,%esp
    54eb:	8d 54 24 10          	lea    0x10(%esp),%edx
    54ef:	52                   	push   %edx
    54f0:	51                   	push   %ecx
    54f1:	ff 50 10             	call   *0x10(%eax)
    54f4:	83 c4 10             	add    $0x10,%esp
    54f7:	b8 8e 00 00 00       	mov    $0x8e,%eax
    54fc:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    5503:	8d 54 24 68          	lea    0x68(%esp),%edx
    5507:	cd 80                	int    $0x80
    5509:	8d 48 ff             	lea    -0x1(%eax),%ecx
    550c:	83 f9 0a             	cmp    $0xa,%ecx
    550f:	0f 83 b5 01 00 00    	jae    56ca <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3ba>
    5515:	89 c1                	mov    %eax,%ecx
    5517:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    551b:	8d 44 24 04          	lea    0x4(%esp),%eax
    551f:	89 44 24 4c          	mov    %eax,0x4c(%esp)
    5523:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5529:	85 c0                	test   %eax,%eax
    552b:	0f 84 91 0d 00 00    	je     62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5531:	8d 44 24 4c          	lea    0x4c(%esp),%eax
    5535:	89 44 24 50          	mov    %eax,0x50(%esp)
    5539:	8b 44 24 64          	mov    0x64(%esp),%eax
    553d:	89 44 24 54          	mov    %eax,0x54(%esp)
    5541:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    5548:	00 
    5549:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
    554d:	c7 44 24 30 1b 00 00 	movl   $0x1b,0x30(%esp)
    5554:	00 
    5555:	8b 44 24 60          	mov    0x60(%esp),%eax
    5559:	89 44 24 34          	mov    %eax,0x34(%esp)
    555d:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5564:	00 
    5565:	8d 44 24 50          	lea    0x50(%esp),%eax
    5569:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    556d:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    5574:	00 
    5575:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    557c:	00 
    557d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5584:	00 
    5585:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    5589:	c7 44 24 18 1b 00 00 	movl   $0x1b,0x18(%esp)
    5590:	00 
    5591:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    5598:	00 
    5599:	89 74 24 20          	mov    %esi,0x20(%esp)
    559d:	c7 44 24 24 4a 00 00 	movl   $0x4a,0x24(%esp)
    55a4:	00 
    55a5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    55ac:	00 
    55ad:	c7 44 24 0c 23 00 00 	movl   $0x23,0xc(%esp)
    55b4:	00 
    55b5:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    55bb:	83 f8 02             	cmp    $0x2,%eax
    55be:	74 10                	je     55d0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2c0>
    55c0:	8b 44 24 78          	mov    0x78(%esp),%eax
    55c4:	75 12                	jne    55d8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2c8>
    55c6:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    55cc:	eb 0e                	jmp    55dc <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2cc>
    55ce:	90                   	nop
    55cf:	90                   	nop
    55d0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    55d6:	74 ee                	je     55c6 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2b6>
    55d8:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
    55dc:	83 ec 08             	sub    $0x8,%esp
    55df:	8d 54 24 10          	lea    0x10(%esp),%edx
    55e3:	52                   	push   %edx
    55e4:	51                   	push   %ecx
    55e5:	ff 50 10             	call   *0x10(%eax)
    55e8:	83 c4 10             	add    $0x10,%esp
    55eb:	83 7c 24 04 00       	cmpl   $0x0,0x4(%esp)
    55f0:	0f 85 cc 0c 00 00    	jne    62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    55f6:	83 7c 24 68 03       	cmpl   $0x3,0x68(%esp)
    55fb:	0f 84 c1 0c 00 00    	je     62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5601:	8b 54 24 6c          	mov    0x6c(%esp),%edx
    5605:	89 54 24 04          	mov    %edx,0x4(%esp)
    5609:	85 d2                	test   %edx,%edx
    560b:	0f 84 e6 fe ff ff    	je     54f7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1e7>
    5611:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5617:	83 f8 03             	cmp    $0x3,%eax
    561a:	0f 86 db 00 00 00    	jbe    56fb <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3eb>
    5620:	8d 44 24 04          	lea    0x4(%esp),%eax
    5624:	89 44 24 50          	mov    %eax,0x50(%esp)
    5628:	8b 84 24 8c 00 00 00 	mov    0x8c(%esp),%eax
    562f:	89 44 24 54          	mov    %eax,0x54(%esp)
    5633:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    563a:	00 
    563b:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    563f:	c7 44 24 30 1c 00 00 	movl   $0x1c,0x30(%esp)
    5646:	00 
    5647:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
    564e:	89 44 24 34          	mov    %eax,0x34(%esp)
    5652:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5659:	00 
    565a:	8d 44 24 50          	lea    0x50(%esp),%eax
    565e:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    5662:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    5669:	00 
    566a:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    5671:	00 
    5672:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5679:	00 
    567a:	89 7c 24 14          	mov    %edi,0x14(%esp)
    567e:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    5685:	00 
    5686:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    568d:	00 
    568e:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
    5695:	89 44 24 20          	mov    %eax,0x20(%esp)
    5699:	c7 44 24 24 4b 00 00 	movl   $0x4b,0x24(%esp)
    56a0:	00 
    56a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    56a8:	00 
    56a9:	c7 44 24 0c 51 00 00 	movl   $0x51,0xc(%esp)
    56b0:	00 
    56b1:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    56b7:	83 f8 02             	cmp    $0x2,%eax
    56ba:	74 20                	je     56dc <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3cc>
    56bc:	8b 44 24 78          	mov    0x78(%esp),%eax
    56c0:	75 22                	jne    56e4 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3d4>
    56c2:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    56c8:	eb 1e                	jmp    56e8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3d8>
    56ca:	b9 42 00 00 00       	mov    $0x42,%ecx
    56cf:	85 c0                	test   %eax,%eax
    56d1:	0f 84 1f ff ff ff    	je     55f6 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2e6>
    56d7:	e9 3b fe ff ff       	jmp    5517 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x207>
    56dc:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    56e2:	74 de                	je     56c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3b2>
    56e4:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
    56e8:	83 ec 08             	sub    $0x8,%esp
    56eb:	8d 54 24 10          	lea    0x10(%esp),%edx
    56ef:	52                   	push   %edx
    56f0:	51                   	push   %ecx
    56f1:	ff 50 10             	call   *0x10(%eax)
    56f4:	83 c4 10             	add    $0x10,%esp
    56f7:	8b 54 24 04          	mov    0x4(%esp),%edx
    56fb:	b8 8d 00 00 00       	mov    $0x8d,%eax
    5700:	cd 80                	int    $0x80
    5702:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5705:	83 f9 0a             	cmp    $0xa,%ecx
    5708:	0f 83 d9 00 00 00    	jae    57e7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4d7>
    570e:	89 44 24 4c          	mov    %eax,0x4c(%esp)
    5712:	8d 44 24 4c          	lea    0x4c(%esp),%eax
    5716:	89 44 24 68          	mov    %eax,0x68(%esp)
    571a:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5720:	85 c0                	test   %eax,%eax
    5722:	0f 84 cf fd ff ff    	je     54f7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1e7>
    5728:	8d 44 24 68          	lea    0x68(%esp),%eax
    572c:	89 44 24 50          	mov    %eax,0x50(%esp)
    5730:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
    5737:	89 44 24 54          	mov    %eax,0x54(%esp)
    573b:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    5742:	00 
    5743:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    5747:	c7 44 24 30 1c 00 00 	movl   $0x1c,0x30(%esp)
    574e:	00 
    574f:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    5756:	89 44 24 34          	mov    %eax,0x34(%esp)
    575a:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5761:	00 
    5762:	8d 44 24 50          	lea    0x50(%esp),%eax
    5766:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    576a:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    5771:	00 
    5772:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    5779:	00 
    577a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5781:	00 
    5782:	89 7c 24 14          	mov    %edi,0x14(%esp)
    5786:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    578d:	00 
    578e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    5795:	00 
    5796:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
    579d:	89 44 24 20          	mov    %eax,0x20(%esp)
    57a1:	c7 44 24 24 4b 00 00 	movl   $0x4b,0x24(%esp)
    57a8:	00 
    57a9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    57b0:	00 
    57b1:	c7 44 24 0c 59 00 00 	movl   $0x59,0xc(%esp)
    57b8:	00 
    57b9:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    57bf:	83 f8 02             	cmp    $0x2,%eax
    57c2:	74 0c                	je     57d0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4c0>
    57c4:	8b 44 24 78          	mov    0x78(%esp),%eax
    57c8:	0f 85 14 fd ff ff    	jne    54e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1d2>
    57ce:	eb 0c                	jmp    57dc <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4cc>
    57d0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    57d6:	0f 85 06 fd ff ff    	jne    54e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1d2>
    57dc:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    57e2:	e9 01 fd ff ff       	jmp    54e8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1d8>
    57e7:	85 c0                	test   %eax,%eax
    57e9:	b8 42 00 00 00       	mov    $0x42,%eax
    57ee:	0f 84 03 fd ff ff    	je     54f7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1e7>
    57f4:	e9 15 ff ff ff       	jmp    570e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3fe>
    57f9:	83 fd 02             	cmp    $0x2,%ebp
    57fc:	0f 85 7a 04 00 00    	jne    5c7c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x96c>
    5802:	89 74 24 60          	mov    %esi,0x60(%esp)
    5806:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    580c:	8d 8b 4e e8 ff ff    	lea    -0x17b2(%ebx),%ecx
    5812:	89 4c 24 64          	mov    %ecx,0x64(%esp)
    5816:	83 f8 03             	cmp    $0x3,%eax
    5819:	0f 86 a1 04 00 00    	jbe    5cc0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    581f:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    5826:	00 
    5827:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    582b:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    582f:	c7 44 24 30 0e 00 00 	movl   $0xe,0x30(%esp)
    5836:	00 
    5837:	8d 83 98 fe ff ff    	lea    -0x168(%ebx),%eax
    583d:	89 44 24 34          	mov    %eax,0x34(%esp)
    5841:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5848:	00 
    5849:	c7 44 24 3c 04 00 00 	movl   $0x4,0x3c(%esp)
    5850:	00 
    5851:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
    5858:	00 
    5859:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    5860:	00 
    5861:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5868:	00 
    5869:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    586d:	c7 44 24 18 0e 00 00 	movl   $0xe,0x18(%esp)
    5874:	00 
    5875:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    587c:	00 
    587d:	8d 83 0c e8 ff ff    	lea    -0x17f4(%ebx),%eax
    5883:	89 44 24 20          	mov    %eax,0x20(%esp)
    5887:	c7 44 24 24 42 00 00 	movl   $0x42,0x24(%esp)
    588e:	00 
    588f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5896:	00 
    5897:	c7 44 24 0c 61 00 00 	movl   $0x61,0xc(%esp)
    589e:	00 
    589f:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    58a5:	83 f8 02             	cmp    $0x2,%eax
    58a8:	0f 84 d8 03 00 00    	je     5c86 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x976>
    58ae:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    58b4:	e9 d3 03 00 00       	jmp    5c8c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x97c>
    58b9:	85 ed                	test   %ebp,%ebp
    58bb:	0f 85 bb 03 00 00    	jne    5c7c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x96c>
    58c1:	8d 83 ac c3 ff ff    	lea    -0x3c54(%ebx),%eax
    58c7:	89 44 24 64          	mov    %eax,0x64(%esp)
    58cb:	8d bb 47 e4 ff ff    	lea    -0x1bb9(%ebx),%edi
    58d1:	8d ab e0 fd ff ff    	lea    -0x220(%ebx),%ebp
    58d7:	8d b3 e0 e3 ff ff    	lea    -0x1c20(%ebx),%esi
    58dd:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    58e3:	89 44 24 60          	mov    %eax,0x60(%esp)
    58e7:	8d 83 9b ea ff ff    	lea    -0x1565(%ebx),%eax
    58ed:	89 44 24 78          	mov    %eax,0x78(%esp)
    58f1:	8d 83 8c a1 ff ff    	lea    -0x5e74(%ebx),%eax
    58f7:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
    58fe:	8d 83 e6 e9 ff ff    	lea    -0x161a(%ebx),%eax
    5904:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
    590b:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
    5911:	89 84 24 88 00 00 00 	mov    %eax,0x88(%esp)
    5918:	8d 83 7e e9 ff ff    	lea    -0x1682(%ebx),%eax
    591e:	89 44 24 7c          	mov    %eax,0x7c(%esp)
    5922:	8d 83 1c cd ff ff    	lea    -0x32e4(%ebx),%eax
    5928:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
    592f:	8d 83 10 ff ff ff    	lea    -0xf0(%ebx),%eax
    5935:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
    593c:	eb 22                	jmp    5960 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x650>
    593e:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    5944:	83 ec 08             	sub    $0x8,%esp
    5947:	8d 54 24 10          	lea    0x10(%esp),%edx
    594b:	52                   	push   %edx
    594c:	51                   	push   %ecx
    594d:	ff 50 10             	call   *0x10(%eax)
    5950:	83 c4 10             	add    $0x10,%esp
    5953:	90                   	nop
    5954:	90                   	nop
    5955:	90                   	nop
    5956:	90                   	nop
    5957:	90                   	nop
    5958:	90                   	nop
    5959:	90                   	nop
    595a:	90                   	nop
    595b:	90                   	nop
    595c:	90                   	nop
    595d:	90                   	nop
    595e:	90                   	nop
    595f:	90                   	nop
    5960:	b8 8e 00 00 00       	mov    $0x8e,%eax
    5965:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    596c:	8d 54 24 50          	lea    0x50(%esp),%edx
    5970:	cd 80                	int    $0x80
    5972:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5975:	83 f9 0a             	cmp    $0xa,%ecx
    5978:	0f 83 cb 01 00 00    	jae    5b49 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x839>
    597e:	89 c1                	mov    %eax,%ecx
    5980:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    5984:	8d 44 24 04          	lea    0x4(%esp),%eax
    5988:	89 44 24 4c          	mov    %eax,0x4c(%esp)
    598c:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5992:	85 c0                	test   %eax,%eax
    5994:	0f 84 28 09 00 00    	je     62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    599a:	8d 44 24 4c          	lea    0x4c(%esp),%eax
    599e:	89 44 24 68          	mov    %eax,0x68(%esp)
    59a2:	8b 44 24 64          	mov    0x64(%esp),%eax
    59a6:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    59aa:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    59b1:	00 
    59b2:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    59b6:	c7 44 24 30 1b 00 00 	movl   $0x1b,0x30(%esp)
    59bd:	00 
    59be:	89 6c 24 34          	mov    %ebp,0x34(%esp)
    59c2:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    59c9:	00 
    59ca:	8d 44 24 68          	lea    0x68(%esp),%eax
    59ce:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    59d2:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    59d9:	00 
    59da:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    59e1:	00 
    59e2:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    59e9:	00 
    59ea:	89 7c 24 14          	mov    %edi,0x14(%esp)
    59ee:	c7 44 24 18 1b 00 00 	movl   $0x1b,0x18(%esp)
    59f5:	00 
    59f6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    59fd:	00 
    59fe:	89 74 24 20          	mov    %esi,0x20(%esp)
    5a02:	c7 44 24 24 4a 00 00 	movl   $0x4a,0x24(%esp)
    5a09:	00 
    5a0a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5a11:	00 
    5a12:	c7 44 24 0c 23 00 00 	movl   $0x23,0xc(%esp)
    5a19:	00 
    5a1a:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5a20:	83 f8 02             	cmp    $0x2,%eax
    5a23:	74 1b                	je     5a40 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x730>
    5a25:	8b 44 24 60          	mov    0x60(%esp),%eax
    5a29:	75 1d                	jne    5a48 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x738>
    5a2b:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5a31:	eb 19                	jmp    5a4c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x73c>
    5a33:	90                   	nop
    5a34:	90                   	nop
    5a35:	90                   	nop
    5a36:	90                   	nop
    5a37:	90                   	nop
    5a38:	90                   	nop
    5a39:	90                   	nop
    5a3a:	90                   	nop
    5a3b:	90                   	nop
    5a3c:	90                   	nop
    5a3d:	90                   	nop
    5a3e:	90                   	nop
    5a3f:	90                   	nop
    5a40:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5a46:	74 e3                	je     5a2b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x71b>
    5a48:	8b 4c 24 78          	mov    0x78(%esp),%ecx
    5a4c:	83 ec 08             	sub    $0x8,%esp
    5a4f:	8d 54 24 10          	lea    0x10(%esp),%edx
    5a53:	52                   	push   %edx
    5a54:	51                   	push   %ecx
    5a55:	ff 50 10             	call   *0x10(%eax)
    5a58:	83 c4 10             	add    $0x10,%esp
    5a5b:	83 7c 24 04 00       	cmpl   $0x0,0x4(%esp)
    5a60:	0f 85 5c 08 00 00    	jne    62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5a66:	8b 44 24 50          	mov    0x50(%esp),%eax
    5a6a:	83 f8 03             	cmp    $0x3,%eax
    5a6d:	0f 84 4f 08 00 00    	je     62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5a73:	83 f8 01             	cmp    $0x1,%eax
    5a76:	0f 87 e4 fe ff ff    	ja     5960 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x650>
    5a7c:	8b 54 24 58          	mov    0x58(%esp),%edx
    5a80:	89 54 24 04          	mov    %edx,0x4(%esp)
    5a84:	85 d2                	test   %edx,%edx
    5a86:	0f 84 d4 fe ff ff    	je     5960 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x650>
    5a8c:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5a92:	83 f8 03             	cmp    $0x3,%eax
    5a95:	0f 86 df 00 00 00    	jbe    5b7a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x86a>
    5a9b:	8d 44 24 04          	lea    0x4(%esp),%eax
    5a9f:	89 44 24 50          	mov    %eax,0x50(%esp)
    5aa3:	8b 84 24 8c 00 00 00 	mov    0x8c(%esp),%eax
    5aaa:	89 44 24 54          	mov    %eax,0x54(%esp)
    5aae:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    5ab5:	00 
    5ab6:	8b 8c 24 80 00 00 00 	mov    0x80(%esp),%ecx
    5abd:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    5ac1:	c7 44 24 30 1c 00 00 	movl   $0x1c,0x30(%esp)
    5ac8:	00 
    5ac9:	8b 84 24 88 00 00 00 	mov    0x88(%esp),%eax
    5ad0:	89 44 24 34          	mov    %eax,0x34(%esp)
    5ad4:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5adb:	00 
    5adc:	8d 44 24 50          	lea    0x50(%esp),%eax
    5ae0:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    5ae4:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    5aeb:	00 
    5aec:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    5af3:	00 
    5af4:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5afb:	00 
    5afc:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    5b00:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    5b07:	00 
    5b08:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    5b0f:	00 
    5b10:	8b 44 24 7c          	mov    0x7c(%esp),%eax
    5b14:	89 44 24 20          	mov    %eax,0x20(%esp)
    5b18:	c7 44 24 24 4b 00 00 	movl   $0x4b,0x24(%esp)
    5b1f:	00 
    5b20:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5b27:	00 
    5b28:	c7 44 24 0c 51 00 00 	movl   $0x51,0xc(%esp)
    5b2f:	00 
    5b30:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5b36:	83 f8 02             	cmp    $0x2,%eax
    5b39:	74 20                	je     5b5b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x84b>
    5b3b:	8b 44 24 60          	mov    0x60(%esp),%eax
    5b3f:	75 22                	jne    5b63 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x853>
    5b41:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5b47:	eb 1e                	jmp    5b67 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x857>
    5b49:	b9 42 00 00 00       	mov    $0x42,%ecx
    5b4e:	85 c0                	test   %eax,%eax
    5b50:	0f 84 10 ff ff ff    	je     5a66 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x756>
    5b56:	e9 25 fe ff ff       	jmp    5980 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x670>
    5b5b:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5b61:	74 de                	je     5b41 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x831>
    5b63:	8b 4c 24 78          	mov    0x78(%esp),%ecx
    5b67:	83 ec 08             	sub    $0x8,%esp
    5b6a:	8d 54 24 10          	lea    0x10(%esp),%edx
    5b6e:	52                   	push   %edx
    5b6f:	51                   	push   %ecx
    5b70:	ff 50 10             	call   *0x10(%eax)
    5b73:	83 c4 10             	add    $0x10,%esp
    5b76:	8b 54 24 04          	mov    0x4(%esp),%edx
    5b7a:	b8 8d 00 00 00       	mov    $0x8d,%eax
    5b7f:	cd 80                	int    $0x80
    5b81:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5b84:	83 f9 0a             	cmp    $0xa,%ecx
    5b87:	0f 83 dd 00 00 00    	jae    5c6a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x95a>
    5b8d:	89 44 24 4c          	mov    %eax,0x4c(%esp)
    5b91:	8d 44 24 4c          	lea    0x4c(%esp),%eax
    5b95:	89 44 24 68          	mov    %eax,0x68(%esp)
    5b99:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5b9f:	85 c0                	test   %eax,%eax
    5ba1:	0f 84 b9 fd ff ff    	je     5960 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x650>
    5ba7:	8d 44 24 68          	lea    0x68(%esp),%eax
    5bab:	89 44 24 50          	mov    %eax,0x50(%esp)
    5baf:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
    5bb6:	89 44 24 54          	mov    %eax,0x54(%esp)
    5bba:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    5bc1:	00 
    5bc2:	8b 8c 24 80 00 00 00 	mov    0x80(%esp),%ecx
    5bc9:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    5bcd:	c7 44 24 30 1c 00 00 	movl   $0x1c,0x30(%esp)
    5bd4:	00 
    5bd5:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    5bdc:	89 44 24 34          	mov    %eax,0x34(%esp)
    5be0:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5be7:	00 
    5be8:	8d 44 24 50          	lea    0x50(%esp),%eax
    5bec:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    5bf0:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    5bf7:	00 
    5bf8:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    5bff:	00 
    5c00:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5c07:	00 
    5c08:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    5c0c:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    5c13:	00 
    5c14:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    5c1b:	00 
    5c1c:	8b 44 24 7c          	mov    0x7c(%esp),%eax
    5c20:	89 44 24 20          	mov    %eax,0x20(%esp)
    5c24:	c7 44 24 24 4b 00 00 	movl   $0x4b,0x24(%esp)
    5c2b:	00 
    5c2c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5c33:	00 
    5c34:	c7 44 24 0c 59 00 00 	movl   $0x59,0xc(%esp)
    5c3b:	00 
    5c3c:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5c42:	83 f8 02             	cmp    $0x2,%eax
    5c45:	74 0c                	je     5c53 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x943>
    5c47:	8b 44 24 60          	mov    0x60(%esp),%eax
    5c4b:	0f 85 ed fc ff ff    	jne    593e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x62e>
    5c51:	eb 0c                	jmp    5c5f <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x94f>
    5c53:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5c59:	0f 85 df fc ff ff    	jne    593e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x62e>
    5c5f:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5c65:	e9 da fc ff ff       	jmp    5944 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x634>
    5c6a:	85 c0                	test   %eax,%eax
    5c6c:	b8 42 00 00 00       	mov    $0x42,%eax
    5c71:	0f 84 e9 fc ff ff    	je     5960 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x650>
    5c77:	e9 11 ff ff ff       	jmp    5b8d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x87d>
    5c7c:	b9 22 00 00 00       	mov    $0x22,%ecx
    5c81:	e8 3a f3 ff ff       	call   4fc0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    5c86:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5c8c:	74 08                	je     5c96 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x986>
    5c8e:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    5c94:	eb 06                	jmp    5c9c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x98c>
    5c96:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5c9c:	83 ec 08             	sub    $0x8,%esp
    5c9f:	8d 54 24 10          	lea    0x10(%esp),%edx
    5ca3:	52                   	push   %edx
    5ca4:	51                   	push   %ecx
    5ca5:	ff 50 10             	call   *0x10(%eax)
    5ca8:	83 c4 10             	add    $0x10,%esp
    5cab:	eb 13                	jmp    5cc0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    5cad:	85 c0                	test   %eax,%eax
    5caf:	b8 42 00 00 00       	mov    $0x42,%eax
    5cb4:	0f 85 28 05 00 00    	jne    61e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xed2>
    5cba:	90                   	nop
    5cbb:	90                   	nop
    5cbc:	90                   	nop
    5cbd:	90                   	nop
    5cbe:	90                   	nop
    5cbf:	90                   	nop
    5cc0:	8d 54 24 50          	lea    0x50(%esp),%edx
    5cc4:	b8 8e 00 00 00       	mov    $0x8e,%eax
    5cc9:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    5cd0:	cd 80                	int    $0x80
    5cd2:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5cd5:	83 f9 0a             	cmp    $0xa,%ecx
    5cd8:	0f 83 bf 04 00 00    	jae    619d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe8d>
    5cde:	89 c1                	mov    %eax,%ecx
    5ce0:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    5ce4:	8d 44 24 04          	lea    0x4(%esp),%eax
    5ce8:	89 44 24 4c          	mov    %eax,0x4c(%esp)
    5cec:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5cf2:	85 c0                	test   %eax,%eax
    5cf4:	0f 84 c8 05 00 00    	je     62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5cfa:	8d 44 24 4c          	lea    0x4c(%esp),%eax
    5cfe:	89 44 24 68          	mov    %eax,0x68(%esp)
    5d02:	8d 83 ac c3 ff ff    	lea    -0x3c54(%ebx),%eax
    5d08:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    5d0c:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    5d13:	00 
    5d14:	8d 83 47 e4 ff ff    	lea    -0x1bb9(%ebx),%eax
    5d1a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    5d1e:	c7 44 24 30 1b 00 00 	movl   $0x1b,0x30(%esp)
    5d25:	00 
    5d26:	8d 8b e0 fd ff ff    	lea    -0x220(%ebx),%ecx
    5d2c:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    5d30:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5d37:	00 
    5d38:	8d 4c 24 68          	lea    0x68(%esp),%ecx
    5d3c:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
    5d40:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    5d47:	00 
    5d48:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    5d4f:	00 
    5d50:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5d57:	00 
    5d58:	89 44 24 14          	mov    %eax,0x14(%esp)
    5d5c:	c7 44 24 18 1b 00 00 	movl   $0x1b,0x18(%esp)
    5d63:	00 
    5d64:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    5d6b:	00 
    5d6c:	8d 83 e0 e3 ff ff    	lea    -0x1c20(%ebx),%eax
    5d72:	89 44 24 20          	mov    %eax,0x20(%esp)
    5d76:	c7 44 24 24 4a 00 00 	movl   $0x4a,0x24(%esp)
    5d7d:	00 
    5d7e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5d85:	00 
    5d86:	c7 44 24 0c 23 00 00 	movl   $0x23,0xc(%esp)
    5d8d:	00 
    5d8e:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5d94:	83 f8 02             	cmp    $0x2,%eax
    5d97:	74 17                	je     5db0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaa0>
    5d99:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5d9f:	75 17                	jne    5db8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaa8>
    5da1:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5da7:	eb 15                	jmp    5dbe <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaae>
    5da9:	90                   	nop
    5daa:	90                   	nop
    5dab:	90                   	nop
    5dac:	90                   	nop
    5dad:	90                   	nop
    5dae:	90                   	nop
    5daf:	90                   	nop
    5db0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5db6:	74 e9                	je     5da1 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xa91>
    5db8:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    5dbe:	83 ec 08             	sub    $0x8,%esp
    5dc1:	8d 54 24 10          	lea    0x10(%esp),%edx
    5dc5:	52                   	push   %edx
    5dc6:	51                   	push   %ecx
    5dc7:	ff 50 10             	call   *0x10(%eax)
    5dca:	83 c4 10             	add    $0x10,%esp
    5dcd:	83 7c 24 04 00       	cmpl   $0x0,0x4(%esp)
    5dd2:	0f 85 ea 04 00 00    	jne    62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5dd8:	8b 44 24 50          	mov    0x50(%esp),%eax
    5ddc:	83 f8 03             	cmp    $0x3,%eax
    5ddf:	0f 84 dd 04 00 00    	je     62c2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5de5:	83 f8 02             	cmp    $0x2,%eax
    5de8:	0f 85 ea 04 00 00    	jne    62d8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfc8>
    5dee:	8b 74 24 54          	mov    0x54(%esp),%esi
    5df2:	8b 6c 24 58          	mov    0x58(%esp),%ebp
    5df6:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    5dfa:	b8 88 00 00 00       	mov    $0x88,%eax
    5dff:	89 ea                	mov    %ebp,%edx
    5e01:	cd 80                	int    $0x80
    5e03:	85 c0                	test   %eax,%eax
    5e05:	0f 85 02 05 00 00    	jne    630d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xffd>
    5e0b:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    5e0f:	8b 44 24 10          	mov    0x10(%esp),%eax
    5e13:	89 7c 24 68          	mov    %edi,0x68(%esp)
    5e17:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    5e1b:	89 6c 24 70          	mov    %ebp,0x70(%esp)
    5e1f:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5e25:	83 f8 03             	cmp    $0x3,%eax
    5e28:	0f 86 d3 00 00 00    	jbe    5f01 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbf1>
    5e2e:	8d 44 24 68          	lea    0x68(%esp),%eax
    5e32:	89 44 24 50          	mov    %eax,0x50(%esp)
    5e36:	8d 83 dc c3 ff ff    	lea    -0x3c24(%ebx),%eax
    5e3c:	89 44 24 54          	mov    %eax,0x54(%esp)
    5e40:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    5e47:	00 
    5e48:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    5e4c:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    5e50:	c7 44 24 30 0e 00 00 	movl   $0xe,0x30(%esp)
    5e57:	00 
    5e58:	8d 83 c0 fe ff ff    	lea    -0x140(%ebx),%eax
    5e5e:	89 44 24 34          	mov    %eax,0x34(%esp)
    5e62:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    5e69:	00 
    5e6a:	8d 44 24 50          	lea    0x50(%esp),%eax
    5e6e:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    5e72:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    5e79:	00 
    5e7a:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    5e81:	00 
    5e82:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    5e89:	00 
    5e8a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    5e8e:	c7 44 24 18 0e 00 00 	movl   $0xe,0x18(%esp)
    5e95:	00 
    5e96:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    5e9d:	00 
    5e9e:	8d 83 0c e8 ff ff    	lea    -0x17f4(%ebx),%eax
    5ea4:	89 44 24 20          	mov    %eax,0x20(%esp)
    5ea8:	c7 44 24 24 42 00 00 	movl   $0x42,0x24(%esp)
    5eaf:	00 
    5eb0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5eb7:	00 
    5eb8:	c7 44 24 0c 6e 00 00 	movl   $0x6e,0xc(%esp)
    5ebf:	00 
    5ec0:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5ec6:	83 f8 02             	cmp    $0x2,%eax
    5ec9:	74 15                	je     5ee0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbd0>
    5ecb:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5ed1:	8d 54 24 08          	lea    0x8(%esp),%edx
    5ed5:	75 15                	jne    5eec <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbdc>
    5ed7:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5edd:	eb 13                	jmp    5ef2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbe2>
    5edf:	90                   	nop
    5ee0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5ee6:	8d 54 24 08          	lea    0x8(%esp),%edx
    5eea:	74 eb                	je     5ed7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbc7>
    5eec:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    5ef2:	83 ec 08             	sub    $0x8,%esp
    5ef5:	52                   	push   %edx
    5ef6:	51                   	push   %ecx
    5ef7:	ff 50 10             	call   *0x10(%eax)
    5efa:	83 c4 10             	add    $0x10,%esp
    5efd:	8b 7c 24 68          	mov    0x68(%esp),%edi
    5f01:	85 ff                	test   %edi,%edi
    5f03:	0f 88 7c 04 00 00    	js     6385 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1075>
    5f09:	74 65                	je     5f70 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc60>
    5f0b:	0f b6 83 3c 27 00 00 	movzbl 0x273c(%ebx),%eax
    5f12:	90                   	nop
    5f13:	90                   	nop
    5f14:	90                   	nop
    5f15:	90                   	nop
    5f16:	90                   	nop
    5f17:	90                   	nop
    5f18:	90                   	nop
    5f19:	90                   	nop
    5f1a:	90                   	nop
    5f1b:	90                   	nop
    5f1c:	90                   	nop
    5f1d:	90                   	nop
    5f1e:	90                   	nop
    5f1f:	90                   	nop
    5f20:	b1 01                	mov    $0x1,%cl
    5f22:	31 c0                	xor    %eax,%eax
    5f24:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    5f2b:	00 
    5f2c:	74 22                	je     5f50 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc40>
    5f2e:	90                   	nop
    5f2f:	90                   	nop
    5f30:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    5f37:	84 c0                	test   %al,%al
    5f39:	74 e5                	je     5f20 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc10>
    5f3b:	f3 90                	pause
    5f3d:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    5f44:	84 c0                	test   %al,%al
    5f46:	75 f3                	jne    5f3b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc2b>
    5f48:	eb d6                	jmp    5f20 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc10>
    5f4a:	90                   	nop
    5f4b:	90                   	nop
    5f4c:	90                   	nop
    5f4d:	90                   	nop
    5f4e:	90                   	nop
    5f4f:	90                   	nop
    5f50:	b9 01 00 00 00       	mov    $0x1,%ecx
    5f55:	89 fa                	mov    %edi,%edx
    5f57:	e8 54 e9 ff ff       	call   48b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>
    5f5c:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    5f63:	85 c0                	test   %eax,%eax
    5f65:	0f 84 1f 04 00 00    	je     638a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x107a>
    5f6b:	89 c5                	mov    %eax,%ebp
    5f6d:	eb 06                	jmp    5f75 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc65>
    5f6f:	90                   	nop
    5f70:	bd 01 00 00 00       	mov    $0x1,%ebp
    5f75:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    5f79:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    5f7d:	89 7c 24 10          	mov    %edi,0x10(%esp)
    5f81:	8b 54 24 70          	mov    0x70(%esp),%edx
    5f85:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    5f89:	b8 85 00 00 00       	mov    $0x85,%eax
    5f8e:	cd 80                	int    $0x80
    5f90:	85 c0                	test   %eax,%eax
    5f92:	0f 85 8b 03 00 00    	jne    6323 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1013>
    5f98:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    5f9c:	b8 88 00 00 00       	mov    $0x88,%eax
    5fa1:	89 f2                	mov    %esi,%edx
    5fa3:	cd 80                	int    $0x80
    5fa5:	85 c0                	test   %eax,%eax
    5fa7:	0f 85 a7 03 00 00    	jne    6354 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1044>
    5fad:	8b 44 24 08          	mov    0x8(%esp),%eax
    5fb1:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    5fb5:	89 74 24 50          	mov    %esi,0x50(%esp)
    5fb9:	89 44 24 54          	mov    %eax,0x54(%esp)
    5fbd:	89 4c 24 58          	mov    %ecx,0x58(%esp)
    5fc1:	89 7c 24 08          	mov    %edi,0x8(%esp)
    5fc5:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    5fc9:	89 7c 24 10          	mov    %edi,0x10(%esp)
    5fcd:	83 ec 08             	sub    $0x8,%esp
    5fd0:	8d 7c 24 10          	lea    0x10(%esp),%edi
    5fd4:	57                   	push   %edi
    5fd5:	8d 44 24 5c          	lea    0x5c(%esp),%eax
    5fd9:	50                   	push   %eax
    5fda:	ff 54 24 70          	call   *0x70(%esp)
    5fde:	83 c4 10             	add    $0x10,%esp
    5fe1:	88 44 24 4c          	mov    %al,0x4c(%esp)
    5fe5:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5feb:	83 f8 03             	cmp    $0x3,%eax
    5fee:	0f 86 d5 00 00 00    	jbe    60c9 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xdb9>
    5ff4:	8d 44 24 4c          	lea    0x4c(%esp),%eax
    5ff8:	89 44 24 50          	mov    %eax,0x50(%esp)
    5ffc:	8d 83 dc c4 ff ff    	lea    -0x3b24(%ebx),%eax
    6002:	89 44 24 54          	mov    %eax,0x54(%esp)
    6006:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    600d:	00 
    600e:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    6012:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    6016:	c7 44 24 30 0e 00 00 	movl   $0xe,0x30(%esp)
    601d:	00 
    601e:	8d 83 d8 fe ff ff    	lea    -0x128(%ebx),%eax
    6024:	89 44 24 34          	mov    %eax,0x34(%esp)
    6028:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    602f:	00 
    6030:	8d 44 24 50          	lea    0x50(%esp),%eax
    6034:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    6038:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    603f:	00 
    6040:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    6047:	00 
    6048:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    604f:	00 
    6050:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    6054:	c7 44 24 18 0e 00 00 	movl   $0xe,0x18(%esp)
    605b:	00 
    605c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    6063:	00 
    6064:	8d 83 0c e8 ff ff    	lea    -0x17f4(%ebx),%eax
    606a:	89 44 24 20          	mov    %eax,0x20(%esp)
    606e:	c7 44 24 24 42 00 00 	movl   $0x42,0x24(%esp)
    6075:	00 
    6076:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    607d:	00 
    607e:	c7 44 24 0c 75 00 00 	movl   $0x75,0xc(%esp)
    6085:	00 
    6086:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    608c:	83 f8 02             	cmp    $0x2,%eax
    608f:	74 1f                	je     60b0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xda0>
    6091:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    6097:	75 1f                	jne    60b8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xda8>
    6099:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    609f:	eb 1d                	jmp    60be <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xdae>
    60a1:	90                   	nop
    60a2:	90                   	nop
    60a3:	90                   	nop
    60a4:	90                   	nop
    60a5:	90                   	nop
    60a6:	90                   	nop
    60a7:	90                   	nop
    60a8:	90                   	nop
    60a9:	90                   	nop
    60aa:	90                   	nop
    60ab:	90                   	nop
    60ac:	90                   	nop
    60ad:	90                   	nop
    60ae:	90                   	nop
    60af:	90                   	nop
    60b0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    60b6:	74 e1                	je     6099 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xd89>
    60b8:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    60be:	83 ec 08             	sub    $0x8,%esp
    60c1:	57                   	push   %edi
    60c2:	51                   	push   %ecx
    60c3:	ff 50 10             	call   *0x10(%eax)
    60c6:	83 c4 10             	add    $0x10,%esp
    60c9:	8b 54 24 70          	mov    0x70(%esp),%edx
    60cd:	89 94 24 98 00 00 00 	mov    %edx,0x98(%esp)
    60d4:	85 d2                	test   %edx,%edx
    60d6:	0f 84 e4 fb ff ff    	je     5cc0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    60dc:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    60e2:	83 f8 03             	cmp    $0x3,%eax
    60e5:	0f 86 e4 00 00 00    	jbe    61cf <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xebf>
    60eb:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
    60f2:	89 44 24 50          	mov    %eax,0x50(%esp)
    60f6:	8d 83 8c a1 ff ff    	lea    -0x5e74(%ebx),%eax
    60fc:	89 44 24 54          	mov    %eax,0x54(%esp)
    6100:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    6107:	00 
    6108:	8d 83 e6 e9 ff ff    	lea    -0x161a(%ebx),%eax
    610e:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    6112:	c7 44 24 30 1c 00 00 	movl   $0x1c,0x30(%esp)
    6119:	00 
    611a:	8d 8b 08 ff ff ff    	lea    -0xf8(%ebx),%ecx
    6120:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    6124:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    612b:	00 
    612c:	8d 4c 24 50          	lea    0x50(%esp),%ecx
    6130:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
    6134:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    613b:	00 
    613c:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    6143:	00 
    6144:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    614b:	00 
    614c:	89 44 24 14          	mov    %eax,0x14(%esp)
    6150:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    6157:	00 
    6158:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    615f:	00 
    6160:	8d 83 7e e9 ff ff    	lea    -0x1682(%ebx),%eax
    6166:	89 44 24 20          	mov    %eax,0x20(%esp)
    616a:	c7 44 24 24 4b 00 00 	movl   $0x4b,0x24(%esp)
    6171:	00 
    6172:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    6179:	00 
    617a:	c7 44 24 0c 51 00 00 	movl   $0x51,0xc(%esp)
    6181:	00 
    6182:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    6188:	83 f8 02             	cmp    $0x2,%eax
    618b:	74 22                	je     61af <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe9f>
    618d:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    6193:	75 22                	jne    61b7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xea7>
    6195:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    619b:	eb 20                	jmp    61bd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xead>
    619d:	b9 42 00 00 00       	mov    $0x42,%ecx
    61a2:	85 c0                	test   %eax,%eax
    61a4:	0f 84 2e fc ff ff    	je     5dd8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xac8>
    61aa:	e9 31 fb ff ff       	jmp    5ce0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9d0>
    61af:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    61b5:	74 de                	je     6195 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe85>
    61b7:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    61bd:	83 ec 08             	sub    $0x8,%esp
    61c0:	57                   	push   %edi
    61c1:	51                   	push   %ecx
    61c2:	ff 50 10             	call   *0x10(%eax)
    61c5:	83 c4 10             	add    $0x10,%esp
    61c8:	8b 94 24 98 00 00 00 	mov    0x98(%esp),%edx
    61cf:	b8 8d 00 00 00       	mov    $0x8d,%eax
    61d4:	cd 80                	int    $0x80
    61d6:	8d 48 ff             	lea    -0x1(%eax),%ecx
    61d9:	83 f9 0a             	cmp    $0xa,%ecx
    61dc:	0f 83 cb fa ff ff    	jae    5cad <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x99d>
    61e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    61e6:	8d 44 24 04          	lea    0x4(%esp),%eax
    61ea:	89 44 24 4c          	mov    %eax,0x4c(%esp)
    61ee:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    61f4:	85 c0                	test   %eax,%eax
    61f6:	0f 84 c4 fa ff ff    	je     5cc0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    61fc:	8d 44 24 4c          	lea    0x4c(%esp),%eax
    6200:	89 44 24 50          	mov    %eax,0x50(%esp)
    6204:	8d 83 1c cd ff ff    	lea    -0x32e4(%ebx),%eax
    620a:	89 44 24 54          	mov    %eax,0x54(%esp)
    620e:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    6215:	00 
    6216:	8d 83 e6 e9 ff ff    	lea    -0x161a(%ebx),%eax
    621c:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    6220:	c7 44 24 30 1c 00 00 	movl   $0x1c,0x30(%esp)
    6227:	00 
    6228:	8d 8b 10 ff ff ff    	lea    -0xf0(%ebx),%ecx
    622e:	89 4c 24 34          	mov    %ecx,0x34(%esp)
    6232:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    6239:	00 
    623a:	8d 4c 24 50          	lea    0x50(%esp),%ecx
    623e:	89 4c 24 3c          	mov    %ecx,0x3c(%esp)
    6242:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    6249:	00 
    624a:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    6251:	00 
    6252:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    6259:	00 
    625a:	89 44 24 14          	mov    %eax,0x14(%esp)
    625e:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    6265:	00 
    6266:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    626d:	00 
    626e:	8d 83 7e e9 ff ff    	lea    -0x1682(%ebx),%eax
    6274:	89 44 24 20          	mov    %eax,0x20(%esp)
    6278:	c7 44 24 24 4b 00 00 	movl   $0x4b,0x24(%esp)
    627f:	00 
    6280:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    6287:	00 
    6288:	c7 44 24 0c 59 00 00 	movl   $0x59,0xc(%esp)
    628f:	00 
    6290:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    6296:	83 f8 02             	cmp    $0x2,%eax
    6299:	74 10                	je     62ab <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf9b>
    629b:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    62a1:	75 10                	jne    62b3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa3>
    62a3:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    62a9:	eb 0e                	jmp    62b9 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa9>
    62ab:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    62b1:	74 f0                	je     62a3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf93>
    62b3:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    62b9:	83 ec 08             	sub    $0x8,%esp
    62bc:	57                   	push   %edi
    62bd:	e9 e2 f9 ff ff       	jmp    5ca4 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x994>
    62c2:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    62c9:	e8 32 08 00 00       	call   6b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    62ce:	b9 21 00 00 00       	mov    $0x21,%ecx
    62d3:	e8 e8 ec ff ff       	call   4fc0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    62d8:	83 ec 0c             	sub    $0xc,%esp
    62db:	85 c0                	test   %eax,%eax
    62dd:	75 17                	jne    62f6 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfe6>
    62df:	8d 83 a0 fe ff ff    	lea    -0x160(%ebx),%eax
    62e5:	8d 8b 9d e4 ff ff    	lea    -0x1b63(%ebx),%ecx
    62eb:	ba 13 00 00 00       	mov    $0x13,%edx
    62f0:	50                   	push   %eax
    62f1:	e8 fa ae ff ff       	call   11f0 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    62f6:	8d 83 b0 fe ff ff    	lea    -0x150(%ebx),%eax
    62fc:	8d 8b 9d e4 ff ff    	lea    -0x1b63(%ebx),%ecx
    6302:	ba 13 00 00 00       	mov    $0x13,%edx
    6307:	50                   	push   %eax
    6308:	e8 e3 ae ff ff       	call   11f0 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    630d:	89 c1                	mov    %eax,%ecx
    630f:	e8 bc 0a 00 00       	call   6dd0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    6314:	89 44 24 50          	mov    %eax,0x50(%esp)
    6318:	83 ec 04             	sub    $0x4,%esp
    631b:	8d 83 68 fe ff ff    	lea    -0x198(%ebx),%eax
    6321:	eb 45                	jmp    6368 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1058>
    6323:	89 c1                	mov    %eax,%ecx
    6325:	e8 a6 0a 00 00       	call   6dd0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    632a:	89 44 24 08          	mov    %eax,0x8(%esp)
    632e:	83 ec 04             	sub    $0x4,%esp
    6331:	8d 83 c8 fe ff ff    	lea    -0x138(%ebx),%eax
    6337:	8d b3 e8 fd ff ff    	lea    -0x218(%ebx),%esi
    633d:	8d 8b 64 e4 ff ff    	lea    -0x1b9c(%ebx),%ecx
    6343:	ba 2b 00 00 00       	mov    $0x2b,%edx
    6348:	50                   	push   %eax
    6349:	56                   	push   %esi
    634a:	8d 44 24 14          	lea    0x14(%esp),%eax
    634e:	50                   	push   %eax
    634f:	e8 ac af ff ff       	call   1300 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    6354:	89 c1                	mov    %eax,%ecx
    6356:	e8 75 0a 00 00       	call   6dd0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    635b:	89 44 24 50          	mov    %eax,0x50(%esp)
    635f:	83 ec 04             	sub    $0x4,%esp
    6362:	8d 83 10 fe ff ff    	lea    -0x1f0(%ebx),%eax
    6368:	8d bb e8 fd ff ff    	lea    -0x218(%ebx),%edi
    636e:	8d 8b 64 e4 ff ff    	lea    -0x1b9c(%ebx),%ecx
    6374:	ba 2b 00 00 00       	mov    $0x2b,%edx
    6379:	50                   	push   %eax
    637a:	57                   	push   %edi
    637b:	8d 44 24 5c          	lea    0x5c(%esp),%eax
    637f:	50                   	push   %eax
    6380:	e8 7b af ff ff       	call   1300 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    6385:	e8 a6 ac ff ff       	call   1030 <_ZN5alloc7raw_vec17capacity_overflow17hf4854d1cf84712dcE>
    638a:	89 f9                	mov    %edi,%ecx
    638c:	e8 84 ac ff ff       	call   1015 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE>
    6391:	66 90                	xchg   %ax,%ax
    6393:	66 90                	xchg   %ax,%ax
    6395:	66 90                	xchg   %ax,%ax
    6397:	66 90                	xchg   %ax,%ax
    6399:	66 90                	xchg   %ax,%ax
    639b:	66 90                	xchg   %ax,%ax
    639d:	66 90                	xchg   %ax,%ax
    639f:	90                   	nop

000063a0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c10eea8ba9fb618E>:
    63a0:	53                   	push   %ebx
    63a1:	83 ec 08             	sub    $0x8,%esp
    63a4:	e8 00 00 00 00       	call   63a9 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c10eea8ba9fb618E+0x9>
    63a9:	5b                   	pop    %ebx
    63aa:	81 c3 4b 3c 00 00    	add    $0x3c4b,%ebx
    63b0:	8b 44 24 10          	mov    0x10(%esp),%eax
    63b4:	83 ec 08             	sub    $0x8,%esp
    63b7:	ff 74 24 1c          	push   0x1c(%esp)
    63bb:	ff 30                	push   (%eax)
    63bd:	e8 ae bf ff ff       	call   2370 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>
    63c2:	83 c4 18             	add    $0x18,%esp
    63c5:	5b                   	pop    %ebx
    63c6:	c3                   	ret
    63c7:	66 90                	xchg   %ax,%ax
    63c9:	66 90                	xchg   %ax,%ax
    63cb:	66 90                	xchg   %ax,%ax
    63cd:	66 90                	xchg   %ax,%ax
    63cf:	90                   	nop

000063d0 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E>:
    63d0:	55                   	push   %ebp
    63d1:	53                   	push   %ebx
    63d2:	57                   	push   %edi
    63d3:	56                   	push   %esi
    63d4:	83 ec 1c             	sub    $0x1c,%esp
    63d7:	e8 00 00 00 00       	call   63dc <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xc>
    63dc:	5b                   	pop    %ebx
    63dd:	81 c3 18 3c 00 00    	add    $0x3c18,%ebx
    63e3:	8b 74 24 34          	mov    0x34(%esp),%esi
    63e7:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    63eb:	8d 45 04             	lea    0x4(%ebp),%eax
    63ee:	89 44 24 14          	mov    %eax,0x14(%esp)
    63f2:	8d 45 08             	lea    0x8(%ebp),%eax
    63f5:	89 44 24 18          	mov    %eax,0x18(%esp)
    63f9:	8b 46 04             	mov    0x4(%esi),%eax
    63fc:	83 ec 04             	sub    $0x4,%esp
    63ff:	8d 8b 1a e9 ff ff    	lea    -0x16e6(%ebx),%ecx
    6405:	6a 09                	push   $0x9
    6407:	51                   	push   %ecx
    6408:	ff 36                	push   (%esi)
    640a:	ff 50 0c             	call   *0xc(%eax)
    640d:	83 c4 10             	add    $0x10,%esp
    6410:	89 74 24 0c          	mov    %esi,0xc(%esp)
    6414:	88 44 24 10          	mov    %al,0x10(%esp)
    6418:	c6 44 24 11 00       	movb   $0x0,0x11(%esp)
    641d:	83 ec 04             	sub    $0x4,%esp
    6420:	8d bb dc a4 ff ff    	lea    -0x5b24(%ebx),%edi
    6426:	8d 93 23 e9 ff ff    	lea    -0x16dd(%ebx),%edx
    642c:	8d 74 24 10          	lea    0x10(%esp),%esi
    6430:	89 f1                	mov    %esi,%ecx
    6432:	57                   	push   %edi
    6433:	55                   	push   %ebp
    6434:	6a 03                	push   $0x3
    6436:	e8 15 d8 ff ff       	call   3c50 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    643b:	83 c4 0c             	add    $0xc,%esp
    643e:	8d 93 c3 d7 ff ff    	lea    -0x283d(%ebx),%edx
    6444:	89 f1                	mov    %esi,%ecx
    6446:	57                   	push   %edi
    6447:	ff 74 24 1c          	push   0x1c(%esp)
    644b:	6a 08                	push   $0x8
    644d:	e8 fe d7 ff ff       	call   3c50 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    6452:	83 c4 0c             	add    $0xc,%esp
    6455:	8d 83 1c c7 ff ff    	lea    -0x38e4(%ebx),%eax
    645b:	8d 7c 24 1c          	lea    0x1c(%esp),%edi
    645f:	8d 93 26 e9 ff ff    	lea    -0x16da(%ebx),%edx
    6465:	89 f1                	mov    %esi,%ecx
    6467:	50                   	push   %eax
    6468:	57                   	push   %edi
    6469:	6a 06                	push   $0x6
    646b:	e8 e0 d7 ff ff       	call   3c50 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    6470:	83 c4 10             	add    $0x10,%esp
    6473:	0f b6 4c 24 10       	movzbl 0x10(%esp),%ecx
    6478:	0f b6 44 24 11       	movzbl 0x11(%esp),%eax
    647d:	89 c2                	mov    %eax,%edx
    647f:	f6 d2                	not    %dl
    6481:	08 ca                	or     %cl,%dl
    6483:	f6 c2 01             	test   $0x1,%dl
    6486:	74 04                	je     648c <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xbc>
    6488:	08 c8                	or     %cl,%al
    648a:	eb 31                	jmp    64bd <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xed>
    648c:	8b 44 24 0c          	mov    0xc(%esp),%eax
    6490:	f6 40 0a 80          	testb  $0x80,0xa(%eax)
    6494:	75 10                	jne    64a6 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xd6>
    6496:	8b 48 04             	mov    0x4(%eax),%ecx
    6499:	83 ec 04             	sub    $0x4,%esp
    649c:	8d 93 0b dc ff ff    	lea    -0x23f5(%ebx),%edx
    64a2:	6a 02                	push   $0x2
    64a4:	eb 0e                	jmp    64b4 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xe4>
    64a6:	8b 48 04             	mov    0x4(%eax),%ecx
    64a9:	83 ec 04             	sub    $0x4,%esp
    64ac:	8d 93 0a dc ff ff    	lea    -0x23f6(%ebx),%edx
    64b2:	6a 01                	push   $0x1
    64b4:	52                   	push   %edx
    64b5:	ff 30                	push   (%eax)
    64b7:	ff 51 0c             	call   *0xc(%ecx)
    64ba:	83 c4 10             	add    $0x10,%esp
    64bd:	24 01                	and    $0x1,%al
    64bf:	83 c4 1c             	add    $0x1c,%esp
    64c2:	5e                   	pop    %esi
    64c3:	5f                   	pop    %edi
    64c4:	5b                   	pop    %ebx
    64c5:	5d                   	pop    %ebp
    64c6:	c3                   	ret
    64c7:	66 90                	xchg   %ax,%ax
    64c9:	66 90                	xchg   %ax,%ax
    64cb:	66 90                	xchg   %ax,%ax
    64cd:	66 90                	xchg   %ax,%ax
    64cf:	90                   	nop

000064d0 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E>:
    64d0:	55                   	push   %ebp
    64d1:	53                   	push   %ebx
    64d2:	57                   	push   %edi
    64d3:	56                   	push   %esi
    64d4:	83 ec 2c             	sub    $0x2c,%esp
    64d7:	e8 00 00 00 00       	call   64dc <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0xc>
    64dc:	5b                   	pop    %ebx
    64dd:	81 c3 18 3b 00 00    	add    $0x3b18,%ebx
    64e3:	8b 74 24 44          	mov    0x44(%esp),%esi
    64e7:	8b 44 24 40          	mov    0x40(%esp),%eax
    64eb:	80 38 01             	cmpb   $0x1,(%eax)
    64ee:	75 71                	jne    6561 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x91>
    64f0:	8b 3e                	mov    (%esi),%edi
    64f2:	8b 6e 04             	mov    0x4(%esi),%ebp
    64f5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    64f8:	83 ec 04             	sub    $0x4,%esp
    64fb:	8d 83 91 e4 ff ff    	lea    -0x1b6f(%ebx),%eax
    6501:	6a 03                	push   $0x3
    6503:	50                   	push   %eax
    6504:	57                   	push   %edi
    6505:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    6509:	ff d1                	call   *%ecx
    650b:	83 c4 10             	add    $0x10,%esp
    650e:	b1 01                	mov    $0x1,%cl
    6510:	84 c0                	test   %al,%al
    6512:	0f 85 e1 01 00 00    	jne    66f9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    6518:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    651c:	0f 85 b1 00 00 00    	jne    65d3 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x103>
    6522:	83 ec 04             	sub    $0x4,%esp
    6525:	8d 83 0d dc ff ff    	lea    -0x23f3(%ebx),%eax
    652b:	6a 01                	push   $0x1
    652d:	50                   	push   %eax
    652e:	57                   	push   %edi
    652f:	8b 74 24 18          	mov    0x18(%esp),%esi
    6533:	ff d6                	call   *%esi
    6535:	83 c4 10             	add    $0x10,%esp
    6538:	84 c0                	test   %al,%al
    653a:	0f 85 84 01 00 00    	jne    66c4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    6540:	83 ec 04             	sub    $0x4,%esp
    6543:	8d 83 23 ea ff ff    	lea    -0x15dd(%ebx),%eax
    6549:	6a 0c                	push   $0xc
    654b:	50                   	push   %eax
    654c:	57                   	push   %edi
    654d:	ff d6                	call   *%esi
    654f:	83 c4 10             	add    $0x10,%esp
    6552:	84 c0                	test   %al,%al
    6554:	b1 01                	mov    $0x1,%cl
    6556:	0f 85 9d 01 00 00    	jne    66f9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    655c:	e9 e7 00 00 00       	jmp    6648 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x178>
    6561:	8b 3e                	mov    (%esi),%edi
    6563:	8b 6e 04             	mov    0x4(%esi),%ebp
    6566:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6569:	83 ec 04             	sub    $0x4,%esp
    656c:	8d 83 8f e4 ff ff    	lea    -0x1b71(%ebx),%eax
    6572:	6a 02                	push   $0x2
    6574:	50                   	push   %eax
    6575:	57                   	push   %edi
    6576:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    657a:	ff d1                	call   *%ecx
    657c:	83 c4 10             	add    $0x10,%esp
    657f:	b1 01                	mov    $0x1,%cl
    6581:	84 c0                	test   %al,%al
    6583:	0f 85 70 01 00 00    	jne    66f9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    6589:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    658d:	0f 85 c9 00 00 00    	jne    665c <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x18c>
    6593:	83 ec 04             	sub    $0x4,%esp
    6596:	8d 83 0d dc ff ff    	lea    -0x23f3(%ebx),%eax
    659c:	6a 01                	push   $0x1
    659e:	50                   	push   %eax
    659f:	57                   	push   %edi
    65a0:	ff 54 24 18          	call   *0x18(%esp)
    65a4:	83 c4 10             	add    $0x10,%esp
    65a7:	84 c0                	test   %al,%al
    65a9:	0f 85 15 01 00 00    	jne    66c4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    65af:	83 ec 0c             	sub    $0xc,%esp
    65b2:	8d 93 62 e4 ff ff    	lea    -0x1b9e(%ebx),%edx
    65b8:	89 f1                	mov    %esi,%ecx
    65ba:	6a 02                	push   $0x2
    65bc:	e8 cf cb ff ff       	call   3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    65c1:	83 c4 10             	add    $0x10,%esp
    65c4:	84 c0                	test   %al,%al
    65c6:	b1 01                	mov    $0x1,%cl
    65c8:	0f 84 15 01 00 00    	je     66e3 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x213>
    65ce:	e9 26 01 00 00       	jmp    66f9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    65d3:	83 ec 04             	sub    $0x4,%esp
    65d6:	8d 83 0e dc ff ff    	lea    -0x23f2(%ebx),%eax
    65dc:	6a 02                	push   $0x2
    65de:	50                   	push   %eax
    65df:	57                   	push   %edi
    65e0:	ff 54 24 18          	call   *0x18(%esp)
    65e4:	83 c4 10             	add    $0x10,%esp
    65e7:	84 c0                	test   %al,%al
    65e9:	0f 85 d5 00 00 00    	jne    66c4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    65ef:	c6 44 24 20 01       	movb   $0x1,0x20(%esp)
    65f4:	89 7c 24 10          	mov    %edi,0x10(%esp)
    65f8:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    65fc:	8d 44 24 20          	lea    0x20(%esp),%eax
    6600:	89 44 24 18          	mov    %eax,0x18(%esp)
    6604:	83 ec 04             	sub    $0x4,%esp
    6607:	8d 83 23 ea ff ff    	lea    -0x15dd(%ebx),%eax
    660d:	8d 74 24 14          	lea    0x14(%esp),%esi
    6611:	6a 0c                	push   $0xc
    6613:	50                   	push   %eax
    6614:	56                   	push   %esi
    6615:	e8 c6 d7 ff ff       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    661a:	83 c4 10             	add    $0x10,%esp
    661d:	84 c0                	test   %al,%al
    661f:	0f 85 9f 00 00 00    	jne    66c4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    6625:	83 ec 04             	sub    $0x4,%esp
    6628:	8d 83 08 dc ff ff    	lea    -0x23f8(%ebx),%eax
    662e:	6a 02                	push   $0x2
    6630:	50                   	push   %eax
    6631:	56                   	push   %esi
    6632:	e8 a9 d7 ff ff       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    6637:	83 c4 10             	add    $0x10,%esp
    663a:	84 c0                	test   %al,%al
    663c:	b1 01                	mov    $0x1,%cl
    663e:	8b 74 24 08          	mov    0x8(%esp),%esi
    6642:	0f 85 b1 00 00 00    	jne    66f9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    6648:	83 ec 04             	sub    $0x4,%esp
    664b:	8d 83 b1 db ff ff    	lea    -0x244f(%ebx),%eax
    6651:	6a 01                	push   $0x1
    6653:	50                   	push   %eax
    6654:	57                   	push   %edi
    6655:	ff d6                	call   *%esi
    6657:	e9 98 00 00 00       	jmp    66f4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x224>
    665c:	83 ec 04             	sub    $0x4,%esp
    665f:	8d 83 0e dc ff ff    	lea    -0x23f2(%ebx),%eax
    6665:	6a 02                	push   $0x2
    6667:	50                   	push   %eax
    6668:	57                   	push   %edi
    6669:	ff 54 24 18          	call   *0x18(%esp)
    666d:	83 c4 10             	add    $0x10,%esp
    6670:	84 c0                	test   %al,%al
    6672:	75 50                	jne    66c4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    6674:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    6679:	89 7c 24 20          	mov    %edi,0x20(%esp)
    667d:	89 6c 24 24          	mov    %ebp,0x24(%esp)
    6681:	8d 44 24 0f          	lea    0xf(%esp),%eax
    6685:	89 44 24 28          	mov    %eax,0x28(%esp)
    6689:	8b 46 08             	mov    0x8(%esi),%eax
    668c:	8b 4e 0c             	mov    0xc(%esi),%ecx
    668f:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    6693:	89 44 24 18          	mov    %eax,0x18(%esp)
    6697:	8d 74 24 20          	lea    0x20(%esp),%esi
    669b:	89 74 24 10          	mov    %esi,0x10(%esp)
    669f:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    66a5:	89 44 24 14          	mov    %eax,0x14(%esp)
    66a9:	83 ec 0c             	sub    $0xc,%esp
    66ac:	8d 93 62 e4 ff ff    	lea    -0x1b9e(%ebx),%edx
    66b2:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    66b6:	6a 02                	push   $0x2
    66b8:	e8 d3 ca ff ff       	call   3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    66bd:	83 c4 10             	add    $0x10,%esp
    66c0:	84 c0                	test   %al,%al
    66c2:	74 04                	je     66c8 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f8>
    66c4:	b1 01                	mov    $0x1,%cl
    66c6:	eb 31                	jmp    66f9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    66c8:	83 ec 04             	sub    $0x4,%esp
    66cb:	8d 83 08 dc ff ff    	lea    -0x23f8(%ebx),%eax
    66d1:	6a 02                	push   $0x2
    66d3:	50                   	push   %eax
    66d4:	56                   	push   %esi
    66d5:	e8 06 d7 ff ff       	call   3de0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    66da:	83 c4 10             	add    $0x10,%esp
    66dd:	84 c0                	test   %al,%al
    66df:	b1 01                	mov    $0x1,%cl
    66e1:	75 16                	jne    66f9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    66e3:	83 ec 04             	sub    $0x4,%esp
    66e6:	8d 83 b1 db ff ff    	lea    -0x244f(%ebx),%eax
    66ec:	6a 01                	push   $0x1
    66ee:	50                   	push   %eax
    66ef:	57                   	push   %edi
    66f0:	ff 54 24 18          	call   *0x18(%esp)
    66f4:	83 c4 10             	add    $0x10,%esp
    66f7:	89 c1                	mov    %eax,%ecx
    66f9:	89 c8                	mov    %ecx,%eax
    66fb:	83 c4 2c             	add    $0x2c,%esp
    66fe:	5e                   	pop    %esi
    66ff:	5f                   	pop    %edi
    6700:	5b                   	pop    %ebx
    6701:	5d                   	pop    %ebp
    6702:	c3                   	ret
    6703:	66 90                	xchg   %ax,%ax
    6705:	66 90                	xchg   %ax,%ax
    6707:	66 90                	xchg   %ax,%ax
    6709:	66 90                	xchg   %ax,%ax
    670b:	66 90                	xchg   %ax,%ax
    670d:	66 90                	xchg   %ax,%ax
    670f:	90                   	nop

00006710 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E>:
    6710:	55                   	push   %ebp
    6711:	53                   	push   %ebx
    6712:	57                   	push   %edi
    6713:	56                   	push   %esi
    6714:	83 ec 2c             	sub    $0x2c,%esp
    6717:	e8 00 00 00 00       	call   671c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xc>
    671c:	5b                   	pop    %ebx
    671d:	81 c3 d8 38 00 00    	add    $0x38d8,%ebx
    6723:	8b 7c 24 44          	mov    0x44(%esp),%edi
    6727:	8b 44 24 40          	mov    0x40(%esp),%eax
    672b:	8b 00                	mov    (%eax),%eax
    672d:	89 44 24 08          	mov    %eax,0x8(%esp)
    6731:	8b 17                	mov    (%edi),%edx
    6733:	8b 77 04             	mov    0x4(%edi),%esi
    6736:	8b 4e 0c             	mov    0xc(%esi),%ecx
    6739:	83 ec 04             	sub    $0x4,%esp
    673c:	8d 83 94 e4 ff ff    	lea    -0x1b6c(%ebx),%eax
    6742:	6a 09                	push   $0x9
    6744:	50                   	push   %eax
    6745:	89 d5                	mov    %edx,%ebp
    6747:	52                   	push   %edx
    6748:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    674c:	ff d1                	call   *%ecx
    674e:	83 c4 10             	add    $0x10,%esp
    6751:	b1 01                	mov    $0x1,%cl
    6753:	84 c0                	test   %al,%al
    6755:	0f 85 e6 00 00 00    	jne    6841 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    675b:	f6 47 0a 80          	testb  $0x80,0xa(%edi)
    675f:	75 42                	jne    67a3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x93>
    6761:	83 ec 04             	sub    $0x4,%esp
    6764:	8d 83 0d dc ff ff    	lea    -0x23f3(%ebx),%eax
    676a:	6a 01                	push   $0x1
    676c:	50                   	push   %eax
    676d:	55                   	push   %ebp
    676e:	ff 54 24 1c          	call   *0x1c(%esp)
    6772:	83 c4 10             	add    $0x10,%esp
    6775:	84 c0                	test   %al,%al
    6777:	0f 85 8c 00 00 00    	jne    6809 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xf9>
    677d:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    6781:	8b 74 24 44          	mov    0x44(%esp),%esi
    6785:	89 f2                	mov    %esi,%edx
    6787:	e8 c4 00 00 00       	call   6850 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>
    678c:	84 c0                	test   %al,%al
    678e:	b1 01                	mov    $0x1,%cl
    6790:	0f 85 ab 00 00 00    	jne    6841 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    6796:	8b 3e                	mov    (%esi),%edi
    6798:	8b 46 04             	mov    0x4(%esi),%eax
    679b:	8b 68 0c             	mov    0xc(%eax),%ebp
    679e:	e9 8a 00 00 00       	jmp    682d <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x11d>
    67a3:	83 ec 04             	sub    $0x4,%esp
    67a6:	8d 83 0e dc ff ff    	lea    -0x23f2(%ebx),%eax
    67ac:	6a 02                	push   $0x2
    67ae:	50                   	push   %eax
    67af:	89 ef                	mov    %ebp,%edi
    67b1:	55                   	push   %ebp
    67b2:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    67b6:	ff d5                	call   *%ebp
    67b8:	83 c4 10             	add    $0x10,%esp
    67bb:	84 c0                	test   %al,%al
    67bd:	75 4a                	jne    6809 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xf9>
    67bf:	c6 44 24 07 01       	movb   $0x1,0x7(%esp)
    67c4:	89 7c 24 20          	mov    %edi,0x20(%esp)
    67c8:	89 74 24 24          	mov    %esi,0x24(%esp)
    67cc:	8d 44 24 07          	lea    0x7(%esp),%eax
    67d0:	89 44 24 28          	mov    %eax,0x28(%esp)
    67d4:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    67d8:	8b 41 08             	mov    0x8(%ecx),%eax
    67db:	8b 49 0c             	mov    0xc(%ecx),%ecx
    67de:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    67e2:	89 44 24 18          	mov    %eax,0x18(%esp)
    67e6:	8d 44 24 20          	lea    0x20(%esp),%eax
    67ea:	89 44 24 10          	mov    %eax,0x10(%esp)
    67ee:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    67f4:	89 44 24 14          	mov    %eax,0x14(%esp)
    67f8:	8d 54 24 10          	lea    0x10(%esp),%edx
    67fc:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    6800:	e8 4b 00 00 00       	call   6850 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>
    6805:	84 c0                	test   %al,%al
    6807:	74 04                	je     680d <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xfd>
    6809:	b1 01                	mov    $0x1,%cl
    680b:	eb 34                	jmp    6841 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    680d:	8b 44 24 14          	mov    0x14(%esp),%eax
    6811:	83 ec 04             	sub    $0x4,%esp
    6814:	8d 8b 08 dc ff ff    	lea    -0x23f8(%ebx),%ecx
    681a:	6a 02                	push   $0x2
    681c:	51                   	push   %ecx
    681d:	ff 74 24 1c          	push   0x1c(%esp)
    6821:	ff 50 0c             	call   *0xc(%eax)
    6824:	83 c4 10             	add    $0x10,%esp
    6827:	84 c0                	test   %al,%al
    6829:	b1 01                	mov    $0x1,%cl
    682b:	75 14                	jne    6841 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    682d:	83 ec 04             	sub    $0x4,%esp
    6830:	8d 83 b1 db ff ff    	lea    -0x244f(%ebx),%eax
    6836:	6a 01                	push   $0x1
    6838:	50                   	push   %eax
    6839:	57                   	push   %edi
    683a:	ff d5                	call   *%ebp
    683c:	83 c4 10             	add    $0x10,%esp
    683f:	89 c1                	mov    %eax,%ecx
    6841:	89 c8                	mov    %ecx,%eax
    6843:	83 c4 2c             	add    $0x2c,%esp
    6846:	5e                   	pop    %esi
    6847:	5f                   	pop    %edi
    6848:	5b                   	pop    %ebx
    6849:	5d                   	pop    %ebp
    684a:	c3                   	ret
    684b:	66 90                	xchg   %ax,%ax
    684d:	66 90                	xchg   %ax,%ax
    684f:	90                   	nop

00006850 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>:
    6850:	53                   	push   %ebx
    6851:	57                   	push   %edi
    6852:	56                   	push   %esi
    6853:	81 ec 80 00 00 00    	sub    $0x80,%esp
    6859:	e8 00 00 00 00       	call   685e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xe>
    685e:	5b                   	pop    %ebx
    685f:	81 c3 96 37 00 00    	add    $0x3796,%ebx
    6865:	8b 42 08             	mov    0x8(%edx),%eax
    6868:	a9 00 00 00 02       	test   $0x2000000,%eax
    686d:	75 1b                	jne    688a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x3a>
    686f:	a9 00 00 00 04       	test   $0x4000000,%eax
    6874:	75 51                	jne    68c7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x77>
    6876:	83 ec 08             	sub    $0x8,%esp
    6879:	52                   	push   %edx
    687a:	51                   	push   %ecx
    687b:	e8 00 c5 ff ff       	call   2d80 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>
    6880:	81 c4 90 00 00 00    	add    $0x90,%esp
    6886:	5e                   	pop    %esi
    6887:	5f                   	pop    %edi
    6888:	5b                   	pop    %ebx
    6889:	c3                   	ret
    688a:	8b 01                	mov    (%ecx),%eax
    688c:	b9 81 00 00 00       	mov    $0x81,%ecx
    6891:	eb 23                	jmp    68b6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x66>
    6893:	90                   	nop
    6894:	90                   	nop
    6895:	90                   	nop
    6896:	90                   	nop
    6897:	90                   	nop
    6898:	90                   	nop
    6899:	90                   	nop
    689a:	90                   	nop
    689b:	90                   	nop
    689c:	90                   	nop
    689d:	90                   	nop
    689e:	90                   	nop
    689f:	90                   	nop
    68a0:	80 c1 57             	add    $0x57,%cl
    68a3:	89 c7                	mov    %eax,%edi
    68a5:	c1 ef 04             	shr    $0x4,%edi
    68a8:	88 4c 34 fe          	mov    %cl,-0x2(%esp,%esi,1)
    68ac:	8d 4e ff             	lea    -0x1(%esi),%ecx
    68af:	83 f8 0f             	cmp    $0xf,%eax
    68b2:	89 f8                	mov    %edi,%eax
    68b4:	76 41                	jbe    68f7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xa7>
    68b6:	89 ce                	mov    %ecx,%esi
    68b8:	89 c1                	mov    %eax,%ecx
    68ba:	80 e1 0f             	and    $0xf,%cl
    68bd:	80 f9 0a             	cmp    $0xa,%cl
    68c0:	73 de                	jae    68a0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x50>
    68c2:	80 c9 30             	or     $0x30,%cl
    68c5:	eb dc                	jmp    68a3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x53>
    68c7:	8b 01                	mov    (%ecx),%eax
    68c9:	b9 81 00 00 00       	mov    $0x81,%ecx
    68ce:	eb 16                	jmp    68e6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x96>
    68d0:	80 c1 37             	add    $0x37,%cl
    68d3:	89 c7                	mov    %eax,%edi
    68d5:	c1 ef 04             	shr    $0x4,%edi
    68d8:	88 4c 34 fe          	mov    %cl,-0x2(%esp,%esi,1)
    68dc:	8d 4e ff             	lea    -0x1(%esi),%ecx
    68df:	83 f8 0f             	cmp    $0xf,%eax
    68e2:	89 f8                	mov    %edi,%eax
    68e4:	76 11                	jbe    68f7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xa7>
    68e6:	89 ce                	mov    %ecx,%esi
    68e8:	89 c1                	mov    %eax,%ecx
    68ea:	80 e1 0f             	and    $0xf,%cl
    68ed:	80 f9 0a             	cmp    $0xa,%cl
    68f0:	73 de                	jae    68d0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x80>
    68f2:	80 c9 30             	or     $0x30,%cl
    68f5:	eb dc                	jmp    68d3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x83>
    68f7:	83 c6 fe             	add    $0xfffffffe,%esi
    68fa:	8d 04 34             	lea    (%esp,%esi,1),%eax
    68fd:	be 81 00 00 00       	mov    $0x81,%esi
    6902:	29 ce                	sub    %ecx,%esi
    6904:	8d bb 10 dc ff ff    	lea    -0x23f0(%ebx),%edi
    690a:	89 d1                	mov    %edx,%ecx
    690c:	ba 01 00 00 00       	mov    $0x1,%edx
    6911:	56                   	push   %esi
    6912:	50                   	push   %eax
    6913:	6a 02                	push   $0x2
    6915:	57                   	push   %edi
    6916:	e8 75 c5 ff ff       	call   2e90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    691b:	83 c4 10             	add    $0x10,%esp
    691e:	81 c4 80 00 00 00    	add    $0x80,%esp
    6924:	5e                   	pop    %esi
    6925:	5f                   	pop    %edi
    6926:	5b                   	pop    %ebx
    6927:	c3                   	ret
    6928:	66 90                	xchg   %ax,%ax
    692a:	66 90                	xchg   %ax,%ax
    692c:	66 90                	xchg   %ax,%ax
    692e:	66 90                	xchg   %ax,%ax

00006930 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h744bf35b61fad11fE>:
    6930:	53                   	push   %ebx
    6931:	83 ec 08             	sub    $0x8,%esp
    6934:	e8 00 00 00 00       	call   6939 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h744bf35b61fad11fE+0x9>
    6939:	5b                   	pop    %ebx
    693a:	81 c3 bb 36 00 00    	add    $0x36bb,%ebx
    6940:	8b 44 24 14          	mov    0x14(%esp),%eax
    6944:	8b 48 04             	mov    0x4(%eax),%ecx
    6947:	83 ec 04             	sub    $0x4,%esp
    694a:	8d 93 e3 e8 ff ff    	lea    -0x171d(%ebx),%edx
    6950:	6a 0d                	push   $0xd
    6952:	52                   	push   %edx
    6953:	ff 30                	push   (%eax)
    6955:	ff 51 0c             	call   *0xc(%ecx)
    6958:	83 c4 18             	add    $0x18,%esp
    695b:	5b                   	pop    %ebx
    695c:	c3                   	ret
    695d:	66 90                	xchg   %ax,%ax
    695f:	90                   	nop

00006960 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E>:
    6960:	53                   	push   %ebx
    6961:	83 ec 38             	sub    $0x38,%esp
    6964:	e8 00 00 00 00       	call   6969 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0x9>
    6969:	5b                   	pop    %ebx
    696a:	81 c3 8b 36 00 00    	add    $0x368b,%ebx
    6970:	8b 44 24 44          	mov    0x44(%esp),%eax
    6974:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    6978:	8b 11                	mov    (%ecx),%edx
    697a:	83 c1 04             	add    $0x4,%ecx
    697d:	8b 94 93 7c d5 ff ff 	mov    -0x2a84(%ebx,%edx,4),%edx
    6984:	01 da                	add    %ebx,%edx
    6986:	ff e2                	jmp    *%edx
    6988:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    698c:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    6990:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    6994:	8d 8b 4c ca ff ff    	lea    -0x35b4(%ebx),%ecx
    699a:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    699e:	8d 8b f0 fe ff ff    	lea    -0x110(%ebx),%ecx
    69a4:	eb 5c                	jmp    6a02 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0xa2>
    69a6:	8b 08                	mov    (%eax),%ecx
    69a8:	8b 40 04             	mov    0x4(%eax),%eax
    69ab:	8d 93 48 e9 ff ff    	lea    -0x16b8(%ebx),%edx
    69b1:	89 54 24 04          	mov    %edx,0x4(%esp)
    69b5:	89 0c 24             	mov    %ecx,(%esp)
    69b8:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
    69bf:	00 
    69c0:	ff 50 0c             	call   *0xc(%eax)
    69c3:	83 c4 38             	add    $0x38,%esp
    69c6:	5b                   	pop    %ebx
    69c7:	c3                   	ret
    69c8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    69cc:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    69d0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    69d4:	8d 8b dc ca ff ff    	lea    -0x3524(%ebx),%ecx
    69da:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    69de:	8d 8b 00 ff ff ff    	lea    -0x100(%ebx),%ecx
    69e4:	eb 1c                	jmp    6a02 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0xa2>
    69e6:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    69ea:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    69ee:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    69f2:	8d 8b 3c c9 ff ff    	lea    -0x36c4(%ebx),%ecx
    69f8:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    69fc:	8d 8b f8 fe ff ff    	lea    -0x108(%ebx),%ecx
    6a02:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    6a06:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%esp)
    6a0d:	00 
    6a0e:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    6a15:	00 
    6a16:	8d 4c 24 18          	lea    0x18(%esp),%ecx
    6a1a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    6a1e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    6a25:	00 
    6a26:	8b 08                	mov    (%eax),%ecx
    6a28:	8b 50 04             	mov    0x4(%eax),%edx
    6a2b:	8d 44 24 20          	lea    0x20(%esp),%eax
    6a2f:	89 04 24             	mov    %eax,(%esp)
    6a32:	e8 39 cd ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    6a37:	83 c4 38             	add    $0x38,%esp
    6a3a:	5b                   	pop    %ebx
    6a3b:	c3                   	ret
    6a3c:	66 90                	xchg   %ax,%ax
    6a3e:	66 90                	xchg   %ax,%ax

00006a40 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE>:
    6a40:	53                   	push   %ebx
    6a41:	83 ec 28             	sub    $0x28,%esp
    6a44:	e8 00 00 00 00       	call   6a49 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE+0x9>
    6a49:	5b                   	pop    %ebx
    6a4a:	81 c3 ab 35 00 00    	add    $0x35ab,%ebx
    6a50:	8b 44 24 34          	mov    0x34(%esp),%eax
    6a54:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    6a58:	8b 09                	mov    (%ecx),%ecx
    6a5a:	83 39 00             	cmpl   $0x0,(%ecx)
    6a5d:	74 57                	je     6ab6 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE+0x76>
    6a5f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    6a63:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    6a67:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    6a6b:	8d 8b ac c3 ff ff    	lea    -0x3c54(%ebx),%ecx
    6a71:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    6a75:	8d 8b e8 fe ff ff    	lea    -0x118(%ebx),%ecx
    6a7b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6a7f:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    6a86:	00 
    6a87:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    6a8e:	00 
    6a8f:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    6a93:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    6a97:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    6a9e:	00 
    6a9f:	8b 08                	mov    (%eax),%ecx
    6aa1:	8b 50 04             	mov    0x4(%eax),%edx
    6aa4:	83 ec 0c             	sub    $0xc,%esp
    6aa7:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    6aab:	50                   	push   %eax
    6aac:	e8 bf cc ff ff       	call   3770 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    6ab1:	83 c4 38             	add    $0x38,%esp
    6ab4:	5b                   	pop    %ebx
    6ab5:	c3                   	ret
    6ab6:	8b 48 04             	mov    0x4(%eax),%ecx
    6ab9:	83 ec 04             	sub    $0x4,%esp
    6abc:	8d 93 f0 e8 ff ff    	lea    -0x1710(%ebx),%edx
    6ac2:	6a 17                	push   $0x17
    6ac4:	52                   	push   %edx
    6ac5:	ff 30                	push   (%eax)
    6ac7:	ff 51 0c             	call   *0xc(%ecx)
    6aca:	83 c4 38             	add    $0x38,%esp
    6acd:	5b                   	pop    %ebx
    6ace:	c3                   	ret
    6acf:	90                   	nop

00006ad0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h85bd4713be9ebf66E>:
    6ad0:	53                   	push   %ebx
    6ad1:	83 ec 08             	sub    $0x8,%esp
    6ad4:	e8 00 00 00 00       	call   6ad9 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h85bd4713be9ebf66E+0x9>
    6ad9:	5b                   	pop    %ebx
    6ada:	81 c3 1b 35 00 00    	add    $0x351b,%ebx
    6ae0:	8b 44 24 14          	mov    0x14(%esp),%eax
    6ae4:	8b 48 04             	mov    0x4(%eax),%ecx
    6ae7:	83 ec 04             	sub    $0x4,%esp
    6aea:	8d 93 fb e2 ff ff    	lea    -0x1d05(%ebx),%edx
    6af0:	6a 18                	push   $0x18
    6af2:	52                   	push   %edx
    6af3:	ff 30                	push   (%eax)
    6af5:	ff 51 0c             	call   *0xc(%ecx)
    6af8:	83 c4 18             	add    $0x18,%esp
    6afb:	5b                   	pop    %ebx
    6afc:	c3                   	ret
    6afd:	66 90                	xchg   %ax,%ax
    6aff:	90                   	nop

00006b00 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>:
    6b00:	53                   	push   %ebx
    6b01:	83 ec 58             	sub    $0x58,%esp
    6b04:	e8 00 00 00 00       	call   6b09 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x9>
    6b09:	5b                   	pop    %ebx
    6b0a:	81 c3 eb 34 00 00    	add    $0x34eb,%ebx
    6b10:	89 0c 24             	mov    %ecx,(%esp)
    6b13:	85 c9                	test   %ecx,%ecx
    6b15:	0f 84 d7 01 00 00    	je     6cf2 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    6b1b:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    6b21:	83 f8 03             	cmp    $0x3,%eax
    6b24:	0f 86 cd 00 00 00    	jbe    6bf7 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xf7>
    6b2a:	89 e0                	mov    %esp,%eax
    6b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
    6b30:	8d 83 8c a1 ff ff    	lea    -0x5e74(%ebx),%eax
    6b36:	89 44 24 08          	mov    %eax,0x8(%esp)
    6b3a:	c7 44 24 34 04 00 00 	movl   $0x4,0x34(%esp)
    6b41:	00 
    6b42:	8d 83 e6 e9 ff ff    	lea    -0x161a(%ebx),%eax
    6b48:	89 44 24 38          	mov    %eax,0x38(%esp)
    6b4c:	c7 44 24 3c 1c 00 00 	movl   $0x1c,0x3c(%esp)
    6b53:	00 
    6b54:	8d 8b 08 ff ff ff    	lea    -0xf8(%ebx),%ecx
    6b5a:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    6b5e:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    6b65:	00 
    6b66:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    6b6a:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    6b6e:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    6b75:	00 
    6b76:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    6b7d:	00 
    6b7e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    6b85:	00 
    6b86:	89 44 24 20          	mov    %eax,0x20(%esp)
    6b8a:	c7 44 24 24 1c 00 00 	movl   $0x1c,0x24(%esp)
    6b91:	00 
    6b92:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    6b99:	00 
    6b9a:	8d 83 7e e9 ff ff    	lea    -0x1682(%ebx),%eax
    6ba0:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    6ba4:	c7 44 24 30 4b 00 00 	movl   $0x4b,0x30(%esp)
    6bab:	00 
    6bac:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    6bb3:	00 
    6bb4:	c7 44 24 18 51 00 00 	movl   $0x51,0x18(%esp)
    6bbb:	00 
    6bbc:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    6bc2:	83 f8 02             	cmp    $0x2,%eax
    6bc5:	74 10                	je     6bd7 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xd7>
    6bc7:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    6bcd:	75 10                	jne    6bdf <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xdf>
    6bcf:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    6bd5:	eb 0e                	jmp    6be5 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xe5>
    6bd7:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    6bdd:	74 f0                	je     6bcf <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xcf>
    6bdf:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    6be5:	83 ec 08             	sub    $0x8,%esp
    6be8:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    6bec:	52                   	push   %edx
    6bed:	51                   	push   %ecx
    6bee:	ff 50 10             	call   *0x10(%eax)
    6bf1:	83 c4 10             	add    $0x10,%esp
    6bf4:	8b 0c 24             	mov    (%esp),%ecx
    6bf7:	b8 8d 00 00 00       	mov    $0x8d,%eax
    6bfc:	89 ca                	mov    %ecx,%edx
    6bfe:	cd 80                	int    $0x80
    6c00:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6c03:	83 f9 0a             	cmp    $0xa,%ecx
    6c06:	0f 83 eb 00 00 00    	jae    6cf7 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f7>
    6c0c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6c10:	8d 44 24 0c          	lea    0xc(%esp),%eax
    6c14:	89 44 24 10          	mov    %eax,0x10(%esp)
    6c18:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    6c1e:	85 c0                	test   %eax,%eax
    6c20:	0f 84 cc 00 00 00    	je     6cf2 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    6c26:	8d 44 24 10          	lea    0x10(%esp),%eax
    6c2a:	89 44 24 04          	mov    %eax,0x4(%esp)
    6c2e:	8d 83 1c cd ff ff    	lea    -0x32e4(%ebx),%eax
    6c34:	89 44 24 08          	mov    %eax,0x8(%esp)
    6c38:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%esp)
    6c3f:	00 
    6c40:	8d 83 e6 e9 ff ff    	lea    -0x161a(%ebx),%eax
    6c46:	89 44 24 38          	mov    %eax,0x38(%esp)
    6c4a:	c7 44 24 3c 1c 00 00 	movl   $0x1c,0x3c(%esp)
    6c51:	00 
    6c52:	8d 8b 10 ff ff ff    	lea    -0xf0(%ebx),%ecx
    6c58:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    6c5c:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    6c63:	00 
    6c64:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    6c68:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    6c6c:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    6c73:	00 
    6c74:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    6c7b:	00 
    6c7c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    6c83:	00 
    6c84:	89 44 24 20          	mov    %eax,0x20(%esp)
    6c88:	c7 44 24 24 1c 00 00 	movl   $0x1c,0x24(%esp)
    6c8f:	00 
    6c90:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    6c97:	00 
    6c98:	8d 83 7e e9 ff ff    	lea    -0x1682(%ebx),%eax
    6c9e:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    6ca2:	c7 44 24 30 4b 00 00 	movl   $0x4b,0x30(%esp)
    6ca9:	00 
    6caa:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    6cb1:	00 
    6cb2:	c7 44 24 18 59 00 00 	movl   $0x59,0x18(%esp)
    6cb9:	00 
    6cba:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    6cc0:	83 f8 02             	cmp    $0x2,%eax
    6cc3:	74 10                	je     6cd5 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1d5>
    6cc5:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    6ccb:	75 10                	jne    6cdd <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1dd>
    6ccd:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    6cd3:	eb 0e                	jmp    6ce3 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1e3>
    6cd5:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    6cdb:	74 f0                	je     6ccd <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1cd>
    6cdd:	8d 8b 9b ea ff ff    	lea    -0x1565(%ebx),%ecx
    6ce3:	83 ec 08             	sub    $0x8,%esp
    6ce6:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    6cea:	52                   	push   %edx
    6ceb:	51                   	push   %ecx
    6cec:	ff 50 10             	call   *0x10(%eax)
    6cef:	83 c4 10             	add    $0x10,%esp
    6cf2:	83 c4 58             	add    $0x58,%esp
    6cf5:	5b                   	pop    %ebx
    6cf6:	c3                   	ret
    6cf7:	85 c0                	test   %eax,%eax
    6cf9:	b8 42 00 00 00       	mov    $0x42,%eax
    6cfe:	74 f2                	je     6cf2 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    6d00:	e9 07 ff ff ff       	jmp    6c0c <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x10c>
    6d05:	66 90                	xchg   %ax,%ax
    6d07:	66 90                	xchg   %ax,%ax
    6d09:	66 90                	xchg   %ax,%ax
    6d0b:	66 90                	xchg   %ax,%ax
    6d0d:	66 90                	xchg   %ax,%ax
    6d0f:	90                   	nop

00006d10 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE>:
    6d10:	53                   	push   %ebx
    6d11:	56                   	push   %esi
    6d12:	50                   	push   %eax
    6d13:	e8 00 00 00 00       	call   6d18 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0x8>
    6d18:	5b                   	pop    %ebx
    6d19:	81 c3 dc 32 00 00    	add    $0x32dc,%ebx
    6d1f:	8b 44 24 10          	mov    0x10(%esp),%eax
    6d23:	8b 00                	mov    (%eax),%eax
    6d25:	8b 10                	mov    (%eax),%edx
    6d27:	8d 83 23 ea ff ff    	lea    -0x15dd(%ebx),%eax
    6d2d:	b9 0c 00 00 00       	mov    $0xc,%ecx
    6d32:	4a                   	dec    %edx
    6d33:	8b 94 93 8c d5 ff ff 	mov    -0x2a74(%ebx,%edx,4),%edx
    6d3a:	01 da                	add    %ebx,%edx
    6d3c:	ff e2                	jmp    *%edx
    6d3e:	8d 83 2f ea ff ff    	lea    -0x15d1(%ebx),%eax
    6d44:	b9 0b 00 00 00       	mov    $0xb,%ecx
    6d49:	eb 69                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6d4b:	8d 83 cb d7 ff ff    	lea    -0x2835(%ebx),%eax
    6d51:	b9 08 00 00 00       	mov    $0x8,%ecx
    6d56:	eb 5c                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6d58:	8d 83 74 ea ff ff    	lea    -0x158c(%ebx),%eax
    6d5e:	b9 0f 00 00 00       	mov    $0xf,%ecx
    6d63:	eb 4f                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6d65:	8d 83 3a ea ff ff    	lea    -0x15c6(%ebx),%eax
    6d6b:	b9 0f 00 00 00       	mov    $0xf,%ecx
    6d70:	eb 42                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6d72:	8d 83 49 ea ff ff    	lea    -0x15b7(%ebx),%eax
    6d78:	eb 3a                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6d7a:	8d 83 36 d7 ff ff    	lea    -0x28ca(%ebx),%eax
    6d80:	b9 10 00 00 00       	mov    $0x10,%ecx
    6d85:	eb 2d                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6d87:	8d 83 83 ea ff ff    	lea    -0x157d(%ebx),%eax
    6d8d:	b9 06 00 00 00       	mov    $0x6,%ecx
    6d92:	eb 20                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6d94:	8d 83 26 d7 ff ff    	lea    -0x28da(%ebx),%eax
    6d9a:	b9 10 00 00 00       	mov    $0x10,%ecx
    6d9f:	eb 13                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6da1:	8d 83 55 ea ff ff    	lea    -0x15ab(%ebx),%eax
    6da7:	eb 0b                	jmp    6db4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6da9:	8d 83 61 ea ff ff    	lea    -0x159f(%ebx),%eax
    6daf:	b9 13 00 00 00       	mov    $0x13,%ecx
    6db4:	8b 54 24 14          	mov    0x14(%esp),%edx
    6db8:	8b 72 04             	mov    0x4(%edx),%esi
    6dbb:	83 ec 04             	sub    $0x4,%esp
    6dbe:	51                   	push   %ecx
    6dbf:	50                   	push   %eax
    6dc0:	ff 32                	push   (%edx)
    6dc2:	ff 56 0c             	call   *0xc(%esi)
    6dc5:	83 c4 14             	add    $0x14,%esp
    6dc8:	5e                   	pop    %esi
    6dc9:	5b                   	pop    %ebx
    6dca:	c3                   	ret
    6dcb:	0f 0b                	ud2
    6dcd:	66 90                	xchg   %ax,%ax
    6dcf:	90                   	nop

00006dd0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>:
    6dd0:	89 c8                	mov    %ecx,%eax
    6dd2:	83 f9 0b             	cmp    $0xb,%ecx
    6dd5:	72 05                	jb     6ddc <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E+0xc>
    6dd7:	b8 42 00 00 00       	mov    $0x42,%eax
    6ddc:	c3                   	ret
    6ddd:	66 90                	xchg   %ax,%ax
    6ddf:	90                   	nop

00006de0 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E>:
    6de0:	53                   	push   %ebx
    6de1:	83 ec 08             	sub    $0x8,%esp
    6de4:	e8 00 00 00 00       	call   6de9 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E+0x9>
    6de9:	5b                   	pop    %ebx
    6dea:	81 c3 0b 32 00 00    	add    $0x320b,%ebx
    6df0:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    6df4:	8b 44 24 10          	mov    0x10(%esp),%eax
    6df8:	8b 00                	mov    (%eax),%eax
    6dfa:	8b 94 c3 30 ff ff ff 	mov    -0xd0(%ebx,%eax,8),%edx
    6e01:	8b 84 c3 34 ff ff ff 	mov    -0xcc(%ebx,%eax,8),%eax
    6e08:	89 04 24             	mov    %eax,(%esp)
    6e0b:	e8 80 c3 ff ff       	call   3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    6e10:	83 c4 08             	add    $0x8,%esp
    6e13:	5b                   	pop    %ebx
    6e14:	c3                   	ret
    6e15:	66 90                	xchg   %ax,%ax
    6e17:	66 90                	xchg   %ax,%ax
    6e19:	66 90                	xchg   %ax,%ax
    6e1b:	66 90                	xchg   %ax,%ax
    6e1d:	66 90                	xchg   %ax,%ax
    6e1f:	90                   	nop

00006e20 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$7enabled17h7c1fbd7539bc5801E>:
    6e20:	31 c0                	xor    %eax,%eax
    6e22:	c3                   	ret
    6e23:	66 90                	xchg   %ax,%ax
    6e25:	66 90                	xchg   %ax,%ax
    6e27:	66 90                	xchg   %ax,%ax
    6e29:	66 90                	xchg   %ax,%ax
    6e2b:	66 90                	xchg   %ax,%ax
    6e2d:	66 90                	xchg   %ax,%ax
    6e2f:	90                   	nop

00006e30 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$3log17hb129cc8b65bcebf0E>:
    6e30:	c3                   	ret
    6e31:	66 90                	xchg   %ax,%ax
    6e33:	66 90                	xchg   %ax,%ax
    6e35:	66 90                	xchg   %ax,%ax
    6e37:	66 90                	xchg   %ax,%ax
    6e39:	66 90                	xchg   %ax,%ax
    6e3b:	66 90                	xchg   %ax,%ax
    6e3d:	66 90                	xchg   %ax,%ax
    6e3f:	90                   	nop

00006e40 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$5flush17hb87dc07497484b4cE>:
    6e40:	c3                   	ret
    6e41:	66 90                	xchg   %ax,%ax
    6e43:	66 90                	xchg   %ax,%ax
    6e45:	66 90                	xchg   %ax,%ax
    6e47:	66 90                	xchg   %ax,%ax
    6e49:	66 90                	xchg   %ax,%ax
    6e4b:	66 90                	xchg   %ax,%ax
    6e4d:	66 90                	xchg   %ax,%ax
    6e4f:	90                   	nop

00006e50 <memcpy>:
    6e50:	55                   	push   %ebp
    6e51:	53                   	push   %ebx
    6e52:	57                   	push   %edi
    6e53:	56                   	push   %esi
    6e54:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    6e58:	8b 54 24 18          	mov    0x18(%esp),%edx
    6e5c:	8b 44 24 14          	mov    0x14(%esp),%eax
    6e60:	89 c6                	mov    %eax,%esi
    6e62:	83 fd 10             	cmp    $0x10,%ebp
    6e65:	72 63                	jb     6eca <memcpy+0x7a>
    6e67:	f7 de                	neg    %esi
    6e69:	83 e6 03             	and    $0x3,%esi
    6e6c:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    6e6f:	39 f8                	cmp    %edi,%eax
    6e71:	73 19                	jae    6e8c <memcpy+0x3c>
    6e73:	31 db                	xor    %ebx,%ebx
    6e75:	90                   	nop
    6e76:	90                   	nop
    6e77:	90                   	nop
    6e78:	90                   	nop
    6e79:	90                   	nop
    6e7a:	90                   	nop
    6e7b:	90                   	nop
    6e7c:	90                   	nop
    6e7d:	90                   	nop
    6e7e:	90                   	nop
    6e7f:	90                   	nop
    6e80:	0f b6 0c 1a          	movzbl (%edx,%ebx,1),%ecx
    6e84:	88 0c 18             	mov    %cl,(%eax,%ebx,1)
    6e87:	43                   	inc    %ebx
    6e88:	39 de                	cmp    %ebx,%esi
    6e8a:	75 f4                	jne    6e80 <memcpy+0x30>
    6e8c:	01 f2                	add    %esi,%edx
    6e8e:	29 f5                	sub    %esi,%ebp
    6e90:	89 e8                	mov    %ebp,%eax
    6e92:	89 eb                	mov    %ebp,%ebx
    6e94:	83 e3 fc             	and    $0xfffffffc,%ebx
    6e97:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
    6e9a:	f6 c2 03             	test   $0x3,%dl
    6e9d:	75 52                	jne    6ef1 <memcpy+0xa1>
    6e9f:	39 f7                	cmp    %esi,%edi
    6ea1:	73 1c                	jae    6ebf <memcpy+0x6f>
    6ea3:	89 d5                	mov    %edx,%ebp
    6ea5:	90                   	nop
    6ea6:	90                   	nop
    6ea7:	90                   	nop
    6ea8:	90                   	nop
    6ea9:	90                   	nop
    6eaa:	90                   	nop
    6eab:	90                   	nop
    6eac:	90                   	nop
    6ead:	90                   	nop
    6eae:	90                   	nop
    6eaf:	90                   	nop
    6eb0:	8b 4d 00             	mov    0x0(%ebp),%ecx
    6eb3:	89 0f                	mov    %ecx,(%edi)
    6eb5:	83 c7 04             	add    $0x4,%edi
    6eb8:	83 c5 04             	add    $0x4,%ebp
    6ebb:	39 f7                	cmp    %esi,%edi
    6ebd:	72 f1                	jb     6eb0 <memcpy+0x60>
    6ebf:	01 da                	add    %ebx,%edx
    6ec1:	89 c5                	mov    %eax,%ebp
    6ec3:	83 e5 03             	and    $0x3,%ebp
    6ec6:	8b 44 24 14          	mov    0x14(%esp),%eax
    6eca:	8d 3c 2e             	lea    (%esi,%ebp,1),%edi
    6ecd:	39 fe                	cmp    %edi,%esi
    6ecf:	73 1b                	jae    6eec <memcpy+0x9c>
    6ed1:	31 ff                	xor    %edi,%edi
    6ed3:	90                   	nop
    6ed4:	90                   	nop
    6ed5:	90                   	nop
    6ed6:	90                   	nop
    6ed7:	90                   	nop
    6ed8:	90                   	nop
    6ed9:	90                   	nop
    6eda:	90                   	nop
    6edb:	90                   	nop
    6edc:	90                   	nop
    6edd:	90                   	nop
    6ede:	90                   	nop
    6edf:	90                   	nop
    6ee0:	0f b6 0c 3a          	movzbl (%edx,%edi,1),%ecx
    6ee4:	88 0c 3e             	mov    %cl,(%esi,%edi,1)
    6ee7:	47                   	inc    %edi
    6ee8:	39 fd                	cmp    %edi,%ebp
    6eea:	75 f4                	jne    6ee0 <memcpy+0x90>
    6eec:	5e                   	pop    %esi
    6eed:	5f                   	pop    %edi
    6eee:	5b                   	pop    %ebx
    6eef:	5d                   	pop    %ebp
    6ef0:	c3                   	ret
    6ef1:	39 f7                	cmp    %esi,%edi
    6ef3:	73 ca                	jae    6ebf <memcpy+0x6f>
    6ef5:	89 d5                	mov    %edx,%ebp
    6ef7:	8b 4d 00             	mov    0x0(%ebp),%ecx
    6efa:	89 0f                	mov    %ecx,(%edi)
    6efc:	83 c7 04             	add    $0x4,%edi
    6eff:	83 c5 04             	add    $0x4,%ebp
    6f02:	39 f7                	cmp    %esi,%edi
    6f04:	72 f1                	jb     6ef7 <memcpy+0xa7>
    6f06:	eb b7                	jmp    6ebf <memcpy+0x6f>
    6f08:	66 90                	xchg   %ax,%ax
    6f0a:	66 90                	xchg   %ax,%ax
    6f0c:	66 90                	xchg   %ax,%ax
    6f0e:	66 90                	xchg   %ax,%ax

00006f10 <memset>:
    6f10:	53                   	push   %ebx
    6f11:	57                   	push   %edi
    6f12:	56                   	push   %esi
    6f13:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    6f17:	8b 54 24 14          	mov    0x14(%esp),%edx
    6f1b:	8b 44 24 10          	mov    0x10(%esp),%eax
    6f1f:	89 c6                	mov    %eax,%esi
    6f21:	83 f9 10             	cmp    $0x10,%ecx
    6f24:	72 46                	jb     6f6c <memset+0x5c>
    6f26:	f7 de                	neg    %esi
    6f28:	83 e6 03             	and    $0x3,%esi
    6f2b:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    6f2e:	39 f8                	cmp    %edi,%eax
    6f30:	73 16                	jae    6f48 <memset+0x38>
    6f32:	31 db                	xor    %ebx,%ebx
    6f34:	90                   	nop
    6f35:	90                   	nop
    6f36:	90                   	nop
    6f37:	90                   	nop
    6f38:	90                   	nop
    6f39:	90                   	nop
    6f3a:	90                   	nop
    6f3b:	90                   	nop
    6f3c:	90                   	nop
    6f3d:	90                   	nop
    6f3e:	90                   	nop
    6f3f:	90                   	nop
    6f40:	88 14 18             	mov    %dl,(%eax,%ebx,1)
    6f43:	43                   	inc    %ebx
    6f44:	39 de                	cmp    %ebx,%esi
    6f46:	75 f8                	jne    6f40 <memset+0x30>
    6f48:	29 f1                	sub    %esi,%ecx
    6f4a:	89 ce                	mov    %ecx,%esi
    6f4c:	83 e6 fc             	and    $0xfffffffc,%esi
    6f4f:	01 fe                	add    %edi,%esi
    6f51:	39 f7                	cmp    %esi,%edi
    6f53:	73 14                	jae    6f69 <memset+0x59>
    6f55:	0f b6 da             	movzbl %dl,%ebx
    6f58:	69 db 01 01 01 01    	imul   $0x1010101,%ebx,%ebx
    6f5e:	90                   	nop
    6f5f:	90                   	nop
    6f60:	89 1f                	mov    %ebx,(%edi)
    6f62:	83 c7 04             	add    $0x4,%edi
    6f65:	39 f7                	cmp    %esi,%edi
    6f67:	72 f7                	jb     6f60 <memset+0x50>
    6f69:	83 e1 03             	and    $0x3,%ecx
    6f6c:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
    6f6f:	39 fe                	cmp    %edi,%esi
    6f71:	73 15                	jae    6f88 <memset+0x78>
    6f73:	31 ff                	xor    %edi,%edi
    6f75:	90                   	nop
    6f76:	90                   	nop
    6f77:	90                   	nop
    6f78:	90                   	nop
    6f79:	90                   	nop
    6f7a:	90                   	nop
    6f7b:	90                   	nop
    6f7c:	90                   	nop
    6f7d:	90                   	nop
    6f7e:	90                   	nop
    6f7f:	90                   	nop
    6f80:	88 14 3e             	mov    %dl,(%esi,%edi,1)
    6f83:	47                   	inc    %edi
    6f84:	39 f9                	cmp    %edi,%ecx
    6f86:	75 f8                	jne    6f80 <memset+0x70>
    6f88:	5e                   	pop    %esi
    6f89:	5f                   	pop    %edi
    6f8a:	5b                   	pop    %ebx
    6f8b:	c3                   	ret

Disassembly of section .interp:

00007000 <.interp>:
    7000:	2f                   	das
    7001:	6c                   	insb   (%dx),%es:(%edi)
    7002:	69 62 2f 6c 64 2d 6c 	imul   $0x6c2d646c,0x2f(%edx),%esp
    7009:	69 6e 75 78 2e 73 6f 	imul   $0x6f732e78,0x75(%esi),%ebp
    7010:	2e 32 00             	xor    %cs:(%eax),%al

Disassembly of section .gnu.hash:

00007014 <.gnu.hash>:
    7014:	01 00                	add    %eax,(%eax)
    7016:	00 00                	add    %al,(%eax)
    7018:	01 00                	add    %eax,(%eax)
    701a:	00 00                	add    %al,(%eax)
    701c:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .dynsym:

0000702c <.dynsym>:
	...

Disassembly of section .dynstr:

0000703c <.dynstr>:
	...

Disassembly of section .rel.dyn:

00007040 <.rel.dyn>:
    7040:	30 9c 00 00 08 00 00 	xor    %bl,0x800(%eax,%eax,1)
    7047:	00 40 9c             	add    %al,-0x64(%eax)
    704a:	00 00                	add    %al,(%eax)
    704c:	08 00                	or     %al,(%eax)
    704e:	00 00                	add    %al,(%eax)
    7050:	50                   	push   %eax
    7051:	9c                   	pushf
    7052:	00 00                	add    %al,(%eax)
    7054:	08 00                	or     %al,(%eax)
    7056:	00 00                	add    %al,(%eax)
    7058:	54                   	push   %esp
    7059:	9c                   	pushf
    705a:	00 00                	add    %al,(%eax)
    705c:	08 00                	or     %al,(%eax)
    705e:	00 00                	add    %al,(%eax)
    7060:	5c                   	pop    %esp
    7061:	9c                   	pushf
    7062:	00 00                	add    %al,(%eax)
    7064:	08 00                	or     %al,(%eax)
    7066:	00 00                	add    %al,(%eax)
    7068:	64 9c                	fs pushf
    706a:	00 00                	add    %al,(%eax)
    706c:	08 00                	or     %al,(%eax)
    706e:	00 00                	add    %al,(%eax)
    7070:	74 9c                	je     700e <memset+0xfe>
    7072:	00 00                	add    %al,(%eax)
    7074:	08 00                	or     %al,(%eax)
    7076:	00 00                	add    %al,(%eax)
    7078:	84 9c 00 00 08 00 00 	test   %bl,0x800(%eax,%eax,1)
    707f:	00 94 9c 00 00 08 00 	add    %dl,0x80000(%esp,%ebx,4)
    7086:	00 00                	add    %al,(%eax)
    7088:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    7089:	9c                   	pushf
    708a:	00 00                	add    %al,(%eax)
    708c:	08 00                	or     %al,(%eax)
    708e:	00 00                	add    %al,(%eax)
    7090:	ac                   	lods   %ds:(%esi),%al
    7091:	9c                   	pushf
    7092:	00 00                	add    %al,(%eax)
    7094:	08 00                	or     %al,(%eax)
    7096:	00 00                	add    %al,(%eax)
    7098:	bc 9c 00 00 08       	mov    $0x800009c,%esp
    709d:	00 00                	add    %al,(%eax)
    709f:	00 c4                	add    %al,%ah
    70a1:	9c                   	pushf
    70a2:	00 00                	add    %al,(%eax)
    70a4:	08 00                	or     %al,(%eax)
    70a6:	00 00                	add    %al,(%eax)
    70a8:	d4 9c                	aam    $0x9c
    70aa:	00 00                	add    %al,(%eax)
    70ac:	08 00                	or     %al,(%eax)
    70ae:	00 00                	add    %al,(%eax)
    70b0:	e4 9c                	in     $0x9c,%al
    70b2:	00 00                	add    %al,(%eax)
    70b4:	08 00                	or     %al,(%eax)
    70b6:	00 00                	add    %al,(%eax)
    70b8:	f4                   	hlt
    70b9:	9c                   	pushf
    70ba:	00 00                	add    %al,(%eax)
    70bc:	08 00                	or     %al,(%eax)
    70be:	00 00                	add    %al,(%eax)
    70c0:	fc                   	cld
    70c1:	9c                   	pushf
    70c2:	00 00                	add    %al,(%eax)
    70c4:	08 00                	or     %al,(%eax)
    70c6:	00 00                	add    %al,(%eax)
    70c8:	04 9d                	add    $0x9d,%al
    70ca:	00 00                	add    %al,(%eax)
    70cc:	08 00                	or     %al,(%eax)
    70ce:	00 00                	add    %al,(%eax)
    70d0:	14 9d                	adc    $0x9d,%al
    70d2:	00 00                	add    %al,(%eax)
    70d4:	08 00                	or     %al,(%eax)
    70d6:	00 00                	add    %al,(%eax)
    70d8:	1c 9d                	sbb    $0x9d,%al
    70da:	00 00                	add    %al,(%eax)
    70dc:	08 00                	or     %al,(%eax)
    70de:	00 00                	add    %al,(%eax)
    70e0:	24 9d                	and    $0x9d,%al
    70e2:	00 00                	add    %al,(%eax)
    70e4:	08 00                	or     %al,(%eax)
    70e6:	00 00                	add    %al,(%eax)
    70e8:	2c 9d                	sub    $0x9d,%al
    70ea:	00 00                	add    %al,(%eax)
    70ec:	08 00                	or     %al,(%eax)
    70ee:	00 00                	add    %al,(%eax)
    70f0:	34 9d                	xor    $0x9d,%al
    70f2:	00 00                	add    %al,(%eax)
    70f4:	08 00                	or     %al,(%eax)
    70f6:	00 00                	add    %al,(%eax)
    70f8:	4c                   	dec    %esp
    70f9:	9d                   	popf
    70fa:	00 00                	add    %al,(%eax)
    70fc:	08 00                	or     %al,(%eax)
    70fe:	00 00                	add    %al,(%eax)
    7100:	54                   	push   %esp
    7101:	9d                   	popf
    7102:	00 00                	add    %al,(%eax)
    7104:	08 00                	or     %al,(%eax)
    7106:	00 00                	add    %al,(%eax)
    7108:	5c                   	pop    %esp
    7109:	9d                   	popf
    710a:	00 00                	add    %al,(%eax)
    710c:	08 00                	or     %al,(%eax)
    710e:	00 00                	add    %al,(%eax)
    7110:	64 9d                	fs popf
    7112:	00 00                	add    %al,(%eax)
    7114:	08 00                	or     %al,(%eax)
    7116:	00 00                	add    %al,(%eax)
    7118:	74 9d                	je     70b7 <memset+0x1a7>
    711a:	00 00                	add    %al,(%eax)
    711c:	08 00                	or     %al,(%eax)
    711e:	00 00                	add    %al,(%eax)
    7120:	88 9d 00 00 08 00    	mov    %bl,0x80000(%ebp)
    7126:	00 00                	add    %al,(%eax)
    7128:	8c 9d 00 00 08 00    	mov    %ds,0x80000(%ebp)
    712e:	00 00                	add    %al,(%eax)
    7130:	90                   	nop
    7131:	9d                   	popf
    7132:	00 00                	add    %al,(%eax)
    7134:	08 00                	or     %al,(%eax)
    7136:	00 00                	add    %al,(%eax)
    7138:	94                   	xchg   %eax,%esp
    7139:	9d                   	popf
    713a:	00 00                	add    %al,(%eax)
    713c:	08 00                	or     %al,(%eax)
    713e:	00 00                	add    %al,(%eax)
    7140:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    7141:	9d                   	popf
    7142:	00 00                	add    %al,(%eax)
    7144:	08 00                	or     %al,(%eax)
    7146:	00 00                	add    %al,(%eax)
    7148:	b4 9d                	mov    $0x9d,%ah
    714a:	00 00                	add    %al,(%eax)
    714c:	08 00                	or     %al,(%eax)
    714e:	00 00                	add    %al,(%eax)
    7150:	bc 9d 00 00 08       	mov    $0x800009d,%esp
    7155:	00 00                	add    %al,(%eax)
    7157:	00 c4                	add    %al,%ah
    7159:	9d                   	popf
    715a:	00 00                	add    %al,(%eax)
    715c:	08 00                	or     %al,(%eax)
    715e:	00 00                	add    %al,(%eax)
    7160:	cc                   	int3
    7161:	9d                   	popf
    7162:	00 00                	add    %al,(%eax)
    7164:	08 00                	or     %al,(%eax)
    7166:	00 00                	add    %al,(%eax)
    7168:	d4 9d                	aam    $0x9d
    716a:	00 00                	add    %al,(%eax)
    716c:	08 00                	or     %al,(%eax)
    716e:	00 00                	add    %al,(%eax)
    7170:	e8 9d 00 00 08       	call   8007212 <_end+0x7ffaad6>
    7175:	00 00                	add    %al,(%eax)
    7177:	00 ec                	add    %ch,%ah
    7179:	9d                   	popf
    717a:	00 00                	add    %al,(%eax)
    717c:	08 00                	or     %al,(%eax)
    717e:	00 00                	add    %al,(%eax)
    7180:	f8                   	clc
    7181:	9d                   	popf
    7182:	00 00                	add    %al,(%eax)
    7184:	08 00                	or     %al,(%eax)
    7186:	00 00                	add    %al,(%eax)
    7188:	fc                   	cld
    7189:	9d                   	popf
    718a:	00 00                	add    %al,(%eax)
    718c:	08 00                	or     %al,(%eax)
    718e:	00 00                	add    %al,(%eax)
    7190:	00 9e 00 00 08 00    	add    %bl,0x80000(%esi)
    7196:	00 00                	add    %al,(%eax)
    7198:	04 9e                	add    $0x9e,%al
    719a:	00 00                	add    %al,(%eax)
    719c:	08 00                	or     %al,(%eax)
    719e:	00 00                	add    %al,(%eax)
    71a0:	14 9e                	adc    $0x9e,%al
    71a2:	00 00                	add    %al,(%eax)
    71a4:	08 00                	or     %al,(%eax)
    71a6:	00 00                	add    %al,(%eax)
    71a8:	1c 9e                	sbb    $0x9e,%al
    71aa:	00 00                	add    %al,(%eax)
    71ac:	08 00                	or     %al,(%eax)
    71ae:	00 00                	add    %al,(%eax)
    71b0:	28 9e 00 00 08 00    	sub    %bl,0x80000(%esi)
    71b6:	00 00                	add    %al,(%eax)
    71b8:	2c 9e                	sub    $0x9e,%al
    71ba:	00 00                	add    %al,(%eax)
    71bc:	08 00                	or     %al,(%eax)
    71be:	00 00                	add    %al,(%eax)
    71c0:	30 9e 00 00 08 00    	xor    %bl,0x80000(%esi)
    71c6:	00 00                	add    %al,(%eax)
    71c8:	34 9e                	xor    $0x9e,%al
    71ca:	00 00                	add    %al,(%eax)
    71cc:	08 00                	or     %al,(%eax)
    71ce:	00 00                	add    %al,(%eax)
    71d0:	3c 9e                	cmp    $0x9e,%al
    71d2:	00 00                	add    %al,(%eax)
    71d4:	08 00                	or     %al,(%eax)
    71d6:	00 00                	add    %al,(%eax)
    71d8:	44                   	inc    %esp
    71d9:	9e                   	sahf
    71da:	00 00                	add    %al,(%eax)
    71dc:	08 00                	or     %al,(%eax)
    71de:	00 00                	add    %al,(%eax)
    71e0:	4c                   	dec    %esp
    71e1:	9e                   	sahf
    71e2:	00 00                	add    %al,(%eax)
    71e4:	08 00                	or     %al,(%eax)
    71e6:	00 00                	add    %al,(%eax)
    71e8:	54                   	push   %esp
    71e9:	9e                   	sahf
    71ea:	00 00                	add    %al,(%eax)
    71ec:	08 00                	or     %al,(%eax)
    71ee:	00 00                	add    %al,(%eax)
    71f0:	5c                   	pop    %esp
    71f1:	9e                   	sahf
    71f2:	00 00                	add    %al,(%eax)
    71f4:	08 00                	or     %al,(%eax)
    71f6:	00 00                	add    %al,(%eax)
    71f8:	6c                   	insb   (%dx),%es:(%edi)
    71f9:	9e                   	sahf
    71fa:	00 00                	add    %al,(%eax)
    71fc:	08 00                	or     %al,(%eax)
    71fe:	00 00                	add    %al,(%eax)
    7200:	7c 9e                	jl     71a0 <memset+0x290>
    7202:	00 00                	add    %al,(%eax)
    7204:	08 00                	or     %al,(%eax)
    7206:	00 00                	add    %al,(%eax)
    7208:	84 9e 00 00 08 00    	test   %bl,0x80000(%esi)
    720e:	00 00                	add    %al,(%eax)
    7210:	8c 9e 00 00 08 00    	mov    %ds,0x80000(%esi)
    7216:	00 00                	add    %al,(%eax)
    7218:	94                   	xchg   %eax,%esp
    7219:	9e                   	sahf
    721a:	00 00                	add    %al,(%eax)
    721c:	08 00                	or     %al,(%eax)
    721e:	00 00                	add    %al,(%eax)
    7220:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    7221:	9e                   	sahf
    7222:	00 00                	add    %al,(%eax)
    7224:	08 00                	or     %al,(%eax)
    7226:	00 00                	add    %al,(%eax)
    7228:	b4 9e                	mov    $0x9e,%ah
    722a:	00 00                	add    %al,(%eax)
    722c:	08 00                	or     %al,(%eax)
    722e:	00 00                	add    %al,(%eax)
    7230:	bc 9e 00 00 08       	mov    $0x800009e,%esp
    7235:	00 00                	add    %al,(%eax)
    7237:	00 cc                	add    %cl,%ah
    7239:	9e                   	sahf
    723a:	00 00                	add    %al,(%eax)
    723c:	08 00                	or     %al,(%eax)
    723e:	00 00                	add    %al,(%eax)
    7240:	d4 9e                	aam    $0x9e
    7242:	00 00                	add    %al,(%eax)
    7244:	08 00                	or     %al,(%eax)
    7246:	00 00                	add    %al,(%eax)
    7248:	dc 9e 00 00 08 00    	fcompl 0x80000(%esi)
    724e:	00 00                	add    %al,(%eax)
    7250:	e4 9e                	in     $0x9e,%al
    7252:	00 00                	add    %al,(%eax)
    7254:	08 00                	or     %al,(%eax)
    7256:	00 00                	add    %al,(%eax)
    7258:	ec                   	in     (%dx),%al
    7259:	9e                   	sahf
    725a:	00 00                	add    %al,(%eax)
    725c:	08 00                	or     %al,(%eax)
    725e:	00 00                	add    %al,(%eax)
    7260:	f4                   	hlt
    7261:	9e                   	sahf
    7262:	00 00                	add    %al,(%eax)
    7264:	08 00                	or     %al,(%eax)
    7266:	00 00                	add    %al,(%eax)
    7268:	fc                   	cld
    7269:	9e                   	sahf
    726a:	00 00                	add    %al,(%eax)
    726c:	08 00                	or     %al,(%eax)
    726e:	00 00                	add    %al,(%eax)
    7270:	04 9f                	add    $0x9f,%al
    7272:	00 00                	add    %al,(%eax)
    7274:	08 00                	or     %al,(%eax)
    7276:	00 00                	add    %al,(%eax)
    7278:	18 9f 00 00 08 00    	sbb    %bl,0x80000(%edi)
    727e:	00 00                	add    %al,(%eax)
    7280:	1c 9f                	sbb    $0x9f,%al
    7282:	00 00                	add    %al,(%eax)
    7284:	08 00                	or     %al,(%eax)
    7286:	00 00                	add    %al,(%eax)
    7288:	20 9f 00 00 08 00    	and    %bl,0x80000(%edi)
    728e:	00 00                	add    %al,(%eax)
    7290:	24 9f                	and    $0x9f,%al
    7292:	00 00                	add    %al,(%eax)
    7294:	08 00                	or     %al,(%eax)
    7296:	00 00                	add    %al,(%eax)
    7298:	2c 9f                	sub    $0x9f,%al
    729a:	00 00                	add    %al,(%eax)
    729c:	08 00                	or     %al,(%eax)
    729e:	00 00                	add    %al,(%eax)
    72a0:	34 9f                	xor    $0x9f,%al
    72a2:	00 00                	add    %al,(%eax)
    72a4:	08 00                	or     %al,(%eax)
    72a6:	00 00                	add    %al,(%eax)
    72a8:	3c 9f                	cmp    $0x9f,%al
    72aa:	00 00                	add    %al,(%eax)
    72ac:	08 00                	or     %al,(%eax)
    72ae:	00 00                	add    %al,(%eax)
    72b0:	44                   	inc    %esp
    72b1:	9f                   	lahf
    72b2:	00 00                	add    %al,(%eax)
    72b4:	08 00                	or     %al,(%eax)
    72b6:	00 00                	add    %al,(%eax)
    72b8:	4c                   	dec    %esp
    72b9:	9f                   	lahf
    72ba:	00 00                	add    %al,(%eax)
    72bc:	08 00                	or     %al,(%eax)
    72be:	00 00                	add    %al,(%eax)
    72c0:	54                   	push   %esp
    72c1:	9f                   	lahf
    72c2:	00 00                	add    %al,(%eax)
    72c4:	08 00                	or     %al,(%eax)
    72c6:	00 00                	add    %al,(%eax)
    72c8:	5c                   	pop    %esp
    72c9:	9f                   	lahf
    72ca:	00 00                	add    %al,(%eax)
    72cc:	08 00                	or     %al,(%eax)
    72ce:	00 00                	add    %al,(%eax)
    72d0:	04 a0                	add    $0xa0,%al
    72d2:	00 00                	add    %al,(%eax)
    72d4:	08 00                	or     %al,(%eax)
    72d6:	00 00                	add    %al,(%eax)
    72d8:	08 a0 00 00 08 00    	or     %ah,0x80000(%eax)
    72de:	00 00                	add    %al,(%eax)
    72e0:	1c a0                	sbb    $0xa0,%al
    72e2:	00 00                	add    %al,(%eax)
    72e4:	08 00                	or     %al,(%eax)
	...

Disassembly of section .rodata:

000072e8 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E-0x5ce>:
    72e8:	09 7e ff             	or     %edi,-0x1(%esi)
    72eb:	ff 40 7e             	incl   0x7e(%eax)
    72ee:	ff                   	(bad)
    72ef:	ff 40 7e             	incl   0x7e(%eax)
    72f2:	ff                   	(bad)
    72f3:	ff 40 7e             	incl   0x7e(%eax)
    72f6:	ff                   	(bad)
    72f7:	ff 40 7e             	incl   0x7e(%eax)
    72fa:	ff                   	(bad)
    72fb:	ff 40 7e             	incl   0x7e(%eax)
    72fe:	ff                   	(bad)
    72ff:	ff 40 7e             	incl   0x7e(%eax)
    7302:	ff                   	(bad)
    7303:	ff 40 7e             	incl   0x7e(%eax)
    7306:	ff                   	(bad)
    7307:	ff 40 7e             	incl   0x7e(%eax)
    730a:	ff                   	(bad)
    730b:	ff 40 7e             	incl   0x7e(%eax)
    730e:	ff                   	(bad)
    730f:	ff 40 7e             	incl   0x7e(%eax)
    7312:	ff                   	(bad)
    7313:	ff 40 7e             	incl   0x7e(%eax)
    7316:	ff                   	(bad)
    7317:	ff 40 7e             	incl   0x7e(%eax)
    731a:	ff                   	(bad)
    731b:	ff 40 7e             	incl   0x7e(%eax)
    731e:	ff                   	(bad)
    731f:	ff cc                	dec    %esp
    7321:	7f ff                	jg     7322 <memset+0x412>
    7323:	ff 40 7e             	incl   0x7e(%eax)
    7326:	ff                   	(bad)
    7327:	ff 40 7e             	incl   0x7e(%eax)
    732a:	ff                   	(bad)
    732b:	ff 40 7e             	incl   0x7e(%eax)
    732e:	ff                   	(bad)
    732f:	ff 40 7e             	incl   0x7e(%eax)
    7332:	ff                   	(bad)
    7333:	ff 40 7e             	incl   0x7e(%eax)
    7336:	ff                   	(bad)
    7337:	ff 40 7e             	incl   0x7e(%eax)
    733a:	ff                   	(bad)
    733b:	ff 40 7e             	incl   0x7e(%eax)
    733e:	ff                   	(bad)
    733f:	ff 40 7e             	incl   0x7e(%eax)
    7342:	ff                   	(bad)
    7343:	ff 40 7e             	incl   0x7e(%eax)
    7346:	ff                   	(bad)
    7347:	ff 40 7e             	incl   0x7e(%eax)
    734a:	ff                   	(bad)
    734b:	ff 40 7e             	incl   0x7e(%eax)
    734e:	ff                   	(bad)
    734f:	ff 40 7e             	incl   0x7e(%eax)
    7352:	ff                   	(bad)
    7353:	ff 73 7e             	push   0x7e(%ebx)
    7356:	ff                   	(bad)
    7357:	ff 40 7e             	incl   0x7e(%eax)
    735a:	ff                   	(bad)
    735b:	ff 40 7e             	incl   0x7e(%eax)
    735e:	ff                   	(bad)
    735f:	ff 40 7e             	incl   0x7e(%eax)
    7362:	ff                   	(bad)
    7363:	ff 40 7e             	incl   0x7e(%eax)
    7366:	ff                   	(bad)
    7367:	ff 40 7e             	incl   0x7e(%eax)
    736a:	ff                   	(bad)
    736b:	ff 40 7e             	incl   0x7e(%eax)
    736e:	ff                   	(bad)
    736f:	ff 40 7e             	incl   0x7e(%eax)
    7372:	ff                   	(bad)
    7373:	ff 40 7e             	incl   0x7e(%eax)
    7376:	ff                   	(bad)
    7377:	ff 40 7e             	incl   0x7e(%eax)
    737a:	ff                   	(bad)
    737b:	ff 40 7e             	incl   0x7e(%eax)
    737e:	ff                   	(bad)
    737f:	ff                   	(bad)
    7380:	7d 7e                	jge    7400 <memset+0x4f0>
    7382:	ff                   	(bad)
    7383:	ff 40 7e             	incl   0x7e(%eax)
    7386:	ff                   	(bad)
    7387:	ff 40 7e             	incl   0x7e(%eax)
    738a:	ff                   	(bad)
    738b:	ff 40 7e             	incl   0x7e(%eax)
    738e:	ff                   	(bad)
    738f:	ff 40 7e             	incl   0x7e(%eax)
    7392:	ff                   	(bad)
    7393:	ff 69 7e             	ljmp   *0x7e(%ecx)
    7396:	ff                   	(bad)
    7397:	ff 1e                	lcall  *(%esi)
    7399:	84 ff                	test   %bh,%bh
    739b:	ff a8 83 ff ff cf    	ljmp   *-0x3000007d(%eax)
    73a1:	83 ff ff             	cmp    $0xffffffff,%edi
    73a4:	dc 83 ff ff b5 83    	faddl  -0x7c4a0001(%ebx)
    73aa:	ff                   	(bad)
    73ab:	ff                   	(bad)
    73ac:	fe 83 ff ff 0b 84    	incb   -0x7bf40001(%ebx)
    73b2:	ff                   	(bad)
    73b3:	ff e4                	jmp    *%esp
    73b5:	83 ff ff             	cmp    $0xffffffff,%edi
    73b8:	13 84 ff ff c2 83 ff 	adc    -0x7c3d01(%edi,%edi,8),%eax
    73bf:	ff 35 84 ff ff 35    	push   0x35ffff84
    73c5:	84 ff                	test   %bh,%bh
    73c7:	ff 35 84 ff ff 35    	push   0x35ffff84
    73cd:	84 ff                	test   %bh,%bh
    73cf:	ff 35 84 ff ff 35    	push   0x35ffff84
    73d5:	84 ff                	test   %bh,%bh
    73d7:	ff 35 84 ff ff 35    	push   0x35ffff84
    73dd:	84 ff                	test   %bh,%bh
    73df:	ff 35 84 ff ff 35    	push   0x35ffff84
    73e5:	84 ff                	test   %bh,%bh
    73e7:	ff 35 84 ff ff 35    	push   0x35ffff84
    73ed:	84 ff                	test   %bh,%bh
    73ef:	ff 35 84 ff ff 35    	push   0x35ffff84
    73f5:	84 ff                	test   %bh,%bh
    73f7:	ff 35 84 ff ff 35    	push   0x35ffff84
    73fd:	84 ff                	test   %bh,%bh
    73ff:	ff 35 84 ff ff 35    	push   0x35ffff84
    7405:	84 ff                	test   %bh,%bh
    7407:	ff 35 84 ff ff 35    	push   0x35ffff84
    740d:	84 ff                	test   %bh,%bh
    740f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7415:	84 ff                	test   %bh,%bh
    7417:	ff 35 84 ff ff 35    	push   0x35ffff84
    741d:	84 ff                	test   %bh,%bh
    741f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7425:	84 ff                	test   %bh,%bh
    7427:	ff 35 84 ff ff 35    	push   0x35ffff84
    742d:	84 ff                	test   %bh,%bh
    742f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7435:	84 ff                	test   %bh,%bh
    7437:	ff 35 84 ff ff 35    	push   0x35ffff84
    743d:	84 ff                	test   %bh,%bh
    743f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7445:	84 ff                	test   %bh,%bh
    7447:	ff 35 84 ff ff 35    	push   0x35ffff84
    744d:	84 ff                	test   %bh,%bh
    744f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7455:	84 ff                	test   %bh,%bh
    7457:	ff 35 84 ff ff 35    	push   0x35ffff84
    745d:	84 ff                	test   %bh,%bh
    745f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7465:	84 ff                	test   %bh,%bh
    7467:	ff 35 84 ff ff 35    	push   0x35ffff84
    746d:	84 ff                	test   %bh,%bh
    746f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7475:	84 ff                	test   %bh,%bh
    7477:	ff 35 84 ff ff 35    	push   0x35ffff84
    747d:	84 ff                	test   %bh,%bh
    747f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7485:	84 ff                	test   %bh,%bh
    7487:	ff 35 84 ff ff 35    	push   0x35ffff84
    748d:	84 ff                	test   %bh,%bh
    748f:	ff 35 84 ff ff 35    	push   0x35ffff84
    7495:	84 ff                	test   %bh,%bh
    7497:	ff 35 84 ff ff f1    	push   0xf1ffff84
    749d:	83 ff ff             	cmp    $0xffffffff,%edi
    74a0:	d5 85                	aad    $0x85
    74a2:	ff                   	(bad)
    74a3:	ff f2                	push   %edx
    74a5:	85 ff                	test   %edi,%edi
    74a7:	ff f2                	push   %edx
    74a9:	85 ff                	test   %edi,%edi
    74ab:	ff f2                	push   %edx
    74ad:	85 ff                	test   %edi,%edi
    74af:	ff f2                	push   %edx
    74b1:	85 ff                	test   %edi,%edi
    74b3:	ff f2                	push   %edx
    74b5:	85 ff                	test   %edi,%edi
    74b7:	ff f2                	push   %edx
    74b9:	85 ff                	test   %edi,%edi
    74bb:	ff f2                	push   %edx
    74bd:	85 ff                	test   %edi,%edi
    74bf:	ff f2                	push   %edx
    74c1:	85 ff                	test   %edi,%edi
    74c3:	ff cd                	dec    %ebp
    74c5:	86 ff                	xchg   %bh,%bh
    74c7:	ff                   	lcall  (bad)
    74c8:	df 86 ff ff f2 85    	filds  -0x7a0d0001(%esi)
    74ce:	ff                   	(bad)
    74cf:	ff f2                	push   %edx
    74d1:	85 ff                	test   %edi,%edi
    74d3:	ff                   	ljmp   (bad)
    74d4:	e8 86 ff ff f2       	call   f300745f <_end+0xf2ffad23>
    74d9:	85 ff                	test   %edi,%edi
    74db:	ff f2                	push   %edx
    74dd:	85 ff                	test   %edi,%edi
    74df:	ff f2                	push   %edx
    74e1:	85 ff                	test   %edi,%edi
    74e3:	ff f2                	push   %edx
    74e5:	85 ff                	test   %edi,%edi
    74e7:	ff f2                	push   %edx
    74e9:	85 ff                	test   %edi,%edi
    74eb:	ff f2                	push   %edx
    74ed:	85 ff                	test   %edi,%edi
    74ef:	ff f2                	push   %edx
    74f1:	85 ff                	test   %edi,%edi
    74f3:	ff f2                	push   %edx
    74f5:	85 ff                	test   %edi,%edi
    74f7:	ff f2                	push   %edx
    74f9:	85 ff                	test   %edi,%edi
    74fb:	ff f2                	push   %edx
    74fd:	85 ff                	test   %edi,%edi
    74ff:	ff f2                	push   %edx
    7501:	85 ff                	test   %edi,%edi
    7503:	ff f2                	push   %edx
    7505:	85 ff                	test   %edi,%edi
    7507:	ff f2                	push   %edx
    7509:	85 ff                	test   %edi,%edi
    750b:	ff f2                	push   %edx
    750d:	85 ff                	test   %edi,%edi
    750f:	ff f2                	push   %edx
    7511:	85 ff                	test   %edi,%edi
    7513:	ff f2                	push   %edx
    7515:	85 ff                	test   %edi,%edi
    7517:	ff f2                	push   %edx
    7519:	85 ff                	test   %edi,%edi
    751b:	ff f2                	push   %edx
    751d:	85 ff                	test   %edi,%edi
    751f:	ff f2                	push   %edx
    7521:	85 ff                	test   %edi,%edi
    7523:	ff f2                	push   %edx
    7525:	85 ff                	test   %edi,%edi
    7527:	ff 1b                	lcall  *(%ebx)
    7529:	89 ff                	mov    %edi,%edi
    752b:	ff f2                	push   %edx
    752d:	85 ff                	test   %edi,%edi
    752f:	ff f2                	push   %edx
    7531:	85 ff                	test   %edi,%edi
    7533:	ff f2                	push   %edx
    7535:	85 ff                	test   %edi,%edi
    7537:	ff f2                	push   %edx
    7539:	85 ff                	test   %edi,%edi
    753b:	ff d6                	call   *%esi
    753d:	86 ff                	xchg   %bh,%bh
    753f:	ff 6b 90             	ljmp   *-0x70(%ebx)
    7542:	ff                   	(bad)
    7543:	ff                   	(bad)
    7544:	bb 8f ff ff 66       	mov    $0x66ffff8f,%ebx
    7549:	90                   	nop
    754a:	ff                   	(bad)
    754b:	ff                   	(bad)
    754c:	bb 8f ff ff a6       	mov    $0xa6ffff8f,%ebx
    7551:	95                   	xchg   %eax,%ebp
    7552:	ff                   	(bad)
    7553:	ff 9d 95 ff ff a1    	lcall  *-0x5e00006b(%ebp)
    7559:	95                   	xchg   %eax,%ebp
    755a:	ff                   	(bad)
    755b:	ff a6 95 ff ff 68    	jmp    *0x68ffff95(%esi)
    7561:	b4 ff                	mov    $0xff,%ah
    7563:	ff 05 b8 ff ff c5    	incl   0xc5ffffb8
    7569:	b8 ff ff 4f b3       	mov    $0xb34fffff,%eax
    756e:	ff                   	(bad)
    756f:	ff 94 c9 ff ff f2 c9 	call   *-0x360d0001(%ecx,%ecx,8)
    7576:	ff                   	(bad)
    7577:	ff b2 c9 ff ff d4    	push   -0x2b000037(%edx)
    757d:	c9                   	leave
    757e:	ff                   	(bad)
    757f:	ff c0                	inc    %eax
    7581:	cd ff                	int    $0xff
    7583:	ff 4a cd             	decl   -0x33(%edx)
    7586:	ff                   	(bad)
    7587:	ff 71 cd             	push   -0x33(%ecx)
    758a:	ff                   	(bad)
    758b:	ff                   	(bad)
    758c:	7e cd                	jle    755b <memset+0x64b>
    758e:	ff                   	(bad)
    758f:	ff 57 cd             	call   *-0x33(%edi)
    7592:	ff                   	(bad)
    7593:	ff a0 cd ff ff ad    	jmp    *-0x52000033(%eax)
    7599:	cd ff                	int    $0xff
    759b:	ff 86 cd ff ff b5    	incl   -0x4a000033(%esi)
    75a1:	cd ff                	int    $0xff
    75a3:	ff 64 cd ff          	jmp    *-0x1(%ebp,%ecx,8)
    75a7:	ff d7                	call   *%edi
    75a9:	cd ff                	int    $0xff
    75ab:	ff d7                	call   *%edi
    75ad:	cd ff                	int    $0xff
    75af:	ff d7                	call   *%edi
    75b1:	cd ff                	int    $0xff
    75b3:	ff d7                	call   *%edi
    75b5:	cd ff                	int    $0xff
    75b7:	ff d7                	call   *%edi
    75b9:	cd ff                	int    $0xff
    75bb:	ff d7                	call   *%edi
    75bd:	cd ff                	int    $0xff
    75bf:	ff d7                	call   *%edi
    75c1:	cd ff                	int    $0xff
    75c3:	ff d7                	call   *%edi
    75c5:	cd ff                	int    $0xff
    75c7:	ff d7                	call   *%edi
    75c9:	cd ff                	int    $0xff
    75cb:	ff d7                	call   *%edi
    75cd:	cd ff                	int    $0xff
    75cf:	ff d7                	call   *%edi
    75d1:	cd ff                	int    $0xff
    75d3:	ff d7                	call   *%edi
    75d5:	cd ff                	int    $0xff
    75d7:	ff d7                	call   *%edi
    75d9:	cd ff                	int    $0xff
    75db:	ff d7                	call   *%edi
    75dd:	cd ff                	int    $0xff
    75df:	ff d7                	call   *%edi
    75e1:	cd ff                	int    $0xff
    75e3:	ff d7                	call   *%edi
    75e5:	cd ff                	int    $0xff
    75e7:	ff d7                	call   *%edi
    75e9:	cd ff                	int    $0xff
    75eb:	ff d7                	call   *%edi
    75ed:	cd ff                	int    $0xff
    75ef:	ff d7                	call   *%edi
    75f1:	cd ff                	int    $0xff
    75f3:	ff d7                	call   *%edi
    75f5:	cd ff                	int    $0xff
    75f7:	ff d7                	call   *%edi
    75f9:	cd ff                	int    $0xff
    75fb:	ff d7                	call   *%edi
    75fd:	cd ff                	int    $0xff
    75ff:	ff d7                	call   *%edi
    7601:	cd ff                	int    $0xff
    7603:	ff d7                	call   *%edi
    7605:	cd ff                	int    $0xff
    7607:	ff d7                	call   *%edi
    7609:	cd ff                	int    $0xff
    760b:	ff d7                	call   *%edi
    760d:	cd ff                	int    $0xff
    760f:	ff d7                	call   *%edi
    7611:	cd ff                	int    $0xff
    7613:	ff d7                	call   *%edi
    7615:	cd ff                	int    $0xff
    7617:	ff d7                	call   *%edi
    7619:	cd ff                	int    $0xff
    761b:	ff d7                	call   *%edi
    761d:	cd ff                	int    $0xff
    761f:	ff d7                	call   *%edi
    7621:	cd ff                	int    $0xff
    7623:	ff d7                	call   *%edi
    7625:	cd ff                	int    $0xff
    7627:	ff d7                	call   *%edi
    7629:	cd ff                	int    $0xff
    762b:	ff d7                	call   *%edi
    762d:	cd ff                	int    $0xff
    762f:	ff d7                	call   *%edi
    7631:	cd ff                	int    $0xff
    7633:	ff d7                	call   *%edi
    7635:	cd ff                	int    $0xff
    7637:	ff d7                	call   *%edi
    7639:	cd ff                	int    $0xff
    763b:	ff d7                	call   *%edi
    763d:	cd ff                	int    $0xff
    763f:	ff d7                	call   *%edi
    7641:	cd ff                	int    $0xff
    7643:	ff d7                	call   *%edi
    7645:	cd ff                	int    $0xff
    7647:	ff d7                	call   *%edi
    7649:	cd ff                	int    $0xff
    764b:	ff d7                	call   *%edi
    764d:	cd ff                	int    $0xff
    764f:	ff d7                	call   *%edi
    7651:	cd ff                	int    $0xff
    7653:	ff d7                	call   *%edi
    7655:	cd ff                	int    $0xff
    7657:	ff d7                	call   *%edi
    7659:	cd ff                	int    $0xff
    765b:	ff d7                	call   *%edi
    765d:	cd ff                	int    $0xff
    765f:	ff d7                	call   *%edi
    7661:	cd ff                	int    $0xff
    7663:	ff d7                	call   *%edi
    7665:	cd ff                	int    $0xff
    7667:	ff d7                	call   *%edi
    7669:	cd ff                	int    $0xff
    766b:	ff d7                	call   *%edi
    766d:	cd ff                	int    $0xff
    766f:	ff d7                	call   *%edi
    7671:	cd ff                	int    $0xff
    7673:	ff d7                	call   *%edi
    7675:	cd ff                	int    $0xff
    7677:	ff d7                	call   *%edi
    7679:	cd ff                	int    $0xff
    767b:	ff d7                	call   *%edi
    767d:	cd ff                	int    $0xff
    767f:	ff d7                	call   *%edi
    7681:	cd ff                	int    $0xff
    7683:	ff 93 cd ff ff 53    	call   *0x53ffffcd(%ebx)
    7689:	65 74 4c             	gs je  76d8 <memset+0x7c8>
    768c:	6f                   	outsl  %ds:(%esi),(%dx)
    768d:	67 67 65 72 45       	addr16 addr16 gs jb 76d7 <memset+0x7c7>
    7692:	72 72                	jb     7706 <memset+0x7f6>
    7694:	6f                   	outsl  %ds:(%esi),(%dx)
    7695:	72 4e                	jb     76e5 <memset+0x7d5>
    7697:	6f                   	outsl  %ds:(%esi),(%dx)
    7698:	6e                   	outsb  %ds:(%esi),(%dx)
    7699:	65 53                	gs push %ebx
    769b:	6f                   	outsl  %ds:(%esi),(%dx)
    769c:	6d                   	insl   (%dx),%es:(%edi)
    769d:	65 20 20             	and    %ah,%gs:(%eax)
    76a0:	20 20                	and    %ah,(%eax)
    76a2:	57                   	push   %edi
    76a3:	41                   	inc    %ecx
    76a4:	52                   	push   %edx
    76a5:	4e                   	dec    %esi
    76a6:	49                   	dec    %ecx
    76a7:	4e                   	dec    %esi
    76a8:	46                   	inc    %esi
    76a9:	4f                   	dec    %edi
    76aa:	53                   	push   %ebx
    76ab:	79 73                	jns    7720 <memset+0x810>
    76ad:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    76b0:	6c                   	insb   (%dx),%es:(%edi)
    76b1:	46                   	inc    %esi
    76b2:	61                   	popa
    76b3:	69 6c 65 64 71 77 65 	imul   $0x72657771,0x64(%ebp,%eiz,2),%ebp
    76ba:	72 
    76bb:	74 7a                	je     7737 <memset+0x827>
    76bd:	75 69                	jne    7728 <memset+0x818>
    76bf:	6f                   	outsl  %ds:(%esi),(%dx)
    76c0:	70 79                	jo     773b <memset+0x82b>
    76c2:	78 63                	js     7727 <memset+0x817>
    76c4:	76 62                	jbe    7728 <memset+0x818>
    76c6:	6e                   	outsb  %ds:(%esi),(%dx)
    76c7:	6d                   	insl   (%dx),%es:(%edi)
    76c8:	61                   	popa
    76c9:	73 64                	jae    772f <memset+0x81f>
    76cb:	66 67 68 6a 6b       	addr16 pushw $0x6b6a
    76d0:	6c                   	insb   (%dx),%es:(%edi)
    76d1:	31 32                	xor    %esi,(%edx)
    76d3:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
    76da:	4b                   	dec    %ebx
    76db:	45                   	inc    %ebp
    76dc:	59                   	pop    %ecx
    76dd:	20 54 4f 20          	and    %dl,0x20(%edi,%ecx,2)
    76e1:	46                   	inc    %esi
    76e2:	45                   	inc    %ebp
    76e3:	54                   	push   %esp
    76e4:	43                   	inc    %ebx
    76e5:	48                   	dec    %eax
    76e6:	3a 20                	cmp    (%eax),%ah
    76e8:	30 78 30             	xor    %bh,0x30(%eax)
    76eb:	31 32                	xor    %esi,(%edx)
    76ed:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
    76f4:	61                   	popa
    76f5:	62 63 64             	bound  %esp,0x64(%ebx)
    76f8:	65 66 72 61          	gs data16 jb 775d <memset+0x84d>
    76fc:	6e                   	outsb  %ds:(%esi),(%dx)
    76fd:	67 65 20 65 6e       	and    %ah,%gs:0x6e(%di)
    7702:	64 20 69 6e          	and    %ch,%fs:0x6e(%ecx)
    7706:	64 65 78 20          	fs gs js 772a <memset+0x81a>
    770a:	65 76 65             	gs jbe 7772 <memset+0x862>
    770d:	6e                   	outsb  %ds:(%esi),(%dx)
    770e:	74 20                	je     7730 <memset+0x820>
    7710:	68 61 6e 64 6c       	push   $0x6c646e61
    7715:	65 3a 20             	cmp    %gs:(%eax),%ah
    7718:	30 78 49             	xor    %bh,0x49(%eax)
    771b:	6e                   	outsb  %ds:(%esi),(%dx)
    771c:	76 61                	jbe    777f <memset+0x86f>
    771e:	6c                   	insb   (%dx),%es:(%edi)
    771f:	69 64 51 75 65 75 65 	imul   $0x4b657565,0x75(%ecx,%edx,2),%esp
    7726:	4b 
    7727:	69 6e 64 4d 6f 64 75 	imul   $0x75646f4d,0x64(%esi),%ebp
    772e:	6c                   	insb   (%dx),%es:(%edi)
    772f:	65 49                	gs dec %ecx
    7731:	73 4e                	jae    7781 <memset+0x871>
    7733:	6f                   	outsl  %ds:(%esi),(%dx)
    7734:	74 46                	je     777c <memset+0x86c>
    7736:	6f                   	outsl  %ds:(%esi),(%dx)
    7737:	75 6e                	jne    77a7 <memset+0x897>
    7739:	64 6b 65 79 62       	imul   $0x62,%fs:0x79(%ebp),%esp
    773e:	6f                   	outsl  %ds:(%esi),(%dx)
    773f:	61                   	popa
    7740:	72 64                	jb     77a6 <memset+0x896>
    7742:	2f                   	das
    7743:	73 72                	jae    77b7 <memset+0x8a7>
    7745:	63 2f                	arpl   %ebp,(%edi)
    7747:	70 73                	jo     77bc <memset+0x8ac>
    7749:	2e 72 73             	jb,pn  77bf <memset+0x8af>
    774c:	6b 65 79 62          	imul   $0x62,0x79(%ebp),%esp
    7750:	6f                   	outsl  %ds:(%esi),(%dx)
    7751:	61                   	popa
    7752:	72 64                	jb     77b8 <memset+0x8a8>
    7754:	3a 3a                	cmp    (%edx),%bh
    7756:	70 73                	jo     77cb <memset+0x8bb>
    7758:	6b 65 79 6b          	imul   $0x6b,0x79(%ebp),%esp
    775c:	65 79 62             	gs jns 77c1 <memset+0x8b1>
    775f:	6f                   	outsl  %ds:(%esi),(%dx)
    7760:	61                   	popa
    7761:	72 64                	jb     77c7 <memset+0x8b7>
    7763:	2f                   	das
    7764:	73 72                	jae    77d8 <memset+0x8c8>
    7766:	63 2f                	arpl   %ebp,(%edi)
    7768:	6d                   	insl   (%dx),%es:(%edi)
    7769:	61                   	popa
    776a:	69 6e 2e 72 73 44 72 	imul   $0x72447372,0x2e(%esi),%ebp
    7771:	69 76 65 72 20 69 73 	imul   $0x73692072,0x65(%esi),%esi
    7778:	20 63 6f             	and    %ah,0x6f(%ebx)
    777b:	6e                   	outsb  %ds:(%esi),(%dx)
    777c:	66 69 67 75 72 65    	imul   $0x6572,0x75(%edi),%sp
    7782:	64 2e 20 49 72       	fs and %cl,%cs:0x72(%ecx)
    7787:	71 20                	jno    77a9 <memset+0x899>
    7789:	54                   	push   %esp
    778a:	61                   	popa
    778b:	73 6b                	jae    77f8 <memset+0x8e8>
    778d:	3a 20                	cmp    (%eax),%ah
    778f:	69 6e 64 65 78 20 6f 	imul   $0x6f207865,0x64(%esi),%ebp
    7796:	75 74                	jne    780c <memset+0x8fc>
    7798:	20 6f 66             	and    %ch,0x66(%edi)
    779b:	20 62 6f             	and    %ah,0x6f(%edx)
    779e:	75 6e                	jne    780e <memset+0x8fe>
    77a0:	64 73 3a             	fs jae 77dd <memset+0x8cd>
    77a3:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
    77a7:	20 6c 65 6e          	and    %ch,0x6e(%ebp,%eiz,2)
    77ab:	20 69 73             	and    %ch,0x73(%ecx)
    77ae:	20 6b 65             	and    %ch,0x65(%ebx)
    77b1:	79 62                	jns    7815 <memset+0x905>
    77b3:	6f                   	outsl  %ds:(%esi),(%dx)
    77b4:	61                   	popa
    77b5:	72 64                	jb     781b <memset+0x90b>
    77b7:	63 61 70             	arpl   %esp,0x70(%ecx)
    77ba:	61                   	popa
    77bb:	63 69 74             	arpl   %ebp,0x74(%ecx)
    77be:	79 4e                	jns    780e <memset+0x8fe>
    77c0:	6f                   	outsl  %ds:(%esi),(%dx)
    77c1:	4d                   	dec    %ebp
    77c2:	65 6d                	gs insl (%dx),%es:(%edi)
    77c4:	6f                   	outsl  %ds:(%esi),(%dx)
    77c5:	72 79                	jb     7840 <memset+0x930>
    77c7:	4b                   	dec    %ebx
    77c8:	65 79 62             	gs jns 782d <memset+0x91d>
    77cb:	72 64                	jb     7831 <memset+0x921>
    77cd:	20 69 72             	and    %ch,0x72(%ecx)
    77d0:	71 20                	jno    77f2 <memset+0x8e2>
    77d2:	74 61                	je     7835 <memset+0x925>
    77d4:	73 6b                	jae    7841 <memset+0x931>
    77d6:	46                   	inc    %esi
    77d7:	61                   	popa
    77d8:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    77df:	20 
    77e0:	72 65                	jb     7847 <memset+0x937>
    77e2:	61                   	popa
    77e3:	64 20 73 63          	and    %dh,%fs:0x63(%ebx)
    77e7:	61                   	popa
    77e8:	6e                   	outsb  %ds:(%esi),(%dx)
    77e9:	20 63 6f             	and    %ah,0x6f(%ebx)
    77ec:	64 65 6b 65 79 20    	fs imul $0x20,%gs:0x79(%ebp),%esp
    77f2:	72 65                	jb     7859 <memset+0x949>
    77f4:	61                   	popa
    77f5:	64 3a 20             	cmp    %fs:(%eax),%ah
    77f8:	69 72 71 20 71 75 65 	imul   $0x65757120,0x71(%edx),%esi
    77ff:	75 65                	jne    7866 <memset+0x956>
    7801:	20 69 73             	and    %ch,0x73(%ecx)
    7804:	20 65 78             	and    %ah,0x78(%ebp)
    7807:	69 74 46 61 69 6c 65 	imul   $0x64656c69,0x61(%esi,%eax,2),%esi
    780e:	64 
    780f:	20 69 6e             	and    %ch,0x6e(%ecx)
    7812:	69 74 3a 20 63 61 70 	imul   $0x61706163,0x20(%edx,%edi,1),%esi
    7819:	61 
    781a:	63 69 74             	arpl   %ebp,0x74(%ecx)
    781d:	79 20                	jns    783f <memset+0x92f>
    781f:	6f                   	outsl  %ds:(%esi),(%dx)
    7820:	76 65                	jbe    7887 <memset+0x977>
    7822:	72 66                	jb     788a <memset+0x97a>
    7824:	6c                   	insb   (%dx),%es:(%edi)
    7825:	6f                   	outsl  %ds:(%esi),(%dx)
    7826:	77 2f                	ja     7857 <memset+0x947>
    7828:	68 6f 6d 65 2f       	push   $0x2f656d6f
    782d:	50                   	push   %eax
    782e:	61                   	popa
    782f:	76 61                	jbe    7892 <memset+0x982>
    7831:	6c                   	insb   (%dx),%es:(%edi)
    7832:	2f                   	das
    7833:	2e 72 75             	jb,pn  78ab <memset+0x99b>
    7836:	73 74                	jae    78ac <memset+0x99c>
    7838:	75 70                	jne    78aa <memset+0x99a>
    783a:	2f                   	das
    783b:	74 6f                	je     78ac <memset+0x99c>
    783d:	6f                   	outsl  %ds:(%esi),(%dx)
    783e:	6c                   	insb   (%dx),%es:(%edi)
    783f:	63 68 61             	arpl   %ebp,0x61(%eax)
    7842:	69 6e 73 2f 6e 69 67 	imul   $0x67696e2f,0x73(%esi),%ebp
    7849:	68 74 6c 79 2d       	push   $0x2d796c74
    784e:	69 36 38 36 2d 75    	imul   $0x752d3638,(%esi),%esi
    7854:	6e                   	outsb  %ds:(%esi),(%dx)
    7855:	6b 6e 6f 77          	imul   $0x77,0x6f(%esi),%ebp
    7859:	6e                   	outsb  %ds:(%esi),(%dx)
    785a:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
    785f:	78 2d                	js     788e <memset+0x97e>
    7861:	67 6e                	outsb  %ds:(%si),(%dx)
    7863:	75 2f                	jne    7894 <memset+0x984>
    7865:	6c                   	insb   (%dx),%es:(%edi)
    7866:	69 62 2f 72 75 73 74 	imul   $0x74737572,0x2f(%edx),%esp
    786d:	6c                   	insb   (%dx),%es:(%edi)
    786e:	69 62 2f 73 72 63 2f 	imul   $0x2f637273,0x2f(%edx),%esp
    7875:	72 75                	jb     78ec <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x36>
    7877:	73 74                	jae    78ed <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x37>
    7879:	2f                   	das
    787a:	6c                   	insb   (%dx),%es:(%edi)
    787b:	69 62 72 61 72 79 2f 	imul   $0x2f797261,0x72(%edx),%esp
    7882:	61                   	popa
    7883:	6c                   	insb   (%dx),%es:(%edi)
    7884:	6c                   	insb   (%dx),%es:(%edi)
    7885:	6f                   	outsl  %ds:(%esi),(%dx)
    7886:	63 2f                	arpl   %ebp,(%edi)
    7888:	73 72                	jae    78fc <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x46>
    788a:	63 2f                	arpl   %ebp,(%edi)
    788c:	61                   	popa
    788d:	6c                   	insb   (%dx),%es:(%edi)
    788e:	6c                   	insb   (%dx),%es:(%edi)
    788f:	6f                   	outsl  %ds:(%esi),(%dx)
    7890:	63 2e                	arpl   %ebp,(%esi)
    7892:	72 73                	jb     7907 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x51>
    7894:	6d                   	insl   (%dx),%es:(%edi)
    7895:	65 6d                	gs insl (%dx),%es:(%edi)
    7897:	6f                   	outsl  %ds:(%esi),(%dx)
    7898:	72 79                	jb     7913 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x5d>
    789a:	20 61 6c             	and    %ah,0x6c(%ecx)
    789d:	6c                   	insb   (%dx),%es:(%edi)
    789e:	6f                   	outsl  %ds:(%esi),(%dx)
    789f:	63 61 74             	arpl   %esp,0x74(%ecx)
    78a2:	69 6f 6e 20 6f 66 20 	imul   $0x20666f20,0x6e(%edi),%ebp
    78a9:	20 62 79             	and    %ah,0x79(%edx)
    78ac:	74 65                	je     7913 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x5d>
    78ae:	73 20                	jae    78d0 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x1a>
    78b0:	66 61                	popaw
    78b2:	69 6c 65 64    	imul   $0x7007000,0x64(%ebp,%eiz,2),%ebp
    78b9:	 

000078b6 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E>:
    78b6:	00 70 00             	add    %dh,0x0(%eax)
    78b9:	07                   	pop    %es
    78ba:	00 2d 01 01 01 02    	add    %ch,0x2010101
    78c0:	01 02                	add    %eax,(%edx)
    78c2:	01 01                	add    %eax,(%ecx)
    78c4:	48                   	dec    %eax
    78c5:	0b 30                	or     (%eax),%esi
    78c7:	15 10 01 65 07       	adc    $0x7650110,%eax
    78cc:	02 06                	add    (%esi),%al
    78ce:	02 02                	add    (%edx),%al
    78d0:	01 04 23             	add    %eax,(%ebx,%eiz,1)
    78d3:	01 1e                	add    %ebx,(%esi)
    78d5:	1b 5b 0b             	sbb    0xb(%ebx),%ebx
    78d8:	3a 09                	cmp    (%ecx),%cl
    78da:	09 01                	or     %eax,(%ecx)
    78dc:	18 04 01             	sbb    %al,(%ecx,%eax,1)
    78df:	09 01                	or     %eax,(%ecx)
    78e1:	03 01                	add    (%ecx),%eax
    78e3:	05 2b 03 3b 09       	add    $0x93b032b,%eax
    78e8:	2a 18                	sub    (%eax),%bl
    78ea:	01 20                	add    %esp,(%eax)
    78ec:	37                   	aaa
    78ed:	01 01                	add    %eax,(%ecx)
    78ef:	01 04 08             	add    %eax,(%eax,%ecx,1)
    78f2:	04 01                	add    $0x1,%al
    78f4:	03 07                	add    (%edi),%eax
    78f6:	0a 02                	or     (%edx),%al
    78f8:	1d 01 3a 01 01       	sbb    $0x1013a01,%eax
    78fd:	01 02                	add    %eax,(%edx)
    78ff:	04 08                	add    $0x8,%al
    7901:	01 09                	add    %ecx,(%ecx)
    7903:	01 0a                	add    %ecx,(%edx)
    7905:	02 1a                	add    (%edx),%bl
    7907:	01 02                	add    %eax,(%edx)
    7909:	02 39                	add    (%ecx),%bh
    790b:	01 04 02             	add    %eax,(%edx,%eax,1)
    790e:	04 02                	add    $0x2,%al
    7910:	02 03                	add    (%ebx),%al
    7912:	03 01                	add    (%ecx),%eax
    7914:	1e                   	push   %ds
    7915:	02 03                	add    (%ebx),%al
    7917:	01 0b                	add    %ecx,(%ebx)
    7919:	02 39                	add    (%ecx),%bh
    791b:	01 04 05 01 02 04 01 	add    %eax,0x1040201(,%eax,1)
    7922:	14 02                	adc    $0x2,%al
    7924:	16                   	push   %ss
    7925:	06                   	push   %es
    7926:	01 01                	add    %eax,(%ecx)
    7928:	3a 01                	cmp    (%ecx),%al
    792a:	01 02                	add    %eax,(%edx)
    792c:	01 04 08             	add    %eax,(%eax,%ecx,1)
    792f:	01 07                	add    %eax,(%edi)
    7931:	03 0a                	add    (%edx),%ecx
    7933:	02 1e                	add    (%esi),%bl
    7935:	01 3b                	add    %edi,(%ebx)
    7937:	01 01                	add    %eax,(%ecx)
    7939:	01 0c 01             	add    %ecx,(%ecx,%eax,1)
    793c:	09 01                	or     %eax,(%ecx)
    793e:	28 01                	sub    %al,(%ecx)
    7940:	03 01                	add    (%ecx),%eax
    7942:	37                   	aaa
    7943:	01 01                	add    %eax,(%ecx)
    7945:	03 05 03 01 04 07    	add    0x7040103,%eax
    794b:	02 0b                	add    (%ebx),%cl
    794d:	02 1d 01 3a 01 02    	add    0x2013a01,%bl
    7953:	02 01                	add    (%ecx),%al
    7955:	01 03                	add    %eax,(%ebx)
    7957:	03 01                	add    (%ecx),%eax
    7959:	04 07                	add    $0x7,%al
    795b:	02 0b                	add    (%ebx),%cl
    795d:	02 1c 02             	add    (%edx,%eax,1),%bl
    7960:	39 02                	cmp    %eax,(%edx)
    7962:	01 01                	add    %eax,(%ecx)
    7964:	02 04 08             	add    (%eax,%ecx,1),%al
    7967:	01 09                	add    %ecx,(%ecx)
    7969:	01 0a                	add    %ecx,(%edx)
    796b:	02 1d 01 48 01 04    	add    0x4014801,%bl
    7971:	01 02                	add    %eax,(%edx)
    7973:	03 01                	add    (%ecx),%eax
    7975:	01 08                	add    %ecx,(%eax)
    7977:	01 51 01             	add    %edx,0x1(%ecx)
    797a:	02 07                	add    (%edi),%al
    797c:	0c 08                	or     $0x8,%al
    797e:	62 01                	bound  %eax,(%ecx)
    7980:	02 09                	add    (%ecx),%cl
    7982:	0b 07                	or     (%edi),%eax
    7984:	49                   	dec    %ecx
    7985:	02 1b                	add    (%ebx),%bl
    7987:	01 01                	add    %eax,(%ecx)
    7989:	01 01                	add    %eax,(%ecx)
    798b:	01 37                	add    %esi,(%edi)
    798d:	0e                   	push   %cs
    798e:	01 05 01 02 05 0b    	add    %eax,0xb050201
    7994:	01 24 09             	add    %esp,(%ecx,%ecx,1)
    7997:	01 66 04             	add    %esp,0x4(%esi)
    799a:	01 06                	add    %eax,(%esi)
    799c:	01 02                	add    %eax,(%edx)
    799e:	02 02                	add    (%edx),%al
    79a0:	19 02                	sbb    %eax,(%edx)
    79a2:	04 03                	add    $0x3,%al
    79a4:	10 04 0d 01 02 02 06 	adc    %al,0x6020201(,%ecx,1)
    79ab:	01 0f                	add    %ecx,(%edi)
    79ad:	01 00                	add    %eax,(%eax)
    79af:	03 00                	add    (%eax),%eax
    79b1:	04 1c                	add    $0x1c,%al
    79b3:	03 1d 02 1e 02 40    	add    0x40021e02,%ebx
    79b9:	02 01                	add    (%ecx),%al
    79bb:	07                   	pop    %es
    79bc:	08 01                	or     %al,(%ecx)
    79be:	02 0b                	add    (%ebx),%cl
    79c0:	09 01                	or     %eax,(%ecx)
    79c2:	2d 03 01 01 75       	sub    $0x75010103,%eax
    79c7:	02 22                	add    (%edx),%ah
    79c9:	01 76 03             	add    %esi,0x3(%esi)
    79cc:	04 02                	add    $0x2,%al
    79ce:	09 01                	or     %eax,(%ecx)
    79d0:	06                   	push   %es
    79d1:	03 db                	add    %ebx,%ebx
    79d3:	02 02                	add    (%edx),%al
    79d5:	01 3a                	add    %edi,(%edx)
    79d7:	01 01                	add    %eax,(%ecx)
    79d9:	07                   	pop    %es
    79da:	01 01                	add    %eax,(%ecx)
    79dc:	01 01                	add    %eax,(%ecx)
    79de:	02 08                	add    (%eax),%cl
    79e0:	06                   	push   %es
    79e1:	0a 02                	or     (%edx),%al
    79e3:	01 30                	add    %esi,(%eax)
    79e5:	1f                   	pop    %ds
    79e6:	31 04 30             	xor    %eax,(%eax,%esi,1)
    79e9:	0a 04 03             	or     (%ebx,%eax,1),%al
    79ec:	26 09 0c 02          	or     %ecx,%es:(%edx,%eax,1)
    79f0:	20 04 02             	and    %al,(%edx,%eax,1)
    79f3:	06                   	push   %es
    79f4:	38 01                	cmp    %al,(%ecx)
    79f6:	01 02                	add    %eax,(%edx)
    79f8:	03 01                	add    (%ecx),%eax
    79fa:	01 05 38 08 02 02    	add    %eax,0x2020838
    7a00:	98                   	cwtl
    7a01:	03 01                	add    (%ecx),%eax
    7a03:	0d 01 07 04 01       	or     $0x1040701,%eax
    7a08:	06                   	push   %es
    7a09:	01 03                	add    %eax,(%ebx)
    7a0b:	02 c6                	add    %dh,%al
    7a0d:	40                   	inc    %eax
    7a0e:	00 01                	add    %al,(%ecx)
    7a10:	c3                   	ret
    7a11:	21 00                	and    %eax,(%eax)
    7a13:	03 8d 01 60 20 00    	add    0x206001(%ebp),%ecx
    7a19:	06                   	push   %es
    7a1a:	69 02 00 04 01 0a    	imul   $0xa010400,(%edx),%eax
    7a20:	20 02                	and    %al,(%edx)
    7a22:	50                   	push   %eax
    7a23:	02 00                	add    (%eax),%al
    7a25:	01 03                	add    %eax,(%ebx)
    7a27:	01 04 01             	add    %eax,(%ecx,%eax,1)
    7a2a:	19 02                	sbb    %eax,(%edx)
    7a2c:	05 01 97 02 1a       	add    $0x1a029701,%eax
    7a31:	12 0d 01 26 08 19    	adc    0x19082601,%cl
    7a37:	0b 01                	or     (%ecx),%eax
    7a39:	01 2c 03             	add    %ebp,(%ebx,%eax,1)
    7a3c:	30 01                	xor    %al,(%ecx)
    7a3e:	02 04 02             	add    (%edx,%eax,1),%al
    7a41:	02 02                	add    (%edx),%al
    7a43:	01 24 01             	add    %esp,(%ecx,%eax,1)
    7a46:	43                   	inc    %ebx
    7a47:	06                   	push   %es
    7a48:	02 02                	add    (%edx),%al
    7a4a:	02 02                	add    (%edx),%al
    7a4c:	0c 01                	or     $0x1,%al
    7a4e:	08 01                	or     %al,(%ecx)
    7a50:	2f                   	das
    7a51:	01 33                	add    %esi,(%ebx)
    7a53:	01 01                	add    %eax,(%ecx)
    7a55:	03 02                	add    (%edx),%eax
    7a57:	02 05 02 01 01 2a    	add    0x2a010102,%al
    7a5d:	02 08                	add    (%eax),%cl
    7a5f:	01 ee                	add    %ebp,%esi
    7a61:	01 02                	add    %eax,(%edx)
    7a63:	01 04 01             	add    %eax,(%ecx,%eax,1)
    7a66:	00 01                	add    %al,(%ecx)
    7a68:	00 10                	add    %dl,(%eax)
    7a6a:	10 10                	adc    %dl,(%eax)
    7a6c:	00 02                	add    %al,(%edx)
    7a6e:	00 01                	add    %al,(%ecx)
    7a70:	e2 01                	loop   7a73 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x1bd>
    7a72:	95                   	xchg   %eax,%ebp
    7a73:	05 00 03 01 02       	add    $0x2010300,%eax
    7a78:	05 04 28 03 04       	add    $0x4032804,%eax
    7a7d:	01 a5 02 00 04 41    	add    %esp,0x41040002(%ebp)
    7a83:	05 00 02 4f 04       	add    $0x44f0200,%eax
    7a88:	46                   	inc    %esi
    7a89:	0b 31                	or     (%ecx),%esi
    7a8b:	04 7b                	add    $0x7b,%al
    7a8d:	01 36                	add    %esi,(%esi)
    7a8f:	0f 29 01             	movaps %xmm0,(%ecx)
    7a92:	02 02                	add    (%edx),%al
    7a94:	0a 03                	or     (%ebx),%al
    7a96:	31 04 02             	xor    %eax,(%edx,%eax,1)
    7a99:	02 07                	add    (%edi),%al
    7a9b:	01 3d 03 24 05 01    	add    %edi,0x1052403
    7aa1:	08 3e                	or     %bh,(%esi)
    7aa3:	01 0c 02             	add    %ecx,(%edx,%eax,1)
    7aa6:	34 09                	xor    $0x9,%al
    7aa8:	01 01                	add    %eax,(%ecx)
    7aaa:	08 04 02             	or     %al,(%edx,%eax,1)
    7aad:	01 5f 03             	add    %ebx,0x3(%edi)
    7ab0:	02 04 06             	add    (%esi,%eax,1),%al
    7ab3:	01 02                	add    %eax,(%edx)
    7ab5:	01 9d 01 03 08 15    	add    %ebx,0x15080301(%ebp)
    7abb:	02 39                	add    (%ecx),%bh
    7abd:	02 01                	add    (%ecx),%al
    7abf:	01 01                	add    %eax,(%ecx)
    7ac1:	01 0c 01             	add    %ecx,(%ecx,%eax,1)
    7ac4:	09 01                	or     %eax,(%ecx)
    7ac6:	0e                   	push   %cs
    7ac7:	07                   	pop    %es
    7ac8:	03 05 43 01 02 06    	add    0x6020143,%eax
    7ace:	01 01                	add    %eax,(%ecx)
    7ad0:	02 01                	add    (%ecx),%al
    7ad2:	01 03                	add    %eax,(%ebx)
    7ad4:	04 03                	add    $0x3,%al
    7ad6:	01 01                	add    %eax,(%ecx)
    7ad8:	0e                   	push   %cs
    7ad9:	02 55 08             	add    0x8(%ebp),%dl
    7adc:	02 03                	add    (%ebx),%al
    7ade:	01 01                	add    %eax,(%ecx)
    7ae0:	17                   	pop    %ss
    7ae1:	01 51 01             	add    %edx,0x1(%ecx)
    7ae4:	02 06                	add    (%esi),%al
    7ae6:	01 01                	add    %eax,(%ecx)
    7ae8:	02 01                	add    (%ecx),%al
    7aea:	01 02                	add    %eax,(%edx)
    7aec:	01 02                	add    %eax,(%edx)
    7aee:	eb 01                	jmp    7af1 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x23b>
    7af0:	02 04 06             	add    (%esi,%eax,1),%al
    7af3:	02 01                	add    (%ecx),%al
    7af5:	02 1b                	add    (%ebx),%bl
    7af7:	02 55 08             	add    0x8(%ebp),%dl
    7afa:	02 01                	add    (%ecx),%al
    7afc:	01 02                	add    %eax,(%edx)
    7afe:	6a 01                	push   $0x1
    7b00:	01 01                	add    %eax,(%ecx)
    7b02:	02 08                	add    (%eax),%cl
    7b04:	65 01 01             	add    %eax,%gs:(%ecx)
    7b07:	01 02                	add    %eax,(%edx)
    7b09:	04 01                	add    $0x1,%al
    7b0b:	05 00 09 01 02       	add    $0x2010900,%eax
    7b10:	f5                   	cmc
    7b11:	01 0a                	add    %ecx,(%edx)
    7b13:	04 04                	add    $0x4,%al
    7b15:	01 90 04 02 02 04    	add    %edx,0x4020204(%eax)
    7b1b:	01 20                	add    %esp,(%eax)
    7b1d:	0a 28                	or     (%eax),%ch
    7b1f:	06                   	push   %es
    7b20:	02 04 08             	add    (%eax,%ecx,1),%al
    7b23:	01 09                	add    %ecx,(%ecx)
    7b25:	06                   	push   %es
    7b26:	02 03                	add    (%ebx),%al
    7b28:	2e 0d 01 02 00 07    	cs or  $0x7000201,%eax
    7b2e:	01 06                	add    %eax,(%esi)
    7b30:	01 01                	add    %eax,(%ecx)
    7b32:	52                   	push   %edx
    7b33:	16                   	push   %ss
    7b34:	02 07                	add    (%edi),%al
    7b36:	01 02                	add    %eax,(%edx)
    7b38:	01 02                	add    %eax,(%edx)
    7b3a:	7a 06                	jp     7b42 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x28c>
    7b3c:	03 01                	add    (%ecx),%eax
    7b3e:	01 02                	add    %eax,(%edx)
    7b40:	01 07                	add    %eax,(%edi)
    7b42:	01 01                	add    %eax,(%ecx)
    7b44:	48                   	dec    %eax
    7b45:	02 03                	add    (%ebx),%al
    7b47:	01 01                	add    %eax,(%ecx)
    7b49:	01 00                	add    %eax,(%eax)
    7b4b:	02 0b                	add    (%ebx),%cl
    7b4d:	02 34 05 05 03 17 01 	add    0x1170305(,%eax,1),%dh
    7b54:	00 01                	add    %al,(%ecx)
    7b56:	06                   	push   %es
    7b57:	0f 00 0c 03          	str    (%ebx,%eax,1)
    7b5b:	03 00                	add    (%eax),%eax
    7b5d:	05 3b 07 00 01       	add    $0x100073b,%eax
    7b62:	3f                   	aas
    7b63:	04 51                	add    $0x51,%al
    7b65:	01 0b                	add    %ecx,(%ebx)
    7b67:	02 00                	add    (%eax),%al
    7b69:	02 00                	add    (%eax),%al
    7b6b:	2e 02 17             	add    %cs:(%edi),%dl
    7b6e:	00 05 03 06 08 08    	add    %al,0x8080603
    7b74:	02 07                	add    (%edi),%al
    7b76:	1e                   	push   %ds
    7b77:	04 94                	add    $0x94,%al
    7b79:	03 00                	add    (%eax),%eax
    7b7b:	37                   	aaa
    7b7c:	04 32                	add    $0x32,%al
    7b7e:	08 01                	or     %al,(%ecx)
    7b80:	0e                   	push   %cs
    7b81:	01 16                	add    %edx,(%esi)
    7b83:	05 01 0f 00 07       	add    $0x7000f01,%eax
    7b88:	01 11                	add    %edx,(%ecx)
    7b8a:	02 07                	add    (%edi),%al
    7b8c:	01 02                	add    %eax,(%edx)
    7b8e:	01 05 64 01 a0 07    	add    %eax,0x7a00164
    7b94:	00 01                	add    %al,(%ecx)
    7b96:	3d 04 00 04 fe       	cmp    $0xfe040004,%eax
    7b9b:	02 00                	add    (%eax),%al
    7b9d:	07                   	pop    %es
    7b9e:	6d                   	insl   (%dx),%es:(%edi)
    7b9f:	07                   	pop    %es
    7ba0:	00 60 80             	add    %ah,-0x80(%eax)
    7ba3:	f0 00 29             	lock add %ch,(%ecx)
    7ba6:	3a 63 61             	cmp    0x61(%ebx),%ah
    7ba9:	6c                   	insb   (%dx),%es:(%edi)
    7baa:	6c                   	insb   (%dx),%es:(%edi)
    7bab:	65 64 20 60 4f       	gs and %ah,%fs:0x4f(%eax)
    7bb0:	70 74                	jo     7c26 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x370>
    7bb2:	69 6f 6e 3a 3a 75 6e 	imul   $0x6e753a3a,0x6e(%edi),%ebp
    7bb9:	77 72                	ja     7c2d <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x377>
    7bbb:	61                   	popa
    7bbc:	70 28                	jo     7be6 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x330>
    7bbe:	29 60 20             	sub    %esp,0x20(%eax)
    7bc1:	6f                   	outsl  %ds:(%esi),(%dx)
    7bc2:	6e                   	outsb  %ds:(%esi),(%dx)
    7bc3:	20 61 20             	and    %ah,0x20(%ecx)
    7bc6:	60                   	pusha
    7bc7:	4e                   	dec    %esi
    7bc8:	6f                   	outsl  %ds:(%esi),(%dx)
    7bc9:	6e                   	outsb  %ds:(%esi),(%dx)
    7bca:	65 60                	gs pusha
    7bcc:	20 76 61             	and    %dh,0x61(%esi)
    7bcf:	6c                   	insb   (%dx),%es:(%edi)
    7bd0:	75 65                	jne    7c37 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x381>
    7bd2:	70 61                	jo     7c35 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x37f>
    7bd4:	6e                   	outsb  %ds:(%esi),(%dx)
    7bd5:	69 63 6b 65 64 20 61 	imul   $0x61206465,0x6b(%ebx),%esp
    7bdc:	74 20                	je     7bfe <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x348>
    7bde:	3a 0a                	cmp    (%edx),%cl
    7be0:	20 62 75             	and    %ah,0x75(%edx)
    7be3:	74 20                	je     7c05 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x34f>
    7be5:	74 68                	je     7c4f <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x399>
    7be7:	65 20 69 6e          	and    %ch,%gs:0x6e(%ecx)
    7beb:	64 65 78 20          	fs gs js 7c0f <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x359>
    7bef:	69 73 20 3a 20 20 7b 	imul   $0x7b20203a,0x20(%ebx),%esi
    7bf6:	20 2c 20             	and    %ch,(%eax,%eiz,1)
    7bf9:	20 7b 0a             	and    %bh,0xa(%ebx)
    7bfc:	2c 0a                	sub    $0xa,%al
    7bfe:	7d 20                	jge    7c20 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x36a>
    7c00:	7d 28                	jge    7c2a <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x374>
    7c02:	28 0a                	sub    %cl,(%edx)
    7c04:	30 78 30             	xor    %bh,0x30(%eax)
    7c07:	30 30                	xor    %dh,(%eax)
    7c09:	31 30                	xor    %esi,(%eax)
    7c0b:	32 30                	xor    (%eax),%dh
    7c0d:	33 30                	xor    (%eax),%esi
    7c0f:	34 30                	xor    $0x30,%al
    7c11:	35 30 36 30 37       	xor    $0x37303630,%eax
    7c16:	30 38                	xor    %bh,(%eax)
    7c18:	30 39                	xor    %bh,(%ecx)
    7c1a:	31 30                	xor    %esi,(%eax)
    7c1c:	31 31                	xor    %esi,(%ecx)
    7c1e:	31 32                	xor    %esi,(%edx)
    7c20:	31 33                	xor    %esi,(%ebx)
    7c22:	31 34 31             	xor    %esi,(%ecx,%esi,1)
    7c25:	35 31 36 31 37       	xor    $0x37313631,%eax
    7c2a:	31 38                	xor    %edi,(%eax)
    7c2c:	31 39                	xor    %edi,(%ecx)
    7c2e:	32 30                	xor    (%eax),%dh
    7c30:	32 31                	xor    (%ecx),%dh
    7c32:	32 32                	xor    (%edx),%dh
    7c34:	32 33                	xor    (%ebx),%dh
    7c36:	32 34 32             	xor    (%edx,%esi,1),%dh
    7c39:	35 32 36 32 37       	xor    $0x37323632,%eax
    7c3e:	32 38                	xor    (%eax),%bh
    7c40:	32 39                	xor    (%ecx),%bh
    7c42:	33 30                	xor    (%eax),%esi
    7c44:	33 31                	xor    (%ecx),%esi
    7c46:	33 32                	xor    (%edx),%esi
    7c48:	33 33                	xor    (%ebx),%esi
    7c4a:	33 34 33             	xor    (%ebx,%esi,1),%esi
    7c4d:	35 33 36 33 37       	xor    $0x37333633,%eax
    7c52:	33 38                	xor    (%eax),%edi
    7c54:	33 39                	xor    (%ecx),%edi
    7c56:	34 30                	xor    $0x30,%al
    7c58:	34 31                	xor    $0x31,%al
    7c5a:	34 32                	xor    $0x32,%al
    7c5c:	34 33                	xor    $0x33,%al
    7c5e:	34 34                	xor    $0x34,%al
    7c60:	34 35                	xor    $0x35,%al
    7c62:	34 36                	xor    $0x36,%al
    7c64:	34 37                	xor    $0x37,%al
    7c66:	34 38                	xor    $0x38,%al
    7c68:	34 39                	xor    $0x39,%al
    7c6a:	35 30 35 31 35       	xor    $0x35313530,%eax
    7c6f:	32 35 33 35 34 35    	xor    0x35343533,%dh
    7c75:	35 35 36 35 37       	xor    $0x37353635,%eax
    7c7a:	35 38 35 39 36       	xor    $0x36393538,%eax
    7c7f:	30 36                	xor    %dh,(%esi)
    7c81:	31 36                	xor    %esi,(%esi)
    7c83:	32 36                	xor    (%esi),%dh
    7c85:	33 36                	xor    (%esi),%esi
    7c87:	34 36                	xor    $0x36,%al
    7c89:	35 36 36 36 37       	xor    $0x37363636,%eax
    7c8e:	36 38 36             	cmp    %dh,%ss:(%esi)
    7c91:	39 37                	cmp    %esi,(%edi)
    7c93:	30 37                	xor    %dh,(%edi)
    7c95:	31 37                	xor    %esi,(%edi)
    7c97:	32 37                	xor    (%edi),%dh
    7c99:	33 37                	xor    (%edi),%esi
    7c9b:	34 37                	xor    $0x37,%al
    7c9d:	35 37 36 37 37       	xor    $0x37373637,%eax
    7ca2:	37                   	aaa
    7ca3:	38 37                	cmp    %dh,(%edi)
    7ca5:	39 38                	cmp    %edi,(%eax)
    7ca7:	30 38                	xor    %bh,(%eax)
    7ca9:	31 38                	xor    %edi,(%eax)
    7cab:	32 38                	xor    (%eax),%bh
    7cad:	33 38                	xor    (%eax),%edi
    7caf:	34 38                	xor    $0x38,%al
    7cb1:	35 38 36 38 37       	xor    $0x37383638,%eax
    7cb6:	38 38                	cmp    %bh,(%eax)
    7cb8:	38 39                	cmp    %bh,(%ecx)
    7cba:	39 30                	cmp    %esi,(%eax)
    7cbc:	39 31                	cmp    %esi,(%ecx)
    7cbe:	39 32                	cmp    %esi,(%edx)
    7cc0:	39 33                	cmp    %esi,(%ebx)
    7cc2:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    7cc5:	35 39 36 39 37       	xor    $0x37393639,%eax
    7cca:	39 38                	cmp    %edi,(%eax)
    7ccc:	39 39                	cmp    %edi,(%ecx)
    7cce:	2f                   	das
    7ccf:	68 6f 6d 65 2f       	push   $0x2f656d6f
    7cd4:	50                   	push   %eax
    7cd5:	61                   	popa
    7cd6:	76 61                	jbe    7d39 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x483>
    7cd8:	6c                   	insb   (%dx),%es:(%edi)
    7cd9:	2f                   	das
    7cda:	2e 72 75             	jb,pn  7d52 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x49c>
    7cdd:	73 74                	jae    7d53 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x49d>
    7cdf:	75 70                	jne    7d51 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x49b>
    7ce1:	2f                   	das
    7ce2:	74 6f                	je     7d53 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x49d>
    7ce4:	6f                   	outsl  %ds:(%esi),(%dx)
    7ce5:	6c                   	insb   (%dx),%es:(%edi)
    7ce6:	63 68 61             	arpl   %ebp,0x61(%eax)
    7ce9:	69 6e 73 2f 6e 69 67 	imul   $0x67696e2f,0x73(%esi),%ebp
    7cf0:	68 74 6c 79 2d       	push   $0x2d796c74
    7cf5:	69 36 38 36 2d 75    	imul   $0x752d3638,(%esi),%esi
    7cfb:	6e                   	outsb  %ds:(%esi),(%dx)
    7cfc:	6b 6e 6f 77          	imul   $0x77,0x6f(%esi),%ebp
    7d00:	6e                   	outsb  %ds:(%esi),(%dx)
    7d01:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
    7d06:	78 2d                	js     7d35 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x47f>
    7d08:	67 6e                	outsb  %ds:(%si),(%dx)
    7d0a:	75 2f                	jne    7d3b <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x485>
    7d0c:	6c                   	insb   (%dx),%es:(%edi)
    7d0d:	69 62 2f 72 75 73 74 	imul   $0x74737572,0x2f(%edx),%esp
    7d14:	6c                   	insb   (%dx),%es:(%edi)
    7d15:	69 62 2f 73 72 63 2f 	imul   $0x2f637273,0x2f(%edx),%esp
    7d1c:	72 75                	jb     7d93 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4dd>
    7d1e:	73 74                	jae    7d94 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4de>
    7d20:	2f                   	das
    7d21:	6c                   	insb   (%dx),%es:(%edi)
    7d22:	69 62 72 61 72 79 2f 	imul   $0x2f797261,0x72(%edx),%esp
    7d29:	63 6f 72             	arpl   %ebp,0x72(%edi)
    7d2c:	65 2f                	gs das
    7d2e:	73 72                	jae    7da2 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4ec>
    7d30:	63 2f                	arpl   %ebp,(%edi)
    7d32:	75 6e                	jne    7da2 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4ec>
    7d34:	69 63 6f 64 65 2f 70 	imul   $0x702f6564,0x6f(%ebx),%esp
    7d3b:	72 69                	jb     7da6 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4f0>
    7d3d:	6e                   	outsb  %ds:(%esi),(%dx)
    7d3e:	74 61                	je     7da1 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4eb>
    7d40:	62 6c 65 2e          	bound  %ebp,0x2e(%ebp,%eiz,2)
    7d44:	72 73                	jb     7db9 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x503>
    7d46:	00 06                	add    %al,(%esi)
    7d48:	01 01                	add    %eax,(%ecx)
    7d4a:	03 01                	add    (%ecx),%eax
    7d4c:	04 02                	add    $0x2,%al
    7d4e:	05 07 07 02 08       	add    $0x8020707,%eax
    7d53:	08 09                	or     %cl,(%ecx)
    7d55:	02 0a                	add    (%edx),%cl
    7d57:	05 0b 02 0e 04       	add    $0x40e020b,%eax
    7d5c:	10 01                	adc    %al,(%ecx)
    7d5e:	11 02                	adc    %eax,(%edx)
    7d60:	12 05 13 1c 14 01    	adc    0x1141c13,%al
    7d66:	15 02 17 02 19       	adc    $0x19021702,%eax
    7d6b:	0d 1c 05 1d 08       	or     $0x81d051c,%eax
    7d70:	1f                   	pop    %ds
    7d71:	01 24 01             	add    %esp,(%ecx,%eax,1)
    7d74:	6a 04                	push   $0x4
    7d76:	6b 02 af             	imul   $0xffffffaf,(%edx),%eax
    7d79:	03 b1 02 bc 02 cf    	add    -0x30fd43fe(%ecx),%esi
    7d7f:	02 d1                	add    %cl,%dl
    7d81:	02 d4                	add    %ah,%dl
    7d83:	0c d5                	or     $0xd5,%al
    7d85:	09 d6                	or     %edx,%esi
    7d87:	02 d7                	add    %bh,%dl
    7d89:	02 da                	add    %dl,%bl
    7d8b:	01 e0                	add    %esp,%eax
    7d8d:	05 e1 02 e7 04       	add    $0x4e702e1,%eax
    7d92:	e8 02 ee 20 f0       	call   f0216b99 <_end+0xf020a45d>
    7d97:	04 f8                	add    $0xf8,%al
    7d99:	02 fa                	add    %dl,%bh
    7d9b:	04 fb                	add    $0xfb,%al
    7d9d:	01 0c 27             	add    %ecx,(%edi,%eiz,1)
    7da0:	3b 3e                	cmp    (%esi),%edi
    7da2:	4e                   	dec    %esi
    7da3:	4f                   	dec    %edi
    7da4:	8f                   	(bad)
    7da5:	9e                   	sahf
    7da6:	9e                   	sahf
    7da7:	9f                   	lahf
    7da8:	7b 8b                	jnp    7d35 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x47f>
    7daa:	93                   	xchg   %eax,%ebx
    7dab:	96                   	xchg   %eax,%esi
    7dac:	a2 b2 ba 86 b1       	mov    %al,0xb186bab2
    7db1:	06                   	push   %es
    7db2:	07                   	pop    %es
    7db3:	09 36                	or     %esi,(%esi)
    7db5:	3d 3e 56 f3 d0       	cmp    $0xd0f3563e,%eax
    7dba:	d1 04 14             	roll   $1,(%esp,%edx,1)
    7dbd:	18 36                	sbb    %dh,(%esi)
    7dbf:	37                   	aaa
    7dc0:	56                   	push   %esi
    7dc1:	57                   	push   %edi
    7dc2:	7f aa                	jg     7d6e <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4b8>
    7dc4:	ae                   	scas   %es:(%edi),%al
    7dc5:	af                   	scas   %es:(%edi),%eax
    7dc6:	bd 35 e0 12 87       	mov    $0x8712e035,%ebp
    7dcb:	89 8e 9e 04 0d 0e    	mov    %ecx,0xe0d049e(%esi)
    7dd1:	11 12                	adc    %edx,(%edx)
    7dd3:	29 31                	sub    %esi,(%ecx)
    7dd5:	34 3a                	xor    $0x3a,%al
    7dd7:	45                   	inc    %ebp
    7dd8:	46                   	inc    %esi
    7dd9:	49                   	dec    %ecx
    7dda:	4a                   	dec    %edx
    7ddb:	4e                   	dec    %esi
    7ddc:	4f                   	dec    %edi
    7ddd:	64 65 8a 8c 8d 8f b6 	fs mov %gs:-0x3c3e4971(%ebp,%ecx,4),%cl
    7de4:	c1 c3 
    7de6:	c4                   	(bad)
    7de7:	c6                   	(bad)
    7de8:	cb                   	lret
    7de9:	d6                   	(bad)
    7dea:	5c                   	pop    %esp
    7deb:	b6 b7                	mov    $0xb7,%dh
    7ded:	1b 1c 07             	sbb    (%edi,%eax,1),%ebx
    7df0:	08 0a                	or     %cl,(%edx)
    7df2:	0b 14 17             	or     (%edi,%edx,1),%edx
    7df5:	36 39 3a             	cmp    %edi,%ss:(%edx)
    7df8:	a8 a9                	test   $0xa9,%al
    7dfa:	d8 d9                	fcomp  %st(1)
    7dfc:	09 37                	or     %esi,(%edi)
    7dfe:	90                   	nop
    7dff:	91                   	xchg   %eax,%ecx
    7e00:	a8 07                	test   $0x7,%al
    7e02:	0a 3b                	or     (%ebx),%bh
    7e04:	3e 66 69 8f 92 11 6f 	imul   $0xeebf,%ds:0x5f6f1192(%edi),%cx
    7e0b:	5f bf ee 
    7e0e:	ef                   	out    %eax,(%dx)
    7e0f:	5a                   	pop    %edx
    7e10:	62                   	(bad)
    7e11:	f4                   	hlt
    7e12:	fc                   	cld
    7e13:	ff 53 54             	call   *0x54(%ebx)
    7e16:	9a 9b 2e 2f 27 28 55 	lcall  $0x5528,$0x272f2e9b
    7e1d:	9d                   	popf
    7e1e:	a0 a1 a3 a4 a7       	mov    0xa7a4a3a1,%al
    7e23:	a8 ad                	test   $0xad,%al
    7e25:	ba bc c4 06 0b       	mov    $0xb06c4bc,%edx
    7e2a:	0c 15                	or     $0x15,%al
    7e2c:	1d 3a 3f 45 51       	sbb    $0x51453f3a,%eax
    7e31:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
    7e32:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
    7e33:	cc                   	int3
    7e34:	cd a0                	int    $0xa0
    7e36:	07                   	pop    %es
    7e37:	19 1a                	sbb    %ebx,(%edx)
    7e39:	22 25 3e 3f e7 ec    	and    0xece73f3e,%ah
    7e3f:	ef                   	out    %eax,(%dx)
    7e40:	ff c5                	inc    %ebp
    7e42:	c6 04 20 23          	movb   $0x23,(%eax,%eiz,1)
    7e46:	25 26 28 33 38       	and    $0x38332826,%eax
    7e4b:	3a 48 4a             	cmp    0x4a(%eax),%cl
    7e4e:	4c                   	dec    %esp
    7e4f:	50                   	push   %eax
    7e50:	53                   	push   %ebx
    7e51:	55                   	push   %ebp
    7e52:	56                   	push   %esi
    7e53:	58                   	pop    %eax
    7e54:	5a                   	pop    %edx
    7e55:	5c                   	pop    %esp
    7e56:	5e                   	pop    %esi
    7e57:	60                   	pusha
    7e58:	63 65 66             	arpl   %esp,0x66(%ebp)
    7e5b:	6b 73 78 7d          	imul   $0x7d,0x78(%ebx),%esi
    7e5f:	7f 8a                	jg     7deb <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x535>
    7e61:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    7e62:	aa                   	stos   %al,%es:(%edi)
    7e63:	af                   	scas   %es:(%edi),%eax
    7e64:	b0 c0                	mov    $0xc0,%al
    7e66:	d0 ae af 6e 6f dd    	shrb   $1,-0x22909151(%esi)
    7e6c:	de 93 5e 22 7b 05    	ficoms 0x57b225e(%ebx)
    7e72:	03 04 2d 03 66 03 01 	add    0x1036603(,%ebp,1),%eax
    7e79:	2f                   	das
    7e7a:	2e 80 82 1d 03 31 0f 	addb   $0x1c,%cs:0xf31031d(%edx)
    7e81:	1c 
    7e82:	04 24                	add    $0x24,%al
    7e84:	09 1e                	or     %ebx,(%esi)
    7e86:	05 2b 05 44 04       	add    $0x444052b,%eax
    7e8b:	0e                   	push   %cs
    7e8c:	2a 80 aa 06 24 04    	sub    0x42406aa(%eax),%al
    7e92:	24 04                	and    $0x4,%al
    7e94:	28 08                	sub    %cl,(%eax)
    7e96:	34 0b                	xor    $0xb,%al
    7e98:	4e                   	dec    %esi
    7e99:	03 34 0c             	add    (%esp,%ecx,1),%esi
    7e9c:	81 37 09 16 0a 08    	xorl   $0x80a1609,(%edi)
    7ea2:	18 3b                	sbb    %bh,(%ebx)
    7ea4:	45                   	inc    %ebp
    7ea5:	39 03                	cmp    %eax,(%ebx)
    7ea7:	63 08                	arpl   %ecx,(%eax)
    7ea9:	09 30                	or     %esi,(%eax)
    7eab:	16                   	push   %ss
    7eac:	05 21 03 1b 05       	add    $0x51b0321,%eax
    7eb1:	01 40 38             	add    %eax,0x38(%eax)
    7eb4:	04 4b                	add    $0x4b,%al
    7eb6:	05 2f 04 0a 07       	add    $0x70a042f,%eax
    7ebb:	09 07                	or     %eax,(%edi)
    7ebd:	40                   	inc    %eax
    7ebe:	20 27                	and    %ah,(%edi)
    7ec0:	04 0c                	add    $0xc,%al
    7ec2:	09 36                	or     %esi,(%esi)
    7ec4:	03 3a                	add    (%edx),%edi
    7ec6:	05 1a 07 04 0c       	add    $0xc04071a,%eax
    7ecb:	07                   	pop    %es
    7ecc:	50                   	push   %eax
    7ecd:	49                   	dec    %ecx
    7ece:	37                   	aaa
    7ecf:	33 0d 33 07 2e 08    	xor    0x82e0733,%ecx
    7ed5:	0a 06                	or     (%esi),%al
    7ed7:	26 03 1d 08 02 80 d0 	add    %es:0xd0800208,%ebx
    7ede:	52                   	push   %edx
    7edf:	10 03                	adc    %al,(%ebx)
    7ee1:	37                   	aaa
    7ee2:	2c 08                	sub    $0x8,%al
    7ee4:	2a 16                	sub    (%esi),%dl
    7ee6:	1a 26                	sbb    (%esi),%ah
    7ee8:	1c 14                	sbb    $0x14,%al
    7eea:	17                   	pop    %ss
    7eeb:	09 4e 04             	or     %ecx,0x4(%esi)
    7eee:	24 09                	and    $0x9,%al
    7ef0:	44                   	inc    %esp
    7ef1:	0d 19 07 0a 06       	or     $0x60a0719,%eax
    7ef6:	48                   	dec    %eax
    7ef7:	08 27                	or     %ah,(%edi)
    7ef9:	09 75 0b             	or     %esi,0xb(%ebp)
    7efc:	42                   	inc    %edx
    7efd:	3e 2a 06             	sub    %ds:(%esi),%al
    7f00:	3b 05 0a 06 51 06    	cmp    0x651060a,%eax
    7f06:	01 05 10 03 05 0b    	add    %eax,0xb050310
    7f0c:	59                   	pop    %ecx
    7f0d:	08 02                	or     %al,(%edx)
    7f0f:	1d 62 1e 48 08       	sbb    $0x8481e62,%eax
    7f14:	0a 80 a6 5e 22 45    	or     0x45225ea6(%eax),%al
    7f1a:	0b 0a                	or     (%edx),%ecx
    7f1c:	06                   	push   %es
    7f1d:	0d 13 3a 06 0a       	or     $0xa063a13,%eax
    7f22:	06                   	push   %es
    7f23:	14 1c                	adc    $0x1c,%al
    7f25:	2c 04                	sub    $0x4,%al
    7f27:	17                   	pop    %ss
    7f28:	80 b9 3c 64 53 0c 48 	cmpb   $0x48,0xc53643c(%ecx)
    7f2f:	09 0a                	or     %ecx,(%edx)
    7f31:	46                   	inc    %esi
    7f32:	45                   	inc    %ebp
    7f33:	1b 48 08             	sbb    0x8(%eax),%ecx
    7f36:	53                   	push   %ebx
    7f37:	0d 49 07 0a 80       	or     $0x800a0749,%eax
    7f3c:	b6 22                	mov    $0x22,%dh
    7f3e:	0e                   	push   %cs
    7f3f:	0a 06                	or     (%esi),%al
    7f41:	46                   	inc    %esi
    7f42:	0a 1d 03 47 49 37    	or     0x37494703,%bl
    7f48:	03 0e                	add    (%esi),%ecx
    7f4a:	08 0a                	or     %cl,(%edx)
    7f4c:	06                   	push   %es
    7f4d:	39 07                	cmp    %eax,(%edi)
    7f4f:	0a 81 36 19 07 3b    	or     0x3b071936(%ecx),%al
    7f55:	03 1d 55 01 0f 32    	add    0x320f0155,%ebx
    7f5b:	0d 83 9b 66 75       	or     $0x75669b83,%eax
    7f60:	0b 80 c4 8a 4c 63    	or     0x634c8ac4(%eax),%eax
    7f66:	0d 84 30 10 16       	or     $0x16103084,%eax
    7f6b:	0a 8f 9b 05 82 47    	or     0x4782059b(%edi),%cl
    7f71:	9a b9 3a 86 c6 82 39 	lcall  $0x3982,$0xc6863ab9
    7f78:	07                   	pop    %es
    7f79:	2a 04 5c             	sub    (%esp,%ebx,2),%al
    7f7c:	06                   	push   %es
    7f7d:	26 0a 46 0a          	or     %es:0xa(%esi),%al
    7f81:	28 05 13 81 b0 3a    	sub    %al,0x3ab08113
    7f87:	80 c6 5b             	add    $0x5b,%dh
    7f8a:	65 4b                	gs dec %ebx
    7f8c:	04 39                	add    $0x39,%al
    7f8e:	07                   	pop    %es
    7f8f:	11 40 05             	adc    %eax,0x5(%eax)
    7f92:	0b 02                	or     (%edx),%eax
    7f94:	0e                   	push   %cs
    7f95:	97                   	xchg   %eax,%edi
    7f96:	f8                   	clc
    7f97:	08 84 d6 29 0a a2 e7 	or     %al,-0x185df5d7(%esi,%edx,8)
    7f9e:	81 33 0f 01 1d 06    	xorl   $0x61d010f,(%ebx)
    7fa4:	0e                   	push   %cs
    7fa5:	04 08                	add    $0x8,%al
    7fa7:	81 8c 89 04 6b 05 0d 	orl    $0x10070903,0xd056b04(%ecx,%ecx,4)
    7fae:	03 09 07 10 
    7fb2:	8f                   	(bad)
    7fb3:	60                   	pusha
    7fb4:	80 fa 06             	cmp    $0x6,%dl
    7fb7:	81 b4 4c 47 09 74 3c 	xorl   $0x730af680,0x3c740947(%esp,%ecx,2)
    7fbe:	80 f6 0a 73 
    7fc2:	08 70 15             	or     %dh,0x15(%eax)
    7fc5:	46                   	inc    %esi
    7fc6:	7a 14                	jp     7fdc <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x726>
    7fc8:	0c 14                	or     $0x14,%al
    7fca:	0c 57                	or     $0x57,%al
    7fcc:	09 19                	or     %ebx,(%ecx)
    7fce:	80 87 81 47 03 85 42 	addb   $0x42,-0x7afcb87f(%edi)
    7fd5:	0f 15 84 50 1f 06 06 	unpckhps -0x7ff9f9e1(%eax,%edx,2),%xmm0
    7fdc:	80 
    7fdd:	d5 2b                	aad    $0x2b
    7fdf:	05 3e 21 01 70       	add    $0x7001213e,%eax
    7fe4:	2d 03 1a 04 02       	sub    $0x2041a03,%eax
    7fe9:	81 40 1f 11 3a 05 01 	addl   $0x1053a11,0x1f(%eax)
    7ff0:	81 d0 2a 80 d6 2b    	adc    $0x2bd6802a,%eax
    7ff6:	04 01                	add    $0x1,%al
    7ff8:	81 e0 80 f7 29 4c    	and    $0x4c29f780,%eax
    7ffe:	04 0a                	add    $0xa,%al
    8000:	04 02                	add    $0x2,%al
    8002:	83 11 44             	adcl   $0x44,(%ecx)
    8005:	4c                   	dec    %esp
    8006:	3d 80 c2 3c 06       	cmp    $0x63cc280,%eax
    800b:	01 04 55 05 1b 34 02 	add    %eax,0x2341b05(,%edx,2)
    8012:	81 0e 2c 04 64 0c    	orl    $0xc64042c,(%esi)
    8018:	56                   	push   %esi
    8019:	0a 80 ae 38 1d 0d    	or     0xd1d38ae(%eax),%al
    801f:	2c 04                	sub    $0x4,%al
    8021:	09 07                	or     %eax,(%edi)
    8023:	02 0e                	add    (%esi),%cl
    8025:	06                   	push   %es
    8026:	80 9a 83 d8 04 11 03 	sbbb   $0x3,0x1104d883(%edx)
    802d:	0d 03 77 04 5f       	or     $0x5f047703,%eax
    8032:	06                   	push   %es
    8033:	0c 04                	or     $0x4,%al
    8035:	01 0f                	add    %ecx,(%edi)
    8037:	0c 04                	or     $0x4,%al
    8039:	38 08                	cmp    %cl,(%eax)
    803b:	0a 06                	or     (%esi),%al
    803d:	28 08                	sub    %cl,(%eax)
    803f:	2c 04                	sub    $0x4,%al
    8041:	02 3e                	add    (%esi),%bh
    8043:	81 54 0c 1d 03 0a 05 	adcl   $0x38050a03,0x1d(%esp,%ecx,1)
    804a:	38 
    804b:	07                   	pop    %es
    804c:	1c 06                	sbb    $0x6,%al
    804e:	09 07                	or     %eax,(%edi)
    8050:	80 fa 84             	cmp    $0x84,%dl
    8053:	06                   	push   %es
    8054:	00 01                	add    %al,(%ecx)
    8056:	03 05 05 06 06 02    	add    0x2060605,%eax
    805c:	07                   	pop    %es
    805d:	06                   	push   %es
    805e:	08 07                	or     %al,(%edi)
    8060:	09 11                	or     %edx,(%ecx)
    8062:	0a 1c 0b             	or     (%ebx,%ecx,1),%bl
    8065:	19 0c 1a             	sbb    %ecx,(%edx,%ebx,1)
    8068:	0d 10 0e 0c 0f       	or     $0xf0c0e10,%eax
    806d:	04 10                	add    $0x10,%al
    806f:	03 12                	add    (%edx),%edx
    8071:	12 13                	adc    (%ebx),%dl
    8073:	09 16                	or     %edx,(%esi)
    8075:	01 17                	add    %edx,(%edi)
    8077:	04 18                	add    $0x18,%al
    8079:	01 19                	add    %ebx,(%ecx)
    807b:	03 1a                	add    (%edx),%ebx
    807d:	07                   	pop    %es
    807e:	1b 01                	sbb    (%ecx),%eax
    8080:	1c 02                	sbb    $0x2,%al
    8082:	1f                   	pop    %ds
    8083:	16                   	push   %ss
    8084:	20 03                	and    %al,(%ebx)
    8086:	2b 03                	sub    (%ebx),%eax
    8088:	2d 0b 2e 01 30       	sub    $0x30012e0b,%eax
    808d:	04 31                	add    $0x31,%al
    808f:	02 32                	add    (%edx),%dh
    8091:	01 a7 04 a9 02 aa    	add    %esp,-0x55fd56fc(%edi)
    8097:	04 ab                	add    $0xab,%al
    8099:	08 fa                	or     %bh,%dl
    809b:	02 fb                	add    %bl,%bh
    809d:	05 fd 02 fe 03       	add    $0x3fe02fd,%eax
    80a2:	ff 09                	decl   (%ecx)
    80a4:	ad                   	lods   %ds:(%esi),%eax
    80a5:	78 79                	js     8120 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x86a>
    80a7:	8b 8d a2 30 57 58    	mov    0x585730a2(%ebp),%ecx
    80ad:	8b 8c 90 1c dd 0e 0f 	mov    0xf0edd1c(%eax,%edx,4),%ecx
    80b4:	4b                   	dec    %ebx
    80b5:	4c                   	dec    %esp
    80b6:	fb                   	sti
    80b7:	fc                   	cld
    80b8:	2e 2f                	cs das
    80ba:	3f                   	aas
    80bb:	5c                   	pop    %esp
    80bc:	5d                   	pop    %ebp
    80bd:	5f                   	pop    %edi
    80be:	e2 84                	loop   8044 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x78e>
    80c0:	8d 8e 91 92 a9 b1    	lea    -0x4e566d6f(%esi),%ecx
    80c6:	ba bb c5 c6 c9       	mov    $0xc9c6c5bb,%edx
    80cb:	ca de e4             	lret   $0xe4de
    80ce:	e5 ff                	in     $0xff,%eax
    80d0:	00 04 11             	add    %al,(%ecx,%edx,1)
    80d3:	12 29                	adc    (%ecx),%ch
    80d5:	31 34 37             	xor    %esi,(%edi,%esi,1)
    80d8:	3a 3b                	cmp    (%ebx),%bh
    80da:	3d 49 4a 5d 84       	cmp    $0x845d4a49,%eax
    80df:	8e 92 a9 b1 b4 ba    	mov    -0x454b4e57(%edx),%ss
    80e5:	bb c6 ca ce cf       	mov    $0xcfcecac6,%ebx
    80ea:	e4 e5                	in     $0xe5,%al
    80ec:	00 04 0d 0e 11 12 29 	add    %al,0x2912110e(,%ecx,1)
    80f3:	31 34 3a             	xor    %esi,(%edx,%edi,1)
    80f6:	3b 45 46             	cmp    0x46(%ebp),%eax
    80f9:	49                   	dec    %ecx
    80fa:	4a                   	dec    %edx
    80fb:	5e                   	pop    %esi
    80fc:	64 65 84 91 9b 9d c9 	fs test %dl,%gs:-0x31366265(%ecx)
    8103:	ce 
    8104:	cf                   	iret
    8105:	0d 11 29 3a 3b       	or     $0x3b3a2911,%eax
    810a:	45                   	inc    %ebp
    810b:	49                   	dec    %ecx
    810c:	57                   	push   %edi
    810d:	5b                   	pop    %ebx
    810e:	5c                   	pop    %esp
    810f:	5e                   	pop    %esi
    8110:	5f                   	pop    %edi
    8111:	64 65 8d 91 a9 b4 ba 	fs lea %gs:-0x44454b57(%ecx),%edx
    8118:	bb 
    8119:	c5 c9 df e4          	vpandn %xmm4,%xmm6,%xmm4
    811d:	e5 f0                	in     $0xf0,%eax
    811f:	0d 11 45 49 64       	or     $0x64494511,%eax
    8124:	65 80 84 b2 bc be bf 	addb   $0xd7,%gs:-0x2a404144(%edx,%esi,4)
    812b:	d5 d7 
    812d:	f0 f1                	lock int1
    812f:	83 85 8b a4 a6 be bf 	addl   $0xffffffbf,-0x41595b75(%ebp)
    8136:	c5 c7 cf             	(bad)
    8139:	da db                	fcmovu %st(3),%st
    813b:	48                   	dec    %eax
    813c:	98                   	cwtl
    813d:	bd cd c6 ce cf       	mov    $0xcfcec6cd,%ebp
    8142:	49                   	dec    %ecx
    8143:	4e                   	dec    %esi
    8144:	4f                   	dec    %edi
    8145:	57                   	push   %edi
    8146:	59                   	pop    %ecx
    8147:	5e                   	pop    %esi
    8148:	5f                   	pop    %edi
    8149:	89 8e 8f b1 b6 b7    	mov    %ecx,-0x48494e71(%esi)
    814f:	bf c1 c6 c7 d7       	mov    $0xd7c7c6c1,%edi
    8154:	11 16                	adc    %edx,(%esi)
    8156:	17                   	pop    %ss
    8157:	5b                   	pop    %ebx
    8158:	5c                   	pop    %esp
    8159:	f6 f7                	div    %bh
    815b:	fe                   	(bad)
    815c:	ff 80 6d 71 de df    	incl   -0x20218e93(%eax)
    8162:	0e                   	push   %cs
    8163:	1f                   	pop    %ds
    8164:	6e                   	outsb  %ds:(%esi),(%dx)
    8165:	6f                   	outsl  %ds:(%esi),(%dx)
    8166:	1c 1d                	sbb    $0x1d,%al
    8168:	5f                   	pop    %edi
    8169:	7d 7e                	jge    81e9 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x933>
    816b:	ae                   	scas   %es:(%edi),%al
    816c:	af                   	scas   %es:(%edi),%eax
    816d:	4d                   	dec    %ebp
    816e:	bb bc 16 17 1e       	mov    $0x1e1716bc,%ebx
    8173:	1f                   	pop    %ds
    8174:	46                   	inc    %esi
    8175:	47                   	inc    %edi
    8176:	4e                   	dec    %esi
    8177:	4f                   	dec    %edi
    8178:	58                   	pop    %eax
    8179:	5a                   	pop    %edx
    817a:	5c                   	pop    %esp
    817b:	5e                   	pop    %esi
    817c:	7e 7f                	jle    81fd <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x947>
    817e:	b5 c5                	mov    $0xc5,%ch
    8180:	d4 d5                	aam    $0xd5
    8182:	dc f0                	fdiv   %st,%st(0)
    8184:	f1                   	int1
    8185:	f5                   	cmc
    8186:	72 73                	jb     81fb <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x945>
    8188:	8f                   	(bad)
    8189:	74 75                	je     8200 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x94a>
    818b:	96                   	xchg   %eax,%esi
    818c:	26 2e 2f             	es cs das
    818f:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
    8190:	af                   	scas   %es:(%edi),%eax
    8191:	b7 bf                	mov    $0xbf,%bh
    8193:	c7                   	(bad)
    8194:	cf                   	iret
    8195:	d7                   	xlat   %ds:(%ebx)
    8196:	df 9a 00 40 97 98    	fistps -0x6768c000(%edx)
    819c:	30 8f 1f ce cf d2    	xor    %cl,-0x2d3031e1(%edi)
    81a2:	d4 ce                	aam    $0xce
    81a4:	ff 4e 4f             	decl   0x4f(%esi)
    81a7:	5a                   	pop    %edx
    81a8:	5b                   	pop    %ebx
    81a9:	07                   	pop    %es
    81aa:	08 0f                	or     %cl,(%edi)
    81ac:	10 27                	adc    %ah,(%edi)
    81ae:	2f                   	das
    81af:	ee                   	out    %al,(%dx)
    81b0:	ef                   	out    %eax,(%dx)
    81b1:	6e                   	outsb  %ds:(%esi),(%dx)
    81b2:	6f                   	outsl  %ds:(%esi),(%dx)
    81b3:	37                   	aaa
    81b4:	3d 3f 42 45 90       	cmp    $0x9045423f,%eax
    81b9:	91                   	xchg   %eax,%ecx
    81ba:	53                   	push   %ebx
    81bb:	67 75 c8             	addr16 jne 8186 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x8d0>
    81be:	c9                   	leave
    81bf:	d0 d1                	rcl    $1,%cl
    81c1:	d8 d9                	fcomp  %st(1)
    81c3:	e7 fe                	out    %eax,$0xfe
    81c5:	ff 00                	incl   (%eax)
    81c7:	20 5f 22             	and    %bl,0x22(%edi)
    81ca:	82 df 04             	sbb    $0x4,%bh
    81cd:	82 44 08 1b 04       	addb   $0x4,0x1b(%eax,%ecx,1)
    81d2:	06                   	push   %es
    81d3:	11 81 ac 0e 80 ab    	adc    %eax,-0x547ff154(%ecx)
    81d9:	05 1f 08 81 1c       	add    $0x1c81081f,%eax
    81de:	03 19                	add    (%ecx),%ebx
    81e0:	08 01                	or     %al,(%ecx)
    81e2:	04 2f                	add    $0x2f,%al
    81e4:	04 34                	add    $0x34,%al
    81e6:	04 07                	add    $0x7,%al
    81e8:	03 01                	add    (%ecx),%eax
    81ea:	07                   	pop    %es
    81eb:	06                   	push   %es
    81ec:	07                   	pop    %es
    81ed:	11 0a                	adc    %ecx,(%edx)
    81ef:	50                   	push   %eax
    81f0:	0f 12 07             	movlps (%edi),%xmm0
    81f3:	55                   	push   %ebp
    81f4:	07                   	pop    %es
    81f5:	03 04 1c             	add    (%esp,%ebx,1),%eax
    81f8:	0a 09                	or     (%ecx),%cl
    81fa:	03 08                	add    (%eax),%ecx
    81fc:	03 07                	add    (%edi),%eax
    81fe:	03 02                	add    (%edx),%eax
    8200:	03 03                	add    (%ebx),%eax
    8202:	03 0c 04             	add    (%esp,%eax,1),%ecx
    8205:	05 03 0b 06 01       	add    $0x1060b03,%eax
    820a:	0e                   	push   %cs
    820b:	15 05 4e 07 1b       	adc    $0x1b074e05,%eax
    8210:	07                   	pop    %es
    8211:	57                   	push   %edi
    8212:	07                   	pop    %es
    8213:	02 06                	add    (%esi),%al
    8215:	17                   	pop    %ss
    8216:	0c 50                	or     $0x50,%al
    8218:	04 43                	add    $0x43,%al
    821a:	03 2d 03 01 04 11    	add    0x11040103,%ebp
    8220:	06                   	push   %es
    8221:	0f 0c                	(bad)
    8223:	3a 04 1d 25 5f 20 6d 	cmp    0x6d205f25(,%ebx,1),%al
    822a:	04 6a                	add    $0x6a,%al
    822c:	25 80 c8 05 82       	and    $0x8205c880,%eax
    8231:	b0 03                	mov    $0x3,%al
    8233:	1a 06                	sbb    (%esi),%al
    8235:	82 fd 03             	cmp    $0x3,%ch
    8238:	59                   	pop    %ecx
    8239:	07                   	pop    %es
    823a:	16                   	push   %ss
    823b:	09 18                	or     %ebx,(%eax)
    823d:	09 14 0c             	or     %edx,(%esp,%ecx,1)
    8240:	14 0c                	adc    $0xc,%al
    8242:	6a 06                	push   $0x6
    8244:	0a 06                	or     (%esi),%al
    8246:	1a 06                	sbb    (%esi),%al
    8248:	59                   	pop    %ecx
    8249:	07                   	pop    %es
    824a:	2b 05 46 0a 2c 04    	sub    0x42c0a46,%eax
    8250:	0c 04                	or     $0x4,%al
    8252:	01 03                	add    %eax,(%ebx)
    8254:	31 0b                	xor    %ecx,(%ebx)
    8256:	2c 04                	sub    $0x4,%al
    8258:	1a 06                	sbb    (%esi),%al
    825a:	0b 03                	or     (%ebx),%eax
    825c:	80 ac 06 0a 06 2f 31 	subb   $0x80,0x312f060a(%esi,%eax,1)
    8263:	80 
    8264:	f4                   	hlt
    8265:	08 3c 03             	or     %bh,(%ebx,%eax,1)
    8268:	0f 03 3e             	lsl    (%esi),%edi
    826b:	05 38 08 2b 05       	add    $0x52b0838,%eax
    8270:	82 ff 11             	cmp    $0x11,%bh
    8273:	18 08                	sbb    %cl,(%eax)
    8275:	2f                   	das
    8276:	11 2d 03 21 0f 21    	adc    %ebp,0x210f2103
    827c:	0f 80 8c 04 82 9a    	jo     9a82870e <_end+0x9a81bfd2>
    8282:	16                   	push   %ss
    8283:	0b 15 88 94 05 2f    	or     0x2f059488,%edx
    8289:	05 3b 07 02 0e       	add    $0xe02073b,%eax
    828e:	18 09                	sbb    %cl,(%ecx)
    8290:	80 be 22 74 0c 80 d6 	cmpb   $0xd6,-0x7ff38bde(%esi)
    8297:	1a 81 10 05 80 e1    	sbb    -0x1e7ffaf0(%ecx),%al
    829d:	09 f2                	or     %esi,%edx
    829f:	9e                   	sahf
    82a0:	03 37                	add    (%edi),%esi
    82a2:	09 81 5c 14 80 b8    	or     %eax,-0x477feba4(%ecx)
    82a8:	08 80 dd 15 3b 03    	or     %al,0x33b15dd(%eax)
    82ae:	0a 06                	or     (%esi),%al
    82b0:	38 08                	cmp    %cl,(%eax)
    82b2:	46                   	inc    %esi
    82b3:	08 0c 06             	or     %cl,(%esi,%eax,1)
    82b6:	74 0b                	je     82c3 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0xa0d>
    82b8:	1e                   	push   %ds
    82b9:	03 5a 04             	add    0x4(%edx),%ebx
    82bc:	59                   	pop    %ecx
    82bd:	09 80 83 18 1c 0a    	or     %eax,0xa1c1883(%eax)
    82c3:	16                   	push   %ss
    82c4:	09 4c 04 80          	or     %ecx,-0x80(%esp,%eax,1)
    82c8:	8a 06                	mov    (%esi),%al
    82ca:	ab                   	stos   %eax,%es:(%edi)
    82cb:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    82cc:	0c 17                	or     $0x17,%al
    82ce:	04 31                	add    $0x31,%al
    82d0:	a1 04 81 da 26       	mov    0x26da8104,%eax
    82d5:	07                   	pop    %es
    82d6:	0c 05                	or     $0x5,%al
    82d8:	05 80 a6 10 81       	add    $0x8110a680,%eax
    82dd:	f5                   	cmc
    82de:	07                   	pop    %es
    82df:	01 20                	add    %esp,(%eax)
    82e1:	2a 06                	sub    (%esi),%al
    82e3:	4c                   	dec    %esp
    82e4:	04 80                	add    $0x80,%al
    82e6:	8d 04 80             	lea    (%eax,%eax,4),%eax
    82e9:	be 03 1b 03 0f       	mov    $0xf031b03,%esi
    82ee:	0d 6d 65 6d 6f       	or     $0x6f6d656d,%eax
    82f3:	72 79                	jb     836e <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x22>
    82f5:	20 61 6c             	and    %ah,0x6c(%ecx)
    82f8:	6c                   	insb   (%dx),%es:(%edi)
    82f9:	6f                   	outsl  %ds:(%esi),(%dx)
    82fa:	63 61 74             	arpl   %esp,0x74(%ecx)
    82fd:	69 6f 6e 20 66 61 69 	imul   $0x69616620,0x6e(%edi),%ebp
    8304:	6c                   	insb   (%dx),%es:(%edi)
    8305:	65 64 20 6f 75       	gs and %ch,%fs:0x75(%edi)
    830a:	74 20                	je     832c <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0xa76>
    830c:	6f                   	outsl  %ds:(%esi),(%dx)
    830d:	66 20 72 61          	data16 and %dh,0x61(%edx)
    8311:	6e                   	outsb  %ds:(%esi),(%dx)
    8312:	67 65 20 66 6f       	and    %ah,%gs:0x6f(%bp)
    8317:	72 20                	jb     8339 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0xa83>
    8319:	73 6c                	jae    8387 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x3b>
    831b:	69 63 65 20 6f 66 20 	imul   $0x20666f20,0x65(%ebx),%esp
    8322:	6c                   	insb   (%dx),%es:(%edi)
    8323:	65 6e                	outsb  %gs:(%esi),(%dx)
    8325:	67 74 68             	addr16 je 8390 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x44>
    8328:	20 73 6c             	and    %dh,0x6c(%ebx)
    832b:	69 63 65 20 69 6e 64 	imul   $0x646e6920,0x65(%ebx),%esp
    8332:	65 78 20             	gs js  8355 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x9>
    8335:	73 74                	jae    83ab <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x5f>
    8337:	61                   	popa
    8338:	72 74                	jb     83ae <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x62>
    833a:	73 20                	jae    835c <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x10>
    833c:	61                   	popa
    833d:	74 20                	je     835f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x13>
    833f:	20 62 75             	and    %ah,0x75(%edx)
    8342:	74 20                	je     8364 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x18>
    8344:	65 6e                	outsb  %gs:(%esi),(%dx)
    8346:	64 73 20             	fs jae 8369 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1d>
    8349:	61                   	popa
    834a:	74 20                	je     836c <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x20>

0000834c <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE>:
    834c:	00 03                	add    %al,(%ebx)
    834e:	00 00                	add    %al,(%eax)
    8350:	83 04 20 00          	addl   $0x0,(%eax,%eiz,1)
    8354:	91                   	xchg   %eax,%ecx
    8355:	05 60 00 5d 13       	add    $0x135d0060,%eax
    835a:	a0 00 12 17 20       	mov    0x20171200,%al
    835f:	1f                   	pop    %ds
    8360:	0c 20                	or     $0x20,%al
    8362:	60                   	pusha
    8363:	1f                   	pop    %ds
    8364:	ef                   	out    %eax,(%dx)
    8365:	2c 20                	sub    $0x20,%al
    8367:	2b 2a                	sub    (%edx),%ebp
    8369:	30 a0 2b 6f a6 60    	xor    %ah,0x60a66f2b(%eax)
    836f:	2c 02                	sub    $0x2,%al
    8371:	a8 e0                	test   $0xe0,%al
    8373:	2c 1e                	sub    $0x1e,%al
    8375:	fb                   	sti
    8376:	e0 2d                	loopne 83a5 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x59>
    8378:	00 fe                	add    %bh,%dh
    837a:	20 36                	and    %dh,(%esi)
    837c:	9e                   	sahf
    837d:	ff 60 36             	jmp    *0x36(%eax)
    8380:	fd                   	std
    8381:	01 e1                	add    %esp,%ecx
    8383:	36 01 0a             	add    %ecx,%ss:(%edx)
    8386:	21 37                	and    %esi,(%edi)
    8388:	24 0d                	and    $0xd,%al
    838a:	e1 37                	loope  83c3 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x77>
    838c:	ab                   	stos   %eax,%es:(%edi)
    838d:	0e                   	push   %cs
    838e:	61                   	popa
    838f:	39 2f                	cmp    %ebp,(%edi)
    8391:	18 e1                	sbb    %ah,%cl
    8393:	39 30                	cmp    %esi,(%eax)
    8395:	1c e1                	sbb    $0xe1,%al
    8397:	4a                   	dec    %edx
    8398:	f3 1e                	repz push %ds
    839a:	e1 4e                	loope  83ea <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x9e>
    839c:	40                   	inc    %eax
    839d:	34 a1                	xor    $0xa1,%al
    839f:	52                   	push   %edx
    83a0:	1e                   	push   %ds
    83a1:	61                   	popa
    83a2:	e1 53                	loope  83f7 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xab>
    83a4:	f0 6a 61             	lock push $0x61
    83a7:	54                   	push   %esp
    83a8:	4f                   	dec    %edi
    83a9:	6f                   	outsl  %ds:(%esi),(%dx)
    83aa:	e1 54                	loope  8400 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xb4>
    83ac:	9d                   	popf
    83ad:	bc 61 55 00 cf       	mov    $0xcf005561,%esp
    83b2:	61                   	popa
    83b3:	56                   	push   %esi
    83b4:	65 d1 a1 56 00 da 21 	shll   $1,%gs:0x21da0056(%ecx)
    83bb:	57                   	push   %edi
    83bc:	00 e0                	add    %ah,%al
    83be:	a1 58 ae e2 21       	mov    0x21e2ae58,%eax
    83c3:	5a                   	pop    %edx
    83c4:	ec                   	in     (%dx),%al
    83c5:	e4 e1                	in     $0xe1,%al
    83c7:	5b                   	pop    %ebx
    83c8:	d0 e8                	shr    $1,%al
    83ca:	61                   	popa
    83cb:	5c                   	pop    %esp
    83cc:	20 00                	and    %al,(%eax)
    83ce:	ee                   	out    %al,(%dx)
    83cf:	5c                   	pop    %esp
    83d0:	f0 01 7f 5d          	lock add %edi,0x5d(%edi)
    83d4:	2f                   	das
    83d5:	68 6f 6d 65 2f       	push   $0x2f656d6f
    83da:	50                   	push   %eax
    83db:	61                   	popa
    83dc:	76 61                	jbe    843f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xf3>
    83de:	6c                   	insb   (%dx),%es:(%edi)
    83df:	2f                   	das
    83e0:	54                   	push   %esp
    83e1:	72 69                	jb     844c <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x100>
    83e3:	67 67 65 72 73       	addr16 addr16 gs jb 845b <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x10f>
    83e8:	2f                   	das
    83e9:	52                   	push   %edx
    83ea:	75 73                	jne    845f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x113>
    83ec:	74 2f                	je     841d <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xd1>
    83ee:	45                   	inc    %ebp
    83ef:	6d                   	insl   (%dx),%es:(%edi)
    83f0:	62 65 64             	bound  %esp,0x64(%ebp)
    83f3:	64 65 64 2f          	fs gs fs das
    83f7:	70 65                	jo     845e <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x112>
    83f9:	74 5f                	je     845a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x10e>
    83fb:	6f                   	outsl  %ds:(%esi),(%dx)
    83fc:	73 2f                	jae    842d <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xe1>
    83fe:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8402:	65 6c                	gs insb (%dx),%es:(%edi)
    8404:	5f                   	pop    %edi
    8405:	74 79                	je     8480 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x134>
    8407:	70 65                	jo     846e <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x122>
    8409:	73 2f                	jae    843a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xee>
    840b:	73 72                	jae    847f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x133>
    840d:	63 2f                	arpl   %ebp,(%edi)
    840f:	6f                   	outsl  %ds:(%esi),(%dx)
    8410:	62 6a 65             	bound  %ebp,0x65(%edx)
    8413:	63 74 2f 71          	arpl   %esi,0x71(%edi,%ebp,1)
    8417:	75 65                	jne    847e <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x132>
    8419:	75 65                	jne    8480 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x134>
    841b:	2e 72 73             	jb,pn  8491 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x145>
    841e:	46                   	inc    %esi
    841f:	61                   	popa
    8420:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    8427:	20 
    8428:	61                   	popa
    8429:	63 63 65             	arpl   %esp,0x65(%ebx)
    842c:	73 73                	jae    84a1 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x155>
    842e:	20 71 75             	and    %dh,0x75(%ecx)
    8431:	65 75 65             	gs jne 8499 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x14d>
    8434:	20 64 61 74          	and    %ah,0x74(%ecx,%eiz,2)
    8438:	61                   	popa
    8439:	3a 20                	cmp    (%eax),%ah
    843b:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    843f:	65 6c                	gs insb (%dx),%es:(%edi)
    8441:	5f                   	pop    %edi
    8442:	74 79                	je     84bd <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x171>
    8444:	70 65                	jo     84ab <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x15f>
    8446:	73 3a                	jae    8482 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x136>
    8448:	3a 6f 62             	cmp    0x62(%edi),%ch
    844b:	6a 65                	push   $0x65
    844d:	63 74 3a 3a          	arpl   %esi,0x3a(%edx,%edi,1)
    8451:	71 75                	jno    84c8 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x17c>
    8453:	65 75 65             	gs jne 84bb <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x16f>
    8456:	28 29                	sub    %ch,(%ecx)
    8458:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    845b:	6c                   	insb   (%dx),%es:(%edi)
    845c:	65 64 20 60 52       	gs and %ah,%fs:0x52(%eax)
    8461:	65 73 75             	gs jae 84d9 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x18d>
    8464:	6c                   	insb   (%dx),%es:(%edi)
    8465:	74 3a                	je     84a1 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x155>
    8467:	3a 75 6e             	cmp    0x6e(%ebp),%dh
    846a:	77 72                	ja     84de <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x192>
    846c:	61                   	popa
    846d:	70 28                	jo     8497 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x14b>
    846f:	29 60 20             	sub    %esp,0x20(%eax)
    8472:	6f                   	outsl  %ds:(%esi),(%dx)
    8473:	6e                   	outsb  %ds:(%esi),(%dx)
    8474:	20 61 6e             	and    %ah,0x6e(%ecx)
    8477:	20 60 45             	and    %ah,0x45(%eax)
    847a:	72 72                	jb     84ee <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1a2>
    847c:	60                   	pusha
    847d:	20 76 61             	and    %dh,0x61(%esi)
    8480:	6c                   	insb   (%dx),%es:(%edi)
    8481:	75 65                	jne    84e8 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x19c>
    8483:	4f                   	dec    %edi
    8484:	6b 45 72 72          	imul   $0x72,0x72(%ebp),%eax
    8488:	52                   	push   %edx
    8489:	61                   	popa
    848a:	77 48                	ja     84d4 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x188>
    848c:	61                   	popa
    848d:	6e                   	outsb  %ds:(%esi),(%dx)
    848e:	64 6c                	fs insb (%dx),%es:(%edi)
    8490:	65 6e                	outsb  %gs:(%esi),(%dx)
    8492:	6f                   	outsl  %ds:(%esi),(%dx)
    8493:	74 20                	je     84b5 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x169>
    8495:	79 65                	jns    84fc <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1b0>
    8497:	74 20                	je     84b9 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x16d>
    8499:	69 6d 70 6c 65 6d 65 	imul   $0x656d656c,0x70(%ebp),%ebp
    84a0:	6e                   	outsb  %ds:(%esi),(%dx)
    84a1:	74 65                	je     8508 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1bc>
    84a3:	64 2f                	fs das
    84a5:	68 6f 6d 65 2f       	push   $0x2f656d6f
    84aa:	50                   	push   %eax
    84ab:	61                   	popa
    84ac:	76 61                	jbe    850f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1c3>
    84ae:	6c                   	insb   (%dx),%es:(%edi)
    84af:	2f                   	das
    84b0:	54                   	push   %esp
    84b1:	72 69                	jb     851c <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1d0>
    84b3:	67 67 65 72 73       	addr16 addr16 gs jb 852b <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1df>
    84b8:	2f                   	das
    84b9:	52                   	push   %edx
    84ba:	75 73                	jne    852f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1e3>
    84bc:	74 2f                	je     84ed <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1a1>
    84be:	45                   	inc    %ebp
    84bf:	6d                   	insl   (%dx),%es:(%edi)
    84c0:	62 65 64             	bound  %esp,0x64(%ebp)
    84c3:	64 65 64 2f          	fs gs fs das
    84c7:	70 65                	jo     852e <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1e2>
    84c9:	74 5f                	je     852a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1de>
    84cb:	6f                   	outsl  %ds:(%esi),(%dx)
    84cc:	73 2f                	jae    84fd <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1b1>
    84ce:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    84d2:	65 6c                	gs insb (%dx),%es:(%edi)
    84d4:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    84d9:	73 72                	jae    854d <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x201>
    84db:	63 2f                	arpl   %ebp,(%edi)
    84dd:	66 73 2f             	data16 jae 850f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1c3>
    84e0:	6d                   	insl   (%dx),%es:(%edi)
    84e1:	6f                   	outsl  %ds:(%esi),(%dx)
    84e2:	64 2e 72 73          	fs jb,pn 8559 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x20d>
    84e6:	49                   	dec    %ecx
    84e7:	72 71                	jb     855a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x20e>
    84e9:	20 51 75             	and    %dl,0x75(%ecx)
    84ec:	65 75 65             	gs jne 8554 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x208>
    84ef:	20 48 61             	and    %cl,0x61(%eax)
    84f2:	6e                   	outsb  %ds:(%esi),(%dx)
    84f3:	64 6c                	fs insb (%dx),%es:(%edi)
    84f5:	65 3a 20             	cmp    %gs:(%eax),%ah
    84f8:	02 00                	add    (%eax),%al
    84fa:	00 00                	add    %al,(%eax)
    84fc:	00 00                	add    %al,(%eax)
    84fe:	00 00                	add    %al,(%eax)
    8500:	02 00                	add    (%eax),%al
	...
    850a:	00 00                	add    %al,(%eax)
    850c:	20 00                	and    %al,(%eax)
    850e:	00 e4                	add    %ah,%ah
    8510:	2f                   	das
    8511:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8516:	50                   	push   %eax
    8517:	61                   	popa
    8518:	76 61                	jbe    857b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b>
    851a:	6c                   	insb   (%dx),%es:(%edi)
    851b:	2f                   	das
    851c:	54                   	push   %esp
    851d:	72 69                	jb     8588 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x28>
    851f:	67 67 65 72 73       	addr16 addr16 gs jb 8597 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x37>
    8524:	2f                   	das
    8525:	52                   	push   %edx
    8526:	75 73                	jne    859b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b>
    8528:	74 2f                	je     8559 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x20d>
    852a:	45                   	inc    %ebp
    852b:	6d                   	insl   (%dx),%es:(%edi)
    852c:	62 65 64             	bound  %esp,0x64(%ebp)
    852f:	64 65 64 2f          	fs gs fs das
    8533:	70 65                	jo     859a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a>
    8535:	74 5f                	je     8596 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x36>
    8537:	6f                   	outsl  %ds:(%esi),(%dx)
    8538:	73 2f                	jae    8569 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x9>
    853a:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    853e:	65 6c                	gs insb (%dx),%es:(%edi)
    8540:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8545:	73 72                	jae    85b9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x59>
    8547:	63 2f                	arpl   %ebp,(%edi)
    8549:	69 6f 2f 6d 6f 64 2e 	imul   $0x2e646f6d,0x2f(%edi),%ebp
    8550:	72 73                	jb     85c5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x65>
    8552:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8556:	65 6c                	gs insb (%dx),%es:(%edi)
    8558:	5f                   	pop    %edi
    8559:	6c                   	insb   (%dx),%es:(%edi)
    855a:	69 62 3a 3a 69 6f  	imul   $0x6f693a,0x3a(%edx),%esp

00008560 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE>:
	...
    8664:	5b                   	pop    %ebx
    8665:	5d                   	pop    %ebp
    8666:	5b                   	pop    %ebx
    8667:	5d                   	pop    %ebp
    8668:	20 0a                	and    %cl,(%edx)
    866a:	2f                   	das
    866b:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8670:	50                   	push   %eax
    8671:	61                   	popa
    8672:	76 61                	jbe    86d5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x175>
    8674:	6c                   	insb   (%dx),%es:(%edi)
    8675:	2f                   	das
    8676:	54                   	push   %esp
    8677:	72 69                	jb     86e2 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x182>
    8679:	67 67 65 72 73       	addr16 addr16 gs jb 86f1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x191>
    867e:	2f                   	das
    867f:	52                   	push   %edx
    8680:	75 73                	jne    86f5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x195>
    8682:	74 2f                	je     86b3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x153>
    8684:	45                   	inc    %ebp
    8685:	6d                   	insl   (%dx),%es:(%edi)
    8686:	62 65 64             	bound  %esp,0x64(%ebp)
    8689:	64 65 64 2f          	fs gs fs das
    868d:	70 65                	jo     86f4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x194>
    868f:	74 5f                	je     86f0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x190>
    8691:	6f                   	outsl  %ds:(%esi),(%dx)
    8692:	73 2f                	jae    86c3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x163>
    8694:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8698:	65 6c                	gs insb (%dx),%es:(%edi)
    869a:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    869f:	73 72                	jae    8713 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b3>
    86a1:	63 2f                	arpl   %ebp,(%edi)
    86a3:	6f                   	outsl  %ds:(%esi),(%dx)
    86a4:	62 6a 65             	bound  %ebp,0x65(%edx)
    86a7:	63 74 2f 65          	arpl   %esi,0x65(%edi,%ebp,1)
    86ab:	76 65                	jbe    8712 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b2>
    86ad:	6e                   	outsb  %ds:(%esi),(%dx)
    86ae:	74 2e                	je     86de <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x17e>
    86b0:	72 73                	jb     8725 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1c5>
    86b2:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    86b6:	65 6c                	gs insb (%dx),%es:(%edi)
    86b8:	5f                   	pop    %edi
    86b9:	6c                   	insb   (%dx),%es:(%edi)
    86ba:	69 62 3a 3a 6f 62 6a 	imul   $0x6a626f3a,0x3a(%edx),%esp
    86c1:	65 63 74 3a 3a       	arpl   %esi,%gs:0x3a(%edx,%edi,1)
    86c6:	65 76 65             	gs jbe 872e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1ce>
    86c9:	6e                   	outsb  %ds:(%esi),(%dx)
    86ca:	74 2f                	je     86fb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x19b>
    86cc:	68 6f 6d 65 2f       	push   $0x2f656d6f
    86d1:	50                   	push   %eax
    86d2:	61                   	popa
    86d3:	76 61                	jbe    8736 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1d6>
    86d5:	6c                   	insb   (%dx),%es:(%edi)
    86d6:	2f                   	das
    86d7:	54                   	push   %esp
    86d8:	72 69                	jb     8743 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1e3>
    86da:	67 67 65 72 73       	addr16 addr16 gs jb 8752 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f2>
    86df:	2f                   	das
    86e0:	52                   	push   %edx
    86e1:	75 73                	jne    8756 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f6>
    86e3:	74 2f                	je     8714 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b4>
    86e5:	45                   	inc    %ebp
    86e6:	6d                   	insl   (%dx),%es:(%edi)
    86e7:	62 65 64             	bound  %esp,0x64(%ebp)
    86ea:	64 65 64 2f          	fs gs fs das
    86ee:	70 65                	jo     8755 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f5>
    86f0:	74 5f                	je     8751 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f1>
    86f2:	6f                   	outsl  %ds:(%esi),(%dx)
    86f3:	73 2f                	jae    8724 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1c4>
    86f5:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    86f9:	65 6c                	gs insb (%dx),%es:(%edi)
    86fb:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8700:	73 72                	jae    8774 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x214>
    8702:	63 2f                	arpl   %ebp,(%edi)
    8704:	6f                   	outsl  %ds:(%esi),(%dx)
    8705:	62 6a 65             	bound  %ebp,0x65(%edx)
    8708:	63 74 2f 6b          	arpl   %esi,0x6b(%edi,%ebp,1)
    870c:	65 72 6e             	gs jb  877d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x21d>
    870f:	65 6c                	gs insb (%dx),%es:(%edi)
    8711:	5f                   	pop    %edi
    8712:	62 75 66             	bound  %esi,0x66(%ebp)
    8715:	2f                   	das
    8716:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    871a:	65 6c                	gs insb (%dx),%es:(%edi)
    871c:	2e 72 73             	jb,pn  8792 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x232>
    871f:	2f                   	das
    8720:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8725:	50                   	push   %eax
    8726:	61                   	popa
    8727:	76 61                	jbe    878a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x22a>
    8729:	6c                   	insb   (%dx),%es:(%edi)
    872a:	2f                   	das
    872b:	54                   	push   %esp
    872c:	72 69                	jb     8797 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x237>
    872e:	67 67 65 72 73       	addr16 addr16 gs jb 87a6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x246>
    8733:	2f                   	das
    8734:	52                   	push   %edx
    8735:	75 73                	jne    87aa <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x24a>
    8737:	74 2f                	je     8768 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x208>
    8739:	45                   	inc    %ebp
    873a:	6d                   	insl   (%dx),%es:(%edi)
    873b:	62 65 64             	bound  %esp,0x64(%ebp)
    873e:	64 65 64 2f          	fs gs fs das
    8742:	70 65                	jo     87a9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x249>
    8744:	74 5f                	je     87a5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x245>
    8746:	6f                   	outsl  %ds:(%esi),(%dx)
    8747:	73 2f                	jae    8778 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x218>
    8749:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    874d:	65 6c                	gs insb (%dx),%es:(%edi)
    874f:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8754:	73 72                	jae    87c8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x268>
    8756:	63 2f                	arpl   %ebp,(%edi)
    8758:	6f                   	outsl  %ds:(%esi),(%dx)
    8759:	62 6a 65             	bound  %ebp,0x65(%edx)
    875c:	63 74 2f 6b          	arpl   %esi,0x6b(%edi,%ebp,1)
    8760:	65 72 6e             	gs jb  87d1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x271>
    8763:	65 6c                	gs insb (%dx),%es:(%edi)
    8765:	5f                   	pop    %edi
    8766:	62 75 66             	bound  %esi,0x66(%ebp)
    8769:	2f                   	das
    876a:	75 73                	jne    87df <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x27f>
    876c:	65 72 2e             	gs jb  879d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x23d>
    876f:	72 73                	jb     87e4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x284>
    8771:	54                   	push   %esp
    8772:	65 72 6d             	gs jb  87e2 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x282>
    8775:	69 6e 61 74 69 6e 67 	imul   $0x676e6974,0x61(%esi),%ebp
    877c:	20 77 69             	and    %dh,0x69(%edi)
    877f:	74 68                	je     87e9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x289>
    8781:	20 63 6f             	and    %ah,0x6f(%ebx)
    8784:	64 65 3a 20          	fs cmp %gs:(%eax),%ah
    8788:	2f                   	das
    8789:	68 6f 6d 65 2f       	push   $0x2f656d6f
    878e:	50                   	push   %eax
    878f:	61                   	popa
    8790:	76 61                	jbe    87f3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x293>
    8792:	6c                   	insb   (%dx),%es:(%edi)
    8793:	2f                   	das
    8794:	54                   	push   %esp
    8795:	72 69                	jb     8800 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2a0>
    8797:	67 67 65 72 73       	addr16 addr16 gs jb 880f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2af>
    879c:	2f                   	das
    879d:	52                   	push   %edx
    879e:	75 73                	jne    8813 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2b3>
    87a0:	74 2f                	je     87d1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x271>
    87a2:	45                   	inc    %ebp
    87a3:	6d                   	insl   (%dx),%es:(%edi)
    87a4:	62 65 64             	bound  %esp,0x64(%ebp)
    87a7:	64 65 64 2f          	fs gs fs das
    87ab:	70 65                	jo     8812 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2b2>
    87ad:	74 5f                	je     880e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2ae>
    87af:	6f                   	outsl  %ds:(%esi),(%dx)
    87b0:	73 2f                	jae    87e1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x281>
    87b2:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    87b6:	65 6c                	gs insb (%dx),%es:(%edi)
    87b8:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    87bd:	73 72                	jae    8831 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2d1>
    87bf:	63 2f                	arpl   %ebp,(%edi)
    87c1:	70 72                	jo     8835 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2d5>
    87c3:	6f                   	outsl  %ds:(%esi),(%dx)
    87c4:	63 65 73             	arpl   %esp,0x73(%ebp)
    87c7:	73 2f                	jae    87f8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x298>
    87c9:	6d                   	insl   (%dx),%es:(%edi)
    87ca:	6f                   	outsl  %ds:(%esi),(%dx)
    87cb:	64 2e 72 73          	fs jb,pn 8842 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2e2>
    87cf:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    87d3:	65 6c                	gs insb (%dx),%es:(%edi)
    87d5:	5f                   	pop    %edi
    87d6:	6c                   	insb   (%dx),%es:(%edi)
    87d7:	69 62 3a 3a 70 72 6f 	imul   $0x6f72703a,0x3a(%edx),%esp
    87de:	63 65 73             	arpl   %esp,0x73(%ebp)
    87e1:	73 46                	jae    8829 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2c9>
    87e3:	61                   	popa
    87e4:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    87eb:	20 
    87ec:	61                   	popa
    87ed:	63 63 65             	arpl   %esp,0x65(%ebx)
    87f0:	73 73                	jae    8865 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x305>
    87f2:	20 6d 6f             	and    %ch,0x6f(%ebp)
    87f5:	64 75 6c             	fs jne 8864 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x304>
    87f8:	65 20 69 6e          	and    %ch,%gs:0x6e(%ecx)
    87fc:	66 6f                	outsw  %ds:(%esi),(%dx)
    87fe:	3a 20                	cmp    (%eax),%ah
    8800:	2f                   	das
    8801:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8806:	50                   	push   %eax
    8807:	61                   	popa
    8808:	76 61                	jbe    886b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x30b>
    880a:	6c                   	insb   (%dx),%es:(%edi)
    880b:	2f                   	das
    880c:	54                   	push   %esp
    880d:	72 69                	jb     8878 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x318>
    880f:	67 67 65 72 73       	addr16 addr16 gs jb 8887 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x327>
    8814:	2f                   	das
    8815:	52                   	push   %edx
    8816:	75 73                	jne    888b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x32b>
    8818:	74 2f                	je     8849 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2e9>
    881a:	45                   	inc    %ebp
    881b:	6d                   	insl   (%dx),%es:(%edi)
    881c:	62 65 64             	bound  %esp,0x64(%ebp)
    881f:	64 65 64 2f          	fs gs fs das
    8823:	70 65                	jo     888a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x32a>
    8825:	74 5f                	je     8886 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x326>
    8827:	6f                   	outsl  %ds:(%esi),(%dx)
    8828:	73 2f                	jae    8859 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2f9>
    882a:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    882e:	65 6c                	gs insb (%dx),%es:(%edi)
    8830:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8835:	73 72                	jae    88a9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x349>
    8837:	63 2f                	arpl   %ebp,(%edi)
    8839:	72 74                	jb     88af <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x34f>
    883b:	2f                   	das
    883c:	6d                   	insl   (%dx),%es:(%edi)
    883d:	6f                   	outsl  %ds:(%esi),(%dx)
    883e:	64 2e 72 73          	fs jb,pn 88b5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x355>
    8842:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8846:	65 6c                	gs insb (%dx),%es:(%edi)
    8848:	5f                   	pop    %edi
    8849:	6c                   	insb   (%dx),%es:(%edi)
    884a:	69 62 3a 3a 72 74 48 	imul   $0x4874723a,0x3a(%edx),%esp
    8851:	61                   	popa
    8852:	6e                   	outsb  %ds:(%esi),(%dx)
    8853:	64 6c                	fs insb (%dx),%es:(%edi)
    8855:	69 6e 67 20 63 68 61 	imul   $0x61686320,0x67(%esi),%ebp
    885c:	72 20                	jb     887e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x31e>
    885e:	6d                   	insl   (%dx),%es:(%edi)
    885f:	6f                   	outsl  %ds:(%esi),(%dx)
    8860:	64 75 6c             	fs jne 88cf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x36f>
    8863:	65 4b                	gs dec %ebx
    8865:	65 72 6e             	gs jb  88d6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x376>
    8868:	65 6c                	gs insb (%dx),%es:(%edi)
    886a:	20 62 75             	and    %ah,0x75(%edx)
    886d:	66 3a 20             	data16 cmp (%eax),%ah
    8870:	76 67                	jbe    88d9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x379>
    8872:	61                   	popa
    8873:	20 77 72             	and    %dh,0x72(%edi)
    8876:	69 74 65 3a 20 50 61 	imul   $0x6e615020,0x3a(%ebp,%eiz,2),%esi
    887d:	6e 
    887e:	69 63 20 69 73 20 64 	imul   $0x64207369,0x20(%ebx),%esp
    8885:	65 74 65             	gs je  88ed <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x38d>
    8888:	63 74 65 64          	arpl   %esi,0x64(%ebp,%eiz,2)
    888c:	3a 20                	cmp    (%eax),%ah
    888e:	2f                   	das
    888f:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8894:	50                   	push   %eax
    8895:	61                   	popa
    8896:	76 61                	jbe    88f9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x399>
    8898:	6c                   	insb   (%dx),%es:(%edi)
    8899:	2f                   	das
    889a:	54                   	push   %esp
    889b:	72 69                	jb     8906 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a6>
    889d:	67 67 65 72 73       	addr16 addr16 gs jb 8915 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b5>
    88a2:	2f                   	das
    88a3:	52                   	push   %edx
    88a4:	75 73                	jne    8919 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b9>
    88a6:	74 2f                	je     88d7 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x377>
    88a8:	45                   	inc    %ebp
    88a9:	6d                   	insl   (%dx),%es:(%edi)
    88aa:	62 65 64             	bound  %esp,0x64(%ebp)
    88ad:	64 65 64 2f          	fs gs fs das
    88b1:	70 65                	jo     8918 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b8>
    88b3:	74 5f                	je     8914 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b4>
    88b5:	6f                   	outsl  %ds:(%esi),(%dx)
    88b6:	73 2f                	jae    88e7 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x387>
    88b8:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    88bc:	65 6c                	gs insb (%dx),%es:(%edi)
    88be:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    88c3:	73 72                	jae    8937 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3d7>
    88c5:	63 2f                	arpl   %ebp,(%edi)
    88c7:	6c                   	insb   (%dx),%es:(%edi)
    88c8:	69 62 2e 72 73 6b 65 	imul   $0x656b7372,0x2e(%edx),%esp
    88cf:	72 6e                	jb     893f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3df>
    88d1:	65 6c                	gs insb (%dx),%es:(%edi)
    88d3:	5f                   	pop    %edi
    88d4:	6c                   	insb   (%dx),%es:(%edi)
    88d5:	69 62 4e 6f 74 20 73 	imul   $0x7320746f,0x4e(%edx),%esp
    88dc:	75 70                	jne    894e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3ee>
    88de:	70 6f                	jo     894f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3ef>
    88e0:	72 74                	jb     8956 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3f6>
    88e2:	65 64 4e             	gs fs dec %esi
    88e5:	6f                   	outsl  %ds:(%esi),(%dx)
    88e6:	74 20                	je     8908 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a8>
    88e8:	53                   	push   %ebx
    88e9:	75 70                	jne    895b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3fb>
    88eb:	70 6f                	jo     895c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3fc>
    88ed:	72 74                	jb     8963 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x403>
    88ef:	65 64 20 4f 70       	gs and %cl,%fs:0x70(%edi)
    88f4:	65 72 61             	gs jb  8958 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3f8>
    88f7:	74 69                	je     8962 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x402>
    88f9:	6f                   	outsl  %ds:(%esi),(%dx)
    88fa:	6e                   	outsb  %ds:(%esi),(%dx)
    88fb:	53                   	push   %ebx
    88fc:	79 73                	jns    8971 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x411>
    88fe:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    8901:	6c                   	insb   (%dx),%es:(%edi)
    8902:	20 69 73             	and    %ch,0x73(%ecx)
    8905:	20 66 61             	and    %ah,0x61(%esi)
    8908:	69 6c 65 64 3a 20 4b 	imul   $0x654b203a,0x64(%ebp,%eiz,2),%ebp
    890f:	65 
    8910:	72 6e                	jb     8980 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x420>
    8912:	65 6c                	gs insb (%dx),%es:(%edi)
    8914:	42                   	inc    %edx
    8915:	75 66                	jne    897d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x41d>
    8917:	6c                   	insb   (%dx),%es:(%edi)
    8918:	65 6e                	outsb  %gs:(%esi),(%dx)
    891a:	68 61 6e 64 6c       	push   $0x6c646e61
    891f:	65 49                	gs dec %ecx
    8921:	6f                   	outsl  %ds:(%esi),(%dx)
    8922:	20 4f 70             	and    %cl,0x70(%edi)
    8925:	20 66 61             	and    %ah,0x61(%esi)
    8928:	69 6c 65 64 3a 20 46 	imul   $0x7346203a,0x64(%ebp,%eiz,2),%ebp
    892f:	73 
    8930:	20 4f 70             	and    %cl,0x70(%edi)
    8933:	20 66 61             	and    %ah,0x61(%esi)
    8936:	69 6c 65 64 3a 20 53 	imul   $0x7953203a,0x64(%ebp,%eiz,2),%ebp
    893d:	79 
    893e:	73 43                	jae    8983 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x423>
    8940:	61                   	popa
    8941:	6c                   	insb   (%dx),%es:(%edi)
    8942:	6c                   	insb   (%dx),%es:(%edi)
    8943:	20 69 73             	and    %ch,0x73(%ecx)
    8946:	20 66 61             	and    %ah,0x61(%esi)
    8949:	69 6c 65 64 46 61 69 	imul   $0x6c696146,0x64(%ebp,%eiz,2),%ebp
    8950:	6c 
    8951:	65 64 20 74 6f 20    	gs and %dh,%fs:0x20(%edi,%ebp,2)
    8957:	70 65                	jo     89be <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x45e>
    8959:	72 66                	jb     89c1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x461>
    895b:	6f                   	outsl  %ds:(%esi),(%dx)
    895c:	72 6d                	jb     89cb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x46b>
    895e:	20 6d 65             	and    %ch,0x65(%ebp)
    8961:	6d                   	insl   (%dx),%es:(%edi)
    8962:	6f                   	outsl  %ds:(%esi),(%dx)
    8963:	72 79                	jb     89de <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x47e>
    8965:	20 61 6c             	and    %ah,0x6c(%ecx)
    8968:	6c                   	insb   (%dx),%es:(%edi)
    8969:	6f                   	outsl  %ds:(%esi),(%dx)
    896a:	63 61 74             	arpl   %esp,0x74(%ecx)
    896d:	69 6f 6e 3a 20 2f 68 	imul   $0x682f203a,0x6e(%edi),%ebp
    8974:	6f                   	outsl  %ds:(%esi),(%dx)
    8975:	6d                   	insl   (%dx),%es:(%edi)
    8976:	65 2f                	gs das
    8978:	50                   	push   %eax
    8979:	61                   	popa
    897a:	76 61                	jbe    89dd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x47d>
    897c:	6c                   	insb   (%dx),%es:(%edi)
    897d:	2f                   	das
    897e:	54                   	push   %esp
    897f:	72 69                	jb     89ea <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x48a>
    8981:	67 67 65 72 73       	addr16 addr16 gs jb 89f9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x499>
    8986:	2f                   	das
    8987:	52                   	push   %edx
    8988:	75 73                	jne    89fd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x49d>
    898a:	74 2f                	je     89bb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x45b>
    898c:	45                   	inc    %ebp
    898d:	6d                   	insl   (%dx),%es:(%edi)
    898e:	62 65 64             	bound  %esp,0x64(%ebp)
    8991:	64 65 64 2f          	fs gs fs das
    8995:	70 65                	jo     89fc <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x49c>
    8997:	74 5f                	je     89f8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x498>
    8999:	6f                   	outsl  %ds:(%esi),(%dx)
    899a:	73 2f                	jae    89cb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x46b>
    899c:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    89a0:	65 6c                	gs insb (%dx),%es:(%edi)
    89a2:	5f                   	pop    %edi
    89a3:	74 79                	je     8a1e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4be>
    89a5:	70 65                	jo     8a0c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4ac>
    89a7:	73 2f                	jae    89d8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x478>
    89a9:	73 72                	jae    8a1d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4bd>
    89ab:	63 2f                	arpl   %ebp,(%edi)
    89ad:	6f                   	outsl  %ds:(%esi),(%dx)
    89ae:	62 6a 65             	bound  %ebp,0x65(%edx)
    89b1:	63 74 2f 68          	arpl   %esi,0x68(%edi,%ebp,1)
    89b5:	61                   	popa
    89b6:	6e                   	outsb  %ds:(%esi),(%dx)
    89b7:	64 6c                	fs insb (%dx),%es:(%edi)
    89b9:	65 2e 72 73          	gs jb,pn 8a30 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4d0>
    89bd:	53                   	push   %ebx
    89be:	79 73                	jns    8a33 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4d3>
    89c0:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    89c3:	6c                   	insb   (%dx),%es:(%edi)
    89c4:	20 74 6f 20          	and    %dh,0x20(%edi,%ebp,2)
    89c8:	72 65                	jb     8a2f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4cf>
    89ca:	6c                   	insb   (%dx),%es:(%edi)
    89cb:	65 61                	gs popa
    89cd:	73 65                	jae    8a34 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4d4>
    89cf:	20 68 61             	and    %ch,0x61(%eax)
    89d2:	6e                   	outsb  %ds:(%esi),(%dx)
    89d3:	64 6c                	fs insb (%dx),%es:(%edi)
    89d5:	65 3a 20             	cmp    %gs:(%eax),%ah
    89d8:	30 78 6b             	xor    %bh,0x6b(%eax)
    89db:	65 72 6e             	gs jb  8a4c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4ec>
    89de:	65 6c                	gs insb (%dx),%es:(%edi)
    89e0:	5f                   	pop    %edi
    89e1:	74 79                	je     8a5c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4fc>
    89e3:	70 65                	jo     8a4a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4ea>
    89e5:	73 3a                	jae    8a21 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4c1>
    89e7:	3a 6f 62             	cmp    0x62(%edi),%ch
    89ea:	6a 65                	push   $0x65
    89ec:	63 74 3a 3a          	arpl   %esi,0x3a(%edx,%edi,1)
    89f0:	68 61 6e 64 6c       	push   $0x6c646e61
    89f5:	65 46                	gs inc %esi
    89f7:	61                   	popa
    89f8:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    89ff:	20 
    8a00:	72 65                	jb     8a67 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x507>
    8a02:	6c                   	insb   (%dx),%es:(%edi)
    8a03:	65 61                	gs popa
    8a05:	73 65                	jae    8a6c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x50c>
    8a07:	20 6b 65             	and    %ch,0x65(%ebx)
    8a0a:	72 6e                	jb     8a7a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x51a>
    8a0c:	65 6c                	gs insb (%dx),%es:(%edi)
    8a0e:	20 6f 62             	and    %ch,0x62(%edi)
    8a11:	6a 65                	push   $0x65
    8a13:	63 74 3a 20          	arpl   %esi,0x20(%edx,%edi,1)
    8a17:	4e                   	dec    %esi
    8a18:	6f                   	outsl  %ds:(%esi),(%dx)
    8a19:	74 53                	je     8a6e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x50e>
    8a1b:	75 70                	jne    8a8d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x52d>
    8a1d:	70 6f                	jo     8a8e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x52e>
    8a1f:	72 74                	jb     8a95 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x6>
    8a21:	65 64 49             	gs fs dec %ecx
    8a24:	6e                   	outsb  %ds:(%esi),(%dx)
    8a25:	76 61                	jbe    8a88 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x528>
    8a27:	6c                   	insb   (%dx),%es:(%edi)
    8a28:	69 64 44 61 74 61 4b 	imul   $0x654b6174,0x61(%esp,%eax,2),%esp
    8a2f:	65 
    8a30:	72 6e                	jb     8aa0 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x11>
    8a32:	65 6c                	gs insb (%dx),%es:(%edi)
    8a34:	53                   	push   %ebx
    8a35:	70 61                	jo     8a98 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x9>
    8a37:	63 65 43             	arpl   %esp,0x43(%ebp)
    8a3a:	61                   	popa
    8a3b:	6c                   	insb   (%dx),%es:(%edi)
    8a3c:	6c                   	insb   (%dx),%es:(%edi)
    8a3d:	42                   	inc    %edx
    8a3e:	75 73                	jne    8ab3 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x24>
    8a40:	79 52                	jns    8a94 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x5>
    8a42:	65 73 6f             	gs jae 8ab4 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x25>
    8a45:	75 72                	jne    8ab9 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2a>
    8a47:	63 65 51             	arpl   %esp,0x51(%ebp)
    8a4a:	75 65                	jne    8ab1 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x22>
    8a4c:	75 65                	jne    8ab3 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x24>
    8a4e:	49                   	dec    %ecx
    8a4f:	73 45                	jae    8a96 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x7>
    8a51:	6d                   	insl   (%dx),%es:(%edi)
    8a52:	70 74                	jo     8ac8 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x39>
    8a54:	79 49                	jns    8a9f <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x10>
    8a56:	6e                   	outsb  %ds:(%esi),(%dx)
    8a57:	76 61                	jbe    8aba <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2b>
    8a59:	6c                   	insb   (%dx),%es:(%edi)
    8a5a:	69 64 4d 6f 64 75 6c 	imul   $0x656c7564,0x6f(%ebp,%ecx,2),%esp
    8a61:	65 
    8a62:	50                   	push   %eax
    8a63:	61                   	popa
    8a64:	72 61                	jb     8ac7 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x38>
    8a66:	6d                   	insl   (%dx),%es:(%edi)
    8a67:	73 4e                	jae    8ab7 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x28>
    8a69:	6f                   	outsl  %ds:(%esi),(%dx)
    8a6a:	53                   	push   %ebx
    8a6b:	70 61                	jo     8ace <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x3f>
    8a6d:	63 65 49             	arpl   %esp,0x49(%ebp)
    8a70:	6e                   	outsb  %ds:(%esi),(%dx)
    8a71:	42                   	inc    %edx
    8a72:	75 66                	jne    8ada <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x4b>
    8a74:	66 65 72 46          	data16 gs jb 8abe <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2f>
    8a78:	61                   	popa
    8a79:	69 6c 65 64 4f 46 46 	imul   $0x4546464f,0x64(%ebp,%eiz,2),%ebp
    8a80:	45 
    8a81:	52                   	push   %edx
    8a82:	52                   	push   %edx
    8a83:	4f                   	dec    %edi
    8a84:	52                   	push   %edx
    8a85:	44                   	inc    %esp
    8a86:	45                   	inc    %ebp
    8a87:	42                   	inc    %edx
    8a88:	55                   	push   %ebp
    8a89:	47                   	inc    %edi
    8a8a:	54                   	push   %esp
    8a8b:	52                   	push   %edx
    8a8c:	41                   	inc    %ecx
    8a8d:	43                   	inc    %ebx
    8a8e:	45                   	inc    %ebp

00008a8f <_ZN3log6logger3NOP17hbd4d50091fff3239E>:
    8a8f:	2f                   	das
    8a90:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8a95:	50                   	push   %eax
    8a96:	61                   	popa
    8a97:	76 61                	jbe    8afa <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x6b>
    8a99:	6c                   	insb   (%dx),%es:(%edi)
    8a9a:	2f                   	das
    8a9b:	2e 63 61 72          	arpl   %esp,%cs:0x72(%ecx)
    8a9f:	67 6f                	outsl  %ds:(%si),(%dx)
    8aa1:	2f                   	das
    8aa2:	72 65                	jb     8b09 <__GNU_EH_FRAME_HDR+0x5>
    8aa4:	67 69 73 74 72 79 2f 	imul   $0x732f7972,0x74(%bp,%di),%esi
    8aab:	73 
    8aac:	72 63                	jb     8b11 <__GNU_EH_FRAME_HDR+0xd>
    8aae:	2f                   	das
    8aaf:	69 6e 64 65 78 2e 63 	imul   $0x632e7865,0x64(%esi),%ebp
    8ab6:	72 61                	jb     8b19 <__GNU_EH_FRAME_HDR+0x15>
    8ab8:	74 65                	je     8b1f <__GNU_EH_FRAME_HDR+0x1b>
    8aba:	73 2e                	jae    8aea <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x5b>
    8abc:	69 6f 2d 31 39 34 39 	imul   $0x39343931,0x2d(%edi),%ebp
    8ac3:	63 66 38             	arpl   %esp,0x38(%esi)
    8ac6:	63 36                	arpl   %esi,(%esi)
    8ac8:	62 35 62 35 35 37    	bound  %esi,0x37353562
    8ace:	66 2f                	data16 das
    8ad0:	74 61                	je     8b33 <__GNU_EH_FRAME_HDR+0x2f>
    8ad2:	6c                   	insb   (%dx),%es:(%edi)
    8ad3:	63 2d 34 2e 34 2e    	arpl   %ebp,0x2e342e34
    8ad9:	32 2f                	xor    (%edi),%ch
    8adb:	73 72                	jae    8b4f <__GNU_EH_FRAME_HDR+0x4b>
    8add:	63 2f                	arpl   %ebp,(%edi)
    8adf:	74 61                	je     8b42 <__GNU_EH_FRAME_HDR+0x3e>
    8ae1:	6c                   	insb   (%dx),%es:(%edi)
    8ae2:	63 2e                	arpl   %ebp,(%esi)
    8ae4:	72 73                	jb     8b59 <__GNU_EH_FRAME_HDR+0x55>
    8ae6:	68 65 61 70 20       	push   $0x20706165
    8aeb:	63 6f 76             	arpl   %ebp,0x76(%edi)
    8aee:	65 72 73             	gs jb  8b64 <__GNU_EH_FRAME_HDR+0x60>
    8af1:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
    8af5:	20 6e 75             	and    %ch,0x75(%esi)
    8af8:	6c                   	insb   (%dx),%es:(%edi)
    8af9:	6c                   	insb   (%dx),%es:(%edi)
    8afa:	20 61 64             	and    %ah,0x64(%ecx)
    8afd:	64 72 65             	fs jb  8b65 <__GNU_EH_FRAME_HDR+0x61>
    8b00:	73 73                	jae    8b75 <__GNU_EH_FRAME_HDR+0x71>
    8b02:	21                   	.byte 0x21

Disassembly of section .eh_frame_hdr:

00008b04 <__GNU_EH_FRAME_HDR>:
    8b04:	01 1b                	add    %ebx,(%ebx)
    8b06:	ff                   	(bad)
    8b07:	ff 08                	decl   (%eax)
    8b09:	00 00                	add    %al,(%eax)
    8b0b:	00 00                	add    %al,(%eax)
    8b0d:	00 00                	add    %al,(%eax)
	...

Disassembly of section .data.rel.ro:

00009c24 <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE-0x300>:
    9c24:	00 00                	add    %al,(%eax)
    9c26:	00 00                	add    %al,(%eax)
    9c28:	04 00                	add    $0x0,%al
    9c2a:	00 00                	add    %al,(%eax)
    9c2c:	04 00                	add    $0x0,%al
    9c2e:	00 00                	add    %al,(%eax)
    9c30:	00 2b                	add    %ch,(%ebx)
    9c32:	00 00                	add    %al,(%eax)
    9c34:	00 00                	add    %al,(%eax)
    9c36:	00 00                	add    %al,(%eax)
    9c38:	04 00                	add    $0x0,%al
    9c3a:	00 00                	add    %al,(%eax)
    9c3c:	04 00                	add    $0x0,%al
    9c3e:	00 00                	add    %al,(%eax)
    9c40:	70 23                	jo     9c65 <__GNU_EH_FRAME_HDR+0x1161>
	...
    9c4a:	00 00                	add    %al,(%eax)
    9c4c:	01 00                	add    %eax,(%eax)
    9c4e:	00 00                	add    %al,(%eax)
    9c50:	50                   	push   %eax
    9c51:	2c 00                	sub    $0x0,%al
    9c53:	00 da                	add    %bl,%dl
    9c55:	76 00                	jbe    9c57 <__GNU_EH_FRAME_HDR+0x1153>
    9c57:	00 10                	add    %dl,(%eax)
    9c59:	00 00                	add    %al,(%eax)
    9c5b:	00 58 77             	add    %bl,0x77(%eax)
    9c5e:	00 00                	add    %al,(%eax)
    9c60:	03 00                	add    (%eax),%eax
    9c62:	00 00                	add    %al,(%eax)
    9c64:	3a 77 00             	cmp    0x0(%edi),%dh
    9c67:	00 12                	add    %dl,(%edx)
    9c69:	00 00                	add    %al,(%eax)
    9c6b:	00 37                	add    %dh,(%edi)
    9c6d:	00 00                	add    %al,(%eax)
    9c6f:	00 16                	add    %dl,(%esi)
    9c71:	00 00                	add    %al,(%eax)
    9c73:	00 3a                	add    %bh,(%edx)
    9c75:	77 00                	ja     9c77 <__GNU_EH_FRAME_HDR+0x1173>
    9c77:	00 12                	add    %dl,(%edx)
    9c79:	00 00                	add    %al,(%eax)
    9c7b:	00 34 00             	add    %dh,(%eax,%eax,1)
    9c7e:	00 00                	add    %al,(%eax)
    9c80:	16                   	push   %ss
    9c81:	00 00                	add    %al,(%eax)
    9c83:	00 3a                	add    %bh,(%edx)
    9c85:	77 00                	ja     9c87 <__GNU_EH_FRAME_HDR+0x1183>
    9c87:	00 12                	add    %dl,(%edx)
    9c89:	00 00                	add    %al,(%eax)
    9c8b:	00 31                	add    %dh,(%ecx)
    9c8d:	00 00                	add    %al,(%eax)
    9c8f:	00 16                	add    %dl,(%esi)
    9c91:	00 00                	add    %al,(%eax)
    9c93:	00 3a                	add    %bh,(%edx)
    9c95:	77 00                	ja     9c97 <__GNU_EH_FRAME_HDR+0x1193>
    9c97:	00 12                	add    %dl,(%edx)
    9c99:	00 00                	add    %al,(%eax)
    9c9b:	00 2b                	add    %ch,(%ebx)
    9c9d:	00 00                	add    %al,(%eax)
    9c9f:	00 14 00             	add    %dl,(%eax,%eax,1)
    9ca2:	00 00                	add    %al,(%eax)
    9ca4:	6f                   	outsl  %ds:(%esi),(%dx)
    9ca5:	77 00                	ja     9ca7 <__GNU_EH_FRAME_HDR+0x11a3>
    9ca7:	00 20                	add    %ah,(%eax)
    9ca9:	00 00                	add    %al,(%eax)
    9cab:	00 5b 77             	add    %bl,0x77(%ebx)
    9cae:	00 00                	add    %al,(%eax)
    9cb0:	14 00                	adc    $0x0,%al
    9cb2:	00 00                	add    %al,(%eax)
    9cb4:	34 00                	xor    $0x0,%al
    9cb6:	00 00                	add    %al,(%eax)
    9cb8:	09 00                	or     %eax,(%eax)
    9cba:	00 00                	add    %al,(%eax)
    9cbc:	c7                   	(bad)
    9cbd:	77 00                	ja     9cbf <__GNU_EH_FRAME_HDR+0x11bb>
    9cbf:	00 0f                	add    %cl,(%edi)
    9cc1:	00 00                	add    %al,(%eax)
    9cc3:	00 5b 77             	add    %bl,0x77(%ebx)
    9cc6:	00 00                	add    %al,(%eax)
    9cc8:	14 00                	adc    $0x0,%al
    9cca:	00 00                	add    %al,(%eax)
    9ccc:	4a                   	dec    %edx
    9ccd:	00 00                	add    %al,(%eax)
    9ccf:	00 20                	add    %ah,(%eax)
    9cd1:	00 00                	add    %al,(%eax)
    9cd3:	00 5b 77             	add    %bl,0x77(%ebx)
    9cd6:	00 00                	add    %al,(%eax)
    9cd8:	14 00                	adc    $0x0,%al
    9cda:	00 00                	add    %al,(%eax)
    9cdc:	4a                   	dec    %edx
    9cdd:	00 00                	add    %al,(%eax)
    9cdf:	00 3f                	add    %bh,(%edi)
    9ce1:	00 00                	add    %al,(%eax)
    9ce3:	00 5b 77             	add    %bl,0x77(%ebx)
    9ce6:	00 00                	add    %al,(%eax)
    9ce8:	14 00                	adc    $0x0,%al
    9cea:	00 00                	add    %al,(%eax)
    9cec:	51                   	push   %ecx
    9ced:	00 00                	add    %al,(%eax)
    9cef:	00 2e                	add    %ch,(%esi)
    9cf1:	00 00                	add    %al,(%eax)
    9cf3:	00 ee                	add    %ch,%dh
    9cf5:	77 00                	ja     9cf7 <__GNU_EH_FRAME_HDR+0x11f3>
    9cf7:	00 0a                	add    %cl,(%edx)
    9cf9:	00 00                	add    %al,(%eax)
    9cfb:	00 f8                	add    %bh,%al
    9cfd:	77 00                	ja     9cff <__GNU_EH_FRAME_HDR+0x11fb>
    9cff:	00 11                	add    %dl,(%ecx)
    9d01:	00 00                	add    %al,(%eax)
    9d03:	00 5b 77             	add    %bl,0x77(%ebx)
    9d06:	00 00                	add    %al,(%eax)
    9d08:	14 00                	adc    $0x0,%al
    9d0a:	00 00                	add    %al,(%eax)
    9d0c:	18 00                	sbb    %al,(%eax)
    9d0e:	00 00                	add    %al,(%eax)
    9d10:	01 00                	add    %eax,(%eax)
    9d12:	00 00                	add    %al,(%eax)
    9d14:	09 78 00             	or     %edi,0x0(%eax)
    9d17:	00 0d 00 00 00 16    	add    %cl,0x16000000
    9d1d:	78 00                	js     9d1f <__GNU_EH_FRAME_HDR+0x121b>
    9d1f:	00 11                	add    %dl,(%ecx)
    9d21:	00 00                	add    %al,(%eax)
    9d23:	00 94 78 00 00 15 00 	add    %dl,0x150000(%eax,%edi,2)
    9d2a:	00 00                	add    %al,(%eax)
    9d2c:	a9 78 00 00 0d       	test   $0xd000078,%eax
    9d31:	00 00                	add    %al,(%eax)
    9d33:	00 27                	add    %ah,(%edi)
    9d35:	78 00                	js     9d37 <__GNU_EH_FRAME_HDR+0x1233>
    9d37:	00 6d 00             	add    %ch,0x0(%ebp)
    9d3a:	00 00                	add    %al,(%eax)
    9d3c:	b5 01                	mov    $0x1,%ch
    9d3e:	00 00                	add    %al,(%eax)
    9d40:	0d 00 00 00 01       	or     $0x1000000,%eax
    9d45:	00 00                	add    %al,(%eax)
    9d47:	00 00                	add    %al,(%eax)
    9d49:	00 00                	add    %al,(%eax)
    9d4b:	00 a6 7b 00 00 01    	add    %ah,0x100007b(%esi)
    9d51:	00 00                	add    %al,(%eax)
    9d53:	00 a6 7b 00 00 01    	add    %ah,0x100007b(%esi)
    9d59:	00 00                	add    %al,(%eax)
    9d5b:	00 8f 77 00 00 20    	add    %cl,0x20000077(%edi)
    9d61:	00 00                	add    %al,(%eax)
    9d63:	00 e0                	add    %ah,%al
    9d65:	7b 00                	jnp    9d67 <__GNU_EH_FRAME_HDR+0x1263>
    9d67:	00 12                	add    %dl,(%edx)
    9d69:	00 00                	add    %al,(%eax)
    9d6b:	00 01                	add    %al,(%ecx)
    9d6d:	00 00                	add    %al,(%eax)
    9d6f:	00 00                	add    %al,(%eax)
    9d71:	00 00                	add    %al,(%eax)
    9d73:	00 f2                	add    %dh,%dl
    9d75:	7b 00                	jnp    9d77 <__GNU_EH_FRAME_HDR+0x1273>
    9d77:	00 02                	add    %al,(%edx)
    9d79:	00 00                	add    %al,(%eax)
    9d7b:	00 00                	add    %al,(%eax)
    9d7d:	00 00                	add    %al,(%eax)
    9d7f:	00 0c 00             	add    %cl,(%eax,%eax,1)
    9d82:	00 00                	add    %al,(%eax)
    9d84:	04 00                	add    $0x0,%al
    9d86:	00 00                	add    %al,(%eax)
    9d88:	e0 3d                	loopne 9dc7 <__GNU_EH_FRAME_HDR+0x12c3>
    9d8a:	00 00                	add    %al,(%eax)
    9d8c:	50                   	push   %eax
    9d8d:	40                   	inc    %eax
    9d8e:	00 00                	add    %al,(%eax)
    9d90:	b0 40                	mov    $0x40,%al
    9d92:	00 00                	add    %al,(%eax)
    9d94:	ce                   	into
    9d95:	7c 00                	jl     9d97 <__GNU_EH_FRAME_HDR+0x1293>
    9d97:	00 78 00             	add    %bh,0x0(%eax)
    9d9a:	00 00                	add    %al,(%eax)
    9d9c:	0a 00                	or     (%eax),%al
    9d9e:	00 00                	add    %al,(%eax)
    9da0:	2b 00                	sub    (%eax),%eax
    9da2:	00 00                	add    %al,(%eax)
    9da4:	ce                   	into
    9da5:	7c 00                	jl     9da7 <__GNU_EH_FRAME_HDR+0x12a3>
    9da7:	00 78 00             	add    %bh,0x0(%eax)
    9daa:	00 00                	add    %al,(%eax)
    9dac:	1a 00                	sbb    (%eax),%al
    9dae:	00 00                	add    %al,(%eax)
    9db0:	36 00 00             	add    %al,%ss:(%eax)
    9db3:	00 fa                	add    %bh,%dl
    9db5:	76 00                	jbe    9db7 <__GNU_EH_FRAME_HDR+0x12b3>
    9db7:	00 10                	add    %dl,(%eax)
    9db9:	00 00                	add    %al,(%eax)
    9dbb:	00 07                	add    %al,(%edi)
    9dbd:	83 00 00             	addl   $0x0,(%eax)
    9dc0:	22 00                	and    (%eax),%al
    9dc2:	00 00                	add    %al,(%eax)
    9dc4:	29 83 00 00 16 00    	sub    %eax,0x160000(%ebx)
    9dca:	00 00                	add    %al,(%eax)
    9dcc:	3f                   	aas
    9dcd:	83 00 00             	addl   $0x0,(%eax)
    9dd0:	0d 00 00 00 1e       	or     $0x1e000000,%eax
    9dd5:	84 00                	test   %al,(%eax)
    9dd7:	00 1d 00 00 00 00    	add    %bl,0x0
    9ddd:	00 00                	add    %al,(%eax)
    9ddf:	00 04 00             	add    %al,(%eax,%eax,1)
    9de2:	00 00                	add    %al,(%eax)
    9de4:	04 00                	add    $0x0,%al
    9de6:	00 00                	add    %al,(%eax)
    9de8:	70 23                	jo     9e0d <__GNU_EH_FRAME_HDR+0x1309>
    9dea:	00 00                	add    %al,(%eax)
    9dec:	b0 45                	mov    $0x45,%al
    9dee:	00 00                	add    %al,(%eax)
    9df0:	04 01                	add    $0x1,%al
    9df2:	00 00                	add    %al,(%eax)
    9df4:	04 00                	add    $0x0,%al
    9df6:	00 00                	add    %al,(%eax)
    9df8:	e0 46                	loopne 9e40 <__GNU_EH_FRAME_HDR+0x133c>
    9dfa:	00 00                	add    %al,(%eax)
    9dfc:	40                   	inc    %eax
    9dfd:	47                   	inc    %edi
    9dfe:	00 00                	add    %al,(%eax)
    9e00:	70 48                	jo     9e4a <__GNU_EH_FRAME_HDR+0x1346>
    9e02:	00 00                	add    %al,(%eax)
    9e04:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    9e05:	84 00                	test   %al,(%eax)
    9e07:	00 42 00             	add    %al,0x0(%edx)
    9e0a:	00 00                	add    %al,(%eax)
    9e0c:	6d                   	insl   (%dx),%es:(%edi)
    9e0d:	00 00                	add    %al,(%eax)
    9e0f:	00 0e                	add    %cl,(%esi)
    9e11:	00 00                	add    %al,(%eax)
    9e13:	00 e6                	add    %ah,%dh
    9e15:	84 00                	test   %al,(%eax)
    9e17:	00 12                	add    %dl,(%edx)
    9e19:	00 00                	add    %al,(%eax)
    9e1b:	00 b0 45 00 00 04    	add    %dh,0x4000045(%eax)
    9e21:	01 00                	add    %eax,(%eax)
    9e23:	00 04 00             	add    %al,(%eax,%eax,1)
    9e26:	00 00                	add    %al,(%eax)
    9e28:	c0 45 00 00          	rolb   $0x0,0x0(%ebp)
    9e2c:	d0 45 00             	rolb   $1,0x0(%ebp)
    9e2f:	00 b0 45 00 00 64    	add    %dh,0x64000045(%eax)
    9e35:	86 00                	xchg   %al,(%eax)
    9e37:	00 01                	add    %al,(%ecx)
    9e39:	00 00                	add    %al,(%eax)
    9e3b:	00 65 86             	add    %ah,-0x7a(%ebp)
    9e3e:	00 00                	add    %al,(%eax)
    9e40:	02 00                	add    (%eax),%al
    9e42:	00 00                	add    %al,(%eax)
    9e44:	67 86 00             	xchg   %al,(%bx,%si)
    9e47:	00 02                	add    %al,(%edx)
    9e49:	00 00                	add    %al,(%eax)
    9e4b:	00 69 86             	add    %ch,-0x7a(%ecx)
    9e4e:	00 00                	add    %al,(%eax)
    9e50:	01 00                	add    %eax,(%eax)
    9e52:	00 00                	add    %al,(%eax)
    9e54:	0a 77 00             	or     0x0(%edi),%dh
    9e57:	00 10                	add    %dl,(%eax)
    9e59:	00 00                	add    %al,(%eax)
    9e5b:	00 cb                	add    %cl,%bl
    9e5d:	86 00                	xchg   %al,(%eax)
    9e5f:	00 54 00 00          	add    %dl,0x0(%eax,%eax,1)
    9e63:	00 21                	add    %ah,(%ecx)
    9e65:	00 00                	add    %al,(%eax)
    9e67:	00 0e                	add    %cl,(%esi)
    9e69:	00 00                	add    %al,(%eax)
    9e6b:	00 1f                	add    %bl,(%edi)
    9e6d:	87 00                	xchg   %eax,(%eax)
    9e6f:	00 52 00             	add    %dl,0x0(%edx)
    9e72:	00 00                	add    %al,(%eax)
    9e74:	25 00 00 00 12       	and    $0x12000000,%eax
    9e79:	00 00                	add    %al,(%eax)
    9e7b:	00 71 87             	add    %dh,-0x79(%ecx)
    9e7e:	00 00                	add    %al,(%eax)
    9e80:	17                   	pop    %ss
    9e81:	00 00                	add    %al,(%eax)
    9e83:	00 e2                	add    %ah,%dl
    9e85:	87 00                	xchg   %eax,(%eax)
    9e87:	00 1e                	add    %bl,(%esi)
    9e89:	00 00                	add    %al,(%eax)
    9e8b:	00 50 88             	add    %dl,-0x78(%eax)
    9e8e:	00 00                	add    %al,(%eax)
    9e90:	14 00                	adc    $0x0,%al
    9e92:	00 00                	add    %al,(%eax)
    9e94:	00 88 00 00 42 00    	add    %cl,0x420000(%eax)
    9e9a:	00 00                	add    %al,(%eax)
    9e9c:	69 00 00 00 2c 00    	imul   $0x2c0000,(%eax),%eax
    9ea2:	00 00                	add    %al,(%eax)
    9ea4:	00 88 00 00 42 00    	add    %cl,0x420000(%eax)
    9eaa:	00 00                	add    %al,(%eax)
    9eac:	6a 00                	push   $0x0
    9eae:	00 00                	add    %al,(%eax)
    9eb0:	29 00                	sub    %eax,(%eax)
    9eb2:	00 00                	add    %al,(%eax)
    9eb4:	64 88 00             	mov    %al,%fs:(%eax)
    9eb7:	00 0c 00             	add    %cl,(%eax,%eax,1)
    9eba:	00 00                	add    %al,(%eax)
    9ebc:	00 88 00 00 42 00    	add    %cl,0x420000(%eax)
    9ec2:	00 00                	add    %al,(%eax)
    9ec4:	71 00                	jno    9ec6 <__GNU_EH_FRAME_HDR+0x13c2>
    9ec6:	00 00                	add    %al,(%eax)
    9ec8:	2c 00                	sub    $0x0,%al
    9eca:	00 00                	add    %al,(%eax)
    9ecc:	70 88                	jo     9e56 <__GNU_EH_FRAME_HDR+0x1352>
    9ece:	00 00                	add    %al,(%eax)
    9ed0:	0b 00                	or     (%eax),%eax
    9ed2:	00 00                	add    %al,(%eax)
    9ed4:	7b 88                	jnp    9e5e <__GNU_EH_FRAME_HDR+0x135a>
    9ed6:	00 00                	add    %al,(%eax)
    9ed8:	13 00                	adc    (%eax),%eax
    9eda:	00 00                	add    %al,(%eax)
    9edc:	fb                   	sti
    9edd:	88 00                	mov    %al,(%eax)
    9edf:	00 13                	add    %dl,(%ebx)
    9ee1:	00 00                	add    %al,(%eax)
    9ee3:	00 20                	add    %ah,(%eax)
    9ee5:	89 00                	mov    %eax,(%eax)
    9ee7:	00 0e                	add    %cl,(%esi)
    9ee9:	00 00                	add    %al,(%eax)
    9eeb:	00 2e                	add    %ch,(%esi)
    9eed:	89 00                	mov    %eax,(%eax)
    9eef:	00 0e                	add    %cl,(%esi)
    9ef1:	00 00                	add    %al,(%eax)
    9ef3:	00 4d 89             	add    %cl,-0x77(%ebp)
    9ef6:	00 00                	add    %al,(%eax)
    9ef8:	25 00 00 00 bd       	and    $0xbd000000,%eax
    9efd:	89 00                	mov    %eax,(%eax)
    9eff:	00 1d 00 00 00 f6    	add    %bl,0xf6000000
    9f05:	89 00                	mov    %eax,(%eax)
    9f07:	00 21                	add    %ah,(%ecx)
	...
    9f11:	00 00                	add    %al,(%eax)
    9f13:	00 01                	add    %al,(%ecx)
    9f15:	00 00                	add    %al,(%eax)
    9f17:	00 20                	add    %ah,(%eax)
    9f19:	6e                   	outsb  %ds:(%esi),(%dx)
    9f1a:	00 00                	add    %al,(%eax)
    9f1c:	30 6e 00             	xor    %ch,0x0(%esi)
    9f1f:	00 40 6e             	add    %al,0x6e(%eax)
	...

00009f24 <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE>:
    9f24:	7d 8a                	jge    9eb0 <__GNU_EH_FRAME_HDR+0x13ac>
    9f26:	00 00                	add    %al,(%eax)
    9f28:	03 00                	add    (%eax),%eax
    9f2a:	00 00                	add    %al,(%eax)
    9f2c:	80 8a 00 00 05 00 00 	orb    $0x0,0x50000(%edx)
    9f33:	00 a2 76 00 00 04    	add    %ah,0x4000076(%edx)
    9f39:	00 00                	add    %al,(%eax)
    9f3b:	00 a6 76 00 00 04    	add    %ah,0x4000076(%esi)
    9f41:	00 00                	add    %al,(%eax)
    9f43:	00 85 8a 00 00 05    	add    %al,0x500008a(%ebp)
    9f49:	00 00                	add    %al,(%eax)
    9f4b:	00 8a 8a 00 00 05    	add    %cl,0x500008a(%edx)
    9f51:	00 00                	add    %al,(%eax)
    9f53:	00 e6                	add    %ah,%dh
    9f55:	8a 00                	mov    (%eax),%al
    9f57:	00 1d 00 00 00 8f    	add    %bl,0x8f000000
    9f5d:	8a 00                	mov    (%eax),%al
    9f5f:	00 57 00             	add    %dl,0x0(%edi)
    9f62:	00 00                	add    %al,(%eax)
    9f64:	dc 02                	faddl  (%edx)
    9f66:	00 00                	add    %al,(%eax)
    9f68:	09 00                	or     %eax,(%eax)
	...

Disassembly of section .dynamic:

00009f6c <_DYNAMIC>:
    9f6c:	f5                   	cmc
    9f6d:	fe                   	(bad)
    9f6e:	ff 6f 14             	ljmp   *0x14(%edi)
    9f71:	70 00                	jo     9f73 <_DYNAMIC+0x7>
    9f73:	00 05 00 00 00 3c    	add    %al,0x3c000000
    9f79:	70 00                	jo     9f7b <_DYNAMIC+0xf>
    9f7b:	00 06                	add    %al,(%esi)
    9f7d:	00 00                	add    %al,(%eax)
    9f7f:	00 2c 70             	add    %ch,(%eax,%esi,2)
    9f82:	00 00                	add    %al,(%eax)
    9f84:	0a 00                	or     (%eax),%al
    9f86:	00 00                	add    %al,(%eax)
    9f88:	01 00                	add    %eax,(%eax)
    9f8a:	00 00                	add    %al,(%eax)
    9f8c:	0b 00                	or     (%eax),%eax
    9f8e:	00 00                	add    %al,(%eax)
    9f90:	10 00                	adc    %al,(%eax)
    9f92:	00 00                	add    %al,(%eax)
    9f94:	15 00 00 00 00       	adc    $0x0,%eax
    9f99:	00 00                	add    %al,(%eax)
    9f9b:	00 11                	add    %dl,(%ecx)
    9f9d:	00 00                	add    %al,(%eax)
    9f9f:	00 40 70             	add    %al,0x70(%eax)
    9fa2:	00 00                	add    %al,(%eax)
    9fa4:	12 00                	adc    (%eax),%al
    9fa6:	00 00                	add    %al,(%eax)
    9fa8:	a8 02                	test   $0x2,%al
    9faa:	00 00                	add    %al,(%eax)
    9fac:	13 00                	adc    (%eax),%eax
    9fae:	00 00                	add    %al,(%eax)
    9fb0:	08 00                	or     %al,(%eax)
    9fb2:	00 00                	add    %al,(%eax)
    9fb4:	1e                   	push   %ds
    9fb5:	00 00                	add    %al,(%eax)
    9fb7:	00 08                	add    %cl,(%eax)
    9fb9:	00 00                	add    %al,(%eax)
    9fbb:	00 fb                	add    %bh,%bl
    9fbd:	ff                   	(bad)
    9fbe:	ff 6f 01             	ljmp   *0x1(%edi)
    9fc1:	00 00                	add    %al,(%eax)
    9fc3:	08 fa                	or     %bh,%dl
    9fc5:	ff                   	(bad)
    9fc6:	ff 6f 55             	ljmp   *0x55(%edi)
	...

Disassembly of section .got:

00009ff4 <_GLOBAL_OFFSET_TABLE_>:
    9ff4:	6c                   	insb   (%dx),%es:(%edi)
    9ff5:	9f                   	lahf
	...

Disassembly of section .data:

0000a000 <_ZN10kernel_lib9allocator9ALLOCATOR17h561233108ae65dc6E>:
    a000:	00 00                	add    %al,(%eax)
    a002:	00 00                	add    %al,(%eax)
    a004:	20 a0 00 00 30 c7    	and    %ah,-0x38d00000(%eax)
	...

0000a018 <_ZN3log6LOGGER17hf5b26e2073f66ae9E.0>:
    a018:	01 00                	add    %eax,(%eax)
	...

0000a01c <_ZN3log6LOGGER17hf5b26e2073f66ae9E.1>:
    a01c:	0c 9f                	or     $0x9f,%al
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	72 75                	jb     77 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler-0xf89>
   2:	73 74                	jae    78 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler-0xf88>
   4:	63 20                	arpl   %esp,(%eax)
   6:	76 65                	jbe    6d <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler-0xf93>
   8:	72 73                	jb     7d <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler-0xf83>
   a:	69 6f 6e 20 31 2e 38 	imul   $0x382e3120,0x6e(%edi),%ebp
  11:	38 2e                	cmp    %ch,(%esi)
  13:	30 2d 6e 69 67 68    	xor    %ch,0x6867696e
  19:	74 6c                	je     87 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler-0xf79>
  1b:	79 20                	jns    3d <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler-0xfc3>
  1d:	28 39                	sub    %bh,(%ecx)
  1f:	33 34 38             	xor    (%eax,%edi,1),%esi
  22:	38 30                	cmp    %dh,(%eax)
  24:	66 35 38 20          	xor    $0x2038,%ax
  28:	32 30                	xor    (%eax),%dh
  2a:	32 35 2d 30 34 2d    	xor    0x2d34302d,%dh
  30:	30 39                	xor    %bh,(%ecx)
  32:	29 00                	sub    %eax,(%eax)
