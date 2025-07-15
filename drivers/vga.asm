
target/i686-unknown-linux-gnu/release/vga:     file format elf32-i386


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
 1a3:	00 10                	add    %dl,(%eax)
 1a5:	63 91 ee 69 77 22    	arpl   %edx,0x227769ee(%ecx)
 1ab:	7d bb                	jge    168 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE-0xe98>
 1ad:	d0 be e6 ef 7d ff    	sarb   $1,-0x82101a(%esi)
 1b3:	1a                   	.byte 0x1a
 1b4:	9c                   	pushf
 1b5:	fd                   	std
 1b6:	c2                   	.byte 0xc2
 1b7:	e1                   	.byte 0xe1

Disassembly of section .text:

00001000 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE>:
    1000:	53                   	push   %ebx
    1001:	83 ec 08             	sub    $0x8,%esp
    1004:	e8 00 00 00 00       	call   1009 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE+0x9>
    1009:	5b                   	pop    %ebx
    100a:	81 c3 eb 6f 00 00    	add    $0x6feb,%ebx
    1010:	e8 9b 02 00 00       	call   12b0 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler>
    1015:	66 90                	xchg   %ax,%ax
    1017:	66 90                	xchg   %ax,%ax
    1019:	66 90                	xchg   %ax,%ax
    101b:	66 90                	xchg   %ax,%ax
    101d:	66 90                	xchg   %ax,%ax
    101f:	90                   	nop

00001020 <_ZN5alloc7raw_vec17capacity_overflow17hf4854d1cf84712dcE>:
    1020:	53                   	push   %ebx
    1021:	83 ec 18             	sub    $0x18,%esp
    1024:	e8 00 00 00 00       	call   1029 <_ZN5alloc7raw_vec17capacity_overflow17hf4854d1cf84712dcE+0x9>
    1029:	5b                   	pop    %ebx
    102a:	81 c3 cb 6f 00 00    	add    $0x6fcb,%ebx
    1030:	8d 83 30 fe ff ff    	lea    -0x1d0(%ebx),%eax
    1036:	89 04 24             	mov    %eax,(%esp)
    1039:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    1040:	00 
    1041:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1048:	00 
    1049:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    1050:	00 
    1051:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1058:	00 
    1059:	8d 93 a0 fd ff ff    	lea    -0x260(%ebx),%edx
    105f:	89 e1                	mov    %esp,%ecx
    1061:	e8 ca 00 00 00       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    1066:	66 90                	xchg   %ax,%ax
    1068:	66 90                	xchg   %ax,%ax
    106a:	66 90                	xchg   %ax,%ax
    106c:	66 90                	xchg   %ax,%ax
    106e:	66 90                	xchg   %ax,%ax

00001070 <_RNvCs9xNfxAkRhBx_7___rustc9___rdl_oom>:
    1070:	53                   	push   %ebx
    1071:	83 ec 28             	sub    $0x28,%esp
    1074:	e8 00 00 00 00       	call   1079 <_RNvCs9xNfxAkRhBx_7___rustc9___rdl_oom+0x9>
    1079:	5b                   	pop    %ebx
    107a:	81 c3 7b 6f 00 00    	add    $0x6f7b,%ebx
    1080:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1084:	8d 44 24 04          	lea    0x4(%esp),%eax
    1088:	89 44 24 08          	mov    %eax,0x8(%esp)
    108c:	8d 83 6c c4 ff ff    	lea    -0x3b94(%ebx),%eax
    1092:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1096:	8d 83 38 fe ff ff    	lea    -0x1c8(%ebx),%eax
    109c:	89 44 24 10          	mov    %eax,0x10(%esp)
    10a0:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    10a7:	00 
    10a8:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    10af:	00 
    10b0:	8d 44 24 08          	lea    0x8(%esp),%eax
    10b4:	89 44 24 18          	mov    %eax,0x18(%esp)
    10b8:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    10bf:	00 
    10c0:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    10c4:	e8 87 01 00 00       	call   1250 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E>

000010c9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>:
    10c9:	53                   	push   %ebx
    10ca:	57                   	push   %edi
    10cb:	56                   	push   %esi
    10cc:	83 ec 30             	sub    $0x30,%esp
    10cf:	e8 00 00 00 00       	call   10d4 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E+0xb>
    10d4:	5b                   	pop    %ebx
    10d5:	81 c3 20 6f 00 00    	add    $0x6f20,%ebx
    10db:	89 e0                	mov    %esp,%eax
    10dd:	89 08                	mov    %ecx,(%eax)
    10df:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    10e3:	c7 01 d0 07 00 00    	movl   $0x7d0,(%ecx)
    10e9:	8d 54 24 08          	lea    0x8(%esp),%edx
    10ed:	89 0a                	mov    %ecx,(%edx)
    10ef:	8d b3 6c c4 ff ff    	lea    -0x3b94(%ebx),%esi
    10f5:	89 72 04             	mov    %esi,0x4(%edx)
    10f8:	8d bb d0 fe ff ff    	lea    -0x130(%ebx),%edi
    10fe:	8d 4c 24 18          	lea    0x18(%esp),%ecx
    1102:	89 39                	mov    %edi,(%ecx)
    1104:	6a 02                	push   $0x2
    1106:	5f                   	pop    %edi
    1107:	89 79 04             	mov    %edi,0x4(%ecx)
    110a:	83 61 10 00          	andl   $0x0,0x10(%ecx)
    110e:	89 42 08             	mov    %eax,0x8(%edx)
    1111:	89 72 0c             	mov    %esi,0xc(%edx)
    1114:	89 51 08             	mov    %edx,0x8(%ecx)
    1117:	89 79 0c             	mov    %edi,0xc(%ecx)
    111a:	8d 93 78 fe ff ff    	lea    -0x188(%ebx),%edx
    1120:	e8 0b 00 00 00       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    1125:	66 90                	xchg   %ax,%ax
    1127:	66 90                	xchg   %ax,%ax
    1129:	66 90                	xchg   %ax,%ax
    112b:	66 90                	xchg   %ax,%ax
    112d:	66 90                	xchg   %ax,%ax
    112f:	90                   	nop

00001130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>:
    1130:	53                   	push   %ebx
    1131:	83 ec 18             	sub    $0x18,%esp
    1134:	e8 00 00 00 00       	call   1139 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE+0x9>
    1139:	5b                   	pop    %ebx
    113a:	81 c3 bb 6e 00 00    	add    $0x6ebb,%ebx
    1140:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1144:	89 54 24 10          	mov    %edx,0x10(%esp)
    1148:	66 c7 44 24 14 01 00 	movw   $0x1,0x14(%esp)
    114f:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    1153:	e8 48 25 00 00       	call   36a0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>
    1158:	66 90                	xchg   %ax,%ax
    115a:	66 90                	xchg   %ax,%ax
    115c:	66 90                	xchg   %ax,%ax
    115e:	66 90                	xchg   %ax,%ax

00001160 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>:
    1160:	53                   	push   %ebx
    1161:	83 ec 28             	sub    $0x28,%esp
    1164:	89 ca                	mov    %ecx,%edx
    1166:	e8 00 00 00 00       	call   116b <_ZN4core9panicking5panic17hdc0bb452f89252d5E+0xb>
    116b:	5b                   	pop    %ebx
    116c:	81 c3 89 6e 00 00    	add    $0x6e89,%ebx
    1172:	8d 83 3c e6 ff ff    	lea    -0x19c4(%ebx),%eax
    1178:	89 44 24 08          	mov    %eax,0x8(%esp)
    117c:	c7 44 24 0c 13 00 00 	movl   $0x13,0xc(%esp)
    1183:	00 
    1184:	8d 44 24 08          	lea    0x8(%esp),%eax
    1188:	89 44 24 10          	mov    %eax,0x10(%esp)
    118c:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    1193:	00 
    1194:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    119b:	00 
    119c:	c7 44 24 18 04 00 00 	movl   $0x4,0x18(%esp)
    11a3:	00 
    11a4:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    11ab:	00 
    11ac:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    11b0:	e8 7b ff ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    11b5:	66 90                	xchg   %ax,%ax
    11b7:	66 90                	xchg   %ax,%ax
    11b9:	66 90                	xchg   %ax,%ax
    11bb:	66 90                	xchg   %ax,%ax
    11bd:	66 90                	xchg   %ax,%ax
    11bf:	90                   	nop

000011c0 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>:
    11c0:	53                   	push   %ebx
    11c1:	57                   	push   %edi
    11c2:	56                   	push   %esi
    11c3:	83 ec 40             	sub    $0x40,%esp
    11c6:	89 d0                	mov    %edx,%eax
    11c8:	e8 00 00 00 00       	call   11cd <_ZN4core6result13unwrap_failed17he01453759a0dabd3E+0xd>
    11cd:	5b                   	pop    %ebx
    11ce:	81 c3 27 6e 00 00    	add    $0x6e27,%ebx
    11d4:	8b 54 24 58          	mov    0x58(%esp),%edx
    11d8:	8b 74 24 54          	mov    0x54(%esp),%esi
    11dc:	8b 7c 24 50          	mov    0x50(%esp),%edi
    11e0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    11e4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    11e8:	89 7c 24 10          	mov    %edi,0x10(%esp)
    11ec:	89 74 24 14          	mov    %esi,0x14(%esp)
    11f0:	8d 44 24 08          	lea    0x8(%esp),%eax
    11f4:	89 44 24 18          	mov    %eax,0x18(%esp)
    11f8:	8d 83 fc cd ff ff    	lea    -0x3204(%ebx),%eax
    11fe:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1202:	8d 44 24 10          	lea    0x10(%esp),%eax
    1206:	89 44 24 20          	mov    %eax,0x20(%esp)
    120a:	8d 83 2c ce ff ff    	lea    -0x31d4(%ebx),%eax
    1210:	89 44 24 24          	mov    %eax,0x24(%esp)
    1214:	8d 83 e0 fe ff ff    	lea    -0x120(%ebx),%eax
    121a:	89 44 24 28          	mov    %eax,0x28(%esp)
    121e:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    1225:	00 
    1226:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
    122d:	00 
    122e:	8d 44 24 18          	lea    0x18(%esp),%eax
    1232:	89 44 24 30          	mov    %eax,0x30(%esp)
    1236:	c7 44 24 34 02 00 00 	movl   $0x2,0x34(%esp)
    123d:	00 
    123e:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    1242:	e8 e9 fe ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    1247:	66 90                	xchg   %ax,%ax
    1249:	66 90                	xchg   %ax,%ax
    124b:	66 90                	xchg   %ax,%ax
    124d:	66 90                	xchg   %ax,%ax
    124f:	90                   	nop

00001250 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E>:
    1250:	53                   	push   %ebx
    1251:	83 ec 28             	sub    $0x28,%esp
    1254:	e8 00 00 00 00       	call   1259 <_ZN4core9panicking18panic_nounwind_fmt17hebbe881a71c93670E+0x9>
    1259:	5b                   	pop    %ebx
    125a:	81 c3 9b 6d 00 00    	add    $0x6d9b,%ebx
    1260:	8b 41 14             	mov    0x14(%ecx),%eax
    1263:	89 44 24 24          	mov    %eax,0x24(%esp)
    1267:	8b 41 10             	mov    0x10(%ecx),%eax
    126a:	89 44 24 20          	mov    %eax,0x20(%esp)
    126e:	8b 41 0c             	mov    0xc(%ecx),%eax
    1271:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1275:	8b 41 08             	mov    0x8(%ecx),%eax
    1278:	89 44 24 18          	mov    %eax,0x18(%esp)
    127c:	8b 01                	mov    (%ecx),%eax
    127e:	8b 49 04             	mov    0x4(%ecx),%ecx
    1281:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1285:	89 44 24 10          	mov    %eax,0x10(%esp)
    1289:	8d 44 24 10          	lea    0x10(%esp),%eax
    128d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1291:	8d 83 48 fe ff ff    	lea    -0x1b8(%ebx),%eax
    1297:	89 44 24 08          	mov    %eax,0x8(%esp)
    129b:	66 c7 44 24 0c 00 00 	movw   $0x0,0xc(%esp)
    12a2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    12a6:	e8 f5 23 00 00       	call   36a0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>
    12ab:	66 90                	xchg   %ax,%ax
    12ad:	66 90                	xchg   %ax,%ax
    12af:	90                   	nop

000012b0 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler>:
    12b0:	53                   	push   %ebx
    12b1:	83 ec 08             	sub    $0x8,%esp
    12b4:	e8 00 00 00 00       	call   12b9 <_RNvCs9xNfxAkRhBx_7___rustc26___rust_alloc_error_handler+0x9>
    12b9:	5b                   	pop    %ebx
    12ba:	81 c3 3b 6d 00 00    	add    $0x6d3b,%ebx
    12c0:	e8 ab fd ff ff       	call   1070 <_RNvCs9xNfxAkRhBx_7___rustc9___rdl_oom>
    12c5:	66 90                	xchg   %ax,%ax
    12c7:	66 90                	xchg   %ax,%ax
    12c9:	66 90                	xchg   %ax,%ax
    12cb:	66 90                	xchg   %ax,%ax
    12cd:	66 90                	xchg   %ax,%ax
    12cf:	90                   	nop

000012d0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E>:
    12d0:	55                   	push   %ebp
    12d1:	53                   	push   %ebx
    12d2:	57                   	push   %edi
    12d3:	56                   	push   %esi
    12d4:	83 ec 2c             	sub    $0x2c,%esp
    12d7:	e8 00 00 00 00       	call   12dc <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xc>
    12dc:	5b                   	pop    %ebx
    12dd:	81 c3 18 6d 00 00    	add    $0x6d18,%ebx
    12e3:	8b 7c 24 44          	mov    0x44(%esp),%edi
    12e7:	8b 44 24 40          	mov    0x40(%esp),%eax
    12eb:	8b 00                	mov    (%eax),%eax
    12ed:	89 44 24 08          	mov    %eax,0x8(%esp)
    12f1:	8b 17                	mov    (%edi),%edx
    12f3:	8b 77 04             	mov    0x4(%edi),%esi
    12f6:	8b 4e 0c             	mov    0xc(%esi),%ecx
    12f9:	83 ec 04             	sub    $0x4,%esp
    12fc:	8d 83 33 e6 ff ff    	lea    -0x19cd(%ebx),%eax
    1302:	6a 09                	push   $0x9
    1304:	50                   	push   %eax
    1305:	89 d5                	mov    %edx,%ebp
    1307:	52                   	push   %edx
    1308:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    130c:	ff d1                	call   *%ecx
    130e:	83 c4 10             	add    $0x10,%esp
    1311:	b1 01                	mov    $0x1,%cl
    1313:	84 c0                	test   %al,%al
    1315:	0f 85 e6 00 00 00    	jne    1401 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    131b:	f6 47 0a 80          	testb  $0x80,0xa(%edi)
    131f:	75 42                	jne    1363 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x93>
    1321:	83 ec 04             	sub    $0x4,%esp
    1324:	8d 83 ee eb ff ff    	lea    -0x1412(%ebx),%eax
    132a:	6a 01                	push   $0x1
    132c:	50                   	push   %eax
    132d:	55                   	push   %ebp
    132e:	ff 54 24 1c          	call   *0x1c(%esp)
    1332:	83 c4 10             	add    $0x10,%esp
    1335:	84 c0                	test   %al,%al
    1337:	0f 85 8c 00 00 00    	jne    13c9 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xf9>
    133d:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    1341:	8b 74 24 44          	mov    0x44(%esp),%esi
    1345:	89 f2                	mov    %esi,%edx
    1347:	e8 f4 00 00 00       	call   1440 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>
    134c:	84 c0                	test   %al,%al
    134e:	b1 01                	mov    $0x1,%cl
    1350:	0f 85 ab 00 00 00    	jne    1401 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    1356:	8b 3e                	mov    (%esi),%edi
    1358:	8b 46 04             	mov    0x4(%esi),%eax
    135b:	8b 68 0c             	mov    0xc(%eax),%ebp
    135e:	e9 8a 00 00 00       	jmp    13ed <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x11d>
    1363:	83 ec 04             	sub    $0x4,%esp
    1366:	8d 83 ef eb ff ff    	lea    -0x1411(%ebx),%eax
    136c:	6a 02                	push   $0x2
    136e:	50                   	push   %eax
    136f:	89 ef                	mov    %ebp,%edi
    1371:	55                   	push   %ebp
    1372:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1376:	ff d5                	call   *%ebp
    1378:	83 c4 10             	add    $0x10,%esp
    137b:	84 c0                	test   %al,%al
    137d:	75 4a                	jne    13c9 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xf9>
    137f:	c6 44 24 07 01       	movb   $0x1,0x7(%esp)
    1384:	89 7c 24 20          	mov    %edi,0x20(%esp)
    1388:	89 74 24 24          	mov    %esi,0x24(%esp)
    138c:	8d 44 24 07          	lea    0x7(%esp),%eax
    1390:	89 44 24 28          	mov    %eax,0x28(%esp)
    1394:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    1398:	8b 41 08             	mov    0x8(%ecx),%eax
    139b:	8b 49 0c             	mov    0xc(%ecx),%ecx
    139e:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    13a2:	89 44 24 18          	mov    %eax,0x18(%esp)
    13a6:	8d 44 24 20          	lea    0x20(%esp),%eax
    13aa:	89 44 24 10          	mov    %eax,0x10(%esp)
    13ae:	8d 83 f0 fe ff ff    	lea    -0x110(%ebx),%eax
    13b4:	89 44 24 14          	mov    %eax,0x14(%esp)
    13b8:	8d 54 24 10          	lea    0x10(%esp),%edx
    13bc:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    13c0:	e8 7b 00 00 00       	call   1440 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>
    13c5:	84 c0                	test   %al,%al
    13c7:	74 04                	je     13cd <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0xfd>
    13c9:	b1 01                	mov    $0x1,%cl
    13cb:	eb 34                	jmp    1401 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    13cd:	8b 44 24 14          	mov    0x14(%esp),%eax
    13d1:	83 ec 04             	sub    $0x4,%esp
    13d4:	8d 8b e9 eb ff ff    	lea    -0x1417(%ebx),%ecx
    13da:	6a 02                	push   $0x2
    13dc:	51                   	push   %ecx
    13dd:	ff 74 24 1c          	push   0x1c(%esp)
    13e1:	ff 50 0c             	call   *0xc(%eax)
    13e4:	83 c4 10             	add    $0x10,%esp
    13e7:	84 c0                	test   %al,%al
    13e9:	b1 01                	mov    $0x1,%cl
    13eb:	75 14                	jne    1401 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h0a55bb3fc6e7cb48E+0x131>
    13ed:	83 ec 04             	sub    $0x4,%esp
    13f0:	8d 83 91 eb ff ff    	lea    -0x146f(%ebx),%eax
    13f6:	6a 01                	push   $0x1
    13f8:	50                   	push   %eax
    13f9:	57                   	push   %edi
    13fa:	ff d5                	call   *%ebp
    13fc:	83 c4 10             	add    $0x10,%esp
    13ff:	89 c1                	mov    %eax,%ecx
    1401:	89 c8                	mov    %ecx,%eax
    1403:	83 c4 2c             	add    $0x2c,%esp
    1406:	5e                   	pop    %esi
    1407:	5f                   	pop    %edi
    1408:	5b                   	pop    %ebx
    1409:	5d                   	pop    %ebp
    140a:	c3                   	ret
    140b:	66 90                	xchg   %ax,%ax
    140d:	66 90                	xchg   %ax,%ax
    140f:	90                   	nop

00001410 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c10eea8ba9fb618E>:
    1410:	53                   	push   %ebx
    1411:	83 ec 08             	sub    $0x8,%esp
    1414:	e8 00 00 00 00       	call   1419 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h1c10eea8ba9fb618E+0x9>
    1419:	5b                   	pop    %ebx
    141a:	81 c3 db 6b 00 00    	add    $0x6bdb,%ebx
    1420:	8b 44 24 10          	mov    0x10(%esp),%eax
    1424:	83 ec 08             	sub    $0x8,%esp
    1427:	ff 74 24 1c          	push   0x1c(%esp)
    142b:	ff 30                	push   (%eax)
    142d:	e8 ee 0e 00 00       	call   2320 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>
    1432:	83 c4 18             	add    $0x18,%esp
    1435:	5b                   	pop    %ebx
    1436:	c3                   	ret
    1437:	66 90                	xchg   %ax,%ax
    1439:	66 90                	xchg   %ax,%ax
    143b:	66 90                	xchg   %ax,%ax
    143d:	66 90                	xchg   %ax,%ax
    143f:	90                   	nop

00001440 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE>:
    1440:	53                   	push   %ebx
    1441:	57                   	push   %edi
    1442:	56                   	push   %esi
    1443:	81 ec 80 00 00 00    	sub    $0x80,%esp
    1449:	e8 00 00 00 00       	call   144e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xe>
    144e:	5b                   	pop    %ebx
    144f:	81 c3 a6 6b 00 00    	add    $0x6ba6,%ebx
    1455:	8b 42 08             	mov    0x8(%edx),%eax
    1458:	a9 00 00 00 02       	test   $0x2000000,%eax
    145d:	75 1b                	jne    147a <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x3a>
    145f:	a9 00 00 00 04       	test   $0x4000000,%eax
    1464:	75 51                	jne    14b7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x77>
    1466:	83 ec 08             	sub    $0x8,%esp
    1469:	52                   	push   %edx
    146a:	51                   	push   %ecx
    146b:	e8 f0 2f 00 00       	call   4460 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>
    1470:	81 c4 90 00 00 00    	add    $0x90,%esp
    1476:	5e                   	pop    %esi
    1477:	5f                   	pop    %edi
    1478:	5b                   	pop    %ebx
    1479:	c3                   	ret
    147a:	8b 01                	mov    (%ecx),%eax
    147c:	b9 81 00 00 00       	mov    $0x81,%ecx
    1481:	eb 23                	jmp    14a6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x66>
    1483:	90                   	nop
    1484:	90                   	nop
    1485:	90                   	nop
    1486:	90                   	nop
    1487:	90                   	nop
    1488:	90                   	nop
    1489:	90                   	nop
    148a:	90                   	nop
    148b:	90                   	nop
    148c:	90                   	nop
    148d:	90                   	nop
    148e:	90                   	nop
    148f:	90                   	nop
    1490:	80 c1 57             	add    $0x57,%cl
    1493:	89 c7                	mov    %eax,%edi
    1495:	c1 ef 04             	shr    $0x4,%edi
    1498:	88 4c 34 fe          	mov    %cl,-0x2(%esp,%esi,1)
    149c:	8d 4e ff             	lea    -0x1(%esi),%ecx
    149f:	83 f8 0f             	cmp    $0xf,%eax
    14a2:	89 f8                	mov    %edi,%eax
    14a4:	76 41                	jbe    14e7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xa7>
    14a6:	89 ce                	mov    %ecx,%esi
    14a8:	89 c1                	mov    %eax,%ecx
    14aa:	80 e1 0f             	and    $0xf,%cl
    14ad:	80 f9 0a             	cmp    $0xa,%cl
    14b0:	73 de                	jae    1490 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x50>
    14b2:	80 c9 30             	or     $0x30,%cl
    14b5:	eb dc                	jmp    1493 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x53>
    14b7:	8b 01                	mov    (%ecx),%eax
    14b9:	b9 81 00 00 00       	mov    $0x81,%ecx
    14be:	eb 16                	jmp    14d6 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x96>
    14c0:	80 c1 37             	add    $0x37,%cl
    14c3:	89 c7                	mov    %eax,%edi
    14c5:	c1 ef 04             	shr    $0x4,%edi
    14c8:	88 4c 34 fe          	mov    %cl,-0x2(%esp,%esi,1)
    14cc:	8d 4e ff             	lea    -0x1(%esi),%ecx
    14cf:	83 f8 0f             	cmp    $0xf,%eax
    14d2:	89 f8                	mov    %edi,%eax
    14d4:	76 11                	jbe    14e7 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0xa7>
    14d6:	89 ce                	mov    %ecx,%esi
    14d8:	89 c1                	mov    %eax,%ecx
    14da:	80 e1 0f             	and    $0xf,%cl
    14dd:	80 f9 0a             	cmp    $0xa,%cl
    14e0:	73 de                	jae    14c0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x80>
    14e2:	80 c9 30             	or     $0x30,%cl
    14e5:	eb dc                	jmp    14c3 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h370a393ac022ab6dE+0x83>
    14e7:	83 c6 fe             	add    $0xfffffffe,%esi
    14ea:	8d 04 34             	lea    (%esp,%esi,1),%eax
    14ed:	be 81 00 00 00       	mov    $0x81,%esi
    14f2:	29 ce                	sub    %ecx,%esi
    14f4:	8d bb f1 eb ff ff    	lea    -0x140f(%ebx),%edi
    14fa:	89 d1                	mov    %edx,%ecx
    14fc:	ba 01 00 00 00       	mov    $0x1,%edx
    1501:	56                   	push   %esi
    1502:	50                   	push   %eax
    1503:	6a 02                	push   $0x2
    1505:	57                   	push   %edi
    1506:	e8 65 30 00 00       	call   4570 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    150b:	83 c4 10             	add    $0x10,%esp
    150e:	81 c4 80 00 00 00    	add    $0x80,%esp
    1514:	5e                   	pop    %esi
    1515:	5f                   	pop    %edi
    1516:	5b                   	pop    %ebx
    1517:	c3                   	ret
    1518:	66 90                	xchg   %ax,%ax
    151a:	66 90                	xchg   %ax,%ax
    151c:	66 90                	xchg   %ax,%ax
    151e:	66 90                	xchg   %ax,%ax

00001520 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E>:
    1520:	55                   	push   %ebp
    1521:	53                   	push   %ebx
    1522:	57                   	push   %edi
    1523:	56                   	push   %esi
    1524:	83 ec 3c             	sub    $0x3c,%esp
    1527:	e8 00 00 00 00       	call   152c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0xc>
    152c:	5b                   	pop    %ebx
    152d:	81 c3 c8 6a 00 00    	add    $0x6ac8,%ebx
    1533:	8b 44 24 54          	mov    0x54(%esp),%eax
    1537:	8b 4c 24 50          	mov    0x50(%esp),%ecx
    153b:	8b 09                	mov    (%ecx),%ecx
    153d:	8b 11                	mov    (%ecx),%edx
    153f:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1543:	8b 79 04             	mov    0x4(%ecx),%edi
    1546:	8b 28                	mov    (%eax),%ebp
    1548:	8b 70 04             	mov    0x4(%eax),%esi
    154b:	8b 4e 0c             	mov    0xc(%esi),%ecx
    154e:	83 ec 04             	sub    $0x4,%esp
    1551:	8d 83 93 eb ff ff    	lea    -0x146d(%ebx),%eax
    1557:	6a 0c                	push   $0xc
    1559:	50                   	push   %eax
    155a:	55                   	push   %ebp
    155b:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    155f:	ff d1                	call   *%ecx
    1561:	83 c4 10             	add    $0x10,%esp
    1564:	b1 01                	mov    $0x1,%cl
    1566:	84 c0                	test   %al,%al
    1568:	0f 85 d0 00 00 00    	jne    163e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    156e:	8d 47 08             	lea    0x8(%edi),%eax
    1571:	89 7c 24 04          	mov    %edi,0x4(%esp)
    1575:	83 c7 0c             	add    $0xc,%edi
    1578:	8d 8b fc cd ff ff    	lea    -0x3204(%ebx),%ecx
    157e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1582:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1586:	8d 83 7c d0 ff ff    	lea    -0x2f84(%ebx),%eax
    158c:	89 44 24 10          	mov    %eax,0x10(%esp)
    1590:	89 7c 24 14          	mov    %edi,0x14(%esp)
    1594:	89 44 24 18          	mov    %eax,0x18(%esp)
    1598:	8d 83 b8 fe ff ff    	lea    -0x148(%ebx),%eax
    159e:	89 44 24 24          	mov    %eax,0x24(%esp)
    15a2:	c7 44 24 28 03 00 00 	movl   $0x3,0x28(%esp)
    15a9:	00 
    15aa:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
    15b1:	00 
    15b2:	8d 7c 24 04          	lea    0x4(%esp),%edi
    15b6:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    15ba:	c7 44 24 30 03 00 00 	movl   $0x3,0x30(%esp)
    15c1:	00 
    15c2:	83 ec 0c             	sub    $0xc,%esp
    15c5:	8d 44 24 30          	lea    0x30(%esp),%eax
    15c9:	89 e9                	mov    %ebp,%ecx
    15cb:	89 f2                	mov    %esi,%edx
    15cd:	50                   	push   %eax
    15ce:	e8 7d 38 00 00       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    15d3:	83 c4 10             	add    $0x10,%esp
    15d6:	84 c0                	test   %al,%al
    15d8:	74 04                	je     15de <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0xbe>
    15da:	b1 01                	mov    $0x1,%cl
    15dc:	eb 60                	jmp    163e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    15de:	83 ec 04             	sub    $0x4,%esp
    15e1:	8d 83 9f eb ff ff    	lea    -0x1461(%ebx),%eax
    15e7:	6a 02                	push   $0x2
    15e9:	50                   	push   %eax
    15ea:	55                   	push   %ebp
    15eb:	ff 54 24 30          	call   *0x30(%esp)
    15ef:	83 c4 10             	add    $0x10,%esp
    15f2:	84 c0                	test   %al,%al
    15f4:	b1 01                	mov    $0x1,%cl
    15f6:	75 46                	jne    163e <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x11e>
    15f8:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    15fc:	8b 42 14             	mov    0x14(%edx),%eax
    15ff:	89 44 24 18          	mov    %eax,0x18(%esp)
    1603:	8b 42 10             	mov    0x10(%edx),%eax
    1606:	89 44 24 14          	mov    %eax,0x14(%esp)
    160a:	8b 42 0c             	mov    0xc(%edx),%eax
    160d:	89 44 24 10          	mov    %eax,0x10(%esp)
    1611:	8b 42 08             	mov    0x8(%edx),%eax
    1614:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1618:	8b 0a                	mov    (%edx),%ecx
    161a:	8b 42 04             	mov    0x4(%edx),%eax
    161d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1621:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1625:	83 f8 01             	cmp    $0x1,%eax
    1628:	74 02                	je     162c <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h67e6c3f5df774723E+0x10c>
    162a:	85 c0                	test   %eax,%eax
    162c:	83 ec 0c             	sub    $0xc,%esp
    162f:	89 e9                	mov    %ebp,%ecx
    1631:	89 f2                	mov    %esi,%edx
    1633:	57                   	push   %edi
    1634:	e8 17 38 00 00       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    1639:	83 c4 10             	add    $0x10,%esp
    163c:	89 c1                	mov    %eax,%ecx
    163e:	89 c8                	mov    %ecx,%eax
    1640:	83 c4 3c             	add    $0x3c,%esp
    1643:	5e                   	pop    %esi
    1644:	5f                   	pop    %edi
    1645:	5b                   	pop    %ebx
    1646:	5d                   	pop    %ebp
    1647:	c3                   	ret
    1648:	66 90                	xchg   %ax,%ax
    164a:	66 90                	xchg   %ax,%ax
    164c:	66 90                	xchg   %ax,%ax
    164e:	66 90                	xchg   %ax,%ax

00001650 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h744bf35b61fad11fE>:
    1650:	53                   	push   %ebx
    1651:	83 ec 08             	sub    $0x8,%esp
    1654:	e8 00 00 00 00       	call   1659 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h744bf35b61fad11fE+0x9>
    1659:	5b                   	pop    %ebx
    165a:	81 c3 9b 69 00 00    	add    $0x699b,%ebx
    1660:	8b 44 24 14          	mov    0x14(%esp),%eax
    1664:	8b 48 04             	mov    0x4(%eax),%ecx
    1667:	83 ec 04             	sub    $0x4,%esp
    166a:	8d 93 aa e9 ff ff    	lea    -0x1656(%ebx),%edx
    1670:	6a 0d                	push   $0xd
    1672:	52                   	push   %edx
    1673:	ff 30                	push   (%eax)
    1675:	ff 51 0c             	call   *0xc(%ecx)
    1678:	83 c4 18             	add    $0x18,%esp
    167b:	5b                   	pop    %ebx
    167c:	c3                   	ret
    167d:	66 90                	xchg   %ax,%ax
    167f:	90                   	nop

00001680 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h85bd4713be9ebf66E>:
    1680:	53                   	push   %ebx
    1681:	83 ec 08             	sub    $0x8,%esp
    1684:	e8 00 00 00 00       	call   1689 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h85bd4713be9ebf66E+0x9>
    1689:	5b                   	pop    %ebx
    168a:	81 c3 6b 69 00 00    	add    $0x696b,%ebx
    1690:	8b 44 24 14          	mov    0x14(%esp),%eax
    1694:	8b 48 04             	mov    0x4(%eax),%ecx
    1697:	83 ec 04             	sub    $0x4,%esp
    169a:	8d 93 bb ec ff ff    	lea    -0x1345(%ebx),%edx
    16a0:	6a 18                	push   $0x18
    16a2:	52                   	push   %edx
    16a3:	ff 30                	push   (%eax)
    16a5:	ff 51 0c             	call   *0xc(%ecx)
    16a8:	83 c4 18             	add    $0x18,%esp
    16ab:	5b                   	pop    %ebx
    16ac:	c3                   	ret
    16ad:	66 90                	xchg   %ax,%ax
    16af:	90                   	nop

000016b0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE>:
    16b0:	53                   	push   %ebx
    16b1:	83 ec 28             	sub    $0x28,%esp
    16b4:	e8 00 00 00 00       	call   16b9 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE+0x9>
    16b9:	5b                   	pop    %ebx
    16ba:	81 c3 3b 69 00 00    	add    $0x693b,%ebx
    16c0:	8b 44 24 34          	mov    0x34(%esp),%eax
    16c4:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    16c8:	8b 09                	mov    (%ecx),%ecx
    16ca:	83 39 00             	cmpl   $0x0,(%ecx)
    16cd:	74 57                	je     1726 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8ba23cf86a527b7cE+0x76>
    16cf:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    16d3:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    16d7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    16db:	8d 8b 1c 94 ff ff    	lea    -0x6be4(%ebx),%ecx
    16e1:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    16e5:	8d 8b 10 fe ff ff    	lea    -0x1f0(%ebx),%ecx
    16eb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    16ef:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    16f6:	00 
    16f7:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    16fe:	00 
    16ff:	8d 4c 24 08          	lea    0x8(%esp),%ecx
    1703:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1707:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
    170e:	00 
    170f:	8b 08                	mov    (%eax),%ecx
    1711:	8b 50 04             	mov    0x4(%eax),%edx
    1714:	83 ec 0c             	sub    $0xc,%esp
    1717:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    171b:	50                   	push   %eax
    171c:	e8 2f 37 00 00       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    1721:	83 c4 38             	add    $0x38,%esp
    1724:	5b                   	pop    %ebx
    1725:	c3                   	ret
    1726:	8b 48 04             	mov    0x4(%eax),%ecx
    1729:	83 ec 04             	sub    $0x4,%esp
    172c:	8d 93 b7 e9 ff ff    	lea    -0x1649(%ebx),%edx
    1732:	6a 17                	push   $0x17
    1734:	52                   	push   %edx
    1735:	ff 30                	push   (%eax)
    1737:	ff 51 0c             	call   *0xc(%ecx)
    173a:	83 c4 38             	add    $0x38,%esp
    173d:	5b                   	pop    %ebx
    173e:	c3                   	ret
    173f:	90                   	nop

00001740 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9455cc26f8a63d55E>:
    1740:	53                   	push   %ebx
    1741:	56                   	push   %esi
    1742:	50                   	push   %eax
    1743:	e8 00 00 00 00       	call   1748 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h9455cc26f8a63d55E+0x8>
    1748:	5b                   	pop    %ebx
    1749:	81 c3 ac 68 00 00    	add    $0x68ac,%ebx
    174f:	8b 44 24 14          	mov    0x14(%esp),%eax
    1753:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    1757:	8b 31                	mov    (%ecx),%esi
    1759:	8b 08                	mov    (%eax),%ecx
    175b:	8b 50 04             	mov    0x4(%eax),%edx
    175e:	89 34 24             	mov    %esi,(%esp)
    1761:	e8 ea 36 00 00       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    1766:	83 c4 04             	add    $0x4,%esp
    1769:	5e                   	pop    %esi
    176a:	5b                   	pop    %ebx
    176b:	c3                   	ret
    176c:	66 90                	xchg   %ax,%ax
    176e:	66 90                	xchg   %ax,%ax

00001770 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE>:
    1770:	53                   	push   %ebx
    1771:	57                   	push   %edi
    1772:	56                   	push   %esi
    1773:	81 ec 80 00 00 00    	sub    $0x80,%esp
    1779:	e8 00 00 00 00       	call   177e <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0xe>
    177e:	5b                   	pop    %ebx
    177f:	81 c3 76 68 00 00    	add    $0x6876,%ebx
    1785:	8b 8c 24 94 00 00 00 	mov    0x94(%esp),%ecx
    178c:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    1793:	8b 51 08             	mov    0x8(%ecx),%edx
    1796:	f7 c2 00 00 00 02    	test   $0x2000000,%edx
    179c:	75 16                	jne    17b4 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x44>
    179e:	f7 c2 00 00 00 04    	test   $0x4000000,%edx
    17a4:	75 41                	jne    17e7 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x77>
    17a6:	81 c4 80 00 00 00    	add    $0x80,%esp
    17ac:	5e                   	pop    %esi
    17ad:	5f                   	pop    %edi
    17ae:	5b                   	pop    %ebx
    17af:	e9 ac 2c 00 00       	jmp    4460 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>
    17b4:	8b 00                	mov    (%eax),%eax
    17b6:	ba 81 00 00 00       	mov    $0x81,%edx
    17bb:	eb 19                	jmp    17d6 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x66>
    17bd:	90                   	nop
    17be:	90                   	nop
    17bf:	90                   	nop
    17c0:	80 c2 57             	add    $0x57,%dl
    17c3:	89 c7                	mov    %eax,%edi
    17c5:	c1 ef 04             	shr    $0x4,%edi
    17c8:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    17cc:	8d 56 ff             	lea    -0x1(%esi),%edx
    17cf:	83 f8 0f             	cmp    $0xf,%eax
    17d2:	89 f8                	mov    %edi,%eax
    17d4:	76 41                	jbe    1817 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0xa7>
    17d6:	89 d6                	mov    %edx,%esi
    17d8:	89 c2                	mov    %eax,%edx
    17da:	80 e2 0f             	and    $0xf,%dl
    17dd:	80 fa 0a             	cmp    $0xa,%dl
    17e0:	73 de                	jae    17c0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x50>
    17e2:	80 ca 30             	or     $0x30,%dl
    17e5:	eb dc                	jmp    17c3 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x53>
    17e7:	8b 00                	mov    (%eax),%eax
    17e9:	ba 81 00 00 00       	mov    $0x81,%edx
    17ee:	eb 16                	jmp    1806 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x96>
    17f0:	80 c2 37             	add    $0x37,%dl
    17f3:	89 c7                	mov    %eax,%edi
    17f5:	c1 ef 04             	shr    $0x4,%edi
    17f8:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    17fc:	8d 56 ff             	lea    -0x1(%esi),%edx
    17ff:	83 f8 0f             	cmp    $0xf,%eax
    1802:	89 f8                	mov    %edi,%eax
    1804:	76 11                	jbe    1817 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0xa7>
    1806:	89 d6                	mov    %edx,%esi
    1808:	89 c2                	mov    %eax,%edx
    180a:	80 e2 0f             	and    $0xf,%dl
    180d:	80 fa 0a             	cmp    $0xa,%dl
    1810:	73 de                	jae    17f0 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x80>
    1812:	80 ca 30             	or     $0x30,%dl
    1815:	eb dc                	jmp    17f3 <_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17hc3e369e9f8fef25cE+0x83>
    1817:	83 c6 fe             	add    $0xfffffffe,%esi
    181a:	8d 04 34             	lea    (%esp,%esi,1),%eax
    181d:	be 81 00 00 00       	mov    $0x81,%esi
    1822:	29 d6                	sub    %edx,%esi
    1824:	8d bb f1 eb ff ff    	lea    -0x140f(%ebx),%edi
    182a:	ba 01 00 00 00       	mov    $0x1,%edx
    182f:	56                   	push   %esi
    1830:	50                   	push   %eax
    1831:	6a 02                	push   $0x2
    1833:	57                   	push   %edi
    1834:	e8 37 2d 00 00       	call   4570 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    1839:	83 c4 10             	add    $0x10,%esp
    183c:	81 c4 80 00 00 00    	add    $0x80,%esp
    1842:	5e                   	pop    %esi
    1843:	5f                   	pop    %edi
    1844:	5b                   	pop    %ebx
    1845:	c3                   	ret
    1846:	66 90                	xchg   %ax,%ax
    1848:	66 90                	xchg   %ax,%ax
    184a:	66 90                	xchg   %ax,%ax
    184c:	66 90                	xchg   %ax,%ax
    184e:	66 90                	xchg   %ax,%ax

00001850 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E>:
    1850:	53                   	push   %ebx
    1851:	57                   	push   %edi
    1852:	56                   	push   %esi
    1853:	83 ec 10             	sub    $0x10,%esp
    1856:	e8 00 00 00 00       	call   185b <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xb>
    185b:	5b                   	pop    %ebx
    185c:	81 c3 99 67 00 00    	add    $0x6799,%ebx
    1862:	8b 44 24 24          	mov    0x24(%esp),%eax
    1866:	8b 74 24 20          	mov    0x20(%esp),%esi
    186a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1871:	00 
    1872:	3d 80 00 00 00       	cmp    $0x80,%eax
    1877:	73 1f                	jae    1898 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x48>
    1879:	88 44 24 0c          	mov    %al,0xc(%esp)
    187d:	b8 01 00 00 00       	mov    $0x1,%eax
    1882:	8b 0e                	mov    (%esi),%ecx
    1884:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    1887:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    188d:	0f 86 b9 00 00 00    	jbe    194c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    1893:	e9 cd 00 00 00       	jmp    1965 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    1898:	89 c1                	mov    %eax,%ecx
    189a:	3d 00 08 00 00       	cmp    $0x800,%eax
    189f:	73 2d                	jae    18ce <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x7e>
    18a1:	c1 e9 06             	shr    $0x6,%ecx
    18a4:	80 c9 c0             	or     $0xc0,%cl
    18a7:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    18ab:	24 3f                	and    $0x3f,%al
    18ad:	0c 80                	or     $0x80,%al
    18af:	88 44 24 0d          	mov    %al,0xd(%esp)
    18b3:	b8 02 00 00 00       	mov    $0x2,%eax
    18b8:	8b 0e                	mov    (%esi),%ecx
    18ba:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    18bd:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    18c3:	0f 86 83 00 00 00    	jbe    194c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    18c9:	e9 97 00 00 00       	jmp    1965 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    18ce:	3d 00 00 01 00       	cmp    $0x10000,%eax
    18d3:	73 35                	jae    190a <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xba>
    18d5:	c1 e9 0c             	shr    $0xc,%ecx
    18d8:	80 c9 e0             	or     $0xe0,%cl
    18db:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    18df:	89 c1                	mov    %eax,%ecx
    18e1:	c1 e9 06             	shr    $0x6,%ecx
    18e4:	80 e1 3f             	and    $0x3f,%cl
    18e7:	80 c9 80             	or     $0x80,%cl
    18ea:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    18ee:	24 3f                	and    $0x3f,%al
    18f0:	0c 80                	or     $0x80,%al
    18f2:	88 44 24 0e          	mov    %al,0xe(%esp)
    18f6:	b8 03 00 00 00       	mov    $0x3,%eax
    18fb:	8b 0e                	mov    (%esi),%ecx
    18fd:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    1900:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    1906:	76 44                	jbe    194c <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0xfc>
    1908:	eb 5b                	jmp    1965 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    190a:	c1 e9 12             	shr    $0x12,%ecx
    190d:	80 c9 f0             	or     $0xf0,%cl
    1910:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    1914:	89 c1                	mov    %eax,%ecx
    1916:	c1 e9 0c             	shr    $0xc,%ecx
    1919:	80 e1 3f             	and    $0x3f,%cl
    191c:	80 c9 80             	or     $0x80,%cl
    191f:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    1923:	89 c1                	mov    %eax,%ecx
    1925:	c1 e9 06             	shr    $0x6,%ecx
    1928:	80 e1 3f             	and    $0x3f,%cl
    192b:	80 c9 80             	or     $0x80,%cl
    192e:	88 4c 24 0e          	mov    %cl,0xe(%esp)
    1932:	24 3f                	and    $0x3f,%al
    1934:	0c 80                	or     $0x80,%al
    1936:	88 44 24 0f          	mov    %al,0xf(%esp)
    193a:	b8 04 00 00 00       	mov    $0x4,%eax
    193f:	8b 0e                	mov    (%esi),%ecx
    1941:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    1944:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    194a:	77 19                	ja     1965 <_ZN4core3fmt5Write10write_char17h87b203a6199c2fc3E+0x115>
    194c:	01 f1                	add    %esi,%ecx
    194e:	83 c1 04             	add    $0x4,%ecx
    1951:	83 ec 04             	sub    $0x4,%esp
    1954:	8d 54 24 10          	lea    0x10(%esp),%edx
    1958:	50                   	push   %eax
    1959:	52                   	push   %edx
    195a:	51                   	push   %ecx
    195b:	e8 10 41 00 00       	call   5a70 <memcpy>
    1960:	83 c4 10             	add    $0x10,%esp
    1963:	89 3e                	mov    %edi,(%esi)
    1965:	81 ff 00 01 00 00    	cmp    $0x100,%edi
    196b:	0f 93 c0             	setae  %al
    196e:	83 c4 10             	add    $0x10,%esp
    1971:	5e                   	pop    %esi
    1972:	5f                   	pop    %edi
    1973:	5b                   	pop    %ebx
    1974:	c3                   	ret
    1975:	66 90                	xchg   %ax,%ax
    1977:	66 90                	xchg   %ax,%ax
    1979:	66 90                	xchg   %ax,%ax
    197b:	66 90                	xchg   %ax,%ax
    197d:	66 90                	xchg   %ax,%ax
    197f:	90                   	nop

00001980 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE>:
    1980:	53                   	push   %ebx
    1981:	83 ec 08             	sub    $0x8,%esp
    1984:	e8 00 00 00 00       	call   1989 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE+0x9>
    1989:	5b                   	pop    %ebx
    198a:	81 c3 6b 66 00 00    	add    $0x666b,%ebx
    1990:	8b 44 24 14          	mov    0x14(%esp),%eax
    1994:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    1998:	8b 50 04             	mov    0x4(%eax),%edx
    199b:	83 fa 01             	cmp    $0x1,%edx
    199e:	74 02                	je     19a2 <_ZN4core3fmt5Write9write_fmt17h9d31c027b237edafE+0x22>
    19a0:	85 d2                	test   %edx,%edx
    19a2:	89 04 24             	mov    %eax,(%esp)
    19a5:	8d 93 30 fd ff ff    	lea    -0x2d0(%ebx),%edx
    19ab:	e8 a0 34 00 00       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    19b0:	83 c4 08             	add    $0x8,%esp
    19b3:	5b                   	pop    %ebx
    19b4:	c3                   	ret
    19b5:	66 90                	xchg   %ax,%ax
    19b7:	66 90                	xchg   %ax,%ax
    19b9:	66 90                	xchg   %ax,%ax
    19bb:	66 90                	xchg   %ax,%ax
    19bd:	66 90                	xchg   %ax,%ax
    19bf:	90                   	nop

000019c0 <_ZN4core3ptr56drop_in_place$LT$kernel_lib..logging..BufferedLogger$GT$17hb439f433930cd200E>:
    19c0:	c3                   	ret
    19c1:	66 90                	xchg   %ax,%ax
    19c3:	66 90                	xchg   %ax,%ax
    19c5:	66 90                	xchg   %ax,%ax
    19c7:	66 90                	xchg   %ax,%ax
    19c9:	66 90                	xchg   %ax,%ax
    19cb:	66 90                	xchg   %ax,%ax
    19cd:	66 90                	xchg   %ax,%ax
    19cf:	90                   	nop

000019d0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>:
    19d0:	55                   	push   %ebp
    19d1:	53                   	push   %ebx
    19d2:	57                   	push   %edi
    19d3:	56                   	push   %esi
    19d4:	83 ec 4c             	sub    $0x4c,%esp
    19d7:	e8 00 00 00 00       	call   19dc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xc>
    19dc:	5d                   	pop    %ebp
    19dd:	81 c5 18 66 00 00    	add    $0x6618,%ebp
    19e3:	bf 0c 00 00 00       	mov    $0xc,%edi
    19e8:	89 54 24 20          	mov    %edx,0x20(%esp)
    19ec:	83 fa 09             	cmp    $0x9,%edx
    19ef:	72 0a                	jb     19fb <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x2b>
    19f1:	8b 44 24 20          	mov    0x20(%esp),%eax
    19f5:	8d 78 07             	lea    0x7(%eax),%edi
    19f8:	83 e7 fc             	and    $0xfffffffc,%edi
    19fb:	0f bd c7             	bsr    %edi,%eax
    19fe:	83 f0 1f             	xor    $0x1f,%eax
    1a01:	b1 1e                	mov    $0x1e,%cl
    1a03:	28 c1                	sub    %al,%cl
    1a05:	89 fa                	mov    %edi,%edx
    1a07:	d3 ea                	shr    %cl,%edx
    1a09:	01 c0                	add    %eax,%eax
    1a0b:	29 c2                	sub    %eax,%edx
    1a0d:	83 c2 43             	add    $0x43,%edx
    1a10:	83 fa 3f             	cmp    $0x3f,%edx
    1a13:	72 05                	jb     1a1a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4a>
    1a15:	ba 3f 00 00 00       	mov    $0x3f,%edx
    1a1a:	89 f9                	mov    %edi,%ecx
    1a1c:	83 e1 c0             	and    $0xffffffc0,%ecx
    1a1f:	83 ff 40             	cmp    $0x40,%edi
    1a22:	73 06                	jae    1a2a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5a>
    1a24:	8d 57 f4             	lea    -0xc(%edi),%edx
    1a27:	c1 ea 02             	shr    $0x2,%edx
    1a2a:	83 fa 20             	cmp    $0x20,%edx
    1a2d:	0f 92 c0             	setb   %al
    1a30:	83 f9 40             	cmp    $0x40,%ecx
    1a33:	0f 94 c1             	sete   %cl
    1a36:	74 06                	je     1a3e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6e>
    1a38:	89 54 24 18          	mov    %edx,0x18(%esp)
    1a3c:	eb 0c                	jmp    1a4a <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x7a>
    1a3e:	89 fe                	mov    %edi,%esi
    1a40:	c1 ee 03             	shr    $0x3,%esi
    1a43:	83 c6 05             	add    $0x5,%esi
    1a46:	89 74 24 18          	mov    %esi,0x18(%esp)
    1a4a:	89 d6                	mov    %edx,%esi
    1a4c:	83 e6 1f             	and    $0x1f,%esi
    1a4f:	89 74 24 30          	mov    %esi,0x30(%esp)
    1a53:	08 c1                	or     %al,%cl
    1a55:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    1a59:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1a5d:	88 4c 24 0b          	mov    %cl,0xb(%esp)
    1a61:	84 c9                	test   %cl,%cl
    1a63:	74 3b                	je     1aa0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xd0>
    1a65:	8b 85 18 00 00 00    	mov    0x18(%ebp),%eax
    1a6b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1a6f:	8b 54 24 18          	mov    0x18(%esp),%edx
    1a73:	89 d1                	mov    %edx,%ecx
    1a75:	d3 e8                	shr    %cl,%eax
    1a77:	85 c0                	test   %eax,%eax
    1a79:	74 75                	je     1af0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x120>
    1a7b:	f3 0f bc c8          	tzcnt  %eax,%ecx
    1a7f:	01 d1                	add    %edx,%ecx
    1a81:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    1a87:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    1a8d:	85 d2                	test   %edx,%edx
    1a8f:	75 4e                	jne    1adf <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x10f>
    1a91:	e9 02 01 00 00       	jmp    1b98 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c8>
    1a96:	90                   	nop
    1a97:	90                   	nop
    1a98:	90                   	nop
    1a99:	90                   	nop
    1a9a:	90                   	nop
    1a9b:	90                   	nop
    1a9c:	90                   	nop
    1a9d:	90                   	nop
    1a9e:	90                   	nop
    1a9f:	90                   	nop
    1aa0:	83 fa 3f             	cmp    $0x3f,%edx
    1aa3:	0f 87 37 01 00 00    	ja     1be0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    1aa9:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    1aaf:	89 d0                	mov    %edx,%eax
    1ab1:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    1ab5:	d3 e8                	shr    %cl,%eax
    1ab7:	85 c0                	test   %eax,%eax
    1ab9:	0f 84 21 01 00 00    	je     1be0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    1abf:	f3 0f bc c8          	tzcnt  %eax,%ecx
    1ac3:	03 4c 24 1c          	add    0x1c(%esp),%ecx
    1ac7:	8b 85 18 00 00 00    	mov    0x18(%ebp),%eax
    1acd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ad1:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    1ad7:	85 d2                	test   %edx,%edx
    1ad9:	0f 84 b9 00 00 00    	je     1b98 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c8>
    1adf:	f3 0f bc c2          	tzcnt  %edx,%eax
    1ae3:	83 c8 20             	or     $0x20,%eax
    1ae6:	89 44 24 14          	mov    %eax,0x14(%esp)
    1aea:	eb 24                	jmp    1b10 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    1aec:	90                   	nop
    1aed:	90                   	nop
    1aee:	90                   	nop
    1aef:	90                   	nop
    1af0:	8b 95 1c 00 00 00    	mov    0x1c(%ebp),%edx
    1af6:	85 d2                	test   %edx,%edx
    1af8:	0f 84 e2 00 00 00    	je     1be0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    1afe:	f3 0f bc ca          	tzcnt  %edx,%ecx
    1b02:	83 c9 20             	or     $0x20,%ecx
    1b05:	8b ad 20 00 00 00    	mov    0x20(%ebp),%ebp
    1b0b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1b0f:	90                   	nop
    1b10:	89 eb                	mov    %ebp,%ebx
    1b12:	8d 6c 8d 00          	lea    0x0(%ebp,%ecx,4),%ebp
    1b16:	89 e8                	mov    %ebp,%eax
    1b18:	90                   	nop
    1b19:	90                   	nop
    1b1a:	90                   	nop
    1b1b:	90                   	nop
    1b1c:	90                   	nop
    1b1d:	90                   	nop
    1b1e:	90                   	nop
    1b1f:	90                   	nop
    1b20:	8b 00                	mov    (%eax),%eax
    1b22:	85 c0                	test   %eax,%eax
    1b24:	74 1a                	je     1b40 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x170>
    1b26:	8b 70 08             	mov    0x8(%eax),%esi
    1b29:	39 fe                	cmp    %edi,%esi
    1b2b:	72 f3                	jb     1b20 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x150>
    1b2d:	e9 5f 03 00 00       	jmp    1e91 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4c1>
    1b32:	90                   	nop
    1b33:	90                   	nop
    1b34:	90                   	nop
    1b35:	90                   	nop
    1b36:	90                   	nop
    1b37:	90                   	nop
    1b38:	90                   	nop
    1b39:	90                   	nop
    1b3a:	90                   	nop
    1b3b:	90                   	nop
    1b3c:	90                   	nop
    1b3d:	90                   	nop
    1b3e:	90                   	nop
    1b3f:	90                   	nop
    1b40:	8d 41 01             	lea    0x1(%ecx),%eax
    1b43:	83 f9 1f             	cmp    $0x1f,%ecx
    1b46:	73 28                	jae    1b70 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1a0>
    1b48:	8b 74 24 0c          	mov    0xc(%esp),%esi
    1b4c:	89 c1                	mov    %eax,%ecx
    1b4e:	d3 ee                	shr    %cl,%esi
    1b50:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    1b54:	85 f6                	test   %esi,%esi
    1b56:	89 dd                	mov    %ebx,%ebp
    1b58:	74 b6                	je     1b10 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    1b5a:	f3 0f bc ce          	tzcnt  %esi,%ecx
    1b5e:	01 c1                	add    %eax,%ecx
    1b60:	eb ae                	jmp    1b10 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    1b62:	90                   	nop
    1b63:	90                   	nop
    1b64:	90                   	nop
    1b65:	90                   	nop
    1b66:	90                   	nop
    1b67:	90                   	nop
    1b68:	90                   	nop
    1b69:	90                   	nop
    1b6a:	90                   	nop
    1b6b:	90                   	nop
    1b6c:	90                   	nop
    1b6d:	90                   	nop
    1b6e:	90                   	nop
    1b6f:	90                   	nop
    1b70:	83 f9 3e             	cmp    $0x3e,%ecx
    1b73:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    1b77:	77 67                	ja     1be0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    1b79:	89 d6                	mov    %edx,%esi
    1b7b:	89 c1                	mov    %eax,%ecx
    1b7d:	d3 ee                	shr    %cl,%esi
    1b7f:	85 f6                	test   %esi,%esi
    1b81:	74 5d                	je     1be0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    1b83:	f3 0f bc ce          	tzcnt  %esi,%ecx
    1b87:	01 c1                	add    %eax,%ecx
    1b89:	89 dd                	mov    %ebx,%ebp
    1b8b:	eb 83                	jmp    1b10 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x140>
    1b8d:	90                   	nop
    1b8e:	90                   	nop
    1b8f:	90                   	nop
    1b90:	f3 0f bc c0          	tzcnt  %eax,%eax
    1b94:	01 c1                	add    %eax,%ecx
    1b96:	89 d5                	mov    %edx,%ebp
    1b98:	89 ea                	mov    %ebp,%edx
    1b9a:	8d 6c 8d 00          	lea    0x0(%ebp,%ecx,4),%ebp
    1b9e:	89 e8                	mov    %ebp,%eax
    1ba0:	8b 00                	mov    (%eax),%eax
    1ba2:	85 c0                	test   %eax,%eax
    1ba4:	74 1a                	je     1bc0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1f0>
    1ba6:	8b 70 08             	mov    0x8(%eax),%esi
    1ba9:	39 fe                	cmp    %edi,%esi
    1bab:	72 f3                	jb     1ba0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1d0>
    1bad:	e9 df 02 00 00       	jmp    1e91 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4c1>
    1bb2:	90                   	nop
    1bb3:	90                   	nop
    1bb4:	90                   	nop
    1bb5:	90                   	nop
    1bb6:	90                   	nop
    1bb7:	90                   	nop
    1bb8:	90                   	nop
    1bb9:	90                   	nop
    1bba:	90                   	nop
    1bbb:	90                   	nop
    1bbc:	90                   	nop
    1bbd:	90                   	nop
    1bbe:	90                   	nop
    1bbf:	90                   	nop
    1bc0:	83 f9 1e             	cmp    $0x1e,%ecx
    1bc3:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    1bc7:	77 17                	ja     1be0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x210>
    1bc9:	41                   	inc    %ecx
    1bca:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1bce:	d3 e8                	shr    %cl,%eax
    1bd0:	85 c0                	test   %eax,%eax
    1bd2:	75 bc                	jne    1b90 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x1c0>
    1bd4:	90                   	nop
    1bd5:	90                   	nop
    1bd6:	90                   	nop
    1bd7:	90                   	nop
    1bd8:	90                   	nop
    1bd9:	90                   	nop
    1bda:	90                   	nop
    1bdb:	90                   	nop
    1bdc:	90                   	nop
    1bdd:	90                   	nop
    1bde:	90                   	nop
    1bdf:	90                   	nop
    1be0:	8b b5 10 00 00 00    	mov    0x10(%ebp),%esi
    1be6:	8b ad 14 00 00 00    	mov    0x14(%ebp),%ebp
    1bec:	31 c0                	xor    %eax,%eax
    1bee:	39 f5                	cmp    %esi,%ebp
    1bf0:	0f 86 98 04 00 00    	jbe    208e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    1bf6:	85 f6                	test   %esi,%esi
    1bf8:	0f 84 98 04 00 00    	je     2096 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6c6>
    1bfe:	83 fe fb             	cmp    $0xfffffffb,%esi
    1c01:	0f 87 87 04 00 00    	ja     208e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    1c07:	83 c6 03             	add    $0x3,%esi
    1c0a:	83 e6 fc             	and    $0xfffffffc,%esi
    1c0d:	83 e5 fc             	and    $0xfffffffc,%ebp
    1c10:	89 e9                	mov    %ebp,%ecx
    1c12:	29 f1                	sub    %esi,%ecx
    1c14:	0f 86 74 04 00 00    	jbe    208e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    1c1a:	8b 54 24 10          	mov    0x10(%esp),%edx
    1c1e:	8b 9a 20 00 00 00    	mov    0x20(%edx),%ebx
    1c24:	85 db                	test   %ebx,%ebx
    1c26:	74 38                	je     1c60 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x290>
    1c28:	83 f9 0f             	cmp    $0xf,%ecx
    1c2b:	0f 86 5d 04 00 00    	jbe    208e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    1c31:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
    1c37:	8d 46 04             	lea    0x4(%esi),%eax
    1c3a:	89 ea                	mov    %ebp,%edx
    1c3c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1c40:	29 c2                	sub    %eax,%edx
    1c42:	83 fa 40             	cmp    $0x40,%edx
    1c45:	0f 83 84 00 00 00    	jae    1ccf <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x2ff>
    1c4b:	8d 42 f4             	lea    -0xc(%edx),%eax
    1c4e:	c1 e8 02             	shr    $0x2,%eax
    1c51:	e9 cf 00 00 00       	jmp    1d25 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x355>
    1c56:	90                   	nop
    1c57:	90                   	nop
    1c58:	90                   	nop
    1c59:	90                   	nop
    1c5a:	90                   	nop
    1c5b:	90                   	nop
    1c5c:	90                   	nop
    1c5d:	90                   	nop
    1c5e:	90                   	nop
    1c5f:	90                   	nop
    1c60:	81 f9 07 01 00 00    	cmp    $0x107,%ecx
    1c66:	0f 86 22 04 00 00    	jbe    208e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    1c6c:	c7 06 01 00 00 00    	movl   $0x1,(%esi)
    1c72:	8d 46 04             	lea    0x4(%esi),%eax
    1c75:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1c79:	83 ec 04             	sub    $0x4,%esp
    1c7c:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    1c80:	68 00 01 00 00       	push   $0x100
    1c85:	6a 00                	push   $0x0
    1c87:	50                   	push   %eax
    1c88:	e8 a3 3e 00 00       	call   5b30 <memset>
    1c8d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    1c91:	83 c4 10             	add    $0x10,%esp
    1c94:	89 8b 20 00 00 00    	mov    %ecx,0x20(%ebx)
    1c9a:	8d 86 08 01 00 00    	lea    0x108(%esi),%eax
    1ca0:	89 ea                	mov    %ebp,%edx
    1ca2:	29 c2                	sub    %eax,%edx
    1ca4:	83 fa 0b             	cmp    $0xb,%edx
    1ca7:	76 38                	jbe    1ce1 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x311>
    1ca9:	83 fa 40             	cmp    $0x40,%edx
    1cac:	89 44 24 14          	mov    %eax,0x14(%esp)
    1cb0:	0f 83 05 01 00 00    	jae    1dbb <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3eb>
    1cb6:	8d 42 f4             	lea    -0xc(%edx),%eax
    1cb9:	c1 e8 02             	shr    $0x2,%eax
    1cbc:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    1cbf:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    1cc2:	85 c9                	test   %ecx,%ecx
    1cc4:	0f 85 0b 01 00 00    	jne    1dd5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x405>
    1cca:	e9 4d 01 00 00       	jmp    1e1c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x44c>
    1ccf:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    1cd5:	73 27                	jae    1cfe <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x32e>
    1cd7:	89 d0                	mov    %edx,%eax
    1cd9:	c1 e8 03             	shr    $0x3,%eax
    1cdc:	83 c0 05             	add    $0x5,%eax
    1cdf:	eb 44                	jmp    1d25 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x355>
    1ce1:	8d 86 04 01 00 00    	lea    0x104(%esi),%eax
    1ce7:	83 c5 fc             	add    $0xfffffffc,%ebp
    1cea:	39 c5                	cmp    %eax,%ebp
    1cec:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    1cf1:	74 02                	je     1cf5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x325>
    1cf3:	89 28                	mov    %ebp,(%eax)
    1cf5:	46                   	inc    %esi
    1cf6:	89 75 00             	mov    %esi,0x0(%ebp)
    1cf9:	e9 94 00 00 00       	jmp    1d92 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3c2>
    1cfe:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    1d02:	0f bd da             	bsr    %edx,%ebx
    1d05:	83 f3 1f             	xor    $0x1f,%ebx
    1d08:	b1 1e                	mov    $0x1e,%cl
    1d0a:	28 d9                	sub    %bl,%cl
    1d0c:	89 d0                	mov    %edx,%eax
    1d0e:	d3 e8                	shr    %cl,%eax
    1d10:	01 db                	add    %ebx,%ebx
    1d12:	29 d8                	sub    %ebx,%eax
    1d14:	83 c0 43             	add    $0x43,%eax
    1d17:	83 f8 3f             	cmp    $0x3f,%eax
    1d1a:	72 05                	jb     1d21 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x351>
    1d1c:	b8 3f 00 00 00       	mov    $0x3f,%eax
    1d21:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    1d25:	89 d9                	mov    %ebx,%ecx
    1d27:	8d 1c 83             	lea    (%ebx,%eax,4),%ebx
    1d2a:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    1d2d:	85 c9                	test   %ecx,%ecx
    1d2f:	74 11                	je     1d42 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x372>
    1d31:	89 4e 04             	mov    %ecx,0x4(%esi)
    1d34:	89 5e 08             	mov    %ebx,0x8(%esi)
    1d37:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1d3b:	89 03                	mov    %eax,(%ebx)
    1d3d:	89 41 04             	mov    %eax,0x4(%ecx)
    1d40:	eb 45                	jmp    1d87 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3b7>
    1d42:	31 c9                	xor    %ecx,%ecx
    1d44:	83 f8 20             	cmp    $0x20,%eax
    1d47:	0f 93 c1             	setae  %cl
    1d4a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    1d4e:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    1d55:	00 
    1d56:	89 c1                	mov    %eax,%ecx
    1d58:	d3 64 24 14          	shll   %cl,0x14(%esp)
    1d5c:	8b 44 24 10          	mov    0x10(%esp),%eax
    1d60:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    1d64:	89 5c 24 24          	mov    %ebx,0x24(%esp)
    1d68:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    1d6c:	31 9c 88 18 00 00 00 	xor    %ebx,0x18(%eax,%ecx,4)
    1d73:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
    1d7a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    1d7e:	89 4e 08             	mov    %ecx,0x8(%esi)
    1d81:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1d85:	89 01                	mov    %eax,(%ecx)
    1d87:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    1d8c:	89 56 0c             	mov    %edx,0xc(%esi)
    1d8f:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1d92:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1d96:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    1d9a:	c7 85 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
    1da1:	00 00 00 
    1da4:	c7 85 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
    1dab:	00 00 00 
    1dae:	84 c9                	test   %cl,%cl
    1db0:	0f 84 ea fc ff ff    	je     1aa0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0xd0>
    1db6:	e9 aa fc ff ff       	jmp    1a65 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x95>
    1dbb:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    1dc1:	73 2c                	jae    1def <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x41f>
    1dc3:	89 d0                	mov    %edx,%eax
    1dc5:	c1 e8 03             	shr    $0x3,%eax
    1dc8:	83 c0 05             	add    $0x5,%eax
    1dcb:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    1dce:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    1dd1:	85 c9                	test   %ecx,%ecx
    1dd3:	74 47                	je     1e1c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x44c>
    1dd5:	89 8e 08 01 00 00    	mov    %ecx,0x108(%esi)
    1ddb:	89 9e 0c 01 00 00    	mov    %ebx,0x10c(%esi)
    1de1:	8b 44 24 14          	mov    0x14(%esp),%eax
    1de5:	89 03                	mov    %eax,(%ebx)
    1de7:	89 41 04             	mov    %eax,0x4(%ecx)
    1dea:	e9 82 00 00 00       	jmp    1e71 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4a1>
    1def:	0f bd da             	bsr    %edx,%ebx
    1df2:	83 f3 1f             	xor    $0x1f,%ebx
    1df5:	b1 1e                	mov    $0x1e,%cl
    1df7:	28 d9                	sub    %bl,%cl
    1df9:	89 d0                	mov    %edx,%eax
    1dfb:	d3 e8                	shr    %cl,%eax
    1dfd:	01 db                	add    %ebx,%ebx
    1dff:	29 d8                	sub    %ebx,%eax
    1e01:	83 c0 43             	add    $0x43,%eax
    1e04:	83 f8 3f             	cmp    $0x3f,%eax
    1e07:	72 05                	jb     1e0e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x43e>
    1e09:	b8 3f 00 00 00       	mov    $0x3f,%eax
    1e0e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    1e12:	8d 1c 81             	lea    (%ecx,%eax,4),%ebx
    1e15:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    1e18:	85 c9                	test   %ecx,%ecx
    1e1a:	75 b9                	jne    1dd5 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x405>
    1e1c:	31 c9                	xor    %ecx,%ecx
    1e1e:	83 f8 20             	cmp    $0x20,%eax
    1e21:	0f 93 c1             	setae  %cl
    1e24:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    1e28:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1e2f:	00 
    1e30:	89 c1                	mov    %eax,%ecx
    1e32:	d3 64 24 0c          	shll   %cl,0xc(%esp)
    1e36:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    1e3a:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
    1e3e:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    1e42:	89 44 24 24          	mov    %eax,0x24(%esp)
    1e46:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1e4a:	31 84 99 18 00 00 00 	xor    %eax,0x18(%ecx,%ebx,4)
    1e51:	c7 86 08 01 00 00 00 	movl   $0x0,0x108(%esi)
    1e58:	00 00 00 
    1e5b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    1e5f:	89 86 0c 01 00 00    	mov    %eax,0x10c(%esi)
    1e65:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    1e69:	8b 44 24 24          	mov    0x24(%esp),%eax
    1e6d:	89 4c 86 04          	mov    %ecx,0x4(%esi,%eax,4)
    1e71:	89 96 10 01 00 00    	mov    %edx,0x110(%esi)
    1e77:	89 55 fc             	mov    %edx,-0x4(%ebp)
    1e7a:	8d 46 03             	lea    0x3(%esi),%eax
    1e7d:	89 86 04 01 00 00    	mov    %eax,0x104(%esi)
    1e83:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1e87:	0f b6 4c 24 0b       	movzbl 0xb(%esp),%ecx
    1e8c:	e9 05 ff ff ff       	jmp    1d96 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x3c6>
    1e91:	8b 10                	mov    (%eax),%edx
    1e93:	8b 78 04             	mov    0x4(%eax),%edi
    1e96:	89 17                	mov    %edx,(%edi)
    1e98:	85 d2                	test   %edx,%edx
    1e9a:	74 03                	je     1e9f <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4cf>
    1e9c:	89 7a 04             	mov    %edi,0x4(%edx)
    1e9f:	83 7d 00 00          	cmpl   $0x0,0x0(%ebp)
    1ea3:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    1ea7:	74 24                	je     1ecd <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4fd>
    1ea9:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
    1eac:	83 c1 f4             	add    $0xfffffff4,%ecx
    1eaf:	39 c1                	cmp    %eax,%ecx
    1eb1:	73 3a                	jae    1eed <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x51d>
    1eb3:	89 cf                	mov    %ecx,%edi
    1eb5:	29 c7                	sub    %eax,%edi
    1eb7:	83 ff 0b             	cmp    $0xb,%edi
    1eba:	76 3c                	jbe    1ef8 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x528>
    1ebc:	83 ff 40             	cmp    $0x40,%edi
    1ebf:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    1ec3:	73 3e                	jae    1f03 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x533>
    1ec5:	8d 57 f4             	lea    -0xc(%edi),%edx
    1ec8:	c1 ea 02             	shr    $0x2,%edx
    1ecb:	eb 67                	jmp    1f34 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    1ecd:	31 d2                	xor    %edx,%edx
    1ecf:	83 f9 20             	cmp    $0x20,%ecx
    1ed2:	0f 93 c2             	setae  %dl
    1ed5:	bf 01 00 00 00       	mov    $0x1,%edi
    1eda:	d3 e7                	shl    %cl,%edi
    1edc:	31 bc 95 18 00 00 00 	xor    %edi,0x18(%ebp,%edx,4)
    1ee3:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
    1ee6:	83 c1 f4             	add    $0xfffffff4,%ecx
    1ee9:	39 c1                	cmp    %eax,%ecx
    1eeb:	72 c6                	jb     1eb3 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4e3>
    1eed:	89 c1                	mov    %eax,%ecx
    1eef:	89 cf                	mov    %ecx,%edi
    1ef1:	29 c7                	sub    %eax,%edi
    1ef3:	83 ff 0b             	cmp    $0xb,%edi
    1ef6:	77 c4                	ja     1ebc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x4ec>
    1ef8:	83 40 fc fe          	addl   $0xfffffffe,-0x4(%eax)
    1efc:	89 c3                	mov    %eax,%ebx
    1efe:	e9 86 00 00 00       	jmp    1f89 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5b9>
    1f03:	81 ff 80 00 00 00    	cmp    $0x80,%edi
    1f09:	73 0a                	jae    1f15 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x545>
    1f0b:	89 fa                	mov    %edi,%edx
    1f0d:	c1 ea 03             	shr    $0x3,%edx
    1f10:	83 c2 05             	add    $0x5,%edx
    1f13:	eb 1f                	jmp    1f34 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    1f15:	0f bd df             	bsr    %edi,%ebx
    1f18:	83 f3 1f             	xor    $0x1f,%ebx
    1f1b:	b1 1e                	mov    $0x1e,%cl
    1f1d:	28 d9                	sub    %bl,%cl
    1f1f:	89 fa                	mov    %edi,%edx
    1f21:	d3 ea                	shr    %cl,%edx
    1f23:	01 db                	add    %ebx,%ebx
    1f25:	29 da                	sub    %ebx,%edx
    1f27:	83 c2 43             	add    $0x43,%edx
    1f2a:	83 fa 3f             	cmp    $0x3f,%edx
    1f2d:	72 05                	jb     1f34 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x564>
    1f2f:	ba 3f 00 00 00       	mov    $0x3f,%edx
    1f34:	8b 8d 20 00 00 00    	mov    0x20(%ebp),%ecx
    1f3a:	8d 1c 91             	lea    (%ecx,%edx,4),%ebx
    1f3d:	8b 0c 91             	mov    (%ecx,%edx,4),%ecx
    1f40:	85 c9                	test   %ecx,%ecx
    1f42:	74 0c                	je     1f50 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x580>
    1f44:	89 08                	mov    %ecx,(%eax)
    1f46:	89 58 04             	mov    %ebx,0x4(%eax)
    1f49:	89 03                	mov    %eax,(%ebx)
    1f4b:	89 41 04             	mov    %eax,0x4(%ecx)
    1f4e:	eb 2f                	jmp    1f7f <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5af>
    1f50:	31 c9                	xor    %ecx,%ecx
    1f52:	83 fa 20             	cmp    $0x20,%edx
    1f55:	0f 93 c1             	setae  %cl
    1f58:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1f5c:	bd 01 00 00 00       	mov    $0x1,%ebp
    1f61:	89 d1                	mov    %edx,%ecx
    1f63:	d3 e5                	shl    %cl,%ebp
    1f65:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    1f69:	8b 54 24 10          	mov    0x10(%esp),%edx
    1f6d:	31 ac 8a 18 00 00 00 	xor    %ebp,0x18(%edx,%ecx,4)
    1f74:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    1f7a:	89 58 04             	mov    %ebx,0x4(%eax)
    1f7d:	89 03                	mov    %eax,(%ebx)
    1f7f:	89 78 08             	mov    %edi,0x8(%eax)
    1f82:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    1f86:	89 7b fc             	mov    %edi,-0x4(%ebx)
    1f89:	01 c6                	add    %eax,%esi
    1f8b:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    1f8f:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
    1f92:	83 c7 03             	add    $0x3,%edi
    1f95:	83 e7 fc             	and    $0xfffffffc,%edi
    1f98:	8d 6b 08             	lea    0x8(%ebx),%ebp
    1f9b:	39 ef                	cmp    %ebp,%edi
    1f9d:	72 02                	jb     1fa1 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5d1>
    1f9f:	89 fd                	mov    %edi,%ebp
    1fa1:	8d 4d 04             	lea    0x4(%ebp),%ecx
    1fa4:	89 f2                	mov    %esi,%edx
    1fa6:	29 ca                	sub    %ecx,%edx
    1fa8:	83 fa 0b             	cmp    $0xb,%edx
    1fab:	76 19                	jbe    1fc6 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x5f6>
    1fad:	83 fa 40             	cmp    $0x40,%edx
    1fb0:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    1fb4:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    1fb8:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    1fbc:	73 1e                	jae    1fdc <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x60c>
    1fbe:	8d 5a f4             	lea    -0xc(%edx),%ebx
    1fc1:	c1 eb 02             	shr    $0x2,%ebx
    1fc4:	eb 4f                	jmp    2015 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    1fc6:	43                   	inc    %ebx
    1fc7:	89 5e fc             	mov    %ebx,-0x4(%esi)
    1fca:	83 c6 fc             	add    $0xfffffffc,%esi
    1fcd:	89 f5                	mov    %esi,%ebp
    1fcf:	39 fd                	cmp    %edi,%ebp
    1fd1:	0f 85 b5 00 00 00    	jne    208c <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6bc>
    1fd7:	e9 b2 00 00 00       	jmp    208e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    1fdc:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    1fe2:	73 0a                	jae    1fee <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x61e>
    1fe4:	89 d3                	mov    %edx,%ebx
    1fe6:	c1 eb 03             	shr    $0x3,%ebx
    1fe9:	83 c3 05             	add    $0x5,%ebx
    1fec:	eb 27                	jmp    2015 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    1fee:	0f bd da             	bsr    %edx,%ebx
    1ff1:	83 f3 1f             	xor    $0x1f,%ebx
    1ff4:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    1ff8:	b1 1e                	mov    $0x1e,%cl
    1ffa:	28 d9                	sub    %bl,%cl
    1ffc:	89 d3                	mov    %edx,%ebx
    1ffe:	d3 eb                	shr    %cl,%ebx
    2000:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    2004:	01 c9                	add    %ecx,%ecx
    2006:	29 cb                	sub    %ecx,%ebx
    2008:	83 c3 43             	add    $0x43,%ebx
    200b:	83 fb 3f             	cmp    $0x3f,%ebx
    200e:	72 05                	jb     2015 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x645>
    2010:	bb 3f 00 00 00       	mov    $0x3f,%ebx
    2015:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    2019:	8b 89 20 00 00 00    	mov    0x20(%ecx),%ecx
    201f:	8d 3c 99             	lea    (%ecx,%ebx,4),%edi
    2022:	89 7c 24 18          	mov    %edi,0x18(%esp)
    2026:	8b 0c 99             	mov    (%ecx,%ebx,4),%ecx
    2029:	85 c9                	test   %ecx,%ecx
    202b:	74 15                	je     2042 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x672>
    202d:	89 4d 04             	mov    %ecx,0x4(%ebp)
    2030:	8b 7c 24 18          	mov    0x18(%esp),%edi
    2034:	89 7d 08             	mov    %edi,0x8(%ebp)
    2037:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    203b:	89 1f                	mov    %ebx,(%edi)
    203d:	89 59 04             	mov    %ebx,0x4(%ecx)
    2040:	eb 32                	jmp    2074 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6a4>
    2042:	31 c9                	xor    %ecx,%ecx
    2044:	83 fb 20             	cmp    $0x20,%ebx
    2047:	0f 93 c1             	setae  %cl
    204a:	89 cf                	mov    %ecx,%edi
    204c:	89 d9                	mov    %ebx,%ecx
    204e:	bb 01 00 00 00       	mov    $0x1,%ebx
    2053:	d3 e3                	shl    %cl,%ebx
    2055:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    2059:	31 9c b9 18 00 00 00 	xor    %ebx,0x18(%ecx,%edi,4)
    2060:	c7 45 04 00 00 00 00 	movl   $0x0,0x4(%ebp)
    2067:	8b 7c 24 18          	mov    0x18(%esp),%edi
    206b:	89 7d 08             	mov    %edi,0x8(%ebp)
    206e:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    2072:	89 0f                	mov    %ecx,(%edi)
    2074:	89 55 0c             	mov    %edx,0xc(%ebp)
    2077:	89 56 fc             	mov    %edx,-0x4(%esi)
    207a:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    207e:	83 c1 03             	add    $0x3,%ecx
    2081:	89 4d 00             	mov    %ecx,0x0(%ebp)
    2084:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    2088:	39 fd                	cmp    %edi,%ebp
    208a:	74 02                	je     208e <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE+0x6be>
    208c:	89 2f                	mov    %ebp,(%edi)
    208e:	83 c4 4c             	add    $0x4c,%esp
    2091:	5e                   	pop    %esi
    2092:	5f                   	pop    %edi
    2093:	5b                   	pop    %ebx
    2094:	5d                   	pop    %ebp
    2095:	c3                   	ret
    2096:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    209a:	8d 83 60 ff ff ff    	lea    -0xa0(%ebx),%eax
    20a0:	89 44 24 34          	mov    %eax,0x34(%esp)
    20a4:	c7 44 24 38 01 00 00 	movl   $0x1,0x38(%esp)
    20ab:	00 
    20ac:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    20b3:	00 
    20b4:	c7 44 24 3c 04 00 00 	movl   $0x4,0x3c(%esp)
    20bb:	00 
    20bc:	c7 44 24 40 00 00 00 	movl   $0x0,0x40(%esp)
    20c3:	00 
    20c4:	8d 93 68 ff ff ff    	lea    -0x98(%ebx),%edx
    20ca:	8d 4c 24 34          	lea    0x34(%esp),%ecx
    20ce:	e8 5d f0 ff ff       	call   1130 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    20d3:	66 90                	xchg   %ax,%ax
    20d5:	66 90                	xchg   %ax,%ax
    20d7:	66 90                	xchg   %ax,%ax
    20d9:	66 90                	xchg   %ax,%ax
    20db:	66 90                	xchg   %ax,%ax
    20dd:	66 90                	xchg   %ax,%ax
    20df:	90                   	nop

000020e0 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E>:
    20e0:	55                   	push   %ebp
    20e1:	53                   	push   %ebx
    20e2:	57                   	push   %edi
    20e3:	56                   	push   %esi
    20e4:	83 ec 2c             	sub    $0x2c,%esp
    20e7:	e8 00 00 00 00       	call   20ec <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0xc>
    20ec:	5b                   	pop    %ebx
    20ed:	81 c3 08 5f 00 00    	add    $0x5f08,%ebx
    20f3:	8b 74 24 44          	mov    0x44(%esp),%esi
    20f7:	8b 44 24 40          	mov    0x40(%esp),%eax
    20fb:	80 38 01             	cmpb   $0x1,(%eax)
    20fe:	75 71                	jne    2171 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x91>
    2100:	8b 3e                	mov    (%esi),%edi
    2102:	8b 6e 04             	mov    0x4(%esi),%ebp
    2105:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2108:	83 ec 04             	sub    $0x4,%esp
    210b:	8d 83 30 e6 ff ff    	lea    -0x19d0(%ebx),%eax
    2111:	6a 03                	push   $0x3
    2113:	50                   	push   %eax
    2114:	57                   	push   %edi
    2115:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2119:	ff d1                	call   *%ecx
    211b:	83 c4 10             	add    $0x10,%esp
    211e:	b1 01                	mov    $0x1,%cl
    2120:	84 c0                	test   %al,%al
    2122:	0f 85 e1 01 00 00    	jne    2309 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    2128:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    212c:	0f 85 b1 00 00 00    	jne    21e3 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x103>
    2132:	83 ec 04             	sub    $0x4,%esp
    2135:	8d 83 ee eb ff ff    	lea    -0x1412(%ebx),%eax
    213b:	6a 01                	push   $0x1
    213d:	50                   	push   %eax
    213e:	57                   	push   %edi
    213f:	8b 74 24 18          	mov    0x18(%esp),%esi
    2143:	ff d6                	call   *%esi
    2145:	83 c4 10             	add    $0x10,%esp
    2148:	84 c0                	test   %al,%al
    214a:	0f 85 84 01 00 00    	jne    22d4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    2150:	83 ec 04             	sub    $0x4,%esp
    2153:	8d 83 78 ed ff ff    	lea    -0x1288(%ebx),%eax
    2159:	6a 0c                	push   $0xc
    215b:	50                   	push   %eax
    215c:	57                   	push   %edi
    215d:	ff d6                	call   *%esi
    215f:	83 c4 10             	add    $0x10,%esp
    2162:	84 c0                	test   %al,%al
    2164:	b1 01                	mov    $0x1,%cl
    2166:	0f 85 9d 01 00 00    	jne    2309 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    216c:	e9 e7 00 00 00       	jmp    2258 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x178>
    2171:	8b 3e                	mov    (%esi),%edi
    2173:	8b 6e 04             	mov    0x4(%esi),%ebp
    2176:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    2179:	83 ec 04             	sub    $0x4,%esp
    217c:	8d 83 2e e6 ff ff    	lea    -0x19d2(%ebx),%eax
    2182:	6a 02                	push   $0x2
    2184:	50                   	push   %eax
    2185:	57                   	push   %edi
    2186:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    218a:	ff d1                	call   *%ecx
    218c:	83 c4 10             	add    $0x10,%esp
    218f:	b1 01                	mov    $0x1,%cl
    2191:	84 c0                	test   %al,%al
    2193:	0f 85 70 01 00 00    	jne    2309 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    2199:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    219d:	0f 85 c9 00 00 00    	jne    226c <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x18c>
    21a3:	83 ec 04             	sub    $0x4,%esp
    21a6:	8d 83 ee eb ff ff    	lea    -0x1412(%ebx),%eax
    21ac:	6a 01                	push   $0x1
    21ae:	50                   	push   %eax
    21af:	57                   	push   %edi
    21b0:	ff 54 24 18          	call   *0x18(%esp)
    21b4:	83 c4 10             	add    $0x10,%esp
    21b7:	84 c0                	test   %al,%al
    21b9:	0f 85 15 01 00 00    	jne    22d4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    21bf:	83 ec 0c             	sub    $0xc,%esp
    21c2:	8d 93 f5 ea ff ff    	lea    -0x150b(%ebx),%edx
    21c8:	89 f1                	mov    %esi,%ecx
    21ca:	6a 02                	push   $0x2
    21cc:	e8 9f 26 00 00       	call   4870 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    21d1:	83 c4 10             	add    $0x10,%esp
    21d4:	84 c0                	test   %al,%al
    21d6:	b1 01                	mov    $0x1,%cl
    21d8:	0f 84 15 01 00 00    	je     22f3 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x213>
    21de:	e9 26 01 00 00       	jmp    2309 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    21e3:	83 ec 04             	sub    $0x4,%esp
    21e6:	8d 83 ef eb ff ff    	lea    -0x1411(%ebx),%eax
    21ec:	6a 02                	push   $0x2
    21ee:	50                   	push   %eax
    21ef:	57                   	push   %edi
    21f0:	ff 54 24 18          	call   *0x18(%esp)
    21f4:	83 c4 10             	add    $0x10,%esp
    21f7:	84 c0                	test   %al,%al
    21f9:	0f 85 d5 00 00 00    	jne    22d4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    21ff:	c6 44 24 20 01       	movb   $0x1,0x20(%esp)
    2204:	89 7c 24 10          	mov    %edi,0x10(%esp)
    2208:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    220c:	8d 44 24 20          	lea    0x20(%esp),%eax
    2210:	89 44 24 18          	mov    %eax,0x18(%esp)
    2214:	83 ec 04             	sub    $0x4,%esp
    2217:	8d 83 78 ed ff ff    	lea    -0x1288(%ebx),%eax
    221d:	8d 74 24 14          	lea    0x14(%esp),%esi
    2221:	6a 0c                	push   $0xc
    2223:	50                   	push   %eax
    2224:	56                   	push   %esi
    2225:	e8 16 31 00 00       	call   5340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    222a:	83 c4 10             	add    $0x10,%esp
    222d:	84 c0                	test   %al,%al
    222f:	0f 85 9f 00 00 00    	jne    22d4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    2235:	83 ec 04             	sub    $0x4,%esp
    2238:	8d 83 e9 eb ff ff    	lea    -0x1417(%ebx),%eax
    223e:	6a 02                	push   $0x2
    2240:	50                   	push   %eax
    2241:	56                   	push   %esi
    2242:	e8 f9 30 00 00       	call   5340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    2247:	83 c4 10             	add    $0x10,%esp
    224a:	84 c0                	test   %al,%al
    224c:	b1 01                	mov    $0x1,%cl
    224e:	8b 74 24 08          	mov    0x8(%esp),%esi
    2252:	0f 85 b1 00 00 00    	jne    2309 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    2258:	83 ec 04             	sub    $0x4,%esp
    225b:	8d 83 91 eb ff ff    	lea    -0x146f(%ebx),%eax
    2261:	6a 01                	push   $0x1
    2263:	50                   	push   %eax
    2264:	57                   	push   %edi
    2265:	ff d6                	call   *%esi
    2267:	e9 98 00 00 00       	jmp    2304 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x224>
    226c:	83 ec 04             	sub    $0x4,%esp
    226f:	8d 83 ef eb ff ff    	lea    -0x1411(%ebx),%eax
    2275:	6a 02                	push   $0x2
    2277:	50                   	push   %eax
    2278:	57                   	push   %edi
    2279:	ff 54 24 18          	call   *0x18(%esp)
    227d:	83 c4 10             	add    $0x10,%esp
    2280:	84 c0                	test   %al,%al
    2282:	75 50                	jne    22d4 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f4>
    2284:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    2289:	89 7c 24 20          	mov    %edi,0x20(%esp)
    228d:	89 6c 24 24          	mov    %ebp,0x24(%esp)
    2291:	8d 44 24 0f          	lea    0xf(%esp),%eax
    2295:	89 44 24 28          	mov    %eax,0x28(%esp)
    2299:	8b 46 08             	mov    0x8(%esi),%eax
    229c:	8b 4e 0c             	mov    0xc(%esi),%ecx
    229f:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    22a3:	89 44 24 18          	mov    %eax,0x18(%esp)
    22a7:	8d 74 24 20          	lea    0x20(%esp),%esi
    22ab:	89 74 24 10          	mov    %esi,0x10(%esp)
    22af:	8d 83 f0 fe ff ff    	lea    -0x110(%ebx),%eax
    22b5:	89 44 24 14          	mov    %eax,0x14(%esp)
    22b9:	83 ec 0c             	sub    $0xc,%esp
    22bc:	8d 93 f5 ea ff ff    	lea    -0x150b(%ebx),%edx
    22c2:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    22c6:	6a 02                	push   $0x2
    22c8:	e8 a3 25 00 00       	call   4870 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    22cd:	83 c4 10             	add    $0x10,%esp
    22d0:	84 c0                	test   %al,%al
    22d2:	74 04                	je     22d8 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x1f8>
    22d4:	b1 01                	mov    $0x1,%cl
    22d6:	eb 31                	jmp    2309 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    22d8:	83 ec 04             	sub    $0x4,%esp
    22db:	8d 83 e9 eb ff ff    	lea    -0x1417(%ebx),%eax
    22e1:	6a 02                	push   $0x2
    22e3:	50                   	push   %eax
    22e4:	56                   	push   %esi
    22e5:	e8 56 30 00 00       	call   5340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    22ea:	83 c4 10             	add    $0x10,%esp
    22ed:	84 c0                	test   %al,%al
    22ef:	b1 01                	mov    $0x1,%cl
    22f1:	75 16                	jne    2309 <_ZN70_$LT$core..result..Result$LT$T$C$E$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h8f48c425ad924408E+0x229>
    22f3:	83 ec 04             	sub    $0x4,%esp
    22f6:	8d 83 91 eb ff ff    	lea    -0x146f(%ebx),%eax
    22fc:	6a 01                	push   $0x1
    22fe:	50                   	push   %eax
    22ff:	57                   	push   %edi
    2300:	ff 54 24 18          	call   *0x18(%esp)
    2304:	83 c4 10             	add    $0x10,%esp
    2307:	89 c1                	mov    %eax,%ecx
    2309:	89 c8                	mov    %ecx,%eax
    230b:	83 c4 2c             	add    $0x2c,%esp
    230e:	5e                   	pop    %esi
    230f:	5f                   	pop    %edi
    2310:	5b                   	pop    %ebx
    2311:	5d                   	pop    %ebp
    2312:	c3                   	ret
    2313:	66 90                	xchg   %ax,%ax
    2315:	66 90                	xchg   %ax,%ax
    2317:	66 90                	xchg   %ax,%ax
    2319:	66 90                	xchg   %ax,%ax
    231b:	66 90                	xchg   %ax,%ax
    231d:	66 90                	xchg   %ax,%ax
    231f:	90                   	nop

00002320 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E>:
    2320:	53                   	push   %ebx
    2321:	56                   	push   %esi
    2322:	50                   	push   %eax
    2323:	e8 00 00 00 00       	call   2328 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0x8>
    2328:	5b                   	pop    %ebx
    2329:	81 c3 cc 5c 00 00    	add    $0x5ccc,%ebx
    232f:	8b 44 24 10          	mov    0x10(%esp),%eax
    2333:	8b 10                	mov    (%eax),%edx
    2335:	8d 83 78 ed ff ff    	lea    -0x1288(%ebx),%eax
    233b:	b9 0c 00 00 00       	mov    $0xc,%ecx
    2340:	4a                   	dec    %edx
    2341:	8b 94 93 54 e2 ff ff 	mov    -0x1dac(%ebx,%edx,4),%edx
    2348:	01 da                	add    %ebx,%edx
    234a:	ff e2                	jmp    *%edx
    234c:	8d 83 84 ed ff ff    	lea    -0x127c(%ebx),%eax
    2352:	b9 0b 00 00 00       	mov    $0xb,%ecx
    2357:	eb 69                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2359:	8d 83 f5 e9 ff ff    	lea    -0x160b(%ebx),%eax
    235f:	b9 08 00 00 00       	mov    $0x8,%ecx
    2364:	eb 5c                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2366:	8d 83 e9 ed ff ff    	lea    -0x1217(%ebx),%eax
    236c:	b9 0f 00 00 00       	mov    $0xf,%ecx
    2371:	eb 4f                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2373:	8d 83 8f ed ff ff    	lea    -0x1271(%ebx),%eax
    2379:	b9 0f 00 00 00       	mov    $0xf,%ecx
    237e:	eb 42                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2380:	8d 83 9e ed ff ff    	lea    -0x1262(%ebx),%eax
    2386:	eb 3a                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2388:	8d 83 ba ed ff ff    	lea    -0x1246(%ebx),%eax
    238e:	b9 10 00 00 00       	mov    $0x10,%ecx
    2393:	eb 2d                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    2395:	8d 83 f8 ed ff ff    	lea    -0x1208(%ebx),%eax
    239b:	b9 06 00 00 00       	mov    $0x6,%ecx
    23a0:	eb 20                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23a2:	8d 83 aa ed ff ff    	lea    -0x1256(%ebx),%eax
    23a8:	b9 10 00 00 00       	mov    $0x10,%ecx
    23ad:	eb 13                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23af:	8d 83 ca ed ff ff    	lea    -0x1236(%ebx),%eax
    23b5:	eb 0b                	jmp    23c2 <_ZN72_$LT$kernel_types..syscall..SyscallError$u20$as$u20$core..fmt..Debug$GT$3fmt17h51423209a3f15815E+0xa2>
    23b7:	8d 83 d6 ed ff ff    	lea    -0x122a(%ebx),%eax
    23bd:	b9 13 00 00 00       	mov    $0x13,%ecx
    23c2:	8b 54 24 14          	mov    0x14(%esp),%edx
    23c6:	8b 72 04             	mov    0x4(%edx),%esi
    23c9:	83 ec 04             	sub    $0x4,%esp
    23cc:	51                   	push   %ecx
    23cd:	50                   	push   %eax
    23ce:	ff 32                	push   (%edx)
    23d0:	ff 56 0c             	call   *0xc(%esi)
    23d3:	83 c4 14             	add    $0x14,%esp
    23d6:	5e                   	pop    %esi
    23d7:	5b                   	pop    %ebx
    23d8:	c3                   	ret
    23d9:	0f 0b                	ud2
    23db:	66 90                	xchg   %ax,%ax
    23dd:	66 90                	xchg   %ax,%ax
    23df:	90                   	nop

000023e0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$7enabled17h50b3bf6b8eccac4aE>:
    23e0:	b0 01                	mov    $0x1,%al
    23e2:	c3                   	ret
    23e3:	66 90                	xchg   %ax,%ax
    23e5:	66 90                	xchg   %ax,%ax
    23e7:	66 90                	xchg   %ax,%ax
    23e9:	66 90                	xchg   %ax,%ax
    23eb:	66 90                	xchg   %ax,%ax
    23ed:	66 90                	xchg   %ax,%ax
    23ef:	90                   	nop

000023f0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h291c1b72f6b70707E>:
    23f0:	53                   	push   %ebx
    23f1:	81 ec 48 01 00 00    	sub    $0x148,%esp
    23f7:	e8 00 00 00 00       	call   23fc <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h291c1b72f6b70707E+0xc>
    23fc:	5b                   	pop    %ebx
    23fd:	81 c3 f8 5b 00 00    	add    $0x5bf8,%ebx
    2403:	8b 84 24 54 01 00 00 	mov    0x154(%esp),%eax
    240a:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    2411:	00 
    2412:	8b 48 20             	mov    0x20(%eax),%ecx
    2415:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    2419:	8b 48 24             	mov    0x24(%eax),%ecx
    241c:	8b 50 28             	mov    0x28(%eax),%edx
    241f:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    2423:	89 54 24 28          	mov    %edx,0x28(%esp)
    2427:	83 c0 2c             	add    $0x2c,%eax
    242a:	89 44 24 08          	mov    %eax,0x8(%esp)
    242e:	8d 44 24 04          	lea    0x4(%esp),%eax
    2432:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2436:	8d 83 0c da ff ff    	lea    -0x25f4(%ebx),%eax
    243c:	89 44 24 10          	mov    %eax,0x10(%esp)
    2440:	8d 44 24 24          	lea    0x24(%esp),%eax
    2444:	89 44 24 14          	mov    %eax,0x14(%esp)
    2448:	8d 83 fc cd ff ff    	lea    -0x3204(%ebx),%eax
    244e:	89 44 24 18          	mov    %eax,0x18(%esp)
    2452:	8d 44 24 08          	lea    0x8(%esp),%eax
    2456:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    245a:	8d 83 4c 97 ff ff    	lea    -0x68b4(%ebx),%eax
    2460:	89 44 24 20          	mov    %eax,0x20(%esp)
    2464:	8d 83 70 fd ff ff    	lea    -0x290(%ebx),%eax
    246a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    246e:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    2475:	00 
    2476:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
    247d:	00 
    247e:	8d 44 24 0c          	lea    0xc(%esp),%eax
    2482:	89 44 24 34          	mov    %eax,0x34(%esp)
    2486:	c7 44 24 38 03 00 00 	movl   $0x3,0x38(%esp)
    248d:	00 
    248e:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    2492:	89 04 24             	mov    %eax,(%esp)
    2495:	8d 93 30 fd ff ff    	lea    -0x2d0(%ebx),%edx
    249b:	8d 4c 24 44          	lea    0x44(%esp),%ecx
    249f:	e8 ac 29 00 00       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    24a4:	8d 44 24 48          	lea    0x48(%esp),%eax
    24a8:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    24ac:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    24b0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    24b4:	89 44 24 14          	mov    %eax,0x14(%esp)
    24b8:	8d 54 24 0c          	lea    0xc(%esp),%edx
    24bc:	b8 02 00 00 00       	mov    $0x2,%eax
    24c1:	cd 80                	int    $0x80
    24c3:	81 c4 48 01 00 00    	add    $0x148,%esp
    24c9:	5b                   	pop    %ebx
    24ca:	c3                   	ret
    24cb:	66 90                	xchg   %ax,%ax
    24cd:	66 90                	xchg   %ax,%ax
    24cf:	90                   	nop

000024d0 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E>:
    24d0:	53                   	push   %ebx
    24d1:	57                   	push   %edi
    24d2:	56                   	push   %esi
    24d3:	e8 00 00 00 00       	call   24d8 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E+0x8>
    24d8:	5b                   	pop    %ebx
    24d9:	81 c3 1c 5b 00 00    	add    $0x5b1c,%ebx
    24df:	8b 44 24 18          	mov    0x18(%esp),%eax
    24e3:	8b 7c 24 10          	mov    0x10(%esp),%edi
    24e7:	8b 0f                	mov    (%edi),%ecx
    24e9:	8d 34 01             	lea    (%ecx,%eax,1),%esi
    24ec:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    24f2:	0f 93 c2             	setae  %dl
    24f5:	85 c0                	test   %eax,%eax
    24f7:	0f 94 c6             	sete   %dh
    24fa:	08 d6                	or     %dl,%dh
    24fc:	75 18                	jne    2516 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h56f3b3d99b2eed83E+0x46>
    24fe:	01 f9                	add    %edi,%ecx
    2500:	83 c1 04             	add    $0x4,%ecx
    2503:	83 ec 04             	sub    $0x4,%esp
    2506:	50                   	push   %eax
    2507:	ff 74 24 1c          	push   0x1c(%esp)
    250b:	51                   	push   %ecx
    250c:	e8 5f 35 00 00       	call   5a70 <memcpy>
    2511:	83 c4 10             	add    $0x10,%esp
    2514:	89 37                	mov    %esi,(%edi)
    2516:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    251c:	0f 93 c0             	setae  %al
    251f:	5e                   	pop    %esi
    2520:	5f                   	pop    %edi
    2521:	5b                   	pop    %ebx
    2522:	c3                   	ret
    2523:	66 90                	xchg   %ax,%ax
    2525:	66 90                	xchg   %ax,%ax
    2527:	66 90                	xchg   %ax,%ax
    2529:	66 90                	xchg   %ax,%ax
    252b:	66 90                	xchg   %ax,%ax
    252d:	66 90                	xchg   %ax,%ax
    252f:	90                   	nop

00002530 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>:
    2530:	53                   	push   %ebx
    2531:	83 ec 58             	sub    $0x58,%esp
    2534:	e8 00 00 00 00       	call   2539 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0x9>
    2539:	5b                   	pop    %ebx
    253a:	81 c3 bb 5a 00 00    	add    $0x5abb,%ebx
    2540:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2544:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    254a:	83 f8 02             	cmp    $0x2,%eax
    254d:	0f 86 d0 00 00 00    	jbe    2623 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xf3>
    2553:	8d 44 24 08          	lea    0x8(%esp),%eax
    2557:	89 44 24 0c          	mov    %eax,0xc(%esp)
    255b:	8d 83 ec d6 ff ff    	lea    -0x2914(%ebx),%eax
    2561:	89 44 24 10          	mov    %eax,0x10(%esp)
    2565:	c7 44 24 34 03 00 00 	movl   $0x3,0x34(%esp)
    256c:	00 
    256d:	8d 83 a2 e8 ff ff    	lea    -0x175e(%ebx),%eax
    2573:	89 44 24 38          	mov    %eax,0x38(%esp)
    2577:	c7 44 24 3c 13 00 00 	movl   $0x13,0x3c(%esp)
    257e:	00 
    257f:	8d 8b b0 fd ff ff    	lea    -0x250(%ebx),%ecx
    2585:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    2589:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    2590:	00 
    2591:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    2595:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    2599:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    25a0:	00 
    25a1:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    25a8:	00 
    25a9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    25b0:	00 
    25b1:	89 44 24 20          	mov    %eax,0x20(%esp)
    25b5:	c7 44 24 24 13 00 00 	movl   $0x13,0x24(%esp)
    25bc:	00 
    25bd:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    25c4:	00 
    25c5:	8d 83 5b e8 ff ff    	lea    -0x17a5(%ebx),%eax
    25cb:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    25cf:	c7 44 24 30 47 00 00 	movl   $0x47,0x30(%esp)
    25d6:	00 
    25d7:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    25de:	00 
    25df:	c7 44 24 18 04 00 00 	movl   $0x4,0x18(%esp)
    25e6:	00 
    25e7:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    25ed:	83 f8 02             	cmp    $0x2,%eax
    25f0:	74 10                	je     2602 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xd2>
    25f2:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    25f8:	75 10                	jne    260a <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xda>
    25fa:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2600:	eb 0e                	jmp    2610 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xe0>
    2602:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2608:	74 f0                	je     25fa <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E+0xca>
    260a:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    2610:	83 ec 08             	sub    $0x8,%esp
    2613:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    2617:	52                   	push   %edx
    2618:	51                   	push   %ecx
    2619:	ff 50 10             	call   *0x10(%eax)
    261c:	83 c4 10             	add    $0x10,%esp
    261f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    2623:	b8 89 00 00 00       	mov    $0x89,%eax
    2628:	89 ca                	mov    %ecx,%edx
    262a:	cd 50                	int    $0x50
    262c:	0f 0b                	ud2
    262e:	66 90                	xchg   %ax,%ax

00002630 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E>:
    2630:	55                   	push   %ebp
    2631:	53                   	push   %ebx
    2632:	57                   	push   %edi
    2633:	56                   	push   %esi
    2634:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
    263a:	89 d6                	mov    %edx,%esi
    263c:	89 cd                	mov    %ecx,%ebp
    263e:	e8 00 00 00 00       	call   2643 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x13>
    2643:	5b                   	pop    %ebx
    2644:	81 c3 b1 59 00 00    	add    $0x59b1,%ebx
    264a:	8d 54 24 0c          	lea    0xc(%esp),%edx
    264e:	b8 87 00 00 00       	mov    $0x87,%eax
    2653:	cd 80                	int    $0x80
    2655:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2658:	83 f9 0a             	cmp    $0xa,%ecx
    265b:	0f 83 f0 00 00 00    	jae    2751 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x121>
    2661:	89 c1                	mov    %eax,%ecx
    2663:	89 4c 24 68          	mov    %ecx,0x68(%esp)
    2667:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    266d:	85 c0                	test   %eax,%eax
    266f:	75 0a                	jne    267b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4b>
    2671:	b9 20 00 00 00       	mov    $0x20,%ecx
    2676:	e8 b5 fe ff ff       	call   2530 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    267b:	8d 44 24 68          	lea    0x68(%esp),%eax
    267f:	89 44 24 54          	mov    %eax,0x54(%esp)
    2683:	8d 83 2c a3 ff ff    	lea    -0x5cd4(%ebx),%eax
    2689:	89 44 24 58          	mov    %eax,0x58(%esp)
    268d:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    2694:	00 
    2695:	8d 83 15 e9 ff ff    	lea    -0x16eb(%ebx),%eax
    269b:	89 44 24 30          	mov    %eax,0x30(%esp)
    269f:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    26a6:	00 
    26a7:	8d 8b b8 fd ff ff    	lea    -0x248(%ebx),%ecx
    26ad:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    26b1:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    26b8:	00 
    26b9:	8d 4c 24 54          	lea    0x54(%esp),%ecx
    26bd:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    26c1:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    26c8:	00 
    26c9:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    26d0:	00 
    26d1:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    26d8:	00 
    26d9:	89 44 24 18          	mov    %eax,0x18(%esp)
    26dd:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    26e4:	00 
    26e5:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    26ec:	00 
    26ed:	8d 83 d3 e8 ff ff    	lea    -0x172d(%ebx),%eax
    26f3:	89 44 24 24          	mov    %eax,0x24(%esp)
    26f7:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    26fe:	00 
    26ff:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2706:	00 
    2707:	c7 44 24 10 38 00 00 	movl   $0x38,0x10(%esp)
    270e:	00 
    270f:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    2715:	83 f8 02             	cmp    $0x2,%eax
    2718:	74 10                	je     272a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa>
    271a:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    2720:	75 10                	jne    2732 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x102>
    2722:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2728:	eb 0e                	jmp    2738 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x108>
    272a:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2730:	74 f0                	je     2722 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf2>
    2732:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    2738:	83 ec 08             	sub    $0x8,%esp
    273b:	8d 54 24 14          	lea    0x14(%esp),%edx
    273f:	52                   	push   %edx
    2740:	51                   	push   %ecx
    2741:	ff 50 10             	call   *0x10(%eax)
    2744:	83 c4 10             	add    $0x10,%esp
    2747:	b9 20 00 00 00       	mov    $0x20,%ecx
    274c:	e8 df fd ff ff       	call   2530 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    2751:	b9 42 00 00 00       	mov    $0x42,%ecx
    2756:	85 c0                	test   %eax,%eax
    2758:	0f 85 05 ff ff ff    	jne    2663 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x33>
    275e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    2762:	8b 44 24 10          	mov    0x10(%esp),%eax
    2766:	8b 54 24 14          	mov    0x14(%esp),%edx
    276a:	89 94 24 88 00 00 00 	mov    %edx,0x88(%esp)
    2771:	8b 84 83 5c e3 ff ff 	mov    -0x1ca4(%ebx,%eax,4),%eax
    2778:	01 d8                	add    %ebx,%eax
    277a:	ff e0                	jmp    *%eax
    277c:	83 fd 01             	cmp    $0x1,%ebp
    277f:	0f 85 0e 08 00 00    	jne    2f93 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x963>
    2785:	8d 83 1c 94 ff ff    	lea    -0x6be4(%ebx),%eax
    278b:	89 44 24 64          	mov    %eax,0x64(%esp)
    278f:	8d ab 13 e6 ff ff    	lea    -0x19ed(%ebx),%ebp
    2795:	8d 83 18 fd ff ff    	lea    -0x2e8(%ebx),%eax
    279b:	89 44 24 78          	mov    %eax,0x78(%esp)
    279f:	8d b3 ac e5 ff ff    	lea    -0x1a54(%ebx),%esi
    27a5:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    27ab:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
    27b2:	8d 83 10 ee ff ff    	lea    -0x11f0(%ebx),%eax
    27b8:	89 44 24 7c          	mov    %eax,0x7c(%esp)
    27bc:	8d 83 5c d6 ff ff    	lea    -0x29a4(%ebx),%eax
    27c2:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
    27c9:	8d bb 3b ed ff ff    	lea    -0x12c5(%ebx),%edi
    27cf:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
    27d5:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
    27dc:	8d 83 d3 ec ff ff    	lea    -0x132d(%ebx),%eax
    27e2:	89 84 24 84 00 00 00 	mov    %eax,0x84(%esp)
    27e9:	8d 83 3c d9 ff ff    	lea    -0x26c4(%ebx),%eax
    27ef:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
    27f6:	eb 15                	jmp    280d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    27f8:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    27fe:	83 ec 08             	sub    $0x8,%esp
    2801:	8d 54 24 14          	lea    0x14(%esp),%edx
    2805:	52                   	push   %edx
    2806:	51                   	push   %ecx
    2807:	ff 50 10             	call   *0x10(%eax)
    280a:	83 c4 10             	add    $0x10,%esp
    280d:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    2814:	8d 54 24 68          	lea    0x68(%esp),%edx
    2818:	b8 8e 00 00 00       	mov    $0x8e,%eax
    281d:	cd 80                	int    $0x80
    281f:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2822:	83 f9 0a             	cmp    $0xa,%ecx
    2825:	0f 83 c2 01 00 00    	jae    29ed <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3bd>
    282b:	89 c1                	mov    %eax,%ecx
    282d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2831:	8d 44 24 08          	lea    0x8(%esp),%eax
    2835:	89 44 24 50          	mov    %eax,0x50(%esp)
    2839:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    283f:	85 c0                	test   %eax,%eax
    2841:	0f 84 9b 0d 00 00    	je     35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    2847:	8d 44 24 50          	lea    0x50(%esp),%eax
    284b:	89 44 24 54          	mov    %eax,0x54(%esp)
    284f:	8b 44 24 64          	mov    0x64(%esp),%eax
    2853:	89 44 24 58          	mov    %eax,0x58(%esp)
    2857:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    285e:	00 
    285f:	89 6c 24 30          	mov    %ebp,0x30(%esp)
    2863:	c7 44 24 34 1b 00 00 	movl   $0x1b,0x34(%esp)
    286a:	00 
    286b:	8b 44 24 78          	mov    0x78(%esp),%eax
    286f:	89 44 24 38          	mov    %eax,0x38(%esp)
    2873:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    287a:	00 
    287b:	8d 44 24 54          	lea    0x54(%esp),%eax
    287f:	89 44 24 40          	mov    %eax,0x40(%esp)
    2883:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    288a:	00 
    288b:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    2892:	00 
    2893:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    289a:	00 
    289b:	89 6c 24 18          	mov    %ebp,0x18(%esp)
    289f:	c7 44 24 1c 1b 00 00 	movl   $0x1b,0x1c(%esp)
    28a6:	00 
    28a7:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    28ae:	00 
    28af:	89 74 24 24          	mov    %esi,0x24(%esp)
    28b3:	c7 44 24 28 4a 00 00 	movl   $0x4a,0x28(%esp)
    28ba:	00 
    28bb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    28c2:	00 
    28c3:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
    28ca:	00 
    28cb:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    28d1:	83 f8 02             	cmp    $0x2,%eax
    28d4:	74 1a                	je     28f0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2c0>
    28d6:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
    28dd:	75 19                	jne    28f8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2c8>
    28df:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    28e5:	eb 15                	jmp    28fc <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2cc>
    28e7:	90                   	nop
    28e8:	90                   	nop
    28e9:	90                   	nop
    28ea:	90                   	nop
    28eb:	90                   	nop
    28ec:	90                   	nop
    28ed:	90                   	nop
    28ee:	90                   	nop
    28ef:	90                   	nop
    28f0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    28f6:	74 e7                	je     28df <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2af>
    28f8:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
    28fc:	83 ec 08             	sub    $0x8,%esp
    28ff:	8d 54 24 14          	lea    0x14(%esp),%edx
    2903:	52                   	push   %edx
    2904:	51                   	push   %ecx
    2905:	ff 50 10             	call   *0x10(%eax)
    2908:	83 c4 10             	add    $0x10,%esp
    290b:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    2910:	0f 85 cc 0c 00 00    	jne    35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    2916:	83 7c 24 68 03       	cmpl   $0x3,0x68(%esp)
    291b:	0f 84 c1 0c 00 00    	je     35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    2921:	8b 54 24 6c          	mov    0x6c(%esp),%edx
    2925:	89 54 24 08          	mov    %edx,0x8(%esp)
    2929:	85 d2                	test   %edx,%edx
    292b:	0f 84 dc fe ff ff    	je     280d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    2931:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    2937:	83 f8 03             	cmp    $0x3,%eax
    293a:	0f 86 de 00 00 00    	jbe    2a1e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3ee>
    2940:	8d 44 24 08          	lea    0x8(%esp),%eax
    2944:	89 44 24 54          	mov    %eax,0x54(%esp)
    2948:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    294f:	89 44 24 58          	mov    %eax,0x58(%esp)
    2953:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    295a:	00 
    295b:	89 7c 24 30          	mov    %edi,0x30(%esp)
    295f:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    2966:	00 
    2967:	8b 84 24 8c 00 00 00 	mov    0x8c(%esp),%eax
    296e:	89 44 24 38          	mov    %eax,0x38(%esp)
    2972:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    2979:	00 
    297a:	8d 44 24 54          	lea    0x54(%esp),%eax
    297e:	89 44 24 40          	mov    %eax,0x40(%esp)
    2982:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    2989:	00 
    298a:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    2991:	00 
    2992:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2999:	00 
    299a:	89 7c 24 18          	mov    %edi,0x18(%esp)
    299e:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    29a5:	00 
    29a6:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    29ad:	00 
    29ae:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
    29b5:	89 44 24 24          	mov    %eax,0x24(%esp)
    29b9:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    29c0:	00 
    29c1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    29c8:	00 
    29c9:	c7 44 24 10 51 00 00 	movl   $0x51,0x10(%esp)
    29d0:	00 
    29d1:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    29d7:	83 f8 02             	cmp    $0x2,%eax
    29da:	74 23                	je     29ff <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3cf>
    29dc:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
    29e3:	75 22                	jne    2a07 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3d7>
    29e5:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    29eb:	eb 1e                	jmp    2a0b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3db>
    29ed:	b9 42 00 00 00       	mov    $0x42,%ecx
    29f2:	85 c0                	test   %eax,%eax
    29f4:	0f 84 1c ff ff ff    	je     2916 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x2e6>
    29fa:	e9 2e fe ff ff       	jmp    282d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1fd>
    29ff:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2a05:	74 de                	je     29e5 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x3b5>
    2a07:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
    2a0b:	83 ec 08             	sub    $0x8,%esp
    2a0e:	8d 54 24 14          	lea    0x14(%esp),%edx
    2a12:	52                   	push   %edx
    2a13:	51                   	push   %ecx
    2a14:	ff 50 10             	call   *0x10(%eax)
    2a17:	83 c4 10             	add    $0x10,%esp
    2a1a:	8b 54 24 08          	mov    0x8(%esp),%edx
    2a1e:	b8 8d 00 00 00       	mov    $0x8d,%eax
    2a23:	cd 80                	int    $0x80
    2a25:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2a28:	83 f9 0a             	cmp    $0xa,%ecx
    2a2b:	0f 83 da 00 00 00    	jae    2b0b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4db>
    2a31:	89 44 24 50          	mov    %eax,0x50(%esp)
    2a35:	8d 44 24 50          	lea    0x50(%esp),%eax
    2a39:	89 44 24 68          	mov    %eax,0x68(%esp)
    2a3d:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    2a43:	85 c0                	test   %eax,%eax
    2a45:	0f 84 c2 fd ff ff    	je     280d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    2a4b:	8d 44 24 68          	lea    0x68(%esp),%eax
    2a4f:	89 44 24 54          	mov    %eax,0x54(%esp)
    2a53:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
    2a5a:	89 44 24 58          	mov    %eax,0x58(%esp)
    2a5e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    2a65:	00 
    2a66:	89 7c 24 30          	mov    %edi,0x30(%esp)
    2a6a:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    2a71:	00 
    2a72:	8d 83 10 ff ff ff    	lea    -0xf0(%ebx),%eax
    2a78:	89 44 24 38          	mov    %eax,0x38(%esp)
    2a7c:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    2a83:	00 
    2a84:	8d 44 24 54          	lea    0x54(%esp),%eax
    2a88:	89 44 24 40          	mov    %eax,0x40(%esp)
    2a8c:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    2a93:	00 
    2a94:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    2a9b:	00 
    2a9c:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2aa3:	00 
    2aa4:	89 7c 24 18          	mov    %edi,0x18(%esp)
    2aa8:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    2aaf:	00 
    2ab0:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2ab7:	00 
    2ab8:	8b 84 24 84 00 00 00 	mov    0x84(%esp),%eax
    2abf:	89 44 24 24          	mov    %eax,0x24(%esp)
    2ac3:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    2aca:	00 
    2acb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2ad2:	00 
    2ad3:	c7 44 24 10 59 00 00 	movl   $0x59,0x10(%esp)
    2ada:	00 
    2adb:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    2ae1:	83 f8 02             	cmp    $0x2,%eax
    2ae4:	74 0e                	je     2af4 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4c4>
    2ae6:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    2aec:	0f 85 06 fd ff ff    	jne    27f8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1c8>
    2af2:	eb 0c                	jmp    2b00 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x4d0>
    2af4:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2afa:	0f 85 f8 fc ff ff    	jne    27f8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1c8>
    2b00:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2b06:	e9 f3 fc ff ff       	jmp    27fe <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1ce>
    2b0b:	85 c0                	test   %eax,%eax
    2b0d:	b8 42 00 00 00       	mov    $0x42,%eax
    2b12:	0f 84 f5 fc ff ff    	je     280d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1dd>
    2b18:	e9 14 ff ff ff       	jmp    2a31 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x401>
    2b1d:	83 fd 02             	cmp    $0x2,%ebp
    2b20:	0f 85 6d 04 00 00    	jne    2f93 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x963>
    2b26:	89 74 24 78          	mov    %esi,0x78(%esp)
    2b2a:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    2b30:	8d 8b 15 e9 ff ff    	lea    -0x16eb(%ebx),%ecx
    2b36:	89 4c 24 64          	mov    %ecx,0x64(%esp)
    2b3a:	83 f8 03             	cmp    $0x3,%eax
    2b3d:	0f 86 9d 04 00 00    	jbe    2fe0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    2b43:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    2b4a:	00 
    2b4b:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    2b4f:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    2b53:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    2b5a:	00 
    2b5b:	8d 83 c0 fd ff ff    	lea    -0x240(%ebx),%eax
    2b61:	89 44 24 38          	mov    %eax,0x38(%esp)
    2b65:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    2b6c:	00 
    2b6d:	c7 44 24 40 04 00 00 	movl   $0x4,0x40(%esp)
    2b74:	00 
    2b75:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    2b7c:	00 
    2b7d:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    2b84:	00 
    2b85:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2b8c:	00 
    2b8d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2b91:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    2b98:	00 
    2b99:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2ba0:	00 
    2ba1:	8d 83 d3 e8 ff ff    	lea    -0x172d(%ebx),%eax
    2ba7:	89 44 24 24          	mov    %eax,0x24(%esp)
    2bab:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    2bb2:	00 
    2bb3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2bba:	00 
    2bbb:	c7 44 24 10 61 00 00 	movl   $0x61,0x10(%esp)
    2bc2:	00 
    2bc3:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    2bc9:	83 f8 02             	cmp    $0x2,%eax
    2bcc:	0f 84 cb 03 00 00    	je     2f9d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x96d>
    2bd2:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    2bd8:	e9 c6 03 00 00       	jmp    2fa3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x973>
    2bdd:	85 ed                	test   %ebp,%ebp
    2bdf:	0f 85 ae 03 00 00    	jne    2f93 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x963>
    2be5:	8d 83 1c 94 ff ff    	lea    -0x6be4(%ebx),%eax
    2beb:	89 44 24 64          	mov    %eax,0x64(%esp)
    2bef:	8d bb 13 e6 ff ff    	lea    -0x19ed(%ebx),%edi
    2bf5:	8d ab 18 fd ff ff    	lea    -0x2e8(%ebx),%ebp
    2bfb:	8d b3 ac e5 ff ff    	lea    -0x1a54(%ebx),%esi
    2c01:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    2c07:	89 44 24 78          	mov    %eax,0x78(%esp)
    2c0b:	8d 83 10 ee ff ff    	lea    -0x11f0(%ebx),%eax
    2c11:	89 84 24 84 00 00 00 	mov    %eax,0x84(%esp)
    2c18:	8d 83 5c d6 ff ff    	lea    -0x29a4(%ebx),%eax
    2c1e:	89 84 24 90 00 00 00 	mov    %eax,0x90(%esp)
    2c25:	8d 83 3b ed ff ff    	lea    -0x12c5(%ebx),%eax
    2c2b:	89 84 24 80 00 00 00 	mov    %eax,0x80(%esp)
    2c32:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
    2c38:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%esp)
    2c3f:	8d 83 d3 ec ff ff    	lea    -0x132d(%ebx),%eax
    2c45:	89 44 24 7c          	mov    %eax,0x7c(%esp)
    2c49:	8d 83 3c d9 ff ff    	lea    -0x26c4(%ebx),%eax
    2c4f:	89 84 24 94 00 00 00 	mov    %eax,0x94(%esp)
    2c56:	eb 18                	jmp    2c70 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    2c58:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    2c5e:	83 ec 08             	sub    $0x8,%esp
    2c61:	8d 54 24 14          	lea    0x14(%esp),%edx
    2c65:	52                   	push   %edx
    2c66:	51                   	push   %ecx
    2c67:	ff 50 10             	call   *0x10(%eax)
    2c6a:	83 c4 10             	add    $0x10,%esp
    2c6d:	90                   	nop
    2c6e:	90                   	nop
    2c6f:	90                   	nop
    2c70:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    2c77:	8d 54 24 54          	lea    0x54(%esp),%edx
    2c7b:	b8 8e 00 00 00       	mov    $0x8e,%eax
    2c80:	cd 80                	int    $0x80
    2c82:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2c85:	83 f9 0a             	cmp    $0xa,%ecx
    2c88:	0f 83 ce 01 00 00    	jae    2e5c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x82c>
    2c8e:	89 c1                	mov    %eax,%ecx
    2c90:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2c94:	8d 44 24 08          	lea    0x8(%esp),%eax
    2c98:	89 44 24 50          	mov    %eax,0x50(%esp)
    2c9c:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    2ca2:	85 c0                	test   %eax,%eax
    2ca4:	0f 84 38 09 00 00    	je     35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    2caa:	8d 44 24 50          	lea    0x50(%esp),%eax
    2cae:	89 44 24 68          	mov    %eax,0x68(%esp)
    2cb2:	8b 44 24 64          	mov    0x64(%esp),%eax
    2cb6:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    2cba:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    2cc1:	00 
    2cc2:	89 7c 24 30          	mov    %edi,0x30(%esp)
    2cc6:	c7 44 24 34 1b 00 00 	movl   $0x1b,0x34(%esp)
    2ccd:	00 
    2cce:	89 6c 24 38          	mov    %ebp,0x38(%esp)
    2cd2:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    2cd9:	00 
    2cda:	8d 44 24 68          	lea    0x68(%esp),%eax
    2cde:	89 44 24 40          	mov    %eax,0x40(%esp)
    2ce2:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    2ce9:	00 
    2cea:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    2cf1:	00 
    2cf2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2cf9:	00 
    2cfa:	89 7c 24 18          	mov    %edi,0x18(%esp)
    2cfe:	c7 44 24 1c 1b 00 00 	movl   $0x1b,0x1c(%esp)
    2d05:	00 
    2d06:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2d0d:	00 
    2d0e:	89 74 24 24          	mov    %esi,0x24(%esp)
    2d12:	c7 44 24 28 4a 00 00 	movl   $0x4a,0x28(%esp)
    2d19:	00 
    2d1a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2d21:	00 
    2d22:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
    2d29:	00 
    2d2a:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    2d30:	83 f8 02             	cmp    $0x2,%eax
    2d33:	74 1b                	je     2d50 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x720>
    2d35:	8b 44 24 78          	mov    0x78(%esp),%eax
    2d39:	75 1d                	jne    2d58 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x728>
    2d3b:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2d41:	eb 1c                	jmp    2d5f <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x72f>
    2d43:	90                   	nop
    2d44:	90                   	nop
    2d45:	90                   	nop
    2d46:	90                   	nop
    2d47:	90                   	nop
    2d48:	90                   	nop
    2d49:	90                   	nop
    2d4a:	90                   	nop
    2d4b:	90                   	nop
    2d4c:	90                   	nop
    2d4d:	90                   	nop
    2d4e:	90                   	nop
    2d4f:	90                   	nop
    2d50:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2d56:	74 e3                	je     2d3b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x70b>
    2d58:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    2d5f:	83 ec 08             	sub    $0x8,%esp
    2d62:	8d 54 24 14          	lea    0x14(%esp),%edx
    2d66:	52                   	push   %edx
    2d67:	51                   	push   %ecx
    2d68:	ff 50 10             	call   *0x10(%eax)
    2d6b:	83 c4 10             	add    $0x10,%esp
    2d6e:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    2d73:	0f 85 69 08 00 00    	jne    35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    2d79:	8b 44 24 54          	mov    0x54(%esp),%eax
    2d7d:	83 f8 03             	cmp    $0x3,%eax
    2d80:	0f 84 5c 08 00 00    	je     35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    2d86:	83 f8 01             	cmp    $0x1,%eax
    2d89:	0f 87 e1 fe ff ff    	ja     2c70 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    2d8f:	8b 54 24 5c          	mov    0x5c(%esp),%edx
    2d93:	89 54 24 08          	mov    %edx,0x8(%esp)
    2d97:	85 d2                	test   %edx,%edx
    2d99:	0f 84 d1 fe ff ff    	je     2c70 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    2d9f:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    2da5:	83 f8 03             	cmp    $0x3,%eax
    2da8:	0f 86 e2 00 00 00    	jbe    2e90 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x860>
    2dae:	8d 44 24 08          	lea    0x8(%esp),%eax
    2db2:	89 44 24 54          	mov    %eax,0x54(%esp)
    2db6:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    2dbd:	89 44 24 58          	mov    %eax,0x58(%esp)
    2dc1:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    2dc8:	00 
    2dc9:	8b 8c 24 80 00 00 00 	mov    0x80(%esp),%ecx
    2dd0:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    2dd4:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    2ddb:	00 
    2ddc:	8b 84 24 8c 00 00 00 	mov    0x8c(%esp),%eax
    2de3:	89 44 24 38          	mov    %eax,0x38(%esp)
    2de7:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    2dee:	00 
    2def:	8d 44 24 54          	lea    0x54(%esp),%eax
    2df3:	89 44 24 40          	mov    %eax,0x40(%esp)
    2df7:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    2dfe:	00 
    2dff:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    2e06:	00 
    2e07:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2e0e:	00 
    2e0f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2e13:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    2e1a:	00 
    2e1b:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2e22:	00 
    2e23:	8b 44 24 7c          	mov    0x7c(%esp),%eax
    2e27:	89 44 24 24          	mov    %eax,0x24(%esp)
    2e2b:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    2e32:	00 
    2e33:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2e3a:	00 
    2e3b:	c7 44 24 10 51 00 00 	movl   $0x51,0x10(%esp)
    2e42:	00 
    2e43:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    2e49:	83 f8 02             	cmp    $0x2,%eax
    2e4c:	74 20                	je     2e6e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x83e>
    2e4e:	8b 44 24 78          	mov    0x78(%esp),%eax
    2e52:	75 22                	jne    2e76 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x846>
    2e54:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2e5a:	eb 21                	jmp    2e7d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x84d>
    2e5c:	b9 42 00 00 00       	mov    $0x42,%ecx
    2e61:	85 c0                	test   %eax,%eax
    2e63:	0f 84 10 ff ff ff    	je     2d79 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x749>
    2e69:	e9 22 fe ff ff       	jmp    2c90 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x660>
    2e6e:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2e74:	74 de                	je     2e54 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x824>
    2e76:	8b 8c 24 84 00 00 00 	mov    0x84(%esp),%ecx
    2e7d:	83 ec 08             	sub    $0x8,%esp
    2e80:	8d 54 24 14          	lea    0x14(%esp),%edx
    2e84:	52                   	push   %edx
    2e85:	51                   	push   %ecx
    2e86:	ff 50 10             	call   *0x10(%eax)
    2e89:	83 c4 10             	add    $0x10,%esp
    2e8c:	8b 54 24 08          	mov    0x8(%esp),%edx
    2e90:	b8 8d 00 00 00       	mov    $0x8d,%eax
    2e95:	cd 80                	int    $0x80
    2e97:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2e9a:	83 f9 0a             	cmp    $0xa,%ecx
    2e9d:	0f 83 de 00 00 00    	jae    2f81 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x951>
    2ea3:	89 44 24 50          	mov    %eax,0x50(%esp)
    2ea7:	8d 44 24 50          	lea    0x50(%esp),%eax
    2eab:	89 44 24 68          	mov    %eax,0x68(%esp)
    2eaf:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    2eb5:	85 c0                	test   %eax,%eax
    2eb7:	0f 84 b3 fd ff ff    	je     2c70 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    2ebd:	8d 44 24 68          	lea    0x68(%esp),%eax
    2ec1:	89 44 24 54          	mov    %eax,0x54(%esp)
    2ec5:	8b 84 24 94 00 00 00 	mov    0x94(%esp),%eax
    2ecc:	89 44 24 58          	mov    %eax,0x58(%esp)
    2ed0:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    2ed7:	00 
    2ed8:	8b 8c 24 80 00 00 00 	mov    0x80(%esp),%ecx
    2edf:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    2ee3:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    2eea:	00 
    2eeb:	8d 83 10 ff ff ff    	lea    -0xf0(%ebx),%eax
    2ef1:	89 44 24 38          	mov    %eax,0x38(%esp)
    2ef5:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    2efc:	00 
    2efd:	8d 44 24 54          	lea    0x54(%esp),%eax
    2f01:	89 44 24 40          	mov    %eax,0x40(%esp)
    2f05:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    2f0c:	00 
    2f0d:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    2f14:	00 
    2f15:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2f1c:	00 
    2f1d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2f21:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    2f28:	00 
    2f29:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2f30:	00 
    2f31:	8b 44 24 7c          	mov    0x7c(%esp),%eax
    2f35:	89 44 24 24          	mov    %eax,0x24(%esp)
    2f39:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    2f40:	00 
    2f41:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2f48:	00 
    2f49:	c7 44 24 10 59 00 00 	movl   $0x59,0x10(%esp)
    2f50:	00 
    2f51:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    2f57:	83 f8 02             	cmp    $0x2,%eax
    2f5a:	74 0e                	je     2f6a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x93a>
    2f5c:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    2f62:	0f 85 f0 fc ff ff    	jne    2c58 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x628>
    2f68:	eb 0c                	jmp    2f76 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x946>
    2f6a:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2f70:	0f 85 e2 fc ff ff    	jne    2c58 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x628>
    2f76:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2f7c:	e9 dd fc ff ff       	jmp    2c5e <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x62e>
    2f81:	85 c0                	test   %eax,%eax
    2f83:	b8 42 00 00 00       	mov    $0x42,%eax
    2f88:	0f 84 e2 fc ff ff    	je     2c70 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x640>
    2f8e:	e9 10 ff ff ff       	jmp    2ea3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x873>
    2f93:	b9 22 00 00 00       	mov    $0x22,%ecx
    2f98:	e8 93 f5 ff ff       	call   2530 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    2f9d:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    2fa3:	74 08                	je     2fad <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x97d>
    2fa5:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    2fab:	eb 06                	jmp    2fb3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x983>
    2fad:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    2fb3:	83 ec 08             	sub    $0x8,%esp
    2fb6:	8d 54 24 14          	lea    0x14(%esp),%edx
    2fba:	52                   	push   %edx
    2fbb:	51                   	push   %ecx
    2fbc:	ff 50 10             	call   *0x10(%eax)
    2fbf:	83 c4 10             	add    $0x10,%esp
    2fc2:	eb 1c                	jmp    2fe0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    2fc4:	85 c0                	test   %eax,%eax
    2fc6:	b8 42 00 00 00       	mov    $0x42,%eax
    2fcb:	0f 85 31 05 00 00    	jne    3502 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xed2>
    2fd1:	90                   	nop
    2fd2:	90                   	nop
    2fd3:	90                   	nop
    2fd4:	90                   	nop
    2fd5:	90                   	nop
    2fd6:	90                   	nop
    2fd7:	90                   	nop
    2fd8:	90                   	nop
    2fd9:	90                   	nop
    2fda:	90                   	nop
    2fdb:	90                   	nop
    2fdc:	90                   	nop
    2fdd:	90                   	nop
    2fde:	90                   	nop
    2fdf:	90                   	nop
    2fe0:	8d 54 24 54          	lea    0x54(%esp),%edx
    2fe4:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    2feb:	b8 8e 00 00 00       	mov    $0x8e,%eax
    2ff0:	cd 80                	int    $0x80
    2ff2:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2ff5:	83 f9 0a             	cmp    $0xa,%ecx
    2ff8:	0f 83 bf 04 00 00    	jae    34bd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe8d>
    2ffe:	89 c1                	mov    %eax,%ecx
    3000:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3004:	8d 44 24 08          	lea    0x8(%esp),%eax
    3008:	89 44 24 50          	mov    %eax,0x50(%esp)
    300c:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    3012:	85 c0                	test   %eax,%eax
    3014:	0f 84 c8 05 00 00    	je     35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    301a:	8d 44 24 50          	lea    0x50(%esp),%eax
    301e:	89 44 24 68          	mov    %eax,0x68(%esp)
    3022:	8d 83 1c 94 ff ff    	lea    -0x6be4(%ebx),%eax
    3028:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    302c:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    3033:	00 
    3034:	8d 83 13 e6 ff ff    	lea    -0x19ed(%ebx),%eax
    303a:	89 44 24 30          	mov    %eax,0x30(%esp)
    303e:	c7 44 24 34 1b 00 00 	movl   $0x1b,0x34(%esp)
    3045:	00 
    3046:	8d 8b 18 fd ff ff    	lea    -0x2e8(%ebx),%ecx
    304c:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    3050:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    3057:	00 
    3058:	8d 4c 24 68          	lea    0x68(%esp),%ecx
    305c:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    3060:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    3067:	00 
    3068:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    306f:	00 
    3070:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3077:	00 
    3078:	89 44 24 18          	mov    %eax,0x18(%esp)
    307c:	c7 44 24 1c 1b 00 00 	movl   $0x1b,0x1c(%esp)
    3083:	00 
    3084:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    308b:	00 
    308c:	8d 83 ac e5 ff ff    	lea    -0x1a54(%ebx),%eax
    3092:	89 44 24 24          	mov    %eax,0x24(%esp)
    3096:	c7 44 24 28 4a 00 00 	movl   $0x4a,0x28(%esp)
    309d:	00 
    309e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    30a5:	00 
    30a6:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
    30ad:	00 
    30ae:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    30b4:	83 f8 02             	cmp    $0x2,%eax
    30b7:	74 17                	je     30d0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaa0>
    30b9:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    30bf:	75 17                	jne    30d8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaa8>
    30c1:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    30c7:	eb 15                	jmp    30de <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xaae>
    30c9:	90                   	nop
    30ca:	90                   	nop
    30cb:	90                   	nop
    30cc:	90                   	nop
    30cd:	90                   	nop
    30ce:	90                   	nop
    30cf:	90                   	nop
    30d0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    30d6:	74 e9                	je     30c1 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xa91>
    30d8:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    30de:	83 ec 08             	sub    $0x8,%esp
    30e1:	8d 54 24 14          	lea    0x14(%esp),%edx
    30e5:	52                   	push   %edx
    30e6:	51                   	push   %ecx
    30e7:	ff 50 10             	call   *0x10(%eax)
    30ea:	83 c4 10             	add    $0x10,%esp
    30ed:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    30f2:	0f 85 ea 04 00 00    	jne    35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    30f8:	8b 44 24 54          	mov    0x54(%esp),%eax
    30fc:	83 f8 03             	cmp    $0x3,%eax
    30ff:	0f 84 dd 04 00 00    	je     35e2 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfb2>
    3105:	83 f8 02             	cmp    $0x2,%eax
    3108:	0f 85 ea 04 00 00    	jne    35f8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfc8>
    310e:	8b 74 24 58          	mov    0x58(%esp),%esi
    3112:	8b 6c 24 5c          	mov    0x5c(%esp),%ebp
    3116:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    311a:	89 ea                	mov    %ebp,%edx
    311c:	b8 88 00 00 00       	mov    $0x88,%eax
    3121:	cd 80                	int    $0x80
    3123:	85 c0                	test   %eax,%eax
    3125:	0f 85 e7 04 00 00    	jne    3612 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfe2>
    312b:	8b 7c 24 10          	mov    0x10(%esp),%edi
    312f:	8b 44 24 14          	mov    0x14(%esp),%eax
    3133:	89 7c 24 68          	mov    %edi,0x68(%esp)
    3137:	89 44 24 6c          	mov    %eax,0x6c(%esp)
    313b:	89 6c 24 70          	mov    %ebp,0x70(%esp)
    313f:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    3145:	83 f8 03             	cmp    $0x3,%eax
    3148:	0f 86 d3 00 00 00    	jbe    3221 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbf1>
    314e:	8d 44 24 68          	lea    0x68(%esp),%eax
    3152:	89 44 24 54          	mov    %eax,0x54(%esp)
    3156:	8d 83 cc b7 ff ff    	lea    -0x4834(%ebx),%eax
    315c:	89 44 24 58          	mov    %eax,0x58(%esp)
    3160:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    3167:	00 
    3168:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    316c:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    3170:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    3177:	00 
    3178:	8d 83 e8 fd ff ff    	lea    -0x218(%ebx),%eax
    317e:	89 44 24 38          	mov    %eax,0x38(%esp)
    3182:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    3189:	00 
    318a:	8d 44 24 54          	lea    0x54(%esp),%eax
    318e:	89 44 24 40          	mov    %eax,0x40(%esp)
    3192:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    3199:	00 
    319a:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    31a1:	00 
    31a2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    31a9:	00 
    31aa:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    31ae:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    31b5:	00 
    31b6:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    31bd:	00 
    31be:	8d 83 d3 e8 ff ff    	lea    -0x172d(%ebx),%eax
    31c4:	89 44 24 24          	mov    %eax,0x24(%esp)
    31c8:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    31cf:	00 
    31d0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    31d7:	00 
    31d8:	c7 44 24 10 6e 00 00 	movl   $0x6e,0x10(%esp)
    31df:	00 
    31e0:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    31e6:	83 f8 02             	cmp    $0x2,%eax
    31e9:	74 15                	je     3200 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbd0>
    31eb:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    31f1:	8d 54 24 0c          	lea    0xc(%esp),%edx
    31f5:	75 15                	jne    320c <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbdc>
    31f7:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    31fd:	eb 13                	jmp    3212 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbe2>
    31ff:	90                   	nop
    3200:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    3206:	8d 54 24 0c          	lea    0xc(%esp),%edx
    320a:	74 eb                	je     31f7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xbc7>
    320c:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    3212:	83 ec 08             	sub    $0x8,%esp
    3215:	52                   	push   %edx
    3216:	51                   	push   %ecx
    3217:	ff 50 10             	call   *0x10(%eax)
    321a:	83 c4 10             	add    $0x10,%esp
    321d:	8b 7c 24 68          	mov    0x68(%esp),%edi
    3221:	85 ff                	test   %edi,%edi
    3223:	0f 88 61 04 00 00    	js     368a <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x105a>
    3229:	74 65                	je     3290 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc60>
    322b:	0f b6 83 0c 50 00 00 	movzbl 0x500c(%ebx),%eax
    3232:	90                   	nop
    3233:	90                   	nop
    3234:	90                   	nop
    3235:	90                   	nop
    3236:	90                   	nop
    3237:	90                   	nop
    3238:	90                   	nop
    3239:	90                   	nop
    323a:	90                   	nop
    323b:	90                   	nop
    323c:	90                   	nop
    323d:	90                   	nop
    323e:	90                   	nop
    323f:	90                   	nop
    3240:	b1 01                	mov    $0x1,%cl
    3242:	31 c0                	xor    %eax,%eax
    3244:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    324b:	00 
    324c:	74 22                	je     3270 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc40>
    324e:	90                   	nop
    324f:	90                   	nop
    3250:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    3257:	84 c0                	test   %al,%al
    3259:	74 e5                	je     3240 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc10>
    325b:	f3 90                	pause
    325d:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    3264:	84 c0                	test   %al,%al
    3266:	75 f3                	jne    325b <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc2b>
    3268:	eb d6                	jmp    3240 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc10>
    326a:	90                   	nop
    326b:	90                   	nop
    326c:	90                   	nop
    326d:	90                   	nop
    326e:	90                   	nop
    326f:	90                   	nop
    3270:	b9 01 00 00 00       	mov    $0x1,%ecx
    3275:	89 fa                	mov    %edi,%edx
    3277:	e8 54 e7 ff ff       	call   19d0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>
    327c:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    3283:	85 c0                	test   %eax,%eax
    3285:	0f 84 04 04 00 00    	je     368f <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x105f>
    328b:	89 c5                	mov    %eax,%ebp
    328d:	eb 06                	jmp    3295 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xc65>
    328f:	90                   	nop
    3290:	bd 01 00 00 00       	mov    $0x1,%ebp
    3295:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    3299:	89 7c 24 10          	mov    %edi,0x10(%esp)
    329d:	89 7c 24 14          	mov    %edi,0x14(%esp)
    32a1:	8b 54 24 70          	mov    0x70(%esp),%edx
    32a5:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    32a9:	b8 85 00 00 00       	mov    $0x85,%eax
    32ae:	cd 80                	int    $0x80
    32b0:	85 c0                	test   %eax,%eax
    32b2:	0f 85 70 03 00 00    	jne    3628 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xff8>
    32b8:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    32bc:	89 f2                	mov    %esi,%edx
    32be:	b8 88 00 00 00       	mov    $0x88,%eax
    32c3:	cd 80                	int    $0x80
    32c5:	85 c0                	test   %eax,%eax
    32c7:	0f 85 8c 03 00 00    	jne    3659 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x1029>
    32cd:	8b 44 24 0c          	mov    0xc(%esp),%eax
    32d1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    32d5:	89 74 24 54          	mov    %esi,0x54(%esp)
    32d9:	89 44 24 58          	mov    %eax,0x58(%esp)
    32dd:	89 4c 24 5c          	mov    %ecx,0x5c(%esp)
    32e1:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    32e5:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    32e9:	89 7c 24 14          	mov    %edi,0x14(%esp)
    32ed:	83 ec 08             	sub    $0x8,%esp
    32f0:	8d 7c 24 14          	lea    0x14(%esp),%edi
    32f4:	57                   	push   %edi
    32f5:	8d 44 24 60          	lea    0x60(%esp),%eax
    32f9:	50                   	push   %eax
    32fa:	ff 94 24 88 00 00 00 	call   *0x88(%esp)
    3301:	83 c4 10             	add    $0x10,%esp
    3304:	88 44 24 50          	mov    %al,0x50(%esp)
    3308:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    330e:	83 f8 03             	cmp    $0x3,%eax
    3311:	0f 86 d2 00 00 00    	jbe    33e9 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xdb9>
    3317:	8d 44 24 50          	lea    0x50(%esp),%eax
    331b:	89 44 24 54          	mov    %eax,0x54(%esp)
    331f:	8d 83 ec a0 ff ff    	lea    -0x5f14(%ebx),%eax
    3325:	89 44 24 58          	mov    %eax,0x58(%esp)
    3329:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    3330:	00 
    3331:	8b 4c 24 64          	mov    0x64(%esp),%ecx
    3335:	89 4c 24 30          	mov    %ecx,0x30(%esp)
    3339:	c7 44 24 34 0e 00 00 	movl   $0xe,0x34(%esp)
    3340:	00 
    3341:	8d 83 00 fe ff ff    	lea    -0x200(%ebx),%eax
    3347:	89 44 24 38          	mov    %eax,0x38(%esp)
    334b:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    3352:	00 
    3353:	8d 44 24 54          	lea    0x54(%esp),%eax
    3357:	89 44 24 40          	mov    %eax,0x40(%esp)
    335b:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    3362:	00 
    3363:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    336a:	00 
    336b:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3372:	00 
    3373:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3377:	c7 44 24 1c 0e 00 00 	movl   $0xe,0x1c(%esp)
    337e:	00 
    337f:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    3386:	00 
    3387:	8d 83 d3 e8 ff ff    	lea    -0x172d(%ebx),%eax
    338d:	89 44 24 24          	mov    %eax,0x24(%esp)
    3391:	c7 44 24 28 42 00 00 	movl   $0x42,0x28(%esp)
    3398:	00 
    3399:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    33a0:	00 
    33a1:	c7 44 24 10 75 00 00 	movl   $0x75,0x10(%esp)
    33a8:	00 
    33a9:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    33af:	83 f8 02             	cmp    $0x2,%eax
    33b2:	74 1c                	je     33d0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xda0>
    33b4:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    33ba:	75 1c                	jne    33d8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xda8>
    33bc:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    33c2:	eb 1a                	jmp    33de <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xdae>
    33c4:	90                   	nop
    33c5:	90                   	nop
    33c6:	90                   	nop
    33c7:	90                   	nop
    33c8:	90                   	nop
    33c9:	90                   	nop
    33ca:	90                   	nop
    33cb:	90                   	nop
    33cc:	90                   	nop
    33cd:	90                   	nop
    33ce:	90                   	nop
    33cf:	90                   	nop
    33d0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    33d6:	74 e4                	je     33bc <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xd8c>
    33d8:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    33de:	83 ec 08             	sub    $0x8,%esp
    33e1:	57                   	push   %edi
    33e2:	51                   	push   %ecx
    33e3:	ff 50 10             	call   *0x10(%eax)
    33e6:	83 c4 10             	add    $0x10,%esp
    33e9:	8b 54 24 70          	mov    0x70(%esp),%edx
    33ed:	89 94 24 98 00 00 00 	mov    %edx,0x98(%esp)
    33f4:	85 d2                	test   %edx,%edx
    33f6:	0f 84 e4 fb ff ff    	je     2fe0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    33fc:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    3402:	83 f8 03             	cmp    $0x3,%eax
    3405:	0f 86 e4 00 00 00    	jbe    34ef <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xebf>
    340b:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
    3412:	89 44 24 54          	mov    %eax,0x54(%esp)
    3416:	8d 83 5c d6 ff ff    	lea    -0x29a4(%ebx),%eax
    341c:	89 44 24 58          	mov    %eax,0x58(%esp)
    3420:	c7 44 24 2c 04 00 00 	movl   $0x4,0x2c(%esp)
    3427:	00 
    3428:	8d 83 3b ed ff ff    	lea    -0x12c5(%ebx),%eax
    342e:	89 44 24 30          	mov    %eax,0x30(%esp)
    3432:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    3439:	00 
    343a:	8d 8b 08 ff ff ff    	lea    -0xf8(%ebx),%ecx
    3440:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    3444:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    344b:	00 
    344c:	8d 4c 24 54          	lea    0x54(%esp),%ecx
    3450:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    3454:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    345b:	00 
    345c:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    3463:	00 
    3464:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    346b:	00 
    346c:	89 44 24 18          	mov    %eax,0x18(%esp)
    3470:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    3477:	00 
    3478:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    347f:	00 
    3480:	8d 83 d3 ec ff ff    	lea    -0x132d(%ebx),%eax
    3486:	89 44 24 24          	mov    %eax,0x24(%esp)
    348a:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    3491:	00 
    3492:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3499:	00 
    349a:	c7 44 24 10 51 00 00 	movl   $0x51,0x10(%esp)
    34a1:	00 
    34a2:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    34a8:	83 f8 02             	cmp    $0x2,%eax
    34ab:	74 22                	je     34cf <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe9f>
    34ad:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    34b3:	75 22                	jne    34d7 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xea7>
    34b5:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    34bb:	eb 20                	jmp    34dd <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xead>
    34bd:	b9 42 00 00 00       	mov    $0x42,%ecx
    34c2:	85 c0                	test   %eax,%eax
    34c4:	0f 84 2e fc ff ff    	je     30f8 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xac8>
    34ca:	e9 31 fb ff ff       	jmp    3000 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9d0>
    34cf:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    34d5:	74 de                	je     34b5 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xe85>
    34d7:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    34dd:	83 ec 08             	sub    $0x8,%esp
    34e0:	57                   	push   %edi
    34e1:	51                   	push   %ecx
    34e2:	ff 50 10             	call   *0x10(%eax)
    34e5:	83 c4 10             	add    $0x10,%esp
    34e8:	8b 94 24 98 00 00 00 	mov    0x98(%esp),%edx
    34ef:	b8 8d 00 00 00       	mov    $0x8d,%eax
    34f4:	cd 80                	int    $0x80
    34f6:	8d 48 ff             	lea    -0x1(%eax),%ecx
    34f9:	83 f9 0a             	cmp    $0xa,%ecx
    34fc:	0f 83 c2 fa ff ff    	jae    2fc4 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x994>
    3502:	89 44 24 08          	mov    %eax,0x8(%esp)
    3506:	8d 44 24 08          	lea    0x8(%esp),%eax
    350a:	89 44 24 50          	mov    %eax,0x50(%esp)
    350e:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    3514:	85 c0                	test   %eax,%eax
    3516:	0f 84 c4 fa ff ff    	je     2fe0 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x9b0>
    351c:	8d 44 24 50          	lea    0x50(%esp),%eax
    3520:	89 44 24 54          	mov    %eax,0x54(%esp)
    3524:	8d 83 3c d9 ff ff    	lea    -0x26c4(%ebx),%eax
    352a:	89 44 24 58          	mov    %eax,0x58(%esp)
    352e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    3535:	00 
    3536:	8d 83 3b ed ff ff    	lea    -0x12c5(%ebx),%eax
    353c:	89 44 24 30          	mov    %eax,0x30(%esp)
    3540:	c7 44 24 34 1c 00 00 	movl   $0x1c,0x34(%esp)
    3547:	00 
    3548:	8d 8b 10 ff ff ff    	lea    -0xf0(%ebx),%ecx
    354e:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    3552:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    3559:	00 
    355a:	8d 4c 24 54          	lea    0x54(%esp),%ecx
    355e:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    3562:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    3569:	00 
    356a:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    3571:	00 
    3572:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3579:	00 
    357a:	89 44 24 18          	mov    %eax,0x18(%esp)
    357e:	c7 44 24 1c 1c 00 00 	movl   $0x1c,0x1c(%esp)
    3585:	00 
    3586:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    358d:	00 
    358e:	8d 83 d3 ec ff ff    	lea    -0x132d(%ebx),%eax
    3594:	89 44 24 24          	mov    %eax,0x24(%esp)
    3598:	c7 44 24 28 4b 00 00 	movl   $0x4b,0x28(%esp)
    359f:	00 
    35a0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    35a7:	00 
    35a8:	c7 44 24 10 59 00 00 	movl   $0x59,0x10(%esp)
    35af:	00 
    35b0:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    35b6:	83 f8 02             	cmp    $0x2,%eax
    35b9:	74 10                	je     35cb <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf9b>
    35bb:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    35c1:	75 10                	jne    35d3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa3>
    35c3:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    35c9:	eb 0e                	jmp    35d9 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfa9>
    35cb:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    35d1:	74 f0                	je     35c3 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xf93>
    35d3:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    35d9:	83 ec 08             	sub    $0x8,%esp
    35dc:	57                   	push   %edi
    35dd:	e9 d9 f9 ff ff       	jmp    2fbb <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x98b>
    35e2:	8b 8c 24 88 00 00 00 	mov    0x88(%esp),%ecx
    35e9:	e8 32 21 00 00       	call   5720 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    35ee:	b9 21 00 00 00       	mov    $0x21,%ecx
    35f3:	e8 38 ef ff ff       	call   2530 <_ZN10kernel_lib7process4exit17h539a92ab3ef90dd1E>
    35f8:	85 c0                	test   %eax,%eax
    35fa:	75 0b                	jne    3607 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0xfd7>
    35fc:	8d 8b c8 fd ff ff    	lea    -0x238(%ebx),%ecx
    3602:	e8 59 db ff ff       	call   1160 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    3607:	8d 8b d8 fd ff ff    	lea    -0x228(%ebx),%ecx
    360d:	e8 4e db ff ff       	call   1160 <_ZN4core9panicking5panic17hdc0bb452f89252d5E>
    3612:	89 c1                	mov    %eax,%ecx
    3614:	e8 d7 23 00 00       	call   59f0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    3619:	89 44 24 54          	mov    %eax,0x54(%esp)
    361d:	83 ec 04             	sub    $0x4,%esp
    3620:	8d 83 90 fd ff ff    	lea    -0x270(%ebx),%eax
    3626:	eb 45                	jmp    366d <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E+0x103d>
    3628:	89 c1                	mov    %eax,%ecx
    362a:	e8 c1 23 00 00       	call   59f0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    362f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3633:	83 ec 04             	sub    $0x4,%esp
    3636:	8d 83 f0 fd ff ff    	lea    -0x210(%ebx),%eax
    363c:	8d b3 20 fd ff ff    	lea    -0x2e0(%ebx),%esi
    3642:	8d 8b f7 ea ff ff    	lea    -0x1509(%ebx),%ecx
    3648:	ba 2b 00 00 00       	mov    $0x2b,%edx
    364d:	50                   	push   %eax
    364e:	56                   	push   %esi
    364f:	8d 44 24 18          	lea    0x18(%esp),%eax
    3653:	50                   	push   %eax
    3654:	e8 67 db ff ff       	call   11c0 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    3659:	89 c1                	mov    %eax,%ecx
    365b:	e8 90 23 00 00       	call   59f0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    3660:	89 44 24 54          	mov    %eax,0x54(%esp)
    3664:	83 ec 04             	sub    $0x4,%esp
    3667:	8d 83 48 fd ff ff    	lea    -0x2b8(%ebx),%eax
    366d:	8d bb 20 fd ff ff    	lea    -0x2e0(%ebx),%edi
    3673:	8d 8b f7 ea ff ff    	lea    -0x1509(%ebx),%ecx
    3679:	ba 2b 00 00 00       	mov    $0x2b,%edx
    367e:	50                   	push   %eax
    367f:	57                   	push   %edi
    3680:	8d 44 24 60          	lea    0x60(%esp),%eax
    3684:	50                   	push   %eax
    3685:	e8 36 db ff ff       	call   11c0 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    368a:	e8 91 d9 ff ff       	call   1020 <_ZN5alloc7raw_vec17capacity_overflow17hf4854d1cf84712dcE>
    368f:	89 f9                	mov    %edi,%ecx
    3691:	e8 6a d9 ff ff       	call   1000 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE>
    3696:	66 90                	xchg   %ax,%ax
    3698:	66 90                	xchg   %ax,%ax
    369a:	66 90                	xchg   %ax,%ax
    369c:	66 90                	xchg   %ax,%ax
    369e:	66 90                	xchg   %ax,%ax

000036a0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>:
    36a0:	53                   	push   %ebx
    36a1:	83 ec 58             	sub    $0x58,%esp
    36a4:	e8 00 00 00 00       	call   36a9 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0x9>
    36a9:	5b                   	pop    %ebx
    36aa:	81 c3 4b 49 00 00    	add    $0x494b,%ebx
    36b0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    36b4:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    36ba:	85 c0                	test   %eax,%eax
    36bc:	0f 84 ce 00 00 00    	je     3790 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    36c2:	8d 44 24 08          	lea    0x8(%esp),%eax
    36c6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    36ca:	8d 83 2c 95 ff ff    	lea    -0x6ad4(%ebx),%eax
    36d0:	89 44 24 10          	mov    %eax,0x10(%esp)
    36d4:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%esp)
    36db:	00 
    36dc:	8d 83 a0 e9 ff ff    	lea    -0x1660(%ebx),%eax
    36e2:	89 44 24 38          	mov    %eax,0x38(%esp)
    36e6:	c7 44 24 3c 0a 00 00 	movl   $0xa,0x3c(%esp)
    36ed:	00 
    36ee:	8d 8b 08 fe ff ff    	lea    -0x1f8(%ebx),%ecx
    36f4:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    36f8:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    36ff:	00 
    3700:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    3704:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    3708:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    370f:	00 
    3710:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    3717:	00 
    3718:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    371f:	00 
    3720:	89 44 24 20          	mov    %eax,0x20(%esp)
    3724:	c7 44 24 24 0a 00 00 	movl   $0xa,0x24(%esp)
    372b:	00 
    372c:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    3733:	00 
    3734:	8d 83 61 e9 ff ff    	lea    -0x169f(%ebx),%eax
    373a:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    373e:	c7 44 24 30 3f 00 00 	movl   $0x3f,0x30(%esp)
    3745:	00 
    3746:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    374d:	00 
    374e:	c7 44 24 18 1d 00 00 	movl   $0x1d,0x18(%esp)
    3755:	00 
    3756:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    375c:	83 f8 02             	cmp    $0x2,%eax
    375f:	74 10                	je     3771 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xd1>
    3761:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    3767:	75 10                	jne    3779 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xd9>
    3769:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    376f:	eb 0e                	jmp    377f <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xdf>
    3771:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    3777:	74 f0                	je     3769 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xc9>
    3779:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    377f:	83 ec 08             	sub    $0x8,%esp
    3782:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    3786:	52                   	push   %edx
    3787:	51                   	push   %ecx
    3788:	ff 50 10             	call   *0x10(%eax)
    378b:	83 c4 10             	add    $0x10,%esp
    378e:	90                   	nop
    378f:	90                   	nop
    3790:	eb fe                	jmp    3790 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    3792:	66 90                	xchg   %ax,%ax
    3794:	66 90                	xchg   %ax,%ax
    3796:	66 90                	xchg   %ax,%ax
    3798:	66 90                	xchg   %ax,%ax
    379a:	66 90                	xchg   %ax,%ax
    379c:	66 90                	xchg   %ax,%ax
    379e:	66 90                	xchg   %ax,%ax

000037a0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>:
    37a0:	53                   	push   %ebx
    37a1:	83 ec 08             	sub    $0x8,%esp
    37a4:	e8 00 00 00 00       	call   37a9 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E+0x9>
    37a9:	5b                   	pop    %ebx
    37aa:	81 c3 4b 48 00 00    	add    $0x484b,%ebx
    37b0:	e8 7b ee ff ff       	call   2630 <_ZN10kernel_lib2rt11module_task17h654dfcef85848845E>
    37b5:	66 90                	xchg   %ax,%ax
    37b7:	66 90                	xchg   %ax,%ax
    37b9:	66 90                	xchg   %ax,%ax
    37bb:	66 90                	xchg   %ax,%ax
    37bd:	66 90                	xchg   %ax,%ax
    37bf:	90                   	nop

000037c0 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E>:
    37c0:	55                   	push   %ebp
    37c1:	53                   	push   %ebx
    37c2:	57                   	push   %edi
    37c3:	56                   	push   %esi
    37c4:	83 ec 1c             	sub    $0x1c,%esp
    37c7:	e8 00 00 00 00       	call   37cc <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xc>
    37cc:	5b                   	pop    %ebx
    37cd:	81 c3 28 48 00 00    	add    $0x4828,%ebx
    37d3:	8b 74 24 34          	mov    0x34(%esp),%esi
    37d7:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    37db:	8d 45 04             	lea    0x4(%ebp),%eax
    37de:	89 44 24 14          	mov    %eax,0x14(%esp)
    37e2:	8d 45 08             	lea    0x8(%ebp),%eax
    37e5:	89 44 24 18          	mov    %eax,0x18(%esp)
    37e9:	8b 46 04             	mov    0x4(%esi),%eax
    37ec:	83 ec 04             	sub    $0x4,%esp
    37ef:	8d 8b e1 e9 ff ff    	lea    -0x161f(%ebx),%ecx
    37f5:	6a 09                	push   $0x9
    37f7:	51                   	push   %ecx
    37f8:	ff 36                	push   (%esi)
    37fa:	ff 50 0c             	call   *0xc(%eax)
    37fd:	83 c4 10             	add    $0x10,%esp
    3800:	89 74 24 0c          	mov    %esi,0xc(%esp)
    3804:	88 44 24 10          	mov    %al,0x10(%esp)
    3808:	c6 44 24 11 00       	movb   $0x0,0x11(%esp)
    380d:	83 ec 04             	sub    $0x4,%esp
    3810:	8d bb 7c 97 ff ff    	lea    -0x6884(%ebx),%edi
    3816:	8d 93 ea e9 ff ff    	lea    -0x1616(%ebx),%edx
    381c:	8d 74 24 10          	lea    0x10(%esp),%esi
    3820:	89 f1                	mov    %esi,%ecx
    3822:	57                   	push   %edi
    3823:	55                   	push   %ebp
    3824:	6a 03                	push   $0x3
    3826:	e8 85 19 00 00       	call   51b0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    382b:	83 c4 0c             	add    $0xc,%esp
    382e:	8d 93 ed e9 ff ff    	lea    -0x1613(%ebx),%edx
    3834:	89 f1                	mov    %esi,%ecx
    3836:	57                   	push   %edi
    3837:	ff 74 24 1c          	push   0x1c(%esp)
    383b:	6a 08                	push   $0x8
    383d:	e8 6e 19 00 00       	call   51b0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    3842:	83 c4 0c             	add    $0xc,%esp
    3845:	8d 83 dc 92 ff ff    	lea    -0x6d24(%ebx),%eax
    384b:	8d 7c 24 1c          	lea    0x1c(%esp),%edi
    384f:	8d 93 fd e9 ff ff    	lea    -0x1603(%ebx),%edx
    3855:	89 f1                	mov    %esi,%ecx
    3857:	50                   	push   %eax
    3858:	57                   	push   %edi
    3859:	6a 06                	push   $0x6
    385b:	e8 50 19 00 00       	call   51b0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>
    3860:	83 c4 10             	add    $0x10,%esp
    3863:	0f b6 4c 24 10       	movzbl 0x10(%esp),%ecx
    3868:	0f b6 44 24 11       	movzbl 0x11(%esp),%eax
    386d:	89 c2                	mov    %eax,%edx
    386f:	f6 d2                	not    %dl
    3871:	08 ca                	or     %cl,%dl
    3873:	f6 c2 01             	test   $0x1,%dl
    3876:	74 04                	je     387c <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xbc>
    3878:	08 c8                	or     %cl,%al
    387a:	eb 31                	jmp    38ad <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xed>
    387c:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3880:	f6 40 0a 80          	testb  $0x80,0xa(%eax)
    3884:	75 10                	jne    3896 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xd6>
    3886:	8b 48 04             	mov    0x4(%eax),%ecx
    3889:	83 ec 04             	sub    $0x4,%esp
    388c:	8d 93 ec eb ff ff    	lea    -0x1414(%ebx),%edx
    3892:	6a 02                	push   $0x2
    3894:	eb 0e                	jmp    38a4 <_ZN86_$LT$kernel_lib..object..kernel_buf..kernel..KernelBuf$u20$as$u20$core..fmt..Debug$GT$3fmt17h94632679a7b244b7E+0xe4>
    3896:	8b 48 04             	mov    0x4(%eax),%ecx
    3899:	83 ec 04             	sub    $0x4,%esp
    389c:	8d 93 eb eb ff ff    	lea    -0x1415(%ebx),%edx
    38a2:	6a 01                	push   $0x1
    38a4:	52                   	push   %edx
    38a5:	ff 30                	push   (%eax)
    38a7:	ff 51 0c             	call   *0xc(%ecx)
    38aa:	83 c4 10             	add    $0x10,%esp
    38ad:	24 01                	and    $0x1,%al
    38af:	83 c4 1c             	add    $0x1c,%esp
    38b2:	5e                   	pop    %esi
    38b3:	5f                   	pop    %edi
    38b4:	5b                   	pop    %ebx
    38b5:	5d                   	pop    %ebp
    38b6:	c3                   	ret
    38b7:	66 90                	xchg   %ax,%ax
    38b9:	66 90                	xchg   %ax,%ax
    38bb:	66 90                	xchg   %ax,%ax
    38bd:	66 90                	xchg   %ax,%ax
    38bf:	90                   	nop

000038c0 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E>:
    38c0:	53                   	push   %ebx
    38c1:	83 ec 38             	sub    $0x38,%esp
    38c4:	e8 00 00 00 00       	call   38c9 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0x9>
    38c9:	5b                   	pop    %ebx
    38ca:	81 c3 2b 47 00 00    	add    $0x472b,%ebx
    38d0:	8b 44 24 44          	mov    0x44(%esp),%eax
    38d4:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    38d8:	8b 11                	mov    (%ecx),%edx
    38da:	83 c1 04             	add    $0x4,%ecx
    38dd:	8b 94 93 6c e3 ff ff 	mov    -0x1c94(%ebx,%edx,4),%edx
    38e4:	01 da                	add    %ebx,%edx
    38e6:	ff e2                	jmp    *%edx
    38e8:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    38ec:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    38f0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    38f4:	8d 8b bc 96 ff ff    	lea    -0x6944(%ebx),%ecx
    38fa:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    38fe:	8d 8b 18 fe ff ff    	lea    -0x1e8(%ebx),%ecx
    3904:	eb 5c                	jmp    3962 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0xa2>
    3906:	8b 08                	mov    (%eax),%ecx
    3908:	8b 40 04             	mov    0x4(%eax),%eax
    390b:	8d 93 1f ea ff ff    	lea    -0x15e1(%ebx),%edx
    3911:	89 54 24 04          	mov    %edx,0x4(%esp)
    3915:	89 0c 24             	mov    %ecx,(%esp)
    3918:	c7 44 24 08 11 00 00 	movl   $0x11,0x8(%esp)
    391f:	00 
    3920:	ff 50 0c             	call   *0xc(%eax)
    3923:	83 c4 38             	add    $0x38,%esp
    3926:	5b                   	pop    %ebx
    3927:	c3                   	ret
    3928:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    392c:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    3930:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3934:	8d 8b 8c 96 ff ff    	lea    -0x6974(%ebx),%ecx
    393a:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    393e:	8d 8b 28 fe ff ff    	lea    -0x1d8(%ebx),%ecx
    3944:	eb 1c                	jmp    3962 <_ZN62_$LT$kernel_lib..ModuleError$u20$as$u20$core..fmt..Display$GT$3fmt17ha8664c7d15920444E+0xa2>
    3946:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    394a:	8d 4c 24 14          	lea    0x14(%esp),%ecx
    394e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    3952:	8d 8b 5c 96 ff ff    	lea    -0x69a4(%ebx),%ecx
    3958:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    395c:	8d 8b 20 fe ff ff    	lea    -0x1e0(%ebx),%ecx
    3962:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    3966:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%esp)
    396d:	00 
    396e:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    3975:	00 
    3976:	8d 4c 24 18          	lea    0x18(%esp),%ecx
    397a:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    397e:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    3985:	00 
    3986:	8b 08                	mov    (%eax),%ecx
    3988:	8b 50 04             	mov    0x4(%eax),%edx
    398b:	8d 44 24 20          	lea    0x20(%esp),%eax
    398f:	89 04 24             	mov    %eax,(%esp)
    3992:	e8 b9 14 00 00       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    3997:	83 c4 38             	add    $0x38,%esp
    399a:	5b                   	pop    %ebx
    399b:	c3                   	ret
    399c:	66 90                	xchg   %ax,%ax
    399e:	66 90                	xchg   %ax,%ax

000039a0 <init>:
    39a0:	53                   	push   %ebx
    39a1:	57                   	push   %edi
    39a2:	56                   	push   %esi
    39a3:	83 ec 60             	sub    $0x60,%esp
    39a6:	e8 00 00 00 00       	call   39ab <init+0xb>
    39ab:	5b                   	pop    %ebx
    39ac:	81 c3 49 46 00 00    	add    $0x4649,%ebx
    39b2:	b9 01 00 00 00       	mov    $0x1,%ecx
    39b7:	31 c0                	xor    %eax,%eax
    39b9:	f0 0f b1 8b 10 50 00 	lock cmpxchg %ecx,0x5010(%ebx)
    39c0:	00 
    39c1:	0f 85 c3 00 00 00    	jne    3a8a <init+0xea>
    39c7:	8d 83 94 e6 ff ff    	lea    -0x196c(%ebx),%eax
    39cd:	89 83 24 00 00 00    	mov    %eax,0x24(%ebx)
    39d3:	8d 83 58 fd ff ff    	lea    -0x2a8(%ebx),%eax
    39d9:	89 83 28 00 00 00    	mov    %eax,0x28(%ebx)
    39df:	c7 83 10 50 00 00 02 	movl   $0x2,0x5010(%ebx)
    39e6:	00 00 00 
    39e9:	c7 83 14 50 00 00 04 	movl   $0x4,0x5014(%ebx)
    39f0:	00 00 00 
    39f3:	c7 44 24 0c 00 80 0b 	movl   $0xb8000,0xc(%esp)
    39fa:	00 
    39fb:	8d bb 0c 40 00 00    	lea    0x400c(%ebx),%edi
    3a01:	89 7c 24 10          	mov    %edi,0x10(%esp)
    3a05:	c7 44 24 14 d0 07 00 	movl   $0x7d0,0x14(%esp)
    3a0c:	00 
    3a0d:	8d 74 24 0c          	lea    0xc(%esp),%esi
    3a11:	89 f2                	mov    %esi,%edx
    3a13:	b8 03 00 00 00       	mov    $0x3,%eax
    3a18:	cd 80                	int    $0x80
    3a1a:	85 c0                	test   %eax,%eax
    3a1c:	0f 85 ea 01 00 00    	jne    3c0c <init+0x26c>
    3a22:	31 c0                	xor    %eax,%eax
    3a24:	8d 8b 0e 40 00 00    	lea    0x400e(%ebx),%ecx
    3a2a:	90                   	nop
    3a2b:	90                   	nop
    3a2c:	90                   	nop
    3a2d:	90                   	nop
    3a2e:	90                   	nop
    3a2f:	90                   	nop
    3a30:	66 c7 41 fe 20 0f    	movw   $0xf20,-0x2(%ecx)
    3a36:	83 c0 02             	add    $0x2,%eax
    3a39:	66 c7 01 20 0f       	movw   $0xf20,(%ecx)
    3a3e:	83 c1 04             	add    $0x4,%ecx
    3a41:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    3a46:	75 e8                	jne    3a30 <init+0x90>
    3a48:	31 c9                	xor    %ecx,%ecx
    3a4a:	31 d2                	xor    %edx,%edx
    3a4c:	e8 cf 02 00 00       	call   3d20 <_ZN3vga9VgaWriter13update_cursor17h4b56fee7b06e16b3E>
    3a51:	0f b6 83 0c 50 00 00 	movzbl 0x500c(%ebx),%eax
    3a58:	b1 01                	mov    $0x1,%cl
    3a5a:	90                   	nop
    3a5b:	90                   	nop
    3a5c:	90                   	nop
    3a5d:	90                   	nop
    3a5e:	90                   	nop
    3a5f:	90                   	nop
    3a60:	31 c0                	xor    %eax,%eax
    3a62:	f0 0f b0 8b 0c 00 00 	lock cmpxchg %cl,0xc(%ebx)
    3a69:	00 
    3a6a:	74 62                	je     3ace <init+0x12e>
    3a6c:	90                   	nop
    3a6d:	90                   	nop
    3a6e:	90                   	nop
    3a6f:	90                   	nop
    3a70:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    3a77:	84 c0                	test   %al,%al
    3a79:	74 e5                	je     3a60 <init+0xc0>
    3a7b:	f3 90                	pause
    3a7d:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    3a84:	84 c0                	test   %al,%al
    3a86:	75 f3                	jne    3a7b <init+0xdb>
    3a88:	eb d6                	jmp    3a60 <init+0xc0>
    3a8a:	83 f8 01             	cmp    $0x1,%eax
    3a8d:	75 19                	jne    3aa8 <init+0x108>
    3a8f:	90                   	nop
    3a90:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    3a96:	83 f8 01             	cmp    $0x1,%eax
    3a99:	75 0d                	jne    3aa8 <init+0x108>
    3a9b:	f3 90                	pause
    3a9d:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    3aa3:	83 f8 01             	cmp    $0x1,%eax
    3aa6:	74 f3                	je     3a9b <init+0xfb>
    3aa8:	83 ec 04             	sub    $0x4,%esp
    3aab:	8d 83 a0 fe ff ff    	lea    -0x160(%ebx),%eax
    3ab1:	8d b3 68 fe ff ff    	lea    -0x198(%ebx),%esi
    3ab7:	8d 7c 24 0f          	lea    0xf(%esp),%edi
    3abb:	8d 8b f7 ea ff ff    	lea    -0x1509(%ebx),%ecx
    3ac1:	ba 2b 00 00 00       	mov    $0x2b,%edx
    3ac6:	50                   	push   %eax
    3ac7:	56                   	push   %esi
    3ac8:	57                   	push   %edi
    3ac9:	e8 f2 d6 ff ff       	call   11c0 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    3ace:	b9 04 00 00 00       	mov    $0x4,%ecx
    3ad3:	ba 10 00 00 00       	mov    $0x10,%edx
    3ad8:	e8 f3 de ff ff       	call   19d0 <_ZN4talc4talc13Talc$LT$O$GT$6malloc17hfb0da288b1d6f9eaE>
    3add:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    3ae4:	85 c0                	test   %eax,%eax
    3ae6:	0f 84 16 01 00 00    	je     3c02 <init+0x262>
    3aec:	89 38                	mov    %edi,(%eax)
    3aee:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    3af5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    3afc:	c6 40 0c 0f          	movb   $0xf,0xc(%eax)
    3b00:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
    3b07:	00 
    3b08:	66 c7 44 24 10 76 67 	movw   $0x6776,0x10(%esp)
    3b0f:	c6 44 24 12 61       	movb   $0x61,0x12(%esp)
    3b14:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3b18:	8d 7c 24 0c          	lea    0xc(%esp),%edi
    3b1c:	89 fa                	mov    %edi,%edx
    3b1e:	b8 81 00 00 00       	mov    $0x81,%eax
    3b23:	cd 80                	int    $0x80
    3b25:	85 c0                	test   %eax,%eax
    3b27:	0f 85 f2 00 00 00    	jne    3c1f <init+0x27f>
    3b2d:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    3b33:	83 f8 03             	cmp    $0x3,%eax
    3b36:	0f 82 b6 00 00 00    	jb     3bf2 <init+0x252>
    3b3c:	c7 44 24 2c 03 00 00 	movl   $0x3,0x2c(%esp)
    3b43:	00 
    3b44:	8d 83 68 eb ff ff    	lea    -0x1498(%ebx),%eax
    3b4a:	89 44 24 30          	mov    %eax,0x30(%esp)
    3b4e:	c7 44 24 34 03 00 00 	movl   $0x3,0x34(%esp)
    3b55:	00 
    3b56:	8d 8b 98 fe ff ff    	lea    -0x168(%ebx),%ecx
    3b5c:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    3b60:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    3b67:	00 
    3b68:	c7 44 24 40 04 00 00 	movl   $0x4,0x40(%esp)
    3b6f:	00 
    3b70:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    3b77:	00 
    3b78:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    3b7f:	00 
    3b80:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3b87:	00 
    3b88:	89 44 24 18          	mov    %eax,0x18(%esp)
    3b8c:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    3b93:	00 
    3b94:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    3b9b:	00 
    3b9c:	8d 83 3d eb ff ff    	lea    -0x14c3(%ebx),%eax
    3ba2:	89 44 24 24          	mov    %eax,0x24(%esp)
    3ba6:	c7 44 24 28 0f 00 00 	movl   $0xf,0x28(%esp)
    3bad:	00 
    3bae:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3bb5:	00 
    3bb6:	c7 44 24 10 a2 00 00 	movl   $0xa2,0x10(%esp)
    3bbd:	00 
    3bbe:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    3bc4:	83 f8 02             	cmp    $0x2,%eax
    3bc7:	74 10                	je     3bd9 <init+0x239>
    3bc9:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    3bcf:	75 10                	jne    3be1 <init+0x241>
    3bd1:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    3bd7:	eb 0e                	jmp    3be7 <init+0x247>
    3bd9:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    3bdf:	74 f0                	je     3bd1 <init+0x231>
    3be1:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    3be7:	83 ec 08             	sub    $0x8,%esp
    3bea:	57                   	push   %edi
    3beb:	51                   	push   %ecx
    3bec:	ff 50 10             	call   *0x10(%eax)
    3bef:	83 c4 10             	add    $0x10,%esp
    3bf2:	8d 93 fc bd ff ff    	lea    -0x4204(%ebx),%edx
    3bf8:	b9 02 00 00 00       	mov    $0x2,%ecx
    3bfd:	e8 9e fb ff ff       	call   37a0 <_ZN10kernel_lib8complete17hbeb237b8ef5fd0e2E>
    3c02:	b9 10 00 00 00       	mov    $0x10,%ecx
    3c07:	e8 f4 d3 ff ff       	call   1000 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE>
    3c0c:	b9 42 00 00 00       	mov    $0x42,%ecx
    3c11:	8d 50 ff             	lea    -0x1(%eax),%edx
    3c14:	83 fa 0a             	cmp    $0xa,%edx
    3c17:	73 02                	jae    3c1b <init+0x27b>
    3c19:	89 c1                	mov    %eax,%ecx
    3c1b:	31 c0                	xor    %eax,%eax
    3c1d:	eb 14                	jmp    3c33 <init+0x293>
    3c1f:	b9 42 00 00 00       	mov    $0x42,%ecx
    3c24:	8d 50 ff             	lea    -0x1(%eax),%edx
    3c27:	83 fa 09             	cmp    $0x9,%edx
    3c2a:	77 02                	ja     3c2e <init+0x28e>
    3c2c:	89 c1                	mov    %eax,%ecx
    3c2e:	b8 02 00 00 00       	mov    $0x2,%eax
    3c33:	89 44 24 50          	mov    %eax,0x50(%esp)
    3c37:	89 4c 24 54          	mov    %ecx,0x54(%esp)
    3c3b:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    3c41:	85 c0                	test   %eax,%eax
    3c43:	0f 84 c8 00 00 00    	je     3d11 <init+0x371>
    3c49:	8d 44 24 50          	lea    0x50(%esp),%eax
    3c4d:	89 44 24 58          	mov    %eax,0x58(%esp)
    3c51:	8d 83 cc b8 ff ff    	lea    -0x4734(%ebx),%eax
    3c57:	89 44 24 5c          	mov    %eax,0x5c(%esp)
    3c5b:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
    3c62:	00 
    3c63:	8d 83 68 eb ff ff    	lea    -0x1498(%ebx),%eax
    3c69:	89 44 24 30          	mov    %eax,0x30(%esp)
    3c6d:	c7 44 24 34 03 00 00 	movl   $0x3,0x34(%esp)
    3c74:	00 
    3c75:	8d 8b b0 fe ff ff    	lea    -0x150(%ebx),%ecx
    3c7b:	89 4c 24 38          	mov    %ecx,0x38(%esp)
    3c7f:	c7 44 24 3c 01 00 00 	movl   $0x1,0x3c(%esp)
    3c86:	00 
    3c87:	8d 4c 24 58          	lea    0x58(%esp),%ecx
    3c8b:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    3c8f:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    3c96:	00 
    3c97:	c7 44 24 48 00 00 00 	movl   $0x0,0x48(%esp)
    3c9e:	00 
    3c9f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3ca6:	00 
    3ca7:	89 44 24 18          	mov    %eax,0x18(%esp)
    3cab:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    3cb2:	00 
    3cb3:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    3cba:	00 
    3cbb:	8d 83 3d eb ff ff    	lea    -0x14c3(%ebx),%eax
    3cc1:	89 44 24 24          	mov    %eax,0x24(%esp)
    3cc5:	c7 44 24 28 0f 00 00 	movl   $0xf,0x28(%esp)
    3ccc:	00 
    3ccd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3cd4:	00 
    3cd5:	c7 44 24 10 0e 00 00 	movl   $0xe,0x10(%esp)
    3cdc:	00 
    3cdd:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    3ce3:	83 f8 02             	cmp    $0x2,%eax
    3ce6:	74 08                	je     3cf0 <init+0x350>
    3ce8:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    3cee:	eb 06                	jmp    3cf6 <init+0x356>
    3cf0:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    3cf6:	74 08                	je     3d00 <init+0x360>
    3cf8:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    3cfe:	eb 06                	jmp    3d06 <init+0x366>
    3d00:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    3d06:	83 ec 08             	sub    $0x8,%esp
    3d09:	56                   	push   %esi
    3d0a:	51                   	push   %ecx
    3d0b:	ff 50 10             	call   *0x10(%eax)
    3d0e:	83 c4 10             	add    $0x10,%esp
    3d11:	b8 01 00 00 00       	mov    $0x1,%eax
    3d16:	89 c0                	mov    %eax,%eax
    3d18:	cd 81                	int    $0x81
    3d1a:	0f 0b                	ud2
    3d1c:	66 90                	xchg   %ax,%ax
    3d1e:	66 90                	xchg   %ax,%ax

00003d20 <_ZN3vga9VgaWriter13update_cursor17h4b56fee7b06e16b3E>:
    3d20:	53                   	push   %ebx
    3d21:	57                   	push   %edi
    3d22:	56                   	push   %esi
    3d23:	81 ec 10 01 00 00    	sub    $0x110,%esp
    3d29:	e8 00 00 00 00       	call   3d2e <_ZN3vga9VgaWriter13update_cursor17h4b56fee7b06e16b3E+0xe>
    3d2e:	5b                   	pop    %ebx
    3d2f:	81 c3 c6 42 00 00    	add    $0x42c6,%ebx
    3d35:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3d38:	c1 e0 04             	shl    $0x4,%eax
    3d3b:	01 c8                	add    %ecx,%eax
    3d3d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3d44:	00 
    3d45:	c7 44 24 08 00 0f d4 	movl   $0x3d40f00,0x8(%esp)
    3d4c:	03 
    3d4d:	89 c1                	mov    %eax,%ecx
    3d4f:	c1 e1 08             	shl    $0x8,%ecx
    3d52:	0f b7 c9             	movzwl %cx,%ecx
    3d55:	81 c9 00 00 d5 03    	or     $0x3d50000,%ecx
    3d5b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3d5f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    3d66:	00 
    3d67:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    3d6e:	00 
    3d6f:	c7 44 24 18 00 0e d4 	movl   $0x3d40e00,0x18(%esp)
    3d76:	03 
    3d77:	25 00 ff 00 00       	and    $0xff00,%eax
    3d7c:	0d 00 00 d5 03       	or     $0x3d50000,%eax
    3d81:	89 44 24 20          	mov    %eax,0x20(%esp)
    3d85:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    3d8c:	00 
    3d8d:	c7 84 24 08 01 00 00 	movl   $0x4,0x108(%esp)
    3d94:	04 00 00 00 
    3d98:	8d 54 24 08          	lea    0x8(%esp),%edx
    3d9c:	b9 04 00 00 00       	mov    $0x4,%ecx
    3da1:	b8 84 00 00 00       	mov    $0x84,%eax
    3da6:	cd 80                	int    $0x80
    3da8:	85 c0                	test   %eax,%eax
    3daa:	75 0a                	jne    3db6 <_ZN3vga9VgaWriter13update_cursor17h4b56fee7b06e16b3E+0x96>
    3dac:	81 c4 10 01 00 00    	add    $0x110,%esp
    3db2:	5e                   	pop    %esi
    3db3:	5f                   	pop    %edi
    3db4:	5b                   	pop    %ebx
    3db5:	c3                   	ret
    3db6:	89 c1                	mov    %eax,%ecx
    3db8:	e8 33 1c 00 00       	call   59f0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>
    3dbd:	89 44 24 04          	mov    %eax,0x4(%esp)
    3dc1:	83 ec 04             	sub    $0x4,%esp
    3dc4:	8d 83 88 fe ff ff    	lea    -0x178(%ebx),%eax
    3dca:	8d b3 58 fe ff ff    	lea    -0x1a8(%ebx),%esi
    3dd0:	8d 7c 24 08          	lea    0x8(%esp),%edi
    3dd4:	8d 8b 4c eb ff ff    	lea    -0x14b4(%ebx),%ecx
    3dda:	ba 1b 00 00 00       	mov    $0x1b,%edx
    3ddf:	50                   	push   %eax
    3de0:	56                   	push   %esi
    3de1:	57                   	push   %edi
    3de2:	e8 d9 d3 ff ff       	call   11c0 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    3de7:	66 90                	xchg   %ax,%ax
    3de9:	66 90                	xchg   %ax,%ax
    3deb:	66 90                	xchg   %ax,%ax
    3ded:	66 90                	xchg   %ax,%ax
    3def:	90                   	nop

00003df0 <_ZN3vga5write17hdf203e499db81710E>:
    3df0:	55                   	push   %ebp
    3df1:	53                   	push   %ebx
    3df2:	57                   	push   %edi
    3df3:	56                   	push   %esi
    3df4:	83 ec 1c             	sub    $0x1c,%esp
    3df7:	e8 00 00 00 00       	call   3dfc <_ZN3vga5write17hdf203e499db81710E+0xc>
    3dfc:	58                   	pop    %eax
    3dfd:	81 c0 f8 41 00 00    	add    $0x41f8,%eax
    3e03:	89 44 24 10          	mov    %eax,0x10(%esp)
    3e07:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    3e0b:	8b 44 24 30          	mov    0x30(%esp),%eax
    3e0f:	8b 58 08             	mov    0x8(%eax),%ebx
    3e12:	8b 41 04             	mov    0x4(%ecx),%eax
    3e15:	8b 51 08             	mov    0x8(%ecx),%edx
    3e18:	85 d2                	test   %edx,%edx
    3e1a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3e1e:	0f 84 96 00 00 00    	je     3eba <_ZN3vga5write17hdf203e499db81710E+0xca>
    3e24:	31 ed                	xor    %ebp,%ebp
    3e26:	89 54 24 18          	mov    %edx,0x18(%esp)
    3e2a:	eb 12                	jmp    3e3e <_ZN3vga5write17hdf203e499db81710E+0x4e>
    3e2c:	90                   	nop
    3e2d:	90                   	nop
    3e2e:	90                   	nop
    3e2f:	90                   	nop
    3e30:	89 7b 08             	mov    %edi,0x8(%ebx)
    3e33:	31 c9                	xor    %ecx,%ecx
    3e35:	45                   	inc    %ebp
    3e36:	39 ea                	cmp    %ebp,%edx
    3e38:	0f 84 7f 00 00 00    	je     3ebd <_ZN3vga5write17hdf203e499db81710E+0xcd>
    3e3e:	0f b6 34 28          	movzbl (%eax,%ebp,1),%esi
    3e42:	66 83 fe 0a          	cmp    $0xa,%si
    3e46:	75 18                	jne    3e60 <_ZN3vga5write17hdf203e499db81710E+0x70>
    3e48:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    3e4f:	8b 7b 08             	mov    0x8(%ebx),%edi
    3e52:	47                   	inc    %edi
    3e53:	83 ff 18             	cmp    $0x18,%edi
    3e56:	72 d8                	jb     3e30 <_ZN3vga5write17hdf203e499db81710E+0x40>
    3e58:	eb 56                	jmp    3eb0 <_ZN3vga5write17hdf203e499db81710E+0xc0>
    3e5a:	90                   	nop
    3e5b:	90                   	nop
    3e5c:	90                   	nop
    3e5d:	90                   	nop
    3e5e:	90                   	nop
    3e5f:	90                   	nop
    3e60:	8b 4b 04             	mov    0x4(%ebx),%ecx
    3e63:	8b 7b 08             	mov    0x8(%ebx),%edi
    3e66:	8d 04 bf             	lea    (%edi,%edi,4),%eax
    3e69:	c1 e0 04             	shl    $0x4,%eax
    3e6c:	01 c8                	add    %ecx,%eax
    3e6e:	3d d0 07 00 00       	cmp    $0x7d0,%eax
    3e73:	0f 83 a2 02 00 00    	jae    411b <_ZN3vga5write17hdf203e499db81710E+0x32b>
    3e79:	8b 13                	mov    (%ebx),%edx
    3e7b:	89 54 24 14          	mov    %edx,0x14(%esp)
    3e7f:	8b 53 0c             	mov    0xc(%ebx),%edx
    3e82:	c1 e2 08             	shl    $0x8,%edx
    3e85:	0f b7 f6             	movzwl %si,%esi
    3e88:	09 d6                	or     %edx,%esi
    3e8a:	8b 54 24 14          	mov    0x14(%esp),%edx
    3e8e:	66 89 34 42          	mov    %si,(%edx,%eax,2)
    3e92:	41                   	inc    %ecx
    3e93:	89 4b 04             	mov    %ecx,0x4(%ebx)
    3e96:	83 f9 50             	cmp    $0x50,%ecx
    3e99:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3e9d:	8b 54 24 18          	mov    0x18(%esp),%edx
    3ea1:	72 92                	jb     3e35 <_ZN3vga5write17hdf203e499db81710E+0x45>
    3ea3:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    3eaa:	47                   	inc    %edi
    3eab:	83 ff 18             	cmp    $0x18,%edi
    3eae:	72 80                	jb     3e30 <_ZN3vga5write17hdf203e499db81710E+0x40>
    3eb0:	bf 18 00 00 00       	mov    $0x18,%edi
    3eb5:	e9 76 ff ff ff       	jmp    3e30 <_ZN3vga5write17hdf203e499db81710E+0x40>
    3eba:	8b 4b 04             	mov    0x4(%ebx),%ecx
    3ebd:	8b 53 08             	mov    0x8(%ebx),%edx
    3ec0:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    3ec4:	e8 57 fe ff ff       	call   3d20 <_ZN3vga9VgaWriter13update_cursor17h4b56fee7b06e16b3E>
    3ec9:	8b 44 24 34          	mov    0x34(%esp),%eax
    3ecd:	8b 08                	mov    (%eax),%ecx
    3ecf:	85 c9                	test   %ecx,%ecx
    3ed1:	0f 84 2f 02 00 00    	je     4106 <_ZN3vga5write17hdf203e499db81710E+0x316>
    3ed7:	b2 01                	mov    $0x1,%dl
    3ed9:	90                   	nop
    3eda:	90                   	nop
    3edb:	90                   	nop
    3edc:	90                   	nop
    3edd:	90                   	nop
    3ede:	90                   	nop
    3edf:	90                   	nop
    3ee0:	31 c0                	xor    %eax,%eax
    3ee2:	f0 0f b0 93 0c 00 00 	lock cmpxchg %dl,0xc(%ebx)
    3ee9:	00 
    3eea:	75 06                	jne    3ef2 <_ZN3vga5write17hdf203e499db81710E+0x102>
    3eec:	eb 11                	jmp    3eff <_ZN3vga5write17hdf203e499db81710E+0x10f>
    3eee:	90                   	nop
    3eef:	90                   	nop
    3ef0:	f3 90                	pause
    3ef2:	0f b6 83 0c 00 00 00 	movzbl 0xc(%ebx),%eax
    3ef9:	84 c0                	test   %al,%al
    3efb:	75 f3                	jne    3ef0 <_ZN3vga5write17hdf203e499db81710E+0x100>
    3efd:	eb e1                	jmp    3ee0 <_ZN3vga5write17hdf203e499db81710E+0xf0>
    3eff:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3f03:	01 c8                	add    %ecx,%eax
    3f05:	83 c0 03             	add    $0x3,%eax
    3f08:	83 e0 fc             	and    $0xfffffffc,%eax
    3f0b:	8b 28                	mov    (%eax),%ebp
    3f0d:	39 c5                	cmp    %eax,%ebp
    3f0f:	76 05                	jbe    3f16 <_ZN3vga5write17hdf203e499db81710E+0x126>
    3f11:	8b 4d 00             	mov    0x0(%ebp),%ecx
    3f14:	eb 04                	jmp    3f1a <_ZN3vga5write17hdf203e499db81710E+0x12a>
    3f16:	89 e9                	mov    %ebp,%ecx
    3f18:	89 c5                	mov    %eax,%ebp
    3f1a:	89 cf                	mov    %ecx,%edi
    3f1c:	83 e7 fc             	and    $0xfffffffc,%edi
    3f1f:	8b 47 fc             	mov    -0x4(%edi),%eax
    3f22:	a8 01                	test   $0x1,%al
    3f24:	75 13                	jne    3f39 <_ZN3vga5write17hdf203e499db81710E+0x149>
    3f26:	29 c7                	sub    %eax,%edi
    3f28:	83 f8 40             	cmp    $0x40,%eax
    3f2b:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3f2f:	73 1b                	jae    3f4c <_ZN3vga5write17hdf203e499db81710E+0x15c>
    3f31:	83 c0 f4             	add    $0xfffffff4,%eax
    3f34:	c1 e8 02             	shr    $0x2,%eax
    3f37:	eb 3f                	jmp    3f78 <_ZN3vga5write17hdf203e499db81710E+0x188>
    3f39:	83 c0 02             	add    $0x2,%eax
    3f3c:	89 47 fc             	mov    %eax,-0x4(%edi)
    3f3f:	8d 55 04             	lea    0x4(%ebp),%edx
    3f42:	f6 c1 02             	test   $0x2,%cl
    3f45:	74 57                	je     3f9e <_ZN3vga5write17hdf203e499db81710E+0x1ae>
    3f47:	e9 8e 00 00 00       	jmp    3fda <_ZN3vga5write17hdf203e499db81710E+0x1ea>
    3f4c:	3d 80 00 00 00       	cmp    $0x80,%eax
    3f51:	73 08                	jae    3f5b <_ZN3vga5write17hdf203e499db81710E+0x16b>
    3f53:	c1 e8 03             	shr    $0x3,%eax
    3f56:	83 c0 05             	add    $0x5,%eax
    3f59:	eb 1d                	jmp    3f78 <_ZN3vga5write17hdf203e499db81710E+0x188>
    3f5b:	0f bd d0             	bsr    %eax,%edx
    3f5e:	83 f2 1f             	xor    $0x1f,%edx
    3f61:	b1 1e                	mov    $0x1e,%cl
    3f63:	28 d1                	sub    %dl,%cl
    3f65:	d3 e8                	shr    %cl,%eax
    3f67:	01 d2                	add    %edx,%edx
    3f69:	29 d0                	sub    %edx,%eax
    3f6b:	83 c0 43             	add    $0x43,%eax
    3f6e:	83 f8 3f             	cmp    $0x3f,%eax
    3f71:	72 05                	jb     3f78 <_ZN3vga5write17hdf203e499db81710E+0x188>
    3f73:	b8 3f 00 00 00       	mov    $0x3f,%eax
    3f78:	8b 0f                	mov    (%edi),%ecx
    3f7a:	8b 57 04             	mov    0x4(%edi),%edx
    3f7d:	89 0a                	mov    %ecx,(%edx)
    3f7f:	85 c9                	test   %ecx,%ecx
    3f81:	74 03                	je     3f86 <_ZN3vga5write17hdf203e499db81710E+0x196>
    3f83:	89 51 04             	mov    %edx,0x4(%ecx)
    3f86:	8b 8b 20 00 00 00    	mov    0x20(%ebx),%ecx
    3f8c:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
    3f90:	74 24                	je     3fb6 <_ZN3vga5write17hdf203e499db81710E+0x1c6>
    3f92:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    3f96:	8d 55 04             	lea    0x4(%ebp),%edx
    3f99:	f6 c1 02             	test   $0x2,%cl
    3f9c:	75 3c                	jne    3fda <_ZN3vga5write17hdf203e499db81710E+0x1ea>
    3f9e:	89 d5                	mov    %edx,%ebp
    3fa0:	29 fd                	sub    %edi,%ebp
    3fa2:	83 fd 40             	cmp    $0x40,%ebp
    3fa5:	0f 83 ca 00 00 00    	jae    4075 <_ZN3vga5write17hdf203e499db81710E+0x285>
    3fab:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3fae:	c1 e8 02             	shr    $0x2,%eax
    3fb1:	e9 f4 00 00 00       	jmp    40aa <_ZN3vga5write17hdf203e499db81710E+0x2ba>
    3fb6:	31 d2                	xor    %edx,%edx
    3fb8:	83 f8 20             	cmp    $0x20,%eax
    3fbb:	0f 93 c2             	setae  %dl
    3fbe:	be 01 00 00 00       	mov    $0x1,%esi
    3fc3:	89 c1                	mov    %eax,%ecx
    3fc5:	d3 e6                	shl    %cl,%esi
    3fc7:	31 b4 93 18 00 00 00 	xor    %esi,0x18(%ebx,%edx,4)
    3fce:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    3fd2:	8d 55 04             	lea    0x4(%ebp),%edx
    3fd5:	f6 c1 02             	test   $0x2,%cl
    3fd8:	74 c4                	je     3f9e <_ZN3vga5write17hdf203e499db81710E+0x1ae>
    3fda:	8b 75 0c             	mov    0xc(%ebp),%esi
    3fdd:	83 fe 40             	cmp    $0x40,%esi
    3fe0:	89 54 24 14          	mov    %edx,0x14(%esp)
    3fe4:	73 08                	jae    3fee <_ZN3vga5write17hdf203e499db81710E+0x1fe>
    3fe6:	8d 46 f4             	lea    -0xc(%esi),%eax
    3fe9:	c1 e8 02             	shr    $0x2,%eax
    3fec:	eb 39                	jmp    4027 <_ZN3vga5write17hdf203e499db81710E+0x237>
    3fee:	81 fe 80 00 00 00    	cmp    $0x80,%esi
    3ff4:	73 0a                	jae    4000 <_ZN3vga5write17hdf203e499db81710E+0x210>
    3ff6:	89 f0                	mov    %esi,%eax
    3ff8:	c1 e8 03             	shr    $0x3,%eax
    3ffb:	83 c0 05             	add    $0x5,%eax
    3ffe:	eb 27                	jmp    4027 <_ZN3vga5write17hdf203e499db81710E+0x237>
    4000:	0f bd c6             	bsr    %esi,%eax
    4003:	83 f0 1f             	xor    $0x1f,%eax
    4006:	89 44 24 0c          	mov    %eax,0xc(%esp)
    400a:	b1 1e                	mov    $0x1e,%cl
    400c:	28 c1                	sub    %al,%cl
    400e:	89 f0                	mov    %esi,%eax
    4010:	d3 e8                	shr    %cl,%eax
    4012:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    4016:	01 c9                	add    %ecx,%ecx
    4018:	29 c8                	sub    %ecx,%eax
    401a:	83 c0 43             	add    $0x43,%eax
    401d:	83 f8 3f             	cmp    $0x3f,%eax
    4020:	72 05                	jb     4027 <_ZN3vga5write17hdf203e499db81710E+0x237>
    4022:	b8 3f 00 00 00       	mov    $0x3f,%eax
    4027:	8b 4d 04             	mov    0x4(%ebp),%ecx
    402a:	8b 55 08             	mov    0x8(%ebp),%edx
    402d:	89 0a                	mov    %ecx,(%edx)
    402f:	85 c9                	test   %ecx,%ecx
    4031:	74 03                	je     4036 <_ZN3vga5write17hdf203e499db81710E+0x246>
    4033:	89 51 04             	mov    %edx,0x4(%ecx)
    4036:	8b 8b 20 00 00 00    	mov    0x20(%ebx),%ecx
    403c:	83 3c 81 00          	cmpl   $0x0,(%ecx,%eax,4)
    4040:	75 20                	jne    4062 <_ZN3vga5write17hdf203e499db81710E+0x272>
    4042:	31 d2                	xor    %edx,%edx
    4044:	83 f8 20             	cmp    $0x20,%eax
    4047:	0f 93 c2             	setae  %dl
    404a:	bb 01 00 00 00       	mov    $0x1,%ebx
    404f:	89 c1                	mov    %eax,%ecx
    4051:	d3 e3                	shl    %cl,%ebx
    4053:	8b 44 24 10          	mov    0x10(%esp),%eax
    4057:	31 9c 90 18 00 00 00 	xor    %ebx,0x18(%eax,%edx,4)
    405e:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    4062:	8b 54 24 14          	mov    0x14(%esp),%edx
    4066:	01 f2                	add    %esi,%edx
    4068:	89 d5                	mov    %edx,%ebp
    406a:	29 fd                	sub    %edi,%ebp
    406c:	83 fd 40             	cmp    $0x40,%ebp
    406f:	0f 82 36 ff ff ff    	jb     3fab <_ZN3vga5write17hdf203e499db81710E+0x1bb>
    4075:	81 fd 80 00 00 00    	cmp    $0x80,%ebp
    407b:	73 0a                	jae    4087 <_ZN3vga5write17hdf203e499db81710E+0x297>
    407d:	89 e8                	mov    %ebp,%eax
    407f:	c1 e8 03             	shr    $0x3,%eax
    4082:	83 c0 05             	add    $0x5,%eax
    4085:	eb 23                	jmp    40aa <_ZN3vga5write17hdf203e499db81710E+0x2ba>
    4087:	89 d6                	mov    %edx,%esi
    4089:	0f bd d5             	bsr    %ebp,%edx
    408c:	83 f2 1f             	xor    $0x1f,%edx
    408f:	b1 1e                	mov    $0x1e,%cl
    4091:	28 d1                	sub    %dl,%cl
    4093:	89 e8                	mov    %ebp,%eax
    4095:	d3 e8                	shr    %cl,%eax
    4097:	01 d2                	add    %edx,%edx
    4099:	29 d0                	sub    %edx,%eax
    409b:	83 c0 43             	add    $0x43,%eax
    409e:	83 f8 3f             	cmp    $0x3f,%eax
    40a1:	72 05                	jb     40a8 <_ZN3vga5write17hdf203e499db81710E+0x2b8>
    40a3:	b8 3f 00 00 00       	mov    $0x3f,%eax
    40a8:	89 f2                	mov    %esi,%edx
    40aa:	8b 8b 20 00 00 00    	mov    0x20(%ebx),%ecx
    40b0:	8d 34 81             	lea    (%ecx,%eax,4),%esi
    40b3:	8b 0c 81             	mov    (%ecx,%eax,4),%ecx
    40b6:	85 c9                	test   %ecx,%ecx
    40b8:	74 0c                	je     40c6 <_ZN3vga5write17hdf203e499db81710E+0x2d6>
    40ba:	89 0f                	mov    %ecx,(%edi)
    40bc:	89 77 04             	mov    %esi,0x4(%edi)
    40bf:	89 3e                	mov    %edi,(%esi)
    40c1:	89 79 04             	mov    %edi,0x4(%ecx)
    40c4:	eb 33                	jmp    40f9 <_ZN3vga5write17hdf203e499db81710E+0x309>
    40c6:	89 54 24 14          	mov    %edx,0x14(%esp)
    40ca:	31 d2                	xor    %edx,%edx
    40cc:	83 f8 20             	cmp    $0x20,%eax
    40cf:	0f 93 c2             	setae  %dl
    40d2:	bb 01 00 00 00       	mov    $0x1,%ebx
    40d7:	89 c1                	mov    %eax,%ecx
    40d9:	d3 e3                	shl    %cl,%ebx
    40db:	8b 44 24 10          	mov    0x10(%esp),%eax
    40df:	31 9c 90 18 00 00 00 	xor    %ebx,0x18(%eax,%edx,4)
    40e6:	8b 54 24 14          	mov    0x14(%esp),%edx
    40ea:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    40ee:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    40f4:	89 77 04             	mov    %esi,0x4(%edi)
    40f7:	89 3e                	mov    %edi,(%esi)
    40f9:	89 6f 08             	mov    %ebp,0x8(%edi)
    40fc:	89 6a fc             	mov    %ebp,-0x4(%edx)
    40ff:	c6 83 0c 00 00 00 00 	movb   $0x0,0xc(%ebx)
    4106:	8b 44 24 30          	mov    0x30(%esp),%eax
    410a:	8b 08                	mov    (%eax),%ecx
    410c:	e8 0f 16 00 00       	call   5720 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>
    4111:	31 c0                	xor    %eax,%eax
    4113:	83 c4 1c             	add    $0x1c,%esp
    4116:	5e                   	pop    %esi
    4117:	5f                   	pop    %edi
    4118:	5b                   	pop    %ebx
    4119:	5d                   	pop    %ebp
    411a:	c3                   	ret
    411b:	89 c1                	mov    %eax,%ecx
    411d:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    4121:	e8 a3 cf ff ff       	call   10c9 <_ZN4core9panicking18panic_bounds_check17h1db588f06ac7ac58E>
    4126:	66 90                	xchg   %ax,%ax
    4128:	66 90                	xchg   %ax,%ax
    412a:	66 90                	xchg   %ax,%ax
    412c:	66 90                	xchg   %ax,%ax
    412e:	66 90                	xchg   %ax,%ax

00004130 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E>:
    4130:	55                   	push   %ebp
    4131:	53                   	push   %ebx
    4132:	57                   	push   %edi
    4133:	56                   	push   %esi
    4134:	83 ec 1c             	sub    $0x1c,%esp
    4137:	e8 00 00 00 00       	call   413c <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xc>
    413c:	5b                   	pop    %ebx
    413d:	81 c3 b8 3e 00 00    	add    $0x3eb8,%ebx
    4143:	8b 6c 24 34          	mov    0x34(%esp),%ebp
    4147:	8b 44 24 30          	mov    0x30(%esp),%eax
    414b:	83 38 00             	cmpl   $0x0,(%eax)
    414e:	74 71                	je     41c1 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x91>
    4150:	8b 55 00             	mov    0x0(%ebp),%edx
    4153:	8b 45 04             	mov    0x4(%ebp),%eax
    4156:	89 44 24 0c          	mov    %eax,0xc(%esp)
    415a:	8b 48 0c             	mov    0xc(%eax),%ecx
    415d:	83 ec 04             	sub    $0x4,%esp
    4160:	8d 83 30 eb ff ff    	lea    -0x14d0(%ebx),%eax
    4166:	6a 0d                	push   $0xd
    4168:	50                   	push   %eax
    4169:	89 d7                	mov    %edx,%edi
    416b:	52                   	push   %edx
    416c:	89 ce                	mov    %ecx,%esi
    416e:	ff d1                	call   *%ecx
    4170:	83 c4 10             	add    $0x10,%esp
    4173:	b1 01                	mov    $0x1,%cl
    4175:	84 c0                	test   %al,%al
    4177:	0f 85 e5 00 00 00    	jne    4262 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x132>
    417d:	f6 45 0a 80          	testb  $0x80,0xa(%ebp)
    4181:	75 5b                	jne    41de <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xae>
    4183:	83 ec 04             	sub    $0x4,%esp
    4186:	8d 83 ee eb ff ff    	lea    -0x1412(%ebx),%eax
    418c:	6a 01                	push   $0x1
    418e:	50                   	push   %eax
    418f:	57                   	push   %edi
    4190:	ff d6                	call   *%esi
    4192:	83 c4 10             	add    $0x10,%esp
    4195:	84 c0                	test   %al,%al
    4197:	0f 85 8e 00 00 00    	jne    422b <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xfb>
    419d:	83 ec 0c             	sub    $0xc,%esp
    41a0:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    41a4:	89 fa                	mov    %edi,%edx
    41a6:	ff 74 24 18          	push   0x18(%esp)
    41aa:	e8 c1 00 00 00       	call   4270 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E>
    41af:	83 c4 10             	add    $0x10,%esp
    41b2:	84 c0                	test   %al,%al
    41b4:	b1 01                	mov    $0x1,%cl
    41b6:	0f 85 a6 00 00 00    	jne    4262 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x132>
    41bc:	e9 8d 00 00 00       	jmp    424e <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x11e>
    41c1:	8b 45 04             	mov    0x4(%ebp),%eax
    41c4:	83 ec 04             	sub    $0x4,%esp
    41c7:	8d 8b 78 ed ff ff    	lea    -0x1288(%ebx),%ecx
    41cd:	6a 0c                	push   $0xc
    41cf:	51                   	push   %ecx
    41d0:	ff 75 00             	push   0x0(%ebp)
    41d3:	ff 50 0c             	call   *0xc(%eax)
    41d6:	83 c4 2c             	add    $0x2c,%esp
    41d9:	e9 89 00 00 00       	jmp    4267 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x137>
    41de:	83 ec 04             	sub    $0x4,%esp
    41e1:	8d 83 ef eb ff ff    	lea    -0x1411(%ebx),%eax
    41e7:	6a 02                	push   $0x2
    41e9:	50                   	push   %eax
    41ea:	57                   	push   %edi
    41eb:	ff d6                	call   *%esi
    41ed:	83 c4 10             	add    $0x10,%esp
    41f0:	84 c0                	test   %al,%al
    41f2:	75 37                	jne    422b <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xfb>
    41f4:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    41f9:	89 7c 24 10          	mov    %edi,0x10(%esp)
    41fd:	8b 44 24 0c          	mov    0xc(%esp),%eax
    4201:	89 44 24 14          	mov    %eax,0x14(%esp)
    4205:	8d 44 24 0b          	lea    0xb(%esp),%eax
    4209:	89 44 24 18          	mov    %eax,0x18(%esp)
    420d:	83 ec 0c             	sub    $0xc,%esp
    4210:	8d 83 f0 fe ff ff    	lea    -0x110(%ebx),%eax
    4216:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    421a:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    421e:	50                   	push   %eax
    421f:	e8 4c 00 00 00       	call   4270 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E>
    4224:	83 c4 10             	add    $0x10,%esp
    4227:	84 c0                	test   %al,%al
    4229:	74 04                	je     422f <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0xff>
    422b:	b1 01                	mov    $0x1,%cl
    422d:	eb 33                	jmp    4262 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x132>
    422f:	83 ec 04             	sub    $0x4,%esp
    4232:	8d 83 e9 eb ff ff    	lea    -0x1417(%ebx),%eax
    4238:	6a 02                	push   $0x2
    423a:	50                   	push   %eax
    423b:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    423f:	50                   	push   %eax
    4240:	e8 fb 10 00 00       	call   5340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    4245:	83 c4 10             	add    $0x10,%esp
    4248:	84 c0                	test   %al,%al
    424a:	b1 01                	mov    $0x1,%cl
    424c:	75 14                	jne    4262 <_ZN67_$LT$kernel_lib..io..error..IoError$u20$as$u20$core..fmt..Debug$GT$3fmt17h49ee300309aa25d9E+0x132>
    424e:	83 ec 04             	sub    $0x4,%esp
    4251:	8d 83 91 eb ff ff    	lea    -0x146f(%ebx),%eax
    4257:	6a 01                	push   $0x1
    4259:	50                   	push   %eax
    425a:	57                   	push   %edi
    425b:	ff d6                	call   *%esi
    425d:	83 c4 10             	add    $0x10,%esp
    4260:	89 c1                	mov    %eax,%ecx
    4262:	89 c8                	mov    %ecx,%eax
    4264:	83 c4 1c             	add    $0x1c,%esp
    4267:	5e                   	pop    %esi
    4268:	5f                   	pop    %edi
    4269:	5b                   	pop    %ebx
    426a:	5d                   	pop    %ebp
    426b:	c3                   	ret
    426c:	66 90                	xchg   %ax,%ax
    426e:	66 90                	xchg   %ax,%ax

00004270 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E>:
    4270:	53                   	push   %ebx
    4271:	56                   	push   %esi
    4272:	50                   	push   %eax
    4273:	e8 00 00 00 00       	call   4278 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x8>
    4278:	5b                   	pop    %ebx
    4279:	81 c3 7c 3d 00 00    	add    $0x3d7c,%ebx
    427f:	8b 31                	mov    (%ecx),%esi
    4281:	8d 83 78 ed ff ff    	lea    -0x1288(%ebx),%eax
    4287:	b9 0c 00 00 00       	mov    $0xc,%ecx
    428c:	4e                   	dec    %esi
    428d:	8b b4 b3 7c e3 ff ff 	mov    -0x1c84(%ebx,%esi,4),%esi
    4294:	01 de                	add    %ebx,%esi
    4296:	ff e6                	jmp    *%esi
    4298:	8d 83 84 ed ff ff    	lea    -0x127c(%ebx),%eax
    429e:	b9 0b 00 00 00       	mov    $0xb,%ecx
    42a3:	eb 69                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42a5:	8d 83 f5 e9 ff ff    	lea    -0x160b(%ebx),%eax
    42ab:	b9 08 00 00 00       	mov    $0x8,%ecx
    42b0:	eb 5c                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42b2:	8d 83 e9 ed ff ff    	lea    -0x1217(%ebx),%eax
    42b8:	b9 0f 00 00 00       	mov    $0xf,%ecx
    42bd:	eb 4f                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42bf:	8d 83 8f ed ff ff    	lea    -0x1271(%ebx),%eax
    42c5:	b9 0f 00 00 00       	mov    $0xf,%ecx
    42ca:	eb 42                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42cc:	8d 83 9e ed ff ff    	lea    -0x1262(%ebx),%eax
    42d2:	eb 3a                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42d4:	8d 83 ba ed ff ff    	lea    -0x1246(%ebx),%eax
    42da:	b9 10 00 00 00       	mov    $0x10,%ecx
    42df:	eb 2d                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42e1:	8d 83 f8 ed ff ff    	lea    -0x1208(%ebx),%eax
    42e7:	b9 06 00 00 00       	mov    $0x6,%ecx
    42ec:	eb 20                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42ee:	8d 83 aa ed ff ff    	lea    -0x1256(%ebx),%eax
    42f4:	b9 10 00 00 00       	mov    $0x10,%ecx
    42f9:	eb 13                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    42fb:	8d 83 ca ed ff ff    	lea    -0x1236(%ebx),%eax
    4301:	eb 0b                	jmp    430e <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hdb15e9bf68e318a9E+0x9e>
    4303:	8d 83 d6 ed ff ff    	lea    -0x122a(%ebx),%eax
    4309:	b9 13 00 00 00       	mov    $0x13,%ecx
    430e:	8b 74 24 10          	mov    0x10(%esp),%esi
    4312:	83 ec 04             	sub    $0x4,%esp
    4315:	51                   	push   %ecx
    4316:	50                   	push   %eax
    4317:	52                   	push   %edx
    4318:	ff 56 0c             	call   *0xc(%esi)
    431b:	83 c4 14             	add    $0x14,%esp
    431e:	5e                   	pop    %esi
    431f:	5b                   	pop    %ebx
    4320:	c3                   	ret
    4321:	0f 0b                	ud2
    4323:	66 90                	xchg   %ax,%ax
    4325:	66 90                	xchg   %ax,%ax
    4327:	66 90                	xchg   %ax,%ax
    4329:	66 90                	xchg   %ax,%ax
    432b:	66 90                	xchg   %ax,%ax
    432d:	66 90                	xchg   %ax,%ax
    432f:	90                   	nop

00004330 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E>:
    4330:	55                   	push   %ebp
    4331:	53                   	push   %ebx
    4332:	57                   	push   %edi
    4333:	56                   	push   %esi
    4334:	83 ec 2c             	sub    $0x2c,%esp
    4337:	e8 00 00 00 00       	call   433c <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xc>
    433c:	5b                   	pop    %ebx
    433d:	81 c3 b8 3c 00 00    	add    $0x3cb8,%ebx
    4343:	8b 74 24 44          	mov    0x44(%esp),%esi
    4347:	8b 3e                	mov    (%esi),%edi
    4349:	8b 6e 04             	mov    0x4(%esi),%ebp
    434c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    434f:	83 ec 04             	sub    $0x4,%esp
    4352:	8d 83 22 eb ff ff    	lea    -0x14de(%ebx),%eax
    4358:	6a 0e                	push   $0xe
    435a:	50                   	push   %eax
    435b:	57                   	push   %edi
    435c:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    4360:	ff d1                	call   *%ecx
    4362:	83 c4 10             	add    $0x10,%esp
    4365:	b1 01                	mov    $0x1,%cl
    4367:	84 c0                	test   %al,%al
    4369:	0f 85 e3 00 00 00    	jne    4452 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    436f:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    4373:	75 40                	jne    43b5 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x85>
    4375:	83 ec 04             	sub    $0x4,%esp
    4378:	8d 83 ee eb ff ff    	lea    -0x1412(%ebx),%eax
    437e:	6a 01                	push   $0x1
    4380:	50                   	push   %eax
    4381:	57                   	push   %edi
    4382:	ff 54 24 1c          	call   *0x1c(%esp)
    4386:	83 c4 10             	add    $0x10,%esp
    4389:	84 c0                	test   %al,%al
    438b:	0f 85 8c 00 00 00    	jne    441d <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    4391:	83 ec 0c             	sub    $0xc,%esp
    4394:	8d 93 f5 ea ff ff    	lea    -0x150b(%ebx),%edx
    439a:	89 f1                	mov    %esi,%ecx
    439c:	6a 02                	push   $0x2
    439e:	e8 cd 04 00 00       	call   4870 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    43a3:	83 c4 10             	add    $0x10,%esp
    43a6:	84 c0                	test   %al,%al
    43a8:	b1 01                	mov    $0x1,%cl
    43aa:	0f 84 8c 00 00 00    	je     443c <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x10c>
    43b0:	e9 9d 00 00 00       	jmp    4452 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    43b5:	83 ec 04             	sub    $0x4,%esp
    43b8:	8d 83 ef eb ff ff    	lea    -0x1411(%ebx),%eax
    43be:	6a 02                	push   $0x2
    43c0:	50                   	push   %eax
    43c1:	57                   	push   %edi
    43c2:	ff 54 24 1c          	call   *0x1c(%esp)
    43c6:	83 c4 10             	add    $0x10,%esp
    43c9:	84 c0                	test   %al,%al
    43cb:	75 50                	jne    441d <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    43cd:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    43d2:	89 7c 24 10          	mov    %edi,0x10(%esp)
    43d6:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    43da:	8d 44 24 0b          	lea    0xb(%esp),%eax
    43de:	89 44 24 18          	mov    %eax,0x18(%esp)
    43e2:	8b 46 08             	mov    0x8(%esi),%eax
    43e5:	8b 4e 0c             	mov    0xc(%esi),%ecx
    43e8:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    43ec:	89 44 24 24          	mov    %eax,0x24(%esp)
    43f0:	8d 74 24 10          	lea    0x10(%esp),%esi
    43f4:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    43f8:	8d 83 f0 fe ff ff    	lea    -0x110(%ebx),%eax
    43fe:	89 44 24 20          	mov    %eax,0x20(%esp)
    4402:	83 ec 0c             	sub    $0xc,%esp
    4405:	8d 93 f5 ea ff ff    	lea    -0x150b(%ebx),%edx
    440b:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    440f:	6a 02                	push   $0x2
    4411:	e8 5a 04 00 00       	call   4870 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    4416:	83 c4 10             	add    $0x10,%esp
    4419:	84 c0                	test   %al,%al
    441b:	74 04                	je     4421 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xf1>
    441d:	b1 01                	mov    $0x1,%cl
    441f:	eb 31                	jmp    4452 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    4421:	83 ec 04             	sub    $0x4,%esp
    4424:	8d 83 e9 eb ff ff    	lea    -0x1417(%ebx),%eax
    442a:	6a 02                	push   $0x2
    442c:	50                   	push   %eax
    442d:	56                   	push   %esi
    442e:	e8 0d 0f 00 00       	call   5340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    4433:	83 c4 10             	add    $0x10,%esp
    4436:	84 c0                	test   %al,%al
    4438:	b1 01                	mov    $0x1,%cl
    443a:	75 16                	jne    4452 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    443c:	83 ec 04             	sub    $0x4,%esp
    443f:	8d 83 91 eb ff ff    	lea    -0x146f(%ebx),%eax
    4445:	6a 01                	push   $0x1
    4447:	50                   	push   %eax
    4448:	57                   	push   %edi
    4449:	ff 54 24 1c          	call   *0x1c(%esp)
    444d:	83 c4 10             	add    $0x10,%esp
    4450:	89 c1                	mov    %eax,%ecx
    4452:	89 c8                	mov    %ecx,%eax
    4454:	83 c4 2c             	add    $0x2c,%esp
    4457:	5e                   	pop    %esi
    4458:	5f                   	pop    %edi
    4459:	5b                   	pop    %ebx
    445a:	5d                   	pop    %ebp
    445b:	c3                   	ret
    445c:	66 90                	xchg   %ax,%ax
    445e:	66 90                	xchg   %ax,%ax

00004460 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E>:
    4460:	55                   	push   %ebp
    4461:	53                   	push   %ebx
    4462:	57                   	push   %edi
    4463:	56                   	push   %esi
    4464:	83 ec 1c             	sub    $0x1c,%esp
    4467:	e8 00 00 00 00       	call   446c <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xc>
    446c:	5b                   	pop    %ebx
    446d:	81 c3 88 3b 00 00    	add    $0x3b88,%ebx
    4473:	8b 44 24 30          	mov    0x30(%esp),%eax
    4477:	8b 08                	mov    (%eax),%ecx
    4479:	b8 0a 00 00 00       	mov    $0xa,%eax
    447e:	89 ca                	mov    %ecx,%edx
    4480:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4484:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
    448a:	72 64                	jb     44f0 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0x90>
    448c:	bd 0a 00 00 00       	mov    $0xa,%ebp
    4491:	8b 74 24 0c          	mov    0xc(%esp),%esi
    4495:	90                   	nop
    4496:	90                   	nop
    4497:	90                   	nop
    4498:	90                   	nop
    4499:	90                   	nop
    449a:	90                   	nop
    449b:	90                   	nop
    449c:	90                   	nop
    449d:	90                   	nop
    449e:	90                   	nop
    449f:	90                   	nop
    44a0:	89 f0                	mov    %esi,%eax
    44a2:	b9 59 17 b7 d1       	mov    $0xd1b71759,%ecx
    44a7:	f7 e1                	mul    %ecx
    44a9:	c1 ea 0d             	shr    $0xd,%edx
    44ac:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    44b2:	89 f1                	mov    %esi,%ecx
    44b4:	29 c1                	sub    %eax,%ecx
    44b6:	69 c1 7b 14 00 00    	imul   $0x147b,%ecx,%eax
    44bc:	c1 e8 13             	shr    $0x13,%eax
    44bf:	6b f8 64             	imul   $0x64,%eax,%edi
    44c2:	29 f9                	sub    %edi,%ecx
    44c4:	0f b7 84 43 f3 eb ff 	movzwl -0x140d(%ebx,%eax,2),%eax
    44cb:	ff 
    44cc:	66 89 44 2c 0e       	mov    %ax,0xe(%esp,%ebp,1)
    44d1:	0f b7 c1             	movzwl %cx,%eax
    44d4:	0f b7 84 43 f3 eb ff 	movzwl -0x140d(%ebx,%eax,2),%eax
    44db:	ff 
    44dc:	66 89 44 2c 10       	mov    %ax,0x10(%esp,%ebp,1)
    44e1:	8d 45 fc             	lea    -0x4(%ebp),%eax
    44e4:	89 c5                	mov    %eax,%ebp
    44e6:	81 fe 7f 96 98 00    	cmp    $0x98967f,%esi
    44ec:	89 d6                	mov    %edx,%esi
    44ee:	77 b0                	ja     44a0 <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0x40>
    44f0:	83 fa 09             	cmp    $0x9,%edx
    44f3:	76 29                	jbe    451e <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xbe>
    44f5:	0f b7 ca             	movzwl %dx,%ecx
    44f8:	c1 e9 02             	shr    $0x2,%ecx
    44fb:	69 c9 7b 14 00 00    	imul   $0x147b,%ecx,%ecx
    4501:	c1 e9 11             	shr    $0x11,%ecx
    4504:	6b f1 64             	imul   $0x64,%ecx,%esi
    4507:	29 f2                	sub    %esi,%edx
    4509:	0f b7 d2             	movzwl %dx,%edx
    450c:	0f b7 94 53 f3 eb ff 	movzwl -0x140d(%ebx,%edx,2),%edx
    4513:	ff 
    4514:	66 89 54 04 10       	mov    %dx,0x10(%esp,%eax,1)
    4519:	83 c0 fe             	add    $0xfffffffe,%eax
    451c:	89 ca                	mov    %ecx,%edx
    451e:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    4522:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    4527:	74 04                	je     452d <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xcd>
    4529:	85 d2                	test   %edx,%edx
    452b:	74 10                	je     453d <_ZN4core3fmt3num3imp54_$LT$impl$u20$core..fmt..Display$u20$for$u20$usize$GT$3fmt17h10e52ed1ac19dcc3E+0xdd>
    452d:	83 e2 0f             	and    $0xf,%edx
    4530:	0f b6 94 53 f4 eb ff 	movzbl -0x140c(%ebx,%edx,2),%edx
    4537:	ff 
    4538:	88 54 04 11          	mov    %dl,0x11(%esp,%eax,1)
    453c:	48                   	dec    %eax
    453d:	be 0a 00 00 00       	mov    $0xa,%esi
    4542:	29 c6                	sub    %eax,%esi
    4544:	01 e0                	add    %esp,%eax
    4546:	83 c0 12             	add    $0x12,%eax
    4549:	ba 01 00 00 00       	mov    $0x1,%edx
    454e:	56                   	push   %esi
    454f:	50                   	push   %eax
    4550:	6a 00                	push   $0x0
    4552:	6a 01                	push   $0x1
    4554:	e8 17 00 00 00       	call   4570 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    4559:	83 c4 2c             	add    $0x2c,%esp
    455c:	5e                   	pop    %esi
    455d:	5f                   	pop    %edi
    455e:	5b                   	pop    %ebx
    455f:	5d                   	pop    %ebp
    4560:	c3                   	ret
    4561:	66 90                	xchg   %ax,%ax
    4563:	66 90                	xchg   %ax,%ax
    4565:	66 90                	xchg   %ax,%ax
    4567:	66 90                	xchg   %ax,%ax
    4569:	66 90                	xchg   %ax,%ax
    456b:	66 90                	xchg   %ax,%ax
    456d:	66 90                	xchg   %ax,%ax
    456f:	90                   	nop

00004570 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>:
    4570:	55                   	push   %ebp
    4571:	53                   	push   %ebx
    4572:	57                   	push   %edi
    4573:	56                   	push   %esi
    4574:	83 ec 1c             	sub    $0x1c,%esp
    4577:	e8 00 00 00 00       	call   457c <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xc>
    457c:	5b                   	pop    %ebx
    457d:	81 c3 78 3a 00 00    	add    $0x3a78,%ebx
    4583:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    4587:	85 d2                	test   %edx,%edx
    4589:	74 65                	je     45f0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x80>
    458b:	8b 79 08             	mov    0x8(%ecx),%edi
    458e:	89 fa                	mov    %edi,%edx
    4590:	c7 44 24 04 00 00 11 	movl   $0x110000,0x4(%esp)
    4597:	00 
    4598:	81 e2 00 00 20 00    	and    $0x200000,%edx
    459e:	74 08                	je     45a8 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x38>
    45a0:	c7 44 24 04 2b 00 00 	movl   $0x2b,0x4(%esp)
    45a7:	00 
    45a8:	c1 ea 15             	shr    $0x15,%edx
    45ab:	01 c2                	add    %eax,%edx
    45ad:	8b 74 24 34          	mov    0x34(%esp),%esi
    45b1:	f7 c7 00 00 80 00    	test   $0x800000,%edi
    45b7:	74 51                	je     460a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x9a>
    45b9:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    45bd:	85 f6                	test   %esi,%esi
    45bf:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    45c3:	0f 84 91 00 00 00    	je     465a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xea>
    45c9:	31 c0                	xor    %eax,%eax
    45cb:	80 7d 00 c0          	cmpb   $0xc0,0x0(%ebp)
    45cf:	0f 9d c0             	setge  %al
    45d2:	83 fe 01             	cmp    $0x1,%esi
    45d5:	0f 84 81 00 00 00    	je     465c <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xec>
    45db:	89 54 24 0c          	mov    %edx,0xc(%esp)
    45df:	31 d2                	xor    %edx,%edx
    45e1:	80 7d 01 c0          	cmpb   $0xc0,0x1(%ebp)
    45e5:	0f 9d c2             	setge  %dl
    45e8:	01 d0                	add    %edx,%eax
    45ea:	8b 54 24 0c          	mov    0xc(%esp),%edx
    45ee:	eb 6c                	jmp    465c <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xec>
    45f0:	8d 50 01             	lea    0x1(%eax),%edx
    45f3:	8b 79 08             	mov    0x8(%ecx),%edi
    45f6:	c7 44 24 04 2d 00 00 	movl   $0x2d,0x4(%esp)
    45fd:	00 
    45fe:	8b 74 24 34          	mov    0x34(%esp),%esi
    4602:	f7 c7 00 00 80 00    	test   $0x800000,%edi
    4608:	75 af                	jne    45b9 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x49>
    460a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    4611:	00 
    4612:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    4616:	39 ea                	cmp    %ebp,%edx
    4618:	72 50                	jb     466a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xfa>
    461a:	89 c5                	mov    %eax,%ebp
    461c:	8b 39                	mov    (%ecx),%edi
    461e:	8b 71 04             	mov    0x4(%ecx),%esi
    4621:	83 ec 04             	sub    $0x4,%esp
    4624:	89 f9                	mov    %edi,%ecx
    4626:	89 f2                	mov    %esi,%edx
    4628:	ff 74 24 38          	push   0x38(%esp)
    462c:	ff 74 24 18          	push   0x18(%esp)
    4630:	ff 74 24 10          	push   0x10(%esp)
    4634:	e8 d7 01 00 00       	call   4810 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    4639:	83 c4 10             	add    $0x10,%esp
    463c:	b1 01                	mov    $0x1,%cl
    463e:	84 c0                	test   %al,%al
    4640:	0f 85 ba 01 00 00    	jne    4800 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    4646:	83 ec 04             	sub    $0x4,%esp
    4649:	55                   	push   %ebp
    464a:	ff 74 24 40          	push   0x40(%esp)
    464e:	57                   	push   %edi
    464f:	ff 56 0c             	call   *0xc(%esi)
    4652:	83 c4 2c             	add    $0x2c,%esp
    4655:	e9 ab 01 00 00       	jmp    4805 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x295>
    465a:	31 c0                	xor    %eax,%eax
    465c:	01 c2                	add    %eax,%edx
    465e:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    4662:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    4666:	39 ea                	cmp    %ebp,%edx
    4668:	73 b0                	jae    461a <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0xaa>
    466a:	f7 c7 00 00 00 01    	test   $0x1000000,%edi
    4670:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4674:	75 20                	jne    4696 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x126>
    4676:	89 ee                	mov    %ebp,%esi
    4678:	29 d6                	sub    %edx,%esi
    467a:	89 f8                	mov    %edi,%eax
    467c:	c1 e8 1d             	shr    $0x1d,%eax
    467f:	83 e0 03             	and    $0x3,%eax
    4682:	31 d2                	xor    %edx,%edx
    4684:	8b 84 83 84 e4 ff ff 	mov    -0x1b7c(%ebx,%eax,4),%eax
    468b:	01 d8                	add    %ebx,%eax
    468d:	ff e0                	jmp    *%eax
    468f:	89 f2                	mov    %esi,%edx
    4691:	e9 a9 00 00 00       	jmp    473f <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x1cf>
    4696:	8b 41 0c             	mov    0xc(%ecx),%eax
    4699:	89 44 24 14          	mov    %eax,0x14(%esp)
    469d:	8b 41 08             	mov    0x8(%ecx),%eax
    46a0:	89 04 24             	mov    %eax,(%esp)
    46a3:	25 00 00 e0 9f       	and    $0x9fe00000,%eax
    46a8:	0d 30 00 00 20       	or     $0x20000030,%eax
    46ad:	89 41 08             	mov    %eax,0x8(%ecx)
    46b0:	8b 39                	mov    (%ecx),%edi
    46b2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    46b6:	8b 71 04             	mov    0x4(%ecx),%esi
    46b9:	83 ec 04             	sub    $0x4,%esp
    46bc:	89 f9                	mov    %edi,%ecx
    46be:	89 f2                	mov    %esi,%edx
    46c0:	ff 74 24 38          	push   0x38(%esp)
    46c4:	ff 74 24 18          	push   0x18(%esp)
    46c8:	ff 74 24 10          	push   0x10(%esp)
    46cc:	e8 3f 01 00 00       	call   4810 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    46d1:	83 c4 10             	add    $0x10,%esp
    46d4:	b1 01                	mov    $0x1,%cl
    46d6:	84 c0                	test   %al,%al
    46d8:	0f 85 22 01 00 00    	jne    4800 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    46de:	2b 6c 24 0c          	sub    0xc(%esp),%ebp
    46e2:	45                   	inc    %ebp
    46e3:	90                   	nop
    46e4:	90                   	nop
    46e5:	90                   	nop
    46e6:	90                   	nop
    46e7:	90                   	nop
    46e8:	90                   	nop
    46e9:	90                   	nop
    46ea:	90                   	nop
    46eb:	90                   	nop
    46ec:	90                   	nop
    46ed:	90                   	nop
    46ee:	90                   	nop
    46ef:	90                   	nop
    46f0:	66 4d                	dec    %bp
    46f2:	74 12                	je     4706 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x196>
    46f4:	83 ec 08             	sub    $0x8,%esp
    46f7:	6a 30                	push   $0x30
    46f9:	57                   	push   %edi
    46fa:	ff 56 10             	call   *0x10(%esi)
    46fd:	83 c4 10             	add    $0x10,%esp
    4700:	84 c0                	test   %al,%al
    4702:	74 ec                	je     46f0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x180>
    4704:	eb 73                	jmp    4779 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x209>
    4706:	83 ec 04             	sub    $0x4,%esp
    4709:	ff 74 24 40          	push   0x40(%esp)
    470d:	ff 74 24 40          	push   0x40(%esp)
    4711:	57                   	push   %edi
    4712:	ff 56 0c             	call   *0xc(%esi)
    4715:	83 c4 10             	add    $0x10,%esp
    4718:	84 c0                	test   %al,%al
    471a:	b1 01                	mov    $0x1,%cl
    471c:	0f 85 de 00 00 00    	jne    4800 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    4722:	8b 44 24 08          	mov    0x8(%esp),%eax
    4726:	8b 0c 24             	mov    (%esp),%ecx
    4729:	89 48 08             	mov    %ecx,0x8(%eax)
    472c:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    4730:	89 48 0c             	mov    %ecx,0xc(%eax)
    4733:	31 c9                	xor    %ecx,%ecx
    4735:	e9 c6 00 00 00       	jmp    4800 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    473a:	0f b7 d6             	movzwl %si,%edx
    473d:	d1 ea                	shr    $1,%edx
    473f:	89 34 24             	mov    %esi,(%esp)
    4742:	81 e7 ff ff 1f 00    	and    $0x1fffff,%edi
    4748:	89 7c 24 14          	mov    %edi,0x14(%esp)
    474c:	8b 01                	mov    (%ecx),%eax
    474e:	89 44 24 08          	mov    %eax,0x8(%esp)
    4752:	8b 79 04             	mov    0x4(%ecx),%edi
    4755:	89 54 24 18          	mov    %edx,0x18(%esp)
    4759:	8d 72 01             	lea    0x1(%edx),%esi
    475c:	90                   	nop
    475d:	90                   	nop
    475e:	90                   	nop
    475f:	90                   	nop
    4760:	66 4e                	dec    %si
    4762:	74 1c                	je     4780 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x210>
    4764:	83 ec 08             	sub    $0x8,%esp
    4767:	ff 74 24 1c          	push   0x1c(%esp)
    476b:	ff 74 24 14          	push   0x14(%esp)
    476f:	ff 57 10             	call   *0x10(%edi)
    4772:	83 c4 10             	add    $0x10,%esp
    4775:	84 c0                	test   %al,%al
    4777:	74 e7                	je     4760 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x1f0>
    4779:	b1 01                	mov    $0x1,%cl
    477b:	e9 80 00 00 00       	jmp    4800 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    4780:	83 ec 04             	sub    $0x4,%esp
    4783:	8b 74 24 0c          	mov    0xc(%esp),%esi
    4787:	89 f1                	mov    %esi,%ecx
    4789:	89 fa                	mov    %edi,%edx
    478b:	ff 74 24 38          	push   0x38(%esp)
    478f:	ff 74 24 18          	push   0x18(%esp)
    4793:	ff 74 24 10          	push   0x10(%esp)
    4797:	e8 74 00 00 00       	call   4810 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    479c:	83 c4 10             	add    $0x10,%esp
    479f:	b1 01                	mov    $0x1,%cl
    47a1:	84 c0                	test   %al,%al
    47a3:	75 5b                	jne    4800 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    47a5:	83 ec 04             	sub    $0x4,%esp
    47a8:	ff 74 24 40          	push   0x40(%esp)
    47ac:	ff 74 24 40          	push   0x40(%esp)
    47b0:	56                   	push   %esi
    47b1:	ff 57 0c             	call   *0xc(%edi)
    47b4:	b1 01                	mov    $0x1,%cl
    47b6:	83 c4 10             	add    $0x10,%esp
    47b9:	84 c0                	test   %al,%al
    47bb:	75 43                	jne    4800 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x290>
    47bd:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    47c1:	29 0c 24             	sub    %ecx,(%esp)
    47c4:	03 4c 24 0c          	add    0xc(%esp),%ecx
    47c8:	29 e9                	sub    %ebp,%ecx
    47ca:	66 bd ff ff          	mov    $0xffff,%bp
    47ce:	90                   	nop
    47cf:	90                   	nop
    47d0:	8d 04 29             	lea    (%ecx,%ebp,1),%eax
    47d3:	66 83 f8 ff          	cmp    $0xffff,%ax
    47d7:	74 1d                	je     47f6 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x286>
    47d9:	83 ec 08             	sub    $0x8,%esp
    47dc:	ff 74 24 1c          	push   0x1c(%esp)
    47e0:	56                   	push   %esi
    47e1:	89 ce                	mov    %ecx,%esi
    47e3:	ff 57 10             	call   *0x10(%edi)
    47e6:	89 f1                	mov    %esi,%ecx
    47e8:	8b 74 24 18          	mov    0x18(%esp),%esi
    47ec:	83 c4 10             	add    $0x10,%esp
    47ef:	45                   	inc    %ebp
    47f0:	84 c0                	test   %al,%al
    47f2:	74 dc                	je     47d0 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x260>
    47f4:	eb 03                	jmp    47f9 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE+0x289>
    47f6:	8b 2c 24             	mov    (%esp),%ebp
    47f9:	66 3b 2c 24          	cmp    (%esp),%bp
    47fd:	0f 92 c1             	setb   %cl
    4800:	89 c8                	mov    %ecx,%eax
    4802:	83 c4 1c             	add    $0x1c,%esp
    4805:	5e                   	pop    %esi
    4806:	5f                   	pop    %edi
    4807:	5b                   	pop    %ebx
    4808:	5d                   	pop    %ebp
    4809:	c3                   	ret
    480a:	66 90                	xchg   %ax,%ax
    480c:	66 90                	xchg   %ax,%ax
    480e:	66 90                	xchg   %ax,%ax

00004810 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>:
    4810:	53                   	push   %ebx
    4811:	57                   	push   %edi
    4812:	56                   	push   %esi
    4813:	89 d6                	mov    %edx,%esi
    4815:	89 cf                	mov    %ecx,%edi
    4817:	e8 00 00 00 00       	call   481c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0xc>
    481c:	5b                   	pop    %ebx
    481d:	81 c3 d8 37 00 00    	add    $0x37d8,%ebx
    4823:	8b 44 24 10          	mov    0x10(%esp),%eax
    4827:	3d 00 00 11 00       	cmp    $0x110000,%eax
    482c:	74 13                	je     4841 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x31>
    482e:	83 ec 08             	sub    $0x8,%esp
    4831:	50                   	push   %eax
    4832:	57                   	push   %edi
    4833:	ff 56 10             	call   *0x10(%esi)
    4836:	83 c4 10             	add    $0x10,%esp
    4839:	89 c1                	mov    %eax,%ecx
    483b:	b0 01                	mov    $0x1,%al
    483d:	84 c9                	test   %cl,%cl
    483f:	75 1d                	jne    485e <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4e>
    4841:	8b 44 24 14          	mov    0x14(%esp),%eax
    4845:	85 c0                	test   %eax,%eax
    4847:	74 13                	je     485c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4c>
    4849:	83 ec 04             	sub    $0x4,%esp
    484c:	ff 74 24 1c          	push   0x1c(%esp)
    4850:	50                   	push   %eax
    4851:	57                   	push   %edi
    4852:	ff 56 0c             	call   *0xc(%esi)
    4855:	83 c4 10             	add    $0x10,%esp
    4858:	5e                   	pop    %esi
    4859:	5f                   	pop    %edi
    485a:	5b                   	pop    %ebx
    485b:	c3                   	ret
    485c:	31 c0                	xor    %eax,%eax
    485e:	5e                   	pop    %esi
    485f:	5f                   	pop    %edi
    4860:	5b                   	pop    %ebx
    4861:	c3                   	ret
    4862:	66 90                	xchg   %ax,%ax
    4864:	66 90                	xchg   %ax,%ax
    4866:	66 90                	xchg   %ax,%ax
    4868:	66 90                	xchg   %ax,%ax
    486a:	66 90                	xchg   %ax,%ax
    486c:	66 90                	xchg   %ax,%ax
    486e:	66 90                	xchg   %ax,%ax

00004870 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>:
    4870:	55                   	push   %ebp
    4871:	53                   	push   %ebx
    4872:	57                   	push   %edi
    4873:	56                   	push   %esi
    4874:	83 ec 2c             	sub    $0x2c,%esp
    4877:	89 cd                	mov    %ecx,%ebp
    4879:	e8 00 00 00 00       	call   487e <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xe>
    487e:	58                   	pop    %eax
    487f:	81 c0 76 37 00 00    	add    $0x3776,%eax
    4885:	89 44 24 24          	mov    %eax,0x24(%esp)
    4889:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    488d:	8b 7d 08             	mov    0x8(%ebp),%edi
    4890:	f7 c7 00 00 00 18    	test   $0x18000000,%edi
    4896:	74 3c                	je     48d4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x64>
    4898:	f7 c7 00 00 00 10    	test   $0x10000000,%edi
    489e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    48a2:	75 40                	jne    48e4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x74>
    48a4:	83 f9 10             	cmp    $0x10,%ecx
    48a7:	0f 83 9f 00 00 00    	jae    494c <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xdc>
    48ad:	85 c9                	test   %ecx,%ecx
    48af:	0f 84 1a 01 00 00    	je     49cf <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x15f>
    48b5:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    48b9:	89 7c 24 14          	mov    %edi,0x14(%esp)
    48bd:	89 ce                	mov    %ecx,%esi
    48bf:	83 e6 03             	and    $0x3,%esi
    48c2:	83 f9 04             	cmp    $0x4,%ecx
    48c5:	0f 83 19 01 00 00    	jae    49e4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x174>
    48cb:	31 c9                	xor    %ecx,%ecx
    48cd:	31 db                	xor    %ebx,%ebx
    48cf:	e9 65 01 00 00       	jmp    4a39 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1c9>
    48d4:	8b 45 04             	mov    0x4(%ebp),%eax
    48d7:	83 ec 04             	sub    $0x4,%esp
    48da:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    48de:	51                   	push   %ecx
    48df:	e9 ef 04 00 00       	jmp    4dd3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x563>
    48e4:	0f b7 45 0e          	movzwl 0xe(%ebp),%eax
    48e8:	89 44 24 18          	mov    %eax,0x18(%esp)
    48ec:	85 c0                	test   %eax,%eax
    48ee:	0f 84 a4 00 00 00    	je     4998 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x128>
    48f4:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    48f8:	89 7c 24 14          	mov    %edi,0x14(%esp)
    48fc:	01 d1                	add    %edx,%ecx
    48fe:	89 cd                	mov    %ecx,%ebp
    4900:	89 d1                	mov    %edx,%ecx
    4902:	31 f6                	xor    %esi,%esi
    4904:	31 c0                	xor    %eax,%eax
    4906:	eb 1e                	jmp    4926 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xb6>
    4908:	90                   	nop
    4909:	90                   	nop
    490a:	90                   	nop
    490b:	90                   	nop
    490c:	90                   	nop
    490d:	90                   	nop
    490e:	90                   	nop
    490f:	90                   	nop
    4910:	8d 79 01             	lea    0x1(%ecx),%edi
    4913:	89 fe                	mov    %edi,%esi
    4915:	29 ce                	sub    %ecx,%esi
    4917:	01 d6                	add    %edx,%esi
    4919:	40                   	inc    %eax
    491a:	89 f9                	mov    %edi,%ecx
    491c:	39 44 24 18          	cmp    %eax,0x18(%esp)
    4920:	0f 84 82 00 00 00    	je     49a8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x138>
    4926:	89 f2                	mov    %esi,%edx
    4928:	39 e9                	cmp    %ebp,%ecx
    492a:	74 72                	je     499e <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x12e>
    492c:	0f b6 19             	movzbl (%ecx),%ebx
    492f:	84 db                	test   %bl,%bl
    4931:	79 dd                	jns    4910 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa0>
    4933:	80 fb e0             	cmp    $0xe0,%bl
    4936:	72 0a                	jb     4942 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd2>
    4938:	80 fb f0             	cmp    $0xf0,%bl
    493b:	72 0a                	jb     4947 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd7>
    493d:	8d 79 04             	lea    0x4(%ecx),%edi
    4940:	eb d1                	jmp    4913 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    4942:	8d 79 02             	lea    0x2(%ecx),%edi
    4945:	eb cc                	jmp    4913 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    4947:	8d 79 03             	lea    0x3(%ecx),%edi
    494a:	eb c7                	jmp    4913 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xa3>
    494c:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    4950:	89 7c 24 14          	mov    %edi,0x14(%esp)
    4954:	8d 6a 03             	lea    0x3(%edx),%ebp
    4957:	83 e5 fc             	and    $0xfffffffc,%ebp
    495a:	89 e8                	mov    %ebp,%eax
    495c:	29 d0                	sub    %edx,%eax
    495e:	89 cb                	mov    %ecx,%ebx
    4960:	29 c3                	sub    %eax,%ebx
    4962:	89 d8                	mov    %ebx,%eax
    4964:	83 e0 03             	and    $0x3,%eax
    4967:	89 44 24 18          	mov    %eax,0x18(%esp)
    496b:	89 ef                	mov    %ebp,%edi
    496d:	b8 00 00 00 00       	mov    $0x0,%eax
    4972:	29 d7                	sub    %edx,%edi
    4974:	0f 84 76 01 00 00    	je     4af0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x280>
    497a:	89 5c 24 20          	mov    %ebx,0x20(%esp)
    497e:	8b 74 24 0c          	mov    0xc(%esp),%esi
    4982:	89 f0                	mov    %esi,%eax
    4984:	29 e8                	sub    %ebp,%eax
    4986:	83 f8 fc             	cmp    $0xfffffffc,%eax
    4989:	0f 86 ee 00 00 00    	jbe    4a7d <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x20d>
    498f:	31 c0                	xor    %eax,%eax
    4991:	31 d2                	xor    %edx,%edx
    4993:	e9 2c 01 00 00       	jmp    4ac4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x254>
    4998:	31 f6                	xor    %esi,%esi
    499a:	31 c9                	xor    %ecx,%ecx
    499c:	eb 14                	jmp    49b2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x142>
    499e:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    49a2:	29 c1                	sub    %eax,%ecx
    49a4:	89 d6                	mov    %edx,%esi
    49a6:	eb 02                	jmp    49aa <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x13a>
    49a8:	31 c9                	xor    %ecx,%ecx
    49aa:	8b 7c 24 14          	mov    0x14(%esp),%edi
    49ae:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    49b2:	8b 44 24 18          	mov    0x18(%esp),%eax
    49b6:	29 c8                	sub    %ecx,%eax
    49b8:	89 c1                	mov    %eax,%ecx
    49ba:	8b 54 24 0c          	mov    0xc(%esp),%edx
    49be:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    49c2:	39 c1                	cmp    %eax,%ecx
    49c4:	0f 82 7c 02 00 00    	jb     4c46 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    49ca:	e9 f9 03 00 00       	jmp    4dc8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    49cf:	31 f6                	xor    %esi,%esi
    49d1:	31 c9                	xor    %ecx,%ecx
    49d3:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    49d7:	39 c1                	cmp    %eax,%ecx
    49d9:	0f 82 67 02 00 00    	jb     4c46 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    49df:	e9 e4 03 00 00       	jmp    4dc8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    49e4:	89 cf                	mov    %ecx,%edi
    49e6:	83 e7 0c             	and    $0xc,%edi
    49e9:	31 c9                	xor    %ecx,%ecx
    49eb:	31 db                	xor    %ebx,%ebx
    49ed:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    49f1:	90                   	nop
    49f2:	90                   	nop
    49f3:	90                   	nop
    49f4:	90                   	nop
    49f5:	90                   	nop
    49f6:	90                   	nop
    49f7:	90                   	nop
    49f8:	90                   	nop
    49f9:	90                   	nop
    49fa:	90                   	nop
    49fb:	90                   	nop
    49fc:	90                   	nop
    49fd:	90                   	nop
    49fe:	90                   	nop
    49ff:	90                   	nop
    4a00:	89 c8                	mov    %ecx,%eax
    4a02:	31 c9                	xor    %ecx,%ecx
    4a04:	80 7c 1d 00 c0       	cmpb   $0xc0,0x0(%ebp,%ebx,1)
    4a09:	0f 9d c1             	setge  %cl
    4a0c:	01 c1                	add    %eax,%ecx
    4a0e:	31 d2                	xor    %edx,%edx
    4a10:	80 7c 1d 01 c0       	cmpb   $0xc0,0x1(%ebp,%ebx,1)
    4a15:	0f 9d c2             	setge  %dl
    4a18:	31 c0                	xor    %eax,%eax
    4a1a:	80 7c 1d 02 c0       	cmpb   $0xc0,0x2(%ebp,%ebx,1)
    4a1f:	0f 9d c0             	setge  %al
    4a22:	01 d0                	add    %edx,%eax
    4a24:	01 c8                	add    %ecx,%eax
    4a26:	31 c9                	xor    %ecx,%ecx
    4a28:	80 7c 1d 03 c0       	cmpb   $0xc0,0x3(%ebp,%ebx,1)
    4a2d:	0f 9d c1             	setge  %cl
    4a30:	01 c1                	add    %eax,%ecx
    4a32:	83 c3 04             	add    $0x4,%ebx
    4a35:	39 df                	cmp    %ebx,%edi
    4a37:	75 c7                	jne    4a00 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x190>
    4a39:	85 f6                	test   %esi,%esi
    4a3b:	0f 84 e9 01 00 00    	je     4c2a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3ba>
    4a41:	03 5c 24 0c          	add    0xc(%esp),%ebx
    4a45:	31 d2                	xor    %edx,%edx
    4a47:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4a4b:	90                   	nop
    4a4c:	90                   	nop
    4a4d:	90                   	nop
    4a4e:	90                   	nop
    4a4f:	90                   	nop
    4a50:	31 c0                	xor    %eax,%eax
    4a52:	80 3c 13 c0          	cmpb   $0xc0,(%ebx,%edx,1)
    4a56:	0f 9d c0             	setge  %al
    4a59:	01 c1                	add    %eax,%ecx
    4a5b:	42                   	inc    %edx
    4a5c:	39 d6                	cmp    %edx,%esi
    4a5e:	75 f0                	jne    4a50 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1e0>
    4a60:	8b 7c 24 14          	mov    0x14(%esp),%edi
    4a64:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4a68:	8b 74 24 40          	mov    0x40(%esp),%esi
    4a6c:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    4a70:	39 c1                	cmp    %eax,%ecx
    4a72:	0f 82 ce 01 00 00    	jb     4c46 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    4a78:	e9 4b 03 00 00       	jmp    4dc8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    4a7d:	31 c0                	xor    %eax,%eax
    4a7f:	31 d2                	xor    %edx,%edx
    4a81:	90                   	nop
    4a82:	90                   	nop
    4a83:	90                   	nop
    4a84:	90                   	nop
    4a85:	90                   	nop
    4a86:	90                   	nop
    4a87:	90                   	nop
    4a88:	90                   	nop
    4a89:	90                   	nop
    4a8a:	90                   	nop
    4a8b:	90                   	nop
    4a8c:	90                   	nop
    4a8d:	90                   	nop
    4a8e:	90                   	nop
    4a8f:	90                   	nop
    4a90:	31 db                	xor    %ebx,%ebx
    4a92:	80 3c 16 c0          	cmpb   $0xc0,(%esi,%edx,1)
    4a96:	0f 9d c3             	setge  %bl
    4a99:	01 c3                	add    %eax,%ebx
    4a9b:	31 c0                	xor    %eax,%eax
    4a9d:	80 7c 16 01 c0       	cmpb   $0xc0,0x1(%esi,%edx,1)
    4aa2:	0f 9d c0             	setge  %al
    4aa5:	31 c9                	xor    %ecx,%ecx
    4aa7:	80 7c 16 02 c0       	cmpb   $0xc0,0x2(%esi,%edx,1)
    4aac:	0f 9d c1             	setge  %cl
    4aaf:	01 c1                	add    %eax,%ecx
    4ab1:	01 d9                	add    %ebx,%ecx
    4ab3:	31 c0                	xor    %eax,%eax
    4ab5:	80 7c 16 03 c0       	cmpb   $0xc0,0x3(%esi,%edx,1)
    4aba:	0f 9d c0             	setge  %al
    4abd:	01 c8                	add    %ecx,%eax
    4abf:	83 c2 04             	add    $0x4,%edx
    4ac2:	75 cc                	jne    4a90 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x220>
    4ac4:	39 f5                	cmp    %esi,%ebp
    4ac6:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    4aca:	74 24                	je     4af0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x280>
    4acc:	03 54 24 0c          	add    0xc(%esp),%edx
    4ad0:	31 f6                	xor    %esi,%esi
    4ad2:	90                   	nop
    4ad3:	90                   	nop
    4ad4:	90                   	nop
    4ad5:	90                   	nop
    4ad6:	90                   	nop
    4ad7:	90                   	nop
    4ad8:	90                   	nop
    4ad9:	90                   	nop
    4ada:	90                   	nop
    4adb:	90                   	nop
    4adc:	90                   	nop
    4add:	90                   	nop
    4ade:	90                   	nop
    4adf:	90                   	nop
    4ae0:	31 c9                	xor    %ecx,%ecx
    4ae2:	80 3c 32 c0          	cmpb   $0xc0,(%edx,%esi,1)
    4ae6:	0f 9d c1             	setge  %cl
    4ae9:	01 c8                	add    %ecx,%eax
    4aeb:	46                   	inc    %esi
    4aec:	39 f7                	cmp    %esi,%edi
    4aee:	75 f0                	jne    4ae0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x270>
    4af0:	8b 7c 24 18          	mov    0x18(%esp),%edi
    4af4:	85 ff                	test   %edi,%edi
    4af6:	b9 00 00 00 00       	mov    $0x0,%ecx
    4afb:	74 35                	je     4b32 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c2>
    4afd:	89 da                	mov    %ebx,%edx
    4aff:	83 e2 fc             	and    $0xfffffffc,%edx
    4b02:	31 c9                	xor    %ecx,%ecx
    4b04:	80 7c 15 00 c0       	cmpb   $0xc0,0x0(%ebp,%edx,1)
    4b09:	0f 9d c1             	setge  %cl
    4b0c:	83 ff 01             	cmp    $0x1,%edi
    4b0f:	74 21                	je     4b32 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c2>
    4b11:	89 ce                	mov    %ecx,%esi
    4b13:	31 c9                	xor    %ecx,%ecx
    4b15:	80 7c 15 01 c0       	cmpb   $0xc0,0x1(%ebp,%edx,1)
    4b1a:	0f 9d c1             	setge  %cl
    4b1d:	01 ce                	add    %ecx,%esi
    4b1f:	83 ff 02             	cmp    $0x2,%edi
    4b22:	74 0c                	je     4b30 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2c0>
    4b24:	31 c9                	xor    %ecx,%ecx
    4b26:	80 7c 15 02 c0       	cmpb   $0xc0,0x2(%ebp,%edx,1)
    4b2b:	0f 9d c1             	setge  %cl
    4b2e:	01 ce                	add    %ecx,%esi
    4b30:	89 f1                	mov    %esi,%ecx
    4b32:	01 c1                	add    %eax,%ecx
    4b34:	c1 eb 02             	shr    $0x2,%ebx
    4b37:	eb 43                	jmp    4b7c <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x30c>
    4b39:	90                   	nop
    4b3a:	90                   	nop
    4b3b:	90                   	nop
    4b3c:	90                   	nop
    4b3d:	90                   	nop
    4b3e:	90                   	nop
    4b3f:	90                   	nop
    4b40:	89 f0                	mov    %esi,%eax
    4b42:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    4b47:	c1 ee 08             	shr    $0x8,%esi
    4b4a:	81 e6 ff 00 ff 00    	and    $0xff00ff,%esi
    4b50:	01 c6                	add    %eax,%esi
    4b52:	89 f0                	mov    %esi,%eax
    4b54:	c1 e0 10             	shl    $0x10,%eax
    4b57:	01 f0                	add    %esi,%eax
    4b59:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    4b5d:	8d 2c ba             	lea    (%edx,%edi,4),%ebp
    4b60:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    4b64:	29 fb                	sub    %edi,%ebx
    4b66:	c1 e8 10             	shr    $0x10,%eax
    4b69:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4b6d:	01 c1                	add    %eax,%ecx
    4b6f:	89 fe                	mov    %edi,%esi
    4b71:	83 e6 03             	and    $0x3,%esi
    4b74:	85 f6                	test   %esi,%esi
    4b76:	0f 85 95 01 00 00    	jne    4d11 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4a1>
    4b7c:	85 db                	test   %ebx,%ebx
    4b7e:	0f 84 a6 00 00 00    	je     4c2a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3ba>
    4b84:	89 ea                	mov    %ebp,%edx
    4b86:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4b8a:	89 d8                	mov    %ebx,%eax
    4b8c:	81 fb c0 00 00 00    	cmp    $0xc0,%ebx
    4b92:	72 05                	jb     4b99 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x329>
    4b94:	b8 c0 00 00 00       	mov    $0xc0,%eax
    4b99:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    4b9d:	31 f6                	xor    %esi,%esi
    4b9f:	89 5c 24 20          	mov    %ebx,0x20(%esp)
    4ba3:	83 fb 04             	cmp    $0x4,%ebx
    4ba6:	72 98                	jb     4b40 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2d0>
    4ba8:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    4bac:	c1 e9 02             	shr    $0x2,%ecx
    4baf:	c1 e1 04             	shl    $0x4,%ecx
    4bb2:	31 ed                	xor    %ebp,%ebp
    4bb4:	31 f6                	xor    %esi,%esi
    4bb6:	90                   	nop
    4bb7:	90                   	nop
    4bb8:	90                   	nop
    4bb9:	90                   	nop
    4bba:	90                   	nop
    4bbb:	90                   	nop
    4bbc:	90                   	nop
    4bbd:	90                   	nop
    4bbe:	90                   	nop
    4bbf:	90                   	nop
    4bc0:	8b 04 2a             	mov    (%edx,%ebp,1),%eax
    4bc3:	8b 5c 2a 04          	mov    0x4(%edx,%ebp,1),%ebx
    4bc7:	89 c7                	mov    %eax,%edi
    4bc9:	f7 d7                	not    %edi
    4bcb:	c1 ef 07             	shr    $0x7,%edi
    4bce:	c1 e8 06             	shr    $0x6,%eax
    4bd1:	09 f8                	or     %edi,%eax
    4bd3:	25 01 01 01 01       	and    $0x1010101,%eax
    4bd8:	01 f0                	add    %esi,%eax
    4bda:	89 de                	mov    %ebx,%esi
    4bdc:	f7 d6                	not    %esi
    4bde:	c1 ee 07             	shr    $0x7,%esi
    4be1:	c1 eb 06             	shr    $0x6,%ebx
    4be4:	09 f3                	or     %esi,%ebx
    4be6:	81 e3 01 01 01 01    	and    $0x1010101,%ebx
    4bec:	8b 7c 2a 08          	mov    0x8(%edx,%ebp,1),%edi
    4bf0:	89 fe                	mov    %edi,%esi
    4bf2:	f7 d6                	not    %esi
    4bf4:	c1 ee 07             	shr    $0x7,%esi
    4bf7:	c1 ef 06             	shr    $0x6,%edi
    4bfa:	09 f7                	or     %esi,%edi
    4bfc:	81 e7 01 01 01 01    	and    $0x1010101,%edi
    4c02:	01 df                	add    %ebx,%edi
    4c04:	01 c7                	add    %eax,%edi
    4c06:	8b 74 2a 0c          	mov    0xc(%edx,%ebp,1),%esi
    4c0a:	89 f0                	mov    %esi,%eax
    4c0c:	f7 d0                	not    %eax
    4c0e:	c1 e8 07             	shr    $0x7,%eax
    4c11:	c1 ee 06             	shr    $0x6,%esi
    4c14:	09 c6                	or     %eax,%esi
    4c16:	81 e6 01 01 01 01    	and    $0x1010101,%esi
    4c1c:	01 fe                	add    %edi,%esi
    4c1e:	83 c5 10             	add    $0x10,%ebp
    4c21:	39 e9                	cmp    %ebp,%ecx
    4c23:	75 9b                	jne    4bc0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x350>
    4c25:	e9 16 ff ff ff       	jmp    4b40 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x2d0>
    4c2a:	8b 7c 24 14          	mov    0x14(%esp),%edi
    4c2e:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4c32:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4c36:	8b 74 24 40          	mov    0x40(%esp),%esi
    4c3a:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    4c3e:	39 c1                	cmp    %eax,%ecx
    4c40:	0f 83 82 01 00 00    	jae    4dc8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x558>
    4c46:	89 74 24 10          	mov    %esi,0x10(%esp)
    4c4a:	89 44 24 28          	mov    %eax,0x28(%esp)
    4c4e:	89 c2                	mov    %eax,%edx
    4c50:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4c54:	29 ca                	sub    %ecx,%edx
    4c56:	89 f8                	mov    %edi,%eax
    4c58:	c1 e8 1d             	shr    $0x1d,%eax
    4c5b:	83 e0 03             	and    $0x3,%eax
    4c5e:	31 f6                	xor    %esi,%esi
    4c60:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    4c64:	8b 84 81 94 e4 ff ff 	mov    -0x1b6c(%ecx,%eax,4),%eax
    4c6b:	89 cb                	mov    %ecx,%ebx
    4c6d:	01 c8                	add    %ecx,%eax
    4c6f:	ff e0                	jmp    *%eax
    4c71:	89 d6                	mov    %edx,%esi
    4c73:	eb 05                	jmp    4c7a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x40a>
    4c75:	0f b7 f2             	movzwl %dx,%esi
    4c78:	d1 ee                	shr    $1,%esi
    4c7a:	89 54 24 20          	mov    %edx,0x20(%esp)
    4c7e:	81 e7 ff ff 1f 00    	and    $0x1fffff,%edi
    4c84:	89 7c 24 14          	mov    %edi,0x14(%esp)
    4c88:	8b 7d 00             	mov    0x0(%ebp),%edi
    4c8b:	8b 6d 04             	mov    0x4(%ebp),%ebp
    4c8e:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    4c92:	46                   	inc    %esi
    4c93:	90                   	nop
    4c94:	90                   	nop
    4c95:	90                   	nop
    4c96:	90                   	nop
    4c97:	90                   	nop
    4c98:	90                   	nop
    4c99:	90                   	nop
    4c9a:	90                   	nop
    4c9b:	90                   	nop
    4c9c:	90                   	nop
    4c9d:	90                   	nop
    4c9e:	90                   	nop
    4c9f:	90                   	nop
    4ca0:	66 4e                	dec    %si
    4ca2:	74 19                	je     4cbd <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x44d>
    4ca4:	83 ec 08             	sub    $0x8,%esp
    4ca7:	ff 74 24 1c          	push   0x1c(%esp)
    4cab:	57                   	push   %edi
    4cac:	ff 55 10             	call   *0x10(%ebp)
    4caf:	83 c4 10             	add    $0x10,%esp
    4cb2:	84 c0                	test   %al,%al
    4cb4:	74 ea                	je     4ca0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x430>
    4cb6:	b0 01                	mov    $0x1,%al
    4cb8:	e9 8c 00 00 00       	jmp    4d49 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d9>
    4cbd:	83 ec 04             	sub    $0x4,%esp
    4cc0:	ff 74 24 14          	push   0x14(%esp)
    4cc4:	ff 74 24 14          	push   0x14(%esp)
    4cc8:	57                   	push   %edi
    4cc9:	ff 55 0c             	call   *0xc(%ebp)
    4ccc:	83 c4 10             	add    $0x10,%esp
    4ccf:	89 c1                	mov    %eax,%ecx
    4cd1:	b0 01                	mov    $0x1,%al
    4cd3:	84 c9                	test   %cl,%cl
    4cd5:	75 72                	jne    4d49 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d9>
    4cd7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    4cdb:	29 44 24 20          	sub    %eax,0x20(%esp)
    4cdf:	03 44 24 18          	add    0x18(%esp),%eax
    4ce3:	2b 44 24 28          	sub    0x28(%esp),%eax
    4ce7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    4ceb:	66 be ff ff          	mov    $0xffff,%si
    4cef:	90                   	nop
    4cf0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    4cf4:	01 f0                	add    %esi,%eax
    4cf6:	66 83 f8 ff          	cmp    $0xffff,%ax
    4cfa:	74 41                	je     4d3d <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4cd>
    4cfc:	83 ec 08             	sub    $0x8,%esp
    4cff:	ff 74 24 1c          	push   0x1c(%esp)
    4d03:	57                   	push   %edi
    4d04:	ff 55 10             	call   *0x10(%ebp)
    4d07:	83 c4 10             	add    $0x10,%esp
    4d0a:	46                   	inc    %esi
    4d0b:	84 c0                	test   %al,%al
    4d0d:	74 e1                	je     4cf0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x480>
    4d0f:	eb 30                	jmp    4d41 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4d1>
    4d11:	89 cb                	mov    %ecx,%ebx
    4d13:	81 e7 fc 00 00 00    	and    $0xfc,%edi
    4d19:	8b 0c ba             	mov    (%edx,%edi,4),%ecx
    4d1c:	89 c8                	mov    %ecx,%eax
    4d1e:	f7 d0                	not    %eax
    4d20:	c1 e8 07             	shr    $0x7,%eax
    4d23:	c1 e9 06             	shr    $0x6,%ecx
    4d26:	09 c1                	or     %eax,%ecx
    4d28:	81 e1 01 01 01 01    	and    $0x1010101,%ecx
    4d2e:	83 fe 01             	cmp    $0x1,%esi
    4d31:	75 1e                	jne    4d51 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4e1>
    4d33:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4d37:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4d3b:	eb 57                	jmp    4d94 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x524>
    4d3d:	8b 74 24 20          	mov    0x20(%esp),%esi
    4d41:	66 3b 74 24 20       	cmp    0x20(%esp),%si
    4d46:	0f 92 c0             	setb   %al
    4d49:	83 c4 2c             	add    $0x2c,%esp
    4d4c:	e9 8c 00 00 00       	jmp    4ddd <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x56d>
    4d51:	8b 44 ba 04          	mov    0x4(%edx,%edi,4),%eax
    4d55:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    4d59:	89 c7                	mov    %eax,%edi
    4d5b:	f7 d7                	not    %edi
    4d5d:	c1 ef 07             	shr    $0x7,%edi
    4d60:	c1 e8 06             	shr    $0x6,%eax
    4d63:	09 f8                	or     %edi,%eax
    4d65:	25 01 01 01 01       	and    $0x1010101,%eax
    4d6a:	01 c1                	add    %eax,%ecx
    4d6c:	83 fe 02             	cmp    $0x2,%esi
    4d6f:	8b 6c 24 10          	mov    0x10(%esp),%ebp
    4d73:	74 1b                	je     4d90 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x520>
    4d75:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    4d79:	8b 44 82 08          	mov    0x8(%edx,%eax,4),%eax
    4d7d:	89 c2                	mov    %eax,%edx
    4d7f:	f7 d2                	not    %edx
    4d81:	c1 ea 07             	shr    $0x7,%edx
    4d84:	c1 e8 06             	shr    $0x6,%eax
    4d87:	09 d0                	or     %edx,%eax
    4d89:	25 01 01 01 01       	and    $0x1010101,%eax
    4d8e:	01 c1                	add    %eax,%ecx
    4d90:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4d94:	89 c8                	mov    %ecx,%eax
    4d96:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    4d9b:	c1 e9 08             	shr    $0x8,%ecx
    4d9e:	81 e1 ff 00 07 00    	and    $0x700ff,%ecx
    4da4:	01 c1                	add    %eax,%ecx
    4da6:	89 c8                	mov    %ecx,%eax
    4da8:	c1 e0 10             	shl    $0x10,%eax
    4dab:	01 c8                	add    %ecx,%eax
    4dad:	c1 e8 10             	shr    $0x10,%eax
    4db0:	89 d9                	mov    %ebx,%ecx
    4db2:	01 c1                	add    %eax,%ecx
    4db4:	8b 7c 24 14          	mov    0x14(%esp),%edi
    4db8:	8b 74 24 40          	mov    0x40(%esp),%esi
    4dbc:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    4dc0:	39 c1                	cmp    %eax,%ecx
    4dc2:	0f 82 7e fe ff ff    	jb     4c46 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3d6>
    4dc8:	8b 45 04             	mov    0x4(%ebp),%eax
    4dcb:	83 ec 04             	sub    $0x4,%esp
    4dce:	8b 5c 24 28          	mov    0x28(%esp),%ebx
    4dd2:	56                   	push   %esi
    4dd3:	52                   	push   %edx
    4dd4:	ff 75 00             	push   0x0(%ebp)
    4dd7:	ff 50 0c             	call   *0xc(%eax)
    4dda:	83 c4 3c             	add    $0x3c,%esp
    4ddd:	5e                   	pop    %esi
    4dde:	5f                   	pop    %edi
    4ddf:	5b                   	pop    %ebx
    4de0:	5d                   	pop    %ebp
    4de1:	c3                   	ret
    4de2:	66 90                	xchg   %ax,%ax
    4de4:	66 90                	xchg   %ax,%ax
    4de6:	66 90                	xchg   %ax,%ax
    4de8:	66 90                	xchg   %ax,%ax
    4dea:	66 90                	xchg   %ax,%ax
    4dec:	66 90                	xchg   %ax,%ax
    4dee:	66 90                	xchg   %ax,%ax

00004df0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE>:
    4df0:	53                   	push   %ebx
    4df1:	83 ec 08             	sub    $0x8,%esp
    4df4:	e8 00 00 00 00       	call   4df9 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE+0x9>
    4df9:	5b                   	pop    %ebx
    4dfa:	81 c3 fb 31 00 00    	add    $0x31fb,%ebx
    4e00:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    4e04:	8b 44 24 10          	mov    0x10(%esp),%eax
    4e08:	8b 10                	mov    (%eax),%edx
    4e0a:	8b 40 04             	mov    0x4(%eax),%eax
    4e0d:	89 04 24             	mov    %eax,(%esp)
    4e10:	e8 5b fa ff ff       	call   4870 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    4e15:	83 c4 08             	add    $0x8,%esp
    4e18:	5b                   	pop    %ebx
    4e19:	c3                   	ret
    4e1a:	66 90                	xchg   %ax,%ax
    4e1c:	66 90                	xchg   %ax,%ax
    4e1e:	66 90                	xchg   %ax,%ax

00004e20 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE>:
    4e20:	53                   	push   %ebx
    4e21:	83 ec 08             	sub    $0x8,%esp
    4e24:	e8 00 00 00 00       	call   4e29 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE+0x9>
    4e29:	5b                   	pop    %ebx
    4e2a:	81 c3 cb 31 00 00    	add    $0x31cb,%ebx
    4e30:	8b 44 24 10          	mov    0x10(%esp),%eax
    4e34:	8b 48 04             	mov    0x4(%eax),%ecx
    4e37:	83 ec 08             	sub    $0x8,%esp
    4e3a:	ff 74 24 1c          	push   0x1c(%esp)
    4e3e:	ff 30                	push   (%eax)
    4e40:	ff 51 0c             	call   *0xc(%ecx)
    4e43:	83 c4 18             	add    $0x18,%esp
    4e46:	5b                   	pop    %ebx
    4e47:	c3                   	ret
    4e48:	66 90                	xchg   %ax,%ax
    4e4a:	66 90                	xchg   %ax,%ax
    4e4c:	66 90                	xchg   %ax,%ax
    4e4e:	66 90                	xchg   %ax,%ax

00004e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>:
    4e50:	55                   	push   %ebp
    4e51:	53                   	push   %ebx
    4e52:	57                   	push   %edi
    4e53:	56                   	push   %esi
    4e54:	83 ec 2c             	sub    $0x2c,%esp
    4e57:	e8 00 00 00 00       	call   4e5c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc>
    4e5c:	5b                   	pop    %ebx
    4e5d:	81 c3 98 31 00 00    	add    $0x3198,%ebx
    4e63:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    4e67:	c7 44 24 20 20 00 00 	movl   $0xe0000020,0x20(%esp)
    4e6e:	e0 
    4e6f:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    4e76:	00 
    4e77:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4e7b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    4e7f:	8b 7d 10             	mov    0x10(%ebp),%edi
    4e82:	85 ff                	test   %edi,%edi
    4e84:	0f 84 10 01 00 00    	je     4f9a <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x14a>
    4e8a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    4e8d:	85 c9                	test   %ecx,%ecx
    4e8f:	0f 84 9e 01 00 00    	je     5033 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    4e95:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
    4e98:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    4e9b:	89 44 24 14          	mov    %eax,0x14(%esp)
    4e9f:	8d 47 18             	lea    0x18(%edi),%eax
    4ea2:	8b 55 00             	mov    0x0(%ebp),%edx
    4ea5:	8b 75 08             	mov    0x8(%ebp),%esi
    4ea8:	89 74 24 10          	mov    %esi,0x10(%esp)
    4eac:	49                   	dec    %ecx
    4ead:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    4eb3:	41                   	inc    %ecx
    4eb4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4eb8:	31 f6                	xor    %esi,%esi
    4eba:	89 54 24 28          	mov    %edx,0x28(%esp)
    4ebe:	eb 11                	jmp    4ed1 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x81>
    4ec0:	46                   	inc    %esi
    4ec1:	89 ef                	mov    %ebp,%edi
    4ec3:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    4ec7:	8b 54 24 28          	mov    0x28(%esp),%edx
    4ecb:	0f 84 4f 01 00 00    	je     5020 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1d0>
    4ed1:	89 c5                	mov    %eax,%ebp
    4ed3:	8b 44 f2 04          	mov    0x4(%edx,%esi,8),%eax
    4ed7:	85 c0                	test   %eax,%eax
    4ed9:	74 1d                	je     4ef8 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xa8>
    4edb:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    4edf:	83 ec 04             	sub    $0x4,%esp
    4ee2:	50                   	push   %eax
    4ee3:	ff 34 f2             	push   (%edx,%esi,8)
    4ee6:	ff 74 24 24          	push   0x24(%esp)
    4eea:	ff 51 0c             	call   *0xc(%ecx)
    4eed:	83 c4 10             	add    $0x10,%esp
    4ef0:	84 c0                	test   %al,%al
    4ef2:	0f 85 37 01 00 00    	jne    502f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    4ef8:	0f b7 47 08          	movzwl 0x8(%edi),%eax
    4efc:	85 c0                	test   %eax,%eax
    4efe:	74 30                	je     4f30 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xe0>
    4f00:	83 f8 01             	cmp    $0x1,%eax
    4f03:	75 3b                	jne    4f40 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf0>
    4f05:	8b 47 0c             	mov    0xc(%edi),%eax
    4f08:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4f0c:	0f b7 44 c1 04       	movzwl 0x4(%ecx,%eax,8),%eax
    4f11:	0f b7 0f             	movzwl (%edi),%ecx
    4f14:	83 f9 02             	cmp    $0x2,%ecx
    4f17:	74 23                	je     4f3c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xec>
    4f19:	83 f9 01             	cmp    $0x1,%ecx
    4f1c:	75 32                	jne    4f50 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x100>
    4f1e:	8b 4f 04             	mov    0x4(%edi),%ecx
    4f21:	8b 54 24 10          	mov    0x10(%esp),%edx
    4f25:	0f b7 4c ca 04       	movzwl 0x4(%edx,%ecx,8),%ecx
    4f2a:	eb 28                	jmp    4f54 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x104>
    4f2c:	90                   	nop
    4f2d:	90                   	nop
    4f2e:	90                   	nop
    4f2f:	90                   	nop
    4f30:	0f b7 47 0a          	movzwl 0xa(%edi),%eax
    4f34:	0f b7 0f             	movzwl (%edi),%ecx
    4f37:	83 f9 02             	cmp    $0x2,%ecx
    4f3a:	75 dd                	jne    4f19 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc9>
    4f3c:	31 c9                	xor    %ecx,%ecx
    4f3e:	eb 14                	jmp    4f54 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x104>
    4f40:	31 c0                	xor    %eax,%eax
    4f42:	0f b7 0f             	movzwl (%edi),%ecx
    4f45:	83 f9 02             	cmp    $0x2,%ecx
    4f48:	75 cf                	jne    4f19 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xc9>
    4f4a:	eb f0                	jmp    4f3c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xec>
    4f4c:	90                   	nop
    4f4d:	90                   	nop
    4f4e:	90                   	nop
    4f4f:	90                   	nop
    4f50:	0f b7 4f 02          	movzwl 0x2(%edi),%ecx
    4f54:	8b 57 10             	mov    0x10(%edi),%edx
    4f57:	8b 7f 14             	mov    0x14(%edi),%edi
    4f5a:	89 7c 24 20          	mov    %edi,0x20(%esp)
    4f5e:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    4f63:	66 89 4c 24 26       	mov    %cx,0x26(%esp)
    4f68:	83 ec 08             	sub    $0x8,%esp
    4f6b:	8d 44 24 20          	lea    0x20(%esp),%eax
    4f6f:	50                   	push   %eax
    4f70:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    4f74:	ff 34 d0             	push   (%eax,%edx,8)
    4f77:	ff 54 d0 04          	call   *0x4(%eax,%edx,8)
    4f7b:	83 c4 10             	add    $0x10,%esp
    4f7e:	84 c0                	test   %al,%al
    4f80:	0f 85 a9 00 00 00    	jne    502f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    4f86:	89 e8                	mov    %ebp,%eax
    4f88:	3b 6c 24 14          	cmp    0x14(%esp),%ebp
    4f8c:	0f 84 2e ff ff ff    	je     4ec0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    4f92:	8d 45 18             	lea    0x18(%ebp),%eax
    4f95:	e9 26 ff ff ff       	jmp    4ec0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    4f9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f9d:	85 c0                	test   %eax,%eax
    4f9f:	0f 84 8e 00 00 00    	je     5033 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    4fa5:	89 c1                	mov    %eax,%ecx
    4fa7:	8b 75 08             	mov    0x8(%ebp),%esi
    4faa:	8d 04 c6             	lea    (%esi,%eax,8),%eax
    4fad:	89 44 24 10          	mov    %eax,0x10(%esp)
    4fb1:	8d 46 08             	lea    0x8(%esi),%eax
    4fb4:	8b 55 00             	mov    0x0(%ebp),%edx
    4fb7:	49                   	dec    %ecx
    4fb8:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    4fbe:	41                   	inc    %ecx
    4fbf:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4fc3:	31 ed                	xor    %ebp,%ebp
    4fc5:	89 54 24 14          	mov    %edx,0x14(%esp)
    4fc9:	90                   	nop
    4fca:	90                   	nop
    4fcb:	90                   	nop
    4fcc:	90                   	nop
    4fcd:	90                   	nop
    4fce:	90                   	nop
    4fcf:	90                   	nop
    4fd0:	89 c7                	mov    %eax,%edi
    4fd2:	8b 44 ea 04          	mov    0x4(%edx,%ebp,8),%eax
    4fd6:	85 c0                	test   %eax,%eax
    4fd8:	74 19                	je     4ff3 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1a3>
    4fda:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    4fde:	83 ec 04             	sub    $0x4,%esp
    4fe1:	50                   	push   %eax
    4fe2:	ff 34 ea             	push   (%edx,%ebp,8)
    4fe5:	ff 74 24 24          	push   0x24(%esp)
    4fe9:	ff 51 0c             	call   *0xc(%ecx)
    4fec:	83 c4 10             	add    $0x10,%esp
    4fef:	84 c0                	test   %al,%al
    4ff1:	75 3c                	jne    502f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    4ff3:	83 ec 08             	sub    $0x8,%esp
    4ff6:	8d 44 24 20          	lea    0x20(%esp),%eax
    4ffa:	50                   	push   %eax
    4ffb:	ff 36                	push   (%esi)
    4ffd:	ff 56 04             	call   *0x4(%esi)
    5000:	83 c4 10             	add    $0x10,%esp
    5003:	84 c0                	test   %al,%al
    5005:	75 28                	jne    502f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    5007:	45                   	inc    %ebp
    5008:	31 c0                	xor    %eax,%eax
    500a:	3b 7c 24 10          	cmp    0x10(%esp),%edi
    500e:	0f 95 c0             	setne  %al
    5011:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    5014:	89 fe                	mov    %edi,%esi
    5016:	39 6c 24 0c          	cmp    %ebp,0xc(%esp)
    501a:	8b 54 24 14          	mov    0x14(%esp),%edx
    501e:	75 b0                	jne    4fd0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x180>
    5020:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    5024:	8b 54 24 0c          	mov    0xc(%esp),%edx
    5028:	3b 55 04             	cmp    0x4(%ebp),%edx
    502b:	72 0d                	jb     503a <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1ea>
    502d:	eb 2e                	jmp    505d <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    502f:	b0 01                	mov    $0x1,%al
    5031:	eb 2c                	jmp    505f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    5033:	31 d2                	xor    %edx,%edx
    5035:	3b 55 04             	cmp    0x4(%ebp),%edx
    5038:	73 23                	jae    505d <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    503a:	8b 45 00             	mov    0x0(%ebp),%eax
    503d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    5041:	83 ec 04             	sub    $0x4,%esp
    5044:	ff 74 d0 04          	push   0x4(%eax,%edx,8)
    5048:	ff 34 d0             	push   (%eax,%edx,8)
    504b:	ff 74 24 24          	push   0x24(%esp)
    504f:	ff 51 0c             	call   *0xc(%ecx)
    5052:	83 c4 10             	add    $0x10,%esp
    5055:	89 c1                	mov    %eax,%ecx
    5057:	b0 01                	mov    $0x1,%al
    5059:	84 c9                	test   %cl,%cl
    505b:	75 02                	jne    505f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    505d:	31 c0                	xor    %eax,%eax
    505f:	83 c4 2c             	add    $0x2c,%esp
    5062:	5e                   	pop    %esi
    5063:	5f                   	pop    %edi
    5064:	5b                   	pop    %ebx
    5065:	5d                   	pop    %ebp
    5066:	c3                   	ret
    5067:	66 90                	xchg   %ax,%ax
    5069:	66 90                	xchg   %ax,%ax
    506b:	66 90                	xchg   %ax,%ax
    506d:	66 90                	xchg   %ax,%ax
    506f:	90                   	nop

00005070 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E>:
    5070:	53                   	push   %ebx
    5071:	83 ec 08             	sub    $0x8,%esp
    5074:	e8 00 00 00 00       	call   5079 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x9>
    5079:	5b                   	pop    %ebx
    507a:	81 c3 7b 2f 00 00    	add    $0x2f7b,%ebx
    5080:	8b 44 24 14          	mov    0x14(%esp),%eax
    5084:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    5088:	8b 09                	mov    (%ecx),%ecx
    508a:	89 04 24             	mov    %eax,(%esp)
    508d:	ba 01 00 00 00       	mov    $0x1,%edx
    5092:	e8 09 00 00 00       	call   50a0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>
    5097:	83 c4 08             	add    $0x8,%esp
    509a:	5b                   	pop    %ebx
    509b:	c3                   	ret
    509c:	66 90                	xchg   %ax,%ax
    509e:	66 90                	xchg   %ax,%ax

000050a0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>:
    50a0:	55                   	push   %ebp
    50a1:	53                   	push   %ebx
    50a2:	57                   	push   %edi
    50a3:	56                   	push   %esi
    50a4:	83 ec 1c             	sub    $0x1c,%esp
    50a7:	89 54 24 0c          	mov    %edx,0xc(%esp)
    50ab:	e8 00 00 00 00       	call   50b0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x10>
    50b0:	5b                   	pop    %ebx
    50b1:	81 c3 44 2f 00 00    	add    $0x2f44,%ebx
    50b7:	b8 0a 00 00 00       	mov    $0xa,%eax
    50bc:	89 ca                	mov    %ecx,%edx
    50be:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    50c2:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
    50c8:	72 66                	jb     5130 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x90>
    50ca:	bf 0a 00 00 00       	mov    $0xa,%edi
    50cf:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    50d3:	90                   	nop
    50d4:	90                   	nop
    50d5:	90                   	nop
    50d6:	90                   	nop
    50d7:	90                   	nop
    50d8:	90                   	nop
    50d9:	90                   	nop
    50da:	90                   	nop
    50db:	90                   	nop
    50dc:	90                   	nop
    50dd:	90                   	nop
    50de:	90                   	nop
    50df:	90                   	nop
    50e0:	89 c8                	mov    %ecx,%eax
    50e2:	ba 59 17 b7 d1       	mov    $0xd1b71759,%edx
    50e7:	f7 e2                	mul    %edx
    50e9:	c1 ea 0d             	shr    $0xd,%edx
    50ec:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    50f2:	89 ce                	mov    %ecx,%esi
    50f4:	29 c6                	sub    %eax,%esi
    50f6:	69 c6 7b 14 00 00    	imul   $0x147b,%esi,%eax
    50fc:	c1 e8 13             	shr    $0x13,%eax
    50ff:	6b e8 64             	imul   $0x64,%eax,%ebp
    5102:	29 ee                	sub    %ebp,%esi
    5104:	0f b7 84 43 f3 eb ff 	movzwl -0x140d(%ebx,%eax,2),%eax
    510b:	ff 
    510c:	66 89 44 3c 0e       	mov    %ax,0xe(%esp,%edi,1)
    5111:	0f b7 c6             	movzwl %si,%eax
    5114:	0f b7 84 43 f3 eb ff 	movzwl -0x140d(%ebx,%eax,2),%eax
    511b:	ff 
    511c:	66 89 44 3c 10       	mov    %ax,0x10(%esp,%edi,1)
    5121:	8d 47 fc             	lea    -0x4(%edi),%eax
    5124:	89 c7                	mov    %eax,%edi
    5126:	81 f9 7f 96 98 00    	cmp    $0x98967f,%ecx
    512c:	89 d1                	mov    %edx,%ecx
    512e:	77 b0                	ja     50e0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0x40>
    5130:	83 fa 09             	cmp    $0x9,%edx
    5133:	76 29                	jbe    515e <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xbe>
    5135:	0f b7 ca             	movzwl %dx,%ecx
    5138:	c1 e9 02             	shr    $0x2,%ecx
    513b:	69 c9 7b 14 00 00    	imul   $0x147b,%ecx,%ecx
    5141:	c1 e9 11             	shr    $0x11,%ecx
    5144:	6b f1 64             	imul   $0x64,%ecx,%esi
    5147:	29 f2                	sub    %esi,%edx
    5149:	0f b7 d2             	movzwl %dx,%edx
    514c:	0f b7 94 53 f3 eb ff 	movzwl -0x140d(%ebx,%edx,2),%edx
    5153:	ff 
    5154:	66 89 54 04 10       	mov    %dx,0x10(%esp,%eax,1)
    5159:	83 c0 fe             	add    $0xfffffffe,%eax
    515c:	89 ca                	mov    %ecx,%edx
    515e:	8b 74 24 30          	mov    0x30(%esp),%esi
    5162:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    5167:	74 04                	je     516d <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xcd>
    5169:	85 d2                	test   %edx,%edx
    516b:	74 10                	je     517d <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E+0xdd>
    516d:	83 e2 0f             	and    $0xf,%edx
    5170:	0f b6 8c 53 f4 eb ff 	movzbl -0x140c(%ebx,%edx,2),%ecx
    5177:	ff 
    5178:	88 4c 04 11          	mov    %cl,0x11(%esp,%eax,1)
    517c:	48                   	dec    %eax
    517d:	bf 0a 00 00 00       	mov    $0xa,%edi
    5182:	29 c7                	sub    %eax,%edi
    5184:	01 e0                	add    %esp,%eax
    5186:	83 c0 12             	add    $0x12,%eax
    5189:	0f b6 54 24 0c       	movzbl 0xc(%esp),%edx
    518e:	89 f1                	mov    %esi,%ecx
    5190:	57                   	push   %edi
    5191:	50                   	push   %eax
    5192:	6a 00                	push   $0x0
    5194:	6a 01                	push   $0x1
    5196:	e8 d5 f3 ff ff       	call   4570 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    519b:	83 c4 2c             	add    $0x2c,%esp
    519e:	5e                   	pop    %esi
    519f:	5f                   	pop    %edi
    51a0:	5b                   	pop    %ebx
    51a1:	5d                   	pop    %ebp
    51a2:	c3                   	ret
    51a3:	66 90                	xchg   %ax,%ax
    51a5:	66 90                	xchg   %ax,%ax
    51a7:	66 90                	xchg   %ax,%ax
    51a9:	66 90                	xchg   %ax,%ax
    51ab:	66 90                	xchg   %ax,%ax
    51ad:	66 90                	xchg   %ax,%ax
    51af:	90                   	nop

000051b0 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE>:
    51b0:	55                   	push   %ebp
    51b1:	53                   	push   %ebx
    51b2:	57                   	push   %edi
    51b3:	56                   	push   %esi
    51b4:	83 ec 2c             	sub    $0x2c,%esp
    51b7:	89 ce                	mov    %ecx,%esi
    51b9:	e8 00 00 00 00       	call   51be <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0xe>
    51be:	5b                   	pop    %ebx
    51bf:	81 c3 36 2e 00 00    	add    $0x2e36,%ebx
    51c5:	b1 01                	mov    $0x1,%cl
    51c7:	80 7e 04 00          	cmpb   $0x0,0x4(%esi)
    51cb:	0f 85 23 01 00 00    	jne    52f4 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    51d1:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    51d5:	8b 3e                	mov    (%esi),%edi
    51d7:	f6 47 0a 80          	testb  $0x80,0xa(%edi)
    51db:	0f b6 4e 05          	movzbl 0x5(%esi),%ecx
    51df:	75 1b                	jne    51fc <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x4c>
    51e1:	0f b6 c1             	movzbl %cl,%eax
    51e4:	83 f0 03             	xor    $0x3,%eax
    51e7:	89 d5                	mov    %edx,%ebp
    51e9:	84 c9                	test   %cl,%cl
    51eb:	0f 85 ce 00 00 00    	jne    52bf <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x10f>
    51f1:	8d 8b e1 eb ff ff    	lea    -0x141f(%ebx),%ecx
    51f7:	e9 c9 00 00 00       	jmp    52c5 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x115>
    51fc:	84 c9                	test   %cl,%cl
    51fe:	75 29                	jne    5229 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x79>
    5200:	8b 47 04             	mov    0x4(%edi),%eax
    5203:	83 ec 04             	sub    $0x4,%esp
    5206:	8d 8b e6 eb ff ff    	lea    -0x141a(%ebx),%ecx
    520c:	6a 03                	push   $0x3
    520e:	51                   	push   %ecx
    520f:	ff 37                	push   (%edi)
    5211:	89 d5                	mov    %edx,%ebp
    5213:	ff 50 0c             	call   *0xc(%eax)
    5216:	89 ea                	mov    %ebp,%edx
    5218:	8b 6c 24 58          	mov    0x58(%esp),%ebp
    521c:	83 c4 10             	add    $0x10,%esp
    521f:	b1 01                	mov    $0x1,%cl
    5221:	84 c0                	test   %al,%al
    5223:	0f 85 cb 00 00 00    	jne    52f4 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    5229:	c6 44 24 0f 01       	movb   $0x1,0xf(%esp)
    522e:	8b 07                	mov    (%edi),%eax
    5230:	8b 4f 04             	mov    0x4(%edi),%ecx
    5233:	89 44 24 20          	mov    %eax,0x20(%esp)
    5237:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    523b:	8d 44 24 0f          	lea    0xf(%esp),%eax
    523f:	89 44 24 28          	mov    %eax,0x28(%esp)
    5243:	8b 47 08             	mov    0x8(%edi),%eax
    5246:	8b 4f 0c             	mov    0xc(%edi),%ecx
    5249:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    524d:	89 44 24 18          	mov    %eax,0x18(%esp)
    5251:	8d 7c 24 20          	lea    0x20(%esp),%edi
    5255:	89 7c 24 10          	mov    %edi,0x10(%esp)
    5259:	8d 83 f0 fe ff ff    	lea    -0x110(%ebx),%eax
    525f:	89 44 24 14          	mov    %eax,0x14(%esp)
    5263:	83 ec 04             	sub    $0x4,%esp
    5266:	ff 74 24 44          	push   0x44(%esp)
    526a:	52                   	push   %edx
    526b:	57                   	push   %edi
    526c:	e8 cf 00 00 00       	call   5340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    5271:	83 c4 10             	add    $0x10,%esp
    5274:	84 c0                	test   %al,%al
    5276:	75 7a                	jne    52f2 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    5278:	83 ec 04             	sub    $0x4,%esp
    527b:	8d 83 d3 eb ff ff    	lea    -0x142d(%ebx),%eax
    5281:	6a 02                	push   $0x2
    5283:	50                   	push   %eax
    5284:	57                   	push   %edi
    5285:	e8 b6 00 00 00       	call   5340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    528a:	83 c4 10             	add    $0x10,%esp
    528d:	84 c0                	test   %al,%al
    528f:	75 61                	jne    52f2 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    5291:	83 ec 08             	sub    $0x8,%esp
    5294:	8d 44 24 18          	lea    0x18(%esp),%eax
    5298:	50                   	push   %eax
    5299:	ff 74 24 50          	push   0x50(%esp)
    529d:	ff d5                	call   *%ebp
    529f:	83 c4 10             	add    $0x10,%esp
    52a2:	84 c0                	test   %al,%al
    52a4:	75 4c                	jne    52f2 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x142>
    52a6:	8b 44 24 14          	mov    0x14(%esp),%eax
    52aa:	83 ec 04             	sub    $0x4,%esp
    52ad:	8d 8b e9 eb ff ff    	lea    -0x1417(%ebx),%ecx
    52b3:	6a 02                	push   $0x2
    52b5:	51                   	push   %ecx
    52b6:	ff 74 24 1c          	push   0x1c(%esp)
    52ba:	ff 50 0c             	call   *0xc(%eax)
    52bd:	eb 71                	jmp    5330 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x180>
    52bf:	8d 8b e4 eb ff ff    	lea    -0x141c(%ebx),%ecx
    52c5:	8b 57 04             	mov    0x4(%edi),%edx
    52c8:	83 ec 04             	sub    $0x4,%esp
    52cb:	50                   	push   %eax
    52cc:	51                   	push   %ecx
    52cd:	ff 37                	push   (%edi)
    52cf:	ff 52 0c             	call   *0xc(%edx)
    52d2:	83 c4 10             	add    $0x10,%esp
    52d5:	b1 01                	mov    $0x1,%cl
    52d7:	84 c0                	test   %al,%al
    52d9:	75 19                	jne    52f4 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    52db:	8b 47 04             	mov    0x4(%edi),%eax
    52de:	83 ec 04             	sub    $0x4,%esp
    52e1:	ff 74 24 44          	push   0x44(%esp)
    52e5:	55                   	push   %ebp
    52e6:	ff 37                	push   (%edi)
    52e8:	ff 50 0c             	call   *0xc(%eax)
    52eb:	83 c4 10             	add    $0x10,%esp
    52ee:	84 c0                	test   %al,%al
    52f0:	74 13                	je     5305 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x155>
    52f2:	b1 01                	mov    $0x1,%cl
    52f4:	88 4e 04             	mov    %cl,0x4(%esi)
    52f7:	c6 46 05 01          	movb   $0x1,0x5(%esi)
    52fb:	89 f0                	mov    %esi,%eax
    52fd:	83 c4 2c             	add    $0x2c,%esp
    5300:	5e                   	pop    %esi
    5301:	5f                   	pop    %edi
    5302:	5b                   	pop    %ebx
    5303:	5d                   	pop    %ebp
    5304:	c3                   	ret
    5305:	8b 47 04             	mov    0x4(%edi),%eax
    5308:	83 ec 04             	sub    $0x4,%esp
    530b:	8d 8b d3 eb ff ff    	lea    -0x142d(%ebx),%ecx
    5311:	6a 02                	push   $0x2
    5313:	51                   	push   %ecx
    5314:	ff 37                	push   (%edi)
    5316:	ff 50 0c             	call   *0xc(%eax)
    5319:	83 c4 10             	add    $0x10,%esp
    531c:	84 c0                	test   %al,%al
    531e:	8b 44 24 48          	mov    0x48(%esp),%eax
    5322:	b1 01                	mov    $0x1,%cl
    5324:	75 ce                	jne    52f4 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    5326:	83 ec 08             	sub    $0x8,%esp
    5329:	57                   	push   %edi
    532a:	ff 74 24 50          	push   0x50(%esp)
    532e:	ff d0                	call   *%eax
    5330:	83 c4 10             	add    $0x10,%esp
    5333:	89 c1                	mov    %eax,%ecx
    5335:	eb bd                	jmp    52f4 <_ZN4core3fmt8builders11DebugStruct5field17h3453ce3955d2bfaeE+0x144>
    5337:	66 90                	xchg   %ax,%ax
    5339:	66 90                	xchg   %ax,%ax
    533b:	66 90                	xchg   %ax,%ax
    533d:	66 90                	xchg   %ax,%ax
    533f:	90                   	nop

00005340 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>:
    5340:	55                   	push   %ebp
    5341:	53                   	push   %ebx
    5342:	57                   	push   %edi
    5343:	56                   	push   %esi
    5344:	83 ec 2c             	sub    $0x2c,%esp
    5347:	e8 00 00 00 00       	call   534c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc>
    534c:	5b                   	pop    %ebx
    534d:	81 c3 a8 2c 00 00    	add    $0x2ca8,%ebx
    5353:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    5357:	8b 74 24 44          	mov    0x44(%esp),%esi
    535b:	8b 44 24 40          	mov    0x40(%esp),%eax
    535f:	8b 48 08             	mov    0x8(%eax),%ecx
    5362:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    5366:	8b 08                	mov    (%eax),%ecx
    5368:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    536c:	8b 40 04             	mov    0x4(%eax),%eax
    536f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    5373:	31 d2                	xor    %edx,%edx
    5375:	8d 83 d5 eb ff ff    	lea    -0x142b(%ebx),%eax
    537b:	89 44 24 28          	mov    %eax,0x28(%esp)
    537f:	31 c0                	xor    %eax,%eax
    5381:	31 c9                	xor    %ecx,%ecx
    5383:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    5387:	eb 48                	jmp    53d1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x91>
    5389:	90                   	nop
    538a:	90                   	nop
    538b:	90                   	nop
    538c:	90                   	nop
    538d:	90                   	nop
    538e:	90                   	nop
    538f:	90                   	nop
    5390:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    5394:	80 7c 31 ff 0a       	cmpb   $0xa,-0x1(%ecx,%esi,1)
    5399:	89 ce                	mov    %ecx,%esi
    539b:	0f 94 c1             	sete   %cl
    539e:	01 f2                	add    %esi,%edx
    53a0:	89 d5                	mov    %edx,%ebp
    53a2:	8b 54 24 24          	mov    0x24(%esp),%edx
    53a6:	88 0a                	mov    %cl,(%edx)
    53a8:	83 ec 04             	sub    $0x4,%esp
    53ab:	50                   	push   %eax
    53ac:	55                   	push   %ebp
    53ad:	ff 74 24 2c          	push   0x2c(%esp)
    53b1:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    53b5:	ff 50 0c             	call   *0xc(%eax)
    53b8:	83 c4 10             	add    $0x10,%esp
    53bb:	89 fa                	mov    %edi,%edx
    53bd:	84 c0                	test   %al,%al
    53bf:	8b 44 24 10          	mov    0x10(%esp),%eax
    53c3:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    53c7:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    53cb:	0f 85 d0 01 00 00    	jne    55a1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x261>
    53d1:	f6 c1 01             	test   $0x1,%cl
    53d4:	0f 85 c3 01 00 00    	jne    559d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x25d>
    53da:	39 c5                	cmp    %eax,%ebp
    53dc:	73 12                	jae    53f0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xb0>
    53de:	89 c7                	mov    %eax,%edi
    53e0:	e9 5b 01 00 00       	jmp    5540 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    53e5:	90                   	nop
    53e6:	90                   	nop
    53e7:	90                   	nop
    53e8:	90                   	nop
    53e9:	90                   	nop
    53ea:	90                   	nop
    53eb:	90                   	nop
    53ec:	90                   	nop
    53ed:	90                   	nop
    53ee:	90                   	nop
    53ef:	90                   	nop
    53f0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    53f4:	eb 18                	jmp    540e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xce>
    53f6:	90                   	nop
    53f7:	90                   	nop
    53f8:	90                   	nop
    53f9:	90                   	nop
    53fa:	90                   	nop
    53fb:	90                   	nop
    53fc:	90                   	nop
    53fd:	90                   	nop
    53fe:	90                   	nop
    53ff:	90                   	nop
    5400:	89 f8                	mov    %edi,%eax
    5402:	39 ef                	cmp    %ebp,%edi
    5404:	8b 74 24 44          	mov    0x44(%esp),%esi
    5408:	0f 87 32 01 00 00    	ja     5540 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    540e:	89 e9                	mov    %ebp,%ecx
    5410:	29 c1                	sub    %eax,%ecx
    5412:	89 c7                	mov    %eax,%edi
    5414:	01 f0                	add    %esi,%eax
    5416:	83 f9 07             	cmp    $0x7,%ecx
    5419:	89 7c 24 10          	mov    %edi,0x10(%esp)
    541d:	77 31                	ja     5450 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x110>
    541f:	39 fd                	cmp    %edi,%ebp
    5421:	0f 84 09 01 00 00    	je     5530 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f0>
    5427:	31 f6                	xor    %esi,%esi
    5429:	90                   	nop
    542a:	90                   	nop
    542b:	90                   	nop
    542c:	90                   	nop
    542d:	90                   	nop
    542e:	90                   	nop
    542f:	90                   	nop
    5430:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    5434:	0f 84 c9 00 00 00    	je     5503 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1c3>
    543a:	46                   	inc    %esi
    543b:	39 f1                	cmp    %esi,%ecx
    543d:	75 f1                	jne    5430 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xf0>
    543f:	e9 ec 00 00 00       	jmp    5530 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f0>
    5444:	90                   	nop
    5445:	90                   	nop
    5446:	90                   	nop
    5447:	90                   	nop
    5448:	90                   	nop
    5449:	90                   	nop
    544a:	90                   	nop
    544b:	90                   	nop
    544c:	90                   	nop
    544d:	90                   	nop
    544e:	90                   	nop
    544f:	90                   	nop
    5450:	8d 78 03             	lea    0x3(%eax),%edi
    5453:	83 e7 fc             	and    $0xfffffffc,%edi
    5456:	89 fa                	mov    %edi,%edx
    5458:	29 c2                	sub    %eax,%edx
    545a:	74 20                	je     547c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x13c>
    545c:	31 f6                	xor    %esi,%esi
    545e:	90                   	nop
    545f:	90                   	nop
    5460:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    5464:	0f 84 95 00 00 00    	je     54ff <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bf>
    546a:	46                   	inc    %esi
    546b:	39 f2                	cmp    %esi,%edx
    546d:	75 f1                	jne    5460 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x120>
    546f:	8d 71 f8             	lea    -0x8(%ecx),%esi
    5472:	89 74 24 14          	mov    %esi,0x14(%esp)
    5476:	39 f2                	cmp    %esi,%edx
    5478:	76 09                	jbe    5483 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x143>
    547a:	eb 51                	jmp    54cd <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    547c:	8d 71 f8             	lea    -0x8(%ecx),%esi
    547f:	89 74 24 14          	mov    %esi,0x14(%esp)
    5483:	be 04 00 00 00       	mov    $0x4,%esi
    5488:	01 f7                	add    %esi,%edi
    548a:	90                   	nop
    548b:	90                   	nop
    548c:	90                   	nop
    548d:	90                   	nop
    548e:	90                   	nop
    548f:	90                   	nop
    5490:	8b 5f fc             	mov    -0x4(%edi),%ebx
    5493:	8b 37                	mov    (%edi),%esi
    5495:	89 dd                	mov    %ebx,%ebp
    5497:	81 f5 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebp
    549d:	81 c5 01 01 01 01    	add    $0x1010101,%ebp
    54a3:	09 dd                	or     %ebx,%ebp
    54a5:	89 f3                	mov    %esi,%ebx
    54a7:	81 f3 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebx
    54ad:	81 c3 01 01 01 01    	add    $0x1010101,%ebx
    54b3:	09 f3                	or     %esi,%ebx
    54b5:	21 eb                	and    %ebp,%ebx
    54b7:	f7 d3                	not    %ebx
    54b9:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
    54bf:	75 0c                	jne    54cd <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    54c1:	83 c2 08             	add    $0x8,%edx
    54c4:	83 c7 08             	add    $0x8,%edi
    54c7:	3b 54 24 14          	cmp    0x14(%esp),%edx
    54cb:	76 c3                	jbe    5490 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x150>
    54cd:	39 d1                	cmp    %edx,%ecx
    54cf:	0f 84 bc 00 00 00    	je     5591 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x251>
    54d5:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    54d8:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    54dc:	89 ef                	mov    %ebp,%edi
    54de:	29 d7                	sub    %edx,%edi
    54e0:	2b 7c 24 10          	sub    0x10(%esp),%edi
    54e4:	31 f6                	xor    %esi,%esi
    54e6:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    54ea:	90                   	nop
    54eb:	90                   	nop
    54ec:	90                   	nop
    54ed:	90                   	nop
    54ee:	90                   	nop
    54ef:	90                   	nop
    54f0:	80 3c 31 0a          	cmpb   $0xa,(%ecx,%esi,1)
    54f4:	74 07                	je     54fd <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bd>
    54f6:	46                   	inc    %esi
    54f7:	39 f7                	cmp    %esi,%edi
    54f9:	75 f5                	jne    54f0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1b0>
    54fb:	eb 37                	jmp    5534 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f4>
    54fd:	01 d6                	add    %edx,%esi
    54ff:	8b 54 24 0c          	mov    0xc(%esp),%edx
    5503:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    5507:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
    550a:	47                   	inc    %edi
    550b:	01 f1                	add    %esi,%ecx
    550d:	39 e9                	cmp    %ebp,%ecx
    550f:	0f 83 eb fe ff ff    	jae    5400 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    5515:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    5519:	0f 85 e1 fe ff ff    	jne    5400 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    551f:	31 c9                	xor    %ecx,%ecx
    5521:	89 f8                	mov    %edi,%eax
    5523:	89 fe                	mov    %edi,%esi
    5525:	eb 25                	jmp    554c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x20c>
    5527:	90                   	nop
    5528:	90                   	nop
    5529:	90                   	nop
    552a:	90                   	nop
    552b:	90                   	nop
    552c:	90                   	nop
    552d:	90                   	nop
    552e:	90                   	nop
    552f:	90                   	nop
    5530:	89 ef                	mov    %ebp,%edi
    5532:	eb 0c                	jmp    5540 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x200>
    5534:	89 ef                	mov    %ebp,%edi
    5536:	8b 54 24 0c          	mov    0xc(%esp),%edx
    553a:	90                   	nop
    553b:	90                   	nop
    553c:	90                   	nop
    553d:	90                   	nop
    553e:	90                   	nop
    553f:	90                   	nop
    5540:	89 f8                	mov    %edi,%eax
    5542:	b1 01                	mov    $0x1,%cl
    5544:	89 d7                	mov    %edx,%edi
    5546:	89 ee                	mov    %ebp,%esi
    5548:	39 d5                	cmp    %edx,%ebp
    554a:	74 51                	je     559d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x25d>
    554c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    5550:	89 44 24 10          	mov    %eax,0x10(%esp)
    5554:	8b 44 24 24          	mov    0x24(%esp),%eax
    5558:	80 38 00             	cmpb   $0x0,(%eax)
    555b:	74 1f                	je     557c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x23c>
    555d:	83 ec 04             	sub    $0x4,%esp
    5560:	6a 04                	push   $0x4
    5562:	ff 74 24 30          	push   0x30(%esp)
    5566:	ff 74 24 2c          	push   0x2c(%esp)
    556a:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    556e:	89 d5                	mov    %edx,%ebp
    5570:	ff 50 0c             	call   *0xc(%eax)
    5573:	89 ea                	mov    %ebp,%edx
    5575:	83 c4 10             	add    $0x10,%esp
    5578:	84 c0                	test   %al,%al
    557a:	75 25                	jne    55a1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x261>
    557c:	89 f0                	mov    %esi,%eax
    557e:	29 d0                	sub    %edx,%eax
    5580:	0f 85 0a fe ff ff    	jne    5390 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x50>
    5586:	31 c9                	xor    %ecx,%ecx
    5588:	8b 74 24 44          	mov    0x44(%esp),%esi
    558c:	e9 0d fe ff ff       	jmp    539e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x5e>
    5591:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    5595:	89 ef                	mov    %ebp,%edi
    5597:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    559b:	eb 99                	jmp    5536 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f6>
    559d:	31 c0                	xor    %eax,%eax
    559f:	eb 02                	jmp    55a3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x263>
    55a1:	b0 01                	mov    $0x1,%al
    55a3:	83 c4 2c             	add    $0x2c,%esp
    55a6:	5e                   	pop    %esi
    55a7:	5f                   	pop    %edi
    55a8:	5b                   	pop    %ebx
    55a9:	5d                   	pop    %ebp
    55aa:	c3                   	ret
    55ab:	66 90                	xchg   %ax,%ax
    55ad:	66 90                	xchg   %ax,%ax
    55af:	90                   	nop

000055b0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E>:
    55b0:	55                   	push   %ebp
    55b1:	53                   	push   %ebx
    55b2:	57                   	push   %edi
    55b3:	56                   	push   %esi
    55b4:	83 ec 0c             	sub    $0xc,%esp
    55b7:	e8 00 00 00 00       	call   55bc <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0xc>
    55bc:	5b                   	pop    %ebx
    55bd:	81 c3 38 2a 00 00    	add    $0x2a38,%ebx
    55c3:	8b 44 24 20          	mov    0x20(%esp),%eax
    55c7:	8b 68 08             	mov    0x8(%eax),%ebp
    55ca:	8b 38                	mov    (%eax),%edi
    55cc:	8b 70 04             	mov    0x4(%eax),%esi
    55cf:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
    55d3:	74 1e                	je     55f3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    55d5:	83 ec 04             	sub    $0x4,%esp
    55d8:	8d 83 d5 eb ff ff    	lea    -0x142b(%ebx),%eax
    55de:	6a 04                	push   $0x4
    55e0:	50                   	push   %eax
    55e1:	57                   	push   %edi
    55e2:	ff 56 0c             	call   *0xc(%esi)
    55e5:	83 c4 10             	add    $0x10,%esp
    55e8:	84 c0                	test   %al,%al
    55ea:	74 07                	je     55f3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    55ec:	b0 01                	mov    $0x1,%al
    55ee:	83 c4 0c             	add    $0xc,%esp
    55f1:	eb 16                	jmp    5609 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x59>
    55f3:	8b 44 24 24          	mov    0x24(%esp),%eax
    55f7:	83 f8 0a             	cmp    $0xa,%eax
    55fa:	0f 94 45 00          	sete   0x0(%ebp)
    55fe:	83 ec 08             	sub    $0x8,%esp
    5601:	50                   	push   %eax
    5602:	57                   	push   %edi
    5603:	ff 56 10             	call   *0x10(%esi)
    5606:	83 c4 1c             	add    $0x1c,%esp
    5609:	5e                   	pop    %esi
    560a:	5f                   	pop    %edi
    560b:	5b                   	pop    %ebx
    560c:	5d                   	pop    %ebp
    560d:	c3                   	ret
    560e:	66 90                	xchg   %ax,%ax

00005610 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE>:
    5610:	53                   	push   %ebx
    5611:	83 ec 08             	sub    $0x8,%esp
    5614:	e8 00 00 00 00       	call   5619 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x9>
    5619:	5b                   	pop    %ebx
    561a:	81 c3 db 29 00 00    	add    $0x29db,%ebx
    5620:	8b 44 24 14          	mov    0x14(%esp),%eax
    5624:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    5628:	8b 50 04             	mov    0x4(%eax),%edx
    562b:	83 fa 01             	cmp    $0x1,%edx
    562e:	74 02                	je     5632 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x22>
    5630:	85 d2                	test   %edx,%edx
    5632:	89 04 24             	mov    %eax,(%esp)
    5635:	8d 93 f0 fe ff ff    	lea    -0x110(%ebx),%edx
    563b:	e8 10 f8 ff ff       	call   4e50 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    5640:	83 c4 08             	add    $0x8,%esp
    5643:	5b                   	pop    %ebx
    5644:	c3                   	ret
    5645:	66 90                	xchg   %ax,%ax
    5647:	66 90                	xchg   %ax,%ax
    5649:	66 90                	xchg   %ax,%ax
    564b:	66 90                	xchg   %ax,%ax
    564d:	66 90                	xchg   %ax,%ax
    564f:	90                   	nop

00005650 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E>:
    5650:	53                   	push   %ebx
    5651:	57                   	push   %edi
    5652:	56                   	push   %esi
    5653:	81 ec 80 00 00 00    	sub    $0x80,%esp
    5659:	e8 00 00 00 00       	call   565e <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0xe>
    565e:	5b                   	pop    %ebx
    565f:	81 c3 96 29 00 00    	add    $0x2996,%ebx
    5665:	8b 8c 24 94 00 00 00 	mov    0x94(%esp),%ecx
    566c:	8b 84 24 90 00 00 00 	mov    0x90(%esp),%eax
    5673:	8b 00                	mov    (%eax),%eax
    5675:	ba 81 00 00 00       	mov    $0x81,%edx
    567a:	eb 1a                	jmp    5696 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x46>
    567c:	90                   	nop
    567d:	90                   	nop
    567e:	90                   	nop
    567f:	90                   	nop
    5680:	80 c2 37             	add    $0x37,%dl
    5683:	89 c7                	mov    %eax,%edi
    5685:	c1 ef 04             	shr    $0x4,%edi
    5688:	88 54 34 fe          	mov    %dl,-0x2(%esp,%esi,1)
    568c:	8d 56 ff             	lea    -0x1(%esi),%edx
    568f:	83 f8 0f             	cmp    $0xf,%eax
    5692:	89 f8                	mov    %edi,%eax
    5694:	76 11                	jbe    56a7 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x57>
    5696:	89 d6                	mov    %edx,%esi
    5698:	89 c2                	mov    %eax,%edx
    569a:	80 e2 0f             	and    $0xf,%dl
    569d:	80 fa 0a             	cmp    $0xa,%dl
    56a0:	73 de                	jae    5680 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x30>
    56a2:	80 ca 30             	or     $0x30,%dl
    56a5:	eb dc                	jmp    5683 <_ZN4core3fmt3num55_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$usize$GT$3fmt17h387a40616dc23209E+0x33>
    56a7:	83 c6 fe             	add    $0xfffffffe,%esi
    56aa:	8d 04 34             	lea    (%esp,%esi,1),%eax
    56ad:	be 81 00 00 00       	mov    $0x81,%esi
    56b2:	29 d6                	sub    %edx,%esi
    56b4:	8d bb f1 eb ff ff    	lea    -0x140f(%ebx),%edi
    56ba:	ba 01 00 00 00       	mov    $0x1,%edx
    56bf:	56                   	push   %esi
    56c0:	50                   	push   %eax
    56c1:	6a 02                	push   $0x2
    56c3:	57                   	push   %edi
    56c4:	e8 a7 ee ff ff       	call   4570 <_ZN4core3fmt9Formatter12pad_integral17h098dc4ffcfaf833fE>
    56c9:	81 c4 90 00 00 00    	add    $0x90,%esp
    56cf:	5e                   	pop    %esi
    56d0:	5f                   	pop    %edi
    56d1:	5b                   	pop    %ebx
    56d2:	c3                   	ret
    56d3:	66 90                	xchg   %ax,%ax
    56d5:	66 90                	xchg   %ax,%ax
    56d7:	66 90                	xchg   %ax,%ax
    56d9:	66 90                	xchg   %ax,%ax
    56db:	66 90                	xchg   %ax,%ax
    56dd:	66 90                	xchg   %ax,%ax
    56df:	90                   	nop

000056e0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h66eca3aabc4e6005E>:
    56e0:	53                   	push   %ebx
    56e1:	56                   	push   %esi
    56e2:	50                   	push   %eax
    56e3:	e8 00 00 00 00       	call   56e8 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h66eca3aabc4e6005E+0x8>
    56e8:	5b                   	pop    %ebx
    56e9:	81 c3 0c 29 00 00    	add    $0x290c,%ebx
    56ef:	8b 44 24 14          	mov    0x14(%esp),%eax
    56f3:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    56f7:	8b 11                	mov    (%ecx),%edx
    56f9:	89 d6                	mov    %edx,%esi
    56fb:	c1 fe 1f             	sar    $0x1f,%esi
    56fe:	89 d1                	mov    %edx,%ecx
    5700:	31 f1                	xor    %esi,%ecx
    5702:	29 f1                	sub    %esi,%ecx
    5704:	89 04 24             	mov    %eax,(%esp)
    5707:	f7 d2                	not    %edx
    5709:	c1 ea 1f             	shr    $0x1f,%edx
    570c:	e8 8f f9 ff ff       	call   50a0 <_ZN4core3fmt3num3imp21_$LT$impl$u20$u32$GT$4_fmt17hdffe7231dcb733e5E>
    5711:	83 c4 04             	add    $0x4,%esp
    5714:	5e                   	pop    %esi
    5715:	5b                   	pop    %ebx
    5716:	c3                   	ret
    5717:	66 90                	xchg   %ax,%ax
    5719:	66 90                	xchg   %ax,%ax
    571b:	66 90                	xchg   %ax,%ax
    571d:	66 90                	xchg   %ax,%ax
    571f:	90                   	nop

00005720 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E>:
    5720:	53                   	push   %ebx
    5721:	83 ec 58             	sub    $0x58,%esp
    5724:	e8 00 00 00 00       	call   5729 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x9>
    5729:	5b                   	pop    %ebx
    572a:	81 c3 cb 28 00 00    	add    $0x28cb,%ebx
    5730:	89 0c 24             	mov    %ecx,(%esp)
    5733:	85 c9                	test   %ecx,%ecx
    5735:	0f 84 d7 01 00 00    	je     5912 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    573b:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    5741:	83 f8 03             	cmp    $0x3,%eax
    5744:	0f 86 cd 00 00 00    	jbe    5817 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xf7>
    574a:	89 e0                	mov    %esp,%eax
    574c:	89 44 24 04          	mov    %eax,0x4(%esp)
    5750:	8d 83 5c d6 ff ff    	lea    -0x29a4(%ebx),%eax
    5756:	89 44 24 08          	mov    %eax,0x8(%esp)
    575a:	c7 44 24 34 04 00 00 	movl   $0x4,0x34(%esp)
    5761:	00 
    5762:	8d 83 3b ed ff ff    	lea    -0x12c5(%ebx),%eax
    5768:	89 44 24 38          	mov    %eax,0x38(%esp)
    576c:	c7 44 24 3c 1c 00 00 	movl   $0x1c,0x3c(%esp)
    5773:	00 
    5774:	8d 8b 08 ff ff ff    	lea    -0xf8(%ebx),%ecx
    577a:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    577e:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5785:	00 
    5786:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    578a:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    578e:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    5795:	00 
    5796:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    579d:	00 
    579e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    57a5:	00 
    57a6:	89 44 24 20          	mov    %eax,0x20(%esp)
    57aa:	c7 44 24 24 1c 00 00 	movl   $0x1c,0x24(%esp)
    57b1:	00 
    57b2:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    57b9:	00 
    57ba:	8d 83 d3 ec ff ff    	lea    -0x132d(%ebx),%eax
    57c0:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    57c4:	c7 44 24 30 4b 00 00 	movl   $0x4b,0x30(%esp)
    57cb:	00 
    57cc:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    57d3:	00 
    57d4:	c7 44 24 18 51 00 00 	movl   $0x51,0x18(%esp)
    57db:	00 
    57dc:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    57e2:	83 f8 02             	cmp    $0x2,%eax
    57e5:	74 10                	je     57f7 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xd7>
    57e7:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    57ed:	75 10                	jne    57ff <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xdf>
    57ef:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    57f5:	eb 0e                	jmp    5805 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xe5>
    57f7:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    57fd:	74 f0                	je     57ef <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0xcf>
    57ff:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    5805:	83 ec 08             	sub    $0x8,%esp
    5808:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    580c:	52                   	push   %edx
    580d:	51                   	push   %ecx
    580e:	ff 50 10             	call   *0x10(%eax)
    5811:	83 c4 10             	add    $0x10,%esp
    5814:	8b 0c 24             	mov    (%esp),%ecx
    5817:	89 ca                	mov    %ecx,%edx
    5819:	b8 8d 00 00 00       	mov    $0x8d,%eax
    581e:	cd 80                	int    $0x80
    5820:	8d 48 ff             	lea    -0x1(%eax),%ecx
    5823:	83 f9 0a             	cmp    $0xa,%ecx
    5826:	0f 83 eb 00 00 00    	jae    5917 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f7>
    582c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5830:	8d 44 24 0c          	lea    0xc(%esp),%eax
    5834:	89 44 24 10          	mov    %eax,0x10(%esp)
    5838:	8b 83 14 50 00 00    	mov    0x5014(%ebx),%eax
    583e:	85 c0                	test   %eax,%eax
    5840:	0f 84 cc 00 00 00    	je     5912 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    5846:	8d 44 24 10          	lea    0x10(%esp),%eax
    584a:	89 44 24 04          	mov    %eax,0x4(%esp)
    584e:	8d 83 3c d9 ff ff    	lea    -0x26c4(%ebx),%eax
    5854:	89 44 24 08          	mov    %eax,0x8(%esp)
    5858:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%esp)
    585f:	00 
    5860:	8d 83 3b ed ff ff    	lea    -0x12c5(%ebx),%eax
    5866:	89 44 24 38          	mov    %eax,0x38(%esp)
    586a:	c7 44 24 3c 1c 00 00 	movl   $0x1c,0x3c(%esp)
    5871:	00 
    5872:	8d 8b 10 ff ff ff    	lea    -0xf0(%ebx),%ecx
    5878:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    587c:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    5883:	00 
    5884:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    5888:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    588c:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    5893:	00 
    5894:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    589b:	00 
    589c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    58a3:	00 
    58a4:	89 44 24 20          	mov    %eax,0x20(%esp)
    58a8:	c7 44 24 24 1c 00 00 	movl   $0x1c,0x24(%esp)
    58af:	00 
    58b0:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    58b7:	00 
    58b8:	8d 83 d3 ec ff ff    	lea    -0x132d(%ebx),%eax
    58be:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    58c2:	c7 44 24 30 4b 00 00 	movl   $0x4b,0x30(%esp)
    58c9:	00 
    58ca:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    58d1:	00 
    58d2:	c7 44 24 18 59 00 00 	movl   $0x59,0x18(%esp)
    58d9:	00 
    58da:	8b 83 10 50 00 00    	mov    0x5010(%ebx),%eax
    58e0:	83 f8 02             	cmp    $0x2,%eax
    58e3:	74 10                	je     58f5 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1d5>
    58e5:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    58eb:	75 10                	jne    58fd <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1dd>
    58ed:	8b 8b 24 00 00 00    	mov    0x24(%ebx),%ecx
    58f3:	eb 0e                	jmp    5903 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1e3>
    58f5:	8b 83 28 00 00 00    	mov    0x28(%ebx),%eax
    58fb:	74 f0                	je     58ed <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1cd>
    58fd:	8d 8b 10 ee ff ff    	lea    -0x11f0(%ebx),%ecx
    5903:	83 ec 08             	sub    $0x8,%esp
    5906:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    590a:	52                   	push   %edx
    590b:	51                   	push   %ecx
    590c:	ff 50 10             	call   *0x10(%eax)
    590f:	83 c4 10             	add    $0x10,%esp
    5912:	83 c4 58             	add    $0x58,%esp
    5915:	5b                   	pop    %ebx
    5916:	c3                   	ret
    5917:	85 c0                	test   %eax,%eax
    5919:	b8 42 00 00 00       	mov    $0x42,%eax
    591e:	74 f2                	je     5912 <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x1f2>
    5920:	e9 07 ff ff ff       	jmp    582c <_ZN81_$LT$kernel_types..object..handle..RawHandle$u20$as$u20$core..ops..drop..Drop$GT$4drop17h3ae0020523155c57E+0x10c>
    5925:	66 90                	xchg   %ax,%ax
    5927:	66 90                	xchg   %ax,%ax
    5929:	66 90                	xchg   %ax,%ax
    592b:	66 90                	xchg   %ax,%ax
    592d:	66 90                	xchg   %ax,%ax
    592f:	90                   	nop

00005930 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE>:
    5930:	53                   	push   %ebx
    5931:	56                   	push   %esi
    5932:	50                   	push   %eax
    5933:	e8 00 00 00 00       	call   5938 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0x8>
    5938:	5b                   	pop    %ebx
    5939:	81 c3 bc 26 00 00    	add    $0x26bc,%ebx
    593f:	8b 44 24 10          	mov    0x10(%esp),%eax
    5943:	8b 00                	mov    (%eax),%eax
    5945:	8b 10                	mov    (%eax),%edx
    5947:	8d 83 78 ed ff ff    	lea    -0x1288(%ebx),%eax
    594d:	b9 0c 00 00 00       	mov    $0xc,%ecx
    5952:	4a                   	dec    %edx
    5953:	8b 94 93 a4 e4 ff ff 	mov    -0x1b5c(%ebx,%edx,4),%edx
    595a:	01 da                	add    %ebx,%edx
    595c:	ff e2                	jmp    *%edx
    595e:	8d 83 84 ed ff ff    	lea    -0x127c(%ebx),%eax
    5964:	b9 0b 00 00 00       	mov    $0xb,%ecx
    5969:	eb 69                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    596b:	8d 83 f5 e9 ff ff    	lea    -0x160b(%ebx),%eax
    5971:	b9 08 00 00 00       	mov    $0x8,%ecx
    5976:	eb 5c                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    5978:	8d 83 e9 ed ff ff    	lea    -0x1217(%ebx),%eax
    597e:	b9 0f 00 00 00       	mov    $0xf,%ecx
    5983:	eb 4f                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    5985:	8d 83 8f ed ff ff    	lea    -0x1271(%ebx),%eax
    598b:	b9 0f 00 00 00       	mov    $0xf,%ecx
    5990:	eb 42                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    5992:	8d 83 9e ed ff ff    	lea    -0x1262(%ebx),%eax
    5998:	eb 3a                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    599a:	8d 83 ba ed ff ff    	lea    -0x1246(%ebx),%eax
    59a0:	b9 10 00 00 00       	mov    $0x10,%ecx
    59a5:	eb 2d                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    59a7:	8d 83 f8 ed ff ff    	lea    -0x1208(%ebx),%eax
    59ad:	b9 06 00 00 00       	mov    $0x6,%ecx
    59b2:	eb 20                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    59b4:	8d 83 aa ed ff ff    	lea    -0x1256(%ebx),%eax
    59ba:	b9 10 00 00 00       	mov    $0x10,%ecx
    59bf:	eb 13                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    59c1:	8d 83 ca ed ff ff    	lea    -0x1236(%ebx),%eax
    59c7:	eb 0b                	jmp    59d4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17hde0b5db60348c27dE+0xa4>
    59c9:	8d 83 d6 ed ff ff    	lea    -0x122a(%ebx),%eax
    59cf:	b9 13 00 00 00       	mov    $0x13,%ecx
    59d4:	8b 54 24 14          	mov    0x14(%esp),%edx
    59d8:	8b 72 04             	mov    0x4(%edx),%esi
    59db:	83 ec 04             	sub    $0x4,%esp
    59de:	51                   	push   %ecx
    59df:	50                   	push   %eax
    59e0:	ff 32                	push   (%edx)
    59e2:	ff 56 0c             	call   *0xc(%esi)
    59e5:	83 c4 14             	add    $0x14,%esp
    59e8:	5e                   	pop    %esi
    59e9:	5b                   	pop    %ebx
    59ea:	c3                   	ret
    59eb:	0f 0b                	ud2
    59ed:	66 90                	xchg   %ax,%ax
    59ef:	90                   	nop

000059f0 <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E>:
    59f0:	89 c8                	mov    %ecx,%eax
    59f2:	83 f9 0b             	cmp    $0xb,%ecx
    59f5:	72 05                	jb     59fc <_ZN79_$LT$kernel_types..syscall..SyscallError$u20$as$u20$num_enum..FromPrimitive$GT$14from_primitive17h002ef1ea9aba70d5E+0xc>
    59f7:	b8 42 00 00 00       	mov    $0x42,%eax
    59fc:	c3                   	ret
    59fd:	66 90                	xchg   %ax,%ax
    59ff:	90                   	nop

00005a00 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E>:
    5a00:	53                   	push   %ebx
    5a01:	83 ec 08             	sub    $0x8,%esp
    5a04:	e8 00 00 00 00       	call   5a09 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E+0x9>
    5a09:	5b                   	pop    %ebx
    5a0a:	81 c3 eb 25 00 00    	add    $0x25eb,%ebx
    5a10:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    5a14:	8b 44 24 10          	mov    0x10(%esp),%eax
    5a18:	8b 00                	mov    (%eax),%eax
    5a1a:	8b 94 c3 30 ff ff ff 	mov    -0xd0(%ebx,%eax,8),%edx
    5a21:	8b 84 c3 34 ff ff ff 	mov    -0xcc(%ebx,%eax,8),%eax
    5a28:	89 04 24             	mov    %eax,(%esp)
    5a2b:	e8 40 ee ff ff       	call   4870 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    5a30:	83 c4 08             	add    $0x8,%esp
    5a33:	5b                   	pop    %ebx
    5a34:	c3                   	ret
    5a35:	66 90                	xchg   %ax,%ax
    5a37:	66 90                	xchg   %ax,%ax
    5a39:	66 90                	xchg   %ax,%ax
    5a3b:	66 90                	xchg   %ax,%ax
    5a3d:	66 90                	xchg   %ax,%ax
    5a3f:	90                   	nop

00005a40 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$7enabled17h7c1fbd7539bc5801E>:
    5a40:	31 c0                	xor    %eax,%eax
    5a42:	c3                   	ret
    5a43:	66 90                	xchg   %ax,%ax
    5a45:	66 90                	xchg   %ax,%ax
    5a47:	66 90                	xchg   %ax,%ax
    5a49:	66 90                	xchg   %ax,%ax
    5a4b:	66 90                	xchg   %ax,%ax
    5a4d:	66 90                	xchg   %ax,%ax
    5a4f:	90                   	nop

00005a50 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$3log17hb129cc8b65bcebf0E>:
    5a50:	c3                   	ret
    5a51:	66 90                	xchg   %ax,%ax
    5a53:	66 90                	xchg   %ax,%ax
    5a55:	66 90                	xchg   %ax,%ax
    5a57:	66 90                	xchg   %ax,%ax
    5a59:	66 90                	xchg   %ax,%ax
    5a5b:	66 90                	xchg   %ax,%ax
    5a5d:	66 90                	xchg   %ax,%ax
    5a5f:	90                   	nop

00005a60 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$5flush17hb87dc07497484b4cE>:
    5a60:	c3                   	ret
    5a61:	66 90                	xchg   %ax,%ax
    5a63:	66 90                	xchg   %ax,%ax
    5a65:	66 90                	xchg   %ax,%ax
    5a67:	66 90                	xchg   %ax,%ax
    5a69:	66 90                	xchg   %ax,%ax
    5a6b:	66 90                	xchg   %ax,%ax
    5a6d:	66 90                	xchg   %ax,%ax
    5a6f:	90                   	nop

00005a70 <memcpy>:
    5a70:	55                   	push   %ebp
    5a71:	53                   	push   %ebx
    5a72:	57                   	push   %edi
    5a73:	56                   	push   %esi
    5a74:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    5a78:	8b 54 24 18          	mov    0x18(%esp),%edx
    5a7c:	8b 44 24 14          	mov    0x14(%esp),%eax
    5a80:	89 c6                	mov    %eax,%esi
    5a82:	83 fd 10             	cmp    $0x10,%ebp
    5a85:	72 63                	jb     5aea <memcpy+0x7a>
    5a87:	f7 de                	neg    %esi
    5a89:	83 e6 03             	and    $0x3,%esi
    5a8c:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    5a8f:	39 f8                	cmp    %edi,%eax
    5a91:	73 19                	jae    5aac <memcpy+0x3c>
    5a93:	31 db                	xor    %ebx,%ebx
    5a95:	90                   	nop
    5a96:	90                   	nop
    5a97:	90                   	nop
    5a98:	90                   	nop
    5a99:	90                   	nop
    5a9a:	90                   	nop
    5a9b:	90                   	nop
    5a9c:	90                   	nop
    5a9d:	90                   	nop
    5a9e:	90                   	nop
    5a9f:	90                   	nop
    5aa0:	0f b6 0c 1a          	movzbl (%edx,%ebx,1),%ecx
    5aa4:	88 0c 18             	mov    %cl,(%eax,%ebx,1)
    5aa7:	43                   	inc    %ebx
    5aa8:	39 de                	cmp    %ebx,%esi
    5aaa:	75 f4                	jne    5aa0 <memcpy+0x30>
    5aac:	01 f2                	add    %esi,%edx
    5aae:	29 f5                	sub    %esi,%ebp
    5ab0:	89 e8                	mov    %ebp,%eax
    5ab2:	89 eb                	mov    %ebp,%ebx
    5ab4:	83 e3 fc             	and    $0xfffffffc,%ebx
    5ab7:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
    5aba:	f6 c2 03             	test   $0x3,%dl
    5abd:	75 52                	jne    5b11 <memcpy+0xa1>
    5abf:	39 f7                	cmp    %esi,%edi
    5ac1:	73 1c                	jae    5adf <memcpy+0x6f>
    5ac3:	89 d5                	mov    %edx,%ebp
    5ac5:	90                   	nop
    5ac6:	90                   	nop
    5ac7:	90                   	nop
    5ac8:	90                   	nop
    5ac9:	90                   	nop
    5aca:	90                   	nop
    5acb:	90                   	nop
    5acc:	90                   	nop
    5acd:	90                   	nop
    5ace:	90                   	nop
    5acf:	90                   	nop
    5ad0:	8b 4d 00             	mov    0x0(%ebp),%ecx
    5ad3:	89 0f                	mov    %ecx,(%edi)
    5ad5:	83 c7 04             	add    $0x4,%edi
    5ad8:	83 c5 04             	add    $0x4,%ebp
    5adb:	39 f7                	cmp    %esi,%edi
    5add:	72 f1                	jb     5ad0 <memcpy+0x60>
    5adf:	01 da                	add    %ebx,%edx
    5ae1:	89 c5                	mov    %eax,%ebp
    5ae3:	83 e5 03             	and    $0x3,%ebp
    5ae6:	8b 44 24 14          	mov    0x14(%esp),%eax
    5aea:	8d 3c 2e             	lea    (%esi,%ebp,1),%edi
    5aed:	39 fe                	cmp    %edi,%esi
    5aef:	73 1b                	jae    5b0c <memcpy+0x9c>
    5af1:	31 ff                	xor    %edi,%edi
    5af3:	90                   	nop
    5af4:	90                   	nop
    5af5:	90                   	nop
    5af6:	90                   	nop
    5af7:	90                   	nop
    5af8:	90                   	nop
    5af9:	90                   	nop
    5afa:	90                   	nop
    5afb:	90                   	nop
    5afc:	90                   	nop
    5afd:	90                   	nop
    5afe:	90                   	nop
    5aff:	90                   	nop
    5b00:	0f b6 0c 3a          	movzbl (%edx,%edi,1),%ecx
    5b04:	88 0c 3e             	mov    %cl,(%esi,%edi,1)
    5b07:	47                   	inc    %edi
    5b08:	39 fd                	cmp    %edi,%ebp
    5b0a:	75 f4                	jne    5b00 <memcpy+0x90>
    5b0c:	5e                   	pop    %esi
    5b0d:	5f                   	pop    %edi
    5b0e:	5b                   	pop    %ebx
    5b0f:	5d                   	pop    %ebp
    5b10:	c3                   	ret
    5b11:	39 f7                	cmp    %esi,%edi
    5b13:	73 ca                	jae    5adf <memcpy+0x6f>
    5b15:	89 d5                	mov    %edx,%ebp
    5b17:	8b 4d 00             	mov    0x0(%ebp),%ecx
    5b1a:	89 0f                	mov    %ecx,(%edi)
    5b1c:	83 c7 04             	add    $0x4,%edi
    5b1f:	83 c5 04             	add    $0x4,%ebp
    5b22:	39 f7                	cmp    %esi,%edi
    5b24:	72 f1                	jb     5b17 <memcpy+0xa7>
    5b26:	eb b7                	jmp    5adf <memcpy+0x6f>
    5b28:	66 90                	xchg   %ax,%ax
    5b2a:	66 90                	xchg   %ax,%ax
    5b2c:	66 90                	xchg   %ax,%ax
    5b2e:	66 90                	xchg   %ax,%ax

00005b30 <memset>:
    5b30:	53                   	push   %ebx
    5b31:	57                   	push   %edi
    5b32:	56                   	push   %esi
    5b33:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    5b37:	8b 54 24 14          	mov    0x14(%esp),%edx
    5b3b:	8b 44 24 10          	mov    0x10(%esp),%eax
    5b3f:	89 c6                	mov    %eax,%esi
    5b41:	83 f9 10             	cmp    $0x10,%ecx
    5b44:	72 46                	jb     5b8c <memset+0x5c>
    5b46:	f7 de                	neg    %esi
    5b48:	83 e6 03             	and    $0x3,%esi
    5b4b:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    5b4e:	39 f8                	cmp    %edi,%eax
    5b50:	73 16                	jae    5b68 <memset+0x38>
    5b52:	31 db                	xor    %ebx,%ebx
    5b54:	90                   	nop
    5b55:	90                   	nop
    5b56:	90                   	nop
    5b57:	90                   	nop
    5b58:	90                   	nop
    5b59:	90                   	nop
    5b5a:	90                   	nop
    5b5b:	90                   	nop
    5b5c:	90                   	nop
    5b5d:	90                   	nop
    5b5e:	90                   	nop
    5b5f:	90                   	nop
    5b60:	88 14 18             	mov    %dl,(%eax,%ebx,1)
    5b63:	43                   	inc    %ebx
    5b64:	39 de                	cmp    %ebx,%esi
    5b66:	75 f8                	jne    5b60 <memset+0x30>
    5b68:	29 f1                	sub    %esi,%ecx
    5b6a:	89 ce                	mov    %ecx,%esi
    5b6c:	83 e6 fc             	and    $0xfffffffc,%esi
    5b6f:	01 fe                	add    %edi,%esi
    5b71:	39 f7                	cmp    %esi,%edi
    5b73:	73 14                	jae    5b89 <memset+0x59>
    5b75:	0f b6 da             	movzbl %dl,%ebx
    5b78:	69 db 01 01 01 01    	imul   $0x1010101,%ebx,%ebx
    5b7e:	90                   	nop
    5b7f:	90                   	nop
    5b80:	89 1f                	mov    %ebx,(%edi)
    5b82:	83 c7 04             	add    $0x4,%edi
    5b85:	39 f7                	cmp    %esi,%edi
    5b87:	72 f7                	jb     5b80 <memset+0x50>
    5b89:	83 e1 03             	and    $0x3,%ecx
    5b8c:	8d 3c 0e             	lea    (%esi,%ecx,1),%edi
    5b8f:	39 fe                	cmp    %edi,%esi
    5b91:	73 15                	jae    5ba8 <memset+0x78>
    5b93:	31 ff                	xor    %edi,%edi
    5b95:	90                   	nop
    5b96:	90                   	nop
    5b97:	90                   	nop
    5b98:	90                   	nop
    5b99:	90                   	nop
    5b9a:	90                   	nop
    5b9b:	90                   	nop
    5b9c:	90                   	nop
    5b9d:	90                   	nop
    5b9e:	90                   	nop
    5b9f:	90                   	nop
    5ba0:	88 14 3e             	mov    %dl,(%esi,%edi,1)
    5ba3:	47                   	inc    %edi
    5ba4:	39 f9                	cmp    %edi,%ecx
    5ba6:	75 f8                	jne    5ba0 <memset+0x70>
    5ba8:	5e                   	pop    %esi
    5ba9:	5f                   	pop    %edi
    5baa:	5b                   	pop    %ebx
    5bab:	c3                   	ret

Disassembly of section .interp:

00006000 <.interp>:
    6000:	2f                   	das
    6001:	6c                   	insb   (%dx),%es:(%edi)
    6002:	69 62 2f 6c 64 2d 6c 	imul   $0x6c2d646c,0x2f(%edx),%esp
    6009:	69 6e 75 78 2e 73 6f 	imul   $0x6f732e78,0x75(%esi),%ebp
    6010:	2e 32 00             	xor    %cs:(%eax),%al

Disassembly of section .gnu.hash:

00006014 <.gnu.hash>:
    6014:	01 00                	add    %eax,(%eax)
    6016:	00 00                	add    %al,(%eax)
    6018:	01 00                	add    %eax,(%eax)
    601a:	00 00                	add    %al,(%eax)
    601c:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .dynsym:

0000602c <.dynsym>:
	...

Disassembly of section .dynstr:

0000603c <.dynstr>:
	...

Disassembly of section .rel.dyn:

00006040 <.rel.dyn>:
    6040:	0c 7d                	or     $0x7d,%al
    6042:	00 00                	add    %al,(%eax)
    6044:	08 00                	or     %al,(%eax)
    6046:	00 00                	add    %al,(%eax)
    6048:	20 7d 00             	and    %bh,0x0(%ebp)
    604b:	00 08                	add    %cl,(%eax)
    604d:	00 00                	add    %al,(%eax)
    604f:	00 24 7d 00 00 08 00 	add    %ah,0x80000(,%edi,2)
    6056:	00 00                	add    %al,(%eax)
    6058:	30 7d 00             	xor    %bh,0x0(%ebp)
    605b:	00 08                	add    %cl,(%eax)
    605d:	00 00                	add    %al,(%eax)
    605f:	00 34 7d 00 00 08 00 	add    %dh,0x80000(,%edi,2)
    6066:	00 00                	add    %al,(%eax)
    6068:	38 7d 00             	cmp    %bh,0x0(%ebp)
    606b:	00 08                	add    %cl,(%eax)
    606d:	00 00                	add    %al,(%eax)
    606f:	00 3c 7d 00 00 08 00 	add    %bh,0x80000(,%edi,2)
    6076:	00 00                	add    %al,(%eax)
    6078:	4c                   	dec    %esp
    6079:	7d 00                	jge    607b <memset+0x54b>
    607b:	00 08                	add    %cl,(%eax)
    607d:	00 00                	add    %al,(%eax)
    607f:	00 58 7d             	add    %bl,0x7d(%eax)
    6082:	00 00                	add    %al,(%eax)
    6084:	08 00                	or     %al,(%eax)
    6086:	00 00                	add    %al,(%eax)
    6088:	5c                   	pop    %esp
    6089:	7d 00                	jge    608b <memset+0x55b>
    608b:	00 08                	add    %cl,(%eax)
    608d:	00 00                	add    %al,(%eax)
    608f:	00 60 7d             	add    %ah,0x7d(%eax)
    6092:	00 00                	add    %al,(%eax)
    6094:	08 00                	or     %al,(%eax)
    6096:	00 00                	add    %al,(%eax)
    6098:	64 7d 00             	fs jge 609b <memset+0x56b>
    609b:	00 08                	add    %cl,(%eax)
    609d:	00 00                	add    %al,(%eax)
    609f:	00 6c 7d 00          	add    %ch,0x0(%ebp,%edi,2)
    60a3:	00 08                	add    %cl,(%eax)
    60a5:	00 00                	add    %al,(%eax)
    60a7:	00 74 7d 00          	add    %dh,0x0(%ebp,%edi,2)
    60ab:	00 08                	add    %cl,(%eax)
    60ad:	00 00                	add    %al,(%eax)
    60af:	00 7c 7d 00          	add    %bh,0x0(%ebp,%edi,2)
    60b3:	00 08                	add    %cl,(%eax)
    60b5:	00 00                	add    %al,(%eax)
    60b7:	00 84 7d 00 00 08 00 	add    %al,0x80000(%ebp,%edi,2)
    60be:	00 00                	add    %al,(%eax)
    60c0:	94                   	xchg   %eax,%esp
    60c1:	7d 00                	jge    60c3 <memset+0x593>
    60c3:	00 08                	add    %cl,(%eax)
    60c5:	00 00                	add    %al,(%eax)
    60c7:	00 a4 7d 00 00 08 00 	add    %ah,0x80000(%ebp,%edi,2)
    60ce:	00 00                	add    %al,(%eax)
    60d0:	ac                   	lods   %ds:(%esi),%al
    60d1:	7d 00                	jge    60d3 <memset+0x5a3>
    60d3:	00 08                	add    %cl,(%eax)
    60d5:	00 00                	add    %al,(%eax)
    60d7:	00 b4 7d 00 00 08 00 	add    %dh,0x80000(%ebp,%edi,2)
    60de:	00 00                	add    %al,(%eax)
    60e0:	bc 7d 00 00 08       	mov    $0x800007d,%esp
    60e5:	00 00                	add    %al,(%eax)
    60e7:	00 cc                	add    %cl,%ah
    60e9:	7d 00                	jge    60eb <memset+0x5bb>
    60eb:	00 08                	add    %cl,(%eax)
    60ed:	00 00                	add    %al,(%eax)
    60ef:	00 dc                	add    %bl,%ah
    60f1:	7d 00                	jge    60f3 <memset+0x5c3>
    60f3:	00 08                	add    %cl,(%eax)
    60f5:	00 00                	add    %al,(%eax)
    60f7:	00 e4                	add    %ah,%ah
    60f9:	7d 00                	jge    60fb <memset+0x5cb>
    60fb:	00 08                	add    %cl,(%eax)
    60fd:	00 00                	add    %al,(%eax)
    60ff:	00 f4                	add    %dh,%ah
    6101:	7d 00                	jge    6103 <memset+0x5d3>
    6103:	00 08                	add    %cl,(%eax)
    6105:	00 00                	add    %al,(%eax)
    6107:	00 fc                	add    %bh,%ah
    6109:	7d 00                	jge    610b <memset+0x5db>
    610b:	00 08                	add    %cl,(%eax)
    610d:	00 00                	add    %al,(%eax)
    610f:	00 04 7e             	add    %al,(%esi,%edi,2)
    6112:	00 00                	add    %al,(%eax)
    6114:	08 00                	or     %al,(%eax)
    6116:	00 00                	add    %al,(%eax)
    6118:	0c 7e                	or     $0x7e,%al
    611a:	00 00                	add    %al,(%eax)
    611c:	08 00                	or     %al,(%eax)
    611e:	00 00                	add    %al,(%eax)
    6120:	14 7e                	adc    $0x7e,%al
    6122:	00 00                	add    %al,(%eax)
    6124:	08 00                	or     %al,(%eax)
    6126:	00 00                	add    %al,(%eax)
    6128:	1c 7e                	sbb    $0x7e,%al
    612a:	00 00                	add    %al,(%eax)
    612c:	08 00                	or     %al,(%eax)
    612e:	00 00                	add    %al,(%eax)
    6130:	24 7e                	and    $0x7e,%al
    6132:	00 00                	add    %al,(%eax)
    6134:	08 00                	or     %al,(%eax)
    6136:	00 00                	add    %al,(%eax)
    6138:	2c 7e                	sub    $0x7e,%al
    613a:	00 00                	add    %al,(%eax)
    613c:	08 00                	or     %al,(%eax)
    613e:	00 00                	add    %al,(%eax)
    6140:	34 7e                	xor    $0x7e,%al
    6142:	00 00                	add    %al,(%eax)
    6144:	08 00                	or     %al,(%eax)
    6146:	00 00                	add    %al,(%eax)
    6148:	3c 7e                	cmp    $0x7e,%al
    614a:	00 00                	add    %al,(%eax)
    614c:	08 00                	or     %al,(%eax)
    614e:	00 00                	add    %al,(%eax)
    6150:	58                   	pop    %eax
    6151:	7e 00                	jle    6153 <memset+0x623>
    6153:	00 08                	add    %cl,(%eax)
    6155:	00 00                	add    %al,(%eax)
    6157:	00 68 7e             	add    %ch,0x7e(%eax)
    615a:	00 00                	add    %al,(%eax)
    615c:	08 00                	or     %al,(%eax)
    615e:	00 00                	add    %al,(%eax)
    6160:	6c                   	insb   (%dx),%es:(%edi)
    6161:	7e 00                	jle    6163 <memset+0x633>
    6163:	00 08                	add    %cl,(%eax)
    6165:	00 00                	add    %al,(%eax)
    6167:	00 7c 7e 00          	add    %bh,0x0(%esi,%edi,2)
    616b:	00 08                	add    %cl,(%eax)
    616d:	00 00                	add    %al,(%eax)
    616f:	00 8c 7e 00 00 08 00 	add    %cl,0x80000(%esi,%edi,2)
    6176:	00 00                	add    %al,(%eax)
    6178:	94                   	xchg   %eax,%esp
    6179:	7e 00                	jle    617b <memset+0x64b>
    617b:	00 08                	add    %cl,(%eax)
    617d:	00 00                	add    %al,(%eax)
    617f:	00 a4 7e 00 00 08 00 	add    %ah,0x80000(%esi,%edi,2)
    6186:	00 00                	add    %al,(%eax)
    6188:	b4 7e                	mov    $0x7e,%ah
    618a:	00 00                	add    %al,(%eax)
    618c:	08 00                	or     %al,(%eax)
    618e:	00 00                	add    %al,(%eax)
    6190:	bc 7e 00 00 08       	mov    $0x800007e,%esp
    6195:	00 00                	add    %al,(%eax)
    6197:	00 c4                	add    %al,%ah
    6199:	7e 00                	jle    619b <memset+0x66b>
    619b:	00 08                	add    %cl,(%eax)
    619d:	00 00                	add    %al,(%eax)
    619f:	00 cc                	add    %cl,%ah
    61a1:	7e 00                	jle    61a3 <memset+0x673>
    61a3:	00 08                	add    %cl,(%eax)
    61a5:	00 00                	add    %al,(%eax)
    61a7:	00 dc                	add    %bl,%ah
    61a9:	7e 00                	jle    61ab <memset+0x67b>
    61ab:	00 08                	add    %cl,(%eax)
    61ad:	00 00                	add    %al,(%eax)
    61af:	00 f0                	add    %dh,%al
    61b1:	7e 00                	jle    61b3 <memset+0x683>
    61b3:	00 08                	add    %cl,(%eax)
    61b5:	00 00                	add    %al,(%eax)
    61b7:	00 f4                	add    %dh,%ah
    61b9:	7e 00                	jle    61bb <memset+0x68b>
    61bb:	00 08                	add    %cl,(%eax)
    61bd:	00 00                	add    %al,(%eax)
    61bf:	00 f8                	add    %bh,%al
    61c1:	7e 00                	jle    61c3 <memset+0x693>
    61c3:	00 08                	add    %cl,(%eax)
    61c5:	00 00                	add    %al,(%eax)
    61c7:	00 fc                	add    %bh,%ah
    61c9:	7e 00                	jle    61cb <memset+0x69b>
    61cb:	00 08                	add    %cl,(%eax)
    61cd:	00 00                	add    %al,(%eax)
    61cf:	00 04 7f             	add    %al,(%edi,%edi,2)
    61d2:	00 00                	add    %al,(%eax)
    61d4:	08 00                	or     %al,(%eax)
    61d6:	00 00                	add    %al,(%eax)
    61d8:	18 7f 00             	sbb    %bh,0x0(%edi)
    61db:	00 08                	add    %cl,(%eax)
    61dd:	00 00                	add    %al,(%eax)
    61df:	00 1c 7f             	add    %bl,(%edi,%edi,2)
    61e2:	00 00                	add    %al,(%eax)
    61e4:	08 00                	or     %al,(%eax)
    61e6:	00 00                	add    %al,(%eax)
    61e8:	20 7f 00             	and    %bh,0x0(%edi)
    61eb:	00 08                	add    %cl,(%eax)
    61ed:	00 00                	add    %al,(%eax)
    61ef:	00 24 7f             	add    %ah,(%edi,%edi,2)
    61f2:	00 00                	add    %al,(%eax)
    61f4:	08 00                	or     %al,(%eax)
    61f6:	00 00                	add    %al,(%eax)
    61f8:	2c 7f                	sub    $0x7f,%al
    61fa:	00 00                	add    %al,(%eax)
    61fc:	08 00                	or     %al,(%eax)
    61fe:	00 00                	add    %al,(%eax)
    6200:	34 7f                	xor    $0x7f,%al
    6202:	00 00                	add    %al,(%eax)
    6204:	08 00                	or     %al,(%eax)
    6206:	00 00                	add    %al,(%eax)
    6208:	3c 7f                	cmp    $0x7f,%al
    620a:	00 00                	add    %al,(%eax)
    620c:	08 00                	or     %al,(%eax)
    620e:	00 00                	add    %al,(%eax)
    6210:	44                   	inc    %esp
    6211:	7f 00                	jg     6213 <memset+0x6e3>
    6213:	00 08                	add    %cl,(%eax)
    6215:	00 00                	add    %al,(%eax)
    6217:	00 4c 7f 00          	add    %cl,0x0(%edi,%edi,2)
    621b:	00 08                	add    %cl,(%eax)
    621d:	00 00                	add    %al,(%eax)
    621f:	00 54 7f 00          	add    %dl,0x0(%edi,%edi,2)
    6223:	00 08                	add    %cl,(%eax)
    6225:	00 00                	add    %al,(%eax)
    6227:	00 5c 7f 00          	add    %bl,0x0(%edi,%edi,2)
    622b:	00 08                	add    %cl,(%eax)
    622d:	00 00                	add    %al,(%eax)
    622f:	00 04 80             	add    %al,(%eax,%eax,4)
    6232:	00 00                	add    %al,(%eax)
    6234:	08 00                	or     %al,(%eax)
    6236:	00 00                	add    %al,(%eax)
    6238:	08 80 00 00 08 00    	or     %al,0x80000(%eax)
    623e:	00 00                	add    %al,(%eax)
    6240:	1c 80                	sbb    $0x80,%al
    6242:	00 00                	add    %al,(%eax)
    6244:	08 00                	or     %al,(%eax)
	...

Disassembly of section .rodata:

00006248 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE-0x440>:
    6248:	ce                   	into
    6249:	a3 ff ff 58 a3       	mov    %eax,0xa358ffff
    624e:	ff                   	(bad)
    624f:	ff                   	(bad)
    6250:	7f a3                	jg     61f5 <memset+0x6c5>
    6252:	ff                   	(bad)
    6253:	ff 8c a3 ff ff 65 a3 	decl   -0x5c9a0001(%ebx,%eiz,4)
    625a:	ff                   	(bad)
    625b:	ff ae a3 ff ff bb    	ljmp   *-0x4400005d(%esi)
    6261:	a3 ff ff 94 a3       	mov    %eax,0xa394ffff
    6266:	ff                   	(bad)
    6267:	ff c3                	inc    %ebx
    6269:	a3 ff ff 72 a3       	mov    %eax,0xa372ffff
    626e:	ff                   	(bad)
    626f:	ff e5                	jmp    *%ebp
    6271:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6276:	ff                   	(bad)
    6277:	ff e5                	jmp    *%ebp
    6279:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    627e:	ff                   	(bad)
    627f:	ff e5                	jmp    *%ebp
    6281:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6286:	ff                   	(bad)
    6287:	ff e5                	jmp    *%ebp
    6289:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    628e:	ff                   	(bad)
    628f:	ff e5                	jmp    *%ebp
    6291:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6296:	ff                   	(bad)
    6297:	ff e5                	jmp    *%ebp
    6299:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    629e:	ff                   	(bad)
    629f:	ff e5                	jmp    *%ebp
    62a1:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62a6:	ff                   	(bad)
    62a7:	ff e5                	jmp    *%ebp
    62a9:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62ae:	ff                   	(bad)
    62af:	ff e5                	jmp    *%ebp
    62b1:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62b6:	ff                   	(bad)
    62b7:	ff e5                	jmp    *%ebp
    62b9:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62be:	ff                   	(bad)
    62bf:	ff e5                	jmp    *%ebp
    62c1:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62c6:	ff                   	(bad)
    62c7:	ff e5                	jmp    *%ebp
    62c9:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62ce:	ff                   	(bad)
    62cf:	ff e5                	jmp    *%ebp
    62d1:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62d6:	ff                   	(bad)
    62d7:	ff e5                	jmp    *%ebp
    62d9:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62de:	ff                   	(bad)
    62df:	ff e5                	jmp    *%ebp
    62e1:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62e6:	ff                   	(bad)
    62e7:	ff e5                	jmp    *%ebp
    62e9:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62ee:	ff                   	(bad)
    62ef:	ff e5                	jmp    *%ebp
    62f1:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62f6:	ff                   	(bad)
    62f7:	ff e5                	jmp    *%ebp
    62f9:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    62fe:	ff                   	(bad)
    62ff:	ff e5                	jmp    *%ebp
    6301:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6306:	ff                   	(bad)
    6307:	ff e5                	jmp    *%ebp
    6309:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    630e:	ff                   	(bad)
    630f:	ff e5                	jmp    *%ebp
    6311:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6316:	ff                   	(bad)
    6317:	ff e5                	jmp    *%ebp
    6319:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    631e:	ff                   	(bad)
    631f:	ff e5                	jmp    *%ebp
    6321:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6326:	ff                   	(bad)
    6327:	ff e5                	jmp    *%ebp
    6329:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    632e:	ff                   	(bad)
    632f:	ff e5                	jmp    *%ebp
    6331:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6336:	ff                   	(bad)
    6337:	ff e5                	jmp    *%ebp
    6339:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    633e:	ff                   	(bad)
    633f:	ff e5                	jmp    *%ebp
    6341:	a3 ff ff e5 a3       	mov    %eax,0xa3e5ffff
    6346:	ff                   	(bad)
    6347:	ff e5                	jmp    *%ebp
    6349:	a3 ff ff a1 a3       	mov    %eax,0xa3a1ffff
    634e:	ff                   	(bad)
    634f:	ff 88 a7 ff ff 29    	decl   0x29ffffa7(%eax)
    6355:	ab                   	stos   %eax,%es:(%edi)
    6356:	ff                   	(bad)
    6357:	ff                   	ljmp   (bad)
    6358:	e9 ab ff ff 6f       	jmp    70006308 <_end+0x6fff92fc>
    635d:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
    635e:	ff                   	(bad)
    635f:	ff f4                	push   %esp
    6361:	b8 ff ff 52 b9       	mov    $0xb952ffff,%eax
    6366:	ff                   	(bad)
    6367:	ff 12                	call   *(%edx)
    6369:	b9 ff ff 34 b9       	mov    $0xb934ffff,%ecx
    636e:	ff                   	(bad)
    636f:	ff 1a                	lcall  *(%edx)
    6371:	c3                   	ret
    6372:	ff                   	(bad)
    6373:	ff a4 c2 ff ff cb c2 	jmp    *-0x3d340001(%edx,%eax,8)
    637a:	ff                   	(bad)
    637b:	ff                   	lcall  (bad)
    637c:	d8 c2                	fadd   %st(2),%st
    637e:	ff                   	(bad)
    637f:	ff b1 c2 ff ff fa    	push   -0x500003e(%ecx)
    6385:	c2 ff ff             	ret    $0xffff
    6388:	07                   	pop    %es
    6389:	c3                   	ret
    638a:	ff                   	(bad)
    638b:	ff e0                	jmp    *%eax
    638d:	c2 ff ff             	ret    $0xffff
    6390:	0f                   	movnti %edi,(bad)
    6391:	c3                   	ret
    6392:	ff                   	(bad)
    6393:	ff                   	(bad)
    6394:	be c2 ff ff 2d       	mov    $0x2dffffc2,%esi
    6399:	c3                   	ret
    639a:	ff                   	(bad)
    639b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63a1:	c3                   	ret
    63a2:	ff                   	(bad)
    63a3:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63a9:	c3                   	ret
    63aa:	ff                   	(bad)
    63ab:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63b1:	c3                   	ret
    63b2:	ff                   	(bad)
    63b3:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63b9:	c3                   	ret
    63ba:	ff                   	(bad)
    63bb:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63c1:	c3                   	ret
    63c2:	ff                   	(bad)
    63c3:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63c9:	c3                   	ret
    63ca:	ff                   	(bad)
    63cb:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63d1:	c3                   	ret
    63d2:	ff                   	(bad)
    63d3:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63d9:	c3                   	ret
    63da:	ff                   	(bad)
    63db:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63e1:	c3                   	ret
    63e2:	ff                   	(bad)
    63e3:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63e9:	c3                   	ret
    63ea:	ff                   	(bad)
    63eb:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63f1:	c3                   	ret
    63f2:	ff                   	(bad)
    63f3:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    63f9:	c3                   	ret
    63fa:	ff                   	(bad)
    63fb:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6401:	c3                   	ret
    6402:	ff                   	(bad)
    6403:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6409:	c3                   	ret
    640a:	ff                   	(bad)
    640b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6411:	c3                   	ret
    6412:	ff                   	(bad)
    6413:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6419:	c3                   	ret
    641a:	ff                   	(bad)
    641b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6421:	c3                   	ret
    6422:	ff                   	(bad)
    6423:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6429:	c3                   	ret
    642a:	ff                   	(bad)
    642b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6431:	c3                   	ret
    6432:	ff                   	(bad)
    6433:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6439:	c3                   	ret
    643a:	ff                   	(bad)
    643b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6441:	c3                   	ret
    6442:	ff                   	(bad)
    6443:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6449:	c3                   	ret
    644a:	ff                   	(bad)
    644b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6451:	c3                   	ret
    6452:	ff                   	(bad)
    6453:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6459:	c3                   	ret
    645a:	ff                   	(bad)
    645b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6461:	c3                   	ret
    6462:	ff                   	(bad)
    6463:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6469:	c3                   	ret
    646a:	ff                   	(bad)
    646b:	ff 2d c3 ff ff 2d    	ljmp   *0x2dffffc3
    6471:	c3                   	ret
    6472:	ff                   	(bad)
    6473:	ff                   	ljmp   (bad)
    6474:	ed                   	in     (%dx),%eax
    6475:	c2 ff ff             	ret    $0xffff
    6478:	4b                   	dec    %ebx
    6479:	c7                   	(bad)
    647a:	ff                   	(bad)
    647b:	ff 9b c6 ff ff 46    	lcall  *0x46ffffc6(%ebx)
    6481:	c7                   	(bad)
    6482:	ff                   	(bad)
    6483:	ff 9b c6 ff ff 86    	lcall  *-0x7900003a(%ebx)
    6489:	cc                   	int3
    648a:	ff                   	(bad)
    648b:	ff                   	(bad)
    648c:	7d cc                	jge    645a <memset+0x92a>
    648e:	ff                   	(bad)
    648f:	ff 81 cc ff ff 86    	incl   -0x79000034(%ecx)
    6495:	cc                   	int3
    6496:	ff                   	(bad)
    6497:	ff e0                	jmp    *%eax
    6499:	d9 ff                	fcos
    649b:	ff 6a d9             	ljmp   *-0x27(%edx)
    649e:	ff                   	(bad)
    649f:	ff 91 d9 ff ff 9e    	call   *-0x61000027(%ecx)
    64a5:	d9 ff                	fcos
    64a7:	ff 77 d9             	push   -0x27(%edi)
    64aa:	ff                   	(bad)
    64ab:	ff c0                	inc    %eax
    64ad:	d9 ff                	fcos
    64af:	ff cd                	dec    %ebp
    64b1:	d9 ff                	fcos
    64b3:	ff a6 d9 ff ff d5    	jmp    *-0x2a000027(%esi)
    64b9:	d9 ff                	fcos
    64bb:	ff 84 d9 ff ff f7 d9 	incl   -0x26080001(%ecx,%ebx,8)
    64c2:	ff                   	(bad)
    64c3:	ff f7                	push   %edi
    64c5:	d9 ff                	fcos
    64c7:	ff f7                	push   %edi
    64c9:	d9 ff                	fcos
    64cb:	ff f7                	push   %edi
    64cd:	d9 ff                	fcos
    64cf:	ff f7                	push   %edi
    64d1:	d9 ff                	fcos
    64d3:	ff f7                	push   %edi
    64d5:	d9 ff                	fcos
    64d7:	ff f7                	push   %edi
    64d9:	d9 ff                	fcos
    64db:	ff f7                	push   %edi
    64dd:	d9 ff                	fcos
    64df:	ff f7                	push   %edi
    64e1:	d9 ff                	fcos
    64e3:	ff f7                	push   %edi
    64e5:	d9 ff                	fcos
    64e7:	ff f7                	push   %edi
    64e9:	d9 ff                	fcos
    64eb:	ff f7                	push   %edi
    64ed:	d9 ff                	fcos
    64ef:	ff f7                	push   %edi
    64f1:	d9 ff                	fcos
    64f3:	ff f7                	push   %edi
    64f5:	d9 ff                	fcos
    64f7:	ff f7                	push   %edi
    64f9:	d9 ff                	fcos
    64fb:	ff f7                	push   %edi
    64fd:	d9 ff                	fcos
    64ff:	ff f7                	push   %edi
    6501:	d9 ff                	fcos
    6503:	ff f7                	push   %edi
    6505:	d9 ff                	fcos
    6507:	ff f7                	push   %edi
    6509:	d9 ff                	fcos
    650b:	ff f7                	push   %edi
    650d:	d9 ff                	fcos
    650f:	ff f7                	push   %edi
    6511:	d9 ff                	fcos
    6513:	ff f7                	push   %edi
    6515:	d9 ff                	fcos
    6517:	ff f7                	push   %edi
    6519:	d9 ff                	fcos
    651b:	ff f7                	push   %edi
    651d:	d9 ff                	fcos
    651f:	ff f7                	push   %edi
    6521:	d9 ff                	fcos
    6523:	ff f7                	push   %edi
    6525:	d9 ff                	fcos
    6527:	ff f7                	push   %edi
    6529:	d9 ff                	fcos
    652b:	ff f7                	push   %edi
    652d:	d9 ff                	fcos
    652f:	ff f7                	push   %edi
    6531:	d9 ff                	fcos
    6533:	ff f7                	push   %edi
    6535:	d9 ff                	fcos
    6537:	ff f7                	push   %edi
    6539:	d9 ff                	fcos
    653b:	ff f7                	push   %edi
    653d:	d9 ff                	fcos
    653f:	ff f7                	push   %edi
    6541:	d9 ff                	fcos
    6543:	ff f7                	push   %edi
    6545:	d9 ff                	fcos
    6547:	ff f7                	push   %edi
    6549:	d9 ff                	fcos
    654b:	ff f7                	push   %edi
    654d:	d9 ff                	fcos
    654f:	ff f7                	push   %edi
    6551:	d9 ff                	fcos
    6553:	ff f7                	push   %edi
    6555:	d9 ff                	fcos
    6557:	ff f7                	push   %edi
    6559:	d9 ff                	fcos
    655b:	ff f7                	push   %edi
    655d:	d9 ff                	fcos
    655f:	ff f7                	push   %edi
    6561:	d9 ff                	fcos
    6563:	ff f7                	push   %edi
    6565:	d9 ff                	fcos
    6567:	ff f7                	push   %edi
    6569:	d9 ff                	fcos
    656b:	ff f7                	push   %edi
    656d:	d9 ff                	fcos
    656f:	ff f7                	push   %edi
    6571:	d9 ff                	fcos
    6573:	ff f7                	push   %edi
    6575:	d9 ff                	fcos
    6577:	ff f7                	push   %edi
    6579:	d9 ff                	fcos
    657b:	ff f7                	push   %edi
    657d:	d9 ff                	fcos
    657f:	ff f7                	push   %edi
    6581:	d9 ff                	fcos
    6583:	ff f7                	push   %edi
    6585:	d9 ff                	fcos
    6587:	ff f7                	push   %edi
    6589:	d9 ff                	fcos
    658b:	ff f7                	push   %edi
    658d:	d9 ff                	fcos
    658f:	ff f7                	push   %edi
    6591:	d9 ff                	fcos
    6593:	ff f7                	push   %edi
    6595:	d9 ff                	fcos
    6597:	ff f7                	push   %edi
    6599:	d9 ff                	fcos
    659b:	ff b3 d9 ff ff 2f    	push   0x2fffffd9(%ebx)
    65a1:	68 6f 6d 65 2f       	push   $0x2f656d6f
    65a6:	50                   	push   %eax
    65a7:	61                   	popa
    65a8:	76 61                	jbe    660b <memset+0xadb>
    65aa:	6c                   	insb   (%dx),%es:(%edi)
    65ab:	2f                   	das
    65ac:	54                   	push   %esp
    65ad:	72 69                	jb     6618 <memset+0xae8>
    65af:	67 67 65 72 73       	addr16 addr16 gs jb 6627 <memset+0xaf7>
    65b4:	2f                   	das
    65b5:	52                   	push   %edx
    65b6:	75 73                	jne    662b <memset+0xafb>
    65b8:	74 2f                	je     65e9 <memset+0xab9>
    65ba:	45                   	inc    %ebp
    65bb:	6d                   	insl   (%dx),%es:(%edi)
    65bc:	62 65 64             	bound  %esp,0x64(%ebp)
    65bf:	64 65 64 2f          	fs gs fs das
    65c3:	70 65                	jo     662a <memset+0xafa>
    65c5:	74 5f                	je     6626 <memset+0xaf6>
    65c7:	6f                   	outsl  %ds:(%esi),(%dx)
    65c8:	73 2f                	jae    65f9 <memset+0xac9>
    65ca:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    65ce:	65 6c                	gs insb (%dx),%es:(%edi)
    65d0:	5f                   	pop    %edi
    65d1:	74 79                	je     664c <memset+0xb1c>
    65d3:	70 65                	jo     663a <memset+0xb0a>
    65d5:	73 2f                	jae    6606 <memset+0xad6>
    65d7:	73 72                	jae    664b <memset+0xb1b>
    65d9:	63 2f                	arpl   %ebp,(%edi)
    65db:	6f                   	outsl  %ds:(%esi),(%dx)
    65dc:	62 6a 65             	bound  %ebp,0x65(%edx)
    65df:	63 74 2f 71          	arpl   %esi,0x71(%edi,%ebp,1)
    65e3:	75 65                	jne    664a <memset+0xb1a>
    65e5:	75 65                	jne    664c <memset+0xb1c>
    65e7:	2e 72 73             	jb,pn  665d <memset+0xb2d>
    65ea:	46                   	inc    %esi
    65eb:	61                   	popa
    65ec:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    65f3:	20 
    65f4:	61                   	popa
    65f5:	63 63 65             	arpl   %esp,0x65(%ebx)
    65f8:	73 73                	jae    666d <memset+0xb3d>
    65fa:	20 71 75             	and    %dh,0x75(%ecx)
    65fd:	65 75 65             	gs jne 6665 <memset+0xb35>
    6600:	20 64 61 74          	and    %ah,0x74(%ecx,%eiz,2)
    6604:	61                   	popa
    6605:	3a 20                	cmp    (%eax),%ah
    6607:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    660b:	65 6c                	gs insb (%dx),%es:(%edi)
    660d:	5f                   	pop    %edi
    660e:	74 79                	je     6689 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1>
    6610:	70 65                	jo     6677 <memset+0xb47>
    6612:	73 3a                	jae    664e <memset+0xb1e>
    6614:	3a 6f 62             	cmp    0x62(%edi),%ch
    6617:	6a 65                	push   $0x65
    6619:	63 74 3a 3a          	arpl   %esi,0x3a(%edx,%edi,1)
    661d:	71 75                	jno    6694 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0xc>
    661f:	65 75 65             	gs jne 6687 <memset+0xb57>
    6622:	4f                   	dec    %edi
    6623:	6b 45 72 72          	imul   $0x72,0x72(%ebp),%eax
    6627:	52                   	push   %edx
    6628:	61                   	popa
    6629:	77 48                	ja     6673 <memset+0xb43>
    662b:	61                   	popa
    662c:	6e                   	outsb  %ds:(%esi),(%dx)
    662d:	64 6c                	fs insb (%dx),%es:(%edi)
    662f:	65 6e                	outsb  %gs:(%esi),(%dx)
    6631:	6f                   	outsl  %ds:(%esi),(%dx)
    6632:	74 20                	je     6654 <memset+0xb24>
    6634:	79 65                	jns    669b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x13>
    6636:	74 20                	je     6658 <memset+0xb28>
    6638:	69 6d 70 6c 65 6d 65 	imul   $0x656d656c,0x70(%ebp),%ebp
    663f:	6e                   	outsb  %ds:(%esi),(%dx)
    6640:	74 65                	je     66a7 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1f>
    6642:	64 2f                	fs das
    6644:	68 6f 6d 65 2f       	push   $0x2f656d6f
    6649:	50                   	push   %eax
    664a:	61                   	popa
    664b:	76 61                	jbe    66ae <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x26>
    664d:	6c                   	insb   (%dx),%es:(%edi)
    664e:	2f                   	das
    664f:	54                   	push   %esp
    6650:	72 69                	jb     66bb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x33>
    6652:	67 67 65 72 73       	addr16 addr16 gs jb 66ca <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x42>
    6657:	2f                   	das
    6658:	52                   	push   %edx
    6659:	75 73                	jne    66ce <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x46>
    665b:	74 2f                	je     668c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4>
    665d:	45                   	inc    %ebp
    665e:	6d                   	insl   (%dx),%es:(%edi)
    665f:	62 65 64             	bound  %esp,0x64(%ebp)
    6662:	64 65 64 2f          	fs gs fs das
    6666:	70 65                	jo     66cd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x45>
    6668:	74 5f                	je     66c9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x41>
    666a:	6f                   	outsl  %ds:(%esi),(%dx)
    666b:	73 2f                	jae    669c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x14>
    666d:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    6671:	65 6c                	gs insb (%dx),%es:(%edi)
    6673:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    6678:	73 72                	jae    66ec <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x64>
    667a:	63 2f                	arpl   %ebp,(%edi)
    667c:	66 73 2f             	data16 jae 66ae <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x26>
    667f:	6d                   	insl   (%dx),%es:(%edi)
    6680:	6f                   	outsl  %ds:(%esi),(%dx)
    6681:	64 2e 72 73          	fs jb,pn 66f8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x70>
    6685:	00 00                	add    %al,(%eax)
	...

00006688 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE>:
	...
    678c:	5b                   	pop    %ebx
    678d:	5d                   	pop    %ebp
    678e:	5b                   	pop    %ebx
    678f:	5d                   	pop    %ebp
    6790:	20 0a                	and    %cl,(%edx)
    6792:	2f                   	das
    6793:	68 6f 6d 65 2f       	push   $0x2f656d6f
    6798:	50                   	push   %eax
    6799:	61                   	popa
    679a:	76 61                	jbe    67fd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x175>
    679c:	6c                   	insb   (%dx),%es:(%edi)
    679d:	2f                   	das
    679e:	54                   	push   %esp
    679f:	72 69                	jb     680a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x182>
    67a1:	67 67 65 72 73       	addr16 addr16 gs jb 6819 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x191>
    67a6:	2f                   	das
    67a7:	52                   	push   %edx
    67a8:	75 73                	jne    681d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x195>
    67aa:	74 2f                	je     67db <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x153>
    67ac:	45                   	inc    %ebp
    67ad:	6d                   	insl   (%dx),%es:(%edi)
    67ae:	62 65 64             	bound  %esp,0x64(%ebp)
    67b1:	64 65 64 2f          	fs gs fs das
    67b5:	70 65                	jo     681c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x194>
    67b7:	74 5f                	je     6818 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x190>
    67b9:	6f                   	outsl  %ds:(%esi),(%dx)
    67ba:	73 2f                	jae    67eb <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x163>
    67bc:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    67c0:	65 6c                	gs insb (%dx),%es:(%edi)
    67c2:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    67c7:	73 72                	jae    683b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b3>
    67c9:	63 2f                	arpl   %ebp,(%edi)
    67cb:	6f                   	outsl  %ds:(%esi),(%dx)
    67cc:	62 6a 65             	bound  %ebp,0x65(%edx)
    67cf:	63 74 2f 6b          	arpl   %esi,0x6b(%edi,%ebp,1)
    67d3:	65 72 6e             	gs jb  6844 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1bc>
    67d6:	65 6c                	gs insb (%dx),%es:(%edi)
    67d8:	5f                   	pop    %edi
    67d9:	62 75 66             	bound  %esi,0x66(%ebp)
    67dc:	2f                   	das
    67dd:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    67e1:	65 6c                	gs insb (%dx),%es:(%edi)
    67e3:	2e 72 73             	jb,pn  6859 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1d1>
    67e6:	2f                   	das
    67e7:	68 6f 6d 65 2f       	push   $0x2f656d6f
    67ec:	50                   	push   %eax
    67ed:	61                   	popa
    67ee:	76 61                	jbe    6851 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1c9>
    67f0:	6c                   	insb   (%dx),%es:(%edi)
    67f1:	2f                   	das
    67f2:	54                   	push   %esp
    67f3:	72 69                	jb     685e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1d6>
    67f5:	67 67 65 72 73       	addr16 addr16 gs jb 686d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1e5>
    67fa:	2f                   	das
    67fb:	52                   	push   %edx
    67fc:	75 73                	jne    6871 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1e9>
    67fe:	74 2f                	je     682f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1a7>
    6800:	45                   	inc    %ebp
    6801:	6d                   	insl   (%dx),%es:(%edi)
    6802:	62 65 64             	bound  %esp,0x64(%ebp)
    6805:	64 65 64 2f          	fs gs fs das
    6809:	70 65                	jo     6870 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1e8>
    680b:	74 5f                	je     686c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1e4>
    680d:	6f                   	outsl  %ds:(%esi),(%dx)
    680e:	73 2f                	jae    683f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1b7>
    6810:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    6814:	65 6c                	gs insb (%dx),%es:(%edi)
    6816:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    681b:	73 72                	jae    688f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x207>
    681d:	63 2f                	arpl   %ebp,(%edi)
    681f:	6f                   	outsl  %ds:(%esi),(%dx)
    6820:	62 6a 65             	bound  %ebp,0x65(%edx)
    6823:	63 74 2f 6b          	arpl   %esi,0x6b(%edi,%ebp,1)
    6827:	65 72 6e             	gs jb  6898 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x210>
    682a:	65 6c                	gs insb (%dx),%es:(%edi)
    682c:	5f                   	pop    %edi
    682d:	62 75 66             	bound  %esi,0x66(%ebp)
    6830:	2f                   	das
    6831:	75 73                	jne    68a6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x21e>
    6833:	65 72 2e             	gs jb  6864 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x1dc>
    6836:	72 73                	jb     68ab <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x223>
    6838:	54                   	push   %esp
    6839:	65 72 6d             	gs jb  68a9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x221>
    683c:	69 6e 61 74 69 6e 67 	imul   $0x676e6974,0x61(%esi),%ebp
    6843:	20 77 69             	and    %dh,0x69(%edi)
    6846:	74 68                	je     68b0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x228>
    6848:	20 63 6f             	and    %ah,0x6f(%ebx)
    684b:	64 65 3a 20          	fs cmp %gs:(%eax),%ah
    684f:	2f                   	das
    6850:	68 6f 6d 65 2f       	push   $0x2f656d6f
    6855:	50                   	push   %eax
    6856:	61                   	popa
    6857:	76 61                	jbe    68ba <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x232>
    6859:	6c                   	insb   (%dx),%es:(%edi)
    685a:	2f                   	das
    685b:	54                   	push   %esp
    685c:	72 69                	jb     68c7 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x23f>
    685e:	67 67 65 72 73       	addr16 addr16 gs jb 68d6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x24e>
    6863:	2f                   	das
    6864:	52                   	push   %edx
    6865:	75 73                	jne    68da <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x252>
    6867:	74 2f                	je     6898 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x210>
    6869:	45                   	inc    %ebp
    686a:	6d                   	insl   (%dx),%es:(%edi)
    686b:	62 65 64             	bound  %esp,0x64(%ebp)
    686e:	64 65 64 2f          	fs gs fs das
    6872:	70 65                	jo     68d9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x251>
    6874:	74 5f                	je     68d5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x24d>
    6876:	6f                   	outsl  %ds:(%esi),(%dx)
    6877:	73 2f                	jae    68a8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x220>
    6879:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    687d:	65 6c                	gs insb (%dx),%es:(%edi)
    687f:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    6884:	73 72                	jae    68f8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x270>
    6886:	63 2f                	arpl   %ebp,(%edi)
    6888:	70 72                	jo     68fc <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x274>
    688a:	6f                   	outsl  %ds:(%esi),(%dx)
    688b:	63 65 73             	arpl   %esp,0x73(%ebp)
    688e:	73 2f                	jae    68bf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x237>
    6890:	6d                   	insl   (%dx),%es:(%edi)
    6891:	6f                   	outsl  %ds:(%esi),(%dx)
    6892:	64 2e 72 73          	fs jb,pn 6909 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x281>
    6896:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    689a:	65 6c                	gs insb (%dx),%es:(%edi)
    689c:	5f                   	pop    %edi
    689d:	6c                   	insb   (%dx),%es:(%edi)
    689e:	69 62 3a 3a 70 72 6f 	imul   $0x6f72703a,0x3a(%edx),%esp
    68a5:	63 65 73             	arpl   %esp,0x73(%ebp)
    68a8:	73 46                	jae    68f0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x268>
    68aa:	61                   	popa
    68ab:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    68b2:	20 
    68b3:	61                   	popa
    68b4:	63 63 65             	arpl   %esp,0x65(%ebx)
    68b7:	73 73                	jae    692c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2a4>
    68b9:	20 6d 6f             	and    %ch,0x6f(%ebp)
    68bc:	64 75 6c             	fs jne 692b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2a3>
    68bf:	65 20 69 6e          	and    %ch,%gs:0x6e(%ecx)
    68c3:	66 6f                	outsw  %ds:(%esi),(%dx)
    68c5:	3a 20                	cmp    (%eax),%ah
    68c7:	2f                   	das
    68c8:	68 6f 6d 65 2f       	push   $0x2f656d6f
    68cd:	50                   	push   %eax
    68ce:	61                   	popa
    68cf:	76 61                	jbe    6932 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2aa>
    68d1:	6c                   	insb   (%dx),%es:(%edi)
    68d2:	2f                   	das
    68d3:	54                   	push   %esp
    68d4:	72 69                	jb     693f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2b7>
    68d6:	67 67 65 72 73       	addr16 addr16 gs jb 694e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2c6>
    68db:	2f                   	das
    68dc:	52                   	push   %edx
    68dd:	75 73                	jne    6952 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2ca>
    68df:	74 2f                	je     6910 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x288>
    68e1:	45                   	inc    %ebp
    68e2:	6d                   	insl   (%dx),%es:(%edi)
    68e3:	62 65 64             	bound  %esp,0x64(%ebp)
    68e6:	64 65 64 2f          	fs gs fs das
    68ea:	70 65                	jo     6951 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2c9>
    68ec:	74 5f                	je     694d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2c5>
    68ee:	6f                   	outsl  %ds:(%esi),(%dx)
    68ef:	73 2f                	jae    6920 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x298>
    68f1:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    68f5:	65 6c                	gs insb (%dx),%es:(%edi)
    68f7:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    68fc:	73 72                	jae    6970 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2e8>
    68fe:	63 2f                	arpl   %ebp,(%edi)
    6900:	72 74                	jb     6976 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2ee>
    6902:	2f                   	das
    6903:	6d                   	insl   (%dx),%es:(%edi)
    6904:	6f                   	outsl  %ds:(%esi),(%dx)
    6905:	64 2e 72 73          	fs jb,pn 697c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2f4>
    6909:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    690d:	65 6c                	gs insb (%dx),%es:(%edi)
    690f:	5f                   	pop    %edi
    6910:	6c                   	insb   (%dx),%es:(%edi)
    6911:	69 62 3a 3a 72 74 48 	imul   $0x4874723a,0x3a(%edx),%esp
    6918:	61                   	popa
    6919:	6e                   	outsb  %ds:(%esi),(%dx)
    691a:	64 6c                	fs insb (%dx),%es:(%edi)
    691c:	69 6e 67 20 63 68 61 	imul   $0x61686320,0x67(%esi),%ebp
    6923:	72 20                	jb     6945 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x2bd>
    6925:	6d                   	insl   (%dx),%es:(%edi)
    6926:	6f                   	outsl  %ds:(%esi),(%dx)
    6927:	64 75 6c             	fs jne 6996 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x30e>
    692a:	65 4b                	gs dec %ebx
    692c:	65 72 6e             	gs jb  699d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x315>
    692f:	65 6c                	gs insb (%dx),%es:(%edi)
    6931:	20 62 75             	and    %ah,0x75(%edx)
    6934:	66 3a 20             	data16 cmp (%eax),%ah
    6937:	76 67                	jbe    69a0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x318>
    6939:	61                   	popa
    693a:	20 77 72             	and    %dh,0x72(%edi)
    693d:	69 74 65 3a 20 50 61 	imul   $0x6e615020,0x3a(%ebp,%eiz,2),%esi
    6944:	6e 
    6945:	69 63 20 69 73 20 64 	imul   $0x64207369,0x20(%ebx),%esp
    694c:	65 74 65             	gs je  69b4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x32c>
    694f:	63 74 65 64          	arpl   %esi,0x64(%ebp,%eiz,2)
    6953:	3a 20                	cmp    (%eax),%ah
    6955:	2f                   	das
    6956:	68 6f 6d 65 2f       	push   $0x2f656d6f
    695b:	50                   	push   %eax
    695c:	61                   	popa
    695d:	76 61                	jbe    69c0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x338>
    695f:	6c                   	insb   (%dx),%es:(%edi)
    6960:	2f                   	das
    6961:	54                   	push   %esp
    6962:	72 69                	jb     69cd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x345>
    6964:	67 67 65 72 73       	addr16 addr16 gs jb 69dc <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x354>
    6969:	2f                   	das
    696a:	52                   	push   %edx
    696b:	75 73                	jne    69e0 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x358>
    696d:	74 2f                	je     699e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x316>
    696f:	45                   	inc    %ebp
    6970:	6d                   	insl   (%dx),%es:(%edi)
    6971:	62 65 64             	bound  %esp,0x64(%ebp)
    6974:	64 65 64 2f          	fs gs fs das
    6978:	70 65                	jo     69df <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x357>
    697a:	74 5f                	je     69db <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x353>
    697c:	6f                   	outsl  %ds:(%esi),(%dx)
    697d:	73 2f                	jae    69ae <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x326>
    697f:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    6983:	65 6c                	gs insb (%dx),%es:(%edi)
    6985:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    698a:	73 72                	jae    69fe <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x376>
    698c:	63 2f                	arpl   %ebp,(%edi)
    698e:	6c                   	insb   (%dx),%es:(%edi)
    698f:	69 62 2e 72 73 6b 65 	imul   $0x656b7372,0x2e(%edx),%esp
    6996:	72 6e                	jb     6a06 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x37e>
    6998:	65 6c                	gs insb (%dx),%es:(%edi)
    699a:	5f                   	pop    %edi
    699b:	6c                   	insb   (%dx),%es:(%edi)
    699c:	69 62 4e 6f 74 20 73 	imul   $0x7320746f,0x4e(%edx),%esp
    69a3:	75 70                	jne    6a15 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x38d>
    69a5:	70 6f                	jo     6a16 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x38e>
    69a7:	72 74                	jb     6a1d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x395>
    69a9:	65 64 4e             	gs fs dec %esi
    69ac:	6f                   	outsl  %ds:(%esi),(%dx)
    69ad:	74 20                	je     69cf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x347>
    69af:	53                   	push   %ebx
    69b0:	75 70                	jne    6a22 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x39a>
    69b2:	70 6f                	jo     6a23 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x39b>
    69b4:	72 74                	jb     6a2a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a2>
    69b6:	65 64 20 4f 70       	gs and %cl,%fs:0x70(%edi)
    69bb:	65 72 61             	gs jb  6a1f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x397>
    69be:	74 69                	je     6a29 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3a1>
    69c0:	6f                   	outsl  %ds:(%esi),(%dx)
    69c1:	6e                   	outsb  %ds:(%esi),(%dx)
    69c2:	53                   	push   %ebx
    69c3:	79 73                	jns    6a38 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b0>
    69c5:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    69c8:	6c                   	insb   (%dx),%es:(%edi)
    69c9:	20 69 73             	and    %ch,0x73(%ecx)
    69cc:	20 66 61             	and    %ah,0x61(%esi)
    69cf:	69 6c 65 64 3a 20 4b 	imul   $0x654b203a,0x64(%ebp,%eiz,2),%ebp
    69d6:	65 
    69d7:	72 6e                	jb     6a47 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3bf>
    69d9:	65 6c                	gs insb (%dx),%es:(%edi)
    69db:	42                   	inc    %edx
    69dc:	75 66                	jne    6a44 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3bc>
    69de:	6c                   	insb   (%dx),%es:(%edi)
    69df:	65 6e                	outsb  %gs:(%esi),(%dx)
    69e1:	63 61 70             	arpl   %esp,0x70(%ecx)
    69e4:	61                   	popa
    69e5:	63 69 74             	arpl   %ebp,0x74(%ecx)
    69e8:	79 4e                	jns    6a38 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3b0>
    69ea:	6f                   	outsl  %ds:(%esi),(%dx)
    69eb:	4d                   	dec    %ebp
    69ec:	65 6d                	gs insl (%dx),%es:(%edi)
    69ee:	6f                   	outsl  %ds:(%esi),(%dx)
    69ef:	72 79                	jb     6a6a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3e2>
    69f1:	68 61 6e 64 6c       	push   $0x6c646e61
    69f6:	65 49                	gs dec %ecx
    69f8:	6f                   	outsl  %ds:(%esi),(%dx)
    69f9:	20 4f 70             	and    %cl,0x70(%edi)
    69fc:	20 66 61             	and    %ah,0x61(%esi)
    69ff:	69 6c 65 64 3a 20 46 	imul   $0x7346203a,0x64(%ebp,%eiz,2),%ebp
    6a06:	73 
    6a07:	20 4f 70             	and    %cl,0x70(%edi)
    6a0a:	20 66 61             	and    %ah,0x61(%esi)
    6a0d:	69 6c 65 64 3a 20 53 	imul   $0x7953203a,0x64(%ebp,%eiz,2),%ebp
    6a14:	79 
    6a15:	73 43                	jae    6a5a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3d2>
    6a17:	61                   	popa
    6a18:	6c                   	insb   (%dx),%es:(%edi)
    6a19:	6c                   	insb   (%dx),%es:(%edi)
    6a1a:	20 69 73             	and    %ch,0x73(%ecx)
    6a1d:	20 66 61             	and    %ah,0x61(%esi)
    6a20:	69 6c 65 64 46 61 69 	imul   $0x6c696146,0x64(%ebp,%eiz,2),%ebp
    6a27:	6c 
    6a28:	65 64 20 74 6f 20    	gs and %dh,%fs:0x20(%edi,%ebp,2)
    6a2e:	70 65                	jo     6a95 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x40d>
    6a30:	72 66                	jb     6a98 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x410>
    6a32:	6f                   	outsl  %ds:(%esi),(%dx)
    6a33:	72 6d                	jb     6aa2 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x41a>
    6a35:	20 6d 65             	and    %ch,0x65(%ebp)
    6a38:	6d                   	insl   (%dx),%es:(%edi)
    6a39:	6f                   	outsl  %ds:(%esi),(%dx)
    6a3a:	72 79                	jb     6ab5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x42d>
    6a3c:	20 61 6c             	and    %ah,0x6c(%ecx)
    6a3f:	6c                   	insb   (%dx),%es:(%edi)
    6a40:	6f                   	outsl  %ds:(%esi),(%dx)
    6a41:	63 61 74             	arpl   %esp,0x74(%ecx)
    6a44:	69 6f 6e 3a 20 63 61 	imul   $0x6163203a,0x6e(%edi),%ebp
    6a4b:	70 61                	jo     6aae <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x426>
    6a4d:	63 69 74             	arpl   %ebp,0x74(%ecx)
    6a50:	79 20                	jns    6a72 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x3ea>
    6a52:	6f                   	outsl  %ds:(%esi),(%dx)
    6a53:	76 65                	jbe    6aba <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x432>
    6a55:	72 66                	jb     6abd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x435>
    6a57:	6c                   	insb   (%dx),%es:(%edi)
    6a58:	6f                   	outsl  %ds:(%esi),(%dx)
    6a59:	77 2f                	ja     6a8a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x402>
    6a5b:	68 6f 6d 65 2f       	push   $0x2f656d6f
    6a60:	50                   	push   %eax
    6a61:	61                   	popa
    6a62:	76 61                	jbe    6ac5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x43d>
    6a64:	6c                   	insb   (%dx),%es:(%edi)
    6a65:	2f                   	das
    6a66:	2e 72 75             	jb,pn  6ade <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x456>
    6a69:	73 74                	jae    6adf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x457>
    6a6b:	75 70                	jne    6add <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x455>
    6a6d:	2f                   	das
    6a6e:	74 6f                	je     6adf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x457>
    6a70:	6f                   	outsl  %ds:(%esi),(%dx)
    6a71:	6c                   	insb   (%dx),%es:(%edi)
    6a72:	63 68 61             	arpl   %ebp,0x61(%eax)
    6a75:	69 6e 73 2f 6e 69 67 	imul   $0x67696e2f,0x73(%esi),%ebp
    6a7c:	68 74 6c 79 2d       	push   $0x2d796c74
    6a81:	69 36 38 36 2d 75    	imul   $0x752d3638,(%esi),%esi
    6a87:	6e                   	outsb  %ds:(%esi),(%dx)
    6a88:	6b 6e 6f 77          	imul   $0x77,0x6f(%esi),%ebp
    6a8c:	6e                   	outsb  %ds:(%esi),(%dx)
    6a8d:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
    6a92:	78 2d                	js     6ac1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x439>
    6a94:	67 6e                	outsb  %ds:(%si),(%dx)
    6a96:	75 2f                	jne    6ac7 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x43f>
    6a98:	6c                   	insb   (%dx),%es:(%edi)
    6a99:	69 62 2f 72 75 73 74 	imul   $0x74737572,0x2f(%edx),%esp
    6aa0:	6c                   	insb   (%dx),%es:(%edi)
    6aa1:	69 62 2f 73 72 63 2f 	imul   $0x2f637273,0x2f(%edx),%esp
    6aa8:	72 75                	jb     6b1f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x497>
    6aaa:	73 74                	jae    6b20 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x498>
    6aac:	2f                   	das
    6aad:	6c                   	insb   (%dx),%es:(%edi)
    6aae:	69 62 72 61 72 79 2f 	imul   $0x2f797261,0x72(%edx),%esp
    6ab5:	61                   	popa
    6ab6:	6c                   	insb   (%dx),%es:(%edi)
    6ab7:	6c                   	insb   (%dx),%es:(%edi)
    6ab8:	6f                   	outsl  %ds:(%esi),(%dx)
    6ab9:	63 2f                	arpl   %ebp,(%edi)
    6abb:	73 72                	jae    6b2f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4a7>
    6abd:	63 2f                	arpl   %ebp,(%edi)
    6abf:	61                   	popa
    6ac0:	6c                   	insb   (%dx),%es:(%edi)
    6ac1:	6c                   	insb   (%dx),%es:(%edi)
    6ac2:	6f                   	outsl  %ds:(%esi),(%dx)
    6ac3:	63 2e                	arpl   %ebp,(%esi)
    6ac5:	72 73                	jb     6b3a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4b2>
    6ac7:	6d                   	insl   (%dx),%es:(%edi)
    6ac8:	65 6d                	gs insl (%dx),%es:(%edi)
    6aca:	6f                   	outsl  %ds:(%esi),(%dx)
    6acb:	72 79                	jb     6b46 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4be>
    6acd:	20 61 6c             	and    %ah,0x6c(%ecx)
    6ad0:	6c                   	insb   (%dx),%es:(%edi)
    6ad1:	6f                   	outsl  %ds:(%esi),(%dx)
    6ad2:	63 61 74             	arpl   %esp,0x74(%ecx)
    6ad5:	69 6f 6e 20 6f 66 20 	imul   $0x20666f20,0x6e(%edi),%ebp
    6adc:	20 62 79             	and    %ah,0x79(%edx)
    6adf:	74 65                	je     6b46 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4be>
    6ae1:	73 20                	jae    6b03 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x47b>
    6ae3:	66 61                	popaw
    6ae5:	69 6c 65 64 28 29 63 	imul   $0x61632928,0x64(%ebp,%eiz,2),%ebp
    6aec:	61 
    6aed:	6c                   	insb   (%dx),%es:(%edi)
    6aee:	6c                   	insb   (%dx),%es:(%edi)
    6aef:	65 64 20 60 52       	gs and %ah,%fs:0x52(%eax)
    6af4:	65 73 75             	gs jae 6b6c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4e4>
    6af7:	6c                   	insb   (%dx),%es:(%edi)
    6af8:	74 3a                	je     6b34 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4ac>
    6afa:	3a 75 6e             	cmp    0x6e(%ebp),%dh
    6afd:	77 72                	ja     6b71 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4e9>
    6aff:	61                   	popa
    6b00:	70 28                	jo     6b2a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4a2>
    6b02:	29 60 20             	sub    %esp,0x20(%eax)
    6b05:	6f                   	outsl  %ds:(%esi),(%dx)
    6b06:	6e                   	outsb  %ds:(%esi),(%dx)
    6b07:	20 61 6e             	and    %ah,0x6e(%ecx)
    6b0a:	20 60 45             	and    %ah,0x45(%eax)
    6b0d:	72 72                	jb     6b81 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4f9>
    6b0f:	60                   	pusha
    6b10:	20 76 61             	and    %dh,0x61(%esi)
    6b13:	6c                   	insb   (%dx),%es:(%edi)
    6b14:	75 65                	jne    6b7b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4f3>
    6b16:	53                   	push   %ebx
    6b17:	65 74 4c             	gs je  6b66 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4de>
    6b1a:	6f                   	outsl  %ds:(%esi),(%dx)
    6b1b:	67 67 65 72 45       	addr16 addr16 gs jb 6b65 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4dd>
    6b20:	72 72                	jb     6b94 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x50c>
    6b22:	6f                   	outsl  %ds:(%esi),(%dx)
    6b23:	72 53                	jb     6b78 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4f0>
    6b25:	79 73                	jns    6b9a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x512>
    6b27:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    6b2a:	6c                   	insb   (%dx),%es:(%edi)
    6b2b:	46                   	inc    %esi
    6b2c:	61                   	popa
    6b2d:	69 6c 65 64 76 67 61 	imul   $0x2f616776,0x64(%ebp,%eiz,2),%ebp
    6b34:	2f 
    6b35:	73 72                	jae    6ba9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x521>
    6b37:	63 2f                	arpl   %ebp,(%edi)
    6b39:	6d                   	insl   (%dx),%es:(%edi)
    6b3a:	61                   	popa
    6b3b:	69 6e 2e 72 73 46 61 	imul   $0x61467372,0x2e(%esi),%ebp
    6b42:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    6b49:	20 
    6b4a:	75 70                	jne    6bbc <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x534>
    6b4c:	64 61                	fs popa
    6b4e:	74 65                	je     6bb5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x52d>
    6b50:	20 63 75             	and    %ah,0x75(%ebx)
    6b53:	72 73                	jb     6bc8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x540>
    6b55:	6f                   	outsl  %ds:(%esi),(%dx)
    6b56:	72 20                	jb     6b78 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4f0>
    6b58:	70 6f                	jo     6bc9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x541>
    6b5a:	73 00                	jae    6b5c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x4d4>
    6b5c:	76 67                	jbe    6bc5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x53d>
    6b5e:	61                   	popa
    6b5f:	56                   	push   %esi
    6b60:	67 61                	addr16 popa
    6b62:	20 64 72 69          	and    %ah,0x69(%edx,%esi,2)
    6b66:	76 65                	jbe    6bcd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x545>
    6b68:	72 20                	jb     6b8a <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x502>
    6b6a:	69 73 20 69 6e 69 74 	imul   $0x74696e69,0x20(%ebx),%esi
    6b71:	69 61 6c 69 7a 65 64 	imul   $0x64657a69,0x6c(%ecx),%esp
    6b78:	46                   	inc    %esi
    6b79:	61                   	popa
    6b7a:	69 6c 65 64 20 69 6e 	imul   $0x696e6920,0x64(%ebp,%eiz,2),%ebp
    6b81:	69 
    6b82:	74 3a                	je     6bbe <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x536>
    6b84:	20 29                	and    %ch,(%ecx)
    6b86:	3a 70 61             	cmp    0x61(%eax),%dh
    6b89:	6e                   	outsb  %ds:(%esi),(%dx)
    6b8a:	69 63 6b 65 64 20 61 	imul   $0x61206465,0x6b(%ebx),%esp
    6b91:	74 20                	je     6bb3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x52b>
    6b93:	3a 0a                	cmp    (%edx),%cl
    6b95:	69 6e 64 65 78 20 6f 	imul   $0x6f207865,0x64(%esi),%ebp
    6b9c:	75 74                	jne    6c12 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x58a>
    6b9e:	20 6f 66             	and    %ch,0x66(%edi)
    6ba1:	20 62 6f             	and    %ah,0x6f(%edx)
    6ba4:	75 6e                	jne    6c14 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x58c>
    6ba6:	64 73 3a             	fs jae 6be3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x55b>
    6ba9:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
    6bad:	20 6c 65 6e          	and    %ch,0x6e(%ebp,%eiz,2)
    6bb1:	20 69 73             	and    %ch,0x73(%ecx)
    6bb4:	20 20                	and    %ah,(%eax)
    6bb6:	62 75 74             	bound  %esi,0x74(%ebp)
    6bb9:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
    6bbd:	20 69 6e             	and    %ch,0x6e(%ecx)
    6bc0:	64 65 78 20          	fs gs js 6be4 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x55c>
    6bc4:	69 73 20 3a 20 20 20 	imul   $0x2020203a,0x20(%ebx),%esi
    6bcb:	20 20                	and    %ah,(%eax)
    6bcd:	57                   	push   %edi
    6bce:	41                   	inc    %ecx
    6bcf:	52                   	push   %edx
    6bd0:	4e                   	dec    %esi
    6bd1:	49                   	dec    %ecx
    6bd2:	4e                   	dec    %esi
    6bd3:	46                   	inc    %esi
    6bd4:	4f                   	dec    %edi
    6bd5:	20 7b 20             	and    %bh,0x20(%ebx)
    6bd8:	2c 20                	sub    $0x20,%al
    6bda:	20 7b 0a             	and    %bh,0xa(%ebx)
    6bdd:	2c 0a                	sub    $0xa,%al
    6bdf:	7d 20                	jge    6c01 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x579>
    6be1:	7d 28                	jge    6c0b <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x583>
    6be3:	28 0a                	sub    %cl,(%edx)
    6be5:	30 78 30             	xor    %bh,0x30(%eax)
    6be8:	30 30                	xor    %dh,(%eax)
    6bea:	31 30                	xor    %esi,(%eax)
    6bec:	32 30                	xor    (%eax),%dh
    6bee:	33 30                	xor    (%eax),%esi
    6bf0:	34 30                	xor    $0x30,%al
    6bf2:	35 30 36 30 37       	xor    $0x37303630,%eax
    6bf7:	30 38                	xor    %bh,(%eax)
    6bf9:	30 39                	xor    %bh,(%ecx)
    6bfb:	31 30                	xor    %esi,(%eax)
    6bfd:	31 31                	xor    %esi,(%ecx)
    6bff:	31 32                	xor    %esi,(%edx)
    6c01:	31 33                	xor    %esi,(%ebx)
    6c03:	31 34 31             	xor    %esi,(%ecx,%esi,1)
    6c06:	35 31 36 31 37       	xor    $0x37313631,%eax
    6c0b:	31 38                	xor    %edi,(%eax)
    6c0d:	31 39                	xor    %edi,(%ecx)
    6c0f:	32 30                	xor    (%eax),%dh
    6c11:	32 31                	xor    (%ecx),%dh
    6c13:	32 32                	xor    (%edx),%dh
    6c15:	32 33                	xor    (%ebx),%dh
    6c17:	32 34 32             	xor    (%edx,%esi,1),%dh
    6c1a:	35 32 36 32 37       	xor    $0x37323632,%eax
    6c1f:	32 38                	xor    (%eax),%bh
    6c21:	32 39                	xor    (%ecx),%bh
    6c23:	33 30                	xor    (%eax),%esi
    6c25:	33 31                	xor    (%ecx),%esi
    6c27:	33 32                	xor    (%edx),%esi
    6c29:	33 33                	xor    (%ebx),%esi
    6c2b:	33 34 33             	xor    (%ebx,%esi,1),%esi
    6c2e:	35 33 36 33 37       	xor    $0x37333633,%eax
    6c33:	33 38                	xor    (%eax),%edi
    6c35:	33 39                	xor    (%ecx),%edi
    6c37:	34 30                	xor    $0x30,%al
    6c39:	34 31                	xor    $0x31,%al
    6c3b:	34 32                	xor    $0x32,%al
    6c3d:	34 33                	xor    $0x33,%al
    6c3f:	34 34                	xor    $0x34,%al
    6c41:	34 35                	xor    $0x35,%al
    6c43:	34 36                	xor    $0x36,%al
    6c45:	34 37                	xor    $0x37,%al
    6c47:	34 38                	xor    $0x38,%al
    6c49:	34 39                	xor    $0x39,%al
    6c4b:	35 30 35 31 35       	xor    $0x35313530,%eax
    6c50:	32 35 33 35 34 35    	xor    0x35343533,%dh
    6c56:	35 35 36 35 37       	xor    $0x37353635,%eax
    6c5b:	35 38 35 39 36       	xor    $0x36393538,%eax
    6c60:	30 36                	xor    %dh,(%esi)
    6c62:	31 36                	xor    %esi,(%esi)
    6c64:	32 36                	xor    (%esi),%dh
    6c66:	33 36                	xor    (%esi),%esi
    6c68:	34 36                	xor    $0x36,%al
    6c6a:	35 36 36 36 37       	xor    $0x37363636,%eax
    6c6f:	36 38 36             	cmp    %dh,%ss:(%esi)
    6c72:	39 37                	cmp    %esi,(%edi)
    6c74:	30 37                	xor    %dh,(%edi)
    6c76:	31 37                	xor    %esi,(%edi)
    6c78:	32 37                	xor    (%edi),%dh
    6c7a:	33 37                	xor    (%edi),%esi
    6c7c:	34 37                	xor    $0x37,%al
    6c7e:	35 37 36 37 37       	xor    $0x37373637,%eax
    6c83:	37                   	aaa
    6c84:	38 37                	cmp    %dh,(%edi)
    6c86:	39 38                	cmp    %edi,(%eax)
    6c88:	30 38                	xor    %bh,(%eax)
    6c8a:	31 38                	xor    %edi,(%eax)
    6c8c:	32 38                	xor    (%eax),%bh
    6c8e:	33 38                	xor    (%eax),%edi
    6c90:	34 38                	xor    $0x38,%al
    6c92:	35 38 36 38 37       	xor    $0x37383638,%eax
    6c97:	38 38                	cmp    %bh,(%eax)
    6c99:	38 39                	cmp    %bh,(%ecx)
    6c9b:	39 30                	cmp    %esi,(%eax)
    6c9d:	39 31                	cmp    %esi,(%ecx)
    6c9f:	39 32                	cmp    %esi,(%edx)
    6ca1:	39 33                	cmp    %esi,(%ebx)
    6ca3:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    6ca6:	35 39 36 39 37       	xor    $0x37393639,%eax
    6cab:	39 38                	cmp    %edi,(%eax)
    6cad:	39 39                	cmp    %edi,(%ecx)
    6caf:	6d                   	insl   (%dx),%es:(%edi)
    6cb0:	65 6d                	gs insl (%dx),%es:(%edi)
    6cb2:	6f                   	outsl  %ds:(%esi),(%dx)
    6cb3:	72 79                	jb     6d2e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6a6>
    6cb5:	20 61 6c             	and    %ah,0x6c(%ecx)
    6cb8:	6c                   	insb   (%dx),%es:(%edi)
    6cb9:	6f                   	outsl  %ds:(%esi),(%dx)
    6cba:	63 61 74             	arpl   %esp,0x74(%ecx)
    6cbd:	69 6f 6e 20 66 61 69 	imul   $0x69616620,0x6e(%edi),%ebp
    6cc4:	6c                   	insb   (%dx),%es:(%edi)
    6cc5:	65 64 2f             	gs fs das
    6cc8:	68 6f 6d 65 2f       	push   $0x2f656d6f
    6ccd:	50                   	push   %eax
    6cce:	61                   	popa
    6ccf:	76 61                	jbe    6d32 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6aa>
    6cd1:	6c                   	insb   (%dx),%es:(%edi)
    6cd2:	2f                   	das
    6cd3:	54                   	push   %esp
    6cd4:	72 69                	jb     6d3f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6b7>
    6cd6:	67 67 65 72 73       	addr16 addr16 gs jb 6d4e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6c6>
    6cdb:	2f                   	das
    6cdc:	52                   	push   %edx
    6cdd:	75 73                	jne    6d52 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6ca>
    6cdf:	74 2f                	je     6d10 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x688>
    6ce1:	45                   	inc    %ebp
    6ce2:	6d                   	insl   (%dx),%es:(%edi)
    6ce3:	62 65 64             	bound  %esp,0x64(%ebp)
    6ce6:	64 65 64 2f          	fs gs fs das
    6cea:	70 65                	jo     6d51 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6c9>
    6cec:	74 5f                	je     6d4d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6c5>
    6cee:	6f                   	outsl  %ds:(%esi),(%dx)
    6cef:	73 2f                	jae    6d20 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x698>
    6cf1:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    6cf5:	65 6c                	gs insb (%dx),%es:(%edi)
    6cf7:	5f                   	pop    %edi
    6cf8:	74 79                	je     6d73 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6eb>
    6cfa:	70 65                	jo     6d61 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6d9>
    6cfc:	73 2f                	jae    6d2d <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6a5>
    6cfe:	73 72                	jae    6d72 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6ea>
    6d00:	63 2f                	arpl   %ebp,(%edi)
    6d02:	6f                   	outsl  %ds:(%esi),(%dx)
    6d03:	62 6a 65             	bound  %ebp,0x65(%edx)
    6d06:	63 74 2f 68          	arpl   %esi,0x68(%edi,%ebp,1)
    6d0a:	61                   	popa
    6d0b:	6e                   	outsb  %ds:(%esi),(%dx)
    6d0c:	64 6c                	fs insb (%dx),%es:(%edi)
    6d0e:	65 2e 72 73          	gs jb,pn 6d85 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6fd>
    6d12:	53                   	push   %ebx
    6d13:	79 73                	jns    6d88 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x700>
    6d15:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    6d18:	6c                   	insb   (%dx),%es:(%edi)
    6d19:	20 74 6f 20          	and    %dh,0x20(%edi,%ebp,2)
    6d1d:	72 65                	jb     6d84 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6fc>
    6d1f:	6c                   	insb   (%dx),%es:(%edi)
    6d20:	65 61                	gs popa
    6d22:	73 65                	jae    6d89 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x701>
    6d24:	20 68 61             	and    %ch,0x61(%eax)
    6d27:	6e                   	outsb  %ds:(%esi),(%dx)
    6d28:	64 6c                	fs insb (%dx),%es:(%edi)
    6d2a:	65 3a 20             	cmp    %gs:(%eax),%ah
    6d2d:	30 78 6b             	xor    %bh,0x6b(%eax)
    6d30:	65 72 6e             	gs jb  6da1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x719>
    6d33:	65 6c                	gs insb (%dx),%es:(%edi)
    6d35:	5f                   	pop    %edi
    6d36:	74 79                	je     6db1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x729>
    6d38:	70 65                	jo     6d9f <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x717>
    6d3a:	73 3a                	jae    6d76 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x6ee>
    6d3c:	3a 6f 62             	cmp    0x62(%edi),%ch
    6d3f:	6a 65                	push   $0x65
    6d41:	63 74 3a 3a          	arpl   %esi,0x3a(%edx,%edi,1)
    6d45:	68 61 6e 64 6c       	push   $0x6c646e61
    6d4a:	65 46                	gs inc %esi
    6d4c:	61                   	popa
    6d4d:	69 6c 65 64 20 74 6f 	imul   $0x206f7420,0x64(%ebp,%eiz,2),%ebp
    6d54:	20 
    6d55:	72 65                	jb     6dbc <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x734>
    6d57:	6c                   	insb   (%dx),%es:(%edi)
    6d58:	65 61                	gs popa
    6d5a:	73 65                	jae    6dc1 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x739>
    6d5c:	20 6b 65             	and    %ch,0x65(%ebx)
    6d5f:	72 6e                	jb     6dcf <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x747>
    6d61:	65 6c                	gs insb (%dx),%es:(%edi)
    6d63:	20 6f 62             	and    %ch,0x62(%edi)
    6d66:	6a 65                	push   $0x65
    6d68:	63 74 3a 20          	arpl   %esi,0x20(%edx,%edi,1)
    6d6c:	4e                   	dec    %esi
    6d6d:	6f                   	outsl  %ds:(%esi),(%dx)
    6d6e:	74 53                	je     6dc3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x73b>
    6d70:	75 70                	jne    6de2 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x75a>
    6d72:	70 6f                	jo     6de3 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x75b>
    6d74:	72 74                	jb     6dea <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x762>
    6d76:	65 64 49             	gs fs dec %ecx
    6d79:	6e                   	outsb  %ds:(%esi),(%dx)
    6d7a:	76 61                	jbe    6ddd <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x755>
    6d7c:	6c                   	insb   (%dx),%es:(%edi)
    6d7d:	69 64 44 61 74 61 4b 	imul   $0x654b6174,0x61(%esp,%eax,2),%esp
    6d84:	65 
    6d85:	72 6e                	jb     6df5 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x76d>
    6d87:	65 6c                	gs insb (%dx),%es:(%edi)
    6d89:	53                   	push   %ebx
    6d8a:	70 61                	jo     6ded <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x765>
    6d8c:	63 65 43             	arpl   %esp,0x43(%ebp)
    6d8f:	61                   	popa
    6d90:	6c                   	insb   (%dx),%es:(%edi)
    6d91:	6c                   	insb   (%dx),%es:(%edi)
    6d92:	42                   	inc    %edx
    6d93:	75 73                	jne    6e08 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x4>
    6d95:	79 52                	jns    6de9 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x761>
    6d97:	65 73 6f             	gs jae 6e09 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x5>
    6d9a:	75 72                	jne    6e0e <_ZN3log6logger3NOP17hbd4d50091fff3239E+0xa>
    6d9c:	63 65 49             	arpl   %esp,0x49(%ebp)
    6d9f:	6e                   	outsb  %ds:(%esi),(%dx)
    6da0:	76 61                	jbe    6e03 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x77b>
    6da2:	6c                   	insb   (%dx),%es:(%edi)
    6da3:	69 64 51 75 65 75 65 	imul   $0x4b657565,0x75(%ecx,%edx,2),%esp
    6daa:	4b 
    6dab:	69 6e 64 4d 6f 64 75 	imul   $0x75646f4d,0x64(%esi),%ebp
    6db2:	6c                   	insb   (%dx),%es:(%edi)
    6db3:	65 49                	gs dec %ecx
    6db5:	73 4e                	jae    6e05 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x1>
    6db7:	6f                   	outsl  %ds:(%esi),(%dx)
    6db8:	74 46                	je     6e00 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h88fb09d7d1136d6cE+0x778>
    6dba:	6f                   	outsl  %ds:(%esi),(%dx)
    6dbb:	75 6e                	jne    6e2b <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x27>
    6dbd:	64 51                	fs push %ecx
    6dbf:	75 65                	jne    6e26 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x22>
    6dc1:	75 65                	jne    6e28 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x24>
    6dc3:	49                   	dec    %ecx
    6dc4:	73 45                	jae    6e0b <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x7>
    6dc6:	6d                   	insl   (%dx),%es:(%edi)
    6dc7:	70 74                	jo     6e3d <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x39>
    6dc9:	79 49                	jns    6e14 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x10>
    6dcb:	6e                   	outsb  %ds:(%esi),(%dx)
    6dcc:	76 61                	jbe    6e2f <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2b>
    6dce:	6c                   	insb   (%dx),%es:(%edi)
    6dcf:	69 64 4d 6f 64 75 6c 	imul   $0x656c7564,0x6f(%ebp,%ecx,2),%esp
    6dd6:	65 
    6dd7:	50                   	push   %eax
    6dd8:	61                   	popa
    6dd9:	72 61                	jb     6e3c <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x38>
    6ddb:	6d                   	insl   (%dx),%es:(%edi)
    6ddc:	73 4e                	jae    6e2c <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x28>
    6dde:	6f                   	outsl  %ds:(%esi),(%dx)
    6ddf:	53                   	push   %ebx
    6de0:	70 61                	jo     6e43 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x3f>
    6de2:	63 65 49             	arpl   %esp,0x49(%ebp)
    6de5:	6e                   	outsb  %ds:(%esi),(%dx)
    6de6:	42                   	inc    %edx
    6de7:	75 66                	jne    6e4f <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x4b>
    6de9:	66 65 72 46          	data16 gs jb 6e33 <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x2f>
    6ded:	61                   	popa
    6dee:	69 6c 65 64 4f 46 46 	imul   $0x4546464f,0x64(%ebp,%eiz,2),%ebp
    6df5:	45 
    6df6:	52                   	push   %edx
    6df7:	52                   	push   %edx
    6df8:	4f                   	dec    %edi
    6df9:	52                   	push   %edx
    6dfa:	44                   	inc    %esp
    6dfb:	45                   	inc    %ebp
    6dfc:	42                   	inc    %edx
    6dfd:	55                   	push   %ebp
    6dfe:	47                   	inc    %edi
    6dff:	54                   	push   %esp
    6e00:	52                   	push   %edx
    6e01:	41                   	inc    %ecx
    6e02:	43                   	inc    %ebx
    6e03:	45                   	inc    %ebp

00006e04 <_ZN3log6logger3NOP17hbd4d50091fff3239E>:
    6e04:	2f                   	das
    6e05:	68 6f 6d 65 2f       	push   $0x2f656d6f
    6e0a:	50                   	push   %eax
    6e0b:	61                   	popa
    6e0c:	76 61                	jbe    6e6f <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x6b>
    6e0e:	6c                   	insb   (%dx),%es:(%edi)
    6e0f:	2f                   	das
    6e10:	2e 63 61 72          	arpl   %esp,%cs:0x72(%ecx)
    6e14:	67 6f                	outsl  %ds:(%si),(%dx)
    6e16:	2f                   	das
    6e17:	72 65                	jb     6e7e <__GNU_EH_FRAME_HDR+0x6>
    6e19:	67 69 73 74 72 79 2f 	imul   $0x732f7972,0x74(%bp,%di),%esi
    6e20:	73 
    6e21:	72 63                	jb     6e86 <__GNU_EH_FRAME_HDR+0xe>
    6e23:	2f                   	das
    6e24:	69 6e 64 65 78 2e 63 	imul   $0x632e7865,0x64(%esi),%ebp
    6e2b:	72 61                	jb     6e8e <__GNU_EH_FRAME_HDR+0x16>
    6e2d:	74 65                	je     6e94 <__GNU_EH_FRAME_HDR+0x1c>
    6e2f:	73 2e                	jae    6e5f <_ZN3log6logger3NOP17hbd4d50091fff3239E+0x5b>
    6e31:	69 6f 2d 31 39 34 39 	imul   $0x39343931,0x2d(%edi),%ebp
    6e38:	63 66 38             	arpl   %esp,0x38(%esi)
    6e3b:	63 36                	arpl   %esi,(%esi)
    6e3d:	62 35 62 35 35 37    	bound  %esi,0x37353562
    6e43:	66 2f                	data16 das
    6e45:	74 61                	je     6ea8 <__GNU_EH_FRAME_HDR+0x30>
    6e47:	6c                   	insb   (%dx),%es:(%edi)
    6e48:	63 2d 34 2e 34 2e    	arpl   %ebp,0x2e342e34
    6e4e:	32 2f                	xor    (%edi),%ch
    6e50:	73 72                	jae    6ec4 <__GNU_EH_FRAME_HDR+0x4c>
    6e52:	63 2f                	arpl   %ebp,(%edi)
    6e54:	74 61                	je     6eb7 <__GNU_EH_FRAME_HDR+0x3f>
    6e56:	6c                   	insb   (%dx),%es:(%edi)
    6e57:	63 2e                	arpl   %ebp,(%esi)
    6e59:	72 73                	jb     6ece <__GNU_EH_FRAME_HDR+0x56>
    6e5b:	68 65 61 70 20       	push   $0x20706165
    6e60:	63 6f 76             	arpl   %ebp,0x76(%edi)
    6e63:	65 72 73             	gs jb  6ed9 <__GNU_EH_FRAME_HDR+0x61>
    6e66:	20 74 68 65          	and    %dh,0x65(%eax,%ebp,2)
    6e6a:	20 6e 75             	and    %ch,0x75(%esi)
    6e6d:	6c                   	insb   (%dx),%es:(%edi)
    6e6e:	6c                   	insb   (%dx),%es:(%edi)
    6e6f:	20 61 64             	and    %ah,0x64(%ecx)
    6e72:	64 72 65             	fs jb  6eda <__GNU_EH_FRAME_HDR+0x62>
    6e75:	73 73                	jae    6eea <__GNU_EH_FRAME_HDR+0x72>
    6e77:	21                   	.byte 0x21

Disassembly of section .eh_frame_hdr:

00006e78 <__GNU_EH_FRAME_HDR>:
    6e78:	01 1b                	add    %ebx,(%ebx)
    6e7a:	ff                   	(bad)
    6e7b:	ff 08                	decl   (%eax)
    6e7d:	00 00                	add    %al,(%eax)
    6e7f:	00 00                	add    %al,(%eax)
    6e81:	00 00                	add    %al,(%eax)
	...

Disassembly of section .data.rel.ro:

00007d0c <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE-0x218>:
    7d0c:	ea 65 00 00 1d 00 00 	ljmp   $0x0,$0x1d000065
    7d13:	00 00                	add    %al,(%eax)
    7d15:	00 00                	add    %al,(%eax)
    7d17:	00 04 00             	add    %al,(%eax,%eax,1)
    7d1a:	00 00                	add    %al,(%eax)
    7d1c:	04 00                	add    $0x0,%al
    7d1e:	00 00                	add    %al,(%eax)
    7d20:	20 23                	and    %ah,(%ebx)
    7d22:	00 00                	add    %al,(%eax)
    7d24:	c0 19 00             	rcrb   $0x0,(%ecx)
    7d27:	00 04 01             	add    %al,(%ecx,%eax,1)
    7d2a:	00 00                	add    %al,(%eax)
    7d2c:	04 00                	add    $0x0,%al
    7d2e:	00 00                	add    %al,(%eax)
    7d30:	d0 24 00             	shlb   $1,(%eax,%eax,1)
    7d33:	00 50 18             	add    %dl,0x18(%eax)
    7d36:	00 00                	add    %al,(%eax)
    7d38:	80 19 00             	sbbb   $0x0,(%ecx)
    7d3b:	00 43 66             	add    %al,0x66(%ebx)
    7d3e:	00 00                	add    %al,(%eax)
    7d40:	42                   	inc    %edx
    7d41:	00 00                	add    %al,(%eax)
    7d43:	00 6d 00             	add    %ch,0x0(%ebp)
    7d46:	00 00                	add    %al,(%eax)
    7d48:	0e                   	push   %cs
    7d49:	00 00                	add    %al,(%eax)
    7d4b:	00 c0                	add    %al,%al
    7d4d:	19 00                	sbb    %eax,(%eax)
    7d4f:	00 04 01             	add    %al,(%ecx,%eax,1)
    7d52:	00 00                	add    %al,(%eax)
    7d54:	04 00                	add    $0x0,%al
    7d56:	00 00                	add    %al,(%eax)
    7d58:	e0 23                	loopne 7d7d <__GNU_EH_FRAME_HDR+0xf05>
    7d5a:	00 00                	add    %al,(%eax)
    7d5c:	f0 23 00             	lock and (%eax),%eax
    7d5f:	00 c0                	add    %al,%al
    7d61:	19 00                	sbb    %eax,(%eax)
    7d63:	00 8c 67 00 00 01 00 	add    %cl,0x10000(%edi,%eiz,2)
    7d6a:	00 00                	add    %al,(%eax)
    7d6c:	8d 67 00             	lea    0x0(%edi),%esp
    7d6f:	00 02                	add    %al,(%edx)
    7d71:	00 00                	add    %al,(%eax)
    7d73:	00 8f 67 00 00 02    	add    %cl,0x2000067(%edi)
    7d79:	00 00                	add    %al,(%eax)
    7d7b:	00 91 67 00 00 01    	add    %dl,0x1000067(%ecx)
    7d81:	00 00                	add    %al,(%eax)
    7d83:	00 92 67 00 00 54    	add    %dl,0x54000067(%edx)
    7d89:	00 00                	add    %al,(%eax)
    7d8b:	00 21                	add    %ah,(%ecx)
    7d8d:	00 00                	add    %al,(%eax)
    7d8f:	00 0e                	add    %cl,(%esi)
    7d91:	00 00                	add    %al,(%eax)
    7d93:	00 e6                	add    %ah,%dh
    7d95:	67 00 00             	add    %al,(%bx,%si)
    7d98:	52                   	push   %edx
    7d99:	00 00                	add    %al,(%eax)
    7d9b:	00 25 00 00 00 12    	add    %ah,0x12000000
    7da1:	00 00                	add    %al,(%eax)
    7da3:	00 38                	add    %bh,(%eax)
    7da5:	68 00 00 17 00       	push   $0x170000
    7daa:	00 00                	add    %al,(%eax)
    7dac:	a9 68 00 00 1e       	test   $0x1e000068,%eax
    7db1:	00 00                	add    %al,(%eax)
    7db3:	00 17                	add    %dl,(%edi)
    7db5:	69 00 00 14 00 00    	imul   $0x1400,(%eax),%eax
    7dbb:	00 c7                	add    %al,%bh
    7dbd:	68 00 00 42 00       	push   $0x420000
    7dc2:	00 00                	add    %al,(%eax)
    7dc4:	69 00 00 00 2c 00    	imul   $0x2c0000,(%eax),%eax
    7dca:	00 00                	add    %al,(%eax)
    7dcc:	c7                   	(bad)
    7dcd:	68 00 00 42 00       	push   $0x420000
    7dd2:	00 00                	add    %al,(%eax)
    7dd4:	6a 00                	push   $0x0
    7dd6:	00 00                	add    %al,(%eax)
    7dd8:	29 00                	sub    %eax,(%eax)
    7dda:	00 00                	add    %al,(%eax)
    7ddc:	2b 69 00             	sub    0x0(%ecx),%ebp
    7ddf:	00 0c 00             	add    %cl,(%eax,%eax,1)
    7de2:	00 00                	add    %al,(%eax)
    7de4:	c7                   	(bad)
    7de5:	68 00 00 42 00       	push   $0x420000
    7dea:	00 00                	add    %al,(%eax)
    7dec:	71 00                	jno    7dee <__GNU_EH_FRAME_HDR+0xf76>
    7dee:	00 00                	add    %al,(%eax)
    7df0:	2c 00                	sub    $0x0,%al
    7df2:	00 00                	add    %al,(%eax)
    7df4:	37                   	aaa
    7df5:	69 00 00 0b 00 00    	imul   $0xb00,(%eax),%eax
    7dfb:	00 42 69             	add    %al,0x69(%edx)
    7dfe:	00 00                	add    %al,(%eax)
    7e00:	13 00                	adc    (%eax),%eax
    7e02:	00 00                	add    %al,(%eax)
    7e04:	c2 69 00             	ret    $0x69
    7e07:	00 13                	add    %dl,(%ebx)
    7e09:	00 00                	add    %al,(%eax)
    7e0b:	00 f7                	add    %dh,%bh
    7e0d:	69 00 00 0e 00 00    	imul   $0xe00,(%eax),%eax
    7e13:	00 05 6a 00 00 0e    	add    %al,0xe00006a
    7e19:	00 00                	add    %al,(%eax)
    7e1b:	00 24 6a             	add    %ah,(%edx,%ebp,2)
    7e1e:	00 00                	add    %al,(%eax)
    7e20:	25 00 00 00 49       	and    $0x49000000,%eax
    7e25:	6a 00                	push   $0x0
    7e27:	00 11                	add    %dl,(%ecx)
    7e29:	00 00                	add    %al,(%eax)
    7e2b:	00 c7                	add    %al,%bh
    7e2d:	6a 00                	push   $0x0
    7e2f:	00 15 00 00 00 dc    	add    %dl,0xdc000000
    7e35:	6a 00                	push   $0x0
    7e37:	00 0d 00 00 00 5a    	add    %cl,0x5a000000
    7e3d:	6a 00                	push   $0x0
    7e3f:	00 6d 00             	add    %ch,0x0(%ebp)
    7e42:	00 00                	add    %al,(%eax)
    7e44:	b5 01                	mov    $0x1,%ch
    7e46:	00 00                	add    %al,(%eax)
    7e48:	0d 00 00 00 00       	or     $0x0,%eax
    7e4d:	00 00                	add    %al,(%eax)
    7e4f:	00 04 00             	add    %al,(%eax,%eax,1)
    7e52:	00 00                	add    %al,(%eax)
    7e54:	04 00                	add    $0x0,%al
    7e56:	00 00                	add    %al,(%eax)
    7e58:	30 41 00             	xor    %al,0x0(%ecx)
	...
    7e63:	00 01                	add    %al,(%ecx)
    7e65:	00 00                	add    %al,(%eax)
    7e67:	00 30                	add    %dh,(%eax)
    7e69:	43                   	inc    %ebx
    7e6a:	00 00                	add    %al,(%eax)
    7e6c:	31 6b 00             	xor    %ebp,0x0(%ebx)
    7e6f:	00 0f                	add    %cl,(%edi)
    7e71:	00 00                	add    %al,(%eax)
    7e73:	00 2e                	add    %ch,(%esi)
    7e75:	00 00                	add    %al,(%eax)
    7e77:	00 1c 00             	add    %bl,(%eax,%eax,1)
    7e7a:	00 00                	add    %al,(%eax)
    7e7c:	31 6b 00             	xor    %ebp,0x0(%ebx)
    7e7f:	00 0f                	add    %cl,(%edi)
    7e81:	00 00                	add    %al,(%eax)
    7e83:	00 62 00             	add    %ah,0x0(%edx)
    7e86:	00 00                	add    %al,(%eax)
    7e88:	0e                   	push   %cs
    7e89:	00 00                	add    %al,(%eax)
    7e8b:	00 5f 6b             	add    %bl,0x6b(%edi)
    7e8e:	00 00                	add    %al,(%eax)
    7e90:	19 00                	sbb    %eax,(%eax)
    7e92:	00 00                	add    %al,(%eax)
    7e94:	31 6b 00             	xor    %ebp,0x0(%ebx)
    7e97:	00 0f                	add    %cl,(%edi)
    7e99:	00 00                	add    %al,(%eax)
    7e9b:	00 0e                	add    %cl,(%esi)
    7e9d:	00 00                	add    %al,(%eax)
    7e9f:	00 01                	add    %al,(%ecx)
    7ea1:	00 00                	add    %al,(%eax)
    7ea3:	00 78 6b             	add    %bh,0x6b(%eax)
    7ea6:	00 00                	add    %al,(%eax)
    7ea8:	0d 00 00 00 01       	or     $0x1000000,%eax
    7ead:	00 00                	add    %al,(%eax)
    7eaf:	00 00                	add    %al,(%eax)
    7eb1:	00 00                	add    %al,(%eax)
    7eb3:	00 86 6b 00 00 01    	add    %al,0x100006b(%esi)
    7eb9:	00 00                	add    %al,(%eax)
    7ebb:	00 86 6b 00 00 01    	add    %al,0x100006b(%esi)
    7ec1:	00 00                	add    %al,(%eax)
    7ec3:	00 95 6b 00 00 20    	add    %dl,0x2000006b(%ebp)
    7ec9:	00 00                	add    %al,(%eax)
    7ecb:	00 b5 6b 00 00 12    	add    %dh,0x1200006b(%ebp)
    7ed1:	00 00                	add    %al,(%eax)
    7ed3:	00 01                	add    %al,(%ecx)
    7ed5:	00 00                	add    %al,(%eax)
    7ed7:	00 00                	add    %al,(%eax)
    7ed9:	00 00                	add    %al,(%eax)
    7edb:	00 c7                	add    %al,%bh
    7edd:	6b 00 00             	imul   $0x0,(%eax),%eax
    7ee0:	02 00                	add    (%eax),%al
    7ee2:	00 00                	add    %al,(%eax)
    7ee4:	00 00                	add    %al,(%eax)
    7ee6:	00 00                	add    %al,(%eax)
    7ee8:	0c 00                	or     $0x0,%al
    7eea:	00 00                	add    %al,(%eax)
    7eec:	04 00                	add    $0x0,%al
    7eee:	00 00                	add    %al,(%eax)
    7ef0:	40                   	inc    %eax
    7ef1:	53                   	push   %ebx
    7ef2:	00 00                	add    %al,(%eax)
    7ef4:	b0 55                	mov    $0x55,%al
    7ef6:	00 00                	add    %al,(%eax)
    7ef8:	10 56 00             	adc    %dl,0x0(%esi)
    7efb:	00 12                	add    %dl,(%edx)
    7efd:	6d                   	insl   (%dx),%es:(%edi)
    7efe:	00 00                	add    %al,(%eax)
    7f00:	1d 00 00 00 4b       	sbb    $0x4b000000,%eax
    7f05:	6d                   	insl   (%dx),%es:(%edi)
    7f06:	00 00                	add    %al,(%eax)
    7f08:	21 00                	and    %eax,(%eax)
	...
    7f12:	00 00                	add    %al,(%eax)
    7f14:	01 00                	add    %eax,(%eax)
    7f16:	00 00                	add    %al,(%eax)
    7f18:	40                   	inc    %eax
    7f19:	5a                   	pop    %edx
    7f1a:	00 00                	add    %al,(%eax)
    7f1c:	50                   	push   %eax
    7f1d:	5a                   	pop    %edx
    7f1e:	00 00                	add    %al,(%eax)
    7f20:	60                   	pusha
    7f21:	5a                   	pop    %edx
	...

00007f24 <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE>:
    7f24:	f2 6d                	repnz insl (%dx),%es:(%edi)
    7f26:	00 00                	add    %al,(%eax)
    7f28:	03 00                	add    (%eax),%eax
    7f2a:	00 00                	add    %al,(%eax)
    7f2c:	f5                   	cmc
    7f2d:	6d                   	insl   (%dx),%es:(%edi)
    7f2e:	00 00                	add    %al,(%eax)
    7f30:	05 00 00 00 cd       	add    $0xcd000000,%eax
    7f35:	6b 00 00             	imul   $0x0,(%eax),%eax
    7f38:	04 00                	add    $0x0,%al
    7f3a:	00 00                	add    %al,(%eax)
    7f3c:	d1 6b 00             	shrl   $1,0x0(%ebx)
    7f3f:	00 04 00             	add    %al,(%eax,%eax,1)
    7f42:	00 00                	add    %al,(%eax)
    7f44:	fa                   	cli
    7f45:	6d                   	insl   (%dx),%es:(%edi)
    7f46:	00 00                	add    %al,(%eax)
    7f48:	05 00 00 00 ff       	add    $0xff000000,%eax
    7f4d:	6d                   	insl   (%dx),%es:(%edi)
    7f4e:	00 00                	add    %al,(%eax)
    7f50:	05 00 00 00 5b       	add    $0x5b000000,%eax
    7f55:	6e                   	outsb  %ds:(%esi),(%dx)
    7f56:	00 00                	add    %al,(%eax)
    7f58:	1d 00 00 00 04       	sbb    $0x4000000,%eax
    7f5d:	6e                   	outsb  %ds:(%esi),(%dx)
    7f5e:	00 00                	add    %al,(%eax)
    7f60:	57                   	push   %edi
    7f61:	00 00                	add    %al,(%eax)
    7f63:	00 dc                	add    %bl,%ah
    7f65:	02 00                	add    (%eax),%al
    7f67:	00 09                	add    %cl,(%ecx)
    7f69:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

00007f6c <_DYNAMIC>:
    7f6c:	f5                   	cmc
    7f6d:	fe                   	(bad)
    7f6e:	ff 6f 14             	ljmp   *0x14(%edi)
    7f71:	60                   	pusha
    7f72:	00 00                	add    %al,(%eax)
    7f74:	05 00 00 00 3c       	add    $0x3c000000,%eax
    7f79:	60                   	pusha
    7f7a:	00 00                	add    %al,(%eax)
    7f7c:	06                   	push   %es
    7f7d:	00 00                	add    %al,(%eax)
    7f7f:	00 2c 60             	add    %ch,(%eax,%eiz,2)
    7f82:	00 00                	add    %al,(%eax)
    7f84:	0a 00                	or     (%eax),%al
    7f86:	00 00                	add    %al,(%eax)
    7f88:	01 00                	add    %eax,(%eax)
    7f8a:	00 00                	add    %al,(%eax)
    7f8c:	0b 00                	or     (%eax),%eax
    7f8e:	00 00                	add    %al,(%eax)
    7f90:	10 00                	adc    %al,(%eax)
    7f92:	00 00                	add    %al,(%eax)
    7f94:	15 00 00 00 00       	adc    $0x0,%eax
    7f99:	00 00                	add    %al,(%eax)
    7f9b:	00 11                	add    %dl,(%ecx)
    7f9d:	00 00                	add    %al,(%eax)
    7f9f:	00 40 60             	add    %al,0x60(%eax)
    7fa2:	00 00                	add    %al,(%eax)
    7fa4:	12 00                	adc    (%eax),%al
    7fa6:	00 00                	add    %al,(%eax)
    7fa8:	08 02                	or     %al,(%edx)
    7faa:	00 00                	add    %al,(%eax)
    7fac:	13 00                	adc    (%eax),%eax
    7fae:	00 00                	add    %al,(%eax)
    7fb0:	08 00                	or     %al,(%eax)
    7fb2:	00 00                	add    %al,(%eax)
    7fb4:	1e                   	push   %ds
    7fb5:	00 00                	add    %al,(%eax)
    7fb7:	00 08                	add    %cl,(%eax)
    7fb9:	00 00                	add    %al,(%eax)
    7fbb:	00 fb                	add    %bh,%bl
    7fbd:	ff                   	(bad)
    7fbe:	ff 6f 01             	ljmp   *0x1(%edi)
    7fc1:	00 00                	add    %al,(%eax)
    7fc3:	08 fa                	or     %bh,%dl
    7fc5:	ff                   	(bad)
    7fc6:	ff 6f 41             	ljmp   *0x41(%edi)
	...

Disassembly of section .got:

00007ff4 <_GLOBAL_OFFSET_TABLE_>:
    7ff4:	6c                   	insb   (%dx),%es:(%edi)
    7ff5:	7f 00                	jg     7ff7 <_GLOBAL_OFFSET_TABLE_+0x3>
	...

Disassembly of section .data:

00008000 <_ZN10kernel_lib9allocator9ALLOCATOR17h561233108ae65dc6E>:
    8000:	00 00                	add    %al,(%eax)
    8002:	00 00                	add    %al,(%eax)
    8004:	00 90 00 00 10 b7    	add    %dl,-0x48f00000(%eax)
	...

00008018 <_ZN3log6LOGGER17hf5b26e2073f66ae9E.0>:
    8018:	01 00                	add    %eax,(%eax)
	...

0000801c <_ZN3log6LOGGER17hf5b26e2073f66ae9E.1>:
    801c:	0c 7f                	or     $0x7f,%al
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	72 75                	jb     77 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE-0xf89>
   2:	73 74                	jae    78 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE-0xf88>
   4:	63 20                	arpl   %esp,(%eax)
   6:	76 65                	jbe    6d <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE-0xf93>
   8:	72 73                	jb     7d <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE-0xf83>
   a:	69 6f 6e 20 31 2e 38 	imul   $0x382e3120,0x6e(%edi),%ebp
  11:	38 2e                	cmp    %ch,(%esi)
  13:	30 2d 6e 69 67 68    	xor    %ch,0x6867696e
  19:	74 6c                	je     87 <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE-0xf79>
  1b:	79 20                	jns    3d <_ZN5alloc5alloc18handle_alloc_error17h692534c446c02bcdE-0xfc3>
  1d:	28 39                	sub    %bh,(%ecx)
  1f:	33 34 38             	xor    (%eax,%edi,1),%esi
  22:	38 30                	cmp    %dh,(%eax)
  24:	66 35 38 20          	xor    $0x2038,%ax
  28:	32 30                	xor    (%eax),%dh
  2a:	32 35 2d 30 34 2d    	xor    0x2d34302d,%dh
  30:	30 39                	xor    %bh,(%ecx)
  32:	29 00                	sub    %eax,(%eax)
