
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
 1a3:	00 8d 9c 88 e4 df    	add    %cl,-0x201b7764(%ebp)
 1a9:	bd 6c 02 71 9d       	mov    $0x9d71026c,%ebp
 1ae:	45                   	inc    %ebp
 1af:	ea 29 7c 94 76 0f 93 	ljmp   $0x930f,$0x76947c29
 1b6:	59                   	pop    %ecx
 1b7:	e2                   	.byte 0xe2

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
    1071:	e8 ca 00 00 00       	call   1140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
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
    109c:	8d 83 0c 8b ff ff    	lea    -0x74f4(%ebx),%eax
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
    10d4:	e8 c7 02 00 00       	call   13a0 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E>

000010d9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>:
    10d9:	53                   	push   %ebx
    10da:	57                   	push   %edi
    10db:	56                   	push   %esi
    10dc:	83 ec 30             	sub    $0x30,%esp
    10df:	e8 00 00 00 00       	call   10e4 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E+0xb>
    10e4:	5b                   	pop    %ebx
    10e5:	81 c3 10 8f 00 00    	add    $0x8f10,%ebx
    10eb:	89 e0                	mov    %esp,%eax
    10ed:	89 08                	mov    %ecx,(%eax)
    10ef:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    10f3:	c7 01 0a 00 00 00    	movl   $0xa,(%ecx)
    10f9:	8d 54 24 08          	lea    0x8(%esp),%edx
    10fd:	89 0a                	mov    %ecx,(%edx)
    10ff:	8d b3 0c 8b ff ff    	lea    -0x74f4(%ebx),%esi
    1105:	89 72 04             	mov    %esi,0x4(%edx)
    1108:	8d bb 68 fd ff ff    	lea    -0x298(%ebx),%edi
    110e:	8d 4c 24 18          	lea    0x18(%esp),%ecx
    1112:	89 39                	mov    %edi,(%ecx)
    1114:	6a 02                	push   $0x2
    1116:	5f                   	pop    %edi
    1117:	89 79 04             	mov    %edi,0x4(%ecx)
    111a:	83 61 10 00          	andl   $0x0,0x10(%ecx)
    111e:	89 42 08             	mov    %eax,0x8(%edx)
    1121:	89 72 0c             	mov    %esi,0xc(%edx)
    1124:	89 51 08             	mov    %edx,0x8(%ecx)
    1127:	89 79 0c             	mov    %edi,0xc(%ecx)
    112a:	8d 93 a0 fc ff ff    	lea    -0x360(%ebx),%edx
    1130:	e8 0b 00 00 00       	call   1140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    1135:	66 90                	xchg   %ax,%ax
    1137:	66 90                	xchg   %ax,%ax
    1139:	66 90                	xchg   %ax,%ax
    113b:	66 90                	xchg   %ax,%ax
    113d:	66 90                	xchg   %ax,%ax
    113f:	90                   	nop

00001140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>:
    1140:	53                   	push   %ebx
    1141:	83 ec 18             	sub    $0x18,%esp
    1144:	e8 00 00 00 00       	call   1149 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE+0x9>
    1149:	5b                   	pop    %ebx
    114a:	81 c3 ab 8e 00 00    	add    $0x8eab,%ebx
    1150:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1154:	89 54 24 10          	mov    %edx,0x10(%esp)
    1158:	66 c7 44 24 14 01 00 	movw   $0x1,0x14(%esp)
    115f:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    1163:	e8 48 3c 00 00       	call   4db0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>
    1168:	66 90                	xchg   %ax,%ax
    116a:	66 90                	xchg   %ax,%ax
    116c:	66 90                	xchg   %ax,%ax
    116e:	66 90                	xchg   %ax,%ax

00001170 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E>:
    1170:	53                   	push   %ebx
    1171:	83 ec 08             	sub    $0x8,%esp
    1174:	e8 00 00 00 00       	call   1179 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E+0x9>
    1179:	5b                   	pop    %ebx
    117a:	81 c3 7b 8e 00 00    	add    $0x8e7b,%ebx
    1180:	e8 0b 00 00 00       	call   1190 <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h4789dd0a006d5905E>
    1185:	66 90                	xchg   %ax,%ax
    1187:	66 90                	xchg   %ax,%ax
    1189:	66 90                	xchg   %ax,%ax
    118b:	66 90                	xchg   %ax,%ax
    118d:	66 90                	xchg   %ax,%ax
    118f:	90                   	nop

00001190 <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h4789dd0a006d5905E>:
    1190:	53                   	push   %ebx
    1191:	83 ec 38             	sub    $0x38,%esp
    1194:	e8 00 00 00 00       	call   1199 <_ZN4core5slice5index24slice_end_index_len_fail8do_panic7runtime17h4789dd0a006d5905E+0x9>
    1199:	5b                   	pop    %ebx
    119a:	81 c3 5b 8e 00 00    	add    $0x8e5b,%ebx
    11a0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    11a4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    11a8:	8d 44 24 08          	lea    0x8(%esp),%eax
    11ac:	89 44 24 10          	mov    %eax,0x10(%esp)
    11b0:	8d 83 0c 8b ff ff    	lea    -0x74f4(%ebx),%eax
    11b6:	89 44 24 14          	mov    %eax,0x14(%esp)
    11ba:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    11be:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    11c2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    11c6:	8d 83 c0 fd ff ff    	lea    -0x240(%ebx),%eax
    11cc:	89 44 24 20          	mov    %eax,0x20(%esp)
    11d0:	c7 44 24 24 02 00 00 	movl   $0x2,0x24(%esp)
    11d7:	00 
    11d8:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    11df:	00 
    11e0:	8d 44 24 10          	lea    0x10(%esp),%eax
    11e4:	89 44 24 28          	mov    %eax,0x28(%esp)
    11e8:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    11ef:	00 
    11f0:	8d 93 a0 fd ff ff    	lea    -0x260(%ebx),%edx
    11f6:	8d 4c 24 20          	lea    0x20(%esp),%ecx
    11fa:	e8 41 ff ff ff       	call   1140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    11ff:	90                   	nop

00001200 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>:
    1200:	53                   	push   %ebx
    1201:	83 ec 28             	sub    $0x28,%esp
    1204:	e8 00 00 00 00       	call   1209 <_ZN4core9panicking5panic17hdc0bb452f89252d5E+0x9>
    1209:	5b                   	pop    %ebx
    120a:	81 c3 eb 8d 00 00    	add    $0x8deb,%ebx
    1210:	8b 44 24 30          	mov    0x30(%esp),%eax
    1214:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1218:	89 54 24 0c          	mov    %edx,0xc(%esp)
    121c:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    1220:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1224:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    122b:	00 
    122c:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    1233:	00 
    1234:	c7 44 24 18 04 00 00 	movl   $0x4,0x18(%esp)
    123b:	00 
    123c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1243:	00 
    1244:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    1248:	89 c2                	mov    %eax,%edx
    124a:	e8 f1 fe ff ff       	call   1140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    124f:	90                   	nop

00001250 <_ZN4core5slice5index22slice_index_order_fail17h3a5e48f4441e7556E>:
    1250:	53                   	push   %ebx
    1251:	83 ec 08             	sub    $0x8,%esp
    1254:	e8 00 00 00 00       	call   1259 <_ZN4core5slice5index22slice_index_order_fail17h3a5e48f4441e7556E+0x9>
    1259:	5b                   	pop    %ebx
    125a:	81 c3 9b 8d 00 00    	add    $0x8d9b,%ebx
    1260:	e8 3b 00 00 00       	call   12a0 <_ZN4core5slice5index22slice_index_order_fail8do_panic7runtime17h5d63dcd23c3ff4bfE>
    1265:	66 90                	xchg   %ax,%ax
    1267:	66 90                	xchg   %ax,%ax
    1269:	66 90                	xchg   %ax,%ax
    126b:	66 90                	xchg   %ax,%ax
    126d:	66 90                	xchg   %ax,%ax
    126f:	90                   	nop

00001270 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E>:
    1270:	53                   	push   %ebx
    1271:	83 ec 08             	sub    $0x8,%esp
    1274:	e8 00 00 00 00       	call   1279 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E+0x9>
    1279:	5b                   	pop    %ebx
    127a:	81 c3 7b 8d 00 00    	add    $0x8d7b,%ebx
    1280:	89 0c 24             	mov    %ecx,(%esp)
    1283:	8d 8b 6c db ff ff    	lea    -0x2494(%ebx),%ecx
    1289:	ba 2b 00 00 00       	mov    $0x2b,%edx
    128e:	e8 6d ff ff ff       	call   1200 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    1293:	66 90                	xchg   %ax,%ax
    1295:	66 90                	xchg   %ax,%ax
    1297:	66 90                	xchg   %ax,%ax
    1299:	66 90                	xchg   %ax,%ax
    129b:	66 90                	xchg   %ax,%ax
    129d:	66 90                	xchg   %ax,%ax
    129f:	90                   	nop

000012a0 <_ZN4core5slice5index22slice_index_order_fail8do_panic7runtime17h5d63dcd23c3ff4bfE>:
    12a0:	53                   	push   %ebx
    12a1:	83 ec 38             	sub    $0x38,%esp
    12a4:	e8 00 00 00 00       	call   12a9 <_ZN4core5slice5index22slice_index_order_fail8do_panic7runtime17h5d63dcd23c3ff4bfE+0x9>
    12a9:	5b                   	pop    %ebx
    12aa:	81 c3 4b 8d 00 00    	add    $0x8d4b,%ebx
    12b0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    12b4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    12b8:	8d 44 24 08          	lea    0x8(%esp),%eax
    12bc:	89 44 24 10          	mov    %eax,0x10(%esp)
    12c0:	8d 83 0c 8b ff ff    	lea    -0x74f4(%ebx),%eax
    12c6:	89 44 24 14          	mov    %eax,0x14(%esp)
    12ca:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    12ce:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    12d2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    12d6:	8d 83 d0 fd ff ff    	lea    -0x230(%ebx),%eax
    12dc:	89 44 24 20          	mov    %eax,0x20(%esp)
    12e0:	c7 44 24 24 02 00 00 	movl   $0x2,0x24(%esp)
    12e7:	00 
    12e8:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    12ef:	00 
    12f0:	8d 44 24 10          	lea    0x10(%esp),%eax
    12f4:	89 44 24 28          	mov    %eax,0x28(%esp)
    12f8:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    12ff:	00 
    1300:	8d 93 a0 fd ff ff    	lea    -0x260(%ebx),%edx
    1306:	8d 4c 24 20          	lea    0x20(%esp),%ecx
    130a:	e8 31 fe ff ff       	call   1140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    130f:	90                   	nop

00001310 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>:
    1310:	53                   	push   %ebx
    1311:	57                   	push   %edi
    1312:	56                   	push   %esi
    1313:	83 ec 40             	sub    $0x40,%esp
    1316:	89 d0                	mov    %edx,%eax
    1318:	e8 00 00 00 00       	call   131d <_ZN4core6result13unwrap_failed17he01453759a0dabd3E+0xd>
    131d:	5b                   	pop    %ebx
    131e:	81 c3 d7 8c 00 00    	add    $0x8cd7,%ebx
    1324:	8b 54 24 58          	mov    0x58(%esp),%edx
    1328:	8b 74 24 54          	mov    0x54(%esp),%esi
    132c:	8b 7c 24 50          	mov    0x50(%esp),%edi
    1330:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1334:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1338:	89 7c 24 10          	mov    %edi,0x10(%esp)
    133c:	89 74 24 14          	mov    %esi,0x14(%esp)
    1340:	8d 44 24 08          	lea    0x8(%esp),%eax
    1344:	89 44 24 18          	mov    %eax,0x18(%esp)
    1348:	8d 83 9c 94 ff ff    	lea    -0x6b64(%ebx),%eax
    134e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1352:	8d 44 24 10          	lea    0x10(%esp),%eax
    1356:	89 44 24 20          	mov    %eax,0x20(%esp)
    135a:	8d 83 cc 94 ff ff    	lea    -0x6b34(%ebx),%eax
    1360:	89 44 24 24          	mov    %eax,0x24(%esp)
    1364:	8d 83 78 fd ff ff    	lea    -0x288(%ebx),%eax
    136a:	89 44 24 28          	mov    %eax,0x28(%esp)
    136e:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    1375:	00 
    1376:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
    137d:	00 
    137e:	8d 44 24 18          	lea    0x18(%esp),%eax
    1382:	89 44 24 30          	mov    %eax,0x30(%esp)
    1386:	c7 44 24 34 02 00 00 	movl   $0x2,0x34(%esp)
    138d:	00 
    138e:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    1392:	e8 a9 fd ff ff       	call   1140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    1397:	66 90                	xchg   %ax,%ax
    1399:	66 90                	xchg   %ax,%ax
    139b:	66 90                	xchg   %ax,%ax
    139d:	66 90                	xchg   %ax,%ax
    139f:	90                   	nop

000013a0 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E>:
    13a0:	53                   	push   %ebx
    13a1:	83 ec 28             	sub    $0x28,%esp
    13a4:	e8 00 00 00 00       	call   13a9 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E+0x9>
    13a9:	5b                   	pop    %ebx
    13aa:	81 c3 4b 8c 00 00    	add    $0x8c4b,%ebx
    13b0:	8b 41 14             	mov    0x14(%ecx),%eax
    13b3:	89 44 24 24          	mov    %eax,0x24(%esp)
    13b7:	8b 41 10             	mov    0x10(%ecx),%eax
    13ba:	89 44 24 20          	mov    %eax,0x20(%esp)
    13be:	8b 41 0c             	mov    0xc(%ecx),%eax
    13c1:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    13c5:	8b 41 08             	mov    0x8(%ecx),%eax
    13c8:	89 44 24 18          	mov    %eax,0x18(%esp)
    13cc:	8b 01                	mov    (%ecx),%eax
    13ce:	8b 49 04             	mov    0x4(%ecx),%ecx
    13d1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    13d5:	89 44 24 10          	mov    %eax,0x10(%esp)
    13d9:	8d 44 24 10          	lea    0x10(%esp),%eax
    13dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    13e1:	8d 83 40 fd ff ff    	lea    -0x2c0(%ebx),%eax
    13e7:	89 44 24 08          	mov    %eax,0x8(%esp)
    13eb:	66 c7 44 24 0c 00 00 	movw   $0x0,0xc(%esp)
    13f2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    13f6:	e8 b5 39 00 00       	call   4db0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>
    13fb:	66 90                	xchg   %ax,%ax
    13fd:	66 90                	xchg   %ax,%ax
    13ff:	90                   	nop

00001400 <init>:
    1400:	55                   	push   %ebp
    1401:	53                   	push   %ebx
    1402:	57                   	push   %edi
    1403:	56                   	push   %esi
    1404:	81 ec 3c 01 00 00    	sub    $0x13c,%esp
    140a:	e8 00 00 00 00       	call   140f <init+0xf>
    140f:	5b                   	pop    %ebx
    1410:	81 c3 e5 8b 00 00    	add    $0x8be5,%ebx
    1416:	b9 01 00 00 00       	mov    $0x1,%ecx
    141b:	31 c0                	xor    %eax,%eax
    141d:	f0 0f b1 8b 40 27 00 	lock cmpxchg %ecx,0x2740(%ebx)
    1424:	00 
    1425:	0f 85 80 00 00 00    	jne    14ab <init+0xab>
    142b:	8d 83 28 e5 ff ff    	lea    -0x1ad8(%ebx),%eax
    1431:	89 83 24 00 00 00    	mov    %eax,0x24(%ebx)
    1437:	8d 83 28 fe ff ff    	lea    -0x1d8(%ebx),%eax
    143d:	89 83 28 00 00 00    	mov    %eax,0x28(%ebx)
    1443:	c7 83 40 27 00 00 02 	movl   $0x2,0x2740(%ebx)
    144a:	00 00 00 
    144d:	c7 83 44 27 00 00 04 	movl   $0x4,0x2744(%ebx)
    1454:	00 00 00 
    1457:	c7 44 24 3c 06 00 00 	movl   $0x6,0x3c(%esp)
    145e:	00 
    145f:	c7 44 24 40 6b 65 79 	movl   $0x6279656b,0x40(%esp)
    1466:	62 
    1467:	66 c7 44 24 44 72 64 	movw   $0x6472,0x44(%esp)
    146e:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    1475:	00 
    1476:	8d 74 24 3c          	lea    0x3c(%esp),%esi
    147a:	89 f2                	mov    %esi,%edx
    147c:	b8 81 00 00 00       	mov    $0x81,%eax
    1481:	cd 80                	int    $0x80
    1483:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1486:	83 f9 0a             	cmp    $0xa,%ecx
    1489:	73 63                	jae    14ee <init+0xee>
    148b:	89 c7                	mov    %eax,%edi
    148d:	bd 02 00 00 00       	mov    $0x2,%ebp
    1492:	83 fd 04             	cmp    $0x4,%ebp
    1495:	0f 85 9c 04 00 00    	jne    1937 <init+0x537>
    149b:	8d 93 5c a1 ff ff    	lea    -0x5ea4(%ebx),%edx
    14a1:	b9 02 00 00 00       	mov    $0x2,%ecx
    14a6:	e8 35 3b 00 00       	call   4fe0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>
    14ab:	83 f8 01             	cmp    $0x1,%eax
    14ae:	75 18                	jne    14c8 <init+0xc8>
    14b0:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    14b6:	83 f8 01             	cmp    $0x1,%eax
    14b9:	75 0d                	jne    14c8 <init+0xc8>
    14bb:	f3 90                	pause
    14bd:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    14c3:	83 f8 01             	cmp    $0x1,%eax
    14c6:	74 f3                	je     14bb <init+0xbb>
    14c8:	83 ec 04             	sub    $0x4,%esp
    14cb:	8d 83 10 fd ff ff    	lea    -0x2f0(%ebx),%eax
    14d1:	8d b3 90 fc ff ff    	lea    -0x370(%ebx),%esi
    14d7:	8d 7c 24 18          	lea    0x18(%esp),%edi
    14db:	8d 8b 20 e4 ff ff    	lea    -0x1be0(%ebx),%ecx
    14e1:	ba 2b 00 00 00       	mov    $0x2b,%edx
    14e6:	50                   	push   %eax
    14e7:	56                   	push   %esi
    14e8:	57                   	push   %edi
    14e9:	e8 22 fe ff ff       	call   1310 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    14ee:	bf 42 00 00 00       	mov    $0x42,%edi
    14f3:	85 c0                	test   %eax,%eax
    14f5:	75 96                	jne    148d <init+0x8d>
    14f7:	c6 44 24 1c 01       	movb   $0x1,0x1c(%esp)
    14fc:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    1503:	00 
    1504:	c7 44 24 20 06 00 00 	movl   $0x6,0x20(%esp)
    150b:	00 
    150c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1513:	00 
    1514:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    1518:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    151c:	b8 8b 00 00 00       	mov    $0x8b,%eax
    1521:	cd 80                	int    $0x80
    1523:	89 c7                	mov    %eax,%edi
    1525:	48                   	dec    %eax
    1526:	83 f8 0a             	cmp    $0xa,%eax
    1529:	73 07                	jae    1532 <init+0x132>
    152b:	31 ed                	xor    %ebp,%ebp
    152d:	e9 60 ff ff ff       	jmp    1492 <init+0x92>
    1532:	85 ff                	test   %edi,%edi
    1534:	bf 42 00 00 00       	mov    $0x42,%edi
    1539:	75 f0                	jne    152b <init+0x12b>
    153b:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1541:	83 f8 04             	cmp    $0x4,%eax
    1544:	0f 82 d2 00 00 00    	jb     161c <init+0x21c>
    154a:	8d 44 24 10          	lea    0x10(%esp),%eax
    154e:	89 44 24 14          	mov    %eax,0x14(%esp)
    1552:	8d 83 cc a1 ff ff    	lea    -0x5e34(%ebx),%eax
    1558:	89 44 24 18          	mov    %eax,0x18(%esp)
    155c:	c7 44 24 5c 04 00 00 	movl   $0x4,0x5c(%esp)
    1563:	00 
    1564:	8d 83 1a e5 ff ff    	lea    -0x1ae6(%ebx),%eax
    156a:	89 44 24 60          	mov    %eax,0x60(%esp)
    156e:	c7 44 24 64 0e 00 00 	movl   $0xe,0x64(%esp)
    1575:	00 
    1576:	8d 8b 20 fe ff ff    	lea    -0x1e0(%ebx),%ecx
    157c:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    1580:	c7 44 24 6c 01 00 00 	movl   $0x1,0x6c(%esp)
    1587:	00 
    1588:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    158c:	89 4c 24 70          	mov    %ecx,0x70(%esp)
    1590:	c7 44 24 74 01 00 00 	movl   $0x1,0x74(%esp)
    1597:	00 
    1598:	8d 8b c0 e4 ff ff    	lea    -0x1b40(%ebx),%ecx
    159e:	89 4c 24 78          	mov    %ecx,0x78(%esp)
    15a2:	c7 44 24 7c 01 00 00 	movl   $0x1,0x7c(%esp)
    15a9:	00 
    15aa:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    15b1:	00 
    15b2:	89 44 24 48          	mov    %eax,0x48(%esp)
    15b6:	c7 44 24 4c 0e 00 00 	movl   $0xe,0x4c(%esp)
    15bd:	00 
    15be:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    15c5:	00 
    15c6:	8d 83 d8 e4 ff ff    	lea    -0x1b28(%ebx),%eax
    15cc:	89 44 24 54          	mov    %eax,0x54(%esp)
    15d0:	c7 44 24 58 42 00 00 	movl   $0x42,0x58(%esp)
    15d7:	00 
    15d8:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    15df:	00 
    15e0:	c7 44 24 40 1e 00 00 	movl   $0x1e,0x40(%esp)
    15e7:	00 
    15e8:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    15ee:	83 f8 02             	cmp    $0x2,%eax
    15f1:	74 08                	je     15fb <init+0x1fb>
    15f3:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    15f9:	eb 06                	jmp    1601 <init+0x201>
    15fb:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    1601:	74 08                	je     160b <init+0x20b>
    1603:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    1609:	eb 06                	jmp    1611 <init+0x211>
    160b:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    1611:	83 ec 08             	sub    $0x8,%esp
    1614:	56                   	push   %esi
    1615:	51                   	push   %ecx
    1616:	ff 50 10             	call   *0x10(%eax)
    1619:	83 c4 10             	add    $0x10,%esp
    161c:	8b 44 24 10          	mov    0x10(%esp),%eax
    1620:	89 44 24 30          	mov    %eax,0x30(%esp)
    1624:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    162b:	00 
    162c:	8d 6c 24 14          	lea    0x14(%esp),%ebp
    1630:	89 ea                	mov    %ebp,%edx
    1632:	b8 90 00 00 00       	mov    $0x90,%eax
    1637:	cd 80                	int    $0x80
    1639:	89 c7                	mov    %eax,%edi
    163b:	48                   	dec    %eax
    163c:	83 f8 0a             	cmp    $0xa,%eax
    163f:	73 13                	jae    1654 <init+0x254>
    1641:	bd 02 00 00 00       	mov    $0x2,%ebp
    1646:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    164a:	e8 a1 51 00 00       	call   67f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    164f:	e9 3e fe ff ff       	jmp    1492 <init+0x92>
    1654:	85 ff                	test   %edi,%edi
    1656:	bf 42 00 00 00       	mov    $0x42,%edi
    165b:	75 e4                	jne    1641 <init+0x241>
    165d:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1663:	83 f8 04             	cmp    $0x4,%eax
    1666:	0f 82 ce 00 00 00    	jb     173a <init+0x33a>
    166c:	89 6c 24 1c          	mov    %ebp,0x1c(%esp)
    1670:	8d 83 cc a1 ff ff    	lea    -0x5e34(%ebx),%eax
    1676:	89 44 24 20          	mov    %eax,0x20(%esp)
    167a:	c7 44 24 5c 04 00 00 	movl   $0x4,0x5c(%esp)
    1681:	00 
    1682:	8d 83 7a e6 ff ff    	lea    -0x1986(%ebx),%eax
    1688:	89 44 24 60          	mov    %eax,0x60(%esp)
    168c:	c7 44 24 64 19 00 00 	movl   $0x19,0x64(%esp)
    1693:	00 
    1694:	8d 8b 60 fe ff ff    	lea    -0x1a0(%ebx),%ecx
    169a:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    169e:	c7 44 24 6c 01 00 00 	movl   $0x1,0x6c(%esp)
    16a5:	00 
    16a6:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    16aa:	89 4c 24 70          	mov    %ecx,0x70(%esp)
    16ae:	c7 44 24 74 01 00 00 	movl   $0x1,0x74(%esp)
    16b5:	00 
    16b6:	8d 8b c0 e4 ff ff    	lea    -0x1b40(%ebx),%ecx
    16bc:	89 4c 24 78          	mov    %ecx,0x78(%esp)
    16c0:	c7 44 24 7c 01 00 00 	movl   $0x1,0x7c(%esp)
    16c7:	00 
    16c8:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    16cf:	00 
    16d0:	89 44 24 48          	mov    %eax,0x48(%esp)
    16d4:	c7 44 24 4c 19 00 00 	movl   $0x19,0x4c(%esp)
    16db:	00 
    16dc:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    16e3:	00 
    16e4:	8d 83 32 e6 ff ff    	lea    -0x19ce(%ebx),%eax
    16ea:	89 44 24 54          	mov    %eax,0x54(%esp)
    16ee:	c7 44 24 58 48 00 00 	movl   $0x48,0x58(%esp)
    16f5:	00 
    16f6:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    16fd:	00 
    16fe:	c7 44 24 40 11 00 00 	movl   $0x11,0x40(%esp)
    1705:	00 
    1706:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    170c:	83 f8 02             	cmp    $0x2,%eax
    170f:	74 08                	je     1719 <init+0x319>
    1711:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    1717:	eb 06                	jmp    171f <init+0x31f>
    1719:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    171f:	74 08                	je     1729 <init+0x329>
    1721:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    1727:	eb 06                	jmp    172f <init+0x32f>
    1729:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    172f:	83 ec 08             	sub    $0x8,%esp
    1732:	56                   	push   %esi
    1733:	51                   	push   %ecx
    1734:	ff 50 10             	call   *0x10(%eax)
    1737:	83 c4 10             	add    $0x10,%esp
    173a:	8b 7c 24 14          	mov    0x14(%esp),%edi
    173e:	0f b6 83 3c 27 00 00 	movzbl 0x273c(%ebx),%eax
    1745:	b1 01                	mov    $0x1,%cl
    1747:	90                   	nop
    1748:	90                   	nop
    1749:	90                   	nop
    174a:	90                   	nop
    174b:	90                   	nop
    174c:	90                   	nop
    174d:	90                   	nop
    174e:	90                   	nop
    174f:	90                   	nop
    1750:	31 c0                	xor    %eax,%eax
    1752:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    1759:	00 
    175a:	74 1e                	je     177a <init+0x37a>
    175c:	90                   	nop
    175d:	90                   	nop
    175e:	90                   	nop
    175f:	90                   	nop
    1760:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    1767:	84 c0                	test   %al,%al
    1769:	74 e5                	je     1750 <init+0x350>
    176b:	f3 90                	pause
    176d:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    1774:	84 c0                	test   %al,%al
    1776:	75 f3                	jne    176b <init+0x36b>
    1778:	eb d6                	jmp    1750 <init+0x350>
    177a:	b9 04 00 00 00       	mov    $0x4,%ecx
    177f:	ba 1c 01 00 00       	mov    $0x11c,%edx
    1784:	e8 17 2e 00 00       	call   45a0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>
    1789:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    1790:	85 c0                	test   %eax,%eax
    1792:	75 1a                	jne    17ae <init+0x3ae>
    1794:	89 f9                	mov    %edi,%ecx
    1796:	e8 55 50 00 00       	call   67f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    179b:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    179f:	e8 4c 50 00 00       	call   67f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    17a4:	bd 03 00 00 00       	mov    $0x3,%ebp
    17a9:	e9 e4 fc ff ff       	jmp    1492 <init+0x92>
    17ae:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    17b4:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
    17bb:	c6 40 08 00          	movb   $0x0,0x8(%eax)
    17bf:	89 44 24 0c          	mov    %eax,0xc(%esp)
    17c3:	0f b7 44 24 1c       	movzwl 0x1c(%esp),%eax
    17c8:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    17cc:	66 89 41 09          	mov    %ax,0x9(%ecx)
    17d0:	0f b6 44 24 1e       	movzbl 0x1e(%esp),%eax
    17d5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    17d9:	88 41 0b             	mov    %al,0xb(%ecx)
    17dc:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17e0:	89 78 0c             	mov    %edi,0xc(%eax)
    17e3:	8b 44 24 30          	mov    0x30(%esp),%eax
    17e7:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    17eb:	89 41 10             	mov    %eax,0x10(%ecx)
    17ee:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17f2:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
    17f9:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17fd:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
    1804:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1808:	83 c0 1c             	add    $0x1c,%eax
    180b:	83 ec 04             	sub    $0x4,%esp
    180e:	68 ff 00 00 00       	push   $0xff
    1813:	56                   	push   %esi
    1814:	50                   	push   %eax
    1815:	e8 26 53 00 00       	call   6b40 <memcpy>
    181a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    181e:	83 c4 10             	add    $0x10,%esp
    1821:	c6 80 1b 01 00 00 00 	movb   $0x0,0x11b(%eax)
    1828:	f0 ff 00             	lock incl (%eax)
    182b:	7f 02                	jg     182f <init+0x42f>
    182d:	0f 0b                	ud2
    182f:	83 c0 08             	add    $0x8,%eax
    1832:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    1836:	8d 83 2c 7a ff ff    	lea    -0x85d4(%ebx),%eax
    183c:	89 44 24 40          	mov    %eax,0x40(%esp)
    1840:	66 c7 44 24 44 03 00 	movw   $0x3,0x44(%esp)
    1847:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    184e:	00 
    184f:	8d 4c 24 3c          	lea    0x3c(%esp),%ecx
    1853:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    1857:	b8 8a 00 00 00       	mov    $0x8a,%eax
    185c:	cd 80                	int    $0x80
    185e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1861:	83 f9 0a             	cmp    $0xa,%ecx
    1864:	73 22                	jae    1888 <init+0x488>
    1866:	89 c7                	mov    %eax,%edi
    1868:	bd 02 00 00 00       	mov    $0x2,%ebp
    186d:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1871:	f0 ff 08             	lock decl (%eax)
    1874:	0f 85 18 fc ff ff    	jne    1492 <init+0x92>
    187a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    187e:	e8 2d 07 00 00       	call   1fb0 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E>
    1883:	e9 0a fc ff ff       	jmp    1492 <init+0x92>
    1888:	bf 42 00 00 00       	mov    $0x42,%edi
    188d:	85 c0                	test   %eax,%eax
    188f:	75 d7                	jne    1868 <init+0x468>
    1891:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1895:	89 44 24 10          	mov    %eax,0x10(%esp)
    1899:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    189f:	83 f8 02             	cmp    $0x2,%eax
    18a2:	76 6d                	jbe    1911 <init+0x511>
    18a4:	8d 44 24 10          	lea    0x10(%esp),%eax
    18a8:	89 44 24 14          	mov    %eax,0x14(%esp)
    18ac:	8d 83 0c 8b ff ff    	lea    -0x74f4(%ebx),%eax
    18b2:	89 44 24 18          	mov    %eax,0x18(%esp)
    18b6:	8d 83 b0 fc ff ff    	lea    -0x350(%ebx),%eax
    18bc:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    18c0:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    18c7:	00 
    18c8:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    18cf:	00 
    18d0:	89 6c 24 44          	mov    %ebp,0x44(%esp)
    18d4:	c7 44 24 48 01 00 00 	movl   $0x1,0x48(%esp)
    18db:	00 
    18dc:	8d 83 24 d7 ff ff    	lea    -0x28dc(%ebx),%eax
    18e2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    18e6:	c7 44 24 20 08 00 00 	movl   $0x8,0x20(%esp)
    18ed:	00 
    18ee:	89 44 24 24          	mov    %eax,0x24(%esp)
    18f2:	c7 44 24 28 08 00 00 	movl   $0x8,0x28(%esp)
    18f9:	00 
    18fa:	8d 83 b8 fc ff ff    	lea    -0x348(%ebx),%eax
    1900:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    1904:	8d 4c 24 3c          	lea    0x3c(%esp),%ecx
    1908:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    190c:	e8 0f 07 00 00       	call   2020 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E>
    1911:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1915:	f0 ff 08             	lock decl (%eax)
    1918:	0f 85 7d fb ff ff    	jne    149b <init+0x9b>
    191e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    1922:	e8 89 06 00 00       	call   1fb0 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E>
    1927:	8d 93 5c a1 ff ff    	lea    -0x5ea4(%ebx),%edx
    192d:	b9 02 00 00 00       	mov    $0x2,%ecx
    1932:	e8 a9 36 00 00       	call   4fe0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>
    1937:	89 6c 24 34          	mov    %ebp,0x34(%esp)
    193b:	89 7c 24 38          	mov    %edi,0x38(%esp)
    193f:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    1945:	85 c0                	test   %eax,%eax
    1947:	0f 84 c8 00 00 00    	je     1a15 <init+0x615>
    194d:	8d 44 24 34          	lea    0x34(%esp),%eax
    1951:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1955:	8d 83 5c c6 ff ff    	lea    -0x39a4(%ebx),%eax
    195b:	89 44 24 20          	mov    %eax,0x20(%esp)
    195f:	c7 44 24 5c 01 00 00 	movl   $0x1,0x5c(%esp)
    1966:	00 
    1967:	8d 83 24 d7 ff ff    	lea    -0x28dc(%ebx),%eax
    196d:	89 44 24 60          	mov    %eax,0x60(%esp)
    1971:	c7 44 24 64 08 00 00 	movl   $0x8,0x64(%esp)
    1978:	00 
    1979:	8d 8b 20 fd ff ff    	lea    -0x2e0(%ebx),%ecx
    197f:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    1983:	c7 44 24 6c 01 00 00 	movl   $0x1,0x6c(%esp)
    198a:	00 
    198b:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    198f:	89 4c 24 70          	mov    %ecx,0x70(%esp)
    1993:	c7 44 24 74 01 00 00 	movl   $0x1,0x74(%esp)
    199a:	00 
    199b:	c7 44 24 78 00 00 00 	movl   $0x0,0x78(%esp)
    19a2:	00 
    19a3:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    19aa:	00 
    19ab:	89 44 24 48          	mov    %eax,0x48(%esp)
    19af:	c7 44 24 4c 08 00 00 	movl   $0x8,0x4c(%esp)
    19b6:	00 
    19b7:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    19be:	00 
    19bf:	8d 83 d0 d6 ff ff    	lea    -0x2930(%ebx),%eax
    19c5:	89 44 24 54          	mov    %eax,0x54(%esp)
    19c9:	c7 44 24 58 14 00 00 	movl   $0x14,0x58(%esp)
    19d0:	00 
    19d1:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    19d8:	00 
    19d9:	c7 44 24 40 18 00 00 	movl   $0x18,0x40(%esp)
    19e0:	00 
    19e1:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    19e7:	83 f8 02             	cmp    $0x2,%eax
    19ea:	74 08                	je     19f4 <init+0x5f4>
    19ec:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    19f2:	eb 06                	jmp    19fa <init+0x5fa>
    19f4:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    19fa:	74 08                	je     1a04 <init+0x604>
    19fc:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    1a02:	eb 06                	jmp    1a0a <init+0x60a>
    1a04:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    1a0a:	83 ec 08             	sub    $0x8,%esp
    1a0d:	56                   	push   %esi
    1a0e:	51                   	push   %ecx
    1a0f:	ff 50 10             	call   *0x10(%eax)
    1a12:	83 c4 10             	add    $0x10,%esp
    1a15:	b8 01 00 00 00       	mov    $0x1,%eax
    1a1a:	89 c0                	mov    %eax,%eax
    1a1c:	cd 81                	int    $0x81
    1a1e:	0f 0b                	ud2

00001a20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE>:
    1a20:	55                   	push   %ebp
    1a21:	53                   	push   %ebx
    1a22:	57                   	push   %edi
    1a23:	56                   	push   %esi
    1a24:	83 ec 7c             	sub    $0x7c,%esp
    1a27:	e8 00 00 00 00       	call   1a2c <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0xc>
    1a2c:	5e                   	pop    %esi
    1a2d:	81 c6 c8 85 00 00    	add    $0x85c8,%esi
    1a33:	89 df                	mov    %ebx,%edi
    1a35:	8b 86 44 27 00 00    	mov    0x2744(%esi),%eax
    1a3b:	8d 8e 24 d7 ff ff    	lea    -0x28dc(%esi),%ecx
    1a41:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
    1a45:	83 f8 03             	cmp    $0x3,%eax
    1a48:	0f 86 ba 00 00 00    	jbe    1b08 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0xe8>
    1a4e:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    1a55:	00 
    1a56:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
    1a5a:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    1a5e:	c7 44 24 30 08 00 00 	movl   $0x8,0x30(%esp)
    1a65:	00 
    1a66:	8d 86 c8 fc ff ff    	lea    -0x338(%esi),%eax
    1a6c:	89 44 24 34          	mov    %eax,0x34(%esp)
    1a70:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    1a77:	00 
    1a78:	c7 44 24 3c 04 00 00 	movl   $0x4,0x3c(%esp)
    1a7f:	00 
    1a80:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
    1a87:	00 
    1a88:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    1a8f:	00 
    1a90:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1a97:	00 
    1a98:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1a9c:	c7 44 24 18 08 00 00 	movl   $0x8,0x18(%esp)
    1aa3:	00 
    1aa4:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1aab:	00 
    1aac:	8d 86 d0 d6 ff ff    	lea    -0x2930(%esi),%eax
    1ab2:	89 44 24 20          	mov    %eax,0x20(%esp)
    1ab6:	c7 44 24 24 14 00 00 	movl   $0x14,0x24(%esp)
    1abd:	00 
    1abe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1ac5:	00 
    1ac6:	c7 44 24 0c 4d 00 00 	movl   $0x4d,0xc(%esp)
    1acd:	00 
    1ace:	8b 86 40 27 00 00    	mov    0x2740(%esi),%eax
    1ad4:	83 f8 02             	cmp    $0x2,%eax
    1ad7:	74 10                	je     1ae9 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0xc9>
    1ad9:	8d 86 18 ff ff ff    	lea    -0xe8(%esi),%eax
    1adf:	75 10                	jne    1af1 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0xd1>
    1ae1:	8b 8e 24 00 00 00    	mov    0x24(%esi),%ecx
    1ae7:	eb 0e                	jmp    1af7 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0xd7>
    1ae9:	8b 86 28 00 00 00    	mov    0x28(%esi),%eax
    1aef:	74 f0                	je     1ae1 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0xc1>
    1af1:	8d 8e 57 ea ff ff    	lea    -0x15a9(%esi),%ecx
    1af7:	83 ec 08             	sub    $0x8,%esp
    1afa:	8d 54 24 10          	lea    0x10(%esp),%edx
    1afe:	89 f3                	mov    %esi,%ebx
    1b00:	52                   	push   %edx
    1b01:	51                   	push   %ecx
    1b02:	ff 50 10             	call   *0x10(%eax)
    1b05:	83 c4 10             	add    $0x10,%esp
    1b08:	b1 01                	mov    $0x1,%cl
    1b0a:	31 c0                	xor    %eax,%eax
    1b0c:	f0 0f b0 0f          	lock cmpxchg %cl,(%edi)
    1b10:	0f 85 0c 04 00 00    	jne    1f22 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x502>
    1b16:	8b 57 08             	mov    0x8(%edi),%edx
    1b19:	89 54 24 78          	mov    %edx,0x78(%esp)
    1b1d:	b8 83 00 00 00       	mov    $0x83,%eax
    1b22:	cd 80                	int    $0x80
    1b24:	85 c0                	test   %eax,%eax
    1b26:	0f 85 36 04 00 00    	jne    1f62 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x542>
    1b2c:	c6 07 00             	movb   $0x0,(%edi)
    1b2f:	8d 7c 24 58          	lea    0x58(%esp),%edi
    1b33:	8d 86 9c c0 ff ff    	lea    -0x3f64(%esi),%eax
    1b39:	89 44 24 74          	mov    %eax,0x74(%esp)
    1b3d:	8d ae 03 e4 ff ff    	lea    -0x1bfd(%esi),%ebp
    1b43:	8d 86 e0 fd ff ff    	lea    -0x220(%esi),%eax
    1b49:	89 44 24 70          	mov    %eax,0x70(%esp)
    1b4d:	8d 86 9c e3 ff ff    	lea    -0x1c64(%esi),%eax
    1b53:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    1b57:	8d 86 18 ff ff ff    	lea    -0xe8(%esi),%eax
    1b5d:	89 44 24 68          	mov    %eax,0x68(%esp)
    1b61:	8d 86 57 ea ff ff    	lea    -0x15a9(%esi),%eax
    1b67:	89 44 24 64          	mov    %eax,0x64(%esp)
    1b6b:	eb 1a                	jmp    1b87 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x167>
    1b6d:	90                   	nop
    1b6e:	90                   	nop
    1b6f:	90                   	nop
    1b70:	8d 8e 57 ea ff ff    	lea    -0x15a9(%esi),%ecx
    1b76:	83 ec 08             	sub    $0x8,%esp
    1b79:	89 f3                	mov    %esi,%ebx
    1b7b:	8d 54 24 10          	lea    0x10(%esp),%edx
    1b7f:	52                   	push   %edx
    1b80:	51                   	push   %ecx
    1b81:	ff 50 10             	call   *0x10(%eax)
    1b84:	83 c4 10             	add    $0x10,%esp
    1b87:	8b 4c 24 78          	mov    0x78(%esp),%ecx
    1b8b:	8d 54 24 57          	lea    0x57(%esp),%edx
    1b8f:	b8 8e 00 00 00       	mov    $0x8e,%eax
    1b94:	cd 80                	int    $0x80
    1b96:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1b99:	83 f9 0a             	cmp    $0xa,%ecx
    1b9c:	0f 83 44 01 00 00    	jae    1ce6 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x2c6>
    1ba2:	89 c1                	mov    %eax,%ecx
    1ba4:	89 4c 24 60          	mov    %ecx,0x60(%esp)
    1ba8:	8d 44 24 60          	lea    0x60(%esp),%eax
    1bac:	89 44 24 50          	mov    %eax,0x50(%esp)
    1bb0:	8b 86 44 27 00 00    	mov    0x2744(%esi),%eax
    1bb6:	85 c0                	test   %eax,%eax
    1bb8:	0f 84 93 02 00 00    	je     1e51 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x431>
    1bbe:	8d 44 24 50          	lea    0x50(%esp),%eax
    1bc2:	89 44 24 58          	mov    %eax,0x58(%esp)
    1bc6:	8b 44 24 74          	mov    0x74(%esp),%eax
    1bca:	89 44 24 5c          	mov    %eax,0x5c(%esp)
    1bce:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
    1bd5:	00 
    1bd6:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
    1bda:	c7 44 24 30 1b 00 00 	movl   $0x1b,0x30(%esp)
    1be1:	00 
    1be2:	8b 44 24 70          	mov    0x70(%esp),%eax
    1be6:	89 44 24 34          	mov    %eax,0x34(%esp)
    1bea:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    1bf1:	00 
    1bf2:	89 7c 24 3c          	mov    %edi,0x3c(%esp)
    1bf6:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    1bfd:	00 
    1bfe:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    1c05:	00 
    1c06:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1c0d:	00 
    1c0e:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    1c12:	c7 44 24 18 1b 00 00 	movl   $0x1b,0x18(%esp)
    1c19:	00 
    1c1a:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1c21:	00 
    1c22:	8b 44 24 6c          	mov    0x6c(%esp),%eax
    1c26:	89 44 24 20          	mov    %eax,0x20(%esp)
    1c2a:	c7 44 24 24 4a 00 00 	movl   $0x4a,0x24(%esp)
    1c31:	00 
    1c32:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1c39:	00 
    1c3a:	c7 44 24 0c 23 00 00 	movl   $0x23,0xc(%esp)
    1c41:	00 
    1c42:	8b 86 40 27 00 00    	mov    0x2740(%esi),%eax
    1c48:	83 f8 02             	cmp    $0x2,%eax
    1c4b:	74 13                	je     1c60 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x240>
    1c4d:	8b 44 24 68          	mov    0x68(%esp),%eax
    1c51:	75 15                	jne    1c68 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x248>
    1c53:	8b 8e 24 00 00 00    	mov    0x24(%esi),%ecx
    1c59:	eb 11                	jmp    1c6c <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x24c>
    1c5b:	90                   	nop
    1c5c:	90                   	nop
    1c5d:	90                   	nop
    1c5e:	90                   	nop
    1c5f:	90                   	nop
    1c60:	8b 86 28 00 00 00    	mov    0x28(%esi),%eax
    1c66:	74 eb                	je     1c53 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x233>
    1c68:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    1c6c:	83 ec 08             	sub    $0x8,%esp
    1c6f:	89 f3                	mov    %esi,%ebx
    1c71:	8d 54 24 10          	lea    0x10(%esp),%edx
    1c75:	52                   	push   %edx
    1c76:	51                   	push   %ecx
    1c77:	ff 50 10             	call   *0x10(%eax)
    1c7a:	83 c4 10             	add    $0x10,%esp
    1c7d:	83 7c 24 60 00       	cmpl   $0x0,0x60(%esp)
    1c82:	0f 85 c9 01 00 00    	jne    1e51 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x431>
    1c88:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1c8f:	00 
    1c90:	c6 44 24 58 00       	movb   $0x0,0x58(%esp)
    1c95:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    1c99:	b8 02 00 60 00       	mov    $0x600002,%eax
    1c9e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ca2:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1ca9:	00 
    1caa:	b9 01 00 00 00       	mov    $0x1,%ecx
    1caf:	8d 54 24 08          	lea    0x8(%esp),%edx
    1cb3:	b8 84 00 00 00       	mov    $0x84,%eax
    1cb8:	cd 80                	int    $0x80
    1cba:	85 c0                	test   %eax,%eax
    1cbc:	0f 85 6d 02 00 00    	jne    1f2f <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x50f>
    1cc2:	0f b6 44 24 58       	movzbl 0x58(%esp),%eax
    1cc7:	8d 50 f2             	lea    -0xe(%eax),%edx
    1cca:	83 fa 2b             	cmp    $0x2b,%edx
    1ccd:	77 25                	ja     1cf4 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x2d4>
    1ccf:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1cd4:	8b 94 96 cc d2 ff ff 	mov    -0x2d34(%esi,%edx,4),%edx
    1cdb:	01 f2                	add    %esi,%edx
    1cdd:	ff e2                	jmp    *%edx
    1cdf:	b9 0d 00 00 00       	mov    $0xd,%ecx
    1ce4:	eb 3a                	jmp    1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1ce6:	b9 42 00 00 00       	mov    $0x42,%ecx
    1ceb:	85 c0                	test   %eax,%eax
    1ced:	74 99                	je     1c88 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x268>
    1cef:	e9 b0 fe ff ff       	jmp    1ba4 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x184>
    1cf4:	89 c1                	mov    %eax,%ecx
    1cf6:	80 c1 fe             	add    $0xfe,%cl
    1cf9:	80 f9 09             	cmp    $0x9,%cl
    1cfc:	0f 83 f5 00 00 00    	jae    1df7 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x3d7>
    1d02:	0f b6 8c 06 b3 d6 ff 	movzbl -0x294d(%esi,%eax,1),%ecx
    1d09:	ff 
    1d0a:	eb 14                	jmp    1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1d0c:	b9 30 00 00 00       	mov    $0x30,%ecx
    1d11:	eb 0d                	jmp    1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1d13:	b9 2e 00 00 00       	mov    $0x2e,%ecx
    1d18:	eb 06                	jmp    1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1d1a:	b9 20 00 00 00       	mov    $0x20,%ecx
    1d1f:	90                   	nop
    1d20:	89 4c 24 50          	mov    %ecx,0x50(%esp)
    1d24:	8b 86 44 27 00 00    	mov    0x2744(%esi),%eax
    1d2a:	83 f8 03             	cmp    $0x3,%eax
    1d2d:	0f 86 54 fe ff ff    	jbe    1b87 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x167>
    1d33:	8d 44 24 50          	lea    0x50(%esp),%eax
    1d37:	89 44 24 58          	mov    %eax,0x58(%esp)
    1d3b:	8d 86 bc 81 ff ff    	lea    -0x7e44(%esi),%eax
    1d41:	89 44 24 5c          	mov    %eax,0x5c(%esp)
    1d45:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    1d4c:	00 
    1d4d:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
    1d51:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    1d55:	c7 44 24 30 08 00 00 	movl   $0x8,0x30(%esp)
    1d5c:	00 
    1d5d:	8d 86 00 fd ff ff    	lea    -0x300(%esi),%eax
    1d63:	89 44 24 34          	mov    %eax,0x34(%esp)
    1d67:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    1d6e:	00 
    1d6f:	89 7c 24 3c          	mov    %edi,0x3c(%esp)
    1d73:	c7 44 24 40 01 00 00 	movl   $0x1,0x40(%esp)
    1d7a:	00 
    1d7b:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    1d82:	00 
    1d83:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1d8a:	00 
    1d8b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1d8f:	c7 44 24 18 08 00 00 	movl   $0x8,0x18(%esp)
    1d96:	00 
    1d97:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1d9e:	00 
    1d9f:	8d 86 d0 d6 ff ff    	lea    -0x2930(%esi),%eax
    1da5:	89 44 24 20          	mov    %eax,0x20(%esp)
    1da9:	c7 44 24 24 14 00 00 	movl   $0x14,0x24(%esp)
    1db0:	00 
    1db1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1db8:	00 
    1db9:	c7 44 24 0c 58 00 00 	movl   $0x58,0xc(%esp)
    1dc0:	00 
    1dc1:	8b 86 40 27 00 00    	mov    0x2740(%esi),%eax
    1dc7:	83 f8 02             	cmp    $0x2,%eax
    1dca:	74 14                	je     1de0 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x3c0>
    1dcc:	8d 86 18 ff ff ff    	lea    -0xe8(%esi),%eax
    1dd2:	0f 85 98 fd ff ff    	jne    1b70 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x150>
    1dd8:	eb 12                	jmp    1dec <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x3cc>
    1dda:	90                   	nop
    1ddb:	90                   	nop
    1ddc:	90                   	nop
    1ddd:	90                   	nop
    1dde:	90                   	nop
    1ddf:	90                   	nop
    1de0:	8b 86 28 00 00 00    	mov    0x28(%esi),%eax
    1de6:	0f 85 84 fd ff ff    	jne    1b70 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x150>
    1dec:	8b 8e 24 00 00 00    	mov    0x24(%esi),%ecx
    1df2:	e9 7f fd ff ff       	jmp    1b76 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x156>
    1df7:	89 c2                	mov    %eax,%edx
    1df9:	80 c2 f0             	add    $0xf0,%dl
    1dfc:	80 fa 0d             	cmp    $0xd,%dl
    1dff:	73 19                	jae    1e1a <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x3fa>
    1e01:	0f b6 ca             	movzbl %dl,%ecx
    1e04:	80 fa 0a             	cmp    $0xa,%dl
    1e07:	0f 83 90 01 00 00    	jae    1f9d <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x57d>
    1e0d:	0f b6 8c 0e 9b d6 ff 	movzbl -0x2965(%esi,%ecx,1),%ecx
    1e14:	ff 
    1e15:	e9 06 ff ff ff       	jmp    1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1e1a:	89 c1                	mov    %eax,%ecx
    1e1c:	80 c1 e2             	add    $0xe2,%cl
    1e1f:	80 f9 09             	cmp    $0x9,%cl
    1e22:	73 0d                	jae    1e31 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x411>
    1e24:	0f b6 8c 06 8e d6 ff 	movzbl -0x2972(%esi,%eax,1),%ecx
    1e2b:	ff 
    1e2c:	e9 ef fe ff ff       	jmp    1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1e31:	89 c2                	mov    %eax,%edx
    1e33:	80 c2 d4             	add    $0xd4,%dl
    1e36:	b9 00 00 11 00       	mov    $0x110000,%ecx
    1e3b:	80 fa 06             	cmp    $0x6,%dl
    1e3e:	0f 87 dc fe ff ff    	ja     1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1e44:	0f b6 8c 06 79 d6 ff 	movzbl -0x2987(%esi,%eax,1),%ecx
    1e4b:	ff 
    1e4c:	e9 cf fe ff ff       	jmp    1d20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x300>
    1e51:	8b 86 44 27 00 00    	mov    0x2744(%esi),%eax
    1e57:	83 f8 04             	cmp    $0x4,%eax
    1e5a:	0f 82 c0 00 00 00    	jb     1f20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x500>
    1e60:	c7 44 24 28 04 00 00 	movl   $0x4,0x28(%esp)
    1e67:	00 
    1e68:	8b 4c 24 4c          	mov    0x4c(%esp),%ecx
    1e6c:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    1e70:	c7 44 24 30 08 00 00 	movl   $0x8,0x30(%esp)
    1e77:	00 
    1e78:	8d 86 08 fd ff ff    	lea    -0x2f8(%esi),%eax
    1e7e:	89 44 24 34          	mov    %eax,0x34(%esp)
    1e82:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    1e89:	00 
    1e8a:	c7 44 24 3c 04 00 00 	movl   $0x4,0x3c(%esp)
    1e91:	00 
    1e92:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
    1e99:	00 
    1e9a:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    1ea1:	00 
    1ea2:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1ea9:	00 
    1eaa:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1eae:	c7 44 24 18 08 00 00 	movl   $0x8,0x18(%esp)
    1eb5:	00 
    1eb6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1ebd:	00 
    1ebe:	8d 86 d0 d6 ff ff    	lea    -0x2930(%esi),%eax
    1ec4:	89 44 24 20          	mov    %eax,0x20(%esp)
    1ec8:	c7 44 24 24 14 00 00 	movl   $0x14,0x24(%esp)
    1ecf:	00 
    1ed0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1ed7:	00 
    1ed8:	c7 44 24 0c 5b 00 00 	movl   $0x5b,0xc(%esp)
    1edf:	00 
    1ee0:	8b 86 40 27 00 00    	mov    0x2740(%esi),%eax
    1ee6:	83 f8 02             	cmp    $0x2,%eax
    1ee9:	74 10                	je     1efb <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x4db>
    1eeb:	8d 86 18 ff ff ff    	lea    -0xe8(%esi),%eax
    1ef1:	75 10                	jne    1f03 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x4e3>
    1ef3:	8b 8e 24 00 00 00    	mov    0x24(%esi),%ecx
    1ef9:	eb 0e                	jmp    1f09 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x4e9>
    1efb:	8b 86 28 00 00 00    	mov    0x28(%esi),%eax
    1f01:	74 f0                	je     1ef3 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x4d3>
    1f03:	8d 8e 57 ea ff ff    	lea    -0x15a9(%esi),%ecx
    1f09:	83 ec 08             	sub    $0x8,%esp
    1f0c:	89 f3                	mov    %esi,%ebx
    1f0e:	8d 54 24 10          	lea    0x10(%esp),%edx
    1f12:	52                   	push   %edx
    1f13:	51                   	push   %ecx
    1f14:	ff 50 10             	call   *0x10(%eax)
    1f17:	83 c4 10             	add    $0x10,%esp
    1f1a:	90                   	nop
    1f1b:	90                   	nop
    1f1c:	90                   	nop
    1f1d:	90                   	nop
    1f1e:	90                   	nop
    1f1f:	90                   	nop
    1f20:	eb fe                	jmp    1f20 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x500>
    1f22:	8d 8e d0 fc ff ff    	lea    -0x330(%esi),%ecx
    1f28:	89 f3                	mov    %esi,%ebx
    1f2a:	e8 41 f3 ff ff       	call   1270 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E>
    1f2f:	89 c1                	mov    %eax,%ecx
    1f31:	89 f3                	mov    %esi,%ebx
    1f33:	e8 88 4b 00 00       	call   6ac0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    1f38:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f3c:	83 ec 04             	sub    $0x4,%esp
    1f3f:	8d 86 f0 fc ff ff    	lea    -0x310(%esi),%eax
    1f45:	8d be 70 fc ff ff    	lea    -0x390(%esi),%edi
    1f4b:	8d 8e 4b d7 ff ff    	lea    -0x28b5(%esi),%ecx
    1f51:	ba 18 00 00 00       	mov    $0x18,%edx
    1f56:	50                   	push   %eax
    1f57:	57                   	push   %edi
    1f58:	8d 44 24 14          	lea    0x14(%esp),%eax
    1f5c:	50                   	push   %eax
    1f5d:	e8 ae f3 ff ff       	call   1310 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    1f62:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1f65:	83 f9 09             	cmp    $0x9,%ecx
    1f68:	77 2c                	ja     1f96 <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x576>
    1f6a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f6e:	83 ec 04             	sub    $0x4,%esp
    1f71:	8d 86 e0 fc ff ff    	lea    -0x320(%esi),%eax
    1f77:	8d be 80 fc ff ff    	lea    -0x380(%esi),%edi
    1f7d:	8d 6c 24 0c          	lea    0xc(%esp),%ebp
    1f81:	8d 8e 20 e4 ff ff    	lea    -0x1be0(%esi),%ecx
    1f87:	ba 2b 00 00 00       	mov    $0x2b,%edx
    1f8c:	89 f3                	mov    %esi,%ebx
    1f8e:	50                   	push   %eax
    1f8f:	57                   	push   %edi
    1f90:	55                   	push   %ebp
    1f91:	e8 7a f3 ff ff       	call   1310 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    1f96:	b8 42 00 00 00       	mov    $0x42,%eax
    1f9b:	eb cd                	jmp    1f6a <_ZN8keyboard10handle_irq17hb631f09b94c0ef5fE+0x54a>
    1f9d:	89 f3                	mov    %esi,%ebx
    1f9f:	e8 35 f1 ff ff       	call   10d9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>
    1fa4:	66 90                	xchg   %ax,%ax
    1fa6:	66 90                	xchg   %ax,%ax
    1fa8:	66 90                	xchg   %ax,%ax
    1faa:	66 90                	xchg   %ax,%ax
    1fac:	66 90                	xchg   %ax,%ax
    1fae:	66 90                	xchg   %ax,%ax

00001fb0 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E>:
    1fb0:	53                   	push   %ebx
    1fb1:	56                   	push   %esi
    1fb2:	50                   	push   %eax
    1fb3:	89 ce                	mov    %ecx,%esi
    1fb5:	e8 00 00 00 00       	call   1fba <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0xa>
    1fba:	5b                   	pop    %ebx
    1fbb:	81 c3 3a 80 00 00    	add    $0x803a,%ebx
    1fc1:	8b 49 0c             	mov    0xc(%ecx),%ecx
    1fc4:	e8 27 48 00 00       	call   67f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    1fc9:	8b 4e 10             	mov    0x10(%esi),%ecx
    1fcc:	e8 1f 48 00 00       	call   67f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    1fd1:	83 fe ff             	cmp    $0xffffffff,%esi
    1fd4:	74 3c                	je     2012 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x62>
    1fd6:	f0 ff 4e 04          	lock decl 0x4(%esi)
    1fda:	75 36                	jne    2012 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x62>
    1fdc:	b1 01                	mov    $0x1,%cl
    1fde:	90                   	nop
    1fdf:	90                   	nop
    1fe0:	31 c0                	xor    %eax,%eax
    1fe2:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    1fe9:	00 
    1fea:	75 06                	jne    1ff2 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x42>
    1fec:	eb 11                	jmp    1fff <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x4f>
    1fee:	90                   	nop
    1fef:	90                   	nop
    1ff0:	f3 90                	pause
    1ff2:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    1ff9:	84 c0                	test   %al,%al
    1ffb:	75 f3                	jne    1ff0 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x40>
    1ffd:	eb e1                	jmp    1fe0 <_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h8ab668c117dcba90E+0x30>
    1fff:	89 f1                	mov    %esi,%ecx
    2001:	ba 1c 01 00 00       	mov    $0x11c,%edx
    2006:	e8 35 1f 00 00       	call   3f40 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE>
    200b:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    2012:	83 c4 04             	add    $0x4,%esp
    2015:	5e                   	pop    %esi
    2016:	5b                   	pop    %ebx
    2017:	c3                   	ret
    2018:	66 90                	xchg   %ax,%ax
    201a:	66 90                	xchg   %ax,%ax
    201c:	66 90                	xchg   %ax,%ax
    201e:	66 90                	xchg   %ax,%ax

00002020 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E>:
    2020:	53                   	push   %ebx
    2021:	57                   	push   %edi
    2022:	56                   	push   %esi
    2023:	83 ec 50             	sub    $0x50,%esp
    2026:	8b 1a                	mov    (%edx),%ebx
    2028:	8b 42 10             	mov    0x10(%edx),%eax
    202b:	8b 30                	mov    (%eax),%esi
    202d:	8b 78 04             	mov    0x4(%eax),%edi
    2030:	8b 40 08             	mov    0x8(%eax),%eax
    2033:	c7 44 24 2c 03 00 00 	movl   $0x3,0x2c(%esp)
    203a:	00 
    203b:	89 5c 24 30          	mov    %ebx,0x30(%esp)
    203f:	8b 5a 04             	mov    0x4(%edx),%ebx
    2042:	89 5c 24 34          	mov    %ebx,0x34(%esp)
    2046:	8b 19                	mov    (%ecx),%ebx
    2048:	89 5c 24 38          	mov    %ebx,0x38(%esp)
    204c:	8b 59 04             	mov    0x4(%ecx),%ebx
    204f:	89 5c 24 3c          	mov    %ebx,0x3c(%esp)
    2053:	8b 59 08             	mov    0x8(%ecx),%ebx
    2056:	89 5c 24 40          	mov    %ebx,0x40(%esp)
    205a:	8b 59 0c             	mov    0xc(%ecx),%ebx
    205d:	89 5c 24 44          	mov    %ebx,0x44(%esp)
    2061:	8b 59 10             	mov    0x10(%ecx),%ebx
    2064:	89 5c 24 48          	mov    %ebx,0x48(%esp)
    2068:	8b 49 14             	mov    0x14(%ecx),%ecx
    206b:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
    206f:	8b 4a 08             	mov    0x8(%edx),%ecx
    2072:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2079:	00 
    207a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    207e:	8b 4a 0c             	mov    0xc(%edx),%ecx
    2081:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2085:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    208c:	00 
    208d:	89 74 24 24          	mov    %esi,0x24(%esp)
    2091:	89 7c 24 28          	mov    %edi,0x28(%esp)
    2095:	e8 00 00 00 00       	call   209a <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0x7a>
    209a:	5b                   	pop    %ebx
    209b:	81 c3 5a 7f 00 00    	add    $0x7f5a,%ebx
    20a1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    20a8:	00 
    20a9:	89 44 24 10          	mov    %eax,0x10(%esp)
    20ad:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    20b3:	83 f8 02             	cmp    $0x2,%eax
    20b6:	74 10                	je     20c8 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xa8>
    20b8:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    20be:	75 10                	jne    20d0 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xb0>
    20c0:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    20c6:	eb 0e                	jmp    20d6 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xb6>
    20c8:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    20ce:	74 f0                	je     20c0 <_ZN3log13__private_api3log17hdf6e64cab5f2ccf3E+0xa0>
    20d0:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    20d6:	83 ec 08             	sub    $0x8,%esp
    20d9:	8d 54 24 14          	lea    0x14(%esp),%edx
    20dd:	52                   	push   %edx
    20de:	51                   	push   %ecx
    20df:	ff 50 10             	call   *0x10(%eax)
    20e2:	83 c4 60             	add    $0x60,%esp
    20e5:	5e                   	pop    %esi
    20e6:	5f                   	pop    %edi
    20e7:	5b                   	pop    %ebx
    20e8:	c3                   	ret
    20e9:	66 90                	xchg   %ax,%ax
    20eb:	66 90                	xchg   %ax,%ax
    20ed:	66 90                	xchg   %ax,%ax
    20ef:	90                   	nop

000020f0 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>:
    20f0:	53                   	push   %ebx
    20f1:	56                   	push   %esi
    20f2:	50                   	push   %eax
    20f3:	e8 00 00 00 00       	call   20f8 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0x8>
    20f8:	5b                   	pop    %ebx
    20f9:	81 c3 fc 7e 00 00    	add    $0x7efc,%ebx
    20ff:	8b 44 24 10          	mov    0x10(%esp),%eax
    2103:	8b 10                	mov    (%eax),%edx
    2105:	8d 83 df e9 ff ff    	lea    -0x1621(%ebx),%eax
    210b:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2110:	4a                   	dec    %edx
    2111:	8b 94 93 7c d3 ff ff 	mov    -0x2c84(%ebx,%edx,4),%edx
    2118:	01 da                	add    %ebx,%edx
    211a:	ff e2                	jmp    *%edx
    211c:	8d 83 eb e9 ff ff    	lea    -0x1615(%ebx),%eax
    2122:	b9 0b 00 00 00       	mov    $0xb,%ecx
    2127:	eb 69                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2129:	8d 83 34 d7 ff ff    	lea    -0x28cc(%ebx),%eax
    212f:	b9 08 00 00 00       	mov    $0x8,%ecx
    2134:	eb 5c                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2136:	8d 83 30 ea ff ff    	lea    -0x15d0(%ebx),%eax
    213c:	b9 0f 00 00 00       	mov    $0xf,%ecx
    2141:	eb 4f                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2143:	8d 83 f6 e9 ff ff    	lea    -0x160a(%ebx),%eax
    2149:	b9 0f 00 00 00       	mov    $0xf,%ecx
    214e:	eb 42                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2150:	8d 83 05 ea ff ff    	lea    -0x15fb(%ebx),%eax
    2156:	eb 3a                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2158:	8d 83 5b db ff ff    	lea    -0x24a5(%ebx),%eax
    215e:	b9 10 00 00 00       	mov    $0x10,%ecx
    2163:	eb 2d                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2165:	8d 83 3f ea ff ff    	lea    -0x15c1(%ebx),%eax
    216b:	b9 06 00 00 00       	mov    $0x6,%ecx
    2170:	eb 20                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2172:	8d 83 4b db ff ff    	lea    -0x24b5(%ebx),%eax
    2178:	b9 10 00 00 00       	mov    $0x10,%ecx
    217d:	eb 13                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    217f:	8d 83 11 ea ff ff    	lea    -0x15ef(%ebx),%eax
    2185:	eb 0b                	jmp    2192 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2187:	8d 83 1d ea ff ff    	lea    -0x15e3(%ebx),%eax
    218d:	b9 13 00 00 00       	mov    $0x13,%ecx
    2192:	8b 54 24 14          	mov    0x14(%esp),%edx
    2196:	8b 72 04             	mov    0x4(%edx),%esi
    2199:	83 ec 04             	sub    $0x4,%esp
    219c:	51                   	push   %ecx
    219d:	50                   	push   %eax
    219e:	ff 32                	push   (%edx)
    21a0:	ff 56 0c             	call   *0xc(%esi)
    21a3:	83 c4 14             	add    $0x14,%esp
    21a6:	5e                   	pop    %esi
    21a7:	5b                   	pop    %ebx
    21a8:	c3                   	ret
    21a9:	0f 0b                	ud2
    21ab:	66 90                	xchg   %ax,%ax
    21ad:	66 90                	xchg   %ax,%ax
    21af:	90                   	nop

000021b0 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E>:
    21b0:	55                   	push   %ebp
    21b1:	53                   	push   %ebx
    21b2:	57                   	push   %edi
    21b3:	56                   	push   %esi
    21b4:	83 ec 1c             	sub    $0x1c,%esp
    21b7:	e8 00 00 00 00       	call   21bc <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xc>
    21bc:	5b                   	pop    %ebx
    21bd:	81 c3 38 7e 00 00    	add    $0x7e38,%ebx
    21c3:	8b 74 24 34          	mov    0x34(%esp),%esi
    21c7:	8b 44 24 30          	mov    0x30(%esp),%eax
    21cb:	81 38 00 00 11 00    	cmpl   $0x110000,(%eax)
    21d1:	75 1c                	jne    21ef <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x3f>
    21d3:	8b 46 04             	mov    0x4(%esi),%eax
    21d6:	83 ec 04             	sub    $0x4,%esp
    21d9:	8d 8b 7a d6 ff ff    	lea    -0x2986(%ebx),%ecx
    21df:	6a 04                	push   $0x4
    21e1:	51                   	push   %ecx
    21e2:	ff 36                	push   (%esi)
    21e4:	ff 50 0c             	call   *0xc(%eax)
    21e7:	83 c4 2c             	add    $0x2c,%esp
    21ea:	e9 f8 00 00 00       	jmp    22e7 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x137>
    21ef:	8b 0e                	mov    (%esi),%ecx
    21f1:	8b 46 04             	mov    0x4(%esi),%eax
    21f4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    21f8:	8b 50 0c             	mov    0xc(%eax),%edx
    21fb:	83 ec 04             	sub    $0x4,%esp
    21fe:	8d 83 7e d6 ff ff    	lea    -0x2982(%ebx),%eax
    2204:	6a 04                	push   $0x4
    2206:	50                   	push   %eax
    2207:	89 cf                	mov    %ecx,%edi
    2209:	51                   	push   %ecx
    220a:	89 d5                	mov    %edx,%ebp
    220c:	ff d2                	call   *%edx
    220e:	83 c4 10             	add    $0x10,%esp
    2211:	b1 01                	mov    $0x1,%cl
    2213:	84 c0                	test   %al,%al
    2215:	0f 85 c7 00 00 00    	jne    22e2 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    221b:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    221f:	75 3b                	jne    225c <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xac>
    2221:	83 ec 04             	sub    $0x4,%esp
    2224:	8d 83 c6 db ff ff    	lea    -0x243a(%ebx),%eax
    222a:	6a 01                	push   $0x1
    222c:	50                   	push   %eax
    222d:	89 fe                	mov    %edi,%esi
    222f:	57                   	push   %edi
    2230:	89 ef                	mov    %ebp,%edi
    2232:	ff d5                	call   *%ebp
    2234:	83 c4 10             	add    $0x10,%esp
    2237:	84 c0                	test   %al,%al
    2239:	75 74                	jne    22af <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xff>
    223b:	83 ec 0c             	sub    $0xc,%esp
    223e:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    2242:	89 f2                	mov    %esi,%edx
    2244:	ff 74 24 18          	push   0x18(%esp)
    2248:	e8 a3 00 00 00       	call   22f0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E>
    224d:	83 c4 10             	add    $0x10,%esp
    2250:	84 c0                	test   %al,%al
    2252:	b1 01                	mov    $0x1,%cl
    2254:	0f 85 88 00 00 00    	jne    22e2 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    225a:	eb 72                	jmp    22ce <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x11e>
    225c:	83 ec 04             	sub    $0x4,%esp
    225f:	8d 83 c7 db ff ff    	lea    -0x2439(%ebx),%eax
    2265:	6a 02                	push   $0x2
    2267:	50                   	push   %eax
    2268:	89 fe                	mov    %edi,%esi
    226a:	57                   	push   %edi
    226b:	89 ef                	mov    %ebp,%edi
    226d:	ff d5                	call   *%ebp
    226f:	83 c4 10             	add    $0x10,%esp
    2272:	84 c0                	test   %al,%al
    2274:	75 39                	jne    22af <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0xff>
    2276:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    227b:	89 74 24 10          	mov    %esi,0x10(%esp)
    227f:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2283:	89 44 24 14          	mov    %eax,0x14(%esp)
    2287:	8d 44 24 0b          	lea    0xb(%esp),%eax
    228b:	89 44 24 18          	mov    %eax,0x18(%esp)
    228f:	83 ec 0c             	sub    $0xc,%esp
    2292:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    2298:	8d 6c 24 1c          	lea    0x1c(%esp),%ebp
    229c:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    22a0:	89 ea                	mov    %ebp,%edx
    22a2:	50                   	push   %eax
    22a3:	e8 48 00 00 00       	call   22f0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E>
    22a8:	83 c4 10             	add    $0x10,%esp
    22ab:	84 c0                	test   %al,%al
    22ad:	74 04                	je     22b3 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x103>
    22af:	b1 01                	mov    $0x1,%cl
    22b1:	eb 2f                	jmp    22e2 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    22b3:	83 ec 04             	sub    $0x4,%esp
    22b6:	8d 83 c1 db ff ff    	lea    -0x243f(%ebx),%eax
    22bc:	6a 02                	push   $0x2
    22be:	50                   	push   %eax
    22bf:	55                   	push   %ebp
    22c0:	e8 9b 18 00 00       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    22c5:	83 c4 10             	add    $0x10,%esp
    22c8:	84 c0                	test   %al,%al
    22ca:	b1 01                	mov    $0x1,%cl
    22cc:	75 14                	jne    22e2 <_ZN66_$LT$core..option..Option$LT$T$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8a01ea6ab674c328E+0x132>
    22ce:	83 ec 04             	sub    $0x4,%esp
    22d1:	8d 83 1a db ff ff    	lea    -0x24e6(%ebx),%eax
    22d7:	6a 01                	push   $0x1
    22d9:	50                   	push   %eax
    22da:	56                   	push   %esi
    22db:	ff d7                	call   *%edi
    22dd:	83 c4 10             	add    $0x10,%esp
    22e0:	89 c1                	mov    %eax,%ecx
    22e2:	89 c8                	mov    %ecx,%eax
    22e4:	83 c4 1c             	add    $0x1c,%esp
    22e7:	5e                   	pop    %esi
    22e8:	5f                   	pop    %edi
    22e9:	5b                   	pop    %ebx
    22ea:	5d                   	pop    %ebp
    22eb:	c3                   	ret
    22ec:	66 90                	xchg   %ax,%ax
    22ee:	66 90                	xchg   %ax,%ax

000022f0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E>:
    22f0:	55                   	push   %ebp
    22f1:	53                   	push   %ebx
    22f2:	57                   	push   %edi
    22f3:	56                   	push   %esi
    22f4:	83 ec 3c             	sub    $0x3c,%esp
    22f7:	89 d6                	mov    %edx,%esi
    22f9:	e8 00 00 00 00       	call   22fe <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0xe>
    22fe:	5b                   	pop    %ebx
    22ff:	81 c3 f6 7c 00 00    	add    $0x7cf6,%ebx
    2305:	8b 44 24 50          	mov    0x50(%esp),%eax
    2309:	8b 29                	mov    (%ecx),%ebp
    230b:	8b 78 10             	mov    0x10(%eax),%edi
    230e:	83 ec 08             	sub    $0x8,%esp
    2311:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    2315:	6a 27                	push   $0x27
    2317:	52                   	push   %edx
    2318:	ff d7                	call   *%edi
    231a:	83 c4 10             	add    $0x10,%esp
    231d:	89 c1                	mov    %eax,%ecx
    231f:	b0 01                	mov    $0x1,%al
    2321:	84 c9                	test   %cl,%cl
    2323:	0f 85 9c 03 00 00    	jne    26c5 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3d5>
    2329:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    232d:	89 7c 24 38          	mov    %edi,0x38(%esp)
    2331:	83 fd 27             	cmp    $0x27,%ebp
    2334:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    2338:	77 1b                	ja     2355 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x65>
    233a:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    233e:	8b 84 a9 84 d4 ff ff 	mov    -0x2b7c(%ecx,%ebp,4),%eax
    2345:	01 c8                	add    %ecx,%eax
    2347:	ff e0                	jmp    *%eax
    2349:	66 c7 44 24 10 5c 30 	movw   $0x305c,0x10(%esp)
    2350:	e9 0e 01 00 00       	jmp    2463 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    2355:	83 fd 5c             	cmp    $0x5c,%ebp
    2358:	75 0c                	jne    2366 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x76>
    235a:	66 c7 44 24 10 5c 5c 	movw   $0x5c5c,0x10(%esp)
    2361:	e9 fd 00 00 00       	jmp    2463 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    2366:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    236a:	81 f9 ff 02 00 00    	cmp    $0x2ff,%ecx
    2370:	0f 86 50 01 00 00    	jbe    24c6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1d6>
    2376:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    237a:	89 cf                	mov    %ecx,%edi
    237c:	e8 cf 14 00 00       	call   3850 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE>
    2381:	84 c0                	test   %al,%al
    2383:	0f 84 1d 02 00 00    	je     25a6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x2b6>
    2389:	89 f8                	mov    %edi,%eax
    238b:	83 c8 01             	or     $0x1,%eax
    238e:	0f bd c8             	bsr    %eax,%ecx
    2391:	83 f1 1c             	xor    $0x1c,%ecx
    2394:	c1 e9 02             	shr    $0x2,%ecx
    2397:	8d 71 fe             	lea    -0x2(%ecx),%esi
    239a:	c6 44 24 22 00       	movb   $0x0,0x22(%esp)
    239f:	66 c7 44 24 20 00 00 	movw   $0x0,0x20(%esp)
    23a6:	89 f8                	mov    %edi,%eax
    23a8:	c1 e8 14             	shr    $0x14,%eax
    23ab:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    23b2:	ff 
    23b3:	88 44 24 23          	mov    %al,0x23(%esp)
    23b7:	89 f8                	mov    %edi,%eax
    23b9:	c1 e8 10             	shr    $0x10,%eax
    23bc:	83 e0 0f             	and    $0xf,%eax
    23bf:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    23c6:	ff 
    23c7:	88 44 24 24          	mov    %al,0x24(%esp)
    23cb:	89 f8                	mov    %edi,%eax
    23cd:	c1 e8 0c             	shr    $0xc,%eax
    23d0:	83 e0 0f             	and    $0xf,%eax
    23d3:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    23da:	ff 
    23db:	88 44 24 25          	mov    %al,0x25(%esp)
    23df:	89 f8                	mov    %edi,%eax
    23e1:	c1 e8 08             	shr    $0x8,%eax
    23e4:	83 e0 0f             	and    $0xf,%eax
    23e7:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    23ee:	ff 
    23ef:	88 44 24 26          	mov    %al,0x26(%esp)
    23f3:	89 f8                	mov    %edi,%eax
    23f5:	c1 e8 04             	shr    $0x4,%eax
    23f8:	83 e0 0f             	and    $0xf,%eax
    23fb:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    2402:	ff 
    2403:	88 44 24 27          	mov    %al,0x27(%esp)
    2407:	83 e7 0f             	and    $0xf,%edi
    240a:	0f b6 84 3b 1b db ff 	movzbl -0x24e5(%ebx,%edi,1),%eax
    2411:	ff 
    2412:	88 44 24 28          	mov    %al,0x28(%esp)
    2416:	c6 44 24 29 7d       	movb   $0x7d,0x29(%esp)
    241b:	66 c7 44 0c 1e 5c 75 	movw   $0x755c,0x1e(%esp,%ecx,1)
    2422:	c6 44 0c 20 7b       	movb   $0x7b,0x20(%esp,%ecx,1)
    2427:	8b 44 24 20          	mov    0x20(%esp),%eax
    242b:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    242f:	89 44 24 10          	mov    %eax,0x10(%esp)
    2433:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2437:	0f b7 44 24 28       	movzwl 0x28(%esp),%eax
    243c:	e9 49 01 00 00       	jmp    258a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x29a>
    2441:	66 c7 44 24 10 5c 74 	movw   $0x745c,0x10(%esp)
    2448:	eb 19                	jmp    2463 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    244a:	66 c7 44 24 10 5c 27 	movw   $0x275c,0x10(%esp)
    2451:	eb 10                	jmp    2463 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    2453:	66 c7 44 24 10 5c 6e 	movw   $0x6e5c,0x10(%esp)
    245a:	eb 07                	jmp    2463 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x173>
    245c:	66 c7 44 24 10 5c 72 	movw   $0x725c,0x10(%esp)
    2463:	c7 44 24 16 00 00 00 	movl   $0x0,0x16(%esp)
    246a:	00 
    246b:	c7 44 24 12 00 00 00 	movl   $0x0,0x12(%esp)
    2472:	00 
    2473:	31 d2                	xor    %edx,%edx
    2475:	b9 02 00 00 00       	mov    $0x2,%ecx
    247a:	c6 44 24 0c 02       	movb   $0x2,0xc(%esp)
    247f:	31 c0                	xor    %eax,%eax
    2481:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    2485:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2489:	88 54 24 1a          	mov    %dl,0x1a(%esp)
    248d:	0f b6 54 24 0c       	movzbl 0xc(%esp),%edx
    2492:	88 54 24 1b          	mov    %dl,0x1b(%esp)
    2496:	80 7c 24 10 80       	cmpb   $0x80,0x10(%esp)
    249b:	8b 7c 24 38          	mov    0x38(%esp),%edi
    249f:	8b 54 24 50          	mov    0x50(%esp),%edx
    24a3:	75 09                	jne    24ae <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1be>
    24a5:	8b 44 24 14          	mov    0x14(%esp),%eax
    24a9:	e9 fa 01 00 00       	jmp    26a8 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3b8>
    24ae:	0f b6 c0             	movzbl %al,%eax
    24b1:	29 c1                	sub    %eax,%ecx
    24b3:	01 e0                	add    %esp,%eax
    24b5:	83 c0 10             	add    $0x10,%eax
    24b8:	83 ec 04             	sub    $0x4,%esp
    24bb:	51                   	push   %ecx
    24bc:	50                   	push   %eax
    24bd:	56                   	push   %esi
    24be:	ff 52 0c             	call   *0xc(%edx)
    24c1:	e9 e9 01 00 00       	jmp    26af <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3bf>
    24c6:	83 f9 20             	cmp    $0x20,%ecx
    24c9:	0f 83 b9 01 00 00    	jae    2688 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x398>
    24cf:	8b 54 24 0c          	mov    0xc(%esp),%edx
    24d3:	89 d0                	mov    %edx,%eax
    24d5:	83 c8 01             	or     $0x1,%eax
    24d8:	0f bd c8             	bsr    %eax,%ecx
    24db:	83 f1 1c             	xor    $0x1c,%ecx
    24de:	c1 e9 02             	shr    $0x2,%ecx
    24e1:	8d 71 fe             	lea    -0x2(%ecx),%esi
    24e4:	c6 44 24 2e 00       	movb   $0x0,0x2e(%esp)
    24e9:	66 c7 44 24 2c 00 00 	movw   $0x0,0x2c(%esp)
    24f0:	89 d0                	mov    %edx,%eax
    24f2:	c1 e8 14             	shr    $0x14,%eax
    24f5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    24f9:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    2500:	ff 
    2501:	88 44 24 2f          	mov    %al,0x2f(%esp)
    2505:	89 d0                	mov    %edx,%eax
    2507:	c1 e8 10             	shr    $0x10,%eax
    250a:	83 e0 0f             	and    $0xf,%eax
    250d:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    2514:	ff 
    2515:	88 44 24 30          	mov    %al,0x30(%esp)
    2519:	89 d0                	mov    %edx,%eax
    251b:	c1 e8 0c             	shr    $0xc,%eax
    251e:	83 e0 0f             	and    $0xf,%eax
    2521:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    2528:	ff 
    2529:	88 44 24 31          	mov    %al,0x31(%esp)
    252d:	89 d0                	mov    %edx,%eax
    252f:	c1 e8 08             	shr    $0x8,%eax
    2532:	83 e0 0f             	and    $0xf,%eax
    2535:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    253c:	ff 
    253d:	88 44 24 32          	mov    %al,0x32(%esp)
    2541:	89 d0                	mov    %edx,%eax
    2543:	c1 e8 04             	shr    $0x4,%eax
    2546:	83 e0 0f             	and    $0xf,%eax
    2549:	0f b6 84 03 1b db ff 	movzbl -0x24e5(%ebx,%eax,1),%eax
    2550:	ff 
    2551:	88 44 24 33          	mov    %al,0x33(%esp)
    2555:	83 e2 0f             	and    $0xf,%edx
    2558:	0f b6 84 13 1b db ff 	movzbl -0x24e5(%ebx,%edx,1),%eax
    255f:	ff 
    2560:	88 44 24 34          	mov    %al,0x34(%esp)
    2564:	c6 44 24 35 7d       	movb   $0x7d,0x35(%esp)
    2569:	66 c7 44 0c 2a 5c 75 	movw   $0x755c,0x2a(%esp,%ecx,1)
    2570:	c6 44 0c 2c 7b       	movb   $0x7b,0x2c(%esp,%ecx,1)
    2575:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    2579:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    257d:	89 44 24 10          	mov    %eax,0x10(%esp)
    2581:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2585:	0f b7 44 24 34       	movzwl 0x34(%esp),%eax
    258a:	66 89 44 24 18       	mov    %ax,0x18(%esp)
    258f:	b9 0a 00 00 00       	mov    $0xa,%ecx
    2594:	c6 44 24 0c 0a       	movb   $0xa,0xc(%esp)
    2599:	89 f2                	mov    %esi,%edx
    259b:	89 f0                	mov    %esi,%eax
    259d:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    25a1:	e9 e3 fe ff ff       	jmp    2489 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x199>
    25a6:	81 ff 00 00 01 00    	cmp    $0x10000,%edi
    25ac:	0f 82 1b 01 00 00    	jb     26cd <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3dd>
    25b2:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    25b6:	81 ff 00 00 02 00    	cmp    $0x20000,%edi
    25bc:	0f 83 e0 01 00 00    	jae    27a2 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4b2>
    25c2:	31 c9                	xor    %ecx,%ecx
    25c4:	31 db                	xor    %ebx,%ebx
    25c6:	89 de                	mov    %ebx,%esi
    25c8:	8b 7c 24 08          	mov    0x8(%esp),%edi
    25cc:	0f b6 ac 1f 0c dd ff 	movzbl -0x22f4(%edi,%ebx,1),%ebp
    25d3:	ff 
    25d4:	83 c3 02             	add    $0x2,%ebx
    25d7:	8d 14 29             	lea    (%ecx,%ebp,1),%edx
    25da:	8b 44 24 0c          	mov    0xc(%esp),%eax
    25de:	38 a4 37 0b dd ff ff 	cmp    %ah,-0x22f5(%edi,%esi,1)
    25e5:	75 3a                	jne    2621 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x331>
    25e7:	39 ca                	cmp    %ecx,%edx
    25e9:	0f 82 56 02 00 00    	jb     2845 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x555>
    25ef:	81 fa d0 00 00 00    	cmp    $0xd0,%edx
    25f5:	0f 87 63 02 00 00    	ja     285e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x56e>
    25fb:	8b 44 24 08          	mov    0x8(%esp),%eax
    25ff:	8d 34 08             	lea    (%eax,%ecx,1),%esi
    2602:	81 c6 63 dd ff ff    	add    $0xffffdd63,%esi
    2608:	31 c0                	xor    %eax,%eax
    260a:	39 c5                	cmp    %eax,%ebp
    260c:	74 15                	je     2623 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x333>
    260e:	8d 78 01             	lea    0x1(%eax),%edi
    2611:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    2615:	38 0c 06             	cmp    %cl,(%esi,%eax,1)
    2618:	89 f8                	mov    %edi,%eax
    261a:	75 ee                	jne    260a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x31a>
    261c:	e9 ae fe ff ff       	jmp    24cf <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    2621:	77 07                	ja     262a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x33a>
    2623:	89 d1                	mov    %edx,%ecx
    2625:	83 fb 58             	cmp    $0x58,%ebx
    2628:	75 9c                	jne    25c6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x2d6>
    262a:	0f b7 4c 24 0c       	movzwl 0xc(%esp),%ecx
    262f:	31 d2                	xor    %edx,%edx
    2631:	b3 01                	mov    $0x1,%bl
    2633:	8b 74 24 08          	mov    0x8(%esp),%esi
    2637:	8d 42 01             	lea    0x1(%edx),%eax
    263a:	0f be ac 16 33 de ff 	movsbl -0x21cd(%esi,%edx,1),%ebp
    2641:	ff 
    2642:	85 ed                	test   %ebp,%ebp
    2644:	78 04                	js     264a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x35a>
    2646:	89 c2                	mov    %eax,%edx
    2648:	eb 22                	jmp    266c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x37c>
    264a:	3d e6 01 00 00       	cmp    $0x1e6,%eax
    264f:	0f 84 19 02 00 00    	je     286e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x57e>
    2655:	8b 44 24 08          	mov    0x8(%esp),%eax
    2659:	0f b6 84 10 34 de ff 	movzbl -0x21cc(%eax,%edx,1),%eax
    2660:	ff 
    2661:	83 c2 02             	add    $0x2,%edx
    2664:	83 e5 7f             	and    $0x7f,%ebp
    2667:	c1 e5 08             	shl    $0x8,%ebp
    266a:	09 c5                	or     %eax,%ebp
    266c:	29 e9                	sub    %ebp,%ecx
    266e:	0f 88 20 01 00 00    	js     2794 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4a4>
    2674:	80 f3 01             	xor    $0x1,%bl
    2677:	81 fa e6 01 00 00    	cmp    $0x1e6,%edx
    267d:	8b 74 24 08          	mov    0x8(%esp),%esi
    2681:	75 b4                	jne    2637 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x347>
    2683:	e9 0c 01 00 00       	jmp    2794 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4a4>
    2688:	83 7c 24 0c 7f       	cmpl   $0x7f,0xc(%esp)
    268d:	73 3e                	jae    26cd <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3dd>
    268f:	c6 44 24 10 80       	movb   $0x80,0x10(%esp)
    2694:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2698:	89 44 24 14          	mov    %eax,0x14(%esp)
    269c:	8b 7c 24 38          	mov    0x38(%esp),%edi
    26a0:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    26a4:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    26a8:	83 ec 08             	sub    $0x8,%esp
    26ab:	50                   	push   %eax
    26ac:	56                   	push   %esi
    26ad:	ff d7                	call   *%edi
    26af:	83 c4 10             	add    $0x10,%esp
    26b2:	89 c1                	mov    %eax,%ecx
    26b4:	b0 01                	mov    $0x1,%al
    26b6:	84 c9                	test   %cl,%cl
    26b8:	75 0b                	jne    26c5 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3d5>
    26ba:	83 ec 08             	sub    $0x8,%esp
    26bd:	6a 27                	push   $0x27
    26bf:	56                   	push   %esi
    26c0:	ff d7                	call   *%edi
    26c2:	83 c4 10             	add    $0x10,%esp
    26c5:	83 c4 3c             	add    $0x3c,%esp
    26c8:	5e                   	pop    %esi
    26c9:	5f                   	pop    %edi
    26ca:	5b                   	pop    %ebx
    26cb:	5d                   	pop    %ebp
    26cc:	c3                   	ret
    26cd:	31 c9                	xor    %ecx,%ecx
    26cf:	31 db                	xor    %ebx,%ebx
    26d1:	89 de                	mov    %ebx,%esi
    26d3:	8b 7c 24 08          	mov    0x8(%esp),%edi
    26d7:	0f b6 ac 1f 1a e0 ff 	movzbl -0x1fe6(%edi,%ebx,1),%ebp
    26de:	ff 
    26df:	83 c3 02             	add    $0x2,%ebx
    26e2:	8d 14 29             	lea    (%ecx,%ebp,1),%edx
    26e5:	8b 44 24 0c          	mov    0xc(%esp),%eax
    26e9:	38 a4 37 19 e0 ff ff 	cmp    %ah,-0x1fe7(%edi,%esi,1)
    26f0:	75 45                	jne    2737 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x447>
    26f2:	39 ca                	cmp    %ecx,%edx
    26f4:	0f 82 4b 01 00 00    	jb     2845 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x555>
    26fa:	81 fa 22 01 00 00    	cmp    $0x122,%edx
    2700:	0f 87 48 01 00 00    	ja     284e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x55e>
    2706:	8b 44 24 08          	mov    0x8(%esp),%eax
    270a:	8d 34 08             	lea    (%eax,%ecx,1),%esi
    270d:	81 c6 69 e0 ff ff    	add    $0xffffe069,%esi
    2713:	31 c0                	xor    %eax,%eax
    2715:	90                   	nop
    2716:	90                   	nop
    2717:	90                   	nop
    2718:	90                   	nop
    2719:	90                   	nop
    271a:	90                   	nop
    271b:	90                   	nop
    271c:	90                   	nop
    271d:	90                   	nop
    271e:	90                   	nop
    271f:	90                   	nop
    2720:	39 c5                	cmp    %eax,%ebp
    2722:	74 15                	je     2739 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x449>
    2724:	8d 78 01             	lea    0x1(%eax),%edi
    2727:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    272b:	38 0c 06             	cmp    %cl,(%esi,%eax,1)
    272e:	89 f8                	mov    %edi,%eax
    2730:	75 ee                	jne    2720 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x430>
    2732:	e9 98 fd ff ff       	jmp    24cf <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    2737:	77 07                	ja     2740 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x450>
    2739:	89 d1                	mov    %edx,%ecx
    273b:	83 fb 50             	cmp    $0x50,%ebx
    273e:	75 91                	jne    26d1 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x3e1>
    2740:	31 c0                	xor    %eax,%eax
    2742:	b3 01                	mov    $0x1,%bl
    2744:	8b 54 24 0c          	mov    0xc(%esp),%edx
    2748:	8b 74 24 08          	mov    0x8(%esp),%esi
    274c:	8d 48 01             	lea    0x1(%eax),%ecx
    274f:	0f be ac 06 8b e1 ff 	movsbl -0x1e75(%esi,%eax,1),%ebp
    2756:	ff 
    2757:	85 ed                	test   %ebp,%ebp
    2759:	78 04                	js     275f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x46f>
    275b:	89 c8                	mov    %ecx,%eax
    275d:	eb 23                	jmp    2782 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x492>
    275f:	81 f9 29 01 00 00    	cmp    $0x129,%ecx
    2765:	0f 84 03 01 00 00    	je     286e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x57e>
    276b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    276f:	0f b6 8c 01 8c e1 ff 	movzbl -0x1e74(%ecx,%eax,1),%ecx
    2776:	ff 
    2777:	83 c0 02             	add    $0x2,%eax
    277a:	83 e5 7f             	and    $0x7f,%ebp
    277d:	c1 e5 08             	shl    $0x8,%ebp
    2780:	09 cd                	or     %ecx,%ebp
    2782:	29 ea                	sub    %ebp,%edx
    2784:	78 0e                	js     2794 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x4a4>
    2786:	80 f3 01             	xor    $0x1,%bl
    2789:	3d 29 01 00 00       	cmp    $0x129,%eax
    278e:	8b 74 24 08          	mov    0x8(%esp),%esi
    2792:	75 b8                	jne    274c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x45c>
    2794:	f6 c3 01             	test   $0x1,%bl
    2797:	0f 84 32 fd ff ff    	je     24cf <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    279d:	e9 ed fe ff ff       	jmp    268f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x39f>
    27a2:	89 f8                	mov    %edi,%eax
    27a4:	25 e0 ff 1f 00       	and    $0x1fffe0,%eax
    27a9:	3d e0 a6 02 00       	cmp    $0x2a6e0,%eax
    27ae:	0f 95 c0             	setne  %al
    27b1:	8d 8f c0 48 fd ff    	lea    -0x2b740(%edi),%ecx
    27b7:	83 f9 fa             	cmp    $0xfffffffa,%ecx
    27ba:	0f 92 c1             	setb   %cl
    27bd:	89 fa                	mov    %edi,%edx
    27bf:	81 e2 fe ff 1f 00    	and    $0x1ffffe,%edx
    27c5:	81 fa 1e b8 02 00    	cmp    $0x2b81e,%edx
    27cb:	0f 95 c2             	setne  %dl
    27ce:	20 c2                	and    %al,%dl
    27d0:	8d 87 50 31 fd ff    	lea    -0x2ceb0(%edi),%eax
    27d6:	83 f8 f2             	cmp    $0xfffffff2,%eax
    27d9:	0f 92 c0             	setb   %al
    27dc:	20 c8                	and    %cl,%al
    27de:	20 d0                	and    %dl,%al
    27e0:	8d 8f 10 14 fd ff    	lea    -0x2ebf0(%edi),%ecx
    27e6:	83 f9 f1             	cmp    $0xfffffff1,%ecx
    27e9:	0f 92 c1             	setb   %cl
    27ec:	8d 97 00 08 fd ff    	lea    -0x2f800(%edi),%edx
    27f2:	81 fa 5e f6 ff ff    	cmp    $0xfffff65e,%edx
    27f8:	0f 92 c2             	setb   %dl
    27fb:	20 ca                	and    %cl,%dl
    27fd:	8d 8f 00 00 fd ff    	lea    -0x30000(%edi),%ecx
    2803:	81 f9 1e fa ff ff    	cmp    $0xfffffa1e,%ecx
    2809:	0f 92 c1             	setb   %cl
    280c:	20 d1                	and    %dl,%cl
    280e:	20 c1                	and    %al,%cl
    2810:	8d 87 b0 ec fc ff    	lea    -0x31350(%edi),%eax
    2816:	83 f8 fb             	cmp    $0xfffffffb,%eax
    2819:	0f 92 c0             	setb   %al
    281c:	8d 97 00 ff f1 ff    	lea    -0xe0100(%edi),%edx
    2822:	81 fa b0 22 f5 ff    	cmp    $0xfff522b0,%edx
    2828:	0f 92 c2             	setb   %dl
    282b:	20 c2                	and    %al,%dl
    282d:	20 ca                	and    %cl,%dl
    282f:	81 ff f0 01 0e 00    	cmp    $0xe01f0,%edi
    2835:	0f 92 c0             	setb   %al
    2838:	84 c2                	test   %al,%dl
    283a:	0f 84 8f fc ff ff    	je     24cf <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x1df>
    2840:	e9 4a fe ff ff       	jmp    268f <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h049a902c9901dd67E+0x39f>
    2845:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2849:	e8 02 ea ff ff       	call   1250 <_ZN4core5slice5index22slice_index_order_fail17h3a5e48f4441e7556E>
    284e:	89 d1                	mov    %edx,%ecx
    2850:	ba 22 01 00 00       	mov    $0x122,%edx
    2855:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2859:	e8 12 e9 ff ff       	call   1170 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E>
    285e:	89 d1                	mov    %edx,%ecx
    2860:	ba d0 00 00 00       	mov    $0xd0,%edx
    2865:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2869:	e8 02 e9 ff ff       	call   1170 <_ZN4core5slice5index24slice_end_index_len_fail17hf6067e6df4b8d597E>
    286e:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    2872:	8d 8b b0 fd ff ff    	lea    -0x250(%ebx),%ecx
    2878:	e8 f3 e9 ff ff       	call   1270 <_ZN4core6option13unwrap_failed17h1dfb8fb8ddfcbd94E>
    287d:	66 90                	xchg   %ax,%ax
    287f:	90                   	nop

00002880 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E>:
    2880:	55                   	push   %ebp
    2881:	53                   	push   %ebx
    2882:	57                   	push   %edi
    2883:	56                   	push   %esi
    2884:	83 ec 2c             	sub    $0x2c,%esp
    2887:	e8 00 00 00 00       	call   288c <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xc>
    288c:	5b                   	pop    %ebx
    288d:	81 c3 68 77 00 00    	add    $0x7768,%ebx
    2893:	8b 6c 24 44          	mov    0x44(%esp),%ebp
    2897:	8b 44 24 40          	mov    0x40(%esp),%eax
    289b:	83 38 00             	cmpl   $0x0,(%eax)
    289e:	74 6a                	je     290a <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x8a>
    28a0:	8b 75 00             	mov    0x0(%ebp),%esi
    28a3:	8b 7d 04             	mov    0x4(%ebp),%edi
    28a6:	8b 4f 0c             	mov    0xc(%edi),%ecx
    28a9:	83 ec 04             	sub    $0x4,%esp
    28ac:	8d 83 8e d6 ff ff    	lea    -0x2972(%ebx),%eax
    28b2:	6a 0d                	push   $0xd
    28b4:	50                   	push   %eax
    28b5:	56                   	push   %esi
    28b6:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    28ba:	ff d1                	call   *%ecx
    28bc:	83 c4 10             	add    $0x10,%esp
    28bf:	b1 01                	mov    $0x1,%cl
    28c1:	84 c0                	test   %al,%al
    28c3:	0f 85 f8 00 00 00    	jne    29c1 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    28c9:	f6 45 0a 80          	testb  $0x80,0xa(%ebp)
    28cd:	75 58                	jne    2927 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xa7>
    28cf:	83 ec 04             	sub    $0x4,%esp
    28d2:	8d 83 c6 db ff ff    	lea    -0x243a(%ebx),%eax
    28d8:	6a 01                	push   $0x1
    28da:	50                   	push   %eax
    28db:	56                   	push   %esi
    28dc:	ff 54 24 1c          	call   *0x1c(%esp)
    28e0:	83 c4 10             	add    $0x10,%esp
    28e3:	84 c0                	test   %al,%al
    28e5:	0f 85 a1 00 00 00    	jne    298c <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x10c>
    28eb:	83 ec 08             	sub    $0x8,%esp
    28ee:	55                   	push   %ebp
    28ef:	ff 74 24 4c          	push   0x4c(%esp)
    28f3:	e8 f8 f7 ff ff       	call   20f0 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>
    28f8:	83 c4 10             	add    $0x10,%esp
    28fb:	84 c0                	test   %al,%al
    28fd:	b1 01                	mov    $0x1,%cl
    28ff:	0f 85 bc 00 00 00    	jne    29c1 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    2905:	e9 a1 00 00 00       	jmp    29ab <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x12b>
    290a:	8b 45 04             	mov    0x4(%ebp),%eax
    290d:	83 ec 04             	sub    $0x4,%esp
    2910:	8d 8b df e9 ff ff    	lea    -0x1621(%ebx),%ecx
    2916:	6a 0c                	push   $0xc
    2918:	51                   	push   %ecx
    2919:	ff 75 00             	push   0x0(%ebp)
    291c:	ff 50 0c             	call   *0xc(%eax)
    291f:	83 c4 3c             	add    $0x3c,%esp
    2922:	e9 9f 00 00 00       	jmp    29c6 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x146>
    2927:	83 ec 04             	sub    $0x4,%esp
    292a:	8d 83 c7 db ff ff    	lea    -0x2439(%ebx),%eax
    2930:	6a 02                	push   $0x2
    2932:	50                   	push   %eax
    2933:	56                   	push   %esi
    2934:	ff 54 24 1c          	call   *0x1c(%esp)
    2938:	83 c4 10             	add    $0x10,%esp
    293b:	84 c0                	test   %al,%al
    293d:	75 4d                	jne    298c <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x10c>
    293f:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    2944:	89 74 24 10          	mov    %esi,0x10(%esp)
    2948:	89 7c 24 14          	mov    %edi,0x14(%esp)
    294c:	8d 44 24 0b          	lea    0xb(%esp),%eax
    2950:	89 44 24 18          	mov    %eax,0x18(%esp)
    2954:	8b 45 08             	mov    0x8(%ebp),%eax
    2957:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    295a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    295e:	89 44 24 24          	mov    %eax,0x24(%esp)
    2962:	8d 7c 24 10          	lea    0x10(%esp),%edi
    2966:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    296a:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    2970:	89 44 24 20          	mov    %eax,0x20(%esp)
    2974:	83 ec 08             	sub    $0x8,%esp
    2977:	8d 44 24 24          	lea    0x24(%esp),%eax
    297b:	50                   	push   %eax
    297c:	ff 74 24 4c          	push   0x4c(%esp)
    2980:	e8 6b f7 ff ff       	call   20f0 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>
    2985:	83 c4 10             	add    $0x10,%esp
    2988:	84 c0                	test   %al,%al
    298a:	74 04                	je     2990 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x110>
    298c:	b1 01                	mov    $0x1,%cl
    298e:	eb 31                	jmp    29c1 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    2990:	83 ec 04             	sub    $0x4,%esp
    2993:	8d 83 c1 db ff ff    	lea    -0x243f(%ebx),%eax
    2999:	6a 02                	push   $0x2
    299b:	50                   	push   %eax
    299c:	57                   	push   %edi
    299d:	e8 be 11 00 00       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    29a2:	83 c4 10             	add    $0x10,%esp
    29a5:	84 c0                	test   %al,%al
    29a7:	b1 01                	mov    $0x1,%cl
    29a9:	75 16                	jne    29c1 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x141>
    29ab:	83 ec 04             	sub    $0x4,%esp
    29ae:	8d 83 1a db ff ff    	lea    -0x24e6(%ebx),%eax
    29b4:	6a 01                	push   $0x1
    29b6:	50                   	push   %eax
    29b7:	56                   	push   %esi
    29b8:	ff 54 24 1c          	call   *0x1c(%esp)
    29bc:	83 c4 10             	add    $0x10,%esp
    29bf:	89 c1                	mov    %eax,%ecx
    29c1:	89 c8                	mov    %ecx,%eax
    29c3:	83 c4 2c             	add    $0x2c,%esp
    29c6:	5e                   	pop    %esi
    29c7:	5f                   	pop    %edi
    29c8:	5b                   	pop    %ebx
    29c9:	5d                   	pop    %ebp
    29ca:	c3                   	ret
    29cb:	66 90                	xchg   %ax,%ax
    29cd:	66 90                	xchg   %ax,%ax
    29cf:	90                   	nop

000029d0 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E>:
    29d0:	55                   	push   %ebp
    29d1:	53                   	push   %ebx
    29d2:	57                   	push   %edi
    29d3:	56                   	push   %esi
    29d4:	83 ec 2c             	sub    $0x2c,%esp
    29d7:	e8 00 00 00 00       	call   29dc <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xc>
    29dc:	5b                   	pop    %ebx
    29dd:	81 c3 18 76 00 00    	add    $0x7618,%ebx
    29e3:	8b 74 24 44          	mov    0x44(%esp),%esi
    29e7:	8b 3e                	mov    (%esi),%edi
    29e9:	8b 6e 04             	mov    0x4(%esi),%ebp
    29ec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    29ef:	83 ec 04             	sub    $0x4,%esp
    29f2:	8d 83 6c d6 ff ff    	lea    -0x2994(%ebx),%eax
    29f8:	6a 0e                	push   $0xe
    29fa:	50                   	push   %eax
    29fb:	57                   	push   %edi
    29fc:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2a00:	ff d1                	call   *%ecx
    2a02:	83 c4 10             	add    $0x10,%esp
    2a05:	b1 01                	mov    $0x1,%cl
    2a07:	84 c0                	test   %al,%al
    2a09:	0f 85 e3 00 00 00    	jne    2af2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2a0f:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    2a13:	75 40                	jne    2a55 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x85>
    2a15:	83 ec 04             	sub    $0x4,%esp
    2a18:	8d 83 c6 db ff ff    	lea    -0x243a(%ebx),%eax
    2a1e:	6a 01                	push   $0x1
    2a20:	50                   	push   %eax
    2a21:	57                   	push   %edi
    2a22:	ff 54 24 1c          	call   *0x1c(%esp)
    2a26:	83 c4 10             	add    $0x10,%esp
    2a29:	84 c0                	test   %al,%al
    2a2b:	0f 85 8c 00 00 00    	jne    2abd <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    2a31:	83 ec 0c             	sub    $0xc,%esp
    2a34:	8d 93 1e e4 ff ff    	lea    -0x1be2(%ebx),%edx
    2a3a:	89 f1                	mov    %esi,%ecx
    2a3c:	6a 02                	push   $0x2
    2a3e:	e8 cd 04 00 00       	call   2f10 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    2a43:	83 c4 10             	add    $0x10,%esp
    2a46:	84 c0                	test   %al,%al
    2a48:	b1 01                	mov    $0x1,%cl
    2a4a:	0f 84 8c 00 00 00    	je     2adc <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x10c>
    2a50:	e9 9d 00 00 00       	jmp    2af2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2a55:	83 ec 04             	sub    $0x4,%esp
    2a58:	8d 83 c7 db ff ff    	lea    -0x2439(%ebx),%eax
    2a5e:	6a 02                	push   $0x2
    2a60:	50                   	push   %eax
    2a61:	57                   	push   %edi
    2a62:	ff 54 24 1c          	call   *0x1c(%esp)
    2a66:	83 c4 10             	add    $0x10,%esp
    2a69:	84 c0                	test   %al,%al
    2a6b:	75 50                	jne    2abd <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    2a6d:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    2a72:	89 7c 24 10          	mov    %edi,0x10(%esp)
    2a76:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    2a7a:	8d 44 24 0b          	lea    0xb(%esp),%eax
    2a7e:	89 44 24 18          	mov    %eax,0x18(%esp)
    2a82:	8b 46 08             	mov    0x8(%esi),%eax
    2a85:	8b 4e 0c             	mov    0xc(%esi),%ecx
    2a88:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    2a8c:	89 44 24 24          	mov    %eax,0x24(%esp)
    2a90:	8d 74 24 10          	lea    0x10(%esp),%esi
    2a94:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    2a98:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    2a9e:	89 44 24 20          	mov    %eax,0x20(%esp)
    2aa2:	83 ec 0c             	sub    $0xc,%esp
    2aa5:	8d 93 1e e4 ff ff    	lea    -0x1be2(%ebx),%edx
    2aab:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    2aaf:	6a 02                	push   $0x2
    2ab1:	e8 5a 04 00 00       	call   2f10 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    2ab6:	83 c4 10             	add    $0x10,%esp
    2ab9:	84 c0                	test   %al,%al
    2abb:	74 04                	je     2ac1 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xf1>
    2abd:	b1 01                	mov    $0x1,%cl
    2abf:	eb 31                	jmp    2af2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2ac1:	83 ec 04             	sub    $0x4,%esp
    2ac4:	8d 83 c1 db ff ff    	lea    -0x243f(%ebx),%eax
    2aca:	6a 02                	push   $0x2
    2acc:	50                   	push   %eax
    2acd:	56                   	push   %esi
    2ace:	e8 8d 10 00 00       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    2ad3:	83 c4 10             	add    $0x10,%esp
    2ad6:	84 c0                	test   %al,%al
    2ad8:	b1 01                	mov    $0x1,%cl
    2ada:	75 16                	jne    2af2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2adc:	83 ec 04             	sub    $0x4,%esp
    2adf:	8d 83 1a db ff ff    	lea    -0x24e6(%ebx),%eax
    2ae5:	6a 01                	push   $0x1
    2ae7:	50                   	push   %eax
    2ae8:	57                   	push   %edi
    2ae9:	ff 54 24 1c          	call   *0x1c(%esp)
    2aed:	83 c4 10             	add    $0x10,%esp
    2af0:	89 c1                	mov    %eax,%ecx
    2af2:	89 c8                	mov    %ecx,%eax
    2af4:	83 c4 2c             	add    $0x2c,%esp
    2af7:	5e                   	pop    %esi
    2af8:	5f                   	pop    %edi
    2af9:	5b                   	pop    %ebx
    2afa:	5d                   	pop    %ebp
    2afb:	c3                   	ret
    2afc:	66 90                	xchg   %ax,%ax
    2afe:	66 90                	xchg   %ax,%ax

00002b00 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>:
    2b00:	55                   	push   %ebp
    2b01:	53                   	push   %ebx
    2b02:	57                   	push   %edi
    2b03:	56                   	push   %esi
    2b04:	83 ec 1c             	sub    $0x1c,%esp
    2b07:	e8 00 00 00 00       	call   2b0c <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xc>
    2b0c:	5b                   	pop    %ebx
    2b0d:	81 c3 e8 74 00 00    	add    $0x74e8,%ebx
    2b13:	8b 44 24 30          	mov    0x30(%esp),%eax
    2b17:	8b 08                	mov    (%eax),%ecx
    2b19:	b8 0a 00 00 00       	mov    $0xa,%eax
    2b1e:	89 ca                	mov    %ecx,%edx
    2b20:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2b24:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
    2b2a:	72 64                	jb     2b90 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0x90>
    2b2c:	bd 0a 00 00 00       	mov    $0xa,%ebp
    2b31:	8b 74 24 0c          	mov    0xc(%esp),%esi
    2b35:	90                   	nop
    2b36:	90                   	nop
    2b37:	90                   	nop
    2b38:	90                   	nop
    2b39:	90                   	nop
    2b3a:	90                   	nop
    2b3b:	90                   	nop
    2b3c:	90                   	nop
    2b3d:	90                   	nop
    2b3e:	90                   	nop
    2b3f:	90                   	nop
    2b40:	89 f0                	mov    %esi,%eax
    2b42:	b9 59 17 b7 d1       	mov    $0xd1b71759,%ecx
    2b47:	f7 e1                	mul    %ecx
    2b49:	c1 ea 0d             	shr    $0xd,%edx
    2b4c:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    2b52:	89 f1                	mov    %esi,%ecx
    2b54:	29 c1                	sub    %eax,%ecx
    2b56:	69 c1 7b 14 00 00    	imul   $0x147b,%ecx,%eax
    2b5c:	c1 e8 13             	shr    $0x13,%eax
    2b5f:	6b f8 64             	imul   $0x64,%eax,%edi
    2b62:	29 f9                	sub    %edi,%ecx
    2b64:	0f b7 84 43 cb db ff 	movzwl -0x2435(%ebx,%eax,2),%eax
    2b6b:	ff 
    2b6c:	66 89 44 2c 0e       	mov    %ax,0xe(%esp,%ebp,1)
    2b71:	0f b7 c1             	movzwl %cx,%eax
    2b74:	0f b7 84 43 cb db ff 	movzwl -0x2435(%ebx,%eax,2),%eax
    2b7b:	ff 
    2b7c:	66 89 44 2c 10       	mov    %ax,0x10(%esp,%ebp,1)
    2b81:	8d 45 fc             	lea    -0x4(%ebp),%eax
    2b84:	89 c5                	mov    %eax,%ebp
    2b86:	81 fe 7f 96 98 00    	cmp    $0x98967f,%esi
    2b8c:	89 d6                	mov    %edx,%esi
    2b8e:	77 b0                	ja     2b40 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0x40>
    2b90:	83 fa 09             	cmp    $0x9,%edx
    2b93:	76 29                	jbe    2bbe <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xbe>
    2b95:	0f b7 ca             	movzwl %dx,%ecx
    2b98:	c1 e9 02             	shr    $0x2,%ecx
    2b9b:	69 c9 7b 14 00 00    	imul   $0x147b,%ecx,%ecx
    2ba1:	c1 e9 11             	shr    $0x11,%ecx
    2ba4:	6b f1 64             	imul   $0x64,%ecx,%esi
    2ba7:	29 f2                	sub    %esi,%edx
    2ba9:	0f b7 d2             	movzwl %dx,%edx
    2bac:	0f b7 94 53 cb db ff 	movzwl -0x2435(%ebx,%edx,2),%edx
    2bb3:	ff 
    2bb4:	66 89 54 04 10       	mov    %dx,0x10(%esp,%eax,1)
    2bb9:	83 c0 fe             	add    $0xfffffffe,%eax
    2bbc:	89 ca                	mov    %ecx,%edx
    2bbe:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    2bc2:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    2bc7:	74 04                	je     2bcd <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xcd>
    2bc9:	85 d2                	test   %edx,%edx
    2bcb:	74 10                	je     2bdd <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xdd>
    2bcd:	83 e2 0f             	and    $0xf,%edx
    2bd0:	0f b6 94 53 cc db ff 	movzbl -0x2434(%ebx,%edx,2),%edx
    2bd7:	ff 
    2bd8:	88 54 04 11          	mov    %dl,0x11(%esp,%eax,1)
    2bdc:	48                   	dec    %eax
    2bdd:	be 0a 00 00 00       	mov    $0xa,%esi
    2be2:	29 c6                	sub    %eax,%esi
    2be4:	01 e0                	add    %esp,%eax
    2be6:	83 c0 12             	add    $0x12,%eax
    2be9:	ba 01 00 00 00       	mov    $0x1,%edx
    2bee:	56                   	push   %esi
    2bef:	50                   	push   %eax
    2bf0:	6a 00                	push   $0x0
    2bf2:	6a 01                	push   $0x1
    2bf4:	e8 17 00 00 00       	call   2c10 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    2bf9:	83 c4 2c             	add    $0x2c,%esp
    2bfc:	5e                   	pop    %esi
    2bfd:	5f                   	pop    %edi
    2bfe:	5b                   	pop    %ebx
    2bff:	5d                   	pop    %ebp
    2c00:	c3                   	ret
    2c01:	66 90                	xchg   %ax,%ax
    2c03:	66 90                	xchg   %ax,%ax
    2c05:	66 90                	xchg   %ax,%ax
    2c07:	66 90                	xchg   %ax,%ax
    2c09:	66 90                	xchg   %ax,%ax
    2c0b:	66 90                	xchg   %ax,%ax
    2c0d:	66 90                	xchg   %ax,%ax
    2c0f:	90                   	nop

00002c10 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>:
    2c10:	55                   	push   %ebp
    2c11:	53                   	push   %ebx
    2c12:	57                   	push   %edi
    2c13:	56                   	push   %esi
    2c14:	83 ec 1c             	sub    $0x1c,%esp
    2c17:	e8 00 00 00 00       	call   2c1c <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xc>
    2c1c:	5b                   	pop    %ebx
    2c1d:	81 c3 d8 73 00 00    	add    $0x73d8,%ebx
    2c23:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    2c27:	85 d2                	test   %edx,%edx
    2c29:	74 65                	je     2c90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x80>
    2c2b:	8b 79 08             	mov    0x8(%ecx),%edi
    2c2e:	89 fa                	mov    %edi,%edx
    2c30:	c7 44 24 04 00 00 11 	movl   $0x110000,0x4(%esp)
    2c37:	00 
    2c38:	81 e2 00 00 20 00    	and    $0x200000,%edx
    2c3e:	74 08                	je     2c48 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x38>
    2c40:	c7 44 24 04 2b 00 00 	movl   $0x2b,0x4(%esp)
    2c47:	00 
    2c48:	c1 ea 15             	shr    $0x15,%edx
    2c4b:	01 c2                	add    %eax,%edx
    2c4d:	8b 74 24 34          	mov    0x34(%esp),%esi
    2c51:	f7 c7 00 00 80 00    	test   $0x800000,%edi
    2c57:	74 51                	je     2caa <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x9a>
    2c59:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    2c5d:	85 f6                	test   %esi,%esi
    2c5f:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    2c63:	0f 84 91 00 00 00    	je     2cfa <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xea>
    2c69:	31 c0                	xor    %eax,%eax
    2c6b:	80 7d 00 c0          	cmpb   $0xc0,0x0(%ebp)
    2c6f:	0f 9d c0             	setge  %al
    2c72:	83 fe 01             	cmp    $0x1,%esi
    2c75:	0f 84 81 00 00 00    	je     2cfc <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xec>
    2c7b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2c7f:	31 d2                	xor    %edx,%edx
    2c81:	80 7d 01 c0          	cmpb   $0xc0,0x1(%ebp)
    2c85:	0f 9d c2             	setge  %dl
    2c88:	01 d0                	add    %edx,%eax
    2c8a:	8b 54 24 0c          	mov    0xc(%esp),%edx
    2c8e:	eb 6c                	jmp    2cfc <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xec>
    2c90:	8d 50 01             	lea    0x1(%eax),%edx
    2c93:	8b 79 08             	mov    0x8(%ecx),%edi
    2c96:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
    2c9d:	00 
    2c9e:	8b 74 24 34          	mov    0x34(%esp),%esi
    2ca2:	f7 c7 00 00 80 00    	test   $0x800000,%edi
    2ca8:	75 af                	jne    2c59 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x49>
    2caa:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2cb1:	00 
    2cb2:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    2cb6:	39 ea                	cmp    %ebp,%edx
    2cb8:	72 50                	jb     2d0a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xfa>
    2cba:	89 c5                	mov    %eax,%ebp
    2cbc:	8b 39                	mov    (%ecx),%edi
    2cbe:	8b 71 04             	mov    0x4(%ecx),%esi
    2cc1:	83 ec 04             	sub    $0x4,%esp
    2cc4:	89 f9                	mov    %edi,%ecx
    2cc6:	89 f2                	mov    %esi,%edx
    2cc8:	ff 74 24 38          	push   0x38(%esp)
    2ccc:	ff 74 24 18          	push   0x18(%esp)
    2cd0:	ff 74 24 10          	push   0x10(%esp)
    2cd4:	e8 d7 01 00 00       	call   2eb0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    2cd9:	83 c4 10             	add    $0x10,%esp
    2cdc:	b1 01                	mov    $0x1,%cl
    2cde:	84 c0                	test   %al,%al
    2ce0:	0f 85 ba 01 00 00    	jne    2ea0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2ce6:	83 ec 04             	sub    $0x4,%esp
    2ce9:	55                   	push   %ebp
    2cea:	ff 74 24 40          	push   0x40(%esp)
    2cee:	57                   	push   %edi
    2cef:	ff 56 0c             	call   *0xc(%esi)
    2cf2:	83 c4 2c             	add    $0x2c,%esp
    2cf5:	e9 ab 01 00 00       	jmp    2ea5 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x295>
    2cfa:	31 c0                	xor    %eax,%eax
    2cfc:	01 c2                	add    %eax,%edx
    2cfe:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    2d02:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    2d06:	39 ea                	cmp    %ebp,%edx
    2d08:	73 b0                	jae    2cba <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xaa>
    2d0a:	f7 c7 00 00 00 01    	test   $0x1000000,%edi
    2d10:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2d14:	75 20                	jne    2d36 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x126>
    2d16:	89 ee                	mov    %ebp,%esi
    2d18:	29 d6                	sub    %edx,%esi
    2d1a:	89 f8                	mov    %edi,%eax
    2d1c:	c1 e8 1d             	shr    $0x1d,%eax
    2d1f:	83 e0 03             	and    $0x3,%eax
    2d22:	31 d2                	xor    %edx,%edx
    2d24:	8b 84 83 24 d5 ff ff 	mov    -0x2adc(%ebx,%eax,4),%eax
    2d2b:	01 d8                	add    %ebx,%eax
    2d2d:	ff e0                	jmp    *%eax
    2d2f:	89 f2                	mov    %esi,%edx
    2d31:	e9 a9 00 00 00       	jmp    2ddf <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x1cf>
    2d36:	8b 41 0c             	mov    0xc(%ecx),%eax
    2d39:	89 44 24 14          	mov    %eax,0x14(%esp)
    2d3d:	8b 41 08             	mov    0x8(%ecx),%eax
    2d40:	89 04 24             	mov    %eax,(%esp)
    2d43:	25 00 00 e0 9f       	and    $0x9fe00000,%eax
    2d48:	0d 30 00 00 20       	or     $0x20000030,%eax
    2d4d:	89 41 08             	mov    %eax,0x8(%ecx)
    2d50:	8b 39                	mov    (%ecx),%edi
    2d52:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2d56:	8b 71 04             	mov    0x4(%ecx),%esi
    2d59:	83 ec 04             	sub    $0x4,%esp
    2d5c:	89 f9                	mov    %edi,%ecx
    2d5e:	89 f2                	mov    %esi,%edx
    2d60:	ff 74 24 38          	push   0x38(%esp)
    2d64:	ff 74 24 18          	push   0x18(%esp)
    2d68:	ff 74 24 10          	push   0x10(%esp)
    2d6c:	e8 3f 01 00 00       	call   2eb0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    2d71:	83 c4 10             	add    $0x10,%esp
    2d74:	b1 01                	mov    $0x1,%cl
    2d76:	84 c0                	test   %al,%al
    2d78:	0f 85 22 01 00 00    	jne    2ea0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2d7e:	2b 6c 24 0c          	sub    0xc(%esp),%ebp
    2d82:	45                   	inc    %ebp
    2d83:	90                   	nop
    2d84:	90                   	nop
    2d85:	90                   	nop
    2d86:	90                   	nop
    2d87:	90                   	nop
    2d88:	90                   	nop
    2d89:	90                   	nop
    2d8a:	90                   	nop
    2d8b:	90                   	nop
    2d8c:	90                   	nop
    2d8d:	90                   	nop
    2d8e:	90                   	nop
    2d8f:	90                   	nop
    2d90:	66 4d                	dec    %bp
    2d92:	74 12                	je     2da6 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x196>
    2d94:	83 ec 08             	sub    $0x8,%esp
    2d97:	6a 30                	push   $0x30
    2d99:	57                   	push   %edi
    2d9a:	ff 56 10             	call   *0x10(%esi)
    2d9d:	83 c4 10             	add    $0x10,%esp
    2da0:	84 c0                	test   %al,%al
    2da2:	74 ec                	je     2d90 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x180>
    2da4:	eb 73                	jmp    2e19 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x209>
    2da6:	83 ec 04             	sub    $0x4,%esp
    2da9:	ff 74 24 40          	push   0x40(%esp)
    2dad:	ff 74 24 40          	push   0x40(%esp)
    2db1:	57                   	push   %edi
    2db2:	ff 56 0c             	call   *0xc(%esi)
    2db5:	83 c4 10             	add    $0x10,%esp
    2db8:	84 c0                	test   %al,%al
    2dba:	b1 01                	mov    $0x1,%cl
    2dbc:	0f 85 de 00 00 00    	jne    2ea0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2dc2:	8b 44 24 08          	mov    0x8(%esp),%eax
    2dc6:	8b 0c 24             	mov    (%esp),%ecx
    2dc9:	89 48 08             	mov    %ecx,0x8(%eax)
    2dcc:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    2dd0:	89 48 0c             	mov    %ecx,0xc(%eax)
    2dd3:	31 c9                	xor    %ecx,%ecx
    2dd5:	e9 c6 00 00 00       	jmp    2ea0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2dda:	0f b7 d6             	movzwl %si,%edx
    2ddd:	d1 ea                	shr    $1,%edx
    2ddf:	89 34 24             	mov    %esi,(%esp)
    2de2:	81 e7 ff ff 1f 00    	and    $0x1fffff,%edi
    2de8:	89 7c 24 14          	mov    %edi,0x14(%esp)
    2dec:	8b 01                	mov    (%ecx),%eax
    2dee:	89 44 24 08          	mov    %eax,0x8(%esp)
    2df2:	8b 79 04             	mov    0x4(%ecx),%edi
    2df5:	89 54 24 18          	mov    %edx,0x18(%esp)
    2df9:	8d 72 01             	lea    0x1(%edx),%esi
    2dfc:	90                   	nop
    2dfd:	90                   	nop
    2dfe:	90                   	nop
    2dff:	90                   	nop
    2e00:	66 4e                	dec    %si
    2e02:	74 1c                	je     2e20 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x210>
    2e04:	83 ec 08             	sub    $0x8,%esp
    2e07:	ff 74 24 1c          	push   0x1c(%esp)
    2e0b:	ff 74 24 14          	push   0x14(%esp)
    2e0f:	ff 57 10             	call   *0x10(%edi)
    2e12:	83 c4 10             	add    $0x10,%esp
    2e15:	84 c0                	test   %al,%al
    2e17:	74 e7                	je     2e00 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x1f0>
    2e19:	b1 01                	mov    $0x1,%cl
    2e1b:	e9 80 00 00 00       	jmp    2ea0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2e20:	83 ec 04             	sub    $0x4,%esp
    2e23:	8b 74 24 0c          	mov    0xc(%esp),%esi
    2e27:	89 f1                	mov    %esi,%ecx
    2e29:	89 fa                	mov    %edi,%edx
    2e2b:	ff 74 24 38          	push   0x38(%esp)
    2e2f:	ff 74 24 18          	push   0x18(%esp)
    2e33:	ff 74 24 10          	push   0x10(%esp)
    2e37:	e8 74 00 00 00       	call   2eb0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    2e3c:	83 c4 10             	add    $0x10,%esp
    2e3f:	b1 01                	mov    $0x1,%cl
    2e41:	84 c0                	test   %al,%al
    2e43:	75 5b                	jne    2ea0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2e45:	83 ec 04             	sub    $0x4,%esp
    2e48:	ff 74 24 40          	push   0x40(%esp)
    2e4c:	ff 74 24 40          	push   0x40(%esp)
    2e50:	56                   	push   %esi
    2e51:	ff 57 0c             	call   *0xc(%edi)
    2e54:	b1 01                	mov    $0x1,%cl
    2e56:	83 c4 10             	add    $0x10,%esp
    2e59:	84 c0                	test   %al,%al
    2e5b:	75 43                	jne    2ea0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    2e5d:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    2e61:	29 0c 24             	sub    %ecx,(%esp)
    2e64:	03 4c 24 0c          	add    0xc(%esp),%ecx
    2e68:	29 e9                	sub    %ebp,%ecx
    2e6a:	66 bd ff ff          	mov    $0xffff,%bp
    2e6e:	90                   	nop
    2e6f:	90                   	nop
    2e70:	8d 04 29             	lea    (%ecx,%ebp,1),%eax
    2e73:	66 83 f8 ff          	cmp    $0xffff,%ax
    2e77:	74 1d                	je     2e96 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x286>
    2e79:	83 ec 08             	sub    $0x8,%esp
    2e7c:	ff 74 24 1c          	push   0x1c(%esp)
    2e80:	56                   	push   %esi
    2e81:	89 ce                	mov    %ecx,%esi
    2e83:	ff 57 10             	call   *0x10(%edi)
    2e86:	89 f1                	mov    %esi,%ecx
    2e88:	8b 74 24 18          	mov    0x18(%esp),%esi
    2e8c:	83 c4 10             	add    $0x10,%esp
    2e8f:	45                   	inc    %ebp
    2e90:	84 c0                	test   %al,%al
    2e92:	74 dc                	je     2e70 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x260>
    2e94:	eb 03                	jmp    2e99 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x289>
    2e96:	8b 2c 24             	mov    (%esp),%ebp
    2e99:	66 3b 2c 24          	cmp    (%esp),%bp
    2e9d:	0f 92 c1             	setb   %cl
    2ea0:	89 c8                	mov    %ecx,%eax
    2ea2:	83 c4 1c             	add    $0x1c,%esp
    2ea5:	5e                   	pop    %esi
    2ea6:	5f                   	pop    %edi
    2ea7:	5b                   	pop    %ebx
    2ea8:	5d                   	pop    %ebp
    2ea9:	c3                   	ret
    2eaa:	66 90                	xchg   %ax,%ax
    2eac:	66 90                	xchg   %ax,%ax
    2eae:	66 90                	xchg   %ax,%ax

00002eb0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>:
    2eb0:	53                   	push   %ebx
    2eb1:	57                   	push   %edi
    2eb2:	56                   	push   %esi
    2eb3:	89 d6                	mov    %edx,%esi
    2eb5:	89 cf                	mov    %ecx,%edi
    2eb7:	e8 00 00 00 00       	call   2ebc <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0xc>
    2ebc:	5b                   	pop    %ebx
    2ebd:	81 c3 38 71 00 00    	add    $0x7138,%ebx
    2ec3:	8b 44 24 10          	mov    0x10(%esp),%eax
    2ec7:	3d 00 00 11 00       	cmp    $0x110000,%eax
    2ecc:	74 13                	je     2ee1 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x31>
    2ece:	83 ec 08             	sub    $0x8,%esp
    2ed1:	50                   	push   %eax
    2ed2:	57                   	push   %edi
    2ed3:	ff 56 10             	call   *0x10(%esi)
    2ed6:	83 c4 10             	add    $0x10,%esp
    2ed9:	89 c1                	mov    %eax,%ecx
    2edb:	b0 01                	mov    $0x1,%al
    2edd:	84 c9                	test   %cl,%cl
    2edf:	75 1d                	jne    2efe <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4e>
    2ee1:	8b 44 24 14          	mov    0x14(%esp),%eax
    2ee5:	85 c0                	test   %eax,%eax
    2ee7:	74 13                	je     2efc <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4c>
    2ee9:	83 ec 04             	sub    $0x4,%esp
    2eec:	ff 74 24 1c          	push   0x1c(%esp)
    2ef0:	50                   	push   %eax
    2ef1:	57                   	push   %edi
    2ef2:	ff 56 0c             	call   *0xc(%esi)
    2ef5:	83 c4 10             	add    $0x10,%esp
    2ef8:	5e                   	pop    %esi
    2ef9:	5f                   	pop    %edi
    2efa:	5b                   	pop    %ebx
    2efb:	c3                   	ret
    2efc:	31 c0                	xor    %eax,%eax
    2efe:	5e                   	pop    %esi
    2eff:	5f                   	pop    %edi
    2f00:	5b                   	pop    %ebx
    2f01:	c3                   	ret
    2f02:	66 90                	xchg   %ax,%ax
    2f04:	66 90                	xchg   %ax,%ax
    2f06:	66 90                	xchg   %ax,%ax
    2f08:	66 90                	xchg   %ax,%ax
    2f0a:	66 90                	xchg   %ax,%ax
    2f0c:	66 90                	xchg   %ax,%ax
    2f0e:	66 90                	xchg   %ax,%ax

00002f10 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>:
    2f10:	55                   	push   %ebp
    2f11:	53                   	push   %ebx
    2f12:	57                   	push   %edi
    2f13:	56                   	push   %esi
    2f14:	83 ec 2c             	sub    $0x2c,%esp
    2f17:	89 cd                	mov    %ecx,%ebp
    2f19:	e8 00 00 00 00       	call   2f1e <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xe>
    2f1e:	58                   	pop    %eax
    2f1f:	81 c0 d6 70 00 00    	add    $0x70d6,%eax
    2f25:	89 44 24 24          	mov    %eax,0x24(%esp)
    2f29:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    2f2d:	8b 7d 08             	mov    0x8(%ebp),%edi
    2f30:	f7 c7 00 00 00 18    	test   $0x18000000,%edi
    2f36:	74 3c                	je     2f74 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x64>
    2f38:	f7 c7 00 00 00 10    	test   $0x10000000,%edi
    2f3e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2f42:	75 40                	jne    2f84 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x74>
    2f44:	83 f9 10             	cmp    $0x10,%ecx
    2f47:	0f 83 9f 00 00 00    	jae    2fec <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xdc>
    2f4d:	85 c9                	test   %ecx,%ecx
    2f4f:	0f 84 1a 01 00 00    	je     306f <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x15f>
    2f55:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    2f59:	89 7c 24 14          	mov    %edi,0x14(%esp)
    2f5d:	89 ce                	mov    %ecx,%esi
    2f5f:	83 e6 03             	and    $0x3,%esi
    2f62:	83 f9 04             	cmp    $0x4,%ecx
    2f65:	0f 83 19 01 00 00    	jae    3084 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x174>
    2f6b:	31 c9                	xor    %ecx,%ecx
    2f6d:	31 db                	xor    %ebx,%ebx
    2f6f:	e9 65 01 00 00       	jmp    30d9 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1c9>
    2f74:	8b 45 04             	mov    0x4(%ebp),%eax
    2f77:	83 ec 04             	sub    $0x4,%esp
    2f7a:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    2f7e:	51                   	push   %ecx
    2f7f:	e9 ef 04 00 00       	jmp    3473 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x563>
    2f84:	0f b7 45 0e          	movzwl 0xe(%ebp),%eax
    2f88:	89 44 24 18          	mov    %eax,0x18(%esp)
    2f8c:	85 c0                	test   %eax,%eax
    2f8e:	0f 84 a4 00 00 00    	je     3038 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x128>
    2f94:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    2f98:	89 7c 24 14          	mov    %edi,0x14(%esp)
    2f9c:	01 d1                	add    %edx,%ecx
    2f9e:	89 cd                	mov    %ecx,%ebp
    2fa0:	89 d1                	mov    %edx,%ecx
    2fa2:	31 f6                	xor    %esi,%esi
    2fa4:	31 c0                	xor    %eax,%eax
    2fa6:	eb 1e                	jmp    2fc6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xb6>
    2fa8:	90                   	nop
    2fa9:	90                   	nop
    2faa:	90                   	nop
    2fab:	90                   	nop
    2fac:	90                   	nop
    2fad:	90                   	nop
    2fae:	90                   	nop
    2faf:	90                   	nop
    2fb0:	8d 79 01             	lea    0x1(%ecx),%edi
    2fb3:	89 fe                	mov    %edi,%esi
    2fb5:	29 ce                	sub    %ecx,%esi
    2fb7:	01 d6                	add    %edx,%esi
    2fb9:	40                   	inc    %eax
    2fba:	89 f9                	mov    %edi,%ecx
    2fbc:	39 44 24 18          	cmp    %eax,0x18(%esp)
    2fc0:	0f 84 82 00 00 00    	je     3048 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x138>
    2fc6:	89 f2                	mov    %esi,%edx
    2fc8:	39 e9                	cmp    %ebp,%ecx
    2fca:	74 72                	je     303e <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x12e>
    2fcc:	0f b6 19             	movzbl (%ecx),%ebx
    2fcf:	84 db                	test   %bl,%bl
    2fd1:	79 dd                	jns    2fb0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa0>
    2fd3:	80 fb e0             	cmp    $0xe0,%bl
    2fd6:	72 0a                	jb     2fe2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd2>
    2fd8:	80 fb f0             	cmp    $0xf0,%bl
    2fdb:	72 0a                	jb     2fe7 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd7>
    2fdd:	8d 79 04             	lea    0x4(%ecx),%edi
    2fe0:	eb d1                	jmp    2fb3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    2fe2:	8d 79 02             	lea    0x2(%ecx),%edi
    2fe5:	eb cc                	jmp    2fb3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    2fe7:	8d 79 03             	lea    0x3(%ecx),%edi
    2fea:	eb c7                	jmp    2fb3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    2fec:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    2ff0:	89 7c 24 14          	mov    %edi,0x14(%esp)
    2ff4:	8d 6a 03             	lea    0x3(%edx),%ebp
    2ff7:	83 e5 fc             	and    $0xfffffffc,%ebp
    2ffa:	89 e8                	mov    %ebp,%eax
    2ffc:	29 d0                	sub    %edx,%eax
    2ffe:	89 cb                	mov    %ecx,%ebx
    3000:	29 c3                	sub    %eax,%ebx
    3002:	89 d8                	mov    %ebx,%eax
    3004:	83 e0 03             	and    $0x3,%eax
    3007:	89 44 24 18          	mov    %eax,0x18(%esp)
    300b:	89 ef                	mov    %ebp,%edi
    300d:	b8 00 00 00 00       	mov    $0x0,%eax
    3012:	29 d7                	sub    %edx,%edi
    3014:	0f 84 76 01 00 00    	je     3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x280>
    301a:	89 5c 24 20          	mov    %ebx,0x20(%esp)
    301e:	8b 74 24 0c          	mov    0xc(%esp),%esi
    3022:	89 f0                	mov    %esi,%eax
    3024:	29 e8                	sub    %ebp,%eax
    3026:	83 f8 fc             	cmp    $0xfffffffc,%eax
    3029:	0f 86 ee 00 00 00    	jbe    311d <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x20d>
    302f:	31 c0                	xor    %eax,%eax
    3031:	31 d2                	xor    %edx,%edx
    3033:	e9 2c 01 00 00       	jmp    3164 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x254>
    3038:	31 f6                	xor    %esi,%esi
    303a:	31 c9                	xor    %ecx,%ecx
    303c:	eb 14                	jmp    3052 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x142>
    303e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    3042:	29 c1                	sub    %eax,%ecx
    3044:	89 d6                	mov    %edx,%esi
    3046:	eb 02                	jmp    304a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x13a>
    3048:	31 c9                	xor    %ecx,%ecx
    304a:	8b 7c 24 14          	mov    0x14(%esp),%edi
    304e:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    3052:	8b 44 24 18          	mov    0x18(%esp),%eax
    3056:	29 c8                	sub    %ecx,%eax
    3058:	89 c1                	mov    %eax,%ecx
    305a:	8b 54 24 0c          	mov    0xc(%esp),%edx
    305e:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    3062:	39 c1                	cmp    %eax,%ecx
    3064:	0f 82 7c 02 00 00    	jb     32e6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    306a:	e9 f9 03 00 00       	jmp    3468 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    306f:	31 f6                	xor    %esi,%esi
    3071:	31 c9                	xor    %ecx,%ecx
    3073:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    3077:	39 c1                	cmp    %eax,%ecx
    3079:	0f 82 67 02 00 00    	jb     32e6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    307f:	e9 e4 03 00 00       	jmp    3468 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    3084:	89 cf                	mov    %ecx,%edi
    3086:	83 e7 0c             	and    $0xc,%edi
    3089:	31 c9                	xor    %ecx,%ecx
    308b:	31 db                	xor    %ebx,%ebx
    308d:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    3091:	90                   	nop
    3092:	90                   	nop
    3093:	90                   	nop
    3094:	90                   	nop
    3095:	90                   	nop
    3096:	90                   	nop
    3097:	90                   	nop
    3098:	90                   	nop
    3099:	90                   	nop
    309a:	90                   	nop
    309b:	90                   	nop
    309c:	90                   	nop
    309d:	90                   	nop
    309e:	90                   	nop
    309f:	90                   	nop
    30a0:	89 c8                	mov    %ecx,%eax
    30a2:	31 c9                	xor    %ecx,%ecx
    30a4:	80 7c 1d 00 c0       	cmpb   $0xc0,0x0(%ebp,%ebx,1)
    30a9:	0f 9d c1             	setge  %cl
    30ac:	01 c1                	add    %eax,%ecx
    30ae:	31 d2                	xor    %edx,%edx
    30b0:	80 7c 1d 01 c0       	cmpb   $0xc0,0x1(%ebp,%ebx,1)
    30b5:	0f 9d c2             	setge  %dl
    30b8:	31 c0                	xor    %eax,%eax
    30ba:	80 7c 1d 02 c0       	cmpb   $0xc0,0x2(%ebp,%ebx,1)
    30bf:	0f 9d c0             	setge  %al
    30c2:	01 d0                	add    %edx,%eax
    30c4:	01 c8                	add    %ecx,%eax
    30c6:	31 c9                	xor    %ecx,%ecx
    30c8:	80 7c 1d 03 c0       	cmpb   $0xc0,0x3(%ebp,%ebx,1)
    30cd:	0f 9d c1             	setge  %cl
    30d0:	01 c1                	add    %eax,%ecx
    30d2:	83 c3 04             	add    $0x4,%ebx
    30d5:	39 df                	cmp    %ebx,%edi
    30d7:	75 c7                	jne    30a0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x190>
    30d9:	85 f6                	test   %esi,%esi
    30db:	0f 84 e9 01 00 00    	je     32ca <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3ba>
    30e1:	03 5c 24 0c          	add    0xc(%esp),%ebx
    30e5:	31 d2                	xor    %edx,%edx
    30e7:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    30eb:	90                   	nop
    30ec:	90                   	nop
    30ed:	90                   	nop
    30ee:	90                   	nop
    30ef:	90                   	nop
    30f0:	31 c0                	xor    %eax,%eax
    30f2:	80 3c 13 c0          	cmpb   $0xc0,(%ebx,%edx,1)
    30f6:	0f 9d c0             	setge  %al
    30f9:	01 c1                	add    %eax,%ecx
    30fb:	42                   	inc    %edx
    30fc:	39 d6                	cmp    %edx,%esi
    30fe:	75 f0                	jne    30f0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1e0>
    3100:	8b 7c 24 14          	mov    0x14(%esp),%edi
    3104:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3108:	8b 74 24 40          	mov    0x40(%esp),%esi
    310c:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    3110:	39 c1                	cmp    %eax,%ecx
    3112:	0f 82 ce 01 00 00    	jb     32e6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    3118:	e9 4b 03 00 00       	jmp    3468 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    311d:	31 c0                	xor    %eax,%eax
    311f:	31 d2                	xor    %edx,%edx
    3121:	90                   	nop
    3122:	90                   	nop
    3123:	90                   	nop
    3124:	90                   	nop
    3125:	90                   	nop
    3126:	90                   	nop
    3127:	90                   	nop
    3128:	90                   	nop
    3129:	90                   	nop
    312a:	90                   	nop
    312b:	90                   	nop
    312c:	90                   	nop
    312d:	90                   	nop
    312e:	90                   	nop
    312f:	90                   	nop
    3130:	31 db                	xor    %ebx,%ebx
    3132:	80 3c 16 c0          	cmpb   $0xc0,(%esi,%edx,1)
    3136:	0f 9d c3             	setge  %bl
    3139:	01 c3                	add    %eax,%ebx
    313b:	31 c0                	xor    %eax,%eax
    313d:	80 7c 16 01 c0       	cmpb   $0xc0,0x1(%esi,%edx,1)
    3142:	0f 9d c0             	setge  %al
    3145:	31 c9                	xor    %ecx,%ecx
    3147:	80 7c 16 02 c0       	cmpb   $0xc0,0x2(%esi,%edx,1)
    314c:	0f 9d c1             	setge  %cl
    314f:	01 c1                	add    %eax,%ecx
    3151:	01 d9                	add    %ebx,%ecx
    3153:	31 c0                	xor    %eax,%eax
    3155:	80 7c 16 03 c0       	cmpb   $0xc0,0x3(%esi,%edx,1)
    315a:	0f 9d c0             	setge  %al
    315d:	01 c8                	add    %ecx,%eax
    315f:	83 c2 04             	add    $0x4,%edx
    3162:	75 cc                	jne    3130 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x220>
    3164:	39 f5                	cmp    %esi,%ebp
    3166:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    316a:	74 24                	je     3190 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x280>
    316c:	03 54 24 0c          	add    0xc(%esp),%edx
    3170:	31 f6                	xor    %esi,%esi
    3172:	90                   	nop
    3173:	90                   	nop
    3174:	90                   	nop
    3175:	90                   	nop
    3176:	90                   	nop
    3177:	90                   	nop
    3178:	90                   	nop
    3179:	90                   	nop
    317a:	90                   	nop
    317b:	90                   	nop
    317c:	90                   	nop
    317d:	90                   	nop
    317e:	90                   	nop
    317f:	90                   	nop
    3180:	31 c9                	xor    %ecx,%ecx
    3182:	80 3c 32 c0          	cmpb   $0xc0,(%edx,%esi,1)
    3186:	0f 9d c1             	setge  %cl
    3189:	01 c8                	add    %ecx,%eax
    318b:	46                   	inc    %esi
    318c:	39 f7                	cmp    %esi,%edi
    318e:	75 f0                	jne    3180 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x270>
    3190:	8b 7c 24 18          	mov    0x18(%esp),%edi
    3194:	85 ff                	test   %edi,%edi
    3196:	b9 00 00 00 00       	mov    $0x0,%ecx
    319b:	74 35                	je     31d2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c2>
    319d:	89 da                	mov    %ebx,%edx
    319f:	83 e2 fc             	and    $0xfffffffc,%edx
    31a2:	31 c9                	xor    %ecx,%ecx
    31a4:	80 7c 15 00 c0       	cmpb   $0xc0,0x0(%ebp,%edx,1)
    31a9:	0f 9d c1             	setge  %cl
    31ac:	83 ff 01             	cmp    $0x1,%edi
    31af:	74 21                	je     31d2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c2>
    31b1:	89 ce                	mov    %ecx,%esi
    31b3:	31 c9                	xor    %ecx,%ecx
    31b5:	80 7c 15 01 c0       	cmpb   $0xc0,0x1(%ebp,%edx,1)
    31ba:	0f 9d c1             	setge  %cl
    31bd:	01 ce                	add    %ecx,%esi
    31bf:	83 ff 02             	cmp    $0x2,%edi
    31c2:	74 0c                	je     31d0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c0>
    31c4:	31 c9                	xor    %ecx,%ecx
    31c6:	80 7c 15 02 c0       	cmpb   $0xc0,0x2(%ebp,%edx,1)
    31cb:	0f 9d c1             	setge  %cl
    31ce:	01 ce                	add    %ecx,%esi
    31d0:	89 f1                	mov    %esi,%ecx
    31d2:	01 c1                	add    %eax,%ecx
    31d4:	c1 eb 02             	shr    $0x2,%ebx
    31d7:	eb 43                	jmp    321c <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x30c>
    31d9:	90                   	nop
    31da:	90                   	nop
    31db:	90                   	nop
    31dc:	90                   	nop
    31dd:	90                   	nop
    31de:	90                   	nop
    31df:	90                   	nop
    31e0:	89 f0                	mov    %esi,%eax
    31e2:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    31e7:	c1 ee 08             	shr    $0x8,%esi
    31ea:	81 e6 ff 00 ff 00    	and    $0xff00ff,%esi
    31f0:	01 c6                	add    %eax,%esi
    31f2:	89 f0                	mov    %esi,%eax
    31f4:	c1 e0 10             	shl    $0x10,%eax
    31f7:	01 f0                	add    %esi,%eax
    31f9:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    31fd:	8d 2c ba             	lea    (%edx,%edi,4),%ebp
    3200:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    3204:	29 fb                	sub    %edi,%ebx
    3206:	c1 e8 10             	shr    $0x10,%eax
    3209:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    320d:	01 c1                	add    %eax,%ecx
    320f:	89 fe                	mov    %edi,%esi
    3211:	83 e6 03             	and    $0x3,%esi
    3214:	85 f6                	test   %esi,%esi
    3216:	0f 85 95 01 00 00    	jne    33b1 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4a1>
    321c:	85 db                	test   %ebx,%ebx
    321e:	0f 84 a6 00 00 00    	je     32ca <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3ba>
    3224:	89 ea                	mov    %ebp,%edx
    3226:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    322a:	89 d8                	mov    %ebx,%eax
    322c:	81 fb c0 00 00 00    	cmp    $0xc0,%ebx
    3232:	72 05                	jb     3239 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x329>
    3234:	b8 c0 00 00 00       	mov    $0xc0,%eax
    3239:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    323d:	31 f6                	xor    %esi,%esi
    323f:	89 5c 24 20          	mov    %ebx,0x20(%esp)
    3243:	83 fb 04             	cmp    $0x4,%ebx
    3246:	72 98                	jb     31e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2d0>
    3248:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    324c:	c1 e9 02             	shr    $0x2,%ecx
    324f:	c1 e1 04             	shl    $0x4,%ecx
    3252:	31 ed                	xor    %ebp,%ebp
    3254:	31 f6                	xor    %esi,%esi
    3256:	90                   	nop
    3257:	90                   	nop
    3258:	90                   	nop
    3259:	90                   	nop
    325a:	90                   	nop
    325b:	90                   	nop
    325c:	90                   	nop
    325d:	90                   	nop
    325e:	90                   	nop
    325f:	90                   	nop
    3260:	8b 04 2a             	mov    (%edx,%ebp,1),%eax
    3263:	8b 5c 2a 04          	mov    0x4(%edx,%ebp,1),%ebx
    3267:	89 c7                	mov    %eax,%edi
    3269:	f7 d7                	not    %edi
    326b:	c1 ef 07             	shr    $0x7,%edi
    326e:	c1 e8 06             	shr    $0x6,%eax
    3271:	09 f8                	or     %edi,%eax
    3273:	25 01 01 01 01       	and    $0x1010101,%eax
    3278:	01 f0                	add    %esi,%eax
    327a:	89 de                	mov    %ebx,%esi
    327c:	f7 d6                	not    %esi
    327e:	c1 ee 07             	shr    $0x7,%esi
    3281:	c1 eb 06             	shr    $0x6,%ebx
    3284:	09 f3                	or     %esi,%ebx
    3286:	81 e3 01 01 01 01    	and    $0x1010101,%ebx
    328c:	8b 7c 2a 08          	mov    0x8(%edx,%ebp,1),%edi
    3290:	89 fe                	mov    %edi,%esi
    3292:	f7 d6                	not    %esi
    3294:	c1 ee 07             	shr    $0x7,%esi
    3297:	c1 ef 06             	shr    $0x6,%edi
    329a:	09 f7                	or     %esi,%edi
    329c:	81 e7 01 01 01 01    	and    $0x1010101,%edi
    32a2:	01 df                	add    %ebx,%edi
    32a4:	01 c7                	add    %eax,%edi
    32a6:	8b 74 2a 0c          	mov    0xc(%edx,%ebp,1),%esi
    32aa:	89 f0                	mov    %esi,%eax
    32ac:	f7 d0                	not    %eax
    32ae:	c1 e8 07             	shr    $0x7,%eax
    32b1:	c1 ee 06             	shr    $0x6,%esi
    32b4:	09 c6                	or     %eax,%esi
    32b6:	81 e6 01 01 01 01    	and    $0x1010101,%esi
    32bc:	01 fe                	add    %edi,%esi
    32be:	83 c5 10             	add    $0x10,%ebp
    32c1:	39 e9                	cmp    %ebp,%ecx
    32c3:	75 9b                	jne    3260 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x350>
    32c5:	e9 16 ff ff ff       	jmp    31e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2d0>
    32ca:	8b 7c 24 14          	mov    0x14(%esp),%edi
    32ce:	8b 54 24 0c          	mov    0xc(%esp),%edx
    32d2:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    32d6:	8b 74 24 40          	mov    0x40(%esp),%esi
    32da:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    32de:	39 c1                	cmp    %eax,%ecx
    32e0:	0f 83 82 01 00 00    	jae    3468 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    32e6:	89 74 24 10          	mov    %esi,0x10(%esp)
    32ea:	89 44 24 28          	mov    %eax,0x28(%esp)
    32ee:	89 c2                	mov    %eax,%edx
    32f0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    32f4:	29 ca                	sub    %ecx,%edx
    32f6:	89 f8                	mov    %edi,%eax
    32f8:	c1 e8 1d             	shr    $0x1d,%eax
    32fb:	83 e0 03             	and    $0x3,%eax
    32fe:	31 f6                	xor    %esi,%esi
    3300:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    3304:	8b 84 81 34 d5 ff ff 	mov    -0x2acc(%ecx,%eax,4),%eax
    330b:	89 cb                	mov    %ecx,%ebx
    330d:	01 c8                	add    %ecx,%eax
    330f:	ff e0                	jmp    *%eax
    3311:	89 d6                	mov    %edx,%esi
    3313:	eb 05                	jmp    331a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x40a>
    3315:	0f b7 f2             	movzwl %dx,%esi
    3318:	d1 ee                	shr    $1,%esi
    331a:	89 54 24 20          	mov    %edx,0x20(%esp)
    331e:	81 e7 ff ff 1f 00    	and    $0x1fffff,%edi
    3324:	89 7c 24 14          	mov    %edi,0x14(%esp)
    3328:	8b 7d 00             	mov    0x0(%ebp),%edi
    332b:	8b 6d 04             	mov    0x4(%ebp),%ebp
    332e:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    3332:	46                   	inc    %esi
    3333:	90                   	nop
    3334:	90                   	nop
    3335:	90                   	nop
    3336:	90                   	nop
    3337:	90                   	nop
    3338:	90                   	nop
    3339:	90                   	nop
    333a:	90                   	nop
    333b:	90                   	nop
    333c:	90                   	nop
    333d:	90                   	nop
    333e:	90                   	nop
    333f:	90                   	nop
    3340:	66 4e                	dec    %si
    3342:	74 19                	je     335d <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x44d>
    3344:	83 ec 08             	sub    $0x8,%esp
    3347:	ff 74 24 1c          	push   0x1c(%esp)
    334b:	57                   	push   %edi
    334c:	ff 55 10             	call   *0x10(%ebp)
    334f:	83 c4 10             	add    $0x10,%esp
    3352:	84 c0                	test   %al,%al
    3354:	74 ea                	je     3340 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x430>
    3356:	b0 01                	mov    $0x1,%al
    3358:	e9 8c 00 00 00       	jmp    33e9 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d9>
    335d:	83 ec 04             	sub    $0x4,%esp
    3360:	ff 74 24 14          	push   0x14(%esp)
    3364:	ff 74 24 14          	push   0x14(%esp)
    3368:	57                   	push   %edi
    3369:	ff 55 0c             	call   *0xc(%ebp)
    336c:	83 c4 10             	add    $0x10,%esp
    336f:	89 c1                	mov    %eax,%ecx
    3371:	b0 01                	mov    $0x1,%al
    3373:	84 c9                	test   %cl,%cl
    3375:	75 72                	jne    33e9 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d9>
    3377:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    337b:	29 44 24 20          	sub    %eax,0x20(%esp)
    337f:	03 44 24 18          	add    0x18(%esp),%eax
    3383:	2b 44 24 28          	sub    0x28(%esp),%eax
    3387:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    338b:	66 be ff ff          	mov    $0xffff,%si
    338f:	90                   	nop
    3390:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3394:	01 f0                	add    %esi,%eax
    3396:	66 83 f8 ff          	cmp    $0xffff,%ax
    339a:	74 41                	je     33dd <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4cd>
    339c:	83 ec 08             	sub    $0x8,%esp
    339f:	ff 74 24 1c          	push   0x1c(%esp)
    33a3:	57                   	push   %edi
    33a4:	ff 55 10             	call   *0x10(%ebp)
    33a7:	83 c4 10             	add    $0x10,%esp
    33aa:	46                   	inc    %esi
    33ab:	84 c0                	test   %al,%al
    33ad:	74 e1                	je     3390 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x480>
    33af:	eb 30                	jmp    33e1 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d1>
    33b1:	89 cb                	mov    %ecx,%ebx
    33b3:	81 e7 fc 00 00 00    	and    $0xfc,%edi
    33b9:	8b 0c ba             	mov    (%edx,%edi,4),%ecx
    33bc:	89 c8                	mov    %ecx,%eax
    33be:	f7 d0                	not    %eax
    33c0:	c1 e8 07             	shr    $0x7,%eax
    33c3:	c1 e9 06             	shr    $0x6,%ecx
    33c6:	09 c1                	or     %eax,%ecx
    33c8:	81 e1 01 01 01 01    	and    $0x1010101,%ecx
    33ce:	83 fe 01             	cmp    $0x1,%esi
    33d1:	75 1e                	jne    33f1 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4e1>
    33d3:	8b 54 24 0c          	mov    0xc(%esp),%edx
    33d7:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    33db:	eb 57                	jmp    3434 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x524>
    33dd:	8b 74 24 20          	mov    0x20(%esp),%esi
    33e1:	66 3b 74 24 20       	cmp    0x20(%esp),%si
    33e6:	0f 92 c0             	setb   %al
    33e9:	83 c4 2c             	add    $0x2c,%esp
    33ec:	e9 8c 00 00 00       	jmp    347d <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x56d>
    33f1:	8b 44 ba 04          	mov    0x4(%edx,%edi,4),%eax
    33f5:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    33f9:	89 c7                	mov    %eax,%edi
    33fb:	f7 d7                	not    %edi
    33fd:	c1 ef 07             	shr    $0x7,%edi
    3400:	c1 e8 06             	shr    $0x6,%eax
    3403:	09 f8                	or     %edi,%eax
    3405:	25 01 01 01 01       	and    $0x1010101,%eax
    340a:	01 c1                	add    %eax,%ecx
    340c:	83 fe 02             	cmp    $0x2,%esi
    340f:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    3413:	74 1b                	je     3430 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x520>
    3415:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3419:	8b 44 82 08          	mov    0x8(%edx,%eax,4),%eax
    341d:	89 c2                	mov    %eax,%edx
    341f:	f7 d2                	not    %edx
    3421:	c1 ea 07             	shr    $0x7,%edx
    3424:	c1 e8 06             	shr    $0x6,%eax
    3427:	09 d0                	or     %edx,%eax
    3429:	25 01 01 01 01       	and    $0x1010101,%eax
    342e:	01 c1                	add    %eax,%ecx
    3430:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3434:	89 c8                	mov    %ecx,%eax
    3436:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    343b:	c1 e9 08             	shr    $0x8,%ecx
    343e:	81 e1 ff 00 07 00    	and    $0x700ff,%ecx
    3444:	01 c1                	add    %eax,%ecx
    3446:	89 c8                	mov    %ecx,%eax
    3448:	c1 e0 10             	shl    $0x10,%eax
    344b:	01 c8                	add    %ecx,%eax
    344d:	c1 e8 10             	shr    $0x10,%eax
    3450:	89 d9                	mov    %ebx,%ecx
    3452:	01 c1                	add    %eax,%ecx
    3454:	8b 7c 24 14          	mov    0x14(%esp),%edi
    3458:	8b 74 24 40          	mov    0x40(%esp),%esi
    345c:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    3460:	39 c1                	cmp    %eax,%ecx
    3462:	0f 82 7e fe ff ff    	jb     32e6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    3468:	8b 45 04             	mov    0x4(%ebp),%eax
    346b:	83 ec 04             	sub    $0x4,%esp
    346e:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    3472:	56                   	push   %esi
    3473:	52                   	push   %edx
    3474:	ff 75 00             	push   0x0(%ebp)
    3477:	ff 50 0c             	call   *0xc(%eax)
    347a:	83 c4 3c             	add    $0x3c,%esp
    347d:	5e                   	pop    %esi
    347e:	5f                   	pop    %edi
    347f:	5b                   	pop    %ebx
    3480:	5d                   	pop    %ebp
    3481:	c3                   	ret
    3482:	66 90                	xchg   %ax,%ax
    3484:	66 90                	xchg   %ax,%ax
    3486:	66 90                	xchg   %ax,%ax
    3488:	66 90                	xchg   %ax,%ax
    348a:	66 90                	xchg   %ax,%ax
    348c:	66 90                	xchg   %ax,%ax
    348e:	66 90                	xchg   %ax,%ax

00003490 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE>:
    3490:	53                   	push   %ebx
    3491:	83 ec 08             	sub    $0x8,%esp
    3494:	e8 00 00 00 00       	call   3499 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE+0x9>
    3499:	5b                   	pop    %ebx
    349a:	81 c3 5b 6b 00 00    	add    $0x6b5b,%ebx
    34a0:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    34a4:	8b 44 24 10          	mov    0x10(%esp),%eax
    34a8:	8b 10                	mov    (%eax),%edx
    34aa:	8b 40 04             	mov    0x4(%eax),%eax
    34ad:	89 04 24             	mov    %eax,(%esp)
    34b0:	e8 5b fa ff ff       	call   2f10 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    34b5:	83 c4 08             	add    $0x8,%esp
    34b8:	5b                   	pop    %ebx
    34b9:	c3                   	ret
    34ba:	66 90                	xchg   %ax,%ax
    34bc:	66 90                	xchg   %ax,%ax
    34be:	66 90                	xchg   %ax,%ax

000034c0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE>:
    34c0:	53                   	push   %ebx
    34c1:	83 ec 08             	sub    $0x8,%esp
    34c4:	e8 00 00 00 00       	call   34c9 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE+0x9>
    34c9:	5b                   	pop    %ebx
    34ca:	81 c3 2b 6b 00 00    	add    $0x6b2b,%ebx
    34d0:	8b 44 24 10          	mov    0x10(%esp),%eax
    34d4:	8b 48 04             	mov    0x4(%eax),%ecx
    34d7:	83 ec 08             	sub    $0x8,%esp
    34da:	ff 74 24 1c          	push   0x1c(%esp)
    34de:	ff 30                	push   (%eax)
    34e0:	ff 51 0c             	call   *0xc(%ecx)
    34e3:	83 c4 18             	add    $0x18,%esp
    34e6:	5b                   	pop    %ebx
    34e7:	c3                   	ret
    34e8:	66 90                	xchg   %ax,%ax
    34ea:	66 90                	xchg   %ax,%ax
    34ec:	66 90                	xchg   %ax,%ax
    34ee:	66 90                	xchg   %ax,%ax

000034f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>:
    34f0:	55                   	push   %ebp
    34f1:	53                   	push   %ebx
    34f2:	57                   	push   %edi
    34f3:	56                   	push   %esi
    34f4:	83 ec 2c             	sub    $0x2c,%esp
    34f7:	e8 00 00 00 00       	call   34fc <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc>
    34fc:	5b                   	pop    %ebx
    34fd:	81 c3 f8 6a 00 00    	add    $0x6af8,%ebx
    3503:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    3507:	c7 44 24 20 20 00 00 	movl   $0xe0000020,0x20(%esp)
    350e:	e0 
    350f:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    3516:	00 
    3517:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    351b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    351f:	8b 7d 10             	mov    0x10(%ebp),%edi
    3522:	85 ff                	test   %edi,%edi
    3524:	0f 84 10 01 00 00    	je     363a <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x14a>
    352a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    352d:	85 c9                	test   %ecx,%ecx
    352f:	0f 84 9e 01 00 00    	je     36d3 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    3535:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
    3538:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    353b:	89 44 24 14          	mov    %eax,0x14(%esp)
    353f:	8d 47 18             	lea    0x18(%edi),%eax
    3542:	8b 55 00             	mov    0x0(%ebp),%edx
    3545:	8b 75 08             	mov    0x8(%ebp),%esi
    3548:	89 74 24 10          	mov    %esi,0x10(%esp)
    354c:	49                   	dec    %ecx
    354d:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    3553:	41                   	inc    %ecx
    3554:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3558:	31 f6                	xor    %esi,%esi
    355a:	89 54 24 28          	mov    %edx,0x28(%esp)
    355e:	eb 11                	jmp    3571 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x81>
    3560:	46                   	inc    %esi
    3561:	89 ef                	mov    %ebp,%edi
    3563:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    3567:	8b 54 24 28          	mov    0x28(%esp),%edx
    356b:	0f 84 4f 01 00 00    	je     36c0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1d0>
    3571:	89 c5                	mov    %eax,%ebp
    3573:	8b 44 f2 04          	mov    0x4(%edx,%esi,8),%eax
    3577:	85 c0                	test   %eax,%eax
    3579:	74 1d                	je     3598 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xa8>
    357b:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    357f:	83 ec 04             	sub    $0x4,%esp
    3582:	50                   	push   %eax
    3583:	ff 34 f2             	push   (%edx,%esi,8)
    3586:	ff 74 24 24          	push   0x24(%esp)
    358a:	ff 51 0c             	call   *0xc(%ecx)
    358d:	83 c4 10             	add    $0x10,%esp
    3590:	84 c0                	test   %al,%al
    3592:	0f 85 37 01 00 00    	jne    36cf <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    3598:	0f b7 47 08          	movzwl 0x8(%edi),%eax
    359c:	85 c0                	test   %eax,%eax
    359e:	74 30                	je     35d0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xe0>
    35a0:	83 f8 01             	cmp    $0x1,%eax
    35a3:	75 3b                	jne    35e0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf0>
    35a5:	8b 47 0c             	mov    0xc(%edi),%eax
    35a8:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    35ac:	0f b7 44 c1 04       	movzwl 0x4(%ecx,%eax,8),%eax
    35b1:	0f b7 0f             	movzwl (%edi),%ecx
    35b4:	83 f9 02             	cmp    $0x2,%ecx
    35b7:	74 23                	je     35dc <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xec>
    35b9:	83 f9 01             	cmp    $0x1,%ecx
    35bc:	75 32                	jne    35f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x100>
    35be:	8b 4f 04             	mov    0x4(%edi),%ecx
    35c1:	8b 54 24 10          	mov    0x10(%esp),%edx
    35c5:	0f b7 4c ca 04       	movzwl 0x4(%edx,%ecx,8),%ecx
    35ca:	eb 28                	jmp    35f4 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x104>
    35cc:	90                   	nop
    35cd:	90                   	nop
    35ce:	90                   	nop
    35cf:	90                   	nop
    35d0:	0f b7 47 0a          	movzwl 0xa(%edi),%eax
    35d4:	0f b7 0f             	movzwl (%edi),%ecx
    35d7:	83 f9 02             	cmp    $0x2,%ecx
    35da:	75 dd                	jne    35b9 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc9>
    35dc:	31 c9                	xor    %ecx,%ecx
    35de:	eb 14                	jmp    35f4 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x104>
    35e0:	31 c0                	xor    %eax,%eax
    35e2:	0f b7 0f             	movzwl (%edi),%ecx
    35e5:	83 f9 02             	cmp    $0x2,%ecx
    35e8:	75 cf                	jne    35b9 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc9>
    35ea:	eb f0                	jmp    35dc <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xec>
    35ec:	90                   	nop
    35ed:	90                   	nop
    35ee:	90                   	nop
    35ef:	90                   	nop
    35f0:	0f b7 4f 02          	movzwl 0x2(%edi),%ecx
    35f4:	8b 57 10             	mov    0x10(%edi),%edx
    35f7:	8b 7f 14             	mov    0x14(%edi),%edi
    35fa:	89 7c 24 20          	mov    %edi,0x20(%esp)
    35fe:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    3603:	66 89 4c 24 26       	mov    %cx,0x26(%esp)
    3608:	83 ec 08             	sub    $0x8,%esp
    360b:	8d 44 24 20          	lea    0x20(%esp),%eax
    360f:	50                   	push   %eax
    3610:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3614:	ff 34 d0             	push   (%eax,%edx,8)
    3617:	ff 54 d0 04          	call   *0x4(%eax,%edx,8)
    361b:	83 c4 10             	add    $0x10,%esp
    361e:	84 c0                	test   %al,%al
    3620:	0f 85 a9 00 00 00    	jne    36cf <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    3626:	89 e8                	mov    %ebp,%eax
    3628:	3b 6c 24 14          	cmp    0x14(%esp),%ebp
    362c:	0f 84 2e ff ff ff    	je     3560 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    3632:	8d 45 18             	lea    0x18(%ebp),%eax
    3635:	e9 26 ff ff ff       	jmp    3560 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    363a:	8b 45 0c             	mov    0xc(%ebp),%eax
    363d:	85 c0                	test   %eax,%eax
    363f:	0f 84 8e 00 00 00    	je     36d3 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    3645:	89 c1                	mov    %eax,%ecx
    3647:	8b 75 08             	mov    0x8(%ebp),%esi
    364a:	8d 04 c6             	lea    (%esi,%eax,8),%eax
    364d:	89 44 24 10          	mov    %eax,0x10(%esp)
    3651:	8d 46 08             	lea    0x8(%esi),%eax
    3654:	8b 55 00             	mov    0x0(%ebp),%edx
    3657:	49                   	dec    %ecx
    3658:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    365e:	41                   	inc    %ecx
    365f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3663:	31 ed                	xor    %ebp,%ebp
    3665:	89 54 24 14          	mov    %edx,0x14(%esp)
    3669:	90                   	nop
    366a:	90                   	nop
    366b:	90                   	nop
    366c:	90                   	nop
    366d:	90                   	nop
    366e:	90                   	nop
    366f:	90                   	nop
    3670:	89 c7                	mov    %eax,%edi
    3672:	8b 44 ea 04          	mov    0x4(%edx,%ebp,8),%eax
    3676:	85 c0                	test   %eax,%eax
    3678:	74 19                	je     3693 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1a3>
    367a:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    367e:	83 ec 04             	sub    $0x4,%esp
    3681:	50                   	push   %eax
    3682:	ff 34 ea             	push   (%edx,%ebp,8)
    3685:	ff 74 24 24          	push   0x24(%esp)
    3689:	ff 51 0c             	call   *0xc(%ecx)
    368c:	83 c4 10             	add    $0x10,%esp
    368f:	84 c0                	test   %al,%al
    3691:	75 3c                	jne    36cf <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    3693:	83 ec 08             	sub    $0x8,%esp
    3696:	8d 44 24 20          	lea    0x20(%esp),%eax
    369a:	50                   	push   %eax
    369b:	ff 36                	push   (%esi)
    369d:	ff 56 04             	call   *0x4(%esi)
    36a0:	83 c4 10             	add    $0x10,%esp
    36a3:	84 c0                	test   %al,%al
    36a5:	75 28                	jne    36cf <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    36a7:	45                   	inc    %ebp
    36a8:	31 c0                	xor    %eax,%eax
    36aa:	3b 7c 24 10          	cmp    0x10(%esp),%edi
    36ae:	0f 95 c0             	setne  %al
    36b1:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    36b4:	89 fe                	mov    %edi,%esi
    36b6:	39 6c 24 0c          	cmp    %ebp,0xc(%esp)
    36ba:	8b 54 24 14          	mov    0x14(%esp),%edx
    36be:	75 b0                	jne    3670 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x180>
    36c0:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    36c4:	8b 54 24 0c          	mov    0xc(%esp),%edx
    36c8:	3b 55 04             	cmp    0x4(%ebp),%edx
    36cb:	72 0d                	jb     36da <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1ea>
    36cd:	eb 2e                	jmp    36fd <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    36cf:	b0 01                	mov    $0x1,%al
    36d1:	eb 2c                	jmp    36ff <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    36d3:	31 d2                	xor    %edx,%edx
    36d5:	3b 55 04             	cmp    0x4(%ebp),%edx
    36d8:	73 23                	jae    36fd <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    36da:	8b 45 00             	mov    0x0(%ebp),%eax
    36dd:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    36e1:	83 ec 04             	sub    $0x4,%esp
    36e4:	ff 74 d0 04          	push   0x4(%eax,%edx,8)
    36e8:	ff 34 d0             	push   (%eax,%edx,8)
    36eb:	ff 74 24 24          	push   0x24(%esp)
    36ef:	ff 51 0c             	call   *0xc(%ecx)
    36f2:	83 c4 10             	add    $0x10,%esp
    36f5:	89 c1                	mov    %eax,%ecx
    36f7:	b0 01                	mov    $0x1,%al
    36f9:	84 c9                	test   %cl,%cl
    36fb:	75 02                	jne    36ff <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    36fd:	31 c0                	xor    %eax,%eax
    36ff:	83 c4 2c             	add    $0x2c,%esp
    3702:	5e                   	pop    %esi
    3703:	5f                   	pop    %edi
    3704:	5b                   	pop    %ebx
    3705:	5d                   	pop    %ebp
    3706:	c3                   	ret
    3707:	66 90                	xchg   %ax,%ax
    3709:	66 90                	xchg   %ax,%ax
    370b:	66 90                	xchg   %ax,%ax
    370d:	66 90                	xchg   %ax,%ax
    370f:	90                   	nop

00003710 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E>:
    3710:	53                   	push   %ebx
    3711:	83 ec 08             	sub    $0x8,%esp
    3714:	e8 00 00 00 00       	call   3719 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x9>
    3719:	5b                   	pop    %ebx
    371a:	81 c3 db 68 00 00    	add    $0x68db,%ebx
    3720:	8b 44 24 14          	mov    0x14(%esp),%eax
    3724:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    3728:	8b 09                	mov    (%ecx),%ecx
    372a:	89 04 24             	mov    %eax,(%esp)
    372d:	ba 01 00 00 00       	mov    $0x1,%edx
    3732:	e8 09 00 00 00       	call   3740 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>
    3737:	83 c4 08             	add    $0x8,%esp
    373a:	5b                   	pop    %ebx
    373b:	c3                   	ret
    373c:	66 90                	xchg   %ax,%ax
    373e:	66 90                	xchg   %ax,%ax

00003740 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>:
    3740:	55                   	push   %ebp
    3741:	53                   	push   %ebx
    3742:	57                   	push   %edi
    3743:	56                   	push   %esi
    3744:	83 ec 1c             	sub    $0x1c,%esp
    3747:	89 54 24 0c          	mov    %edx,0xc(%esp)
    374b:	e8 00 00 00 00       	call   3750 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x10>
    3750:	5b                   	pop    %ebx
    3751:	81 c3 a4 68 00 00    	add    $0x68a4,%ebx
    3757:	b8 0a 00 00 00       	mov    $0xa,%eax
    375c:	89 ca                	mov    %ecx,%edx
    375e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3762:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
    3768:	72 66                	jb     37d0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x90>
    376a:	bf 0a 00 00 00       	mov    $0xa,%edi
    376f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3773:	90                   	nop
    3774:	90                   	nop
    3775:	90                   	nop
    3776:	90                   	nop
    3777:	90                   	nop
    3778:	90                   	nop
    3779:	90                   	nop
    377a:	90                   	nop
    377b:	90                   	nop
    377c:	90                   	nop
    377d:	90                   	nop
    377e:	90                   	nop
    377f:	90                   	nop
    3780:	89 c8                	mov    %ecx,%eax
    3782:	ba 59 17 b7 d1       	mov    $0xd1b71759,%edx
    3787:	f7 e2                	mul    %edx
    3789:	c1 ea 0d             	shr    $0xd,%edx
    378c:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    3792:	89 ce                	mov    %ecx,%esi
    3794:	29 c6                	sub    %eax,%esi
    3796:	69 c6 7b 14 00 00    	imul   $0x147b,%esi,%eax
    379c:	c1 e8 13             	shr    $0x13,%eax
    379f:	6b e8 64             	imul   $0x64,%eax,%ebp
    37a2:	29 ee                	sub    %ebp,%esi
    37a4:	0f b7 84 43 cb db ff 	movzwl -0x2435(%ebx,%eax,2),%eax
    37ab:	ff 
    37ac:	66 89 44 3c 0e       	mov    %ax,0xe(%esp,%edi,1)
    37b1:	0f b7 c6             	movzwl %si,%eax
    37b4:	0f b7 84 43 cb db ff 	movzwl -0x2435(%ebx,%eax,2),%eax
    37bb:	ff 
    37bc:	66 89 44 3c 10       	mov    %ax,0x10(%esp,%edi,1)
    37c1:	8d 47 fc             	lea    -0x4(%edi),%eax
    37c4:	89 c7                	mov    %eax,%edi
    37c6:	81 f9 7f 96 98 00    	cmp    $0x98967f,%ecx
    37cc:	89 d1                	mov    %edx,%ecx
    37ce:	77 b0                	ja     3780 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x40>
    37d0:	83 fa 09             	cmp    $0x9,%edx
    37d3:	76 29                	jbe    37fe <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xbe>
    37d5:	0f b7 ca             	movzwl %dx,%ecx
    37d8:	c1 e9 02             	shr    $0x2,%ecx
    37db:	69 c9 7b 14 00 00    	imul   $0x147b,%ecx,%ecx
    37e1:	c1 e9 11             	shr    $0x11,%ecx
    37e4:	6b f1 64             	imul   $0x64,%ecx,%esi
    37e7:	29 f2                	sub    %esi,%edx
    37e9:	0f b7 d2             	movzwl %dx,%edx
    37ec:	0f b7 94 53 cb db ff 	movzwl -0x2435(%ebx,%edx,2),%edx
    37f3:	ff 
    37f4:	66 89 54 04 10       	mov    %dx,0x10(%esp,%eax,1)
    37f9:	83 c0 fe             	add    $0xfffffffe,%eax
    37fc:	89 ca                	mov    %ecx,%edx
    37fe:	8b 74 24 30          	mov    0x30(%esp),%esi
    3802:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    3807:	74 04                	je     380d <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xcd>
    3809:	85 d2                	test   %edx,%edx
    380b:	74 10                	je     381d <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xdd>
    380d:	83 e2 0f             	and    $0xf,%edx
    3810:	0f b6 8c 53 cc db ff 	movzbl -0x2434(%ebx,%edx,2),%ecx
    3817:	ff 
    3818:	88 4c 04 11          	mov    %cl,0x11(%esp,%eax,1)
    381c:	48                   	dec    %eax
    381d:	bf 0a 00 00 00       	mov    $0xa,%edi
    3822:	29 c7                	sub    %eax,%edi
    3824:	01 e0                	add    %esp,%eax
    3826:	83 c0 12             	add    $0x12,%eax
    3829:	0f b6 54 24 0c       	movzbl 0xc(%esp),%edx
    382e:	89 f1                	mov    %esi,%ecx
    3830:	57                   	push   %edi
    3831:	50                   	push   %eax
    3832:	6a 00                	push   $0x0
    3834:	6a 01                	push   $0x1
    3836:	e8 d5 f3 ff ff       	call   2c10 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    383b:	83 c4 2c             	add    $0x2c,%esp
    383e:	5e                   	pop    %esi
    383f:	5f                   	pop    %edi
    3840:	5b                   	pop    %ebx
    3841:	5d                   	pop    %ebp
    3842:	c3                   	ret
    3843:	66 90                	xchg   %ax,%ax
    3845:	66 90                	xchg   %ax,%ax
    3847:	66 90                	xchg   %ax,%ax
    3849:	66 90                	xchg   %ax,%ax
    384b:	66 90                	xchg   %ax,%ax
    384d:	66 90                	xchg   %ax,%ax
    384f:	90                   	nop

00003850 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE>:
    3850:	53                   	push   %ebx
    3851:	57                   	push   %edi
    3852:	56                   	push   %esi
    3853:	e8 00 00 00 00       	call   3858 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x8>
    3858:	5a                   	pop    %edx
    3859:	81 c2 9c 67 00 00    	add    $0x679c,%edx
    385f:	89 ce                	mov    %ecx,%esi
    3861:	c1 e6 0b             	shl    $0xb,%esi
    3864:	31 c0                	xor    %eax,%eax
    3866:	81 f9 2f 18 01 00    	cmp    $0x1182f,%ecx
    386c:	0f 83 d5 00 00 00    	jae    3947 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf7>
    3872:	8b bc 82 34 e3 ff ff 	mov    -0x1ccc(%edx,%eax,4),%edi
    3879:	c1 e7 0b             	shl    $0xb,%edi
    387c:	39 f7                	cmp    %esi,%edi
    387e:	0f 86 da 00 00 00    	jbe    395e <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x10e>
    3884:	8b bc 82 24 e3 ff ff 	mov    -0x1cdc(%edx,%eax,4),%edi
    388b:	c1 e7 0b             	shl    $0xb,%edi
    388e:	39 f7                	cmp    %esi,%edi
    3890:	0f 86 dd 00 00 00    	jbe    3973 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x123>
    3896:	8b bc 82 1c e3 ff ff 	mov    -0x1ce4(%edx,%eax,4),%edi
    389d:	c1 e7 0b             	shl    $0xb,%edi
    38a0:	39 f7                	cmp    %esi,%edi
    38a2:	0f 86 e0 00 00 00    	jbe    3988 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x138>
    38a8:	8b bc 82 18 e3 ff ff 	mov    -0x1ce8(%edx,%eax,4),%edi
    38af:	c1 e7 0b             	shl    $0xb,%edi
    38b2:	39 f7                	cmp    %esi,%edi
    38b4:	0f 86 e3 00 00 00    	jbe    399d <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x14d>
    38ba:	8b bc 82 18 e3 ff ff 	mov    -0x1ce8(%edx,%eax,4),%edi
    38c1:	c1 e7 0b             	shl    $0xb,%edi
    38c4:	39 f7                	cmp    %esi,%edi
    38c6:	77 01                	ja     38c9 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x79>
    38c8:	40                   	inc    %eax
    38c9:	8b bc 82 14 e3 ff ff 	mov    -0x1cec(%edx,%eax,4),%edi
    38d0:	c1 e7 0b             	shl    $0xb,%edi
    38d3:	31 db                	xor    %ebx,%ebx
    38d5:	39 f7                	cmp    %esi,%edi
    38d7:	0f 94 c3             	sete   %bl
    38da:	11 c3                	adc    %eax,%ebx
    38dc:	8b 84 9a 14 e3 ff ff 	mov    -0x1cec(%edx,%ebx,4),%eax
    38e3:	c1 e8 15             	shr    $0x15,%eax
    38e6:	be ef 02 00 00       	mov    $0x2ef,%esi
    38eb:	83 fb 20             	cmp    $0x20,%ebx
    38ee:	77 12                	ja     3902 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xb2>
    38f0:	8b b4 9a 18 e3 ff ff 	mov    -0x1ce8(%edx,%ebx,4),%esi
    38f7:	c1 ee 15             	shr    $0x15,%esi
    38fa:	85 db                	test   %ebx,%ebx
    38fc:	0f 84 b3 00 00 00    	je     39b5 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x165>
    3902:	bf ff ff 1f 00       	mov    $0x1fffff,%edi
    3907:	23 bc 9a 10 e3 ff ff 	and    -0x1cf0(%edx,%ebx,4),%edi
    390e:	89 c3                	mov    %eax,%ebx
    3910:	f7 d3                	not    %ebx
    3912:	01 f3                	add    %esi,%ebx
    3914:	74 2b                	je     3941 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf1>
    3916:	29 f9                	sub    %edi,%ecx
    3918:	4e                   	dec    %esi
    3919:	01 c2                	add    %eax,%edx
    391b:	81 c2 2b d8 ff ff    	add    $0xffffd82b,%edx
    3921:	31 ff                	xor    %edi,%edi
    3923:	90                   	nop
    3924:	90                   	nop
    3925:	90                   	nop
    3926:	90                   	nop
    3927:	90                   	nop
    3928:	90                   	nop
    3929:	90                   	nop
    392a:	90                   	nop
    392b:	90                   	nop
    392c:	90                   	nop
    392d:	90                   	nop
    392e:	90                   	nop
    392f:	90                   	nop
    3930:	89 fb                	mov    %edi,%ebx
    3932:	0f b6 3a             	movzbl (%edx),%edi
    3935:	01 df                	add    %ebx,%edi
    3937:	39 cf                	cmp    %ecx,%edi
    3939:	77 06                	ja     3941 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf1>
    393b:	40                   	inc    %eax
    393c:	42                   	inc    %edx
    393d:	39 c6                	cmp    %eax,%esi
    393f:	75 ef                	jne    3930 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xe0>
    3941:	24 01                	and    $0x1,%al
    3943:	5e                   	pop    %esi
    3944:	5f                   	pop    %edi
    3945:	5b                   	pop    %ebx
    3946:	c3                   	ret
    3947:	b8 11 00 00 00       	mov    $0x11,%eax
    394c:	8b bc 82 34 e3 ff ff 	mov    -0x1ccc(%edx,%eax,4),%edi
    3953:	c1 e7 0b             	shl    $0xb,%edi
    3956:	39 f7                	cmp    %esi,%edi
    3958:	0f 87 26 ff ff ff    	ja     3884 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x34>
    395e:	83 c8 08             	or     $0x8,%eax
    3961:	8b bc 82 24 e3 ff ff 	mov    -0x1cdc(%edx,%eax,4),%edi
    3968:	c1 e7 0b             	shl    $0xb,%edi
    396b:	39 f7                	cmp    %esi,%edi
    396d:	0f 87 23 ff ff ff    	ja     3896 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x46>
    3973:	83 c8 04             	or     $0x4,%eax
    3976:	8b bc 82 1c e3 ff ff 	mov    -0x1ce4(%edx,%eax,4),%edi
    397d:	c1 e7 0b             	shl    $0xb,%edi
    3980:	39 f7                	cmp    %esi,%edi
    3982:	0f 87 20 ff ff ff    	ja     38a8 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x58>
    3988:	83 c8 02             	or     $0x2,%eax
    398b:	8b bc 82 18 e3 ff ff 	mov    -0x1ce8(%edx,%eax,4),%edi
    3992:	c1 e7 0b             	shl    $0xb,%edi
    3995:	39 f7                	cmp    %esi,%edi
    3997:	0f 87 1d ff ff ff    	ja     38ba <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x6a>
    399d:	40                   	inc    %eax
    399e:	8b bc 82 18 e3 ff ff 	mov    -0x1ce8(%edx,%eax,4),%edi
    39a5:	c1 e7 0b             	shl    $0xb,%edi
    39a8:	39 f7                	cmp    %esi,%edi
    39aa:	0f 86 18 ff ff ff    	jbe    38c8 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x78>
    39b0:	e9 14 ff ff ff       	jmp    38c9 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0x79>
    39b5:	31 ff                	xor    %edi,%edi
    39b7:	89 c3                	mov    %eax,%ebx
    39b9:	f7 d3                	not    %ebx
    39bb:	01 f3                	add    %esi,%ebx
    39bd:	0f 85 53 ff ff ff    	jne    3916 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xc6>
    39c3:	e9 79 ff ff ff       	jmp    3941 <_ZN4core7unicode12unicode_data15grapheme_extend11lookup_slow17h1564a2dab4ebeb9dE+0xf1>
    39c8:	66 90                	xchg   %ax,%ax
    39ca:	66 90                	xchg   %ax,%ax
    39cc:	66 90                	xchg   %ax,%ax
    39ce:	66 90                	xchg   %ax,%ax

000039d0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>:
    39d0:	55                   	push   %ebp
    39d1:	53                   	push   %ebx
    39d2:	57                   	push   %edi
    39d3:	56                   	push   %esi
    39d4:	83 ec 2c             	sub    $0x2c,%esp
    39d7:	89 ce                	mov    %ecx,%esi
    39d9:	e8 00 00 00 00       	call   39de <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0xe>
    39de:	5b                   	pop    %ebx
    39df:	81 c3 16 66 00 00    	add    $0x6616,%ebx
    39e5:	b1 01                	mov    $0x1,%cl
    39e7:	80 7e 04 00          	cmpb   $0x0,0x4(%esi)
    39eb:	0f 85 23 01 00 00    	jne    3b14 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    39f1:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    39f5:	8b 3e                	mov    (%esi),%edi
    39f7:	f6 47 0a 80          	testb  $0x80,0xa(%edi)
    39fb:	0f b6 4e 05          	movzbl 0x5(%esi),%ecx
    39ff:	75 1b                	jne    3a1c <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x4c>
    3a01:	0f b6 c1             	movzbl %cl,%eax
    3a04:	83 f0 03             	xor    $0x3,%eax
    3a07:	89 d5                	mov    %edx,%ebp
    3a09:	84 c9                	test   %cl,%cl
    3a0b:	0f 85 ce 00 00 00    	jne    3adf <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x10f>
    3a11:	8d 8b b9 db ff ff    	lea    -0x2447(%ebx),%ecx
    3a17:	e9 c9 00 00 00       	jmp    3ae5 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x115>
    3a1c:	84 c9                	test   %cl,%cl
    3a1e:	75 29                	jne    3a49 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x79>
    3a20:	8b 47 04             	mov    0x4(%edi),%eax
    3a23:	83 ec 04             	sub    $0x4,%esp
    3a26:	8d 8b be db ff ff    	lea    -0x2442(%ebx),%ecx
    3a2c:	6a 03                	push   $0x3
    3a2e:	51                   	push   %ecx
    3a2f:	ff 37                	push   (%edi)
    3a31:	89 d5                	mov    %edx,%ebp
    3a33:	ff 50 0c             	call   *0xc(%eax)
    3a36:	89 ea                	mov    %ebp,%edx
    3a38:	8b 6c 24 58          	mov    0x58(%esp),%ebp
    3a3c:	83 c4 10             	add    $0x10,%esp
    3a3f:	b1 01                	mov    $0x1,%cl
    3a41:	84 c0                	test   %al,%al
    3a43:	0f 85 cb 00 00 00    	jne    3b14 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3a49:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    3a4e:	8b 07                	mov    (%edi),%eax
    3a50:	8b 4f 04             	mov    0x4(%edi),%ecx
    3a53:	89 44 24 20          	mov    %eax,0x20(%esp)
    3a57:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    3a5b:	8d 44 24 0f          	lea    0xf(%esp),%eax
    3a5f:	89 44 24 28          	mov    %eax,0x28(%esp)
    3a63:	8b 47 08             	mov    0x8(%edi),%eax
    3a66:	8b 4f 0c             	mov    0xc(%edi),%ecx
    3a69:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    3a6d:	89 44 24 18          	mov    %eax,0x18(%esp)
    3a71:	8d 7c 24 20          	lea    0x20(%esp),%edi
    3a75:	89 7c 24 10          	mov    %edi,0x10(%esp)
    3a79:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    3a7f:	89 44 24 14          	mov    %eax,0x14(%esp)
    3a83:	83 ec 04             	sub    $0x4,%esp
    3a86:	ff 74 24 44          	push   0x44(%esp)
    3a8a:	52                   	push   %edx
    3a8b:	57                   	push   %edi
    3a8c:	e8 cf 00 00 00       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    3a91:	83 c4 10             	add    $0x10,%esp
    3a94:	84 c0                	test   %al,%al
    3a96:	75 7a                	jne    3b12 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    3a98:	83 ec 04             	sub    $0x4,%esp
    3a9b:	8d 83 b7 db ff ff    	lea    -0x2449(%ebx),%eax
    3aa1:	6a 02                	push   $0x2
    3aa3:	50                   	push   %eax
    3aa4:	57                   	push   %edi
    3aa5:	e8 b6 00 00 00       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    3aaa:	83 c4 10             	add    $0x10,%esp
    3aad:	84 c0                	test   %al,%al
    3aaf:	75 61                	jne    3b12 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    3ab1:	83 ec 08             	sub    $0x8,%esp
    3ab4:	8d 44 24 18          	lea    0x18(%esp),%eax
    3ab8:	50                   	push   %eax
    3ab9:	ff 74 24 50          	push   0x50(%esp)
    3abd:	ff d5                	call   *%ebp
    3abf:	83 c4 10             	add    $0x10,%esp
    3ac2:	84 c0                	test   %al,%al
    3ac4:	75 4c                	jne    3b12 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    3ac6:	8b 44 24 14          	mov    0x14(%esp),%eax
    3aca:	83 ec 04             	sub    $0x4,%esp
    3acd:	8d 8b c1 db ff ff    	lea    -0x243f(%ebx),%ecx
    3ad3:	6a 02                	push   $0x2
    3ad5:	51                   	push   %ecx
    3ad6:	ff 74 24 1c          	push   0x1c(%esp)
    3ada:	ff 50 0c             	call   *0xc(%eax)
    3add:	eb 71                	jmp    3b50 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x180>
    3adf:	8d 8b bc db ff ff    	lea    -0x2444(%ebx),%ecx
    3ae5:	8b 57 04             	mov    0x4(%edi),%edx
    3ae8:	83 ec 04             	sub    $0x4,%esp
    3aeb:	50                   	push   %eax
    3aec:	51                   	push   %ecx
    3aed:	ff 37                	push   (%edi)
    3aef:	ff 52 0c             	call   *0xc(%edx)
    3af2:	83 c4 10             	add    $0x10,%esp
    3af5:	b1 01                	mov    $0x1,%cl
    3af7:	84 c0                	test   %al,%al
    3af9:	75 19                	jne    3b14 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3afb:	8b 47 04             	mov    0x4(%edi),%eax
    3afe:	83 ec 04             	sub    $0x4,%esp
    3b01:	ff 74 24 44          	push   0x44(%esp)
    3b05:	55                   	push   %ebp
    3b06:	ff 37                	push   (%edi)
    3b08:	ff 50 0c             	call   *0xc(%eax)
    3b0b:	83 c4 10             	add    $0x10,%esp
    3b0e:	84 c0                	test   %al,%al
    3b10:	74 13                	je     3b25 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x155>
    3b12:	b1 01                	mov    $0x1,%cl
    3b14:	88 4e 04             	mov    %cl,0x4(%esi)
    3b17:	c6 46 05 01          	movb   $0x1,0x5(%esi)
    3b1b:	89 f0                	mov    %esi,%eax
    3b1d:	83 c4 2c             	add    $0x2c,%esp
    3b20:	5e                   	pop    %esi
    3b21:	5f                   	pop    %edi
    3b22:	5b                   	pop    %ebx
    3b23:	5d                   	pop    %ebp
    3b24:	c3                   	ret
    3b25:	8b 47 04             	mov    0x4(%edi),%eax
    3b28:	83 ec 04             	sub    $0x4,%esp
    3b2b:	8d 8b b7 db ff ff    	lea    -0x2449(%ebx),%ecx
    3b31:	6a 02                	push   $0x2
    3b33:	51                   	push   %ecx
    3b34:	ff 37                	push   (%edi)
    3b36:	ff 50 0c             	call   *0xc(%eax)
    3b39:	83 c4 10             	add    $0x10,%esp
    3b3c:	84 c0                	test   %al,%al
    3b3e:	8b 44 24 48          	mov    0x48(%esp),%eax
    3b42:	b1 01                	mov    $0x1,%cl
    3b44:	75 ce                	jne    3b14 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3b46:	83 ec 08             	sub    $0x8,%esp
    3b49:	57                   	push   %edi
    3b4a:	ff 74 24 50          	push   0x50(%esp)
    3b4e:	ff d0                	call   *%eax
    3b50:	83 c4 10             	add    $0x10,%esp
    3b53:	89 c1                	mov    %eax,%ecx
    3b55:	eb bd                	jmp    3b14 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    3b57:	66 90                	xchg   %ax,%ax
    3b59:	66 90                	xchg   %ax,%ax
    3b5b:	66 90                	xchg   %ax,%ax
    3b5d:	66 90                	xchg   %ax,%ax
    3b5f:	90                   	nop

00003b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>:
    3b60:	55                   	push   %ebp
    3b61:	53                   	push   %ebx
    3b62:	57                   	push   %edi
    3b63:	56                   	push   %esi
    3b64:	83 ec 2c             	sub    $0x2c,%esp
    3b67:	e8 00 00 00 00       	call   3b6c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc>
    3b6c:	5b                   	pop    %ebx
    3b6d:	81 c3 88 64 00 00    	add    $0x6488,%ebx
    3b73:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3b77:	8b 74 24 44          	mov    0x44(%esp),%esi
    3b7b:	8b 44 24 40          	mov    0x40(%esp),%eax
    3b7f:	8b 48 08             	mov    0x8(%eax),%ecx
    3b82:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    3b86:	8b 08                	mov    (%eax),%ecx
    3b88:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    3b8c:	8b 40 04             	mov    0x4(%eax),%eax
    3b8f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3b93:	31 d2                	xor    %edx,%edx
    3b95:	8d 83 82 d6 ff ff    	lea    -0x297e(%ebx),%eax
    3b9b:	89 44 24 28          	mov    %eax,0x28(%esp)
    3b9f:	31 c0                	xor    %eax,%eax
    3ba1:	31 c9                	xor    %ecx,%ecx
    3ba3:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    3ba7:	eb 48                	jmp    3bf1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x91>
    3ba9:	90                   	nop
    3baa:	90                   	nop
    3bab:	90                   	nop
    3bac:	90                   	nop
    3bad:	90                   	nop
    3bae:	90                   	nop
    3baf:	90                   	nop
    3bb0:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    3bb4:	80 7c 31 ff 0a       	cmpb   $0xa,-0x1(%ecx,%esi,1)
    3bb9:	89 ce                	mov    %ecx,%esi
    3bbb:	0f 94 c1             	sete   %cl
    3bbe:	01 f2                	add    %esi,%edx
    3bc0:	89 d5                	mov    %edx,%ebp
    3bc2:	8b 54 24 24          	mov    0x24(%esp),%edx
    3bc6:	88 0a                	mov    %cl,(%edx)
    3bc8:	83 ec 04             	sub    $0x4,%esp
    3bcb:	50                   	push   %eax
    3bcc:	55                   	push   %ebp
    3bcd:	ff 74 24 2c          	push   0x2c(%esp)
    3bd1:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    3bd5:	ff 50 0c             	call   *0xc(%eax)
    3bd8:	83 c4 10             	add    $0x10,%esp
    3bdb:	89 fa                	mov    %edi,%edx
    3bdd:	84 c0                	test   %al,%al
    3bdf:	8b 44 24 10          	mov    0x10(%esp),%eax
    3be3:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3be7:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    3beb:	0f 85 d0 01 00 00    	jne    3dc1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x261>
    3bf1:	f6 c1 01             	test   $0x1,%cl
    3bf4:	0f 85 c3 01 00 00    	jne    3dbd <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x25d>
    3bfa:	39 c5                	cmp    %eax,%ebp
    3bfc:	73 12                	jae    3c10 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xb0>
    3bfe:	89 c7                	mov    %eax,%edi
    3c00:	e9 5b 01 00 00       	jmp    3d60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    3c05:	90                   	nop
    3c06:	90                   	nop
    3c07:	90                   	nop
    3c08:	90                   	nop
    3c09:	90                   	nop
    3c0a:	90                   	nop
    3c0b:	90                   	nop
    3c0c:	90                   	nop
    3c0d:	90                   	nop
    3c0e:	90                   	nop
    3c0f:	90                   	nop
    3c10:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3c14:	eb 18                	jmp    3c2e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xce>
    3c16:	90                   	nop
    3c17:	90                   	nop
    3c18:	90                   	nop
    3c19:	90                   	nop
    3c1a:	90                   	nop
    3c1b:	90                   	nop
    3c1c:	90                   	nop
    3c1d:	90                   	nop
    3c1e:	90                   	nop
    3c1f:	90                   	nop
    3c20:	89 f8                	mov    %edi,%eax
    3c22:	39 ef                	cmp    %ebp,%edi
    3c24:	8b 74 24 44          	mov    0x44(%esp),%esi
    3c28:	0f 87 32 01 00 00    	ja     3d60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    3c2e:	89 e9                	mov    %ebp,%ecx
    3c30:	29 c1                	sub    %eax,%ecx
    3c32:	89 c7                	mov    %eax,%edi
    3c34:	01 f0                	add    %esi,%eax
    3c36:	83 f9 07             	cmp    $0x7,%ecx
    3c39:	89 7c 24 10          	mov    %edi,0x10(%esp)
    3c3d:	77 31                	ja     3c70 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x110>
    3c3f:	39 fd                	cmp    %edi,%ebp
    3c41:	0f 84 09 01 00 00    	je     3d50 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f0>
    3c47:	31 f6                	xor    %esi,%esi
    3c49:	90                   	nop
    3c4a:	90                   	nop
    3c4b:	90                   	nop
    3c4c:	90                   	nop
    3c4d:	90                   	nop
    3c4e:	90                   	nop
    3c4f:	90                   	nop
    3c50:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    3c54:	0f 84 c9 00 00 00    	je     3d23 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1c3>
    3c5a:	46                   	inc    %esi
    3c5b:	39 f1                	cmp    %esi,%ecx
    3c5d:	75 f1                	jne    3c50 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xf0>
    3c5f:	e9 ec 00 00 00       	jmp    3d50 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f0>
    3c64:	90                   	nop
    3c65:	90                   	nop
    3c66:	90                   	nop
    3c67:	90                   	nop
    3c68:	90                   	nop
    3c69:	90                   	nop
    3c6a:	90                   	nop
    3c6b:	90                   	nop
    3c6c:	90                   	nop
    3c6d:	90                   	nop
    3c6e:	90                   	nop
    3c6f:	90                   	nop
    3c70:	8d 78 03             	lea    0x3(%eax),%edi
    3c73:	83 e7 fc             	and    $0xfffffffc,%edi
    3c76:	89 fa                	mov    %edi,%edx
    3c78:	29 c2                	sub    %eax,%edx
    3c7a:	74 20                	je     3c9c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x13c>
    3c7c:	31 f6                	xor    %esi,%esi
    3c7e:	90                   	nop
    3c7f:	90                   	nop
    3c80:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    3c84:	0f 84 95 00 00 00    	je     3d1f <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bf>
    3c8a:	46                   	inc    %esi
    3c8b:	39 f2                	cmp    %esi,%edx
    3c8d:	75 f1                	jne    3c80 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x120>
    3c8f:	8d 71 f8             	lea    -0x8(%ecx),%esi
    3c92:	89 74 24 14          	mov    %esi,0x14(%esp)
    3c96:	39 f2                	cmp    %esi,%edx
    3c98:	76 09                	jbe    3ca3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x143>
    3c9a:	eb 51                	jmp    3ced <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    3c9c:	8d 71 f8             	lea    -0x8(%ecx),%esi
    3c9f:	89 74 24 14          	mov    %esi,0x14(%esp)
    3ca3:	be 04 00 00 00       	mov    $0x4,%esi
    3ca8:	01 f7                	add    %esi,%edi
    3caa:	90                   	nop
    3cab:	90                   	nop
    3cac:	90                   	nop
    3cad:	90                   	nop
    3cae:	90                   	nop
    3caf:	90                   	nop
    3cb0:	8b 5f fc             	mov    -0x4(%edi),%ebx
    3cb3:	8b 37                	mov    (%edi),%esi
    3cb5:	89 dd                	mov    %ebx,%ebp
    3cb7:	81 f5 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebp
    3cbd:	81 c5 01 01 01 01    	add    $0x1010101,%ebp
    3cc3:	09 dd                	or     %ebx,%ebp
    3cc5:	89 f3                	mov    %esi,%ebx
    3cc7:	81 f3 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebx
    3ccd:	81 c3 01 01 01 01    	add    $0x1010101,%ebx
    3cd3:	09 f3                	or     %esi,%ebx
    3cd5:	21 eb                	and    %ebp,%ebx
    3cd7:	f7 d3                	not    %ebx
    3cd9:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
    3cdf:	75 0c                	jne    3ced <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    3ce1:	83 c2 08             	add    $0x8,%edx
    3ce4:	83 c7 08             	add    $0x8,%edi
    3ce7:	3b 54 24 14          	cmp    0x14(%esp),%edx
    3ceb:	76 c3                	jbe    3cb0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x150>
    3ced:	39 d1                	cmp    %edx,%ecx
    3cef:	0f 84 bc 00 00 00    	je     3db1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x251>
    3cf5:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    3cf8:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3cfc:	89 ef                	mov    %ebp,%edi
    3cfe:	29 d7                	sub    %edx,%edi
    3d00:	2b 7c 24 10          	sub    0x10(%esp),%edi
    3d04:	31 f6                	xor    %esi,%esi
    3d06:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    3d0a:	90                   	nop
    3d0b:	90                   	nop
    3d0c:	90                   	nop
    3d0d:	90                   	nop
    3d0e:	90                   	nop
    3d0f:	90                   	nop
    3d10:	80 3c 31 0a          	cmpb   $0xa,(%ecx,%esi,1)
    3d14:	74 07                	je     3d1d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bd>
    3d16:	46                   	inc    %esi
    3d17:	39 f7                	cmp    %esi,%edi
    3d19:	75 f5                	jne    3d10 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1b0>
    3d1b:	eb 37                	jmp    3d54 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f4>
    3d1d:	01 d6                	add    %edx,%esi
    3d1f:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3d23:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    3d27:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
    3d2a:	47                   	inc    %edi
    3d2b:	01 f1                	add    %esi,%ecx
    3d2d:	39 e9                	cmp    %ebp,%ecx
    3d2f:	0f 83 eb fe ff ff    	jae    3c20 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    3d35:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    3d39:	0f 85 e1 fe ff ff    	jne    3c20 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    3d3f:	31 c9                	xor    %ecx,%ecx
    3d41:	89 f8                	mov    %edi,%eax
    3d43:	89 fe                	mov    %edi,%esi
    3d45:	eb 25                	jmp    3d6c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x20c>
    3d47:	90                   	nop
    3d48:	90                   	nop
    3d49:	90                   	nop
    3d4a:	90                   	nop
    3d4b:	90                   	nop
    3d4c:	90                   	nop
    3d4d:	90                   	nop
    3d4e:	90                   	nop
    3d4f:	90                   	nop
    3d50:	89 ef                	mov    %ebp,%edi
    3d52:	eb 0c                	jmp    3d60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    3d54:	89 ef                	mov    %ebp,%edi
    3d56:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3d5a:	90                   	nop
    3d5b:	90                   	nop
    3d5c:	90                   	nop
    3d5d:	90                   	nop
    3d5e:	90                   	nop
    3d5f:	90                   	nop
    3d60:	89 f8                	mov    %edi,%eax
    3d62:	b1 01                	mov    $0x1,%cl
    3d64:	89 d7                	mov    %edx,%edi
    3d66:	89 ee                	mov    %ebp,%esi
    3d68:	39 d5                	cmp    %edx,%ebp
    3d6a:	74 51                	je     3dbd <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x25d>
    3d6c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3d70:	89 44 24 10          	mov    %eax,0x10(%esp)
    3d74:	8b 44 24 24          	mov    0x24(%esp),%eax
    3d78:	80 38 00             	cmpb   $0x0,(%eax)
    3d7b:	74 1f                	je     3d9c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x23c>
    3d7d:	83 ec 04             	sub    $0x4,%esp
    3d80:	6a 04                	push   $0x4
    3d82:	ff 74 24 30          	push   0x30(%esp)
    3d86:	ff 74 24 2c          	push   0x2c(%esp)
    3d8a:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    3d8e:	89 d5                	mov    %edx,%ebp
    3d90:	ff 50 0c             	call   *0xc(%eax)
    3d93:	89 ea                	mov    %ebp,%edx
    3d95:	83 c4 10             	add    $0x10,%esp
    3d98:	84 c0                	test   %al,%al
    3d9a:	75 25                	jne    3dc1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x261>
    3d9c:	89 f0                	mov    %esi,%eax
    3d9e:	29 d0                	sub    %edx,%eax
    3da0:	0f 85 0a fe ff ff    	jne    3bb0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x50>
    3da6:	31 c9                	xor    %ecx,%ecx
    3da8:	8b 74 24 44          	mov    0x44(%esp),%esi
    3dac:	e9 0d fe ff ff       	jmp    3bbe <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x5e>
    3db1:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    3db5:	89 ef                	mov    %ebp,%edi
    3db7:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    3dbb:	eb 99                	jmp    3d56 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f6>
    3dbd:	31 c0                	xor    %eax,%eax
    3dbf:	eb 02                	jmp    3dc3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x263>
    3dc1:	b0 01                	mov    $0x1,%al
    3dc3:	83 c4 2c             	add    $0x2c,%esp
    3dc6:	5e                   	pop    %esi
    3dc7:	5f                   	pop    %edi
    3dc8:	5b                   	pop    %ebx
    3dc9:	5d                   	pop    %ebp
    3dca:	c3                   	ret
    3dcb:	66 90                	xchg   %ax,%ax
    3dcd:	66 90                	xchg   %ax,%ax
    3dcf:	90                   	nop

00003dd0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E>:
    3dd0:	55                   	push   %ebp
    3dd1:	53                   	push   %ebx
    3dd2:	57                   	push   %edi
    3dd3:	56                   	push   %esi
    3dd4:	83 ec 0c             	sub    $0xc,%esp
    3dd7:	e8 00 00 00 00       	call   3ddc <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0xc>
    3ddc:	5b                   	pop    %ebx
    3ddd:	81 c3 18 62 00 00    	add    $0x6218,%ebx
    3de3:	8b 44 24 20          	mov    0x20(%esp),%eax
    3de7:	8b 68 08             	mov    0x8(%eax),%ebp
    3dea:	8b 38                	mov    (%eax),%edi
    3dec:	8b 70 04             	mov    0x4(%eax),%esi
    3def:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
    3df3:	74 1e                	je     3e13 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    3df5:	83 ec 04             	sub    $0x4,%esp
    3df8:	8d 83 82 d6 ff ff    	lea    -0x297e(%ebx),%eax
    3dfe:	6a 04                	push   $0x4
    3e00:	50                   	push   %eax
    3e01:	57                   	push   %edi
    3e02:	ff 56 0c             	call   *0xc(%esi)
    3e05:	83 c4 10             	add    $0x10,%esp
    3e08:	84 c0                	test   %al,%al
    3e0a:	74 07                	je     3e13 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    3e0c:	b0 01                	mov    $0x1,%al
    3e0e:	83 c4 0c             	add    $0xc,%esp
    3e11:	eb 16                	jmp    3e29 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x59>
    3e13:	8b 44 24 24          	mov    0x24(%esp),%eax
    3e17:	83 f8 0a             	cmp    $0xa,%eax
    3e1a:	0f 94 45 00          	sete   0x0(%ebp)
    3e1e:	83 ec 08             	sub    $0x8,%esp
    3e21:	50                   	push   %eax
    3e22:	57                   	push   %edi
    3e23:	ff 56 10             	call   *0x10(%esi)
    3e26:	83 c4 1c             	add    $0x1c,%esp
    3e29:	5e                   	pop    %esi
    3e2a:	5f                   	pop    %edi
    3e2b:	5b                   	pop    %ebx
    3e2c:	5d                   	pop    %ebp
    3e2d:	c3                   	ret
    3e2e:	66 90                	xchg   %ax,%ax

00003e30 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE>:
    3e30:	53                   	push   %ebx
    3e31:	83 ec 08             	sub    $0x8,%esp
    3e34:	e8 00 00 00 00       	call   3e39 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x9>
    3e39:	5b                   	pop    %ebx
    3e3a:	81 c3 bb 61 00 00    	add    $0x61bb,%ebx
    3e40:	8b 44 24 14          	mov    0x14(%esp),%eax
    3e44:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    3e48:	8b 50 04             	mov    0x4(%eax),%edx
    3e4b:	83 fa 01             	cmp    $0x1,%edx
    3e4e:	74 02                	je     3e52 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x22>
    3e50:	85 d2                	test   %edx,%edx
    3e52:	89 04 24             	mov    %eax,(%esp)
    3e55:	8d 93 88 fd ff ff    	lea    -0x278(%ebx),%edx
    3e5b:	e8 90 f6 ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    3e60:	83 c4 08             	add    $0x8,%esp
    3e63:	5b                   	pop    %ebx
    3e64:	c3                   	ret
    3e65:	66 90                	xchg   %ax,%ax
    3e67:	66 90                	xchg   %ax,%ax
    3e69:	66 90                	xchg   %ax,%ax
    3e6b:	66 90                	xchg   %ax,%ax
    3e6d:	66 90                	xchg   %ax,%ax
    3e6f:	90                   	nop

00003e70 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E>:
    3e70:	53                   	push   %ebx
    3e71:	57                   	push   %edi
    3e72:	56                   	push   %esi
    3e73:	81 ec 80 00 00 00    	sub    $0x80,%esp
    3e79:	e8 00 00 00 00       	call   3e7e <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0xe>
    3e7e:	5b                   	pop    %ebx
    3e7f:	81 c3 76 61 00 00    	add    $0x6176,%ebx
    3e85:	8b 8c 24 94 00 00 00 	mov    0x94(%esp),%ecx
    3e8c:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    3e93:	8b 00                	mov    (%eax),%eax
    3e95:	ba 81 00 00 00       	mov    $0x81,%edx
    3e9a:	eb 1a                	jmp    3eb6 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x46>
    3e9c:	90                   	nop
    3e9d:	90                   	nop
    3e9e:	90                   	nop
    3e9f:	90                   	nop
    3ea0:	80 c2 37             	add    $0x37,%dl
    3ea3:	89 c7                	mov    %eax,%edi
    3ea5:	c1 ef 04             	shr    $0x4,%edi
    3ea8:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    3eac:	8d 56 ff             	lea    -0x1(%esi),%edx
    3eaf:	83 f8 0f             	cmp    $0xf,%eax
    3eb2:	89 f8                	mov    %edi,%eax
    3eb4:	76 11                	jbe    3ec7 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x57>
    3eb6:	89 d6                	mov    %edx,%esi
    3eb8:	89 c2                	mov    %eax,%edx
    3eba:	80 e2 0f             	and    $0xf,%dl
    3ebd:	80 fa 0a             	cmp    $0xa,%dl
    3ec0:	73 de                	jae    3ea0 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x30>
    3ec2:	80 ca 30             	or     $0x30,%dl
    3ec5:	eb dc                	jmp    3ea3 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x33>
    3ec7:	83 c6 fe             	add    $0xfffffffe,%esi
    3eca:	8d 04 34             	lea    (%esp,%esi,1),%eax
    3ecd:	be 81 00 00 00       	mov    $0x81,%esi
    3ed2:	29 d6                	sub    %edx,%esi
    3ed4:	8d bb c9 db ff ff    	lea    -0x2437(%ebx),%edi
    3eda:	ba 01 00 00 00       	mov    $0x1,%edx
    3edf:	56                   	push   %esi
    3ee0:	50                   	push   %eax
    3ee1:	6a 02                	push   $0x2
    3ee3:	57                   	push   %edi
    3ee4:	e8 27 ed ff ff       	call   2c10 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    3ee9:	81 c4 90 00 00 00    	add    $0x90,%esp
    3eef:	5e                   	pop    %esi
    3ef0:	5f                   	pop    %edi
    3ef1:	5b                   	pop    %ebx
    3ef2:	c3                   	ret
    3ef3:	66 90                	xchg   %ax,%ax
    3ef5:	66 90                	xchg   %ax,%ax
    3ef7:	66 90                	xchg   %ax,%ax
    3ef9:	66 90                	xchg   %ax,%ax
    3efb:	66 90                	xchg   %ax,%ax
    3efd:	66 90                	xchg   %ax,%ax
    3eff:	90                   	nop

00003f00 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h66eca3aabc4e6005E>:
    3f00:	53                   	push   %ebx
    3f01:	56                   	push   %esi
    3f02:	50                   	push   %eax
    3f03:	e8 00 00 00 00       	call   3f08 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h66eca3aabc4e6005E+0x8>
    3f08:	5b                   	pop    %ebx
    3f09:	81 c3 ec 60 00 00    	add    $0x60ec,%ebx
    3f0f:	8b 44 24 14          	mov    0x14(%esp),%eax
    3f13:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    3f17:	8b 11                	mov    (%ecx),%edx
    3f19:	89 d6                	mov    %edx,%esi
    3f1b:	c1 fe 1f             	sar    $0x1f,%esi
    3f1e:	89 d1                	mov    %edx,%ecx
    3f20:	31 f1                	xor    %esi,%ecx
    3f22:	29 f1                	sub    %esi,%ecx
    3f24:	89 04 24             	mov    %eax,(%esp)
    3f27:	f7 d2                	not    %edx
    3f29:	c1 ea 1f             	shr    $0x1f,%edx
    3f2c:	e8 0f f8 ff ff       	call   3740 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>
    3f31:	83 c4 04             	add    $0x4,%esp
    3f34:	5e                   	pop    %esi
    3f35:	5b                   	pop    %ebx
    3f36:	c3                   	ret
    3f37:	66 90                	xchg   %ax,%ax
    3f39:	66 90                	xchg   %ax,%ax
    3f3b:	66 90                	xchg   %ax,%ax
    3f3d:	66 90                	xchg   %ax,%ax
    3f3f:	90                   	nop

00003f40 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE>:
    3f40:	55                   	push   %ebp
    3f41:	53                   	push   %ebx
    3f42:	57                   	push   %edi
    3f43:	56                   	push   %esi
    3f44:	83 ec 08             	sub    $0x8,%esp
    3f47:	e8 00 00 00 00       	call   3f4c <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xc>
    3f4c:	5f                   	pop    %edi
    3f4d:	81 c7 a8 60 00 00    	add    $0x60a8,%edi
    3f53:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    3f56:	83 c0 03             	add    $0x3,%eax
    3f59:	83 e0 fc             	and    $0xfffffffc,%eax
    3f5c:	8b 18                	mov    (%eax),%ebx
    3f5e:	39 c3                	cmp    %eax,%ebx
    3f60:	76 04                	jbe    3f66 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x26>
    3f62:	8b 0b                	mov    (%ebx),%ecx
    3f64:	eb 04                	jmp    3f6a <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x2a>
    3f66:	89 d9                	mov    %ebx,%ecx
    3f68:	89 c3                	mov    %eax,%ebx
    3f6a:	89 ce                	mov    %ecx,%esi
    3f6c:	83 e6 fc             	and    $0xfffffffc,%esi
    3f6f:	8b 46 fc             	mov    -0x4(%esi),%eax
    3f72:	a8 01                	test   $0x1,%al
    3f74:	75 12                	jne    3f88 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x48>
    3f76:	29 c6                	sub    %eax,%esi
    3f78:	83 f8 40             	cmp    $0x40,%eax
    3f7b:	89 0c 24             	mov    %ecx,(%esp)
    3f7e:	73 1b                	jae    3f9b <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x5b>
    3f80:	83 c0 f4             	add    $0xfffffff4,%eax
    3f83:	c1 e8 02             	shr    $0x2,%eax
    3f86:	eb 3f                	jmp    3fc7 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x87>
    3f88:	83 c0 02             	add    $0x2,%eax
    3f8b:	89 46 fc             	mov    %eax,-0x4(%esi)
    3f8e:	8d 53 04             	lea    0x4(%ebx),%edx
    3f91:	f6 c1 02             	test   $0x2,%cl
    3f94:	74 56                	je     3fec <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xac>
    3f96:	e9 90 00 00 00       	jmp    402b <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xeb>
    3f9b:	3d 80 00 00 00       	cmp    $0x80,%eax
    3fa0:	73 08                	jae    3faa <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x6a>
    3fa2:	c1 e8 03             	shr    $0x3,%eax
    3fa5:	83 c0 05             	add    $0x5,%eax
    3fa8:	eb 1d                	jmp    3fc7 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x87>
    3faa:	0f bd d0             	bsr    %eax,%edx
    3fad:	83 f2 1f             	xor    $0x1f,%edx
    3fb0:	b1 1e                	mov    $0x1e,%cl
    3fb2:	28 d1                	sub    %dl,%cl
    3fb4:	d3 e8                	shr    %cl,%eax
    3fb6:	01 d2                	add    %edx,%edx
    3fb8:	29 d0                	sub    %edx,%eax
    3fba:	83 c0 43             	add    $0x43,%eax
    3fbd:	83 f8 3f             	cmp    $0x3f,%eax
    3fc0:	72 05                	jb     3fc7 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x87>
    3fc2:	b8 3f 00 00 00       	mov    $0x3f,%eax
    3fc7:	8b 0e                	mov    (%esi),%ecx
    3fc9:	8b 56 04             	mov    0x4(%esi),%edx
    3fcc:	89 0a                	mov    %ecx,(%edx)
    3fce:	85 c9                	test   %ecx,%ecx
    3fd0:	74 03                	je     3fd5 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x95>
    3fd2:	89 51 04             	mov    %edx,0x4(%ecx)
    3fd5:	8b 8f 20 00 00 00    	mov    0x20(%edi),%ecx
    3fdb:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
    3fdf:	74 23                	je     4004 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xc4>
    3fe1:	8b 0c 24             	mov    (%esp),%ecx
    3fe4:	8d 53 04             	lea    0x4(%ebx),%edx
    3fe7:	f6 c1 02             	test   $0x2,%cl
    3fea:	75 3f                	jne    402b <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xeb>
    3fec:	89 d3                	mov    %edx,%ebx
    3fee:	29 f3                	sub    %esi,%ebx
    3ff0:	83 fb 40             	cmp    $0x40,%ebx
    3ff3:	0f 83 c3 00 00 00    	jae    40bc <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x17c>
    3ff9:	8d 43 f4             	lea    -0xc(%ebx),%eax
    3ffc:	c1 e8 02             	shr    $0x2,%eax
    3fff:	e9 ed 00 00 00       	jmp    40f1 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1b1>
    4004:	31 d2                	xor    %edx,%edx
    4006:	83 f8 20             	cmp    $0x20,%eax
    4009:	0f 93 c2             	setae  %dl
    400c:	89 fd                	mov    %edi,%ebp
    400e:	bf 01 00 00 00       	mov    $0x1,%edi
    4013:	89 c1                	mov    %eax,%ecx
    4015:	d3 e7                	shl    %cl,%edi
    4017:	31 bc 95 18 00 00 00 	xor    %edi,0x18(%ebp,%edx,4)
    401e:	89 ef                	mov    %ebp,%edi
    4020:	8b 0c 24             	mov    (%esp),%ecx
    4023:	8d 53 04             	lea    0x4(%ebx),%edx
    4026:	f6 c1 02             	test   $0x2,%cl
    4029:	74 c1                	je     3fec <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xac>
    402b:	8b 6b 0c             	mov    0xc(%ebx),%ebp
    402e:	83 fd 40             	cmp    $0x40,%ebp
    4031:	89 54 24 04          	mov    %edx,0x4(%esp)
    4035:	73 08                	jae    403f <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xff>
    4037:	8d 45 f4             	lea    -0xc(%ebp),%eax
    403a:	c1 e8 02             	shr    $0x2,%eax
    403d:	eb 37                	jmp    4076 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x136>
    403f:	81 fd 80 00 00 00    	cmp    $0x80,%ebp
    4045:	73 0a                	jae    4051 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x111>
    4047:	89 e8                	mov    %ebp,%eax
    4049:	c1 e8 03             	shr    $0x3,%eax
    404c:	83 c0 05             	add    $0x5,%eax
    404f:	eb 25                	jmp    4076 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x136>
    4051:	0f bd c5             	bsr    %ebp,%eax
    4054:	83 f0 1f             	xor    $0x1f,%eax
    4057:	89 04 24             	mov    %eax,(%esp)
    405a:	b1 1e                	mov    $0x1e,%cl
    405c:	28 c1                	sub    %al,%cl
    405e:	89 e8                	mov    %ebp,%eax
    4060:	d3 e8                	shr    %cl,%eax
    4062:	8b 0c 24             	mov    (%esp),%ecx
    4065:	01 c9                	add    %ecx,%ecx
    4067:	29 c8                	sub    %ecx,%eax
    4069:	83 c0 43             	add    $0x43,%eax
    406c:	83 f8 3f             	cmp    $0x3f,%eax
    406f:	72 05                	jb     4076 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x136>
    4071:	b8 3f 00 00 00       	mov    $0x3f,%eax
    4076:	8b 4b 04             	mov    0x4(%ebx),%ecx
    4079:	8b 53 08             	mov    0x8(%ebx),%edx
    407c:	89 0a                	mov    %ecx,(%edx)
    407e:	85 c9                	test   %ecx,%ecx
    4080:	74 03                	je     4085 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x145>
    4082:	89 51 04             	mov    %edx,0x4(%ecx)
    4085:	8b 8f 20 00 00 00    	mov    0x20(%edi),%ecx
    408b:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
    408f:	75 18                	jne    40a9 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x169>
    4091:	31 d2                	xor    %edx,%edx
    4093:	83 f8 20             	cmp    $0x20,%eax
    4096:	0f 93 c2             	setae  %dl
    4099:	bb 01 00 00 00       	mov    $0x1,%ebx
    409e:	89 c1                	mov    %eax,%ecx
    40a0:	d3 e3                	shl    %cl,%ebx
    40a2:	31 9c 97 18 00 00 00 	xor    %ebx,0x18(%edi,%edx,4)
    40a9:	8b 54 24 04          	mov    0x4(%esp),%edx
    40ad:	01 ea                	add    %ebp,%edx
    40af:	89 d3                	mov    %edx,%ebx
    40b1:	29 f3                	sub    %esi,%ebx
    40b3:	83 fb 40             	cmp    $0x40,%ebx
    40b6:	0f 82 3d ff ff ff    	jb     3ff9 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0xb9>
    40bc:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
    40c2:	73 0a                	jae    40ce <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x18e>
    40c4:	89 d8                	mov    %ebx,%eax
    40c6:	c1 e8 03             	shr    $0x3,%eax
    40c9:	83 c0 05             	add    $0x5,%eax
    40cc:	eb 23                	jmp    40f1 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1b1>
    40ce:	89 d5                	mov    %edx,%ebp
    40d0:	0f bd d3             	bsr    %ebx,%edx
    40d3:	83 f2 1f             	xor    $0x1f,%edx
    40d6:	b1 1e                	mov    $0x1e,%cl
    40d8:	28 d1                	sub    %dl,%cl
    40da:	89 d8                	mov    %ebx,%eax
    40dc:	d3 e8                	shr    %cl,%eax
    40de:	01 d2                	add    %edx,%edx
    40e0:	29 d0                	sub    %edx,%eax
    40e2:	83 c0 43             	add    $0x43,%eax
    40e5:	83 f8 3f             	cmp    $0x3f,%eax
    40e8:	72 05                	jb     40ef <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1af>
    40ea:	b8 3f 00 00 00       	mov    $0x3f,%eax
    40ef:	89 ea                	mov    %ebp,%edx
    40f1:	8b 8f 20 00 00 00    	mov    0x20(%edi),%ecx
    40f7:	8d 2c 81             	lea    (%ecx,%eax,4),%ebp
    40fa:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    40fd:	85 c9                	test   %ecx,%ecx
    40ff:	74 0d                	je     410e <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x1ce>
    4101:	89 0e                	mov    %ecx,(%esi)
    4103:	89 6e 04             	mov    %ebp,0x4(%esi)
    4106:	89 75 00             	mov    %esi,0x0(%ebp)
    4109:	89 71 04             	mov    %esi,0x4(%ecx)
    410c:	eb 32                	jmp    4140 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE+0x200>
    410e:	89 54 24 04          	mov    %edx,0x4(%esp)
    4112:	31 d2                	xor    %edx,%edx
    4114:	83 f8 20             	cmp    $0x20,%eax
    4117:	0f 93 c2             	setae  %dl
    411a:	89 3c 24             	mov    %edi,(%esp)
    411d:	bf 01 00 00 00       	mov    $0x1,%edi
    4122:	89 c1                	mov    %eax,%ecx
    4124:	d3 e7                	shl    %cl,%edi
    4126:	8b 04 24             	mov    (%esp),%eax
    4129:	31 bc 90 18 00 00 00 	xor    %edi,0x18(%eax,%edx,4)
    4130:	8b 54 24 04          	mov    0x4(%esp),%edx
    4134:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    413a:	89 6e 04             	mov    %ebp,0x4(%esi)
    413d:	89 75 00             	mov    %esi,0x0(%ebp)
    4140:	89 5e 08             	mov    %ebx,0x8(%esi)
    4143:	89 5a fc             	mov    %ebx,-0x4(%edx)
    4146:	83 c4 08             	add    $0x8,%esp
    4149:	5e                   	pop    %esi
    414a:	5f                   	pop    %edi
    414b:	5b                   	pop    %ebx
    414c:	5d                   	pop    %ebp
    414d:	c3                   	ret
    414e:	66 90                	xchg   %ax,%ax

00004150 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE>:
    4150:	53                   	push   %ebx
    4151:	57                   	push   %edi
    4152:	56                   	push   %esi
    4153:	e8 00 00 00 00       	call   4158 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x8>
    4158:	5b                   	pop    %ebx
    4159:	81 c3 9c 5e 00 00    	add    $0x5e9c,%ebx
    415f:	8b 74 24 10          	mov    0x10(%esp),%esi
    4163:	8b 44 24 14          	mov    0x14(%esp),%eax
    4167:	8b 10                	mov    (%eax),%edx
    4169:	85 d2                	test   %edx,%edx
    416b:	74 40                	je     41ad <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x5d>
    416d:	8b 78 04             	mov    0x4(%eax),%edi
    4170:	b1 01                	mov    $0x1,%cl
    4172:	90                   	nop
    4173:	90                   	nop
    4174:	90                   	nop
    4175:	90                   	nop
    4176:	90                   	nop
    4177:	90                   	nop
    4178:	90                   	nop
    4179:	90                   	nop
    417a:	90                   	nop
    417b:	90                   	nop
    417c:	90                   	nop
    417d:	90                   	nop
    417e:	90                   	nop
    417f:	90                   	nop
    4180:	31 c0                	xor    %eax,%eax
    4182:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    4189:	00 
    418a:	75 06                	jne    4192 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x42>
    418c:	eb 11                	jmp    419f <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x4f>
    418e:	90                   	nop
    418f:	90                   	nop
    4190:	f3 90                	pause
    4192:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    4199:	84 c0                	test   %al,%al
    419b:	75 f3                	jne    4190 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x40>
    419d:	eb e1                	jmp    4180 <_ZN10kernel_lib2fs19not_supported_write17h9e4d025bb1412a8dE+0x30>
    419f:	89 f9                	mov    %edi,%ecx
    41a1:	e8 9a fd ff ff       	call   3f40 <_ZN4talc4talc13Talc$LT$O$GT$4free17h03e7af9670e8940dE>
    41a6:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    41ad:	8b 0e                	mov    (%esi),%ecx
    41af:	e8 3c 26 00 00       	call   67f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    41b4:	b0 01                	mov    $0x1,%al
    41b6:	5e                   	pop    %esi
    41b7:	5f                   	pop    %edi
    41b8:	5b                   	pop    %ebx
    41b9:	c3                   	ret
    41ba:	66 90                	xchg   %ax,%ax
    41bc:	66 90                	xchg   %ax,%ax
    41be:	66 90                	xchg   %ax,%ax

000041c0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96>:
    41c0:	53                   	push   %ebx
    41c1:	57                   	push   %edi
    41c2:	56                   	push   %esi
    41c3:	81 ec 80 00 00 00    	sub    $0x80,%esp
    41c9:	e8 00 00 00 00       	call   41ce <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0xe>
    41ce:	5b                   	pop    %ebx
    41cf:	81 c3 26 5e 00 00    	add    $0x5e26,%ebx
    41d5:	8b 8c 24 94 00 00 00 	mov    0x94(%esp),%ecx
    41dc:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    41e3:	8b 51 08             	mov    0x8(%ecx),%edx
    41e6:	f7 c2 00 00 00 02    	test   $0x2000000,%edx
    41ec:	75 16                	jne    4204 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x44>
    41ee:	f7 c2 00 00 00 04    	test   $0x4000000,%edx
    41f4:	75 41                	jne    4237 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x77>
    41f6:	81 c4 80 00 00 00    	add    $0x80,%esp
    41fc:	5e                   	pop    %esi
    41fd:	5f                   	pop    %edi
    41fe:	5b                   	pop    %ebx
    41ff:	e9 fc e8 ff ff       	jmp    2b00 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>
    4204:	8b 00                	mov    (%eax),%eax
    4206:	ba 81 00 00 00       	mov    $0x81,%edx
    420b:	eb 19                	jmp    4226 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x66>
    420d:	90                   	nop
    420e:	90                   	nop
    420f:	90                   	nop
    4210:	80 c2 57             	add    $0x57,%dl
    4213:	89 c7                	mov    %eax,%edi
    4215:	c1 ef 04             	shr    $0x4,%edi
    4218:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    421c:	8d 56 ff             	lea    -0x1(%esi),%edx
    421f:	83 f8 0f             	cmp    $0xf,%eax
    4222:	89 f8                	mov    %edi,%eax
    4224:	76 41                	jbe    4267 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0xa7>
    4226:	89 d6                	mov    %edx,%esi
    4228:	89 c2                	mov    %eax,%edx
    422a:	80 e2 0f             	and    $0xf,%dl
    422d:	80 fa 0a             	cmp    $0xa,%dl
    4230:	73 de                	jae    4210 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x50>
    4232:	80 ca 30             	or     $0x30,%dl
    4235:	eb dc                	jmp    4213 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x53>
    4237:	8b 00                	mov    (%eax),%eax
    4239:	ba 81 00 00 00       	mov    $0x81,%edx
    423e:	eb 16                	jmp    4256 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x96>
    4240:	80 c2 37             	add    $0x37,%dl
    4243:	89 c7                	mov    %eax,%edi
    4245:	c1 ef 04             	shr    $0x4,%edi
    4248:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    424c:	8d 56 ff             	lea    -0x1(%esi),%edx
    424f:	83 f8 0f             	cmp    $0xf,%eax
    4252:	89 f8                	mov    %edi,%eax
    4254:	76 11                	jbe    4267 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0xa7>
    4256:	89 d6                	mov    %edx,%esi
    4258:	89 c2                	mov    %eax,%edx
    425a:	80 e2 0f             	and    $0xf,%dl
    425d:	80 fa 0a             	cmp    $0xa,%dl
    4260:	73 de                	jae    4240 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x80>
    4262:	80 ca 30             	or     $0x30,%dl
    4265:	eb dc                	jmp    4243 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE.96+0x83>
    4267:	83 c6 fe             	add    $0xfffffffe,%esi
    426a:	8d 04 34             	lea    (%esp,%esi,1),%eax
    426d:	be 81 00 00 00       	mov    $0x81,%esi
    4272:	29 d6                	sub    %edx,%esi
    4274:	8d bb c9 db ff ff    	lea    -0x2437(%ebx),%edi
    427a:	ba 01 00 00 00       	mov    $0x1,%edx
    427f:	56                   	push   %esi
    4280:	50                   	push   %eax
    4281:	6a 02                	push   $0x2
    4283:	57                   	push   %edi
    4284:	e8 87 e9 ff ff       	call   2c10 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    4289:	83 c4 10             	add    $0x10,%esp
    428c:	81 c4 80 00 00 00    	add    $0x80,%esp
    4292:	5e                   	pop    %esi
    4293:	5f                   	pop    %edi
    4294:	5b                   	pop    %ebx
    4295:	c3                   	ret
    4296:	66 90                	xchg   %ax,%ax
    4298:	66 90                	xchg   %ax,%ax
    429a:	66 90                	xchg   %ax,%ax
    429c:	66 90                	xchg   %ax,%ax
    429e:	66 90                	xchg   %ax,%ax

000042a0 <_ZN4core3ptr56drop_in_place$LT$kernel_lib..logging..BufferedLogger$GT$17hb439f433930cd200E>:
    42a0:	c3                   	ret
    42a1:	66 90                	xchg   %ax,%ax
    42a3:	66 90                	xchg   %ax,%ax
    42a5:	66 90                	xchg   %ax,%ax
    42a7:	66 90                	xchg   %ax,%ax
    42a9:	66 90                	xchg   %ax,%ax
    42ab:	66 90                	xchg   %ax,%ax
    42ad:	66 90                	xchg   %ax,%ax
    42af:	90                   	nop

000042b0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$7enabled17h50b3bf6b8eccac4aE>:
    42b0:	b0 01                	mov    $0x1,%al
    42b2:	c3                   	ret
    42b3:	66 90                	xchg   %ax,%ax
    42b5:	66 90                	xchg   %ax,%ax
    42b7:	66 90                	xchg   %ax,%ax
    42b9:	66 90                	xchg   %ax,%ax
    42bb:	66 90                	xchg   %ax,%ax
    42bd:	66 90                	xchg   %ax,%ax
    42bf:	90                   	nop

000042c0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h291c1b72f6b70707E>:
    42c0:	53                   	push   %ebx
    42c1:	81 ec 48 01 00 00    	sub    $0x148,%esp
    42c7:	e8 00 00 00 00       	call   42cc <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h291c1b72f6b70707E+0xc>
    42cc:	5b                   	pop    %ebx
    42cd:	81 c3 28 5d 00 00    	add    $0x5d28,%ebx
    42d3:	8b 84 24 54 01 00 00 	mov    0x154(%esp),%eax
    42da:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    42e1:	00 
    42e2:	8b 48 20             	mov    0x20(%eax),%ecx
    42e5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    42e9:	8b 48 24             	mov    0x24(%eax),%ecx
    42ec:	8b 50 28             	mov    0x28(%eax),%edx
    42ef:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    42f3:	89 54 24 28          	mov    %edx,0x28(%esp)
    42f7:	83 c0 2c             	add    $0x2c,%eax
    42fa:	89 44 24 08          	mov    %eax,0x8(%esp)
    42fe:	8d 44 24 04          	lea    0x4(%esp),%eax
    4302:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4306:	8d 83 dc ca ff ff    	lea    -0x3524(%ebx),%eax
    430c:	89 44 24 10          	mov    %eax,0x10(%esp)
    4310:	8d 44 24 24          	lea    0x24(%esp),%eax
    4314:	89 44 24 14          	mov    %eax,0x14(%esp)
    4318:	8d 83 9c 94 ff ff    	lea    -0x6b64(%ebx),%eax
    431e:	89 44 24 18          	mov    %eax,0x18(%esp)
    4322:	8d 44 24 08          	lea    0x8(%esp),%eax
    4326:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    432a:	8d 83 ac a3 ff ff    	lea    -0x5c54(%ebx),%eax
    4330:	89 44 24 20          	mov    %eax,0x20(%esp)
    4334:	8d 83 40 fe ff ff    	lea    -0x1c0(%ebx),%eax
    433a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    433e:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    4345:	00 
    4346:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
    434d:	00 
    434e:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4352:	89 44 24 34          	mov    %eax,0x34(%esp)
    4356:	c7 44 24 38 03 00 00 	movl   $0x3,0x38(%esp)
    435d:	00 
    435e:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    4362:	89 04 24             	mov    %eax,(%esp)
    4365:	8d 93 f8 fd ff ff    	lea    -0x208(%ebx),%edx
    436b:	8d 4c 24 44          	lea    0x44(%esp),%ecx
    436f:	e8 7c f1 ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    4374:	8d 44 24 48          	lea    0x48(%esp),%eax
    4378:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    437c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4380:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4384:	89 44 24 14          	mov    %eax,0x14(%esp)
    4388:	8d 54 24 0c          	lea    0xc(%esp),%edx
    438c:	b8 02 00 00 00       	mov    $0x2,%eax
    4391:	cd 80                	int    $0x80
    4393:	81 c4 48 01 00 00    	add    $0x148,%esp
    4399:	5b                   	pop    %ebx
    439a:	c3                   	ret
    439b:	66 90                	xchg   %ax,%ax
    439d:	66 90                	xchg   %ax,%ax
    439f:	90                   	nop

000043a0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9455cc26f8a63d55E>:
    43a0:	53                   	push   %ebx
    43a1:	56                   	push   %esi
    43a2:	50                   	push   %eax
    43a3:	e8 00 00 00 00       	call   43a8 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9455cc26f8a63d55E+0x8>
    43a8:	5b                   	pop    %ebx
    43a9:	81 c3 4c 5c 00 00    	add    $0x5c4c,%ebx
    43af:	8b 44 24 14          	mov    0x14(%esp),%eax
    43b3:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    43b7:	8b 31                	mov    (%ecx),%esi
    43b9:	8b 08                	mov    (%eax),%ecx
    43bb:	8b 50 04             	mov    0x4(%eax),%edx
    43be:	89 34 24             	mov    %esi,(%esp)
    43c1:	e8 2a f1 ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    43c6:	83 c4 04             	add    $0x4,%esp
    43c9:	5e                   	pop    %esi
    43ca:	5b                   	pop    %ebx
    43cb:	c3                   	ret
    43cc:	66 90                	xchg   %ax,%ax
    43ce:	66 90                	xchg   %ax,%ax

000043d0 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E>:
    43d0:	53                   	push   %ebx
    43d1:	57                   	push   %edi
    43d2:	56                   	push   %esi
    43d3:	e8 00 00 00 00       	call   43d8 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E+0x8>
    43d8:	5b                   	pop    %ebx
    43d9:	81 c3 1c 5c 00 00    	add    $0x5c1c,%ebx
    43df:	8b 44 24 18          	mov    0x18(%esp),%eax
    43e3:	8b 7c 24 10          	mov    0x10(%esp),%edi
    43e7:	8b 0f                	mov    (%edi),%ecx
    43e9:	8d 34 01             	lea    (%ecx,%eax,1),%esi
    43ec:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    43f2:	0f 93 c2             	setae  %dl
    43f5:	85 c0                	test   %eax,%eax
    43f7:	0f 94 c6             	sete   %dh
    43fa:	08 d6                	or     %dl,%dh
    43fc:	75 18                	jne    4416 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E+0x46>
    43fe:	01 f9                	add    %edi,%ecx
    4400:	83 c1 04             	add    $0x4,%ecx
    4403:	83 ec 04             	sub    $0x4,%esp
    4406:	50                   	push   %eax
    4407:	ff 74 24 1c          	push   0x1c(%esp)
    440b:	51                   	push   %ecx
    440c:	e8 2f 27 00 00       	call   6b40 <memcpy>
    4411:	83 c4 10             	add    $0x10,%esp
    4414:	89 37                	mov    %esi,(%edi)
    4416:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    441c:	0f 93 c0             	setae  %al
    441f:	5e                   	pop    %esi
    4420:	5f                   	pop    %edi
    4421:	5b                   	pop    %ebx
    4422:	c3                   	ret
    4423:	66 90                	xchg   %ax,%ax
    4425:	66 90                	xchg   %ax,%ax
    4427:	66 90                	xchg   %ax,%ax
    4429:	66 90                	xchg   %ax,%ax
    442b:	66 90                	xchg   %ax,%ax
    442d:	66 90                	xchg   %ax,%ax
    442f:	90                   	nop

00004430 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E>:
    4430:	53                   	push   %ebx
    4431:	57                   	push   %edi
    4432:	56                   	push   %esi
    4433:	83 ec 10             	sub    $0x10,%esp
    4436:	e8 00 00 00 00       	call   443b <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xb>
    443b:	5b                   	pop    %ebx
    443c:	81 c3 b9 5b 00 00    	add    $0x5bb9,%ebx
    4442:	8b 44 24 24          	mov    0x24(%esp),%eax
    4446:	8b 74 24 20          	mov    0x20(%esp),%esi
    444a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4451:	00 
    4452:	3d 80 00 00 00       	cmp    $0x80,%eax
    4457:	73 1f                	jae    4478 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x48>
    4459:	88 44 24 0c          	mov    %al,0xc(%esp)
    445d:	b8 01 00 00 00       	mov    $0x1,%eax
    4462:	8b 0e                	mov    (%esi),%ecx
    4464:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    4467:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    446d:	0f 86 b9 00 00 00    	jbe    452c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    4473:	e9 cd 00 00 00       	jmp    4545 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    4478:	89 c1                	mov    %eax,%ecx
    447a:	3d 00 08 00 00       	cmp    $0x800,%eax
    447f:	73 2d                	jae    44ae <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x7e>
    4481:	c1 e9 06             	shr    $0x6,%ecx
    4484:	80 c9 c0             	or     $0xc0,%cl
    4487:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    448b:	24 3f                	and    $0x3f,%al
    448d:	0c 80                	or     $0x80,%al
    448f:	88 44 24 0d          	mov    %al,0xd(%esp)
    4493:	b8 02 00 00 00       	mov    $0x2,%eax
    4498:	8b 0e                	mov    (%esi),%ecx
    449a:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    449d:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    44a3:	0f 86 83 00 00 00    	jbe    452c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    44a9:	e9 97 00 00 00       	jmp    4545 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    44ae:	3d 00 00 01 00       	cmp    $0x10000,%eax
    44b3:	73 35                	jae    44ea <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xba>
    44b5:	c1 e9 0c             	shr    $0xc,%ecx
    44b8:	80 c9 e0             	or     $0xe0,%cl
    44bb:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    44bf:	89 c1                	mov    %eax,%ecx
    44c1:	c1 e9 06             	shr    $0x6,%ecx
    44c4:	80 e1 3f             	and    $0x3f,%cl
    44c7:	80 c9 80             	or     $0x80,%cl
    44ca:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    44ce:	24 3f                	and    $0x3f,%al
    44d0:	0c 80                	or     $0x80,%al
    44d2:	88 44 24 0e          	mov    %al,0xe(%esp)
    44d6:	b8 03 00 00 00       	mov    $0x3,%eax
    44db:	8b 0e                	mov    (%esi),%ecx
    44dd:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    44e0:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    44e6:	76 44                	jbe    452c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    44e8:	eb 5b                	jmp    4545 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    44ea:	c1 e9 12             	shr    $0x12,%ecx
    44ed:	80 c9 f0             	or     $0xf0,%cl
    44f0:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    44f4:	89 c1                	mov    %eax,%ecx
    44f6:	c1 e9 0c             	shr    $0xc,%ecx
    44f9:	80 e1 3f             	and    $0x3f,%cl
    44fc:	80 c9 80             	or     $0x80,%cl
    44ff:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    4503:	89 c1                	mov    %eax,%ecx
    4505:	c1 e9 06             	shr    $0x6,%ecx
    4508:	80 e1 3f             	and    $0x3f,%cl
    450b:	80 c9 80             	or     $0x80,%cl
    450e:	88 4c 24 0e          	mov    %cl,0xe(%esp)
    4512:	24 3f                	and    $0x3f,%al
    4514:	0c 80                	or     $0x80,%al
    4516:	88 44 24 0f          	mov    %al,0xf(%esp)
    451a:	b8 04 00 00 00       	mov    $0x4,%eax
    451f:	8b 0e                	mov    (%esi),%ecx
    4521:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    4524:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    452a:	77 19                	ja     4545 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    452c:	01 f1                	add    %esi,%ecx
    452e:	83 c1 04             	add    $0x4,%ecx
    4531:	83 ec 04             	sub    $0x4,%esp
    4534:	8d 54 24 10          	lea    0x10(%esp),%edx
    4538:	50                   	push   %eax
    4539:	52                   	push   %edx
    453a:	51                   	push   %ecx
    453b:	e8 00 26 00 00       	call   6b40 <memcpy>
    4540:	83 c4 10             	add    $0x10,%esp
    4543:	89 3e                	mov    %edi,(%esi)
    4545:	81 ff 00 01 00 00    	cmp    $0x100,%edi
    454b:	0f 93 c0             	setae  %al
    454e:	83 c4 10             	add    $0x10,%esp
    4551:	5e                   	pop    %esi
    4552:	5f                   	pop    %edi
    4553:	5b                   	pop    %ebx
    4554:	c3                   	ret
    4555:	66 90                	xchg   %ax,%ax
    4557:	66 90                	xchg   %ax,%ax
    4559:	66 90                	xchg   %ax,%ax
    455b:	66 90                	xchg   %ax,%ax
    455d:	66 90                	xchg   %ax,%ax
    455f:	90                   	nop

00004560 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE>:
    4560:	53                   	push   %ebx
    4561:	83 ec 08             	sub    $0x8,%esp
    4564:	e8 00 00 00 00       	call   4569 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE+0x9>
    4569:	5b                   	pop    %ebx
    456a:	81 c3 8b 5a 00 00    	add    $0x5a8b,%ebx
    4570:	8b 44 24 14          	mov    0x14(%esp),%eax
    4574:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4578:	8b 50 04             	mov    0x4(%eax),%edx
    457b:	83 fa 01             	cmp    $0x1,%edx
    457e:	74 02                	je     4582 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE+0x22>
    4580:	85 d2                	test   %edx,%edx
    4582:	89 04 24             	mov    %eax,(%esp)
    4585:	8d 93 f8 fd ff ff    	lea    -0x208(%ebx),%edx
    458b:	e8 60 ef ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    4590:	83 c4 08             	add    $0x8,%esp
    4593:	5b                   	pop    %ebx
    4594:	c3                   	ret
    4595:	66 90                	xchg   %ax,%ax
    4597:	66 90                	xchg   %ax,%ax
    4599:	66 90                	xchg   %ax,%ax
    459b:	66 90                	xchg   %ax,%ax
    459d:	66 90                	xchg   %ax,%ax
    459f:	90                   	nop

000045a0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>:
    45a0:	55                   	push   %ebp
    45a1:	53                   	push   %ebx
    45a2:	57                   	push   %edi
    45a3:	56                   	push   %esi
    45a4:	83 ec 4c             	sub    $0x4c,%esp
    45a7:	e8 00 00 00 00       	call   45ac <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xc>
    45ac:	5d                   	pop    %ebp
    45ad:	81 c5 48 5a 00 00    	add    $0x5a48,%ebp
    45b3:	bf 0c 00 00 00       	mov    $0xc,%edi
    45b8:	89 54 24 20          	mov    %edx,0x20(%esp)
    45bc:	83 fa 09             	cmp    $0x9,%edx
    45bf:	72 0a                	jb     45cb <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x2b>
    45c1:	8b 44 24 20          	mov    0x20(%esp),%eax
    45c5:	8d 78 07             	lea    0x7(%eax),%edi
    45c8:	83 e7 fc             	and    $0xfffffffc,%edi
    45cb:	0f bd c7             	bsr    %edi,%eax
    45ce:	83 f0 1f             	xor    $0x1f,%eax
    45d1:	b1 1e                	mov    $0x1e,%cl
    45d3:	28 c1                	sub    %al,%cl
    45d5:	89 fa                	mov    %edi,%edx
    45d7:	d3 ea                	shr    %cl,%edx
    45d9:	01 c0                	add    %eax,%eax
    45db:	29 c2                	sub    %eax,%edx
    45dd:	83 c2 43             	add    $0x43,%edx
    45e0:	83 fa 3f             	cmp    $0x3f,%edx
    45e3:	72 05                	jb     45ea <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4a>
    45e5:	ba 3f 00 00 00       	mov    $0x3f,%edx
    45ea:	89 f9                	mov    %edi,%ecx
    45ec:	83 e1 c0             	and    $0xffffffc0,%ecx
    45ef:	83 ff 40             	cmp    $0x40,%edi
    45f2:	73 06                	jae    45fa <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5a>
    45f4:	8d 57 f4             	lea    -0xc(%edi),%edx
    45f7:	c1 ea 02             	shr    $0x2,%edx
    45fa:	83 fa 20             	cmp    $0x20,%edx
    45fd:	0f 92 c0             	setb   %al
    4600:	83 f9 40             	cmp    $0x40,%ecx
    4603:	0f 94 c1             	sete   %cl
    4606:	74 06                	je     460e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6e>
    4608:	89 54 24 18          	mov    %edx,0x18(%esp)
    460c:	eb 0c                	jmp    461a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x7a>
    460e:	89 fe                	mov    %edi,%esi
    4610:	c1 ee 03             	shr    $0x3,%esi
    4613:	83 c6 05             	add    $0x5,%esi
    4616:	89 74 24 18          	mov    %esi,0x18(%esp)
    461a:	89 d6                	mov    %edx,%esi
    461c:	83 e6 1f             	and    $0x1f,%esi
    461f:	89 74 24 30          	mov    %esi,0x30(%esp)
    4623:	08 c1                	or     %al,%cl
    4625:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    4629:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    462d:	88 4c 24 0b          	mov    %cl,0xb(%esp)
    4631:	84 c9                	test   %cl,%cl
    4633:	74 3b                	je     4670 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xd0>
    4635:	8b 85 18 00 00 00    	mov    0x18(%ebp),%eax
    463b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    463f:	8b 54 24 18          	mov    0x18(%esp),%edx
    4643:	89 d1                	mov    %edx,%ecx
    4645:	d3 e8                	shr    %cl,%eax
    4647:	85 c0                	test   %eax,%eax
    4649:	74 75                	je     46c0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x120>
    464b:	f3 0f bc c8          	tzcnt  %eax,%ecx
    464f:	01 d1                	add    %edx,%ecx
    4651:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    4657:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    465d:	85 d2                	test   %edx,%edx
    465f:	75 4e                	jne    46af <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x10f>
    4661:	e9 02 01 00 00       	jmp    4768 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c8>
    4666:	90                   	nop
    4667:	90                   	nop
    4668:	90                   	nop
    4669:	90                   	nop
    466a:	90                   	nop
    466b:	90                   	nop
    466c:	90                   	nop
    466d:	90                   	nop
    466e:	90                   	nop
    466f:	90                   	nop
    4670:	83 fa 3f             	cmp    $0x3f,%edx
    4673:	0f 87 37 01 00 00    	ja     47b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4679:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    467f:	89 d0                	mov    %edx,%eax
    4681:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    4685:	d3 e8                	shr    %cl,%eax
    4687:	85 c0                	test   %eax,%eax
    4689:	0f 84 21 01 00 00    	je     47b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    468f:	f3 0f bc c8          	tzcnt  %eax,%ecx
    4693:	03 4c 24 1c          	add    0x1c(%esp),%ecx
    4697:	8b 85 18 00 00 00    	mov    0x18(%ebp),%eax
    469d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    46a1:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    46a7:	85 d2                	test   %edx,%edx
    46a9:	0f 84 b9 00 00 00    	je     4768 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c8>
    46af:	f3 0f bc c2          	tzcnt  %edx,%eax
    46b3:	83 c8 20             	or     $0x20,%eax
    46b6:	89 44 24 14          	mov    %eax,0x14(%esp)
    46ba:	eb 24                	jmp    46e0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    46bc:	90                   	nop
    46bd:	90                   	nop
    46be:	90                   	nop
    46bf:	90                   	nop
    46c0:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    46c6:	85 d2                	test   %edx,%edx
    46c8:	0f 84 e2 00 00 00    	je     47b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    46ce:	f3 0f bc ca          	tzcnt  %edx,%ecx
    46d2:	83 c9 20             	or     $0x20,%ecx
    46d5:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    46db:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    46df:	90                   	nop
    46e0:	89 eb                	mov    %ebp,%ebx
    46e2:	8d 6c 8d 00          	lea    0x0(%ebp,%ecx,4),%ebp
    46e6:	89 e8                	mov    %ebp,%eax
    46e8:	90                   	nop
    46e9:	90                   	nop
    46ea:	90                   	nop
    46eb:	90                   	nop
    46ec:	90                   	nop
    46ed:	90                   	nop
    46ee:	90                   	nop
    46ef:	90                   	nop
    46f0:	8b 00                	mov    (%eax),%eax
    46f2:	85 c0                	test   %eax,%eax
    46f4:	74 1a                	je     4710 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x170>
    46f6:	8b 70 08             	mov    0x8(%eax),%esi
    46f9:	39 fe                	cmp    %edi,%esi
    46fb:	72 f3                	jb     46f0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x150>
    46fd:	e9 5f 03 00 00       	jmp    4a61 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4c1>
    4702:	90                   	nop
    4703:	90                   	nop
    4704:	90                   	nop
    4705:	90                   	nop
    4706:	90                   	nop
    4707:	90                   	nop
    4708:	90                   	nop
    4709:	90                   	nop
    470a:	90                   	nop
    470b:	90                   	nop
    470c:	90                   	nop
    470d:	90                   	nop
    470e:	90                   	nop
    470f:	90                   	nop
    4710:	8d 41 01             	lea    0x1(%ecx),%eax
    4713:	83 f9 1f             	cmp    $0x1f,%ecx
    4716:	73 28                	jae    4740 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1a0>
    4718:	8b 74 24 0c          	mov    0xc(%esp),%esi
    471c:	89 c1                	mov    %eax,%ecx
    471e:	d3 ee                	shr    %cl,%esi
    4720:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    4724:	85 f6                	test   %esi,%esi
    4726:	89 dd                	mov    %ebx,%ebp
    4728:	74 b6                	je     46e0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    472a:	f3 0f bc ce          	tzcnt  %esi,%ecx
    472e:	01 c1                	add    %eax,%ecx
    4730:	eb ae                	jmp    46e0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    4732:	90                   	nop
    4733:	90                   	nop
    4734:	90                   	nop
    4735:	90                   	nop
    4736:	90                   	nop
    4737:	90                   	nop
    4738:	90                   	nop
    4739:	90                   	nop
    473a:	90                   	nop
    473b:	90                   	nop
    473c:	90                   	nop
    473d:	90                   	nop
    473e:	90                   	nop
    473f:	90                   	nop
    4740:	83 f9 3e             	cmp    $0x3e,%ecx
    4743:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4747:	77 67                	ja     47b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4749:	89 d6                	mov    %edx,%esi
    474b:	89 c1                	mov    %eax,%ecx
    474d:	d3 ee                	shr    %cl,%esi
    474f:	85 f6                	test   %esi,%esi
    4751:	74 5d                	je     47b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4753:	f3 0f bc ce          	tzcnt  %esi,%ecx
    4757:	01 c1                	add    %eax,%ecx
    4759:	89 dd                	mov    %ebx,%ebp
    475b:	eb 83                	jmp    46e0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    475d:	90                   	nop
    475e:	90                   	nop
    475f:	90                   	nop
    4760:	f3 0f bc c0          	tzcnt  %eax,%eax
    4764:	01 c1                	add    %eax,%ecx
    4766:	89 d5                	mov    %edx,%ebp
    4768:	89 ea                	mov    %ebp,%edx
    476a:	8d 6c 8d 00          	lea    0x0(%ebp,%ecx,4),%ebp
    476e:	89 e8                	mov    %ebp,%eax
    4770:	8b 00                	mov    (%eax),%eax
    4772:	85 c0                	test   %eax,%eax
    4774:	74 1a                	je     4790 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1f0>
    4776:	8b 70 08             	mov    0x8(%eax),%esi
    4779:	39 fe                	cmp    %edi,%esi
    477b:	72 f3                	jb     4770 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1d0>
    477d:	e9 df 02 00 00       	jmp    4a61 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4c1>
    4782:	90                   	nop
    4783:	90                   	nop
    4784:	90                   	nop
    4785:	90                   	nop
    4786:	90                   	nop
    4787:	90                   	nop
    4788:	90                   	nop
    4789:	90                   	nop
    478a:	90                   	nop
    478b:	90                   	nop
    478c:	90                   	nop
    478d:	90                   	nop
    478e:	90                   	nop
    478f:	90                   	nop
    4790:	83 f9 1e             	cmp    $0x1e,%ecx
    4793:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4797:	77 17                	ja     47b0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    4799:	41                   	inc    %ecx
    479a:	8b 44 24 0c          	mov    0xc(%esp),%eax
    479e:	d3 e8                	shr    %cl,%eax
    47a0:	85 c0                	test   %eax,%eax
    47a2:	75 bc                	jne    4760 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c0>
    47a4:	90                   	nop
    47a5:	90                   	nop
    47a6:	90                   	nop
    47a7:	90                   	nop
    47a8:	90                   	nop
    47a9:	90                   	nop
    47aa:	90                   	nop
    47ab:	90                   	nop
    47ac:	90                   	nop
    47ad:	90                   	nop
    47ae:	90                   	nop
    47af:	90                   	nop
    47b0:	8b b5 10 00 00 00    	mov    0x10(%ebp),%esi
    47b6:	8b ad 14 00 00 00    	mov    0x14(%ebp),%ebp
    47bc:	31 c0                	xor    %eax,%eax
    47be:	39 f5                	cmp    %esi,%ebp
    47c0:	0f 86 98 04 00 00    	jbe    4c5e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    47c6:	85 f6                	test   %esi,%esi
    47c8:	0f 84 98 04 00 00    	je     4c66 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6c6>
    47ce:	83 fe fb             	cmp    $0xfffffffb,%esi
    47d1:	0f 87 87 04 00 00    	ja     4c5e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    47d7:	83 c6 03             	add    $0x3,%esi
    47da:	83 e6 fc             	and    $0xfffffffc,%esi
    47dd:	83 e5 fc             	and    $0xfffffffc,%ebp
    47e0:	89 e9                	mov    %ebp,%ecx
    47e2:	29 f1                	sub    %esi,%ecx
    47e4:	0f 86 74 04 00 00    	jbe    4c5e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    47ea:	8b 54 24 10          	mov    0x10(%esp),%edx
    47ee:	8b 9a 20 00 00 00    	mov    0x20(%edx),%ebx
    47f4:	85 db                	test   %ebx,%ebx
    47f6:	74 38                	je     4830 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x290>
    47f8:	83 f9 0f             	cmp    $0xf,%ecx
    47fb:	0f 86 5d 04 00 00    	jbe    4c5e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4801:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
    4807:	8d 46 04             	lea    0x4(%esi),%eax
    480a:	89 ea                	mov    %ebp,%edx
    480c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4810:	29 c2                	sub    %eax,%edx
    4812:	83 fa 40             	cmp    $0x40,%edx
    4815:	0f 83 84 00 00 00    	jae    489f <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x2ff>
    481b:	8d 42 f4             	lea    -0xc(%edx),%eax
    481e:	c1 e8 02             	shr    $0x2,%eax
    4821:	e9 cf 00 00 00       	jmp    48f5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x355>
    4826:	90                   	nop
    4827:	90                   	nop
    4828:	90                   	nop
    4829:	90                   	nop
    482a:	90                   	nop
    482b:	90                   	nop
    482c:	90                   	nop
    482d:	90                   	nop
    482e:	90                   	nop
    482f:	90                   	nop
    4830:	81 f9 07 01 00 00    	cmp    $0x107,%ecx
    4836:	0f 86 22 04 00 00    	jbe    4c5e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    483c:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
    4842:	8d 46 04             	lea    0x4(%esi),%eax
    4845:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4849:	83 ec 04             	sub    $0x4,%esp
    484c:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    4850:	68 00 01 00 00       	push   $0x100
    4855:	6a 00                	push   $0x0
    4857:	50                   	push   %eax
    4858:	e8 a3 23 00 00       	call   6c00 <memset>
    485d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    4861:	83 c4 10             	add    $0x10,%esp
    4864:	89 8b 20 00 00 00    	mov    %ecx,0x20(%ebx)
    486a:	8d 86 08 01 00 00    	lea    0x108(%esi),%eax
    4870:	89 ea                	mov    %ebp,%edx
    4872:	29 c2                	sub    %eax,%edx
    4874:	83 fa 0b             	cmp    $0xb,%edx
    4877:	76 38                	jbe    48b1 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x311>
    4879:	83 fa 40             	cmp    $0x40,%edx
    487c:	89 44 24 14          	mov    %eax,0x14(%esp)
    4880:	0f 83 05 01 00 00    	jae    498b <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3eb>
    4886:	8d 42 f4             	lea    -0xc(%edx),%eax
    4889:	c1 e8 02             	shr    $0x2,%eax
    488c:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    488f:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    4892:	85 c9                	test   %ecx,%ecx
    4894:	0f 85 0b 01 00 00    	jne    49a5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x405>
    489a:	e9 4d 01 00 00       	jmp    49ec <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x44c>
    489f:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    48a5:	73 27                	jae    48ce <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x32e>
    48a7:	89 d0                	mov    %edx,%eax
    48a9:	c1 e8 03             	shr    $0x3,%eax
    48ac:	83 c0 05             	add    $0x5,%eax
    48af:	eb 44                	jmp    48f5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x355>
    48b1:	8d 86 04 01 00 00    	lea    0x104(%esi),%eax
    48b7:	83 c5 fc             	add    $0xfffffffc,%ebp
    48ba:	39 c5                	cmp    %eax,%ebp
    48bc:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    48c1:	74 02                	je     48c5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x325>
    48c3:	89 28                	mov    %ebp,(%eax)
    48c5:	46                   	inc    %esi
    48c6:	89 75 00             	mov    %esi,0x0(%ebp)
    48c9:	e9 94 00 00 00       	jmp    4962 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3c2>
    48ce:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    48d2:	0f bd da             	bsr    %edx,%ebx
    48d5:	83 f3 1f             	xor    $0x1f,%ebx
    48d8:	b1 1e                	mov    $0x1e,%cl
    48da:	28 d9                	sub    %bl,%cl
    48dc:	89 d0                	mov    %edx,%eax
    48de:	d3 e8                	shr    %cl,%eax
    48e0:	01 db                	add    %ebx,%ebx
    48e2:	29 d8                	sub    %ebx,%eax
    48e4:	83 c0 43             	add    $0x43,%eax
    48e7:	83 f8 3f             	cmp    $0x3f,%eax
    48ea:	72 05                	jb     48f1 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x351>
    48ec:	b8 3f 00 00 00       	mov    $0x3f,%eax
    48f1:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    48f5:	89 d9                	mov    %ebx,%ecx
    48f7:	8d 1c 83             	lea    (%ebx,%eax,4),%ebx
    48fa:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    48fd:	85 c9                	test   %ecx,%ecx
    48ff:	74 11                	je     4912 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x372>
    4901:	89 4e 04             	mov    %ecx,0x4(%esi)
    4904:	89 5e 08             	mov    %ebx,0x8(%esi)
    4907:	8b 44 24 0c          	mov    0xc(%esp),%eax
    490b:	89 03                	mov    %eax,(%ebx)
    490d:	89 41 04             	mov    %eax,0x4(%ecx)
    4910:	eb 45                	jmp    4957 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3b7>
    4912:	31 c9                	xor    %ecx,%ecx
    4914:	83 f8 20             	cmp    $0x20,%eax
    4917:	0f 93 c1             	setae  %cl
    491a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    491e:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    4925:	00 
    4926:	89 c1                	mov    %eax,%ecx
    4928:	d3 64 24 14          	shll   %cl,0x14(%esp)
    492c:	8b 44 24 10          	mov    0x10(%esp),%eax
    4930:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    4934:	89 5c 24 24          	mov    %ebx,0x24(%esp)
    4938:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    493c:	31 9c 88 18 00 00 00 	xor    %ebx,0x18(%eax,%ecx,4)
    4943:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
    494a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    494e:	89 4e 08             	mov    %ecx,0x8(%esi)
    4951:	8b 44 24 0c          	mov    0xc(%esp),%eax
    4955:	89 01                	mov    %eax,(%ecx)
    4957:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    495c:	89 56 0c             	mov    %edx,0xc(%esi)
    495f:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4962:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4966:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    496a:	c7 85 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
    4971:	00 00 00 
    4974:	c7 85 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
    497b:	00 00 00 
    497e:	84 c9                	test   %cl,%cl
    4980:	0f 84 ea fc ff ff    	je     4670 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xd0>
    4986:	e9 aa fc ff ff       	jmp    4635 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x95>
    498b:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    4991:	73 2c                	jae    49bf <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x41f>
    4993:	89 d0                	mov    %edx,%eax
    4995:	c1 e8 03             	shr    $0x3,%eax
    4998:	83 c0 05             	add    $0x5,%eax
    499b:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    499e:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    49a1:	85 c9                	test   %ecx,%ecx
    49a3:	74 47                	je     49ec <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x44c>
    49a5:	89 8e 08 01 00 00    	mov    %ecx,0x108(%esi)
    49ab:	89 9e 0c 01 00 00    	mov    %ebx,0x10c(%esi)
    49b1:	8b 44 24 14          	mov    0x14(%esp),%eax
    49b5:	89 03                	mov    %eax,(%ebx)
    49b7:	89 41 04             	mov    %eax,0x4(%ecx)
    49ba:	e9 82 00 00 00       	jmp    4a41 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4a1>
    49bf:	0f bd da             	bsr    %edx,%ebx
    49c2:	83 f3 1f             	xor    $0x1f,%ebx
    49c5:	b1 1e                	mov    $0x1e,%cl
    49c7:	28 d9                	sub    %bl,%cl
    49c9:	89 d0                	mov    %edx,%eax
    49cb:	d3 e8                	shr    %cl,%eax
    49cd:	01 db                	add    %ebx,%ebx
    49cf:	29 d8                	sub    %ebx,%eax
    49d1:	83 c0 43             	add    $0x43,%eax
    49d4:	83 f8 3f             	cmp    $0x3f,%eax
    49d7:	72 05                	jb     49de <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x43e>
    49d9:	b8 3f 00 00 00       	mov    $0x3f,%eax
    49de:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    49e2:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    49e5:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    49e8:	85 c9                	test   %ecx,%ecx
    49ea:	75 b9                	jne    49a5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x405>
    49ec:	31 c9                	xor    %ecx,%ecx
    49ee:	83 f8 20             	cmp    $0x20,%eax
    49f1:	0f 93 c1             	setae  %cl
    49f4:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    49f8:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    49ff:	00 
    4a00:	89 c1                	mov    %eax,%ecx
    4a02:	d3 64 24 0c          	shll   %cl,0xc(%esp)
    4a06:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4a0a:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
    4a0e:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    4a12:	89 44 24 24          	mov    %eax,0x24(%esp)
    4a16:	8b 44 24 0c          	mov    0xc(%esp),%eax
    4a1a:	31 84 99 18 00 00 00 	xor    %eax,0x18(%ecx,%ebx,4)
    4a21:	c7 86 08 01 00 00 00 	movl   $0x0,0x108(%esi)
    4a28:	00 00 00 
    4a2b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    4a2f:	89 86 0c 01 00 00    	mov    %eax,0x10c(%esi)
    4a35:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    4a39:	8b 44 24 24          	mov    0x24(%esp),%eax
    4a3d:	89 4c 86 04          	mov    %ecx,0x4(%esi,%eax,4)
    4a41:	89 96 10 01 00 00    	mov    %edx,0x110(%esi)
    4a47:	89 55 fc             	mov    %edx,-0x4(%ebp)
    4a4a:	8d 46 03             	lea    0x3(%esi),%eax
    4a4d:	89 86 04 01 00 00    	mov    %eax,0x104(%esi)
    4a53:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4a57:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    4a5c:	e9 05 ff ff ff       	jmp    4966 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3c6>
    4a61:	8b 10                	mov    (%eax),%edx
    4a63:	8b 78 04             	mov    0x4(%eax),%edi
    4a66:	89 17                	mov    %edx,(%edi)
    4a68:	85 d2                	test   %edx,%edx
    4a6a:	74 03                	je     4a6f <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4cf>
    4a6c:	89 7a 04             	mov    %edi,0x4(%edx)
    4a6f:	83 7d 00 00          	cmpl   $0x0,0x0(%ebp)
    4a73:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4a77:	74 24                	je     4a9d <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4fd>
    4a79:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
    4a7c:	83 c1 f4             	add    $0xfffffff4,%ecx
    4a7f:	39 c1                	cmp    %eax,%ecx
    4a81:	73 3a                	jae    4abd <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x51d>
    4a83:	89 cf                	mov    %ecx,%edi
    4a85:	29 c7                	sub    %eax,%edi
    4a87:	83 ff 0b             	cmp    $0xb,%edi
    4a8a:	76 3c                	jbe    4ac8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x528>
    4a8c:	83 ff 40             	cmp    $0x40,%edi
    4a8f:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    4a93:	73 3e                	jae    4ad3 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x533>
    4a95:	8d 57 f4             	lea    -0xc(%edi),%edx
    4a98:	c1 ea 02             	shr    $0x2,%edx
    4a9b:	eb 67                	jmp    4b04 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    4a9d:	31 d2                	xor    %edx,%edx
    4a9f:	83 f9 20             	cmp    $0x20,%ecx
    4aa2:	0f 93 c2             	setae  %dl
    4aa5:	bf 01 00 00 00       	mov    $0x1,%edi
    4aaa:	d3 e7                	shl    %cl,%edi
    4aac:	31 bc 95 18 00 00 00 	xor    %edi,0x18(%ebp,%edx,4)
    4ab3:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
    4ab6:	83 c1 f4             	add    $0xfffffff4,%ecx
    4ab9:	39 c1                	cmp    %eax,%ecx
    4abb:	72 c6                	jb     4a83 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4e3>
    4abd:	89 c1                	mov    %eax,%ecx
    4abf:	89 cf                	mov    %ecx,%edi
    4ac1:	29 c7                	sub    %eax,%edi
    4ac3:	83 ff 0b             	cmp    $0xb,%edi
    4ac6:	77 c4                	ja     4a8c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4ec>
    4ac8:	83 40 fc fe          	addl   $0xfffffffe,-0x4(%eax)
    4acc:	89 c3                	mov    %eax,%ebx
    4ace:	e9 86 00 00 00       	jmp    4b59 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5b9>
    4ad3:	81 ff 80 00 00 00    	cmp    $0x80,%edi
    4ad9:	73 0a                	jae    4ae5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x545>
    4adb:	89 fa                	mov    %edi,%edx
    4add:	c1 ea 03             	shr    $0x3,%edx
    4ae0:	83 c2 05             	add    $0x5,%edx
    4ae3:	eb 1f                	jmp    4b04 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    4ae5:	0f bd df             	bsr    %edi,%ebx
    4ae8:	83 f3 1f             	xor    $0x1f,%ebx
    4aeb:	b1 1e                	mov    $0x1e,%cl
    4aed:	28 d9                	sub    %bl,%cl
    4aef:	89 fa                	mov    %edi,%edx
    4af1:	d3 ea                	shr    %cl,%edx
    4af3:	01 db                	add    %ebx,%ebx
    4af5:	29 da                	sub    %ebx,%edx
    4af7:	83 c2 43             	add    $0x43,%edx
    4afa:	83 fa 3f             	cmp    $0x3f,%edx
    4afd:	72 05                	jb     4b04 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    4aff:	ba 3f 00 00 00       	mov    $0x3f,%edx
    4b04:	8b 8d 20 00 00 00    	mov    0x20(%ebp),%ecx
    4b0a:	8d 1c 91             	lea    (%ecx,%edx,4),%ebx
    4b0d:	8b 0c 91             	mov    (%ecx,%edx,4),%ecx
    4b10:	85 c9                	test   %ecx,%ecx
    4b12:	74 0c                	je     4b20 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x580>
    4b14:	89 08                	mov    %ecx,(%eax)
    4b16:	89 58 04             	mov    %ebx,0x4(%eax)
    4b19:	89 03                	mov    %eax,(%ebx)
    4b1b:	89 41 04             	mov    %eax,0x4(%ecx)
    4b1e:	eb 2f                	jmp    4b4f <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5af>
    4b20:	31 c9                	xor    %ecx,%ecx
    4b22:	83 fa 20             	cmp    $0x20,%edx
    4b25:	0f 93 c1             	setae  %cl
    4b28:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4b2c:	bd 01 00 00 00       	mov    $0x1,%ebp
    4b31:	89 d1                	mov    %edx,%ecx
    4b33:	d3 e5                	shl    %cl,%ebp
    4b35:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4b39:	8b 54 24 10          	mov    0x10(%esp),%edx
    4b3d:	31 ac 8a 18 00 00 00 	xor    %ebp,0x18(%edx,%ecx,4)
    4b44:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    4b4a:	89 58 04             	mov    %ebx,0x4(%eax)
    4b4d:	89 03                	mov    %eax,(%ebx)
    4b4f:	89 78 08             	mov    %edi,0x8(%eax)
    4b52:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    4b56:	89 7b fc             	mov    %edi,-0x4(%ebx)
    4b59:	01 c6                	add    %eax,%esi
    4b5b:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    4b5f:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
    4b62:	83 c7 03             	add    $0x3,%edi
    4b65:	83 e7 fc             	and    $0xfffffffc,%edi
    4b68:	8d 6b 08             	lea    0x8(%ebx),%ebp
    4b6b:	39 ef                	cmp    %ebp,%edi
    4b6d:	72 02                	jb     4b71 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5d1>
    4b6f:	89 fd                	mov    %edi,%ebp
    4b71:	8d 4d 04             	lea    0x4(%ebp),%ecx
    4b74:	89 f2                	mov    %esi,%edx
    4b76:	29 ca                	sub    %ecx,%edx
    4b78:	83 fa 0b             	cmp    $0xb,%edx
    4b7b:	76 19                	jbe    4b96 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5f6>
    4b7d:	83 fa 40             	cmp    $0x40,%edx
    4b80:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    4b84:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    4b88:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    4b8c:	73 1e                	jae    4bac <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x60c>
    4b8e:	8d 5a f4             	lea    -0xc(%edx),%ebx
    4b91:	c1 eb 02             	shr    $0x2,%ebx
    4b94:	eb 4f                	jmp    4be5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    4b96:	43                   	inc    %ebx
    4b97:	89 5e fc             	mov    %ebx,-0x4(%esi)
    4b9a:	83 c6 fc             	add    $0xfffffffc,%esi
    4b9d:	89 f5                	mov    %esi,%ebp
    4b9f:	39 fd                	cmp    %edi,%ebp
    4ba1:	0f 85 b5 00 00 00    	jne    4c5c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6bc>
    4ba7:	e9 b2 00 00 00       	jmp    4c5e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4bac:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    4bb2:	73 0a                	jae    4bbe <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x61e>
    4bb4:	89 d3                	mov    %edx,%ebx
    4bb6:	c1 eb 03             	shr    $0x3,%ebx
    4bb9:	83 c3 05             	add    $0x5,%ebx
    4bbc:	eb 27                	jmp    4be5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    4bbe:	0f bd da             	bsr    %edx,%ebx
    4bc1:	83 f3 1f             	xor    $0x1f,%ebx
    4bc4:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    4bc8:	b1 1e                	mov    $0x1e,%cl
    4bca:	28 d9                	sub    %bl,%cl
    4bcc:	89 d3                	mov    %edx,%ebx
    4bce:	d3 eb                	shr    %cl,%ebx
    4bd0:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4bd4:	01 c9                	add    %ecx,%ecx
    4bd6:	29 cb                	sub    %ecx,%ebx
    4bd8:	83 c3 43             	add    $0x43,%ebx
    4bdb:	83 fb 3f             	cmp    $0x3f,%ebx
    4bde:	72 05                	jb     4be5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    4be0:	bb 3f 00 00 00       	mov    $0x3f,%ebx
    4be5:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4be9:	8b 89 20 00 00 00    	mov    0x20(%ecx),%ecx
    4bef:	8d 3c 99             	lea    (%ecx,%ebx,4),%edi
    4bf2:	89 7c 24 18          	mov    %edi,0x18(%esp)
    4bf6:	8b 0c 99             	mov    (%ecx,%ebx,4),%ecx
    4bf9:	85 c9                	test   %ecx,%ecx
    4bfb:	74 15                	je     4c12 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x672>
    4bfd:	89 4d 04             	mov    %ecx,0x4(%ebp)
    4c00:	8b 7c 24 18          	mov    0x18(%esp),%edi
    4c04:	89 7d 08             	mov    %edi,0x8(%ebp)
    4c07:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    4c0b:	89 1f                	mov    %ebx,(%edi)
    4c0d:	89 59 04             	mov    %ebx,0x4(%ecx)
    4c10:	eb 32                	jmp    4c44 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6a4>
    4c12:	31 c9                	xor    %ecx,%ecx
    4c14:	83 fb 20             	cmp    $0x20,%ebx
    4c17:	0f 93 c1             	setae  %cl
    4c1a:	89 cf                	mov    %ecx,%edi
    4c1c:	89 d9                	mov    %ebx,%ecx
    4c1e:	bb 01 00 00 00       	mov    $0x1,%ebx
    4c23:	d3 e3                	shl    %cl,%ebx
    4c25:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4c29:	31 9c b9 18 00 00 00 	xor    %ebx,0x18(%ecx,%edi,4)
    4c30:	c7 45 04 00 00 00 00 	movl   $0x0,0x4(%ebp)
    4c37:	8b 7c 24 18          	mov    0x18(%esp),%edi
    4c3b:	89 7d 08             	mov    %edi,0x8(%ebp)
    4c3e:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    4c42:	89 0f                	mov    %ecx,(%edi)
    4c44:	89 55 0c             	mov    %edx,0xc(%ebp)
    4c47:	89 56 fc             	mov    %edx,-0x4(%esi)
    4c4a:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    4c4e:	83 c1 03             	add    $0x3,%ecx
    4c51:	89 4d 00             	mov    %ecx,0x0(%ebp)
    4c54:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    4c58:	39 fd                	cmp    %edi,%ebp
    4c5a:	74 02                	je     4c5e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    4c5c:	89 2f                	mov    %ebp,(%edi)
    4c5e:	83 c4 4c             	add    $0x4c,%esp
    4c61:	5e                   	pop    %esi
    4c62:	5f                   	pop    %edi
    4c63:	5b                   	pop    %ebx
    4c64:	5d                   	pop    %ebp
    4c65:	c3                   	ret
    4c66:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    4c6a:	8d 83 60 ff ff ff    	lea    -0xa0(%ebx),%eax
    4c70:	89 44 24 34          	mov    %eax,0x34(%esp)
    4c74:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    4c7b:	00 
    4c7c:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    4c83:	00 
    4c84:	c7 44 24 3c 04 00 00 	movl   $0x4,0x3c(%esp)
    4c8b:	00 
    4c8c:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
    4c93:	00 
    4c94:	8d 93 68 ff ff ff    	lea    -0x98(%ebx),%edx
    4c9a:	8d 4c 24 34          	lea    0x34(%esp),%ecx
    4c9e:	e8 9d c4 ff ff       	call   1140 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    4ca3:	66 90                	xchg   %ax,%ax
    4ca5:	66 90                	xchg   %ax,%ax
    4ca7:	66 90                	xchg   %ax,%ax
    4ca9:	66 90                	xchg   %ax,%ax
    4cab:	66 90                	xchg   %ax,%ax
    4cad:	66 90                	xchg   %ax,%ax
    4caf:	90                   	nop

00004cb0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>:
    4cb0:	53                   	push   %ebx
    4cb1:	83 ec 58             	sub    $0x58,%esp
    4cb4:	e8 00 00 00 00       	call   4cb9 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0x9>
    4cb9:	5b                   	pop    %ebx
    4cba:	81 c3 3b 53 00 00    	add    $0x533b,%ebx
    4cc0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4cc4:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    4cca:	83 f8 02             	cmp    $0x2,%eax
    4ccd:	0f 86 d0 00 00 00    	jbe    4da3 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xf3>
    4cd3:	8d 44 24 08          	lea    0x8(%esp),%eax
    4cd7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4cdb:	8d 83 0c 9f ff ff    	lea    -0x60f4(%ebx),%eax
    4ce1:	89 44 24 10          	mov    %eax,0x10(%esp)
    4ce5:	c7 44 24 34 03 00 00 	movl   $0x3,0x34(%esp)
    4cec:	00 
    4ced:	8d 83 97 e7 ff ff    	lea    -0x1869(%ebx),%eax
    4cf3:	89 44 24 38          	mov    %eax,0x38(%esp)
    4cf7:	c7 44 24 3c 13 00 00 	movl   $0x13,0x3c(%esp)
    4cfe:	00 
    4cff:	8d 8b 88 fe ff ff    	lea    -0x178(%ebx),%ecx
    4d05:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    4d09:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    4d10:	00 
    4d11:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    4d15:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    4d19:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    4d20:	00 
    4d21:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    4d28:	00 
    4d29:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4d30:	00 
    4d31:	89 44 24 20          	mov    %eax,0x20(%esp)
    4d35:	c7 44 24 24 13 00 00 	movl   $0x13,0x24(%esp)
    4d3c:	00 
    4d3d:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    4d44:	00 
    4d45:	8d 83 50 e7 ff ff    	lea    -0x18b0(%ebx),%eax
    4d4b:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    4d4f:	c7 44 24 30 47 00 00 	movl   $0x47,0x30(%esp)
    4d56:	00 
    4d57:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    4d5e:	00 
    4d5f:	c7 44 24 18 04 00 00 	movl   $0x4,0x18(%esp)
    4d66:	00 
    4d67:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    4d6d:	83 f8 02             	cmp    $0x2,%eax
    4d70:	74 10                	je     4d82 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xd2>
    4d72:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    4d78:	75 10                	jne    4d8a <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xda>
    4d7a:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    4d80:	eb 0e                	jmp    4d90 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xe0>
    4d82:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    4d88:	74 f0                	je     4d7a <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xca>
    4d8a:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    4d90:	83 ec 08             	sub    $0x8,%esp
    4d93:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    4d97:	52                   	push   %edx
    4d98:	51                   	push   %ecx
    4d99:	ff 50 10             	call   *0x10(%eax)
    4d9c:	83 c4 10             	add    $0x10,%esp
    4d9f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    4da3:	b8 89 00 00 00       	mov    $0x89,%eax
    4da8:	89 ca                	mov    %ecx,%edx
    4daa:	cd 50                	int    $0x50
    4dac:	0f 0b                	ud2
    4dae:	66 90                	xchg   %ax,%ax

00004db0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>:
    4db0:	53                   	push   %ebx
    4db1:	83 ec 58             	sub    $0x58,%esp
    4db4:	e8 00 00 00 00       	call   4db9 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0x9>
    4db9:	5b                   	pop    %ebx
    4dba:	81 c3 3b 52 00 00    	add    $0x523b,%ebx
    4dc0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4dc4:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    4dca:	85 c0                	test   %eax,%eax
    4dcc:	0f 84 ce 00 00 00    	je     4ea0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    4dd2:	8d 44 24 08          	lea    0x8(%esp),%eax
    4dd6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4dda:	8d 83 bc ae ff ff    	lea    -0x5144(%ebx),%eax
    4de0:	89 44 24 10          	mov    %eax,0x10(%esp)
    4de4:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%esp)
    4deb:	00 
    4dec:	8d 83 95 e8 ff ff    	lea    -0x176b(%ebx),%eax
    4df2:	89 44 24 38          	mov    %eax,0x38(%esp)
    4df6:	c7 44 24 3c 0a 00 00 	movl   $0xa,0x3c(%esp)
    4dfd:	00 
    4dfe:	8d 8b e0 fe ff ff    	lea    -0x120(%ebx),%ecx
    4e04:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    4e08:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    4e0f:	00 
    4e10:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    4e14:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    4e18:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    4e1f:	00 
    4e20:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    4e27:	00 
    4e28:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4e2f:	00 
    4e30:	89 44 24 20          	mov    %eax,0x20(%esp)
    4e34:	c7 44 24 24 0a 00 00 	movl   $0xa,0x24(%esp)
    4e3b:	00 
    4e3c:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    4e43:	00 
    4e44:	8d 83 56 e8 ff ff    	lea    -0x17aa(%ebx),%eax
    4e4a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    4e4e:	c7 44 24 30 3f 00 00 	movl   $0x3f,0x30(%esp)
    4e55:	00 
    4e56:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    4e5d:	00 
    4e5e:	c7 44 24 18 1d 00 00 	movl   $0x1d,0x18(%esp)
    4e65:	00 
    4e66:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    4e6c:	83 f8 02             	cmp    $0x2,%eax
    4e6f:	74 10                	je     4e81 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xd1>
    4e71:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    4e77:	75 10                	jne    4e89 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xd9>
    4e79:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    4e7f:	eb 0e                	jmp    4e8f <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xdf>
    4e81:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    4e87:	74 f0                	je     4e79 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xc9>
    4e89:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    4e8f:	83 ec 08             	sub    $0x8,%esp
    4e92:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    4e96:	52                   	push   %edx
    4e97:	51                   	push   %ecx
    4e98:	ff 50 10             	call   *0x10(%eax)
    4e9b:	83 c4 10             	add    $0x10,%esp
    4e9e:	90                   	nop
    4e9f:	90                   	nop
    4ea0:	eb fe                	jmp    4ea0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    4ea2:	66 90                	xchg   %ax,%ax
    4ea4:	66 90                	xchg   %ax,%ax
    4ea6:	66 90                	xchg   %ax,%ax
    4ea8:	66 90                	xchg   %ax,%ax
    4eaa:	66 90                	xchg   %ax,%ax
    4eac:	66 90                	xchg   %ax,%ax
    4eae:	66 90                	xchg   %ax,%ax

00004eb0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E>:
    4eb0:	55                   	push   %ebp
    4eb1:	53                   	push   %ebx
    4eb2:	57                   	push   %edi
    4eb3:	56                   	push   %esi
    4eb4:	83 ec 3c             	sub    $0x3c,%esp
    4eb7:	e8 00 00 00 00       	call   4ebc <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0xc>
    4ebc:	5b                   	pop    %ebx
    4ebd:	81 c3 38 51 00 00    	add    $0x5138,%ebx
    4ec3:	8b 44 24 54          	mov    0x54(%esp),%eax
    4ec7:	8b 4c 24 50          	mov    0x50(%esp),%ecx
    4ecb:	8b 09                	mov    (%ecx),%ecx
    4ecd:	8b 11                	mov    (%ecx),%edx
    4ecf:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    4ed3:	8b 79 04             	mov    0x4(%ecx),%edi
    4ed6:	8b 28                	mov    (%eax),%ebp
    4ed8:	8b 70 04             	mov    0x4(%eax),%esi
    4edb:	8b 4e 0c             	mov    0xc(%esi),%ecx
    4ede:	83 ec 04             	sub    $0x4,%esp
    4ee1:	8d 83 97 db ff ff    	lea    -0x2469(%ebx),%eax
    4ee7:	6a 0c                	push   $0xc
    4ee9:	50                   	push   %eax
    4eea:	55                   	push   %ebp
    4eeb:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    4eef:	ff d1                	call   *%ecx
    4ef1:	83 c4 10             	add    $0x10,%esp
    4ef4:	b1 01                	mov    $0x1,%cl
    4ef6:	84 c0                	test   %al,%al
    4ef8:	0f 85 d0 00 00 00    	jne    4fce <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    4efe:	8d 47 08             	lea    0x8(%edi),%eax
    4f01:	89 7c 24 04          	mov    %edi,0x4(%esp)
    4f05:	83 c7 0c             	add    $0xc,%edi
    4f08:	8d 8b 9c 94 ff ff    	lea    -0x6b64(%ebx),%ecx
    4f0e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    4f12:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4f16:	8d 83 1c 97 ff ff    	lea    -0x68e4(%ebx),%eax
    4f1c:	89 44 24 10          	mov    %eax,0x10(%esp)
    4f20:	89 7c 24 14          	mov    %edi,0x14(%esp)
    4f24:	89 44 24 18          	mov    %eax,0x18(%esp)
    4f28:	8d 83 50 fd ff ff    	lea    -0x2b0(%ebx),%eax
    4f2e:	89 44 24 24          	mov    %eax,0x24(%esp)
    4f32:	c7 44 24 28 03 00 00 	movl   $0x3,0x28(%esp)
    4f39:	00 
    4f3a:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
    4f41:	00 
    4f42:	8d 7c 24 04          	lea    0x4(%esp),%edi
    4f46:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    4f4a:	c7 44 24 30 03 00 00 	movl   $0x3,0x30(%esp)
    4f51:	00 
    4f52:	83 ec 0c             	sub    $0xc,%esp
    4f55:	8d 44 24 30          	lea    0x30(%esp),%eax
    4f59:	89 e9                	mov    %ebp,%ecx
    4f5b:	89 f2                	mov    %esi,%edx
    4f5d:	50                   	push   %eax
    4f5e:	e8 8d e5 ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    4f63:	83 c4 10             	add    $0x10,%esp
    4f66:	84 c0                	test   %al,%al
    4f68:	74 04                	je     4f6e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0xbe>
    4f6a:	b1 01                	mov    $0x1,%cl
    4f6c:	eb 60                	jmp    4fce <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    4f6e:	83 ec 04             	sub    $0x4,%esp
    4f71:	8d 83 a3 db ff ff    	lea    -0x245d(%ebx),%eax
    4f77:	6a 02                	push   $0x2
    4f79:	50                   	push   %eax
    4f7a:	55                   	push   %ebp
    4f7b:	ff 54 24 30          	call   *0x30(%esp)
    4f7f:	83 c4 10             	add    $0x10,%esp
    4f82:	84 c0                	test   %al,%al
    4f84:	b1 01                	mov    $0x1,%cl
    4f86:	75 46                	jne    4fce <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    4f88:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4f8c:	8b 42 14             	mov    0x14(%edx),%eax
    4f8f:	89 44 24 18          	mov    %eax,0x18(%esp)
    4f93:	8b 42 10             	mov    0x10(%edx),%eax
    4f96:	89 44 24 14          	mov    %eax,0x14(%esp)
    4f9a:	8b 42 0c             	mov    0xc(%edx),%eax
    4f9d:	89 44 24 10          	mov    %eax,0x10(%esp)
    4fa1:	8b 42 08             	mov    0x8(%edx),%eax
    4fa4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4fa8:	8b 0a                	mov    (%edx),%ecx
    4faa:	8b 42 04             	mov    0x4(%edx),%eax
    4fad:	89 44 24 08          	mov    %eax,0x8(%esp)
    4fb1:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    4fb5:	83 f8 01             	cmp    $0x1,%eax
    4fb8:	74 02                	je     4fbc <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x10c>
    4fba:	85 c0                	test   %eax,%eax
    4fbc:	83 ec 0c             	sub    $0xc,%esp
    4fbf:	89 e9                	mov    %ebp,%ecx
    4fc1:	89 f2                	mov    %esi,%edx
    4fc3:	57                   	push   %edi
    4fc4:	e8 27 e5 ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    4fc9:	83 c4 10             	add    $0x10,%esp
    4fcc:	89 c1                	mov    %eax,%ecx
    4fce:	89 c8                	mov    %ecx,%eax
    4fd0:	83 c4 3c             	add    $0x3c,%esp
    4fd3:	5e                   	pop    %esi
    4fd4:	5f                   	pop    %edi
    4fd5:	5b                   	pop    %ebx
    4fd6:	5d                   	pop    %ebp
    4fd7:	c3                   	ret
    4fd8:	66 90                	xchg   %ax,%ax
    4fda:	66 90                	xchg   %ax,%ax
    4fdc:	66 90                	xchg   %ax,%ax
    4fde:	66 90                	xchg   %ax,%ax

00004fe0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>:
    4fe0:	53                   	push   %ebx
    4fe1:	83 ec 08             	sub    $0x8,%esp
    4fe4:	e8 00 00 00 00       	call   4fe9 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E+0x9>
    4fe9:	5b                   	pop    %ebx
    4fea:	81 c3 0b 50 00 00    	add    $0x500b,%ebx
    4ff0:	e8 0b 00 00 00       	call   5000 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E>
    4ff5:	66 90                	xchg   %ax,%ax
    4ff7:	66 90                	xchg   %ax,%ax
    4ff9:	66 90                	xchg   %ax,%ax
    4ffb:	66 90                	xchg   %ax,%ax
    4ffd:	66 90                	xchg   %ax,%ax
    4fff:	90                   	nop

00005000 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E>:
    5000:	55                   	push   %ebp
    5001:	53                   	push   %ebx
    5002:	57                   	push   %edi
    5003:	56                   	push   %esi
    5004:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
    500a:	89 d6                	mov    %edx,%esi
    500c:	89 cd                	mov    %ecx,%ebp
    500e:	e8 00 00 00 00       	call   5013 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x13>
    5013:	5b                   	pop    %ebx
    5014:	81 c3 e1 4f 00 00    	add    $0x4fe1,%ebx
    501a:	8d 54 24 0c          	lea    0xc(%esp),%edx
    501e:	b8 87 00 00 00       	mov    $0x87,%eax
    5023:	cd 80                	int    $0x80
    5025:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5028:	83 f9 0a             	cmp    $0xa,%ecx
    502b:	0f 83 f0 00 00 00    	jae    5121 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x121>
    5031:	89 c1                	mov    %eax,%ecx
    5033:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    5037:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    503d:	85 c0                	test   %eax,%eax
    503f:	75 0a                	jne    504b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4b>
    5041:	b9 20 00 00 00       	mov    $0x20,%ecx
    5046:	e8 65 fc ff ff       	call   4cb0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    504b:	8d 44 24 68          	lea    0x68(%esp),%eax
    504f:	89 44 24 54          	mov    %eax,0x54(%esp)
    5053:	8d 83 fc 80 ff ff    	lea    -0x7f04(%ebx),%eax
    5059:	89 44 24 58          	mov    %eax,0x58(%esp)
    505d:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    5064:	00 
    5065:	8d 83 0a e8 ff ff    	lea    -0x17f6(%ebx),%eax
    506b:	89 44 24 30          	mov    %eax,0x30(%esp)
    506f:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    5076:	00 
    5077:	8d 8b 90 fe ff ff    	lea    -0x170(%ebx),%ecx
    507d:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    5081:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5088:	00 
    5089:	8d 4c 24 54          	lea    0x54(%esp),%ecx
    508d:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    5091:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5098:	00 
    5099:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    50a0:	00 
    50a1:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    50a8:	00 
    50a9:	89 44 24 18          	mov    %eax,0x18(%esp)
    50ad:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    50b4:	00 
    50b5:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    50bc:	00 
    50bd:	8d 83 c8 e7 ff ff    	lea    -0x1838(%ebx),%eax
    50c3:	89 44 24 24          	mov    %eax,0x24(%esp)
    50c7:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    50ce:	00 
    50cf:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    50d6:	00 
    50d7:	c7 44 24 10 38 00 00 	movl   $0x38,0x10(%esp)
    50de:	00 
    50df:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    50e5:	83 f8 02             	cmp    $0x2,%eax
    50e8:	74 10                	je     50fa <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa>
    50ea:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    50f0:	75 10                	jne    5102 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x102>
    50f2:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    50f8:	eb 0e                	jmp    5108 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x108>
    50fa:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5100:	74 f0                	je     50f2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf2>
    5102:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    5108:	83 ec 08             	sub    $0x8,%esp
    510b:	8d 54 24 14          	lea    0x14(%esp),%edx
    510f:	52                   	push   %edx
    5110:	51                   	push   %ecx
    5111:	ff 50 10             	call   *0x10(%eax)
    5114:	83 c4 10             	add    $0x10,%esp
    5117:	b9 20 00 00 00       	mov    $0x20,%ecx
    511c:	e8 8f fb ff ff       	call   4cb0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    5121:	b9 42 00 00 00       	mov    $0x42,%ecx
    5126:	85 c0                	test   %eax,%eax
    5128:	0f 85 05 ff ff ff    	jne    5033 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x33>
    512e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    5132:	8b 44 24 10          	mov    0x10(%esp),%eax
    5136:	8b 54 24 14          	mov    0x14(%esp),%edx
    513a:	89 94 24 88 00 00 00 	mov    %edx,0x88(%esp)
    5141:	8b 84 83 44 d5 ff ff 	mov    -0x2abc(%ebx,%eax,4),%eax
    5148:	01 d8                	add    %ebx,%eax
    514a:	ff e0                	jmp    *%eax
    514c:	83 fd 01             	cmp    $0x1,%ebp
    514f:	0f 85 0e 08 00 00    	jne    5963 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x963>
    5155:	8d 83 9c c0 ff ff    	lea    -0x3f64(%ebx),%eax
    515b:	89 44 24 64          	mov    %eax,0x64(%esp)
    515f:	8d ab 03 e4 ff ff    	lea    -0x1bfd(%ebx),%ebp
    5165:	8d 83 e0 fd ff ff    	lea    -0x220(%ebx),%eax
    516b:	89 44 24 78          	mov    %eax,0x78(%esp)
    516f:	8d b3 9c e3 ff ff    	lea    -0x1c64(%ebx),%esi
    5175:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    517b:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
    5182:	8d 83 57 ea ff ff    	lea    -0x15a9(%ebx),%eax
    5188:	89 44 24 7c          	mov    %eax,0x7c(%esp)
    518c:	8d 83 7c 9e ff ff    	lea    -0x6184(%ebx),%eax
    5192:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
    5199:	8d bb a2 e9 ff ff    	lea    -0x165e(%ebx),%edi
    519f:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
    51a5:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
    51ac:	8d 83 3a e9 ff ff    	lea    -0x16c6(%ebx),%eax
    51b2:	89 84 24 84 00 00 00 	mov    %eax,0x84(%esp)
    51b9:	8d 83 0c ca ff ff    	lea    -0x35f4(%ebx),%eax
    51bf:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
    51c6:	eb 15                	jmp    51dd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    51c8:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    51ce:	83 ec 08             	sub    $0x8,%esp
    51d1:	8d 54 24 14          	lea    0x14(%esp),%edx
    51d5:	52                   	push   %edx
    51d6:	51                   	push   %ecx
    51d7:	ff 50 10             	call   *0x10(%eax)
    51da:	83 c4 10             	add    $0x10,%esp
    51dd:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    51e4:	8d 54 24 68          	lea    0x68(%esp),%edx
    51e8:	b8 8e 00 00 00       	mov    $0x8e,%eax
    51ed:	cd 80                	int    $0x80
    51ef:	8d 48 ff             	lea    -0x1(%eax),%ecx
    51f2:	83 f9 0a             	cmp    $0xa,%ecx
    51f5:	0f 83 c2 01 00 00    	jae    53bd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3bd>
    51fb:	89 c1                	mov    %eax,%ecx
    51fd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    5201:	8d 44 24 08          	lea    0x8(%esp),%eax
    5205:	89 44 24 50          	mov    %eax,0x50(%esp)
    5209:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    520f:	85 c0                	test   %eax,%eax
    5211:	0f 84 9b 0d 00 00    	je     5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5217:	8d 44 24 50          	lea    0x50(%esp),%eax
    521b:	89 44 24 54          	mov    %eax,0x54(%esp)
    521f:	8b 44 24 64          	mov    0x64(%esp),%eax
    5223:	89 44 24 58          	mov    %eax,0x58(%esp)
    5227:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    522e:	00 
    522f:	89 6c 24 30          	mov    %ebp,0x30(%esp)
    5233:	c7 44 24 34 1b 00 00 	movl   $0x1b,0x34(%esp)
    523a:	00 
    523b:	8b 44 24 78          	mov    0x78(%esp),%eax
    523f:	89 44 24 38          	mov    %eax,0x38(%esp)
    5243:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    524a:	00 
    524b:	8d 44 24 54          	lea    0x54(%esp),%eax
    524f:	89 44 24 40          	mov    %eax,0x40(%esp)
    5253:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    525a:	00 
    525b:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5262:	00 
    5263:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    526a:	00 
    526b:	89 6c 24 18          	mov    %ebp,0x18(%esp)
    526f:	c7 44 24 1c 1b 00 00 	movl   $0x1b,0x1c(%esp)
    5276:	00 
    5277:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    527e:	00 
    527f:	89 74 24 24          	mov    %esi,0x24(%esp)
    5283:	c7 44 24 28 4a 00 00 	movl   $0x4a,0x28(%esp)
    528a:	00 
    528b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5292:	00 
    5293:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
    529a:	00 
    529b:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    52a1:	83 f8 02             	cmp    $0x2,%eax
    52a4:	74 1a                	je     52c0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2c0>
    52a6:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
    52ad:	75 19                	jne    52c8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2c8>
    52af:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    52b5:	eb 15                	jmp    52cc <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2cc>
    52b7:	90                   	nop
    52b8:	90                   	nop
    52b9:	90                   	nop
    52ba:	90                   	nop
    52bb:	90                   	nop
    52bc:	90                   	nop
    52bd:	90                   	nop
    52be:	90                   	nop
    52bf:	90                   	nop
    52c0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    52c6:	74 e7                	je     52af <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2af>
    52c8:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
    52cc:	83 ec 08             	sub    $0x8,%esp
    52cf:	8d 54 24 14          	lea    0x14(%esp),%edx
    52d3:	52                   	push   %edx
    52d4:	51                   	push   %ecx
    52d5:	ff 50 10             	call   *0x10(%eax)
    52d8:	83 c4 10             	add    $0x10,%esp
    52db:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    52e0:	0f 85 cc 0c 00 00    	jne    5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    52e6:	83 7c 24 68 03       	cmpl   $0x3,0x68(%esp)
    52eb:	0f 84 c1 0c 00 00    	je     5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    52f1:	8b 54 24 6c          	mov    0x6c(%esp),%edx
    52f5:	89 54 24 08          	mov    %edx,0x8(%esp)
    52f9:	85 d2                	test   %edx,%edx
    52fb:	0f 84 dc fe ff ff    	je     51dd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    5301:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5307:	83 f8 03             	cmp    $0x3,%eax
    530a:	0f 86 de 00 00 00    	jbe    53ee <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3ee>
    5310:	8d 44 24 08          	lea    0x8(%esp),%eax
    5314:	89 44 24 54          	mov    %eax,0x54(%esp)
    5318:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    531f:	89 44 24 58          	mov    %eax,0x58(%esp)
    5323:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    532a:	00 
    532b:	89 7c 24 30          	mov    %edi,0x30(%esp)
    532f:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    5336:	00 
    5337:	8b 84 24 8c 00 00 00 	mov    0x8c(%esp),%eax
    533e:	89 44 24 38          	mov    %eax,0x38(%esp)
    5342:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5349:	00 
    534a:	8d 44 24 54          	lea    0x54(%esp),%eax
    534e:	89 44 24 40          	mov    %eax,0x40(%esp)
    5352:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5359:	00 
    535a:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5361:	00 
    5362:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    5369:	00 
    536a:	89 7c 24 18          	mov    %edi,0x18(%esp)
    536e:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    5375:	00 
    5376:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    537d:	00 
    537e:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
    5385:	89 44 24 24          	mov    %eax,0x24(%esp)
    5389:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    5390:	00 
    5391:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5398:	00 
    5399:	c7 44 24 10 51 00 00 	movl   $0x51,0x10(%esp)
    53a0:	00 
    53a1:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    53a7:	83 f8 02             	cmp    $0x2,%eax
    53aa:	74 23                	je     53cf <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3cf>
    53ac:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
    53b3:	75 22                	jne    53d7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3d7>
    53b5:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    53bb:	eb 1e                	jmp    53db <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3db>
    53bd:	b9 42 00 00 00       	mov    $0x42,%ecx
    53c2:	85 c0                	test   %eax,%eax
    53c4:	0f 84 1c ff ff ff    	je     52e6 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2e6>
    53ca:	e9 2e fe ff ff       	jmp    51fd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1fd>
    53cf:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    53d5:	74 de                	je     53b5 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3b5>
    53d7:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
    53db:	83 ec 08             	sub    $0x8,%esp
    53de:	8d 54 24 14          	lea    0x14(%esp),%edx
    53e2:	52                   	push   %edx
    53e3:	51                   	push   %ecx
    53e4:	ff 50 10             	call   *0x10(%eax)
    53e7:	83 c4 10             	add    $0x10,%esp
    53ea:	8b 54 24 08          	mov    0x8(%esp),%edx
    53ee:	b8 8d 00 00 00       	mov    $0x8d,%eax
    53f3:	cd 80                	int    $0x80
    53f5:	8d 48 ff             	lea    -0x1(%eax),%ecx
    53f8:	83 f9 0a             	cmp    $0xa,%ecx
    53fb:	0f 83 da 00 00 00    	jae    54db <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4db>
    5401:	89 44 24 50          	mov    %eax,0x50(%esp)
    5405:	8d 44 24 50          	lea    0x50(%esp),%eax
    5409:	89 44 24 68          	mov    %eax,0x68(%esp)
    540d:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5413:	85 c0                	test   %eax,%eax
    5415:	0f 84 c2 fd ff ff    	je     51dd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    541b:	8d 44 24 68          	lea    0x68(%esp),%eax
    541f:	89 44 24 54          	mov    %eax,0x54(%esp)
    5423:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
    542a:	89 44 24 58          	mov    %eax,0x58(%esp)
    542e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    5435:	00 
    5436:	89 7c 24 30          	mov    %edi,0x30(%esp)
    543a:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    5441:	00 
    5442:	8d 83 10 ff ff ff    	lea    -0xf0(%ebx),%eax
    5448:	89 44 24 38          	mov    %eax,0x38(%esp)
    544c:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5453:	00 
    5454:	8d 44 24 54          	lea    0x54(%esp),%eax
    5458:	89 44 24 40          	mov    %eax,0x40(%esp)
    545c:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5463:	00 
    5464:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    546b:	00 
    546c:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    5473:	00 
    5474:	89 7c 24 18          	mov    %edi,0x18(%esp)
    5478:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    547f:	00 
    5480:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5487:	00 
    5488:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
    548f:	89 44 24 24          	mov    %eax,0x24(%esp)
    5493:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    549a:	00 
    549b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    54a2:	00 
    54a3:	c7 44 24 10 59 00 00 	movl   $0x59,0x10(%esp)
    54aa:	00 
    54ab:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    54b1:	83 f8 02             	cmp    $0x2,%eax
    54b4:	74 0e                	je     54c4 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4c4>
    54b6:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    54bc:	0f 85 06 fd ff ff    	jne    51c8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1c8>
    54c2:	eb 0c                	jmp    54d0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4d0>
    54c4:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    54ca:	0f 85 f8 fc ff ff    	jne    51c8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1c8>
    54d0:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    54d6:	e9 f3 fc ff ff       	jmp    51ce <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1ce>
    54db:	85 c0                	test   %eax,%eax
    54dd:	b8 42 00 00 00       	mov    $0x42,%eax
    54e2:	0f 84 f5 fc ff ff    	je     51dd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    54e8:	e9 14 ff ff ff       	jmp    5401 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x401>
    54ed:	83 fd 02             	cmp    $0x2,%ebp
    54f0:	0f 85 6d 04 00 00    	jne    5963 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x963>
    54f6:	89 74 24 78          	mov    %esi,0x78(%esp)
    54fa:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5500:	8d 8b 0a e8 ff ff    	lea    -0x17f6(%ebx),%ecx
    5506:	89 4c 24 64          	mov    %ecx,0x64(%esp)
    550a:	83 f8 03             	cmp    $0x3,%eax
    550d:	0f 86 9d 04 00 00    	jbe    59b0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    5513:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    551a:	00 
    551b:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    551f:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    5523:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    552a:	00 
    552b:	8d 83 98 fe ff ff    	lea    -0x168(%ebx),%eax
    5531:	89 44 24 38          	mov    %eax,0x38(%esp)
    5535:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    553c:	00 
    553d:	c7 44 24 40 04 00 00 	movl   $0x4,0x40(%esp)
    5544:	00 
    5545:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    554c:	00 
    554d:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5554:	00 
    5555:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    555c:	00 
    555d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    5561:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    5568:	00 
    5569:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5570:	00 
    5571:	8d 83 c8 e7 ff ff    	lea    -0x1838(%ebx),%eax
    5577:	89 44 24 24          	mov    %eax,0x24(%esp)
    557b:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    5582:	00 
    5583:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    558a:	00 
    558b:	c7 44 24 10 61 00 00 	movl   $0x61,0x10(%esp)
    5592:	00 
    5593:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5599:	83 f8 02             	cmp    $0x2,%eax
    559c:	0f 84 cb 03 00 00    	je     596d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x96d>
    55a2:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    55a8:	e9 c6 03 00 00       	jmp    5973 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x973>
    55ad:	85 ed                	test   %ebp,%ebp
    55af:	0f 85 ae 03 00 00    	jne    5963 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x963>
    55b5:	8d 83 9c c0 ff ff    	lea    -0x3f64(%ebx),%eax
    55bb:	89 44 24 64          	mov    %eax,0x64(%esp)
    55bf:	8d bb 03 e4 ff ff    	lea    -0x1bfd(%ebx),%edi
    55c5:	8d ab e0 fd ff ff    	lea    -0x220(%ebx),%ebp
    55cb:	8d b3 9c e3 ff ff    	lea    -0x1c64(%ebx),%esi
    55d1:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    55d7:	89 44 24 78          	mov    %eax,0x78(%esp)
    55db:	8d 83 57 ea ff ff    	lea    -0x15a9(%ebx),%eax
    55e1:	89 84 24 84 00 00 00 	mov    %eax,0x84(%esp)
    55e8:	8d 83 7c 9e ff ff    	lea    -0x6184(%ebx),%eax
    55ee:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
    55f5:	8d 83 a2 e9 ff ff    	lea    -0x165e(%ebx),%eax
    55fb:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
    5602:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
    5608:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
    560f:	8d 83 3a e9 ff ff    	lea    -0x16c6(%ebx),%eax
    5615:	89 44 24 7c          	mov    %eax,0x7c(%esp)
    5619:	8d 83 0c ca ff ff    	lea    -0x35f4(%ebx),%eax
    561f:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
    5626:	eb 18                	jmp    5640 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    5628:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    562e:	83 ec 08             	sub    $0x8,%esp
    5631:	8d 54 24 14          	lea    0x14(%esp),%edx
    5635:	52                   	push   %edx
    5636:	51                   	push   %ecx
    5637:	ff 50 10             	call   *0x10(%eax)
    563a:	83 c4 10             	add    $0x10,%esp
    563d:	90                   	nop
    563e:	90                   	nop
    563f:	90                   	nop
    5640:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    5647:	8d 54 24 54          	lea    0x54(%esp),%edx
    564b:	b8 8e 00 00 00       	mov    $0x8e,%eax
    5650:	cd 80                	int    $0x80
    5652:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5655:	83 f9 0a             	cmp    $0xa,%ecx
    5658:	0f 83 ce 01 00 00    	jae    582c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x82c>
    565e:	89 c1                	mov    %eax,%ecx
    5660:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    5664:	8d 44 24 08          	lea    0x8(%esp),%eax
    5668:	89 44 24 50          	mov    %eax,0x50(%esp)
    566c:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5672:	85 c0                	test   %eax,%eax
    5674:	0f 84 38 09 00 00    	je     5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    567a:	8d 44 24 50          	lea    0x50(%esp),%eax
    567e:	89 44 24 68          	mov    %eax,0x68(%esp)
    5682:	8b 44 24 64          	mov    0x64(%esp),%eax
    5686:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    568a:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    5691:	00 
    5692:	89 7c 24 30          	mov    %edi,0x30(%esp)
    5696:	c7 44 24 34 1b 00 00 	movl   $0x1b,0x34(%esp)
    569d:	00 
    569e:	89 6c 24 38          	mov    %ebp,0x38(%esp)
    56a2:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    56a9:	00 
    56aa:	8d 44 24 68          	lea    0x68(%esp),%eax
    56ae:	89 44 24 40          	mov    %eax,0x40(%esp)
    56b2:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    56b9:	00 
    56ba:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    56c1:	00 
    56c2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    56c9:	00 
    56ca:	89 7c 24 18          	mov    %edi,0x18(%esp)
    56ce:	c7 44 24 1c 1b 00 00 	movl   $0x1b,0x1c(%esp)
    56d5:	00 
    56d6:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    56dd:	00 
    56de:	89 74 24 24          	mov    %esi,0x24(%esp)
    56e2:	c7 44 24 28 4a 00 00 	movl   $0x4a,0x28(%esp)
    56e9:	00 
    56ea:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    56f1:	00 
    56f2:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
    56f9:	00 
    56fa:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5700:	83 f8 02             	cmp    $0x2,%eax
    5703:	74 1b                	je     5720 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x720>
    5705:	8b 44 24 78          	mov    0x78(%esp),%eax
    5709:	75 1d                	jne    5728 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x728>
    570b:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5711:	eb 1c                	jmp    572f <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x72f>
    5713:	90                   	nop
    5714:	90                   	nop
    5715:	90                   	nop
    5716:	90                   	nop
    5717:	90                   	nop
    5718:	90                   	nop
    5719:	90                   	nop
    571a:	90                   	nop
    571b:	90                   	nop
    571c:	90                   	nop
    571d:	90                   	nop
    571e:	90                   	nop
    571f:	90                   	nop
    5720:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5726:	74 e3                	je     570b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x70b>
    5728:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    572f:	83 ec 08             	sub    $0x8,%esp
    5732:	8d 54 24 14          	lea    0x14(%esp),%edx
    5736:	52                   	push   %edx
    5737:	51                   	push   %ecx
    5738:	ff 50 10             	call   *0x10(%eax)
    573b:	83 c4 10             	add    $0x10,%esp
    573e:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    5743:	0f 85 69 08 00 00    	jne    5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5749:	8b 44 24 54          	mov    0x54(%esp),%eax
    574d:	83 f8 03             	cmp    $0x3,%eax
    5750:	0f 84 5c 08 00 00    	je     5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5756:	83 f8 01             	cmp    $0x1,%eax
    5759:	0f 87 e1 fe ff ff    	ja     5640 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    575f:	8b 54 24 5c          	mov    0x5c(%esp),%edx
    5763:	89 54 24 08          	mov    %edx,0x8(%esp)
    5767:	85 d2                	test   %edx,%edx
    5769:	0f 84 d1 fe ff ff    	je     5640 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    576f:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5775:	83 f8 03             	cmp    $0x3,%eax
    5778:	0f 86 e2 00 00 00    	jbe    5860 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x860>
    577e:	8d 44 24 08          	lea    0x8(%esp),%eax
    5782:	89 44 24 54          	mov    %eax,0x54(%esp)
    5786:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    578d:	89 44 24 58          	mov    %eax,0x58(%esp)
    5791:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    5798:	00 
    5799:	8b 8c 24 80 00 00 00 	mov    0x80(%esp),%ecx
    57a0:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    57a4:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    57ab:	00 
    57ac:	8b 84 24 8c 00 00 00 	mov    0x8c(%esp),%eax
    57b3:	89 44 24 38          	mov    %eax,0x38(%esp)
    57b7:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    57be:	00 
    57bf:	8d 44 24 54          	lea    0x54(%esp),%eax
    57c3:	89 44 24 40          	mov    %eax,0x40(%esp)
    57c7:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    57ce:	00 
    57cf:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    57d6:	00 
    57d7:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    57de:	00 
    57df:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    57e3:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    57ea:	00 
    57eb:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    57f2:	00 
    57f3:	8b 44 24 7c          	mov    0x7c(%esp),%eax
    57f7:	89 44 24 24          	mov    %eax,0x24(%esp)
    57fb:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    5802:	00 
    5803:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    580a:	00 
    580b:	c7 44 24 10 51 00 00 	movl   $0x51,0x10(%esp)
    5812:	00 
    5813:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5819:	83 f8 02             	cmp    $0x2,%eax
    581c:	74 20                	je     583e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x83e>
    581e:	8b 44 24 78          	mov    0x78(%esp),%eax
    5822:	75 22                	jne    5846 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x846>
    5824:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    582a:	eb 21                	jmp    584d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x84d>
    582c:	b9 42 00 00 00       	mov    $0x42,%ecx
    5831:	85 c0                	test   %eax,%eax
    5833:	0f 84 10 ff ff ff    	je     5749 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x749>
    5839:	e9 22 fe ff ff       	jmp    5660 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x660>
    583e:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5844:	74 de                	je     5824 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x824>
    5846:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    584d:	83 ec 08             	sub    $0x8,%esp
    5850:	8d 54 24 14          	lea    0x14(%esp),%edx
    5854:	52                   	push   %edx
    5855:	51                   	push   %ecx
    5856:	ff 50 10             	call   *0x10(%eax)
    5859:	83 c4 10             	add    $0x10,%esp
    585c:	8b 54 24 08          	mov    0x8(%esp),%edx
    5860:	b8 8d 00 00 00       	mov    $0x8d,%eax
    5865:	cd 80                	int    $0x80
    5867:	8d 48 ff             	lea    -0x1(%eax),%ecx
    586a:	83 f9 0a             	cmp    $0xa,%ecx
    586d:	0f 83 de 00 00 00    	jae    5951 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x951>
    5873:	89 44 24 50          	mov    %eax,0x50(%esp)
    5877:	8d 44 24 50          	lea    0x50(%esp),%eax
    587b:	89 44 24 68          	mov    %eax,0x68(%esp)
    587f:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5885:	85 c0                	test   %eax,%eax
    5887:	0f 84 b3 fd ff ff    	je     5640 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    588d:	8d 44 24 68          	lea    0x68(%esp),%eax
    5891:	89 44 24 54          	mov    %eax,0x54(%esp)
    5895:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
    589c:	89 44 24 58          	mov    %eax,0x58(%esp)
    58a0:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    58a7:	00 
    58a8:	8b 8c 24 80 00 00 00 	mov    0x80(%esp),%ecx
    58af:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    58b3:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    58ba:	00 
    58bb:	8d 83 10 ff ff ff    	lea    -0xf0(%ebx),%eax
    58c1:	89 44 24 38          	mov    %eax,0x38(%esp)
    58c5:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    58cc:	00 
    58cd:	8d 44 24 54          	lea    0x54(%esp),%eax
    58d1:	89 44 24 40          	mov    %eax,0x40(%esp)
    58d5:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    58dc:	00 
    58dd:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    58e4:	00 
    58e5:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    58ec:	00 
    58ed:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    58f1:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    58f8:	00 
    58f9:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5900:	00 
    5901:	8b 44 24 7c          	mov    0x7c(%esp),%eax
    5905:	89 44 24 24          	mov    %eax,0x24(%esp)
    5909:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    5910:	00 
    5911:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5918:	00 
    5919:	c7 44 24 10 59 00 00 	movl   $0x59,0x10(%esp)
    5920:	00 
    5921:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5927:	83 f8 02             	cmp    $0x2,%eax
    592a:	74 0e                	je     593a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x93a>
    592c:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5932:	0f 85 f0 fc ff ff    	jne    5628 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x628>
    5938:	eb 0c                	jmp    5946 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x946>
    593a:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5940:	0f 85 e2 fc ff ff    	jne    5628 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x628>
    5946:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    594c:	e9 dd fc ff ff       	jmp    562e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x62e>
    5951:	85 c0                	test   %eax,%eax
    5953:	b8 42 00 00 00       	mov    $0x42,%eax
    5958:	0f 84 e2 fc ff ff    	je     5640 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    595e:	e9 10 ff ff ff       	jmp    5873 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x873>
    5963:	b9 22 00 00 00       	mov    $0x22,%ecx
    5968:	e8 43 f3 ff ff       	call   4cb0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    596d:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5973:	74 08                	je     597d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x97d>
    5975:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    597b:	eb 06                	jmp    5983 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x983>
    597d:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5983:	83 ec 08             	sub    $0x8,%esp
    5986:	8d 54 24 14          	lea    0x14(%esp),%edx
    598a:	52                   	push   %edx
    598b:	51                   	push   %ecx
    598c:	ff 50 10             	call   *0x10(%eax)
    598f:	83 c4 10             	add    $0x10,%esp
    5992:	eb 1c                	jmp    59b0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    5994:	85 c0                	test   %eax,%eax
    5996:	b8 42 00 00 00       	mov    $0x42,%eax
    599b:	0f 85 31 05 00 00    	jne    5ed2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xed2>
    59a1:	90                   	nop
    59a2:	90                   	nop
    59a3:	90                   	nop
    59a4:	90                   	nop
    59a5:	90                   	nop
    59a6:	90                   	nop
    59a7:	90                   	nop
    59a8:	90                   	nop
    59a9:	90                   	nop
    59aa:	90                   	nop
    59ab:	90                   	nop
    59ac:	90                   	nop
    59ad:	90                   	nop
    59ae:	90                   	nop
    59af:	90                   	nop
    59b0:	8d 54 24 54          	lea    0x54(%esp),%edx
    59b4:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    59bb:	b8 8e 00 00 00       	mov    $0x8e,%eax
    59c0:	cd 80                	int    $0x80
    59c2:	8d 48 ff             	lea    -0x1(%eax),%ecx
    59c5:	83 f9 0a             	cmp    $0xa,%ecx
    59c8:	0f 83 bf 04 00 00    	jae    5e8d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe8d>
    59ce:	89 c1                	mov    %eax,%ecx
    59d0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    59d4:	8d 44 24 08          	lea    0x8(%esp),%eax
    59d8:	89 44 24 50          	mov    %eax,0x50(%esp)
    59dc:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    59e2:	85 c0                	test   %eax,%eax
    59e4:	0f 84 c8 05 00 00    	je     5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    59ea:	8d 44 24 50          	lea    0x50(%esp),%eax
    59ee:	89 44 24 68          	mov    %eax,0x68(%esp)
    59f2:	8d 83 9c c0 ff ff    	lea    -0x3f64(%ebx),%eax
    59f8:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    59fc:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    5a03:	00 
    5a04:	8d 83 03 e4 ff ff    	lea    -0x1bfd(%ebx),%eax
    5a0a:	89 44 24 30          	mov    %eax,0x30(%esp)
    5a0e:	c7 44 24 34 1b 00 00 	movl   $0x1b,0x34(%esp)
    5a15:	00 
    5a16:	8d 8b e0 fd ff ff    	lea    -0x220(%ebx),%ecx
    5a1c:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    5a20:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5a27:	00 
    5a28:	8d 4c 24 68          	lea    0x68(%esp),%ecx
    5a2c:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    5a30:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5a37:	00 
    5a38:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5a3f:	00 
    5a40:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    5a47:	00 
    5a48:	89 44 24 18          	mov    %eax,0x18(%esp)
    5a4c:	c7 44 24 1c 1b 00 00 	movl   $0x1b,0x1c(%esp)
    5a53:	00 
    5a54:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5a5b:	00 
    5a5c:	8d 83 9c e3 ff ff    	lea    -0x1c64(%ebx),%eax
    5a62:	89 44 24 24          	mov    %eax,0x24(%esp)
    5a66:	c7 44 24 28 4a 00 00 	movl   $0x4a,0x28(%esp)
    5a6d:	00 
    5a6e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5a75:	00 
    5a76:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
    5a7d:	00 
    5a7e:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5a84:	83 f8 02             	cmp    $0x2,%eax
    5a87:	74 17                	je     5aa0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaa0>
    5a89:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5a8f:	75 17                	jne    5aa8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaa8>
    5a91:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5a97:	eb 15                	jmp    5aae <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaae>
    5a99:	90                   	nop
    5a9a:	90                   	nop
    5a9b:	90                   	nop
    5a9c:	90                   	nop
    5a9d:	90                   	nop
    5a9e:	90                   	nop
    5a9f:	90                   	nop
    5aa0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5aa6:	74 e9                	je     5a91 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xa91>
    5aa8:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    5aae:	83 ec 08             	sub    $0x8,%esp
    5ab1:	8d 54 24 14          	lea    0x14(%esp),%edx
    5ab5:	52                   	push   %edx
    5ab6:	51                   	push   %ecx
    5ab7:	ff 50 10             	call   *0x10(%eax)
    5aba:	83 c4 10             	add    $0x10,%esp
    5abd:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    5ac2:	0f 85 ea 04 00 00    	jne    5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5ac8:	8b 44 24 54          	mov    0x54(%esp),%eax
    5acc:	83 f8 03             	cmp    $0x3,%eax
    5acf:	0f 84 dd 04 00 00    	je     5fb2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    5ad5:	83 f8 02             	cmp    $0x2,%eax
    5ad8:	0f 85 ea 04 00 00    	jne    5fc8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfc8>
    5ade:	8b 74 24 58          	mov    0x58(%esp),%esi
    5ae2:	8b 6c 24 5c          	mov    0x5c(%esp),%ebp
    5ae6:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    5aea:	89 ea                	mov    %ebp,%edx
    5aec:	b8 88 00 00 00       	mov    $0x88,%eax
    5af1:	cd 80                	int    $0x80
    5af3:	85 c0                	test   %eax,%eax
    5af5:	0f 85 02 05 00 00    	jne    5ffd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xffd>
    5afb:	8b 7c 24 10          	mov    0x10(%esp),%edi
    5aff:	8b 44 24 14          	mov    0x14(%esp),%eax
    5b03:	89 7c 24 68          	mov    %edi,0x68(%esp)
    5b07:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    5b0b:	89 6c 24 70          	mov    %ebp,0x70(%esp)
    5b0f:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5b15:	83 f8 03             	cmp    $0x3,%eax
    5b18:	0f 86 d3 00 00 00    	jbe    5bf1 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbf1>
    5b1e:	8d 44 24 68          	lea    0x68(%esp),%eax
    5b22:	89 44 24 54          	mov    %eax,0x54(%esp)
    5b26:	8d 83 cc c0 ff ff    	lea    -0x3f34(%ebx),%eax
    5b2c:	89 44 24 58          	mov    %eax,0x58(%esp)
    5b30:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    5b37:	00 
    5b38:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    5b3c:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    5b40:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    5b47:	00 
    5b48:	8d 83 c0 fe ff ff    	lea    -0x140(%ebx),%eax
    5b4e:	89 44 24 38          	mov    %eax,0x38(%esp)
    5b52:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5b59:	00 
    5b5a:	8d 44 24 54          	lea    0x54(%esp),%eax
    5b5e:	89 44 24 40          	mov    %eax,0x40(%esp)
    5b62:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5b69:	00 
    5b6a:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5b71:	00 
    5b72:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    5b79:	00 
    5b7a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    5b7e:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    5b85:	00 
    5b86:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5b8d:	00 
    5b8e:	8d 83 c8 e7 ff ff    	lea    -0x1838(%ebx),%eax
    5b94:	89 44 24 24          	mov    %eax,0x24(%esp)
    5b98:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    5b9f:	00 
    5ba0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5ba7:	00 
    5ba8:	c7 44 24 10 6e 00 00 	movl   $0x6e,0x10(%esp)
    5baf:	00 
    5bb0:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5bb6:	83 f8 02             	cmp    $0x2,%eax
    5bb9:	74 15                	je     5bd0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbd0>
    5bbb:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5bc1:	8d 54 24 0c          	lea    0xc(%esp),%edx
    5bc5:	75 15                	jne    5bdc <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbdc>
    5bc7:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5bcd:	eb 13                	jmp    5be2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbe2>
    5bcf:	90                   	nop
    5bd0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5bd6:	8d 54 24 0c          	lea    0xc(%esp),%edx
    5bda:	74 eb                	je     5bc7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbc7>
    5bdc:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    5be2:	83 ec 08             	sub    $0x8,%esp
    5be5:	52                   	push   %edx
    5be6:	51                   	push   %ecx
    5be7:	ff 50 10             	call   *0x10(%eax)
    5bea:	83 c4 10             	add    $0x10,%esp
    5bed:	8b 7c 24 68          	mov    0x68(%esp),%edi
    5bf1:	85 ff                	test   %edi,%edi
    5bf3:	0f 88 7c 04 00 00    	js     6075 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1075>
    5bf9:	74 65                	je     5c60 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc60>
    5bfb:	0f b6 83 3c 27 00 00 	movzbl 0x273c(%ebx),%eax
    5c02:	90                   	nop
    5c03:	90                   	nop
    5c04:	90                   	nop
    5c05:	90                   	nop
    5c06:	90                   	nop
    5c07:	90                   	nop
    5c08:	90                   	nop
    5c09:	90                   	nop
    5c0a:	90                   	nop
    5c0b:	90                   	nop
    5c0c:	90                   	nop
    5c0d:	90                   	nop
    5c0e:	90                   	nop
    5c0f:	90                   	nop
    5c10:	b1 01                	mov    $0x1,%cl
    5c12:	31 c0                	xor    %eax,%eax
    5c14:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    5c1b:	00 
    5c1c:	74 22                	je     5c40 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc40>
    5c1e:	90                   	nop
    5c1f:	90                   	nop
    5c20:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    5c27:	84 c0                	test   %al,%al
    5c29:	74 e5                	je     5c10 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc10>
    5c2b:	f3 90                	pause
    5c2d:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    5c34:	84 c0                	test   %al,%al
    5c36:	75 f3                	jne    5c2b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc2b>
    5c38:	eb d6                	jmp    5c10 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc10>
    5c3a:	90                   	nop
    5c3b:	90                   	nop
    5c3c:	90                   	nop
    5c3d:	90                   	nop
    5c3e:	90                   	nop
    5c3f:	90                   	nop
    5c40:	b9 01 00 00 00       	mov    $0x1,%ecx
    5c45:	89 fa                	mov    %edi,%edx
    5c47:	e8 54 e9 ff ff       	call   45a0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>
    5c4c:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    5c53:	85 c0                	test   %eax,%eax
    5c55:	0f 84 1f 04 00 00    	je     607a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x107a>
    5c5b:	89 c5                	mov    %eax,%ebp
    5c5d:	eb 06                	jmp    5c65 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc65>
    5c5f:	90                   	nop
    5c60:	bd 01 00 00 00       	mov    $0x1,%ebp
    5c65:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    5c69:	89 7c 24 10          	mov    %edi,0x10(%esp)
    5c6d:	89 7c 24 14          	mov    %edi,0x14(%esp)
    5c71:	8b 54 24 70          	mov    0x70(%esp),%edx
    5c75:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    5c79:	b8 85 00 00 00       	mov    $0x85,%eax
    5c7e:	cd 80                	int    $0x80
    5c80:	85 c0                	test   %eax,%eax
    5c82:	0f 85 8b 03 00 00    	jne    6013 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1013>
    5c88:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    5c8c:	89 f2                	mov    %esi,%edx
    5c8e:	b8 88 00 00 00       	mov    $0x88,%eax
    5c93:	cd 80                	int    $0x80
    5c95:	85 c0                	test   %eax,%eax
    5c97:	0f 85 a7 03 00 00    	jne    6044 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1044>
    5c9d:	8b 44 24 0c          	mov    0xc(%esp),%eax
    5ca1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    5ca5:	89 74 24 54          	mov    %esi,0x54(%esp)
    5ca9:	89 44 24 58          	mov    %eax,0x58(%esp)
    5cad:	89 4c 24 5c          	mov    %ecx,0x5c(%esp)
    5cb1:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    5cb5:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    5cb9:	89 7c 24 14          	mov    %edi,0x14(%esp)
    5cbd:	83 ec 08             	sub    $0x8,%esp
    5cc0:	8d 7c 24 14          	lea    0x14(%esp),%edi
    5cc4:	57                   	push   %edi
    5cc5:	8d 44 24 60          	lea    0x60(%esp),%eax
    5cc9:	50                   	push   %eax
    5cca:	ff 94 24 88 00 00 00 	call   *0x88(%esp)
    5cd1:	83 c4 10             	add    $0x10,%esp
    5cd4:	88 44 24 50          	mov    %al,0x50(%esp)
    5cd8:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5cde:	83 f8 03             	cmp    $0x3,%eax
    5ce1:	0f 86 d2 00 00 00    	jbe    5db9 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xdb9>
    5ce7:	8d 44 24 50          	lea    0x50(%esp),%eax
    5ceb:	89 44 24 54          	mov    %eax,0x54(%esp)
    5cef:	8d 83 cc c1 ff ff    	lea    -0x3e34(%ebx),%eax
    5cf5:	89 44 24 58          	mov    %eax,0x58(%esp)
    5cf9:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    5d00:	00 
    5d01:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    5d05:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    5d09:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    5d10:	00 
    5d11:	8d 83 d8 fe ff ff    	lea    -0x128(%ebx),%eax
    5d17:	89 44 24 38          	mov    %eax,0x38(%esp)
    5d1b:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5d22:	00 
    5d23:	8d 44 24 54          	lea    0x54(%esp),%eax
    5d27:	89 44 24 40          	mov    %eax,0x40(%esp)
    5d2b:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5d32:	00 
    5d33:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5d3a:	00 
    5d3b:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    5d42:	00 
    5d43:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    5d47:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    5d4e:	00 
    5d4f:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5d56:	00 
    5d57:	8d 83 c8 e7 ff ff    	lea    -0x1838(%ebx),%eax
    5d5d:	89 44 24 24          	mov    %eax,0x24(%esp)
    5d61:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    5d68:	00 
    5d69:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5d70:	00 
    5d71:	c7 44 24 10 75 00 00 	movl   $0x75,0x10(%esp)
    5d78:	00 
    5d79:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5d7f:	83 f8 02             	cmp    $0x2,%eax
    5d82:	74 1c                	je     5da0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xda0>
    5d84:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5d8a:	75 1c                	jne    5da8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xda8>
    5d8c:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5d92:	eb 1a                	jmp    5dae <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xdae>
    5d94:	90                   	nop
    5d95:	90                   	nop
    5d96:	90                   	nop
    5d97:	90                   	nop
    5d98:	90                   	nop
    5d99:	90                   	nop
    5d9a:	90                   	nop
    5d9b:	90                   	nop
    5d9c:	90                   	nop
    5d9d:	90                   	nop
    5d9e:	90                   	nop
    5d9f:	90                   	nop
    5da0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5da6:	74 e4                	je     5d8c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xd8c>
    5da8:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    5dae:	83 ec 08             	sub    $0x8,%esp
    5db1:	57                   	push   %edi
    5db2:	51                   	push   %ecx
    5db3:	ff 50 10             	call   *0x10(%eax)
    5db6:	83 c4 10             	add    $0x10,%esp
    5db9:	8b 54 24 70          	mov    0x70(%esp),%edx
    5dbd:	89 94 24 98 00 00 00 	mov    %edx,0x98(%esp)
    5dc4:	85 d2                	test   %edx,%edx
    5dc6:	0f 84 e4 fb ff ff    	je     59b0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    5dcc:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5dd2:	83 f8 03             	cmp    $0x3,%eax
    5dd5:	0f 86 e4 00 00 00    	jbe    5ebf <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xebf>
    5ddb:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
    5de2:	89 44 24 54          	mov    %eax,0x54(%esp)
    5de6:	8d 83 7c 9e ff ff    	lea    -0x6184(%ebx),%eax
    5dec:	89 44 24 58          	mov    %eax,0x58(%esp)
    5df0:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    5df7:	00 
    5df8:	8d 83 a2 e9 ff ff    	lea    -0x165e(%ebx),%eax
    5dfe:	89 44 24 30          	mov    %eax,0x30(%esp)
    5e02:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    5e09:	00 
    5e0a:	8d 8b 08 ff ff ff    	lea    -0xf8(%ebx),%ecx
    5e10:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    5e14:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5e1b:	00 
    5e1c:	8d 4c 24 54          	lea    0x54(%esp),%ecx
    5e20:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    5e24:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5e2b:	00 
    5e2c:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5e33:	00 
    5e34:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    5e3b:	00 
    5e3c:	89 44 24 18          	mov    %eax,0x18(%esp)
    5e40:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    5e47:	00 
    5e48:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5e4f:	00 
    5e50:	8d 83 3a e9 ff ff    	lea    -0x16c6(%ebx),%eax
    5e56:	89 44 24 24          	mov    %eax,0x24(%esp)
    5e5a:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    5e61:	00 
    5e62:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5e69:	00 
    5e6a:	c7 44 24 10 51 00 00 	movl   $0x51,0x10(%esp)
    5e71:	00 
    5e72:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5e78:	83 f8 02             	cmp    $0x2,%eax
    5e7b:	74 22                	je     5e9f <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe9f>
    5e7d:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5e83:	75 22                	jne    5ea7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xea7>
    5e85:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5e8b:	eb 20                	jmp    5ead <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xead>
    5e8d:	b9 42 00 00 00       	mov    $0x42,%ecx
    5e92:	85 c0                	test   %eax,%eax
    5e94:	0f 84 2e fc ff ff    	je     5ac8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xac8>
    5e9a:	e9 31 fb ff ff       	jmp    59d0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9d0>
    5e9f:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5ea5:	74 de                	je     5e85 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe85>
    5ea7:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    5ead:	83 ec 08             	sub    $0x8,%esp
    5eb0:	57                   	push   %edi
    5eb1:	51                   	push   %ecx
    5eb2:	ff 50 10             	call   *0x10(%eax)
    5eb5:	83 c4 10             	add    $0x10,%esp
    5eb8:	8b 94 24 98 00 00 00 	mov    0x98(%esp),%edx
    5ebf:	b8 8d 00 00 00       	mov    $0x8d,%eax
    5ec4:	cd 80                	int    $0x80
    5ec6:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5ec9:	83 f9 0a             	cmp    $0xa,%ecx
    5ecc:	0f 83 c2 fa ff ff    	jae    5994 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x994>
    5ed2:	89 44 24 08          	mov    %eax,0x8(%esp)
    5ed6:	8d 44 24 08          	lea    0x8(%esp),%eax
    5eda:	89 44 24 50          	mov    %eax,0x50(%esp)
    5ede:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    5ee4:	85 c0                	test   %eax,%eax
    5ee6:	0f 84 c4 fa ff ff    	je     59b0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    5eec:	8d 44 24 50          	lea    0x50(%esp),%eax
    5ef0:	89 44 24 54          	mov    %eax,0x54(%esp)
    5ef4:	8d 83 0c ca ff ff    	lea    -0x35f4(%ebx),%eax
    5efa:	89 44 24 58          	mov    %eax,0x58(%esp)
    5efe:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    5f05:	00 
    5f06:	8d 83 a2 e9 ff ff    	lea    -0x165e(%ebx),%eax
    5f0c:	89 44 24 30          	mov    %eax,0x30(%esp)
    5f10:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    5f17:	00 
    5f18:	8d 8b 10 ff ff ff    	lea    -0xf0(%ebx),%ecx
    5f1e:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    5f22:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    5f29:	00 
    5f2a:	8d 4c 24 54          	lea    0x54(%esp),%ecx
    5f2e:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    5f32:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5f39:	00 
    5f3a:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    5f41:	00 
    5f42:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    5f49:	00 
    5f4a:	89 44 24 18          	mov    %eax,0x18(%esp)
    5f4e:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    5f55:	00 
    5f56:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    5f5d:	00 
    5f5e:	8d 83 3a e9 ff ff    	lea    -0x16c6(%ebx),%eax
    5f64:	89 44 24 24          	mov    %eax,0x24(%esp)
    5f68:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    5f6f:	00 
    5f70:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5f77:	00 
    5f78:	c7 44 24 10 59 00 00 	movl   $0x59,0x10(%esp)
    5f7f:	00 
    5f80:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    5f86:	83 f8 02             	cmp    $0x2,%eax
    5f89:	74 10                	je     5f9b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf9b>
    5f8b:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    5f91:	75 10                	jne    5fa3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa3>
    5f93:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    5f99:	eb 0e                	jmp    5fa9 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa9>
    5f9b:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    5fa1:	74 f0                	je     5f93 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf93>
    5fa3:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    5fa9:	83 ec 08             	sub    $0x8,%esp
    5fac:	57                   	push   %edi
    5fad:	e9 d9 f9 ff ff       	jmp    598b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x98b>
    5fb2:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    5fb9:	e8 32 08 00 00       	call   67f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    5fbe:	b9 21 00 00 00       	mov    $0x21,%ecx
    5fc3:	e8 e8 ec ff ff       	call   4cb0 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    5fc8:	83 ec 0c             	sub    $0xc,%esp
    5fcb:	85 c0                	test   %eax,%eax
    5fcd:	75 17                	jne    5fe6 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfe6>
    5fcf:	8d 83 a0 fe ff ff    	lea    -0x160(%ebx),%eax
    5fd5:	8d 8b 59 e4 ff ff    	lea    -0x1ba7(%ebx),%ecx
    5fdb:	ba 13 00 00 00       	mov    $0x13,%edx
    5fe0:	50                   	push   %eax
    5fe1:	e8 1a b2 ff ff       	call   1200 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    5fe6:	8d 83 b0 fe ff ff    	lea    -0x150(%ebx),%eax
    5fec:	8d 8b 59 e4 ff ff    	lea    -0x1ba7(%ebx),%ecx
    5ff2:	ba 13 00 00 00       	mov    $0x13,%edx
    5ff7:	50                   	push   %eax
    5ff8:	e8 03 b2 ff ff       	call   1200 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    5ffd:	89 c1                	mov    %eax,%ecx
    5fff:	e8 bc 0a 00 00       	call   6ac0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    6004:	89 44 24 54          	mov    %eax,0x54(%esp)
    6008:	83 ec 04             	sub    $0x4,%esp
    600b:	8d 83 68 fe ff ff    	lea    -0x198(%ebx),%eax
    6011:	eb 45                	jmp    6058 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1058>
    6013:	89 c1                	mov    %eax,%ecx
    6015:	e8 a6 0a 00 00       	call   6ac0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    601a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    601e:	83 ec 04             	sub    $0x4,%esp
    6021:	8d 83 c8 fe ff ff    	lea    -0x138(%ebx),%eax
    6027:	8d b3 e8 fd ff ff    	lea    -0x218(%ebx),%esi
    602d:	8d 8b 20 e4 ff ff    	lea    -0x1be0(%ebx),%ecx
    6033:	ba 2b 00 00 00       	mov    $0x2b,%edx
    6038:	50                   	push   %eax
    6039:	56                   	push   %esi
    603a:	8d 44 24 18          	lea    0x18(%esp),%eax
    603e:	50                   	push   %eax
    603f:	e8 cc b2 ff ff       	call   1310 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    6044:	89 c1                	mov    %eax,%ecx
    6046:	e8 75 0a 00 00       	call   6ac0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    604b:	89 44 24 54          	mov    %eax,0x54(%esp)
    604f:	83 ec 04             	sub    $0x4,%esp
    6052:	8d 83 10 fe ff ff    	lea    -0x1f0(%ebx),%eax
    6058:	8d bb e8 fd ff ff    	lea    -0x218(%ebx),%edi
    605e:	8d 8b 20 e4 ff ff    	lea    -0x1be0(%ebx),%ecx
    6064:	ba 2b 00 00 00       	mov    $0x2b,%edx
    6069:	50                   	push   %eax
    606a:	57                   	push   %edi
    606b:	8d 44 24 60          	lea    0x60(%esp),%eax
    606f:	50                   	push   %eax
    6070:	e8 9b b2 ff ff       	call   1310 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    6075:	e8 b6 af ff ff       	call   1030 <_ZN5alloc7raw_vec17capacity_overflow17hf4854d1cf84712dcE>
    607a:	89 f9                	mov    %edi,%ecx
    607c:	e8 94 af ff ff       	call   1015 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE>
    6081:	66 90                	xchg   %ax,%ax
    6083:	66 90                	xchg   %ax,%ax
    6085:	66 90                	xchg   %ax,%ax
    6087:	66 90                	xchg   %ax,%ax
    6089:	66 90                	xchg   %ax,%ax
    608b:	66 90                	xchg   %ax,%ax
    608d:	66 90                	xchg   %ax,%ax
    608f:	90                   	nop

00006090 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c10eea8ba9fb618E>:
    6090:	53                   	push   %ebx
    6091:	83 ec 08             	sub    $0x8,%esp
    6094:	e8 00 00 00 00       	call   6099 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c10eea8ba9fb618E+0x9>
    6099:	5b                   	pop    %ebx
    609a:	81 c3 5b 3f 00 00    	add    $0x3f5b,%ebx
    60a0:	8b 44 24 10          	mov    0x10(%esp),%eax
    60a4:	83 ec 08             	sub    $0x8,%esp
    60a7:	ff 74 24 1c          	push   0x1c(%esp)
    60ab:	ff 30                	push   (%eax)
    60ad:	e8 3e c0 ff ff       	call   20f0 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>
    60b2:	83 c4 18             	add    $0x18,%esp
    60b5:	5b                   	pop    %ebx
    60b6:	c3                   	ret
    60b7:	66 90                	xchg   %ax,%ax
    60b9:	66 90                	xchg   %ax,%ax
    60bb:	66 90                	xchg   %ax,%ax
    60bd:	66 90                	xchg   %ax,%ax
    60bf:	90                   	nop

000060c0 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E>:
    60c0:	55                   	push   %ebp
    60c1:	53                   	push   %ebx
    60c2:	57                   	push   %edi
    60c3:	56                   	push   %esi
    60c4:	83 ec 1c             	sub    $0x1c,%esp
    60c7:	e8 00 00 00 00       	call   60cc <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xc>
    60cc:	5b                   	pop    %ebx
    60cd:	81 c3 28 3f 00 00    	add    $0x3f28,%ebx
    60d3:	8b 74 24 34          	mov    0x34(%esp),%esi
    60d7:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    60db:	8d 45 04             	lea    0x4(%ebp),%eax
    60de:	89 44 24 14          	mov    %eax,0x14(%esp)
    60e2:	8d 45 08             	lea    0x8(%ebp),%eax
    60e5:	89 44 24 18          	mov    %eax,0x18(%esp)
    60e9:	8b 46 04             	mov    0x4(%esi),%eax
    60ec:	83 ec 04             	sub    $0x4,%esp
    60ef:	8d 8b d6 e8 ff ff    	lea    -0x172a(%ebx),%ecx
    60f5:	6a 09                	push   $0x9
    60f7:	51                   	push   %ecx
    60f8:	ff 36                	push   (%esi)
    60fa:	ff 50 0c             	call   *0xc(%eax)
    60fd:	83 c4 10             	add    $0x10,%esp
    6100:	89 74 24 0c          	mov    %esi,0xc(%esp)
    6104:	88 44 24 10          	mov    %al,0x10(%esp)
    6108:	c6 44 24 11 00       	movb   $0x0,0x11(%esp)
    610d:	83 ec 04             	sub    $0x4,%esp
    6110:	8d bb cc a1 ff ff    	lea    -0x5e34(%ebx),%edi
    6116:	8d 93 df e8 ff ff    	lea    -0x1721(%ebx),%edx
    611c:	8d 74 24 10          	lea    0x10(%esp),%esi
    6120:	89 f1                	mov    %esi,%ecx
    6122:	57                   	push   %edi
    6123:	55                   	push   %ebp
    6124:	6a 03                	push   $0x3
    6126:	e8 a5 d8 ff ff       	call   39d0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    612b:	83 c4 0c             	add    $0xc,%esp
    612e:	8d 93 2c d7 ff ff    	lea    -0x28d4(%ebx),%edx
    6134:	89 f1                	mov    %esi,%ecx
    6136:	57                   	push   %edi
    6137:	ff 74 24 1c          	push   0x1c(%esp)
    613b:	6a 08                	push   $0x8
    613d:	e8 8e d8 ff ff       	call   39d0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    6142:	83 c4 0c             	add    $0xc,%esp
    6145:	8d 83 0c c4 ff ff    	lea    -0x3bf4(%ebx),%eax
    614b:	8d 7c 24 1c          	lea    0x1c(%esp),%edi
    614f:	8d 93 e2 e8 ff ff    	lea    -0x171e(%ebx),%edx
    6155:	89 f1                	mov    %esi,%ecx
    6157:	50                   	push   %eax
    6158:	57                   	push   %edi
    6159:	6a 06                	push   $0x6
    615b:	e8 70 d8 ff ff       	call   39d0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    6160:	83 c4 10             	add    $0x10,%esp
    6163:	0f b6 4c 24 10       	movzbl 0x10(%esp),%ecx
    6168:	0f b6 44 24 11       	movzbl 0x11(%esp),%eax
    616d:	89 c2                	mov    %eax,%edx
    616f:	f6 d2                	not    %dl
    6171:	08 ca                	or     %cl,%dl
    6173:	f6 c2 01             	test   $0x1,%dl
    6176:	74 04                	je     617c <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xbc>
    6178:	08 c8                	or     %cl,%al
    617a:	eb 31                	jmp    61ad <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xed>
    617c:	8b 44 24 0c          	mov    0xc(%esp),%eax
    6180:	f6 40 0a 80          	testb  $0x80,0xa(%eax)
    6184:	75 10                	jne    6196 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xd6>
    6186:	8b 48 04             	mov    0x4(%eax),%ecx
    6189:	83 ec 04             	sub    $0x4,%esp
    618c:	8d 93 c4 db ff ff    	lea    -0x243c(%ebx),%edx
    6192:	6a 02                	push   $0x2
    6194:	eb 0e                	jmp    61a4 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xe4>
    6196:	8b 48 04             	mov    0x4(%eax),%ecx
    6199:	83 ec 04             	sub    $0x4,%esp
    619c:	8d 93 c3 db ff ff    	lea    -0x243d(%ebx),%edx
    61a2:	6a 01                	push   $0x1
    61a4:	52                   	push   %edx
    61a5:	ff 30                	push   (%eax)
    61a7:	ff 51 0c             	call   *0xc(%ecx)
    61aa:	83 c4 10             	add    $0x10,%esp
    61ad:	24 01                	and    $0x1,%al
    61af:	83 c4 1c             	add    $0x1c,%esp
    61b2:	5e                   	pop    %esi
    61b3:	5f                   	pop    %edi
    61b4:	5b                   	pop    %ebx
    61b5:	5d                   	pop    %ebp
    61b6:	c3                   	ret
    61b7:	66 90                	xchg   %ax,%ax
    61b9:	66 90                	xchg   %ax,%ax
    61bb:	66 90                	xchg   %ax,%ax
    61bd:	66 90                	xchg   %ax,%ax
    61bf:	90                   	nop

000061c0 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E>:
    61c0:	55                   	push   %ebp
    61c1:	53                   	push   %ebx
    61c2:	57                   	push   %edi
    61c3:	56                   	push   %esi
    61c4:	83 ec 2c             	sub    $0x2c,%esp
    61c7:	e8 00 00 00 00       	call   61cc <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0xc>
    61cc:	5b                   	pop    %ebx
    61cd:	81 c3 28 3e 00 00    	add    $0x3e28,%ebx
    61d3:	8b 74 24 44          	mov    0x44(%esp),%esi
    61d7:	8b 44 24 40          	mov    0x40(%esp),%eax
    61db:	80 38 01             	cmpb   $0x1,(%eax)
    61de:	75 71                	jne    6251 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x91>
    61e0:	8b 3e                	mov    (%esi),%edi
    61e2:	8b 6e 04             	mov    0x4(%esi),%ebp
    61e5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    61e8:	83 ec 04             	sub    $0x4,%esp
    61eb:	8d 83 4d e4 ff ff    	lea    -0x1bb3(%ebx),%eax
    61f1:	6a 03                	push   $0x3
    61f3:	50                   	push   %eax
    61f4:	57                   	push   %edi
    61f5:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    61f9:	ff d1                	call   *%ecx
    61fb:	83 c4 10             	add    $0x10,%esp
    61fe:	b1 01                	mov    $0x1,%cl
    6200:	84 c0                	test   %al,%al
    6202:	0f 85 e1 01 00 00    	jne    63e9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    6208:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    620c:	0f 85 b1 00 00 00    	jne    62c3 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x103>
    6212:	83 ec 04             	sub    $0x4,%esp
    6215:	8d 83 c6 db ff ff    	lea    -0x243a(%ebx),%eax
    621b:	6a 01                	push   $0x1
    621d:	50                   	push   %eax
    621e:	57                   	push   %edi
    621f:	8b 74 24 18          	mov    0x18(%esp),%esi
    6223:	ff d6                	call   *%esi
    6225:	83 c4 10             	add    $0x10,%esp
    6228:	84 c0                	test   %al,%al
    622a:	0f 85 84 01 00 00    	jne    63b4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    6230:	83 ec 04             	sub    $0x4,%esp
    6233:	8d 83 df e9 ff ff    	lea    -0x1621(%ebx),%eax
    6239:	6a 0c                	push   $0xc
    623b:	50                   	push   %eax
    623c:	57                   	push   %edi
    623d:	ff d6                	call   *%esi
    623f:	83 c4 10             	add    $0x10,%esp
    6242:	84 c0                	test   %al,%al
    6244:	b1 01                	mov    $0x1,%cl
    6246:	0f 85 9d 01 00 00    	jne    63e9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    624c:	e9 e7 00 00 00       	jmp    6338 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x178>
    6251:	8b 3e                	mov    (%esi),%edi
    6253:	8b 6e 04             	mov    0x4(%esi),%ebp
    6256:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6259:	83 ec 04             	sub    $0x4,%esp
    625c:	8d 83 4b e4 ff ff    	lea    -0x1bb5(%ebx),%eax
    6262:	6a 02                	push   $0x2
    6264:	50                   	push   %eax
    6265:	57                   	push   %edi
    6266:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    626a:	ff d1                	call   *%ecx
    626c:	83 c4 10             	add    $0x10,%esp
    626f:	b1 01                	mov    $0x1,%cl
    6271:	84 c0                	test   %al,%al
    6273:	0f 85 70 01 00 00    	jne    63e9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    6279:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    627d:	0f 85 c9 00 00 00    	jne    634c <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x18c>
    6283:	83 ec 04             	sub    $0x4,%esp
    6286:	8d 83 c6 db ff ff    	lea    -0x243a(%ebx),%eax
    628c:	6a 01                	push   $0x1
    628e:	50                   	push   %eax
    628f:	57                   	push   %edi
    6290:	ff 54 24 18          	call   *0x18(%esp)
    6294:	83 c4 10             	add    $0x10,%esp
    6297:	84 c0                	test   %al,%al
    6299:	0f 85 15 01 00 00    	jne    63b4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    629f:	83 ec 0c             	sub    $0xc,%esp
    62a2:	8d 93 1e e4 ff ff    	lea    -0x1be2(%ebx),%edx
    62a8:	89 f1                	mov    %esi,%ecx
    62aa:	6a 02                	push   $0x2
    62ac:	e8 5f cc ff ff       	call   2f10 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    62b1:	83 c4 10             	add    $0x10,%esp
    62b4:	84 c0                	test   %al,%al
    62b6:	b1 01                	mov    $0x1,%cl
    62b8:	0f 84 15 01 00 00    	je     63d3 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x213>
    62be:	e9 26 01 00 00       	jmp    63e9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    62c3:	83 ec 04             	sub    $0x4,%esp
    62c6:	8d 83 c7 db ff ff    	lea    -0x2439(%ebx),%eax
    62cc:	6a 02                	push   $0x2
    62ce:	50                   	push   %eax
    62cf:	57                   	push   %edi
    62d0:	ff 54 24 18          	call   *0x18(%esp)
    62d4:	83 c4 10             	add    $0x10,%esp
    62d7:	84 c0                	test   %al,%al
    62d9:	0f 85 d5 00 00 00    	jne    63b4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    62df:	c6 44 24 20 01       	movb   $0x1,0x20(%esp)
    62e4:	89 7c 24 10          	mov    %edi,0x10(%esp)
    62e8:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    62ec:	8d 44 24 20          	lea    0x20(%esp),%eax
    62f0:	89 44 24 18          	mov    %eax,0x18(%esp)
    62f4:	83 ec 04             	sub    $0x4,%esp
    62f7:	8d 83 df e9 ff ff    	lea    -0x1621(%ebx),%eax
    62fd:	8d 74 24 14          	lea    0x14(%esp),%esi
    6301:	6a 0c                	push   $0xc
    6303:	50                   	push   %eax
    6304:	56                   	push   %esi
    6305:	e8 56 d8 ff ff       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    630a:	83 c4 10             	add    $0x10,%esp
    630d:	84 c0                	test   %al,%al
    630f:	0f 85 9f 00 00 00    	jne    63b4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    6315:	83 ec 04             	sub    $0x4,%esp
    6318:	8d 83 c1 db ff ff    	lea    -0x243f(%ebx),%eax
    631e:	6a 02                	push   $0x2
    6320:	50                   	push   %eax
    6321:	56                   	push   %esi
    6322:	e8 39 d8 ff ff       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    6327:	83 c4 10             	add    $0x10,%esp
    632a:	84 c0                	test   %al,%al
    632c:	b1 01                	mov    $0x1,%cl
    632e:	8b 74 24 08          	mov    0x8(%esp),%esi
    6332:	0f 85 b1 00 00 00    	jne    63e9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    6338:	83 ec 04             	sub    $0x4,%esp
    633b:	8d 83 1a db ff ff    	lea    -0x24e6(%ebx),%eax
    6341:	6a 01                	push   $0x1
    6343:	50                   	push   %eax
    6344:	57                   	push   %edi
    6345:	ff d6                	call   *%esi
    6347:	e9 98 00 00 00       	jmp    63e4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x224>
    634c:	83 ec 04             	sub    $0x4,%esp
    634f:	8d 83 c7 db ff ff    	lea    -0x2439(%ebx),%eax
    6355:	6a 02                	push   $0x2
    6357:	50                   	push   %eax
    6358:	57                   	push   %edi
    6359:	ff 54 24 18          	call   *0x18(%esp)
    635d:	83 c4 10             	add    $0x10,%esp
    6360:	84 c0                	test   %al,%al
    6362:	75 50                	jne    63b4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    6364:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    6369:	89 7c 24 20          	mov    %edi,0x20(%esp)
    636d:	89 6c 24 24          	mov    %ebp,0x24(%esp)
    6371:	8d 44 24 0f          	lea    0xf(%esp),%eax
    6375:	89 44 24 28          	mov    %eax,0x28(%esp)
    6379:	8b 46 08             	mov    0x8(%esi),%eax
    637c:	8b 4e 0c             	mov    0xc(%esi),%ecx
    637f:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    6383:	89 44 24 18          	mov    %eax,0x18(%esp)
    6387:	8d 74 24 20          	lea    0x20(%esp),%esi
    638b:	89 74 24 10          	mov    %esi,0x10(%esp)
    638f:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    6395:	89 44 24 14          	mov    %eax,0x14(%esp)
    6399:	83 ec 0c             	sub    $0xc,%esp
    639c:	8d 93 1e e4 ff ff    	lea    -0x1be2(%ebx),%edx
    63a2:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    63a6:	6a 02                	push   $0x2
    63a8:	e8 63 cb ff ff       	call   2f10 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    63ad:	83 c4 10             	add    $0x10,%esp
    63b0:	84 c0                	test   %al,%al
    63b2:	74 04                	je     63b8 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f8>
    63b4:	b1 01                	mov    $0x1,%cl
    63b6:	eb 31                	jmp    63e9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    63b8:	83 ec 04             	sub    $0x4,%esp
    63bb:	8d 83 c1 db ff ff    	lea    -0x243f(%ebx),%eax
    63c1:	6a 02                	push   $0x2
    63c3:	50                   	push   %eax
    63c4:	56                   	push   %esi
    63c5:	e8 96 d7 ff ff       	call   3b60 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    63ca:	83 c4 10             	add    $0x10,%esp
    63cd:	84 c0                	test   %al,%al
    63cf:	b1 01                	mov    $0x1,%cl
    63d1:	75 16                	jne    63e9 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    63d3:	83 ec 04             	sub    $0x4,%esp
    63d6:	8d 83 1a db ff ff    	lea    -0x24e6(%ebx),%eax
    63dc:	6a 01                	push   $0x1
    63de:	50                   	push   %eax
    63df:	57                   	push   %edi
    63e0:	ff 54 24 18          	call   *0x18(%esp)
    63e4:	83 c4 10             	add    $0x10,%esp
    63e7:	89 c1                	mov    %eax,%ecx
    63e9:	89 c8                	mov    %ecx,%eax
    63eb:	83 c4 2c             	add    $0x2c,%esp
    63ee:	5e                   	pop    %esi
    63ef:	5f                   	pop    %edi
    63f0:	5b                   	pop    %ebx
    63f1:	5d                   	pop    %ebp
    63f2:	c3                   	ret
    63f3:	66 90                	xchg   %ax,%ax
    63f5:	66 90                	xchg   %ax,%ax
    63f7:	66 90                	xchg   %ax,%ax
    63f9:	66 90                	xchg   %ax,%ax
    63fb:	66 90                	xchg   %ax,%ax
    63fd:	66 90                	xchg   %ax,%ax
    63ff:	90                   	nop

00006400 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E>:
    6400:	55                   	push   %ebp
    6401:	53                   	push   %ebx
    6402:	57                   	push   %edi
    6403:	56                   	push   %esi
    6404:	83 ec 2c             	sub    $0x2c,%esp
    6407:	e8 00 00 00 00       	call   640c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xc>
    640c:	5b                   	pop    %ebx
    640d:	81 c3 e8 3b 00 00    	add    $0x3be8,%ebx
    6413:	8b 7c 24 44          	mov    0x44(%esp),%edi
    6417:	8b 44 24 40          	mov    0x40(%esp),%eax
    641b:	8b 00                	mov    (%eax),%eax
    641d:	89 44 24 08          	mov    %eax,0x8(%esp)
    6421:	8b 17                	mov    (%edi),%edx
    6423:	8b 77 04             	mov    0x4(%edi),%esi
    6426:	8b 4e 0c             	mov    0xc(%esi),%ecx
    6429:	83 ec 04             	sub    $0x4,%esp
    642c:	8d 83 50 e4 ff ff    	lea    -0x1bb0(%ebx),%eax
    6432:	6a 09                	push   $0x9
    6434:	50                   	push   %eax
    6435:	89 d5                	mov    %edx,%ebp
    6437:	52                   	push   %edx
    6438:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    643c:	ff d1                	call   *%ecx
    643e:	83 c4 10             	add    $0x10,%esp
    6441:	b1 01                	mov    $0x1,%cl
    6443:	84 c0                	test   %al,%al
    6445:	0f 85 e6 00 00 00    	jne    6531 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    644b:	f6 47 0a 80          	testb  $0x80,0xa(%edi)
    644f:	75 42                	jne    6493 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x93>
    6451:	83 ec 04             	sub    $0x4,%esp
    6454:	8d 83 c6 db ff ff    	lea    -0x243a(%ebx),%eax
    645a:	6a 01                	push   $0x1
    645c:	50                   	push   %eax
    645d:	55                   	push   %ebp
    645e:	ff 54 24 1c          	call   *0x1c(%esp)
    6462:	83 c4 10             	add    $0x10,%esp
    6465:	84 c0                	test   %al,%al
    6467:	0f 85 8c 00 00 00    	jne    64f9 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xf9>
    646d:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    6471:	8b 74 24 44          	mov    0x44(%esp),%esi
    6475:	89 f2                	mov    %esi,%edx
    6477:	e8 c4 00 00 00       	call   6540 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>
    647c:	84 c0                	test   %al,%al
    647e:	b1 01                	mov    $0x1,%cl
    6480:	0f 85 ab 00 00 00    	jne    6531 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    6486:	8b 3e                	mov    (%esi),%edi
    6488:	8b 46 04             	mov    0x4(%esi),%eax
    648b:	8b 68 0c             	mov    0xc(%eax),%ebp
    648e:	e9 8a 00 00 00       	jmp    651d <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x11d>
    6493:	83 ec 04             	sub    $0x4,%esp
    6496:	8d 83 c7 db ff ff    	lea    -0x2439(%ebx),%eax
    649c:	6a 02                	push   $0x2
    649e:	50                   	push   %eax
    649f:	89 ef                	mov    %ebp,%edi
    64a1:	55                   	push   %ebp
    64a2:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    64a6:	ff d5                	call   *%ebp
    64a8:	83 c4 10             	add    $0x10,%esp
    64ab:	84 c0                	test   %al,%al
    64ad:	75 4a                	jne    64f9 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xf9>
    64af:	c6 44 24 07 01       	movb   $0x1,0x7(%esp)
    64b4:	89 7c 24 20          	mov    %edi,0x20(%esp)
    64b8:	89 74 24 24          	mov    %esi,0x24(%esp)
    64bc:	8d 44 24 07          	lea    0x7(%esp),%eax
    64c0:	89 44 24 28          	mov    %eax,0x28(%esp)
    64c4:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    64c8:	8b 41 08             	mov    0x8(%ecx),%eax
    64cb:	8b 49 0c             	mov    0xc(%ecx),%ecx
    64ce:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    64d2:	89 44 24 18          	mov    %eax,0x18(%esp)
    64d6:	8d 44 24 20          	lea    0x20(%esp),%eax
    64da:	89 44 24 10          	mov    %eax,0x10(%esp)
    64de:	8d 83 88 fd ff ff    	lea    -0x278(%ebx),%eax
    64e4:	89 44 24 14          	mov    %eax,0x14(%esp)
    64e8:	8d 54 24 10          	lea    0x10(%esp),%edx
    64ec:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    64f0:	e8 4b 00 00 00       	call   6540 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>
    64f5:	84 c0                	test   %al,%al
    64f7:	74 04                	je     64fd <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xfd>
    64f9:	b1 01                	mov    $0x1,%cl
    64fb:	eb 34                	jmp    6531 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    64fd:	8b 44 24 14          	mov    0x14(%esp),%eax
    6501:	83 ec 04             	sub    $0x4,%esp
    6504:	8d 8b c1 db ff ff    	lea    -0x243f(%ebx),%ecx
    650a:	6a 02                	push   $0x2
    650c:	51                   	push   %ecx
    650d:	ff 74 24 1c          	push   0x1c(%esp)
    6511:	ff 50 0c             	call   *0xc(%eax)
    6514:	83 c4 10             	add    $0x10,%esp
    6517:	84 c0                	test   %al,%al
    6519:	b1 01                	mov    $0x1,%cl
    651b:	75 14                	jne    6531 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    651d:	83 ec 04             	sub    $0x4,%esp
    6520:	8d 83 1a db ff ff    	lea    -0x24e6(%ebx),%eax
    6526:	6a 01                	push   $0x1
    6528:	50                   	push   %eax
    6529:	57                   	push   %edi
    652a:	ff d5                	call   *%ebp
    652c:	83 c4 10             	add    $0x10,%esp
    652f:	89 c1                	mov    %eax,%ecx
    6531:	89 c8                	mov    %ecx,%eax
    6533:	83 c4 2c             	add    $0x2c,%esp
    6536:	5e                   	pop    %esi
    6537:	5f                   	pop    %edi
    6538:	5b                   	pop    %ebx
    6539:	5d                   	pop    %ebp
    653a:	c3                   	ret
    653b:	66 90                	xchg   %ax,%ax
    653d:	66 90                	xchg   %ax,%ax
    653f:	90                   	nop

00006540 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>:
    6540:	53                   	push   %ebx
    6541:	57                   	push   %edi
    6542:	56                   	push   %esi
    6543:	81 ec 80 00 00 00    	sub    $0x80,%esp
    6549:	e8 00 00 00 00       	call   654e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xe>
    654e:	5b                   	pop    %ebx
    654f:	81 c3 a6 3a 00 00    	add    $0x3aa6,%ebx
    6555:	8b 42 08             	mov    0x8(%edx),%eax
    6558:	a9 00 00 00 02       	test   $0x2000000,%eax
    655d:	75 1b                	jne    657a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x3a>
    655f:	a9 00 00 00 04       	test   $0x4000000,%eax
    6564:	75 51                	jne    65b7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x77>
    6566:	83 ec 08             	sub    $0x8,%esp
    6569:	52                   	push   %edx
    656a:	51                   	push   %ecx
    656b:	e8 90 c5 ff ff       	call   2b00 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>
    6570:	81 c4 90 00 00 00    	add    $0x90,%esp
    6576:	5e                   	pop    %esi
    6577:	5f                   	pop    %edi
    6578:	5b                   	pop    %ebx
    6579:	c3                   	ret
    657a:	8b 01                	mov    (%ecx),%eax
    657c:	b9 81 00 00 00       	mov    $0x81,%ecx
    6581:	eb 23                	jmp    65a6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x66>
    6583:	90                   	nop
    6584:	90                   	nop
    6585:	90                   	nop
    6586:	90                   	nop
    6587:	90                   	nop
    6588:	90                   	nop
    6589:	90                   	nop
    658a:	90                   	nop
    658b:	90                   	nop
    658c:	90                   	nop
    658d:	90                   	nop
    658e:	90                   	nop
    658f:	90                   	nop
    6590:	80 c1 57             	add    $0x57,%cl
    6593:	89 c7                	mov    %eax,%edi
    6595:	c1 ef 04             	shr    $0x4,%edi
    6598:	88 4c 34 fe          	mov    %cl,-0x2(%esp,%esi,1)
    659c:	8d 4e ff             	lea    -0x1(%esi),%ecx
    659f:	83 f8 0f             	cmp    $0xf,%eax
    65a2:	89 f8                	mov    %edi,%eax
    65a4:	76 41                	jbe    65e7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xa7>
    65a6:	89 ce                	mov    %ecx,%esi
    65a8:	89 c1                	mov    %eax,%ecx
    65aa:	80 e1 0f             	and    $0xf,%cl
    65ad:	80 f9 0a             	cmp    $0xa,%cl
    65b0:	73 de                	jae    6590 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x50>
    65b2:	80 c9 30             	or     $0x30,%cl
    65b5:	eb dc                	jmp    6593 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x53>
    65b7:	8b 01                	mov    (%ecx),%eax
    65b9:	b9 81 00 00 00       	mov    $0x81,%ecx
    65be:	eb 16                	jmp    65d6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x96>
    65c0:	80 c1 37             	add    $0x37,%cl
    65c3:	89 c7                	mov    %eax,%edi
    65c5:	c1 ef 04             	shr    $0x4,%edi
    65c8:	88 4c 34 fe          	mov    %cl,-0x2(%esp,%esi,1)
    65cc:	8d 4e ff             	lea    -0x1(%esi),%ecx
    65cf:	83 f8 0f             	cmp    $0xf,%eax
    65d2:	89 f8                	mov    %edi,%eax
    65d4:	76 11                	jbe    65e7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xa7>
    65d6:	89 ce                	mov    %ecx,%esi
    65d8:	89 c1                	mov    %eax,%ecx
    65da:	80 e1 0f             	and    $0xf,%cl
    65dd:	80 f9 0a             	cmp    $0xa,%cl
    65e0:	73 de                	jae    65c0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x80>
    65e2:	80 c9 30             	or     $0x30,%cl
    65e5:	eb dc                	jmp    65c3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x83>
    65e7:	83 c6 fe             	add    $0xfffffffe,%esi
    65ea:	8d 04 34             	lea    (%esp,%esi,1),%eax
    65ed:	be 81 00 00 00       	mov    $0x81,%esi
    65f2:	29 ce                	sub    %ecx,%esi
    65f4:	8d bb c9 db ff ff    	lea    -0x2437(%ebx),%edi
    65fa:	89 d1                	mov    %edx,%ecx
    65fc:	ba 01 00 00 00       	mov    $0x1,%edx
    6601:	56                   	push   %esi
    6602:	50                   	push   %eax
    6603:	6a 02                	push   $0x2
    6605:	57                   	push   %edi
    6606:	e8 05 c6 ff ff       	call   2c10 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    660b:	83 c4 10             	add    $0x10,%esp
    660e:	81 c4 80 00 00 00    	add    $0x80,%esp
    6614:	5e                   	pop    %esi
    6615:	5f                   	pop    %edi
    6616:	5b                   	pop    %ebx
    6617:	c3                   	ret
    6618:	66 90                	xchg   %ax,%ax
    661a:	66 90                	xchg   %ax,%ax
    661c:	66 90                	xchg   %ax,%ax
    661e:	66 90                	xchg   %ax,%ax

00006620 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h744bf35b61fad11fE>:
    6620:	53                   	push   %ebx
    6621:	83 ec 08             	sub    $0x8,%esp
    6624:	e8 00 00 00 00       	call   6629 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h744bf35b61fad11fE+0x9>
    6629:	5b                   	pop    %ebx
    662a:	81 c3 cb 39 00 00    	add    $0x39cb,%ebx
    6630:	8b 44 24 14          	mov    0x14(%esp),%eax
    6634:	8b 48 04             	mov    0x4(%eax),%ecx
    6637:	83 ec 04             	sub    $0x4,%esp
    663a:	8d 93 9f e8 ff ff    	lea    -0x1761(%ebx),%edx
    6640:	6a 0d                	push   $0xd
    6642:	52                   	push   %edx
    6643:	ff 30                	push   (%eax)
    6645:	ff 51 0c             	call   *0xc(%ecx)
    6648:	83 c4 18             	add    $0x18,%esp
    664b:	5b                   	pop    %ebx
    664c:	c3                   	ret
    664d:	66 90                	xchg   %ax,%ax
    664f:	90                   	nop

00006650 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E>:
    6650:	53                   	push   %ebx
    6651:	83 ec 38             	sub    $0x38,%esp
    6654:	e8 00 00 00 00       	call   6659 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0x9>
    6659:	5b                   	pop    %ebx
    665a:	81 c3 9b 39 00 00    	add    $0x399b,%ebx
    6660:	8b 44 24 44          	mov    0x44(%esp),%eax
    6664:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    6668:	8b 11                	mov    (%ecx),%edx
    666a:	83 c1 04             	add    $0x4,%ecx
    666d:	8b 94 93 54 d5 ff ff 	mov    -0x2aac(%ebx,%edx,4),%edx
    6674:	01 da                	add    %ebx,%edx
    6676:	ff e2                	jmp    *%edx
    6678:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    667c:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    6680:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    6684:	8d 8b 3c c7 ff ff    	lea    -0x38c4(%ebx),%ecx
    668a:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    668e:	8d 8b f0 fe ff ff    	lea    -0x110(%ebx),%ecx
    6694:	eb 5c                	jmp    66f2 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0xa2>
    6696:	8b 08                	mov    (%eax),%ecx
    6698:	8b 40 04             	mov    0x4(%eax),%eax
    669b:	8d 93 04 e9 ff ff    	lea    -0x16fc(%ebx),%edx
    66a1:	89 54 24 04          	mov    %edx,0x4(%esp)
    66a5:	89 0c 24             	mov    %ecx,(%esp)
    66a8:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
    66af:	00 
    66b0:	ff 50 0c             	call   *0xc(%eax)
    66b3:	83 c4 38             	add    $0x38,%esp
    66b6:	5b                   	pop    %ebx
    66b7:	c3                   	ret
    66b8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    66bc:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    66c0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    66c4:	8d 8b cc c7 ff ff    	lea    -0x3834(%ebx),%ecx
    66ca:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    66ce:	8d 8b 00 ff ff ff    	lea    -0x100(%ebx),%ecx
    66d4:	eb 1c                	jmp    66f2 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0xa2>
    66d6:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    66da:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    66de:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    66e2:	8d 8b 2c c6 ff ff    	lea    -0x39d4(%ebx),%ecx
    66e8:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    66ec:	8d 8b f8 fe ff ff    	lea    -0x108(%ebx),%ecx
    66f2:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    66f6:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%esp)
    66fd:	00 
    66fe:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    6705:	00 
    6706:	8d 4c 24 18          	lea    0x18(%esp),%ecx
    670a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    670e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    6715:	00 
    6716:	8b 08                	mov    (%eax),%ecx
    6718:	8b 50 04             	mov    0x4(%eax),%edx
    671b:	8d 44 24 20          	lea    0x20(%esp),%eax
    671f:	89 04 24             	mov    %eax,(%esp)
    6722:	e8 c9 cd ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    6727:	83 c4 38             	add    $0x38,%esp
    672a:	5b                   	pop    %ebx
    672b:	c3                   	ret
    672c:	66 90                	xchg   %ax,%ax
    672e:	66 90                	xchg   %ax,%ax

00006730 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE>:
    6730:	53                   	push   %ebx
    6731:	83 ec 28             	sub    $0x28,%esp
    6734:	e8 00 00 00 00       	call   6739 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE+0x9>
    6739:	5b                   	pop    %ebx
    673a:	81 c3 bb 38 00 00    	add    $0x38bb,%ebx
    6740:	8b 44 24 34          	mov    0x34(%esp),%eax
    6744:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    6748:	8b 09                	mov    (%ecx),%ecx
    674a:	83 39 00             	cmpl   $0x0,(%ecx)
    674d:	74 57                	je     67a6 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE+0x76>
    674f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    6753:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    6757:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    675b:	8d 8b 9c c0 ff ff    	lea    -0x3f64(%ebx),%ecx
    6761:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    6765:	8d 8b e8 fe ff ff    	lea    -0x118(%ebx),%ecx
    676b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    676f:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    6776:	00 
    6777:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    677e:	00 
    677f:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    6783:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    6787:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    678e:	00 
    678f:	8b 08                	mov    (%eax),%ecx
    6791:	8b 50 04             	mov    0x4(%eax),%edx
    6794:	83 ec 0c             	sub    $0xc,%esp
    6797:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    679b:	50                   	push   %eax
    679c:	e8 4f cd ff ff       	call   34f0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    67a1:	83 c4 38             	add    $0x38,%esp
    67a4:	5b                   	pop    %ebx
    67a5:	c3                   	ret
    67a6:	8b 48 04             	mov    0x4(%eax),%ecx
    67a9:	83 ec 04             	sub    $0x4,%esp
    67ac:	8d 93 ac e8 ff ff    	lea    -0x1754(%ebx),%edx
    67b2:	6a 17                	push   $0x17
    67b4:	52                   	push   %edx
    67b5:	ff 30                	push   (%eax)
    67b7:	ff 51 0c             	call   *0xc(%ecx)
    67ba:	83 c4 38             	add    $0x38,%esp
    67bd:	5b                   	pop    %ebx
    67be:	c3                   	ret
    67bf:	90                   	nop

000067c0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h85bd4713be9ebf66E>:
    67c0:	53                   	push   %ebx
    67c1:	83 ec 08             	sub    $0x8,%esp
    67c4:	e8 00 00 00 00       	call   67c9 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h85bd4713be9ebf66E+0x9>
    67c9:	5b                   	pop    %ebx
    67ca:	81 c3 2b 38 00 00    	add    $0x382b,%ebx
    67d0:	8b 44 24 14          	mov    0x14(%esp),%eax
    67d4:	8b 48 04             	mov    0x4(%eax),%ecx
    67d7:	83 ec 04             	sub    $0x4,%esp
    67da:	8d 93 b4 e2 ff ff    	lea    -0x1d4c(%ebx),%edx
    67e0:	6a 18                	push   $0x18
    67e2:	52                   	push   %edx
    67e3:	ff 30                	push   (%eax)
    67e5:	ff 51 0c             	call   *0xc(%ecx)
    67e8:	83 c4 18             	add    $0x18,%esp
    67eb:	5b                   	pop    %ebx
    67ec:	c3                   	ret
    67ed:	66 90                	xchg   %ax,%ax
    67ef:	90                   	nop

000067f0 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>:
    67f0:	53                   	push   %ebx
    67f1:	83 ec 58             	sub    $0x58,%esp
    67f4:	e8 00 00 00 00       	call   67f9 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x9>
    67f9:	5b                   	pop    %ebx
    67fa:	81 c3 fb 37 00 00    	add    $0x37fb,%ebx
    6800:	89 0c 24             	mov    %ecx,(%esp)
    6803:	85 c9                	test   %ecx,%ecx
    6805:	0f 84 d7 01 00 00    	je     69e2 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    680b:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    6811:	83 f8 03             	cmp    $0x3,%eax
    6814:	0f 86 cd 00 00 00    	jbe    68e7 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xf7>
    681a:	89 e0                	mov    %esp,%eax
    681c:	89 44 24 04          	mov    %eax,0x4(%esp)
    6820:	8d 83 7c 9e ff ff    	lea    -0x6184(%ebx),%eax
    6826:	89 44 24 08          	mov    %eax,0x8(%esp)
    682a:	c7 44 24 34 04 00 00 	movl   $0x4,0x34(%esp)
    6831:	00 
    6832:	8d 83 a2 e9 ff ff    	lea    -0x165e(%ebx),%eax
    6838:	89 44 24 38          	mov    %eax,0x38(%esp)
    683c:	c7 44 24 3c 1c 00 00 	movl   $0x1c,0x3c(%esp)
    6843:	00 
    6844:	8d 8b 08 ff ff ff    	lea    -0xf8(%ebx),%ecx
    684a:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    684e:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    6855:	00 
    6856:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    685a:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    685e:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    6865:	00 
    6866:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    686d:	00 
    686e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    6875:	00 
    6876:	89 44 24 20          	mov    %eax,0x20(%esp)
    687a:	c7 44 24 24 1c 00 00 	movl   $0x1c,0x24(%esp)
    6881:	00 
    6882:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    6889:	00 
    688a:	8d 83 3a e9 ff ff    	lea    -0x16c6(%ebx),%eax
    6890:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    6894:	c7 44 24 30 4b 00 00 	movl   $0x4b,0x30(%esp)
    689b:	00 
    689c:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    68a3:	00 
    68a4:	c7 44 24 18 51 00 00 	movl   $0x51,0x18(%esp)
    68ab:	00 
    68ac:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    68b2:	83 f8 02             	cmp    $0x2,%eax
    68b5:	74 10                	je     68c7 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xd7>
    68b7:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    68bd:	75 10                	jne    68cf <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xdf>
    68bf:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    68c5:	eb 0e                	jmp    68d5 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xe5>
    68c7:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    68cd:	74 f0                	je     68bf <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xcf>
    68cf:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    68d5:	83 ec 08             	sub    $0x8,%esp
    68d8:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    68dc:	52                   	push   %edx
    68dd:	51                   	push   %ecx
    68de:	ff 50 10             	call   *0x10(%eax)
    68e1:	83 c4 10             	add    $0x10,%esp
    68e4:	8b 0c 24             	mov    (%esp),%ecx
    68e7:	89 ca                	mov    %ecx,%edx
    68e9:	b8 8d 00 00 00       	mov    $0x8d,%eax
    68ee:	cd 80                	int    $0x80
    68f0:	8d 48 ff             	lea    -0x1(%eax),%ecx
    68f3:	83 f9 0a             	cmp    $0xa,%ecx
    68f6:	0f 83 eb 00 00 00    	jae    69e7 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f7>
    68fc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6900:	8d 44 24 0c          	lea    0xc(%esp),%eax
    6904:	89 44 24 10          	mov    %eax,0x10(%esp)
    6908:	8b 83 44 27 00 00    	mov    0x2744(%ebx),%eax
    690e:	85 c0                	test   %eax,%eax
    6910:	0f 84 cc 00 00 00    	je     69e2 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    6916:	8d 44 24 10          	lea    0x10(%esp),%eax
    691a:	89 44 24 04          	mov    %eax,0x4(%esp)
    691e:	8d 83 0c ca ff ff    	lea    -0x35f4(%ebx),%eax
    6924:	89 44 24 08          	mov    %eax,0x8(%esp)
    6928:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%esp)
    692f:	00 
    6930:	8d 83 a2 e9 ff ff    	lea    -0x165e(%ebx),%eax
    6936:	89 44 24 38          	mov    %eax,0x38(%esp)
    693a:	c7 44 24 3c 1c 00 00 	movl   $0x1c,0x3c(%esp)
    6941:	00 
    6942:	8d 8b 10 ff ff ff    	lea    -0xf0(%ebx),%ecx
    6948:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    694c:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    6953:	00 
    6954:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    6958:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    695c:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    6963:	00 
    6964:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    696b:	00 
    696c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    6973:	00 
    6974:	89 44 24 20          	mov    %eax,0x20(%esp)
    6978:	c7 44 24 24 1c 00 00 	movl   $0x1c,0x24(%esp)
    697f:	00 
    6980:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    6987:	00 
    6988:	8d 83 3a e9 ff ff    	lea    -0x16c6(%ebx),%eax
    698e:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    6992:	c7 44 24 30 4b 00 00 	movl   $0x4b,0x30(%esp)
    6999:	00 
    699a:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    69a1:	00 
    69a2:	c7 44 24 18 59 00 00 	movl   $0x59,0x18(%esp)
    69a9:	00 
    69aa:	8b 83 40 27 00 00    	mov    0x2740(%ebx),%eax
    69b0:	83 f8 02             	cmp    $0x2,%eax
    69b3:	74 10                	je     69c5 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1d5>
    69b5:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    69bb:	75 10                	jne    69cd <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1dd>
    69bd:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    69c3:	eb 0e                	jmp    69d3 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1e3>
    69c5:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    69cb:	74 f0                	je     69bd <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1cd>
    69cd:	8d 8b 57 ea ff ff    	lea    -0x15a9(%ebx),%ecx
    69d3:	83 ec 08             	sub    $0x8,%esp
    69d6:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    69da:	52                   	push   %edx
    69db:	51                   	push   %ecx
    69dc:	ff 50 10             	call   *0x10(%eax)
    69df:	83 c4 10             	add    $0x10,%esp
    69e2:	83 c4 58             	add    $0x58,%esp
    69e5:	5b                   	pop    %ebx
    69e6:	c3                   	ret
    69e7:	85 c0                	test   %eax,%eax
    69e9:	b8 42 00 00 00       	mov    $0x42,%eax
    69ee:	74 f2                	je     69e2 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    69f0:	e9 07 ff ff ff       	jmp    68fc <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x10c>
    69f5:	66 90                	xchg   %ax,%ax
    69f7:	66 90                	xchg   %ax,%ax
    69f9:	66 90                	xchg   %ax,%ax
    69fb:	66 90                	xchg   %ax,%ax
    69fd:	66 90                	xchg   %ax,%ax
    69ff:	90                   	nop

00006a00 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE>:
    6a00:	53                   	push   %ebx
    6a01:	56                   	push   %esi
    6a02:	50                   	push   %eax
    6a03:	e8 00 00 00 00       	call   6a08 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0x8>
    6a08:	5b                   	pop    %ebx
    6a09:	81 c3 ec 35 00 00    	add    $0x35ec,%ebx
    6a0f:	8b 44 24 10          	mov    0x10(%esp),%eax
    6a13:	8b 00                	mov    (%eax),%eax
    6a15:	8b 10                	mov    (%eax),%edx
    6a17:	8d 83 df e9 ff ff    	lea    -0x1621(%ebx),%eax
    6a1d:	b9 0c 00 00 00       	mov    $0xc,%ecx
    6a22:	4a                   	dec    %edx
    6a23:	8b 94 93 64 d5 ff ff 	mov    -0x2a9c(%ebx,%edx,4),%edx
    6a2a:	01 da                	add    %ebx,%edx
    6a2c:	ff e2                	jmp    *%edx
    6a2e:	8d 83 eb e9 ff ff    	lea    -0x1615(%ebx),%eax
    6a34:	b9 0b 00 00 00       	mov    $0xb,%ecx
    6a39:	eb 69                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a3b:	8d 83 34 d7 ff ff    	lea    -0x28cc(%ebx),%eax
    6a41:	b9 08 00 00 00       	mov    $0x8,%ecx
    6a46:	eb 5c                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a48:	8d 83 30 ea ff ff    	lea    -0x15d0(%ebx),%eax
    6a4e:	b9 0f 00 00 00       	mov    $0xf,%ecx
    6a53:	eb 4f                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a55:	8d 83 f6 e9 ff ff    	lea    -0x160a(%ebx),%eax
    6a5b:	b9 0f 00 00 00       	mov    $0xf,%ecx
    6a60:	eb 42                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a62:	8d 83 05 ea ff ff    	lea    -0x15fb(%ebx),%eax
    6a68:	eb 3a                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a6a:	8d 83 5b db ff ff    	lea    -0x24a5(%ebx),%eax
    6a70:	b9 10 00 00 00       	mov    $0x10,%ecx
    6a75:	eb 2d                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a77:	8d 83 3f ea ff ff    	lea    -0x15c1(%ebx),%eax
    6a7d:	b9 06 00 00 00       	mov    $0x6,%ecx
    6a82:	eb 20                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a84:	8d 83 4b db ff ff    	lea    -0x24b5(%ebx),%eax
    6a8a:	b9 10 00 00 00       	mov    $0x10,%ecx
    6a8f:	eb 13                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a91:	8d 83 11 ea ff ff    	lea    -0x15ef(%ebx),%eax
    6a97:	eb 0b                	jmp    6aa4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    6a99:	8d 83 1d ea ff ff    	lea    -0x15e3(%ebx),%eax
    6a9f:	b9 13 00 00 00       	mov    $0x13,%ecx
    6aa4:	8b 54 24 14          	mov    0x14(%esp),%edx
    6aa8:	8b 72 04             	mov    0x4(%edx),%esi
    6aab:	83 ec 04             	sub    $0x4,%esp
    6aae:	51                   	push   %ecx
    6aaf:	50                   	push   %eax
    6ab0:	ff 32                	push   (%edx)
    6ab2:	ff 56 0c             	call   *0xc(%esi)
    6ab5:	83 c4 14             	add    $0x14,%esp
    6ab8:	5e                   	pop    %esi
    6ab9:	5b                   	pop    %ebx
    6aba:	c3                   	ret
    6abb:	0f 0b                	ud2
    6abd:	66 90                	xchg   %ax,%ax
    6abf:	90                   	nop

00006ac0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>:
    6ac0:	89 c8                	mov    %ecx,%eax
    6ac2:	83 f9 0b             	cmp    $0xb,%ecx
    6ac5:	72 05                	jb     6acc <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E+0xc>
    6ac7:	b8 42 00 00 00       	mov    $0x42,%eax
    6acc:	c3                   	ret
    6acd:	66 90                	xchg   %ax,%ax
    6acf:	90                   	nop

00006ad0 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E>:
    6ad0:	53                   	push   %ebx
    6ad1:	83 ec 08             	sub    $0x8,%esp
    6ad4:	e8 00 00 00 00       	call   6ad9 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E+0x9>
    6ad9:	5b                   	pop    %ebx
    6ada:	81 c3 1b 35 00 00    	add    $0x351b,%ebx
    6ae0:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    6ae4:	8b 44 24 10          	mov    0x10(%esp),%eax
    6ae8:	8b 00                	mov    (%eax),%eax
    6aea:	8b 94 c3 30 ff ff ff 	mov    -0xd0(%ebx,%eax,8),%edx
    6af1:	8b 84 c3 34 ff ff ff 	mov    -0xcc(%ebx,%eax,8),%eax
    6af8:	89 04 24             	mov    %eax,(%esp)
    6afb:	e8 10 c4 ff ff       	call   2f10 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    6b00:	83 c4 08             	add    $0x8,%esp
    6b03:	5b                   	pop    %ebx
    6b04:	c3                   	ret
    6b05:	66 90                	xchg   %ax,%ax
    6b07:	66 90                	xchg   %ax,%ax
    6b09:	66 90                	xchg   %ax,%ax
    6b0b:	66 90                	xchg   %ax,%ax
    6b0d:	66 90                	xchg   %ax,%ax
    6b0f:	90                   	nop

00006b10 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$7enabled17h7c1fbd7539bc5801E>:
    6b10:	31 c0                	xor    %eax,%eax
    6b12:	c3                   	ret
    6b13:	66 90                	xchg   %ax,%ax
    6b15:	66 90                	xchg   %ax,%ax
    6b17:	66 90                	xchg   %ax,%ax
    6b19:	66 90                	xchg   %ax,%ax
    6b1b:	66 90                	xchg   %ax,%ax
    6b1d:	66 90                	xchg   %ax,%ax
    6b1f:	90                   	nop

00006b20 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$3log17hb129cc8b65bcebf0E>:
    6b20:	c3                   	ret
    6b21:	66 90                	xchg   %ax,%ax
    6b23:	66 90                	xchg   %ax,%ax
    6b25:	66 90                	xchg   %ax,%ax
    6b27:	66 90                	xchg   %ax,%ax
    6b29:	66 90                	xchg   %ax,%ax
    6b2b:	66 90                	xchg   %ax,%ax
    6b2d:	66 90                	xchg   %ax,%ax
    6b2f:	90                   	nop

00006b30 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$5flush17hb87dc07497484b4cE>:
    6b30:	c3                   	ret
    6b31:	66 90                	xchg   %ax,%ax
    6b33:	66 90                	xchg   %ax,%ax
    6b35:	66 90                	xchg   %ax,%ax
    6b37:	66 90                	xchg   %ax,%ax
    6b39:	66 90                	xchg   %ax,%ax
    6b3b:	66 90                	xchg   %ax,%ax
    6b3d:	66 90                	xchg   %ax,%ax
    6b3f:	90                   	nop

00006b40 <memcpy>:
    6b40:	55                   	push   %ebp
    6b41:	53                   	push   %ebx
    6b42:	57                   	push   %edi
    6b43:	56                   	push   %esi
    6b44:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    6b48:	8b 54 24 18          	mov    0x18(%esp),%edx
    6b4c:	8b 44 24 14          	mov    0x14(%esp),%eax
    6b50:	89 c6                	mov    %eax,%esi
    6b52:	83 fd 10             	cmp    $0x10,%ebp
    6b55:	72 63                	jb     6bba <memcpy+0x7a>
    6b57:	f7 de                	neg    %esi
    6b59:	83 e6 03             	and    $0x3,%esi
    6b5c:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    6b5f:	39 f8                	cmp    %edi,%eax
    6b61:	73 19                	jae    6b7c <memcpy+0x3c>
    6b63:	31 db                	xor    %ebx,%ebx
    6b65:	90                   	nop
    6b66:	90                   	nop
    6b67:	90                   	nop
    6b68:	90                   	nop
    6b69:	90                   	nop
    6b6a:	90                   	nop
    6b6b:	90                   	nop
    6b6c:	90                   	nop
    6b6d:	90                   	nop
    6b6e:	90                   	nop
    6b6f:	90                   	nop
    6b70:	0f b6 0c 1a          	movzbl (%edx,%ebx,1),%ecx
    6b74:	88 0c 18             	mov    %cl,(%eax,%ebx,1)
    6b77:	43                   	inc    %ebx
    6b78:	39 de                	cmp    %ebx,%esi
    6b7a:	75 f4                	jne    6b70 <memcpy+0x30>
    6b7c:	01 f2                	add    %esi,%edx
    6b7e:	29 f5                	sub    %esi,%ebp
    6b80:	89 e8                	mov    %ebp,%eax
    6b82:	89 eb                	mov    %ebp,%ebx
    6b84:	83 e3 fc             	and    $0xfffffffc,%ebx
    6b87:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
    6b8a:	f6 c2 03             	test   $0x3,%dl
    6b8d:	75 52                	jne    6be1 <memcpy+0xa1>
    6b8f:	39 f7                	cmp    %esi,%edi
    6b91:	73 1c                	jae    6baf <memcpy+0x6f>
    6b93:	89 d5                	mov    %edx,%ebp
    6b95:	90                   	nop
    6b96:	90                   	nop
    6b97:	90                   	nop
    6b98:	90                   	nop
    6b99:	90                   	nop
    6b9a:	90                   	nop
    6b9b:	90                   	nop
    6b9c:	90                   	nop
    6b9d:	90                   	nop
    6b9e:	90                   	nop
    6b9f:	90                   	nop
    6ba0:	8b 4d 00             	mov    0x0(%ebp),%ecx
    6ba3:	89 0f                	mov    %ecx,(%edi)
    6ba5:	83 c7 04             	add    $0x4,%edi
    6ba8:	83 c5 04             	add    $0x4,%ebp
    6bab:	39 f7                	cmp    %esi,%edi
    6bad:	72 f1                	jb     6ba0 <memcpy+0x60>
    6baf:	01 da                	add    %ebx,%edx
    6bb1:	89 c5                	mov    %eax,%ebp
    6bb3:	83 e5 03             	and    $0x3,%ebp
    6bb6:	8b 44 24 14          	mov    0x14(%esp),%eax
    6bba:	8d 3c 2e             	lea    (%esi,%ebp,1),%edi
    6bbd:	39 fe                	cmp    %edi,%esi
    6bbf:	73 1b                	jae    6bdc <memcpy+0x9c>
    6bc1:	31 ff                	xor    %edi,%edi
    6bc3:	90                   	nop
    6bc4:	90                   	nop
    6bc5:	90                   	nop
    6bc6:	90                   	nop
    6bc7:	90                   	nop
    6bc8:	90                   	nop
    6bc9:	90                   	nop
    6bca:	90                   	nop
    6bcb:	90                   	nop
    6bcc:	90                   	nop
    6bcd:	90                   	nop
    6bce:	90                   	nop
    6bcf:	90                   	nop
    6bd0:	0f b6 0c 3a          	movzbl (%edx,%edi,1),%ecx
    6bd4:	88 0c 3e             	mov    %cl,(%esi,%edi,1)
    6bd7:	47                   	inc    %edi
    6bd8:	39 fd                	cmp    %edi,%ebp
    6bda:	75 f4                	jne    6bd0 <memcpy+0x90>
    6bdc:	5e                   	pop    %esi
    6bdd:	5f                   	pop    %edi
    6bde:	5b                   	pop    %ebx
    6bdf:	5d                   	pop    %ebp
    6be0:	c3                   	ret
    6be1:	39 f7                	cmp    %esi,%edi
    6be3:	73 ca                	jae    6baf <memcpy+0x6f>
    6be5:	89 d5                	mov    %edx,%ebp
    6be7:	8b 4d 00             	mov    0x0(%ebp),%ecx
    6bea:	89 0f                	mov    %ecx,(%edi)
    6bec:	83 c7 04             	add    $0x4,%edi
    6bef:	83 c5 04             	add    $0x4,%ebp
    6bf2:	39 f7                	cmp    %esi,%edi
    6bf4:	72 f1                	jb     6be7 <memcpy+0xa7>
    6bf6:	eb b7                	jmp    6baf <memcpy+0x6f>
    6bf8:	66 90                	xchg   %ax,%ax
    6bfa:	66 90                	xchg   %ax,%ax
    6bfc:	66 90                	xchg   %ax,%ax
    6bfe:	66 90                	xchg   %ax,%ax

00006c00 <memset>:
    6c00:	53                   	push   %ebx
    6c01:	57                   	push   %edi
    6c02:	56                   	push   %esi
    6c03:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    6c07:	8b 54 24 14          	mov    0x14(%esp),%edx
    6c0b:	8b 44 24 10          	mov    0x10(%esp),%eax
    6c0f:	89 c6                	mov    %eax,%esi
    6c11:	83 f9 10             	cmp    $0x10,%ecx
    6c14:	72 46                	jb     6c5c <memset+0x5c>
    6c16:	f7 de                	neg    %esi
    6c18:	83 e6 03             	and    $0x3,%esi
    6c1b:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    6c1e:	39 f8                	cmp    %edi,%eax
    6c20:	73 16                	jae    6c38 <memset+0x38>
    6c22:	31 db                	xor    %ebx,%ebx
    6c24:	90                   	nop
    6c25:	90                   	nop
    6c26:	90                   	nop
    6c27:	90                   	nop
    6c28:	90                   	nop
    6c29:	90                   	nop
    6c2a:	90                   	nop
    6c2b:	90                   	nop
    6c2c:	90                   	nop
    6c2d:	90                   	nop
    6c2e:	90                   	nop
    6c2f:	90                   	nop
    6c30:	88 14 18             	mov    %dl,(%eax,%ebx,1)
    6c33:	43                   	inc    %ebx
    6c34:	39 de                	cmp    %ebx,%esi
    6c36:	75 f8                	jne    6c30 <memset+0x30>
    6c38:	29 f1                	sub    %esi,%ecx
    6c3a:	89 ce                	mov    %ecx,%esi
    6c3c:	83 e6 fc             	and    $0xfffffffc,%esi
    6c3f:	01 fe                	add    %edi,%esi
    6c41:	39 f7                	cmp    %esi,%edi
    6c43:	73 14                	jae    6c59 <memset+0x59>
    6c45:	0f b6 da             	movzbl %dl,%ebx
    6c48:	69 db 01 01 01 01    	imul   $0x1010101,%ebx,%ebx
    6c4e:	90                   	nop
    6c4f:	90                   	nop
    6c50:	89 1f                	mov    %ebx,(%edi)
    6c52:	83 c7 04             	add    $0x4,%edi
    6c55:	39 f7                	cmp    %esi,%edi
    6c57:	72 f7                	jb     6c50 <memset+0x50>
    6c59:	83 e1 03             	and    $0x3,%ecx
    6c5c:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
    6c5f:	39 fe                	cmp    %edi,%esi
    6c61:	73 15                	jae    6c78 <memset+0x78>
    6c63:	31 ff                	xor    %edi,%edi
    6c65:	90                   	nop
    6c66:	90                   	nop
    6c67:	90                   	nop
    6c68:	90                   	nop
    6c69:	90                   	nop
    6c6a:	90                   	nop
    6c6b:	90                   	nop
    6c6c:	90                   	nop
    6c6d:	90                   	nop
    6c6e:	90                   	nop
    6c6f:	90                   	nop
    6c70:	88 14 3e             	mov    %dl,(%esi,%edi,1)
    6c73:	47                   	inc    %edi
    6c74:	39 f9                	cmp    %edi,%ecx
    6c76:	75 f8                	jne    6c70 <memset+0x70>
    6c78:	5e                   	pop    %esi
    6c79:	5f                   	pop    %edi
    6c7a:	5b                   	pop    %ebx
    6c7b:	c3                   	ret

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
    7040:	70 9c                	jo     6fde <memset+0x3de>
    7042:	00 00                	add    %al,(%eax)
    7044:	08 00                	or     %al,(%eax)
    7046:	00 00                	add    %al,(%eax)
    7048:	80 9c 00 00 08 00 00 	sbbb   $0x0,0x800(%eax,%eax,1)
    704f:	00 
    7050:	90                   	nop
    7051:	9c                   	pushf
    7052:	00 00                	add    %al,(%eax)
    7054:	08 00                	or     %al,(%eax)
    7056:	00 00                	add    %al,(%eax)
    7058:	94                   	xchg   %eax,%esp
    7059:	9c                   	pushf
    705a:	00 00                	add    %al,(%eax)
    705c:	08 00                	or     %al,(%eax)
    705e:	00 00                	add    %al,(%eax)
    7060:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    7061:	9c                   	pushf
    7062:	00 00                	add    %al,(%eax)
    7064:	08 00                	or     %al,(%eax)
    7066:	00 00                	add    %al,(%eax)
    7068:	ac                   	lods   %ds:(%esi),%al
    7069:	9c                   	pushf
    706a:	00 00                	add    %al,(%eax)
    706c:	08 00                	or     %al,(%eax)
    706e:	00 00                	add    %al,(%eax)
    7070:	bc 9c 00 00 08       	mov    $0x800009c,%esp
    7075:	00 00                	add    %al,(%eax)
    7077:	00 c4                	add    %al,%ah
    7079:	9c                   	pushf
    707a:	00 00                	add    %al,(%eax)
    707c:	08 00                	or     %al,(%eax)
    707e:	00 00                	add    %al,(%eax)
    7080:	d4 9c                	aam    $0x9c
    7082:	00 00                	add    %al,(%eax)
    7084:	08 00                	or     %al,(%eax)
    7086:	00 00                	add    %al,(%eax)
    7088:	e4 9c                	in     $0x9c,%al
    708a:	00 00                	add    %al,(%eax)
    708c:	08 00                	or     %al,(%eax)
    708e:	00 00                	add    %al,(%eax)
    7090:	f4                   	hlt
    7091:	9c                   	pushf
    7092:	00 00                	add    %al,(%eax)
    7094:	08 00                	or     %al,(%eax)
    7096:	00 00                	add    %al,(%eax)
    7098:	fc                   	cld
    7099:	9c                   	pushf
    709a:	00 00                	add    %al,(%eax)
    709c:	08 00                	or     %al,(%eax)
    709e:	00 00                	add    %al,(%eax)
    70a0:	04 9d                	add    $0x9d,%al
    70a2:	00 00                	add    %al,(%eax)
    70a4:	08 00                	or     %al,(%eax)
    70a6:	00 00                	add    %al,(%eax)
    70a8:	14 9d                	adc    $0x9d,%al
    70aa:	00 00                	add    %al,(%eax)
    70ac:	08 00                	or     %al,(%eax)
    70ae:	00 00                	add    %al,(%eax)
    70b0:	1c 9d                	sbb    $0x9d,%al
    70b2:	00 00                	add    %al,(%eax)
    70b4:	08 00                	or     %al,(%eax)
    70b6:	00 00                	add    %al,(%eax)
    70b8:	24 9d                	and    $0x9d,%al
    70ba:	00 00                	add    %al,(%eax)
    70bc:	08 00                	or     %al,(%eax)
    70be:	00 00                	add    %al,(%eax)
    70c0:	2c 9d                	sub    $0x9d,%al
    70c2:	00 00                	add    %al,(%eax)
    70c4:	08 00                	or     %al,(%eax)
    70c6:	00 00                	add    %al,(%eax)
    70c8:	34 9d                	xor    $0x9d,%al
    70ca:	00 00                	add    %al,(%eax)
    70cc:	08 00                	or     %al,(%eax)
    70ce:	00 00                	add    %al,(%eax)
    70d0:	4c                   	dec    %esp
    70d1:	9d                   	popf
    70d2:	00 00                	add    %al,(%eax)
    70d4:	08 00                	or     %al,(%eax)
    70d6:	00 00                	add    %al,(%eax)
    70d8:	54                   	push   %esp
    70d9:	9d                   	popf
    70da:	00 00                	add    %al,(%eax)
    70dc:	08 00                	or     %al,(%eax)
    70de:	00 00                	add    %al,(%eax)
    70e0:	5c                   	pop    %esp
    70e1:	9d                   	popf
    70e2:	00 00                	add    %al,(%eax)
    70e4:	08 00                	or     %al,(%eax)
    70e6:	00 00                	add    %al,(%eax)
    70e8:	64 9d                	fs popf
    70ea:	00 00                	add    %al,(%eax)
    70ec:	08 00                	or     %al,(%eax)
    70ee:	00 00                	add    %al,(%eax)
    70f0:	74 9d                	je     708f <memset+0x48f>
    70f2:	00 00                	add    %al,(%eax)
    70f4:	08 00                	or     %al,(%eax)
    70f6:	00 00                	add    %al,(%eax)
    70f8:	88 9d 00 00 08 00    	mov    %bl,0x80000(%ebp)
    70fe:	00 00                	add    %al,(%eax)
    7100:	8c 9d 00 00 08 00    	mov    %ds,0x80000(%ebp)
    7106:	00 00                	add    %al,(%eax)
    7108:	90                   	nop
    7109:	9d                   	popf
    710a:	00 00                	add    %al,(%eax)
    710c:	08 00                	or     %al,(%eax)
    710e:	00 00                	add    %al,(%eax)
    7110:	94                   	xchg   %eax,%esp
    7111:	9d                   	popf
    7112:	00 00                	add    %al,(%eax)
    7114:	08 00                	or     %al,(%eax)
    7116:	00 00                	add    %al,(%eax)
    7118:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    7119:	9d                   	popf
    711a:	00 00                	add    %al,(%eax)
    711c:	08 00                	or     %al,(%eax)
    711e:	00 00                	add    %al,(%eax)
    7120:	b4 9d                	mov    $0x9d,%ah
    7122:	00 00                	add    %al,(%eax)
    7124:	08 00                	or     %al,(%eax)
    7126:	00 00                	add    %al,(%eax)
    7128:	bc 9d 00 00 08       	mov    $0x800009d,%esp
    712d:	00 00                	add    %al,(%eax)
    712f:	00 c4                	add    %al,%ah
    7131:	9d                   	popf
    7132:	00 00                	add    %al,(%eax)
    7134:	08 00                	or     %al,(%eax)
    7136:	00 00                	add    %al,(%eax)
    7138:	cc                   	int3
    7139:	9d                   	popf
    713a:	00 00                	add    %al,(%eax)
    713c:	08 00                	or     %al,(%eax)
    713e:	00 00                	add    %al,(%eax)
    7140:	d4 9d                	aam    $0x9d
    7142:	00 00                	add    %al,(%eax)
    7144:	08 00                	or     %al,(%eax)
    7146:	00 00                	add    %al,(%eax)
    7148:	e8 9d 00 00 08       	call   80071ea <_end+0x7ffaaae>
    714d:	00 00                	add    %al,(%eax)
    714f:	00 ec                	add    %ch,%ah
    7151:	9d                   	popf
    7152:	00 00                	add    %al,(%eax)
    7154:	08 00                	or     %al,(%eax)
    7156:	00 00                	add    %al,(%eax)
    7158:	f8                   	clc
    7159:	9d                   	popf
    715a:	00 00                	add    %al,(%eax)
    715c:	08 00                	or     %al,(%eax)
    715e:	00 00                	add    %al,(%eax)
    7160:	fc                   	cld
    7161:	9d                   	popf
    7162:	00 00                	add    %al,(%eax)
    7164:	08 00                	or     %al,(%eax)
    7166:	00 00                	add    %al,(%eax)
    7168:	00 9e 00 00 08 00    	add    %bl,0x80000(%esi)
    716e:	00 00                	add    %al,(%eax)
    7170:	04 9e                	add    $0x9e,%al
    7172:	00 00                	add    %al,(%eax)
    7174:	08 00                	or     %al,(%eax)
    7176:	00 00                	add    %al,(%eax)
    7178:	14 9e                	adc    $0x9e,%al
    717a:	00 00                	add    %al,(%eax)
    717c:	08 00                	or     %al,(%eax)
    717e:	00 00                	add    %al,(%eax)
    7180:	1c 9e                	sbb    $0x9e,%al
    7182:	00 00                	add    %al,(%eax)
    7184:	08 00                	or     %al,(%eax)
    7186:	00 00                	add    %al,(%eax)
    7188:	28 9e 00 00 08 00    	sub    %bl,0x80000(%esi)
    718e:	00 00                	add    %al,(%eax)
    7190:	2c 9e                	sub    $0x9e,%al
    7192:	00 00                	add    %al,(%eax)
    7194:	08 00                	or     %al,(%eax)
    7196:	00 00                	add    %al,(%eax)
    7198:	30 9e 00 00 08 00    	xor    %bl,0x80000(%esi)
    719e:	00 00                	add    %al,(%eax)
    71a0:	34 9e                	xor    $0x9e,%al
    71a2:	00 00                	add    %al,(%eax)
    71a4:	08 00                	or     %al,(%eax)
    71a6:	00 00                	add    %al,(%eax)
    71a8:	3c 9e                	cmp    $0x9e,%al
    71aa:	00 00                	add    %al,(%eax)
    71ac:	08 00                	or     %al,(%eax)
    71ae:	00 00                	add    %al,(%eax)
    71b0:	44                   	inc    %esp
    71b1:	9e                   	sahf
    71b2:	00 00                	add    %al,(%eax)
    71b4:	08 00                	or     %al,(%eax)
    71b6:	00 00                	add    %al,(%eax)
    71b8:	4c                   	dec    %esp
    71b9:	9e                   	sahf
    71ba:	00 00                	add    %al,(%eax)
    71bc:	08 00                	or     %al,(%eax)
    71be:	00 00                	add    %al,(%eax)
    71c0:	54                   	push   %esp
    71c1:	9e                   	sahf
    71c2:	00 00                	add    %al,(%eax)
    71c4:	08 00                	or     %al,(%eax)
    71c6:	00 00                	add    %al,(%eax)
    71c8:	5c                   	pop    %esp
    71c9:	9e                   	sahf
    71ca:	00 00                	add    %al,(%eax)
    71cc:	08 00                	or     %al,(%eax)
    71ce:	00 00                	add    %al,(%eax)
    71d0:	6c                   	insb   (%dx),%es:(%edi)
    71d1:	9e                   	sahf
    71d2:	00 00                	add    %al,(%eax)
    71d4:	08 00                	or     %al,(%eax)
    71d6:	00 00                	add    %al,(%eax)
    71d8:	7c 9e                	jl     7178 <memset+0x578>
    71da:	00 00                	add    %al,(%eax)
    71dc:	08 00                	or     %al,(%eax)
    71de:	00 00                	add    %al,(%eax)
    71e0:	84 9e 00 00 08 00    	test   %bl,0x80000(%esi)
    71e6:	00 00                	add    %al,(%eax)
    71e8:	8c 9e 00 00 08 00    	mov    %ds,0x80000(%esi)
    71ee:	00 00                	add    %al,(%eax)
    71f0:	94                   	xchg   %eax,%esp
    71f1:	9e                   	sahf
    71f2:	00 00                	add    %al,(%eax)
    71f4:	08 00                	or     %al,(%eax)
    71f6:	00 00                	add    %al,(%eax)
    71f8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    71f9:	9e                   	sahf
    71fa:	00 00                	add    %al,(%eax)
    71fc:	08 00                	or     %al,(%eax)
    71fe:	00 00                	add    %al,(%eax)
    7200:	b4 9e                	mov    $0x9e,%ah
    7202:	00 00                	add    %al,(%eax)
    7204:	08 00                	or     %al,(%eax)
    7206:	00 00                	add    %al,(%eax)
    7208:	bc 9e 00 00 08       	mov    $0x800009e,%esp
    720d:	00 00                	add    %al,(%eax)
    720f:	00 cc                	add    %cl,%ah
    7211:	9e                   	sahf
    7212:	00 00                	add    %al,(%eax)
    7214:	08 00                	or     %al,(%eax)
    7216:	00 00                	add    %al,(%eax)
    7218:	d4 9e                	aam    $0x9e
    721a:	00 00                	add    %al,(%eax)
    721c:	08 00                	or     %al,(%eax)
    721e:	00 00                	add    %al,(%eax)
    7220:	dc 9e 00 00 08 00    	fcompl 0x80000(%esi)
    7226:	00 00                	add    %al,(%eax)
    7228:	e4 9e                	in     $0x9e,%al
    722a:	00 00                	add    %al,(%eax)
    722c:	08 00                	or     %al,(%eax)
    722e:	00 00                	add    %al,(%eax)
    7230:	ec                   	in     (%dx),%al
    7231:	9e                   	sahf
    7232:	00 00                	add    %al,(%eax)
    7234:	08 00                	or     %al,(%eax)
    7236:	00 00                	add    %al,(%eax)
    7238:	f4                   	hlt
    7239:	9e                   	sahf
    723a:	00 00                	add    %al,(%eax)
    723c:	08 00                	or     %al,(%eax)
    723e:	00 00                	add    %al,(%eax)
    7240:	fc                   	cld
    7241:	9e                   	sahf
    7242:	00 00                	add    %al,(%eax)
    7244:	08 00                	or     %al,(%eax)
    7246:	00 00                	add    %al,(%eax)
    7248:	04 9f                	add    $0x9f,%al
    724a:	00 00                	add    %al,(%eax)
    724c:	08 00                	or     %al,(%eax)
    724e:	00 00                	add    %al,(%eax)
    7250:	18 9f 00 00 08 00    	sbb    %bl,0x80000(%edi)
    7256:	00 00                	add    %al,(%eax)
    7258:	1c 9f                	sbb    $0x9f,%al
    725a:	00 00                	add    %al,(%eax)
    725c:	08 00                	or     %al,(%eax)
    725e:	00 00                	add    %al,(%eax)
    7260:	20 9f 00 00 08 00    	and    %bl,0x80000(%edi)
    7266:	00 00                	add    %al,(%eax)
    7268:	24 9f                	and    $0x9f,%al
    726a:	00 00                	add    %al,(%eax)
    726c:	08 00                	or     %al,(%eax)
    726e:	00 00                	add    %al,(%eax)
    7270:	2c 9f                	sub    $0x9f,%al
    7272:	00 00                	add    %al,(%eax)
    7274:	08 00                	or     %al,(%eax)
    7276:	00 00                	add    %al,(%eax)
    7278:	34 9f                	xor    $0x9f,%al
    727a:	00 00                	add    %al,(%eax)
    727c:	08 00                	or     %al,(%eax)
    727e:	00 00                	add    %al,(%eax)
    7280:	3c 9f                	cmp    $0x9f,%al
    7282:	00 00                	add    %al,(%eax)
    7284:	08 00                	or     %al,(%eax)
    7286:	00 00                	add    %al,(%eax)
    7288:	44                   	inc    %esp
    7289:	9f                   	lahf
    728a:	00 00                	add    %al,(%eax)
    728c:	08 00                	or     %al,(%eax)
    728e:	00 00                	add    %al,(%eax)
    7290:	4c                   	dec    %esp
    7291:	9f                   	lahf
    7292:	00 00                	add    %al,(%eax)
    7294:	08 00                	or     %al,(%eax)
    7296:	00 00                	add    %al,(%eax)
    7298:	54                   	push   %esp
    7299:	9f                   	lahf
    729a:	00 00                	add    %al,(%eax)
    729c:	08 00                	or     %al,(%eax)
    729e:	00 00                	add    %al,(%eax)
    72a0:	5c                   	pop    %esp
    72a1:	9f                   	lahf
    72a2:	00 00                	add    %al,(%eax)
    72a4:	08 00                	or     %al,(%eax)
    72a6:	00 00                	add    %al,(%eax)
    72a8:	04 a0                	add    $0xa0,%al
    72aa:	00 00                	add    %al,(%eax)
    72ac:	08 00                	or     %al,(%eax)
    72ae:	00 00                	add    %al,(%eax)
    72b0:	08 a0 00 00 08 00    	or     %ah,0x80000(%eax)
    72b6:	00 00                	add    %al,(%eax)
    72b8:	1c a0                	sbb    $0xa0,%al
    72ba:	00 00                	add    %al,(%eax)
    72bc:	08 00                	or     %al,(%eax)
	...

Disassembly of section .rodata:

000072c0 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E-0x55f>:
    72c0:	eb 7c                	jmp    733e <memset+0x73e>
    72c2:	ff                   	(bad)
    72c3:	ff 00                	incl   (%eax)
    72c5:	7d ff                	jge    72c6 <memset+0x6c6>
    72c7:	ff 00                	incl   (%eax)
    72c9:	7d ff                	jge    72ca <memset+0x6ca>
    72cb:	ff 00                	incl   (%eax)
    72cd:	7d ff                	jge    72ce <memset+0x6ce>
    72cf:	ff 00                	incl   (%eax)
    72d1:	7d ff                	jge    72d2 <memset+0x6d2>
    72d3:	ff 00                	incl   (%eax)
    72d5:	7d ff                	jge    72d6 <memset+0x6d6>
    72d7:	ff 00                	incl   (%eax)
    72d9:	7d ff                	jge    72da <memset+0x6da>
    72db:	ff 00                	incl   (%eax)
    72dd:	7d ff                	jge    72de <memset+0x6de>
    72df:	ff 00                	incl   (%eax)
    72e1:	7d ff                	jge    72e2 <memset+0x6e2>
    72e3:	ff 00                	incl   (%eax)
    72e5:	7d ff                	jge    72e6 <memset+0x6e6>
    72e7:	ff 00                	incl   (%eax)
    72e9:	7d ff                	jge    72ea <memset+0x6ea>
    72eb:	ff 00                	incl   (%eax)
    72ed:	7d ff                	jge    72ee <memset+0x6ee>
    72ef:	ff 00                	incl   (%eax)
    72f1:	7d ff                	jge    72f2 <memset+0x6f2>
    72f3:	ff 00                	incl   (%eax)
    72f5:	7d ff                	jge    72f6 <memset+0x6f6>
    72f7:	ff 2c 7d ff ff 00 7d 	ljmp   *0x7d00ffff(,%edi,2)
    72fe:	ff                   	(bad)
    72ff:	ff 00                	incl   (%eax)
    7301:	7d ff                	jge    7302 <memset+0x702>
    7303:	ff 00                	incl   (%eax)
    7305:	7d ff                	jge    7306 <memset+0x706>
    7307:	ff 00                	incl   (%eax)
    7309:	7d ff                	jge    730a <memset+0x70a>
    730b:	ff 00                	incl   (%eax)
    730d:	7d ff                	jge    730e <memset+0x70e>
    730f:	ff 00                	incl   (%eax)
    7311:	7d ff                	jge    7312 <memset+0x712>
    7313:	ff 00                	incl   (%eax)
    7315:	7d ff                	jge    7316 <memset+0x716>
    7317:	ff 00                	incl   (%eax)
    7319:	7d ff                	jge    731a <memset+0x71a>
    731b:	ff 00                	incl   (%eax)
    731d:	7d ff                	jge    731e <memset+0x71e>
    731f:	ff 00                	incl   (%eax)
    7321:	7d ff                	jge    7322 <memset+0x722>
    7323:	ff 00                	incl   (%eax)
    7325:	7d ff                	jge    7326 <memset+0x726>
    7327:	ff 00                	incl   (%eax)
    7329:	7d ff                	jge    732a <memset+0x72a>
    732b:	ff 18                	lcall  *(%eax)
    732d:	7d ff                	jge    732e <memset+0x72e>
    732f:	ff 00                	incl   (%eax)
    7331:	7d ff                	jge    7332 <memset+0x732>
    7333:	ff 00                	incl   (%eax)
    7335:	7d ff                	jge    7336 <memset+0x736>
    7337:	ff 00                	incl   (%eax)
    7339:	7d ff                	jge    733a <memset+0x73a>
    733b:	ff 00                	incl   (%eax)
    733d:	7d ff                	jge    733e <memset+0x73e>
    733f:	ff 00                	incl   (%eax)
    7341:	7d ff                	jge    7342 <memset+0x742>
    7343:	ff 00                	incl   (%eax)
    7345:	7d ff                	jge    7346 <memset+0x746>
    7347:	ff 00                	incl   (%eax)
    7349:	7d ff                	jge    734a <memset+0x74a>
    734b:	ff 00                	incl   (%eax)
    734d:	7d ff                	jge    734e <memset+0x74e>
    734f:	ff 00                	incl   (%eax)
    7351:	7d ff                	jge    7352 <memset+0x752>
    7353:	ff 00                	incl   (%eax)
    7355:	7d ff                	jge    7356 <memset+0x756>
    7357:	ff 1f                	lcall  *(%edi)
    7359:	7d ff                	jge    735a <memset+0x75a>
    735b:	ff 00                	incl   (%eax)
    735d:	7d ff                	jge    735e <memset+0x75e>
    735f:	ff 00                	incl   (%eax)
    7361:	7d ff                	jge    7362 <memset+0x762>
    7363:	ff 00                	incl   (%eax)
    7365:	7d ff                	jge    7366 <memset+0x766>
    7367:	ff 00                	incl   (%eax)
    7369:	7d ff                	jge    736a <memset+0x76a>
    736b:	ff 26                	jmp    *(%esi)
    736d:	7d ff                	jge    736e <memset+0x76e>
    736f:	ff 9e 81 ff ff 28    	lcall  *0x28ffff81(%esi)
    7375:	81 ff ff 4f 81 ff    	cmp    $0xff814fff,%edi
    737b:	ff 5c 81 ff          	lcall  *-0x1(%ecx,%eax,4)
    737f:	ff 35 81 ff ff 7e    	push   0x7effff81
    7385:	81 ff ff 8b 81 ff    	cmp    $0xff818bff,%edi
    738b:	ff 64 81 ff          	jmp    *-0x1(%ecx,%eax,4)
    738f:	ff 93 81 ff ff 42    	call   *0x42ffff81(%ebx)
    7395:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    739b:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73a1:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73a7:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73ad:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73b3:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73b9:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73bf:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73c5:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73cb:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73d1:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73d7:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73dd:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73e3:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73e9:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73ef:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    73f5:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    73fb:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    7401:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    7407:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    740d:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    7413:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    7419:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    741f:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    7425:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    742b:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    7431:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    7437:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    743d:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    7443:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    7449:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    744f:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    7455:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    745b:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    7461:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    7467:	ff b5 81 ff ff b5    	push   -0x4a00007f(%ebp)
    746d:	81 ff ff b5 81 ff    	cmp    $0xff81b5ff,%edi
    7473:	ff 71 81             	push   -0x7f(%ecx)
    7476:	ff                   	(bad)
    7477:	ff 55 83             	call   *-0x7d(%ebp)
    747a:	ff                   	(bad)
    747b:	ff 72 83             	push   -0x7d(%edx)
    747e:	ff                   	(bad)
    747f:	ff 72 83             	push   -0x7d(%edx)
    7482:	ff                   	(bad)
    7483:	ff 72 83             	push   -0x7d(%edx)
    7486:	ff                   	(bad)
    7487:	ff 72 83             	push   -0x7d(%edx)
    748a:	ff                   	(bad)
    748b:	ff 72 83             	push   -0x7d(%edx)
    748e:	ff                   	(bad)
    748f:	ff 72 83             	push   -0x7d(%edx)
    7492:	ff                   	(bad)
    7493:	ff 72 83             	push   -0x7d(%edx)
    7496:	ff                   	(bad)
    7497:	ff 72 83             	push   -0x7d(%edx)
    749a:	ff                   	(bad)
    749b:	ff 4d 84             	decl   -0x7c(%ebp)
    749e:	ff                   	(bad)
    749f:	ff 5f 84             	lcall  *-0x7c(%edi)
    74a2:	ff                   	(bad)
    74a3:	ff 72 83             	push   -0x7d(%edx)
    74a6:	ff                   	(bad)
    74a7:	ff 72 83             	push   -0x7d(%edx)
    74aa:	ff                   	(bad)
    74ab:	ff 68 84             	ljmp   *-0x7c(%eax)
    74ae:	ff                   	(bad)
    74af:	ff 72 83             	push   -0x7d(%edx)
    74b2:	ff                   	(bad)
    74b3:	ff 72 83             	push   -0x7d(%edx)
    74b6:	ff                   	(bad)
    74b7:	ff 72 83             	push   -0x7d(%edx)
    74ba:	ff                   	(bad)
    74bb:	ff 72 83             	push   -0x7d(%edx)
    74be:	ff                   	(bad)
    74bf:	ff 72 83             	push   -0x7d(%edx)
    74c2:	ff                   	(bad)
    74c3:	ff 72 83             	push   -0x7d(%edx)
    74c6:	ff                   	(bad)
    74c7:	ff 72 83             	push   -0x7d(%edx)
    74ca:	ff                   	(bad)
    74cb:	ff 72 83             	push   -0x7d(%edx)
    74ce:	ff                   	(bad)
    74cf:	ff 72 83             	push   -0x7d(%edx)
    74d2:	ff                   	(bad)
    74d3:	ff 72 83             	push   -0x7d(%edx)
    74d6:	ff                   	(bad)
    74d7:	ff 72 83             	push   -0x7d(%edx)
    74da:	ff                   	(bad)
    74db:	ff 72 83             	push   -0x7d(%edx)
    74de:	ff                   	(bad)
    74df:	ff 72 83             	push   -0x7d(%edx)
    74e2:	ff                   	(bad)
    74e3:	ff 72 83             	push   -0x7d(%edx)
    74e6:	ff                   	(bad)
    74e7:	ff 72 83             	push   -0x7d(%edx)
    74ea:	ff                   	(bad)
    74eb:	ff 72 83             	push   -0x7d(%edx)
    74ee:	ff                   	(bad)
    74ef:	ff 72 83             	push   -0x7d(%edx)
    74f2:	ff                   	(bad)
    74f3:	ff 72 83             	push   -0x7d(%edx)
    74f6:	ff                   	(bad)
    74f7:	ff 72 83             	push   -0x7d(%edx)
    74fa:	ff                   	(bad)
    74fb:	ff 72 83             	push   -0x7d(%edx)
    74fe:	ff                   	(bad)
    74ff:	ff 9b 86 ff ff 72    	lcall  *0x72ffff86(%ebx)
    7505:	83 ff ff             	cmp    $0xffffffff,%edi
    7508:	72 83                	jb     748d <memset+0x88d>
    750a:	ff                   	(bad)
    750b:	ff 72 83             	push   -0x7d(%edx)
    750e:	ff                   	(bad)
    750f:	ff 72 83             	push   -0x7d(%edx)
    7512:	ff                   	(bad)
    7513:	ff 56 84             	call   *-0x7c(%esi)
    7516:	ff                   	(bad)
    7517:	ff                   	ljmp   (bad)
    7518:	eb 8d                	jmp    74a7 <memset+0x8a7>
    751a:	ff                   	(bad)
    751b:	ff                   	(bad)
    751c:	3b 8d ff ff e6 8d    	cmp    -0x72190001(%ebp),%ecx
    7522:	ff                   	(bad)
    7523:	ff                   	(bad)
    7524:	3b 8d ff ff 26 93    	cmp    -0x6cd90001(%ebp),%ecx
    752a:	ff                   	(bad)
    752b:	ff 1d 93 ff ff 21    	lcall  *0x21ffff93
    7531:	93                   	xchg   %eax,%ebx
    7532:	ff                   	(bad)
    7533:	ff 26                	jmp    *(%esi)
    7535:	93                   	xchg   %eax,%ebx
    7536:	ff                   	(bad)
    7537:	ff 58 b1             	lcall  *-0x4f(%eax)
    753a:	ff                   	(bad)
    753b:	ff                   	(bad)
    753c:	f9                   	stc
    753d:	b4 ff                	mov    $0xff,%ah
    753f:	ff                   	(bad)
    7540:	b9 b5 ff ff 3f       	mov    $0x3fffffb5,%ecx
    7545:	b0 ff                	mov    $0xff,%al
    7547:	ff 84 c6 ff ff e2 c6 	incl   -0x391d0001(%esi,%eax,8)
    754e:	ff                   	(bad)
    754f:	ff a2 c6 ff ff c4    	jmp    *-0x3b00003a(%edx)
    7555:	c6                   	(bad)
    7556:	ff                   	(bad)
    7557:	ff b0 ca ff ff 3a    	push   0x3affffca(%eax)
    755d:	ca ff ff             	lret   $0xffff
    7560:	61                   	popa
    7561:	ca ff ff             	lret   $0xffff
    7564:	6e                   	outsb  %ds:(%esi),(%dx)
    7565:	ca ff ff             	lret   $0xffff
    7568:	47                   	inc    %edi
    7569:	ca ff ff             	lret   $0xffff
    756c:	90                   	nop
    756d:	ca ff ff             	lret   $0xffff
    7570:	9d                   	popf
    7571:	ca ff ff             	lret   $0xffff
    7574:	76 ca                	jbe    7540 <memset+0x940>
    7576:	ff                   	(bad)
    7577:	ff a5 ca ff ff 54    	jmp    *0x54ffffca(%ebp)
    757d:	ca ff ff             	lret   $0xffff
    7580:	c7                   	(bad)
    7581:	ca ff ff             	lret   $0xffff
    7584:	c7                   	(bad)
    7585:	ca ff ff             	lret   $0xffff
    7588:	c7                   	(bad)
    7589:	ca ff ff             	lret   $0xffff
    758c:	c7                   	(bad)
    758d:	ca ff ff             	lret   $0xffff
    7590:	c7                   	(bad)
    7591:	ca ff ff             	lret   $0xffff
    7594:	c7                   	(bad)
    7595:	ca ff ff             	lret   $0xffff
    7598:	c7                   	(bad)
    7599:	ca ff ff             	lret   $0xffff
    759c:	c7                   	(bad)
    759d:	ca ff ff             	lret   $0xffff
    75a0:	c7                   	(bad)
    75a1:	ca ff ff             	lret   $0xffff
    75a4:	c7                   	(bad)
    75a5:	ca ff ff             	lret   $0xffff
    75a8:	c7                   	(bad)
    75a9:	ca ff ff             	lret   $0xffff
    75ac:	c7                   	(bad)
    75ad:	ca ff ff             	lret   $0xffff
    75b0:	c7                   	(bad)
    75b1:	ca ff ff             	lret   $0xffff
    75b4:	c7                   	(bad)
    75b5:	ca ff ff             	lret   $0xffff
    75b8:	c7                   	(bad)
    75b9:	ca ff ff             	lret   $0xffff
    75bc:	c7                   	(bad)
    75bd:	ca ff ff             	lret   $0xffff
    75c0:	c7                   	(bad)
    75c1:	ca ff ff             	lret   $0xffff
    75c4:	c7                   	(bad)
    75c5:	ca ff ff             	lret   $0xffff
    75c8:	c7                   	(bad)
    75c9:	ca ff ff             	lret   $0xffff
    75cc:	c7                   	(bad)
    75cd:	ca ff ff             	lret   $0xffff
    75d0:	c7                   	(bad)
    75d1:	ca ff ff             	lret   $0xffff
    75d4:	c7                   	(bad)
    75d5:	ca ff ff             	lret   $0xffff
    75d8:	c7                   	(bad)
    75d9:	ca ff ff             	lret   $0xffff
    75dc:	c7                   	(bad)
    75dd:	ca ff ff             	lret   $0xffff
    75e0:	c7                   	(bad)
    75e1:	ca ff ff             	lret   $0xffff
    75e4:	c7                   	(bad)
    75e5:	ca ff ff             	lret   $0xffff
    75e8:	c7                   	(bad)
    75e9:	ca ff ff             	lret   $0xffff
    75ec:	c7                   	(bad)
    75ed:	ca ff ff             	lret   $0xffff
    75f0:	c7                   	(bad)
    75f1:	ca ff ff             	lret   $0xffff
    75f4:	c7                   	(bad)
    75f5:	ca ff ff             	lret   $0xffff
    75f8:	c7                   	(bad)
    75f9:	ca ff ff             	lret   $0xffff
    75fc:	c7                   	(bad)
    75fd:	ca ff ff             	lret   $0xffff
    7600:	c7                   	(bad)
    7601:	ca ff ff             	lret   $0xffff
    7604:	c7                   	(bad)
    7605:	ca ff ff             	lret   $0xffff
    7608:	c7                   	(bad)
    7609:	ca ff ff             	lret   $0xffff
    760c:	c7                   	(bad)
    760d:	ca ff ff             	lret   $0xffff
    7610:	c7                   	(bad)
    7611:	ca ff ff             	lret   $0xffff
    7614:	c7                   	(bad)
    7615:	ca ff ff             	lret   $0xffff
    7618:	c7                   	(bad)
    7619:	ca ff ff             	lret   $0xffff
    761c:	c7                   	(bad)
    761d:	ca ff ff             	lret   $0xffff
    7620:	c7                   	(bad)
    7621:	ca ff ff             	lret   $0xffff
    7624:	c7                   	(bad)
    7625:	ca ff ff             	lret   $0xffff
    7628:	c7                   	(bad)
    7629:	ca ff ff             	lret   $0xffff
    762c:	c7                   	(bad)
    762d:	ca ff ff             	lret   $0xffff
    7630:	c7                   	(bad)
    7631:	ca ff ff             	lret   $0xffff
    7634:	c7                   	(bad)
    7635:	ca ff ff             	lret   $0xffff
    7638:	c7                   	(bad)
    7639:	ca ff ff             	lret   $0xffff
    763c:	c7                   	(bad)
    763d:	ca ff ff             	lret   $0xffff
    7640:	c7                   	(bad)
    7641:	ca ff ff             	lret   $0xffff
    7644:	c7                   	(bad)
    7645:	ca ff ff             	lret   $0xffff
    7648:	c7                   	(bad)
    7649:	ca ff ff             	lret   $0xffff
    764c:	c7                   	(bad)
    764d:	ca ff ff             	lret   $0xffff
    7650:	c7                   	(bad)
    7651:	ca ff ff             	lret   $0xffff
    7654:	c7                   	(bad)
    7655:	ca ff ff             	lret   $0xffff
    7658:	c7                   	(bad)
    7659:	ca ff ff             	lret   $0xffff
    765c:	83 ca ff             	or     $0xffffffff,%edx
    765f:	ff 53 65             	call   *0x65(%ebx)
    7662:	74 4c                	je     76b0 <memset+0xab0>
    7664:	6f                   	outsl  %ds:(%esi),(%dx)
    7665:	67 67 65 72 45       	addr16 addr16 gs jb 76af <memset+0xaaf>
    766a:	72 72                	jb     76de <memset+0xade>
    766c:	6f                   	outsl  %ds:(%esi),(%dx)
    766d:	72 4e                	jb     76bd <memset+0xabd>
    766f:	6f                   	outsl  %ds:(%esi),(%dx)
    7670:	6e                   	outsb  %ds:(%esi),(%dx)
    7671:	65 53                	gs push %ebx
    7673:	6f                   	outsl  %ds:(%esi),(%dx)
    7674:	6d                   	insl   (%dx),%es:(%edi)
    7675:	65 20 20             	and    %ah,%gs:(%eax)
    7678:	20 20                	and    %ah,(%eax)
    767a:	57                   	push   %edi
    767b:	41                   	inc    %ecx
    767c:	52                   	push   %edx
    767d:	4e                   	dec    %esi
    767e:	49                   	dec    %ecx
    767f:	4e                   	dec    %esi
    7680:	46                   	inc    %esi
    7681:	4f                   	dec    %edi
    7682:	53                   	push   %ebx
    7683:	79 73                	jns    76f8 <memset+0xaf8>
    7685:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    7688:	6c                   	insb   (%dx),%es:(%edi)
    7689:	46                   	inc    %esi
    768a:	61                   	popa
    768b:	69 6c 65 64 71 77 65 	imul   $0x72657771,0x64(%ebp,%eiz,2),%ebp
    7692:	72 
    7693:	74 79                	je     770e <memset+0xb0e>
    7695:	75 69                	jne    7700 <memset+0xb00>
    7697:	6f                   	outsl  %ds:(%esi),(%dx)
    7698:	70 79                	jo     7713 <memset+0xb13>
    769a:	78 63                	js     76ff <memset+0xaff>
    769c:	76 62                	jbe    7700 <memset+0xb00>
    769e:	6e                   	outsb  %ds:(%esi),(%dx)
    769f:	6d                   	insl   (%dx),%es:(%edi)
    76a0:	61                   	popa
    76a1:	73 64                	jae    7707 <memset+0xb07>
    76a3:	66 67 68 6a 6b       	addr16 pushw $0x6b6a
    76a8:	6c                   	insb   (%dx),%es:(%edi)
    76a9:	31 32                	xor    %esi,(%edx)
    76ab:	33 34 35 36 37 38 39 	xor    0x39383736(,%esi,1),%esi
    76b2:	6b 65 79 62          	imul   $0x62,0x79(%ebp),%esp
    76b6:	6f                   	outsl  %ds:(%esi),(%dx)
    76b7:	61                   	popa
    76b8:	72 64                	jb     771e <memset+0xb1e>
    76ba:	2f                   	das
    76bb:	73 72                	jae    772f <memset+0xb2f>
    76bd:	63 2f                	arpl   %ebp,(%edi)
    76bf:	70 73                	jo     7734 <memset+0xb34>
    76c1:	2e 72 73             	jb,pn  7737 <memset+0xb37>
    76c4:	6b 65 79 62          	imul   $0x62,0x79(%ebp),%esp
    76c8:	6f                   	outsl  %ds:(%esi),(%dx)
    76c9:	61                   	popa
    76ca:	72 64                	jb     7730 <memset+0xb30>
    76cc:	2f                   	das
    76cd:	73 72                	jae    7741 <memset+0xb41>
    76cf:	63 2f                	arpl   %ebp,(%edi)
    76d1:	6d                   	insl   (%dx),%es:(%edi)
    76d2:	61                   	popa
    76d3:	69 6e 2e 72 73 44 72 	imul   $0x72447372,0x2e(%esi),%ebp
    76da:	69 76 65 72 20 69 73 	imul   $0x73692072,0x65(%esi),%esi
    76e1:	20 63 6f             	and    %ah,0x6f(%ebx)
    76e4:	6e                   	outsb  %ds:(%esi),(%dx)
    76e5:	66 69 67 75 72 65    	imul   $0x6572,0x75(%edi),%sp
    76eb:	64 2e 20 49 72       	fs and %cl,%cs:0x72(%ecx)
    76f0:	71 20                	jno    7712 <memset+0xb12>
    76f2:	54                   	push   %esp
    76f3:	61                   	popa
    76f4:	73 6b                	jae    7761 <memset+0xb61>
    76f6:	3a 20                	cmp    (%eax),%ah
    76f8:	69 6e 64 65 78 20 6f 	imul   $0x6f207865,0x64(%esi),%ebp
    76ff:	75 74                	jne    7775 <memset+0xb75>
    7701:	20 6f 66             	and    %ch,0x66(%edi)
    7704:	20 62 6f             	and    %ah,0x6f(%edx)
    7707:	75 6e                	jne    7777 <memset+0xb77>
    7709:	64 73 3a             	fs jae 7746 <memset+0xb46>
    770c:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
    7710:	20 6c 65 6e          	and    %ch,0x6e(%ebp,%eiz,2)
    7714:	20 69 73             	and    %ch,0x73(%ecx)
    7717:	20 6b 65             	and    %ch,0x65(%ebx)
    771a:	79 62                	jns    777e <memset+0xb7e>
    771c:	6f                   	outsl  %ds:(%esi),(%dx)
    771d:	61                   	popa
    771e:	72 64                	jb     7784 <memset+0xb84>
    7720:	63 61 70             	arpl   %esp,0x70(%ecx)
    7723:	61                   	popa
    7724:	63 69 74             	arpl   %ebp,0x74(%ecx)
    7727:	79 4e                	jns    7777 <memset+0xb77>
    7729:	6f                   	outsl  %ds:(%esi),(%dx)
    772a:	4d                   	dec    %ebp
    772b:	65 6d                	gs insl (%dx),%es:(%edi)
    772d:	6f                   	outsl  %ds:(%esi),(%dx)
    772e:	72 79                	jb     77a9 <memset+0xba9>
    7730:	4b                   	dec    %ebx
    7731:	65 79 62             	gs jns 7796 <memset+0xb96>
    7734:	72 64                	jb     779a <memset+0xb9a>
    7736:	20 69 72             	and    %ch,0x72(%ecx)
    7739:	71 20                	jno    775b <memset+0xb5b>
    773b:	74 61                	je     779e <memset+0xb9e>
    773d:	73 6b                	jae    77aa <memset+0xbaa>
    773f:	46                   	inc    %esi
    7740:	61                   	popa
    7741:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    7748:	20 
    7749:	72 65                	jb     77b0 <memset+0xbb0>
    774b:	61                   	popa
    774c:	64 20 73 63          	and    %dh,%fs:0x63(%ebx)
    7750:	61                   	popa
    7751:	6e                   	outsb  %ds:(%esi),(%dx)
    7752:	20 63 6f             	and    %ah,0x6f(%ebx)
    7755:	64 65 6b 65 79 20    	fs imul $0x20,%gs:0x79(%ebp),%esp
    775b:	72 65                	jb     77c2 <memset+0xbc2>
    775d:	61                   	popa
    775e:	64 3a 20             	cmp    %fs:(%eax),%ah
    7761:	69 72 71 20 71 75 65 	imul   $0x65757120,0x71(%edx),%esi
    7768:	75 65                	jne    77cf <memset+0xbcf>
    776a:	20 69 73             	and    %ch,0x73(%ecx)
    776d:	20 65 78             	and    %ah,0x78(%ebp)
    7770:	69 74 46 61 69 6c 65 	imul   $0x64656c69,0x61(%esi,%eax,2),%esi
    7777:	64 
    7778:	20 69 6e             	and    %ch,0x6e(%ecx)
    777b:	69 74 3a 20 63 61 70 	imul   $0x61706163,0x20(%edx,%edi,1),%esi
    7782:	61 
    7783:	63 69 74             	arpl   %ebp,0x74(%ecx)
    7786:	79 20                	jns    77a8 <memset+0xba8>
    7788:	6f                   	outsl  %ds:(%esi),(%dx)
    7789:	76 65                	jbe    77f0 <memset+0xbf0>
    778b:	72 66                	jb     77f3 <memset+0xbf3>
    778d:	6c                   	insb   (%dx),%es:(%edi)
    778e:	6f                   	outsl  %ds:(%esi),(%dx)
    778f:	77 2f                	ja     77c0 <memset+0xbc0>
    7791:	68 6f 6d 65 2f       	push   $0x2f656d6f
    7796:	50                   	push   %eax
    7797:	61                   	popa
    7798:	76 61                	jbe    77fb <memset+0xbfb>
    779a:	6c                   	insb   (%dx),%es:(%edi)
    779b:	2f                   	das
    779c:	2e 72 75             	jb,pn  7814 <memset+0xc14>
    779f:	73 74                	jae    7815 <memset+0xc15>
    77a1:	75 70                	jne    7813 <memset+0xc13>
    77a3:	2f                   	das
    77a4:	74 6f                	je     7815 <memset+0xc15>
    77a6:	6f                   	outsl  %ds:(%esi),(%dx)
    77a7:	6c                   	insb   (%dx),%es:(%edi)
    77a8:	63 68 61             	arpl   %ebp,0x61(%eax)
    77ab:	69 6e 73 2f 6e 69 67 	imul   $0x67696e2f,0x73(%esi),%ebp
    77b2:	68 74 6c 79 2d       	push   $0x2d796c74
    77b7:	69 36 38 36 2d 75    	imul   $0x752d3638,(%esi),%esi
    77bd:	6e                   	outsb  %ds:(%esi),(%dx)
    77be:	6b 6e 6f 77          	imul   $0x77,0x6f(%esi),%ebp
    77c2:	6e                   	outsb  %ds:(%esi),(%dx)
    77c3:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
    77c8:	78 2d                	js     77f7 <memset+0xbf7>
    77ca:	67 6e                	outsb  %ds:(%si),(%dx)
    77cc:	75 2f                	jne    77fd <memset+0xbfd>
    77ce:	6c                   	insb   (%dx),%es:(%edi)
    77cf:	69 62 2f 72 75 73 74 	imul   $0x74737572,0x2f(%edx),%esp
    77d6:	6c                   	insb   (%dx),%es:(%edi)
    77d7:	69 62 2f 73 72 63 2f 	imul   $0x2f637273,0x2f(%edx),%esp
    77de:	72 75                	jb     7855 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x36>
    77e0:	73 74                	jae    7856 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x37>
    77e2:	2f                   	das
    77e3:	6c                   	insb   (%dx),%es:(%edi)
    77e4:	69 62 72 61 72 79 2f 	imul   $0x2f797261,0x72(%edx),%esp
    77eb:	61                   	popa
    77ec:	6c                   	insb   (%dx),%es:(%edi)
    77ed:	6c                   	insb   (%dx),%es:(%edi)
    77ee:	6f                   	outsl  %ds:(%esi),(%dx)
    77ef:	63 2f                	arpl   %ebp,(%edi)
    77f1:	73 72                	jae    7865 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x46>
    77f3:	63 2f                	arpl   %ebp,(%edi)
    77f5:	61                   	popa
    77f6:	6c                   	insb   (%dx),%es:(%edi)
    77f7:	6c                   	insb   (%dx),%es:(%edi)
    77f8:	6f                   	outsl  %ds:(%esi),(%dx)
    77f9:	63 2e                	arpl   %ebp,(%esi)
    77fb:	72 73                	jb     7870 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x51>
    77fd:	6d                   	insl   (%dx),%es:(%edi)
    77fe:	65 6d                	gs insl (%dx),%es:(%edi)
    7800:	6f                   	outsl  %ds:(%esi),(%dx)
    7801:	72 79                	jb     787c <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x5d>
    7803:	20 61 6c             	and    %ah,0x6c(%ecx)
    7806:	6c                   	insb   (%dx),%es:(%edi)
    7807:	6f                   	outsl  %ds:(%esi),(%dx)
    7808:	63 61 74             	arpl   %esp,0x74(%ecx)
    780b:	69 6f 6e 20 6f 66 20 	imul   $0x20666f20,0x6e(%edi),%ebp
    7812:	20 62 79             	and    %ah,0x79(%edx)
    7815:	74 65                	je     787c <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x5d>
    7817:	73 20                	jae    7839 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x1a>
    7819:	66 61                	popaw
    781b:	69 6c 65 64    	imul   $0x7007000,0x64(%ebp,%eiz,2),%ebp
    7822:	 

0000781f <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E>:
    781f:	00 70 00             	add    %dh,0x0(%eax)
    7822:	07                   	pop    %es
    7823:	00 2d 01 01 01 02    	add    %ch,0x2010101
    7829:	01 02                	add    %eax,(%edx)
    782b:	01 01                	add    %eax,(%ecx)
    782d:	48                   	dec    %eax
    782e:	0b 30                	or     (%eax),%esi
    7830:	15 10 01 65 07       	adc    $0x7650110,%eax
    7835:	02 06                	add    (%esi),%al
    7837:	02 02                	add    (%edx),%al
    7839:	01 04 23             	add    %eax,(%ebx,%eiz,1)
    783c:	01 1e                	add    %ebx,(%esi)
    783e:	1b 5b 0b             	sbb    0xb(%ebx),%ebx
    7841:	3a 09                	cmp    (%ecx),%cl
    7843:	09 01                	or     %eax,(%ecx)
    7845:	18 04 01             	sbb    %al,(%ecx,%eax,1)
    7848:	09 01                	or     %eax,(%ecx)
    784a:	03 01                	add    (%ecx),%eax
    784c:	05 2b 03 3b 09       	add    $0x93b032b,%eax
    7851:	2a 18                	sub    (%eax),%bl
    7853:	01 20                	add    %esp,(%eax)
    7855:	37                   	aaa
    7856:	01 01                	add    %eax,(%ecx)
    7858:	01 04 08             	add    %eax,(%eax,%ecx,1)
    785b:	04 01                	add    $0x1,%al
    785d:	03 07                	add    (%edi),%eax
    785f:	0a 02                	or     (%edx),%al
    7861:	1d 01 3a 01 01       	sbb    $0x1013a01,%eax
    7866:	01 02                	add    %eax,(%edx)
    7868:	04 08                	add    $0x8,%al
    786a:	01 09                	add    %ecx,(%ecx)
    786c:	01 0a                	add    %ecx,(%edx)
    786e:	02 1a                	add    (%edx),%bl
    7870:	01 02                	add    %eax,(%edx)
    7872:	02 39                	add    (%ecx),%bh
    7874:	01 04 02             	add    %eax,(%edx,%eax,1)
    7877:	04 02                	add    $0x2,%al
    7879:	02 03                	add    (%ebx),%al
    787b:	03 01                	add    (%ecx),%eax
    787d:	1e                   	push   %ds
    787e:	02 03                	add    (%ebx),%al
    7880:	01 0b                	add    %ecx,(%ebx)
    7882:	02 39                	add    (%ecx),%bh
    7884:	01 04 05 01 02 04 01 	add    %eax,0x1040201(,%eax,1)
    788b:	14 02                	adc    $0x2,%al
    788d:	16                   	push   %ss
    788e:	06                   	push   %es
    788f:	01 01                	add    %eax,(%ecx)
    7891:	3a 01                	cmp    (%ecx),%al
    7893:	01 02                	add    %eax,(%edx)
    7895:	01 04 08             	add    %eax,(%eax,%ecx,1)
    7898:	01 07                	add    %eax,(%edi)
    789a:	03 0a                	add    (%edx),%ecx
    789c:	02 1e                	add    (%esi),%bl
    789e:	01 3b                	add    %edi,(%ebx)
    78a0:	01 01                	add    %eax,(%ecx)
    78a2:	01 0c 01             	add    %ecx,(%ecx,%eax,1)
    78a5:	09 01                	or     %eax,(%ecx)
    78a7:	28 01                	sub    %al,(%ecx)
    78a9:	03 01                	add    (%ecx),%eax
    78ab:	37                   	aaa
    78ac:	01 01                	add    %eax,(%ecx)
    78ae:	03 05 03 01 04 07    	add    0x7040103,%eax
    78b4:	02 0b                	add    (%ebx),%cl
    78b6:	02 1d 01 3a 01 02    	add    0x2013a01,%bl
    78bc:	02 01                	add    (%ecx),%al
    78be:	01 03                	add    %eax,(%ebx)
    78c0:	03 01                	add    (%ecx),%eax
    78c2:	04 07                	add    $0x7,%al
    78c4:	02 0b                	add    (%ebx),%cl
    78c6:	02 1c 02             	add    (%edx,%eax,1),%bl
    78c9:	39 02                	cmp    %eax,(%edx)
    78cb:	01 01                	add    %eax,(%ecx)
    78cd:	02 04 08             	add    (%eax,%ecx,1),%al
    78d0:	01 09                	add    %ecx,(%ecx)
    78d2:	01 0a                	add    %ecx,(%edx)
    78d4:	02 1d 01 48 01 04    	add    0x4014801,%bl
    78da:	01 02                	add    %eax,(%edx)
    78dc:	03 01                	add    (%ecx),%eax
    78de:	01 08                	add    %ecx,(%eax)
    78e0:	01 51 01             	add    %edx,0x1(%ecx)
    78e3:	02 07                	add    (%edi),%al
    78e5:	0c 08                	or     $0x8,%al
    78e7:	62 01                	bound  %eax,(%ecx)
    78e9:	02 09                	add    (%ecx),%cl
    78eb:	0b 07                	or     (%edi),%eax
    78ed:	49                   	dec    %ecx
    78ee:	02 1b                	add    (%ebx),%bl
    78f0:	01 01                	add    %eax,(%ecx)
    78f2:	01 01                	add    %eax,(%ecx)
    78f4:	01 37                	add    %esi,(%edi)
    78f6:	0e                   	push   %cs
    78f7:	01 05 01 02 05 0b    	add    %eax,0xb050201
    78fd:	01 24 09             	add    %esp,(%ecx,%ecx,1)
    7900:	01 66 04             	add    %esp,0x4(%esi)
    7903:	01 06                	add    %eax,(%esi)
    7905:	01 02                	add    %eax,(%edx)
    7907:	02 02                	add    (%edx),%al
    7909:	19 02                	sbb    %eax,(%edx)
    790b:	04 03                	add    $0x3,%al
    790d:	10 04 0d 01 02 02 06 	adc    %al,0x6020201(,%ecx,1)
    7914:	01 0f                	add    %ecx,(%edi)
    7916:	01 00                	add    %eax,(%eax)
    7918:	03 00                	add    (%eax),%eax
    791a:	04 1c                	add    $0x1c,%al
    791c:	03 1d 02 1e 02 40    	add    0x40021e02,%ebx
    7922:	02 01                	add    (%ecx),%al
    7924:	07                   	pop    %es
    7925:	08 01                	or     %al,(%ecx)
    7927:	02 0b                	add    (%ebx),%cl
    7929:	09 01                	or     %eax,(%ecx)
    792b:	2d 03 01 01 75       	sub    $0x75010103,%eax
    7930:	02 22                	add    (%edx),%ah
    7932:	01 76 03             	add    %esi,0x3(%esi)
    7935:	04 02                	add    $0x2,%al
    7937:	09 01                	or     %eax,(%ecx)
    7939:	06                   	push   %es
    793a:	03 db                	add    %ebx,%ebx
    793c:	02 02                	add    (%edx),%al
    793e:	01 3a                	add    %edi,(%edx)
    7940:	01 01                	add    %eax,(%ecx)
    7942:	07                   	pop    %es
    7943:	01 01                	add    %eax,(%ecx)
    7945:	01 01                	add    %eax,(%ecx)
    7947:	02 08                	add    (%eax),%cl
    7949:	06                   	push   %es
    794a:	0a 02                	or     (%edx),%al
    794c:	01 30                	add    %esi,(%eax)
    794e:	1f                   	pop    %ds
    794f:	31 04 30             	xor    %eax,(%eax,%esi,1)
    7952:	0a 04 03             	or     (%ebx,%eax,1),%al
    7955:	26 09 0c 02          	or     %ecx,%es:(%edx,%eax,1)
    7959:	20 04 02             	and    %al,(%edx,%eax,1)
    795c:	06                   	push   %es
    795d:	38 01                	cmp    %al,(%ecx)
    795f:	01 02                	add    %eax,(%edx)
    7961:	03 01                	add    (%ecx),%eax
    7963:	01 05 38 08 02 02    	add    %eax,0x2020838
    7969:	98                   	cwtl
    796a:	03 01                	add    (%ecx),%eax
    796c:	0d 01 07 04 01       	or     $0x1040701,%eax
    7971:	06                   	push   %es
    7972:	01 03                	add    %eax,(%ebx)
    7974:	02 c6                	add    %dh,%al
    7976:	40                   	inc    %eax
    7977:	00 01                	add    %al,(%ecx)
    7979:	c3                   	ret
    797a:	21 00                	and    %eax,(%eax)
    797c:	03 8d 01 60 20 00    	add    0x206001(%ebp),%ecx
    7982:	06                   	push   %es
    7983:	69 02 00 04 01 0a    	imul   $0xa010400,(%edx),%eax
    7989:	20 02                	and    %al,(%edx)
    798b:	50                   	push   %eax
    798c:	02 00                	add    (%eax),%al
    798e:	01 03                	add    %eax,(%ebx)
    7990:	01 04 01             	add    %eax,(%ecx,%eax,1)
    7993:	19 02                	sbb    %eax,(%edx)
    7995:	05 01 97 02 1a       	add    $0x1a029701,%eax
    799a:	12 0d 01 26 08 19    	adc    0x19082601,%cl
    79a0:	0b 01                	or     (%ecx),%eax
    79a2:	01 2c 03             	add    %ebp,(%ebx,%eax,1)
    79a5:	30 01                	xor    %al,(%ecx)
    79a7:	02 04 02             	add    (%edx,%eax,1),%al
    79aa:	02 02                	add    (%edx),%al
    79ac:	01 24 01             	add    %esp,(%ecx,%eax,1)
    79af:	43                   	inc    %ebx
    79b0:	06                   	push   %es
    79b1:	02 02                	add    (%edx),%al
    79b3:	02 02                	add    (%edx),%al
    79b5:	0c 01                	or     $0x1,%al
    79b7:	08 01                	or     %al,(%ecx)
    79b9:	2f                   	das
    79ba:	01 33                	add    %esi,(%ebx)
    79bc:	01 01                	add    %eax,(%ecx)
    79be:	03 02                	add    (%edx),%eax
    79c0:	02 05 02 01 01 2a    	add    0x2a010102,%al
    79c6:	02 08                	add    (%eax),%cl
    79c8:	01 ee                	add    %ebp,%esi
    79ca:	01 02                	add    %eax,(%edx)
    79cc:	01 04 01             	add    %eax,(%ecx,%eax,1)
    79cf:	00 01                	add    %al,(%ecx)
    79d1:	00 10                	add    %dl,(%eax)
    79d3:	10 10                	adc    %dl,(%eax)
    79d5:	00 02                	add    %al,(%edx)
    79d7:	00 01                	add    %al,(%ecx)
    79d9:	e2 01                	loop   79dc <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x1bd>
    79db:	95                   	xchg   %eax,%ebp
    79dc:	05 00 03 01 02       	add    $0x2010300,%eax
    79e1:	05 04 28 03 04       	add    $0x4032804,%eax
    79e6:	01 a5 02 00 04 41    	add    %esp,0x41040002(%ebp)
    79ec:	05 00 02 4f 04       	add    $0x44f0200,%eax
    79f1:	46                   	inc    %esi
    79f2:	0b 31                	or     (%ecx),%esi
    79f4:	04 7b                	add    $0x7b,%al
    79f6:	01 36                	add    %esi,(%esi)
    79f8:	0f 29 01             	movaps %xmm0,(%ecx)
    79fb:	02 02                	add    (%edx),%al
    79fd:	0a 03                	or     (%ebx),%al
    79ff:	31 04 02             	xor    %eax,(%edx,%eax,1)
    7a02:	02 07                	add    (%edi),%al
    7a04:	01 3d 03 24 05 01    	add    %edi,0x1052403
    7a0a:	08 3e                	or     %bh,(%esi)
    7a0c:	01 0c 02             	add    %ecx,(%edx,%eax,1)
    7a0f:	34 09                	xor    $0x9,%al
    7a11:	01 01                	add    %eax,(%ecx)
    7a13:	08 04 02             	or     %al,(%edx,%eax,1)
    7a16:	01 5f 03             	add    %ebx,0x3(%edi)
    7a19:	02 04 06             	add    (%esi,%eax,1),%al
    7a1c:	01 02                	add    %eax,(%edx)
    7a1e:	01 9d 01 03 08 15    	add    %ebx,0x15080301(%ebp)
    7a24:	02 39                	add    (%ecx),%bh
    7a26:	02 01                	add    (%ecx),%al
    7a28:	01 01                	add    %eax,(%ecx)
    7a2a:	01 0c 01             	add    %ecx,(%ecx,%eax,1)
    7a2d:	09 01                	or     %eax,(%ecx)
    7a2f:	0e                   	push   %cs
    7a30:	07                   	pop    %es
    7a31:	03 05 43 01 02 06    	add    0x6020143,%eax
    7a37:	01 01                	add    %eax,(%ecx)
    7a39:	02 01                	add    (%ecx),%al
    7a3b:	01 03                	add    %eax,(%ebx)
    7a3d:	04 03                	add    $0x3,%al
    7a3f:	01 01                	add    %eax,(%ecx)
    7a41:	0e                   	push   %cs
    7a42:	02 55 08             	add    0x8(%ebp),%dl
    7a45:	02 03                	add    (%ebx),%al
    7a47:	01 01                	add    %eax,(%ecx)
    7a49:	17                   	pop    %ss
    7a4a:	01 51 01             	add    %edx,0x1(%ecx)
    7a4d:	02 06                	add    (%esi),%al
    7a4f:	01 01                	add    %eax,(%ecx)
    7a51:	02 01                	add    (%ecx),%al
    7a53:	01 02                	add    %eax,(%edx)
    7a55:	01 02                	add    %eax,(%edx)
    7a57:	eb 01                	jmp    7a5a <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x23b>
    7a59:	02 04 06             	add    (%esi,%eax,1),%al
    7a5c:	02 01                	add    (%ecx),%al
    7a5e:	02 1b                	add    (%ebx),%bl
    7a60:	02 55 08             	add    0x8(%ebp),%dl
    7a63:	02 01                	add    (%ecx),%al
    7a65:	01 02                	add    %eax,(%edx)
    7a67:	6a 01                	push   $0x1
    7a69:	01 01                	add    %eax,(%ecx)
    7a6b:	02 08                	add    (%eax),%cl
    7a6d:	65 01 01             	add    %eax,%gs:(%ecx)
    7a70:	01 02                	add    %eax,(%edx)
    7a72:	04 01                	add    $0x1,%al
    7a74:	05 00 09 01 02       	add    $0x2010900,%eax
    7a79:	f5                   	cmc
    7a7a:	01 0a                	add    %ecx,(%edx)
    7a7c:	04 04                	add    $0x4,%al
    7a7e:	01 90 04 02 02 04    	add    %edx,0x4020204(%eax)
    7a84:	01 20                	add    %esp,(%eax)
    7a86:	0a 28                	or     (%eax),%ch
    7a88:	06                   	push   %es
    7a89:	02 04 08             	add    (%eax,%ecx,1),%al
    7a8c:	01 09                	add    %ecx,(%ecx)
    7a8e:	06                   	push   %es
    7a8f:	02 03                	add    (%ebx),%al
    7a91:	2e 0d 01 02 00 07    	cs or  $0x7000201,%eax
    7a97:	01 06                	add    %eax,(%esi)
    7a99:	01 01                	add    %eax,(%ecx)
    7a9b:	52                   	push   %edx
    7a9c:	16                   	push   %ss
    7a9d:	02 07                	add    (%edi),%al
    7a9f:	01 02                	add    %eax,(%edx)
    7aa1:	01 02                	add    %eax,(%edx)
    7aa3:	7a 06                	jp     7aab <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x28c>
    7aa5:	03 01                	add    (%ecx),%eax
    7aa7:	01 02                	add    %eax,(%edx)
    7aa9:	01 07                	add    %eax,(%edi)
    7aab:	01 01                	add    %eax,(%ecx)
    7aad:	48                   	dec    %eax
    7aae:	02 03                	add    (%ebx),%al
    7ab0:	01 01                	add    %eax,(%ecx)
    7ab2:	01 00                	add    %eax,(%eax)
    7ab4:	02 0b                	add    (%ebx),%cl
    7ab6:	02 34 05 05 03 17 01 	add    0x1170305(,%eax,1),%dh
    7abd:	00 01                	add    %al,(%ecx)
    7abf:	06                   	push   %es
    7ac0:	0f 00 0c 03          	str    (%ebx,%eax,1)
    7ac4:	03 00                	add    (%eax),%eax
    7ac6:	05 3b 07 00 01       	add    $0x100073b,%eax
    7acb:	3f                   	aas
    7acc:	04 51                	add    $0x51,%al
    7ace:	01 0b                	add    %ecx,(%ebx)
    7ad0:	02 00                	add    (%eax),%al
    7ad2:	02 00                	add    (%eax),%al
    7ad4:	2e 02 17             	add    %cs:(%edi),%dl
    7ad7:	00 05 03 06 08 08    	add    %al,0x8080603
    7add:	02 07                	add    (%edi),%al
    7adf:	1e                   	push   %ds
    7ae0:	04 94                	add    $0x94,%al
    7ae2:	03 00                	add    (%eax),%eax
    7ae4:	37                   	aaa
    7ae5:	04 32                	add    $0x32,%al
    7ae7:	08 01                	or     %al,(%ecx)
    7ae9:	0e                   	push   %cs
    7aea:	01 16                	add    %edx,(%esi)
    7aec:	05 01 0f 00 07       	add    $0x7000f01,%eax
    7af1:	01 11                	add    %edx,(%ecx)
    7af3:	02 07                	add    (%edi),%al
    7af5:	01 02                	add    %eax,(%edx)
    7af7:	01 05 64 01 a0 07    	add    %eax,0x7a00164
    7afd:	00 01                	add    %al,(%ecx)
    7aff:	3d 04 00 04 fe       	cmp    $0xfe040004,%eax
    7b04:	02 00                	add    (%eax),%al
    7b06:	07                   	pop    %es
    7b07:	6d                   	insl   (%dx),%es:(%edi)
    7b08:	07                   	pop    %es
    7b09:	00 60 80             	add    %ah,-0x80(%eax)
    7b0c:	f0 00 29             	lock add %ch,(%ecx)
    7b0f:	30 31                	xor    %dh,(%ecx)
    7b11:	32 33                	xor    (%ebx),%dh
    7b13:	34 35                	xor    $0x35,%al
    7b15:	36 37                	ss aaa
    7b17:	38 39                	cmp    %bh,(%ecx)
    7b19:	61                   	popa
    7b1a:	62 63 64             	bound  %esp,0x64(%ebx)
    7b1d:	65 66 72 61          	gs data16 jb 7b82 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x363>
    7b21:	6e                   	outsb  %ds:(%esi),(%dx)
    7b22:	67 65 20 65 6e       	and    %ah,%gs:0x6e(%di)
    7b27:	64 20 69 6e          	and    %ch,%fs:0x6e(%ecx)
    7b2b:	64 65 78 20          	fs gs js 7b4f <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x330>
    7b2f:	65 76 65             	gs jbe 7b97 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x378>
    7b32:	6e                   	outsb  %ds:(%esi),(%dx)
    7b33:	74 20                	je     7b55 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x336>
    7b35:	68 61 6e 64 6c       	push   $0x6c646e61
    7b3a:	65 3a 20             	cmp    %gs:(%eax),%ah
    7b3d:	30 78 49             	xor    %bh,0x49(%eax)
    7b40:	6e                   	outsb  %ds:(%esi),(%dx)
    7b41:	76 61                	jbe    7ba4 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x385>
    7b43:	6c                   	insb   (%dx),%es:(%edi)
    7b44:	69 64 51 75 65 75 65 	imul   $0x4b657565,0x75(%ecx,%edx,2),%esp
    7b4b:	4b 
    7b4c:	69 6e 64 4d 6f 64 75 	imul   $0x75646f4d,0x64(%esi),%ebp
    7b53:	6c                   	insb   (%dx),%es:(%edi)
    7b54:	65 49                	gs dec %ecx
    7b56:	73 4e                	jae    7ba6 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x387>
    7b58:	6f                   	outsl  %ds:(%esi),(%dx)
    7b59:	74 46                	je     7ba1 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x382>
    7b5b:	6f                   	outsl  %ds:(%esi),(%dx)
    7b5c:	75 6e                	jne    7bcc <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3ad>
    7b5e:	64 3a 63 61          	cmp    %fs:0x61(%ebx),%ah
    7b62:	6c                   	insb   (%dx),%es:(%edi)
    7b63:	6c                   	insb   (%dx),%es:(%edi)
    7b64:	65 64 20 60 4f       	gs and %ah,%fs:0x4f(%eax)
    7b69:	70 74                	jo     7bdf <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3c0>
    7b6b:	69 6f 6e 3a 3a 75 6e 	imul   $0x6e753a3a,0x6e(%edi),%ebp
    7b72:	77 72                	ja     7be6 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3c7>
    7b74:	61                   	popa
    7b75:	70 28                	jo     7b9f <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x380>
    7b77:	29 60 20             	sub    %esp,0x20(%eax)
    7b7a:	6f                   	outsl  %ds:(%esi),(%dx)
    7b7b:	6e                   	outsb  %ds:(%esi),(%dx)
    7b7c:	20 61 20             	and    %ah,0x20(%ecx)
    7b7f:	60                   	pusha
    7b80:	4e                   	dec    %esi
    7b81:	6f                   	outsl  %ds:(%esi),(%dx)
    7b82:	6e                   	outsb  %ds:(%esi),(%dx)
    7b83:	65 60                	gs pusha
    7b85:	20 76 61             	and    %dh,0x61(%esi)
    7b88:	6c                   	insb   (%dx),%es:(%edi)
    7b89:	75 65                	jne    7bf0 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3d1>
    7b8b:	70 61                	jo     7bee <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3cf>
    7b8d:	6e                   	outsb  %ds:(%esi),(%dx)
    7b8e:	69 63 6b 65 64 20 61 	imul   $0x61206465,0x6b(%ebx),%esp
    7b95:	74 20                	je     7bb7 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x398>
    7b97:	3a 0a                	cmp    (%edx),%cl
    7b99:	20 62 75             	and    %ah,0x75(%edx)
    7b9c:	74 20                	je     7bbe <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x39f>
    7b9e:	74 68                	je     7c08 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3e9>
    7ba0:	65 20 69 6e          	and    %ch,%gs:0x6e(%ecx)
    7ba4:	64 65 78 20          	fs gs js 7bc8 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3a9>
    7ba8:	69 73 20 3a 20 20 7b 	imul   $0x7b20203a,0x20(%ebx),%esi
    7baf:	20 2c 20             	and    %ch,(%eax,%eiz,1)
    7bb2:	20 7b 0a             	and    %bh,0xa(%ebx)
    7bb5:	2c 0a                	sub    $0xa,%al
    7bb7:	7d 20                	jge    7bd9 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3ba>
    7bb9:	7d 28                	jge    7be3 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x3c4>
    7bbb:	28 0a                	sub    %cl,(%edx)
    7bbd:	30 78 30             	xor    %bh,0x30(%eax)
    7bc0:	30 30                	xor    %dh,(%eax)
    7bc2:	31 30                	xor    %esi,(%eax)
    7bc4:	32 30                	xor    (%eax),%dh
    7bc6:	33 30                	xor    (%eax),%esi
    7bc8:	34 30                	xor    $0x30,%al
    7bca:	35 30 36 30 37       	xor    $0x37303630,%eax
    7bcf:	30 38                	xor    %bh,(%eax)
    7bd1:	30 39                	xor    %bh,(%ecx)
    7bd3:	31 30                	xor    %esi,(%eax)
    7bd5:	31 31                	xor    %esi,(%ecx)
    7bd7:	31 32                	xor    %esi,(%edx)
    7bd9:	31 33                	xor    %esi,(%ebx)
    7bdb:	31 34 31             	xor    %esi,(%ecx,%esi,1)
    7bde:	35 31 36 31 37       	xor    $0x37313631,%eax
    7be3:	31 38                	xor    %edi,(%eax)
    7be5:	31 39                	xor    %edi,(%ecx)
    7be7:	32 30                	xor    (%eax),%dh
    7be9:	32 31                	xor    (%ecx),%dh
    7beb:	32 32                	xor    (%edx),%dh
    7bed:	32 33                	xor    (%ebx),%dh
    7bef:	32 34 32             	xor    (%edx,%esi,1),%dh
    7bf2:	35 32 36 32 37       	xor    $0x37323632,%eax
    7bf7:	32 38                	xor    (%eax),%bh
    7bf9:	32 39                	xor    (%ecx),%bh
    7bfb:	33 30                	xor    (%eax),%esi
    7bfd:	33 31                	xor    (%ecx),%esi
    7bff:	33 32                	xor    (%edx),%esi
    7c01:	33 33                	xor    (%ebx),%esi
    7c03:	33 34 33             	xor    (%ebx,%esi,1),%esi
    7c06:	35 33 36 33 37       	xor    $0x37333633,%eax
    7c0b:	33 38                	xor    (%eax),%edi
    7c0d:	33 39                	xor    (%ecx),%edi
    7c0f:	34 30                	xor    $0x30,%al
    7c11:	34 31                	xor    $0x31,%al
    7c13:	34 32                	xor    $0x32,%al
    7c15:	34 33                	xor    $0x33,%al
    7c17:	34 34                	xor    $0x34,%al
    7c19:	34 35                	xor    $0x35,%al
    7c1b:	34 36                	xor    $0x36,%al
    7c1d:	34 37                	xor    $0x37,%al
    7c1f:	34 38                	xor    $0x38,%al
    7c21:	34 39                	xor    $0x39,%al
    7c23:	35 30 35 31 35       	xor    $0x35313530,%eax
    7c28:	32 35 33 35 34 35    	xor    0x35343533,%dh
    7c2e:	35 35 36 35 37       	xor    $0x37353635,%eax
    7c33:	35 38 35 39 36       	xor    $0x36393538,%eax
    7c38:	30 36                	xor    %dh,(%esi)
    7c3a:	31 36                	xor    %esi,(%esi)
    7c3c:	32 36                	xor    (%esi),%dh
    7c3e:	33 36                	xor    (%esi),%esi
    7c40:	34 36                	xor    $0x36,%al
    7c42:	35 36 36 36 37       	xor    $0x37363636,%eax
    7c47:	36 38 36             	cmp    %dh,%ss:(%esi)
    7c4a:	39 37                	cmp    %esi,(%edi)
    7c4c:	30 37                	xor    %dh,(%edi)
    7c4e:	31 37                	xor    %esi,(%edi)
    7c50:	32 37                	xor    (%edi),%dh
    7c52:	33 37                	xor    (%edi),%esi
    7c54:	34 37                	xor    $0x37,%al
    7c56:	35 37 36 37 37       	xor    $0x37373637,%eax
    7c5b:	37                   	aaa
    7c5c:	38 37                	cmp    %dh,(%edi)
    7c5e:	39 38                	cmp    %edi,(%eax)
    7c60:	30 38                	xor    %bh,(%eax)
    7c62:	31 38                	xor    %edi,(%eax)
    7c64:	32 38                	xor    (%eax),%bh
    7c66:	33 38                	xor    (%eax),%edi
    7c68:	34 38                	xor    $0x38,%al
    7c6a:	35 38 36 38 37       	xor    $0x37383638,%eax
    7c6f:	38 38                	cmp    %bh,(%eax)
    7c71:	38 39                	cmp    %bh,(%ecx)
    7c73:	39 30                	cmp    %esi,(%eax)
    7c75:	39 31                	cmp    %esi,(%ecx)
    7c77:	39 32                	cmp    %esi,(%edx)
    7c79:	39 33                	cmp    %esi,(%ebx)
    7c7b:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    7c7e:	35 39 36 39 37       	xor    $0x37393639,%eax
    7c83:	39 38                	cmp    %edi,(%eax)
    7c85:	39 39                	cmp    %edi,(%ecx)
    7c87:	2f                   	das
    7c88:	68 6f 6d 65 2f       	push   $0x2f656d6f
    7c8d:	50                   	push   %eax
    7c8e:	61                   	popa
    7c8f:	76 61                	jbe    7cf2 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4d3>
    7c91:	6c                   	insb   (%dx),%es:(%edi)
    7c92:	2f                   	das
    7c93:	2e 72 75             	jb,pn  7d0b <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4ec>
    7c96:	73 74                	jae    7d0c <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4ed>
    7c98:	75 70                	jne    7d0a <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4eb>
    7c9a:	2f                   	das
    7c9b:	74 6f                	je     7d0c <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4ed>
    7c9d:	6f                   	outsl  %ds:(%esi),(%dx)
    7c9e:	6c                   	insb   (%dx),%es:(%edi)
    7c9f:	63 68 61             	arpl   %ebp,0x61(%eax)
    7ca2:	69 6e 73 2f 6e 69 67 	imul   $0x67696e2f,0x73(%esi),%ebp
    7ca9:	68 74 6c 79 2d       	push   $0x2d796c74
    7cae:	69 36 38 36 2d 75    	imul   $0x752d3638,(%esi),%esi
    7cb4:	6e                   	outsb  %ds:(%esi),(%dx)
    7cb5:	6b 6e 6f 77          	imul   $0x77,0x6f(%esi),%ebp
    7cb9:	6e                   	outsb  %ds:(%esi),(%dx)
    7cba:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
    7cbf:	78 2d                	js     7cee <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4cf>
    7cc1:	67 6e                	outsb  %ds:(%si),(%dx)
    7cc3:	75 2f                	jne    7cf4 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4d5>
    7cc5:	6c                   	insb   (%dx),%es:(%edi)
    7cc6:	69 62 2f 72 75 73 74 	imul   $0x74737572,0x2f(%edx),%esp
    7ccd:	6c                   	insb   (%dx),%es:(%edi)
    7cce:	69 62 2f 73 72 63 2f 	imul   $0x2f637273,0x2f(%edx),%esp
    7cd5:	72 75                	jb     7d4c <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x52d>
    7cd7:	73 74                	jae    7d4d <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x52e>
    7cd9:	2f                   	das
    7cda:	6c                   	insb   (%dx),%es:(%edi)
    7cdb:	69 62 72 61 72 79 2f 	imul   $0x2f797261,0x72(%edx),%esp
    7ce2:	63 6f 72             	arpl   %ebp,0x72(%edi)
    7ce5:	65 2f                	gs das
    7ce7:	73 72                	jae    7d5b <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x53c>
    7ce9:	63 2f                	arpl   %ebp,(%edi)
    7ceb:	75 6e                	jne    7d5b <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x53c>
    7ced:	69 63 6f 64 65 2f 70 	imul   $0x702f6564,0x6f(%ebx),%esp
    7cf4:	72 69                	jb     7d5f <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x540>
    7cf6:	6e                   	outsb  %ds:(%esi),(%dx)
    7cf7:	74 61                	je     7d5a <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x53b>
    7cf9:	62 6c 65 2e          	bound  %ebp,0x2e(%ebp,%eiz,2)
    7cfd:	72 73                	jb     7d72 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x553>
    7cff:	00 06                	add    %al,(%esi)
    7d01:	01 01                	add    %eax,(%ecx)
    7d03:	03 01                	add    (%ecx),%eax
    7d05:	04 02                	add    $0x2,%al
    7d07:	05 07 07 02 08       	add    $0x8020707,%eax
    7d0c:	08 09                	or     %cl,(%ecx)
    7d0e:	02 0a                	add    (%edx),%cl
    7d10:	05 0b 02 0e 04       	add    $0x40e020b,%eax
    7d15:	10 01                	adc    %al,(%ecx)
    7d17:	11 02                	adc    %eax,(%edx)
    7d19:	12 05 13 1c 14 01    	adc    0x1141c13,%al
    7d1f:	15 02 17 02 19       	adc    $0x19021702,%eax
    7d24:	0d 1c 05 1d 08       	or     $0x81d051c,%eax
    7d29:	1f                   	pop    %ds
    7d2a:	01 24 01             	add    %esp,(%ecx,%eax,1)
    7d2d:	6a 04                	push   $0x4
    7d2f:	6b 02 af             	imul   $0xffffffaf,(%edx),%eax
    7d32:	03 b1 02 bc 02 cf    	add    -0x30fd43fe(%ecx),%esi
    7d38:	02 d1                	add    %cl,%dl
    7d3a:	02 d4                	add    %ah,%dl
    7d3c:	0c d5                	or     $0xd5,%al
    7d3e:	09 d6                	or     %edx,%esi
    7d40:	02 d7                	add    %bh,%dl
    7d42:	02 da                	add    %dl,%bl
    7d44:	01 e0                	add    %esp,%eax
    7d46:	05 e1 02 e7 04       	add    $0x4e702e1,%eax
    7d4b:	e8 02 ee 20 f0       	call   f0216b52 <_end+0xf020a416>
    7d50:	04 f8                	add    $0xf8,%al
    7d52:	02 fa                	add    %dl,%bh
    7d54:	04 fb                	add    $0xfb,%al
    7d56:	01 0c 27             	add    %ecx,(%edi,%eiz,1)
    7d59:	3b 3e                	cmp    (%esi),%edi
    7d5b:	4e                   	dec    %esi
    7d5c:	4f                   	dec    %edi
    7d5d:	8f                   	(bad)
    7d5e:	9e                   	sahf
    7d5f:	9e                   	sahf
    7d60:	9f                   	lahf
    7d61:	7b 8b                	jnp    7cee <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x4cf>
    7d63:	93                   	xchg   %eax,%ebx
    7d64:	96                   	xchg   %eax,%esi
    7d65:	a2 b2 ba 86 b1       	mov    %al,0xb186bab2
    7d6a:	06                   	push   %es
    7d6b:	07                   	pop    %es
    7d6c:	09 36                	or     %esi,(%esi)
    7d6e:	3d 3e 56 f3 d0       	cmp    $0xd0f3563e,%eax
    7d73:	d1 04 14             	roll   $1,(%esp,%edx,1)
    7d76:	18 36                	sbb    %dh,(%esi)
    7d78:	37                   	aaa
    7d79:	56                   	push   %esi
    7d7a:	57                   	push   %edi
    7d7b:	7f aa                	jg     7d27 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x508>
    7d7d:	ae                   	scas   %es:(%edi),%al
    7d7e:	af                   	scas   %es:(%edi),%eax
    7d7f:	bd 35 e0 12 87       	mov    $0x8712e035,%ebp
    7d84:	89 8e 9e 04 0d 0e    	mov    %ecx,0xe0d049e(%esi)
    7d8a:	11 12                	adc    %edx,(%edx)
    7d8c:	29 31                	sub    %esi,(%ecx)
    7d8e:	34 3a                	xor    $0x3a,%al
    7d90:	45                   	inc    %ebp
    7d91:	46                   	inc    %esi
    7d92:	49                   	dec    %ecx
    7d93:	4a                   	dec    %edx
    7d94:	4e                   	dec    %esi
    7d95:	4f                   	dec    %edi
    7d96:	64 65 8a 8c 8d 8f b6 	fs mov %gs:-0x3c3e4971(%ebp,%ecx,4),%cl
    7d9d:	c1 c3 
    7d9f:	c4                   	(bad)
    7da0:	c6                   	(bad)
    7da1:	cb                   	lret
    7da2:	d6                   	(bad)
    7da3:	5c                   	pop    %esp
    7da4:	b6 b7                	mov    $0xb7,%dh
    7da6:	1b 1c 07             	sbb    (%edi,%eax,1),%ebx
    7da9:	08 0a                	or     %cl,(%edx)
    7dab:	0b 14 17             	or     (%edi,%edx,1),%edx
    7dae:	36 39 3a             	cmp    %edi,%ss:(%edx)
    7db1:	a8 a9                	test   $0xa9,%al
    7db3:	d8 d9                	fcomp  %st(1)
    7db5:	09 37                	or     %esi,(%edi)
    7db7:	90                   	nop
    7db8:	91                   	xchg   %eax,%ecx
    7db9:	a8 07                	test   $0x7,%al
    7dbb:	0a 3b                	or     (%ebx),%bh
    7dbd:	3e 66 69 8f 92 11 6f 	imul   $0xeebf,%ds:0x5f6f1192(%edi),%cx
    7dc4:	5f bf ee 
    7dc7:	ef                   	out    %eax,(%dx)
    7dc8:	5a                   	pop    %edx
    7dc9:	62                   	(bad)
    7dca:	f4                   	hlt
    7dcb:	fc                   	cld
    7dcc:	ff 53 54             	call   *0x54(%ebx)
    7dcf:	9a 9b 2e 2f 27 28 55 	lcall  $0x5528,$0x272f2e9b
    7dd6:	9d                   	popf
    7dd7:	a0 a1 a3 a4 a7       	mov    0xa7a4a3a1,%al
    7ddc:	a8 ad                	test   $0xad,%al
    7dde:	ba bc c4 06 0b       	mov    $0xb06c4bc,%edx
    7de3:	0c 15                	or     $0x15,%al
    7de5:	1d 3a 3f 45 51       	sbb    $0x51453f3a,%eax
    7dea:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
    7deb:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
    7dec:	cc                   	int3
    7ded:	cd a0                	int    $0xa0
    7def:	07                   	pop    %es
    7df0:	19 1a                	sbb    %ebx,(%edx)
    7df2:	22 25 3e 3f e7 ec    	and    0xece73f3e,%ah
    7df8:	ef                   	out    %eax,(%dx)
    7df9:	ff c5                	inc    %ebp
    7dfb:	c6 04 20 23          	movb   $0x23,(%eax,%eiz,1)
    7dff:	25 26 28 33 38       	and    $0x38332826,%eax
    7e04:	3a 48 4a             	cmp    0x4a(%eax),%cl
    7e07:	4c                   	dec    %esp
    7e08:	50                   	push   %eax
    7e09:	53                   	push   %ebx
    7e0a:	55                   	push   %ebp
    7e0b:	56                   	push   %esi
    7e0c:	58                   	pop    %eax
    7e0d:	5a                   	pop    %edx
    7e0e:	5c                   	pop    %esp
    7e0f:	5e                   	pop    %esi
    7e10:	60                   	pusha
    7e11:	63 65 66             	arpl   %esp,0x66(%ebp)
    7e14:	6b 73 78 7d          	imul   $0x7d,0x78(%ebx),%esi
    7e18:	7f 8a                	jg     7da4 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x585>
    7e1a:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    7e1b:	aa                   	stos   %al,%es:(%edi)
    7e1c:	af                   	scas   %es:(%edi),%eax
    7e1d:	b0 c0                	mov    $0xc0,%al
    7e1f:	d0 ae af 6e 6f dd    	shrb   $1,-0x22909151(%esi)
    7e25:	de 93 5e 22 7b 05    	ficoms 0x57b225e(%ebx)
    7e2b:	03 04 2d 03 66 03 01 	add    0x1036603(,%ebp,1),%eax
    7e32:	2f                   	das
    7e33:	2e 80 82 1d 03 31 0f 	addb   $0x1c,%cs:0xf31031d(%edx)
    7e3a:	1c 
    7e3b:	04 24                	add    $0x24,%al
    7e3d:	09 1e                	or     %ebx,(%esi)
    7e3f:	05 2b 05 44 04       	add    $0x444052b,%eax
    7e44:	0e                   	push   %cs
    7e45:	2a 80 aa 06 24 04    	sub    0x42406aa(%eax),%al
    7e4b:	24 04                	and    $0x4,%al
    7e4d:	28 08                	sub    %cl,(%eax)
    7e4f:	34 0b                	xor    $0xb,%al
    7e51:	4e                   	dec    %esi
    7e52:	03 34 0c             	add    (%esp,%ecx,1),%esi
    7e55:	81 37 09 16 0a 08    	xorl   $0x80a1609,(%edi)
    7e5b:	18 3b                	sbb    %bh,(%ebx)
    7e5d:	45                   	inc    %ebp
    7e5e:	39 03                	cmp    %eax,(%ebx)
    7e60:	63 08                	arpl   %ecx,(%eax)
    7e62:	09 30                	or     %esi,(%eax)
    7e64:	16                   	push   %ss
    7e65:	05 21 03 1b 05       	add    $0x51b0321,%eax
    7e6a:	01 40 38             	add    %eax,0x38(%eax)
    7e6d:	04 4b                	add    $0x4b,%al
    7e6f:	05 2f 04 0a 07       	add    $0x70a042f,%eax
    7e74:	09 07                	or     %eax,(%edi)
    7e76:	40                   	inc    %eax
    7e77:	20 27                	and    %ah,(%edi)
    7e79:	04 0c                	add    $0xc,%al
    7e7b:	09 36                	or     %esi,(%esi)
    7e7d:	03 3a                	add    (%edx),%edi
    7e7f:	05 1a 07 04 0c       	add    $0xc04071a,%eax
    7e84:	07                   	pop    %es
    7e85:	50                   	push   %eax
    7e86:	49                   	dec    %ecx
    7e87:	37                   	aaa
    7e88:	33 0d 33 07 2e 08    	xor    0x82e0733,%ecx
    7e8e:	0a 06                	or     (%esi),%al
    7e90:	26 03 1d 08 02 80 d0 	add    %es:0xd0800208,%ebx
    7e97:	52                   	push   %edx
    7e98:	10 03                	adc    %al,(%ebx)
    7e9a:	37                   	aaa
    7e9b:	2c 08                	sub    $0x8,%al
    7e9d:	2a 16                	sub    (%esi),%dl
    7e9f:	1a 26                	sbb    (%esi),%ah
    7ea1:	1c 14                	sbb    $0x14,%al
    7ea3:	17                   	pop    %ss
    7ea4:	09 4e 04             	or     %ecx,0x4(%esi)
    7ea7:	24 09                	and    $0x9,%al
    7ea9:	44                   	inc    %esp
    7eaa:	0d 19 07 0a 06       	or     $0x60a0719,%eax
    7eaf:	48                   	dec    %eax
    7eb0:	08 27                	or     %ah,(%edi)
    7eb2:	09 75 0b             	or     %esi,0xb(%ebp)
    7eb5:	42                   	inc    %edx
    7eb6:	3e 2a 06             	sub    %ds:(%esi),%al
    7eb9:	3b 05 0a 06 51 06    	cmp    0x651060a,%eax
    7ebf:	01 05 10 03 05 0b    	add    %eax,0xb050310
    7ec5:	59                   	pop    %ecx
    7ec6:	08 02                	or     %al,(%edx)
    7ec8:	1d 62 1e 48 08       	sbb    $0x8481e62,%eax
    7ecd:	0a 80 a6 5e 22 45    	or     0x45225ea6(%eax),%al
    7ed3:	0b 0a                	or     (%edx),%ecx
    7ed5:	06                   	push   %es
    7ed6:	0d 13 3a 06 0a       	or     $0xa063a13,%eax
    7edb:	06                   	push   %es
    7edc:	14 1c                	adc    $0x1c,%al
    7ede:	2c 04                	sub    $0x4,%al
    7ee0:	17                   	pop    %ss
    7ee1:	80 b9 3c 64 53 0c 48 	cmpb   $0x48,0xc53643c(%ecx)
    7ee8:	09 0a                	or     %ecx,(%edx)
    7eea:	46                   	inc    %esi
    7eeb:	45                   	inc    %ebp
    7eec:	1b 48 08             	sbb    0x8(%eax),%ecx
    7eef:	53                   	push   %ebx
    7ef0:	0d 49 07 0a 80       	or     $0x800a0749,%eax
    7ef5:	b6 22                	mov    $0x22,%dh
    7ef7:	0e                   	push   %cs
    7ef8:	0a 06                	or     (%esi),%al
    7efa:	46                   	inc    %esi
    7efb:	0a 1d 03 47 49 37    	or     0x37494703,%bl
    7f01:	03 0e                	add    (%esi),%ecx
    7f03:	08 0a                	or     %cl,(%edx)
    7f05:	06                   	push   %es
    7f06:	39 07                	cmp    %eax,(%edi)
    7f08:	0a 81 36 19 07 3b    	or     0x3b071936(%ecx),%al
    7f0e:	03 1d 55 01 0f 32    	add    0x320f0155,%ebx
    7f14:	0d 83 9b 66 75       	or     $0x75669b83,%eax
    7f19:	0b 80 c4 8a 4c 63    	or     0x634c8ac4(%eax),%eax
    7f1f:	0d 84 30 10 16       	or     $0x16103084,%eax
    7f24:	0a 8f 9b 05 82 47    	or     0x4782059b(%edi),%cl
    7f2a:	9a b9 3a 86 c6 82 39 	lcall  $0x3982,$0xc6863ab9
    7f31:	07                   	pop    %es
    7f32:	2a 04 5c             	sub    (%esp,%ebx,2),%al
    7f35:	06                   	push   %es
    7f36:	26 0a 46 0a          	or     %es:0xa(%esi),%al
    7f3a:	28 05 13 81 b0 3a    	sub    %al,0x3ab08113
    7f40:	80 c6 5b             	add    $0x5b,%dh
    7f43:	65 4b                	gs dec %ebx
    7f45:	04 39                	add    $0x39,%al
    7f47:	07                   	pop    %es
    7f48:	11 40 05             	adc    %eax,0x5(%eax)
    7f4b:	0b 02                	or     (%edx),%eax
    7f4d:	0e                   	push   %cs
    7f4e:	97                   	xchg   %eax,%edi
    7f4f:	f8                   	clc
    7f50:	08 84 d6 29 0a a2 e7 	or     %al,-0x185df5d7(%esi,%edx,8)
    7f57:	81 33 0f 01 1d 06    	xorl   $0x61d010f,(%ebx)
    7f5d:	0e                   	push   %cs
    7f5e:	04 08                	add    $0x8,%al
    7f60:	81 8c 89 04 6b 05 0d 	orl    $0x10070903,0xd056b04(%ecx,%ecx,4)
    7f67:	03 09 07 10 
    7f6b:	8f                   	(bad)
    7f6c:	60                   	pusha
    7f6d:	80 fa 06             	cmp    $0x6,%dl
    7f70:	81 b4 4c 47 09 74 3c 	xorl   $0x730af680,0x3c740947(%esp,%ecx,2)
    7f77:	80 f6 0a 73 
    7f7b:	08 70 15             	or     %dh,0x15(%eax)
    7f7e:	46                   	inc    %esi
    7f7f:	7a 14                	jp     7f95 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x776>
    7f81:	0c 14                	or     $0x14,%al
    7f83:	0c 57                	or     $0x57,%al
    7f85:	09 19                	or     %ebx,(%ecx)
    7f87:	80 87 81 47 03 85 42 	addb   $0x42,-0x7afcb87f(%edi)
    7f8e:	0f 15 84 50 1f 06 06 	unpckhps -0x7ff9f9e1(%eax,%edx,2),%xmm0
    7f95:	80 
    7f96:	d5 2b                	aad    $0x2b
    7f98:	05 3e 21 01 70       	add    $0x7001213e,%eax
    7f9d:	2d 03 1a 04 02       	sub    $0x2041a03,%eax
    7fa2:	81 40 1f 11 3a 05 01 	addl   $0x1053a11,0x1f(%eax)
    7fa9:	81 d0 2a 80 d6 2b    	adc    $0x2bd6802a,%eax
    7faf:	04 01                	add    $0x1,%al
    7fb1:	81 e0 80 f7 29 4c    	and    $0x4c29f780,%eax
    7fb7:	04 0a                	add    $0xa,%al
    7fb9:	04 02                	add    $0x2,%al
    7fbb:	83 11 44             	adcl   $0x44,(%ecx)
    7fbe:	4c                   	dec    %esp
    7fbf:	3d 80 c2 3c 06       	cmp    $0x63cc280,%eax
    7fc4:	01 04 55 05 1b 34 02 	add    %eax,0x2341b05(,%edx,2)
    7fcb:	81 0e 2c 04 64 0c    	orl    $0xc64042c,(%esi)
    7fd1:	56                   	push   %esi
    7fd2:	0a 80 ae 38 1d 0d    	or     0xd1d38ae(%eax),%al
    7fd8:	2c 04                	sub    $0x4,%al
    7fda:	09 07                	or     %eax,(%edi)
    7fdc:	02 0e                	add    (%esi),%cl
    7fde:	06                   	push   %es
    7fdf:	80 9a 83 d8 04 11 03 	sbbb   $0x3,0x1104d883(%edx)
    7fe6:	0d 03 77 04 5f       	or     $0x5f047703,%eax
    7feb:	06                   	push   %es
    7fec:	0c 04                	or     $0x4,%al
    7fee:	01 0f                	add    %ecx,(%edi)
    7ff0:	0c 04                	or     $0x4,%al
    7ff2:	38 08                	cmp    %cl,(%eax)
    7ff4:	0a 06                	or     (%esi),%al
    7ff6:	28 08                	sub    %cl,(%eax)
    7ff8:	2c 04                	sub    $0x4,%al
    7ffa:	02 3e                	add    (%esi),%bh
    7ffc:	81 54 0c 1d 03 0a 05 	adcl   $0x38050a03,0x1d(%esp,%ecx,1)
    8003:	38 
    8004:	07                   	pop    %es
    8005:	1c 06                	sbb    $0x6,%al
    8007:	09 07                	or     %eax,(%edi)
    8009:	80 fa 84             	cmp    $0x84,%dl
    800c:	06                   	push   %es
    800d:	00 01                	add    %al,(%ecx)
    800f:	03 05 05 06 06 02    	add    0x2060605,%eax
    8015:	07                   	pop    %es
    8016:	06                   	push   %es
    8017:	08 07                	or     %al,(%edi)
    8019:	09 11                	or     %edx,(%ecx)
    801b:	0a 1c 0b             	or     (%ebx,%ecx,1),%bl
    801e:	19 0c 1a             	sbb    %ecx,(%edx,%ebx,1)
    8021:	0d 10 0e 0c 0f       	or     $0xf0c0e10,%eax
    8026:	04 10                	add    $0x10,%al
    8028:	03 12                	add    (%edx),%edx
    802a:	12 13                	adc    (%ebx),%dl
    802c:	09 16                	or     %edx,(%esi)
    802e:	01 17                	add    %edx,(%edi)
    8030:	04 18                	add    $0x18,%al
    8032:	01 19                	add    %ebx,(%ecx)
    8034:	03 1a                	add    (%edx),%ebx
    8036:	07                   	pop    %es
    8037:	1b 01                	sbb    (%ecx),%eax
    8039:	1c 02                	sbb    $0x2,%al
    803b:	1f                   	pop    %ds
    803c:	16                   	push   %ss
    803d:	20 03                	and    %al,(%ebx)
    803f:	2b 03                	sub    (%ebx),%eax
    8041:	2d 0b 2e 01 30       	sub    $0x30012e0b,%eax
    8046:	04 31                	add    $0x31,%al
    8048:	02 32                	add    (%edx),%dh
    804a:	01 a7 04 a9 02 aa    	add    %esp,-0x55fd56fc(%edi)
    8050:	04 ab                	add    $0xab,%al
    8052:	08 fa                	or     %bh,%dl
    8054:	02 fb                	add    %bl,%bh
    8056:	05 fd 02 fe 03       	add    $0x3fe02fd,%eax
    805b:	ff 09                	decl   (%ecx)
    805d:	ad                   	lods   %ds:(%esi),%eax
    805e:	78 79                	js     80d9 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x8ba>
    8060:	8b 8d a2 30 57 58    	mov    0x585730a2(%ebp),%ecx
    8066:	8b 8c 90 1c dd 0e 0f 	mov    0xf0edd1c(%eax,%edx,4),%ecx
    806d:	4b                   	dec    %ebx
    806e:	4c                   	dec    %esp
    806f:	fb                   	sti
    8070:	fc                   	cld
    8071:	2e 2f                	cs das
    8073:	3f                   	aas
    8074:	5c                   	pop    %esp
    8075:	5d                   	pop    %ebp
    8076:	5f                   	pop    %edi
    8077:	e2 84                	loop   7ffd <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x7de>
    8079:	8d 8e 91 92 a9 b1    	lea    -0x4e566d6f(%esi),%ecx
    807f:	ba bb c5 c6 c9       	mov    $0xc9c6c5bb,%edx
    8084:	ca de e4             	lret   $0xe4de
    8087:	e5 ff                	in     $0xff,%eax
    8089:	00 04 11             	add    %al,(%ecx,%edx,1)
    808c:	12 29                	adc    (%ecx),%ch
    808e:	31 34 37             	xor    %esi,(%edi,%esi,1)
    8091:	3a 3b                	cmp    (%ebx),%bh
    8093:	3d 49 4a 5d 84       	cmp    $0x845d4a49,%eax
    8098:	8e 92 a9 b1 b4 ba    	mov    -0x454b4e57(%edx),%ss
    809e:	bb c6 ca ce cf       	mov    $0xcfcecac6,%ebx
    80a3:	e4 e5                	in     $0xe5,%al
    80a5:	00 04 0d 0e 11 12 29 	add    %al,0x2912110e(,%ecx,1)
    80ac:	31 34 3a             	xor    %esi,(%edx,%edi,1)
    80af:	3b 45 46             	cmp    0x46(%ebp),%eax
    80b2:	49                   	dec    %ecx
    80b3:	4a                   	dec    %edx
    80b4:	5e                   	pop    %esi
    80b5:	64 65 84 91 9b 9d c9 	fs test %dl,%gs:-0x31366265(%ecx)
    80bc:	ce 
    80bd:	cf                   	iret
    80be:	0d 11 29 3a 3b       	or     $0x3b3a2911,%eax
    80c3:	45                   	inc    %ebp
    80c4:	49                   	dec    %ecx
    80c5:	57                   	push   %edi
    80c6:	5b                   	pop    %ebx
    80c7:	5c                   	pop    %esp
    80c8:	5e                   	pop    %esi
    80c9:	5f                   	pop    %edi
    80ca:	64 65 8d 91 a9 b4 ba 	fs lea %gs:-0x44454b57(%ecx),%edx
    80d1:	bb 
    80d2:	c5 c9 df e4          	vpandn %xmm4,%xmm6,%xmm4
    80d6:	e5 f0                	in     $0xf0,%eax
    80d8:	0d 11 45 49 64       	or     $0x64494511,%eax
    80dd:	65 80 84 b2 bc be bf 	addb   $0xd7,%gs:-0x2a404144(%edx,%esi,4)
    80e4:	d5 d7 
    80e6:	f0 f1                	lock int1
    80e8:	83 85 8b a4 a6 be bf 	addl   $0xffffffbf,-0x41595b75(%ebp)
    80ef:	c5 c7 cf             	(bad)
    80f2:	da db                	fcmovu %st(3),%st
    80f4:	48                   	dec    %eax
    80f5:	98                   	cwtl
    80f6:	bd cd c6 ce cf       	mov    $0xcfcec6cd,%ebp
    80fb:	49                   	dec    %ecx
    80fc:	4e                   	dec    %esi
    80fd:	4f                   	dec    %edi
    80fe:	57                   	push   %edi
    80ff:	59                   	pop    %ecx
    8100:	5e                   	pop    %esi
    8101:	5f                   	pop    %edi
    8102:	89 8e 8f b1 b6 b7    	mov    %ecx,-0x48494e71(%esi)
    8108:	bf c1 c6 c7 d7       	mov    $0xd7c7c6c1,%edi
    810d:	11 16                	adc    %edx,(%esi)
    810f:	17                   	pop    %ss
    8110:	5b                   	pop    %ebx
    8111:	5c                   	pop    %esp
    8112:	f6 f7                	div    %bh
    8114:	fe                   	(bad)
    8115:	ff 80 6d 71 de df    	incl   -0x20218e93(%eax)
    811b:	0e                   	push   %cs
    811c:	1f                   	pop    %ds
    811d:	6e                   	outsb  %ds:(%esi),(%dx)
    811e:	6f                   	outsl  %ds:(%esi),(%dx)
    811f:	1c 1d                	sbb    $0x1d,%al
    8121:	5f                   	pop    %edi
    8122:	7d 7e                	jge    81a2 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x983>
    8124:	ae                   	scas   %es:(%edi),%al
    8125:	af                   	scas   %es:(%edi),%eax
    8126:	4d                   	dec    %ebp
    8127:	bb bc 16 17 1e       	mov    $0x1e1716bc,%ebx
    812c:	1f                   	pop    %ds
    812d:	46                   	inc    %esi
    812e:	47                   	inc    %edi
    812f:	4e                   	dec    %esi
    8130:	4f                   	dec    %edi
    8131:	58                   	pop    %eax
    8132:	5a                   	pop    %edx
    8133:	5c                   	pop    %esp
    8134:	5e                   	pop    %esi
    8135:	7e 7f                	jle    81b6 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x997>
    8137:	b5 c5                	mov    $0xc5,%ch
    8139:	d4 d5                	aam    $0xd5
    813b:	dc f0                	fdiv   %st,%st(0)
    813d:	f1                   	int1
    813e:	f5                   	cmc
    813f:	72 73                	jb     81b4 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x995>
    8141:	8f                   	(bad)
    8142:	74 75                	je     81b9 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x99a>
    8144:	96                   	xchg   %eax,%esi
    8145:	26 2e 2f             	es cs das
    8148:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
    8149:	af                   	scas   %es:(%edi),%eax
    814a:	b7 bf                	mov    $0xbf,%bh
    814c:	c7                   	(bad)
    814d:	cf                   	iret
    814e:	d7                   	xlat   %ds:(%ebx)
    814f:	df 9a 00 40 97 98    	fistps -0x6768c000(%edx)
    8155:	30 8f 1f ce cf d2    	xor    %cl,-0x2d3031e1(%edi)
    815b:	d4 ce                	aam    $0xce
    815d:	ff 4e 4f             	decl   0x4f(%esi)
    8160:	5a                   	pop    %edx
    8161:	5b                   	pop    %ebx
    8162:	07                   	pop    %es
    8163:	08 0f                	or     %cl,(%edi)
    8165:	10 27                	adc    %ah,(%edi)
    8167:	2f                   	das
    8168:	ee                   	out    %al,(%dx)
    8169:	ef                   	out    %eax,(%dx)
    816a:	6e                   	outsb  %ds:(%esi),(%dx)
    816b:	6f                   	outsl  %ds:(%esi),(%dx)
    816c:	37                   	aaa
    816d:	3d 3f 42 45 90       	cmp    $0x9045423f,%eax
    8172:	91                   	xchg   %eax,%ecx
    8173:	53                   	push   %ebx
    8174:	67 75 c8             	addr16 jne 813f <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0x920>
    8177:	c9                   	leave
    8178:	d0 d1                	rcl    $1,%cl
    817a:	d8 d9                	fcomp  %st(1)
    817c:	e7 fe                	out    %eax,$0xfe
    817e:	ff 00                	incl   (%eax)
    8180:	20 5f 22             	and    %bl,0x22(%edi)
    8183:	82 df 04             	sbb    $0x4,%bh
    8186:	82 44 08 1b 04       	addb   $0x4,0x1b(%eax,%ecx,1)
    818b:	06                   	push   %es
    818c:	11 81 ac 0e 80 ab    	adc    %eax,-0x547ff154(%ecx)
    8192:	05 1f 08 81 1c       	add    $0x1c81081f,%eax
    8197:	03 19                	add    (%ecx),%ebx
    8199:	08 01                	or     %al,(%ecx)
    819b:	04 2f                	add    $0x2f,%al
    819d:	04 34                	add    $0x34,%al
    819f:	04 07                	add    $0x7,%al
    81a1:	03 01                	add    (%ecx),%eax
    81a3:	07                   	pop    %es
    81a4:	06                   	push   %es
    81a5:	07                   	pop    %es
    81a6:	11 0a                	adc    %ecx,(%edx)
    81a8:	50                   	push   %eax
    81a9:	0f 12 07             	movlps (%edi),%xmm0
    81ac:	55                   	push   %ebp
    81ad:	07                   	pop    %es
    81ae:	03 04 1c             	add    (%esp,%ebx,1),%eax
    81b1:	0a 09                	or     (%ecx),%cl
    81b3:	03 08                	add    (%eax),%ecx
    81b5:	03 07                	add    (%edi),%eax
    81b7:	03 02                	add    (%edx),%eax
    81b9:	03 03                	add    (%ebx),%eax
    81bb:	03 0c 04             	add    (%esp,%eax,1),%ecx
    81be:	05 03 0b 06 01       	add    $0x1060b03,%eax
    81c3:	0e                   	push   %cs
    81c4:	15 05 4e 07 1b       	adc    $0x1b074e05,%eax
    81c9:	07                   	pop    %es
    81ca:	57                   	push   %edi
    81cb:	07                   	pop    %es
    81cc:	02 06                	add    (%esi),%al
    81ce:	17                   	pop    %ss
    81cf:	0c 50                	or     $0x50,%al
    81d1:	04 43                	add    $0x43,%al
    81d3:	03 2d 03 01 04 11    	add    0x11040103,%ebp
    81d9:	06                   	push   %es
    81da:	0f 0c                	(bad)
    81dc:	3a 04 1d 25 5f 20 6d 	cmp    0x6d205f25(,%ebx,1),%al
    81e3:	04 6a                	add    $0x6a,%al
    81e5:	25 80 c8 05 82       	and    $0x8205c880,%eax
    81ea:	b0 03                	mov    $0x3,%al
    81ec:	1a 06                	sbb    (%esi),%al
    81ee:	82 fd 03             	cmp    $0x3,%ch
    81f1:	59                   	pop    %ecx
    81f2:	07                   	pop    %es
    81f3:	16                   	push   %ss
    81f4:	09 18                	or     %ebx,(%eax)
    81f6:	09 14 0c             	or     %edx,(%esp,%ecx,1)
    81f9:	14 0c                	adc    $0xc,%al
    81fb:	6a 06                	push   $0x6
    81fd:	0a 06                	or     (%esi),%al
    81ff:	1a 06                	sbb    (%esi),%al
    8201:	59                   	pop    %ecx
    8202:	07                   	pop    %es
    8203:	2b 05 46 0a 2c 04    	sub    0x42c0a46,%eax
    8209:	0c 04                	or     $0x4,%al
    820b:	01 03                	add    %eax,(%ebx)
    820d:	31 0b                	xor    %ecx,(%ebx)
    820f:	2c 04                	sub    $0x4,%al
    8211:	1a 06                	sbb    (%esi),%al
    8213:	0b 03                	or     (%ebx),%eax
    8215:	80 ac 06 0a 06 2f 31 	subb   $0x80,0x312f060a(%esi,%eax,1)
    821c:	80 
    821d:	f4                   	hlt
    821e:	08 3c 03             	or     %bh,(%ebx,%eax,1)
    8221:	0f 03 3e             	lsl    (%esi),%edi
    8224:	05 38 08 2b 05       	add    $0x52b0838,%eax
    8229:	82 ff 11             	cmp    $0x11,%bh
    822c:	18 08                	sbb    %cl,(%eax)
    822e:	2f                   	das
    822f:	11 2d 03 21 0f 21    	adc    %ebp,0x210f2103
    8235:	0f 80 8c 04 82 9a    	jo     9a8286c7 <_end+0x9a81bf8b>
    823b:	16                   	push   %ss
    823c:	0b 15 88 94 05 2f    	or     0x2f059488,%edx
    8242:	05 3b 07 02 0e       	add    $0xe02073b,%eax
    8247:	18 09                	sbb    %cl,(%ecx)
    8249:	80 be 22 74 0c 80 d6 	cmpb   $0xd6,-0x7ff38bde(%esi)
    8250:	1a 81 10 05 80 e1    	sbb    -0x1e7ffaf0(%ecx),%al
    8256:	09 f2                	or     %esi,%edx
    8258:	9e                   	sahf
    8259:	03 37                	add    (%edi),%esi
    825b:	09 81 5c 14 80 b8    	or     %eax,-0x477feba4(%ecx)
    8261:	08 80 dd 15 3b 03    	or     %al,0x33b15dd(%eax)
    8267:	0a 06                	or     (%esi),%al
    8269:	38 08                	cmp    %cl,(%eax)
    826b:	46                   	inc    %esi
    826c:	08 0c 06             	or     %cl,(%esi,%eax,1)
    826f:	74 0b                	je     827c <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0xa5d>
    8271:	1e                   	push   %ds
    8272:	03 5a 04             	add    0x4(%edx),%ebx
    8275:	59                   	pop    %ecx
    8276:	09 80 83 18 1c 0a    	or     %eax,0xa1c1883(%eax)
    827c:	16                   	push   %ss
    827d:	09 4c 04 80          	or     %ecx,-0x80(%esp,%eax,1)
    8281:	8a 06                	mov    (%esi),%al
    8283:	ab                   	stos   %eax,%es:(%edi)
    8284:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    8285:	0c 17                	or     $0x17,%al
    8287:	04 31                	add    $0x31,%al
    8289:	a1 04 81 da 26       	mov    0x26da8104,%eax
    828e:	07                   	pop    %es
    828f:	0c 05                	or     $0x5,%al
    8291:	05 80 a6 10 81       	add    $0x8110a680,%eax
    8296:	f5                   	cmc
    8297:	07                   	pop    %es
    8298:	01 20                	add    %esp,(%eax)
    829a:	2a 06                	sub    (%esi),%al
    829c:	4c                   	dec    %esp
    829d:	04 80                	add    $0x80,%al
    829f:	8d 04 80             	lea    (%eax,%eax,4),%eax
    82a2:	be 03 1b 03 0f       	mov    $0xf031b03,%esi
    82a7:	0d 6d 65 6d 6f       	or     $0x6f6d656d,%eax
    82ac:	72 79                	jb     8327 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1f>
    82ae:	20 61 6c             	and    %ah,0x6c(%ecx)
    82b1:	6c                   	insb   (%dx),%es:(%edi)
    82b2:	6f                   	outsl  %ds:(%esi),(%dx)
    82b3:	63 61 74             	arpl   %esp,0x74(%ecx)
    82b6:	69 6f 6e 20 66 61 69 	imul   $0x69616620,0x6e(%edi),%ebp
    82bd:	6c                   	insb   (%dx),%es:(%edi)
    82be:	65 64 20 6f 75       	gs and %ch,%fs:0x75(%edi)
    82c3:	74 20                	je     82e5 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0xac6>
    82c5:	6f                   	outsl  %ds:(%esi),(%dx)
    82c6:	66 20 72 61          	data16 and %dh,0x61(%edx)
    82ca:	6e                   	outsb  %ds:(%esi),(%dx)
    82cb:	67 65 20 66 6f       	and    %ah,%gs:0x6f(%bp)
    82d0:	72 20                	jb     82f2 <_ZN4core7unicode12unicode_data15grapheme_extend7OFFSETS17h7edeb73cc7a23a15E+0xad3>
    82d2:	73 6c                	jae    8340 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x38>
    82d4:	69 63 65 20 6f 66 20 	imul   $0x20666f20,0x65(%ebx),%esp
    82db:	6c                   	insb   (%dx),%es:(%edi)
    82dc:	65 6e                	outsb  %gs:(%esi),(%dx)
    82de:	67 74 68             	addr16 je 8349 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x41>
    82e1:	20 73 6c             	and    %dh,0x6c(%ebx)
    82e4:	69 63 65 20 69 6e 64 	imul   $0x646e6920,0x65(%ebx),%esp
    82eb:	65 78 20             	gs js  830e <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x6>
    82ee:	73 74                	jae    8364 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x5c>
    82f0:	61                   	popa
    82f1:	72 74                	jb     8367 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x5f>
    82f3:	73 20                	jae    8315 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xd>
    82f5:	61                   	popa
    82f6:	74 20                	je     8318 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x10>
    82f8:	20 62 75             	and    %ah,0x75(%edx)
    82fb:	74 20                	je     831d <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x15>
    82fd:	65 6e                	outsb  %gs:(%esi),(%dx)
    82ff:	64 73 20             	fs jae 8322 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1a>
    8302:	61                   	popa
    8303:	74 20                	je     8325 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1d>
    8305:	00 00                	add    %al,(%eax)
	...

00008308 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE>:
    8308:	00 03                	add    %al,(%ebx)
    830a:	00 00                	add    %al,(%eax)
    830c:	83 04 20 00          	addl   $0x0,(%eax,%eiz,1)
    8310:	91                   	xchg   %eax,%ecx
    8311:	05 60 00 5d 13       	add    $0x135d0060,%eax
    8316:	a0 00 12 17 20       	mov    0x20171200,%al
    831b:	1f                   	pop    %ds
    831c:	0c 20                	or     $0x20,%al
    831e:	60                   	pusha
    831f:	1f                   	pop    %ds
    8320:	ef                   	out    %eax,(%dx)
    8321:	2c 20                	sub    $0x20,%al
    8323:	2b 2a                	sub    (%edx),%ebp
    8325:	30 a0 2b 6f a6 60    	xor    %ah,0x60a66f2b(%eax)
    832b:	2c 02                	sub    $0x2,%al
    832d:	a8 e0                	test   $0xe0,%al
    832f:	2c 1e                	sub    $0x1e,%al
    8331:	fb                   	sti
    8332:	e0 2d                	loopne 8361 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x59>
    8334:	00 fe                	add    %bh,%dh
    8336:	20 36                	and    %dh,(%esi)
    8338:	9e                   	sahf
    8339:	ff 60 36             	jmp    *0x36(%eax)
    833c:	fd                   	std
    833d:	01 e1                	add    %esp,%ecx
    833f:	36 01 0a             	add    %ecx,%ss:(%edx)
    8342:	21 37                	and    %esi,(%edi)
    8344:	24 0d                	and    $0xd,%al
    8346:	e1 37                	loope  837f <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x77>
    8348:	ab                   	stos   %eax,%es:(%edi)
    8349:	0e                   	push   %cs
    834a:	61                   	popa
    834b:	39 2f                	cmp    %ebp,(%edi)
    834d:	18 e1                	sbb    %ah,%cl
    834f:	39 30                	cmp    %esi,(%eax)
    8351:	1c e1                	sbb    $0xe1,%al
    8353:	4a                   	dec    %edx
    8354:	f3 1e                	repz push %ds
    8356:	e1 4e                	loope  83a6 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x9e>
    8358:	40                   	inc    %eax
    8359:	34 a1                	xor    $0xa1,%al
    835b:	52                   	push   %edx
    835c:	1e                   	push   %ds
    835d:	61                   	popa
    835e:	e1 53                	loope  83b3 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xab>
    8360:	f0 6a 61             	lock push $0x61
    8363:	54                   	push   %esp
    8364:	4f                   	dec    %edi
    8365:	6f                   	outsl  %ds:(%esi),(%dx)
    8366:	e1 54                	loope  83bc <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xb4>
    8368:	9d                   	popf
    8369:	bc 61 55 00 cf       	mov    $0xcf005561,%esp
    836e:	61                   	popa
    836f:	56                   	push   %esi
    8370:	65 d1 a1 56 00 da 21 	shll   $1,%gs:0x21da0056(%ecx)
    8377:	57                   	push   %edi
    8378:	00 e0                	add    %ah,%al
    837a:	a1 58 ae e2 21       	mov    0x21e2ae58,%eax
    837f:	5a                   	pop    %edx
    8380:	ec                   	in     (%dx),%al
    8381:	e4 e1                	in     $0xe1,%al
    8383:	5b                   	pop    %ebx
    8384:	d0 e8                	shr    $1,%al
    8386:	61                   	popa
    8387:	5c                   	pop    %esp
    8388:	20 00                	and    %al,(%eax)
    838a:	ee                   	out    %al,(%dx)
    838b:	5c                   	pop    %esp
    838c:	f0 01 7f 5d          	lock add %edi,0x5d(%edi)
    8390:	2f                   	das
    8391:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8396:	50                   	push   %eax
    8397:	61                   	popa
    8398:	76 61                	jbe    83fb <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xf3>
    839a:	6c                   	insb   (%dx),%es:(%edi)
    839b:	2f                   	das
    839c:	54                   	push   %esp
    839d:	72 69                	jb     8408 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x100>
    839f:	67 67 65 72 73       	addr16 addr16 gs jb 8417 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x10f>
    83a4:	2f                   	das
    83a5:	52                   	push   %edx
    83a6:	75 73                	jne    841b <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x113>
    83a8:	74 2f                	je     83d9 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xd1>
    83aa:	45                   	inc    %ebp
    83ab:	6d                   	insl   (%dx),%es:(%edi)
    83ac:	62 65 64             	bound  %esp,0x64(%ebp)
    83af:	64 65 64 2f          	fs gs fs das
    83b3:	70 65                	jo     841a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x112>
    83b5:	74 5f                	je     8416 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x10e>
    83b7:	6f                   	outsl  %ds:(%esi),(%dx)
    83b8:	73 2f                	jae    83e9 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xe1>
    83ba:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    83be:	65 6c                	gs insb (%dx),%es:(%edi)
    83c0:	5f                   	pop    %edi
    83c1:	74 79                	je     843c <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x134>
    83c3:	70 65                	jo     842a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x122>
    83c5:	73 2f                	jae    83f6 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0xee>
    83c7:	73 72                	jae    843b <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x133>
    83c9:	63 2f                	arpl   %ebp,(%edi)
    83cb:	6f                   	outsl  %ds:(%esi),(%dx)
    83cc:	62 6a 65             	bound  %ebp,0x65(%edx)
    83cf:	63 74 2f 71          	arpl   %esi,0x71(%edi,%ebp,1)
    83d3:	75 65                	jne    843a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x132>
    83d5:	75 65                	jne    843c <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x134>
    83d7:	2e 72 73             	jb,pn  844d <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x145>
    83da:	46                   	inc    %esi
    83db:	61                   	popa
    83dc:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    83e3:	20 
    83e4:	61                   	popa
    83e5:	63 63 65             	arpl   %esp,0x65(%ebx)
    83e8:	73 73                	jae    845d <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x155>
    83ea:	20 71 75             	and    %dh,0x75(%ecx)
    83ed:	65 75 65             	gs jne 8455 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x14d>
    83f0:	20 64 61 74          	and    %ah,0x74(%ecx,%eiz,2)
    83f4:	61                   	popa
    83f5:	3a 20                	cmp    (%eax),%ah
    83f7:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    83fb:	65 6c                	gs insb (%dx),%es:(%edi)
    83fd:	5f                   	pop    %edi
    83fe:	74 79                	je     8479 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x171>
    8400:	70 65                	jo     8467 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x15f>
    8402:	73 3a                	jae    843e <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x136>
    8404:	3a 6f 62             	cmp    0x62(%edi),%ch
    8407:	6a 65                	push   $0x65
    8409:	63 74 3a 3a          	arpl   %esi,0x3a(%edx,%edi,1)
    840d:	71 75                	jno    8484 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x17c>
    840f:	65 75 65             	gs jne 8477 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x16f>
    8412:	28 29                	sub    %ch,(%ecx)
    8414:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    8417:	6c                   	insb   (%dx),%es:(%edi)
    8418:	65 64 20 60 52       	gs and %ah,%fs:0x52(%eax)
    841d:	65 73 75             	gs jae 8495 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x18d>
    8420:	6c                   	insb   (%dx),%es:(%edi)
    8421:	74 3a                	je     845d <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x155>
    8423:	3a 75 6e             	cmp    0x6e(%ebp),%dh
    8426:	77 72                	ja     849a <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x192>
    8428:	61                   	popa
    8429:	70 28                	jo     8453 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x14b>
    842b:	29 60 20             	sub    %esp,0x20(%eax)
    842e:	6f                   	outsl  %ds:(%esi),(%dx)
    842f:	6e                   	outsb  %ds:(%esi),(%dx)
    8430:	20 61 6e             	and    %ah,0x6e(%ecx)
    8433:	20 60 45             	and    %ah,0x45(%eax)
    8436:	72 72                	jb     84aa <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1a2>
    8438:	60                   	pusha
    8439:	20 76 61             	and    %dh,0x61(%esi)
    843c:	6c                   	insb   (%dx),%es:(%edi)
    843d:	75 65                	jne    84a4 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x19c>
    843f:	4f                   	dec    %edi
    8440:	6b 45 72 72          	imul   $0x72,0x72(%ebp),%eax
    8444:	52                   	push   %edx
    8445:	61                   	popa
    8446:	77 48                	ja     8490 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x188>
    8448:	61                   	popa
    8449:	6e                   	outsb  %ds:(%esi),(%dx)
    844a:	64 6c                	fs insb (%dx),%es:(%edi)
    844c:	65 6e                	outsb  %gs:(%esi),(%dx)
    844e:	6f                   	outsl  %ds:(%esi),(%dx)
    844f:	74 20                	je     8471 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x169>
    8451:	79 65                	jns    84b8 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1b0>
    8453:	74 20                	je     8475 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x16d>
    8455:	69 6d 70 6c 65 6d 65 	imul   $0x656d656c,0x70(%ebp),%ebp
    845c:	6e                   	outsb  %ds:(%esi),(%dx)
    845d:	74 65                	je     84c4 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1bc>
    845f:	64 2f                	fs das
    8461:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8466:	50                   	push   %eax
    8467:	61                   	popa
    8468:	76 61                	jbe    84cb <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1c3>
    846a:	6c                   	insb   (%dx),%es:(%edi)
    846b:	2f                   	das
    846c:	54                   	push   %esp
    846d:	72 69                	jb     84d8 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1d0>
    846f:	67 67 65 72 73       	addr16 addr16 gs jb 84e7 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1df>
    8474:	2f                   	das
    8475:	52                   	push   %edx
    8476:	75 73                	jne    84eb <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1e3>
    8478:	74 2f                	je     84a9 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1a1>
    847a:	45                   	inc    %ebp
    847b:	6d                   	insl   (%dx),%es:(%edi)
    847c:	62 65 64             	bound  %esp,0x64(%ebp)
    847f:	64 65 64 2f          	fs gs fs das
    8483:	70 65                	jo     84ea <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1e2>
    8485:	74 5f                	je     84e6 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1de>
    8487:	6f                   	outsl  %ds:(%esi),(%dx)
    8488:	73 2f                	jae    84b9 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1b1>
    848a:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    848e:	65 6c                	gs insb (%dx),%es:(%edi)
    8490:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8495:	73 72                	jae    8509 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x201>
    8497:	63 2f                	arpl   %ebp,(%edi)
    8499:	66 73 2f             	data16 jae 84cb <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x1c3>
    849c:	6d                   	insl   (%dx),%es:(%edi)
    849d:	6f                   	outsl  %ds:(%esi),(%dx)
    849e:	64 2e 72 73          	fs jb,pn 8515 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x20d>
    84a2:	49                   	dec    %ecx
    84a3:	72 71                	jb     8516 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x20e>
    84a5:	20 51 75             	and    %dl,0x75(%ecx)
    84a8:	65 75 65             	gs jne 8510 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x208>
    84ab:	20 48 61             	and    %cl,0x61(%eax)
    84ae:	6e                   	outsb  %ds:(%esi),(%dx)
    84af:	64 6c                	fs insb (%dx),%es:(%edi)
    84b1:	65 3a 20             	cmp    %gs:(%eax),%ah
    84b4:	02 00                	add    (%eax),%al
    84b6:	00 00                	add    %al,(%eax)
    84b8:	00 00                	add    %al,(%eax)
    84ba:	00 00                	add    %al,(%eax)
    84bc:	02 00                	add    (%eax),%al
	...
    84c6:	00 00                	add    %al,(%eax)
    84c8:	20 00                	and    %al,(%eax)
    84ca:	00 e4                	add    %ah,%ah
    84cc:	2f                   	das
    84cd:	68 6f 6d 65 2f       	push   $0x2f656d6f
    84d2:	50                   	push   %eax
    84d3:	61                   	popa
    84d4:	76 61                	jbe    8537 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b>
    84d6:	6c                   	insb   (%dx),%es:(%edi)
    84d7:	2f                   	das
    84d8:	54                   	push   %esp
    84d9:	72 69                	jb     8544 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x28>
    84db:	67 67 65 72 73       	addr16 addr16 gs jb 8553 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x37>
    84e0:	2f                   	das
    84e1:	52                   	push   %edx
    84e2:	75 73                	jne    8557 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b>
    84e4:	74 2f                	je     8515 <_ZN4core7unicode12unicode_data15grapheme_extend17SHORT_OFFSET_RUNS17h5f93a5b5bf8efc3dE+0x20d>
    84e6:	45                   	inc    %ebp
    84e7:	6d                   	insl   (%dx),%es:(%edi)
    84e8:	62 65 64             	bound  %esp,0x64(%ebp)
    84eb:	64 65 64 2f          	fs gs fs das
    84ef:	70 65                	jo     8556 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a>
    84f1:	74 5f                	je     8552 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x36>
    84f3:	6f                   	outsl  %ds:(%esi),(%dx)
    84f4:	73 2f                	jae    8525 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x9>
    84f6:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    84fa:	65 6c                	gs insb (%dx),%es:(%edi)
    84fc:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8501:	73 72                	jae    8575 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x59>
    8503:	63 2f                	arpl   %ebp,(%edi)
    8505:	69 6f 2f 6d 6f 64 2e 	imul   $0x2e646f6d,0x2f(%edi),%ebp
    850c:	72 73                	jb     8581 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x65>
    850e:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8512:	65 6c                	gs insb (%dx),%es:(%edi)
    8514:	5f                   	pop    %edi
    8515:	6c                   	insb   (%dx),%es:(%edi)
    8516:	69 62 3a 3a 69 6f  	imul   $0x6f693a,0x3a(%edx),%esp

0000851c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE>:
	...
    8620:	5b                   	pop    %ebx
    8621:	5d                   	pop    %ebp
    8622:	5b                   	pop    %ebx
    8623:	5d                   	pop    %ebp
    8624:	20 0a                	and    %cl,(%edx)
    8626:	2f                   	das
    8627:	68 6f 6d 65 2f       	push   $0x2f656d6f
    862c:	50                   	push   %eax
    862d:	61                   	popa
    862e:	76 61                	jbe    8691 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x175>
    8630:	6c                   	insb   (%dx),%es:(%edi)
    8631:	2f                   	das
    8632:	54                   	push   %esp
    8633:	72 69                	jb     869e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x182>
    8635:	67 67 65 72 73       	addr16 addr16 gs jb 86ad <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x191>
    863a:	2f                   	das
    863b:	52                   	push   %edx
    863c:	75 73                	jne    86b1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x195>
    863e:	74 2f                	je     866f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x153>
    8640:	45                   	inc    %ebp
    8641:	6d                   	insl   (%dx),%es:(%edi)
    8642:	62 65 64             	bound  %esp,0x64(%ebp)
    8645:	64 65 64 2f          	fs gs fs das
    8649:	70 65                	jo     86b0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x194>
    864b:	74 5f                	je     86ac <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x190>
    864d:	6f                   	outsl  %ds:(%esi),(%dx)
    864e:	73 2f                	jae    867f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x163>
    8650:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8654:	65 6c                	gs insb (%dx),%es:(%edi)
    8656:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    865b:	73 72                	jae    86cf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b3>
    865d:	63 2f                	arpl   %ebp,(%edi)
    865f:	6f                   	outsl  %ds:(%esi),(%dx)
    8660:	62 6a 65             	bound  %ebp,0x65(%edx)
    8663:	63 74 2f 65          	arpl   %esi,0x65(%edi,%ebp,1)
    8667:	76 65                	jbe    86ce <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b2>
    8669:	6e                   	outsb  %ds:(%esi),(%dx)
    866a:	74 2e                	je     869a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x17e>
    866c:	72 73                	jb     86e1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1c5>
    866e:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8672:	65 6c                	gs insb (%dx),%es:(%edi)
    8674:	5f                   	pop    %edi
    8675:	6c                   	insb   (%dx),%es:(%edi)
    8676:	69 62 3a 3a 6f 62 6a 	imul   $0x6a626f3a,0x3a(%edx),%esp
    867d:	65 63 74 3a 3a       	arpl   %esi,%gs:0x3a(%edx,%edi,1)
    8682:	65 76 65             	gs jbe 86ea <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1ce>
    8685:	6e                   	outsb  %ds:(%esi),(%dx)
    8686:	74 2f                	je     86b7 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x19b>
    8688:	68 6f 6d 65 2f       	push   $0x2f656d6f
    868d:	50                   	push   %eax
    868e:	61                   	popa
    868f:	76 61                	jbe    86f2 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1d6>
    8691:	6c                   	insb   (%dx),%es:(%edi)
    8692:	2f                   	das
    8693:	54                   	push   %esp
    8694:	72 69                	jb     86ff <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1e3>
    8696:	67 67 65 72 73       	addr16 addr16 gs jb 870e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f2>
    869b:	2f                   	das
    869c:	52                   	push   %edx
    869d:	75 73                	jne    8712 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f6>
    869f:	74 2f                	je     86d0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b4>
    86a1:	45                   	inc    %ebp
    86a2:	6d                   	insl   (%dx),%es:(%edi)
    86a3:	62 65 64             	bound  %esp,0x64(%ebp)
    86a6:	64 65 64 2f          	fs gs fs das
    86aa:	70 65                	jo     8711 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f5>
    86ac:	74 5f                	je     870d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f1>
    86ae:	6f                   	outsl  %ds:(%esi),(%dx)
    86af:	73 2f                	jae    86e0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1c4>
    86b1:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    86b5:	65 6c                	gs insb (%dx),%es:(%edi)
    86b7:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    86bc:	73 72                	jae    8730 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x214>
    86be:	63 2f                	arpl   %ebp,(%edi)
    86c0:	6f                   	outsl  %ds:(%esi),(%dx)
    86c1:	62 6a 65             	bound  %ebp,0x65(%edx)
    86c4:	63 74 2f 6b          	arpl   %esi,0x6b(%edi,%ebp,1)
    86c8:	65 72 6e             	gs jb  8739 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x21d>
    86cb:	65 6c                	gs insb (%dx),%es:(%edi)
    86cd:	5f                   	pop    %edi
    86ce:	62 75 66             	bound  %esi,0x66(%ebp)
    86d1:	2f                   	das
    86d2:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    86d6:	65 6c                	gs insb (%dx),%es:(%edi)
    86d8:	2e 72 73             	jb,pn  874e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x232>
    86db:	2f                   	das
    86dc:	68 6f 6d 65 2f       	push   $0x2f656d6f
    86e1:	50                   	push   %eax
    86e2:	61                   	popa
    86e3:	76 61                	jbe    8746 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x22a>
    86e5:	6c                   	insb   (%dx),%es:(%edi)
    86e6:	2f                   	das
    86e7:	54                   	push   %esp
    86e8:	72 69                	jb     8753 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x237>
    86ea:	67 67 65 72 73       	addr16 addr16 gs jb 8762 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x246>
    86ef:	2f                   	das
    86f0:	52                   	push   %edx
    86f1:	75 73                	jne    8766 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x24a>
    86f3:	74 2f                	je     8724 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x208>
    86f5:	45                   	inc    %ebp
    86f6:	6d                   	insl   (%dx),%es:(%edi)
    86f7:	62 65 64             	bound  %esp,0x64(%ebp)
    86fa:	64 65 64 2f          	fs gs fs das
    86fe:	70 65                	jo     8765 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x249>
    8700:	74 5f                	je     8761 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x245>
    8702:	6f                   	outsl  %ds:(%esi),(%dx)
    8703:	73 2f                	jae    8734 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x218>
    8705:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8709:	65 6c                	gs insb (%dx),%es:(%edi)
    870b:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8710:	73 72                	jae    8784 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x268>
    8712:	63 2f                	arpl   %ebp,(%edi)
    8714:	6f                   	outsl  %ds:(%esi),(%dx)
    8715:	62 6a 65             	bound  %ebp,0x65(%edx)
    8718:	63 74 2f 6b          	arpl   %esi,0x6b(%edi,%ebp,1)
    871c:	65 72 6e             	gs jb  878d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x271>
    871f:	65 6c                	gs insb (%dx),%es:(%edi)
    8721:	5f                   	pop    %edi
    8722:	62 75 66             	bound  %esi,0x66(%ebp)
    8725:	2f                   	das
    8726:	75 73                	jne    879b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x27f>
    8728:	65 72 2e             	gs jb  8759 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x23d>
    872b:	72 73                	jb     87a0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x284>
    872d:	54                   	push   %esp
    872e:	65 72 6d             	gs jb  879e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x282>
    8731:	69 6e 61 74 69 6e 67 	imul   $0x676e6974,0x61(%esi),%ebp
    8738:	20 77 69             	and    %dh,0x69(%edi)
    873b:	74 68                	je     87a5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x289>
    873d:	20 63 6f             	and    %ah,0x6f(%ebx)
    8740:	64 65 3a 20          	fs cmp %gs:(%eax),%ah
    8744:	2f                   	das
    8745:	68 6f 6d 65 2f       	push   $0x2f656d6f
    874a:	50                   	push   %eax
    874b:	61                   	popa
    874c:	76 61                	jbe    87af <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x293>
    874e:	6c                   	insb   (%dx),%es:(%edi)
    874f:	2f                   	das
    8750:	54                   	push   %esp
    8751:	72 69                	jb     87bc <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2a0>
    8753:	67 67 65 72 73       	addr16 addr16 gs jb 87cb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2af>
    8758:	2f                   	das
    8759:	52                   	push   %edx
    875a:	75 73                	jne    87cf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2b3>
    875c:	74 2f                	je     878d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x271>
    875e:	45                   	inc    %ebp
    875f:	6d                   	insl   (%dx),%es:(%edi)
    8760:	62 65 64             	bound  %esp,0x64(%ebp)
    8763:	64 65 64 2f          	fs gs fs das
    8767:	70 65                	jo     87ce <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2b2>
    8769:	74 5f                	je     87ca <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2ae>
    876b:	6f                   	outsl  %ds:(%esi),(%dx)
    876c:	73 2f                	jae    879d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x281>
    876e:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8772:	65 6c                	gs insb (%dx),%es:(%edi)
    8774:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    8779:	73 72                	jae    87ed <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2d1>
    877b:	63 2f                	arpl   %ebp,(%edi)
    877d:	70 72                	jo     87f1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2d5>
    877f:	6f                   	outsl  %ds:(%esi),(%dx)
    8780:	63 65 73             	arpl   %esp,0x73(%ebp)
    8783:	73 2f                	jae    87b4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x298>
    8785:	6d                   	insl   (%dx),%es:(%edi)
    8786:	6f                   	outsl  %ds:(%esi),(%dx)
    8787:	64 2e 72 73          	fs jb,pn 87fe <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2e2>
    878b:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    878f:	65 6c                	gs insb (%dx),%es:(%edi)
    8791:	5f                   	pop    %edi
    8792:	6c                   	insb   (%dx),%es:(%edi)
    8793:	69 62 3a 3a 70 72 6f 	imul   $0x6f72703a,0x3a(%edx),%esp
    879a:	63 65 73             	arpl   %esp,0x73(%ebp)
    879d:	73 46                	jae    87e5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2c9>
    879f:	61                   	popa
    87a0:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    87a7:	20 
    87a8:	61                   	popa
    87a9:	63 63 65             	arpl   %esp,0x65(%ebx)
    87ac:	73 73                	jae    8821 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x305>
    87ae:	20 6d 6f             	and    %ch,0x6f(%ebp)
    87b1:	64 75 6c             	fs jne 8820 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x304>
    87b4:	65 20 69 6e          	and    %ch,%gs:0x6e(%ecx)
    87b8:	66 6f                	outsw  %ds:(%esi),(%dx)
    87ba:	3a 20                	cmp    (%eax),%ah
    87bc:	2f                   	das
    87bd:	68 6f 6d 65 2f       	push   $0x2f656d6f
    87c2:	50                   	push   %eax
    87c3:	61                   	popa
    87c4:	76 61                	jbe    8827 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x30b>
    87c6:	6c                   	insb   (%dx),%es:(%edi)
    87c7:	2f                   	das
    87c8:	54                   	push   %esp
    87c9:	72 69                	jb     8834 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x318>
    87cb:	67 67 65 72 73       	addr16 addr16 gs jb 8843 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x327>
    87d0:	2f                   	das
    87d1:	52                   	push   %edx
    87d2:	75 73                	jne    8847 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x32b>
    87d4:	74 2f                	je     8805 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2e9>
    87d6:	45                   	inc    %ebp
    87d7:	6d                   	insl   (%dx),%es:(%edi)
    87d8:	62 65 64             	bound  %esp,0x64(%ebp)
    87db:	64 65 64 2f          	fs gs fs das
    87df:	70 65                	jo     8846 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x32a>
    87e1:	74 5f                	je     8842 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x326>
    87e3:	6f                   	outsl  %ds:(%esi),(%dx)
    87e4:	73 2f                	jae    8815 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2f9>
    87e6:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    87ea:	65 6c                	gs insb (%dx),%es:(%edi)
    87ec:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    87f1:	73 72                	jae    8865 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x349>
    87f3:	63 2f                	arpl   %ebp,(%edi)
    87f5:	72 74                	jb     886b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x34f>
    87f7:	2f                   	das
    87f8:	6d                   	insl   (%dx),%es:(%edi)
    87f9:	6f                   	outsl  %ds:(%esi),(%dx)
    87fa:	64 2e 72 73          	fs jb,pn 8871 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x355>
    87fe:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8802:	65 6c                	gs insb (%dx),%es:(%edi)
    8804:	5f                   	pop    %edi
    8805:	6c                   	insb   (%dx),%es:(%edi)
    8806:	69 62 3a 3a 72 74 48 	imul   $0x4874723a,0x3a(%edx),%esp
    880d:	61                   	popa
    880e:	6e                   	outsb  %ds:(%esi),(%dx)
    880f:	64 6c                	fs insb (%dx),%es:(%edi)
    8811:	69 6e 67 20 63 68 61 	imul   $0x61686320,0x67(%esi),%ebp
    8818:	72 20                	jb     883a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x31e>
    881a:	6d                   	insl   (%dx),%es:(%edi)
    881b:	6f                   	outsl  %ds:(%esi),(%dx)
    881c:	64 75 6c             	fs jne 888b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x36f>
    881f:	65 4b                	gs dec %ebx
    8821:	65 72 6e             	gs jb  8892 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x376>
    8824:	65 6c                	gs insb (%dx),%es:(%edi)
    8826:	20 62 75             	and    %ah,0x75(%edx)
    8829:	66 3a 20             	data16 cmp (%eax),%ah
    882c:	76 67                	jbe    8895 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x379>
    882e:	61                   	popa
    882f:	20 77 72             	and    %dh,0x72(%edi)
    8832:	69 74 65 3a 20 50 61 	imul   $0x6e615020,0x3a(%ebp,%eiz,2),%esi
    8839:	6e 
    883a:	69 63 20 69 73 20 64 	imul   $0x64207369,0x20(%ebx),%esp
    8841:	65 74 65             	gs je  88a9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x38d>
    8844:	63 74 65 64          	arpl   %esi,0x64(%ebp,%eiz,2)
    8848:	3a 20                	cmp    (%eax),%ah
    884a:	2f                   	das
    884b:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8850:	50                   	push   %eax
    8851:	61                   	popa
    8852:	76 61                	jbe    88b5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x399>
    8854:	6c                   	insb   (%dx),%es:(%edi)
    8855:	2f                   	das
    8856:	54                   	push   %esp
    8857:	72 69                	jb     88c2 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a6>
    8859:	67 67 65 72 73       	addr16 addr16 gs jb 88d1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b5>
    885e:	2f                   	das
    885f:	52                   	push   %edx
    8860:	75 73                	jne    88d5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b9>
    8862:	74 2f                	je     8893 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x377>
    8864:	45                   	inc    %ebp
    8865:	6d                   	insl   (%dx),%es:(%edi)
    8866:	62 65 64             	bound  %esp,0x64(%ebp)
    8869:	64 65 64 2f          	fs gs fs das
    886d:	70 65                	jo     88d4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b8>
    886f:	74 5f                	je     88d0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b4>
    8871:	6f                   	outsl  %ds:(%esi),(%dx)
    8872:	73 2f                	jae    88a3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x387>
    8874:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    8878:	65 6c                	gs insb (%dx),%es:(%edi)
    887a:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    887f:	73 72                	jae    88f3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3d7>
    8881:	63 2f                	arpl   %ebp,(%edi)
    8883:	6c                   	insb   (%dx),%es:(%edi)
    8884:	69 62 2e 72 73 6b 65 	imul   $0x656b7372,0x2e(%edx),%esp
    888b:	72 6e                	jb     88fb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3df>
    888d:	65 6c                	gs insb (%dx),%es:(%edi)
    888f:	5f                   	pop    %edi
    8890:	6c                   	insb   (%dx),%es:(%edi)
    8891:	69 62 4e 6f 74 20 73 	imul   $0x7320746f,0x4e(%edx),%esp
    8898:	75 70                	jne    890a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3ee>
    889a:	70 6f                	jo     890b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3ef>
    889c:	72 74                	jb     8912 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3f6>
    889e:	65 64 4e             	gs fs dec %esi
    88a1:	6f                   	outsl  %ds:(%esi),(%dx)
    88a2:	74 20                	je     88c4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a8>
    88a4:	53                   	push   %ebx
    88a5:	75 70                	jne    8917 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3fb>
    88a7:	70 6f                	jo     8918 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3fc>
    88a9:	72 74                	jb     891f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x403>
    88ab:	65 64 20 4f 70       	gs and %cl,%fs:0x70(%edi)
    88b0:	65 72 61             	gs jb  8914 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3f8>
    88b3:	74 69                	je     891e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x402>
    88b5:	6f                   	outsl  %ds:(%esi),(%dx)
    88b6:	6e                   	outsb  %ds:(%esi),(%dx)
    88b7:	53                   	push   %ebx
    88b8:	79 73                	jns    892d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x411>
    88ba:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    88bd:	6c                   	insb   (%dx),%es:(%edi)
    88be:	20 69 73             	and    %ch,0x73(%ecx)
    88c1:	20 66 61             	and    %ah,0x61(%esi)
    88c4:	69 6c 65 64 3a 20 4b 	imul   $0x654b203a,0x64(%ebp,%eiz,2),%ebp
    88cb:	65 
    88cc:	72 6e                	jb     893c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x420>
    88ce:	65 6c                	gs insb (%dx),%es:(%edi)
    88d0:	42                   	inc    %edx
    88d1:	75 66                	jne    8939 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x41d>
    88d3:	6c                   	insb   (%dx),%es:(%edi)
    88d4:	65 6e                	outsb  %gs:(%esi),(%dx)
    88d6:	68 61 6e 64 6c       	push   $0x6c646e61
    88db:	65 49                	gs dec %ecx
    88dd:	6f                   	outsl  %ds:(%esi),(%dx)
    88de:	20 4f 70             	and    %cl,0x70(%edi)
    88e1:	20 66 61             	and    %ah,0x61(%esi)
    88e4:	69 6c 65 64 3a 20 46 	imul   $0x7346203a,0x64(%ebp,%eiz,2),%ebp
    88eb:	73 
    88ec:	20 4f 70             	and    %cl,0x70(%edi)
    88ef:	20 66 61             	and    %ah,0x61(%esi)
    88f2:	69 6c 65 64 3a 20 53 	imul   $0x7953203a,0x64(%ebp,%eiz,2),%ebp
    88f9:	79 
    88fa:	73 43                	jae    893f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x423>
    88fc:	61                   	popa
    88fd:	6c                   	insb   (%dx),%es:(%edi)
    88fe:	6c                   	insb   (%dx),%es:(%edi)
    88ff:	20 69 73             	and    %ch,0x73(%ecx)
    8902:	20 66 61             	and    %ah,0x61(%esi)
    8905:	69 6c 65 64 46 61 69 	imul   $0x6c696146,0x64(%ebp,%eiz,2),%ebp
    890c:	6c 
    890d:	65 64 20 74 6f 20    	gs and %dh,%fs:0x20(%edi,%ebp,2)
    8913:	70 65                	jo     897a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x45e>
    8915:	72 66                	jb     897d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x461>
    8917:	6f                   	outsl  %ds:(%esi),(%dx)
    8918:	72 6d                	jb     8987 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x46b>
    891a:	20 6d 65             	and    %ch,0x65(%ebp)
    891d:	6d                   	insl   (%dx),%es:(%edi)
    891e:	6f                   	outsl  %ds:(%esi),(%dx)
    891f:	72 79                	jb     899a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x47e>
    8921:	20 61 6c             	and    %ah,0x6c(%ecx)
    8924:	6c                   	insb   (%dx),%es:(%edi)
    8925:	6f                   	outsl  %ds:(%esi),(%dx)
    8926:	63 61 74             	arpl   %esp,0x74(%ecx)
    8929:	69 6f 6e 3a 20 2f 68 	imul   $0x682f203a,0x6e(%edi),%ebp
    8930:	6f                   	outsl  %ds:(%esi),(%dx)
    8931:	6d                   	insl   (%dx),%es:(%edi)
    8932:	65 2f                	gs das
    8934:	50                   	push   %eax
    8935:	61                   	popa
    8936:	76 61                	jbe    8999 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x47d>
    8938:	6c                   	insb   (%dx),%es:(%edi)
    8939:	2f                   	das
    893a:	54                   	push   %esp
    893b:	72 69                	jb     89a6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x48a>
    893d:	67 67 65 72 73       	addr16 addr16 gs jb 89b5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x499>
    8942:	2f                   	das
    8943:	52                   	push   %edx
    8944:	75 73                	jne    89b9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x49d>
    8946:	74 2f                	je     8977 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x45b>
    8948:	45                   	inc    %ebp
    8949:	6d                   	insl   (%dx),%es:(%edi)
    894a:	62 65 64             	bound  %esp,0x64(%ebp)
    894d:	64 65 64 2f          	fs gs fs das
    8951:	70 65                	jo     89b8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x49c>
    8953:	74 5f                	je     89b4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x498>
    8955:	6f                   	outsl  %ds:(%esi),(%dx)
    8956:	73 2f                	jae    8987 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x46b>
    8958:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    895c:	65 6c                	gs insb (%dx),%es:(%edi)
    895e:	5f                   	pop    %edi
    895f:	74 79                	je     89da <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4be>
    8961:	70 65                	jo     89c8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4ac>
    8963:	73 2f                	jae    8994 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x478>
    8965:	73 72                	jae    89d9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4bd>
    8967:	63 2f                	arpl   %ebp,(%edi)
    8969:	6f                   	outsl  %ds:(%esi),(%dx)
    896a:	62 6a 65             	bound  %ebp,0x65(%edx)
    896d:	63 74 2f 68          	arpl   %esi,0x68(%edi,%ebp,1)
    8971:	61                   	popa
    8972:	6e                   	outsb  %ds:(%esi),(%dx)
    8973:	64 6c                	fs insb (%dx),%es:(%edi)
    8975:	65 2e 72 73          	gs jb,pn 89ec <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4d0>
    8979:	53                   	push   %ebx
    897a:	79 73                	jns    89ef <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4d3>
    897c:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    897f:	6c                   	insb   (%dx),%es:(%edi)
    8980:	20 74 6f 20          	and    %dh,0x20(%edi,%ebp,2)
    8984:	72 65                	jb     89eb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4cf>
    8986:	6c                   	insb   (%dx),%es:(%edi)
    8987:	65 61                	gs popa
    8989:	73 65                	jae    89f0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4d4>
    898b:	20 68 61             	and    %ch,0x61(%eax)
    898e:	6e                   	outsb  %ds:(%esi),(%dx)
    898f:	64 6c                	fs insb (%dx),%es:(%edi)
    8991:	65 3a 20             	cmp    %gs:(%eax),%ah
    8994:	30 78 6b             	xor    %bh,0x6b(%eax)
    8997:	65 72 6e             	gs jb  8a08 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4ec>
    899a:	65 6c                	gs insb (%dx),%es:(%edi)
    899c:	5f                   	pop    %edi
    899d:	74 79                	je     8a18 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4fc>
    899f:	70 65                	jo     8a06 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4ea>
    89a1:	73 3a                	jae    89dd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4c1>
    89a3:	3a 6f 62             	cmp    0x62(%edi),%ch
    89a6:	6a 65                	push   $0x65
    89a8:	63 74 3a 3a          	arpl   %esi,0x3a(%edx,%edi,1)
    89ac:	68 61 6e 64 6c       	push   $0x6c646e61
    89b1:	65 46                	gs inc %esi
    89b3:	61                   	popa
    89b4:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    89bb:	20 
    89bc:	72 65                	jb     8a23 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x507>
    89be:	6c                   	insb   (%dx),%es:(%edi)
    89bf:	65 61                	gs popa
    89c1:	73 65                	jae    8a28 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x50c>
    89c3:	20 6b 65             	and    %ch,0x65(%ebx)
    89c6:	72 6e                	jb     8a36 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x51a>
    89c8:	65 6c                	gs insb (%dx),%es:(%edi)
    89ca:	20 6f 62             	and    %ch,0x62(%edi)
    89cd:	6a 65                	push   $0x65
    89cf:	63 74 3a 20          	arpl   %esi,0x20(%edx,%edi,1)
    89d3:	4e                   	dec    %esi
    89d4:	6f                   	outsl  %ds:(%esi),(%dx)
    89d5:	74 53                	je     8a2a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x50e>
    89d7:	75 70                	jne    8a49 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x52d>
    89d9:	70 6f                	jo     8a4a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x52e>
    89db:	72 74                	jb     8a51 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x6>
    89dd:	65 64 49             	gs fs dec %ecx
    89e0:	6e                   	outsb  %ds:(%esi),(%dx)
    89e1:	76 61                	jbe    8a44 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x528>
    89e3:	6c                   	insb   (%dx),%es:(%edi)
    89e4:	69 64 44 61 74 61 4b 	imul   $0x654b6174,0x61(%esp,%eax,2),%esp
    89eb:	65 
    89ec:	72 6e                	jb     8a5c <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x11>
    89ee:	65 6c                	gs insb (%dx),%es:(%edi)
    89f0:	53                   	push   %ebx
    89f1:	70 61                	jo     8a54 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x9>
    89f3:	63 65 43             	arpl   %esp,0x43(%ebp)
    89f6:	61                   	popa
    89f7:	6c                   	insb   (%dx),%es:(%edi)
    89f8:	6c                   	insb   (%dx),%es:(%edi)
    89f9:	42                   	inc    %edx
    89fa:	75 73                	jne    8a6f <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x24>
    89fc:	79 52                	jns    8a50 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x5>
    89fe:	65 73 6f             	gs jae 8a70 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x25>
    8a01:	75 72                	jne    8a75 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2a>
    8a03:	63 65 51             	arpl   %esp,0x51(%ebp)
    8a06:	75 65                	jne    8a6d <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x22>
    8a08:	75 65                	jne    8a6f <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x24>
    8a0a:	49                   	dec    %ecx
    8a0b:	73 45                	jae    8a52 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x7>
    8a0d:	6d                   	insl   (%dx),%es:(%edi)
    8a0e:	70 74                	jo     8a84 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x39>
    8a10:	79 49                	jns    8a5b <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x10>
    8a12:	6e                   	outsb  %ds:(%esi),(%dx)
    8a13:	76 61                	jbe    8a76 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2b>
    8a15:	6c                   	insb   (%dx),%es:(%edi)
    8a16:	69 64 4d 6f 64 75 6c 	imul   $0x656c7564,0x6f(%ebp,%ecx,2),%esp
    8a1d:	65 
    8a1e:	50                   	push   %eax
    8a1f:	61                   	popa
    8a20:	72 61                	jb     8a83 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x38>
    8a22:	6d                   	insl   (%dx),%es:(%edi)
    8a23:	73 4e                	jae    8a73 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x28>
    8a25:	6f                   	outsl  %ds:(%esi),(%dx)
    8a26:	53                   	push   %ebx
    8a27:	70 61                	jo     8a8a <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x3f>
    8a29:	63 65 49             	arpl   %esp,0x49(%ebp)
    8a2c:	6e                   	outsb  %ds:(%esi),(%dx)
    8a2d:	42                   	inc    %edx
    8a2e:	75 66                	jne    8a96 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x4b>
    8a30:	66 65 72 46          	data16 gs jb 8a7a <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2f>
    8a34:	61                   	popa
    8a35:	69 6c 65 64 4f 46 46 	imul   $0x4546464f,0x64(%ebp,%eiz,2),%ebp
    8a3c:	45 
    8a3d:	52                   	push   %edx
    8a3e:	52                   	push   %edx
    8a3f:	4f                   	dec    %edi
    8a40:	52                   	push   %edx
    8a41:	44                   	inc    %esp
    8a42:	45                   	inc    %ebp
    8a43:	42                   	inc    %edx
    8a44:	55                   	push   %ebp
    8a45:	47                   	inc    %edi
    8a46:	54                   	push   %esp
    8a47:	52                   	push   %edx
    8a48:	41                   	inc    %ecx
    8a49:	43                   	inc    %ebx
    8a4a:	45                   	inc    %ebp

00008a4b <_ZN3log6logger3NOP17hbd4d50091fff3239E>:
    8a4b:	2f                   	das
    8a4c:	68 6f 6d 65 2f       	push   $0x2f656d6f
    8a51:	50                   	push   %eax
    8a52:	61                   	popa
    8a53:	76 61                	jbe    8ab6 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x6b>
    8a55:	6c                   	insb   (%dx),%es:(%edi)
    8a56:	2f                   	das
    8a57:	2e 63 61 72          	arpl   %esp,%cs:0x72(%ecx)
    8a5b:	67 6f                	outsl  %ds:(%si),(%dx)
    8a5d:	2f                   	das
    8a5e:	72 65                	jb     8ac5 <__GNU_EH_FRAME_HDR+0x5>
    8a60:	67 69 73 74 72 79 2f 	imul   $0x732f7972,0x74(%bp,%di),%esi
    8a67:	73 
    8a68:	72 63                	jb     8acd <__GNU_EH_FRAME_HDR+0xd>
    8a6a:	2f                   	das
    8a6b:	69 6e 64 65 78 2e 63 	imul   $0x632e7865,0x64(%esi),%ebp
    8a72:	72 61                	jb     8ad5 <__GNU_EH_FRAME_HDR+0x15>
    8a74:	74 65                	je     8adb <__GNU_EH_FRAME_HDR+0x1b>
    8a76:	73 2e                	jae    8aa6 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x5b>
    8a78:	69 6f 2d 31 39 34 39 	imul   $0x39343931,0x2d(%edi),%ebp
    8a7f:	63 66 38             	arpl   %esp,0x38(%esi)
    8a82:	63 36                	arpl   %esi,(%esi)
    8a84:	62 35 62 35 35 37    	bound  %esi,0x37353562
    8a8a:	66 2f                	data16 das
    8a8c:	74 61                	je     8aef <__GNU_EH_FRAME_HDR+0x2f>
    8a8e:	6c                   	insb   (%dx),%es:(%edi)
    8a8f:	63 2d 34 2e 34 2e    	arpl   %ebp,0x2e342e34
    8a95:	32 2f                	xor    (%edi),%ch
    8a97:	73 72                	jae    8b0b <__GNU_EH_FRAME_HDR+0x4b>
    8a99:	63 2f                	arpl   %ebp,(%edi)
    8a9b:	74 61                	je     8afe <__GNU_EH_FRAME_HDR+0x3e>
    8a9d:	6c                   	insb   (%dx),%es:(%edi)
    8a9e:	63 2e                	arpl   %ebp,(%esi)
    8aa0:	72 73                	jb     8b15 <__GNU_EH_FRAME_HDR+0x55>
    8aa2:	68 65 61 70 20       	push   $0x20706165
    8aa7:	63 6f 76             	arpl   %ebp,0x76(%edi)
    8aaa:	65 72 73             	gs jb  8b20 <__GNU_EH_FRAME_HDR+0x60>
    8aad:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
    8ab1:	20 6e 75             	and    %ch,0x75(%esi)
    8ab4:	6c                   	insb   (%dx),%es:(%edi)
    8ab5:	6c                   	insb   (%dx),%es:(%edi)
    8ab6:	20 61 64             	and    %ah,0x64(%ecx)
    8ab9:	64 72 65             	fs jb  8b21 <__GNU_EH_FRAME_HDR+0x61>
    8abc:	73 73                	jae    8b31 <__GNU_EH_FRAME_HDR+0x71>
    8abe:	21                   	.byte 0x21

Disassembly of section .eh_frame_hdr:

00008ac0 <__GNU_EH_FRAME_HDR>:
    8ac0:	01 1b                	add    %ebx,(%ebx)
    8ac2:	ff                   	(bad)
    8ac3:	ff 08                	decl   (%eax)
    8ac5:	00 00                	add    %al,(%eax)
    8ac7:	00 00                	add    %al,(%eax)
    8ac9:	00 00                	add    %al,(%eax)
	...

Disassembly of section .data.rel.ro:

00009c64 <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE-0x2c0>:
    9c64:	00 00                	add    %al,(%eax)
    9c66:	00 00                	add    %al,(%eax)
    9c68:	04 00                	add    $0x0,%al
    9c6a:	00 00                	add    %al,(%eax)
    9c6c:	04 00                	add    $0x0,%al
    9c6e:	00 00                	add    %al,(%eax)
    9c70:	80 28 00             	subb   $0x0,(%eax)
    9c73:	00 00                	add    %al,(%eax)
    9c75:	00 00                	add    %al,(%eax)
    9c77:	00 04 00             	add    %al,(%eax,%eax,1)
    9c7a:	00 00                	add    %al,(%eax)
    9c7c:	04 00                	add    $0x0,%al
    9c7e:	00 00                	add    %al,(%eax)
    9c80:	f0 20 00             	lock and %al,(%eax)
	...
    9c8b:	00 01                	add    %al,(%ecx)
    9c8d:	00 00                	add    %al,(%eax)
    9c8f:	00 d0                	add    %dl,%al
    9c91:	29 00                	sub    %eax,(%eax)
    9c93:	00 b2 76 00 00 12    	add    %dh,0x12000076(%edx)
    9c99:	00 00                	add    %al,(%eax)
    9c9b:	00 2c 00             	add    %ch,(%eax,%eax,1)
    9c9e:	00 00                	add    %al,(%eax)
    9ca0:	16                   	push   %ss
    9ca1:	00 00                	add    %al,(%eax)
    9ca3:	00 d8                	add    %bl,%al
    9ca5:	76 00                	jbe    9ca7 <__GNU_EH_FRAME_HDR+0x11e7>
    9ca7:	00 20                	add    %ah,(%eax)
    9ca9:	00 00                	add    %al,(%eax)
    9cab:	00 c4                	add    %al,%ah
    9cad:	76 00                	jbe    9caf <__GNU_EH_FRAME_HDR+0x11ef>
    9caf:	00 14 00             	add    %dl,(%eax,%eax,1)
    9cb2:	00 00                	add    %al,(%eax)
    9cb4:	34 00                	xor    $0x0,%al
    9cb6:	00 00                	add    %al,(%eax)
    9cb8:	09 00                	or     %eax,(%eax)
    9cba:	00 00                	add    %al,(%eax)
    9cbc:	30 77 00             	xor    %dh,0x0(%edi)
    9cbf:	00 0f                	add    %cl,(%edi)
    9cc1:	00 00                	add    %al,(%eax)
    9cc3:	00 c4                	add    %al,%ah
    9cc5:	76 00                	jbe    9cc7 <__GNU_EH_FRAME_HDR+0x1207>
    9cc7:	00 14 00             	add    %dl,(%eax,%eax,1)
    9cca:	00 00                	add    %al,(%eax)
    9ccc:	4f                   	dec    %edi
    9ccd:	00 00                	add    %al,(%eax)
    9ccf:	00 20                	add    %ah,(%eax)
    9cd1:	00 00                	add    %al,(%eax)
    9cd3:	00 c4                	add    %al,%ah
    9cd5:	76 00                	jbe    9cd7 <__GNU_EH_FRAME_HDR+0x1217>
    9cd7:	00 14 00             	add    %dl,(%eax,%eax,1)
    9cda:	00 00                	add    %al,(%eax)
    9cdc:	4f                   	dec    %edi
    9cdd:	00 00                	add    %al,(%eax)
    9cdf:	00 3f                	add    %bh,(%edi)
    9ce1:	00 00                	add    %al,(%eax)
    9ce3:	00 c4                	add    %al,%ah
    9ce5:	76 00                	jbe    9ce7 <__GNU_EH_FRAME_HDR+0x1227>
    9ce7:	00 14 00             	add    %dl,(%eax,%eax,1)
    9cea:	00 00                	add    %al,(%eax)
    9cec:	56                   	push   %esi
    9ced:	00 00                	add    %al,(%eax)
    9cef:	00 2e                	add    %ch,(%esi)
    9cf1:	00 00                	add    %al,(%eax)
    9cf3:	00 57 77             	add    %dl,0x77(%edi)
    9cf6:	00 00                	add    %al,(%eax)
    9cf8:	0a 00                	or     (%eax),%al
    9cfa:	00 00                	add    %al,(%eax)
    9cfc:	61                   	popa
    9cfd:	77 00                	ja     9cff <__GNU_EH_FRAME_HDR+0x123f>
    9cff:	00 11                	add    %dl,(%ecx)
    9d01:	00 00                	add    %al,(%eax)
    9d03:	00 c4                	add    %al,%ah
    9d05:	76 00                	jbe    9d07 <__GNU_EH_FRAME_HDR+0x1247>
    9d07:	00 14 00             	add    %dl,(%eax,%eax,1)
    9d0a:	00 00                	add    %al,(%eax)
    9d0c:	18 00                	sbb    %al,(%eax)
    9d0e:	00 00                	add    %al,(%eax)
    9d10:	01 00                	add    %eax,(%eax)
    9d12:	00 00                	add    %al,(%eax)
    9d14:	72 77                	jb     9d8d <__GNU_EH_FRAME_HDR+0x12cd>
    9d16:	00 00                	add    %al,(%eax)
    9d18:	0d 00 00 00 7f       	or     $0x7f000000,%eax
    9d1d:	77 00                	ja     9d1f <__GNU_EH_FRAME_HDR+0x125f>
    9d1f:	00 11                	add    %dl,(%ecx)
    9d21:	00 00                	add    %al,(%eax)
    9d23:	00 fd                	add    %bh,%ch
    9d25:	77 00                	ja     9d27 <__GNU_EH_FRAME_HDR+0x1267>
    9d27:	00 15 00 00 00 12    	add    %dl,0x12000000
    9d2d:	78 00                	js     9d2f <__GNU_EH_FRAME_HDR+0x126f>
    9d2f:	00 0d 00 00 00 90    	add    %cl,0x90000000
    9d35:	77 00                	ja     9d37 <__GNU_EH_FRAME_HDR+0x1277>
    9d37:	00 6d 00             	add    %ch,0x0(%ebp)
    9d3a:	00 00                	add    %al,(%eax)
    9d3c:	b5 01                	mov    $0x1,%ch
    9d3e:	00 00                	add    %al,(%eax)
    9d40:	0d 00 00 00 01       	or     $0x1000000,%eax
    9d45:	00 00                	add    %al,(%eax)
    9d47:	00 00                	add    %al,(%eax)
    9d49:	00 00                	add    %al,(%eax)
    9d4b:	00 5f 7b             	add    %bl,0x7b(%edi)
    9d4e:	00 00                	add    %al,(%eax)
    9d50:	01 00                	add    %eax,(%eax)
    9d52:	00 00                	add    %al,(%eax)
    9d54:	5f                   	pop    %edi
    9d55:	7b 00                	jnp    9d57 <__GNU_EH_FRAME_HDR+0x1297>
    9d57:	00 01                	add    %al,(%ecx)
    9d59:	00 00                	add    %al,(%eax)
    9d5b:	00 f8                	add    %bh,%al
    9d5d:	76 00                	jbe    9d5f <__GNU_EH_FRAME_HDR+0x129f>
    9d5f:	00 20                	add    %ah,(%eax)
    9d61:	00 00                	add    %al,(%eax)
    9d63:	00 99 7b 00 00 12    	add    %bl,0x1200007b(%ecx)
    9d69:	00 00                	add    %al,(%eax)
    9d6b:	00 01                	add    %al,(%ecx)
    9d6d:	00 00                	add    %al,(%eax)
    9d6f:	00 00                	add    %al,(%eax)
    9d71:	00 00                	add    %al,(%eax)
    9d73:	00 ab 7b 00 00 02    	add    %ch,0x200007b(%ebx)
    9d79:	00 00                	add    %al,(%eax)
    9d7b:	00 00                	add    %al,(%eax)
    9d7d:	00 00                	add    %al,(%eax)
    9d7f:	00 0c 00             	add    %cl,(%eax,%eax,1)
    9d82:	00 00                	add    %al,(%eax)
    9d84:	04 00                	add    $0x0,%al
    9d86:	00 00                	add    %al,(%eax)
    9d88:	60                   	pusha
    9d89:	3b 00                	cmp    (%eax),%eax
    9d8b:	00 d0                	add    %dl,%al
    9d8d:	3d 00 00 30 3e       	cmp    $0x3e300000,%eax
    9d92:	00 00                	add    %al,(%eax)
    9d94:	87 7c 00 00          	xchg   %edi,0x0(%eax,%eax,1)
    9d98:	78 00                	js     9d9a <__GNU_EH_FRAME_HDR+0x12da>
    9d9a:	00 00                	add    %al,(%eax)
    9d9c:	0a 00                	or     (%eax),%al
    9d9e:	00 00                	add    %al,(%eax)
    9da0:	2b 00                	sub    (%eax),%eax
    9da2:	00 00                	add    %al,(%eax)
    9da4:	87 7c 00 00          	xchg   %edi,0x0(%eax,%eax,1)
    9da8:	78 00                	js     9daa <__GNU_EH_FRAME_HDR+0x12ea>
    9daa:	00 00                	add    %al,(%eax)
    9dac:	1a 00                	sbb    (%eax),%al
    9dae:	00 00                	add    %al,(%eax)
    9db0:	36 00 00             	add    %al,%ss:(%eax)
    9db3:	00 1f                	add    %bl,(%edi)
    9db5:	7b 00                	jnp    9db7 <__GNU_EH_FRAME_HDR+0x12f7>
    9db7:	00 10                	add    %dl,(%eax)
    9db9:	00 00                	add    %al,(%eax)
    9dbb:	00 c0                	add    %al,%al
    9dbd:	82 00 00             	addb   $0x0,(%eax)
    9dc0:	22 00                	and    (%eax),%al
    9dc2:	00 00                	add    %al,(%eax)
    9dc4:	e2 82                	loop   9d48 <__GNU_EH_FRAME_HDR+0x1288>
    9dc6:	00 00                	add    %al,(%eax)
    9dc8:	16                   	push   %ss
    9dc9:	00 00                	add    %al,(%eax)
    9dcb:	00 f8                	add    %bh,%al
    9dcd:	82 00 00             	addb   $0x0,(%eax)
    9dd0:	0d 00 00 00 da       	or     $0xda000000,%eax
    9dd5:	83 00 00             	addl   $0x0,(%eax)
    9dd8:	1d 00 00 00 00       	sbb    $0x0,%eax
    9ddd:	00 00                	add    %al,(%eax)
    9ddf:	00 04 00             	add    %al,(%eax,%eax,1)
    9de2:	00 00                	add    %al,(%eax)
    9de4:	04 00                	add    $0x0,%al
    9de6:	00 00                	add    %al,(%eax)
    9de8:	f0 20 00             	lock and %al,(%eax)
    9deb:	00 a0 42 00 00 04    	add    %ah,0x4000042(%eax)
    9df1:	01 00                	add    %eax,(%eax)
    9df3:	00 04 00             	add    %al,(%eax,%eax,1)
    9df6:	00 00                	add    %al,(%eax)
    9df8:	d0 43 00             	rolb   $1,0x0(%ebx)
    9dfb:	00 30                	add    %dh,(%eax)
    9dfd:	44                   	inc    %esp
    9dfe:	00 00                	add    %al,(%eax)
    9e00:	60                   	pusha
    9e01:	45                   	inc    %ebp
    9e02:	00 00                	add    %al,(%eax)
    9e04:	60                   	pusha
    9e05:	84 00                	test   %al,(%eax)
    9e07:	00 42 00             	add    %al,0x0(%edx)
    9e0a:	00 00                	add    %al,(%eax)
    9e0c:	6d                   	insl   (%dx),%es:(%edi)
    9e0d:	00 00                	add    %al,(%eax)
    9e0f:	00 0e                	add    %cl,(%esi)
    9e11:	00 00                	add    %al,(%eax)
    9e13:	00 a2 84 00 00 12    	add    %ah,0x12000084(%edx)
    9e19:	00 00                	add    %al,(%eax)
    9e1b:	00 a0 42 00 00 04    	add    %ah,0x4000042(%eax)
    9e21:	01 00                	add    %eax,(%eax)
    9e23:	00 04 00             	add    %al,(%eax,%eax,1)
    9e26:	00 00                	add    %al,(%eax)
    9e28:	b0 42                	mov    $0x42,%al
    9e2a:	00 00                	add    %al,(%eax)
    9e2c:	c0 42 00 00          	rolb   $0x0,0x0(%edx)
    9e30:	a0 42 00 00 20       	mov    0x20000042,%al
    9e35:	86 00                	xchg   %al,(%eax)
    9e37:	00 01                	add    %al,(%ecx)
    9e39:	00 00                	add    %al,(%eax)
    9e3b:	00 21                	add    %ah,(%ecx)
    9e3d:	86 00                	xchg   %al,(%eax)
    9e3f:	00 02                	add    %al,(%edx)
    9e41:	00 00                	add    %al,(%eax)
    9e43:	00 23                	add    %ah,(%ebx)
    9e45:	86 00                	xchg   %al,(%eax)
    9e47:	00 02                	add    %al,(%edx)
    9e49:	00 00                	add    %al,(%eax)
    9e4b:	00 25 86 00 00 01    	add    %ah,0x1000086
    9e51:	00 00                	add    %al,(%eax)
    9e53:	00 2f                	add    %ch,(%edi)
    9e55:	7b 00                	jnp    9e57 <__GNU_EH_FRAME_HDR+0x1397>
    9e57:	00 10                	add    %dl,(%eax)
    9e59:	00 00                	add    %al,(%eax)
    9e5b:	00 87 86 00 00 54    	add    %al,0x54000086(%edi)
    9e61:	00 00                	add    %al,(%eax)
    9e63:	00 21                	add    %ah,(%ecx)
    9e65:	00 00                	add    %al,(%eax)
    9e67:	00 0e                	add    %cl,(%esi)
    9e69:	00 00                	add    %al,(%eax)
    9e6b:	00 db                	add    %bl,%bl
    9e6d:	86 00                	xchg   %al,(%eax)
    9e6f:	00 52 00             	add    %dl,0x0(%edx)
    9e72:	00 00                	add    %al,(%eax)
    9e74:	25 00 00 00 12       	and    $0x12000000,%eax
    9e79:	00 00                	add    %al,(%eax)
    9e7b:	00 2d 87 00 00 17    	add    %ch,0x17000087
    9e81:	00 00                	add    %al,(%eax)
    9e83:	00 9e 87 00 00 1e    	add    %bl,0x1e000087(%esi)
    9e89:	00 00                	add    %al,(%eax)
    9e8b:	00 0c 88             	add    %cl,(%eax,%ecx,4)
    9e8e:	00 00                	add    %al,(%eax)
    9e90:	14 00                	adc    $0x0,%al
    9e92:	00 00                	add    %al,(%eax)
    9e94:	bc 87 00 00 42       	mov    $0x42000087,%esp
    9e99:	00 00                	add    %al,(%eax)
    9e9b:	00 69 00             	add    %ch,0x0(%ecx)
    9e9e:	00 00                	add    %al,(%eax)
    9ea0:	2c 00                	sub    $0x0,%al
    9ea2:	00 00                	add    %al,(%eax)
    9ea4:	bc 87 00 00 42       	mov    $0x42000087,%esp
    9ea9:	00 00                	add    %al,(%eax)
    9eab:	00 6a 00             	add    %ch,0x0(%edx)
    9eae:	00 00                	add    %al,(%eax)
    9eb0:	29 00                	sub    %eax,(%eax)
    9eb2:	00 00                	add    %al,(%eax)
    9eb4:	20 88 00 00 0c 00    	and    %cl,0xc0000(%eax)
    9eba:	00 00                	add    %al,(%eax)
    9ebc:	bc 87 00 00 42       	mov    $0x42000087,%esp
    9ec1:	00 00                	add    %al,(%eax)
    9ec3:	00 71 00             	add    %dh,0x0(%ecx)
    9ec6:	00 00                	add    %al,(%eax)
    9ec8:	2c 00                	sub    $0x0,%al
    9eca:	00 00                	add    %al,(%eax)
    9ecc:	2c 88                	sub    $0x88,%al
    9ece:	00 00                	add    %al,(%eax)
    9ed0:	0b 00                	or     (%eax),%eax
    9ed2:	00 00                	add    %al,(%eax)
    9ed4:	37                   	aaa
    9ed5:	88 00                	mov    %al,(%eax)
    9ed7:	00 13                	add    %dl,(%ebx)
    9ed9:	00 00                	add    %al,(%eax)
    9edb:	00 b7 88 00 00 13    	add    %dh,0x13000088(%edi)
    9ee1:	00 00                	add    %al,(%eax)
    9ee3:	00 dc                	add    %bl,%ah
    9ee5:	88 00                	mov    %al,(%eax)
    9ee7:	00 0e                	add    %cl,(%esi)
    9ee9:	00 00                	add    %al,(%eax)
    9eeb:	00 ea                	add    %ch,%dl
    9eed:	88 00                	mov    %al,(%eax)
    9eef:	00 0e                	add    %cl,(%esi)
    9ef1:	00 00                	add    %al,(%eax)
    9ef3:	00 09                	add    %cl,(%ecx)
    9ef5:	89 00                	mov    %eax,(%eax)
    9ef7:	00 25 00 00 00 79    	add    %ah,0x79000000
    9efd:	89 00                	mov    %eax,(%eax)
    9eff:	00 1d 00 00 00 b2    	add    %bl,0xb2000000
    9f05:	89 00                	mov    %eax,(%eax)
    9f07:	00 21                	add    %ah,(%ecx)
	...
    9f11:	00 00                	add    %al,(%eax)
    9f13:	00 01                	add    %al,(%ecx)
    9f15:	00 00                	add    %al,(%eax)
    9f17:	00 10                	add    %dl,(%eax)
    9f19:	6b 00 00             	imul   $0x0,(%eax),%eax
    9f1c:	20 6b 00             	and    %ch,0x0(%ebx)
    9f1f:	00 30                	add    %dh,(%eax)
    9f21:	6b 00 00             	imul   $0x0,(%eax),%eax

00009f24 <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE>:
    9f24:	39 8a 00 00 03 00    	cmp    %ecx,0x30000(%edx)
    9f2a:	00 00                	add    %al,(%eax)
    9f2c:	3c 8a                	cmp    $0x8a,%al
    9f2e:	00 00                	add    %al,(%eax)
    9f30:	05 00 00 00 7a       	add    $0x7a000000,%eax
    9f35:	76 00                	jbe    9f37 <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE+0x13>
    9f37:	00 04 00             	add    %al,(%eax,%eax,1)
    9f3a:	00 00                	add    %al,(%eax)
    9f3c:	7e 76                	jle    9fb4 <_DYNAMIC+0x48>
    9f3e:	00 00                	add    %al,(%eax)
    9f40:	04 00                	add    $0x0,%al
    9f42:	00 00                	add    %al,(%eax)
    9f44:	41                   	inc    %ecx
    9f45:	8a 00                	mov    (%eax),%al
    9f47:	00 05 00 00 00 46    	add    %al,0x46000000
    9f4d:	8a 00                	mov    (%eax),%al
    9f4f:	00 05 00 00 00 a2    	add    %al,0xa2000000
    9f55:	8a 00                	mov    (%eax),%al
    9f57:	00 1d 00 00 00 4b    	add    %bl,0x4b000000
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
    9fa8:	80 02 00             	addb   $0x0,(%edx)
    9fab:	00 13                	add    %dl,(%ebx)
    9fad:	00 00                	add    %al,(%eax)
    9faf:	00 08                	add    %cl,(%eax)
    9fb1:	00 00                	add    %al,(%eax)
    9fb3:	00 1e                	add    %bl,(%esi)
    9fb5:	00 00                	add    %al,(%eax)
    9fb7:	00 08                	add    %cl,(%eax)
    9fb9:	00 00                	add    %al,(%eax)
    9fbb:	00 fb                	add    %bh,%bl
    9fbd:	ff                   	(bad)
    9fbe:	ff 6f 01             	ljmp   *0x1(%edi)
    9fc1:	00 00                	add    %al,(%eax)
    9fc3:	08 fa                	or     %bh,%dl
    9fc5:	ff                   	(bad)
    9fc6:	ff 6f 50             	ljmp   *0x50(%edi)
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
