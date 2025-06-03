
target/i686-unknown-linux-gnu/release/ata:     file format elf32-i386


Disassembly of section .note.gnu.build-id:

00000194 <.note.gnu.build-id>:
 194:	04 00                	add    $0x0,%al
 196:	00 00                	add    %al,(%eax)
 198:	14 00                	adc    $0x0,%al
 19a:	00 00                	add    %al,(%eax) 19c:	03 00                	add    (%eax),%eax 19e:	00 00                	add    %al,(%eax)
 1a0:	47                   	inc    %edi
 1a1:	4e                   	dec    %esi
 1a2:	55                   	push   %ebp
 1a3:	00 2f                	add    %ch,(%edi)
 1a5:	d2 99 9f f2 91 e4    	rcrb   %cl,-0x1b6e0d61(%ecx)
 1ab:	1c e6                	sbb    $0xe6,%al
 1ad:	b5 d5                	mov    $0xd5,%ch
 1af:	58                   	pop    %eax
 1b0:	14 a4                	adc    $0xa4,%al
 1b2:	68 1a 8d d0 17       	push   $0x17d08d1a
 1b7:	20                   	.byte 0x20

Disassembly of section .text:

00001000 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE>:
    1000:	53                   	push   %ebx
    1001:	83 ec 18             	sub    $0x18,%esp
    1004:	e8 00 00 00 00       	call   1009 <_ZN4core9panicking9panic_fmt17he08b1796856e5d1aE+0x9>
    1009:	5b                   	pop    %ebx
    100a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    100e:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    1012:	81 c3 eb 3f 00 00    	add    $0x3feb,%ebx
    1018:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
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
    104e:	8d 8b 10 ff ff ff    	lea    -0xf0(%ebx),%ecx
    1054:	8d 83 cf e3 ff ff    	lea    -0x1c31(%ebx),%eax
    105a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    105e:	8d 8b 6c cb ff ff    	lea    -0x3494(%ebx),%ecx
    1064:	89 04 24             	mov    %eax,(%esp)
    1067:	c7 44 24 04 2b 00 00 	movl   $0x2b,0x4(%esp)
    106e:	00 
    106f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1073:	8d 8b 9c cb ff ff    	lea    -0x3464(%ebx),%ecx
    1079:	89 54 24 18          	mov    %edx,0x18(%esp)
    107d:	8d 93 e8 fe ff ff    	lea    -0x118(%ebx),%edx
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
    10e1:	e8 da 0a 00 00       	call   1bc0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
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
    1121:	8d 83 e4 e2 ff ff    	lea    -0x1d1c(%ebx),%eax
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
    1141:	8d 8b 6c cb ff ff    	lea    -0x3494(%ebx),%ecx
    1147:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    114b:	83 c7 0c             	add    $0xc,%edi
    114e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1152:	89 44 24 14          	mov    %eax,0x14(%esp)
    1156:	8d 83 ec cd ff ff    	lea    -0x3214(%ebx),%eax
    115c:	89 44 24 18          	mov    %eax,0x18(%esp)
    1160:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    1164:	89 44 24 20          	mov    %eax,0x20(%esp)
    1168:	8d 83 d0 fe ff ff    	lea    -0x130(%ebx),%eax
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
    119e:	e8 1d 0a 00 00       	call   1bc0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    11a3:	83 c4 10             	add    $0x10,%esp
    11a6:	84 c0                	test   %al,%al
    11a8:	74 04                	je     11ae <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0xbe>
    11aa:	b1 01                	mov    $0x1,%cl
    11ac:	eb 5b                	jmp    1209 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hfd9e1b8623656f4cE+0x119>
    11ae:	83 ec 04             	sub    $0x4,%esp
    11b1:	8d 83 f0 e2 ff ff    	lea    -0x1d10(%ebx),%eax
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
    11ff:	e8 bc 09 00 00       	call   1bc0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
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
    132a:	e8 41 13 00 00       	call   2670 <memcpy>
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
    1372:	8d 93 78 fe ff ff    	lea    -0x188(%ebx),%edx
    1378:	89 04 24             	mov    %eax,(%esp)
    137b:	e8 40 08 00 00       	call   1bc0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
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
    13ee:	8d 83 0c d6 ff ff    	lea    -0x29f4(%ebx),%eax
    13f4:	89 44 24 10          	mov    %eax,0x10(%esp)
    13f8:	8d 44 24 24          	lea    0x24(%esp),%eax
    13fc:	89 44 24 14          	mov    %eax,0x14(%esp)
    1400:	8d 83 6c cb ff ff    	lea    -0x3494(%ebx),%eax
    1406:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    140a:	89 54 24 28          	mov    %edx,0x28(%esp)
    140e:	8d 93 78 fe ff ff    	lea    -0x188(%ebx),%edx
    1414:	8d 4c 24 44          	lea    0x44(%esp),%ecx
    1418:	89 44 24 18          	mov    %eax,0x18(%esp)
    141c:	8d 44 24 08          	lea    0x8(%esp),%eax
    1420:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1424:	8d 83 cc c0 ff ff    	lea    -0x3f34(%ebx),%eax
    142a:	89 44 24 20          	mov    %eax,0x20(%esp)
    142e:	8d 83 a8 fe ff ff    	lea    -0x158(%ebx),%eax
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
    145f:	e8 5c 07 00 00       	call   1bc0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
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
    14cb:	e8 a0 11 00 00       	call   2670 <memcpy>
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
    1516:	8d 8b c8 fe ff ff    	lea    -0x138(%ebx),%ecx
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
    158a:	8d 8b 29 e4 ff ff    	lea    -0x1bd7(%ebx),%ecx
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

000015f0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>:
    15f0:	53                   	push   %ebx
    15f1:	57                   	push   %edi
    15f2:	56                   	push   %esi
    15f3:	8b 44 24 10          	mov    0x10(%esp),%eax
    15f7:	e8 00 00 00 00       	call   15fc <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0xc>
    15fc:	5b                   	pop    %ebx
    15fd:	89 d6                	mov    %edx,%esi
    15ff:	89 cf                	mov    %ecx,%edi
    1601:	81 c3 f8 39 00 00    	add    $0x39f8,%ebx
    1607:	3d 00 00 11 00       	cmp    $0x110000,%eax
    160c:	74 13                	je     1621 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x31>
    160e:	83 ec 08             	sub    $0x8,%esp
    1611:	50                   	push   %eax
    1612:	57                   	push   %edi
    1613:	ff 56 10             	call   *0x10(%esi)
    1616:	83 c4 10             	add    $0x10,%esp
    1619:	89 c1                	mov    %eax,%ecx
    161b:	b0 01                	mov    $0x1,%al
    161d:	84 c9                	test   %cl,%cl
    161f:	75 1b                	jne    163c <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4c>
    1621:	8b 44 24 14          	mov    0x14(%esp),%eax
    1625:	85 c0                	test   %eax,%eax
    1627:	74 11                	je     163a <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E+0x4a>
    1629:	83 ec 04             	sub    $0x4,%esp
    162c:	6a 00                	push   $0x0
    162e:	50                   	push   %eax
    162f:	57                   	push   %edi
    1630:	ff 56 0c             	call   *0xc(%esi)
    1633:	83 c4 10             	add    $0x10,%esp
    1636:	5e                   	pop    %esi
    1637:	5f                   	pop    %edi
    1638:	5b                   	pop    %ebx
    1639:	c3                   	ret
    163a:	31 c0                	xor    %eax,%eax
    163c:	5e                   	pop    %esi
    163d:	5f                   	pop    %edi
    163e:	5b                   	pop    %ebx
    163f:	c3                   	ret

00001640 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>:
    1640:	55                   	push   %ebp
    1641:	53                   	push   %ebx
    1642:	57                   	push   %edi
    1643:	56                   	push   %esi
    1644:	83 ec 4c             	sub    $0x4c,%esp
    1647:	8b 41 08             	mov    0x8(%ecx),%eax
    164a:	8b 6c 24 60          	mov    0x60(%esp),%ebp
    164e:	e8 00 00 00 00       	call   1653 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x13>
    1653:	5f                   	pop    %edi
    1654:	81 c7 a1 39 00 00    	add    $0x39a1,%edi
    165a:	a9 00 00 00 18       	test   $0x18000000,%eax
    165f:	74 61                	je     16c2 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x82>
    1661:	a9 00 00 00 10       	test   $0x10000000,%eax
    1666:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    166a:	89 44 24 20          	mov    %eax,0x20(%esp)
    166e:	75 69                	jne    16d9 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x99>
    1670:	83 fd 10             	cmp    $0x10,%ebp
    1673:	0f 83 c5 00 00 00    	jae    173e <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xfe>
    1679:	85 ed                	test   %ebp,%ebp
    167b:	0f 84 b0 04 00 00    	je     1b31 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4f1>
    1681:	31 f6                	xor    %esi,%esi
    1683:	31 c0                	xor    %eax,%eax
    1685:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    168c:	00 00 00 
    168f:	90                   	nop
    1690:	31 db                	xor    %ebx,%ebx
    1692:	80 3c 02 c0          	cmpb   $0xc0,(%edx,%eax,1)
    1696:	0f 9d c3             	setge  %bl
    1699:	40                   	inc    %eax
    169a:	01 de                	add    %ebx,%esi
    169c:	39 c5                	cmp    %eax,%ebp
    169e:	75 f0                	jne    1690 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x50>
    16a0:	8b 44 24 20          	mov    0x20(%esp),%eax
    16a4:	89 6c 24 18          	mov    %ebp,0x18(%esp)
    16a8:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    16ac:	39 ee                	cmp    %ebp,%esi
    16ae:	0f 82 4e 03 00 00    	jb     1a02 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3c2>
    16b4:	8b 41 04             	mov    0x4(%ecx),%eax
    16b7:	83 ec 04             	sub    $0x4,%esp
    16ba:	89 fb                	mov    %edi,%ebx
    16bc:	ff 74 24 1c          	push   0x1c(%esp)
    16c0:	eb 09                	jmp    16cb <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x8b>
    16c2:	8b 41 04             	mov    0x4(%ecx),%eax
    16c5:	83 ec 04             	sub    $0x4,%esp
    16c8:	89 fb                	mov    %edi,%ebx
    16ca:	55                   	push   %ebp
    16cb:	52                   	push   %edx
    16cc:	ff 31                	push   (%ecx)
    16ce:	ff 50 0c             	call   *0xc(%eax)
    16d1:	83 c4 5c             	add    $0x5c,%esp
    16d4:	e9 82 04 00 00       	jmp    1b5b <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x51b>
    16d9:	0f b7 71 0e          	movzwl 0xe(%ecx),%esi
    16dd:	89 7c 24 14          	mov    %edi,0x14(%esp)
    16e1:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    16e5:	85 f6                	test   %esi,%esi
    16e7:	0f 84 e7 02 00 00    	je     19d4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x394>
    16ed:	01 d5                	add    %edx,%ebp
    16ef:	89 d1                	mov    %edx,%ecx
    16f1:	31 ff                	xor    %edi,%edi
    16f3:	31 c0                	xor    %eax,%eax
    16f5:	eb 1d                	jmp    1714 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xd4>
    16f7:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
    16fe:	00 00 
    1700:	8d 59 01             	lea    0x1(%ecx),%ebx
    1703:	89 df                	mov    %ebx,%edi
    1705:	40                   	inc    %eax
    1706:	29 cf                	sub    %ecx,%edi
    1708:	89 d9                	mov    %ebx,%ecx
    170a:	01 d7                	add    %edx,%edi
    170c:	39 c6                	cmp    %eax,%esi
    170e:	0f 84 c2 02 00 00    	je     19d6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x396>
    1714:	89 fa                	mov    %edi,%edx
    1716:	39 e9                	cmp    %ebp,%ecx
    1718:	0f 84 bc 02 00 00    	je     19da <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x39a>
    171e:	0f b6 19             	movzbl (%ecx),%ebx
    1721:	84 db                	test   %bl,%bl
    1723:	79 db                	jns    1700 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc0>
    1725:	80 fb e0             	cmp    $0xe0,%bl
    1728:	72 0a                	jb     1734 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xf4>
    172a:	80 fb f0             	cmp    $0xf0,%bl
    172d:	72 0a                	jb     1739 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xf9>
    172f:	8d 59 04             	lea    0x4(%ecx),%ebx
    1732:	eb cf                	jmp    1703 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc3>
    1734:	8d 59 02             	lea    0x2(%ecx),%ebx
    1737:	eb ca                	jmp    1703 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc3>
    1739:	8d 59 03             	lea    0x3(%ecx),%ebx
    173c:	eb c5                	jmp    1703 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0xc3>
    173e:	8d 72 03             	lea    0x3(%edx),%esi
    1741:	89 6c 24 18          	mov    %ebp,0x18(%esp)
    1745:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    1749:	89 7c 24 14          	mov    %edi,0x14(%esp)
    174d:	31 ff                	xor    %edi,%edi
    174f:	83 e6 fc             	and    $0xfffffffc,%esi
    1752:	89 f0                	mov    %esi,%eax
    1754:	89 74 24 0c          	mov    %esi,0xc(%esp)
    1758:	29 d0                	sub    %edx,%eax
    175a:	29 c5                	sub    %eax,%ebp
    175c:	89 e9                	mov    %ebp,%ecx
    175e:	89 6c 24 24          	mov    %ebp,0x24(%esp)
    1762:	83 e1 03             	and    $0x3,%ecx
    1765:	39 d6                	cmp    %edx,%esi
    1767:	be 00 00 00 00       	mov    $0x0,%esi
    176c:	74 21                	je     178f <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x14f>
    176e:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1772:	31 f6                	xor    %esi,%esi
    1774:	89 eb                	mov    %ebp,%ebx
    1776:	2b 5c 24 0c          	sub    0xc(%esp),%ebx
    177a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
    1780:	31 c0                	xor    %eax,%eax
    1782:	80 7d 00 c0          	cmpb   $0xc0,0x0(%ebp)
    1786:	0f 9d c0             	setge  %al
    1789:	45                   	inc    %ebp
    178a:	01 c6                	add    %eax,%esi
    178c:	43                   	inc    %ebx
    178d:	75 f1                	jne    1780 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x140>
    178f:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    1793:	85 c9                	test   %ecx,%ecx
    1795:	74 27                	je     17be <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x17e>
    1797:	89 eb                	mov    %ebp,%ebx
    1799:	31 ff                	xor    %edi,%edi
    179b:	83 e3 fc             	and    $0xfffffffc,%ebx
    179e:	03 5c 24 0c          	add    0xc(%esp),%ebx
    17a2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    17a9:	00 00 00 
    17ac:	0f 1f 40 00          	nopl   0x0(%eax)
    17b0:	31 c0                	xor    %eax,%eax
    17b2:	80 3b c0             	cmpb   $0xc0,(%ebx)
    17b5:	0f 9d c0             	setge  %al
    17b8:	43                   	inc    %ebx
    17b9:	01 c7                	add    %eax,%edi
    17bb:	49                   	dec    %ecx
    17bc:	75 f2                	jne    17b0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x170>
    17be:	8b 44 24 14          	mov    0x14(%esp),%eax
    17c2:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    17c6:	01 f7                	add    %esi,%edi
    17c8:	c1 ed 02             	shr    $0x2,%ebp
    17cb:	66 0f 76 ff          	pcmpeqd %xmm7,%xmm7
    17cf:	66 0f 6f 90 4c e1 ff 	movdqa -0x1eb4(%eax),%xmm2
    17d6:	ff 
    17d7:	66 0f 7f 54 24 30    	movdqa %xmm2,0x30(%esp)
    17dd:	eb 39                	jmp    1818 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1d8>
    17df:	90                   	nop
    17e0:	89 d8                	mov    %ebx,%eax
    17e2:	c1 eb 08             	shr    $0x8,%ebx
    17e5:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    17e9:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    17ee:	81 e3 ff 00 ff 00    	and    $0xff00ff,%ebx
    17f4:	01 c3                	add    %eax,%ebx
    17f6:	8b 44 24 0c          	mov    0xc(%esp),%eax
    17fa:	89 df                	mov    %ebx,%edi
    17fc:	c1 e7 10             	shl    $0x10,%edi
    17ff:	89 ca                	mov    %ecx,%edx
    1801:	29 cd                	sub    %ecx,%ebp
    1803:	01 df                	add    %ebx,%edi
    1805:	83 e2 03             	and    $0x3,%edx
    1808:	c1 ef 10             	shr    $0x10,%edi
    180b:	8d 1c 88             	lea    (%eax,%ecx,4),%ebx
    180e:	01 f7                	add    %esi,%edi
    1810:	85 d2                	test   %edx,%edx
    1812:	0f 85 be 02 00 00    	jne    1ad6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x496>
    1818:	89 fe                	mov    %edi,%esi
    181a:	85 ed                	test   %ebp,%ebp
    181c:	0f 84 c4 01 00 00    	je     19e6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3a6>
    1822:	81 fd c0 00 00 00    	cmp    $0xc0,%ebp
    1828:	b8 c0 00 00 00       	mov    $0xc0,%eax
    182d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    1831:	0f 42 c5             	cmovb  %ebp,%eax
    1834:	31 db                	xor    %ebx,%ebx
    1836:	83 fd 04             	cmp    $0x4,%ebp
    1839:	89 44 24 10          	mov    %eax,0x10(%esp)
    183d:	72 a1                	jb     17e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1a0>
    183f:	8b 7c 24 10          	mov    0x10(%esp),%edi
    1843:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    1847:	31 db                	xor    %ebx,%ebx
    1849:	c1 ef 02             	shr    $0x2,%edi
    184c:	8d 51 10             	lea    0x10(%ecx),%edx
    184f:	8d 47 ff             	lea    -0x1(%edi),%eax
    1852:	25 ff ff ff 0f       	and    $0xfffffff,%eax
    1857:	83 f8 03             	cmp    $0x3,%eax
    185a:	0f 82 20 01 00 00    	jb     1980 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x340>
    1860:	89 c3                	mov    %eax,%ebx
    1862:	89 6c 24 24          	mov    %ebp,0x24(%esp)
    1866:	89 cd                	mov    %ecx,%ebp
    1868:	66 0f ef db          	pxor   %xmm3,%xmm3
    186c:	43                   	inc    %ebx
    186d:	89 5c 24 2c          	mov    %ebx,0x2c(%esp)
    1871:	83 e3 fc             	and    $0xfffffffc,%ebx
    1874:	89 d9                	mov    %ebx,%ecx
    1876:	89 d8                	mov    %ebx,%eax
    1878:	c1 e1 04             	shl    $0x4,%ecx
    187b:	01 ca                	add    %ecx,%edx
    187d:	01 e9                	add    %ebp,%ecx
    187f:	90                   	nop
    1880:	f3 0f 6f 55 00       	movdqu 0x0(%ebp),%xmm2
    1885:	f3 0f 6f 4d 20       	movdqu 0x20(%ebp),%xmm1
    188a:	f3 0f 6f 65 10       	movdqu 0x10(%ebp),%xmm4
    188f:	f3 0f 6f 7d 30       	movdqu 0x30(%ebp),%xmm7
    1894:	83 c5 40             	add    $0x40,%ebp
    1897:	83 c3 fc             	add    $0xfffffffc,%ebx
    189a:	66 0f 6f ea          	movdqa %xmm2,%xmm5
    189e:	66 0f 6f c1          	movdqa %xmm1,%xmm0
    18a2:	66 0f 6a cf          	punpckhdq %xmm7,%xmm1
    18a6:	66 0f 6a d4          	punpckhdq %xmm4,%xmm2
    18aa:	66 0f 62 ec          	punpckldq %xmm4,%xmm5
    18ae:	66 0f 62 c7          	punpckldq %xmm7,%xmm0
    18b2:	66 0f 76 ff          	pcmpeqd %xmm7,%xmm7
    18b6:	66 0f 6f e2          	movdqa %xmm2,%xmm4
    18ba:	66 0f 6d d1          	punpckhqdq %xmm1,%xmm2
    18be:	66 0f 6f f5          	movdqa %xmm5,%xmm6
    18c2:	66 0f 6d e8          	punpckhqdq %xmm0,%xmm5
    18c6:	66 0f 6c e1          	punpcklqdq %xmm1,%xmm4
    18ca:	66 0f 6f 4c 24 30    	movdqa 0x30(%esp),%xmm1
    18d0:	66 0f 6c f0          	punpcklqdq %xmm0,%xmm6
    18d4:	66 0f 6f c6          	movdqa %xmm6,%xmm0
    18d8:	66 0f 72 d6 06       	psrld  $0x6,%xmm6
    18dd:	66 0f ef c7          	pxor   %xmm7,%xmm0
    18e1:	66 0f 72 d0 07       	psrld  $0x7,%xmm0
    18e6:	66 0f eb f0          	por    %xmm0,%xmm6
    18ea:	66 0f 6f c5          	movdqa %xmm5,%xmm0
    18ee:	66 0f 72 d5 06       	psrld  $0x6,%xmm5
    18f3:	66 0f ef c7          	pxor   %xmm7,%xmm0
    18f7:	66 0f db f1          	pand   %xmm1,%xmm6
    18fb:	66 0f 72 d0 07       	psrld  $0x7,%xmm0
    1900:	66 0f fe f3          	paddd  %xmm3,%xmm6
    1904:	66 0f 6f da          	movdqa %xmm2,%xmm3
    1908:	66 0f 72 d2 06       	psrld  $0x6,%xmm2
    190d:	66 0f eb e8          	por    %xmm0,%xmm5
    1911:	66 0f 6f c4          	movdqa %xmm4,%xmm0
    1915:	66 0f ef df          	pxor   %xmm7,%xmm3
    1919:	66 0f 72 d4 06       	psrld  $0x6,%xmm4
    191e:	66 0f ef c7          	pxor   %xmm7,%xmm0
    1922:	66 0f 72 d3 07       	psrld  $0x7,%xmm3
    1927:	66 0f db e9          	pand   %xmm1,%xmm5
    192b:	66 0f 72 d0 07       	psrld  $0x7,%xmm0
    1930:	66 0f eb d3          	por    %xmm3,%xmm2
    1934:	66 0f eb e0          	por    %xmm0,%xmm4
    1938:	66 0f db d1          	pand   %xmm1,%xmm2
    193c:	66 0f db e1          	pand   %xmm1,%xmm4
    1940:	66 0f 6f da          	movdqa %xmm2,%xmm3
    1944:	66 0f fe e5          	paddd  %xmm5,%xmm4
    1948:	66 0f fe e6          	paddd  %xmm6,%xmm4
    194c:	66 0f fe dc          	paddd  %xmm4,%xmm3
    1950:	0f 85 2a ff ff ff    	jne    1880 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x240>
    1956:	66 0f 70 c3 ee       	pshufd $0xee,%xmm3,%xmm0
    195b:	39 44 24 2c          	cmp    %eax,0x2c(%esp)
    195f:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    1963:	66 0f 6f 54 24 30    	movdqa 0x30(%esp),%xmm2
    1969:	66 0f fe c3          	paddd  %xmm3,%xmm0
    196d:	66 0f 70 c8 55       	pshufd $0x55,%xmm0,%xmm1
    1972:	66 0f fe c8          	paddd  %xmm0,%xmm1
    1976:	66 0f 7e cb          	movd   %xmm1,%ebx
    197a:	0f 84 60 fe ff ff    	je     17e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1a0>
    1980:	c1 e7 04             	shl    $0x4,%edi
    1983:	03 7c 24 0c          	add    0xc(%esp),%edi
    1987:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
    198e:	00 00 
    1990:	f3 0f 6f 01          	movdqu (%ecx),%xmm0
    1994:	89 d1                	mov    %edx,%ecx
    1996:	66 0f 6f c8          	movdqa %xmm0,%xmm1
    199a:	66 0f 72 d0 06       	psrld  $0x6,%xmm0
    199f:	66 0f ef cf          	pxor   %xmm7,%xmm1
    19a3:	66 0f 72 d1 07       	psrld  $0x7,%xmm1
    19a8:	66 0f eb c1          	por    %xmm1,%xmm0
    19ac:	66 0f db c2          	pand   %xmm2,%xmm0
    19b0:	66 0f 70 c8 ee       	pshufd $0xee,%xmm0,%xmm1
    19b5:	66 0f fe c8          	paddd  %xmm0,%xmm1
    19b9:	66 0f 70 c1 55       	pshufd $0x55,%xmm1,%xmm0
    19be:	66 0f fe c1          	paddd  %xmm1,%xmm0
    19c2:	66 0f 7e c0          	movd   %xmm0,%eax
    19c6:	01 c3                	add    %eax,%ebx
    19c8:	39 fa                	cmp    %edi,%edx
    19ca:	8d 52 10             	lea    0x10(%edx),%edx
    19cd:	75 c1                	jne    1990 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x350>
    19cf:	e9 0c fe ff ff       	jmp    17e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x1a0>
    19d4:	31 ff                	xor    %edi,%edi
    19d6:	31 c9                	xor    %ecx,%ecx
    19d8:	eb 06                	jmp    19e0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3a0>
    19da:	89 f1                	mov    %esi,%ecx
    19dc:	89 d7                	mov    %edx,%edi
    19de:	29 c1                	sub    %eax,%ecx
    19e0:	29 ce                	sub    %ecx,%esi
    19e2:	89 7c 24 18          	mov    %edi,0x18(%esp)
    19e6:	8b 7c 24 14          	mov    0x14(%esp),%edi
    19ea:	8b 44 24 20          	mov    0x20(%esp),%eax
    19ee:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    19f2:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    19f6:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    19fa:	39 ee                	cmp    %ebp,%esi
    19fc:	0f 83 b2 fc ff ff    	jae    16b4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x74>
    1a02:	c1 e8 1d             	shr    $0x1d,%eax
    1a05:	89 fa                	mov    %edi,%edx
    1a07:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
    1a0b:	29 f5                	sub    %esi,%ebp
    1a0d:	83 e0 03             	and    $0x3,%eax
    1a10:	89 d3                	mov    %edx,%ebx
    1a12:	8b 84 87 5c e1 ff ff 	mov    -0x1ea4(%edi,%eax,4),%eax
    1a19:	31 ff                	xor    %edi,%edi
    1a1b:	01 d0                	add    %edx,%eax
    1a1d:	ff e0                	jmp    *%eax
    1a1f:	89 ef                	mov    %ebp,%edi
    1a21:	eb 05                	jmp    1a28 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3e8>
    1a23:	0f b7 fd             	movzwl %bp,%edi
    1a26:	d1 ef                	shr    $1,%edi
    1a28:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    1a2c:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    1a30:	8b 01                	mov    (%ecx),%eax
    1a32:	8b 49 04             	mov    0x4(%ecx),%ecx
    1a35:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1a39:	47                   	inc    %edi
    1a3a:	81 e5 ff ff 1f 00    	and    $0x1fffff,%ebp
    1a40:	89 44 24 30          	mov    %eax,0x30(%esp)
    1a44:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1a48:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
    1a4f:	00 
    1a50:	66 4f                	dec    %di
    1a52:	74 1d                	je     1a71 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x431>
    1a54:	83 ec 08             	sub    $0x8,%esp
    1a57:	55                   	push   %ebp
    1a58:	ff 74 24 3c          	push   0x3c(%esp)
    1a5c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1a60:	ff 50 10             	call   *0x10(%eax)
    1a63:	83 c4 10             	add    $0x10,%esp
    1a66:	84 c0                	test   %al,%al
    1a68:	74 e6                	je     1a50 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x410>
    1a6a:	b0 01                	mov    $0x1,%al
    1a6c:	e9 e7 00 00 00       	jmp    1b58 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x518>
    1a71:	83 ec 04             	sub    $0x4,%esp
    1a74:	ff 74 24 1c          	push   0x1c(%esp)
    1a78:	ff 74 24 24          	push   0x24(%esp)
    1a7c:	ff 74 24 3c          	push   0x3c(%esp)
    1a80:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1a84:	ff 50 0c             	call   *0xc(%eax)
    1a87:	83 c4 10             	add    $0x10,%esp
    1a8a:	89 c1                	mov    %eax,%ecx
    1a8c:	b0 01                	mov    $0x1,%al
    1a8e:	84 c9                	test   %cl,%cl
    1a90:	0f 85 c2 00 00 00    	jne    1b58 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x518>
    1a96:	8b 7c 24 24          	mov    0x24(%esp),%edi
    1a9a:	29 7c 24 10          	sub    %edi,0x10(%esp)
    1a9e:	01 f7                	add    %esi,%edi
    1aa0:	66 be ff ff          	mov    $0xffff,%si
    1aa4:	2b 7c 24 2c          	sub    0x2c(%esp),%edi
    1aa8:	0f 1f 84 00 00 00 00 	nopl   0x0(%eax,%eax,1)
    1aaf:	00 
    1ab0:	8d 04 37             	lea    (%edi,%esi,1),%eax
    1ab3:	66 83 f8 ff          	cmp    $0xffff,%ax
    1ab7:	0f 84 8f 00 00 00    	je     1b4c <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x50c>
    1abd:	83 ec 08             	sub    $0x8,%esp
    1ac0:	55                   	push   %ebp
    1ac1:	ff 74 24 3c          	push   0x3c(%esp)
    1ac5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1ac9:	ff 50 10             	call   *0x10(%eax)
    1acc:	83 c4 10             	add    $0x10,%esp
    1acf:	46                   	inc    %esi
    1ad0:	84 c0                	test   %al,%al
    1ad2:	74 dc                	je     1ab0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x470>
    1ad4:	eb 7a                	jmp    1b50 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x510>
    1ad6:	81 e1 fc 00 00 00    	and    $0xfc,%ecx
    1adc:	c1 e2 02             	shl    $0x2,%edx
    1adf:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
    1ae2:	31 c0                	xor    %eax,%eax
    1ae4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    1aeb:	00 00 00 
    1aee:	66 90                	xchg   %ax,%ax
    1af0:	8b 31                	mov    (%ecx),%esi
    1af2:	83 c1 04             	add    $0x4,%ecx
    1af5:	89 f3                	mov    %esi,%ebx
    1af7:	c1 ee 06             	shr    $0x6,%esi
    1afa:	f7 d3                	not    %ebx
    1afc:	c1 eb 07             	shr    $0x7,%ebx
    1aff:	09 de                	or     %ebx,%esi
    1b01:	81 e6 01 01 01 01    	and    $0x1010101,%esi
    1b07:	01 f0                	add    %esi,%eax
    1b09:	83 c2 fc             	add    $0xfffffffc,%edx
    1b0c:	75 e2                	jne    1af0 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x4b0>
    1b0e:	89 c1                	mov    %eax,%ecx
    1b10:	c1 e8 08             	shr    $0x8,%eax
    1b13:	81 e1 ff 00 ff 00    	and    $0xff00ff,%ecx
    1b19:	25 ff 00 ff 00       	and    $0xff00ff,%eax
    1b1e:	01 c8                	add    %ecx,%eax
    1b20:	89 c6                	mov    %eax,%esi
    1b22:	c1 e6 10             	shl    $0x10,%esi
    1b25:	01 c6                	add    %eax,%esi
    1b27:	c1 ee 10             	shr    $0x10,%esi
    1b2a:	01 fe                	add    %edi,%esi
    1b2c:	e9 b5 fe ff ff       	jmp    19e6 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3a6>
    1b31:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1b38:	00 
    1b39:	31 f6                	xor    %esi,%esi
    1b3b:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    1b3f:	39 ee                	cmp    %ebp,%esi
    1b41:	0f 82 bb fe ff ff    	jb     1a02 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x3c2>
    1b47:	e9 68 fb ff ff       	jmp    16b4 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE+0x74>
    1b4c:	8b 74 24 10          	mov    0x10(%esp),%esi
    1b50:	66 3b 74 24 10       	cmp    0x10(%esp),%si
    1b55:	0f 92 c0             	setb   %al
    1b58:	83 c4 4c             	add    $0x4c,%esp
    1b5b:	5e                   	pop    %esi
    1b5c:	5f                   	pop    %edi
    1b5d:	5b                   	pop    %ebx
    1b5e:	5d                   	pop    %ebp
    1b5f:	c3                   	ret

00001b60 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE>:
    1b60:	53                   	push   %ebx
    1b61:	83 ec 08             	sub    $0x8,%esp
    1b64:	8b 44 24 10          	mov    0x10(%esp),%eax
    1b68:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    1b6c:	e8 00 00 00 00       	call   1b71 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h61c602258e98ed2aE+0x11>
    1b71:	5b                   	pop    %ebx
    1b72:	81 c3 83 34 00 00    	add    $0x3483,%ebx
    1b78:	8b 10                	mov    (%eax),%edx
    1b7a:	8b 40 04             	mov    0x4(%eax),%eax
    1b7d:	89 04 24             	mov    %eax,(%esp)
    1b80:	e8 bb fa ff ff       	call   1640 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    1b85:	83 c4 08             	add    $0x8,%esp
    1b88:	5b                   	pop    %ebx
    1b89:	c3                   	ret
    1b8a:	66 90                	xchg   %ax,%ax
    1b8c:	66 90                	xchg   %ax,%ax
    1b8e:	66 90                	xchg   %ax,%ax

00001b90 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE>:
    1b90:	53                   	push   %ebx
    1b91:	83 ec 08             	sub    $0x8,%esp
    1b94:	8b 44 24 10          	mov    0x10(%esp),%eax
    1b98:	e8 00 00 00 00       	call   1b9d <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17he0e689871bf0896eE+0xd>
    1b9d:	5b                   	pop    %ebx
    1b9e:	81 c3 57 34 00 00    	add    $0x3457,%ebx
    1ba4:	8b 48 04             	mov    0x4(%eax),%ecx
    1ba7:	83 ec 08             	sub    $0x8,%esp
    1baa:	ff 74 24 1c          	push   0x1c(%esp)
    1bae:	ff 30                	push   (%eax)
    1bb0:	ff 51 0c             	call   *0xc(%ecx)
    1bb3:	83 c4 18             	add    $0x18,%esp
    1bb6:	5b                   	pop    %ebx
    1bb7:	c3                   	ret
    1bb8:	66 90                	xchg   %ax,%ax
    1bba:	66 90                	xchg   %ax,%ax
    1bbc:	66 90                	xchg   %ax,%ax
    1bbe:	66 90                	xchg   %ax,%ax

00001bc0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>:
    1bc0:	55                   	push   %ebp
    1bc1:	53                   	push   %ebx
    1bc2:	57                   	push   %edi
    1bc3:	56                   	push   %esi
    1bc4:	83 ec 2c             	sub    $0x2c,%esp
    1bc7:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    1bcb:	e8 00 00 00 00       	call   1bd0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x10>
    1bd0:	5b                   	pop    %ebx
    1bd1:	c7 44 24 20 20 00 00 	movl   $0xe0000020,0x20(%esp)
    1bd8:	e0 
    1bd9:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
    1be0:	00 
    1be1:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1be5:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1be9:	81 c3 24 34 00 00    	add    $0x3424,%ebx
    1bef:	8b 7d 10             	mov    0x10(%ebp),%edi
    1bf2:	85 ff                	test   %edi,%edi
    1bf4:	0f 84 0c 01 00 00    	je     1d06 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x146>
    1bfa:	8b 4d 14             	mov    0x14(%ebp),%ecx
    1bfd:	85 c9                	test   %ecx,%ecx
    1bff:	0f 84 9e 01 00 00    	je     1da3 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    1c05:	8b 75 08             	mov    0x8(%ebp),%esi
    1c08:	8b 55 00             	mov    0x0(%ebp),%edx
    1c0b:	8d 04 49             	lea    (%ecx,%ecx,2),%eax
    1c0e:	49                   	dec    %ecx
    1c0f:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    1c15:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    1c18:	89 44 24 14          	mov    %eax,0x14(%esp)
    1c1c:	41                   	inc    %ecx
    1c1d:	8d 47 18             	lea    0x18(%edi),%eax
    1c20:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1c24:	89 74 24 10          	mov    %esi,0x10(%esp)
    1c28:	31 f6                	xor    %esi,%esi
    1c2a:	89 54 24 28          	mov    %edx,0x28(%esp)
    1c2e:	66 90                	xchg   %ax,%ax
    1c30:	89 c5                	mov    %eax,%ebp
    1c32:	8b 44 f2 04          	mov    0x4(%edx,%esi,8),%eax
    1c36:	85 c0                	test   %eax,%eax
    1c38:	74 1d                	je     1c57 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x97>
    1c3a:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    1c3e:	83 ec 04             	sub    $0x4,%esp
    1c41:	50                   	push   %eax
    1c42:	ff 34 f2             	push   (%edx,%esi,8)
    1c45:	ff 74 24 24          	push   0x24(%esp)
    1c49:	ff 51 0c             	call   *0xc(%ecx)
    1c4c:	83 c4 10             	add    $0x10,%esp
    1c4f:	84 c0                	test   %al,%al
    1c51:	0f 85 48 01 00 00    	jne    1d9f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    1c57:	0f b7 47 08          	movzwl 0x8(%edi),%eax
    1c5b:	85 c0                	test   %eax,%eax
    1c5d:	74 31                	je     1c90 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xd0>
    1c5f:	83 f8 01             	cmp    $0x1,%eax
    1c62:	75 3c                	jne    1ca0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xe0>
    1c64:	8b 47 0c             	mov    0xc(%edi),%eax
    1c67:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    1c6b:	0f b7 44 c1 04       	movzwl 0x4(%ecx,%eax,8),%eax
    1c70:	0f b7 0f             	movzwl (%edi),%ecx
    1c73:	83 f9 02             	cmp    $0x2,%ecx
    1c76:	74 24                	je     1c9c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xdc>
    1c78:	83 f9 01             	cmp    $0x1,%ecx
    1c7b:	75 33                	jne    1cb0 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf0>
    1c7d:	8b 4f 04             	mov    0x4(%edi),%ecx
    1c80:	8b 54 24 10          	mov    0x10(%esp),%edx
    1c84:	0f b7 4c ca 04       	movzwl 0x4(%edx,%ecx,8),%ecx
    1c89:	eb 29                	jmp    1cb4 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf4>
    1c8b:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
    1c90:	0f b7 47 0a          	movzwl 0xa(%edi),%eax
    1c94:	0f b7 0f             	movzwl (%edi),%ecx
    1c97:	83 f9 02             	cmp    $0x2,%ecx
    1c9a:	75 dc                	jne    1c78 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xb8>
    1c9c:	31 c9                	xor    %ecx,%ecx
    1c9e:	eb 14                	jmp    1cb4 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xf4>
    1ca0:	31 c0                	xor    %eax,%eax
    1ca2:	0f b7 0f             	movzwl (%edi),%ecx
    1ca5:	83 f9 02             	cmp    $0x2,%ecx
    1ca8:	75 ce                	jne    1c78 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xb8>
    1caa:	eb f0                	jmp    1c9c <_ZN4core3fmt5write17h60dc8996c7a95b44E+0xdc>
    1cac:	0f 1f 40 00          	nopl   0x0(%eax)
    1cb0:	0f b7 4f 02          	movzwl 0x2(%edi),%ecx
    1cb4:	8b 57 10             	mov    0x10(%edi),%edx
    1cb7:	8b 7f 14             	mov    0x14(%edi),%edi
    1cba:	89 7c 24 20          	mov    %edi,0x20(%esp)
    1cbe:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    1cc3:	66 89 4c 24 26       	mov    %cx,0x26(%esp)
    1cc8:	83 ec 08             	sub    $0x8,%esp
    1ccb:	8d 44 24 20          	lea    0x20(%esp),%eax
    1ccf:	50                   	push   %eax
    1cd0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    1cd4:	ff 34 d0             	push   (%eax,%edx,8)
    1cd7:	ff 54 d0 04          	call   *0x4(%eax,%edx,8)
    1cdb:	83 c4 10             	add    $0x10,%esp
    1cde:	84 c0                	test   %al,%al
    1ce0:	0f 85 b9 00 00 00    	jne    1d9f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    1ce6:	46                   	inc    %esi
    1ce7:	3b 6c 24 14          	cmp    0x14(%esp),%ebp
    1ceb:	8d 45 18             	lea    0x18(%ebp),%eax
    1cee:	8b 54 24 28          	mov    0x28(%esp),%edx
    1cf2:	89 ef                	mov    %ebp,%edi
    1cf4:	0f 44 c5             	cmove  %ebp,%eax
    1cf7:	39 74 24 0c          	cmp    %esi,0xc(%esp)
    1cfb:	0f 85 2f ff ff ff    	jne    1c30 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x70>
    1d01:	e9 8a 00 00 00       	jmp    1d90 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1d0>
    1d06:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d09:	85 c0                	test   %eax,%eax
    1d0b:	0f 84 92 00 00 00    	je     1da3 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1e3>
    1d11:	8b 75 08             	mov    0x8(%ebp),%esi
    1d14:	89 c1                	mov    %eax,%ecx
    1d16:	8b 55 00             	mov    0x0(%ebp),%edx
    1d19:	31 ed                	xor    %ebp,%ebp
    1d1b:	49                   	dec    %ecx
    1d1c:	81 e1 ff ff ff 1f    	and    $0x1fffffff,%ecx
    1d22:	41                   	inc    %ecx
    1d23:	8d 04 c6             	lea    (%esi,%eax,8),%eax
    1d26:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1d2a:	89 54 24 14          	mov    %edx,0x14(%esp)
    1d2e:	89 44 24 10          	mov    %eax,0x10(%esp)
    1d32:	8d 46 08             	lea    0x8(%esi),%eax
    1d35:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    1d3c:	00 00 00 
    1d3f:	90                   	nop
    1d40:	89 c7                	mov    %eax,%edi
    1d42:	8b 44 ea 04          	mov    0x4(%edx,%ebp,8),%eax
    1d46:	85 c0                	test   %eax,%eax
    1d48:	74 19                	je     1d63 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1a3>
    1d4a:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    1d4e:	83 ec 04             	sub    $0x4,%esp
    1d51:	50                   	push   %eax
    1d52:	ff 34 ea             	push   (%edx,%ebp,8)
    1d55:	ff 74 24 24          	push   0x24(%esp)
    1d59:	ff 51 0c             	call   *0xc(%ecx)
    1d5c:	83 c4 10             	add    $0x10,%esp
    1d5f:	84 c0                	test   %al,%al
    1d61:	75 3c                	jne    1d9f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    1d63:	83 ec 08             	sub    $0x8,%esp
    1d66:	8d 44 24 20          	lea    0x20(%esp),%eax
    1d6a:	50                   	push   %eax
    1d6b:	ff 36                	push   (%esi)
    1d6d:	ff 56 04             	call   *0x4(%esi)
    1d70:	83 c4 10             	add    $0x10,%esp
    1d73:	84 c0                	test   %al,%al
    1d75:	75 28                	jne    1d9f <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1df>
    1d77:	45                   	inc    %ebp
    1d78:	31 c0                	xor    %eax,%eax
    1d7a:	3b 7c 24 10          	cmp    0x10(%esp),%edi
    1d7e:	8b 54 24 14          	mov    0x14(%esp),%edx
    1d82:	89 fe                	mov    %edi,%esi
    1d84:	0f 95 c0             	setne  %al
    1d87:	39 6c 24 0c          	cmp    %ebp,0xc(%esp)
    1d8b:	8d 04 c7             	lea    (%edi,%eax,8),%eax
    1d8e:	75 b0                	jne    1d40 <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x180>
    1d90:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    1d94:	8b 54 24 0c          	mov    0xc(%esp),%edx
    1d98:	3b 55 04             	cmp    0x4(%ebp),%edx
    1d9b:	72 0d                	jb     1daa <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x1ea>
    1d9d:	eb 2e                	jmp    1dcd <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    1d9f:	b0 01                	mov    $0x1,%al
    1da1:	eb 2c                	jmp    1dcf <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    1da3:	31 d2                	xor    %edx,%edx
    1da5:	3b 55 04             	cmp    0x4(%ebp),%edx
    1da8:	73 23                	jae    1dcd <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20d>
    1daa:	8b 45 00             	mov    0x0(%ebp),%eax
    1dad:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    1db1:	83 ec 04             	sub    $0x4,%esp
    1db4:	ff 74 d0 04          	push   0x4(%eax,%edx,8)
    1db8:	ff 34 d0             	push   (%eax,%edx,8)
    1dbb:	ff 74 24 24          	push   0x24(%esp)
    1dbf:	ff 51 0c             	call   *0xc(%ecx)
    1dc2:	83 c4 10             	add    $0x10,%esp
    1dc5:	89 c1                	mov    %eax,%ecx
    1dc7:	b0 01                	mov    $0x1,%al
    1dc9:	84 c9                	test   %cl,%cl
    1dcb:	75 02                	jne    1dcf <_ZN4core3fmt5write17h60dc8996c7a95b44E+0x20f>
    1dcd:	31 c0                	xor    %eax,%eax
    1dcf:	83 c4 2c             	add    $0x2c,%esp
    1dd2:	5e                   	pop    %esi
    1dd3:	5f                   	pop    %edi
    1dd4:	5b                   	pop    %ebx
    1dd5:	5d                   	pop    %ebp
    1dd6:	c3                   	ret
    1dd7:	66 90                	xchg   %ax,%ax
    1dd9:	66 90                	xchg   %ax,%ax
    1ddb:	66 90                	xchg   %ax,%ax
    1ddd:	66 90                	xchg   %ax,%ax
    1ddf:	90                   	nop

00001de0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E>:
    1de0:	55                   	push   %ebp
    1de1:	53                   	push   %ebx
    1de2:	57                   	push   %edi
    1de3:	56                   	push   %esi
    1de4:	83 ec 3c             	sub    $0x3c,%esp
    1de7:	8b 44 24 50          	mov    0x50(%esp),%eax
    1deb:	e8 00 00 00 00       	call   1df0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x10>
    1df0:	5b                   	pop    %ebx
    1df1:	be 0a 00 00 00       	mov    $0xa,%esi
    1df6:	81 c3 04 32 00 00    	add    $0x3204,%ebx
    1dfc:	8b 10                	mov    (%eax),%edx
    1dfe:	81 fa e8 03 00 00    	cmp    $0x3e8,%edx
    1e04:	89 54 24 04          	mov    %edx,0x4(%esp)
    1e08:	72 66                	jb     1e70 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x90>
    1e0a:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    1e0e:	bd 0a 00 00 00       	mov    $0xa,%ebp
    1e13:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    1e1a:	00 00 00 
    1e1d:	0f 1f 00             	nopl   (%eax)
    1e20:	89 c8                	mov    %ecx,%eax
    1e22:	ba 59 17 b7 d1       	mov    $0xd1b71759,%edx
    1e27:	89 ce                	mov    %ecx,%esi
    1e29:	f7 e2                	mul    %edx
    1e2b:	c1 ea 0d             	shr    $0xd,%edx
    1e2e:	69 c2 10 27 00 00    	imul   $0x2710,%edx,%eax
    1e34:	29 c6                	sub    %eax,%esi
    1e36:	69 c6 7b 14 00 00    	imul   $0x147b,%esi,%eax
    1e3c:	c1 e8 13             	shr    $0x13,%eax
    1e3f:	6b f8 64             	imul   $0x64,%eax,%edi
    1e42:	0f b7 84 43 05 e3 ff 	movzwl -0x1cfb(%ebx,%eax,2),%eax
    1e49:	ff 
    1e4a:	29 fe                	sub    %edi,%esi
    1e4c:	81 f9 7f 96 98 00    	cmp    $0x98967f,%ecx
    1e52:	89 d1                	mov    %edx,%ecx
    1e54:	66 89 44 2c 2e       	mov    %ax,0x2e(%esp,%ebp,1)
    1e59:	0f b7 c6             	movzwl %si,%eax
    1e5c:	8d 75 fc             	lea    -0x4(%ebp),%esi
    1e5f:	0f b7 84 43 05 e3 ff 	movzwl -0x1cfb(%ebx,%eax,2),%eax
    1e66:	ff 
    1e67:	66 89 44 2c 30       	mov    %ax,0x30(%esp,%ebp,1)
    1e6c:	89 f5                	mov    %esi,%ebp
    1e6e:	77 b0                	ja     1e20 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x40>
    1e70:	83 fa 09             	cmp    $0x9,%edx
    1e73:	76 29                	jbe    1e9e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0xbe>
    1e75:	0f b7 c2             	movzwl %dx,%eax
    1e78:	c1 e8 02             	shr    $0x2,%eax
    1e7b:	69 c0 7b 14 00 00    	imul   $0x147b,%eax,%eax
    1e81:	c1 e8 11             	shr    $0x11,%eax
    1e84:	6b c8 64             	imul   $0x64,%eax,%ecx
    1e87:	29 ca                	sub    %ecx,%edx
    1e89:	0f b7 ca             	movzwl %dx,%ecx
    1e8c:	89 c2                	mov    %eax,%edx
    1e8e:	0f b7 8c 4b 05 e3 ff 	movzwl -0x1cfb(%ebx,%ecx,2),%ecx
    1e95:	ff 
    1e96:	66 89 4c 34 30       	mov    %cx,0x30(%esp,%esi,1)
    1e9b:	83 c6 fe             	add    $0xfffffffe,%esi
    1e9e:	8b 4c 24 54          	mov    0x54(%esp),%ecx
    1ea2:	83 7c 24 04 00       	cmpl   $0x0,0x4(%esp)
    1ea7:	74 04                	je     1ead <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0xcd>
    1ea9:	85 d2                	test   %edx,%edx
    1eab:	74 10                	je     1ebd <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0xdd>
    1ead:	83 e2 0f             	and    $0xf,%edx
    1eb0:	0f b6 84 53 06 e3 ff 	movzbl -0x1cfa(%ebx,%edx,2),%eax
    1eb7:	ff 
    1eb8:	88 44 34 31          	mov    %al,0x31(%esp,%esi,1)
    1ebc:	4e                   	dec    %esi
    1ebd:	8b 69 08             	mov    0x8(%ecx),%ebp
    1ec0:	8d 44 34 32          	lea    0x32(%esp,%esi,1),%eax
    1ec4:	ba 0a 00 00 00       	mov    $0xa,%edx
    1ec9:	b9 00 00 11 00       	mov    $0x110000,%ecx
    1ece:	bf 2b 00 00 00       	mov    $0x2b,%edi
    1ed3:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1ed7:	29 f2                	sub    %esi,%edx
    1ed9:	89 54 24 18          	mov    %edx,0x18(%esp)
    1edd:	89 e8                	mov    %ebp,%eax
    1edf:	25 00 00 20 00       	and    $0x200000,%eax
    1ee4:	0f 44 f9             	cmove  %ecx,%edi
    1ee7:	8b 4c 24 54          	mov    0x54(%esp),%ecx
    1eeb:	c1 e8 15             	shr    $0x15,%eax
    1eee:	89 7c 24 20          	mov    %edi,0x20(%esp)
    1ef2:	89 ef                	mov    %ebp,%edi
    1ef4:	01 d0                	add    %edx,%eax
    1ef6:	89 ea                	mov    %ebp,%edx
    1ef8:	c1 ef 17             	shr    $0x17,%edi
    1efb:	83 e7 01             	and    $0x1,%edi
    1efe:	0f b7 69 0c          	movzwl 0xc(%ecx),%ebp
    1f02:	39 e8                	cmp    %ebp,%eax
    1f04:	73 38                	jae    1f3e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x15e>
    1f06:	f7 c2 00 00 00 01    	test   $0x1000000,%edx
    1f0c:	89 7c 24 04          	mov    %edi,0x4(%esp)
    1f10:	89 54 24 24          	mov    %edx,0x24(%esp)
    1f14:	75 64                	jne    1f7a <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x19a>
    1f16:	89 ef                	mov    %ebp,%edi
    1f18:	89 6c 24 2c          	mov    %ebp,0x2c(%esp)
    1f1c:	31 ed                	xor    %ebp,%ebp
    1f1e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    1f22:	29 c7                	sub    %eax,%edi
    1f24:	89 d0                	mov    %edx,%eax
    1f26:	c1 e8 1d             	shr    $0x1d,%eax
    1f29:	83 e0 03             	and    $0x3,%eax
    1f2c:	8b 84 83 6c e1 ff ff 	mov    -0x1e94(%ebx,%eax,4),%eax
    1f33:	01 d8                	add    %ebx,%eax
    1f35:	ff e0                	jmp    *%eax
    1f37:	89 fd                	mov    %edi,%ebp
    1f39:	e9 f5 00 00 00       	jmp    2033 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x253>
    1f3e:	8b 29                	mov    (%ecx),%ebp
    1f40:	8b 71 04             	mov    0x4(%ecx),%esi
    1f43:	83 ec 08             	sub    $0x8,%esp
    1f46:	89 e9                	mov    %ebp,%ecx
    1f48:	89 f2                	mov    %esi,%edx
    1f4a:	57                   	push   %edi
    1f4b:	ff 74 24 2c          	push   0x2c(%esp)
    1f4f:	e8 9c f6 ff ff       	call   15f0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    1f54:	83 c4 10             	add    $0x10,%esp
    1f57:	b1 01                	mov    $0x1,%cl
    1f59:	84 c0                	test   %al,%al
    1f5b:	0f 85 bd 01 00 00    	jne    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    1f61:	83 ec 04             	sub    $0x4,%esp
    1f64:	ff 74 24 1c          	push   0x1c(%esp)
    1f68:	ff 74 24 24          	push   0x24(%esp)
    1f6c:	55                   	push   %ebp
    1f6d:	ff 56 0c             	call   *0xc(%esi)
    1f70:	83 c4 10             	add    $0x10,%esp
    1f73:	89 c1                	mov    %eax,%ecx
    1f75:	e9 a4 01 00 00       	jmp    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    1f7a:	8b 41 0c             	mov    0xc(%ecx),%eax
    1f7d:	89 44 24 10          	mov    %eax,0x10(%esp)
    1f81:	8b 41 08             	mov    0x8(%ecx),%eax
    1f84:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f88:	25 00 00 e0 9f       	and    $0x9fe00000,%eax
    1f8d:	0d 30 00 00 20       	or     $0x20000030,%eax
    1f92:	89 41 08             	mov    %eax,0x8(%ecx)
    1f95:	89 c8                	mov    %ecx,%eax
    1f97:	8b 09                	mov    (%ecx),%ecx
    1f99:	8b 50 04             	mov    0x4(%eax),%edx
    1f9c:	83 ec 08             	sub    $0x8,%esp
    1f9f:	89 d7                	mov    %edx,%edi
    1fa1:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1fa5:	ff 74 24 0c          	push   0xc(%esp)
    1fa9:	ff 74 24 2c          	push   0x2c(%esp)
    1fad:	e8 3e f6 ff ff       	call   15f0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    1fb2:	83 c4 10             	add    $0x10,%esp
    1fb5:	b1 01                	mov    $0x1,%cl
    1fb7:	84 c0                	test   %al,%al
    1fb9:	0f 85 5f 01 00 00    	jne    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    1fbf:	01 f5                	add    %esi,%ebp
    1fc1:	0f ba 64 24 24 15    	btl    $0x15,0x24(%esp)
    1fc7:	89 fe                	mov    %edi,%esi
    1fc9:	8b 7c 24 08          	mov    0x8(%esp),%edi
    1fcd:	66 83 dd 00          	sbb    $0x0,%bp
    1fd1:	83 c5 f7             	add    $0xfffffff7,%ebp
    1fd4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    1fdb:	00 00 00 
    1fde:	66 90                	xchg   %ax,%ax
    1fe0:	66 4d                	dec    %bp
    1fe2:	74 15                	je     1ff9 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x219>
    1fe4:	83 ec 08             	sub    $0x8,%esp
    1fe7:	6a 30                	push   $0x30
    1fe9:	57                   	push   %edi
    1fea:	ff 56 10             	call   *0x10(%esi)
    1fed:	83 c4 10             	add    $0x10,%esp
    1ff0:	84 c0                	test   %al,%al
    1ff2:	74 ec                	je     1fe0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x200>
    1ff4:	e9 8c 00 00 00       	jmp    2085 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x2a5>
    1ff9:	83 ec 04             	sub    $0x4,%esp
    1ffc:	ff 74 24 1c          	push   0x1c(%esp)
    2000:	ff 74 24 24          	push   0x24(%esp)
    2004:	57                   	push   %edi
    2005:	ff 56 0c             	call   *0xc(%esi)
    2008:	83 c4 10             	add    $0x10,%esp
    200b:	84 c0                	test   %al,%al
    200d:	b1 01                	mov    $0x1,%cl
    200f:	0f 85 09 01 00 00    	jne    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    2015:	8b 44 24 54          	mov    0x54(%esp),%eax
    2019:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    201d:	89 48 08             	mov    %ecx,0x8(%eax)
    2020:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    2024:	89 48 0c             	mov    %ecx,0xc(%eax)
    2027:	31 c9                	xor    %ecx,%ecx
    2029:	e9 f0 00 00 00       	jmp    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    202e:	0f b7 ef             	movzwl %di,%ebp
    2031:	d1 ed                	shr    $1,%ebp
    2033:	81 e2 ff ff 1f 00    	and    $0x1fffff,%edx
    2039:	89 7c 24 14          	mov    %edi,0x14(%esp)
    203d:	8b 01                	mov    (%ecx),%eax
    203f:	89 6c 24 28          	mov    %ebp,0x28(%esp)
    2043:	8d 7d 01             	lea    0x1(%ebp),%edi
    2046:	8b 6c 24 04          	mov    0x4(%esp),%ebp
    204a:	89 54 24 10          	mov    %edx,0x10(%esp)
    204e:	8b 51 04             	mov    0x4(%ecx),%edx
    2051:	89 44 24 08          	mov    %eax,0x8(%esp)
    2055:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    205c:	00 00 00 
    205f:	90                   	nop
    2060:	83 ec 08             	sub    $0x8,%esp
    2063:	66 4f                	dec    %di
    2065:	74 25                	je     208c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x2ac>
    2067:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    206b:	89 d5                	mov    %edx,%ebp
    206d:	ff 74 24 18          	push   0x18(%esp)
    2071:	ff 74 24 14          	push   0x14(%esp)
    2075:	ff 52 10             	call   *0x10(%edx)
    2078:	89 ea                	mov    %ebp,%edx
    207a:	8b 6c 24 14          	mov    0x14(%esp),%ebp
    207e:	83 c4 10             	add    $0x10,%esp
    2081:	84 c0                	test   %al,%al
    2083:	74 db                	je     2060 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x280>
    2085:	b1 01                	mov    $0x1,%cl
    2087:	e9 92 00 00 00       	jmp    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    208c:	8b 7c 24 10          	mov    0x10(%esp),%edi
    2090:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    2094:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2098:	89 f9                	mov    %edi,%ecx
    209a:	55                   	push   %ebp
    209b:	ff 74 24 2c          	push   0x2c(%esp)
    209f:	e8 4c f5 ff ff       	call   15f0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17hcfe3f7c8045b9b50E>
    20a4:	83 c4 10             	add    $0x10,%esp
    20a7:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
    20ab:	b1 01                	mov    $0x1,%cl
    20ad:	84 c0                	test   %al,%al
    20af:	75 6d                	jne    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    20b1:	83 ec 04             	sub    $0x4,%esp
    20b4:	ff 74 24 1c          	push   0x1c(%esp)
    20b8:	ff 74 24 24          	push   0x24(%esp)
    20bc:	57                   	push   %edi
    20bd:	8b 44 24 14          	mov    0x14(%esp),%eax
    20c1:	89 c7                	mov    %eax,%edi
    20c3:	ff 50 0c             	call   *0xc(%eax)
    20c6:	b1 01                	mov    $0x1,%cl
    20c8:	83 c4 10             	add    $0x10,%esp
    20cb:	84 c0                	test   %al,%al
    20cd:	75 4f                	jne    211e <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x33e>
    20cf:	8b 44 24 28          	mov    0x28(%esp),%eax
    20d3:	29 44 24 14          	sub    %eax,0x14(%esp)
    20d7:	0f ba 64 24 24 15    	btl    $0x15,0x24(%esp)
    20dd:	66 83 d0 00          	adc    $0x0,%ax
    20e1:	29 e8                	sub    %ebp,%eax
    20e3:	89 c5                	mov    %eax,%ebp
    20e5:	29 f5                	sub    %esi,%ebp
    20e7:	66 be ff ff          	mov    $0xffff,%si
    20eb:	83 c5 0a             	add    $0xa,%ebp
    20ee:	66 90                	xchg   %ax,%ax
    20f0:	8d 44 35 00          	lea    0x0(%ebp,%esi,1),%eax
    20f4:	66 83 f8 ff          	cmp    $0xffff,%ax
    20f8:	74 18                	je     2112 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x332>
    20fa:	83 ec 08             	sub    $0x8,%esp
    20fd:	ff 74 24 18          	push   0x18(%esp)
    2101:	ff 74 24 14          	push   0x14(%esp)
    2105:	ff 57 10             	call   *0x10(%edi)
    2108:	83 c4 10             	add    $0x10,%esp
    210b:	46                   	inc    %esi
    210c:	84 c0                	test   %al,%al
    210e:	74 e0                	je     20f0 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x310>
    2110:	eb 04                	jmp    2116 <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h387aa99bd20dd571E+0x336>
    2112:	8b 74 24 14          	mov    0x14(%esp),%esi
    2116:	66 3b 74 24 14       	cmp    0x14(%esp),%si
    211b:	0f 92 c1             	setb   %cl
    211e:	89 c8                	mov    %ecx,%eax
    2120:	83 c4 3c             	add    $0x3c,%esp
    2123:	5e                   	pop    %esi
    2124:	5f                   	pop    %edi
    2125:	5b                   	pop    %ebx
    2126:	5d                   	pop    %ebp
    2127:	c3                   	ret
    2128:	66 90                	xchg   %ax,%ax
    212a:	66 90                	xchg   %ax,%ax
    212c:	66 90                	xchg   %ax,%ax
    212e:	66 90                	xchg   %ax,%ax

00002130 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>:
    2130:	55                   	push   %ebp
    2131:	53                   	push   %ebx
    2132:	57                   	push   %edi
    2133:	56                   	push   %esi
    2134:	83 ec 2c             	sub    $0x2c,%esp
    2137:	8b 44 24 40          	mov    0x40(%esp),%eax
    213b:	e8 00 00 00 00       	call   2140 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x10>
    2140:	5b                   	pop    %ebx
    2141:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    2145:	8b 74 24 44          	mov    0x44(%esp),%esi
    2149:	31 d2                	xor    %edx,%edx
    214b:	81 c3 b4 2e 00 00    	add    $0x2eb4,%ebx
    2151:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    2155:	8b 48 08             	mov    0x8(%eax),%ecx
    2158:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    215c:	8b 08                	mov    (%eax),%ecx
    215e:	8b 40 04             	mov    0x4(%eax),%eax
    2161:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    2165:	8d 83 f4 e2 ff ff    	lea    -0x1d0c(%ebx),%eax
    216b:	89 4c 24 20          	mov    %ecx,0x20(%esp)
    216f:	31 c9                	xor    %ecx,%ecx
    2171:	89 44 24 28          	mov    %eax,0x28(%esp)
    2175:	31 c0                	xor    %eax,%eax
    2177:	eb 48                	jmp    21c1 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x91>
    2179:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
    2180:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    2184:	80 7c 31 ff 0a       	cmpb   $0xa,-0x1(%ecx,%esi,1)
    2189:	89 ce                	mov    %ecx,%esi
    218b:	0f 94 c1             	sete   %cl
    218e:	01 f2                	add    %esi,%edx
    2190:	89 d5                	mov    %edx,%ebp
    2192:	8b 54 24 24          	mov    0x24(%esp),%edx
    2196:	88 0a                	mov    %cl,(%edx)
    2198:	83 ec 04             	sub    $0x4,%esp
    219b:	50                   	push   %eax
    219c:	55                   	push   %ebp
    219d:	ff 74 24 2c          	push   0x2c(%esp)
    21a1:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    21a5:	ff 50 0c             	call   *0xc(%eax)
    21a8:	83 c4 10             	add    $0x10,%esp
    21ab:	84 c0                	test   %al,%al
    21ad:	8b 44 24 10          	mov    0x10(%esp),%eax
    21b1:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    21b5:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    21b9:	89 fa                	mov    %edi,%edx
    21bb:	0f 85 b9 01 00 00    	jne    237a <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x24a>
    21c1:	f6 c1 01             	test   $0x1,%cl
    21c4:	0f 85 ac 01 00 00    	jne    2376 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x246>
    21ca:	39 c5                	cmp    %eax,%ebp
    21cc:	73 12                	jae    21e0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xb0>
    21ce:	89 c7                	mov    %eax,%edi
    21d0:	e9 50 01 00 00       	jmp    2325 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f5>
    21d5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    21dc:	00 00 00 
    21df:	90                   	nop
    21e0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    21e4:	eb 18                	jmp    21fe <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xce>
    21e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    21ed:	00 00 00 
    21f0:	8b 74 24 44          	mov    0x44(%esp),%esi
    21f4:	39 ef                	cmp    %ebp,%edi
    21f6:	89 f8                	mov    %edi,%eax
    21f8:	0f 87 27 01 00 00    	ja     2325 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f5>
    21fe:	89 e9                	mov    %ebp,%ecx
    2200:	89 c7                	mov    %eax,%edi
    2202:	29 c1                	sub    %eax,%ecx
    2204:	01 f0                	add    %esi,%eax
    2206:	89 7c 24 10          	mov    %edi,0x10(%esp)
    220a:	83 f9 07             	cmp    $0x7,%ecx
    220d:	77 31                	ja     2240 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x110>
    220f:	39 fd                	cmp    %edi,%ebp
    2211:	0f 84 0c 01 00 00    	je     2323 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f3>
    2217:	31 f6                	xor    %esi,%esi
    2219:	0f 1f 80 00 00 00 00 	nopl   0x0(%eax)
    2220:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    2224:	0f 84 c9 00 00 00    	je     22f3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1c3>
    222a:	46                   	inc    %esi
    222b:	39 f1                	cmp    %esi,%ecx
    222d:	75 f1                	jne    2220 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xf0>
    222f:	e9 ef 00 00 00       	jmp    2323 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1f3>
    2234:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    223b:	00 00 00 
    223e:	66 90                	xchg   %ax,%ax
    2240:	8d 78 03             	lea    0x3(%eax),%edi
    2243:	83 e7 fc             	and    $0xfffffffc,%edi
    2246:	89 fa                	mov    %edi,%edx
    2248:	29 c2                	sub    %eax,%edx
    224a:	74 20                	je     226c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x13c>
    224c:	31 f6                	xor    %esi,%esi
    224e:	66 90                	xchg   %ax,%ax
    2250:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    2254:	0f 84 95 00 00 00    	je     22ef <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bf>
    225a:	46                   	inc    %esi
    225b:	39 f2                	cmp    %esi,%edx
    225d:	75 f1                	jne    2250 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x120>
    225f:	8d 71 f8             	lea    -0x8(%ecx),%esi
    2262:	39 f2                	cmp    %esi,%edx
    2264:	89 74 24 14          	mov    %esi,0x14(%esp)
    2268:	76 09                	jbe    2273 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x143>
    226a:	eb 51                	jmp    22bd <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    226c:	8d 71 f8             	lea    -0x8(%ecx),%esi
    226f:	89 74 24 14          	mov    %esi,0x14(%esp)
    2273:	be 04 00 00 00       	mov    $0x4,%esi
    2278:	01 f7                	add    %esi,%edi
    227a:	66 0f 1f 44 00 00    	nopw   0x0(%eax,%eax,1)
    2280:	8b 5f fc             	mov    -0x4(%edi),%ebx
    2283:	8b 37                	mov    (%edi),%esi
    2285:	89 dd                	mov    %ebx,%ebp
    2287:	81 f5 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebp
    228d:	81 c5 01 01 01 01    	add    $0x1010101,%ebp
    2293:	09 dd                	or     %ebx,%ebp
    2295:	89 f3                	mov    %esi,%ebx
    2297:	81 f3 f5 f5 f5 f5    	xor    $0xf5f5f5f5,%ebx
    229d:	81 c3 01 01 01 01    	add    $0x1010101,%ebx
    22a3:	09 f3                	or     %esi,%ebx
    22a5:	21 eb                	and    %ebp,%ebx
    22a7:	f7 d3                	not    %ebx
    22a9:	f7 c3 80 80 80 80    	test   $0x80808080,%ebx
    22af:	75 0c                	jne    22bd <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x18d>
    22b1:	83 c2 08             	add    $0x8,%edx
    22b4:	83 c7 08             	add    $0x8,%edi
    22b7:	3b 54 24 14          	cmp    0x14(%esp),%edx
    22bb:	76 c3                	jbe    2280 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x150>
    22bd:	39 d1                	cmp    %edx,%ecx
    22bf:	74 56                	je     2317 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1e7>
    22c1:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    22c5:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    22c9:	8d 0c 10             	lea    (%eax,%edx,1),%ecx
    22cc:	31 f6                	xor    %esi,%esi
    22ce:	89 ef                	mov    %ebp,%edi
    22d0:	29 d7                	sub    %edx,%edi
    22d2:	2b 7c 24 10          	sub    0x10(%esp),%edi
    22d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    22dd:	00 00 00 
    22e0:	80 3c 31 0a          	cmpb   $0xa,(%ecx,%esi,1)
    22e4:	74 07                	je     22ed <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1bd>
    22e6:	46                   	inc    %esi
    22e7:	39 f7                	cmp    %esi,%edi
    22e9:	75 f5                	jne    22e0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1b0>
    22eb:	eb 32                	jmp    231f <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x1ef>
    22ed:	01 d6                	add    %edx,%esi
    22ef:	8b 54 24 0c          	mov    0xc(%esp),%edx
    22f3:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    22f7:	8d 7c 0e 01          	lea    0x1(%esi,%ecx,1),%edi
    22fb:	01 f1                	add    %esi,%ecx
    22fd:	39 e9                	cmp    %ebp,%ecx
    22ff:	0f 83 eb fe ff ff    	jae    21f0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    2305:	80 3c 30 0a          	cmpb   $0xa,(%eax,%esi,1)
    2309:	0f 85 e1 fe ff ff    	jne    21f0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0xc0>
    230f:	31 c9                	xor    %ecx,%ecx
    2311:	89 f8                	mov    %edi,%eax
    2313:	89 fe                	mov    %edi,%esi
    2315:	eb 1a                	jmp    2331 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x201>
    2317:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    231b:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    231f:	8b 54 24 0c          	mov    0xc(%esp),%edx
    2323:	89 ef                	mov    %ebp,%edi
    2325:	89 f8                	mov    %edi,%eax
    2327:	b1 01                	mov    $0x1,%cl
    2329:	39 d5                	cmp    %edx,%ebp
    232b:	89 d7                	mov    %edx,%edi
    232d:	89 ee                	mov    %ebp,%esi
    232f:	74 45                	je     2376 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x246>
    2331:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2335:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    2339:	89 44 24 10          	mov    %eax,0x10(%esp)
    233d:	80 39 00             	cmpb   $0x0,(%ecx)
    2340:	74 1f                	je     2361 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x231>
    2342:	83 ec 04             	sub    $0x4,%esp
    2345:	6a 04                	push   $0x4
    2347:	ff 74 24 30          	push   0x30(%esp)
    234b:	ff 74 24 2c          	push   0x2c(%esp)
    234f:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    2353:	89 d5                	mov    %edx,%ebp
    2355:	ff 50 0c             	call   *0xc(%eax)
    2358:	89 ea                	mov    %ebp,%edx
    235a:	83 c4 10             	add    $0x10,%esp
    235d:	84 c0                	test   %al,%al
    235f:	75 19                	jne    237a <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x24a>
    2361:	89 f0                	mov    %esi,%eax
    2363:	29 d0                	sub    %edx,%eax
    2365:	0f 85 15 fe ff ff    	jne    2180 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x50>
    236b:	8b 74 24 44          	mov    0x44(%esp),%esi
    236f:	31 c9                	xor    %ecx,%ecx
    2371:	e9 18 fe ff ff       	jmp    218e <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x5e>
    2376:	31 c0                	xor    %eax,%eax
    2378:	eb 02                	jmp    237c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E+0x24c>
    237a:	b0 01                	mov    $0x1,%al
    237c:	83 c4 2c             	add    $0x2c,%esp
    237f:	5e                   	pop    %esi
    2380:	5f                   	pop    %edi
    2381:	5b                   	pop    %ebx
    2382:	5d                   	pop    %ebp
    2383:	c3                   	ret
    2384:	66 90                	xchg   %ax,%ax
    2386:	66 90                	xchg   %ax,%ax
    2388:	66 90                	xchg   %ax,%ax
    238a:	66 90                	xchg   %ax,%ax
    238c:	66 90                	xchg   %ax,%ax
    238e:	66 90                	xchg   %ax,%ax

00002390 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E>:
    2390:	55                   	push   %ebp
    2391:	53                   	push   %ebx
    2392:	57                   	push   %edi
    2393:	56                   	push   %esi
    2394:	83 ec 0c             	sub    $0xc,%esp
    2397:	8b 44 24 20          	mov    0x20(%esp),%eax
    239b:	e8 00 00 00 00       	call   23a0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x10>
    23a0:	5b                   	pop    %ebx
    23a1:	81 c3 54 2c 00 00    	add    $0x2c54,%ebx
    23a7:	8b 68 08             	mov    0x8(%eax),%ebp
    23aa:	8b 38                	mov    (%eax),%edi
    23ac:	8b 70 04             	mov    0x4(%eax),%esi
    23af:	80 7d 00 00          	cmpb   $0x0,0x0(%ebp)
    23b3:	74 1e                	je     23d3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    23b5:	83 ec 04             	sub    $0x4,%esp
    23b8:	8d 83 f4 e2 ff ff    	lea    -0x1d0c(%ebx),%eax
    23be:	6a 04                	push   $0x4
    23c0:	50                   	push   %eax
    23c1:	57                   	push   %edi
    23c2:	ff 56 0c             	call   *0xc(%esi)
    23c5:	83 c4 10             	add    $0x10,%esp
    23c8:	84 c0                	test   %al,%al
    23ca:	74 07                	je     23d3 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x43>
    23cc:	b0 01                	mov    $0x1,%al
    23ce:	83 c4 0c             	add    $0xc,%esp
    23d1:	eb 16                	jmp    23e9 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$10write_char17hcd25163a23e864c6E+0x59>
    23d3:	8b 44 24 24          	mov    0x24(%esp),%eax
    23d7:	83 f8 0a             	cmp    $0xa,%eax
    23da:	0f 94 45 00          	sete   0x0(%ebp)
    23de:	83 ec 08             	sub    $0x8,%esp
    23e1:	50                   	push   %eax
    23e2:	57                   	push   %edi
    23e3:	ff 56 10             	call   *0x10(%esi)
    23e6:	83 c4 1c             	add    $0x1c,%esp
    23e9:	5e                   	pop    %esi
    23ea:	5f                   	pop    %edi
    23eb:	5b                   	pop    %ebx
    23ec:	5d                   	pop    %ebp
    23ed:	c3                   	ret
    23ee:	66 90                	xchg   %ax,%ax

000023f0 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE>:
    23f0:	53                   	push   %ebx
    23f1:	83 ec 08             	sub    $0x8,%esp
    23f4:	8b 44 24 14          	mov    0x14(%esp),%eax
    23f8:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    23fc:	e8 00 00 00 00       	call   2401 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x11>
    2401:	5b                   	pop    %ebx
    2402:	81 c3 f3 2b 00 00    	add    $0x2bf3,%ebx
    2408:	8b 50 04             	mov    0x4(%eax),%edx
    240b:	83 fa 01             	cmp    $0x1,%edx
    240e:	74 02                	je     2412 <_ZN4core3fmt5Write9write_fmt17h8f134d5b7e940ddaE+0x22>
    2410:	85 d2                	test   %edx,%edx
    2412:	8d 93 f8 fe ff ff    	lea    -0x108(%ebx),%edx
    2418:	89 04 24             	mov    %eax,(%esp)
    241b:	e8 a0 f7 ff ff       	call   1bc0 <_ZN4core3fmt5write17h60dc8996c7a95b44E>
    2420:	83 c4 08             	add    $0x8,%esp
    2423:	5b                   	pop    %ebx
    2424:	c3                   	ret
    2425:	66 90                	xchg   %ax,%ax
    2427:	66 90                	xchg   %ax,%ax
    2429:	66 90                	xchg   %ax,%ax
    242b:	66 90                	xchg   %ax,%ax
    242d:	66 90                	xchg   %ax,%ax
    242f:	90                   	nop

00002430 <init>:
    2430:	53                   	push   %ebx
    2431:	83 ec 08             	sub    $0x8,%esp
    2434:	e8 00 00 00 00       	call   2439 <init+0x9>
    2439:	5b                   	pop    %ebx
    243a:	b9 01 00 00 00       	mov    $0x1,%ecx
    243f:	31 c0                	xor    %eax,%eax
    2441:	81 c3 bb 2b 00 00    	add    $0x2bbb,%ebx
    2447:	f0 0f b1 8b 14 00 00 	lock cmpxchg %ecx,0x14(%ebx)
    244e:	00 
    244f:	75 41                	jne    2492 <init+0x62>
    2451:	8d 83 7c e1 ff ff    	lea    -0x1e84(%ebx),%eax
    2457:	89 83 0c 00 00 00    	mov    %eax,0xc(%ebx)
    245d:	8d 83 90 fe ff ff    	lea    -0x170(%ebx),%eax
    2463:	89 83 10 00 00 00    	mov    %eax,0x10(%ebx)
    2469:	b8 2a 00 00 00       	mov    $0x2a,%eax
    246e:	c7 83 14 00 00 00 02 	movl   $0x2,0x14(%ebx)
    2475:	00 00 00 
    2478:	c7 83 18 00 00 00 03 	movl   $0x3,0x18(%ebx)
    247f:	00 00 00 
    2482:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    2489:	00 00 00 
    248c:	0f 1f 40 00          	nopl   0x0(%eax)
    2490:	eb fe                	jmp    2490 <init+0x60>
    2492:	83 f8 01             	cmp    $0x1,%eax
    2495:	75 21                	jne    24b8 <init+0x88>
    2497:	66 0f 1f 84 00 00 00 	nopw   0x0(%eax,%eax,1)
    249e:	00 00 
    24a0:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
    24a6:	83 f8 01             	cmp    $0x1,%eax
    24a9:	75 0d                	jne    24b8 <init+0x88>
    24ab:	f3 90                	pause
    24ad:	8b 83 14 00 00 00    	mov    0x14(%ebx),%eax
    24b3:	83 f8 01             	cmp    $0x1,%eax
    24b6:	74 f3                	je     24ab <init+0x7b>
    24b8:	8d 4c 24 07          	lea    0x7(%esp),%ecx
    24bc:	e8 6f eb ff ff       	call   1030 <_ZN4core6result13unwrap_failed17he01453759a0dabd3E>
    24c1:	66 90                	xchg   %ax,%ax
    24c3:	66 90                	xchg   %ax,%ax
    24c5:	66 90                	xchg   %ax,%ax
    24c7:	66 90                	xchg   %ax,%ax
    24c9:	66 90                	xchg   %ax,%ax
    24cb:	66 90                	xchg   %ax,%ax
    24cd:	66 90                	xchg   %ax,%ax
    24cf:	90                   	nop

000024d0 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E>:
    24d0:	55                   	push   %ebp
    24d1:	53                   	push   %ebx
    24d2:	57                   	push   %edi
    24d3:	56                   	push   %esi
    24d4:	83 ec 2c             	sub    $0x2c,%esp
    24d7:	8b 74 24 44          	mov    0x44(%esp),%esi
    24db:	e8 00 00 00 00       	call   24e0 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x10>
    24e0:	5b                   	pop    %ebx
    24e1:	81 c3 14 2b 00 00    	add    $0x2b14,%ebx
    24e7:	8b 6e 04             	mov    0x4(%esi),%ebp
    24ea:	8b 3e                	mov    (%esi),%edi
    24ec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    24ef:	83 ec 04             	sub    $0x4,%esp
    24f2:	8d 83 fa e3 ff ff    	lea    -0x1c06(%ebx),%eax
    24f8:	6a 0e                	push   $0xe
    24fa:	50                   	push   %eax
    24fb:	57                   	push   %edi
    24fc:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2500:	ff d1                	call   *%ecx
    2502:	83 c4 10             	add    $0x10,%esp
    2505:	b1 01                	mov    $0x1,%cl
    2507:	84 c0                	test   %al,%al
    2509:	0f 85 e3 00 00 00    	jne    25f2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    250f:	f6 46 0a 80          	testb  $0x80,0xa(%esi)
    2513:	75 40                	jne    2555 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x85>
    2515:	83 ec 04             	sub    $0x4,%esp
    2518:	8d 83 02 e3 ff ff    	lea    -0x1cfe(%ebx),%eax
    251e:	6a 01                	push   $0x1
    2520:	50                   	push   %eax
    2521:	57                   	push   %edi
    2522:	ff 54 24 1c          	call   *0x1c(%esp)
    2526:	83 c4 10             	add    $0x10,%esp
    2529:	84 c0                	test   %al,%al
    252b:	0f 85 8c 00 00 00    	jne    25bd <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    2531:	83 ec 0c             	sub    $0xc,%esp
    2534:	8d 93 cd e3 ff ff    	lea    -0x1c33(%ebx),%edx
    253a:	89 f1                	mov    %esi,%ecx
    253c:	6a 02                	push   $0x2
    253e:	e8 fd f0 ff ff       	call   1640 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    2543:	83 c4 10             	add    $0x10,%esp
    2546:	84 c0                	test   %al,%al
    2548:	b1 01                	mov    $0x1,%cl
    254a:	0f 84 8c 00 00 00    	je     25dc <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x10c>
    2550:	e9 9d 00 00 00       	jmp    25f2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    2555:	83 ec 04             	sub    $0x4,%esp
    2558:	8d 83 03 e3 ff ff    	lea    -0x1cfd(%ebx),%eax
    255e:	6a 02                	push   $0x2
    2560:	50                   	push   %eax
    2561:	57                   	push   %edi
    2562:	ff 54 24 1c          	call   *0x1c(%esp)
    2566:	83 c4 10             	add    $0x10,%esp
    2569:	84 c0                	test   %al,%al
    256b:	75 50                	jne    25bd <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xed>
    256d:	8d 44 24 0b          	lea    0xb(%esp),%eax
    2571:	89 7c 24 10          	mov    %edi,0x10(%esp)
    2575:	89 6c 24 14          	mov    %ebp,0x14(%esp)
    2579:	8b 4e 0c             	mov    0xc(%esi),%ecx
    257c:	c6 44 24 0b 01       	movb   $0x1,0xb(%esp)
    2581:	89 44 24 18          	mov    %eax,0x18(%esp)
    2585:	8b 46 08             	mov    0x8(%esi),%eax
    2588:	8d 74 24 10          	lea    0x10(%esp),%esi
    258c:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    2590:	89 44 24 24          	mov    %eax,0x24(%esp)
    2594:	8d 83 f8 fe ff ff    	lea    -0x108(%ebx),%eax
    259a:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    259e:	89 44 24 20          	mov    %eax,0x20(%esp)
    25a2:	83 ec 0c             	sub    $0xc,%esp
    25a5:	8d 93 cd e3 ff ff    	lea    -0x1c33(%ebx),%edx
    25ab:	8d 4c 24 28          	lea    0x28(%esp),%ecx
    25af:	6a 02                	push   $0x2
    25b1:	e8 8a f0 ff ff       	call   1640 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    25b6:	83 c4 10             	add    $0x10,%esp
    25b9:	84 c0                	test   %al,%al
    25bb:	74 04                	je     25c1 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0xf1>
    25bd:	b1 01                	mov    $0x1,%cl
    25bf:	eb 31                	jmp    25f2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    25c1:	83 ec 04             	sub    $0x4,%esp
    25c4:	8d 83 00 e3 ff ff    	lea    -0x1d00(%ebx),%eax
    25ca:	6a 02                	push   $0x2
    25cc:	50                   	push   %eax
    25cd:	56                   	push   %esi
    25ce:	e8 5d fb ff ff       	call   2130 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h24b9d0f154c11ae5E>
    25d3:	83 c4 10             	add    $0x10,%esp
    25d6:	84 c0                	test   %al,%al
    25d8:	b1 01                	mov    $0x1,%cl
    25da:	75 16                	jne    25f2 <_ZN56_$LT$log..SetLoggerError$u20$as$u20$core..fmt..Debug$GT$3fmt17h5f6a409d114caf80E+0x122>
    25dc:	83 ec 04             	sub    $0x4,%esp
    25df:	8d 83 e2 e2 ff ff    	lea    -0x1d1e(%ebx),%eax
    25e5:	6a 01                	push   $0x1
    25e7:	50                   	push   %eax
    25e8:	57                   	push   %edi
    25e9:	ff 54 24 1c          	call   *0x1c(%esp)
    25ed:	83 c4 10             	add    $0x10,%esp
    25f0:	89 c1                	mov    %eax,%ecx
    25f2:	89 c8                	mov    %ecx,%eax
    25f4:	83 c4 2c             	add    $0x2c,%esp
    25f7:	5e                   	pop    %esi
    25f8:	5f                   	pop    %edi
    25f9:	5b                   	pop    %ebx
    25fa:	5d                   	pop    %ebp
    25fb:	c3                   	ret
    25fc:	66 90                	xchg   %ax,%ax
    25fe:	66 90                	xchg   %ax,%ax

00002600 <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E>:
    2600:	53                   	push   %ebx
    2601:	83 ec 08             	sub    $0x8,%esp
    2604:	8b 44 24 10          	mov    0x10(%esp),%eax
    2608:	e8 00 00 00 00       	call   260d <_ZN49_$LT$log..Level$u20$as$u20$core..fmt..Display$GT$3fmt17h5f1a457efa1b5751E+0xd>
    260d:	5b                   	pop    %ebx
    260e:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    2612:	81 c3 e7 29 00 00    	add    $0x29e7,%ebx
    2618:	8b 00                	mov    (%eax),%eax
    261a:	8b 94 c3 48 ff ff ff 	mov    -0xb8(%ebx,%eax,8),%edx
    2621:	8b 84 c3 4c ff ff ff 	mov    -0xb4(%ebx,%eax,8),%eax
    2628:	89 04 24             	mov    %eax,(%esp)
    262b:	e8 10 f0 ff ff       	call   1640 <_ZN4core3fmt9Formatter3pad17hca3954b393b06d6eE>
    2630:	83 c4 08             	add    $0x8,%esp
    2633:	5b                   	pop    %ebx
    2634:	c3                   	ret
    2635:	66 90                	xchg   %ax,%ax
    2637:	66 90                	xchg   %ax,%ax
    2639:	66 90                	xchg   %ax,%ax
    263b:	66 90                	xchg   %ax,%ax
    263d:	66 90                	xchg   %ax,%ax
    263f:	90                   	nop

00002640 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$7enabled17h7c1fbd7539bc5801E>:
    2640:	31 c0                	xor    %eax,%eax
    2642:	c3                   	ret
    2643:	66 90                	xchg   %ax,%ax
    2645:	66 90                	xchg   %ax,%ax
    2647:	66 90                	xchg   %ax,%ax
    2649:	66 90                	xchg   %ax,%ax
    264b:	66 90                	xchg   %ax,%ax
    264d:	66 90                	xchg   %ax,%ax
    264f:	90                   	nop

00002650 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$3log17hb129cc8b65bcebf0E>:
    2650:	c3                   	ret
    2651:	66 90                	xchg   %ax,%ax
    2653:	66 90                	xchg   %ax,%ax
    2655:	66 90                	xchg   %ax,%ax
    2657:	66 90                	xchg   %ax,%ax
    2659:	66 90                	xchg   %ax,%ax
    265b:	66 90                	xchg   %ax,%ax
    265d:	66 90                	xchg   %ax,%ax
    265f:	90                   	nop

00002660 <_ZN43_$LT$log..NopLogger$u20$as$u20$log..Log$GT$5flush17hb87dc07497484b4cE>:
    2660:	c3                   	ret
    2661:	66 90                	xchg   %ax,%ax
    2663:	66 90                	xchg   %ax,%ax
    2665:	66 90                	xchg   %ax,%ax
    2667:	66 90                	xchg   %ax,%ax
    2669:	66 90                	xchg   %ax,%ax
    266b:	66 90                	xchg   %ax,%ax
    266d:	66 90                	xchg   %ax,%ax
    266f:	90                   	nop

00002670 <memcpy>:
    2670:	55                   	push   %ebp
    2671:	53                   	push   %ebx
    2672:	57                   	push   %edi
    2673:	56                   	push   %esi
    2674:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    2678:	8b 44 24 14          	mov    0x14(%esp),%eax
    267c:	8b 54 24 18          	mov    0x18(%esp),%edx
    2680:	89 c6                	mov    %eax,%esi
    2682:	83 fd 10             	cmp    $0x10,%ebp
    2685:	72 63                	jb     26ea <memcpy+0x7a>
    2687:	f7 de                	neg    %esi
    2689:	83 e6 03             	and    $0x3,%esi
    268c:	8d 3c 30             	lea    (%eax,%esi,1),%edi
    268f:	39 f8                	cmp    %edi,%eax
    2691:	73 19                	jae    26ac <memcpy+0x3c>
    2693:	31 db                	xor    %ebx,%ebx
    2695:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    269c:	00 00 00 
    269f:	90                   	nop
    26a0:	0f b6 0c 1a          	movzbl (%edx,%ebx,1),%ecx
    26a4:	88 0c 18             	mov    %cl,(%eax,%ebx,1)
    26a7:	43                   	inc    %ebx
    26a8:	39 de                	cmp    %ebx,%esi
    26aa:	75 f4                	jne    26a0 <memcpy+0x30>
    26ac:	29 f5                	sub    %esi,%ebp
    26ae:	01 f2                	add    %esi,%edx
    26b0:	89 eb                	mov    %ebp,%ebx
    26b2:	89 e8                	mov    %ebp,%eax
    26b4:	83 e3 fc             	and    $0xfffffffc,%ebx
    26b7:	f6 c2 03             	test   $0x3,%dl
    26ba:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
    26bd:	75 52                	jne    2711 <memcpy+0xa1>
    26bf:	39 f7                	cmp    %esi,%edi
    26c1:	73 1c                	jae    26df <memcpy+0x6f>
    26c3:	89 d5                	mov    %edx,%ebp
    26c5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    26cc:	00 00 00 
    26cf:	90                   	nop
    26d0:	8b 4d 00             	mov    0x0(%ebp),%ecx
    26d3:	83 c5 04             	add    $0x4,%ebp
    26d6:	89 0f                	mov    %ecx,(%edi)
    26d8:	83 c7 04             	add    $0x4,%edi
    26db:	39 f7                	cmp    %esi,%edi
    26dd:	72 f1                	jb     26d0 <memcpy+0x60>
    26df:	89 c5                	mov    %eax,%ebp
    26e1:	8b 44 24 14          	mov    0x14(%esp),%eax
    26e5:	01 da                	add    %ebx,%edx
    26e7:	83 e5 03             	and    $0x3,%ebp
    26ea:	8d 3c 2e             	lea    (%esi,%ebp,1),%edi
    26ed:	39 fe                	cmp    %edi,%esi
    26ef:	73 1b                	jae    270c <memcpy+0x9c>
    26f1:	31 ff                	xor    %edi,%edi
    26f3:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%eax,%eax,1)
    26fa:	00 00 00 
    26fd:	0f 1f 00             	nopl   (%eax)
    2700:	0f b6 0c 3a          	movzbl (%edx,%edi,1),%ecx
    2704:	88 0c 3e             	mov    %cl,(%esi,%edi,1)
    2707:	47                   	inc    %edi
    2708:	39 fd                	cmp    %edi,%ebp
    270a:	75 f4                	jne    2700 <memcpy+0x90>
    270c:	5e                   	pop    %esi
    270d:	5f                   	pop    %edi
    270e:	5b                   	pop    %ebx
    270f:	5d                   	pop    %ebp
    2710:	c3                   	ret
    2711:	39 f7                	cmp    %esi,%edi
    2713:	73 ca                	jae    26df <memcpy+0x6f>
    2715:	89 d5                	mov    %edx,%ebp
    2717:	8b 4d 00             	mov    0x0(%ebp),%ecx
    271a:	83 c5 04             	add    $0x4,%ebp
    271d:	89 0f                	mov    %ecx,(%edi)
    271f:	83 c7 04             	add    $0x4,%edi
    2722:	39 f7                	cmp    %esi,%edi
    2724:	72 f1                	jb     2717 <memcpy+0xa7>
    2726:	eb b7                	jmp    26df <memcpy+0x6f>

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
    3040:	6c                   	insb   (%dx),%es:(%edi)
    3041:	4e                   	dec    %esi
    3042:	00 00                	add    %al,(%eax)
    3044:	08 00                	or     %al,(%eax)
    3046:	00 00                	add    %al,(%eax)
    3048:	78 4e                	js     3098 <memcpy+0xa28>
    304a:	00 00                	add    %al,(%eax)
    304c:	08 00                	or     %al,(%eax)
    304e:	00 00                	add    %al,(%eax)
    3050:	7c 4e                	jl     30a0 <memcpy+0xa30>
    3052:	00 00                	add    %al,(%eax)
    3054:	08 00                	or     %al,(%eax)
    3056:	00 00                	add    %al,(%eax)
    3058:	80 4e 00 00          	orb    $0x0,0x0(%esi)
    305c:	08 00                	or     %al,(%eax)
    305e:	00 00                	add    %al,(%eax)
    3060:	84 4e 00             	test   %cl,0x0(%esi)
    3063:	00 08                	add    %cl,(%eax)
    3065:	00 00                	add    %al,(%eax)
    3067:	00 90 4e 00 00 08    	add    %dl,0x800004e(%eax)
    306d:	00 00                	add    %al,(%eax)
    306f:	00 94 4e 00 00 08 00 	add    %dl,0x80000(%esi,%ecx,2)
    3076:	00 00                	add    %al,(%eax)
    3078:	98                   	cwtl
    3079:	4e                   	dec    %esi
    307a:	00 00                	add    %al,(%eax)
    307c:	08 00                	or     %al,(%eax)
    307e:	00 00                	add    %al,(%eax)
    3080:	9c                   	pushf
    3081:	4e                   	dec    %esi
    3082:	00 00                	add    %al,(%eax)
    3084:	08 00                	or     %al,(%eax)
    3086:	00 00                	add    %al,(%eax)
    3088:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    3089:	4e                   	dec    %esi
    308a:	00 00                	add    %al,(%eax)
    308c:	08 00                	or     %al,(%eax)
    308e:	00 00                	add    %al,(%eax)
    3090:	ac                   	lods   %ds:(%esi),%al
    3091:	4e                   	dec    %esi
    3092:	00 00                	add    %al,(%eax)
    3094:	08 00                	or     %al,(%eax)
    3096:	00 00                	add    %al,(%eax)
    3098:	b4 4e                	mov    $0x4e,%ah
    309a:	00 00                	add    %al,(%eax)
    309c:	08 00                	or     %al,(%eax)
    309e:	00 00                	add    %al,(%eax)
    30a0:	bc 4e 00 00 08       	mov    $0x800004e,%esp
    30a5:	00 00                	add    %al,(%eax)
    30a7:	00 cc                	add    %cl,%ah
    30a9:	4e                   	dec    %esi
    30aa:	00 00                	add    %al,(%eax)
    30ac:	08 00                	or     %al,(%eax)
    30ae:	00 00                	add    %al,(%eax)
    30b0:	d4 4e                	aam    $0x4e
    30b2:	00 00                	add    %al,(%eax)
    30b4:	08 00                	or     %al,(%eax)
    30b6:	00 00                	add    %al,(%eax)
    30b8:	e4 4e                	in     $0x4e,%al
    30ba:	00 00                	add    %al,(%eax)
    30bc:	08 00                	or     %al,(%eax)
    30be:	00 00                	add    %al,(%eax)
    30c0:	f8                   	clc
    30c1:	4e                   	dec    %esi
    30c2:	00 00                	add    %al,(%eax)
    30c4:	08 00                	or     %al,(%eax)
    30c6:	00 00                	add    %al,(%eax)
    30c8:	fc                   	cld
    30c9:	4e                   	dec    %esi
    30ca:	00 00                	add    %al,(%eax)
    30cc:	08 00                	or     %al,(%eax)
    30ce:	00 00                	add    %al,(%eax)
    30d0:	00 4f 00             	add    %cl,0x0(%edi)
    30d3:	00 08                	add    %cl,(%eax)
    30d5:	00 00                	add    %al,(%eax)
    30d7:	00 10                	add    %dl,(%eax)
    30d9:	4f                   	dec    %edi
    30da:	00 00                	add    %al,(%eax)
    30dc:	08 00                	or     %al,(%eax)
    30de:	00 00                	add    %al,(%eax)
    30e0:	14 4f                	adc    $0x4f,%al
    30e2:	00 00                	add    %al,(%eax)
    30e4:	08 00                	or     %al,(%eax)
    30e6:	00 00                	add    %al,(%eax)
    30e8:	30 4f 00             	xor    %cl,0x0(%edi)
    30eb:	00 08                	add    %cl,(%eax)
    30ed:	00 00                	add    %al,(%eax)
    30ef:	00 34 4f             	add    %dh,(%edi,%ecx,2)
    30f2:	00 00                	add    %al,(%eax)
    30f4:	08 00                	or     %al,(%eax)
    30f6:	00 00                	add    %al,(%eax)
    30f8:	38 4f 00             	cmp    %cl,0x0(%edi)
    30fb:	00 08                	add    %cl,(%eax)
    30fd:	00 00                	add    %al,(%eax)
    30ff:	00 3c 4f             	add    %bh,(%edi,%ecx,2)
    3102:	00 00                	add    %al,(%eax)
    3104:	08 00                	or     %al,(%eax)
    3106:	00 00                	add    %al,(%eax)
    3108:	44                   	inc    %esp
    3109:	4f                   	dec    %edi
    310a:	00 00                	add    %al,(%eax)
    310c:	08 00                	or     %al,(%eax)
    310e:	00 00                	add    %al,(%eax)
    3110:	4c                   	dec    %esp
    3111:	4f                   	dec    %edi
    3112:	00 00                	add    %al,(%eax)
    3114:	08 00                	or     %al,(%eax)
    3116:	00 00                	add    %al,(%eax)
    3118:	54                   	push   %esp
    3119:	4f                   	dec    %edi
    311a:	00 00                	add    %al,(%eax)
    311c:	08 00                	or     %al,(%eax)
    311e:	00 00                	add    %al,(%eax)
    3120:	5c                   	pop    %esp
    3121:	4f                   	dec    %edi
    3122:	00 00                	add    %al,(%eax)
    3124:	08 00                	or     %al,(%eax)
    3126:	00 00                	add    %al,(%eax)
    3128:	64 4f                	fs dec %edi
    312a:	00 00                	add    %al,(%eax)
    312c:	08 00                	or     %al,(%eax)
    312e:	00 00                	add    %al,(%eax)
    3130:	04 50                	add    $0x50,%al
    3132:	00 00                	add    %al,(%eax)
    3134:	08 00                	or     %al,(%eax)
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
    3150:	34 ca                	xor    $0xca,%al
    3152:	ff                   	(bad)
    3153:	ff 2b                	ljmp   *(%ebx)
    3155:	ca ff ff             	lret   $0xffff
    3158:	2f                   	das
    3159:	ca ff ff             	lret   $0xffff
    315c:	34 ca                	xor    $0xca,%al
    315e:	ff                   	(bad)
    315f:	ff                   	(bad)
    3160:	3f                   	aas
    3161:	d0 ff                	sar    $1,%bh
    3163:	ff 43 cf             	incl   -0x31(%ebx)
    3166:	ff                   	(bad)
    3167:	ff                   	(bad)
    3168:	3a d0                	cmp    %al,%dl
    316a:	ff                   	(bad)
    316b:	ff 43 cf             	incl   -0x31(%ebx)
    316e:	ff                   	(bad)
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
    32d4:	69 62 29 3a 70 61 6e 	imul   $0x6e61703a,0x29(%edx),%esp
    32db:	69 63 6b 65 64 20 61 	imul   $0x61206465,0x6b(%ebx),%esp
    32e2:	74 20                	je     3304 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x194>
    32e4:	3a 0a                	cmp    (%edx),%cl
    32e6:	3a 20                	cmp    (%eax),%ah
    32e8:	20 20                	and    %ah,(%eax)
    32ea:	20 20                	and    %ah,(%eax)
    32ec:	57                   	push   %edi
    32ed:	41                   	inc    %ecx
    32ee:	52                   	push   %edx
    32ef:	4e                   	dec    %esi
    32f0:	49                   	dec    %ecx
    32f1:	4e                   	dec    %esi
    32f2:	46                   	inc    %esi
    32f3:	4f                   	dec    %edi
    32f4:	2c 0a                	sub    $0xa,%al
    32f6:	28 28                	sub    %ch,(%eax)
    32f8:	0a 30                	or     (%eax),%dh
    32fa:	30 30                	xor    %dh,(%eax)
    32fc:	31 30                	xor    %esi,(%eax)
    32fe:	32 30                	xor    (%eax),%dh
    3300:	33 30                	xor    (%eax),%esi
    3302:	34 30                	xor    $0x30,%al
    3304:	35 30 36 30 37       	xor    $0x37303630,%eax
    3309:	30 38                	xor    %bh,(%eax)
    330b:	30 39                	xor    %bh,(%ecx)
    330d:	31 30                	xor    %esi,(%eax)
    330f:	31 31                	xor    %esi,(%ecx)
    3311:	31 32                	xor    %esi,(%edx)
    3313:	31 33                	xor    %esi,(%ebx)
    3315:	31 34 31             	xor    %esi,(%ecx,%esi,1)
    3318:	35 31 36 31 37       	xor    $0x37313631,%eax
    331d:	31 38                	xor    %edi,(%eax)
    331f:	31 39                	xor    %edi,(%ecx)
    3321:	32 30                	xor    (%eax),%dh
    3323:	32 31                	xor    (%ecx),%dh
    3325:	32 32                	xor    (%edx),%dh
    3327:	32 33                	xor    (%ebx),%dh
    3329:	32 34 32             	xor    (%edx,%esi,1),%dh
    332c:	35 32 36 32 37       	xor    $0x37323632,%eax
    3331:	32 38                	xor    (%eax),%bh
    3333:	32 39                	xor    (%ecx),%bh
    3335:	33 30                	xor    (%eax),%esi
    3337:	33 31                	xor    (%ecx),%esi
    3339:	33 32                	xor    (%edx),%esi
    333b:	33 33                	xor    (%ebx),%esi
    333d:	33 34 33             	xor    (%ebx,%esi,1),%esi
    3340:	35 33 36 33 37       	xor    $0x37333633,%eax
    3345:	33 38                	xor    (%eax),%edi
    3347:	33 39                	xor    (%ecx),%edi
    3349:	34 30                	xor    $0x30,%al
    334b:	34 31                	xor    $0x31,%al
    334d:	34 32                	xor    $0x32,%al
    334f:	34 33                	xor    $0x33,%al
    3351:	34 34                	xor    $0x34,%al
    3353:	34 35                	xor    $0x35,%al
    3355:	34 36                	xor    $0x36,%al
    3357:	34 37                	xor    $0x37,%al
    3359:	34 38                	xor    $0x38,%al
    335b:	34 39                	xor    $0x39,%al
    335d:	35 30 35 31 35       	xor    $0x35313530,%eax
    3362:	32 35 33 35 34 35    	xor    0x35343533,%dh
    3368:	35 35 36 35 37       	xor    $0x37353635,%eax
    336d:	35 38 35 39 36       	xor    $0x36393538,%eax
    3372:	30 36                	xor    %dh,(%esi)
    3374:	31 36                	xor    %esi,(%esi)
    3376:	32 36                	xor    (%esi),%dh
    3378:	33 36                	xor    (%esi),%esi
    337a:	34 36                	xor    $0x36,%al
    337c:	35 36 36 36 37       	xor    $0x37363636,%eax
    3381:	36 38 36             	cmp    %dh,%ss:(%esi)
    3384:	39 37                	cmp    %esi,(%edi)
    3386:	30 37                	xor    %dh,(%edi)
    3388:	31 37                	xor    %esi,(%edi)
    338a:	32 37                	xor    (%edi),%dh
    338c:	33 37                	xor    (%edi),%esi
    338e:	34 37                	xor    $0x37,%al
    3390:	35 37 36 37 37       	xor    $0x37373637,%eax
    3395:	37                   	aaa
    3396:	38 37                	cmp    %dh,(%edi)
    3398:	39 38                	cmp    %edi,(%eax)
    339a:	30 38                	xor    %bh,(%eax)
    339c:	31 38                	xor    %edi,(%eax)
    339e:	32 38                	xor    (%eax),%bh
    33a0:	33 38                	xor    (%eax),%edi
    33a2:	34 38                	xor    $0x38,%al
    33a4:	35 38 36 38 37       	xor    $0x37383638,%eax
    33a9:	38 38                	cmp    %bh,(%eax)
    33ab:	38 39                	cmp    %bh,(%ecx)
    33ad:	39 30                	cmp    %esi,(%eax)
    33af:	39 31                	cmp    %esi,(%ecx)
    33b1:	39 32                	cmp    %esi,(%edx)
    33b3:	39 33                	cmp    %esi,(%ebx)
    33b5:	39 34 39             	cmp    %esi,(%ecx,%edi,1)
    33b8:	35 39 36 39 37       	xor    $0x37393639,%eax
    33bd:	39 38                	cmp    %edi,(%eax)
    33bf:	39 39                	cmp    %edi,(%ecx)
    33c1:	28 29                	sub    %ch,(%ecx)
    33c3:	63 61 6c             	arpl   %esp,0x6c(%ecx)
    33c6:	6c                   	insb   (%dx),%es:(%edi)
    33c7:	65 64 20 60 52       	gs and %ah,%fs:0x52(%eax)
    33cc:	65 73 75             	gs jae 3444 <__GNU_EH_FRAME_HDR+0x24>
    33cf:	6c                   	insb   (%dx),%es:(%edi)
    33d0:	74 3a                	je     340c <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x29c>
    33d2:	3a 75 6e             	cmp    0x6e(%ebp),%dh
    33d5:	77 72                	ja     3449 <__GNU_EH_FRAME_HDR+0x29>
    33d7:	61                   	popa
    33d8:	70 28                	jo     3402 <_ZN10kernel_lib7logging15LOGGER_INSTANCE17h62e9643a795e0696E+0x292>
    33da:	29 60 20             	sub    %esp,0x20(%eax)
    33dd:	6f                   	outsl  %ds:(%esi),(%dx)
    33de:	6e                   	outsb  %ds:(%esi),(%dx)
    33df:	20 61 6e             	and    %ah,0x6e(%ecx)
    33e2:	20 60 45             	and    %ah,0x45(%eax)
    33e5:	72 72                	jb     3459 <__GNU_EH_FRAME_HDR+0x39>
    33e7:	60                   	pusha
    33e8:	20 76 61             	and    %dh,0x61(%esi)
    33eb:	6c                   	insb   (%dx),%es:(%edi)
    33ec:	75 65                	jne    3453 <__GNU_EH_FRAME_HDR+0x33>
    33ee:	53                   	push   %ebx
    33ef:	65 74 4c             	gs je  343e <__GNU_EH_FRAME_HDR+0x1e>
    33f2:	6f                   	outsl  %ds:(%esi),(%dx)
    33f3:	67 67 65 72 45       	addr16 addr16 gs jb 343d <__GNU_EH_FRAME_HDR+0x1d>
    33f8:	72 72                	jb     346c <__GNU_EH_FRAME_HDR+0x4c>
    33fa:	6f                   	outsl  %ds:(%esi),(%dx)
    33fb:	72 61                	jb     345e <__GNU_EH_FRAME_HDR+0x3e>
    33fd:	74 61                	je     3460 <__GNU_EH_FRAME_HDR+0x40>
    33ff:	2f                   	das
    3400:	73 72                	jae    3474 <__GNU_EH_FRAME_HDR+0x54>
    3402:	63 2f                	arpl   %ebp,(%edi)
    3404:	6d                   	insl   (%dx),%es:(%edi)
    3405:	61                   	popa
    3406:	69 6e 2e 72 73 4f 46 	imul   $0x464f7372,0x2e(%esi),%ebp
    340d:	46                   	inc    %esi
    340e:	45                   	inc    %ebp
    340f:	52                   	push   %edx
    3410:	52                   	push   %edx
    3411:	4f                   	dec    %edi
    3412:	52                   	push   %edx
    3413:	44                   	inc    %esp
    3414:	45                   	inc    %ebp
    3415:	42                   	inc    %edx
    3416:	55                   	push   %ebp
    3417:	47                   	inc    %edi
    3418:	54                   	push   %esp
    3419:	52                   	push   %edx
    341a:	41                   	inc    %ecx
    341b:	43                   	inc    %ebx
    341c:	45                   	inc    %ebp

Disassembly of section .eh_frame_hdr:

00003420 <__GNU_EH_FRAME_HDR>:
    3420:	01 1b                	add    %ebx,(%ebx)
    3422:	ff                   	(bad)
    3423:	ff 08                	decl   (%eax)
    3425:	00 00                	add    %al,(%eax)
    3427:	00 00                	add    %al,(%eax)
    3429:	00 00                	add    %al,(%eax)
	...

Disassembly of section .data.rel.ro:

00004e6c <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE-0xd0>:
    4e6c:	90                   	nop
    4e6d:	13 00                	adc    (%eax),%eax
    4e6f:	00 04 01             	add    %al,(%ecx,%eax,1)
    4e72:	00 00                	add    %al,(%eax)
    4e74:	04 00                	add    $0x0,%al
    4e76:	00 00                	add    %al,(%eax)
    4e78:	90                   	nop
    4e79:	14 00                	adc    $0x0,%al
    4e7b:	00 20                	add    %ah,(%eax)
    4e7d:	12 00                	adc    (%eax),%al
    4e7f:	00 50 13             	add    %dl,0x13(%eax)
    4e82:	00 00                	add    %al,(%eax)
    4e84:	90                   	nop
    4e85:	13 00                	adc    (%eax),%eax
    4e87:	00 04 01             	add    %al,(%ecx,%eax,1)
    4e8a:	00 00                	add    %al,(%eax)
    4e8c:	04 00                	add    $0x0,%al
    4e8e:	00 00                	add    %al,(%eax)
    4e90:	a0 13 00 00 b0       	mov    0xb0000013,%al
    4e95:	13 00                	adc    (%eax),%eax
    4e97:	00 90 13 00 00 74    	add    %dl,0x74000013(%eax)
    4e9d:	32 00                	xor    (%eax),%al
    4e9f:	00 01                	add    %al,(%ecx)
    4ea1:	00 00                	add    %al,(%eax)
    4ea3:	00 75 32             	add    %dh,0x32(%ebp)
    4ea6:	00 00                	add    %al,(%eax)
    4ea8:	02 00                	add    (%eax),%al
    4eaa:	00 00                	add    %al,(%eax)
    4eac:	77 32                	ja     4ee0 <__GNU_EH_FRAME_HDR+0x1ac0>
    4eae:	00 00                	add    %al,(%eax)
    4eb0:	02 00                	add    (%eax),%al
    4eb2:	00 00                	add    %al,(%eax)
    4eb4:	79 32                	jns    4ee8 <__GNU_EH_FRAME_HDR+0x1ac8>
    4eb6:	00 00                	add    %al,(%eax)
    4eb8:	01 00                	add    %eax,(%eax)
    4eba:	00 00                	add    %al,(%eax)
    4ebc:	7a 32                	jp     4ef0 <__GNU_EH_FRAME_HDR+0x1ad0>
    4ebe:	00 00                	add    %al,(%eax)
    4ec0:	13 00                	adc    (%eax),%eax
    4ec2:	00 00                	add    %al,(%eax)
    4ec4:	01 00                	add    %eax,(%eax)
    4ec6:	00 00                	add    %al,(%eax)
    4ec8:	00 00                	add    %al,(%eax)
    4eca:	00 00                	add    %al,(%eax)
    4ecc:	d7                   	xlat   %ds:(%ebx)
    4ecd:	32 00                	xor    (%eax),%al
    4ecf:	00 01                	add    %al,(%ecx)
    4ed1:	00 00                	add    %al,(%eax)
    4ed3:	00 d7                	add    %dl,%bh
    4ed5:	32 00                	xor    (%eax),%al
    4ed7:	00 01                	add    %al,(%ecx)
    4ed9:	00 00                	add    %al,(%eax)
    4edb:	00 01                	add    %al,(%ecx)
    4edd:	00 00                	add    %al,(%eax)
    4edf:	00 00                	add    %al,(%eax)
    4ee1:	00 00                	add    %al,(%eax)
    4ee3:	00 e6                	add    %ah,%dh
    4ee5:	32 00                	xor    (%eax),%al
    4ee7:	00 02                	add    %al,(%edx)
    4ee9:	00 00                	add    %al,(%eax)
    4eeb:	00 00                	add    %al,(%eax)
    4eed:	00 00                	add    %al,(%eax)
    4eef:	00 0c 00             	add    %cl,(%eax,%eax,1)
    4ef2:	00 00                	add    %al,(%eax)
    4ef4:	04 00                	add    $0x0,%al
    4ef6:	00 00                	add    %al,(%eax)
    4ef8:	30 21                	xor    %ah,(%ecx)
    4efa:	00 00                	add    %al,(%eax)
    4efc:	90                   	nop
    4efd:	23 00                	and    (%eax),%eax
    4eff:	00 f0                	add    %dh,%al
    4f01:	23 00                	and    (%eax),%eax
	...
    4f0b:	00 01                	add    %al,(%ecx)
    4f0d:	00 00                	add    %al,(%eax)
    4f0f:	00 d0                	add    %dl,%al
    4f11:	24 00                	and    $0x0,%al
    4f13:	00 fc                	add    %bh,%ah
    4f15:	33 00                	xor    (%eax),%eax
    4f17:	00 0f                	add    %cl,(%edi)
    4f19:	00 00                	add    %al,(%eax)
    4f1b:	00 50 00             	add    %dl,0x0(%eax)
    4f1e:	00 00                	add    %al,(%eax)
    4f20:	21 00                	and    %eax,(%eax)
	...
    4f2a:	00 00                	add    %al,(%eax)
    4f2c:	01 00                	add    %eax,(%eax)
    4f2e:	00 00                	add    %al,(%eax)
    4f30:	40                   	inc    %eax
    4f31:	26 00 00             	add    %al,%es:(%eax)
    4f34:	50                   	push   %eax
    4f35:	26 00 00             	add    %al,%es:(%eax)
    4f38:	60                   	pusha
    4f39:	26 00 00             	add    %al,%es:(%eax)

00004f3c <_ZN3log15LOG_LEVEL_NAMES17h81396591d6178c5dE>:
    4f3c:	0b 34 00             	or     (%eax,%eax,1),%esi
    4f3f:	00 03                	add    %al,(%ebx)
    4f41:	00 00                	add    %al,(%eax)
    4f43:	00 0e                	add    %cl,(%esi)
    4f45:	34 00                	xor    $0x0,%al
    4f47:	00 05 00 00 00 ec    	add    %al,0xec000000
    4f4d:	32 00                	xor    (%eax),%al
    4f4f:	00 04 00             	add    %al,(%eax,%eax,1)
    4f52:	00 00                	add    %al,(%eax)
    4f54:	f0 32 00             	lock xor (%eax),%al
    4f57:	00 04 00             	add    %al,(%eax,%eax,1)
    4f5a:	00 00                	add    %al,(%eax)
    4f5c:	13 34 00             	adc    (%eax,%eax,1),%esi
    4f5f:	00 05 00 00 00 18    	add    %al,0x18000000
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
    4fa8:	f8                   	clc
    4fa9:	00 00                	add    %al,(%eax)
    4fab:	00 13                	add    %dl,(%ebx)
    4fad:	00 00                	add    %al,(%eax)
    4faf:	00 08                	add    %cl,(%eax)
    4fb1:	00 00                	add    %al,(%eax)
    4fb3:	00 1e                	add    %bl,(%esi)
    4fb5:	00 00                	add    %al,(%eax)
    4fb7:	00 08                	add    %cl,(%eax)
    4fb9:	00 00                	add    %al,(%eax)
    4fbb:	00 fb                	add    %bh,%bl
    4fbd:	ff                   	(bad)
    4fbe:	ff 6f 01             	ljmp   *0x1(%edi)
    4fc1:	00 00                	add    %al,(%eax)
    4fc3:	08 fa                	or     %bh,%dl
    4fc5:	ff                   	(bad)
    4fc6:	ff 6f 1f             	ljmp   *0x1f(%edi)
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
