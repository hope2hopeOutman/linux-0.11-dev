
kernel.o:     file format elf32-i386


Disassembly of section .text:

00000000 <sys_alarm>:
       0:	56                   	push   %esi
       1:	53                   	push   %ebx
       2:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
       6:	8b 35 00 00 00 00    	mov    0x0,%esi
       c:	8b 86 4c 02 00 00    	mov    0x24c(%esi),%eax
      12:	85 c0                	test   %eax,%eax
      14:	74 1b                	je     31 <sys_alarm+0x31>
      16:	8b 15 00 00 00 00    	mov    0x0,%edx
      1c:	29 d0                	sub    %edx,%eax
      1e:	89 c1                	mov    %eax,%ecx
      20:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
      25:	f7 ea                	imul   %edx
      27:	89 d0                	mov    %edx,%eax
      29:	c1 f8 05             	sar    $0x5,%eax
      2c:	c1 f9 1f             	sar    $0x1f,%ecx
      2f:	29 c8                	sub    %ecx,%eax
      31:	85 db                	test   %ebx,%ebx
      33:	7e 0d                	jle    42 <sys_alarm+0x42>
      35:	8b 15 00 00 00 00    	mov    0x0,%edx
      3b:	6b db 64             	imul   $0x64,%ebx,%ebx
      3e:	01 d3                	add    %edx,%ebx
      40:	eb 05                	jmp    47 <sys_alarm+0x47>
      42:	bb 00 00 00 00       	mov    $0x0,%ebx
      47:	89 9e 4c 02 00 00    	mov    %ebx,0x24c(%esi)
      4d:	5b                   	pop    %ebx
      4e:	5e                   	pop    %esi
      4f:	c3                   	ret    

00000050 <sys_getpid>:
      50:	a1 00 00 00 00       	mov    0x0,%eax
      55:	8b 80 2c 02 00 00    	mov    0x22c(%eax),%eax
      5b:	c3                   	ret    

0000005c <sys_getppid>:
      5c:	a1 00 00 00 00       	mov    0x0,%eax
      61:	8b 80 30 02 00 00    	mov    0x230(%eax),%eax
      67:	c3                   	ret    

00000068 <sys_getuid>:
      68:	a1 00 00 00 00       	mov    0x0,%eax
      6d:	0f b7 80 40 02 00 00 	movzwl 0x240(%eax),%eax
      74:	c3                   	ret    

00000075 <sys_geteuid>:
      75:	a1 00 00 00 00       	mov    0x0,%eax
      7a:	0f b7 80 42 02 00 00 	movzwl 0x242(%eax),%eax
      81:	c3                   	ret    

00000082 <sys_getgid>:
      82:	a1 00 00 00 00       	mov    0x0,%eax
      87:	0f b7 80 46 02 00 00 	movzwl 0x246(%eax),%eax
      8e:	c3                   	ret    

0000008f <sys_getegid>:
      8f:	a1 00 00 00 00       	mov    0x0,%eax
      94:	0f b7 80 48 02 00 00 	movzwl 0x248(%eax),%eax
      9b:	c3                   	ret    

0000009c <sys_nice>:
      9c:	8b 15 00 00 00 00    	mov    0x0,%edx
      a2:	8b 42 08             	mov    0x8(%edx),%eax
      a5:	2b 44 24 04          	sub    0x4(%esp),%eax
      a9:	85 c0                	test   %eax,%eax
      ab:	7e 03                	jle    b0 <sys_nice+0x14>
      ad:	89 42 08             	mov    %eax,0x8(%edx)
      b0:	b8 00 00 00 00       	mov    $0x0,%eax
      b5:	c3                   	ret    

000000b6 <show_task>:
      b6:	53                   	push   %ebx
      b7:	83 ec 08             	sub    $0x8,%esp
      ba:	8b 5c 24 14          	mov    0x14(%esp),%ebx
      be:	ff 33                	pushl  (%ebx)
      c0:	ff b3 2c 02 00 00    	pushl  0x22c(%ebx)
      c6:	ff 74 24 18          	pushl  0x18(%esp)
      ca:	68 00 00 00 00       	push   $0x0
      cf:	e8 fc ff ff ff       	call   d0 <show_task+0x1a>
      d4:	83 c4 10             	add    $0x10,%esp
      d7:	b8 01 00 00 00       	mov    $0x1,%eax
      dc:	80 bb bc 03 00 00 00 	cmpb   $0x0,0x3bc(%ebx)
      e3:	74 11                	je     f6 <show_task+0x40>
      e5:	b8 00 00 00 00       	mov    $0x0,%eax
      ea:	eb 14                	jmp    100 <show_task+0x4a>
      ec:	83 c0 01             	add    $0x1,%eax
      ef:	3d 44 0c 00 00       	cmp    $0xc44,%eax
      f4:	74 0a                	je     100 <show_task+0x4a>
      f6:	80 bc 03 bc 03 00 00 	cmpb   $0x0,0x3bc(%ebx,%eax,1)
      fd:	00 
      fe:	74 ec                	je     ec <show_task+0x36>
     100:	83 ec 04             	sub    $0x4,%esp
     103:	68 44 0c 00 00       	push   $0xc44
     108:	50                   	push   %eax
     109:	68 00 00 00 00       	push   $0x0
     10e:	e8 fc ff ff ff       	call   10f <show_task+0x59>
     113:	83 c4 18             	add    $0x18,%esp
     116:	5b                   	pop    %ebx
     117:	c3                   	ret    

00000118 <show_stat>:
     118:	53                   	push   %ebx
     119:	83 ec 08             	sub    $0x8,%esp
     11c:	bb 00 00 00 00       	mov    $0x0,%ebx
     121:	8b 04 9d 00 00 00 00 	mov    0x0(,%ebx,4),%eax
     128:	85 c0                	test   %eax,%eax
     12a:	74 0d                	je     139 <show_stat+0x21>
     12c:	83 ec 08             	sub    $0x8,%esp
     12f:	50                   	push   %eax
     130:	53                   	push   %ebx
     131:	e8 fc ff ff ff       	call   132 <show_stat+0x1a>
     136:	83 c4 10             	add    $0x10,%esp
     139:	83 c3 01             	add    $0x1,%ebx
     13c:	83 fb 40             	cmp    $0x40,%ebx
     13f:	75 e0                	jne    121 <show_stat+0x9>
     141:	83 c4 08             	add    $0x8,%esp
     144:	5b                   	pop    %ebx
     145:	c3                   	ret    

00000146 <math_state_restore>:
     146:	8b 15 00 00 00 00    	mov    0x0,%edx
     14c:	a1 00 00 00 00       	mov    0x0,%eax
     151:	39 c2                	cmp    %eax,%edx
     153:	74 2c                	je     181 <math_state_restore+0x3b>
     155:	9b                   	fwait
     156:	85 d2                	test   %edx,%edx
     158:	74 06                	je     160 <math_state_restore+0x1a>
     15a:	dd b2 50 03 00 00    	fnsave 0x350(%edx)
     160:	a3 00 00 00 00       	mov    %eax,0x0
     165:	66 83 b8 64 02 00 00 	cmpw   $0x0,0x264(%eax)
     16c:	00 
     16d:	74 07                	je     176 <math_state_restore+0x30>
     16f:	dd a0 50 03 00 00    	frstor 0x350(%eax)
     175:	c3                   	ret    
     176:	db e3                	fninit 
     178:	66 c7 80 64 02 00 00 	movw   $0x1,0x264(%eax)
     17f:	01 00 
     181:	f3 c3                	repz ret 

00000183 <schedule>:
     183:	53                   	push   %ebx
     184:	83 ec 10             	sub    $0x10,%esp
     187:	ba fc 00 00 00       	mov    $0xfc,%edx
     18c:	8b 02                	mov    (%edx),%eax
     18e:	85 c0                	test   %eax,%eax
     190:	74 46                	je     1d8 <schedule+0x55>
     192:	8b 88 4c 02 00 00    	mov    0x24c(%eax),%ecx
     198:	85 c9                	test   %ecx,%ecx
     19a:	74 1d                	je     1b9 <schedule+0x36>
     19c:	8b 1d 00 00 00 00    	mov    0x0,%ebx
     1a2:	39 d9                	cmp    %ebx,%ecx
     1a4:	7d 13                	jge    1b9 <schedule+0x36>
     1a6:	81 48 0c 00 20 00 00 	orl    $0x2000,0xc(%eax)
     1ad:	8b 02                	mov    (%edx),%eax
     1af:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
     1b6:	00 00 00 
     1b9:	8b 0a                	mov    (%edx),%ecx
     1bb:	8b 81 10 02 00 00    	mov    0x210(%ecx),%eax
     1c1:	25 ff fe fb ff       	and    $0xfffbfeff,%eax
     1c6:	f7 d0                	not    %eax
     1c8:	85 41 0c             	test   %eax,0xc(%ecx)
     1cb:	74 0b                	je     1d8 <schedule+0x55>
     1cd:	83 39 01             	cmpl   $0x1,(%ecx)
     1d0:	75 06                	jne    1d8 <schedule+0x55>
     1d2:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
     1d8:	83 ea 04             	sub    $0x4,%edx
     1db:	81 fa 00 00 00 00    	cmp    $0x0,%edx
     1e1:	75 a9                	jne    18c <schedule+0x9>
     1e3:	b8 3f 00 00 00       	mov    $0x3f,%eax
     1e8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
     1ed:	bb 00 00 00 00       	mov    $0x0,%ebx
     1f2:	8b 14 85 00 00 00 00 	mov    0x0(,%eax,4),%edx
     1f9:	85 d2                	test   %edx,%edx
     1fb:	74 10                	je     20d <schedule+0x8a>
     1fd:	83 3a 00             	cmpl   $0x0,(%edx)
     200:	75 0b                	jne    20d <schedule+0x8a>
     202:	8b 52 04             	mov    0x4(%edx),%edx
     205:	39 ca                	cmp    %ecx,%edx
     207:	7e 04                	jle    20d <schedule+0x8a>
     209:	89 d1                	mov    %edx,%ecx
     20b:	89 c3                	mov    %eax,%ebx
     20d:	83 e8 01             	sub    $0x1,%eax
     210:	75 e0                	jne    1f2 <schedule+0x6f>
     212:	85 c9                	test   %ecx,%ecx
     214:	75 23                	jne    239 <schedule+0xb6>
     216:	b9 fc 00 00 00       	mov    $0xfc,%ecx
     21b:	8b 11                	mov    (%ecx),%edx
     21d:	85 d2                	test   %edx,%edx
     21f:	74 0b                	je     22c <schedule+0xa9>
     221:	8b 42 04             	mov    0x4(%edx),%eax
     224:	d1 f8                	sar    %eax
     226:	03 42 08             	add    0x8(%edx),%eax
     229:	89 42 04             	mov    %eax,0x4(%edx)
     22c:	83 e9 04             	sub    $0x4,%ecx
     22f:	81 f9 00 00 00 00    	cmp    $0x0,%ecx
     235:	75 e4                	jne    21b <schedule+0x98>
     237:	eb aa                	jmp    1e3 <schedule+0x60>
     239:	89 da                	mov    %ebx,%edx
     23b:	c1 e2 04             	shl    $0x4,%edx
     23e:	83 c2 20             	add    $0x20,%edx
     241:	8b 0c 9d 00 00 00 00 	mov    0x0(,%ebx,4),%ecx
     248:	39 0d 00 00 00 00    	cmp    %ecx,0x0
     24e:	74 19                	je     269 <schedule+0xe6>
     250:	66 89 54 24 0c       	mov    %dx,0xc(%esp)
     255:	87 0d 00 00 00 00    	xchg   %ecx,0x0
     25b:	ff 6c 24 08          	ljmp   *0x8(%esp)
     25f:	39 0d 00 00 00 00    	cmp    %ecx,0x0
     265:	75 02                	jne    269 <schedule+0xe6>
     267:	0f 06                	clts   
     269:	83 c4 10             	add    $0x10,%esp
     26c:	5b                   	pop    %ebx
     26d:	c3                   	ret    

0000026e <sys_pause>:
     26e:	a1 00 00 00 00       	mov    0x0,%eax
     273:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
     279:	e8 fc ff ff ff       	call   27a <sys_pause+0xc>
     27e:	b8 00 00 00 00       	mov    $0x0,%eax
     283:	c3                   	ret    

00000284 <sleep_on>:
     284:	56                   	push   %esi
     285:	53                   	push   %ebx
     286:	83 ec 04             	sub    $0x4,%esp
     289:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     28d:	85 db                	test   %ebx,%ebx
     28f:	74 3f                	je     2d0 <sleep_on+0x4c>
     291:	81 3d 00 00 00 00 40 	cmpl   $0x140,0x0
     298:	01 00 00 
     29b:	75 10                	jne    2ad <sleep_on+0x29>
     29d:	83 ec 0c             	sub    $0xc,%esp
     2a0:	68 17 00 00 00       	push   $0x17
     2a5:	e8 fc ff ff ff       	call   2a6 <sleep_on+0x22>
     2aa:	83 c4 10             	add    $0x10,%esp
     2ad:	8b 33                	mov    (%ebx),%esi
     2af:	a1 00 00 00 00       	mov    0x0,%eax
     2b4:	89 03                	mov    %eax,(%ebx)
     2b6:	a1 00 00 00 00       	mov    0x0,%eax
     2bb:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     2c1:	e8 fc ff ff ff       	call   2c2 <sleep_on+0x3e>
     2c6:	85 f6                	test   %esi,%esi
     2c8:	74 06                	je     2d0 <sleep_on+0x4c>
     2ca:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     2d0:	83 c4 04             	add    $0x4,%esp
     2d3:	5b                   	pop    %ebx
     2d4:	5e                   	pop    %esi
     2d5:	c3                   	ret    

000002d6 <interruptible_sleep_on>:
     2d6:	56                   	push   %esi
     2d7:	53                   	push   %ebx
     2d8:	83 ec 04             	sub    $0x4,%esp
     2db:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     2df:	85 db                	test   %ebx,%ebx
     2e1:	74 57                	je     33a <interruptible_sleep_on+0x64>
     2e3:	81 3d 00 00 00 00 40 	cmpl   $0x140,0x0
     2ea:	01 00 00 
     2ed:	75 10                	jne    2ff <interruptible_sleep_on+0x29>
     2ef:	83 ec 0c             	sub    $0xc,%esp
     2f2:	68 17 00 00 00       	push   $0x17
     2f7:	e8 fc ff ff ff       	call   2f8 <interruptible_sleep_on+0x22>
     2fc:	83 c4 10             	add    $0x10,%esp
     2ff:	8b 33                	mov    (%ebx),%esi
     301:	a1 00 00 00 00       	mov    0x0,%eax
     306:	89 03                	mov    %eax,(%ebx)
     308:	a1 00 00 00 00       	mov    0x0,%eax
     30d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
     313:	e8 fc ff ff ff       	call   314 <interruptible_sleep_on+0x3e>
     318:	8b 03                	mov    (%ebx),%eax
     31a:	85 c0                	test   %eax,%eax
     31c:	74 10                	je     32e <interruptible_sleep_on+0x58>
     31e:	3b 05 00 00 00 00    	cmp    0x0,%eax
     324:	74 08                	je     32e <interruptible_sleep_on+0x58>
     326:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     32c:	eb da                	jmp    308 <interruptible_sleep_on+0x32>
     32e:	89 33                	mov    %esi,(%ebx)
     330:	85 f6                	test   %esi,%esi
     332:	74 06                	je     33a <interruptible_sleep_on+0x64>
     334:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     33a:	83 c4 04             	add    $0x4,%esp
     33d:	5b                   	pop    %ebx
     33e:	5e                   	pop    %esi
     33f:	c3                   	ret    

00000340 <wake_up>:
     340:	8b 44 24 04          	mov    0x4(%esp),%eax
     344:	85 c0                	test   %eax,%eax
     346:	74 0c                	je     354 <wake_up+0x14>
     348:	8b 00                	mov    (%eax),%eax
     34a:	85 c0                	test   %eax,%eax
     34c:	74 06                	je     354 <wake_up+0x14>
     34e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     354:	f3 c3                	repz ret 

00000356 <ticks_to_floppy_on>:
     356:	56                   	push   %esi
     357:	53                   	push   %ebx
     358:	83 ec 04             	sub    $0x4,%esp
     35b:	8b 74 24 10          	mov    0x10(%esp),%esi
     35f:	b8 10 00 00 00       	mov    $0x10,%eax
     364:	89 f1                	mov    %esi,%ecx
     366:	d3 e0                	shl    %cl,%eax
     368:	89 c3                	mov    %eax,%ebx
     36a:	83 fe 03             	cmp    $0x3,%esi
     36d:	76 10                	jbe    37f <ticks_to_floppy_on+0x29>
     36f:	83 ec 0c             	sub    $0xc,%esp
     372:	68 2f 00 00 00       	push   $0x2f
     377:	e8 fc ff ff ff       	call   378 <ticks_to_floppy_on+0x22>
     37c:	83 c4 10             	add    $0x10,%esp
     37f:	c7 04 b5 20 03 00 00 	movl   $0x2710,0x320(,%esi,4)
     386:	10 27 00 00 
     38a:	fa                   	cli    
     38b:	0f b6 0d 00 00 00 00 	movzbl 0x0,%ecx
     392:	89 d8                	mov    %ebx,%eax
     394:	09 c8                	or     %ecx,%eax
     396:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0
     39d:	75 05                	jne    3a4 <ticks_to_floppy_on+0x4e>
     39f:	83 e0 fc             	and    $0xfffffffc,%eax
     3a2:	09 f0                	or     %esi,%eax
     3a4:	38 c8                	cmp    %cl,%al
     3a6:	74 34                	je     3dc <ticks_to_floppy_on+0x86>
     3a8:	ba f2 03 00 00       	mov    $0x3f2,%edx
     3ad:	ee                   	out    %al,(%dx)
     3ae:	31 c1                	xor    %eax,%ecx
     3b0:	f6 c1 f0             	test   $0xf0,%cl
     3b3:	74 0d                	je     3c2 <ticks_to_floppy_on+0x6c>
     3b5:	c7 04 b5 30 03 00 00 	movl   $0x32,0x330(,%esi,4)
     3bc:	32 00 00 00 
     3c0:	eb 15                	jmp    3d7 <ticks_to_floppy_on+0x81>
     3c2:	83 3c b5 30 03 00 00 	cmpl   $0x1,0x330(,%esi,4)
     3c9:	01 
     3ca:	7f 0b                	jg     3d7 <ticks_to_floppy_on+0x81>
     3cc:	c7 04 b5 30 03 00 00 	movl   $0x2,0x330(,%esi,4)
     3d3:	02 00 00 00 
     3d7:	a2 00 00 00 00       	mov    %al,0x0
     3dc:	fb                   	sti    
     3dd:	8b 04 b5 30 03 00 00 	mov    0x330(,%esi,4),%eax
     3e4:	83 c4 04             	add    $0x4,%esp
     3e7:	5b                   	pop    %ebx
     3e8:	5e                   	pop    %esi
     3e9:	c3                   	ret    

000003ea <floppy_on>:
     3ea:	56                   	push   %esi
     3eb:	53                   	push   %ebx
     3ec:	83 ec 04             	sub    $0x4,%esp
     3ef:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     3f3:	fa                   	cli    
     3f4:	8d 34 9d 40 03 00 00 	lea    0x340(,%ebx,4),%esi
     3fb:	eb 0c                	jmp    409 <floppy_on+0x1f>
     3fd:	83 ec 0c             	sub    $0xc,%esp
     400:	56                   	push   %esi
     401:	e8 fc ff ff ff       	call   402 <floppy_on+0x18>
     406:	83 c4 10             	add    $0x10,%esp
     409:	83 ec 0c             	sub    $0xc,%esp
     40c:	53                   	push   %ebx
     40d:	e8 fc ff ff ff       	call   40e <floppy_on+0x24>
     412:	83 c4 10             	add    $0x10,%esp
     415:	85 c0                	test   %eax,%eax
     417:	75 e4                	jne    3fd <floppy_on+0x13>
     419:	fb                   	sti    
     41a:	83 c4 04             	add    $0x4,%esp
     41d:	5b                   	pop    %ebx
     41e:	5e                   	pop    %esi
     41f:	c3                   	ret    

00000420 <floppy_off>:
     420:	8b 44 24 04          	mov    0x4(%esp),%eax
     424:	c7 04 85 20 03 00 00 	movl   $0x12c,0x320(,%eax,4)
     42b:	2c 01 00 00 
     42f:	c3                   	ret    

00000430 <do_floppy_timer>:
     430:	57                   	push   %edi
     431:	56                   	push   %esi
     432:	53                   	push   %ebx
     433:	bb 00 00 00 00       	mov    $0x0,%ebx
     438:	be 10 00 00 00       	mov    $0x10,%esi
     43d:	bf f2 03 00 00       	mov    $0x3f2,%edi
     442:	0f b6 05 00 00 00 00 	movzbl 0x0,%eax
     449:	89 f1                	mov    %esi,%ecx
     44b:	84 c8                	test   %cl,%al
     44d:	74 4b                	je     49a <do_floppy_timer+0x6a>
     44f:	8b 93 30 03 00 00    	mov    0x330(%ebx),%edx
     455:	85 d2                	test   %edx,%edx
     457:	74 1e                	je     477 <do_floppy_timer+0x47>
     459:	83 ea 01             	sub    $0x1,%edx
     45c:	89 93 30 03 00 00    	mov    %edx,0x330(%ebx)
     462:	85 d2                	test   %edx,%edx
     464:	75 34                	jne    49a <do_floppy_timer+0x6a>
     466:	8d 83 40 03 00 00    	lea    0x340(%ebx),%eax
     46c:	50                   	push   %eax
     46d:	e8 fc ff ff ff       	call   46e <do_floppy_timer+0x3e>
     472:	83 c4 04             	add    $0x4,%esp
     475:	eb 23                	jmp    49a <do_floppy_timer+0x6a>
     477:	8b 93 20 03 00 00    	mov    0x320(%ebx),%edx
     47d:	85 d2                	test   %edx,%edx
     47f:	75 10                	jne    491 <do_floppy_timer+0x61>
     481:	89 f2                	mov    %esi,%edx
     483:	f7 d2                	not    %edx
     485:	21 d0                	and    %edx,%eax
     487:	a2 00 00 00 00       	mov    %al,0x0
     48c:	89 fa                	mov    %edi,%edx
     48e:	ee                   	out    %al,(%dx)
     48f:	eb 09                	jmp    49a <do_floppy_timer+0x6a>
     491:	83 ea 01             	sub    $0x1,%edx
     494:	89 93 20 03 00 00    	mov    %edx,0x320(%ebx)
     49a:	01 f6                	add    %esi,%esi
     49c:	83 c3 04             	add    $0x4,%ebx
     49f:	83 fb 10             	cmp    $0x10,%ebx
     4a2:	75 9e                	jne    442 <do_floppy_timer+0x12>
     4a4:	5b                   	pop    %ebx
     4a5:	5e                   	pop    %esi
     4a6:	5f                   	pop    %edi
     4a7:	c3                   	ret    

000004a8 <add_timer>:
     4a8:	57                   	push   %edi
     4a9:	56                   	push   %esi
     4aa:	53                   	push   %ebx
     4ab:	8b 74 24 10          	mov    0x10(%esp),%esi
     4af:	8b 7c 24 14          	mov    0x14(%esp),%edi
     4b3:	85 ff                	test   %edi,%edi
     4b5:	0f 84 99 00 00 00    	je     554 <add_timer+0xac>
     4bb:	fa                   	cli    
     4bc:	85 f6                	test   %esi,%esi
     4be:	7e 14                	jle    4d4 <add_timer+0x2c>
     4c0:	83 3d 24 00 00 00 00 	cmpl   $0x0,0x24
     4c7:	0f 84 80 00 00 00    	je     54d <add_timer+0xa5>
     4cd:	bb 20 00 00 00       	mov    $0x20,%ebx
     4d2:	eb 0a                	jmp    4de <add_timer+0x36>
     4d4:	ff d7                	call   *%edi
     4d6:	eb 60                	jmp    538 <add_timer+0x90>
     4d8:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
     4dc:	74 0d                	je     4eb <add_timer+0x43>
     4de:	83 c3 0c             	add    $0xc,%ebx
     4e1:	81 fb 20 03 00 00    	cmp    $0x320,%ebx
     4e7:	75 ef                	jne    4d8 <add_timer+0x30>
     4e9:	eb 50                	jmp    53b <add_timer+0x93>
     4eb:	89 7b 04             	mov    %edi,0x4(%ebx)
     4ee:	89 33                	mov    %esi,(%ebx)
     4f0:	8b 15 0c 00 00 00    	mov    0xc,%edx
     4f6:	89 53 08             	mov    %edx,0x8(%ebx)
     4f9:	89 1d 0c 00 00 00    	mov    %ebx,0xc
     4ff:	85 d2                	test   %edx,%edx
     501:	74 35                	je     538 <add_timer+0x90>
     503:	8b 0a                	mov    (%edx),%ecx
     505:	39 ce                	cmp    %ecx,%esi
     507:	7e 2f                	jle    538 <add_timer+0x90>
     509:	89 f0                	mov    %esi,%eax
     50b:	29 c8                	sub    %ecx,%eax
     50d:	89 03                	mov    %eax,(%ebx)
     50f:	8b 43 04             	mov    0x4(%ebx),%eax
     512:	8b 4a 04             	mov    0x4(%edx),%ecx
     515:	89 4b 04             	mov    %ecx,0x4(%ebx)
     518:	89 42 04             	mov    %eax,0x4(%edx)
     51b:	8b 13                	mov    (%ebx),%edx
     51d:	8b 43 08             	mov    0x8(%ebx),%eax
     520:	8b 08                	mov    (%eax),%ecx
     522:	89 0b                	mov    %ecx,(%ebx)
     524:	89 10                	mov    %edx,(%eax)
     526:	8b 5b 08             	mov    0x8(%ebx),%ebx
     529:	8b 53 08             	mov    0x8(%ebx),%edx
     52c:	85 d2                	test   %edx,%edx
     52e:	74 08                	je     538 <add_timer+0x90>
     530:	8b 0a                	mov    (%edx),%ecx
     532:	8b 03                	mov    (%ebx),%eax
     534:	39 c1                	cmp    %eax,%ecx
     536:	7c d3                	jl     50b <add_timer+0x63>
     538:	fb                   	sti    
     539:	eb 19                	jmp    554 <add_timer+0xac>
     53b:	83 ec 0c             	sub    $0xc,%esp
     53e:	68 3f 00 00 00       	push   $0x3f
     543:	e8 fc ff ff ff       	call   544 <add_timer+0x9c>
     548:	83 c4 10             	add    $0x10,%esp
     54b:	eb 9e                	jmp    4eb <add_timer+0x43>
     54d:	bb 20 00 00 00       	mov    $0x20,%ebx
     552:	eb 97                	jmp    4eb <add_timer+0x43>
     554:	5b                   	pop    %ebx
     555:	5e                   	pop    %esi
     556:	5f                   	pop    %edi
     557:	c3                   	ret    

00000558 <do_timer>:
     558:	53                   	push   %ebx
     559:	83 ec 08             	sub    $0x8,%esp
     55c:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     560:	a1 00 00 00 00       	mov    0x0,%eax
     565:	85 c0                	test   %eax,%eax
     567:	74 11                	je     57a <do_timer+0x22>
     569:	83 e8 01             	sub    $0x1,%eax
     56c:	a3 00 00 00 00       	mov    %eax,0x0
     571:	85 c0                	test   %eax,%eax
     573:	75 05                	jne    57a <do_timer+0x22>
     575:	e8 fc ff ff ff       	call   576 <do_timer+0x1e>
     57a:	85 db                	test   %ebx,%ebx
     57c:	74 0e                	je     58c <do_timer+0x34>
     57e:	a1 00 00 00 00       	mov    0x0,%eax
     583:	83 80 50 02 00 00 01 	addl   $0x1,0x250(%eax)
     58a:	eb 0c                	jmp    598 <do_timer+0x40>
     58c:	a1 00 00 00 00       	mov    0x0,%eax
     591:	83 80 54 02 00 00 01 	addl   $0x1,0x254(%eax)
     598:	a1 0c 00 00 00       	mov    0xc,%eax
     59d:	85 c0                	test   %eax,%eax
     59f:	74 2d                	je     5ce <do_timer+0x76>
     5a1:	8b 08                	mov    (%eax),%ecx
     5a3:	8d 51 ff             	lea    -0x1(%ecx),%edx
     5a6:	89 10                	mov    %edx,(%eax)
     5a8:	85 d2                	test   %edx,%edx
     5aa:	7f 22                	jg     5ce <do_timer+0x76>
     5ac:	8b 50 04             	mov    0x4(%eax),%edx
     5af:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     5b6:	8b 40 08             	mov    0x8(%eax),%eax
     5b9:	a3 0c 00 00 00       	mov    %eax,0xc
     5be:	ff d2                	call   *%edx
     5c0:	a1 0c 00 00 00       	mov    0xc,%eax
     5c5:	85 c0                	test   %eax,%eax
     5c7:	74 05                	je     5ce <do_timer+0x76>
     5c9:	83 38 00             	cmpl   $0x0,(%eax)
     5cc:	7e de                	jle    5ac <do_timer+0x54>
     5ce:	f6 05 00 00 00 00 f0 	testb  $0xf0,0x0
     5d5:	74 05                	je     5dc <do_timer+0x84>
     5d7:	e8 fc ff ff ff       	call   5d8 <do_timer+0x80>
     5dc:	8b 15 00 00 00 00    	mov    0x0,%edx
     5e2:	8b 42 04             	mov    0x4(%edx),%eax
     5e5:	83 e8 01             	sub    $0x1,%eax
     5e8:	85 c0                	test   %eax,%eax
     5ea:	7e 05                	jle    5f1 <do_timer+0x99>
     5ec:	89 42 04             	mov    %eax,0x4(%edx)
     5ef:	eb 10                	jmp    601 <do_timer+0xa9>
     5f1:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
     5f8:	85 db                	test   %ebx,%ebx
     5fa:	74 05                	je     601 <do_timer+0xa9>
     5fc:	e8 fc ff ff ff       	call   5fd <do_timer+0xa5>
     601:	83 c4 08             	add    $0x8,%esp
     604:	5b                   	pop    %ebx
     605:	c3                   	ret    

00000606 <sched_init>:
     606:	b8 28 04 00 00       	mov    $0x428,%eax
     60b:	66 c7 05 20 00 00 00 	movw   $0x68,0x20
     612:	68 00 
     614:	66 a3 22 00 00 00    	mov    %ax,0x22
     61a:	c1 c8 10             	ror    $0x10,%eax
     61d:	a2 24 00 00 00       	mov    %al,0x24
     622:	c6 05 25 00 00 00 89 	movb   $0x89,0x25
     629:	c6 05 26 00 00 00 00 	movb   $0x0,0x26
     630:	88 25 27 00 00 00    	mov    %ah,0x27
     636:	c1 c8 10             	ror    $0x10,%eax
     639:	b8 10 04 00 00       	mov    $0x410,%eax
     63e:	66 c7 05 28 00 00 00 	movw   $0x68,0x28
     645:	68 00 
     647:	66 a3 2a 00 00 00    	mov    %ax,0x2a
     64d:	c1 c8 10             	ror    $0x10,%eax
     650:	a2 2c 00 00 00       	mov    %al,0x2c
     655:	c6 05 2d 00 00 00 82 	movb   $0x82,0x2d
     65c:	c6 05 2e 00 00 00 00 	movb   $0x0,0x2e
     663:	88 25 2f 00 00 00    	mov    %ah,0x2f
     669:	c1 c8 10             	ror    $0x10,%eax
     66c:	ba 04 00 00 00       	mov    $0x4,%edx
     671:	b8 30 00 00 00       	mov    $0x30,%eax
     676:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
     67c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     683:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     689:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
     690:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     697:	83 c0 10             	add    $0x10,%eax
     69a:	83 c2 04             	add    $0x4,%edx
     69d:	3d 20 04 00 00       	cmp    $0x420,%eax
     6a2:	75 d2                	jne    676 <sched_init+0x70>
     6a4:	9c                   	pushf  
     6a5:	81 24 24 ff bf ff ff 	andl   $0xffffbfff,(%esp)
     6ac:	9d                   	popf   
     6ad:	b8 20 00 00 00       	mov    $0x20,%eax
     6b2:	0f 00 d8             	ltr    %ax
     6b5:	b8 28 00 00 00       	mov    $0x28,%eax
     6ba:	0f 00 d0             	lldt   %ax
     6bd:	ba 43 00 00 00       	mov    $0x43,%edx
     6c2:	b8 36 00 00 00       	mov    $0x36,%eax
     6c7:	ee                   	out    %al,(%dx)
     6c8:	eb 00                	jmp    6ca <sched_init+0xc4>
     6ca:	eb 00                	jmp    6cc <sched_init+0xc6>
     6cc:	ba 40 00 00 00       	mov    $0x40,%edx
     6d1:	b8 9b 00 00 00       	mov    $0x9b,%eax
     6d6:	ee                   	out    %al,(%dx)
     6d7:	eb 00                	jmp    6d9 <sched_init+0xd3>
     6d9:	eb 00                	jmp    6db <sched_init+0xd5>
     6db:	b8 2e 00 00 00       	mov    $0x2e,%eax
     6e0:	ee                   	out    %al,(%dx)
     6e1:	b8 00 00 08 00       	mov    $0x80000,%eax
     6e6:	ba 00 00 00 00       	mov    $0x0,%edx
     6eb:	66 89 d0             	mov    %dx,%ax
     6ee:	66 ba 00 8e          	mov    $0x8e00,%dx
     6f2:	a3 00 01 00 00       	mov    %eax,0x100
     6f7:	89 15 04 01 00 00    	mov    %edx,0x104
     6fd:	ba 21 00 00 00       	mov    $0x21,%edx
     702:	ec                   	in     (%dx),%al
     703:	eb 00                	jmp    705 <sched_init+0xff>
     705:	eb 00                	jmp    707 <sched_init+0x101>
     707:	25 fe 00 00 00       	and    $0xfe,%eax
     70c:	ee                   	out    %al,(%dx)
     70d:	b8 00 00 08 00       	mov    $0x80000,%eax
     712:	ba 00 00 00 00       	mov    $0x0,%edx
     717:	66 89 d0             	mov    %dx,%ax
     71a:	66 ba 00 ef          	mov    $0xef00,%dx
     71e:	a3 00 04 00 00       	mov    %eax,0x400
     723:	89 15 04 04 00 00    	mov    %edx,0x404
     729:	c3                   	ret    
     72a:	66 90                	xchg   %ax,%ax
     72c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     731:	cf                   	iret   
     732:	66 90                	xchg   %ax,%ax
     734:	68 74 07 00 00       	push   $0x774
     739:	e9 fc ff ff ff       	jmp    73a <sched_init+0x134>
     73e:	66 90                	xchg   %ax,%ax

00000740 <system_call>:
     740:	83 f8 47             	cmp    $0x47,%eax
     743:	77 e7                	ja     72c <sched_init+0x126>
     745:	1e                   	push   %ds
     746:	06                   	push   %es
     747:	0f a0                	push   %fs
     749:	52                   	push   %edx
     74a:	51                   	push   %ecx
     74b:	53                   	push   %ebx
     74c:	ba 10 00 00 00       	mov    $0x10,%edx
     751:	8e da                	mov    %edx,%ds
     753:	8e c2                	mov    %edx,%es
     755:	ba 17 00 00 00       	mov    $0x17,%edx
     75a:	8e e2                	mov    %edx,%fs
     75c:	ff 14 85 00 00 00 00 	call   *0x0(,%eax,4)
     763:	50                   	push   %eax
     764:	a1 00 00 00 00       	mov    0x0,%eax
     769:	83 38 00             	cmpl   $0x0,(%eax)
     76c:	75 c6                	jne    734 <sched_init+0x12e>
     76e:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
     772:	74 c0                	je     734 <sched_init+0x12e>
     774:	a1 00 00 00 00       	mov    0x0,%eax
     779:	3b 05 00 00 00 00    	cmp    0x0,%eax
     77f:	74 30                	je     7b1 <system_call+0x71>
     781:	66 83 7c 24 20 0f    	cmpw   $0xf,0x20(%esp)
     787:	75 28                	jne    7b1 <system_call+0x71>
     789:	66 83 7c 24 2c 17    	cmpw   $0x17,0x2c(%esp)
     78f:	75 20                	jne    7b1 <system_call+0x71>
     791:	8b 58 0c             	mov    0xc(%eax),%ebx
     794:	8b 88 10 02 00 00    	mov    0x210(%eax),%ecx
     79a:	f7 d1                	not    %ecx
     79c:	21 d9                	and    %ebx,%ecx
     79e:	0f bc c9             	bsf    %ecx,%ecx
     7a1:	74 0e                	je     7b1 <system_call+0x71>
     7a3:	0f b3 cb             	btr    %ecx,%ebx
     7a6:	89 58 0c             	mov    %ebx,0xc(%eax)
     7a9:	41                   	inc    %ecx
     7aa:	51                   	push   %ecx
     7ab:	e8 fc ff ff ff       	call   7ac <system_call+0x6c>
     7b0:	58                   	pop    %eax
     7b1:	58                   	pop    %eax
     7b2:	5b                   	pop    %ebx
     7b3:	59                   	pop    %ecx
     7b4:	5a                   	pop    %edx
     7b5:	0f a1                	pop    %fs
     7b7:	07                   	pop    %es
     7b8:	1f                   	pop    %ds
     7b9:	cf                   	iret   
     7ba:	66 90                	xchg   %ax,%ax

000007bc <coprocessor_error>:
     7bc:	1e                   	push   %ds
     7bd:	06                   	push   %es
     7be:	0f a0                	push   %fs
     7c0:	52                   	push   %edx
     7c1:	51                   	push   %ecx
     7c2:	53                   	push   %ebx
     7c3:	50                   	push   %eax
     7c4:	b8 10 00 00 00       	mov    $0x10,%eax
     7c9:	8e d8                	mov    %eax,%ds
     7cb:	8e c0                	mov    %eax,%es
     7cd:	b8 17 00 00 00       	mov    $0x17,%eax
     7d2:	8e e0                	mov    %eax,%fs
     7d4:	68 74 07 00 00       	push   $0x774
     7d9:	e9 fc ff ff ff       	jmp    7da <coprocessor_error+0x1e>
     7de:	66 90                	xchg   %ax,%ax

000007e0 <device_not_available>:
     7e0:	1e                   	push   %ds
     7e1:	06                   	push   %es
     7e2:	0f a0                	push   %fs
     7e4:	52                   	push   %edx
     7e5:	51                   	push   %ecx
     7e6:	53                   	push   %ebx
     7e7:	50                   	push   %eax
     7e8:	b8 10 00 00 00       	mov    $0x10,%eax
     7ed:	8e d8                	mov    %eax,%ds
     7ef:	8e c0                	mov    %eax,%es
     7f1:	b8 17 00 00 00       	mov    $0x17,%eax
     7f6:	8e e0                	mov    %eax,%fs
     7f8:	68 74 07 00 00       	push   $0x774
     7fd:	0f 06                	clts   
     7ff:	0f 20 c0             	mov    %cr0,%eax
     802:	a9 04 00 00 00       	test   $0x4,%eax
     807:	0f 84 fc ff ff ff    	je     809 <device_not_available+0x29>
     80d:	55                   	push   %ebp
     80e:	56                   	push   %esi
     80f:	57                   	push   %edi
     810:	e8 fc ff ff ff       	call   811 <device_not_available+0x31>
     815:	5f                   	pop    %edi
     816:	5e                   	pop    %esi
     817:	5d                   	pop    %ebp
     818:	c3                   	ret    
     819:	8d 76 00             	lea    0x0(%esi),%esi

0000081c <timer_interrupt>:
     81c:	1e                   	push   %ds
     81d:	06                   	push   %es
     81e:	0f a0                	push   %fs
     820:	52                   	push   %edx
     821:	51                   	push   %ecx
     822:	53                   	push   %ebx
     823:	50                   	push   %eax
     824:	b8 10 00 00 00       	mov    $0x10,%eax
     829:	8e d8                	mov    %eax,%ds
     82b:	8e c0                	mov    %eax,%es
     82d:	b8 17 00 00 00       	mov    $0x17,%eax
     832:	8e e0                	mov    %eax,%fs
     834:	ff 05 00 00 00 00    	incl   0x0
     83a:	b0 20                	mov    $0x20,%al
     83c:	e6 20                	out    %al,$0x20
     83e:	8b 44 24 20          	mov    0x20(%esp),%eax
     842:	83 e0 03             	and    $0x3,%eax
     845:	50                   	push   %eax
     846:	e8 fc ff ff ff       	call   847 <timer_interrupt+0x2b>
     84b:	83 c4 04             	add    $0x4,%esp
     84e:	e9 21 ff ff ff       	jmp    774 <system_call+0x34>
     853:	90                   	nop

00000854 <sys_execve>:
     854:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     858:	50                   	push   %eax
     859:	e8 fc ff ff ff       	call   85a <sys_execve+0x6>
     85e:	83 c4 04             	add    $0x4,%esp
     861:	c3                   	ret    
     862:	66 90                	xchg   %ax,%ax

00000864 <sys_fork>:
     864:	e8 fc ff ff ff       	call   865 <sys_fork+0x1>
     869:	85 c0                	test   %eax,%eax
     86b:	78 0e                	js     87b <sys_fork+0x17>
     86d:	0f a8                	push   %gs
     86f:	56                   	push   %esi
     870:	57                   	push   %edi
     871:	55                   	push   %ebp
     872:	50                   	push   %eax
     873:	e8 fc ff ff ff       	call   874 <sys_fork+0x10>
     878:	83 c4 14             	add    $0x14,%esp
     87b:	c3                   	ret    

0000087c <hd_interrupt>:
     87c:	50                   	push   %eax
     87d:	51                   	push   %ecx
     87e:	52                   	push   %edx
     87f:	1e                   	push   %ds
     880:	06                   	push   %es
     881:	0f a0                	push   %fs
     883:	b8 10 00 00 00       	mov    $0x10,%eax
     888:	8e d8                	mov    %eax,%ds
     88a:	8e c0                	mov    %eax,%es
     88c:	b8 17 00 00 00       	mov    $0x17,%eax
     891:	8e e0                	mov    %eax,%fs
     893:	b0 20                	mov    $0x20,%al
     895:	e6 a0                	out    %al,$0xa0
     897:	eb 00                	jmp    899 <hd_interrupt+0x1d>
     899:	eb 00                	jmp    89b <hd_interrupt+0x1f>
     89b:	31 d2                	xor    %edx,%edx
     89d:	87 15 00 00 00 00    	xchg   %edx,0x0
     8a3:	85 d2                	test   %edx,%edx
     8a5:	75 05                	jne    8ac <hd_interrupt+0x30>
     8a7:	ba 00 00 00 00       	mov    $0x0,%edx
     8ac:	e6 20                	out    %al,$0x20
     8ae:	ff d2                	call   *%edx
     8b0:	0f a1                	pop    %fs
     8b2:	07                   	pop    %es
     8b3:	1f                   	pop    %ds
     8b4:	5a                   	pop    %edx
     8b5:	59                   	pop    %ecx
     8b6:	58                   	pop    %eax
     8b7:	cf                   	iret   

000008b8 <floppy_interrupt>:
     8b8:	50                   	push   %eax
     8b9:	51                   	push   %ecx
     8ba:	52                   	push   %edx
     8bb:	1e                   	push   %ds
     8bc:	06                   	push   %es
     8bd:	0f a0                	push   %fs
     8bf:	b8 10 00 00 00       	mov    $0x10,%eax
     8c4:	8e d8                	mov    %eax,%ds
     8c6:	8e c0                	mov    %eax,%es
     8c8:	b8 17 00 00 00       	mov    $0x17,%eax
     8cd:	8e e0                	mov    %eax,%fs
     8cf:	b0 20                	mov    $0x20,%al
     8d1:	e6 20                	out    %al,$0x20
     8d3:	31 c0                	xor    %eax,%eax
     8d5:	87 05 00 00 00 00    	xchg   %eax,0x0
     8db:	85 c0                	test   %eax,%eax
     8dd:	75 05                	jne    8e4 <floppy_interrupt+0x2c>
     8df:	b8 00 00 00 00       	mov    $0x0,%eax
     8e4:	ff d0                	call   *%eax
     8e6:	0f a1                	pop    %fs
     8e8:	07                   	pop    %es
     8e9:	1f                   	pop    %ds
     8ea:	5a                   	pop    %edx
     8eb:	59                   	pop    %ecx
     8ec:	58                   	pop    %eax
     8ed:	cf                   	iret   

000008ee <parallel_interrupt>:
     8ee:	50                   	push   %eax
     8ef:	b0 20                	mov    $0x20,%al
     8f1:	e6 20                	out    %al,$0x20
     8f3:	58                   	pop    %eax
     8f4:	cf                   	iret   
     8f5:	57                   	push   %edi
     8f6:	56                   	push   %esi
     8f7:	53                   	push   %ebx
     8f8:	89 d3                	mov    %edx,%ebx
     8fa:	89 d6                	mov    %edx,%esi
     8fc:	83 ec 04             	sub    $0x4,%esp
     8ff:	0f b7 c9             	movzwl %cx,%ecx
     902:	51                   	push   %ecx
     903:	50                   	push   %eax
     904:	68 5a 00 00 00       	push   $0x5a
     909:	e8 fc ff ff ff       	call   90a <parallel_interrupt+0x1c>
     90e:	83 c4 08             	add    $0x8,%esp
     911:	ff 73 0c             	pushl  0xc(%ebx)
     914:	ff 73 10             	pushl  0x10(%ebx)
     917:	ff 73 08             	pushl  0x8(%ebx)
     91a:	ff 33                	pushl  (%ebx)
     91c:	ff 73 04             	pushl  0x4(%ebx)
     91f:	68 28 00 00 00       	push   $0x28
     924:	e8 fc ff ff ff       	call   925 <parallel_interrupt+0x37>
     929:	66 8c e0             	mov    %fs,%ax
     92c:	83 c4 18             	add    $0x18,%esp
     92f:	0f b7 c0             	movzwl %ax,%eax
     932:	50                   	push   %eax
     933:	68 65 00 00 00       	push   $0x65
     938:	e8 fc ff ff ff       	call   939 <parallel_interrupt+0x4b>
     93d:	b9 17 00 00 00       	mov    $0x17,%ecx
     942:	0f 03 c9             	lsl    %cx,%ecx
     945:	41                   	inc    %ecx
     946:	50                   	push   %eax
     947:	a1 00 00 00 00       	mov    0x0,%eax
     94c:	05 d8 02 00 00       	add    $0x2d8,%eax
     951:	83 c0 07             	add    $0x7,%eax
     954:	8a 30                	mov    (%eax),%dh
     956:	83 e8 03             	sub    $0x3,%eax
     959:	8a 10                	mov    (%eax),%dl
     95b:	c1 e2 10             	shl    $0x10,%edx
     95e:	83 e8 02             	sub    $0x2,%eax
     961:	66 8b 10             	mov    (%eax),%dx
     964:	58                   	pop    %eax
     965:	83 c4 0c             	add    $0xc,%esp
     968:	51                   	push   %ecx
     969:	52                   	push   %edx
     96a:	68 6f 00 00 00       	push   $0x6f
     96f:	e8 fc ff ff ff       	call   970 <parallel_interrupt+0x82>
     974:	83 c4 10             	add    $0x10,%esp
     977:	83 7b 10 17          	cmpl   $0x17,0x10(%ebx)
     97b:	75 52                	jne    9cf <parallel_interrupt+0xe1>
     97d:	83 ec 0c             	sub    $0xc,%esp
     980:	68 84 00 00 00       	push   $0x84
     985:	e8 fc ff ff ff       	call   986 <parallel_interrupt+0x98>
     98a:	83 c4 10             	add    $0x10,%esp
     98d:	bb 00 00 00 00       	mov    $0x0,%ebx
     992:	bf 17 00 00 00       	mov    $0x17,%edi
     997:	8b 56 0c             	mov    0xc(%esi),%edx
     99a:	89 f8                	mov    %edi,%eax
     99c:	0f a0                	push   %fs
     99e:	8e e0                	mov    %eax,%fs
     9a0:	64 8b 04 1a          	mov    %fs:(%edx,%ebx,1),%eax
     9a4:	0f a1                	pop    %fs
     9a6:	83 ec 08             	sub    $0x8,%esp
     9a9:	50                   	push   %eax
     9aa:	68 8c 00 00 00       	push   $0x8c
     9af:	e8 fc ff ff ff       	call   9b0 <parallel_interrupt+0xc2>
     9b4:	83 c3 04             	add    $0x4,%ebx
     9b7:	83 c4 10             	add    $0x10,%esp
     9ba:	83 fb 10             	cmp    $0x10,%ebx
     9bd:	75 d8                	jne    997 <parallel_interrupt+0xa9>
     9bf:	83 ec 0c             	sub    $0xc,%esp
     9c2:	68 90 00 00 00       	push   $0x90
     9c7:	e8 fc ff ff ff       	call   9c8 <parallel_interrupt+0xda>
     9cc:	83 c4 10             	add    $0x10,%esp
     9cf:	b8 00 00 00 00       	mov    $0x0,%eax
     9d4:	66 0f 00 c8          	str    %ax
     9d8:	83 e8 20             	sub    $0x20,%eax
     9db:	c1 e8 04             	shr    $0x4,%eax
     9de:	83 ec 04             	sub    $0x4,%esp
     9e1:	0f b7 c0             	movzwl %ax,%eax
     9e4:	50                   	push   %eax
     9e5:	a1 00 00 00 00       	mov    0x0,%eax
     9ea:	ff b0 2c 02 00 00    	pushl  0x22c(%eax)
     9f0:	68 92 00 00 00       	push   $0x92
     9f5:	e8 fc ff ff ff       	call   9f6 <parallel_interrupt+0x108>
     9fa:	83 c4 10             	add    $0x10,%esp
     9fd:	bb 00 00 00 00       	mov    $0x0,%ebx
     a02:	8b 46 04             	mov    0x4(%esi),%eax
     a05:	8b 16                	mov    (%esi),%edx
     a07:	0f a0                	push   %fs
     a09:	8e e0                	mov    %eax,%fs
     a0b:	64 8a 04 1a          	mov    %fs:(%edx,%ebx,1),%al
     a0f:	0f a1                	pop    %fs
     a11:	83 ec 08             	sub    $0x8,%esp
     a14:	0f b6 c0             	movzbl %al,%eax
     a17:	50                   	push   %eax
     a18:	68 ac 00 00 00       	push   $0xac
     a1d:	e8 fc ff ff ff       	call   a1e <parallel_interrupt+0x130>
     a22:	83 c3 01             	add    $0x1,%ebx
     a25:	83 c4 10             	add    $0x10,%esp
     a28:	83 fb 0a             	cmp    $0xa,%ebx
     a2b:	75 d5                	jne    a02 <parallel_interrupt+0x114>
     a2d:	83 ec 0c             	sub    $0xc,%esp
     a30:	68 b2 00 00 00       	push   $0xb2
     a35:	e8 fc ff ff ff       	call   a36 <parallel_interrupt+0x148>
     a3a:	c7 04 24 50 00 00 00 	movl   $0x50,(%esp)
     a41:	e8 fc ff ff ff       	call   a42 <parallel_interrupt+0x154>
     a46:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     a4d:	e8 fc ff ff ff       	call   a4e <parallel_interrupt+0x160>
     a52:	83 c4 10             	add    $0x10,%esp
     a55:	5b                   	pop    %ebx
     a56:	5e                   	pop    %esi
     a57:	5f                   	pop    %edi
     a58:	c3                   	ret    

00000a59 <do_double_fault>:
     a59:	83 ec 0c             	sub    $0xc,%esp
     a5c:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     a60:	8b 54 24 10          	mov    0x10(%esp),%edx
     a64:	b8 b5 00 00 00       	mov    $0xb5,%eax
     a69:	e8 87 fe ff ff       	call   8f5 <parallel_interrupt+0x7>
     a6e:	83 c4 0c             	add    $0xc,%esp
     a71:	c3                   	ret    

00000a72 <do_general_protection>:
     a72:	83 ec 0c             	sub    $0xc,%esp
     a75:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     a79:	8b 54 24 10          	mov    0x10(%esp),%edx
     a7d:	b8 c2 00 00 00       	mov    $0xc2,%eax
     a82:	e8 6e fe ff ff       	call   8f5 <parallel_interrupt+0x7>
     a87:	83 c4 0c             	add    $0xc,%esp
     a8a:	c3                   	ret    

00000a8b <do_divide_error>:
     a8b:	83 ec 0c             	sub    $0xc,%esp
     a8e:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     a92:	8b 54 24 10          	mov    0x10(%esp),%edx
     a96:	b8 d5 00 00 00       	mov    $0xd5,%eax
     a9b:	e8 55 fe ff ff       	call   8f5 <parallel_interrupt+0x7>
     aa0:	83 c4 0c             	add    $0xc,%esp
     aa3:	c3                   	ret    

00000aa4 <do_int3>:
     aa4:	56                   	push   %esi
     aa5:	53                   	push   %ebx
     aa6:	83 ec 10             	sub    $0x10,%esp
     aa9:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
     aad:	be 00 00 00 00       	mov    $0x0,%esi
     ab2:	89 f0                	mov    %esi,%eax
     ab4:	66 0f 00 c8          	str    %ax
     ab8:	89 c6                	mov    %eax,%esi
     aba:	ff 74 24 3c          	pushl  0x3c(%esp)
     abe:	ff 74 24 44          	pushl  0x44(%esp)
     ac2:	ff 74 24 4c          	pushl  0x4c(%esp)
     ac6:	ff 74 24 54          	pushl  0x54(%esp)
     aca:	68 78 00 00 00       	push   $0x78
     acf:	e8 fc ff ff ff       	call   ad0 <do_int3+0x2c>
     ad4:	83 c4 14             	add    $0x14,%esp
     ad7:	53                   	push   %ebx
     ad8:	ff 74 24 34          	pushl  0x34(%esp)
     adc:	ff 74 24 40          	pushl  0x40(%esp)
     ae0:	ff 74 24 40          	pushl  0x40(%esp)
     ae4:	68 a0 00 00 00       	push   $0xa0
     ae9:	e8 fc ff ff ff       	call   aea <do_int3+0x46>
     aee:	83 c4 14             	add    $0x14,%esp
     af1:	56                   	push   %esi
     af2:	ff 74 24 28          	pushl  0x28(%esp)
     af6:	ff 74 24 30          	pushl  0x30(%esp)
     afa:	ff 74 24 38          	pushl  0x38(%esp)
     afe:	68 c8 00 00 00       	push   $0xc8
     b03:	e8 fc ff ff ff       	call   b04 <do_int3+0x60>
     b08:	83 c4 20             	add    $0x20,%esp
     b0b:	ff 73 08             	pushl  0x8(%ebx)
     b0e:	ff 73 04             	pushl  0x4(%ebx)
     b11:	ff 33                	pushl  (%ebx)
     b13:	68 ec 00 00 00       	push   $0xec
     b18:	e8 fc ff ff ff       	call   b19 <do_int3+0x75>
     b1d:	83 c4 14             	add    $0x14,%esp
     b20:	5b                   	pop    %ebx
     b21:	5e                   	pop    %esi
     b22:	c3                   	ret    

00000b23 <do_nmi>:
     b23:	83 ec 0c             	sub    $0xc,%esp
     b26:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     b2a:	8b 54 24 10          	mov    0x10(%esp),%edx
     b2e:	b8 e2 00 00 00       	mov    $0xe2,%eax
     b33:	e8 bd fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     b38:	83 c4 0c             	add    $0xc,%esp
     b3b:	c3                   	ret    

00000b3c <do_debug>:
     b3c:	83 ec 0c             	sub    $0xc,%esp
     b3f:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     b43:	8b 54 24 10          	mov    0x10(%esp),%edx
     b47:	b8 e6 00 00 00       	mov    $0xe6,%eax
     b4c:	e8 a4 fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     b51:	83 c4 0c             	add    $0xc,%esp
     b54:	c3                   	ret    

00000b55 <do_overflow>:
     b55:	83 ec 0c             	sub    $0xc,%esp
     b58:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     b5c:	8b 54 24 10          	mov    0x10(%esp),%edx
     b60:	b8 ec 00 00 00       	mov    $0xec,%eax
     b65:	e8 8b fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     b6a:	83 c4 0c             	add    $0xc,%esp
     b6d:	c3                   	ret    

00000b6e <do_bounds>:
     b6e:	83 ec 0c             	sub    $0xc,%esp
     b71:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     b75:	8b 54 24 10          	mov    0x10(%esp),%edx
     b79:	b8 f5 00 00 00       	mov    $0xf5,%eax
     b7e:	e8 72 fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     b83:	83 c4 0c             	add    $0xc,%esp
     b86:	c3                   	ret    

00000b87 <do_invalid_op>:
     b87:	83 ec 0c             	sub    $0xc,%esp
     b8a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     b8e:	8b 54 24 10          	mov    0x10(%esp),%edx
     b92:	b8 fc 00 00 00       	mov    $0xfc,%eax
     b97:	e8 59 fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     b9c:	83 c4 0c             	add    $0xc,%esp
     b9f:	c3                   	ret    

00000ba0 <do_device_not_available>:
     ba0:	83 ec 0c             	sub    $0xc,%esp
     ba3:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     ba7:	8b 54 24 10          	mov    0x10(%esp),%edx
     bab:	b8 0c 01 00 00       	mov    $0x10c,%eax
     bb0:	e8 40 fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     bb5:	83 c4 0c             	add    $0xc,%esp
     bb8:	c3                   	ret    

00000bb9 <do_coprocessor_segment_overrun>:
     bb9:	83 ec 0c             	sub    $0xc,%esp
     bbc:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     bc0:	8b 54 24 10          	mov    0x10(%esp),%edx
     bc4:	b8 21 01 00 00       	mov    $0x121,%eax
     bc9:	e8 27 fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     bce:	83 c4 0c             	add    $0xc,%esp
     bd1:	c3                   	ret    

00000bd2 <do_invalid_TSS>:
     bd2:	83 ec 0c             	sub    $0xc,%esp
     bd5:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     bd9:	8b 54 24 10          	mov    0x10(%esp),%edx
     bdd:	b8 3d 01 00 00       	mov    $0x13d,%eax
     be2:	e8 0e fd ff ff       	call   8f5 <parallel_interrupt+0x7>
     be7:	83 c4 0c             	add    $0xc,%esp
     bea:	c3                   	ret    

00000beb <do_segment_not_present>:
     beb:	83 ec 0c             	sub    $0xc,%esp
     bee:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     bf2:	8b 54 24 10          	mov    0x10(%esp),%edx
     bf6:	b8 49 01 00 00       	mov    $0x149,%eax
     bfb:	e8 f5 fc ff ff       	call   8f5 <parallel_interrupt+0x7>
     c00:	83 c4 0c             	add    $0xc,%esp
     c03:	c3                   	ret    

00000c04 <do_stack_segment>:
     c04:	83 ec 0c             	sub    $0xc,%esp
     c07:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     c0b:	8b 54 24 10          	mov    0x10(%esp),%edx
     c0f:	b8 5d 01 00 00       	mov    $0x15d,%eax
     c14:	e8 dc fc ff ff       	call   8f5 <parallel_interrupt+0x7>
     c19:	83 c4 0c             	add    $0xc,%esp
     c1c:	c3                   	ret    

00000c1d <do_coprocessor_error>:
     c1d:	a1 00 00 00 00       	mov    0x0,%eax
     c22:	39 05 00 00 00 00    	cmp    %eax,0x0
     c28:	75 18                	jne    c42 <do_coprocessor_error+0x25>
     c2a:	83 ec 0c             	sub    $0xc,%esp
     c2d:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     c31:	8b 54 24 10          	mov    0x10(%esp),%edx
     c35:	b8 6b 01 00 00       	mov    $0x16b,%eax
     c3a:	e8 b6 fc ff ff       	call   8f5 <parallel_interrupt+0x7>
     c3f:	83 c4 0c             	add    $0xc,%esp
     c42:	f3 c3                	repz ret 

00000c44 <do_reserved>:
     c44:	83 ec 0c             	sub    $0xc,%esp
     c47:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     c4b:	8b 54 24 10          	mov    0x10(%esp),%edx
     c4f:	b8 7d 01 00 00       	mov    $0x17d,%eax
     c54:	e8 9c fc ff ff       	call   8f5 <parallel_interrupt+0x7>
     c59:	83 c4 0c             	add    $0xc,%esp
     c5c:	c3                   	ret    

00000c5d <trap_init>:
     c5d:	53                   	push   %ebx
     c5e:	b8 00 00 08 00       	mov    $0x80000,%eax
     c63:	ba 00 00 00 00       	mov    $0x0,%edx
     c68:	66 89 d0             	mov    %dx,%ax
     c6b:	66 ba 00 8f          	mov    $0x8f00,%dx
     c6f:	a3 00 00 00 00       	mov    %eax,0x0
     c74:	89 15 04 00 00 00    	mov    %edx,0x4
     c7a:	ba 00 00 00 00       	mov    $0x0,%edx
     c7f:	66 89 d0             	mov    %dx,%ax
     c82:	66 ba 00 8f          	mov    $0x8f00,%dx
     c86:	a3 08 00 00 00       	mov    %eax,0x8
     c8b:	89 15 0c 00 00 00    	mov    %edx,0xc
     c91:	ba 00 00 00 00       	mov    $0x0,%edx
     c96:	66 89 d0             	mov    %dx,%ax
     c99:	66 ba 00 8f          	mov    $0x8f00,%dx
     c9d:	a3 10 00 00 00       	mov    %eax,0x10
     ca2:	89 15 14 00 00 00    	mov    %edx,0x14
     ca8:	ba 00 00 00 00       	mov    $0x0,%edx
     cad:	66 89 d0             	mov    %dx,%ax
     cb0:	66 ba 00 ef          	mov    $0xef00,%dx
     cb4:	a3 18 00 00 00       	mov    %eax,0x18
     cb9:	89 15 1c 00 00 00    	mov    %edx,0x1c
     cbf:	ba 00 00 00 00       	mov    $0x0,%edx
     cc4:	66 89 d0             	mov    %dx,%ax
     cc7:	66 ba 00 ef          	mov    $0xef00,%dx
     ccb:	a3 20 00 00 00       	mov    %eax,0x20
     cd0:	89 15 24 00 00 00    	mov    %edx,0x24
     cd6:	ba 00 00 00 00       	mov    $0x0,%edx
     cdb:	66 89 d0             	mov    %dx,%ax
     cde:	66 ba 00 ef          	mov    $0xef00,%dx
     ce2:	a3 28 00 00 00       	mov    %eax,0x28
     ce7:	89 15 2c 00 00 00    	mov    %edx,0x2c
     ced:	ba 00 00 00 00       	mov    $0x0,%edx
     cf2:	66 89 d0             	mov    %dx,%ax
     cf5:	66 ba 00 8f          	mov    $0x8f00,%dx
     cf9:	a3 30 00 00 00       	mov    %eax,0x30
     cfe:	89 15 34 00 00 00    	mov    %edx,0x34
     d04:	ba 00 00 00 00       	mov    $0x0,%edx
     d09:	66 89 d0             	mov    %dx,%ax
     d0c:	66 ba 00 8f          	mov    $0x8f00,%dx
     d10:	a3 38 00 00 00       	mov    %eax,0x38
     d15:	89 15 3c 00 00 00    	mov    %edx,0x3c
     d1b:	ba 00 00 00 00       	mov    $0x0,%edx
     d20:	66 89 d0             	mov    %dx,%ax
     d23:	66 ba 00 8f          	mov    $0x8f00,%dx
     d27:	a3 40 00 00 00       	mov    %eax,0x40
     d2c:	89 15 44 00 00 00    	mov    %edx,0x44
     d32:	ba 00 00 00 00       	mov    $0x0,%edx
     d37:	66 89 d0             	mov    %dx,%ax
     d3a:	66 ba 00 8f          	mov    $0x8f00,%dx
     d3e:	a3 48 00 00 00       	mov    %eax,0x48
     d43:	89 15 4c 00 00 00    	mov    %edx,0x4c
     d49:	ba 00 00 00 00       	mov    $0x0,%edx
     d4e:	66 89 d0             	mov    %dx,%ax
     d51:	66 ba 00 8f          	mov    $0x8f00,%dx
     d55:	a3 50 00 00 00       	mov    %eax,0x50
     d5a:	89 15 54 00 00 00    	mov    %edx,0x54
     d60:	ba 00 00 00 00       	mov    $0x0,%edx
     d65:	66 89 d0             	mov    %dx,%ax
     d68:	66 ba 00 8f          	mov    $0x8f00,%dx
     d6c:	a3 58 00 00 00       	mov    %eax,0x58
     d71:	89 15 5c 00 00 00    	mov    %edx,0x5c
     d77:	ba 00 00 00 00       	mov    $0x0,%edx
     d7c:	66 89 d0             	mov    %dx,%ax
     d7f:	66 ba 00 8f          	mov    $0x8f00,%dx
     d83:	a3 60 00 00 00       	mov    %eax,0x60
     d88:	89 15 64 00 00 00    	mov    %edx,0x64
     d8e:	ba 00 00 00 00       	mov    $0x0,%edx
     d93:	66 89 d0             	mov    %dx,%ax
     d96:	66 ba 00 8f          	mov    $0x8f00,%dx
     d9a:	a3 68 00 00 00       	mov    %eax,0x68
     d9f:	89 15 6c 00 00 00    	mov    %edx,0x6c
     da5:	ba 00 00 00 00       	mov    $0x0,%edx
     daa:	66 89 d0             	mov    %dx,%ax
     dad:	66 ba 00 8f          	mov    $0x8f00,%dx
     db1:	a3 70 00 00 00       	mov    %eax,0x70
     db6:	89 15 74 00 00 00    	mov    %edx,0x74
     dbc:	ba 00 00 00 00       	mov    $0x0,%edx
     dc1:	66 89 d0             	mov    %dx,%ax
     dc4:	66 ba 00 8f          	mov    $0x8f00,%dx
     dc8:	a3 78 00 00 00       	mov    %eax,0x78
     dcd:	89 15 7c 00 00 00    	mov    %edx,0x7c
     dd3:	ba 00 00 00 00       	mov    $0x0,%edx
     dd8:	66 89 d0             	mov    %dx,%ax
     ddb:	66 ba 00 8f          	mov    $0x8f00,%dx
     ddf:	a3 80 00 00 00       	mov    %eax,0x80
     de4:	89 15 84 00 00 00    	mov    %edx,0x84
     dea:	b9 88 00 00 00       	mov    $0x88,%ecx
     def:	bb 80 01 00 00       	mov    $0x180,%ebx
     df4:	ba 00 00 00 00       	mov    $0x0,%edx
     df9:	66 89 d0             	mov    %dx,%ax
     dfc:	66 ba 00 8f          	mov    $0x8f00,%dx
     e00:	89 01                	mov    %eax,(%ecx)
     e02:	89 51 04             	mov    %edx,0x4(%ecx)
     e05:	83 c1 08             	add    $0x8,%ecx
     e08:	39 d9                	cmp    %ebx,%ecx
     e0a:	75 ed                	jne    df9 <trap_init+0x19c>
     e0c:	b8 00 00 08 00       	mov    $0x80000,%eax
     e11:	ba 00 00 00 00       	mov    $0x0,%edx
     e16:	66 89 d0             	mov    %dx,%ax
     e19:	66 ba 00 8f          	mov    $0x8f00,%dx
     e1d:	a3 68 01 00 00       	mov    %eax,0x168
     e22:	89 15 6c 01 00 00    	mov    %edx,0x16c
     e28:	ba 21 00 00 00       	mov    $0x21,%edx
     e2d:	ec                   	in     (%dx),%al
     e2e:	eb 00                	jmp    e30 <trap_init+0x1d3>
     e30:	eb 00                	jmp    e32 <trap_init+0x1d5>
     e32:	25 fb 00 00 00       	and    $0xfb,%eax
     e37:	ee                   	out    %al,(%dx)
     e38:	eb 00                	jmp    e3a <trap_init+0x1dd>
     e3a:	eb 00                	jmp    e3c <trap_init+0x1df>
     e3c:	ba a1 00 00 00       	mov    $0xa1,%edx
     e41:	ec                   	in     (%dx),%al
     e42:	eb 00                	jmp    e44 <trap_init+0x1e7>
     e44:	eb 00                	jmp    e46 <trap_init+0x1e9>
     e46:	25 df 00 00 00       	and    $0xdf,%eax
     e4b:	ee                   	out    %al,(%dx)
     e4c:	b8 00 00 08 00       	mov    $0x80000,%eax
     e51:	ba 00 00 00 00       	mov    $0x0,%edx
     e56:	66 89 d0             	mov    %dx,%ax
     e59:	66 ba 00 8f          	mov    $0x8f00,%dx
     e5d:	a3 38 01 00 00       	mov    %eax,0x138
     e62:	89 15 3c 01 00 00    	mov    %edx,0x13c
     e68:	5b                   	pop    %ebx
     e69:	c3                   	ret    

00000e6a <divide_error>:
     e6a:	68 00 00 00 00       	push   $0x0
     e6f:	87 04 24             	xchg   %eax,(%esp)
     e72:	53                   	push   %ebx
     e73:	51                   	push   %ecx
     e74:	52                   	push   %edx
     e75:	57                   	push   %edi
     e76:	56                   	push   %esi
     e77:	55                   	push   %ebp
     e78:	1e                   	push   %ds
     e79:	06                   	push   %es
     e7a:	0f a0                	push   %fs
     e7c:	6a 00                	push   $0x0
     e7e:	8d 54 24 2c          	lea    0x2c(%esp),%edx
     e82:	52                   	push   %edx
     e83:	ba 10 00 00 00       	mov    $0x10,%edx
     e88:	8e da                	mov    %edx,%ds
     e8a:	8e c2                	mov    %edx,%es
     e8c:	8e e2                	mov    %edx,%fs
     e8e:	ff d0                	call   *%eax
     e90:	83 c4 08             	add    $0x8,%esp
     e93:	0f a1                	pop    %fs
     e95:	07                   	pop    %es
     e96:	1f                   	pop    %ds
     e97:	5d                   	pop    %ebp
     e98:	5e                   	pop    %esi
     e99:	5f                   	pop    %edi
     e9a:	5a                   	pop    %edx
     e9b:	59                   	pop    %ecx
     e9c:	5b                   	pop    %ebx
     e9d:	58                   	pop    %eax
     e9e:	cf                   	iret   

00000e9f <debug>:
     e9f:	68 00 00 00 00       	push   $0x0
     ea4:	eb c9                	jmp    e6f <divide_error+0x5>

00000ea6 <nmi>:
     ea6:	68 00 00 00 00       	push   $0x0
     eab:	eb c2                	jmp    e6f <divide_error+0x5>

00000ead <int3>:
     ead:	68 00 00 00 00       	push   $0x0
     eb2:	eb bb                	jmp    e6f <divide_error+0x5>

00000eb4 <overflow>:
     eb4:	68 00 00 00 00       	push   $0x0
     eb9:	eb b4                	jmp    e6f <divide_error+0x5>

00000ebb <bounds>:
     ebb:	68 00 00 00 00       	push   $0x0
     ec0:	eb ad                	jmp    e6f <divide_error+0x5>

00000ec2 <invalid_op>:
     ec2:	68 00 00 00 00       	push   $0x0
     ec7:	eb a6                	jmp    e6f <divide_error+0x5>

00000ec9 <coprocessor_segment_overrun>:
     ec9:	68 00 00 00 00       	push   $0x0
     ece:	eb 9f                	jmp    e6f <divide_error+0x5>

00000ed0 <reserved>:
     ed0:	68 00 00 00 00       	push   $0x0
     ed5:	eb 98                	jmp    e6f <divide_error+0x5>

00000ed7 <irq13>:
     ed7:	50                   	push   %eax
     ed8:	30 c0                	xor    %al,%al
     eda:	e6 f0                	out    %al,$0xf0
     edc:	b0 20                	mov    $0x20,%al
     ede:	e6 20                	out    %al,$0x20
     ee0:	eb 00                	jmp    ee2 <irq13+0xb>
     ee2:	eb 00                	jmp    ee4 <irq13+0xd>
     ee4:	e6 a0                	out    %al,$0xa0
     ee6:	58                   	pop    %eax
     ee7:	e9 fc ff ff ff       	jmp    ee8 <irq13+0x11>

00000eec <double_fault>:
     eec:	68 00 00 00 00       	push   $0x0
     ef1:	87 44 24 04          	xchg   %eax,0x4(%esp)
     ef5:	87 1c 24             	xchg   %ebx,(%esp)
     ef8:	51                   	push   %ecx
     ef9:	52                   	push   %edx
     efa:	57                   	push   %edi
     efb:	56                   	push   %esi
     efc:	55                   	push   %ebp
     efd:	1e                   	push   %ds
     efe:	06                   	push   %es
     eff:	0f a0                	push   %fs
     f01:	50                   	push   %eax
     f02:	8d 44 24 2c          	lea    0x2c(%esp),%eax
     f06:	50                   	push   %eax
     f07:	b8 10 00 00 00       	mov    $0x10,%eax
     f0c:	8e d8                	mov    %eax,%ds
     f0e:	8e c0                	mov    %eax,%es
     f10:	8e e0                	mov    %eax,%fs
     f12:	ff d3                	call   *%ebx
     f14:	83 c4 08             	add    $0x8,%esp
     f17:	0f a1                	pop    %fs
     f19:	07                   	pop    %es
     f1a:	1f                   	pop    %ds
     f1b:	5d                   	pop    %ebp
     f1c:	5e                   	pop    %esi
     f1d:	5f                   	pop    %edi
     f1e:	5a                   	pop    %edx
     f1f:	59                   	pop    %ecx
     f20:	5b                   	pop    %ebx
     f21:	58                   	pop    %eax
     f22:	cf                   	iret   

00000f23 <invalid_TSS>:
     f23:	68 00 00 00 00       	push   $0x0
     f28:	eb c7                	jmp    ef1 <double_fault+0x5>

00000f2a <segment_not_present>:
     f2a:	68 00 00 00 00       	push   $0x0
     f2f:	eb c0                	jmp    ef1 <double_fault+0x5>

00000f31 <stack_segment>:
     f31:	68 00 00 00 00       	push   $0x0
     f36:	eb b9                	jmp    ef1 <double_fault+0x5>

00000f38 <general_protection>:
     f38:	68 00 00 00 00       	push   $0x0
     f3d:	eb b2                	jmp    ef1 <double_fault+0x5>

00000f3f <verify_area>:
     f3f:	56                   	push   %esi
     f40:	53                   	push   %ebx
     f41:	83 ec 04             	sub    $0x4,%esp
     f44:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     f48:	89 d9                	mov    %ebx,%ecx
     f4a:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
     f50:	03 4c 24 14          	add    0x14(%esp),%ecx
     f54:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
     f5a:	50                   	push   %eax
     f5b:	a1 00 00 00 00       	mov    0x0,%eax
     f60:	05 e0 02 00 00       	add    $0x2e0,%eax
     f65:	83 c0 07             	add    $0x7,%eax
     f68:	8a 30                	mov    (%eax),%dh
     f6a:	83 e8 03             	sub    $0x3,%eax
     f6d:	8a 10                	mov    (%eax),%dl
     f6f:	c1 e2 10             	shl    $0x10,%edx
     f72:	83 e8 02             	sub    $0x2,%eax
     f75:	66 8b 10             	mov    (%eax),%dx
     f78:	58                   	pop    %eax
     f79:	01 d3                	add    %edx,%ebx
     f7b:	85 c9                	test   %ecx,%ecx
     f7d:	7e 26                	jle    fa5 <verify_area+0x66>
     f7f:	83 e9 01             	sub    $0x1,%ecx
     f82:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
     f88:	8d b4 0b 00 10 00 00 	lea    0x1000(%ebx,%ecx,1),%esi
     f8f:	83 ec 0c             	sub    $0xc,%esp
     f92:	53                   	push   %ebx
     f93:	e8 fc ff ff ff       	call   f94 <verify_area+0x55>
     f98:	81 c3 00 10 00 00    	add    $0x1000,%ebx
     f9e:	83 c4 10             	add    $0x10,%esp
     fa1:	39 f3                	cmp    %esi,%ebx
     fa3:	75 ea                	jne    f8f <verify_area+0x50>
     fa5:	83 c4 04             	add    $0x4,%esp
     fa8:	5b                   	pop    %ebx
     fa9:	5e                   	pop    %esi
     faa:	c3                   	ret    

00000fab <copy_mem>:
     fab:	53                   	push   %ebx
     fac:	83 ec 08             	sub    $0x8,%esp
     faf:	8b 5c 24 14          	mov    0x14(%esp),%ebx
     fb3:	c7 83 18 02 00 00 00 	movl   $0x20000000,0x218(%ebx)
     fba:	00 00 20 
     fbd:	ba 00 00 00 20       	mov    $0x20000000,%edx
     fc2:	66 89 93 da 02 00 00 	mov    %dx,0x2da(%ebx)
     fc9:	c1 ca 10             	ror    $0x10,%edx
     fcc:	88 93 dc 02 00 00    	mov    %dl,0x2dc(%ebx)
     fd2:	88 b3 df 02 00 00    	mov    %dh,0x2df(%ebx)
     fd8:	c1 ca 10             	ror    $0x10,%edx
     fdb:	66 89 93 e2 02 00 00 	mov    %dx,0x2e2(%ebx)
     fe2:	c1 ca 10             	ror    $0x10,%edx
     fe5:	88 93 e4 02 00 00    	mov    %dl,0x2e4(%ebx)
     feb:	88 b3 e7 02 00 00    	mov    %dh,0x2e7(%ebx)
     ff1:	c1 ca 10             	ror    $0x10,%edx
     ff4:	53                   	push   %ebx
     ff5:	68 00 00 00 e0       	push   $0xe0000000
     ffa:	68 00 00 00 20       	push   $0x20000000
     fff:	6a 00                	push   $0x0
    1001:	e8 fc ff ff ff       	call   1002 <copy_mem+0x57>
    1006:	83 c4 10             	add    $0x10,%esp
    1009:	85 c0                	test   %eax,%eax
    100b:	74 34                	je     1041 <copy_mem+0x96>
    100d:	83 ec 0c             	sub    $0xc,%esp
    1010:	68 10 01 00 00       	push   $0x110
    1015:	e8 fc ff ff ff       	call   1016 <copy_mem+0x6b>
    101a:	6a 01                	push   $0x1
    101c:	53                   	push   %ebx
    101d:	68 00 00 00 e0       	push   $0xe0000000
    1022:	68 00 00 00 20       	push   $0x20000000
    1027:	e8 fc ff ff ff       	call   1028 <copy_mem+0x7d>
    102c:	83 c4 14             	add    $0x14,%esp
    102f:	68 38 01 00 00       	push   $0x138
    1034:	e8 fc ff ff ff       	call   1035 <copy_mem+0x8a>
    1039:	83 c4 10             	add    $0x10,%esp
    103c:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
    1041:	83 c4 08             	add    $0x8,%esp
    1044:	5b                   	pop    %ebx
    1045:	c3                   	ret    

00001046 <copy_process>:
    1046:	55                   	push   %ebp
    1047:	57                   	push   %edi
    1048:	56                   	push   %esi
    1049:	53                   	push   %ebx
    104a:	83 ec 18             	sub    $0x18,%esp
    104d:	8b 6c 24 2c          	mov    0x2c(%esp),%ebp
    1051:	6a 01                	push   $0x1
    1053:	e8 fc ff ff ff       	call   1054 <copy_process+0xe>
    1058:	83 c4 10             	add    $0x10,%esp
    105b:	85 c0                	test   %eax,%eax
    105d:	0f 84 bc 02 00 00    	je     131f <copy_process+0x2d9>
    1063:	89 c3                	mov    %eax,%ebx
    1065:	89 c7                	mov    %eax,%edi
    1067:	89 04 ad 00 00 00 00 	mov    %eax,0x0(,%ebp,4)
    106e:	50                   	push   %eax
    106f:	ff 35 00 00 00 00    	pushl  0x0
    1075:	55                   	push   %ebp
    1076:	68 60 01 00 00       	push   $0x160
    107b:	e8 fc ff ff ff       	call   107c <copy_process+0x36>
    1080:	8b 35 00 00 00 00    	mov    0x0,%esi
    1086:	b9 ef 00 00 00       	mov    $0xef,%ecx
    108b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    108d:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
    1093:	a1 00 00 00 00       	mov    0x0,%eax
    1098:	89 83 2c 02 00 00    	mov    %eax,0x22c(%ebx)
    109e:	8b 15 00 00 00 00    	mov    0x0,%edx
    10a4:	8b 82 2c 02 00 00    	mov    0x22c(%edx),%eax
    10aa:	89 83 30 02 00 00    	mov    %eax,0x230(%ebx)
    10b0:	8b 43 08             	mov    0x8(%ebx),%eax
    10b3:	89 43 04             	mov    %eax,0x4(%ebx)
    10b6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    10bd:	c7 83 4c 02 00 00 00 	movl   $0x0,0x24c(%ebx)
    10c4:	00 00 00 
    10c7:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
    10ce:	00 00 00 
    10d1:	c7 83 54 02 00 00 00 	movl   $0x0,0x254(%ebx)
    10d8:	00 00 00 
    10db:	c7 83 50 02 00 00 00 	movl   $0x0,0x250(%ebx)
    10e2:	00 00 00 
    10e5:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
    10ec:	00 00 00 
    10ef:	c7 83 58 02 00 00 00 	movl   $0x0,0x258(%ebx)
    10f6:	00 00 00 
    10f9:	a1 00 00 00 00       	mov    0x0,%eax
    10fe:	89 83 60 02 00 00    	mov    %eax,0x260(%ebx)
    1104:	c7 83 e8 02 00 00 00 	movl   $0x0,0x2e8(%ebx)
    110b:	00 00 00 
    110e:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
    1114:	89 83 ec 02 00 00    	mov    %eax,0x2ec(%ebx)
    111a:	c7 83 f0 02 00 00 10 	movl   $0x10,0x2f0(%ebx)
    1121:	00 00 00 
    1124:	8b 44 24 60          	mov    0x60(%esp),%eax
    1128:	89 83 08 03 00 00    	mov    %eax,0x308(%ebx)
    112e:	8b 44 24 68          	mov    0x68(%esp),%eax
    1132:	89 83 0c 03 00 00    	mov    %eax,0x30c(%ebx)
    1138:	c7 83 10 03 00 00 00 	movl   $0x0,0x310(%ebx)
    113f:	00 00 00 
    1142:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    1146:	89 83 14 03 00 00    	mov    %eax,0x314(%ebx)
    114c:	8b 44 24 50          	mov    0x50(%esp),%eax
    1150:	89 83 18 03 00 00    	mov    %eax,0x318(%ebx)
    1156:	8b 44 24 48          	mov    0x48(%esp),%eax
    115a:	89 83 1c 03 00 00    	mov    %eax,0x31c(%ebx)
    1160:	8b 44 24 6c          	mov    0x6c(%esp),%eax
    1164:	89 83 20 03 00 00    	mov    %eax,0x320(%ebx)
    116a:	8b 44 24 34          	mov    0x34(%esp),%eax
    116e:	89 83 24 03 00 00    	mov    %eax,0x324(%ebx)
    1174:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    1178:	89 83 28 03 00 00    	mov    %eax,0x328(%ebx)
    117e:	8b 44 24 38          	mov    0x38(%esp),%eax
    1182:	89 83 2c 03 00 00    	mov    %eax,0x32c(%ebx)
    1188:	0f b7 44 24 58       	movzwl 0x58(%esp),%eax
    118d:	89 83 30 03 00 00    	mov    %eax,0x330(%ebx)
    1193:	0f b7 44 24 64       	movzwl 0x64(%esp),%eax
    1198:	89 83 34 03 00 00    	mov    %eax,0x334(%ebx)
    119e:	0f b7 44 24 70       	movzwl 0x70(%esp),%eax
    11a3:	89 83 38 03 00 00    	mov    %eax,0x338(%ebx)
    11a9:	0f b7 44 24 5c       	movzwl 0x5c(%esp),%eax
    11ae:	89 83 3c 03 00 00    	mov    %eax,0x33c(%ebx)
    11b4:	0f b7 44 24 54       	movzwl 0x54(%esp),%eax
    11b9:	89 83 40 03 00 00    	mov    %eax,0x340(%ebx)
    11bf:	0f b7 44 24 40       	movzwl 0x40(%esp),%eax
    11c4:	89 83 44 03 00 00    	mov    %eax,0x344(%ebx)
    11ca:	89 e8                	mov    %ebp,%eax
    11cc:	c1 e0 04             	shl    $0x4,%eax
    11cf:	83 c0 28             	add    $0x28,%eax
    11d2:	89 83 48 03 00 00    	mov    %eax,0x348(%ebx)
    11d8:	c7 83 4c 03 00 00 00 	movl   $0x80000000,0x34c(%ebx)
    11df:	00 00 80 
    11e2:	83 c4 10             	add    $0x10,%esp
    11e5:	3b 15 00 00 00 00    	cmp    0x0,%edx
    11eb:	75 08                	jne    11f5 <copy_process+0x1af>
    11ed:	0f 06                	clts   
    11ef:	dd b3 50 03 00 00    	fnsave 0x350(%ebx)
    11f5:	83 ec 08             	sub    $0x8,%esp
    11f8:	53                   	push   %ebx
    11f9:	55                   	push   %ebp
    11fa:	e8 fc ff ff ff       	call   11fb <copy_process+0x1b5>
    11ff:	83 c4 10             	add    $0x10,%esp
    1202:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    1208:	8d 8b d0 02 00 00    	lea    0x2d0(%ebx),%ecx
    120e:	85 c0                	test   %eax,%eax
    1210:	74 40                	je     1252 <copy_process+0x20c>
    1212:	c7 04 ad 00 00 00 00 	movl   $0x0,0x0(,%ebp,4)
    1219:	00 00 00 00 
    121d:	83 ec 0c             	sub    $0xc,%esp
    1220:	53                   	push   %ebx
    1221:	e8 fc ff ff ff       	call   1222 <copy_process+0x1dc>
    1226:	89 c2                	mov    %eax,%edx
    1228:	83 c4 10             	add    $0x10,%esp
    122b:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1230:	85 d2                	test   %edx,%edx
    1232:	0f 85 ec 00 00 00    	jne    1324 <copy_process+0x2de>
    1238:	83 ec 0c             	sub    $0xc,%esp
    123b:	68 8c 01 00 00       	push   $0x18c
    1240:	e8 fc ff ff ff       	call   1241 <copy_process+0x1fb>
    1245:	83 c4 10             	add    $0x10,%esp
    1248:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    124d:	e9 d2 00 00 00       	jmp    1324 <copy_process+0x2de>
    1252:	8b 02                	mov    (%edx),%eax
    1254:	85 c0                	test   %eax,%eax
    1256:	74 05                	je     125d <copy_process+0x217>
    1258:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
    125d:	83 c2 04             	add    $0x4,%edx
    1260:	39 ca                	cmp    %ecx,%edx
    1262:	75 ee                	jne    1252 <copy_process+0x20c>
    1264:	a1 00 00 00 00       	mov    0x0,%eax
    1269:	8b 90 70 02 00 00    	mov    0x270(%eax),%edx
    126f:	85 d2                	test   %edx,%edx
    1271:	74 05                	je     1278 <copy_process+0x232>
    1273:	66 83 42 30 01       	addw   $0x1,0x30(%edx)
    1278:	8b 90 74 02 00 00    	mov    0x274(%eax),%edx
    127e:	85 d2                	test   %edx,%edx
    1280:	74 05                	je     1287 <copy_process+0x241>
    1282:	66 83 42 30 01       	addw   $0x1,0x30(%edx)
    1287:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
    128d:	85 c0                	test   %eax,%eax
    128f:	74 05                	je     1296 <copy_process+0x250>
    1291:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    1296:	8d 54 2d 04          	lea    0x4(%ebp,%ebp,1),%edx
    129a:	8d 83 e8 02 00 00    	lea    0x2e8(%ebx),%eax
    12a0:	66 c7 04 d5 00 00 00 	movw   $0x68,0x0(,%edx,8)
    12a7:	00 68 00 
    12aa:	66 89 04 d5 02 00 00 	mov    %ax,0x2(,%edx,8)
    12b1:	00 
    12b2:	c1 c8 10             	ror    $0x10,%eax
    12b5:	88 04 d5 04 00 00 00 	mov    %al,0x4(,%edx,8)
    12bc:	c6 04 d5 05 00 00 00 	movb   $0x89,0x5(,%edx,8)
    12c3:	89 
    12c4:	c6 04 d5 06 00 00 00 	movb   $0x0,0x6(,%edx,8)
    12cb:	00 
    12cc:	88 24 d5 07 00 00 00 	mov    %ah,0x7(,%edx,8)
    12d3:	c1 c8 10             	ror    $0x10,%eax
    12d6:	8d 83 d0 02 00 00    	lea    0x2d0(%ebx),%eax
    12dc:	66 c7 04 d5 08 00 00 	movw   $0x68,0x8(,%edx,8)
    12e3:	00 68 00 
    12e6:	66 89 04 d5 0a 00 00 	mov    %ax,0xa(,%edx,8)
    12ed:	00 
    12ee:	c1 c8 10             	ror    $0x10,%eax
    12f1:	88 04 d5 0c 00 00 00 	mov    %al,0xc(,%edx,8)
    12f8:	c6 04 d5 0d 00 00 00 	movb   $0x82,0xd(,%edx,8)
    12ff:	82 
    1300:	c6 04 d5 0e 00 00 00 	movb   $0x0,0xe(,%edx,8)
    1307:	00 
    1308:	88 24 d5 0f 00 00 00 	mov    %ah,0xf(,%edx,8)
    130f:	c1 c8 10             	ror    $0x10,%eax
    1312:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    1318:	a1 00 00 00 00       	mov    0x0,%eax
    131d:	eb 05                	jmp    1324 <copy_process+0x2de>
    131f:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1324:	83 c4 0c             	add    $0xc,%esp
    1327:	5b                   	pop    %ebx
    1328:	5e                   	pop    %esi
    1329:	5f                   	pop    %edi
    132a:	5d                   	pop    %ebp
    132b:	c3                   	ret    

0000132c <find_empty_process>:
    132c:	56                   	push   %esi
    132d:	53                   	push   %ebx
    132e:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1334:	be 01 00 00 00       	mov    $0x1,%esi
    1339:	bb 00 01 00 00       	mov    $0x100,%ebx
    133e:	83 c1 01             	add    $0x1,%ecx
    1341:	0f 48 ce             	cmovs  %esi,%ecx
    1344:	b8 00 00 00 00       	mov    $0x0,%eax
    1349:	8b 10                	mov    (%eax),%edx
    134b:	85 d2                	test   %edx,%edx
    134d:	74 08                	je     1357 <find_empty_process+0x2b>
    134f:	39 8a 2c 02 00 00    	cmp    %ecx,0x22c(%edx)
    1355:	74 e7                	je     133e <find_empty_process+0x12>
    1357:	83 c0 04             	add    $0x4,%eax
    135a:	39 c3                	cmp    %eax,%ebx
    135c:	75 eb                	jne    1349 <find_empty_process+0x1d>
    135e:	89 0d 00 00 00 00    	mov    %ecx,0x0
    1364:	83 3d 04 00 00 00 00 	cmpl   $0x0,0x4
    136b:	74 1e                	je     138b <find_empty_process+0x5f>
    136d:	b8 02 00 00 00       	mov    $0x2,%eax
    1372:	83 3c 85 00 00 00 00 	cmpl   $0x0,0x0(,%eax,4)
    1379:	00 
    137a:	74 14                	je     1390 <find_empty_process+0x64>
    137c:	83 c0 01             	add    $0x1,%eax
    137f:	83 f8 40             	cmp    $0x40,%eax
    1382:	75 ee                	jne    1372 <find_empty_process+0x46>
    1384:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1389:	eb 05                	jmp    1390 <find_empty_process+0x64>
    138b:	b8 01 00 00 00       	mov    $0x1,%eax
    1390:	5b                   	pop    %ebx
    1391:	5e                   	pop    %esi
    1392:	c3                   	ret    

00001393 <panic>:
    1393:	83 ec 14             	sub    $0x14,%esp
    1396:	ff 74 24 18          	pushl  0x18(%esp)
    139a:	68 97 01 00 00       	push   $0x197
    139f:	e8 fc ff ff ff       	call   13a0 <panic+0xd>
    13a4:	83 c4 10             	add    $0x10,%esp
    13a7:	a1 00 00 00 00       	mov    0x0,%eax
    13ac:	39 05 00 00 00 00    	cmp    %eax,0x0
    13b2:	75 12                	jne    13c6 <panic+0x33>
    13b4:	83 ec 0c             	sub    $0xc,%esp
    13b7:	68 b8 01 00 00       	push   $0x1b8
    13bc:	e8 fc ff ff ff       	call   13bd <panic+0x2a>
    13c1:	83 c4 10             	add    $0x10,%esp
    13c4:	eb 05                	jmp    13cb <panic+0x38>
    13c6:	e8 fc ff ff ff       	call   13c7 <panic+0x34>
    13cb:	eb fe                	jmp    13cb <panic+0x38>

000013cd <printk>:
    13cd:	53                   	push   %ebx
    13ce:	83 ec 0c             	sub    $0xc,%esp
    13d1:	8d 44 24 18          	lea    0x18(%esp),%eax
    13d5:	50                   	push   %eax
    13d6:	ff 74 24 18          	pushl  0x18(%esp)
    13da:	68 60 03 00 00       	push   $0x360
    13df:	e8 fc ff ff ff       	call   13e0 <printk+0x13>
    13e4:	89 c3                	mov    %eax,%ebx
    13e6:	0f a0                	push   %fs
    13e8:	1e                   	push   %ds
    13e9:	0f a1                	pop    %fs
    13eb:	53                   	push   %ebx
    13ec:	68 60 03 00 00       	push   $0x360
    13f1:	6a 00                	push   $0x0
    13f3:	e8 fc ff ff ff       	call   13f4 <printk+0x27>
    13f8:	83 c4 08             	add    $0x8,%esp
    13fb:	5b                   	pop    %ebx
    13fc:	0f a1                	pop    %fs
    13fe:	89 d8                	mov    %ebx,%eax
    1400:	83 c4 18             	add    $0x18,%esp
    1403:	5b                   	pop    %ebx
    1404:	c3                   	ret    

00001405 <cpy_str_to_kernel>:
    1405:	57                   	push   %edi
    1406:	56                   	push   %esi
    1407:	8b 44 24 0c          	mov    0xc(%esp),%eax
    140b:	8b 74 24 10          	mov    0x10(%esp),%esi
    140f:	89 c7                	mov    %eax,%edi
    1411:	1e                   	push   %ds
    1412:	0f a0                	push   %fs
    1414:	1f                   	pop    %ds
    1415:	fc                   	cld    
    1416:	ac                   	lods   %ds:(%esi),%al
    1417:	aa                   	stos   %al,%es:(%edi)
    1418:	84 c0                	test   %al,%al
    141a:	75 fa                	jne    1416 <cpy_str_to_kernel+0x11>
    141c:	1f                   	pop    %ds
    141d:	5e                   	pop    %esi
    141e:	5f                   	pop    %edi
    141f:	c3                   	ret    
    1420:	55                   	push   %ebp
    1421:	57                   	push   %edi
    1422:	56                   	push   %esi
    1423:	53                   	push   %ebx
    1424:	83 ec 38             	sub    $0x38,%esp
    1427:	89 c3                	mov    %eax,%ebx
    1429:	89 d5                	mov    %edx,%ebp
    142b:	8b 44 24 54          	mov    0x54(%esp),%eax
    142f:	83 e0 40             	and    $0x40,%eax
    1432:	b8 00 02 00 00       	mov    $0x200,%eax
    1437:	be d8 01 00 00       	mov    $0x1d8,%esi
    143c:	0f 45 f0             	cmovne %eax,%esi
    143f:	8b 54 24 54          	mov    0x54(%esp),%edx
    1443:	83 e2 10             	and    $0x10,%edx
    1446:	8b 44 24 54          	mov    0x54(%esp),%eax
    144a:	83 e0 fe             	and    $0xfffffffe,%eax
    144d:	85 d2                	test   %edx,%edx
    144f:	0f 44 44 24 54       	cmove  0x54(%esp),%eax
    1454:	89 44 24 54          	mov    %eax,0x54(%esp)
    1458:	8d 41 fe             	lea    -0x2(%ecx),%eax
    145b:	83 f8 22             	cmp    $0x22,%eax
    145e:	0f 87 8a 01 00 00    	ja     15ee <cpy_str_to_kernel+0x1e9>
    1464:	89 cf                	mov    %ecx,%edi
    1466:	8b 44 24 54          	mov    0x54(%esp),%eax
    146a:	83 e0 01             	and    $0x1,%eax
    146d:	83 f8 01             	cmp    $0x1,%eax
    1470:	19 c0                	sbb    %eax,%eax
    1472:	83 e0 f0             	and    $0xfffffff0,%eax
    1475:	83 c0 30             	add    $0x30,%eax
    1478:	88 44 24 07          	mov    %al,0x7(%esp)
    147c:	f6 44 24 54 02       	testb  $0x2,0x54(%esp)
    1481:	74 15                	je     1498 <cpy_str_to_kernel+0x93>
    1483:	89 e8                	mov    %ebp,%eax
    1485:	c1 e8 1f             	shr    $0x1f,%eax
    1488:	84 c0                	test   %al,%al
    148a:	74 0c                	je     1498 <cpy_str_to_kernel+0x93>
    148c:	f7 dd                	neg    %ebp
    148e:	c6 44 24 06 2d       	movb   $0x2d,0x6(%esp)
    1493:	e9 6d 01 00 00       	jmp    1605 <cpy_str_to_kernel+0x200>
    1498:	f6 44 24 54 04       	testb  $0x4,0x54(%esp)
    149d:	0f 85 56 01 00 00    	jne    15f9 <cpy_str_to_kernel+0x1f4>
    14a3:	f6 44 24 54 08       	testb  $0x8,0x54(%esp)
    14a8:	0f 85 52 01 00 00    	jne    1600 <cpy_str_to_kernel+0x1fb>
    14ae:	c6 44 24 06 00       	movb   $0x0,0x6(%esp)
    14b3:	8b 44 24 54          	mov    0x54(%esp),%eax
    14b7:	83 e0 20             	and    $0x20,%eax
    14ba:	89 04 24             	mov    %eax,(%esp)
    14bd:	0f 84 4c 01 00 00    	je     160f <cpy_str_to_kernel+0x20a>
    14c3:	83 ff 10             	cmp    $0x10,%edi
    14c6:	75 07                	jne    14cf <cpy_str_to_kernel+0xca>
    14c8:	83 6c 24 4c 02       	subl   $0x2,0x4c(%esp)
    14cd:	eb 0d                	jmp    14dc <cpy_str_to_kernel+0xd7>
    14cf:	83 ff 08             	cmp    $0x8,%edi
    14d2:	0f 94 c0             	sete   %al
    14d5:	0f b6 c0             	movzbl %al,%eax
    14d8:	29 44 24 4c          	sub    %eax,0x4c(%esp)
    14dc:	85 ed                	test   %ebp,%ebp
    14de:	75 0c                	jne    14ec <cpy_str_to_kernel+0xe7>
    14e0:	c6 44 24 14 30       	movb   $0x30,0x14(%esp)
    14e5:	b9 01 00 00 00       	mov    $0x1,%ecx
    14ea:	eb 1f                	jmp    150b <cpy_str_to_kernel+0x106>
    14ec:	b9 00 00 00 00       	mov    $0x0,%ecx
    14f1:	83 c1 01             	add    $0x1,%ecx
    14f4:	89 e8                	mov    %ebp,%eax
    14f6:	ba 00 00 00 00       	mov    $0x0,%edx
    14fb:	f7 f7                	div    %edi
    14fd:	89 c5                	mov    %eax,%ebp
    14ff:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
    1503:	88 54 0c 13          	mov    %dl,0x13(%esp,%ecx,1)
    1507:	85 c0                	test   %eax,%eax
    1509:	75 e6                	jne    14f1 <cpy_str_to_kernel+0xec>
    150b:	3b 4c 24 50          	cmp    0x50(%esp),%ecx
    150f:	89 cd                	mov    %ecx,%ebp
    1511:	0f 4c 6c 24 50       	cmovl  0x50(%esp),%ebp
    1516:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    151a:	29 e8                	sub    %ebp,%eax
    151c:	f6 44 24 54 11       	testb  $0x11,0x54(%esp)
    1521:	75 20                	jne    1543 <cpy_str_to_kernel+0x13e>
    1523:	8d 50 ff             	lea    -0x1(%eax),%edx
    1526:	85 c0                	test   %eax,%eax
    1528:	7e 17                	jle    1541 <cpy_str_to_kernel+0x13c>
    152a:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    152d:	83 c3 01             	add    $0x1,%ebx
    1530:	c6 43 ff 20          	movb   $0x20,-0x1(%ebx)
    1534:	39 d3                	cmp    %edx,%ebx
    1536:	75 f5                	jne    152d <cpy_str_to_kernel+0x128>
    1538:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    153d:	89 d3                	mov    %edx,%ebx
    153f:	eb 02                	jmp    1543 <cpy_str_to_kernel+0x13e>
    1541:	89 d0                	mov    %edx,%eax
    1543:	0f b6 54 24 06       	movzbl 0x6(%esp),%edx
    1548:	84 d2                	test   %dl,%dl
    154a:	74 05                	je     1551 <cpy_str_to_kernel+0x14c>
    154c:	88 13                	mov    %dl,(%ebx)
    154e:	8d 5b 01             	lea    0x1(%ebx),%ebx
    1551:	83 3c 24 00          	cmpl   $0x0,(%esp)
    1555:	74 1f                	je     1576 <cpy_str_to_kernel+0x171>
    1557:	83 ff 08             	cmp    $0x8,%edi
    155a:	75 08                	jne    1564 <cpy_str_to_kernel+0x15f>
    155c:	c6 03 30             	movb   $0x30,(%ebx)
    155f:	8d 5b 01             	lea    0x1(%ebx),%ebx
    1562:	eb 12                	jmp    1576 <cpy_str_to_kernel+0x171>
    1564:	83 ff 10             	cmp    $0x10,%edi
    1567:	75 0d                	jne    1576 <cpy_str_to_kernel+0x171>
    1569:	c6 03 30             	movb   $0x30,(%ebx)
    156c:	0f b6 56 21          	movzbl 0x21(%esi),%edx
    1570:	88 53 01             	mov    %dl,0x1(%ebx)
    1573:	8d 5b 02             	lea    0x2(%ebx),%ebx
    1576:	f6 44 24 54 10       	testb  $0x10,0x54(%esp)
    157b:	75 23                	jne    15a0 <cpy_str_to_kernel+0x19b>
    157d:	8d 50 ff             	lea    -0x1(%eax),%edx
    1580:	85 c0                	test   %eax,%eax
    1582:	7e 1a                	jle    159e <cpy_str_to_kernel+0x199>
    1584:	01 d8                	add    %ebx,%eax
    1586:	0f b6 54 24 07       	movzbl 0x7(%esp),%edx
    158b:	83 c3 01             	add    $0x1,%ebx
    158e:	88 53 ff             	mov    %dl,-0x1(%ebx)
    1591:	39 c3                	cmp    %eax,%ebx
    1593:	75 f6                	jne    158b <cpy_str_to_kernel+0x186>
    1595:	89 c3                	mov    %eax,%ebx
    1597:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    159c:	eb 02                	jmp    15a0 <cpy_str_to_kernel+0x19b>
    159e:	89 d0                	mov    %edx,%eax
    15a0:	39 e9                	cmp    %ebp,%ecx
    15a2:	7d 13                	jge    15b7 <cpy_str_to_kernel+0x1b2>
    15a4:	89 ef                	mov    %ebp,%edi
    15a6:	29 cf                	sub    %ecx,%edi
    15a8:	01 df                	add    %ebx,%edi
    15aa:	83 c3 01             	add    $0x1,%ebx
    15ad:	c6 43 ff 30          	movb   $0x30,-0x1(%ebx)
    15b1:	39 df                	cmp    %ebx,%edi
    15b3:	75 f5                	jne    15aa <cpy_str_to_kernel+0x1a5>
    15b5:	eb 02                	jmp    15b9 <cpy_str_to_kernel+0x1b4>
    15b7:	89 df                	mov    %ebx,%edi
    15b9:	85 c9                	test   %ecx,%ecx
    15bb:	7e 1e                	jle    15db <cpy_str_to_kernel+0x1d6>
    15bd:	89 ce                	mov    %ecx,%esi
    15bf:	8d 54 0c 13          	lea    0x13(%esp,%ecx,1),%edx
    15c3:	8d 6c 24 13          	lea    0x13(%esp),%ebp
    15c7:	89 f9                	mov    %edi,%ecx
    15c9:	83 c1 01             	add    $0x1,%ecx
    15cc:	0f b6 1a             	movzbl (%edx),%ebx
    15cf:	88 59 ff             	mov    %bl,-0x1(%ecx)
    15d2:	83 ea 01             	sub    $0x1,%edx
    15d5:	39 d5                	cmp    %edx,%ebp
    15d7:	75 f0                	jne    15c9 <cpy_str_to_kernel+0x1c4>
    15d9:	01 f7                	add    %esi,%edi
    15db:	85 c0                	test   %eax,%eax
    15dd:	7e 16                	jle    15f5 <cpy_str_to_kernel+0x1f0>
    15df:	01 f8                	add    %edi,%eax
    15e1:	83 c7 01             	add    $0x1,%edi
    15e4:	c6 47 ff 20          	movb   $0x20,-0x1(%edi)
    15e8:	39 f8                	cmp    %edi,%eax
    15ea:	75 f5                	jne    15e1 <cpy_str_to_kernel+0x1dc>
    15ec:	eb 2e                	jmp    161c <cpy_str_to_kernel+0x217>
    15ee:	b8 00 00 00 00       	mov    $0x0,%eax
    15f3:	eb 27                	jmp    161c <cpy_str_to_kernel+0x217>
    15f5:	89 f8                	mov    %edi,%eax
    15f7:	eb 23                	jmp    161c <cpy_str_to_kernel+0x217>
    15f9:	c6 44 24 06 2b       	movb   $0x2b,0x6(%esp)
    15fe:	eb 05                	jmp    1605 <cpy_str_to_kernel+0x200>
    1600:	c6 44 24 06 20       	movb   $0x20,0x6(%esp)
    1605:	83 6c 24 4c 01       	subl   $0x1,0x4c(%esp)
    160a:	e9 a4 fe ff ff       	jmp    14b3 <cpy_str_to_kernel+0xae>
    160f:	85 ed                	test   %ebp,%ebp
    1611:	0f 84 c9 fe ff ff    	je     14e0 <cpy_str_to_kernel+0xdb>
    1617:	e9 d0 fe ff ff       	jmp    14ec <cpy_str_to_kernel+0xe7>
    161c:	83 c4 38             	add    $0x38,%esp
    161f:	5b                   	pop    %ebx
    1620:	5e                   	pop    %esi
    1621:	5f                   	pop    %edi
    1622:	5d                   	pop    %ebp
    1623:	c3                   	ret    

00001624 <vsprintf>:
    1624:	55                   	push   %ebp
    1625:	57                   	push   %edi
    1626:	56                   	push   %esi
    1627:	53                   	push   %ebx
    1628:	83 ec 08             	sub    $0x8,%esp
    162b:	8b 44 24 20          	mov    0x20(%esp),%eax
    162f:	0f b6 10             	movzbl (%eax),%edx
    1632:	84 d2                	test   %dl,%dl
    1634:	0f 84 58 03 00 00    	je     1992 <vsprintf+0x36e>
    163a:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    163e:	80 fa 25             	cmp    $0x25,%dl
    1641:	74 0d                	je     1650 <vsprintf+0x2c>
    1643:	88 55 00             	mov    %dl,0x0(%ebp)
    1646:	89 c3                	mov    %eax,%ebx
    1648:	8d 6d 01             	lea    0x1(%ebp),%ebp
    164b:	e9 31 03 00 00       	jmp    1981 <vsprintf+0x35d>
    1650:	be 00 00 00 00       	mov    $0x0,%esi
    1655:	83 c0 01             	add    $0x1,%eax
    1658:	0f b6 08             	movzbl (%eax),%ecx
    165b:	8d 51 e0             	lea    -0x20(%ecx),%edx
    165e:	80 fa 10             	cmp    $0x10,%dl
    1661:	77 23                	ja     1686 <vsprintf+0x62>
    1663:	0f b6 d2             	movzbl %dl,%edx
    1666:	ff 24 95 00 00 00 00 	jmp    *0x0(,%edx,4)
    166d:	83 ce 10             	or     $0x10,%esi
    1670:	eb e3                	jmp    1655 <vsprintf+0x31>
    1672:	83 ce 04             	or     $0x4,%esi
    1675:	eb de                	jmp    1655 <vsprintf+0x31>
    1677:	83 ce 08             	or     $0x8,%esi
    167a:	eb d9                	jmp    1655 <vsprintf+0x31>
    167c:	83 ce 20             	or     $0x20,%esi
    167f:	eb d4                	jmp    1655 <vsprintf+0x31>
    1681:	83 ce 01             	or     $0x1,%esi
    1684:	eb cf                	jmp    1655 <vsprintf+0x31>
    1686:	8d 51 d0             	lea    -0x30(%ecx),%edx
    1689:	80 fa 09             	cmp    $0x9,%dl
    168c:	77 21                	ja     16af <vsprintf+0x8b>
    168e:	ba 00 00 00 00       	mov    $0x0,%edx
    1693:	83 c0 01             	add    $0x1,%eax
    1696:	8d 14 92             	lea    (%edx,%edx,4),%edx
    1699:	0f be c9             	movsbl %cl,%ecx
    169c:	8d 54 51 d0          	lea    -0x30(%ecx,%edx,2),%edx
    16a0:	0f b6 08             	movzbl (%eax),%ecx
    16a3:	8d 59 d0             	lea    -0x30(%ecx),%ebx
    16a6:	80 fb 09             	cmp    $0x9,%bl
    16a9:	76 e8                	jbe    1693 <vsprintf+0x6f>
    16ab:	89 c3                	mov    %eax,%ebx
    16ad:	eb 27                	jmp    16d6 <vsprintf+0xb2>
    16af:	89 c3                	mov    %eax,%ebx
    16b1:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    16b6:	80 f9 2a             	cmp    $0x2a,%cl
    16b9:	75 1b                	jne    16d6 <vsprintf+0xb2>
    16bb:	8b 7c 24 24          	mov    0x24(%esp),%edi
    16bf:	8d 4f 04             	lea    0x4(%edi),%ecx
    16c2:	8b 17                	mov    (%edi),%edx
    16c4:	85 d2                	test   %edx,%edx
    16c6:	0f 89 cc 02 00 00    	jns    1998 <vsprintf+0x374>
    16cc:	f7 da                	neg    %edx
    16ce:	83 ce 10             	or     $0x10,%esi
    16d1:	e9 c2 02 00 00       	jmp    1998 <vsprintf+0x374>
    16d6:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    16dd:	80 3b 2e             	cmpb   $0x2e,(%ebx)
    16e0:	75 53                	jne    1735 <vsprintf+0x111>
    16e2:	8d 7b 01             	lea    0x1(%ebx),%edi
    16e5:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    16e9:	8d 48 d0             	lea    -0x30(%eax),%ecx
    16ec:	80 f9 09             	cmp    $0x9,%cl
    16ef:	77 1f                	ja     1710 <vsprintf+0xec>
    16f1:	b9 00 00 00 00       	mov    $0x0,%ecx
    16f6:	83 c7 01             	add    $0x1,%edi
    16f9:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    16fc:	0f be c0             	movsbl %al,%eax
    16ff:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
    1703:	0f b6 07             	movzbl (%edi),%eax
    1706:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1709:	80 fb 09             	cmp    $0x9,%bl
    170c:	76 e8                	jbe    16f6 <vsprintf+0xd2>
    170e:	eb 16                	jmp    1726 <vsprintf+0x102>
    1710:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    1715:	3c 2a                	cmp    $0x2a,%al
    1717:	75 0d                	jne    1726 <vsprintf+0x102>
    1719:	8b 44 24 24          	mov    0x24(%esp),%eax
    171d:	8b 08                	mov    (%eax),%ecx
    171f:	8d 40 04             	lea    0x4(%eax),%eax
    1722:	89 44 24 24          	mov    %eax,0x24(%esp)
    1726:	85 c9                	test   %ecx,%ecx
    1728:	b8 00 00 00 00       	mov    $0x0,%eax
    172d:	0f 48 c8             	cmovs  %eax,%ecx
    1730:	89 0c 24             	mov    %ecx,(%esp)
    1733:	89 fb                	mov    %edi,%ebx
    1735:	0f b6 03             	movzbl (%ebx),%eax
    1738:	89 c1                	mov    %eax,%ecx
    173a:	83 e1 df             	and    $0xffffffdf,%ecx
    173d:	80 f9 4c             	cmp    $0x4c,%cl
    1740:	74 04                	je     1746 <vsprintf+0x122>
    1742:	3c 68                	cmp    $0x68,%al
    1744:	75 03                	jne    1749 <vsprintf+0x125>
    1746:	83 c3 01             	add    $0x1,%ebx
    1749:	0f b6 0b             	movzbl (%ebx),%ecx
    174c:	8d 41 a8             	lea    -0x58(%ecx),%eax
    174f:	3c 20                	cmp    $0x20,%al
    1751:	0f 87 f4 01 00 00    	ja     194b <vsprintf+0x327>
    1757:	0f b6 c0             	movzbl %al,%eax
    175a:	ff 24 85 44 00 00 00 	jmp    *0x44(,%eax,4)
    1761:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1767:	75 21                	jne    178a <vsprintf+0x166>
    1769:	8d 42 ff             	lea    -0x1(%edx),%eax
    176c:	85 c0                	test   %eax,%eax
    176e:	7e 18                	jle    1788 <vsprintf+0x164>
    1770:	8d 44 15 ff          	lea    -0x1(%ebp,%edx,1),%eax
    1774:	83 c5 01             	add    $0x1,%ebp
    1777:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    177b:	39 c5                	cmp    %eax,%ebp
    177d:	75 f5                	jne    1774 <vsprintf+0x150>
    177f:	ba 00 00 00 00       	mov    $0x0,%edx
    1784:	89 c5                	mov    %eax,%ebp
    1786:	eb 02                	jmp    178a <vsprintf+0x166>
    1788:	89 c2                	mov    %eax,%edx
    178a:	8b 44 24 24          	mov    0x24(%esp),%eax
    178e:	8d 70 04             	lea    0x4(%eax),%esi
    1791:	8d 4d 01             	lea    0x1(%ebp),%ecx
    1794:	8b 00                	mov    (%eax),%eax
    1796:	88 45 00             	mov    %al,0x0(%ebp)
    1799:	8d 42 ff             	lea    -0x1(%edx),%eax
    179c:	85 c0                	test   %eax,%eax
    179e:	0f 8e cb 01 00 00    	jle    196f <vsprintf+0x34b>
    17a4:	89 d7                	mov    %edx,%edi
    17a6:	01 ea                	add    %ebp,%edx
    17a8:	89 c8                	mov    %ecx,%eax
    17aa:	83 c0 01             	add    $0x1,%eax
    17ad:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    17b1:	39 d0                	cmp    %edx,%eax
    17b3:	75 f5                	jne    17aa <vsprintf+0x186>
    17b5:	8d 6c 39 ff          	lea    -0x1(%ecx,%edi,1),%ebp
    17b9:	89 74 24 24          	mov    %esi,0x24(%esp)
    17bd:	e9 bf 01 00 00       	jmp    1981 <vsprintf+0x35d>
    17c2:	8b 44 24 24          	mov    0x24(%esp),%eax
    17c6:	83 c0 04             	add    $0x4,%eax
    17c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    17cd:	8b 44 24 24          	mov    0x24(%esp),%eax
    17d1:	8b 38                	mov    (%eax),%edi
    17d3:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    17d8:	b8 00 00 00 00       	mov    $0x0,%eax
    17dd:	fc                   	cld    
    17de:	f2 ae                	repnz scas %es:(%edi),%al
    17e0:	f7 d1                	not    %ecx
    17e2:	49                   	dec    %ecx
    17e3:	89 c8                	mov    %ecx,%eax
    17e5:	f7 d0                	not    %eax
    17e7:	01 c7                	add    %eax,%edi
    17e9:	8b 04 24             	mov    (%esp),%eax
    17ec:	85 c0                	test   %eax,%eax
    17ee:	78 0b                	js     17fb <vsprintf+0x1d7>
    17f0:	39 c8                	cmp    %ecx,%eax
    17f2:	0f 9c c0             	setl   %al
    17f5:	84 c0                	test   %al,%al
    17f7:	0f 45 0c 24          	cmovne (%esp),%ecx
    17fb:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1801:	75 23                	jne    1826 <vsprintf+0x202>
    1803:	8d 42 ff             	lea    -0x1(%edx),%eax
    1806:	39 d1                	cmp    %edx,%ecx
    1808:	7d 1a                	jge    1824 <vsprintf+0x200>
    180a:	89 ce                	mov    %ecx,%esi
    180c:	29 ca                	sub    %ecx,%edx
    180e:	8d 44 15 00          	lea    0x0(%ebp,%edx,1),%eax
    1812:	83 c5 01             	add    $0x1,%ebp
    1815:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    1819:	39 c5                	cmp    %eax,%ebp
    181b:	75 f5                	jne    1812 <vsprintf+0x1ee>
    181d:	8d 56 ff             	lea    -0x1(%esi),%edx
    1820:	89 c5                	mov    %eax,%ebp
    1822:	eb 02                	jmp    1826 <vsprintf+0x202>
    1824:	89 c2                	mov    %eax,%edx
    1826:	85 c9                	test   %ecx,%ecx
    1828:	7e 1e                	jle    1848 <vsprintf+0x224>
    182a:	b8 00 00 00 00       	mov    $0x0,%eax
    182f:	89 d6                	mov    %edx,%esi
    1831:	0f b6 14 07          	movzbl (%edi,%eax,1),%edx
    1835:	88 54 05 00          	mov    %dl,0x0(%ebp,%eax,1)
    1839:	83 c0 01             	add    $0x1,%eax
    183c:	39 c1                	cmp    %eax,%ecx
    183e:	75 f1                	jne    1831 <vsprintf+0x20d>
    1840:	89 f2                	mov    %esi,%edx
    1842:	8d 44 0d 00          	lea    0x0(%ebp,%ecx,1),%eax
    1846:	eb 02                	jmp    184a <vsprintf+0x226>
    1848:	89 e8                	mov    %ebp,%eax
    184a:	39 d1                	cmp    %edx,%ecx
    184c:	0f 8d 25 01 00 00    	jge    1977 <vsprintf+0x353>
    1852:	29 ca                	sub    %ecx,%edx
    1854:	8d 2c 10             	lea    (%eax,%edx,1),%ebp
    1857:	83 c0 01             	add    $0x1,%eax
    185a:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    185e:	39 c5                	cmp    %eax,%ebp
    1860:	75 f5                	jne    1857 <vsprintf+0x233>
    1862:	8b 44 24 04          	mov    0x4(%esp),%eax
    1866:	89 44 24 24          	mov    %eax,0x24(%esp)
    186a:	e9 12 01 00 00       	jmp    1981 <vsprintf+0x35d>
    186f:	8b 44 24 24          	mov    0x24(%esp),%eax
    1873:	8d 78 04             	lea    0x4(%eax),%edi
    1876:	56                   	push   %esi
    1877:	ff 74 24 04          	pushl  0x4(%esp)
    187b:	52                   	push   %edx
    187c:	b9 08 00 00 00       	mov    $0x8,%ecx
    1881:	8b 44 24 30          	mov    0x30(%esp),%eax
    1885:	8b 10                	mov    (%eax),%edx
    1887:	89 e8                	mov    %ebp,%eax
    1889:	e8 92 fb ff ff       	call   1420 <cpy_str_to_kernel+0x1b>
    188e:	89 c5                	mov    %eax,%ebp
    1890:	83 c4 0c             	add    $0xc,%esp
    1893:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1897:	e9 e5 00 00 00       	jmp    1981 <vsprintf+0x35d>
    189c:	83 fa ff             	cmp    $0xffffffff,%edx
    189f:	75 08                	jne    18a9 <vsprintf+0x285>
    18a1:	83 ce 01             	or     $0x1,%esi
    18a4:	ba 08 00 00 00       	mov    $0x8,%edx
    18a9:	8b 44 24 24          	mov    0x24(%esp),%eax
    18ad:	8d 78 04             	lea    0x4(%eax),%edi
    18b0:	56                   	push   %esi
    18b1:	ff 74 24 04          	pushl  0x4(%esp)
    18b5:	52                   	push   %edx
    18b6:	b9 10 00 00 00       	mov    $0x10,%ecx
    18bb:	8b 44 24 30          	mov    0x30(%esp),%eax
    18bf:	8b 10                	mov    (%eax),%edx
    18c1:	89 e8                	mov    %ebp,%eax
    18c3:	e8 58 fb ff ff       	call   1420 <cpy_str_to_kernel+0x1b>
    18c8:	89 c5                	mov    %eax,%ebp
    18ca:	83 c4 0c             	add    $0xc,%esp
    18cd:	89 7c 24 24          	mov    %edi,0x24(%esp)
    18d1:	e9 ab 00 00 00       	jmp    1981 <vsprintf+0x35d>
    18d6:	83 ce 40             	or     $0x40,%esi
    18d9:	8b 44 24 24          	mov    0x24(%esp),%eax
    18dd:	8d 78 04             	lea    0x4(%eax),%edi
    18e0:	56                   	push   %esi
    18e1:	ff 74 24 04          	pushl  0x4(%esp)
    18e5:	52                   	push   %edx
    18e6:	b9 10 00 00 00       	mov    $0x10,%ecx
    18eb:	8b 44 24 30          	mov    0x30(%esp),%eax
    18ef:	8b 10                	mov    (%eax),%edx
    18f1:	89 e8                	mov    %ebp,%eax
    18f3:	e8 28 fb ff ff       	call   1420 <cpy_str_to_kernel+0x1b>
    18f8:	89 c5                	mov    %eax,%ebp
    18fa:	83 c4 0c             	add    $0xc,%esp
    18fd:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1901:	eb 7e                	jmp    1981 <vsprintf+0x35d>
    1903:	83 ce 02             	or     $0x2,%esi
    1906:	8b 44 24 24          	mov    0x24(%esp),%eax
    190a:	8d 78 04             	lea    0x4(%eax),%edi
    190d:	56                   	push   %esi
    190e:	ff 74 24 04          	pushl  0x4(%esp)
    1912:	52                   	push   %edx
    1913:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1918:	8b 44 24 30          	mov    0x30(%esp),%eax
    191c:	8b 10                	mov    (%eax),%edx
    191e:	89 e8                	mov    %ebp,%eax
    1920:	e8 fb fa ff ff       	call   1420 <cpy_str_to_kernel+0x1b>
    1925:	89 c5                	mov    %eax,%ebp
    1927:	83 c4 0c             	add    $0xc,%esp
    192a:	89 7c 24 24          	mov    %edi,0x24(%esp)
    192e:	eb 51                	jmp    1981 <vsprintf+0x35d>
    1930:	8b 44 24 24          	mov    0x24(%esp),%eax
    1934:	8b 00                	mov    (%eax),%eax
    1936:	89 ea                	mov    %ebp,%edx
    1938:	2b 54 24 1c          	sub    0x1c(%esp),%edx
    193c:	89 10                	mov    %edx,(%eax)
    193e:	8b 44 24 24          	mov    0x24(%esp),%eax
    1942:	8d 40 04             	lea    0x4(%eax),%eax
    1945:	89 44 24 24          	mov    %eax,0x24(%esp)
    1949:	eb 36                	jmp    1981 <vsprintf+0x35d>
    194b:	80 f9 25             	cmp    $0x25,%cl
    194e:	74 10                	je     1960 <vsprintf+0x33c>
    1950:	8d 45 01             	lea    0x1(%ebp),%eax
    1953:	c6 45 00 25          	movb   $0x25,0x0(%ebp)
    1957:	0f b6 0b             	movzbl (%ebx),%ecx
    195a:	84 c9                	test   %cl,%cl
    195c:	74 0a                	je     1968 <vsprintf+0x344>
    195e:	89 c5                	mov    %eax,%ebp
    1960:	88 4d 00             	mov    %cl,0x0(%ebp)
    1963:	8d 6d 01             	lea    0x1(%ebp),%ebp
    1966:	eb 19                	jmp    1981 <vsprintf+0x35d>
    1968:	83 eb 01             	sub    $0x1,%ebx
    196b:	89 c5                	mov    %eax,%ebp
    196d:	eb 12                	jmp    1981 <vsprintf+0x35d>
    196f:	89 cd                	mov    %ecx,%ebp
    1971:	89 74 24 24          	mov    %esi,0x24(%esp)
    1975:	eb 0a                	jmp    1981 <vsprintf+0x35d>
    1977:	89 c5                	mov    %eax,%ebp
    1979:	8b 44 24 04          	mov    0x4(%esp),%eax
    197d:	89 44 24 24          	mov    %eax,0x24(%esp)
    1981:	8d 43 01             	lea    0x1(%ebx),%eax
    1984:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
    1988:	84 d2                	test   %dl,%dl
    198a:	0f 85 ae fc ff ff    	jne    163e <vsprintf+0x1a>
    1990:	eb 18                	jmp    19aa <vsprintf+0x386>
    1992:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1996:	eb 12                	jmp    19aa <vsprintf+0x386>
    1998:	89 c3                	mov    %eax,%ebx
    199a:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    199e:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    19a5:	e9 8b fd ff ff       	jmp    1735 <vsprintf+0x111>
    19aa:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
    19ae:	89 e8                	mov    %ebp,%eax
    19b0:	2b 44 24 1c          	sub    0x1c(%esp),%eax
    19b4:	83 c4 08             	add    $0x8,%esp
    19b7:	5b                   	pop    %ebx
    19b8:	5e                   	pop    %esi
    19b9:	5f                   	pop    %edi
    19ba:	5d                   	pop    %ebp
    19bb:	c3                   	ret    

000019bc <sys_ftime>:
    19bc:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19c1:	c3                   	ret    

000019c2 <sys_break>:
    19c2:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19c7:	c3                   	ret    

000019c8 <sys_ptrace>:
    19c8:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19cd:	c3                   	ret    

000019ce <sys_stty>:
    19ce:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19d3:	c3                   	ret    

000019d4 <sys_gtty>:
    19d4:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19d9:	c3                   	ret    

000019da <sys_rename>:
    19da:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19df:	c3                   	ret    

000019e0 <sys_prof>:
    19e0:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19e5:	c3                   	ret    

000019e6 <sys_setregid>:
    19e6:	53                   	push   %ebx
    19e7:	8b 54 24 08          	mov    0x8(%esp),%edx
    19eb:	8b 44 24 0c          	mov    0xc(%esp),%eax
    19ef:	85 d2                	test   %edx,%edx
    19f1:	7e 22                	jle    1a15 <sys_setregid+0x2f>
    19f3:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    19f9:	0f b7 99 46 02 00 00 	movzwl 0x246(%ecx),%ebx
    1a00:	39 da                	cmp    %ebx,%edx
    1a02:	74 0a                	je     1a0e <sys_setregid+0x28>
    1a04:	66 83 b9 42 02 00 00 	cmpw   $0x0,0x242(%ecx)
    1a0b:	00 
    1a0c:	75 4a                	jne    1a58 <sys_setregid+0x72>
    1a0e:	66 89 91 46 02 00 00 	mov    %dx,0x246(%ecx)
    1a15:	85 c0                	test   %eax,%eax
    1a17:	7e 46                	jle    1a5f <sys_setregid+0x79>
    1a19:	8b 15 00 00 00 00    	mov    0x0,%edx
    1a1f:	0f b7 8a 46 02 00 00 	movzwl 0x246(%edx),%ecx
    1a26:	39 c8                	cmp    %ecx,%eax
    1a28:	74 20                	je     1a4a <sys_setregid+0x64>
    1a2a:	0f b7 8a 48 02 00 00 	movzwl 0x248(%edx),%ecx
    1a31:	39 c8                	cmp    %ecx,%eax
    1a33:	74 15                	je     1a4a <sys_setregid+0x64>
    1a35:	0f b7 8a 4a 02 00 00 	movzwl 0x24a(%edx),%ecx
    1a3c:	39 c8                	cmp    %ecx,%eax
    1a3e:	74 0a                	je     1a4a <sys_setregid+0x64>
    1a40:	66 83 ba 42 02 00 00 	cmpw   $0x0,0x242(%edx)
    1a47:	00 
    1a48:	75 1c                	jne    1a66 <sys_setregid+0x80>
    1a4a:	66 89 82 48 02 00 00 	mov    %ax,0x248(%edx)
    1a51:	b8 00 00 00 00       	mov    $0x0,%eax
    1a56:	eb 13                	jmp    1a6b <sys_setregid+0x85>
    1a58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1a5d:	eb 0c                	jmp    1a6b <sys_setregid+0x85>
    1a5f:	b8 00 00 00 00       	mov    $0x0,%eax
    1a64:	eb 05                	jmp    1a6b <sys_setregid+0x85>
    1a66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1a6b:	5b                   	pop    %ebx
    1a6c:	c3                   	ret    

00001a6d <sys_setgid>:
    1a6d:	8b 44 24 04          	mov    0x4(%esp),%eax
    1a71:	50                   	push   %eax
    1a72:	50                   	push   %eax
    1a73:	e8 fc ff ff ff       	call   1a74 <sys_setgid+0x7>
    1a78:	83 c4 08             	add    $0x8,%esp
    1a7b:	c3                   	ret    

00001a7c <sys_acct>:
    1a7c:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a81:	c3                   	ret    

00001a82 <sys_phys>:
    1a82:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a87:	c3                   	ret    

00001a88 <sys_lock>:
    1a88:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a8d:	c3                   	ret    

00001a8e <sys_mpx>:
    1a8e:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a93:	c3                   	ret    

00001a94 <sys_ulimit>:
    1a94:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a99:	c3                   	ret    

00001a9a <sys_time>:
    1a9a:	56                   	push   %esi
    1a9b:	53                   	push   %ebx
    1a9c:	83 ec 04             	sub    $0x4,%esp
    1a9f:	8b 74 24 10          	mov    0x10(%esp),%esi
    1aa3:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1aa9:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1aae:	89 c8                	mov    %ecx,%eax
    1ab0:	f7 ea                	imul   %edx
    1ab2:	c1 fa 05             	sar    $0x5,%edx
    1ab5:	c1 f9 1f             	sar    $0x1f,%ecx
    1ab8:	29 ca                	sub    %ecx,%edx
    1aba:	89 d3                	mov    %edx,%ebx
    1abc:	03 1d 00 00 00 00    	add    0x0,%ebx
    1ac2:	85 f6                	test   %esi,%esi
    1ac4:	74 11                	je     1ad7 <sys_time+0x3d>
    1ac6:	83 ec 08             	sub    $0x8,%esp
    1ac9:	6a 04                	push   $0x4
    1acb:	56                   	push   %esi
    1acc:	e8 fc ff ff ff       	call   1acd <sys_time+0x33>
    1ad1:	64 89 1e             	mov    %ebx,%fs:(%esi)
    1ad4:	83 c4 10             	add    $0x10,%esp
    1ad7:	89 d8                	mov    %ebx,%eax
    1ad9:	83 c4 04             	add    $0x4,%esp
    1adc:	5b                   	pop    %ebx
    1add:	5e                   	pop    %esi
    1ade:	c3                   	ret    

00001adf <sys_setreuid>:
    1adf:	55                   	push   %ebp
    1ae0:	57                   	push   %edi
    1ae1:	56                   	push   %esi
    1ae2:	53                   	push   %ebx
    1ae3:	83 ec 08             	sub    $0x8,%esp
    1ae6:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1aea:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    1aee:	a1 00 00 00 00       	mov    0x0,%eax
    1af3:	0f b7 b0 40 02 00 00 	movzwl 0x240(%eax),%esi
    1afa:	0f b7 de             	movzwl %si,%ebx
    1afd:	89 1c 24             	mov    %ebx,(%esp)
    1b00:	85 d2                	test   %edx,%edx
    1b02:	7e 28                	jle    1b2c <sys_setreuid+0x4d>
    1b04:	0f b7 b8 42 02 00 00 	movzwl 0x242(%eax),%edi
    1b0b:	39 d3                	cmp    %edx,%ebx
    1b0d:	0f 94 44 24 07       	sete   0x7(%esp)
    1b12:	0f b7 ef             	movzwl %di,%ebp
    1b15:	39 d5                	cmp    %edx,%ebp
    1b17:	0f 94 c3             	sete   %bl
    1b1a:	0a 5c 24 07          	or     0x7(%esp),%bl
    1b1e:	75 05                	jne    1b25 <sys_setreuid+0x46>
    1b20:	66 85 ff             	test   %di,%di
    1b23:	75 3f                	jne    1b64 <sys_setreuid+0x85>
    1b25:	66 89 90 40 02 00 00 	mov    %dx,0x240(%eax)
    1b2c:	85 c9                	test   %ecx,%ecx
    1b2e:	7e 3b                	jle    1b6b <sys_setreuid+0x8c>
    1b30:	39 0c 24             	cmp    %ecx,(%esp)
    1b33:	74 13                	je     1b48 <sys_setreuid+0x69>
    1b35:	0f b7 90 42 02 00 00 	movzwl 0x242(%eax),%edx
    1b3c:	66 85 d2             	test   %dx,%dx
    1b3f:	74 07                	je     1b48 <sys_setreuid+0x69>
    1b41:	0f b7 d2             	movzwl %dx,%edx
    1b44:	39 ca                	cmp    %ecx,%edx
    1b46:	75 0e                	jne    1b56 <sys_setreuid+0x77>
    1b48:	66 89 88 42 02 00 00 	mov    %cx,0x242(%eax)
    1b4f:	b8 00 00 00 00       	mov    $0x0,%eax
    1b54:	eb 1a                	jmp    1b70 <sys_setreuid+0x91>
    1b56:	66 89 b0 40 02 00 00 	mov    %si,0x240(%eax)
    1b5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1b62:	eb 0c                	jmp    1b70 <sys_setreuid+0x91>
    1b64:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1b69:	eb 05                	jmp    1b70 <sys_setreuid+0x91>
    1b6b:	b8 00 00 00 00       	mov    $0x0,%eax
    1b70:	83 c4 08             	add    $0x8,%esp
    1b73:	5b                   	pop    %ebx
    1b74:	5e                   	pop    %esi
    1b75:	5f                   	pop    %edi
    1b76:	5d                   	pop    %ebp
    1b77:	c3                   	ret    

00001b78 <sys_setuid>:
    1b78:	8b 44 24 04          	mov    0x4(%esp),%eax
    1b7c:	50                   	push   %eax
    1b7d:	50                   	push   %eax
    1b7e:	e8 fc ff ff ff       	call   1b7f <sys_setuid+0x7>
    1b83:	83 c4 08             	add    $0x8,%esp
    1b86:	c3                   	ret    

00001b87 <sys_stime>:
    1b87:	a1 00 00 00 00       	mov    0x0,%eax
    1b8c:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1b93:	00 
    1b94:	75 2e                	jne    1bc4 <sys_stime+0x3d>
    1b96:	53                   	push   %ebx
    1b97:	8b 44 24 08          	mov    0x8(%esp),%eax
    1b9b:	64 8b 08             	mov    %fs:(%eax),%ecx
    1b9e:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1ba4:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1ba9:	89 d8                	mov    %ebx,%eax
    1bab:	f7 ea                	imul   %edx
    1bad:	c1 fa 05             	sar    $0x5,%edx
    1bb0:	c1 fb 1f             	sar    $0x1f,%ebx
    1bb3:	29 da                	sub    %ebx,%edx
    1bb5:	29 d1                	sub    %edx,%ecx
    1bb7:	89 0d 00 00 00 00    	mov    %ecx,0x0
    1bbd:	b8 00 00 00 00       	mov    $0x0,%eax
    1bc2:	eb 06                	jmp    1bca <sys_stime+0x43>
    1bc4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1bc9:	c3                   	ret    
    1bca:	5b                   	pop    %ebx
    1bcb:	c3                   	ret    

00001bcc <sys_times>:
    1bcc:	53                   	push   %ebx
    1bcd:	83 ec 08             	sub    $0x8,%esp
    1bd0:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1bd4:	85 db                	test   %ebx,%ebx
    1bd6:	74 3a                	je     1c12 <sys_times+0x46>
    1bd8:	83 ec 08             	sub    $0x8,%esp
    1bdb:	6a 10                	push   $0x10
    1bdd:	53                   	push   %ebx
    1bde:	e8 fc ff ff ff       	call   1bdf <sys_times+0x13>
    1be3:	a1 00 00 00 00       	mov    0x0,%eax
    1be8:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
    1bee:	64 89 13             	mov    %edx,%fs:(%ebx)
    1bf1:	8b 90 54 02 00 00    	mov    0x254(%eax),%edx
    1bf7:	64 89 53 04          	mov    %edx,%fs:0x4(%ebx)
    1bfb:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
    1c01:	64 89 53 08          	mov    %edx,%fs:0x8(%ebx)
    1c05:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
    1c0b:	64 89 43 0c          	mov    %eax,%fs:0xc(%ebx)
    1c0f:	83 c4 10             	add    $0x10,%esp
    1c12:	a1 00 00 00 00       	mov    0x0,%eax
    1c17:	83 c4 08             	add    $0x8,%esp
    1c1a:	5b                   	pop    %ebx
    1c1b:	c3                   	ret    

00001c1c <sys_brk>:
    1c1c:	8b 54 24 04          	mov    0x4(%esp),%edx
    1c20:	a1 00 00 00 00       	mov    0x0,%eax
    1c25:	39 90 1c 02 00 00    	cmp    %edx,0x21c(%eax)
    1c2b:	77 16                	ja     1c43 <sys_brk+0x27>
    1c2d:	8b 88 28 02 00 00    	mov    0x228(%eax),%ecx
    1c33:	81 e9 00 40 00 00    	sub    $0x4000,%ecx
    1c39:	39 ca                	cmp    %ecx,%edx
    1c3b:	73 06                	jae    1c43 <sys_brk+0x27>
    1c3d:	89 90 24 02 00 00    	mov    %edx,0x224(%eax)
    1c43:	8b 80 24 02 00 00    	mov    0x224(%eax),%eax
    1c49:	c3                   	ret    

00001c4a <sys_setpgid>:
    1c4a:	56                   	push   %esi
    1c4b:	53                   	push   %ebx
    1c4c:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    1c50:	8b 74 24 10          	mov    0x10(%esp),%esi
    1c54:	85 db                	test   %ebx,%ebx
    1c56:	75 0b                	jne    1c63 <sys_setpgid+0x19>
    1c58:	a1 00 00 00 00       	mov    0x0,%eax
    1c5d:	8b 98 2c 02 00 00    	mov    0x22c(%eax),%ebx
    1c63:	85 f6                	test   %esi,%esi
    1c65:	75 0b                	jne    1c72 <sys_setpgid+0x28>
    1c67:	a1 00 00 00 00       	mov    0x0,%eax
    1c6c:	8b b0 2c 02 00 00    	mov    0x22c(%eax),%esi
    1c72:	b8 00 00 00 00       	mov    $0x0,%eax
    1c77:	b9 00 01 00 00       	mov    $0x100,%ecx
    1c7c:	8b 10                	mov    (%eax),%edx
    1c7e:	85 d2                	test   %edx,%edx
    1c80:	74 31                	je     1cb3 <sys_setpgid+0x69>
    1c82:	3b 9a 2c 02 00 00    	cmp    0x22c(%edx),%ebx
    1c88:	75 29                	jne    1cb3 <sys_setpgid+0x69>
    1c8a:	83 ba 3c 02 00 00 00 	cmpl   $0x0,0x23c(%edx)
    1c91:	75 2e                	jne    1cc1 <sys_setpgid+0x77>
    1c93:	a1 00 00 00 00       	mov    0x0,%eax
    1c98:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
    1c9e:	39 82 38 02 00 00    	cmp    %eax,0x238(%edx)
    1ca4:	75 22                	jne    1cc8 <sys_setpgid+0x7e>
    1ca6:	89 b2 34 02 00 00    	mov    %esi,0x234(%edx)
    1cac:	b8 00 00 00 00       	mov    $0x0,%eax
    1cb1:	eb 1a                	jmp    1ccd <sys_setpgid+0x83>
    1cb3:	83 c0 04             	add    $0x4,%eax
    1cb6:	39 c8                	cmp    %ecx,%eax
    1cb8:	75 c2                	jne    1c7c <sys_setpgid+0x32>
    1cba:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
    1cbf:	eb 0c                	jmp    1ccd <sys_setpgid+0x83>
    1cc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1cc6:	eb 05                	jmp    1ccd <sys_setpgid+0x83>
    1cc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ccd:	5b                   	pop    %ebx
    1cce:	5e                   	pop    %esi
    1ccf:	c3                   	ret    

00001cd0 <sys_getpgrp>:
    1cd0:	a1 00 00 00 00       	mov    0x0,%eax
    1cd5:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
    1cdb:	c3                   	ret    

00001cdc <sys_setsid>:
    1cdc:	8b 15 00 00 00 00    	mov    0x0,%edx
    1ce2:	83 ba 3c 02 00 00 00 	cmpl   $0x0,0x23c(%edx)
    1ce9:	74 0a                	je     1cf5 <sys_setsid+0x19>
    1ceb:	66 83 ba 42 02 00 00 	cmpw   $0x0,0x242(%edx)
    1cf2:	00 
    1cf3:	75 27                	jne    1d1c <sys_setsid+0x40>
    1cf5:	c7 82 3c 02 00 00 01 	movl   $0x1,0x23c(%edx)
    1cfc:	00 00 00 
    1cff:	8b 82 2c 02 00 00    	mov    0x22c(%edx),%eax
    1d05:	89 82 34 02 00 00    	mov    %eax,0x234(%edx)
    1d0b:	89 82 38 02 00 00    	mov    %eax,0x238(%edx)
    1d11:	c7 82 68 02 00 00 ff 	movl   $0xffffffff,0x268(%edx)
    1d18:	ff ff ff 
    1d1b:	c3                   	ret    
    1d1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1d21:	c3                   	ret    

00001d22 <sys_uname>:
    1d22:	53                   	push   %ebx
    1d23:	83 ec 08             	sub    $0x8,%esp
    1d26:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1d2a:	85 db                	test   %ebx,%ebx
    1d2c:	74 2d                	je     1d5b <sys_uname+0x39>
    1d2e:	83 ec 08             	sub    $0x8,%esp
    1d31:	6a 2d                	push   $0x2d
    1d33:	53                   	push   %ebx
    1d34:	e8 fc ff ff ff       	call   1d35 <sys_uname+0x13>
    1d39:	83 c4 10             	add    $0x10,%esp
    1d3c:	b8 00 00 00 00       	mov    $0x0,%eax
    1d41:	0f b6 90 60 12 00 00 	movzbl 0x1260(%eax),%edx
    1d48:	64 88 14 03          	mov    %dl,%fs:(%ebx,%eax,1)
    1d4c:	83 c0 01             	add    $0x1,%eax
    1d4f:	83 f8 2d             	cmp    $0x2d,%eax
    1d52:	75 ed                	jne    1d41 <sys_uname+0x1f>
    1d54:	b8 00 00 00 00       	mov    $0x0,%eax
    1d59:	eb 05                	jmp    1d60 <sys_uname+0x3e>
    1d5b:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    1d60:	83 c4 08             	add    $0x8,%esp
    1d63:	5b                   	pop    %ebx
    1d64:	c3                   	ret    

00001d65 <sys_umask>:
    1d65:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1d6b:	0f b7 81 6c 02 00 00 	movzwl 0x26c(%ecx),%eax
    1d72:	0f b7 54 24 04       	movzwl 0x4(%esp),%edx
    1d77:	66 81 e2 ff 01       	and    $0x1ff,%dx
    1d7c:	66 89 91 6c 02 00 00 	mov    %dx,0x26c(%ecx)
    1d83:	c3                   	ret    

00001d84 <release>:
    1d84:	53                   	push   %ebx
    1d85:	83 ec 08             	sub    $0x8,%esp
    1d88:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1d8c:	85 db                	test   %ebx,%ebx
    1d8e:	0f 84 8c 00 00 00    	je     1e20 <release+0x9c>
    1d94:	3b 1d 04 00 00 00    	cmp    0x4,%ebx
    1d9a:	74 10                	je     1dac <release+0x28>
    1d9c:	b8 02 00 00 00       	mov    $0x2,%eax
    1da1:	3b 1c 85 00 00 00 00 	cmp    0x0(,%eax,4),%ebx
    1da8:	75 5e                	jne    1e08 <release+0x84>
    1daa:	eb 05                	jmp    1db1 <release+0x2d>
    1dac:	b8 01 00 00 00       	mov    $0x1,%eax
    1db1:	c7 04 85 00 00 00 00 	movl   $0x0,0x0(,%eax,4)
    1db8:	00 00 00 00 
    1dbc:	83 ec 0c             	sub    $0xc,%esp
    1dbf:	ff b3 04 03 00 00    	pushl  0x304(%ebx)
    1dc5:	e8 fc ff ff ff       	call   1dc6 <release+0x42>
    1dca:	83 c4 10             	add    $0x10,%esp
    1dcd:	85 c0                	test   %eax,%eax
    1dcf:	75 10                	jne    1de1 <release+0x5d>
    1dd1:	83 ec 0c             	sub    $0xc,%esp
    1dd4:	68 28 02 00 00       	push   $0x228
    1dd9:	e8 fc ff ff ff       	call   1dda <release+0x56>
    1dde:	83 c4 10             	add    $0x10,%esp
    1de1:	83 ec 0c             	sub    $0xc,%esp
    1de4:	53                   	push   %ebx
    1de5:	e8 fc ff ff ff       	call   1de6 <release+0x62>
    1dea:	83 c4 10             	add    $0x10,%esp
    1ded:	85 c0                	test   %eax,%eax
    1def:	75 10                	jne    1e01 <release+0x7d>
    1df1:	83 ec 0c             	sub    $0xc,%esp
    1df4:	68 54 02 00 00       	push   $0x254
    1df9:	e8 fc ff ff ff       	call   1dfa <release+0x76>
    1dfe:	83 c4 10             	add    $0x10,%esp
    1e01:	e8 fc ff ff ff       	call   1e02 <release+0x7e>
    1e06:	eb 18                	jmp    1e20 <release+0x9c>
    1e08:	83 c0 01             	add    $0x1,%eax
    1e0b:	83 f8 40             	cmp    $0x40,%eax
    1e0e:	75 91                	jne    1da1 <release+0x1d>
    1e10:	83 ec 0c             	sub    $0xc,%esp
    1e13:	68 7c 02 00 00       	push   $0x27c
    1e18:	e8 fc ff ff ff       	call   1e19 <release+0x95>
    1e1d:	83 c4 10             	add    $0x10,%esp
    1e20:	83 c4 08             	add    $0x8,%esp
    1e23:	5b                   	pop    %ebx
    1e24:	c3                   	ret    

00001e25 <sys_kill>:
    1e25:	55                   	push   %ebp
    1e26:	57                   	push   %edi
    1e27:	56                   	push   %esi
    1e28:	53                   	push   %ebx
    1e29:	83 ec 08             	sub    $0x8,%esp
    1e2c:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    1e30:	8b 7c 24 20          	mov    0x20(%esp),%edi
    1e34:	85 f6                	test   %esi,%esi
    1e36:	75 51                	jne    1e89 <sys_kill+0x64>
    1e38:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1e3e:	8d 4f ff             	lea    -0x1(%edi),%ecx
    1e41:	bd 01 00 00 00       	mov    $0x1,%ebp
    1e46:	d3 e5                	shl    %cl,%ebp
    1e48:	b8 00 00 00 00       	mov    $0x0,%eax
    1e4d:	ba 00 01 00 00       	mov    $0x100,%edx
    1e52:	89 ce                	mov    %ecx,%esi
    1e54:	eb 23                	jmp    1e79 <sys_kill+0x54>
    1e56:	8b 0a                	mov    (%edx),%ecx
    1e58:	85 c9                	test   %ecx,%ecx
    1e5a:	74 1d                	je     1e79 <sys_kill+0x54>
    1e5c:	8b bb 2c 02 00 00    	mov    0x22c(%ebx),%edi
    1e62:	39 b9 34 02 00 00    	cmp    %edi,0x234(%ecx)
    1e68:	75 0f                	jne    1e79 <sys_kill+0x54>
    1e6a:	83 fe 1f             	cmp    $0x1f,%esi
    1e6d:	77 05                	ja     1e74 <sys_kill+0x4f>
    1e6f:	09 69 0c             	or     %ebp,0xc(%ecx)
    1e72:	eb 05                	jmp    1e79 <sys_kill+0x54>
    1e74:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    1e79:	83 ea 04             	sub    $0x4,%edx
    1e7c:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1e82:	75 d2                	jne    1e56 <sys_kill+0x31>
    1e84:	e9 30 01 00 00       	jmp    1fb9 <sys_kill+0x194>
    1e89:	85 f6                	test   %esi,%esi
    1e8b:	7e 74                	jle    1f01 <sys_kill+0xdc>
    1e8d:	8d 4f ff             	lea    -0x1(%edi),%ecx
    1e90:	a1 00 00 00 00       	mov    0x0,%eax
    1e95:	89 04 24             	mov    %eax,(%esp)
    1e98:	b8 01 00 00 00       	mov    $0x1,%eax
    1e9d:	d3 e0                	shl    %cl,%eax
    1e9f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ea3:	83 f9 20             	cmp    $0x20,%ecx
    1ea6:	19 ff                	sbb    %edi,%edi
    1ea8:	83 cf ea             	or     $0xffffffea,%edi
    1eab:	b8 00 00 00 00       	mov    $0x0,%eax
    1eb0:	ba 00 01 00 00       	mov    $0x100,%edx
    1eb5:	eb 3a                	jmp    1ef1 <sys_kill+0xcc>
    1eb7:	8b 1a                	mov    (%edx),%ebx
    1eb9:	85 db                	test   %ebx,%ebx
    1ebb:	74 34                	je     1ef1 <sys_kill+0xcc>
    1ebd:	3b b3 2c 02 00 00    	cmp    0x22c(%ebx),%esi
    1ec3:	75 2c                	jne    1ef1 <sys_kill+0xcc>
    1ec5:	83 f9 1f             	cmp    $0x1f,%ecx
    1ec8:	77 21                	ja     1eeb <sys_kill+0xc6>
    1eca:	8b 2c 24             	mov    (%esp),%ebp
    1ecd:	0f b7 ad 42 02 00 00 	movzwl 0x242(%ebp),%ebp
    1ed4:	66 39 ab 42 02 00 00 	cmp    %bp,0x242(%ebx)
    1edb:	74 05                	je     1ee2 <sys_kill+0xbd>
    1edd:	66 85 ed             	test   %bp,%bp
    1ee0:	75 0d                	jne    1eef <sys_kill+0xca>
    1ee2:	8b 6c 24 04          	mov    0x4(%esp),%ebp
    1ee6:	09 6b 0c             	or     %ebp,0xc(%ebx)
    1ee9:	eb 06                	jmp    1ef1 <sys_kill+0xcc>
    1eeb:	89 f8                	mov    %edi,%eax
    1eed:	eb 02                	jmp    1ef1 <sys_kill+0xcc>
    1eef:	89 f8                	mov    %edi,%eax
    1ef1:	83 ea 04             	sub    $0x4,%edx
    1ef4:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1efa:	75 bb                	jne    1eb7 <sys_kill+0x92>
    1efc:	e9 b8 00 00 00       	jmp    1fb9 <sys_kill+0x194>
    1f01:	b8 00 00 00 00       	mov    $0x0,%eax
    1f06:	83 fe ff             	cmp    $0xffffffff,%esi
    1f09:	0f 85 aa 00 00 00    	jne    1fb9 <sys_kill+0x194>
    1f0f:	8b 35 00 00 00 00    	mov    0x0,%esi
    1f15:	8d 4f ff             	lea    -0x1(%edi),%ecx
    1f18:	bf 01 00 00 00       	mov    $0x1,%edi
    1f1d:	d3 e7                	shl    %cl,%edi
    1f1f:	89 cb                	mov    %ecx,%ebx
    1f21:	83 f9 20             	cmp    $0x20,%ecx
    1f24:	19 c0                	sbb    %eax,%eax
    1f26:	83 c8 ea             	or     $0xffffffea,%eax
    1f29:	89 04 24             	mov    %eax,(%esp)
    1f2c:	b8 00 00 00 00       	mov    $0x0,%eax
    1f31:	ba 00 01 00 00       	mov    $0x100,%edx
    1f36:	eb 66                	jmp    1f9e <sys_kill+0x179>
    1f38:	8b 0a                	mov    (%edx),%ecx
    1f3a:	85 c9                	test   %ecx,%ecx
    1f3c:	74 6d                	je     1fab <sys_kill+0x186>
    1f3e:	83 fb 1f             	cmp    $0x1f,%ebx
    1f41:	77 68                	ja     1fab <sys_kill+0x186>
    1f43:	0f b7 ae 42 02 00 00 	movzwl 0x242(%esi),%ebp
    1f4a:	66 39 a9 42 02 00 00 	cmp    %bp,0x242(%ecx)
    1f51:	74 05                	je     1f58 <sys_kill+0x133>
    1f53:	66 85 ed             	test   %bp,%bp
    1f56:	75 5a                	jne    1fb2 <sys_kill+0x18d>
    1f58:	09 79 0c             	or     %edi,0xc(%ecx)
    1f5b:	eb 36                	jmp    1f93 <sys_kill+0x16e>
    1f5d:	8b 0a                	mov    (%edx),%ecx
    1f5f:	85 c9                	test   %ecx,%ecx
    1f61:	74 30                	je     1f93 <sys_kill+0x16e>
    1f63:	83 b9 34 02 00 00 01 	cmpl   $0x1,0x234(%ecx)
    1f6a:	75 27                	jne    1f93 <sys_kill+0x16e>
    1f6c:	83 fb 1f             	cmp    $0x1f,%ebx
    1f6f:	77 1a                	ja     1f8b <sys_kill+0x166>
    1f71:	0f b7 ae 42 02 00 00 	movzwl 0x242(%esi),%ebp
    1f78:	66 39 a9 42 02 00 00 	cmp    %bp,0x242(%ecx)
    1f7f:	74 05                	je     1f86 <sys_kill+0x161>
    1f81:	66 85 ed             	test   %bp,%bp
    1f84:	75 0a                	jne    1f90 <sys_kill+0x16b>
    1f86:	09 79 0c             	or     %edi,0xc(%ecx)
    1f89:	eb 08                	jmp    1f93 <sys_kill+0x16e>
    1f8b:	8b 04 24             	mov    (%esp),%eax
    1f8e:	eb 03                	jmp    1f93 <sys_kill+0x16e>
    1f90:	8b 04 24             	mov    (%esp),%eax
    1f93:	83 ea 04             	sub    $0x4,%edx
    1f96:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1f9c:	77 bf                	ja     1f5d <sys_kill+0x138>
    1f9e:	83 ea 04             	sub    $0x4,%edx
    1fa1:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1fa7:	77 8f                	ja     1f38 <sys_kill+0x113>
    1fa9:	eb 0e                	jmp    1fb9 <sys_kill+0x194>
    1fab:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    1fb0:	eb ec                	jmp    1f9e <sys_kill+0x179>
    1fb2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fb7:	eb e5                	jmp    1f9e <sys_kill+0x179>
    1fb9:	83 c4 08             	add    $0x8,%esp
    1fbc:	5b                   	pop    %ebx
    1fbd:	5e                   	pop    %esi
    1fbe:	5f                   	pop    %edi
    1fbf:	5d                   	pop    %ebp
    1fc0:	c3                   	ret    

00001fc1 <do_exit>:
    1fc1:	55                   	push   %ebp
    1fc2:	57                   	push   %edi
    1fc3:	56                   	push   %esi
    1fc4:	53                   	push   %ebx
    1fc5:	83 ec 0c             	sub    $0xc,%esp
    1fc8:	b9 0f 00 00 00       	mov    $0xf,%ecx
    1fcd:	0f 03 c9             	lsl    %cx,%ecx
    1fd0:	41                   	inc    %ecx
    1fd1:	50                   	push   %eax
    1fd2:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1fd8:	8d 83 d8 02 00 00    	lea    0x2d8(%ebx),%eax
    1fde:	83 c0 07             	add    $0x7,%eax
    1fe1:	8a 30                	mov    (%eax),%dh
    1fe3:	83 e8 03             	sub    $0x3,%eax
    1fe6:	8a 10                	mov    (%eax),%dl
    1fe8:	c1 e2 10             	shl    $0x10,%edx
    1feb:	83 e8 02             	sub    $0x2,%eax
    1fee:	66 8b 10             	mov    (%eax),%dx
    1ff1:	58                   	pop    %eax
    1ff2:	6a 02                	push   $0x2
    1ff4:	53                   	push   %ebx
    1ff5:	51                   	push   %ecx
    1ff6:	52                   	push   %edx
    1ff7:	e8 fc ff ff ff       	call   1ff8 <do_exit+0x37>
    1ffc:	b9 17 00 00 00       	mov    $0x17,%ecx
    2001:	0f 03 c9             	lsl    %cx,%ecx
    2004:	41                   	inc    %ecx
    2005:	50                   	push   %eax
    2006:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    200c:	8d 83 e0 02 00 00    	lea    0x2e0(%ebx),%eax
    2012:	83 c0 07             	add    $0x7,%eax
    2015:	8a 30                	mov    (%eax),%dh
    2017:	83 e8 03             	sub    $0x3,%eax
    201a:	8a 10                	mov    (%eax),%dl
    201c:	c1 e2 10             	shl    $0x10,%edx
    201f:	83 e8 02             	sub    $0x2,%eax
    2022:	66 8b 10             	mov    (%eax),%dx
    2025:	58                   	pop    %eax
    2026:	6a 02                	push   $0x2
    2028:	53                   	push   %ebx
    2029:	51                   	push   %ecx
    202a:	52                   	push   %edx
    202b:	e8 fc ff ff ff       	call   202c <do_exit+0x6b>
    2030:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2036:	8b 3d 04 00 00 00    	mov    0x4,%edi
    203c:	be 00 00 00 00       	mov    $0x0,%esi
    2041:	bb 00 01 00 00       	mov    $0x100,%ebx
    2046:	83 c4 20             	add    $0x20,%esp
    2049:	89 f0                	mov    %esi,%eax
    204b:	8b 10                	mov    (%eax),%edx
    204d:	85 d2                	test   %edx,%edx
    204f:	74 28                	je     2079 <do_exit+0xb8>
    2051:	8b a9 2c 02 00 00    	mov    0x22c(%ecx),%ebp
    2057:	39 aa 30 02 00 00    	cmp    %ebp,0x230(%edx)
    205d:	75 1a                	jne    2079 <do_exit+0xb8>
    205f:	c7 82 30 02 00 00 01 	movl   $0x1,0x230(%edx)
    2066:	00 00 00 
    2069:	83 3a 03             	cmpl   $0x3,(%edx)
    206c:	75 0b                	jne    2079 <do_exit+0xb8>
    206e:	85 ff                	test   %edi,%edi
    2070:	74 07                	je     2079 <do_exit+0xb8>
    2072:	81 4f 0c 00 00 01 00 	orl    $0x10000,0xc(%edi)
    2079:	83 c0 04             	add    $0x4,%eax
    207c:	39 d8                	cmp    %ebx,%eax
    207e:	75 cb                	jne    204b <do_exit+0x8a>
    2080:	bf 00 00 00 00       	mov    $0x0,%edi
    2085:	a1 00 00 00 00       	mov    0x0,%eax
    208a:	83 bc b8 80 02 00 00 	cmpl   $0x0,0x280(%eax,%edi,4)
    2091:	00 
    2092:	74 0c                	je     20a0 <do_exit+0xdf>
    2094:	83 ec 0c             	sub    $0xc,%esp
    2097:	57                   	push   %edi
    2098:	e8 fc ff ff ff       	call   2099 <do_exit+0xd8>
    209d:	83 c4 10             	add    $0x10,%esp
    20a0:	83 c7 01             	add    $0x1,%edi
    20a3:	83 ff 14             	cmp    $0x14,%edi
    20a6:	75 dd                	jne    2085 <do_exit+0xc4>
    20a8:	83 ec 0c             	sub    $0xc,%esp
    20ab:	a1 00 00 00 00       	mov    0x0,%eax
    20b0:	ff b0 70 02 00 00    	pushl  0x270(%eax)
    20b6:	e8 fc ff ff ff       	call   20b7 <do_exit+0xf6>
    20bb:	a1 00 00 00 00       	mov    0x0,%eax
    20c0:	c7 80 70 02 00 00 00 	movl   $0x0,0x270(%eax)
    20c7:	00 00 00 
    20ca:	83 c4 04             	add    $0x4,%esp
    20cd:	ff b0 74 02 00 00    	pushl  0x274(%eax)
    20d3:	e8 fc ff ff ff       	call   20d4 <do_exit+0x113>
    20d8:	a1 00 00 00 00       	mov    0x0,%eax
    20dd:	c7 80 74 02 00 00 00 	movl   $0x0,0x274(%eax)
    20e4:	00 00 00 
    20e7:	83 c4 04             	add    $0x4,%esp
    20ea:	ff b0 78 02 00 00    	pushl  0x278(%eax)
    20f0:	e8 fc ff ff ff       	call   20f1 <do_exit+0x130>
    20f5:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    20fb:	c7 81 78 02 00 00 00 	movl   $0x0,0x278(%ecx)
    2102:	00 00 00 
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	83 b9 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ecx)
    210f:	0f 84 d0 00 00 00    	je     21e5 <do_exit+0x224>
    2115:	8b 81 68 02 00 00    	mov    0x268(%ecx),%eax
    211b:	85 c0                	test   %eax,%eax
    211d:	0f 88 94 00 00 00    	js     21b7 <do_exit+0x1f6>
    2123:	69 c0 60 0c 00 00    	imul   $0xc60,%eax,%eax
    2129:	c7 80 24 00 00 00 00 	movl   $0x0,0x24(%eax)
    2130:	00 00 00 
    2133:	3b 0d 00 00 00 00    	cmp    0x0,%ecx
    2139:	75 0a                	jne    2145 <do_exit+0x184>
    213b:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
    2142:	00 00 00 
    2145:	83 b9 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ecx)
    214c:	74 76                	je     21c4 <do_exit+0x203>
    214e:	b8 00 01 00 00       	mov    $0x100,%eax
    2153:	eb 18                	jmp    216d <do_exit+0x1ac>
    2155:	8b 10                	mov    (%eax),%edx
    2157:	85 d2                	test   %edx,%edx
    2159:	74 12                	je     216d <do_exit+0x1ac>
    215b:	8b b9 38 02 00 00    	mov    0x238(%ecx),%edi
    2161:	39 ba 38 02 00 00    	cmp    %edi,0x238(%edx)
    2167:	75 04                	jne    216d <do_exit+0x1ac>
    2169:	83 4a 0c 01          	orl    $0x1,0xc(%edx)
    216d:	83 e8 04             	sub    $0x4,%eax
    2170:	3d 00 00 00 00       	cmp    $0x0,%eax
    2175:	75 de                	jne    2155 <do_exit+0x194>
    2177:	eb 4b                	jmp    21c4 <do_exit+0x203>
    2179:	8b 06                	mov    (%esi),%eax
    217b:	85 c0                	test   %eax,%eax
    217d:	74 11                	je     2190 <do_exit+0x1cf>
    217f:	39 90 2c 02 00 00    	cmp    %edx,0x22c(%eax)
    2185:	75 09                	jne    2190 <do_exit+0x1cf>
    2187:	81 48 0c 00 00 01 00 	orl    $0x10000,0xc(%eax)
    218e:	eb 62                	jmp    21f2 <do_exit+0x231>
    2190:	83 c6 04             	add    $0x4,%esi
    2193:	39 de                	cmp    %ebx,%esi
    2195:	75 e2                	jne    2179 <do_exit+0x1b8>
    2197:	83 ec 0c             	sub    $0xc,%esp
    219a:	68 aa 01 00 00       	push   $0x1aa
    219f:	e8 fc ff ff ff       	call   21a0 <do_exit+0x1df>
    21a4:	83 c4 04             	add    $0x4,%esp
    21a7:	ff 35 00 00 00 00    	pushl  0x0
    21ad:	e8 fc ff ff ff       	call   21ae <do_exit+0x1ed>
    21b2:	83 c4 10             	add    $0x10,%esp
    21b5:	eb 3b                	jmp    21f2 <do_exit+0x231>
    21b7:	3b 0d 00 00 00 00    	cmp    0x0,%ecx
    21bd:	75 8f                	jne    214e <do_exit+0x18d>
    21bf:	e9 77 ff ff ff       	jmp    213b <do_exit+0x17a>
    21c4:	c7 01 03 00 00 00    	movl   $0x3,(%ecx)
    21ca:	a1 00 00 00 00       	mov    0x0,%eax
    21cf:	8b 54 24 20          	mov    0x20(%esp),%edx
    21d3:	89 90 14 02 00 00    	mov    %edx,0x214(%eax)
    21d9:	8b 90 30 02 00 00    	mov    0x230(%eax),%edx
    21df:	85 d2                	test   %edx,%edx
    21e1:	75 96                	jne    2179 <do_exit+0x1b8>
    21e3:	eb b2                	jmp    2197 <do_exit+0x1d6>
    21e5:	39 0d 00 00 00 00    	cmp    %ecx,0x0
    21eb:	75 d7                	jne    21c4 <do_exit+0x203>
    21ed:	e9 49 ff ff ff       	jmp    213b <do_exit+0x17a>
    21f2:	e8 fc ff ff ff       	call   21f3 <do_exit+0x232>
    21f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    21fc:	83 c4 0c             	add    $0xc,%esp
    21ff:	5b                   	pop    %ebx
    2200:	5e                   	pop    %esi
    2201:	5f                   	pop    %edi
    2202:	5d                   	pop    %ebp
    2203:	c3                   	ret    

00002204 <sys_exit>:
    2204:	83 ec 18             	sub    $0x18,%esp
    2207:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    220b:	c1 e0 08             	shl    $0x8,%eax
    220e:	0f b7 c0             	movzwl %ax,%eax
    2211:	50                   	push   %eax
    2212:	e8 fc ff ff ff       	call   2213 <sys_exit+0xf>
    2217:	83 c4 1c             	add    $0x1c,%esp
    221a:	c3                   	ret    

0000221b <sys_waitpid>:
    221b:	55                   	push   %ebp
    221c:	57                   	push   %edi
    221d:	56                   	push   %esi
    221e:	53                   	push   %ebx
    221f:	83 ec 24             	sub    $0x24,%esp
    2222:	8b 5c 24 38          	mov    0x38(%esp),%ebx
    2226:	6a 04                	push   $0x4
    2228:	ff 74 24 40          	pushl  0x40(%esp)
    222c:	e8 fc ff ff ff       	call   222d <sys_waitpid+0x12>
    2231:	83 c4 10             	add    $0x10,%esp
    2234:	8b 74 24 38          	mov    0x38(%esp),%esi
    2238:	83 e6 02             	and    $0x2,%esi
    223b:	89 dd                	mov    %ebx,%ebp
    223d:	f7 dd                	neg    %ebp
    223f:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2245:	b8 fc 00 00 00       	mov    $0xfc,%eax
    224a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2251:	00 
    2252:	8b 10                	mov    (%eax),%edx
    2254:	85 d2                	test   %edx,%edx
    2256:	0f 84 bb 00 00 00    	je     2317 <sys_waitpid+0xfc>
    225c:	39 ca                	cmp    %ecx,%edx
    225e:	0f 84 b3 00 00 00    	je     2317 <sys_waitpid+0xfc>
    2264:	8b b9 2c 02 00 00    	mov    0x22c(%ecx),%edi
    226a:	39 ba 30 02 00 00    	cmp    %edi,0x230(%edx)
    2270:	0f 85 a1 00 00 00    	jne    2317 <sys_waitpid+0xfc>
    2276:	85 db                	test   %ebx,%ebx
    2278:	7e 0e                	jle    2288 <sys_waitpid+0x6d>
    227a:	3b 9a 2c 02 00 00    	cmp    0x22c(%edx),%ebx
    2280:	0f 85 91 00 00 00    	jne    2317 <sys_waitpid+0xfc>
    2286:	eb 21                	jmp    22a9 <sys_waitpid+0x8e>
    2288:	85 db                	test   %ebx,%ebx
    228a:	75 10                	jne    229c <sys_waitpid+0x81>
    228c:	8b b9 34 02 00 00    	mov    0x234(%ecx),%edi
    2292:	39 ba 34 02 00 00    	cmp    %edi,0x234(%edx)
    2298:	75 7d                	jne    2317 <sys_waitpid+0xfc>
    229a:	eb 0d                	jmp    22a9 <sys_waitpid+0x8e>
    229c:	83 fb ff             	cmp    $0xffffffff,%ebx
    229f:	74 08                	je     22a9 <sys_waitpid+0x8e>
    22a1:	39 aa 34 02 00 00    	cmp    %ebp,0x234(%edx)
    22a7:	75 6e                	jne    2317 <sys_waitpid+0xfc>
    22a9:	8b 3a                	mov    (%edx),%edi
    22ab:	83 ff 03             	cmp    $0x3,%edi
    22ae:	74 20                	je     22d0 <sys_waitpid+0xb5>
    22b0:	83 ff 04             	cmp    $0x4,%edi
    22b3:	75 5a                	jne    230f <sys_waitpid+0xf4>
    22b5:	85 f6                	test   %esi,%esi
    22b7:	74 5e                	je     2317 <sys_waitpid+0xfc>
    22b9:	b8 7f 00 00 00       	mov    $0x7f,%eax
    22be:	8b 74 24 34          	mov    0x34(%esp),%esi
    22c2:	64 89 06             	mov    %eax,%fs:(%esi)
    22c5:	8b 82 2c 02 00 00    	mov    0x22c(%edx),%eax
    22cb:	e9 9a 00 00 00       	jmp    236a <sys_waitpid+0x14f>
    22d0:	8b 92 50 02 00 00    	mov    0x250(%edx),%edx
    22d6:	01 91 58 02 00 00    	add    %edx,0x258(%ecx)
    22dc:	8b 10                	mov    (%eax),%edx
    22de:	8b 92 54 02 00 00    	mov    0x254(%edx),%edx
    22e4:	01 91 5c 02 00 00    	add    %edx,0x25c(%ecx)
    22ea:	8b 00                	mov    (%eax),%eax
    22ec:	8b 98 2c 02 00 00    	mov    0x22c(%eax),%ebx
    22f2:	8b b0 14 02 00 00    	mov    0x214(%eax),%esi
    22f8:	83 ec 0c             	sub    $0xc,%esp
    22fb:	50                   	push   %eax
    22fc:	e8 fc ff ff ff       	call   22fd <sys_waitpid+0xe2>
    2301:	8b 44 24 44          	mov    0x44(%esp),%eax
    2305:	64 89 30             	mov    %esi,%fs:(%eax)
    2308:	83 c4 10             	add    $0x10,%esp
    230b:	89 d8                	mov    %ebx,%eax
    230d:	eb 5b                	jmp    236a <sys_waitpid+0x14f>
    230f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2316:	00 
    2317:	83 e8 04             	sub    $0x4,%eax
    231a:	3d 00 00 00 00       	cmp    $0x0,%eax
    231f:	0f 85 2d ff ff ff    	jne    2252 <sys_waitpid+0x37>
    2325:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    232a:	74 32                	je     235e <sys_waitpid+0x143>
    232c:	f6 44 24 38 01       	testb  $0x1,0x38(%esp)
    2331:	75 32                	jne    2365 <sys_waitpid+0x14a>
    2333:	c7 01 01 00 00 00    	movl   $0x1,(%ecx)
    2339:	e8 fc ff ff ff       	call   233a <sys_waitpid+0x11f>
    233e:	8b 15 00 00 00 00    	mov    0x0,%edx
    2344:	8b 42 0c             	mov    0xc(%edx),%eax
    2347:	25 ff ff fe ff       	and    $0xfffeffff,%eax
    234c:	89 42 0c             	mov    %eax,0xc(%edx)
    234f:	85 c0                	test   %eax,%eax
    2351:	0f 84 e8 fe ff ff    	je     223f <sys_waitpid+0x24>
    2357:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    235c:	eb 0c                	jmp    236a <sys_waitpid+0x14f>
    235e:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
    2363:	eb 05                	jmp    236a <sys_waitpid+0x14f>
    2365:	b8 00 00 00 00       	mov    $0x0,%eax
    236a:	83 c4 1c             	add    $0x1c,%esp
    236d:	5b                   	pop    %ebx
    236e:	5e                   	pop    %esi
    236f:	5f                   	pop    %edi
    2370:	5d                   	pop    %ebp
    2371:	c3                   	ret    

00002372 <sys_sgetmask>:
    2372:	a1 00 00 00 00       	mov    0x0,%eax
    2377:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
    237d:	c3                   	ret    

0000237e <sys_ssetmask>:
    237e:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2384:	8b 81 10 02 00 00    	mov    0x210(%ecx),%eax
    238a:	8b 54 24 04          	mov    0x4(%esp),%edx
    238e:	80 e6 fe             	and    $0xfe,%dh
    2391:	89 91 10 02 00 00    	mov    %edx,0x210(%ecx)
    2397:	c3                   	ret    

00002398 <sys_signal>:
    2398:	8b 54 24 04          	mov    0x4(%esp),%edx
    239c:	8d 42 ff             	lea    -0x1(%edx),%eax
    239f:	83 f8 1f             	cmp    $0x1f,%eax
    23a2:	77 2c                	ja     23d0 <sys_signal+0x38>
    23a4:	83 fa 09             	cmp    $0x9,%edx
    23a7:	74 27                	je     23d0 <sys_signal+0x38>
    23a9:	c1 e2 04             	shl    $0x4,%edx
    23ac:	03 15 00 00 00 00    	add    0x0,%edx
    23b2:	8b 02                	mov    (%edx),%eax
    23b4:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    23b8:	89 0a                	mov    %ecx,(%edx)
    23ba:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
    23c1:	c7 42 08 00 00 00 c0 	movl   $0xc0000000,0x8(%edx)
    23c8:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    23cc:	89 4a 0c             	mov    %ecx,0xc(%edx)
    23cf:	c3                   	ret    
    23d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    23d5:	c3                   	ret    

000023d6 <sys_sigaction>:
    23d6:	55                   	push   %ebp
    23d7:	57                   	push   %edi
    23d8:	56                   	push   %esi
    23d9:	53                   	push   %ebx
    23da:	83 ec 1c             	sub    $0x1c,%esp
    23dd:	8b 74 24 30          	mov    0x30(%esp),%esi
    23e1:	8b 54 24 34          	mov    0x34(%esp),%edx
    23e5:	8b 5c 24 38          	mov    0x38(%esp),%ebx
    23e9:	8d 46 ff             	lea    -0x1(%esi),%eax
    23ec:	83 f8 1f             	cmp    $0x1f,%eax
    23ef:	0f 87 92 00 00 00    	ja     2487 <sys_sigaction+0xb1>
    23f5:	83 fe 09             	cmp    $0x9,%esi
    23f8:	0f 84 89 00 00 00    	je     2487 <sys_sigaction+0xb1>
    23fe:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2404:	89 c7                	mov    %eax,%edi
    2406:	89 f0                	mov    %esi,%eax
    2408:	c1 e0 04             	shl    $0x4,%eax
    240b:	01 c8                	add    %ecx,%eax
    240d:	8b 28                	mov    (%eax),%ebp
    240f:	89 2c 24             	mov    %ebp,(%esp)
    2412:	8b 68 04             	mov    0x4(%eax),%ebp
    2415:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    2419:	8b 68 08             	mov    0x8(%eax),%ebp
    241c:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    2420:	8b 40 0c             	mov    0xc(%eax),%eax
    2423:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2427:	89 f0                	mov    %esi,%eax
    2429:	c1 e0 04             	shl    $0x4,%eax
    242c:	8d 04 08             	lea    (%eax,%ecx,1),%eax
    242f:	8d 68 10             	lea    0x10(%eax),%ebp
    2432:	83 c0 01             	add    $0x1,%eax
    2435:	64 8a 0a             	mov    %fs:(%edx),%cl
    2438:	88 48 ff             	mov    %cl,-0x1(%eax)
    243b:	8d 52 01             	lea    0x1(%edx),%edx
    243e:	39 e8                	cmp    %ebp,%eax
    2440:	75 f0                	jne    2432 <sys_sigaction+0x5c>
    2442:	eb 5c                	jmp    24a0 <sys_sigaction+0xca>
    2444:	0f b6 10             	movzbl (%eax),%edx
    2447:	64 88 13             	mov    %dl,%fs:(%ebx)
    244a:	83 c0 01             	add    $0x1,%eax
    244d:	83 c3 01             	add    $0x1,%ebx
    2450:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    2454:	39 c8                	cmp    %ecx,%eax
    2456:	75 ec                	jne    2444 <sys_sigaction+0x6e>
    2458:	c1 e6 04             	shl    $0x4,%esi
    245b:	03 35 00 00 00 00    	add    0x0,%esi
    2461:	8b 46 08             	mov    0x8(%esi),%eax
    2464:	25 00 00 00 40       	and    $0x40000000,%eax
    2469:	74 0e                	je     2479 <sys_sigaction+0xa3>
    246b:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
    2472:	b8 00 00 00 00       	mov    $0x0,%eax
    2477:	eb 2d                	jmp    24a6 <sys_sigaction+0xd0>
    2479:	ba 01 00 00 00       	mov    $0x1,%edx
    247e:	89 f9                	mov    %edi,%ecx
    2480:	d3 e2                	shl    %cl,%edx
    2482:	09 56 04             	or     %edx,0x4(%esi)
    2485:	eb 1f                	jmp    24a6 <sys_sigaction+0xd0>
    2487:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    248c:	eb 18                	jmp    24a6 <sys_sigaction+0xd0>
    248e:	83 ec 08             	sub    $0x8,%esp
    2491:	6a 10                	push   $0x10
    2493:	53                   	push   %ebx
    2494:	e8 fc ff ff ff       	call   2495 <sys_sigaction+0xbf>
    2499:	83 c4 10             	add    $0x10,%esp
    249c:	89 e0                	mov    %esp,%eax
    249e:	eb a4                	jmp    2444 <sys_sigaction+0x6e>
    24a0:	85 db                	test   %ebx,%ebx
    24a2:	75 ea                	jne    248e <sys_sigaction+0xb8>
    24a4:	eb b2                	jmp    2458 <sys_sigaction+0x82>
    24a6:	83 c4 1c             	add    $0x1c,%esp
    24a9:	5b                   	pop    %ebx
    24aa:	5e                   	pop    %esi
    24ab:	5f                   	pop    %edi
    24ac:	5d                   	pop    %ebp
    24ad:	c3                   	ret    

000024ae <do_signal>:
    24ae:	57                   	push   %edi
    24af:	56                   	push   %esi
    24b0:	53                   	push   %ebx
    24b1:	8b 7c 24 10          	mov    0x10(%esp),%edi
    24b5:	89 fb                	mov    %edi,%ebx
    24b7:	c1 e3 04             	shl    $0x4,%ebx
    24ba:	03 1d 00 00 00 00    	add    0x0,%ebx
    24c0:	8b 03                	mov    (%ebx),%eax
    24c2:	83 f8 01             	cmp    $0x1,%eax
    24c5:	0f 84 b1 00 00 00    	je     257c <do_signal+0xce>
    24cb:	85 c0                	test   %eax,%eax
    24cd:	75 1f                	jne    24ee <do_signal+0x40>
    24cf:	83 ff 11             	cmp    $0x11,%edi
    24d2:	0f 84 a4 00 00 00    	je     257c <do_signal+0xce>
    24d8:	83 ec 0c             	sub    $0xc,%esp
    24db:	8d 4f ff             	lea    -0x1(%edi),%ecx
    24de:	b8 01 00 00 00       	mov    $0x1,%eax
    24e3:	d3 e0                	shl    %cl,%eax
    24e5:	50                   	push   %eax
    24e6:	e8 fc ff ff ff       	call   24e7 <do_signal+0x39>
    24eb:	83 c4 10             	add    $0x10,%esp
    24ee:	8b 43 08             	mov    0x8(%ebx),%eax
    24f1:	85 c0                	test   %eax,%eax
    24f3:	79 06                	jns    24fb <do_signal+0x4d>
    24f5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    24fb:	25 00 00 00 40       	and    $0x40000000,%eax
    2500:	83 f8 01             	cmp    $0x1,%eax
    2503:	19 c0                	sbb    %eax,%eax
    2505:	f7 d0                	not    %eax
    2507:	8d 04 85 20 00 00 00 	lea    0x20(,%eax,4),%eax
    250e:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    2512:	29 c6                	sub    %eax,%esi
    2514:	83 ec 08             	sub    $0x8,%esp
    2517:	50                   	push   %eax
    2518:	56                   	push   %esi
    2519:	e8 fc ff ff ff       	call   251a <do_signal+0x6c>
    251e:	8b 43 0c             	mov    0xc(%ebx),%eax
    2521:	64 89 06             	mov    %eax,%fs:(%esi)
    2524:	8d 46 08             	lea    0x8(%esi),%eax
    2527:	64 89 7e 04          	mov    %edi,%fs:0x4(%esi)
    252b:	83 c4 10             	add    $0x10,%esp
    252e:	f6 43 0b 40          	testb  $0x40,0xb(%ebx)
    2532:	75 13                	jne    2547 <do_signal+0x99>
    2534:	8d 46 0c             	lea    0xc(%esi),%eax
    2537:	8b 15 00 00 00 00    	mov    0x0,%edx
    253d:	8b 92 10 02 00 00    	mov    0x210(%edx),%edx
    2543:	64 89 56 08          	mov    %edx,%fs:0x8(%esi)
    2547:	8b 54 24 14          	mov    0x14(%esp),%edx
    254b:	64 89 10             	mov    %edx,%fs:(%eax)
    254e:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    2552:	64 89 50 04          	mov    %edx,%fs:0x4(%eax)
    2556:	8b 54 24 20          	mov    0x20(%esp),%edx
    255a:	64 89 50 08          	mov    %edx,%fs:0x8(%eax)
    255e:	8b 54 24 38          	mov    0x38(%esp),%edx
    2562:	64 89 50 0c          	mov    %edx,%fs:0xc(%eax)
    2566:	8b 54 24 30          	mov    0x30(%esp),%edx
    256a:	64 89 50 10          	mov    %edx,%fs:0x10(%eax)
    256e:	a1 00 00 00 00       	mov    0x0,%eax
    2573:	8b 53 04             	mov    0x4(%ebx),%edx
    2576:	09 90 10 02 00 00    	or     %edx,0x210(%eax)
    257c:	5b                   	pop    %ebx
    257d:	5e                   	pop    %esi
    257e:	5f                   	pop    %edi
    257f:	c3                   	ret    

00002580 <kernel_mktime>:
    2580:	53                   	push   %ebx
    2581:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    2585:	8b 51 14             	mov    0x14(%ecx),%edx
    2588:	8d 42 be             	lea    -0x42(%edx),%eax
    258b:	89 d3                	mov    %edx,%ebx
    258d:	83 eb 45             	sub    $0x45,%ebx
    2590:	0f 48 d8             	cmovs  %eax,%ebx
    2593:	c1 fb 02             	sar    $0x2,%ebx
    2596:	69 db 80 51 01 00    	imul   $0x15180,%ebx,%ebx
    259c:	8d 42 ba             	lea    -0x46(%edx),%eax
    259f:	69 c0 80 33 e1 01    	imul   $0x1e13380,%eax,%eax
    25a5:	01 d8                	add    %ebx,%eax
    25a7:	8b 59 10             	mov    0x10(%ecx),%ebx
    25aa:	03 04 9d e0 00 00 00 	add    0xe0(,%ebx,4),%eax
    25b1:	83 fb 01             	cmp    $0x1,%ebx
    25b4:	7e 0e                	jle    25c4 <kernel_mktime+0x44>
    25b6:	83 e2 03             	and    $0x3,%edx
    25b9:	8d 98 80 ae fe ff    	lea    -0x15180(%eax),%ebx
    25bf:	85 d2                	test   %edx,%edx
    25c1:	0f 45 c3             	cmovne %ebx,%eax
    25c4:	8b 51 0c             	mov    0xc(%ecx),%edx
    25c7:	83 ea 01             	sub    $0x1,%edx
    25ca:	69 d2 80 51 01 00    	imul   $0x15180,%edx,%edx
    25d0:	01 d0                	add    %edx,%eax
    25d2:	69 51 08 10 0e 00 00 	imul   $0xe10,0x8(%ecx),%edx
    25d9:	01 d0                	add    %edx,%eax
    25db:	6b 51 04 3c          	imul   $0x3c,0x4(%ecx),%edx
    25df:	01 d0                	add    %edx,%eax
    25e1:	03 01                	add    (%ecx),%eax
    25e3:	5b                   	pop    %ebx
    25e4:	c3                   	ret    
