
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
 1a3:	00 e6                	add    %ah,%dh
 1a5:	20 71 c8             	and    %dh,-0x38(%ecx)
 1a8:	ad                   	lods   %ds:(%esi),%eax
 1a9:	34 ab                	xor    $0xab,%al
 1ab:	e8 73 7f e2 7f       	call   7fe28123 <_end+0x7fe23113>
 1b0:	91                   	xchg   %eax,%ecx
 1b1:	6b c3 28             	imul   $0x28,%ebx,%eax
 1b4:	c6                   	(bad)
 1b5:	17                   	pop    %ss
 1b6:	87 18                	xchg   %ebx,(%eax)

Disassembly of section .text:

00001000 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>:
    1000:	53                   	push   %ebx
    1001:	83 ec 18             	sub    $0x18,%esp
    1004:	e8 00 00 00 00       	call   1009 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE+0x9>
    1009:	5b                   	pop    %ebx
    100a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    100e:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    1012:	81 c3 eb 3f 00 00    	add    $0x3feb,%ebx
    1018:	8d 83 d8 fe ff ff    	lea    -0x128(%ebx),%eax
    101e:	89 44 24 10          	mov    %eax,0x10(%esp)
    1022:	66 c7 44 24 14 01 00 	movw   $0x1,0x14(%esp)
    1029:	e8 c2 04 00 00       	call   14f0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>
    102e:	66 90                	xchg   %ax,%ax

00001030 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>:
    1030:	53                   	push   %ebx
    1031:	83 ec 38             	sub    $0x38,%esp
    1034:	e8 00 00 00 00       	call   1039 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E+0x9>
    1039:	5b                   	pop    %ebx
    103a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    103e:	89 e2                	mov    %esp,%edx
    1040:	81 c3 bb 3f 00 00    	add    $0x3fbb,%ebx
    1046:	89 54 24 10          	mov    %edx,0x10(%esp)
    104a:	8d 54 24 08          	lea    0x8(%esp),%edx
    104e:	8d 8b c8 fe ff ff    	lea    -0x138(%ebx),%ecx
    1054:	8d 83 e4 e2 ff ff    	lea    -0x1d1c(%ebx),%eax
    105a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    105e:	8d 8b 0c ce ff ff    	lea    -0x31f4(%ebx),%ecx
    1064:	89 04 24             	mov    %eax,(%esp)
    1067:	c7 44 24 04 2b 00 00 	movl   $0x2b,0x4(%esp)
    106e:	00 
    106f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1073:	8d 8b 3c ce ff ff    	lea    -0x31c4(%ebx),%ecx
    1079:	89 54 24 18          	mov    %edx,0x18(%esp)
    107d:	8d 93 08 ff ff ff    	lea    -0xf8(%ebx),%edx
    1083:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    1087:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    108b:	89 54 24 20          	mov    %edx,0x20(%esp)
    108f:	c7 44 24 24 02 00 00 	movl   $0x2,0x24(%esp)
    1096:	00 
    1097:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
    109e:	00 
    109f:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    10a3:	8d 4c 24 20          	lea    0x20(%esp),%ecx
    10a7:	c7 44 24 2c 02 00 00 	movl   $0x2,0x2c(%esp)
    10ae:	00 
    10af:	e8 4c ff ff ff       	call   1000 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>
    10b4:	66 90                	xchg   %ax,%ax
    10b6:	66 90                	xchg   %ax,%ax
    10b8:	66 90                	xchg   %ax,%ax
    10ba:	66 90                	xchg   %ax,%ax
    10bc:	66 90                	xchg   %ax,%ax
    10be:	66 90                	xchg   %ax,%ax

000010c0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hdc00fe1dd44fc632E>:
    10c0:	53                   	push   %ebx
    10c1:	56                   	push   %esi
    10c2:	50                   	push   %eax
    10c3:	8b 44 24 14          	mov    0x14(%esp),%eax
    10c7:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    10cb:	e8 00 00 00 00       	call   10d0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hdc00fe1dd44fc632E+0x10>
    10d0:	5b                   	pop    %ebx
    10d1:	81 c3 24 3f 00 00    	add    $0x3f24,%ebx
    10d7:	8b 31                	mov    (%ecx),%esi
    10d9:	8b 08                	mov    (%eax),%ecx
    10db:	8b 50 04             	mov    0x4(%eax),%edx
    10de:	89 34 24             	mov    %esi,(%esp)
    10e1:	e8 7a 0d 00 00       	call   1e60 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    10e6:	83 c4 04             	add    $0x4,%esp
    10e9:	5e                   	pop    %esi
    10ea:	5b                   	pop    %ebx
    10eb:	c3                   	ret
    10ec:	66 90                	xchg   %ax,%ax
    10ee:	66 90                	xchg   %ax,%ax

000010f0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE>:
    10f0:	55                   	push   %ebp
    10f1:	53                   	push   %ebx
    10f2:	57                   	push   %edi
    10f3:	56                   	push   %esi
    10f4:	83 ec 3c             	sub    $0x3c,%esp
    10f7:	8b 44 24 54          	mov    0x54(%esp),%eax
    10fb:	8b 4c 24 50          	mov    0x50(%esp),%ecx
    10ff:	e8 00 00 00 00       	call   1104 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0x14>
    1104:	5b                   	pop    %ebx
    1105:	81 c3 f0 3e 00 00    	add    $0x3ef0,%ebx
    110b:	8b 09                	mov    (%ecx),%ecx
    110d:	8b 70 04             	mov    0x4(%eax),%esi
    1110:	8b 28                	mov    (%eax),%ebp
    1112:	8b 11                	mov    (%ecx),%edx
    1114:	8b 79 04             	mov    0x4(%ecx),%edi
    1117:	8b 4e 0c             	mov    0xc(%esi),%ecx
    111a:	89 54 24 04          	mov    %edx,0x4(%esp)
    111e:	83 ec 04             	sub    $0x4,%esp
    1121:	8d 83 40 e3 ff ff    	lea    -0x1cc0(%ebx),%eax
    1127:	6a 0c                	push   $0xc
    1129:	50                   	push   %eax
    112a:	55                   	push   %ebp
    112b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    112f:	ff d1                	call   *%ecx
    1131:	83 c4 10             	add    $0x10,%esp
    1134:	b1 01                	mov    $0x1,%cl
    1136:	84 c0                	test   %al,%al
    1138:	0f 85 cb 00 00 00    	jne    1209 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0x119>
    113e:	8d 47 08             	lea    0x8(%edi),%eax
    1141:	8d 8b 0c ce ff ff    	lea    -0x31f4(%ebx),%ecx
    1147:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    114b:	83 c7 0c             	add    $0xc,%edi
    114e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1152:	89 44 24 14          	mov    %eax,0x14(%esp)
    1156:	8d 83 8c d0 ff ff    	lea    -0x2f74(%ebx),%eax
    115c:	89 44 24 18          	mov    %eax,0x18(%esp)
    1160:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    1164:	89 44 24 20          	mov    %eax,0x20(%esp)
    1168:	8d 83 f0 fe ff ff    	lea    -0x110(%ebx),%eax
    116e:	8d 7c 24 0c          	lea    0xc(%esp),%edi
    1172:	89 44 24 24          	mov    %eax,0x24(%esp)
    1176:	c7 44 24 28 03 00 00 	movl   $0x3,0x28(%esp)
    117d:	00 
    117e:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
    1185:	00 
    1186:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    118a:	c7 44 24 30 03 00 00 	movl   $0x3,0x30(%esp)
    1191:	00 
    1192:	83 ec 0c             	sub    $0xc,%esp
    1195:	8d 44 24 30          	lea    0x30(%esp),%eax
    1199:	89 e9                	mov    %ebp,%ecx
    119b:	89 f2                	mov    %esi,%edx
    119d:	50                   	push   %eax
    119e:	e8 bd 0c 00 00       	call   1e60 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    11a3:	83 c4 10             	add    $0x10,%esp
    11a6:	84 c0                	test   %al,%al
    11a8:	74 04                	je     11ae <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0xbe>
    11aa:	b1 01                	mov    $0x1,%cl
    11ac:	eb 5b                	jmp    1209 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0x119>
    11ae:	83 ec 04             	sub    $0x4,%esp
    11b1:	8d 83 4c e3 ff ff    	lea    -0x1cb4(%ebx),%eax
    11b7:	6a 02                	push   $0x2
    11b9:	50                   	push   %eax
    11ba:	55                   	push   %ebp
    11bb:	ff 54 24 18          	call   *0x18(%esp)
    11bf:	83 c4 10             	add    $0x10,%esp
    11c2:	84 c0                	test   %al,%al
    11c4:	b1 01                	mov    $0x1,%cl
    11c6:	75 41                	jne    1209 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0x119>
    11c8:	8b 44 24 04          	mov    0x4(%esp),%eax
    11cc:	f2 0f 10 00          	movsd  (%eax),%xmm0
    11d0:	f2 0f 10 48 08       	movsd  0x8(%eax),%xmm1
    11d5:	f2 0f 11 44 24 0c    	movsd  %xmm0,0xc(%esp)
    11db:	f2 0f 10 40 10       	movsd  0x10(%eax),%xmm0
    11e0:	f2 0f 11 4c 24 14    	movsd  %xmm1,0x14(%esp)
    11e6:	f2 0f 11 44 24 1c    	movsd  %xmm0,0x1c(%esp)
    11ec:	8b 44 24 10          	mov    0x10(%esp),%eax
    11f0:	83 f8 01             	cmp    $0x1,%eax
    11f3:	74 02                	je     11f7 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0x107>
    11f5:	85 c0                	test   %eax,%eax
    11f7:	83 ec 0c             	sub    $0xc,%esp
    11fa:	89 e9                	mov    %ebp,%ecx
    11fc:	89 f2                	mov    %esi,%edx
    11fe:	57                   	push   %edi
    11ff:	e8 5c 0c 00 00       	call   1e60 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    1204:	83 c4 10             	add    $0x10,%esp
    1207:	89 c1                	mov    %eax,%ecx
    1209:	89 c8                	mov    %ecx,%eax
    120b:	83 c4 3c             	add    $0x3c,%esp
    120e:	5e                   	pop    %esi
    120f:	5f                   	pop    %edi
    1210:	5b                   	pop    %ebx
    1211:	5d                   	pop    %ebp
    1212:	c3                   	ret
    1213:	66 90                	xchg   %ax,%ax
    1215:	66 90                	xchg   %ax,%ax
    1217:	66 90                	xchg   %ax,%ax
    1219:	66 90                	xchg   %ax,%ax
    121b:	66 90                	xchg   %ax,%ax
    121d:	66 90                	xchg   %ax,%ax
    121f:	90                   	nop

00001220 <_ZN4core3fmt5Write10write_char17h54325554a6473229E>:
    1220:	53                   	push   %ebx
    1221:	57                   	push   %edi
    1222:	56                   	push   %esi
    1223:	83 ec 10             	sub    $0x10,%esp
    1226:	8b 44 24 24          	mov    0x24(%esp),%eax
    122a:	8b 74 24 20          	mov    0x20(%esp),%esi
    122e:	e8 00 00 00 00       	call   1233 <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0x13>
    1233:	5b                   	pop    %ebx
    1234:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    123b:	00 
    123c:	81 c3 c1 3d 00 00    	add    $0x3dc1,%ebx
    1242:	3d 80 00 00 00       	cmp    $0x80,%eax
    1247:	73 1f                	jae    1268 <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0x48>
    1249:	88 44 24 0c          	mov    %al,0xc(%esp)
    124d:	b8 01 00 00 00       	mov    $0x1,%eax
    1252:	8b 0e                	mov    (%esi),%ecx
    1254:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    1257:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    125d:	0f 86 b9 00 00 00    	jbe    131c <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0xfc>
    1263:	e9 cc 00 00 00       	jmp    1334 <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0x114>
    1268:	89 c1                	mov    %eax,%ecx
    126a:	3d 00 08 00 00       	cmp    $0x800,%eax
    126f:	73 2d                	jae    129e <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0x7e>
    1271:	c1 e9 06             	shr    $0x6,%ecx
    1274:	24 3f                	and    $0x3f,%al
    1276:	80 c9 c0             	or     $0xc0,%cl
    1279:	0c 80                	or     $0x80,%al
    127b:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    127f:	88 44 24 0d          	mov    %al,0xd(%esp)
    1283:	b8 02 00 00 00       	mov    $0x2,%eax
    1288:	8b 0e                	mov    (%esi),%ecx
    128a:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    128d:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    1293:	0f 86 83 00 00 00    	jbe    131c <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0xfc>
    1299:	e9 96 00 00 00       	jmp    1334 <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0x114>
    129e:	3d 00 00 01 00       	cmp    $0x10000,%eax
    12a3:	73 35                	jae    12da <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0xba>
    12a5:	c1 e9 0c             	shr    $0xc,%ecx
    12a8:	80 c9 e0             	or     $0xe0,%cl
    12ab:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    12af:	89 c1                	mov    %eax,%ecx
    12b1:	24 3f                	and    $0x3f,%al
    12b3:	c1 e9 06             	shr    $0x6,%ecx
    12b6:	0c 80                	or     $0x80,%al
    12b8:	80 e1 3f             	and    $0x3f,%cl
    12bb:	80 c9 80             	or     $0x80,%cl
    12be:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    12c2:	88 44 24 0e          	mov    %al,0xe(%esp)
    12c6:	b8 03 00 00 00       	mov    $0x3,%eax
    12cb:	8b 0e                	mov    (%esi),%ecx
    12cd:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    12d0:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    12d6:	76 44                	jbe    131c <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0xfc>
    12d8:	eb 5a                	jmp    1334 <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0x114>
    12da:	c1 e9 12             	shr    $0x12,%ecx
    12dd:	80 c9 f0             	or     $0xf0,%cl
    12e0:	88 4c 24 0c          	mov    %cl,0xc(%esp)
    12e4:	89 c1                	mov    %eax,%ecx
    12e6:	c1 e9 0c             	shr    $0xc,%ecx
    12e9:	80 e1 3f             	and    $0x3f,%cl
    12ec:	80 c9 80             	or     $0x80,%cl
    12ef:	88 4c 24 0d          	mov    %cl,0xd(%esp)
    12f3:	89 c1                	mov    %eax,%ecx
    12f5:	24 3f                	and    $0x3f,%al
    12f7:	c1 e9 06             	shr    $0x6,%ecx
    12fa:	0c 80                	or     $0x80,%al
    12fc:	80 e1 3f             	and    $0x3f,%cl
    12ff:	80 c9 80             	or     $0x80,%cl
    1302:	88 4c 24 0e          	mov    %cl,0xe(%esp)
    1306:	88 44 24 0f          	mov    %al,0xf(%esp)
    130a:	b8 04 00 00 00       	mov    $0x4,%eax
    130f:	8b 0e                	mov    (%esi),%ecx
    1311:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    1314:	81 ff ff 00 00 00    	cmp    $0xff,%edi
    131a:	77 18                	ja     1334 <_ZN4core3fmt5Write10write_char17h54325554a6473229E+0x114>
    131c:	8d 4c 0e 04          	lea    0x4(%esi,%ecx,1),%ecx
    1320:	83 ec 04             	sub    $0x4,%esp
    1323:	8d 54 24 10          	lea    0x10(%esp),%edx
    1327:	50                   	push   %eax
    1328:	52                   	push   %edx
    1329:	51                   	push   %ecx
    132a:	e8 11 14 00 00       	call   2740 <memcpy>
    132f:	83 c4 10             	add    $0x10,%esp
    1332:	89 3e                	mov    %edi,(%esi)
    1334:	81 ff 00 01 00 00    	cmp    $0x100,%edi
    133a:	0f 93 c0             	setae  %al
    133d:	83 c4 10             	add    $0x10,%esp
    1340:	5e                   	pop    %esi
    1341:	5f                   	pop    %edi
    1342:	5b                   	pop    %ebx
    1343:	c3                   	ret
    1344:	66 90                	xchg   %ax,%ax
    1346:	66 90                	xchg   %ax,%ax
    1348:	66 90                	xchg   %ax,%ax
    134a:	66 90                	xchg   %ax,%ax
    134c:	66 90                	xchg   %ax,%ax
    134e:	66 90                	xchg   %ax,%ax

00001350 <_ZN4core3fmt5Write9write_fmt17h9a7087d9f1ef62a1E>:
    1350:	53                   	push   %ebx
    1351:	83 ec 08             	sub    $0x8,%esp
    1354:	8b 44 24 14          	mov    0x14(%esp),%eax
    1358:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    135c:	e8 00 00 00 00       	call   1361 <_ZN4core3fmt5Write9write_fmt17h9a7087d9f1ef62a1E+0x11>
    1361:	5b                   	pop    %ebx
    1362:	81 c3 93 3c 00 00    	add    $0x3c93,%ebx
    1368:	8b 50 04             	mov    0x4(%eax),%edx
    136b:	83 fa 01             	cmp    $0x1,%edx
    136e:	74 02                	je     1372 <_ZN4core3fmt5Write9write_fmt17h9a7087d9f1ef62a1E+0x22>
    1370:	85 d2                	test   %edx,%edx
    1372:	8d 93 70 fe ff ff    	lea    -0x190(%ebx),%edx
    1378:	89 04 24             	mov    %eax,(%esp)
    137b:	e8 e0 0a 00 00       	call   1e60 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    1380:	83 c4 08             	add    $0x8,%esp
    1383:	5b                   	pop    %ebx
    1384:	c3                   	ret
    1385:	66 90                	xchg   %ax,%ax
    1387:	66 90                	xchg   %ax,%ax
    1389:	66 90                	xchg   %ax,%ax
    138b:	66 90                	xchg   %ax,%ax
    138d:	66 90                	xchg   %ax,%ax
    138f:	90                   	nop

00001390 <_ZN4core3ptr56drop_in_place$LT$kernel_lib..logging..BufferedLogger$GT$17h1137ac6ddcb79ceeE>:
    1390:	c3                   	ret
    1391:	66 90                	xchg   %ax,%ax
    1393:	66 90                	xchg   %ax,%ax
    1395:	66 90                	xchg   %ax,%ax
    1397:	66 90                	xchg   %ax,%ax
    1399:	66 90                	xchg   %ax,%ax
    139b:	66 90                	xchg   %ax,%ax
    139d:	66 90                	xchg   %ax,%ax
    139f:	90                   	nop

000013a0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$7enabled17h90df63bac7ebc197E>:
    13a0:	b0 01                	mov    $0x1,%al
    13a2:	c3                   	ret
    13a3:	66 90                	xchg   %ax,%ax
    13a5:	66 90                	xchg   %ax,%ax
    13a7:	66 90                	xchg   %ax,%ax
    13a9:	66 90                	xchg   %ax,%ax
    13ab:	66 90                	xchg   %ax,%ax
    13ad:	66 90                	xchg   %ax,%ax
    13af:	90                   	nop

000013b0 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h54961684dc6a0e53E>:
    13b0:	53                   	push   %ebx
    13b1:	81 ec 48 01 00 00    	sub    $0x148,%esp
    13b7:	8b 84 24 54 01 00 00 	mov    0x154(%esp),%eax
    13be:	e8 00 00 00 00       	call   13c3 <_ZN64_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$log..Log$GT$3log17h54961684dc6a0e53E+0x13>
    13c3:	5b                   	pop    %ebx
    13c4:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%esp)
    13cb:	00 
    13cc:	81 c3 31 3c 00 00    	add    $0x3c31,%ebx
    13d2:	8b 48 20             	mov    0x20(%eax),%ecx
    13d5:	8b 50 28             	mov    0x28(%eax),%edx
    13d8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    13dc:	8b 48 24             	mov    0x24(%eax),%ecx
    13df:	83 c0 2c             	add    $0x2c,%eax
    13e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    13e6:	8d 44 24 04          	lea    0x4(%esp),%eax
    13ea:	89 44 24 0c          	mov    %eax,0xc(%esp)
    13ee:	8d 83 dc d6 ff ff    	lea    -0x2924(%ebx),%eax
    13f4:	89 44 24 10          	mov    %eax,0x10(%esp)
    13f8:	8d 44 24 24          	lea    0x24(%esp),%eax
    13fc:	89 44 24 14          	mov    %eax,0x14(%esp)
    1400:	8d 83 0c ce ff ff    	lea    -0x31f4(%ebx),%eax
    1406:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    140a:	89 54 24 28          	mov    %edx,0x28(%esp)
    140e:	8d 93 70 fe ff ff    	lea    -0x190(%ebx),%edx
    1414:	8d 4c 24 44          	lea    0x44(%esp),%ecx
    1418:	89 44 24 18          	mov    %eax,0x18(%esp)
    141c:	8d 44 24 08          	lea    0x8(%esp),%eax
    1420:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1424:	8d 83 cc c0 ff ff    	lea    -0x3f34(%ebx),%eax
    142a:	89 44 24 20          	mov    %eax,0x20(%esp)
    142e:	8d 83 a0 fe ff ff    	lea    -0x160(%ebx),%eax
    1434:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    1438:	8d 44 24 0c          	lea    0xc(%esp),%eax
    143c:	c7 44 24 30 04 00 00 	movl   $0x4,0x30(%esp)
    1443:	00 
    1444:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
    144b:	00 
    144c:	89 44 24 34          	mov    %eax,0x34(%esp)
    1450:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    1454:	c7 44 24 38 03 00 00 	movl   $0x3,0x38(%esp)
    145b:	00 
    145c:	89 04 24             	mov    %eax,(%esp)
    145f:	e8 fc 09 00 00       	call   1e60 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    1464:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    1468:	8d 44 24 48          	lea    0x48(%esp),%eax
    146c:	8d 54 24 0c          	lea    0xc(%esp),%edx
    1470:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1474:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1478:	89 44 24 14          	mov    %eax,0x14(%esp)
    147c:	b8 02 00 00 00       	mov    $0x2,%eax
    1481:	cd 80                	int    $0x80
    1483:	81 c4 48 01 00 00    	add    $0x148,%esp
    1489:	5b                   	pop    %ebx
    148a:	c3                   	ret
    148b:	66 90                	xchg   %ax,%ax
    148d:	66 90                	xchg   %ax,%ax
    148f:	90                   	nop

00001490 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h1c51c00f207a4e67E>:
    1490:	53                   	push   %ebx
    1491:	57                   	push   %edi
    1492:	56                   	push   %esi
    1493:	8b 7c 24 10          	mov    0x10(%esp),%edi
    1497:	8b 44 24 18          	mov    0x18(%esp),%eax
    149b:	e8 00 00 00 00       	call   14a0 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h1c51c00f207a4e67E+0x10>
    14a0:	5b                   	pop    %ebx
    14a1:	81 c3 54 3b 00 00    	add    $0x3b54,%ebx
    14a7:	8b 0f                	mov    (%edi),%ecx
    14a9:	8d 34 01             	lea    (%ecx,%eax,1),%esi
    14ac:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    14b2:	0f 93 c2             	setae  %dl
    14b5:	85 c0                	test   %eax,%eax
    14b7:	0f 94 c6             	sete   %dh
    14ba:	08 d6                	or     %dl,%dh
    14bc:	75 17                	jne    14d5 <_ZN72_$LT$kernel_lib..logging..BufferedLogger$u20$as$u20$core..fmt..Write$GT$9write_str17h1c51c00f207a4e67E+0x45>
    14be:	8d 4c 0f 04          	lea    0x4(%edi,%ecx,1),%ecx
    14c2:	83 ec 04             	sub    $0x4,%esp
    14c5:	50                   	push   %eax
    14c6:	ff 74 24 1c          	push   0x1c(%esp)
    14ca:	51                   	push   %ecx
    14cb:	e8 70 12 00 00       	call   2740 <memcpy>
    14d0:	83 c4 10             	add    $0x10,%esp
    14d3:	89 37                	mov    %esi,(%edi)
    14d5:	81 fe 00 01 00 00    	cmp    $0x100,%esi
    14db:	0f 93 c0             	setae  %al
    14de:	5e                   	pop    %esi
    14df:	5f                   	pop    %edi
    14e0:	5b                   	pop    %ebx
    14e1:	c3                   	ret
    14e2:	66 90                	xchg   %ax,%ax
    14e4:	66 90                	xchg   %ax,%ax
    14e6:	66 90                	xchg   %ax,%ax
    14e8:	66 90                	xchg   %ax,%ax
    14ea:	66 90                	xchg   %ax,%ax
    14ec:	66 90                	xchg   %ax,%ax
    14ee:	66 90                	xchg   %ax,%ax

000014f0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind>:
    14f0:	53                   	push   %ebx
    14f1:	83 ec 58             	sub    $0x58,%esp
    14f4:	e8 00 00 00 00       	call   14f9 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0x9>
    14f9:	5b                   	pop    %ebx
    14fa:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    14fe:	81 c3 fb 3a 00 00    	add    $0x3afb,%ebx
    1504:	8b 83 18 00 00 00    	mov    0x18(%ebx),%eax
    150a:	85 c0                	test   %eax,%eax
    150c:	0f 84 ce 00 00 00    	je     15e0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    1512:	8d 44 24 08          	lea    0x8(%esp),%eax
    1516:	8d 8b c0 fe ff ff    	lea    -0x140(%ebx),%ecx
    151c:	c7 44 24 34 01 00 00 	movl   $0x1,0x34(%esp)
    1523:	00 
    1524:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1528:	8d 83 fc c0 ff ff    	lea    -0x3f04(%ebx),%eax
    152e:	89 44 24 10          	mov    %eax,0x10(%esp)
    1532:	8d 83 d8 e2 ff ff    	lea    -0x1d28(%ebx),%eax
    1538:	89 44 24 38          	mov    %eax,0x38(%esp)
    153c:	c7 44 24 3c 0a 00 00 	movl   $0xa,0x3c(%esp)
    1543:	00 
    1544:	89 4c 24 40          	mov    %ecx,0x40(%esp)
    1548:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    154c:	c7 44 24 44 01 00 00 	movl   $0x1,0x44(%esp)
    1553:	00 
    1554:	89 4c 24 48          	mov    %ecx,0x48(%esp)
    1558:	c7 44 24 4c 01 00 00 	movl   $0x1,0x4c(%esp)
    155f:	00 
    1560:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    1567:	00 
    1568:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    156f:	00 
    1570:	89 44 24 20          	mov    %eax,0x20(%esp)
    1574:	8d 83 99 e2 ff ff    	lea    -0x1d67(%ebx),%eax
    157a:	c7 44 24 24 0a 00 00 	movl   $0xa,0x24(%esp)
    1581:	00 
    1582:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    1589:	00 
    158a:	8d 8b 3b e4 ff ff    	lea    -0x1bc5(%ebx),%ecx
    1590:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    1594:	c7 44 24 30 3f 00 00 	movl   $0x3f,0x30(%esp)
    159b:	00 
    159c:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    15a3:	00 
    15a4:	c7 44 24 18 11 00 00 	movl   $0x11,0x18(%esp)
    15ab:	00 
    15ac:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
    15b2:	83 f8 02             	cmp    $0x2,%eax
    15b5:	8d 83 30 ff ff ff    	lea    -0xd0(%ebx),%eax
    15bb:	0f 44 83 10 00 00 00 	cmove  0x10(%ebx),%eax
    15c2:	0f 44 8b 0c 00 00 00 	cmove  0xc(%ebx),%ecx
    15c9:	83 ec 08             	sub    $0x8,%esp
    15cc:	8d 54 24 1c          	lea    0x1c(%esp),%edx
    15d0:	52                   	push   %edx
    15d1:	51                   	push   %ecx
    15d2:	ff 50 10             	call   *0x10(%eax)
    15d5:	83 c4 10             	add    $0x10,%esp
    15d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
    15df:	00 
    15e0:	eb fe                	jmp    15e0 <_RNvCs9xNfxAkRhBx_7___rustc17rust_begin_unwind+0xf0>
    15e2:	66 90                	xchg   %ax,%ax
    15e4:	66 90                	xchg   %ax,%ax
    15e6:	66 90                	xchg   %ax,%ax
    15e8:	66 90                	xchg   %ax,%ax
    15ea:	66 90                	xchg   %ax,%ax
    15ec:	66 90                	xchg   %ax,%ax
    15ee:	66 90                	xchg   %ax,%ax

000015f0 <init>:
    15f0:	55                   	push   %ebp
    15f1:	53                   	push   %ebx
    15f2:	57                   	push   %edi
    15f3:	56                   	push   %esi
    15f4:	83 ec 5c             	sub    $0x5c,%esp
    15f7:	e8 00 00 00 00       	call   15fc <init+0xc>
    15fc:	5b                   	pop    %ebx
    15fd:	b9 01 00 00 00       	mov    $0x1,%ecx
    1602:	31 c0                	xor    %eax,%eax
    1604:	81 c3 f8 39 00 00    	add    $0x39f8,%ebx
    160a:	f0 0f b1 8b 14 00 00 	lock cmpxchg %ecx,0x14(%ebx)
    1611:	00 
    1612:	0f 85 0a 01 00 00    	jne    1722 <init+0x132>
    1618:	8d 8b 88 fe ff ff    	lea    -0x178(%ebx),%ecx
    161e:	8d 83 7c e1 ff ff    	lea    -0x1e84(%ebx),%eax
    1624:	8d b3 3b e3 ff ff    	lea    -0x1cc5(%ebx),%esi
    162a:	8d 93 e8 fe ff ff    	lea    -0x118(%ebx),%edx
    1630:	8d bb 30 ff ff ff    	lea    -0xd0(%ebx),%edi
    1636:	8d ab 3b e4 ff ff    	lea    -0x1bc5(%ebx),%ebp
    163c:	89 8b 10 00 00 00    	mov    %ecx,0x10(%ebx)
    1642:	8d 8b 1d e3 ff ff    	lea    -0x1ce3(%ebx),%ecx
    1648:	89 83 0c 00 00 00    	mov    %eax,0xc(%ebx)
    164e:	c7 83 14 00 00 00 02 	movl   $0x2,0x14(%ebx)
    1655:	00 00 00 
    1658:	c7 83 18 00 00 00 03 	movl   $0x3,0x18(%ebx)
    165f:	00 00 00 
    1662:	89 54 24 14          	mov    %edx,0x14(%esp)
    1666:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    166a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
    1670:	8b 83 18 00 00 00    	mov    0x18(%ebx),%eax
    1676:	83 f8 03             	cmp    $0x3,%eax
    1679:	72 f5                	jb     1670 <init+0x80>
    167b:	8b 44 24 14          	mov    0x14(%esp),%eax
    167f:	c7 44 24 38 03 00 00 	movl   $0x3,0x38(%esp)
    1686:	00 
    1687:	89 74 24 3c          	mov    %esi,0x3c(%esp)
    168b:	c7 44 24 40 03 00 00 	movl   $0x3,0x40(%esp)
    1692:	00 
    1693:	89 44 24 44          	mov    %eax,0x44(%esp)
    1697:	8b 44 24 10          	mov    0x10(%esp),%eax
    169b:	c7 44 24 48 01 00 00 	movl   $0x1,0x48(%esp)
    16a2:	00 
    16a3:	c7 44 24 4c 04 00 00 	movl   $0x4,0x4c(%esp)
    16aa:	00 
    16ab:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
    16b2:	00 
    16b3:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%esp)
    16ba:	00 
    16bb:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    16c2:	00 
    16c3:	89 74 24 24          	mov    %esi,0x24(%esp)
    16c7:	c7 44 24 28 03 00 00 	movl   $0x3,0x28(%esp)
    16ce:	00 
    16cf:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
    16d6:	00 
    16d7:	89 44 24 30          	mov    %eax,0x30(%esp)
    16db:	c7 44 24 34 0f 00 00 	movl   $0xf,0x34(%esp)
    16e2:	00 
    16e3:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
    16ea:	00 
    16eb:	c7 44 24 1c 21 00 00 	movl   $0x21,0x1c(%esp)
    16f2:	00 
    16f3:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
    16f9:	8b 8b 0c 00 00 00    	mov    0xc(%ebx),%ecx
    16ff:	83 f8 02             	cmp    $0x2,%eax
    1702:	8b 83 10 00 00 00    	mov    0x10(%ebx),%eax
    1708:	0f 45 cd             	cmovne %ebp,%ecx
    170b:	0f 45 c7             	cmovne %edi,%eax
    170e:	83 ec 08             	sub    $0x8,%esp
    1711:	8d 54 24 20          	lea    0x20(%esp),%edx
    1715:	52                   	push   %edx
    1716:	51                   	push   %ecx
    1717:	ff 50 10             	call   *0x10(%eax)
    171a:	83 c4 10             	add    $0x10,%esp
    171d:	e9 4e ff ff ff       	jmp    1670 <init+0x80>
    1722:	83 f8 01             	cmp    $0x1,%eax
    1725:	75 21                	jne    1748 <init+0x158>
    1727:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
    172e:	00 00 
    1730:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
    1736:	83 f8 01             	cmp    $0x1,%eax
    1739:	75 0d                	jne    1748 <init+0x158>
    173b:	f3 90                	pause
    173d:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
    1743:	83 f8 01             	cmp    $0x1,%eax
    1746:	74 f3                	je     173b <init+0x14b>
    1748:	8d 4c 24 0f          	lea    0xf(%esp),%ecx
    174c:	e8 df f8 ff ff       	call   1030 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    1751:	66 90                	xchg   %ax,%ax
    1753:	66 90                	xchg   %ax,%ax
    1755:	66 90                	xchg   %ax,%ax
    1757:	66 90                	xchg   %ax,%ax
    1759:	66 90                	xchg   %ax,%ax
    175b:	66 90                	xchg   %ax,%ax
    175d:	66 90                	xchg   %ax,%ax
    175f:	90                   	nop

00001760 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E>:
    1760:	55                   	push   %ebp
    1761:	53                   	push   %ebx
    1762:	57                   	push   %edi
    1763:	56                   	push   %esi
    1764:	83 ec 2c             	sub    $0x2c,%esp
    1767:	8b 74 24 44          	mov    0x44(%esp),%esi
    176b:	e8 00 00 00 00       	call   1770 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x10>
    1770:	5b                   	pop    %ebx
    1771:	81 c3 84 38 00 00    	add    $0x3884,%ebx
    1777:	8b 6e 04             	mov    0x4(%esi),%ebp
    177a:	8b 3e                	mov    (%esi),%edi
    177c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    177f:	83 ec 04             	sub    $0x4,%esp
    1782:	8d 83 0f e3 ff ff    	lea    -0x1cf1(%ebx),%eax
    1788:	6a 0e                	push   $0xe
    178a:	50                   	push   %eax
    178b:	57                   	push   %edi
    178c:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    1790:	ff d1                	call   *%ecx
    1792:	83 c4 10             	add    $0x10,%esp
    1795:	b1 01                	mov    $0x1,%cl
    1797:	84 c0                	test   %al,%al
    1799:	0f 85 e3 00 00 00    	jne    1882 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    179f:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    17a3:	75 40                	jne    17e5 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x85>
    17a5:	83 ec 04             	sub    $0x4,%esp
    17a8:	8d 83 5e e3 ff ff    	lea    -0x1ca2(%ebx),%eax
    17ae:	6a 01                	push   $0x1
    17b0:	50                   	push   %eax
    17b1:	57                   	push   %edi
    17b2:	ff 54 24 1c          	call   *0x1c(%esp)
    17b6:	83 c4 10             	add    $0x10,%esp
    17b9:	84 c0                	test   %al,%al
    17bb:	0f 85 8c 00 00 00    	jne    184d <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    17c1:	83 ec 0c             	sub    $0xc,%esp
    17c4:	8d 93 e2 e2 ff ff    	lea    -0x1d1e(%ebx),%edx
    17ca:	89 f1                	mov    %esi,%ecx
    17cc:	6a 02                	push   $0x2
    17ce:	e8 0d 01 00 00       	call   18e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    17d3:	83 c4 10             	add    $0x10,%esp
    17d6:	84 c0                	test   %al,%al
    17d8:	b1 01                	mov    $0x1,%cl
    17da:	0f 84 8c 00 00 00    	je     186c <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x10c>
    17e0:	e9 9d 00 00 00       	jmp    1882 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    17e5:	83 ec 04             	sub    $0x4,%esp
    17e8:	8d 83 5f e3 ff ff    	lea    -0x1ca1(%ebx),%eax
    17ee:	6a 02                	push   $0x2
    17f0:	50                   	push   %eax
    17f1:	57                   	push   %edi
    17f2:	ff 54 24 1c          	call   *0x1c(%esp)
    17f6:	83 c4 10             	add    $0x10,%esp
    17f9:	84 c0                	test   %al,%al
    17fb:	75 50                	jne    184d <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    17fd:	8d 44 24 0b          	lea    0xb(%esp),%eax
    1801:	89 7c 24 10          	mov    %edi,0x10(%esp)
    1805:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    1809:	8b 4e 0c             	mov    0xc(%esi),%ecx
    180c:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    1811:	89 44 24 18          	mov    %eax,0x18(%esp)
    1815:	8b 46 08             	mov    0x8(%esi),%eax
    1818:	8d 74 24 10          	lea    0x10(%esp),%esi
    181c:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    1820:	89 44 24 24          	mov    %eax,0x24(%esp)
    1824:	8d 83 18 ff ff ff    	lea    -0xe8(%ebx),%eax
    182a:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    182e:	89 44 24 20          	mov    %eax,0x20(%esp)
    1832:	83 ec 0c             	sub    $0xc,%esp
    1835:	8d 93 e2 e2 ff ff    	lea    -0x1d1e(%ebx),%edx
    183b:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    183f:	6a 02                	push   $0x2
    1841:	e8 9a 00 00 00       	call   18e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    1846:	83 c4 10             	add    $0x10,%esp
    1849:	84 c0                	test   %al,%al
    184b:	74 04                	je     1851 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xf1>
    184d:	b1 01                	mov    $0x1,%cl
    184f:	eb 31                	jmp    1882 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    1851:	83 ec 04             	sub    $0x4,%esp
    1854:	8d 83 5c e3 ff ff    	lea    -0x1ca4(%ebx),%eax
    185a:	6a 02                	push   $0x2
    185c:	50                   	push   %eax
    185d:	56                   	push   %esi
    185e:	e8 6d 0b 00 00       	call   23d0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    1863:	83 c4 10             	add    $0x10,%esp
    1866:	84 c0                	test   %al,%al
    1868:	b1 01                	mov    $0x1,%cl
    186a:	75 16                	jne    1882 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    186c:	83 ec 04             	sub    $0x4,%esp
    186f:	8d 83 3e e3 ff ff    	lea    -0x1cc2(%ebx),%eax
    1875:	6a 01                	push   $0x1
    1877:	50                   	push   %eax
    1878:	57                   	push   %edi
    1879:	ff 54 24 1c          	call   *0x1c(%esp)
    187d:	83 c4 10             	add    $0x10,%esp
    1880:	89 c1                	mov    %eax,%ecx
    1882:	89 c8                	mov    %ecx,%eax
    1884:	83 c4 2c             	add    $0x2c,%esp
    1887:	5e                   	pop    %esi
    1888:	5f                   	pop    %edi
    1889:	5b                   	pop    %ebx
    188a:	5d                   	pop    %ebp
    188b:	c3                   	ret
    188c:	66 90                	xchg   %ax,%ax
    188e:	66 90                	xchg   %ax,%ax

00001890 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>:
    1890:	53                   	push   %ebx
    1891:	57                   	push   %edi
    1892:	56                   	push   %esi
    1893:	8b 44 24 10          	mov    0x10(%esp),%eax
    1897:	e8 00 00 00 00       	call   189c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0xc>
    189c:	5b                   	pop    %ebx
    189d:	89 d6                	mov    %edx,%esi
    189f:	89 cf                	mov    %ecx,%edi
    18a1:	81 c3 58 37 00 00    	add    $0x3758,%ebx
    18a7:	3d 00 00 11 00       	cmp    $0x110000,%eax
    18ac:	74 13                	je     18c1 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x31>
    18ae:	83 ec 08             	sub    $0x8,%esp
    18b1:	50                   	push   %eax
    18b2:	57                   	push   %edi
    18b3:	ff 56 10             	call   *0x10(%esi)
    18b6:	83 c4 10             	add    $0x10,%esp
    18b9:	89 c1                	mov    %eax,%ecx
    18bb:	b0 01                	mov    $0x1,%al
    18bd:	84 c9                	test   %cl,%cl
    18bf:	75 1b                	jne    18dc <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4c>
    18c1:	8b 44 24 14          	mov    0x14(%esp),%eax
    18c5:	85 c0                	test   %eax,%eax
    18c7:	74 11                	je     18da <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4a>
    18c9:	83 ec 04             	sub    $0x4,%esp
    18cc:	6a 00                	push   $0x0
    18ce:	50                   	push   %eax
    18cf:	57                   	push   %edi
    18d0:	ff 56 0c             	call   *0xc(%esi)
    18d3:	83 c4 10             	add    $0x10,%esp
    18d6:	5e                   	pop    %esi
    18d7:	5f                   	pop    %edi
    18d8:	5b                   	pop    %ebx
    18d9:	c3                   	ret
    18da:	31 c0                	xor    %eax,%eax
    18dc:	5e                   	pop    %esi
    18dd:	5f                   	pop    %edi
    18de:	5b                   	pop    %ebx
    18df:	c3                   	ret

000018e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>:
    18e0:	55                   	push   %ebp
    18e1:	53                   	push   %ebx
    18e2:	57                   	push   %edi
    18e3:	56                   	push   %esi
    18e4:	83 ec 4c             	sub    $0x4c,%esp
    18e7:	8b 41 08             	mov    0x8(%ecx),%eax
    18ea:	8b 6c 24 60          	mov    0x60(%esp),%ebp
    18ee:	e8 00 00 00 00       	call   18f3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x13>
    18f3:	5f                   	pop    %edi
    18f4:	81 c7 01 37 00 00    	add    $0x3701,%edi
    18fa:	a9 00 00 00 18       	test   $0x18000000,%eax
    18ff:	74 61                	je     1962 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x82>
    1901:	a9 00 00 00 10       	test   $0x10000000,%eax
    1906:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    190a:	89 44 24 20          	mov    %eax,0x20(%esp)
    190e:	75 69                	jne    1979 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x99>
    1910:	83 fd 10             	cmp    $0x10,%ebp
    1913:	0f 83 c5 00 00 00    	jae    19de <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xfe>
    1919:	85 ed                	test   %ebp,%ebp
    191b:	0f 84 b0 04 00 00    	je     1dd1 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4f1>
    1921:	31 f6                	xor    %esi,%esi
    1923:	31 c0                	xor    %eax,%eax
    1925:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    192c:	00 00 00 
    192f:	90                   	nop
    1930:	31 db                	xor    %ebx,%ebx
    1932:	80 3c 02 c0          	cmpb   $0xc0,(%edx,%eax,1)
    1936:	0f 9d c3             	setge  %bl
    1939:	40                   	inc    %eax
    193a:	01 de                	add    %ebx,%esi
    193c:	39 c5                	cmp    %eax,%ebp
    193e:	75 f0                	jne    1930 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x50>
    1940:	8b 44 24 20          	mov    0x20(%esp),%eax
    1944:	89 6c 24 18          	mov    %ebp,0x18(%esp)
    1948:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    194c:	39 ee                	cmp    %ebp,%esi
    194e:	0f 82 4e 03 00 00    	jb     1ca2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3c2>
    1954:	8b 41 04             	mov    0x4(%ecx),%eax
    1957:	83 ec 04             	sub    $0x4,%esp
    195a:	89 fb                	mov    %edi,%ebx
    195c:	ff 74 24 1c          	push   0x1c(%esp)
    1960:	eb 09                	jmp    196b <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x8b>
    1962:	8b 41 04             	mov    0x4(%ecx),%eax
    1965:	83 ec 04             	sub    $0x4,%esp
    1968:	89 fb                	mov    %edi,%ebx
    196a:	55                   	push   %ebp
    196b:	52                   	push   %edx
    196c:	ff 31                	push   (%ecx)
    196e:	ff 50 0c             	call   *0xc(%eax)
    1971:	83 c4 5c             	add    $0x5c,%esp
    1974:	e9 82 04 00 00       	jmp    1dfb <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x51b>
    1979:	0f b7 71 0e          	movzwl 0xe(%ecx),%esi
    197d:	89 7c 24 14          	mov    %edi,0x14(%esp)
    1981:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    1985:	85 f6                	test   %esi,%esi
    1987:	0f 84 e7 02 00 00    	je     1c74 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x394>
    198d:	01 d5                	add    %edx,%ebp
    198f:	89 d1                	mov    %edx,%ecx
    1991:	31 ff                	xor    %edi,%edi
    1993:	31 c0                	xor    %eax,%eax
    1995:	eb 1d                	jmp    19b4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd4>
    1997:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
    199e:	00 00 
    19a0:	8d 59 01             	lea    0x1(%ecx),%ebx
    19a3:	89 df                	mov    %ebx,%edi
    19a5:	40                   	inc    %eax
    19a6:	29 cf                	sub    %ecx,%edi
    19a8:	89 d9                	mov    %ebx,%ecx
    19aa:	01 d7                	add    %edx,%edi
    19ac:	39 c6                	cmp    %eax,%esi
    19ae:	0f 84 c2 02 00 00    	je     1c76 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x396>
    19b4:	89 fa                	mov    %edi,%edx
    19b6:	39 e9                	cmp    %ebp,%ecx
    19b8:	0f 84 bc 02 00 00    	je     1c7a <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x39a>
    19be:	0f b6 19             	movzbl (%ecx),%ebx
    19c1:	84 db                	test   %bl,%bl
    19c3:	79 db                	jns    19a0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc0>
    19c5:	80 fb e0             	cmp    $0xe0,%bl
    19c8:	72 0a                	jb     19d4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xf4>
    19ca:	80 fb f0             	cmp    $0xf0,%bl
    19cd:	72 0a                	jb     19d9 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xf9>
    19cf:	8d 59 04             	lea    0x4(%ecx),%ebx
    19d2:	eb cf                	jmp    19a3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc3>
    19d4:	8d 59 02             	lea    0x2(%ecx),%ebx
    19d7:	eb ca                	jmp    19a3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc3>
    19d9:	8d 59 03             	lea    0x3(%ecx),%ebx
    19dc:	eb c5                	jmp    19a3 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc3>
    19de:	8d 72 03             	lea    0x3(%edx),%esi
    19e1:	89 6c 24 18          	mov    %ebp,0x18(%esp)
    19e5:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    19e9:	89 7c 24 14          	mov    %edi,0x14(%esp)
    19ed:	31 ff                	xor    %edi,%edi
    19ef:	83 e6 fc             	and    $0xfffffffc,%esi
    19f2:	89 f0                	mov    %esi,%eax
    19f4:	89 74 24 0c          	mov    %esi,0xc(%esp)
    19f8:	29 d0                	sub    %edx,%eax
    19fa:	29 c5                	sub    %eax,%ebp
    19fc:	89 e9                	mov    %ebp,%ecx
    19fe:	89 6c 24 24          	mov    %ebp,0x24(%esp)
    1a02:	83 e1 03             	and    $0x3,%ecx
    1a05:	39 d6                	cmp    %edx,%esi
    1a07:	be 00 00 00 00       	mov    $0x0,%esi
    1a0c:	74 21                	je     1a2f <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x14f>
    1a0e:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1a12:	31 f6                	xor    %esi,%esi
    1a14:	89 eb                	mov    %ebp,%ebx
    1a16:	2b 5c 24 0c          	sub    0xc(%esp),%ebx
    1a1a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
    1a20:	31 c0                	xor    %eax,%eax
    1a22:	80 7d 00 c0          	cmpb   $0xc0,0x0(%ebp)
    1a26:	0f 9d c0             	setge  %al
    1a29:	45                   	inc    %ebp
    1a2a:	01 c6                	add    %eax,%esi
    1a2c:	43                   	inc    %ebx
    1a2d:	75 f1                	jne    1a20 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x140>
    1a2f:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    1a33:	85 c9                	test   %ecx,%ecx
    1a35:	74 27                	je     1a5e <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x17e>
    1a37:	89 eb                	mov    %ebp,%ebx
    1a39:	31 ff                	xor    %edi,%edi
    1a3b:	83 e3 fc             	and    $0xfffffffc,%ebx
    1a3e:	03 5c 24 0c          	add    0xc(%esp),%ebx
    1a42:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    1a49:	00 00 00 
    1a4c:	0f 1f 40 00          	nopl   0x0(%eax)
    1a50:	31 c0                	xor    %eax,%eax
    1a52:	80 3b c0             	cmpb   $0xc0,(%ebx)
    1a55:	0f 9d c0             	setge  %al
    1a58:	43                   	inc    %ebx
    1a59:	01 c7                	add    %eax,%edi
    1a5b:	49                   	dec    %ecx
    1a5c:	75 f2                	jne    1a50 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x170>
    1a5e:	8b 44 24 14          	mov    0x14(%esp),%eax
    1a62:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    1a66:	01 f7                	add    %esi,%edi
    1a68:	c1 ed 02             	shr    $0x2,%ebp
    1a6b:	66 0f 76 ff          	pcmpeqd %xmm7,%xmm7
    1a6f:	66 0f 6f 90 4c e1 ff 	movdqa -0x1eb4(%eax),%xmm2
    1a76:	ff 
    1a77:	66 0f 7f 54 24 30    	movdqa %xmm2,0x30(%esp)
    1a7d:	eb 39                	jmp    1ab8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1d8>
    1a7f:	90                   	nop
    1a80:	89 d8                	mov    %ebx,%eax
    1a82:	c1 eb 08             	shr    $0x8,%ebx
    1a85:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    1a89:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    1a8e:	81 e3 ff 00 ff 00    	and    $0xff00ff,%ebx
    1a94:	01 c3                	add    %eax,%ebx
    1a96:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1a9a:	89 df                	mov    %ebx,%edi
    1a9c:	c1 e7 10             	shl    $0x10,%edi
    1a9f:	89 ca                	mov    %ecx,%edx
    1aa1:	29 cd                	sub    %ecx,%ebp
    1aa3:	01 df                	add    %ebx,%edi
    1aa5:	83 e2 03             	and    $0x3,%edx
    1aa8:	c1 ef 10             	shr    $0x10,%edi
    1aab:	8d 1c 88             	lea    (%eax,%ecx,4),%ebx
    1aae:	01 f7                	add    %esi,%edi
    1ab0:	85 d2                	test   %edx,%edx
    1ab2:	0f 85 be 02 00 00    	jne    1d76 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x496>
    1ab8:	89 fe                	mov    %edi,%esi
    1aba:	85 ed                	test   %ebp,%ebp
    1abc:	0f 84 c4 01 00 00    	je     1c86 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3a6>
    1ac2:	81 fd c0 00 00 00    	cmp    $0xc0,%ebp
    1ac8:	b8 c0 00 00 00       	mov    $0xc0,%eax
    1acd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    1ad1:	0f 42 c5             	cmovb  %ebp,%eax
    1ad4:	31 db                	xor    %ebx,%ebx
    1ad6:	83 fd 04             	cmp    $0x4,%ebp
    1ad9:	89 44 24 10          	mov    %eax,0x10(%esp)
    1add:	72 a1                	jb     1a80 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1a0>
    1adf:	8b 7c 24 10          	mov    0x10(%esp),%edi
    1ae3:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    1ae7:	31 db                	xor    %ebx,%ebx
    1ae9:	c1 ef 02             	shr    $0x2,%edi
    1aec:	8d 51 10             	lea    0x10(%ecx),%edx
    1aef:	8d 47 ff             	lea    -0x1(%edi),%eax
    1af2:	25 ff ff ff 0f       	and    $0xfffffff,%eax
    1af7:	83 f8 03             	cmp    $0x3,%eax
    1afa:	0f 82 20 01 00 00    	jb     1c20 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x340>
    1b00:	89 c3                	mov    %eax,%ebx
    1b02:	89 6c 24 24          	mov    %ebp,0x24(%esp)
    1b06:	89 cd                	mov    %ecx,%ebp
    1b08:	66 0f ef db          	pxor   %xmm3,%xmm3
    1b0c:	43                   	inc    %ebx
    1b0d:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
    1b11:	83 e3 fc             	and    $0xfffffffc,%ebx
    1b14:	89 d9                	mov    %ebx,%ecx
    1b16:	89 d8                	mov    %ebx,%eax
    1b18:	c1 e1 04             	shl    $0x4,%ecx
    1b1b:	01 ca                	add    %ecx,%edx
    1b1d:	01 e9                	add    %ebp,%ecx
    1b1f:	90                   	nop
    1b20:	f3 0f 6f 55 00       	movdqu 0x0(%ebp),%xmm2
    1b25:	f3 0f 6f 4d 20       	movdqu 0x20(%ebp),%xmm1
    1b2a:	f3 0f 6f 65 10       	movdqu 0x10(%ebp),%xmm4
    1b2f:	f3 0f 6f 7d 30       	movdqu 0x30(%ebp),%xmm7
    1b34:	83 c5 40             	add    $0x40,%ebp
    1b37:	83 c3 fc             	add    $0xfffffffc,%ebx
    1b3a:	66 0f 6f ea          	movdqa %xmm2,%xmm5
    1b3e:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    1b42:	66 0f 6a cf          	punpckhdq %xmm7,%xmm1
    1b46:	66 0f 6a d4          	punpckhdq %xmm4,%xmm2
    1b4a:	66 0f 62 ec          	punpckldq %xmm4,%xmm5
    1b4e:	66 0f 62 c7          	punpckldq %xmm7,%xmm0
    1b52:	66 0f 76 ff          	pcmpeqd %xmm7,%xmm7
    1b56:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    1b5a:	66 0f 6d d1          	punpckhqdq %xmm1,%xmm2
    1b5e:	66 0f 6f f5          	movdqa %xmm5,%xmm6
    1b62:	66 0f 6d e8          	punpckhqdq %xmm0,%xmm5
    1b66:	66 0f 6c e1          	punpcklqdq %xmm1,%xmm4
    1b6a:	66 0f 6f 4c 24 30    	movdqa 0x30(%esp),%xmm1
    1b70:	66 0f 6c f0          	punpcklqdq %xmm0,%xmm6
    1b74:	66 0f 6f c6          	movdqa %xmm6,%xmm0
    1b78:	66 0f 72 d6 06       	psrld  $0x6,%xmm6
    1b7d:	66 0f ef c7          	pxor   %xmm7,%xmm0
    1b81:	66 0f 72 d0 07       	psrld  $0x7,%xmm0
    1b86:	66 0f eb f0          	por    %xmm0,%xmm6
    1b8a:	66 0f 6f c5          	movdqa %xmm5,%xmm0
    1b8e:	66 0f 72 d5 06       	psrld  $0x6,%xmm5
    1b93:	66 0f ef c7          	pxor   %xmm7,%xmm0
    1b97:	66 0f db f1          	pand   %xmm1,%xmm6
    1b9b:	66 0f 72 d0 07       	psrld  $0x7,%xmm0
    1ba0:	66 0f fe f3          	paddd  %xmm3,%xmm6
    1ba4:	66 0f 6f da          	movdqa %xmm2,%xmm3
    1ba8:	66 0f 72 d2 06       	psrld  $0x6,%xmm2
    1bad:	66 0f eb e8          	por    %xmm0,%xmm5
    1bb1:	66 0f 6f c4          	movdqa %xmm4,%xmm0
    1bb5:	66 0f ef df          	pxor   %xmm7,%xmm3
    1bb9:	66 0f 72 d4 06       	psrld  $0x6,%xmm4
    1bbe:	66 0f ef c7          	pxor   %xmm7,%xmm0
    1bc2:	66 0f 72 d3 07       	psrld  $0x7,%xmm3
    1bc7:	66 0f db e9          	pand   %xmm1,%xmm5
    1bcb:	66 0f 72 d0 07       	psrld  $0x7,%xmm0
    1bd0:	66 0f eb d3          	por    %xmm3,%xmm2
    1bd4:	66 0f eb e0          	por    %xmm0,%xmm4
    1bd8:	66 0f db d1          	pand   %xmm1,%xmm2
    1bdc:	66 0f db e1          	pand   %xmm1,%xmm4
    1be0:	66 0f 6f da          	movdqa %xmm2,%xmm3
    1be4:	66 0f fe e5          	paddd  %xmm5,%xmm4
    1be8:	66 0f fe e6          	paddd  %xmm6,%xmm4
    1bec:	66 0f fe dc          	paddd  %xmm4,%xmm3
    1bf0:	0f 85 2a ff ff ff    	jne    1b20 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x240>
    1bf6:	66 0f 70 c3 ee       	pshufd $0xee,%xmm3,%xmm0
    1bfb:	39 44 24 2c          	cmp    %eax,0x2c(%esp)
    1bff:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    1c03:	66 0f 6f 54 24 30    	movdqa 0x30(%esp),%xmm2
    1c09:	66 0f fe c3          	paddd  %xmm3,%xmm0
    1c0d:	66 0f 70 c8 55       	pshufd $0x55,%xmm0,%xmm1
    1c12:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1c16:	66 0f 7e cb          	movd   %xmm1,%ebx
    1c1a:	0f 84 60 fe ff ff    	je     1a80 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1a0>
    1c20:	c1 e7 04             	shl    $0x4,%edi
    1c23:	03 7c 24 0c          	add    0xc(%esp),%edi
    1c27:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
    1c2e:	00 00 
    1c30:	f3 0f 6f 01          	movdqu (%ecx),%xmm0
    1c34:	89 d1                	mov    %edx,%ecx
    1c36:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    1c3a:	66 0f 72 d0 06       	psrld  $0x6,%xmm0
    1c3f:	66 0f ef cf          	pxor   %xmm7,%xmm1
    1c43:	66 0f 72 d1 07       	psrld  $0x7,%xmm1
    1c48:	66 0f eb c1          	por    %xmm1,%xmm0
    1c4c:	66 0f db c2          	pand   %xmm2,%xmm0
    1c50:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    1c55:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1c59:	66 0f 70 c1 55       	pshufd $0x55,%xmm1,%xmm0
    1c5e:	66 0f fe c1          	paddd  %xmm1,%xmm0
    1c62:	66 0f 7e c0          	movd   %xmm0,%eax
    1c66:	01 c3                	add    %eax,%ebx
    1c68:	39 fa                	cmp    %edi,%edx
    1c6a:	8d 52 10             	lea    0x10(%edx),%edx
    1c6d:	75 c1                	jne    1c30 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x350>
    1c6f:	e9 0c fe ff ff       	jmp    1a80 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1a0>
    1c74:	31 ff                	xor    %edi,%edi
    1c76:	31 c9                	xor    %ecx,%ecx
    1c78:	eb 06                	jmp    1c80 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3a0>
    1c7a:	89 f1                	mov    %esi,%ecx
    1c7c:	89 d7                	mov    %edx,%edi
    1c7e:	29 c1                	sub    %eax,%ecx
    1c80:	29 ce                	sub    %ecx,%esi
    1c82:	89 7c 24 18          	mov    %edi,0x18(%esp)
    1c86:	8b 7c 24 14          	mov    0x14(%esp),%edi
    1c8a:	8b 44 24 20          	mov    0x20(%esp),%eax
    1c8e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1c92:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    1c96:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    1c9a:	39 ee                	cmp    %ebp,%esi
    1c9c:	0f 83 b2 fc ff ff    	jae    1954 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x74>
    1ca2:	c1 e8 1d             	shr    $0x1d,%eax
    1ca5:	89 fa                	mov    %edi,%edx
    1ca7:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
    1cab:	29 f5                	sub    %esi,%ebp
    1cad:	83 e0 03             	and    $0x3,%eax
    1cb0:	89 d3                	mov    %edx,%ebx
    1cb2:	8b 84 87 5c e1 ff ff 	mov    -0x1ea4(%edi,%eax,4),%eax
    1cb9:	31 ff                	xor    %edi,%edi
    1cbb:	01 d0                	add    %edx,%eax
    1cbd:	ff e0                	jmp    *%eax
    1cbf:	89 ef                	mov    %ebp,%edi
    1cc1:	eb 05                	jmp    1cc8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3e8>
    1cc3:	0f b7 fd             	movzwl %bp,%edi
    1cc6:	d1 ef                	shr    $1,%edi
    1cc8:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    1ccc:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    1cd0:	8b 01                	mov    (%ecx),%eax
    1cd2:	8b 49 04             	mov    0x4(%ecx),%ecx
    1cd5:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1cd9:	47                   	inc    %edi
    1cda:	81 e5 ff ff 1f 00    	and    $0x1fffff,%ebp
    1ce0:	89 44 24 30          	mov    %eax,0x30(%esp)
    1ce4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1ce8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
    1cef:	00 
    1cf0:	66 4f                	dec    %di
    1cf2:	74 1d                	je     1d11 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x431>
    1cf4:	83 ec 08             	sub    $0x8,%esp
    1cf7:	55                   	push   %ebp
    1cf8:	ff 74 24 3c          	push   0x3c(%esp)
    1cfc:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1d00:	ff 50 10             	call   *0x10(%eax)
    1d03:	83 c4 10             	add    $0x10,%esp
    1d06:	84 c0                	test   %al,%al
    1d08:	74 e6                	je     1cf0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x410>
    1d0a:	b0 01                	mov    $0x1,%al
    1d0c:	e9 e7 00 00 00       	jmp    1df8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x518>
    1d11:	83 ec 04             	sub    $0x4,%esp
    1d14:	ff 74 24 1c          	push   0x1c(%esp)
    1d18:	ff 74 24 24          	push   0x24(%esp)
    1d1c:	ff 74 24 3c          	push   0x3c(%esp)
    1d20:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1d24:	ff 50 0c             	call   *0xc(%eax)
    1d27:	83 c4 10             	add    $0x10,%esp
    1d2a:	89 c1                	mov    %eax,%ecx
    1d2c:	b0 01                	mov    $0x1,%al
    1d2e:	84 c9                	test   %cl,%cl
    1d30:	0f 85 c2 00 00 00    	jne    1df8 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x518>
    1d36:	8b 7c 24 24          	mov    0x24(%esp),%edi
    1d3a:	29 7c 24 10          	sub    %edi,0x10(%esp)
    1d3e:	01 f7                	add    %esi,%edi
    1d40:	66 be ff ff          	mov    $0xffff,%si
    1d44:	2b 7c 24 2c          	sub    0x2c(%esp),%edi
    1d48:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
    1d4f:	00 
    1d50:	8d 04 37             	lea    (%edi,%esi,1),%eax
    1d53:	66 83 f8 ff          	cmp    $0xffff,%ax
    1d57:	0f 84 8f 00 00 00    	je     1dec <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x50c>
    1d5d:	83 ec 08             	sub    $0x8,%esp
    1d60:	55                   	push   %ebp
    1d61:	ff 74 24 3c          	push   0x3c(%esp)
    1d65:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1d69:	ff 50 10             	call   *0x10(%eax)
    1d6c:	83 c4 10             	add    $0x10,%esp
    1d6f:	46                   	inc    %esi
    1d70:	84 c0                	test   %al,%al
    1d72:	74 dc                	je     1d50 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x470>
    1d74:	eb 7a                	jmp    1df0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x510>
    1d76:	81 e1 fc 00 00 00    	and    $0xfc,%ecx
    1d7c:	c1 e2 02             	shl    $0x2,%edx
    1d7f:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
    1d82:	31 c0                	xor    %eax,%eax
    1d84:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    1d8b:	00 00 00 
    1d8e:	66 90                	xchg   %ax,%ax
    1d90:	8b 31                	mov    (%ecx),%esi
    1d92:	83 c1 04             	add    $0x4,%ecx
    1d95:	89 f3                	mov    %esi,%ebx
    1d97:	c1 ee 06             	shr    $0x6,%esi
    1d9a:	f7 d3                	not    %ebx
    1d9c:	c1 eb 07             	shr    $0x7,%ebx
    1d9f:	09 de                	or     %ebx,%esi
    1da1:	81 e6 01 01 01 01    	and    $0x1010101,%esi
    1da7:	01 f0                	add    %esi,%eax
    1da9:	83 c2 fc             	add    $0xfffffffc,%edx
    1dac:	75 e2                	jne    1d90 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4b0>
    1dae:	89 c1                	mov    %eax,%ecx
    1db0:	c1 e8 08             	shr    $0x8,%eax
    1db3:	81 e1 ff 00 ff 00    	and    $0xff00ff,%ecx
    1db9:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    1dbe:	01 c8                	add    %ecx,%eax
    1dc0:	89 c6                	mov    %eax,%esi
    1dc2:	c1 e6 10             	shl    $0x10,%esi
    1dc5:	01 c6                	add    %eax,%esi
    1dc7:	c1 ee 10             	shr    $0x10,%esi
    1dca:	01 fe                	add    %edi,%esi
    1dcc:	e9 b5 fe ff ff       	jmp    1c86 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3a6>
    1dd1:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1dd8:	00 
    1dd9:	31 f6                	xor    %esi,%esi
    1ddb:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    1ddf:	39 ee                	cmp    %ebp,%esi
    1de1:	0f 82 bb fe ff ff    	jb     1ca2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3c2>
    1de7:	e9 68 fb ff ff       	jmp    1954 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x74>
    1dec:	8b 74 24 10          	mov    0x10(%esp),%esi
    1df0:	66 3b 74 24 10       	cmp    0x10(%esp),%si
    1df5:	0f 92 c0             	setb   %al
    1df8:	83 c4 4c             	add    $0x4c,%esp
    1dfb:	5e                   	pop    %esi
    1dfc:	5f                   	pop    %edi
    1dfd:	5b                   	pop    %ebx
    1dfe:	5d                   	pop    %ebp
    1dff:	c3                   	ret

00001e00 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE>:
    1e00:	53                   	push   %ebx
    1e01:	83 ec 08             	sub    $0x8,%esp
    1e04:	8b 44 24 10          	mov    0x10(%esp),%eax
    1e08:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    1e0c:	e8 00 00 00 00       	call   1e11 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE+0x11>
    1e11:	5b                   	pop    %ebx
    1e12:	81 c3 e3 31 00 00    	add    $0x31e3,%ebx
    1e18:	8b 10                	mov    (%eax),%edx
    1e1a:	8b 40 04             	mov    0x4(%eax),%eax
    1e1d:	89 04 24             	mov    %eax,(%esp)
    1e20:	e8 bb fa ff ff       	call   18e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    1e25:	83 c4 08             	add    $0x8,%esp
    1e28:	5b                   	pop    %ebx
    1e29:	c3                   	ret
    1e2a:	66 90                	xchg   %ax,%ax
    1e2c:	66 90                	xchg   %ax,%ax
    1e2e:	66 90                	xchg   %ax,%ax

00001e30 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE>:
    1e30:	53                   	push   %ebx
    1e31:	83 ec 08             	sub    $0x8,%esp
    1e34:	8b 44 24 10          	mov    0x10(%esp),%eax
    1e38:	e8 00 00 00 00       	call   1e3d <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE+0xd>
    1e3d:	5b                   	pop    %ebx
    1e3e:	81 c3 b7 31 00 00    	add    $0x31b7,%ebx
    1e44:	8b 48 04             	mov    0x4(%eax),%ecx
    1e47:	83 ec 08             	sub    $0x8,%esp
    1e4a:	ff 74 24 1c          	push   0x1c(%esp)
    1e4e:	ff 30                	push   (%eax)
    1e50:	ff 51 0c             	call   *0xc(%ecx)
    1e53:	83 c4 18             	add    $0x18,%esp
    1e56:	5b                   	pop    %ebx
    1e57:	c3                   	ret
    1e58:	66 90                	xchg   %ax,%ax
    1e5a:	66 90                	xchg   %ax,%ax
    1e5c:	66 90                	xchg   %ax,%ax
    1e5e:	66 90                	xchg   %ax,%ax

00001e60 <_ZN4core3fmt5write17h60dc8996c7a95b44E>:
    1e60:	55                   	push   %ebp
    1e61:	53                   	push   %ebx
    1e62:	57                   	push   %edi
    1e63:	56                   	push   %esi
    1e64:	83 ec 2c             	sub    $0x2c,%esp
    1e67:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    1e6b:	e8 00 00 00 00       	call   1e70 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x10>
    1e70:	5b                   	pop    %ebx
    1e71:	c7 44 24 20 20 00 00 	movl   $0xe0000020,0x20(%esp)
    1e78:	e0 
    1e79:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    1e80:	00 
    1e81:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1e85:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1e89:	81 c3 84 31 00 00    	add    $0x3184,%ebx
    1e8f:	8b 7d 10             	mov    0x10(%ebp),%edi
    1e92:	85 ff                	test   %edi,%edi
    1e94:	0f 84 0c 01 00 00    	je     1fa6 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x146>
    1e9a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    1e9d:	85 c9                	test   %ecx,%ecx
    1e9f:	0f 84 9e 01 00 00    	je     2043 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    1ea5:	8b 75 08             	mov    0x8(%ebp),%esi
    1ea8:	8b 55 00             	mov    0x0(%ebp),%edx
    1eab:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
    1eae:	49                   	dec    %ecx
    1eaf:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    1eb5:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    1eb8:	89 44 24 14          	mov    %eax,0x14(%esp)
    1ebc:	41                   	inc    %ecx
    1ebd:	8d 47 18             	lea    0x18(%edi),%eax
    1ec0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1ec4:	89 74 24 10          	mov    %esi,0x10(%esp)
    1ec8:	31 f6                	xor    %esi,%esi
    1eca:	89 54 24 28          	mov    %edx,0x28(%esp)
    1ece:	66 90                	xchg   %ax,%ax
    1ed0:	89 c5                	mov    %eax,%ebp
    1ed2:	8b 44 f2 04          	mov    0x4(%edx,%esi,8),%eax
    1ed6:	85 c0                	test   %eax,%eax
    1ed8:	74 1d                	je     1ef7 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x97>
    1eda:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    1ede:	83 ec 04             	sub    $0x4,%esp
    1ee1:	50                   	push   %eax
    1ee2:	ff 34 f2             	push   (%edx,%esi,8)
    1ee5:	ff 74 24 24          	push   0x24(%esp)
    1ee9:	ff 51 0c             	call   *0xc(%ecx)
    1eec:	83 c4 10             	add    $0x10,%esp
    1eef:	84 c0                	test   %al,%al
    1ef1:	0f 85 48 01 00 00    	jne    203f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    1ef7:	0f b7 47 08          	movzwl 0x8(%edi),%eax
    1efb:	85 c0                	test   %eax,%eax
    1efd:	74 31                	je     1f30 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xd0>
    1eff:	83 f8 01             	cmp    $0x1,%eax
    1f02:	75 3c                	jne    1f40 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xe0>
    1f04:	8b 47 0c             	mov    0xc(%edi),%eax
    1f07:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    1f0b:	0f b7 44 c1 04       	movzwl 0x4(%ecx,%eax,8),%eax
    1f10:	0f b7 0f             	movzwl (%edi),%ecx
    1f13:	83 f9 02             	cmp    $0x2,%ecx
    1f16:	74 24                	je     1f3c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xdc>
    1f18:	83 f9 01             	cmp    $0x1,%ecx
    1f1b:	75 33                	jne    1f50 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf0>
    1f1d:	8b 4f 04             	mov    0x4(%edi),%ecx
    1f20:	8b 54 24 10          	mov    0x10(%esp),%edx
    1f24:	0f b7 4c ca 04       	movzwl 0x4(%edx,%ecx,8),%ecx
    1f29:	eb 29                	jmp    1f54 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf4>
    1f2b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
    1f30:	0f b7 47 0a          	movzwl 0xa(%edi),%eax
    1f34:	0f b7 0f             	movzwl (%edi),%ecx
    1f37:	83 f9 02             	cmp    $0x2,%ecx
    1f3a:	75 dc                	jne    1f18 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xb8>
    1f3c:	31 c9                	xor    %ecx,%ecx
    1f3e:	eb 14                	jmp    1f54 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf4>
    1f40:	31 c0                	xor    %eax,%eax
    1f42:	0f b7 0f             	movzwl (%edi),%ecx
    1f45:	83 f9 02             	cmp    $0x2,%ecx
    1f48:	75 ce                	jne    1f18 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xb8>
    1f4a:	eb f0                	jmp    1f3c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xdc>
    1f4c:	0f 1f 40 00          	nopl   0x0(%eax)
    1f50:	0f b7 4f 02          	movzwl 0x2(%edi),%ecx
    1f54:	8b 57 10             	mov    0x10(%edi),%edx
    1f57:	8b 7f 14             	mov    0x14(%edi),%edi
    1f5a:	89 7c 24 20          	mov    %edi,0x20(%esp)
    1f5e:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    1f63:	66 89 4c 24 26       	mov    %cx,0x26(%esp)
    1f68:	83 ec 08             	sub    $0x8,%esp
    1f6b:	8d 44 24 20          	lea    0x20(%esp),%eax
    1f6f:	50                   	push   %eax
    1f70:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1f74:	ff 34 d0             	push   (%eax,%edx,8)
    1f77:	ff 54 d0 04          	call   *0x4(%eax,%edx,8)
    1f7b:	83 c4 10             	add    $0x10,%esp
    1f7e:	84 c0                	test   %al,%al
    1f80:	0f 85 b9 00 00 00    	jne    203f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    1f86:	46                   	inc    %esi
    1f87:	3b 6c 24 14          	cmp    0x14(%esp),%ebp
    1f8b:	8d 45 18             	lea    0x18(%ebp),%eax
    1f8e:	8b 54 24 28          	mov    0x28(%esp),%edx
    1f92:	89 ef                	mov    %ebp,%edi
    1f94:	0f 44 c5             	cmove  %ebp,%eax
    1f97:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    1f9b:	0f 85 2f ff ff ff    	jne    1ed0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    1fa1:	e9 8a 00 00 00       	jmp    2030 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1d0>
    1fa6:	8b 45 0c             	mov    0xc(%ebp),%eax
    1fa9:	85 c0                	test   %eax,%eax
    1fab:	0f 84 92 00 00 00    	je     2043 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    1fb1:	8b 75 08             	mov    0x8(%ebp),%esi
    1fb4:	89 c1                	mov    %eax,%ecx
    1fb6:	8b 55 00             	mov    0x0(%ebp),%edx
    1fb9:	31 ed                	xor    %ebp,%ebp
    1fbb:	49                   	dec    %ecx
    1fbc:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    1fc2:	41                   	inc    %ecx
    1fc3:	8d 04 c6             	lea    (%esi,%eax,8),%eax
    1fc6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1fca:	89 54 24 14          	mov    %edx,0x14(%esp)
    1fce:	89 44 24 10          	mov    %eax,0x10(%esp)
    1fd2:	8d 46 08             	lea    0x8(%esi),%eax
    1fd5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    1fdc:	00 00 00 
    1fdf:	90                   	nop
    1fe0:	89 c7                	mov    %eax,%edi
    1fe2:	8b 44 ea 04          	mov    0x4(%edx,%ebp,8),%eax
    1fe6:	85 c0                	test   %eax,%eax
    1fe8:	74 19                	je     2003 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1a3>
    1fea:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    1fee:	83 ec 04             	sub    $0x4,%esp
    1ff1:	50                   	push   %eax
    1ff2:	ff 34 ea             	push   (%edx,%ebp,8)
    1ff5:	ff 74 24 24          	push   0x24(%esp)
    1ff9:	ff 51 0c             	call   *0xc(%ecx)
    1ffc:	83 c4 10             	add    $0x10,%esp
    1fff:	84 c0                	test   %al,%al
    2001:	75 3c                	jne    203f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    2003:	83 ec 08             	sub    $0x8,%esp
    2006:	8d 44 24 20          	lea    0x20(%esp),%eax
    200a:	50                   	push   %eax
    200b:	ff 36                	push   (%esi)
    200d:	ff 56 04             	call   *0x4(%esi)
    2010:	83 c4 10             	add    $0x10,%esp
    2013:	84 c0                	test   %al,%al
    2015:	75 28                	jne    203f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    2017:	45                   	inc    %ebp
    2018:	31 c0                	xor    %eax,%eax
    201a:	3b 7c 24 10          	cmp    0x10(%esp),%edi
    201e:	8b 54 24 14          	mov    0x14(%esp),%edx
    2022:	89 fe                	mov    %edi,%esi
    2024:	0f 95 c0             	setne  %al
    2027:	39 6c 24 0c          	cmp    %ebp,0xc(%esp)
    202b:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    202e:	75 b0                	jne    1fe0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x180>
    2030:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    2034:	8b 54 24 0c          	mov    0xc(%esp),%edx
    2038:	3b 55 04             	cmp    0x4(%ebp),%edx
    203b:	72 0d                	jb     204a <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1ea>
    203d:	eb 2e                	jmp    206d <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    203f:	b0 01                	mov    $0x1,%al
    2041:	eb 2c                	jmp    206f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    2043:	31 d2                	xor    %edx,%edx
    2045:	3b 55 04             	cmp    0x4(%ebp),%edx
    2048:	73 23                	jae    206d <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    204a:	8b 45 00             	mov    0x0(%ebp),%eax
    204d:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    2051:	83 ec 04             	sub    $0x4,%esp
    2054:	ff 74 d0 04          	push   0x4(%eax,%edx,8)
    2058:	ff 34 d0             	push   (%eax,%edx,8)
    205b:	ff 74 24 24          	push   0x24(%esp)
    205f:	ff 51 0c             	call   *0xc(%ecx)
    2062:	83 c4 10             	add    $0x10,%esp
    2065:	89 c1                	mov    %eax,%ecx
    2067:	b0 01                	mov    $0x1,%al
    2069:	84 c9                	test   %cl,%cl
    206b:	75 02                	jne    206f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    206d:	31 c0                	xor    %eax,%eax
    206f:	83 c4 2c             	add    $0x2c,%esp
    2072:	5e                   	pop    %esi
    2073:	5f                   	pop    %edi
    2074:	5b                   	pop    %ebx
    2075:	5d                   	pop    %ebp
    2076:	c3                   	ret
    2077:	66 90                	xchg   %ax,%ax
    2079:	66 90                	xchg   %ax,%ax
    207b:	66 90                	xchg   %ax,%ax
    207d:	66 90                	xchg   %ax,%ax
    207f:	90                   	nop

00002080 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E>:
    2080:	55                   	push   %ebp
    2081:	53                   	push   %ebx
    2082:	57                   	push   %edi
    2083:	56                   	push   %esi
    2084:	83 ec 3c             	sub    $0x3c,%esp
    2087:	8b 44 24 50          	mov    0x50(%esp),%eax
    208b:	e8 00 00 00 00       	call   2090 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x10>
    2090:	5b                   	pop    %ebx
    2091:	be 0a 00 00 00       	mov    $0xa,%esi
    2096:	81 c3 64 2f 00 00    	add    $0x2f64,%ebx
    209c:	8b 10                	mov    (%eax),%edx
    209e:	81 fa e8 03 00 00    	cmp    $0x3e8,%edx
    20a4:	89 54 24 04          	mov    %edx,0x4(%esp)
    20a8:	72 66                	jb     2110 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x90>
    20aa:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    20ae:	bd 0a 00 00 00       	mov    $0xa,%ebp
    20b3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    20ba:	00 00 00 
    20bd:	0f 1f 00             	nopl   (%eax)
    20c0:	89 c8                	mov    %ecx,%eax
    20c2:	ba 59 17 b7 d1       	mov    $0xd1b71759,%edx
    20c7:	89 ce                	mov    %ecx,%esi
    20c9:	f7 e2                	mul    %edx
    20cb:	c1 ea 0d             	shr    $0xd,%edx
    20ce:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    20d4:	29 c6                	sub    %eax,%esi
    20d6:	69 c6 7b 14 00 00    	imul   $0x147b,%esi,%eax
    20dc:	c1 e8 13             	shr    $0x13,%eax
    20df:	6b f8 64             	imul   $0x64,%eax,%edi
    20e2:	0f b7 84 43 61 e3 ff 	movzwl -0x1c9f(%ebx,%eax,2),%eax
    20e9:	ff 
    20ea:	29 fe                	sub    %edi,%esi
    20ec:	81 f9 7f 96 98 00    	cmp    $0x98967f,%ecx
    20f2:	89 d1                	mov    %edx,%ecx
    20f4:	66 89 44 2c 2e       	mov    %ax,0x2e(%esp,%ebp,1)
    20f9:	0f b7 c6             	movzwl %si,%eax
    20fc:	8d 75 fc             	lea    -0x4(%ebp),%esi
    20ff:	0f b7 84 43 61 e3 ff 	movzwl -0x1c9f(%ebx,%eax,2),%eax
    2106:	ff 
    2107:	66 89 44 2c 30       	mov    %ax,0x30(%esp,%ebp,1)
    210c:	89 f5                	mov    %esi,%ebp
    210e:	77 b0                	ja     20c0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x40>
    2110:	83 fa 09             	cmp    $0x9,%edx
    2113:	76 29                	jbe    213e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0xbe>
    2115:	0f b7 c2             	movzwl %dx,%eax
    2118:	c1 e8 02             	shr    $0x2,%eax
    211b:	69 c0 7b 14 00 00    	imul   $0x147b,%eax,%eax
    2121:	c1 e8 11             	shr    $0x11,%eax
    2124:	6b c8 64             	imul   $0x64,%eax,%ecx
    2127:	29 ca                	sub    %ecx,%edx
    2129:	0f b7 ca             	movzwl %dx,%ecx
    212c:	89 c2                	mov    %eax,%edx
    212e:	0f b7 8c 4b 61 e3 ff 	movzwl -0x1c9f(%ebx,%ecx,2),%ecx
    2135:	ff 
    2136:	66 89 4c 34 30       	mov    %cx,0x30(%esp,%esi,1)
    213b:	83 c6 fe             	add    $0xfffffffe,%esi
    213e:	8b 4c 24 54          	mov    0x54(%esp),%ecx
    2142:	83 7c 24 04 00       	cmpl   $0x0,0x4(%esp)
    2147:	74 04                	je     214d <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0xcd>
    2149:	85 d2                	test   %edx,%edx
    214b:	74 10                	je     215d <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0xdd>
    214d:	83 e2 0f             	and    $0xf,%edx
    2150:	0f b6 84 53 62 e3 ff 	movzbl -0x1c9e(%ebx,%edx,2),%eax
    2157:	ff 
    2158:	88 44 34 31          	mov    %al,0x31(%esp,%esi,1)
    215c:	4e                   	dec    %esi
    215d:	8b 69 08             	mov    0x8(%ecx),%ebp
    2160:	8d 44 34 32          	lea    0x32(%esp,%esi,1),%eax
    2164:	ba 0a 00 00 00       	mov    $0xa,%edx
    2169:	b9 00 00 11 00       	mov    $0x110000,%ecx
    216e:	bf 2b 00 00 00       	mov    $0x2b,%edi
    2173:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    2177:	29 f2                	sub    %esi,%edx
    2179:	89 54 24 18          	mov    %edx,0x18(%esp)
    217d:	89 e8                	mov    %ebp,%eax
    217f:	25 00 00 20 00       	and    $0x200000,%eax
    2184:	0f 44 f9             	cmove  %ecx,%edi
    2187:	8b 4c 24 54          	mov    0x54(%esp),%ecx
    218b:	c1 e8 15             	shr    $0x15,%eax
    218e:	89 7c 24 20          	mov    %edi,0x20(%esp)
    2192:	89 ef                	mov    %ebp,%edi
    2194:	01 d0                	add    %edx,%eax
    2196:	89 ea                	mov    %ebp,%edx
    2198:	c1 ef 17             	shr    $0x17,%edi
    219b:	83 e7 01             	and    $0x1,%edi
    219e:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    21a2:	39 e8                	cmp    %ebp,%eax
    21a4:	73 38                	jae    21de <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x15e>
    21a6:	f7 c2 00 00 00 01    	test   $0x1000000,%edx
    21ac:	89 7c 24 04          	mov    %edi,0x4(%esp)
    21b0:	89 54 24 24          	mov    %edx,0x24(%esp)
    21b4:	75 64                	jne    221a <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x19a>
    21b6:	89 ef                	mov    %ebp,%edi
    21b8:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
    21bc:	31 ed                	xor    %ebp,%ebp
    21be:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    21c2:	29 c7                	sub    %eax,%edi
    21c4:	89 d0                	mov    %edx,%eax
    21c6:	c1 e8 1d             	shr    $0x1d,%eax
    21c9:	83 e0 03             	and    $0x3,%eax
    21cc:	8b 84 83 6c e1 ff ff 	mov    -0x1e94(%ebx,%eax,4),%eax
    21d3:	01 d8                	add    %ebx,%eax
    21d5:	ff e0                	jmp    *%eax
    21d7:	89 fd                	mov    %edi,%ebp
    21d9:	e9 f5 00 00 00       	jmp    22d3 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x253>
    21de:	8b 29                	mov    (%ecx),%ebp
    21e0:	8b 71 04             	mov    0x4(%ecx),%esi
    21e3:	83 ec 08             	sub    $0x8,%esp
    21e6:	89 e9                	mov    %ebp,%ecx
    21e8:	89 f2                	mov    %esi,%edx
    21ea:	57                   	push   %edi
    21eb:	ff 74 24 2c          	push   0x2c(%esp)
    21ef:	e8 9c f6 ff ff       	call   1890 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    21f4:	83 c4 10             	add    $0x10,%esp
    21f7:	b1 01                	mov    $0x1,%cl
    21f9:	84 c0                	test   %al,%al
    21fb:	0f 85 bd 01 00 00    	jne    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    2201:	83 ec 04             	sub    $0x4,%esp
    2204:	ff 74 24 1c          	push   0x1c(%esp)
    2208:	ff 74 24 24          	push   0x24(%esp)
    220c:	55                   	push   %ebp
    220d:	ff 56 0c             	call   *0xc(%esi)
    2210:	83 c4 10             	add    $0x10,%esp
    2213:	89 c1                	mov    %eax,%ecx
    2215:	e9 a4 01 00 00       	jmp    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    221a:	8b 41 0c             	mov    0xc(%ecx),%eax
    221d:	89 44 24 10          	mov    %eax,0x10(%esp)
    2221:	8b 41 08             	mov    0x8(%ecx),%eax
    2224:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2228:	25 00 00 e0 9f       	and    $0x9fe00000,%eax
    222d:	0d 30 00 00 20       	or     $0x20000030,%eax
    2232:	89 41 08             	mov    %eax,0x8(%ecx)
    2235:	89 c8                	mov    %ecx,%eax
    2237:	8b 09                	mov    (%ecx),%ecx
    2239:	8b 50 04             	mov    0x4(%eax),%edx
    223c:	83 ec 08             	sub    $0x8,%esp
    223f:	89 d7                	mov    %edx,%edi
    2241:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    2245:	ff 74 24 0c          	push   0xc(%esp)
    2249:	ff 74 24 2c          	push   0x2c(%esp)
    224d:	e8 3e f6 ff ff       	call   1890 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    2252:	83 c4 10             	add    $0x10,%esp
    2255:	b1 01                	mov    $0x1,%cl
    2257:	84 c0                	test   %al,%al
    2259:	0f 85 5f 01 00 00    	jne    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    225f:	01 f5                	add    %esi,%ebp
    2261:	0f ba 64 24 24 15    	btl    $0x15,0x24(%esp)
    2267:	89 fe                	mov    %edi,%esi
    2269:	8b 7c 24 08          	mov    0x8(%esp),%edi
    226d:	66 83 dd 00          	sbb    $0x0,%bp
    2271:	83 c5 f7             	add    $0xfffffff7,%ebp
    2274:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    227b:	00 00 00 
    227e:	66 90                	xchg   %ax,%ax
    2280:	66 4d                	dec    %bp
    2282:	74 15                	je     2299 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x219>
    2284:	83 ec 08             	sub    $0x8,%esp
    2287:	6a 30                	push   $0x30
    2289:	57                   	push   %edi
    228a:	ff 56 10             	call   *0x10(%esi)
    228d:	83 c4 10             	add    $0x10,%esp
    2290:	84 c0                	test   %al,%al
    2292:	74 ec                	je     2280 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x200>
    2294:	e9 8c 00 00 00       	jmp    2325 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x2a5>
    2299:	83 ec 04             	sub    $0x4,%esp
    229c:	ff 74 24 1c          	push   0x1c(%esp)
    22a0:	ff 74 24 24          	push   0x24(%esp)
    22a4:	57                   	push   %edi
    22a5:	ff 56 0c             	call   *0xc(%esi)
    22a8:	83 c4 10             	add    $0x10,%esp
    22ab:	84 c0                	test   %al,%al
    22ad:	b1 01                	mov    $0x1,%cl
    22af:	0f 85 09 01 00 00    	jne    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    22b5:	8b 44 24 54          	mov    0x54(%esp),%eax
    22b9:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    22bd:	89 48 08             	mov    %ecx,0x8(%eax)
    22c0:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    22c4:	89 48 0c             	mov    %ecx,0xc(%eax)
    22c7:	31 c9                	xor    %ecx,%ecx
    22c9:	e9 f0 00 00 00       	jmp    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    22ce:	0f b7 ef             	movzwl %di,%ebp
    22d1:	d1 ed                	shr    $1,%ebp
    22d3:	81 e2 ff ff 1f 00    	and    $0x1fffff,%edx
    22d9:	89 7c 24 14          	mov    %edi,0x14(%esp)
    22dd:	8b 01                	mov    (%ecx),%eax
    22df:	89 6c 24 28          	mov    %ebp,0x28(%esp)
    22e3:	8d 7d 01             	lea    0x1(%ebp),%edi
    22e6:	8b 6c 24 04          	mov    0x4(%esp),%ebp
    22ea:	89 54 24 10          	mov    %edx,0x10(%esp)
    22ee:	8b 51 04             	mov    0x4(%ecx),%edx
    22f1:	89 44 24 08          	mov    %eax,0x8(%esp)
    22f5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    22fc:	00 00 00 
    22ff:	90                   	nop
    2300:	83 ec 08             	sub    $0x8,%esp
    2303:	66 4f                	dec    %di
    2305:	74 25                	je     232c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x2ac>
    2307:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    230b:	89 d5                	mov    %edx,%ebp
    230d:	ff 74 24 18          	push   0x18(%esp)
    2311:	ff 74 24 14          	push   0x14(%esp)
    2315:	ff 52 10             	call   *0x10(%edx)
    2318:	89 ea                	mov    %ebp,%edx
    231a:	8b 6c 24 14          	mov    0x14(%esp),%ebp
    231e:	83 c4 10             	add    $0x10,%esp
    2321:	84 c0                	test   %al,%al
    2323:	74 db                	je     2300 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x280>
    2325:	b1 01                	mov    $0x1,%cl
    2327:	e9 92 00 00 00       	jmp    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    232c:	8b 7c 24 10          	mov    0x10(%esp),%edi
    2330:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    2334:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2338:	89 f9                	mov    %edi,%ecx
    233a:	55                   	push   %ebp
    233b:	ff 74 24 2c          	push   0x2c(%esp)
    233f:	e8 4c f5 ff ff       	call   1890 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    2344:	83 c4 10             	add    $0x10,%esp
    2347:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
    234b:	b1 01                	mov    $0x1,%cl
    234d:	84 c0                	test   %al,%al
    234f:	75 6d                	jne    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    2351:	83 ec 04             	sub    $0x4,%esp
    2354:	ff 74 24 1c          	push   0x1c(%esp)
    2358:	ff 74 24 24          	push   0x24(%esp)
    235c:	57                   	push   %edi
    235d:	8b 44 24 14          	mov    0x14(%esp),%eax
    2361:	89 c7                	mov    %eax,%edi
    2363:	ff 50 0c             	call   *0xc(%eax)
    2366:	b1 01                	mov    $0x1,%cl
    2368:	83 c4 10             	add    $0x10,%esp
    236b:	84 c0                	test   %al,%al
    236d:	75 4f                	jne    23be <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    236f:	8b 44 24 28          	mov    0x28(%esp),%eax
    2373:	29 44 24 14          	sub    %eax,0x14(%esp)
    2377:	0f ba 64 24 24 15    	btl    $0x15,0x24(%esp)
    237d:	66 83 d0 00          	adc    $0x0,%ax
    2381:	29 e8                	sub    %ebp,%eax
    2383:	89 c5                	mov    %eax,%ebp
    2385:	29 f5                	sub    %esi,%ebp
    2387:	66 be ff ff          	mov    $0xffff,%si
    238b:	83 c5 0a             	add    $0xa,%ebp
    238e:	66 90                	xchg   %ax,%ax
    2390:	8d 44 35 00          	lea    0x0(%ebp,%esi,1),%eax
    2394:	66 83 f8 ff          	cmp    $0xffff,%ax
    2398:	74 18                	je     23b2 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x332>
    239a:	83 ec 08             	sub    $0x8,%esp
    239d:	ff 74 24 18          	push   0x18(%esp)
    23a1:	ff 74 24 14          	push   0x14(%esp)
    23a5:	ff 57 10             	call   *0x10(%edi)
    23a8:	83 c4 10             	add    $0x10,%esp
    23ab:	46                   	inc    %esi
    23ac:	84 c0                	test   %al,%al
    23ae:	74 e0                	je     2390 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x310>
    23b0:	eb 04                	jmp    23b6 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x336>
    23b2:	8b 74 24 14          	mov    0x14(%esp),%esi
    23b6:	66 3b 74 24 14       	cmp    0x14(%esp),%si
    23bb:	0f 92 c1             	setb   %cl
    23be:	89 c8                	mov    %ecx,%eax
    23c0:	83 c4 3c             	add    $0x3c,%esp
    23c3:	5e                   	pop    %esi
    23c4:	5f                   	pop    %edi
    23c5:	5b                   	pop    %ebx
    23c6:	5d                   	pop    %ebp
    23c7:	c3                   	ret
    23c8:	66 90                	xchg   %ax,%ax
    23ca:	66 90                	xchg   %ax,%ax
    23cc:	66 90                	xchg   %ax,%ax
    23ce:	66 90                	xchg   %ax,%ax

000023d0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>:
    23d0:	55                   	push   %ebp
    23d1:	53                   	push   %ebx
    23d2:	57                   	push   %edi
    23d3:	56                   	push   %esi
    23d4:	83 ec 2c             	sub    $0x2c,%esp
    23d7:	8b 44 24 40          	mov    0x40(%esp),%eax
    23db:	e8 00 00 00 00       	call   23e0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x10>
    23e0:	5b                   	pop    %ebx
    23e1:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    23e5:	8b 74 24 44          	mov    0x44(%esp),%esi
    23e9:	31 d2                	xor    %edx,%edx
    23eb:	81 c3 14 2c 00 00    	add    $0x2c14,%ebx
    23f1:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    23f5:	8b 48 08             	mov    0x8(%eax),%ecx
    23f8:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    23fc:	8b 08                	mov    (%eax),%ecx
    23fe:	8b 40 04             	mov    0x4(%eax),%eax
    2401:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    2405:	8d 83 50 e3 ff ff    	lea    -0x1cb0(%ebx),%eax
    240b:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    240f:	31 c9                	xor    %ecx,%ecx
    2411:	89 44 24 28          	mov    %eax,0x28(%esp)
    2415:	31 c0                	xor    %eax,%eax
    2417:	eb 48                	jmp    2461 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x91>
    2419:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
    2420:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    2424:	80 7c 31 ff 0a       	cmpb   $0xa,-0x1(%ecx,%esi,1)
    2429:	89 ce                	mov    %ecx,%esi
    242b:	0f 94 c1             	sete   %cl
    242e:	01 f2                	add    %esi,%edx
    2430:	89 d5                	mov    %edx,%ebp
    2432:	8b 54 24 24          	mov    0x24(%esp),%edx
    2436:	88 0a                	mov    %cl,(%edx)
    2438:	83 ec 04             	sub    $0x4,%esp
    243b:	50                   	push   %eax
    243c:	55                   	push   %ebp
    243d:	ff 74 24 2c          	push   0x2c(%esp)
    2441:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    2445:	ff 50 0c             	call   *0xc(%eax)
    2448:	83 c4 10             	add    $0x10,%esp
    244b:	84 c0                	test   %al,%al
    244d:	8b 44 24 10          	mov    0x10(%esp),%eax
    2451:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    2455:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    2459:	89 fa                	mov    %edi,%edx
    245b:	0f 85 b9 01 00 00    	jne    261a <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x24a>
    2461:	f6 c1 01             	test   $0x1,%cl
    2464:	0f 85 ac 01 00 00    	jne    2616 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x246>
    246a:	39 c5                	cmp    %eax,%ebp
    246c:	73 12                	jae    2480 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xb0>
    246e:	89 c7                	mov    %eax,%edi
    2470:	e9 50 01 00 00       	jmp    25c5 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f5>
    2475:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    247c:	00 00 00 
    247f:	90                   	nop
    2480:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2484:	eb 18                	jmp    249e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xce>
    2486:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    248d:	00 00 00 
    2490:	8b 74 24 44          	mov    0x44(%esp),%esi
    2494:	39 ef                	cmp    %ebp,%edi
    2496:	89 f8                	mov    %edi,%eax
    2498:	0f 87 27 01 00 00    	ja     25c5 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f5>
    249e:	89 e9                	mov    %ebp,%ecx
    24a0:	89 c7                	mov    %eax,%edi
    24a2:	29 c1                	sub    %eax,%ecx
    24a4:	01 f0                	add    %esi,%eax
    24a6:	89 7c 24 10          	mov    %edi,0x10(%esp)
    24aa:	83 f9 07             	cmp    $0x7,%ecx
    24ad:	77 31                	ja     24e0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x110>
    24af:	39 fd                	cmp    %edi,%ebp
    24b1:	0f 84 0c 01 00 00    	je     25c3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f3>
    24b7:	31 f6                	xor    %esi,%esi
    24b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
    24c0:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    24c4:	0f 84 c9 00 00 00    	je     2593 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1c3>
    24ca:	46                   	inc    %esi
    24cb:	39 f1                	cmp    %esi,%ecx
    24cd:	75 f1                	jne    24c0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xf0>
    24cf:	e9 ef 00 00 00       	jmp    25c3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f3>
    24d4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    24db:	00 00 00 
    24de:	66 90                	xchg   %ax,%ax
    24e0:	8d 78 03             	lea    0x3(%eax),%edi
    24e3:	83 e7 fc             	and    $0xfffffffc,%edi
    24e6:	89 fa                	mov    %edi,%edx
    24e8:	29 c2                	sub    %eax,%edx
    24ea:	74 20                	je     250c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x13c>
    24ec:	31 f6                	xor    %esi,%esi
    24ee:	66 90                	xchg   %ax,%ax
    24f0:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    24f4:	0f 84 95 00 00 00    	je     258f <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bf>
    24fa:	46                   	inc    %esi
    24fb:	39 f2                	cmp    %esi,%edx
    24fd:	75 f1                	jne    24f0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x120>
    24ff:	8d 71 f8             	lea    -0x8(%ecx),%esi
    2502:	39 f2                	cmp    %esi,%edx
    2504:	89 74 24 14          	mov    %esi,0x14(%esp)
    2508:	76 09                	jbe    2513 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x143>
    250a:	eb 51                	jmp    255d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    250c:	8d 71 f8             	lea    -0x8(%ecx),%esi
    250f:	89 74 24 14          	mov    %esi,0x14(%esp)
    2513:	be 04 00 00 00       	mov    $0x4,%esi
    2518:	01 f7                	add    %esi,%edi
    251a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
    2520:	8b 5f fc             	mov    -0x4(%edi),%ebx
    2523:	8b 37                	mov    (%edi),%esi
    2525:	89 dd                	mov    %ebx,%ebp
    2527:	81 f5 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebp
    252d:	81 c5 01 01 01 01    	add    $0x1010101,%ebp
    2533:	09 dd                	or     %ebx,%ebp
    2535:	89 f3                	mov    %esi,%ebx
    2537:	81 f3 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebx
    253d:	81 c3 01 01 01 01    	add    $0x1010101,%ebx
    2543:	09 f3                	or     %esi,%ebx
    2545:	21 eb                	and    %ebp,%ebx
    2547:	f7 d3                	not    %ebx
    2549:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
    254f:	75 0c                	jne    255d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    2551:	83 c2 08             	add    $0x8,%edx
    2554:	83 c7 08             	add    $0x8,%edi
    2557:	3b 54 24 14          	cmp    0x14(%esp),%edx
    255b:	76 c3                	jbe    2520 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x150>
    255d:	39 d1                	cmp    %edx,%ecx
    255f:	74 56                	je     25b7 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1e7>
    2561:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    2565:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    2569:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    256c:	31 f6                	xor    %esi,%esi
    256e:	89 ef                	mov    %ebp,%edi
    2570:	29 d7                	sub    %edx,%edi
    2572:	2b 7c 24 10          	sub    0x10(%esp),%edi
    2576:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    257d:	00 00 00 
    2580:	80 3c 31 0a          	cmpb   $0xa,(%ecx,%esi,1)
    2584:	74 07                	je     258d <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bd>
    2586:	46                   	inc    %esi
    2587:	39 f7                	cmp    %esi,%edi
    2589:	75 f5                	jne    2580 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1b0>
    258b:	eb 32                	jmp    25bf <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1ef>
    258d:	01 d6                	add    %edx,%esi
    258f:	8b 54 24 0c          	mov    0xc(%esp),%edx
    2593:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    2597:	8d 7c 0e 01          	lea    0x1(%esi,%ecx,1),%edi
    259b:	01 f1                	add    %esi,%ecx
    259d:	39 e9                	cmp    %ebp,%ecx
    259f:	0f 83 eb fe ff ff    	jae    2490 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    25a5:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    25a9:	0f 85 e1 fe ff ff    	jne    2490 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    25af:	31 c9                	xor    %ecx,%ecx
    25b1:	89 f8                	mov    %edi,%eax
    25b3:	89 fe                	mov    %edi,%esi
    25b5:	eb 1a                	jmp    25d1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x201>
    25b7:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    25bb:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    25bf:	8b 54 24 0c          	mov    0xc(%esp),%edx
    25c3:	89 ef                	mov    %ebp,%edi
    25c5:	89 f8                	mov    %edi,%eax
    25c7:	b1 01                	mov    $0x1,%cl
    25c9:	39 d5                	cmp    %edx,%ebp
    25cb:	89 d7                	mov    %edx,%edi
    25cd:	89 ee                	mov    %ebp,%esi
    25cf:	74 45                	je     2616 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x246>
    25d1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    25d5:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    25d9:	89 44 24 10          	mov    %eax,0x10(%esp)
    25dd:	80 39 00             	cmpb   $0x0,(%ecx)
    25e0:	74 1f                	je     2601 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x231>
    25e2:	83 ec 04             	sub    $0x4,%esp
    25e5:	6a 04                	push   $0x4
    25e7:	ff 74 24 30          	push   0x30(%esp)
    25eb:	ff 74 24 2c          	push   0x2c(%esp)
    25ef:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    25f3:	89 d5                	mov    %edx,%ebp
    25f5:	ff 50 0c             	call   *0xc(%eax)
    25f8:	89 ea                	mov    %ebp,%edx
    25fa:	83 c4 10             	add    $0x10,%esp
    25fd:	84 c0                	test   %al,%al
    25ff:	75 19                	jne    261a <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x24a>
    2601:	89 f0                	mov    %esi,%eax
    2603:	29 d0                	sub    %edx,%eax
    2605:	0f 85 15 fe ff ff    	jne    2420 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x50>
    260b:	8b 74 24 44          	mov    0x44(%esp),%esi
    260f:	31 c9                	xor    %ecx,%ecx
    2611:	e9 18 fe ff ff       	jmp    242e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x5e>
    2616:	31 c0                	xor    %eax,%eax
    2618:	eb 02                	jmp    261c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x24c>
    261a:	b0 01                	mov    $0x1,%al
    261c:	83 c4 2c             	add    $0x2c,%esp
    261f:	5e                   	pop    %esi
    2620:	5f                   	pop    %edi
    2621:	5b                   	pop    %ebx
    2622:	5d                   	pop    %ebp
    2623:	c3                   	ret
    2624:	66 90                	xchg   %ax,%ax
    2626:	66 90                	xchg   %ax,%ax
    2628:	66 90                	xchg   %ax,%ax
    262a:	66 90                	xchg   %ax,%ax
    262c:	66 90                	xchg   %ax,%ax
    262e:	66 90                	xchg   %ax,%ax

00002630 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E>:
    2630:	55                   	push   %ebp
    2631:	53                   	push   %ebx
    2632:	57                   	push   %edi
    2633:	56                   	push   %esi
    2634:	83 ec 0c             	sub    $0xc,%esp
    2637:	8b 44 24 20          	mov    0x20(%esp),%eax
    263b:	e8 00 00 00 00       	call   2640 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x10>
    2640:	5b                   	pop    %ebx
    2641:	81 c3 b4 29 00 00    	add    $0x29b4,%ebx
    2647:	8b 68 08             	mov    0x8(%eax),%ebp
    264a:	8b 38                	mov    (%eax),%edi
    264c:	8b 70 04             	mov    0x4(%eax),%esi
    264f:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
    2653:	74 1e                	je     2673 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    2655:	83 ec 04             	sub    $0x4,%esp
    2658:	8d 83 50 e3 ff ff    	lea    -0x1cb0(%ebx),%eax
    265e:	6a 04                	push   $0x4
    2660:	50                   	push   %eax
    2661:	57                   	push   %edi
    2662:	ff 56 0c             	call   *0xc(%esi)
    2665:	83 c4 10             	add    $0x10,%esp
    2668:	84 c0                	test   %al,%al
    266a:	74 07                	je     2673 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    266c:	b0 01                	mov    $0x1,%al
    266e:	83 c4 0c             	add    $0xc,%esp
    2671:	eb 16                	jmp    2689 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x59>
    2673:	8b 44 24 24          	mov    0x24(%esp),%eax
    2677:	83 f8 0a             	cmp    $0xa,%eax
    267a:	0f 94 45 00          	sete   0x0(%ebp)
    267e:	83 ec 08             	sub    $0x8,%esp
    2681:	50                   	push   %eax
    2682:	57                   	push   %edi
    2683:	ff 56 10             	call   *0x10(%esi)
    2686:	83 c4 1c             	add    $0x1c,%esp
    2689:	5e                   	pop    %esi
    268a:	5f                   	pop    %edi
    268b:	5b                   	pop    %ebx
    268c:	5d                   	pop    %ebp
    268d:	c3                   	ret
    268e:	66 90                	xchg   %ax,%ax

00002690 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE>:
    2690:	53                   	push   %ebx
    2691:	83 ec 08             	sub    $0x8,%esp
    2694:	8b 44 24 14          	mov    0x14(%esp),%eax
    2698:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    269c:	e8 00 00 00 00       	call   26a1 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x11>
    26a1:	5b                   	pop    %ebx
    26a2:	81 c3 53 29 00 00    	add    $0x2953,%ebx
    26a8:	8b 50 04             	mov    0x4(%eax),%edx
    26ab:	83 fa 01             	cmp    $0x1,%edx
    26ae:	74 02                	je     26b2 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x22>
    26b0:	85 d2                	test   %edx,%edx
    26b2:	8d 93 18 ff ff ff    	lea    -0xe8(%ebx),%edx
    26b8:	89 04 24             	mov    %eax,(%esp)
    26bb:	e8 a0 f7 ff ff       	call   1e60 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    26c0:	83 c4 08             	add    $0x8,%esp
    26c3:	5b                   	pop    %ebx
    26c4:	c3                   	ret
    26c5:	66 90                	xchg   %ax,%ax
    26c7:	66 90                	xchg   %ax,%ax
    26c9:	66 90                	xchg   %ax,%ax
    26cb:	66 90                	xchg   %ax,%ax
    26cd:	66 90                	xchg   %ax,%ax
    26cf:	90                   	nop

000026d0 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E>:
    26d0:	53                   	push   %ebx
    26d1:	83 ec 08             	sub    $0x8,%esp
    26d4:	8b 44 24 10          	mov    0x10(%esp),%eax
    26d8:	e8 00 00 00 00       	call   26dd <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E+0xd>
    26dd:	5b                   	pop    %ebx
    26de:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    26e2:	81 c3 17 29 00 00    	add    $0x2917,%ebx
    26e8:	8b 00                	mov    (%eax),%eax
    26ea:	8b 94 c3 48 ff ff ff 	mov    -0xb8(%ebx,%eax,8),%edx
    26f1:	8b 84 c3 4c ff ff ff 	mov    -0xb4(%ebx,%eax,8),%eax
    26f8:	89 04 24             	mov    %eax,(%esp)
    26fb:	e8 e0 f1 ff ff       	call   18e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    2700:	83 c4 08             	add    $0x8,%esp
    2703:	5b                   	pop    %ebx
    2704:	c3                   	ret
    2705:	66 90                	xchg   %ax,%ax
    2707:	66 90                	xchg   %ax,%ax
    2709:	66 90                	xchg   %ax,%ax
    270b:	66 90                	xchg   %ax,%ax
    270d:	66 90                	xchg   %ax,%ax
    270f:	90                   	nop

00002710 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$7enabled17h7c1fbd7539bc5801E>:
    2710:	31 c0                	xor    %eax,%eax
    2712:	c3                   	ret
    2713:	66 90                	xchg   %ax,%ax
    2715:	66 90                	xchg   %ax,%ax
    2717:	66 90                	xchg   %ax,%ax
    2719:	66 90                	xchg   %ax,%ax
    271b:	66 90                	xchg   %ax,%ax
    271d:	66 90                	xchg   %ax,%ax
    271f:	90                   	nop

00002720 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$3log17hb129cc8b65bcebf0E>:
    2720:	c3                   	ret
    2721:	66 90                	xchg   %ax,%ax
    2723:	66 90                	xchg   %ax,%ax
    2725:	66 90                	xchg   %ax,%ax
    2727:	66 90                	xchg   %ax,%ax
    2729:	66 90                	xchg   %ax,%ax
    272b:	66 90                	xchg   %ax,%ax
    272d:	66 90                	xchg   %ax,%ax
    272f:	90                   	nop

00002730 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$5flush17hb87dc07497484b4cE>:
    2730:	c3                   	ret
    2731:	66 90                	xchg   %ax,%ax
    2733:	66 90                	xchg   %ax,%ax
    2735:	66 90                	xchg   %ax,%ax
    2737:	66 90                	xchg   %ax,%ax
    2739:	66 90                	xchg   %ax,%ax
    273b:	66 90                	xchg   %ax,%ax
    273d:	66 90                	xchg   %ax,%ax
    273f:	90                   	nop

00002740 <memcpy>:
    2740:	55                   	push   %ebp
    2741:	53                   	push   %ebx
    2742:	57                   	push   %edi
    2743:	56                   	push   %esi
    2744:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    2748:	8b 44 24 14          	mov    0x14(%esp),%eax
    274c:	8b 54 24 18          	mov    0x18(%esp),%edx
    2750:	89 c6                	mov    %eax,%esi
    2752:	83 fd 10             	cmp    $0x10,%ebp
    2755:	72 63                	jb     27ba <memcpy+0x7a>
    2757:	f7 de                	neg    %esi
    2759:	83 e6 03             	and    $0x3,%esi
    275c:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    275f:	39 f8                	cmp    %edi,%eax
    2761:	73 19                	jae    277c <memcpy+0x3c>
    2763:	31 db                	xor    %ebx,%ebx
    2765:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    276c:	00 00 00 
    276f:	90                   	nop
    2770:	0f b6 0c 1a          	movzbl (%edx,%ebx,1),%ecx
    2774:	88 0c 18             	mov    %cl,(%eax,%ebx,1)
    2777:	43                   	inc    %ebx
    2778:	39 de                	cmp    %ebx,%esi
    277a:	75 f4                	jne    2770 <memcpy+0x30>
    277c:	29 f5                	sub    %esi,%ebp
    277e:	01 f2                	add    %esi,%edx
    2780:	89 eb                	mov    %ebp,%ebx
    2782:	89 e8                	mov    %ebp,%eax
    2784:	83 e3 fc             	and    $0xfffffffc,%ebx
    2787:	f6 c2 03             	test   $0x3,%dl
    278a:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
    278d:	75 52                	jne    27e1 <memcpy+0xa1>
    278f:	39 f7                	cmp    %esi,%edi
    2791:	73 1c                	jae    27af <memcpy+0x6f>
    2793:	89 d5                	mov    %edx,%ebp
    2795:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    279c:	00 00 00 
    279f:	90                   	nop
    27a0:	8b 4d 00             	mov    0x0(%ebp),%ecx
    27a3:	83 c5 04             	add    $0x4,%ebp
    27a6:	89 0f                	mov    %ecx,(%edi)
    27a8:	83 c7 04             	add    $0x4,%edi
    27ab:	39 f7                	cmp    %esi,%edi
    27ad:	72 f1                	jb     27a0 <memcpy+0x60>
    27af:	89 c5                	mov    %eax,%ebp
    27b1:	8b 44 24 14          	mov    0x14(%esp),%eax
    27b5:	01 da                	add    %ebx,%edx
    27b7:	83 e5 03             	and    $0x3,%ebp
    27ba:	8d 3c 2e             	lea    (%esi,%ebp,1),%edi
    27bd:	39 fe                	cmp    %edi,%esi
    27bf:	73 1b                	jae    27dc <memcpy+0x9c>
    27c1:	31 ff                	xor    %edi,%edi
    27c3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    27ca:	00 00 00 
    27cd:	0f 1f 00             	nopl   (%eax)
    27d0:	0f b6 0c 3a          	movzbl (%edx,%edi,1),%ecx
    27d4:	88 0c 3e             	mov    %cl,(%esi,%edi,1)
    27d7:	47                   	inc    %edi
    27d8:	39 fd                	cmp    %edi,%ebp
    27da:	75 f4                	jne    27d0 <memcpy+0x90>
    27dc:	5e                   	pop    %esi
    27dd:	5f                   	pop    %edi
    27de:	5b                   	pop    %ebx
    27df:	5d                   	pop    %ebp
    27e0:	c3                   	ret
    27e1:	39 f7                	cmp    %esi,%edi
    27e3:	73 ca                	jae    27af <memcpy+0x6f>
    27e5:	89 d5                	mov    %edx,%ebp
    27e7:	8b 4d 00             	mov    0x0(%ebp),%ecx
    27ea:	83 c5 04             	add    $0x4,%ebp
    27ed:	89 0f                	mov    %ecx,(%edi)
    27ef:	83 c7 04             	add    $0x4,%edi
    27f2:	39 f7                	cmp    %esi,%edi
    27f4:	72 f1                	jb     27e7 <memcpy+0xa7>
    27f6:	eb b7                	jmp    27af <memcpy+0x6f>

Disassembly of section .interp:

00003000 <.interp>:
    3000:	2f                   	das
    3001:	6c                   	insb   (%dx),%es:(%edi)
    3002:	69 62 2f 6c 64 2d 6c 	imul   $0x6c2d646c,0x2f(%edx),%esp
    3009:	69 6e 75 78 2e 73 6f 	imul   $0x6f732e78,0x75(%esi),%ebp
    3010:	2e 32 00             	xor    %cs:(%eax),%al

Disassembly of section .gnu.hash:

00003014 <.gnu.hash>:
    3014:	01 00                	add    %eax,(%eax)
    3016:	00 00                	add    %al,(%eax)
    3018:	01 00                	add    %eax,(%eax)
    301a:	00 00                	add    %al,(%eax)
    301c:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .dynsym:

0000302c <.dynsym>:
	...

Disassembly of section .dynstr:

0000303c <.dynstr>:
	...

Disassembly of section .rel.dyn:

00003040 <.rel.dyn>:
    3040:	64 4e                	fs dec %esi
    3042:	00 00                	add    %al,(%eax)
    3044:	08 00                	or     %al,(%eax)
    3046:	00 00                	add    %al,(%eax)
    3048:	70 4e                	jo     3098 <memcpy+0x958>
    304a:	00 00                	add    %al,(%eax)
    304c:	08 00                	or     %al,(%eax)
    304e:	00 00                	add    %al,(%eax)
    3050:	74 4e                	je     30a0 <memcpy+0x960>
    3052:	00 00                	add    %al,(%eax)
    3054:	08 00                	or     %al,(%eax)
    3056:	00 00                	add    %al,(%eax)
    3058:	78 4e                	js     30a8 <memcpy+0x968>
    305a:	00 00                	add    %al,(%eax)
    305c:	08 00                	or     %al,(%eax)
    305e:	00 00                	add    %al,(%eax)
    3060:	7c 4e                	jl     30b0 <memcpy+0x970>
    3062:	00 00                	add    %al,(%eax)
    3064:	08 00                	or     %al,(%eax)
    3066:	00 00                	add    %al,(%eax)
    3068:	88 4e 00             	mov    %cl,0x0(%esi)
    306b:	00 08                	add    %cl,(%eax)
    306d:	00 00                	add    %al,(%eax)
    306f:	00 8c 4e 00 00 08 00 	add    %cl,0x80000(%esi,%ecx,2)
    3076:	00 00                	add    %al,(%eax)
    3078:	90                   	nop
    3079:	4e                   	dec    %esi
    307a:	00 00                	add    %al,(%eax)
    307c:	08 00                	or     %al,(%eax)
    307e:	00 00                	add    %al,(%eax)
    3080:	94                   	xchg   %eax,%esp
    3081:	4e                   	dec    %esi
    3082:	00 00                	add    %al,(%eax)
    3084:	08 00                	or     %al,(%eax)
    3086:	00 00                	add    %al,(%eax)
    3088:	9c                   	pushf
    3089:	4e                   	dec    %esi
    308a:	00 00                	add    %al,(%eax)
    308c:	08 00                	or     %al,(%eax)
    308e:	00 00                	add    %al,(%eax)
    3090:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    3091:	4e                   	dec    %esi
    3092:	00 00                	add    %al,(%eax)
    3094:	08 00                	or     %al,(%eax)
    3096:	00 00                	add    %al,(%eax)
    3098:	ac                   	lods   %ds:(%esi),%al
    3099:	4e                   	dec    %esi
    309a:	00 00                	add    %al,(%eax)
    309c:	08 00                	or     %al,(%eax)
    309e:	00 00                	add    %al,(%eax)
    30a0:	b4 4e                	mov    $0x4e,%ah
    30a2:	00 00                	add    %al,(%eax)
    30a4:	08 00                	or     %al,(%eax)
    30a6:	00 00                	add    %al,(%eax)
    30a8:	c8 4e 00 00          	enter  $0x4e,$0x0
    30ac:	08 00                	or     %al,(%eax)
    30ae:	00 00                	add    %al,(%eax)
    30b0:	cc                   	int3
    30b1:	4e                   	dec    %esi
    30b2:	00 00                	add    %al,(%eax)
    30b4:	08 00                	or     %al,(%eax)
    30b6:	00 00                	add    %al,(%eax)
    30b8:	dc 4e 00             	fmull  0x0(%esi)
    30bb:	00 08                	add    %cl,(%eax)
    30bd:	00 00                	add    %al,(%eax)
    30bf:	00 ec                	add    %ch,%ah
    30c1:	4e                   	dec    %esi
    30c2:	00 00                	add    %al,(%eax)
    30c4:	08 00                	or     %al,(%eax)
    30c6:	00 00                	add    %al,(%eax)
    30c8:	f4                   	hlt
    30c9:	4e                   	dec    %esi
    30ca:	00 00                	add    %al,(%eax)
    30cc:	08 00                	or     %al,(%eax)
    30ce:	00 00                	add    %al,(%eax)
    30d0:	04 4f                	add    $0x4f,%al
    30d2:	00 00                	add    %al,(%eax)
    30d4:	08 00                	or     %al,(%eax)
    30d6:	00 00                	add    %al,(%eax)
    30d8:	18 4f 00             	sbb    %cl,0x0(%edi)
    30db:	00 08                	add    %cl,(%eax)
    30dd:	00 00                	add    %al,(%eax)
    30df:	00 1c 4f             	add    %bl,(%edi,%ecx,2)
    30e2:	00 00                	add    %al,(%eax)
    30e4:	08 00                	or     %al,(%eax)
    30e6:	00 00                	add    %al,(%eax)
    30e8:	20 4f 00             	and    %cl,0x0(%edi)
    30eb:	00 08                	add    %cl,(%eax)
    30ed:	00 00                	add    %al,(%eax)
    30ef:	00 30                	add    %dh,(%eax)
    30f1:	4f                   	dec    %edi
    30f2:	00 00                	add    %al,(%eax)
    30f4:	08 00                	or     %al,(%eax)
    30f6:	00 00                	add    %al,(%eax)
    30f8:	34 4f                	xor    $0x4f,%al
    30fa:	00 00                	add    %al,(%eax)
    30fc:	08 00                	or     %al,(%eax)
    30fe:	00 00                	add    %al,(%eax)
    3100:	38 4f 00             	cmp    %cl,0x0(%edi)
    3103:	00 08                	add    %cl,(%eax)
    3105:	00 00                	add    %al,(%eax)
    3107:	00 3c 4f             	add    %bh,(%edi,%ecx,2)
    310a:	00 00                	add    %al,(%eax)
    310c:	08 00                	or     %al,(%eax)
    310e:	00 00                	add    %al,(%eax)
    3110:	44                   	inc    %esp
    3111:	4f                   	dec    %edi
    3112:	00 00                	add    %al,(%eax)
    3114:	08 00                	or     %al,(%eax)
    3116:	00 00                	add    %al,(%eax)
    3118:	4c                   	dec    %esp
    3119:	4f                   	dec    %edi
    311a:	00 00                	add    %al,(%eax)
    311c:	08 00                	or     %al,(%eax)
    311e:	00 00                	add    %al,(%eax)
    3120:	54                   	push   %esp
    3121:	4f                   	dec    %edi
    3122:	00 00                	add    %al,(%eax)
    3124:	08 00                	or     %al,(%eax)
    3126:	00 00                	add    %al,(%eax)
    3128:	5c                   	pop    %esp
    3129:	4f                   	dec    %edi
    312a:	00 00                	add    %al,(%eax)
    312c:	08 00                	or     %al,(%eax)
    312e:	00 00                	add    %al,(%eax)
    3130:	64 4f                	fs dec %edi
    3132:	00 00                	add    %al,(%eax)
    3134:	08 00                	or     %al,(%eax)
    3136:	00 00                	add    %al,(%eax)
    3138:	04 50                	add    $0x50,%al
    313a:	00 00                	add    %al,(%eax)
    313c:	08 00                	or     %al,(%eax)
	...

Disassembly of section .rodata:

00003140 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E-0x30>:
    3140:	01 01                	add    %eax,(%ecx)
    3142:	01 01                	add    %eax,(%ecx)
    3144:	01 01                	add    %eax,(%ecx)
    3146:	01 01                	add    %eax,(%ecx)
    3148:	01 01                	add    %eax,(%ecx)
    314a:	01 01                	add    %eax,(%ecx)
    314c:	01 01                	add    %eax,(%ecx)
    314e:	01 01                	add    %eax,(%ecx)
    3150:	d4 cc                	aam    $0xcc
    3152:	ff                   	(bad)
    3153:	ff cb                	dec    %ebx
    3155:	cc                   	int3
    3156:	ff                   	(bad)
    3157:	ff cf                	dec    %edi
    3159:	cc                   	int3
    315a:	ff                   	(bad)
    315b:	ff d4                	call   *%esp
    315d:	cc                   	int3
    315e:	ff                   	(bad)
    315f:	ff                   	lcall  (bad)
    3160:	df d2                	(bad)
    3162:	ff                   	(bad)
    3163:	ff e3                	jmp    *%ebx
    3165:	d1 ff                	sar    $1,%edi
    3167:	ff                   	lcall  (bad)
    3168:	da d2                	fcmovbe %st(2),%st
    316a:	ff                   	(bad)
    316b:	ff e3                	jmp    *%ebx
    316d:	d1 ff                	sar    $1,%edi
    316f:	ff                 	incl   (%eax)

00003170 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E>:
	...
    3274:	5b                   	pop    %ebx
    3275:	5d                   	pop    %ebp
    3276:	5b                   	pop    %ebx
    3277:	5d                   	pop    %ebp
    3278:	20 0a                	and    %cl,(%edx)
    327a:	50                   	push   %eax
    327b:	61                   	popa
    327c:	6e                   	outsb  %ds:(%esi),(%dx)
    327d:	69 63 20 69 73 20 64 	imul   $0x64207369,0x20(%ebx),%esp
    3284:	65 74 65             	gs je  32ec <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x17c>
    3287:	63 74 65 64          	arpl   %esi,0x64(%ebp,%eiz,2)
    328b:	3a 20                	cmp    (%eax),%ah
    328d:	2f                   	das
    328e:	68 6f 6d 65 2f       	push   $0x2f656d6f
    3293:	50                   	push   %eax
    3294:	61                   	popa
    3295:	76 61                	jbe    32f8 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x188>
    3297:	6c                   	insb   (%dx),%es:(%edi)
    3298:	2f                   	das
    3299:	54                   	push   %esp
    329a:	72 69                	jb     3305 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x195>
    329c:	67 67 65 72 73       	addr16 addr16 gs jb 3314 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1a4>
    32a1:	2f                   	das
    32a2:	52                   	push   %edx
    32a3:	75 73                	jne    3318 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1a8>
    32a5:	74 2f                	je     32d6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x166>
    32a7:	45                   	inc    %ebp
    32a8:	6d                   	insl   (%dx),%es:(%edi)
    32a9:	62 65 64             	bound  %esp,0x64(%ebp)
    32ac:	64 65 64 2f          	fs gs fs das
    32b0:	70 65                	jo     3317 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1a7>
    32b2:	74 5f                	je     3313 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1a3>
    32b4:	6f                   	outsl  %ds:(%esi),(%dx)
    32b5:	73 2f                	jae    32e6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x176>
    32b7:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
    32bb:	65 6c                	gs insb (%dx),%es:(%edi)
    32bd:	2d 6c 69 62 2f       	sub    $0x2f62696c,%eax
    32c2:	73 72                	jae    3336 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1c6>
    32c4:	63 2f                	arpl   %ebp,(%edi)
    32c6:	6c                   	insb   (%dx),%es:(%edi)
    32c7:	69 62 2e 72 73 6b 65 	imul   $0x656b7372,0x2e(%edx),%esp
    32ce:	72 6e                	jb     333e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1ce>
    32d0:	65 6c                	gs insb (%dx),%es:(%edi)
    32d2:	5f                   	pop    %edi
    32d3:	6c                   	insb   (%dx),%es:(%edi)
    32d4:	69 62 28 29 63 61 6c 	imul   $0x6c616329,0x28(%edx),%esp
    32db:	6c                   	insb   (%dx),%es:(%edi)
    32dc:	65 64 20 60 52       	gs and %ah,%fs:0x52(%eax)
    32e1:	65 73 75             	gs jae 3359 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1e9>
    32e4:	6c                   	insb   (%dx),%es:(%edi)
    32e5:	74 3a                	je     3321 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1b1>
    32e7:	3a 75 6e             	cmp    0x6e(%ebp),%dh
    32ea:	77 72                	ja     335e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1ee>
    32ec:	61                   	popa
    32ed:	70 28                	jo     3317 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1a7>
    32ef:	29 60 20             	sub    %esp,0x20(%eax)
    32f2:	6f                   	outsl  %ds:(%esi),(%dx)
    32f3:	6e                   	outsb  %ds:(%esi),(%dx)
    32f4:	20 61 6e             	and    %ah,0x6e(%ecx)
    32f7:	20 60 45             	and    %ah,0x45(%eax)
    32fa:	72 72                	jb     336e <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1fe>
    32fc:	60                   	pusha
    32fd:	20 76 61             	and    %dh,0x61(%esi)
    3300:	6c                   	insb   (%dx),%es:(%edi)
    3301:	75 65                	jne    3368 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1f8>
    3303:	53                   	push   %ebx
    3304:	65 74 4c             	gs je  3353 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1e3>
    3307:	6f                   	outsl  %ds:(%esi),(%dx)
    3308:	67 67 65 72 45       	addr16 addr16 gs jb 3352 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1e2>
    330d:	72 72                	jb     3381 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x211>
    330f:	6f                   	outsl  %ds:(%esi),(%dx)
    3310:	72 76                	jb     3388 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x218>
    3312:	67 61                	addr16 popa
    3314:	2f                   	das
    3315:	73 72                	jae    3389 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x219>
    3317:	63 2f                	arpl   %ebp,(%edi)
    3319:	6d                   	insl   (%dx),%es:(%edi)
    331a:	61                   	popa
    331b:	69 6e 2e 72 73 46 72 	imul   $0x72467372,0x2e(%esi),%ebp
    3322:	6f                   	outsl  %ds:(%esi),(%dx)
    3323:	6d                   	insl   (%dx),%es:(%edi)
    3324:	20 76 67             	and    %dh,0x67(%esi)
    3327:	61                   	popa
    3328:	20 64 72 69          	and    %ah,0x69(%edx,%esi,2)
    332c:	76 65                	jbe    3393 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x223>
    332e:	72 76                	jb     33a6 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x236>
    3330:	67 61                	addr16 popa
    3332:	29 3a                	sub    %edi,(%edx)
    3334:	70 61                	jo     3397 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x227>
    3336:	6e                   	outsb  %ds:(%esi),(%dx)
    3337:	69 63 6b 65 64 20 61 	imul   $0x61206465,0x6b(%ebx),%esp
    333e:	74 20                	je     3360 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x1f0>
    3340:	3a 0a                	cmp    (%edx),%cl
    3342:	3a 20                	cmp    (%eax),%ah
    3344:	20 20                	and    %ah,(%eax)
    3346:	20 20                	and    %ah,(%eax)
    3348:	57                   	push   %edi
    3349:	41                   	inc    %ecx
    334a:	52                   	push   %edx
    334b:	4e                   	dec    %esi
    334c:	49                   	dec    %ecx
    334d:	4e                   	dec    %esi
    334e:	46                   	inc    %esi
    334f:	4f                   	dec    %edi
    3350:	2c 0a                	sub    $0xa,%al
    3352:	28 28                	sub    %ch,(%eax)
    3354:	0a 30                	or     (%eax),%dh
    3356:	30 30                	xor    %dh,(%eax)
    3358:	31 30                	xor    %esi,(%eax)
    335a:	32 30                	xor    (%eax),%dh
    335c:	33 30                	xor    (%eax),%esi
    335e:	34 30                	xor    $0x30,%al
    3360:	35 30 36 30 37       	xor    $0x37303630,%eax
    3365:	30 38                	xor    %bh,(%eax)
    3367:	30 39                	xor    %bh,(%ecx)
    3369:	31 30                	xor    %esi,(%eax)
    336b:	31 31                	xor    %esi,(%ecx)
    336d:	31 32                	xor    %esi,(%edx)
    336f:	31 33                	xor    %esi,(%ebx)
    3371:	31 34 31             	xor    %esi,(%ecx,%esi,1)
    3374:	35 31 36 31 37       	xor    $0x37313631,%eax
    3379:	31 38                	xor    %edi,(%eax)
    337b:	31 39                	xor    %edi,(%ecx)
    337d:	32 30                	xor    (%eax),%dh
    337f:	32 31                	xor    (%ecx),%dh
    3381:	32 32                	xor    (%edx),%dh
    3383:	32 33                	xor    (%ebx),%dh
    3385:	32 34 32             	xor    (%edx,%esi,1),%dh
    3388:	35 32 36 32 37       	xor    $0x37323632,%eax
    338d:	32 38                	xor    (%eax),%bh
    338f:	32 39                	xor    (%ecx),%bh
    3391:	33 30                	xor    (%eax),%esi
    3393:	33 31                	xor    (%ecx),%esi
    3395:	33 32                	xor    (%edx),%esi
    3397:	33 33                	xor    (%ebx),%esi
    3399:	33 34 33             	xor    (%ebx,%esi,1),%esi
    339c:	35 33 36 33 37       	xor    $0x37333633,%eax
    33a1:	33 38                	xor    (%eax),%edi
    33a3:	33 39                	xor    (%ecx),%edi
    33a5:	34 30                	xor    $0x30,%al
    33a7:	34 31                	xor    $0x31,%al
    33a9:	34 32                	xor    $0x32,%al
    33ab:	34 33                	xor    $0x33,%al
    33ad:	34 34                	xor    $0x34,%al
    33af:	34 35                	xor    $0x35,%al
    33b1:	34 36                	xor    $0x36,%al
    33b3:	34 37                	xor    $0x37,%al
    33b5:	34 38                	xor    $0x38,%al
    33b7:	34 39                	xor    $0x39,%al
    33b9:	35 30 35 31 35       	xor    $0x35313530,%eax
    33be:	32 35 33 35 34 35    	xor    0x35343533,%dh
    33c4:	35 35 36 35 37       	xor    $0x37353635,%eax
    33c9:	35 38 35 39 36       	xor    $0x36393538,%eax
    33ce:	30 36                	xor    %dh,(%esi)
    33d0:	31 36                	xor    %esi,(%esi)
    33d2:	32 36                	xor    (%esi),%dh
    33d4:	33 36                	xor    (%esi),%esi
    33d6:	34 36                	xor    $0x36,%al
    33d8:	35 36 36 36 37       	xor    $0x37363636,%eax
    33dd:	36 38 36             	cmp    %dh,%ss:(%esi)
    33e0:	39 37                	cmp    %esi,(%edi)
    33e2:	30 37                	xor    %dh,(%edi)
    33e4:	31 37                	xor    %esi,(%edi)
    33e6:	32 37                	xor    (%edi),%dh
    33e8:	33 37                	xor    (%edi),%esi
    33ea:	34 37                	xor    $0x37,%al
    33ec:	35 37 36 37 37       	xor    $0x37373637,%eax
    33f1:	37                   	aaa
    33f2:	38 37                	cmp    %dh,(%edi)
    33f4:	39 38                	cmp    %edi,(%eax)
    33f6:	30 38                	xor    %bh,(%eax)
    33f8:	31 38                	xor    %edi,(%eax)
    33fa:	32 38                	xor    (%eax),%bh
    33fc:	33 38                	xor    (%eax),%edi
    33fe:	34 38                	xor    $0x38,%al
    3400:	35 38 36 38 37       	xor    $0x37383638,%eax
    3405:	38 38                	cmp    %bh,(%eax)
    3407:	38 39                	cmp    %bh,(%ecx)
    3409:	39 30                	cmp    %esi,(%eax)
    340b:	39 31                	cmp    %esi,(%ecx)
    340d:	39 32                	cmp    %esi,(%edx)
    340f:	39 33                	cmp    %esi,(%ebx)
    3411:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    3414:	35 39 36 39 37       	xor    $0x37393639,%eax
    3419:	39 38                	cmp    %edi,(%eax)
    341b:	39 39                	cmp    %edi,(%ecx)
    341d:	4f                   	dec    %edi
    341e:	46                   	inc    %esi
    341f:	46                   	inc    %esi
    3420:	45                   	inc    %ebp
    3421:	52                   	push   %edx
    3422:	52                   	push   %edx
    3423:	4f                   	dec    %edi
    3424:	52                   	push   %edx
    3425:	44                   	inc    %esp
    3426:	45                   	inc    %ebp
    3427:	42                   	inc    %edx
    3428:	55                   	push   %ebp
    3429:	47                   	inc    %edi
    342a:	54                   	push   %esp
    342b:	52                   	push   %edx
    342c:	41                   	inc    %ecx
    342d:	43                   	inc    %ebx
    342e:	45                   	inc    %ebp

Disassembly of section .eh_frame_hdr:

00003430 <__GNU_EH_FRAME_HDR>:
    3430:	01 1b                	add    %ebx,(%ebx)
    3432:	ff                   	(bad)
    3433:	ff 08                	decl   (%eax)
    3435:	00 00                	add    %al,(%eax)
    3437:	00 00                	add    %al,(%eax)
    3439:	00 00                	add    %al,(%eax)
	...

Disassembly of section .data.rel.ro:

00004e64 <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE-0xd8>:
    4e64:	90                   	nop
    4e65:	13 00                	adc    (%eax),%eax
    4e67:	00 04 01             	add    %al,(%ecx,%eax,1)
    4e6a:	00 00                	add    %al,(%eax)
    4e6c:	04 00                	add    $0x0,%al
    4e6e:	00 00                	add    %al,(%eax)
    4e70:	90                   	nop
    4e71:	14 00                	adc    $0x0,%al
    4e73:	00 20                	add    %ah,(%eax)
    4e75:	12 00                	adc    (%eax),%al
    4e77:	00 50 13             	add    %dl,0x13(%eax)
    4e7a:	00 00                	add    %al,(%eax)
    4e7c:	90                   	nop
    4e7d:	13 00                	adc    (%eax),%eax
    4e7f:	00 04 01             	add    %al,(%ecx,%eax,1)
    4e82:	00 00                	add    %al,(%eax)
    4e84:	04 00                	add    $0x0,%al
    4e86:	00 00                	add    %al,(%eax)
    4e88:	a0 13 00 00 b0       	mov    0xb0000013,%al
    4e8d:	13 00                	adc    (%eax),%eax
    4e8f:	00 90 13 00 00 74    	add    %dl,0x74000013(%eax)
    4e95:	32 00                	xor    (%eax),%al
    4e97:	00 01                	add    %al,(%ecx)
    4e99:	00 00                	add    %al,(%eax)
    4e9b:	00 75 32             	add    %dh,0x32(%ebp)
    4e9e:	00 00                	add    %al,(%eax)
    4ea0:	02 00                	add    (%eax),%al
    4ea2:	00 00                	add    %al,(%eax)
    4ea4:	77 32                	ja     4ed8 <__GNU_EH_FRAME_HDR+0x1aa8>
    4ea6:	00 00                	add    %al,(%eax)
    4ea8:	02 00                	add    (%eax),%al
    4eaa:	00 00                	add    %al,(%eax)
    4eac:	79 32                	jns    4ee0 <__GNU_EH_FRAME_HDR+0x1ab0>
    4eae:	00 00                	add    %al,(%eax)
    4eb0:	01 00                	add    %eax,(%eax)
    4eb2:	00 00                	add    %al,(%eax)
    4eb4:	7a 32                	jp     4ee8 <__GNU_EH_FRAME_HDR+0x1ab8>
    4eb6:	00 00                	add    %al,(%eax)
    4eb8:	13 00                	adc    (%eax),%eax
	...
    4ec2:	00 00                	add    %al,(%eax)
    4ec4:	01 00                	add    %eax,(%eax)
    4ec6:	00 00                	add    %al,(%eax)
    4ec8:	60                   	pusha
    4ec9:	17                   	pop    %ss
    4eca:	00 00                	add    %al,(%eax)
    4ecc:	11 33                	adc    %esi,(%ebx)
    4ece:	00 00                	add    %al,(%eax)
    4ed0:	0f 00 00             	sldt   (%eax)
    4ed3:	00 1e                	add    %bl,(%esi)
    4ed5:	00 00                	add    %al,(%eax)
    4ed7:	00 21                	add    %ah,(%ecx)
    4ed9:	00 00                	add    %al,(%eax)
    4edb:	00 20                	add    %ah,(%eax)
    4edd:	33 00                	xor    (%eax),%eax
    4edf:	00 0f                	add    %cl,(%edi)
    4ee1:	00 00                	add    %al,(%eax)
    4ee3:	00 01                	add    %al,(%ecx)
    4ee5:	00 00                	add    %al,(%eax)
    4ee7:	00 00                	add    %al,(%eax)
    4ee9:	00 00                	add    %al,(%eax)
    4eeb:	00 33                	add    %dh,(%ebx)
    4eed:	33 00                	xor    (%eax),%eax
    4eef:	00 01                	add    %al,(%ecx)
    4ef1:	00 00                	add    %al,(%eax)
    4ef3:	00 33                	add    %dh,(%ebx)
    4ef5:	33 00                	xor    (%eax),%eax
    4ef7:	00 01                	add    %al,(%ecx)
    4ef9:	00 00                	add    %al,(%eax)
    4efb:	00 01                	add    %al,(%ecx)
    4efd:	00 00                	add    %al,(%eax)
    4eff:	00 00                	add    %al,(%eax)
    4f01:	00 00                	add    %al,(%eax)
    4f03:	00 42 33             	add    %al,0x33(%edx)
    4f06:	00 00                	add    %al,(%eax)
    4f08:	02 00                	add    (%eax),%al
    4f0a:	00 00                	add    %al,(%eax)
    4f0c:	00 00                	add    %al,(%eax)
    4f0e:	00 00                	add    %al,(%eax)
    4f10:	0c 00                	or     $0x0,%al
    4f12:	00 00                	add    %al,(%eax)
    4f14:	04 00                	add    $0x0,%al
    4f16:	00 00                	add    %al,(%eax)
    4f18:	d0 23                	shlb   $1,(%ebx)
    4f1a:	00 00                	add    %al,(%eax)
    4f1c:	30 26                	xor    %ah,(%esi)
    4f1e:	00 00                	add    %al,(%eax)
    4f20:	90                   	nop
    4f21:	26 00 00             	add    %al,%es:(%eax)
	...
    4f2c:	01 00                	add    %eax,(%eax)
    4f2e:	00 00                	add    %al,(%eax)
    4f30:	10 27                	adc    %ah,(%edi)
    4f32:	00 00                	add    %al,(%eax)
    4f34:	20 27                	and    %ah,(%edi)
    4f36:	00 00                	add    %al,(%eax)
    4f38:	30 27                	xor    %ah,(%edi)
	...

00004f3c <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE>:
    4f3c:	1d 34 00 00 03       	sbb    $0x3000034,%eax
    4f41:	00 00                	add    %al,(%eax)
    4f43:	00 20                	add    %ah,(%eax)
    4f45:	34 00                	xor    $0x0,%al
    4f47:	00 05 00 00 00 48    	add    %al,0x48000000
    4f4d:	33 00                	xor    (%eax),%eax
    4f4f:	00 04 00             	add    %al,(%eax,%eax,1)
    4f52:	00 00                	add    %al,(%eax)
    4f54:	4c                   	dec    %esp
    4f55:	33 00                	xor    (%eax),%eax
    4f57:	00 04 00             	add    %al,(%eax,%eax,1)
    4f5a:	00 00                	add    %al,(%eax)
    4f5c:	25 34 00 00 05       	and    $0x5000034,%eax
    4f61:	00 00                	add    %al,(%eax)
    4f63:	00 2a                	add    %ch,(%edx)
    4f65:	34 00                	xor    $0x0,%al
    4f67:	00                   	.byte 0
    4f68:	05                   	.byte 0x5
    4f69:	00 00                	add    %al,(%eax)
	...

Disassembly of section .dynamic:

00004f6c <_DYNAMIC>:
    4f6c:	f5                   	cmc
    4f6d:	fe                   	(bad)
    4f6e:	ff 6f 14             	ljmp   *0x14(%edi)
    4f71:	30 00                	xor    %al,(%eax)
    4f73:	00 05 00 00 00 3c    	add    %al,0x3c000000
    4f79:	30 00                	xor    %al,(%eax)
    4f7b:	00 06                	add    %al,(%esi)
    4f7d:	00 00                	add    %al,(%eax)
    4f7f:	00 2c 30             	add    %ch,(%eax,%esi,1)
    4f82:	00 00                	add    %al,(%eax)
    4f84:	0a 00                	or     (%eax),%al
    4f86:	00 00                	add    %al,(%eax)
    4f88:	01 00                	add    %eax,(%eax)
    4f8a:	00 00                	add    %al,(%eax)
    4f8c:	0b 00                	or     (%eax),%eax
    4f8e:	00 00                	add    %al,(%eax)
    4f90:	10 00                	adc    %al,(%eax)
    4f92:	00 00                	add    %al,(%eax)
    4f94:	15 00 00 00 00       	adc    $0x0,%eax
    4f99:	00 00                	add    %al,(%eax)
    4f9b:	00 11                	add    %dl,(%ecx)
    4f9d:	00 00                	add    %al,(%eax)
    4f9f:	00 40 30             	add    %al,0x30(%eax)
    4fa2:	00 00                	add    %al,(%eax)
    4fa4:	12 00                	adc    (%eax),%al
    4fa6:	00 00                	add    %al,(%eax)
    4fa8:	00 01                	add    %al,(%ecx)
    4faa:	00 00                	add    %al,(%eax)
    4fac:	13 00                	adc    (%eax),%eax
    4fae:	00 00                	add    %al,(%eax)
    4fb0:	08 00                	or     %al,(%eax)
    4fb2:	00 00                	add    %al,(%eax)
    4fb4:	1e                   	push   %ds
    4fb5:	00 00                	add    %al,(%eax)
    4fb7:	00 08                	add    %cl,(%eax)
    4fb9:	00 00                	add    %al,(%eax)
    4fbb:	00 fb                	add    %bh,%bl
    4fbd:	ff                   	(bad)
    4fbe:	ff 6f 01             	ljmp   *0x1(%edi)
    4fc1:	00 00                	add    %al,(%eax)
    4fc3:	08 fa                	or     %bh,%dl
    4fc5:	ff                   	(bad)
    4fc6:	ff 6f 20             	ljmp   *0x20(%edi)
	...

Disassembly of section .got:

00004ff4 <_GLOBAL_OFFSET_TABLE_>:
    4ff4:	6c                   	insb   (%dx),%es:(%edi)
    4ff5:	4f                   	dec    %edi
	...

Disassembly of section .data:

00005000 <_ZN3log6LOGGER17hf5b26e2073f66ae9E.0>:
    5000:	01 00                	add    %eax,(%eax)
	...

00005004 <_ZN3log6LOGGER17hf5b26e2073f66ae9E.1>:
    5004:	24 4f                	and    $0x4f,%al
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	72 75                	jb     77 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE-0xf89>
   2:	73 74                	jae    78 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE-0xf88>
   4:	63 20                	arpl   %esp,(%eax)
   6:	76 65                	jbe    6d <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE-0xf93>
   8:	72 73                	jb     7d <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE-0xf83>
   a:	69 6f 6e 20 31 2e 38 	imul   $0x382e3120,0x6e(%edi),%ebp
  11:	38 2e                	cmp    %ch,(%esi)
  13:	30 2d 6e 69 67 68    	xor    %ch,0x6867696e
  19:	74 6c                	je     87 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE-0xf79>
  1b:	79 20                	jns    3d <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE-0xfc3>
  1d:	28 39                	sub    %bh,(%ecx)
  1f:	33 34 38             	xor    (%eax,%edi,1),%esi
  22:	38 30                	cmp    %dh,(%eax)
  24:	66 35 38 20          	xor    $0x2038,%ax
  28:	32 30                	xor    (%eax),%dh
  2a:	32 35 2d 30 34 2d    	xor    0x2d34302d,%dh
  30:	30 39                	xor    %bh,(%ecx)
  32:	29 00                	sub    %eax,(%eax)
