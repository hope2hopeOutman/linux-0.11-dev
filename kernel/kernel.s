
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
     fb3:	c7 83 18 02 00 00 00 	movl   $0x40000000,0x218(%ebx)
     fba:	00 00 40 
     fbd:	ba 00 00 00 40       	mov    $0x40000000,%edx
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
     ff5:	68 00 00 00 c0       	push   $0xc0000000
     ffa:	68 00 00 00 40       	push   $0x40000000
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
    101d:	68 00 00 00 c0       	push   $0xc0000000
    1022:	68 00 00 00 40       	push   $0x40000000
    1027:	e8 fc ff ff ff       	call   1028 <copy_mem+0x7d>
    102c:	83 c4 14             	add    $0x14,%esp
    102f:	68 10 01 00 00       	push   $0x110
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
    105d:	0f 84 be 02 00 00    	je     1321 <copy_process+0x2db>
    1063:	89 c3                	mov    %eax,%ebx
    1065:	89 c7                	mov    %eax,%edi
    1067:	89 04 ad 00 00 00 00 	mov    %eax,0x0(,%ebp,4)
    106e:	83 ec 04             	sub    $0x4,%esp
    1071:	ff 35 00 00 00 00    	pushl  0x0
    1077:	55                   	push   %ebp
    1078:	68 97 01 00 00       	push   $0x197
    107d:	e8 fc ff ff ff       	call   107e <copy_process+0x38>
    1082:	8b 35 00 00 00 00    	mov    0x0,%esi
    1088:	b9 ef 00 00 00       	mov    $0xef,%ecx
    108d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    108f:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
    1095:	a1 00 00 00 00       	mov    0x0,%eax
    109a:	89 83 2c 02 00 00    	mov    %eax,0x22c(%ebx)
    10a0:	8b 15 00 00 00 00    	mov    0x0,%edx
    10a6:	8b 82 2c 02 00 00    	mov    0x22c(%edx),%eax
    10ac:	89 83 30 02 00 00    	mov    %eax,0x230(%ebx)
    10b2:	8b 43 08             	mov    0x8(%ebx),%eax
    10b5:	89 43 04             	mov    %eax,0x4(%ebx)
    10b8:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    10bf:	c7 83 4c 02 00 00 00 	movl   $0x0,0x24c(%ebx)
    10c6:	00 00 00 
    10c9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
    10d0:	00 00 00 
    10d3:	c7 83 54 02 00 00 00 	movl   $0x0,0x254(%ebx)
    10da:	00 00 00 
    10dd:	c7 83 50 02 00 00 00 	movl   $0x0,0x250(%ebx)
    10e4:	00 00 00 
    10e7:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
    10ee:	00 00 00 
    10f1:	c7 83 58 02 00 00 00 	movl   $0x0,0x258(%ebx)
    10f8:	00 00 00 
    10fb:	a1 00 00 00 00       	mov    0x0,%eax
    1100:	89 83 60 02 00 00    	mov    %eax,0x260(%ebx)
    1106:	c7 83 e8 02 00 00 00 	movl   $0x0,0x2e8(%ebx)
    110d:	00 00 00 
    1110:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
    1116:	89 83 ec 02 00 00    	mov    %eax,0x2ec(%ebx)
    111c:	c7 83 f0 02 00 00 10 	movl   $0x10,0x2f0(%ebx)
    1123:	00 00 00 
    1126:	8b 44 24 60          	mov    0x60(%esp),%eax
    112a:	89 83 08 03 00 00    	mov    %eax,0x308(%ebx)
    1130:	8b 44 24 68          	mov    0x68(%esp),%eax
    1134:	89 83 0c 03 00 00    	mov    %eax,0x30c(%ebx)
    113a:	c7 83 10 03 00 00 00 	movl   $0x0,0x310(%ebx)
    1141:	00 00 00 
    1144:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    1148:	89 83 14 03 00 00    	mov    %eax,0x314(%ebx)
    114e:	8b 44 24 50          	mov    0x50(%esp),%eax
    1152:	89 83 18 03 00 00    	mov    %eax,0x318(%ebx)
    1158:	8b 44 24 48          	mov    0x48(%esp),%eax
    115c:	89 83 1c 03 00 00    	mov    %eax,0x31c(%ebx)
    1162:	8b 44 24 6c          	mov    0x6c(%esp),%eax
    1166:	89 83 20 03 00 00    	mov    %eax,0x320(%ebx)
    116c:	8b 44 24 34          	mov    0x34(%esp),%eax
    1170:	89 83 24 03 00 00    	mov    %eax,0x324(%ebx)
    1176:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    117a:	89 83 28 03 00 00    	mov    %eax,0x328(%ebx)
    1180:	8b 44 24 38          	mov    0x38(%esp),%eax
    1184:	89 83 2c 03 00 00    	mov    %eax,0x32c(%ebx)
    118a:	0f b7 44 24 58       	movzwl 0x58(%esp),%eax
    118f:	89 83 30 03 00 00    	mov    %eax,0x330(%ebx)
    1195:	0f b7 44 24 64       	movzwl 0x64(%esp),%eax
    119a:	89 83 34 03 00 00    	mov    %eax,0x334(%ebx)
    11a0:	0f b7 44 24 70       	movzwl 0x70(%esp),%eax
    11a5:	89 83 38 03 00 00    	mov    %eax,0x338(%ebx)
    11ab:	0f b7 44 24 5c       	movzwl 0x5c(%esp),%eax
    11b0:	89 83 3c 03 00 00    	mov    %eax,0x33c(%ebx)
    11b6:	0f b7 44 24 54       	movzwl 0x54(%esp),%eax
    11bb:	89 83 40 03 00 00    	mov    %eax,0x340(%ebx)
    11c1:	0f b7 44 24 40       	movzwl 0x40(%esp),%eax
    11c6:	89 83 44 03 00 00    	mov    %eax,0x344(%ebx)
    11cc:	89 e8                	mov    %ebp,%eax
    11ce:	c1 e0 04             	shl    $0x4,%eax
    11d1:	83 c0 28             	add    $0x28,%eax
    11d4:	89 83 48 03 00 00    	mov    %eax,0x348(%ebx)
    11da:	c7 83 4c 03 00 00 00 	movl   $0x80000000,0x34c(%ebx)
    11e1:	00 00 80 
    11e4:	83 c4 10             	add    $0x10,%esp
    11e7:	3b 15 00 00 00 00    	cmp    0x0,%edx
    11ed:	75 08                	jne    11f7 <copy_process+0x1b1>
    11ef:	0f 06                	clts   
    11f1:	dd b3 50 03 00 00    	fnsave 0x350(%ebx)
    11f7:	83 ec 08             	sub    $0x8,%esp
    11fa:	53                   	push   %ebx
    11fb:	55                   	push   %ebp
    11fc:	e8 fc ff ff ff       	call   11fd <copy_process+0x1b7>
    1201:	83 c4 10             	add    $0x10,%esp
    1204:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    120a:	8d 8b d0 02 00 00    	lea    0x2d0(%ebx),%ecx
    1210:	85 c0                	test   %eax,%eax
    1212:	74 40                	je     1254 <copy_process+0x20e>
    1214:	c7 04 ad 00 00 00 00 	movl   $0x0,0x0(,%ebp,4)
    121b:	00 00 00 00 
    121f:	83 ec 0c             	sub    $0xc,%esp
    1222:	53                   	push   %ebx
    1223:	e8 fc ff ff ff       	call   1224 <copy_process+0x1de>
    1228:	89 c2                	mov    %eax,%edx
    122a:	83 c4 10             	add    $0x10,%esp
    122d:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1232:	85 d2                	test   %edx,%edx
    1234:	0f 85 ec 00 00 00    	jne    1326 <copy_process+0x2e0>
    123a:	83 ec 0c             	sub    $0xc,%esp
    123d:	68 38 01 00 00       	push   $0x138
    1242:	e8 fc ff ff ff       	call   1243 <copy_process+0x1fd>
    1247:	83 c4 10             	add    $0x10,%esp
    124a:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    124f:	e9 d2 00 00 00       	jmp    1326 <copy_process+0x2e0>
    1254:	8b 02                	mov    (%edx),%eax
    1256:	85 c0                	test   %eax,%eax
    1258:	74 05                	je     125f <copy_process+0x219>
    125a:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
    125f:	83 c2 04             	add    $0x4,%edx
    1262:	39 ca                	cmp    %ecx,%edx
    1264:	75 ee                	jne    1254 <copy_process+0x20e>
    1266:	a1 00 00 00 00       	mov    0x0,%eax
    126b:	8b 90 70 02 00 00    	mov    0x270(%eax),%edx
    1271:	85 d2                	test   %edx,%edx
    1273:	74 05                	je     127a <copy_process+0x234>
    1275:	66 83 42 30 01       	addw   $0x1,0x30(%edx)
    127a:	8b 90 74 02 00 00    	mov    0x274(%eax),%edx
    1280:	85 d2                	test   %edx,%edx
    1282:	74 05                	je     1289 <copy_process+0x243>
    1284:	66 83 42 30 01       	addw   $0x1,0x30(%edx)
    1289:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
    128f:	85 c0                	test   %eax,%eax
    1291:	74 05                	je     1298 <copy_process+0x252>
    1293:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    1298:	8d 54 2d 04          	lea    0x4(%ebp,%ebp,1),%edx
    129c:	8d 83 e8 02 00 00    	lea    0x2e8(%ebx),%eax
    12a2:	66 c7 04 d5 00 00 00 	movw   $0x68,0x0(,%edx,8)
    12a9:	00 68 00 
    12ac:	66 89 04 d5 02 00 00 	mov    %ax,0x2(,%edx,8)
    12b3:	00 
    12b4:	c1 c8 10             	ror    $0x10,%eax
    12b7:	88 04 d5 04 00 00 00 	mov    %al,0x4(,%edx,8)
    12be:	c6 04 d5 05 00 00 00 	movb   $0x89,0x5(,%edx,8)
    12c5:	89 
    12c6:	c6 04 d5 06 00 00 00 	movb   $0x0,0x6(,%edx,8)
    12cd:	00 
    12ce:	88 24 d5 07 00 00 00 	mov    %ah,0x7(,%edx,8)
    12d5:	c1 c8 10             	ror    $0x10,%eax
    12d8:	8d 83 d0 02 00 00    	lea    0x2d0(%ebx),%eax
    12de:	66 c7 04 d5 08 00 00 	movw   $0x68,0x8(,%edx,8)
    12e5:	00 68 00 
    12e8:	66 89 04 d5 0a 00 00 	mov    %ax,0xa(,%edx,8)
    12ef:	00 
    12f0:	c1 c8 10             	ror    $0x10,%eax
    12f3:	88 04 d5 0c 00 00 00 	mov    %al,0xc(,%edx,8)
    12fa:	c6 04 d5 0d 00 00 00 	movb   $0x82,0xd(,%edx,8)
    1301:	82 
    1302:	c6 04 d5 0e 00 00 00 	movb   $0x0,0xe(,%edx,8)
    1309:	00 
    130a:	88 24 d5 0f 00 00 00 	mov    %ah,0xf(,%edx,8)
    1311:	c1 c8 10             	ror    $0x10,%eax
    1314:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    131a:	a1 00 00 00 00       	mov    0x0,%eax
    131f:	eb 05                	jmp    1326 <copy_process+0x2e0>
    1321:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1326:	83 c4 0c             	add    $0xc,%esp
    1329:	5b                   	pop    %ebx
    132a:	5e                   	pop    %esi
    132b:	5f                   	pop    %edi
    132c:	5d                   	pop    %ebp
    132d:	c3                   	ret    

0000132e <find_empty_process>:
    132e:	56                   	push   %esi
    132f:	53                   	push   %ebx
    1330:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1336:	be 01 00 00 00       	mov    $0x1,%esi
    133b:	bb 00 01 00 00       	mov    $0x100,%ebx
    1340:	83 c1 01             	add    $0x1,%ecx
    1343:	0f 48 ce             	cmovs  %esi,%ecx
    1346:	b8 00 00 00 00       	mov    $0x0,%eax
    134b:	8b 10                	mov    (%eax),%edx
    134d:	85 d2                	test   %edx,%edx
    134f:	74 08                	je     1359 <find_empty_process+0x2b>
    1351:	39 8a 2c 02 00 00    	cmp    %ecx,0x22c(%edx)
    1357:	74 e7                	je     1340 <find_empty_process+0x12>
    1359:	83 c0 04             	add    $0x4,%eax
    135c:	39 c3                	cmp    %eax,%ebx
    135e:	75 eb                	jne    134b <find_empty_process+0x1d>
    1360:	89 0d 00 00 00 00    	mov    %ecx,0x0
    1366:	83 3d 04 00 00 00 00 	cmpl   $0x0,0x4
    136d:	74 1e                	je     138d <find_empty_process+0x5f>
    136f:	b8 02 00 00 00       	mov    $0x2,%eax
    1374:	83 3c 85 00 00 00 00 	cmpl   $0x0,0x0(,%eax,4)
    137b:	00 
    137c:	74 14                	je     1392 <find_empty_process+0x64>
    137e:	83 c0 01             	add    $0x1,%eax
    1381:	83 f8 40             	cmp    $0x40,%eax
    1384:	75 ee                	jne    1374 <find_empty_process+0x46>
    1386:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    138b:	eb 05                	jmp    1392 <find_empty_process+0x64>
    138d:	b8 01 00 00 00       	mov    $0x1,%eax
    1392:	5b                   	pop    %ebx
    1393:	5e                   	pop    %esi
    1394:	c3                   	ret    

00001395 <panic>:
    1395:	83 ec 14             	sub    $0x14,%esp
    1398:	ff 74 24 18          	pushl  0x18(%esp)
    139c:	68 b3 01 00 00       	push   $0x1b3
    13a1:	e8 fc ff ff ff       	call   13a2 <panic+0xd>
    13a6:	83 c4 10             	add    $0x10,%esp
    13a9:	a1 00 00 00 00       	mov    0x0,%eax
    13ae:	39 05 00 00 00 00    	cmp    %eax,0x0
    13b4:	75 12                	jne    13c8 <panic+0x33>
    13b6:	83 ec 0c             	sub    $0xc,%esp
    13b9:	68 64 01 00 00       	push   $0x164
    13be:	e8 fc ff ff ff       	call   13bf <panic+0x2a>
    13c3:	83 c4 10             	add    $0x10,%esp
    13c6:	eb 05                	jmp    13cd <panic+0x38>
    13c8:	e8 fc ff ff ff       	call   13c9 <panic+0x34>
    13cd:	eb fe                	jmp    13cd <panic+0x38>

000013cf <printk>:
    13cf:	53                   	push   %ebx
    13d0:	83 ec 0c             	sub    $0xc,%esp
    13d3:	8d 44 24 18          	lea    0x18(%esp),%eax
    13d7:	50                   	push   %eax
    13d8:	ff 74 24 18          	pushl  0x18(%esp)
    13dc:	68 60 03 00 00       	push   $0x360
    13e1:	e8 fc ff ff ff       	call   13e2 <printk+0x13>
    13e6:	89 c3                	mov    %eax,%ebx
    13e8:	0f a0                	push   %fs
    13ea:	1e                   	push   %ds
    13eb:	0f a1                	pop    %fs
    13ed:	53                   	push   %ebx
    13ee:	68 60 03 00 00       	push   $0x360
    13f3:	6a 00                	push   $0x0
    13f5:	e8 fc ff ff ff       	call   13f6 <printk+0x27>
    13fa:	83 c4 08             	add    $0x8,%esp
    13fd:	5b                   	pop    %ebx
    13fe:	0f a1                	pop    %fs
    1400:	89 d8                	mov    %ebx,%eax
    1402:	83 c4 18             	add    $0x18,%esp
    1405:	5b                   	pop    %ebx
    1406:	c3                   	ret    

00001407 <cpy_str_to_kernel>:
    1407:	57                   	push   %edi
    1408:	56                   	push   %esi
    1409:	8b 44 24 0c          	mov    0xc(%esp),%eax
    140d:	8b 74 24 10          	mov    0x10(%esp),%esi
    1411:	89 c7                	mov    %eax,%edi
    1413:	1e                   	push   %ds
    1414:	0f a0                	push   %fs
    1416:	1f                   	pop    %ds
    1417:	fc                   	cld    
    1418:	ac                   	lods   %ds:(%esi),%al
    1419:	aa                   	stos   %al,%es:(%edi)
    141a:	84 c0                	test   %al,%al
    141c:	75 fa                	jne    1418 <cpy_str_to_kernel+0x11>
    141e:	1f                   	pop    %ds
    141f:	5e                   	pop    %esi
    1420:	5f                   	pop    %edi
    1421:	c3                   	ret    
    1422:	55                   	push   %ebp
    1423:	57                   	push   %edi
    1424:	56                   	push   %esi
    1425:	53                   	push   %ebx
    1426:	83 ec 38             	sub    $0x38,%esp
    1429:	89 c3                	mov    %eax,%ebx
    142b:	89 d5                	mov    %edx,%ebp
    142d:	8b 44 24 54          	mov    0x54(%esp),%eax
    1431:	83 e0 40             	and    $0x40,%eax
    1434:	b8 ac 01 00 00       	mov    $0x1ac,%eax
    1439:	be 84 01 00 00       	mov    $0x184,%esi
    143e:	0f 45 f0             	cmovne %eax,%esi
    1441:	8b 54 24 54          	mov    0x54(%esp),%edx
    1445:	83 e2 10             	and    $0x10,%edx
    1448:	8b 44 24 54          	mov    0x54(%esp),%eax
    144c:	83 e0 fe             	and    $0xfffffffe,%eax
    144f:	85 d2                	test   %edx,%edx
    1451:	0f 44 44 24 54       	cmove  0x54(%esp),%eax
    1456:	89 44 24 54          	mov    %eax,0x54(%esp)
    145a:	8d 41 fe             	lea    -0x2(%ecx),%eax
    145d:	83 f8 22             	cmp    $0x22,%eax
    1460:	0f 87 8a 01 00 00    	ja     15f0 <cpy_str_to_kernel+0x1e9>
    1466:	89 cf                	mov    %ecx,%edi
    1468:	8b 44 24 54          	mov    0x54(%esp),%eax
    146c:	83 e0 01             	and    $0x1,%eax
    146f:	83 f8 01             	cmp    $0x1,%eax
    1472:	19 c0                	sbb    %eax,%eax
    1474:	83 e0 f0             	and    $0xfffffff0,%eax
    1477:	83 c0 30             	add    $0x30,%eax
    147a:	88 44 24 07          	mov    %al,0x7(%esp)
    147e:	f6 44 24 54 02       	testb  $0x2,0x54(%esp)
    1483:	74 15                	je     149a <cpy_str_to_kernel+0x93>
    1485:	89 e8                	mov    %ebp,%eax
    1487:	c1 e8 1f             	shr    $0x1f,%eax
    148a:	84 c0                	test   %al,%al
    148c:	74 0c                	je     149a <cpy_str_to_kernel+0x93>
    148e:	f7 dd                	neg    %ebp
    1490:	c6 44 24 06 2d       	movb   $0x2d,0x6(%esp)
    1495:	e9 6d 01 00 00       	jmp    1607 <cpy_str_to_kernel+0x200>
    149a:	f6 44 24 54 04       	testb  $0x4,0x54(%esp)
    149f:	0f 85 56 01 00 00    	jne    15fb <cpy_str_to_kernel+0x1f4>
    14a5:	f6 44 24 54 08       	testb  $0x8,0x54(%esp)
    14aa:	0f 85 52 01 00 00    	jne    1602 <cpy_str_to_kernel+0x1fb>
    14b0:	c6 44 24 06 00       	movb   $0x0,0x6(%esp)
    14b5:	8b 44 24 54          	mov    0x54(%esp),%eax
    14b9:	83 e0 20             	and    $0x20,%eax
    14bc:	89 04 24             	mov    %eax,(%esp)
    14bf:	0f 84 4c 01 00 00    	je     1611 <cpy_str_to_kernel+0x20a>
    14c5:	83 ff 10             	cmp    $0x10,%edi
    14c8:	75 07                	jne    14d1 <cpy_str_to_kernel+0xca>
    14ca:	83 6c 24 4c 02       	subl   $0x2,0x4c(%esp)
    14cf:	eb 0d                	jmp    14de <cpy_str_to_kernel+0xd7>
    14d1:	83 ff 08             	cmp    $0x8,%edi
    14d4:	0f 94 c0             	sete   %al
    14d7:	0f b6 c0             	movzbl %al,%eax
    14da:	29 44 24 4c          	sub    %eax,0x4c(%esp)
    14de:	85 ed                	test   %ebp,%ebp
    14e0:	75 0c                	jne    14ee <cpy_str_to_kernel+0xe7>
    14e2:	c6 44 24 14 30       	movb   $0x30,0x14(%esp)
    14e7:	b9 01 00 00 00       	mov    $0x1,%ecx
    14ec:	eb 1f                	jmp    150d <cpy_str_to_kernel+0x106>
    14ee:	b9 00 00 00 00       	mov    $0x0,%ecx
    14f3:	83 c1 01             	add    $0x1,%ecx
    14f6:	89 e8                	mov    %ebp,%eax
    14f8:	ba 00 00 00 00       	mov    $0x0,%edx
    14fd:	f7 f7                	div    %edi
    14ff:	89 c5                	mov    %eax,%ebp
    1501:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
    1505:	88 54 0c 13          	mov    %dl,0x13(%esp,%ecx,1)
    1509:	85 c0                	test   %eax,%eax
    150b:	75 e6                	jne    14f3 <cpy_str_to_kernel+0xec>
    150d:	3b 4c 24 50          	cmp    0x50(%esp),%ecx
    1511:	89 cd                	mov    %ecx,%ebp
    1513:	0f 4c 6c 24 50       	cmovl  0x50(%esp),%ebp
    1518:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    151c:	29 e8                	sub    %ebp,%eax
    151e:	f6 44 24 54 11       	testb  $0x11,0x54(%esp)
    1523:	75 20                	jne    1545 <cpy_str_to_kernel+0x13e>
    1525:	8d 50 ff             	lea    -0x1(%eax),%edx
    1528:	85 c0                	test   %eax,%eax
    152a:	7e 17                	jle    1543 <cpy_str_to_kernel+0x13c>
    152c:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    152f:	83 c3 01             	add    $0x1,%ebx
    1532:	c6 43 ff 20          	movb   $0x20,-0x1(%ebx)
    1536:	39 d3                	cmp    %edx,%ebx
    1538:	75 f5                	jne    152f <cpy_str_to_kernel+0x128>
    153a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    153f:	89 d3                	mov    %edx,%ebx
    1541:	eb 02                	jmp    1545 <cpy_str_to_kernel+0x13e>
    1543:	89 d0                	mov    %edx,%eax
    1545:	0f b6 54 24 06       	movzbl 0x6(%esp),%edx
    154a:	84 d2                	test   %dl,%dl
    154c:	74 05                	je     1553 <cpy_str_to_kernel+0x14c>
    154e:	88 13                	mov    %dl,(%ebx)
    1550:	8d 5b 01             	lea    0x1(%ebx),%ebx
    1553:	83 3c 24 00          	cmpl   $0x0,(%esp)
    1557:	74 1f                	je     1578 <cpy_str_to_kernel+0x171>
    1559:	83 ff 08             	cmp    $0x8,%edi
    155c:	75 08                	jne    1566 <cpy_str_to_kernel+0x15f>
    155e:	c6 03 30             	movb   $0x30,(%ebx)
    1561:	8d 5b 01             	lea    0x1(%ebx),%ebx
    1564:	eb 12                	jmp    1578 <cpy_str_to_kernel+0x171>
    1566:	83 ff 10             	cmp    $0x10,%edi
    1569:	75 0d                	jne    1578 <cpy_str_to_kernel+0x171>
    156b:	c6 03 30             	movb   $0x30,(%ebx)
    156e:	0f b6 56 21          	movzbl 0x21(%esi),%edx
    1572:	88 53 01             	mov    %dl,0x1(%ebx)
    1575:	8d 5b 02             	lea    0x2(%ebx),%ebx
    1578:	f6 44 24 54 10       	testb  $0x10,0x54(%esp)
    157d:	75 23                	jne    15a2 <cpy_str_to_kernel+0x19b>
    157f:	8d 50 ff             	lea    -0x1(%eax),%edx
    1582:	85 c0                	test   %eax,%eax
    1584:	7e 1a                	jle    15a0 <cpy_str_to_kernel+0x199>
    1586:	01 d8                	add    %ebx,%eax
    1588:	0f b6 54 24 07       	movzbl 0x7(%esp),%edx
    158d:	83 c3 01             	add    $0x1,%ebx
    1590:	88 53 ff             	mov    %dl,-0x1(%ebx)
    1593:	39 c3                	cmp    %eax,%ebx
    1595:	75 f6                	jne    158d <cpy_str_to_kernel+0x186>
    1597:	89 c3                	mov    %eax,%ebx
    1599:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    159e:	eb 02                	jmp    15a2 <cpy_str_to_kernel+0x19b>
    15a0:	89 d0                	mov    %edx,%eax
    15a2:	39 e9                	cmp    %ebp,%ecx
    15a4:	7d 13                	jge    15b9 <cpy_str_to_kernel+0x1b2>
    15a6:	89 ef                	mov    %ebp,%edi
    15a8:	29 cf                	sub    %ecx,%edi
    15aa:	01 df                	add    %ebx,%edi
    15ac:	83 c3 01             	add    $0x1,%ebx
    15af:	c6 43 ff 30          	movb   $0x30,-0x1(%ebx)
    15b3:	39 df                	cmp    %ebx,%edi
    15b5:	75 f5                	jne    15ac <cpy_str_to_kernel+0x1a5>
    15b7:	eb 02                	jmp    15bb <cpy_str_to_kernel+0x1b4>
    15b9:	89 df                	mov    %ebx,%edi
    15bb:	85 c9                	test   %ecx,%ecx
    15bd:	7e 1e                	jle    15dd <cpy_str_to_kernel+0x1d6>
    15bf:	89 ce                	mov    %ecx,%esi
    15c1:	8d 54 0c 13          	lea    0x13(%esp,%ecx,1),%edx
    15c5:	8d 6c 24 13          	lea    0x13(%esp),%ebp
    15c9:	89 f9                	mov    %edi,%ecx
    15cb:	83 c1 01             	add    $0x1,%ecx
    15ce:	0f b6 1a             	movzbl (%edx),%ebx
    15d1:	88 59 ff             	mov    %bl,-0x1(%ecx)
    15d4:	83 ea 01             	sub    $0x1,%edx
    15d7:	39 d5                	cmp    %edx,%ebp
    15d9:	75 f0                	jne    15cb <cpy_str_to_kernel+0x1c4>
    15db:	01 f7                	add    %esi,%edi
    15dd:	85 c0                	test   %eax,%eax
    15df:	7e 16                	jle    15f7 <cpy_str_to_kernel+0x1f0>
    15e1:	01 f8                	add    %edi,%eax
    15e3:	83 c7 01             	add    $0x1,%edi
    15e6:	c6 47 ff 20          	movb   $0x20,-0x1(%edi)
    15ea:	39 f8                	cmp    %edi,%eax
    15ec:	75 f5                	jne    15e3 <cpy_str_to_kernel+0x1dc>
    15ee:	eb 2e                	jmp    161e <cpy_str_to_kernel+0x217>
    15f0:	b8 00 00 00 00       	mov    $0x0,%eax
    15f5:	eb 27                	jmp    161e <cpy_str_to_kernel+0x217>
    15f7:	89 f8                	mov    %edi,%eax
    15f9:	eb 23                	jmp    161e <cpy_str_to_kernel+0x217>
    15fb:	c6 44 24 06 2b       	movb   $0x2b,0x6(%esp)
    1600:	eb 05                	jmp    1607 <cpy_str_to_kernel+0x200>
    1602:	c6 44 24 06 20       	movb   $0x20,0x6(%esp)
    1607:	83 6c 24 4c 01       	subl   $0x1,0x4c(%esp)
    160c:	e9 a4 fe ff ff       	jmp    14b5 <cpy_str_to_kernel+0xae>
    1611:	85 ed                	test   %ebp,%ebp
    1613:	0f 84 c9 fe ff ff    	je     14e2 <cpy_str_to_kernel+0xdb>
    1619:	e9 d0 fe ff ff       	jmp    14ee <cpy_str_to_kernel+0xe7>
    161e:	83 c4 38             	add    $0x38,%esp
    1621:	5b                   	pop    %ebx
    1622:	5e                   	pop    %esi
    1623:	5f                   	pop    %edi
    1624:	5d                   	pop    %ebp
    1625:	c3                   	ret    

00001626 <vsprintf>:
    1626:	55                   	push   %ebp
    1627:	57                   	push   %edi
    1628:	56                   	push   %esi
    1629:	53                   	push   %ebx
    162a:	83 ec 08             	sub    $0x8,%esp
    162d:	8b 44 24 20          	mov    0x20(%esp),%eax
    1631:	0f b6 10             	movzbl (%eax),%edx
    1634:	84 d2                	test   %dl,%dl
    1636:	0f 84 58 03 00 00    	je     1994 <vsprintf+0x36e>
    163c:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1640:	80 fa 25             	cmp    $0x25,%dl
    1643:	74 0d                	je     1652 <vsprintf+0x2c>
    1645:	88 55 00             	mov    %dl,0x0(%ebp)
    1648:	89 c3                	mov    %eax,%ebx
    164a:	8d 6d 01             	lea    0x1(%ebp),%ebp
    164d:	e9 31 03 00 00       	jmp    1983 <vsprintf+0x35d>
    1652:	be 00 00 00 00       	mov    $0x0,%esi
    1657:	83 c0 01             	add    $0x1,%eax
    165a:	0f b6 08             	movzbl (%eax),%ecx
    165d:	8d 51 e0             	lea    -0x20(%ecx),%edx
    1660:	80 fa 10             	cmp    $0x10,%dl
    1663:	77 23                	ja     1688 <vsprintf+0x62>
    1665:	0f b6 d2             	movzbl %dl,%edx
    1668:	ff 24 95 00 00 00 00 	jmp    *0x0(,%edx,4)
    166f:	83 ce 10             	or     $0x10,%esi
    1672:	eb e3                	jmp    1657 <vsprintf+0x31>
    1674:	83 ce 04             	or     $0x4,%esi
    1677:	eb de                	jmp    1657 <vsprintf+0x31>
    1679:	83 ce 08             	or     $0x8,%esi
    167c:	eb d9                	jmp    1657 <vsprintf+0x31>
    167e:	83 ce 20             	or     $0x20,%esi
    1681:	eb d4                	jmp    1657 <vsprintf+0x31>
    1683:	83 ce 01             	or     $0x1,%esi
    1686:	eb cf                	jmp    1657 <vsprintf+0x31>
    1688:	8d 51 d0             	lea    -0x30(%ecx),%edx
    168b:	80 fa 09             	cmp    $0x9,%dl
    168e:	77 21                	ja     16b1 <vsprintf+0x8b>
    1690:	ba 00 00 00 00       	mov    $0x0,%edx
    1695:	83 c0 01             	add    $0x1,%eax
    1698:	8d 14 92             	lea    (%edx,%edx,4),%edx
    169b:	0f be c9             	movsbl %cl,%ecx
    169e:	8d 54 51 d0          	lea    -0x30(%ecx,%edx,2),%edx
    16a2:	0f b6 08             	movzbl (%eax),%ecx
    16a5:	8d 59 d0             	lea    -0x30(%ecx),%ebx
    16a8:	80 fb 09             	cmp    $0x9,%bl
    16ab:	76 e8                	jbe    1695 <vsprintf+0x6f>
    16ad:	89 c3                	mov    %eax,%ebx
    16af:	eb 27                	jmp    16d8 <vsprintf+0xb2>
    16b1:	89 c3                	mov    %eax,%ebx
    16b3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    16b8:	80 f9 2a             	cmp    $0x2a,%cl
    16bb:	75 1b                	jne    16d8 <vsprintf+0xb2>
    16bd:	8b 7c 24 24          	mov    0x24(%esp),%edi
    16c1:	8d 4f 04             	lea    0x4(%edi),%ecx
    16c4:	8b 17                	mov    (%edi),%edx
    16c6:	85 d2                	test   %edx,%edx
    16c8:	0f 89 cc 02 00 00    	jns    199a <vsprintf+0x374>
    16ce:	f7 da                	neg    %edx
    16d0:	83 ce 10             	or     $0x10,%esi
    16d3:	e9 c2 02 00 00       	jmp    199a <vsprintf+0x374>
    16d8:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    16df:	80 3b 2e             	cmpb   $0x2e,(%ebx)
    16e2:	75 53                	jne    1737 <vsprintf+0x111>
    16e4:	8d 7b 01             	lea    0x1(%ebx),%edi
    16e7:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    16eb:	8d 48 d0             	lea    -0x30(%eax),%ecx
    16ee:	80 f9 09             	cmp    $0x9,%cl
    16f1:	77 1f                	ja     1712 <vsprintf+0xec>
    16f3:	b9 00 00 00 00       	mov    $0x0,%ecx
    16f8:	83 c7 01             	add    $0x1,%edi
    16fb:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    16fe:	0f be c0             	movsbl %al,%eax
    1701:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
    1705:	0f b6 07             	movzbl (%edi),%eax
    1708:	8d 58 d0             	lea    -0x30(%eax),%ebx
    170b:	80 fb 09             	cmp    $0x9,%bl
    170e:	76 e8                	jbe    16f8 <vsprintf+0xd2>
    1710:	eb 16                	jmp    1728 <vsprintf+0x102>
    1712:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    1717:	3c 2a                	cmp    $0x2a,%al
    1719:	75 0d                	jne    1728 <vsprintf+0x102>
    171b:	8b 44 24 24          	mov    0x24(%esp),%eax
    171f:	8b 08                	mov    (%eax),%ecx
    1721:	8d 40 04             	lea    0x4(%eax),%eax
    1724:	89 44 24 24          	mov    %eax,0x24(%esp)
    1728:	85 c9                	test   %ecx,%ecx
    172a:	b8 00 00 00 00       	mov    $0x0,%eax
    172f:	0f 48 c8             	cmovs  %eax,%ecx
    1732:	89 0c 24             	mov    %ecx,(%esp)
    1735:	89 fb                	mov    %edi,%ebx
    1737:	0f b6 03             	movzbl (%ebx),%eax
    173a:	89 c1                	mov    %eax,%ecx
    173c:	83 e1 df             	and    $0xffffffdf,%ecx
    173f:	80 f9 4c             	cmp    $0x4c,%cl
    1742:	74 04                	je     1748 <vsprintf+0x122>
    1744:	3c 68                	cmp    $0x68,%al
    1746:	75 03                	jne    174b <vsprintf+0x125>
    1748:	83 c3 01             	add    $0x1,%ebx
    174b:	0f b6 0b             	movzbl (%ebx),%ecx
    174e:	8d 41 a8             	lea    -0x58(%ecx),%eax
    1751:	3c 20                	cmp    $0x20,%al
    1753:	0f 87 f4 01 00 00    	ja     194d <vsprintf+0x327>
    1759:	0f b6 c0             	movzbl %al,%eax
    175c:	ff 24 85 44 00 00 00 	jmp    *0x44(,%eax,4)
    1763:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1769:	75 21                	jne    178c <vsprintf+0x166>
    176b:	8d 42 ff             	lea    -0x1(%edx),%eax
    176e:	85 c0                	test   %eax,%eax
    1770:	7e 18                	jle    178a <vsprintf+0x164>
    1772:	8d 44 15 ff          	lea    -0x1(%ebp,%edx,1),%eax
    1776:	83 c5 01             	add    $0x1,%ebp
    1779:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    177d:	39 c5                	cmp    %eax,%ebp
    177f:	75 f5                	jne    1776 <vsprintf+0x150>
    1781:	ba 00 00 00 00       	mov    $0x0,%edx
    1786:	89 c5                	mov    %eax,%ebp
    1788:	eb 02                	jmp    178c <vsprintf+0x166>
    178a:	89 c2                	mov    %eax,%edx
    178c:	8b 44 24 24          	mov    0x24(%esp),%eax
    1790:	8d 70 04             	lea    0x4(%eax),%esi
    1793:	8d 4d 01             	lea    0x1(%ebp),%ecx
    1796:	8b 00                	mov    (%eax),%eax
    1798:	88 45 00             	mov    %al,0x0(%ebp)
    179b:	8d 42 ff             	lea    -0x1(%edx),%eax
    179e:	85 c0                	test   %eax,%eax
    17a0:	0f 8e cb 01 00 00    	jle    1971 <vsprintf+0x34b>
    17a6:	89 d7                	mov    %edx,%edi
    17a8:	01 ea                	add    %ebp,%edx
    17aa:	89 c8                	mov    %ecx,%eax
    17ac:	83 c0 01             	add    $0x1,%eax
    17af:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    17b3:	39 d0                	cmp    %edx,%eax
    17b5:	75 f5                	jne    17ac <vsprintf+0x186>
    17b7:	8d 6c 39 ff          	lea    -0x1(%ecx,%edi,1),%ebp
    17bb:	89 74 24 24          	mov    %esi,0x24(%esp)
    17bf:	e9 bf 01 00 00       	jmp    1983 <vsprintf+0x35d>
    17c4:	8b 44 24 24          	mov    0x24(%esp),%eax
    17c8:	83 c0 04             	add    $0x4,%eax
    17cb:	89 44 24 04          	mov    %eax,0x4(%esp)
    17cf:	8b 44 24 24          	mov    0x24(%esp),%eax
    17d3:	8b 38                	mov    (%eax),%edi
    17d5:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    17da:	b8 00 00 00 00       	mov    $0x0,%eax
    17df:	fc                   	cld    
    17e0:	f2 ae                	repnz scas %es:(%edi),%al
    17e2:	f7 d1                	not    %ecx
    17e4:	49                   	dec    %ecx
    17e5:	89 c8                	mov    %ecx,%eax
    17e7:	f7 d0                	not    %eax
    17e9:	01 c7                	add    %eax,%edi
    17eb:	8b 04 24             	mov    (%esp),%eax
    17ee:	85 c0                	test   %eax,%eax
    17f0:	78 0b                	js     17fd <vsprintf+0x1d7>
    17f2:	39 c8                	cmp    %ecx,%eax
    17f4:	0f 9c c0             	setl   %al
    17f7:	84 c0                	test   %al,%al
    17f9:	0f 45 0c 24          	cmovne (%esp),%ecx
    17fd:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1803:	75 23                	jne    1828 <vsprintf+0x202>
    1805:	8d 42 ff             	lea    -0x1(%edx),%eax
    1808:	39 d1                	cmp    %edx,%ecx
    180a:	7d 1a                	jge    1826 <vsprintf+0x200>
    180c:	89 ce                	mov    %ecx,%esi
    180e:	29 ca                	sub    %ecx,%edx
    1810:	8d 44 15 00          	lea    0x0(%ebp,%edx,1),%eax
    1814:	83 c5 01             	add    $0x1,%ebp
    1817:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    181b:	39 c5                	cmp    %eax,%ebp
    181d:	75 f5                	jne    1814 <vsprintf+0x1ee>
    181f:	8d 56 ff             	lea    -0x1(%esi),%edx
    1822:	89 c5                	mov    %eax,%ebp
    1824:	eb 02                	jmp    1828 <vsprintf+0x202>
    1826:	89 c2                	mov    %eax,%edx
    1828:	85 c9                	test   %ecx,%ecx
    182a:	7e 1e                	jle    184a <vsprintf+0x224>
    182c:	b8 00 00 00 00       	mov    $0x0,%eax
    1831:	89 d6                	mov    %edx,%esi
    1833:	0f b6 14 07          	movzbl (%edi,%eax,1),%edx
    1837:	88 54 05 00          	mov    %dl,0x0(%ebp,%eax,1)
    183b:	83 c0 01             	add    $0x1,%eax
    183e:	39 c1                	cmp    %eax,%ecx
    1840:	75 f1                	jne    1833 <vsprintf+0x20d>
    1842:	89 f2                	mov    %esi,%edx
    1844:	8d 44 0d 00          	lea    0x0(%ebp,%ecx,1),%eax
    1848:	eb 02                	jmp    184c <vsprintf+0x226>
    184a:	89 e8                	mov    %ebp,%eax
    184c:	39 d1                	cmp    %edx,%ecx
    184e:	0f 8d 25 01 00 00    	jge    1979 <vsprintf+0x353>
    1854:	29 ca                	sub    %ecx,%edx
    1856:	8d 2c 10             	lea    (%eax,%edx,1),%ebp
    1859:	83 c0 01             	add    $0x1,%eax
    185c:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    1860:	39 c5                	cmp    %eax,%ebp
    1862:	75 f5                	jne    1859 <vsprintf+0x233>
    1864:	8b 44 24 04          	mov    0x4(%esp),%eax
    1868:	89 44 24 24          	mov    %eax,0x24(%esp)
    186c:	e9 12 01 00 00       	jmp    1983 <vsprintf+0x35d>
    1871:	8b 44 24 24          	mov    0x24(%esp),%eax
    1875:	8d 78 04             	lea    0x4(%eax),%edi
    1878:	56                   	push   %esi
    1879:	ff 74 24 04          	pushl  0x4(%esp)
    187d:	52                   	push   %edx
    187e:	b9 08 00 00 00       	mov    $0x8,%ecx
    1883:	8b 44 24 30          	mov    0x30(%esp),%eax
    1887:	8b 10                	mov    (%eax),%edx
    1889:	89 e8                	mov    %ebp,%eax
    188b:	e8 92 fb ff ff       	call   1422 <cpy_str_to_kernel+0x1b>
    1890:	89 c5                	mov    %eax,%ebp
    1892:	83 c4 0c             	add    $0xc,%esp
    1895:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1899:	e9 e5 00 00 00       	jmp    1983 <vsprintf+0x35d>
    189e:	83 fa ff             	cmp    $0xffffffff,%edx
    18a1:	75 08                	jne    18ab <vsprintf+0x285>
    18a3:	83 ce 01             	or     $0x1,%esi
    18a6:	ba 08 00 00 00       	mov    $0x8,%edx
    18ab:	8b 44 24 24          	mov    0x24(%esp),%eax
    18af:	8d 78 04             	lea    0x4(%eax),%edi
    18b2:	56                   	push   %esi
    18b3:	ff 74 24 04          	pushl  0x4(%esp)
    18b7:	52                   	push   %edx
    18b8:	b9 10 00 00 00       	mov    $0x10,%ecx
    18bd:	8b 44 24 30          	mov    0x30(%esp),%eax
    18c1:	8b 10                	mov    (%eax),%edx
    18c3:	89 e8                	mov    %ebp,%eax
    18c5:	e8 58 fb ff ff       	call   1422 <cpy_str_to_kernel+0x1b>
    18ca:	89 c5                	mov    %eax,%ebp
    18cc:	83 c4 0c             	add    $0xc,%esp
    18cf:	89 7c 24 24          	mov    %edi,0x24(%esp)
    18d3:	e9 ab 00 00 00       	jmp    1983 <vsprintf+0x35d>
    18d8:	83 ce 40             	or     $0x40,%esi
    18db:	8b 44 24 24          	mov    0x24(%esp),%eax
    18df:	8d 78 04             	lea    0x4(%eax),%edi
    18e2:	56                   	push   %esi
    18e3:	ff 74 24 04          	pushl  0x4(%esp)
    18e7:	52                   	push   %edx
    18e8:	b9 10 00 00 00       	mov    $0x10,%ecx
    18ed:	8b 44 24 30          	mov    0x30(%esp),%eax
    18f1:	8b 10                	mov    (%eax),%edx
    18f3:	89 e8                	mov    %ebp,%eax
    18f5:	e8 28 fb ff ff       	call   1422 <cpy_str_to_kernel+0x1b>
    18fa:	89 c5                	mov    %eax,%ebp
    18fc:	83 c4 0c             	add    $0xc,%esp
    18ff:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1903:	eb 7e                	jmp    1983 <vsprintf+0x35d>
    1905:	83 ce 02             	or     $0x2,%esi
    1908:	8b 44 24 24          	mov    0x24(%esp),%eax
    190c:	8d 78 04             	lea    0x4(%eax),%edi
    190f:	56                   	push   %esi
    1910:	ff 74 24 04          	pushl  0x4(%esp)
    1914:	52                   	push   %edx
    1915:	b9 0a 00 00 00       	mov    $0xa,%ecx
    191a:	8b 44 24 30          	mov    0x30(%esp),%eax
    191e:	8b 10                	mov    (%eax),%edx
    1920:	89 e8                	mov    %ebp,%eax
    1922:	e8 fb fa ff ff       	call   1422 <cpy_str_to_kernel+0x1b>
    1927:	89 c5                	mov    %eax,%ebp
    1929:	83 c4 0c             	add    $0xc,%esp
    192c:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1930:	eb 51                	jmp    1983 <vsprintf+0x35d>
    1932:	8b 44 24 24          	mov    0x24(%esp),%eax
    1936:	8b 00                	mov    (%eax),%eax
    1938:	89 ea                	mov    %ebp,%edx
    193a:	2b 54 24 1c          	sub    0x1c(%esp),%edx
    193e:	89 10                	mov    %edx,(%eax)
    1940:	8b 44 24 24          	mov    0x24(%esp),%eax
    1944:	8d 40 04             	lea    0x4(%eax),%eax
    1947:	89 44 24 24          	mov    %eax,0x24(%esp)
    194b:	eb 36                	jmp    1983 <vsprintf+0x35d>
    194d:	80 f9 25             	cmp    $0x25,%cl
    1950:	74 10                	je     1962 <vsprintf+0x33c>
    1952:	8d 45 01             	lea    0x1(%ebp),%eax
    1955:	c6 45 00 25          	movb   $0x25,0x0(%ebp)
    1959:	0f b6 0b             	movzbl (%ebx),%ecx
    195c:	84 c9                	test   %cl,%cl
    195e:	74 0a                	je     196a <vsprintf+0x344>
    1960:	89 c5                	mov    %eax,%ebp
    1962:	88 4d 00             	mov    %cl,0x0(%ebp)
    1965:	8d 6d 01             	lea    0x1(%ebp),%ebp
    1968:	eb 19                	jmp    1983 <vsprintf+0x35d>
    196a:	83 eb 01             	sub    $0x1,%ebx
    196d:	89 c5                	mov    %eax,%ebp
    196f:	eb 12                	jmp    1983 <vsprintf+0x35d>
    1971:	89 cd                	mov    %ecx,%ebp
    1973:	89 74 24 24          	mov    %esi,0x24(%esp)
    1977:	eb 0a                	jmp    1983 <vsprintf+0x35d>
    1979:	89 c5                	mov    %eax,%ebp
    197b:	8b 44 24 04          	mov    0x4(%esp),%eax
    197f:	89 44 24 24          	mov    %eax,0x24(%esp)
    1983:	8d 43 01             	lea    0x1(%ebx),%eax
    1986:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
    198a:	84 d2                	test   %dl,%dl
    198c:	0f 85 ae fc ff ff    	jne    1640 <vsprintf+0x1a>
    1992:	eb 18                	jmp    19ac <vsprintf+0x386>
    1994:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1998:	eb 12                	jmp    19ac <vsprintf+0x386>
    199a:	89 c3                	mov    %eax,%ebx
    199c:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    19a0:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    19a7:	e9 8b fd ff ff       	jmp    1737 <vsprintf+0x111>
    19ac:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
    19b0:	89 e8                	mov    %ebp,%eax
    19b2:	2b 44 24 1c          	sub    0x1c(%esp),%eax
    19b6:	83 c4 08             	add    $0x8,%esp
    19b9:	5b                   	pop    %ebx
    19ba:	5e                   	pop    %esi
    19bb:	5f                   	pop    %edi
    19bc:	5d                   	pop    %ebp
    19bd:	c3                   	ret    

000019be <sys_ftime>:
    19be:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19c3:	c3                   	ret    

000019c4 <sys_break>:
    19c4:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19c9:	c3                   	ret    

000019ca <sys_ptrace>:
    19ca:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19cf:	c3                   	ret    

000019d0 <sys_stty>:
    19d0:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19d5:	c3                   	ret    

000019d6 <sys_gtty>:
    19d6:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19db:	c3                   	ret    

000019dc <sys_rename>:
    19dc:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19e1:	c3                   	ret    

000019e2 <sys_prof>:
    19e2:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    19e7:	c3                   	ret    

000019e8 <sys_setregid>:
    19e8:	53                   	push   %ebx
    19e9:	8b 54 24 08          	mov    0x8(%esp),%edx
    19ed:	8b 44 24 0c          	mov    0xc(%esp),%eax
    19f1:	85 d2                	test   %edx,%edx
    19f3:	7e 22                	jle    1a17 <sys_setregid+0x2f>
    19f5:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    19fb:	0f b7 99 46 02 00 00 	movzwl 0x246(%ecx),%ebx
    1a02:	39 da                	cmp    %ebx,%edx
    1a04:	74 0a                	je     1a10 <sys_setregid+0x28>
    1a06:	66 83 b9 42 02 00 00 	cmpw   $0x0,0x242(%ecx)
    1a0d:	00 
    1a0e:	75 4a                	jne    1a5a <sys_setregid+0x72>
    1a10:	66 89 91 46 02 00 00 	mov    %dx,0x246(%ecx)
    1a17:	85 c0                	test   %eax,%eax
    1a19:	7e 46                	jle    1a61 <sys_setregid+0x79>
    1a1b:	8b 15 00 00 00 00    	mov    0x0,%edx
    1a21:	0f b7 8a 46 02 00 00 	movzwl 0x246(%edx),%ecx
    1a28:	39 c8                	cmp    %ecx,%eax
    1a2a:	74 20                	je     1a4c <sys_setregid+0x64>
    1a2c:	0f b7 8a 48 02 00 00 	movzwl 0x248(%edx),%ecx
    1a33:	39 c8                	cmp    %ecx,%eax
    1a35:	74 15                	je     1a4c <sys_setregid+0x64>
    1a37:	0f b7 8a 4a 02 00 00 	movzwl 0x24a(%edx),%ecx
    1a3e:	39 c8                	cmp    %ecx,%eax
    1a40:	74 0a                	je     1a4c <sys_setregid+0x64>
    1a42:	66 83 ba 42 02 00 00 	cmpw   $0x0,0x242(%edx)
    1a49:	00 
    1a4a:	75 1c                	jne    1a68 <sys_setregid+0x80>
    1a4c:	66 89 82 48 02 00 00 	mov    %ax,0x248(%edx)
    1a53:	b8 00 00 00 00       	mov    $0x0,%eax
    1a58:	eb 13                	jmp    1a6d <sys_setregid+0x85>
    1a5a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1a5f:	eb 0c                	jmp    1a6d <sys_setregid+0x85>
    1a61:	b8 00 00 00 00       	mov    $0x0,%eax
    1a66:	eb 05                	jmp    1a6d <sys_setregid+0x85>
    1a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1a6d:	5b                   	pop    %ebx
    1a6e:	c3                   	ret    

00001a6f <sys_setgid>:
    1a6f:	8b 44 24 04          	mov    0x4(%esp),%eax
    1a73:	50                   	push   %eax
    1a74:	50                   	push   %eax
    1a75:	e8 fc ff ff ff       	call   1a76 <sys_setgid+0x7>
    1a7a:	83 c4 08             	add    $0x8,%esp
    1a7d:	c3                   	ret    

00001a7e <sys_acct>:
    1a7e:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a83:	c3                   	ret    

00001a84 <sys_phys>:
    1a84:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a89:	c3                   	ret    

00001a8a <sys_lock>:
    1a8a:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a8f:	c3                   	ret    

00001a90 <sys_mpx>:
    1a90:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a95:	c3                   	ret    

00001a96 <sys_ulimit>:
    1a96:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1a9b:	c3                   	ret    

00001a9c <sys_time>:
    1a9c:	56                   	push   %esi
    1a9d:	53                   	push   %ebx
    1a9e:	83 ec 04             	sub    $0x4,%esp
    1aa1:	8b 74 24 10          	mov    0x10(%esp),%esi
    1aa5:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1aab:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1ab0:	89 c8                	mov    %ecx,%eax
    1ab2:	f7 ea                	imul   %edx
    1ab4:	c1 fa 05             	sar    $0x5,%edx
    1ab7:	c1 f9 1f             	sar    $0x1f,%ecx
    1aba:	29 ca                	sub    %ecx,%edx
    1abc:	89 d3                	mov    %edx,%ebx
    1abe:	03 1d 00 00 00 00    	add    0x0,%ebx
    1ac4:	85 f6                	test   %esi,%esi
    1ac6:	74 11                	je     1ad9 <sys_time+0x3d>
    1ac8:	83 ec 08             	sub    $0x8,%esp
    1acb:	6a 04                	push   $0x4
    1acd:	56                   	push   %esi
    1ace:	e8 fc ff ff ff       	call   1acf <sys_time+0x33>
    1ad3:	64 89 1e             	mov    %ebx,%fs:(%esi)
    1ad6:	83 c4 10             	add    $0x10,%esp
    1ad9:	89 d8                	mov    %ebx,%eax
    1adb:	83 c4 04             	add    $0x4,%esp
    1ade:	5b                   	pop    %ebx
    1adf:	5e                   	pop    %esi
    1ae0:	c3                   	ret    

00001ae1 <sys_setreuid>:
    1ae1:	55                   	push   %ebp
    1ae2:	57                   	push   %edi
    1ae3:	56                   	push   %esi
    1ae4:	53                   	push   %ebx
    1ae5:	83 ec 08             	sub    $0x8,%esp
    1ae8:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    1aec:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    1af0:	a1 00 00 00 00       	mov    0x0,%eax
    1af5:	0f b7 b0 40 02 00 00 	movzwl 0x240(%eax),%esi
    1afc:	0f b7 de             	movzwl %si,%ebx
    1aff:	89 1c 24             	mov    %ebx,(%esp)
    1b02:	85 d2                	test   %edx,%edx
    1b04:	7e 28                	jle    1b2e <sys_setreuid+0x4d>
    1b06:	0f b7 b8 42 02 00 00 	movzwl 0x242(%eax),%edi
    1b0d:	39 d3                	cmp    %edx,%ebx
    1b0f:	0f 94 44 24 07       	sete   0x7(%esp)
    1b14:	0f b7 ef             	movzwl %di,%ebp
    1b17:	39 d5                	cmp    %edx,%ebp
    1b19:	0f 94 c3             	sete   %bl
    1b1c:	0a 5c 24 07          	or     0x7(%esp),%bl
    1b20:	75 05                	jne    1b27 <sys_setreuid+0x46>
    1b22:	66 85 ff             	test   %di,%di
    1b25:	75 3f                	jne    1b66 <sys_setreuid+0x85>
    1b27:	66 89 90 40 02 00 00 	mov    %dx,0x240(%eax)
    1b2e:	85 c9                	test   %ecx,%ecx
    1b30:	7e 3b                	jle    1b6d <sys_setreuid+0x8c>
    1b32:	39 0c 24             	cmp    %ecx,(%esp)
    1b35:	74 13                	je     1b4a <sys_setreuid+0x69>
    1b37:	0f b7 90 42 02 00 00 	movzwl 0x242(%eax),%edx
    1b3e:	66 85 d2             	test   %dx,%dx
    1b41:	74 07                	je     1b4a <sys_setreuid+0x69>
    1b43:	0f b7 d2             	movzwl %dx,%edx
    1b46:	39 ca                	cmp    %ecx,%edx
    1b48:	75 0e                	jne    1b58 <sys_setreuid+0x77>
    1b4a:	66 89 88 42 02 00 00 	mov    %cx,0x242(%eax)
    1b51:	b8 00 00 00 00       	mov    $0x0,%eax
    1b56:	eb 1a                	jmp    1b72 <sys_setreuid+0x91>
    1b58:	66 89 b0 40 02 00 00 	mov    %si,0x240(%eax)
    1b5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1b64:	eb 0c                	jmp    1b72 <sys_setreuid+0x91>
    1b66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1b6b:	eb 05                	jmp    1b72 <sys_setreuid+0x91>
    1b6d:	b8 00 00 00 00       	mov    $0x0,%eax
    1b72:	83 c4 08             	add    $0x8,%esp
    1b75:	5b                   	pop    %ebx
    1b76:	5e                   	pop    %esi
    1b77:	5f                   	pop    %edi
    1b78:	5d                   	pop    %ebp
    1b79:	c3                   	ret    

00001b7a <sys_setuid>:
    1b7a:	8b 44 24 04          	mov    0x4(%esp),%eax
    1b7e:	50                   	push   %eax
    1b7f:	50                   	push   %eax
    1b80:	e8 fc ff ff ff       	call   1b81 <sys_setuid+0x7>
    1b85:	83 c4 08             	add    $0x8,%esp
    1b88:	c3                   	ret    

00001b89 <sys_stime>:
    1b89:	a1 00 00 00 00       	mov    0x0,%eax
    1b8e:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1b95:	00 
    1b96:	75 2e                	jne    1bc6 <sys_stime+0x3d>
    1b98:	53                   	push   %ebx
    1b99:	8b 44 24 08          	mov    0x8(%esp),%eax
    1b9d:	64 8b 08             	mov    %fs:(%eax),%ecx
    1ba0:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1ba6:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1bab:	89 d8                	mov    %ebx,%eax
    1bad:	f7 ea                	imul   %edx
    1baf:	c1 fa 05             	sar    $0x5,%edx
    1bb2:	c1 fb 1f             	sar    $0x1f,%ebx
    1bb5:	29 da                	sub    %ebx,%edx
    1bb7:	29 d1                	sub    %edx,%ecx
    1bb9:	89 0d 00 00 00 00    	mov    %ecx,0x0
    1bbf:	b8 00 00 00 00       	mov    $0x0,%eax
    1bc4:	eb 06                	jmp    1bcc <sys_stime+0x43>
    1bc6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1bcb:	c3                   	ret    
    1bcc:	5b                   	pop    %ebx
    1bcd:	c3                   	ret    

00001bce <sys_times>:
    1bce:	53                   	push   %ebx
    1bcf:	83 ec 08             	sub    $0x8,%esp
    1bd2:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1bd6:	85 db                	test   %ebx,%ebx
    1bd8:	74 3a                	je     1c14 <sys_times+0x46>
    1bda:	83 ec 08             	sub    $0x8,%esp
    1bdd:	6a 10                	push   $0x10
    1bdf:	53                   	push   %ebx
    1be0:	e8 fc ff ff ff       	call   1be1 <sys_times+0x13>
    1be5:	a1 00 00 00 00       	mov    0x0,%eax
    1bea:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
    1bf0:	64 89 13             	mov    %edx,%fs:(%ebx)
    1bf3:	8b 90 54 02 00 00    	mov    0x254(%eax),%edx
    1bf9:	64 89 53 04          	mov    %edx,%fs:0x4(%ebx)
    1bfd:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
    1c03:	64 89 53 08          	mov    %edx,%fs:0x8(%ebx)
    1c07:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
    1c0d:	64 89 43 0c          	mov    %eax,%fs:0xc(%ebx)
    1c11:	83 c4 10             	add    $0x10,%esp
    1c14:	a1 00 00 00 00       	mov    0x0,%eax
    1c19:	83 c4 08             	add    $0x8,%esp
    1c1c:	5b                   	pop    %ebx
    1c1d:	c3                   	ret    

00001c1e <sys_brk>:
    1c1e:	8b 54 24 04          	mov    0x4(%esp),%edx
    1c22:	a1 00 00 00 00       	mov    0x0,%eax
    1c27:	39 90 1c 02 00 00    	cmp    %edx,0x21c(%eax)
    1c2d:	77 16                	ja     1c45 <sys_brk+0x27>
    1c2f:	8b 88 28 02 00 00    	mov    0x228(%eax),%ecx
    1c35:	81 e9 00 40 00 00    	sub    $0x4000,%ecx
    1c3b:	39 ca                	cmp    %ecx,%edx
    1c3d:	73 06                	jae    1c45 <sys_brk+0x27>
    1c3f:	89 90 24 02 00 00    	mov    %edx,0x224(%eax)
    1c45:	8b 80 24 02 00 00    	mov    0x224(%eax),%eax
    1c4b:	c3                   	ret    

00001c4c <sys_setpgid>:
    1c4c:	56                   	push   %esi
    1c4d:	53                   	push   %ebx
    1c4e:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    1c52:	8b 74 24 10          	mov    0x10(%esp),%esi
    1c56:	85 db                	test   %ebx,%ebx
    1c58:	75 0b                	jne    1c65 <sys_setpgid+0x19>
    1c5a:	a1 00 00 00 00       	mov    0x0,%eax
    1c5f:	8b 98 2c 02 00 00    	mov    0x22c(%eax),%ebx
    1c65:	85 f6                	test   %esi,%esi
    1c67:	75 0b                	jne    1c74 <sys_setpgid+0x28>
    1c69:	a1 00 00 00 00       	mov    0x0,%eax
    1c6e:	8b b0 2c 02 00 00    	mov    0x22c(%eax),%esi
    1c74:	b8 00 00 00 00       	mov    $0x0,%eax
    1c79:	b9 00 01 00 00       	mov    $0x100,%ecx
    1c7e:	8b 10                	mov    (%eax),%edx
    1c80:	85 d2                	test   %edx,%edx
    1c82:	74 31                	je     1cb5 <sys_setpgid+0x69>
    1c84:	3b 9a 2c 02 00 00    	cmp    0x22c(%edx),%ebx
    1c8a:	75 29                	jne    1cb5 <sys_setpgid+0x69>
    1c8c:	83 ba 3c 02 00 00 00 	cmpl   $0x0,0x23c(%edx)
    1c93:	75 2e                	jne    1cc3 <sys_setpgid+0x77>
    1c95:	a1 00 00 00 00       	mov    0x0,%eax
    1c9a:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
    1ca0:	39 82 38 02 00 00    	cmp    %eax,0x238(%edx)
    1ca6:	75 22                	jne    1cca <sys_setpgid+0x7e>
    1ca8:	89 b2 34 02 00 00    	mov    %esi,0x234(%edx)
    1cae:	b8 00 00 00 00       	mov    $0x0,%eax
    1cb3:	eb 1a                	jmp    1ccf <sys_setpgid+0x83>
    1cb5:	83 c0 04             	add    $0x4,%eax
    1cb8:	39 c8                	cmp    %ecx,%eax
    1cba:	75 c2                	jne    1c7e <sys_setpgid+0x32>
    1cbc:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
    1cc1:	eb 0c                	jmp    1ccf <sys_setpgid+0x83>
    1cc3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1cc8:	eb 05                	jmp    1ccf <sys_setpgid+0x83>
    1cca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ccf:	5b                   	pop    %ebx
    1cd0:	5e                   	pop    %esi
    1cd1:	c3                   	ret    

00001cd2 <sys_getpgrp>:
    1cd2:	a1 00 00 00 00       	mov    0x0,%eax
    1cd7:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
    1cdd:	c3                   	ret    

00001cde <sys_setsid>:
    1cde:	8b 15 00 00 00 00    	mov    0x0,%edx
    1ce4:	83 ba 3c 02 00 00 00 	cmpl   $0x0,0x23c(%edx)
    1ceb:	74 0a                	je     1cf7 <sys_setsid+0x19>
    1ced:	66 83 ba 42 02 00 00 	cmpw   $0x0,0x242(%edx)
    1cf4:	00 
    1cf5:	75 27                	jne    1d1e <sys_setsid+0x40>
    1cf7:	c7 82 3c 02 00 00 01 	movl   $0x1,0x23c(%edx)
    1cfe:	00 00 00 
    1d01:	8b 82 2c 02 00 00    	mov    0x22c(%edx),%eax
    1d07:	89 82 34 02 00 00    	mov    %eax,0x234(%edx)
    1d0d:	89 82 38 02 00 00    	mov    %eax,0x238(%edx)
    1d13:	c7 82 68 02 00 00 ff 	movl   $0xffffffff,0x268(%edx)
    1d1a:	ff ff ff 
    1d1d:	c3                   	ret    
    1d1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1d23:	c3                   	ret    

00001d24 <sys_uname>:
    1d24:	53                   	push   %ebx
    1d25:	83 ec 08             	sub    $0x8,%esp
    1d28:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1d2c:	85 db                	test   %ebx,%ebx
    1d2e:	74 2d                	je     1d5d <sys_uname+0x39>
    1d30:	83 ec 08             	sub    $0x8,%esp
    1d33:	6a 2d                	push   $0x2d
    1d35:	53                   	push   %ebx
    1d36:	e8 fc ff ff ff       	call   1d37 <sys_uname+0x13>
    1d3b:	83 c4 10             	add    $0x10,%esp
    1d3e:	b8 00 00 00 00       	mov    $0x0,%eax
    1d43:	0f b6 90 60 12 00 00 	movzbl 0x1260(%eax),%edx
    1d4a:	64 88 14 03          	mov    %dl,%fs:(%ebx,%eax,1)
    1d4e:	83 c0 01             	add    $0x1,%eax
    1d51:	83 f8 2d             	cmp    $0x2d,%eax
    1d54:	75 ed                	jne    1d43 <sys_uname+0x1f>
    1d56:	b8 00 00 00 00       	mov    $0x0,%eax
    1d5b:	eb 05                	jmp    1d62 <sys_uname+0x3e>
    1d5d:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    1d62:	83 c4 08             	add    $0x8,%esp
    1d65:	5b                   	pop    %ebx
    1d66:	c3                   	ret    

00001d67 <sys_umask>:
    1d67:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1d6d:	0f b7 81 6c 02 00 00 	movzwl 0x26c(%ecx),%eax
    1d74:	0f b7 54 24 04       	movzwl 0x4(%esp),%edx
    1d79:	66 81 e2 ff 01       	and    $0x1ff,%dx
    1d7e:	66 89 91 6c 02 00 00 	mov    %dx,0x26c(%ecx)
    1d85:	c3                   	ret    

00001d86 <release>:
    1d86:	53                   	push   %ebx
    1d87:	83 ec 08             	sub    $0x8,%esp
    1d8a:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1d8e:	85 db                	test   %ebx,%ebx
    1d90:	0f 84 8c 00 00 00    	je     1e22 <release+0x9c>
    1d96:	3b 1d 04 00 00 00    	cmp    0x4,%ebx
    1d9c:	74 10                	je     1dae <release+0x28>
    1d9e:	b8 02 00 00 00       	mov    $0x2,%eax
    1da3:	3b 1c 85 00 00 00 00 	cmp    0x0(,%eax,4),%ebx
    1daa:	75 5e                	jne    1e0a <release+0x84>
    1dac:	eb 05                	jmp    1db3 <release+0x2d>
    1dae:	b8 01 00 00 00       	mov    $0x1,%eax
    1db3:	c7 04 85 00 00 00 00 	movl   $0x0,0x0(,%eax,4)
    1dba:	00 00 00 00 
    1dbe:	83 ec 0c             	sub    $0xc,%esp
    1dc1:	ff b3 04 03 00 00    	pushl  0x304(%ebx)
    1dc7:	e8 fc ff ff ff       	call   1dc8 <release+0x42>
    1dcc:	83 c4 10             	add    $0x10,%esp
    1dcf:	85 c0                	test   %eax,%eax
    1dd1:	75 10                	jne    1de3 <release+0x5d>
    1dd3:	83 ec 0c             	sub    $0xc,%esp
    1dd6:	68 d4 01 00 00       	push   $0x1d4
    1ddb:	e8 fc ff ff ff       	call   1ddc <release+0x56>
    1de0:	83 c4 10             	add    $0x10,%esp
    1de3:	83 ec 0c             	sub    $0xc,%esp
    1de6:	53                   	push   %ebx
    1de7:	e8 fc ff ff ff       	call   1de8 <release+0x62>
    1dec:	83 c4 10             	add    $0x10,%esp
    1def:	85 c0                	test   %eax,%eax
    1df1:	75 10                	jne    1e03 <release+0x7d>
    1df3:	83 ec 0c             	sub    $0xc,%esp
    1df6:	68 00 02 00 00       	push   $0x200
    1dfb:	e8 fc ff ff ff       	call   1dfc <release+0x76>
    1e00:	83 c4 10             	add    $0x10,%esp
    1e03:	e8 fc ff ff ff       	call   1e04 <release+0x7e>
    1e08:	eb 18                	jmp    1e22 <release+0x9c>
    1e0a:	83 c0 01             	add    $0x1,%eax
    1e0d:	83 f8 40             	cmp    $0x40,%eax
    1e10:	75 91                	jne    1da3 <release+0x1d>
    1e12:	83 ec 0c             	sub    $0xc,%esp
    1e15:	68 28 02 00 00       	push   $0x228
    1e1a:	e8 fc ff ff ff       	call   1e1b <release+0x95>
    1e1f:	83 c4 10             	add    $0x10,%esp
    1e22:	83 c4 08             	add    $0x8,%esp
    1e25:	5b                   	pop    %ebx
    1e26:	c3                   	ret    

00001e27 <sys_kill>:
    1e27:	55                   	push   %ebp
    1e28:	57                   	push   %edi
    1e29:	56                   	push   %esi
    1e2a:	53                   	push   %ebx
    1e2b:	83 ec 08             	sub    $0x8,%esp
    1e2e:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    1e32:	8b 7c 24 20          	mov    0x20(%esp),%edi
    1e36:	85 f6                	test   %esi,%esi
    1e38:	75 51                	jne    1e8b <sys_kill+0x64>
    1e3a:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1e40:	8d 4f ff             	lea    -0x1(%edi),%ecx
    1e43:	bd 01 00 00 00       	mov    $0x1,%ebp
    1e48:	d3 e5                	shl    %cl,%ebp
    1e4a:	b8 00 00 00 00       	mov    $0x0,%eax
    1e4f:	ba 00 01 00 00       	mov    $0x100,%edx
    1e54:	89 ce                	mov    %ecx,%esi
    1e56:	eb 23                	jmp    1e7b <sys_kill+0x54>
    1e58:	8b 0a                	mov    (%edx),%ecx
    1e5a:	85 c9                	test   %ecx,%ecx
    1e5c:	74 1d                	je     1e7b <sys_kill+0x54>
    1e5e:	8b bb 2c 02 00 00    	mov    0x22c(%ebx),%edi
    1e64:	39 b9 34 02 00 00    	cmp    %edi,0x234(%ecx)
    1e6a:	75 0f                	jne    1e7b <sys_kill+0x54>
    1e6c:	83 fe 1f             	cmp    $0x1f,%esi
    1e6f:	77 05                	ja     1e76 <sys_kill+0x4f>
    1e71:	09 69 0c             	or     %ebp,0xc(%ecx)
    1e74:	eb 05                	jmp    1e7b <sys_kill+0x54>
    1e76:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    1e7b:	83 ea 04             	sub    $0x4,%edx
    1e7e:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1e84:	75 d2                	jne    1e58 <sys_kill+0x31>
    1e86:	e9 30 01 00 00       	jmp    1fbb <sys_kill+0x194>
    1e8b:	85 f6                	test   %esi,%esi
    1e8d:	7e 74                	jle    1f03 <sys_kill+0xdc>
    1e8f:	8d 4f ff             	lea    -0x1(%edi),%ecx
    1e92:	a1 00 00 00 00       	mov    0x0,%eax
    1e97:	89 04 24             	mov    %eax,(%esp)
    1e9a:	b8 01 00 00 00       	mov    $0x1,%eax
    1e9f:	d3 e0                	shl    %cl,%eax
    1ea1:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ea5:	83 f9 20             	cmp    $0x20,%ecx
    1ea8:	19 ff                	sbb    %edi,%edi
    1eaa:	83 cf ea             	or     $0xffffffea,%edi
    1ead:	b8 00 00 00 00       	mov    $0x0,%eax
    1eb2:	ba 00 01 00 00       	mov    $0x100,%edx
    1eb7:	eb 3a                	jmp    1ef3 <sys_kill+0xcc>
    1eb9:	8b 1a                	mov    (%edx),%ebx
    1ebb:	85 db                	test   %ebx,%ebx
    1ebd:	74 34                	je     1ef3 <sys_kill+0xcc>
    1ebf:	3b b3 2c 02 00 00    	cmp    0x22c(%ebx),%esi
    1ec5:	75 2c                	jne    1ef3 <sys_kill+0xcc>
    1ec7:	83 f9 1f             	cmp    $0x1f,%ecx
    1eca:	77 21                	ja     1eed <sys_kill+0xc6>
    1ecc:	8b 2c 24             	mov    (%esp),%ebp
    1ecf:	0f b7 ad 42 02 00 00 	movzwl 0x242(%ebp),%ebp
    1ed6:	66 39 ab 42 02 00 00 	cmp    %bp,0x242(%ebx)
    1edd:	74 05                	je     1ee4 <sys_kill+0xbd>
    1edf:	66 85 ed             	test   %bp,%bp
    1ee2:	75 0d                	jne    1ef1 <sys_kill+0xca>
    1ee4:	8b 6c 24 04          	mov    0x4(%esp),%ebp
    1ee8:	09 6b 0c             	or     %ebp,0xc(%ebx)
    1eeb:	eb 06                	jmp    1ef3 <sys_kill+0xcc>
    1eed:	89 f8                	mov    %edi,%eax
    1eef:	eb 02                	jmp    1ef3 <sys_kill+0xcc>
    1ef1:	89 f8                	mov    %edi,%eax
    1ef3:	83 ea 04             	sub    $0x4,%edx
    1ef6:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1efc:	75 bb                	jne    1eb9 <sys_kill+0x92>
    1efe:	e9 b8 00 00 00       	jmp    1fbb <sys_kill+0x194>
    1f03:	b8 00 00 00 00       	mov    $0x0,%eax
    1f08:	83 fe ff             	cmp    $0xffffffff,%esi
    1f0b:	0f 85 aa 00 00 00    	jne    1fbb <sys_kill+0x194>
    1f11:	8b 35 00 00 00 00    	mov    0x0,%esi
    1f17:	8d 4f ff             	lea    -0x1(%edi),%ecx
    1f1a:	bf 01 00 00 00       	mov    $0x1,%edi
    1f1f:	d3 e7                	shl    %cl,%edi
    1f21:	89 cb                	mov    %ecx,%ebx
    1f23:	83 f9 20             	cmp    $0x20,%ecx
    1f26:	19 c0                	sbb    %eax,%eax
    1f28:	83 c8 ea             	or     $0xffffffea,%eax
    1f2b:	89 04 24             	mov    %eax,(%esp)
    1f2e:	b8 00 00 00 00       	mov    $0x0,%eax
    1f33:	ba 00 01 00 00       	mov    $0x100,%edx
    1f38:	eb 66                	jmp    1fa0 <sys_kill+0x179>
    1f3a:	8b 0a                	mov    (%edx),%ecx
    1f3c:	85 c9                	test   %ecx,%ecx
    1f3e:	74 6d                	je     1fad <sys_kill+0x186>
    1f40:	83 fb 1f             	cmp    $0x1f,%ebx
    1f43:	77 68                	ja     1fad <sys_kill+0x186>
    1f45:	0f b7 ae 42 02 00 00 	movzwl 0x242(%esi),%ebp
    1f4c:	66 39 a9 42 02 00 00 	cmp    %bp,0x242(%ecx)
    1f53:	74 05                	je     1f5a <sys_kill+0x133>
    1f55:	66 85 ed             	test   %bp,%bp
    1f58:	75 5a                	jne    1fb4 <sys_kill+0x18d>
    1f5a:	09 79 0c             	or     %edi,0xc(%ecx)
    1f5d:	eb 36                	jmp    1f95 <sys_kill+0x16e>
    1f5f:	8b 0a                	mov    (%edx),%ecx
    1f61:	85 c9                	test   %ecx,%ecx
    1f63:	74 30                	je     1f95 <sys_kill+0x16e>
    1f65:	83 b9 34 02 00 00 01 	cmpl   $0x1,0x234(%ecx)
    1f6c:	75 27                	jne    1f95 <sys_kill+0x16e>
    1f6e:	83 fb 1f             	cmp    $0x1f,%ebx
    1f71:	77 1a                	ja     1f8d <sys_kill+0x166>
    1f73:	0f b7 ae 42 02 00 00 	movzwl 0x242(%esi),%ebp
    1f7a:	66 39 a9 42 02 00 00 	cmp    %bp,0x242(%ecx)
    1f81:	74 05                	je     1f88 <sys_kill+0x161>
    1f83:	66 85 ed             	test   %bp,%bp
    1f86:	75 0a                	jne    1f92 <sys_kill+0x16b>
    1f88:	09 79 0c             	or     %edi,0xc(%ecx)
    1f8b:	eb 08                	jmp    1f95 <sys_kill+0x16e>
    1f8d:	8b 04 24             	mov    (%esp),%eax
    1f90:	eb 03                	jmp    1f95 <sys_kill+0x16e>
    1f92:	8b 04 24             	mov    (%esp),%eax
    1f95:	83 ea 04             	sub    $0x4,%edx
    1f98:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1f9e:	77 bf                	ja     1f5f <sys_kill+0x138>
    1fa0:	83 ea 04             	sub    $0x4,%edx
    1fa3:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    1fa9:	77 8f                	ja     1f3a <sys_kill+0x113>
    1fab:	eb 0e                	jmp    1fbb <sys_kill+0x194>
    1fad:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    1fb2:	eb ec                	jmp    1fa0 <sys_kill+0x179>
    1fb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fb9:	eb e5                	jmp    1fa0 <sys_kill+0x179>
    1fbb:	83 c4 08             	add    $0x8,%esp
    1fbe:	5b                   	pop    %ebx
    1fbf:	5e                   	pop    %esi
    1fc0:	5f                   	pop    %edi
    1fc1:	5d                   	pop    %ebp
    1fc2:	c3                   	ret    

00001fc3 <do_exit>:
    1fc3:	55                   	push   %ebp
    1fc4:	57                   	push   %edi
    1fc5:	56                   	push   %esi
    1fc6:	53                   	push   %ebx
    1fc7:	83 ec 18             	sub    $0x18,%esp
    1fca:	68 4c 02 00 00       	push   $0x24c
    1fcf:	e8 fc ff ff ff       	call   1fd0 <do_exit+0xd>
    1fd4:	b9 0f 00 00 00       	mov    $0xf,%ecx
    1fd9:	0f 03 c9             	lsl    %cx,%ecx
    1fdc:	41                   	inc    %ecx
    1fdd:	50                   	push   %eax
    1fde:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1fe4:	8d 83 d8 02 00 00    	lea    0x2d8(%ebx),%eax
    1fea:	83 c0 07             	add    $0x7,%eax
    1fed:	8a 30                	mov    (%eax),%dh
    1fef:	83 e8 03             	sub    $0x3,%eax
    1ff2:	8a 10                	mov    (%eax),%dl
    1ff4:	c1 e2 10             	shl    $0x10,%edx
    1ff7:	83 e8 02             	sub    $0x2,%eax
    1ffa:	66 8b 10             	mov    (%eax),%dx
    1ffd:	58                   	pop    %eax
    1ffe:	6a 02                	push   $0x2
    2000:	53                   	push   %ebx
    2001:	51                   	push   %ecx
    2002:	52                   	push   %edx
    2003:	e8 fc ff ff ff       	call   2004 <do_exit+0x41>
    2008:	b9 17 00 00 00       	mov    $0x17,%ecx
    200d:	0f 03 c9             	lsl    %cx,%ecx
    2010:	41                   	inc    %ecx
    2011:	50                   	push   %eax
    2012:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    2018:	8d 83 e0 02 00 00    	lea    0x2e0(%ebx),%eax
    201e:	83 c0 07             	add    $0x7,%eax
    2021:	8a 30                	mov    (%eax),%dh
    2023:	83 e8 03             	sub    $0x3,%eax
    2026:	8a 10                	mov    (%eax),%dl
    2028:	c1 e2 10             	shl    $0x10,%edx
    202b:	83 e8 02             	sub    $0x2,%eax
    202e:	66 8b 10             	mov    (%eax),%dx
    2031:	58                   	pop    %eax
    2032:	83 c4 20             	add    $0x20,%esp
    2035:	6a 02                	push   $0x2
    2037:	53                   	push   %ebx
    2038:	51                   	push   %ecx
    2039:	52                   	push   %edx
    203a:	e8 fc ff ff ff       	call   203b <do_exit+0x78>
    203f:	c7 04 24 4c 02 00 00 	movl   $0x24c,(%esp)
    2046:	e8 fc ff ff ff       	call   2047 <do_exit+0x84>
    204b:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2051:	8b 3d 04 00 00 00    	mov    0x4,%edi
    2057:	be 00 00 00 00       	mov    $0x0,%esi
    205c:	bb 00 01 00 00       	mov    $0x100,%ebx
    2061:	83 c4 10             	add    $0x10,%esp
    2064:	89 f0                	mov    %esi,%eax
    2066:	8b 10                	mov    (%eax),%edx
    2068:	85 d2                	test   %edx,%edx
    206a:	74 28                	je     2094 <do_exit+0xd1>
    206c:	8b a9 2c 02 00 00    	mov    0x22c(%ecx),%ebp
    2072:	39 aa 30 02 00 00    	cmp    %ebp,0x230(%edx)
    2078:	75 1a                	jne    2094 <do_exit+0xd1>
    207a:	c7 82 30 02 00 00 01 	movl   $0x1,0x230(%edx)
    2081:	00 00 00 
    2084:	83 3a 03             	cmpl   $0x3,(%edx)
    2087:	75 0b                	jne    2094 <do_exit+0xd1>
    2089:	85 ff                	test   %edi,%edi
    208b:	74 07                	je     2094 <do_exit+0xd1>
    208d:	81 4f 0c 00 00 01 00 	orl    $0x10000,0xc(%edi)
    2094:	83 c0 04             	add    $0x4,%eax
    2097:	39 d8                	cmp    %ebx,%eax
    2099:	75 cb                	jne    2066 <do_exit+0xa3>
    209b:	bf 00 00 00 00       	mov    $0x0,%edi
    20a0:	a1 00 00 00 00       	mov    0x0,%eax
    20a5:	83 bc b8 80 02 00 00 	cmpl   $0x0,0x280(%eax,%edi,4)
    20ac:	00 
    20ad:	74 0c                	je     20bb <do_exit+0xf8>
    20af:	83 ec 0c             	sub    $0xc,%esp
    20b2:	57                   	push   %edi
    20b3:	e8 fc ff ff ff       	call   20b4 <do_exit+0xf1>
    20b8:	83 c4 10             	add    $0x10,%esp
    20bb:	83 c7 01             	add    $0x1,%edi
    20be:	83 ff 14             	cmp    $0x14,%edi
    20c1:	75 dd                	jne    20a0 <do_exit+0xdd>
    20c3:	83 ec 0c             	sub    $0xc,%esp
    20c6:	a1 00 00 00 00       	mov    0x0,%eax
    20cb:	ff b0 70 02 00 00    	pushl  0x270(%eax)
    20d1:	e8 fc ff ff ff       	call   20d2 <do_exit+0x10f>
    20d6:	a1 00 00 00 00       	mov    0x0,%eax
    20db:	c7 80 70 02 00 00 00 	movl   $0x0,0x270(%eax)
    20e2:	00 00 00 
    20e5:	83 c4 04             	add    $0x4,%esp
    20e8:	ff b0 74 02 00 00    	pushl  0x274(%eax)
    20ee:	e8 fc ff ff ff       	call   20ef <do_exit+0x12c>
    20f3:	a1 00 00 00 00       	mov    0x0,%eax
    20f8:	c7 80 74 02 00 00 00 	movl   $0x0,0x274(%eax)
    20ff:	00 00 00 
    2102:	83 c4 04             	add    $0x4,%esp
    2105:	ff b0 78 02 00 00    	pushl  0x278(%eax)
    210b:	e8 fc ff ff ff       	call   210c <do_exit+0x149>
    2110:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2116:	c7 81 78 02 00 00 00 	movl   $0x0,0x278(%ecx)
    211d:	00 00 00 
    2120:	83 c4 10             	add    $0x10,%esp
    2123:	83 b9 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ecx)
    212a:	0f 84 d0 00 00 00    	je     2200 <do_exit+0x23d>
    2130:	8b 81 68 02 00 00    	mov    0x268(%ecx),%eax
    2136:	85 c0                	test   %eax,%eax
    2138:	0f 88 94 00 00 00    	js     21d2 <do_exit+0x20f>
    213e:	69 c0 60 0c 00 00    	imul   $0xc60,%eax,%eax
    2144:	c7 80 24 00 00 00 00 	movl   $0x0,0x24(%eax)
    214b:	00 00 00 
    214e:	3b 0d 00 00 00 00    	cmp    0x0,%ecx
    2154:	75 0a                	jne    2160 <do_exit+0x19d>
    2156:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
    215d:	00 00 00 
    2160:	83 b9 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ecx)
    2167:	74 76                	je     21df <do_exit+0x21c>
    2169:	b8 00 01 00 00       	mov    $0x100,%eax
    216e:	eb 18                	jmp    2188 <do_exit+0x1c5>
    2170:	8b 10                	mov    (%eax),%edx
    2172:	85 d2                	test   %edx,%edx
    2174:	74 12                	je     2188 <do_exit+0x1c5>
    2176:	8b b9 38 02 00 00    	mov    0x238(%ecx),%edi
    217c:	39 ba 38 02 00 00    	cmp    %edi,0x238(%edx)
    2182:	75 04                	jne    2188 <do_exit+0x1c5>
    2184:	83 4a 0c 01          	orl    $0x1,0xc(%edx)
    2188:	83 e8 04             	sub    $0x4,%eax
    218b:	3d 00 00 00 00       	cmp    $0x0,%eax
    2190:	75 de                	jne    2170 <do_exit+0x1ad>
    2192:	eb 4b                	jmp    21df <do_exit+0x21c>
    2194:	8b 06                	mov    (%esi),%eax
    2196:	85 c0                	test   %eax,%eax
    2198:	74 11                	je     21ab <do_exit+0x1e8>
    219a:	39 90 2c 02 00 00    	cmp    %edx,0x22c(%eax)
    21a0:	75 09                	jne    21ab <do_exit+0x1e8>
    21a2:	81 48 0c 00 00 01 00 	orl    $0x10000,0xc(%eax)
    21a9:	eb 62                	jmp    220d <do_exit+0x24a>
    21ab:	83 c6 04             	add    $0x4,%esi
    21ae:	39 de                	cmp    %ebx,%esi
    21b0:	75 e2                	jne    2194 <do_exit+0x1d1>
    21b2:	83 ec 0c             	sub    $0xc,%esp
    21b5:	68 c6 01 00 00       	push   $0x1c6
    21ba:	e8 fc ff ff ff       	call   21bb <do_exit+0x1f8>
    21bf:	83 c4 04             	add    $0x4,%esp
    21c2:	ff 35 00 00 00 00    	pushl  0x0
    21c8:	e8 fc ff ff ff       	call   21c9 <do_exit+0x206>
    21cd:	83 c4 10             	add    $0x10,%esp
    21d0:	eb 3b                	jmp    220d <do_exit+0x24a>
    21d2:	3b 0d 00 00 00 00    	cmp    0x0,%ecx
    21d8:	75 8f                	jne    2169 <do_exit+0x1a6>
    21da:	e9 77 ff ff ff       	jmp    2156 <do_exit+0x193>
    21df:	c7 01 03 00 00 00    	movl   $0x3,(%ecx)
    21e5:	a1 00 00 00 00       	mov    0x0,%eax
    21ea:	8b 54 24 20          	mov    0x20(%esp),%edx
    21ee:	89 90 14 02 00 00    	mov    %edx,0x214(%eax)
    21f4:	8b 90 30 02 00 00    	mov    0x230(%eax),%edx
    21fa:	85 d2                	test   %edx,%edx
    21fc:	75 96                	jne    2194 <do_exit+0x1d1>
    21fe:	eb b2                	jmp    21b2 <do_exit+0x1ef>
    2200:	39 0d 00 00 00 00    	cmp    %ecx,0x0
    2206:	75 d7                	jne    21df <do_exit+0x21c>
    2208:	e9 49 ff ff ff       	jmp    2156 <do_exit+0x193>
    220d:	e8 fc ff ff ff       	call   220e <do_exit+0x24b>
    2212:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2217:	83 c4 0c             	add    $0xc,%esp
    221a:	5b                   	pop    %ebx
    221b:	5e                   	pop    %esi
    221c:	5f                   	pop    %edi
    221d:	5d                   	pop    %ebp
    221e:	c3                   	ret    

0000221f <sys_exit>:
    221f:	83 ec 18             	sub    $0x18,%esp
    2222:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    2226:	c1 e0 08             	shl    $0x8,%eax
    2229:	0f b7 c0             	movzwl %ax,%eax
    222c:	50                   	push   %eax
    222d:	e8 fc ff ff ff       	call   222e <sys_exit+0xf>
    2232:	83 c4 1c             	add    $0x1c,%esp
    2235:	c3                   	ret    

00002236 <sys_waitpid>:
    2236:	55                   	push   %ebp
    2237:	57                   	push   %edi
    2238:	56                   	push   %esi
    2239:	53                   	push   %ebx
    223a:	83 ec 24             	sub    $0x24,%esp
    223d:	8b 74 24 38          	mov    0x38(%esp),%esi
    2241:	6a 04                	push   $0x4
    2243:	ff 74 24 40          	pushl  0x40(%esp)
    2247:	e8 fc ff ff ff       	call   2248 <sys_waitpid+0x12>
    224c:	83 c4 10             	add    $0x10,%esp
    224f:	8b 7c 24 38          	mov    0x38(%esp),%edi
    2253:	83 e7 02             	and    $0x2,%edi
    2256:	89 f5                	mov    %esi,%ebp
    2258:	f7 dd                	neg    %ebp
    225a:	8b 15 00 00 00 00    	mov    0x0,%edx
    2260:	bb fc 00 00 00       	mov    $0xfc,%ebx
    2265:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    226c:	00 
    226d:	8b 03                	mov    (%ebx),%eax
    226f:	85 c0                	test   %eax,%eax
    2271:	0f 84 d6 00 00 00    	je     234d <sys_waitpid+0x117>
    2277:	39 d0                	cmp    %edx,%eax
    2279:	0f 84 ce 00 00 00    	je     234d <sys_waitpid+0x117>
    227f:	8b 8a 2c 02 00 00    	mov    0x22c(%edx),%ecx
    2285:	39 88 30 02 00 00    	cmp    %ecx,0x230(%eax)
    228b:	0f 85 bc 00 00 00    	jne    234d <sys_waitpid+0x117>
    2291:	85 f6                	test   %esi,%esi
    2293:	7e 0e                	jle    22a3 <sys_waitpid+0x6d>
    2295:	3b b0 2c 02 00 00    	cmp    0x22c(%eax),%esi
    229b:	0f 85 ac 00 00 00    	jne    234d <sys_waitpid+0x117>
    22a1:	eb 29                	jmp    22cc <sys_waitpid+0x96>
    22a3:	85 f6                	test   %esi,%esi
    22a5:	75 14                	jne    22bb <sys_waitpid+0x85>
    22a7:	8b 8a 34 02 00 00    	mov    0x234(%edx),%ecx
    22ad:	39 88 34 02 00 00    	cmp    %ecx,0x234(%eax)
    22b3:	0f 85 94 00 00 00    	jne    234d <sys_waitpid+0x117>
    22b9:	eb 11                	jmp    22cc <sys_waitpid+0x96>
    22bb:	83 fe ff             	cmp    $0xffffffff,%esi
    22be:	74 0c                	je     22cc <sys_waitpid+0x96>
    22c0:	39 a8 34 02 00 00    	cmp    %ebp,0x234(%eax)
    22c6:	0f 85 81 00 00 00    	jne    234d <sys_waitpid+0x117>
    22cc:	8b 08                	mov    (%eax),%ecx
    22ce:	83 f9 03             	cmp    $0x3,%ecx
    22d1:	74 20                	je     22f3 <sys_waitpid+0xbd>
    22d3:	83 f9 04             	cmp    $0x4,%ecx
    22d6:	75 6d                	jne    2345 <sys_waitpid+0x10f>
    22d8:	85 ff                	test   %edi,%edi
    22da:	74 71                	je     234d <sys_waitpid+0x117>
    22dc:	ba 7f 00 00 00       	mov    $0x7f,%edx
    22e1:	8b 7c 24 34          	mov    0x34(%esp),%edi
    22e5:	64 89 17             	mov    %edx,%fs:(%edi)
    22e8:	8b 80 2c 02 00 00    	mov    0x22c(%eax),%eax
    22ee:	e9 ae 00 00 00       	jmp    23a1 <sys_waitpid+0x16b>
    22f3:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
    22f9:	01 82 58 02 00 00    	add    %eax,0x258(%edx)
    22ff:	8b 03                	mov    (%ebx),%eax
    2301:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
    2307:	01 82 5c 02 00 00    	add    %eax,0x25c(%edx)
    230d:	8b 03                	mov    (%ebx),%eax
    230f:	8b b0 2c 02 00 00    	mov    0x22c(%eax),%esi
    2315:	8b b8 14 02 00 00    	mov    0x214(%eax),%edi
    231b:	57                   	push   %edi
    231c:	ff b0 30 02 00 00    	pushl  0x230(%eax)
    2322:	56                   	push   %esi
    2323:	68 74 02 00 00       	push   $0x274
    2328:	e8 fc ff ff ff       	call   2329 <sys_waitpid+0xf3>
    232d:	83 c4 04             	add    $0x4,%esp
    2330:	ff 33                	pushl  (%ebx)
    2332:	e8 fc ff ff ff       	call   2333 <sys_waitpid+0xfd>
    2337:	8b 44 24 44          	mov    0x44(%esp),%eax
    233b:	64 89 38             	mov    %edi,%fs:(%eax)
    233e:	83 c4 10             	add    $0x10,%esp
    2341:	89 f0                	mov    %esi,%eax
    2343:	eb 5c                	jmp    23a1 <sys_waitpid+0x16b>
    2345:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    234c:	00 
    234d:	83 eb 04             	sub    $0x4,%ebx
    2350:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
    2356:	0f 85 11 ff ff ff    	jne    226d <sys_waitpid+0x37>
    235c:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    2361:	74 32                	je     2395 <sys_waitpid+0x15f>
    2363:	f6 44 24 38 01       	testb  $0x1,0x38(%esp)
    2368:	75 32                	jne    239c <sys_waitpid+0x166>
    236a:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
    2370:	e8 fc ff ff ff       	call   2371 <sys_waitpid+0x13b>
    2375:	8b 15 00 00 00 00    	mov    0x0,%edx
    237b:	8b 42 0c             	mov    0xc(%edx),%eax
    237e:	25 ff ff fe ff       	and    $0xfffeffff,%eax
    2383:	89 42 0c             	mov    %eax,0xc(%edx)
    2386:	85 c0                	test   %eax,%eax
    2388:	0f 84 cc fe ff ff    	je     225a <sys_waitpid+0x24>
    238e:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    2393:	eb 0c                	jmp    23a1 <sys_waitpid+0x16b>
    2395:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
    239a:	eb 05                	jmp    23a1 <sys_waitpid+0x16b>
    239c:	b8 00 00 00 00       	mov    $0x0,%eax
    23a1:	83 c4 1c             	add    $0x1c,%esp
    23a4:	5b                   	pop    %ebx
    23a5:	5e                   	pop    %esi
    23a6:	5f                   	pop    %edi
    23a7:	5d                   	pop    %ebp
    23a8:	c3                   	ret    

000023a9 <sys_sgetmask>:
    23a9:	a1 00 00 00 00       	mov    0x0,%eax
    23ae:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
    23b4:	c3                   	ret    

000023b5 <sys_ssetmask>:
    23b5:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    23bb:	8b 81 10 02 00 00    	mov    0x210(%ecx),%eax
    23c1:	8b 54 24 04          	mov    0x4(%esp),%edx
    23c5:	80 e6 fe             	and    $0xfe,%dh
    23c8:	89 91 10 02 00 00    	mov    %edx,0x210(%ecx)
    23ce:	c3                   	ret    

000023cf <sys_signal>:
    23cf:	8b 54 24 04          	mov    0x4(%esp),%edx
    23d3:	8d 42 ff             	lea    -0x1(%edx),%eax
    23d6:	83 f8 1f             	cmp    $0x1f,%eax
    23d9:	77 2c                	ja     2407 <sys_signal+0x38>
    23db:	83 fa 09             	cmp    $0x9,%edx
    23de:	74 27                	je     2407 <sys_signal+0x38>
    23e0:	c1 e2 04             	shl    $0x4,%edx
    23e3:	03 15 00 00 00 00    	add    0x0,%edx
    23e9:	8b 02                	mov    (%edx),%eax
    23eb:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    23ef:	89 0a                	mov    %ecx,(%edx)
    23f1:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
    23f8:	c7 42 08 00 00 00 c0 	movl   $0xc0000000,0x8(%edx)
    23ff:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    2403:	89 4a 0c             	mov    %ecx,0xc(%edx)
    2406:	c3                   	ret    
    2407:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    240c:	c3                   	ret    

0000240d <sys_sigaction>:
    240d:	55                   	push   %ebp
    240e:	57                   	push   %edi
    240f:	56                   	push   %esi
    2410:	53                   	push   %ebx
    2411:	83 ec 1c             	sub    $0x1c,%esp
    2414:	8b 74 24 30          	mov    0x30(%esp),%esi
    2418:	8b 54 24 34          	mov    0x34(%esp),%edx
    241c:	8b 5c 24 38          	mov    0x38(%esp),%ebx
    2420:	8d 46 ff             	lea    -0x1(%esi),%eax
    2423:	83 f8 1f             	cmp    $0x1f,%eax
    2426:	0f 87 92 00 00 00    	ja     24be <sys_sigaction+0xb1>
    242c:	83 fe 09             	cmp    $0x9,%esi
    242f:	0f 84 89 00 00 00    	je     24be <sys_sigaction+0xb1>
    2435:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    243b:	89 c7                	mov    %eax,%edi
    243d:	89 f0                	mov    %esi,%eax
    243f:	c1 e0 04             	shl    $0x4,%eax
    2442:	01 c8                	add    %ecx,%eax
    2444:	8b 28                	mov    (%eax),%ebp
    2446:	89 2c 24             	mov    %ebp,(%esp)
    2449:	8b 68 04             	mov    0x4(%eax),%ebp
    244c:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    2450:	8b 68 08             	mov    0x8(%eax),%ebp
    2453:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    2457:	8b 40 0c             	mov    0xc(%eax),%eax
    245a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    245e:	89 f0                	mov    %esi,%eax
    2460:	c1 e0 04             	shl    $0x4,%eax
    2463:	8d 04 08             	lea    (%eax,%ecx,1),%eax
    2466:	8d 68 10             	lea    0x10(%eax),%ebp
    2469:	83 c0 01             	add    $0x1,%eax
    246c:	64 8a 0a             	mov    %fs:(%edx),%cl
    246f:	88 48 ff             	mov    %cl,-0x1(%eax)
    2472:	8d 52 01             	lea    0x1(%edx),%edx
    2475:	39 e8                	cmp    %ebp,%eax
    2477:	75 f0                	jne    2469 <sys_sigaction+0x5c>
    2479:	eb 5c                	jmp    24d7 <sys_sigaction+0xca>
    247b:	0f b6 10             	movzbl (%eax),%edx
    247e:	64 88 13             	mov    %dl,%fs:(%ebx)
    2481:	83 c0 01             	add    $0x1,%eax
    2484:	83 c3 01             	add    $0x1,%ebx
    2487:	8d 4c 24 10          	lea    0x10(%esp),%ecx
    248b:	39 c8                	cmp    %ecx,%eax
    248d:	75 ec                	jne    247b <sys_sigaction+0x6e>
    248f:	c1 e6 04             	shl    $0x4,%esi
    2492:	03 35 00 00 00 00    	add    0x0,%esi
    2498:	8b 46 08             	mov    0x8(%esi),%eax
    249b:	25 00 00 00 40       	and    $0x40000000,%eax
    24a0:	74 0e                	je     24b0 <sys_sigaction+0xa3>
    24a2:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
    24a9:	b8 00 00 00 00       	mov    $0x0,%eax
    24ae:	eb 2d                	jmp    24dd <sys_sigaction+0xd0>
    24b0:	ba 01 00 00 00       	mov    $0x1,%edx
    24b5:	89 f9                	mov    %edi,%ecx
    24b7:	d3 e2                	shl    %cl,%edx
    24b9:	09 56 04             	or     %edx,0x4(%esi)
    24bc:	eb 1f                	jmp    24dd <sys_sigaction+0xd0>
    24be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    24c3:	eb 18                	jmp    24dd <sys_sigaction+0xd0>
    24c5:	83 ec 08             	sub    $0x8,%esp
    24c8:	6a 10                	push   $0x10
    24ca:	53                   	push   %ebx
    24cb:	e8 fc ff ff ff       	call   24cc <sys_sigaction+0xbf>
    24d0:	83 c4 10             	add    $0x10,%esp
    24d3:	89 e0                	mov    %esp,%eax
    24d5:	eb a4                	jmp    247b <sys_sigaction+0x6e>
    24d7:	85 db                	test   %ebx,%ebx
    24d9:	75 ea                	jne    24c5 <sys_sigaction+0xb8>
    24db:	eb b2                	jmp    248f <sys_sigaction+0x82>
    24dd:	83 c4 1c             	add    $0x1c,%esp
    24e0:	5b                   	pop    %ebx
    24e1:	5e                   	pop    %esi
    24e2:	5f                   	pop    %edi
    24e3:	5d                   	pop    %ebp
    24e4:	c3                   	ret    

000024e5 <do_signal>:
    24e5:	57                   	push   %edi
    24e6:	56                   	push   %esi
    24e7:	53                   	push   %ebx
    24e8:	8b 7c 24 10          	mov    0x10(%esp),%edi
    24ec:	89 fb                	mov    %edi,%ebx
    24ee:	c1 e3 04             	shl    $0x4,%ebx
    24f1:	03 1d 00 00 00 00    	add    0x0,%ebx
    24f7:	8b 03                	mov    (%ebx),%eax
    24f9:	83 f8 01             	cmp    $0x1,%eax
    24fc:	0f 84 b1 00 00 00    	je     25b3 <do_signal+0xce>
    2502:	85 c0                	test   %eax,%eax
    2504:	75 1f                	jne    2525 <do_signal+0x40>
    2506:	83 ff 11             	cmp    $0x11,%edi
    2509:	0f 84 a4 00 00 00    	je     25b3 <do_signal+0xce>
    250f:	83 ec 0c             	sub    $0xc,%esp
    2512:	8d 4f ff             	lea    -0x1(%edi),%ecx
    2515:	b8 01 00 00 00       	mov    $0x1,%eax
    251a:	d3 e0                	shl    %cl,%eax
    251c:	50                   	push   %eax
    251d:	e8 fc ff ff ff       	call   251e <do_signal+0x39>
    2522:	83 c4 10             	add    $0x10,%esp
    2525:	8b 43 08             	mov    0x8(%ebx),%eax
    2528:	85 c0                	test   %eax,%eax
    252a:	79 06                	jns    2532 <do_signal+0x4d>
    252c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    2532:	25 00 00 00 40       	and    $0x40000000,%eax
    2537:	83 f8 01             	cmp    $0x1,%eax
    253a:	19 c0                	sbb    %eax,%eax
    253c:	f7 d0                	not    %eax
    253e:	8d 04 85 20 00 00 00 	lea    0x20(,%eax,4),%eax
    2545:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    2549:	29 c6                	sub    %eax,%esi
    254b:	83 ec 08             	sub    $0x8,%esp
    254e:	50                   	push   %eax
    254f:	56                   	push   %esi
    2550:	e8 fc ff ff ff       	call   2551 <do_signal+0x6c>
    2555:	8b 43 0c             	mov    0xc(%ebx),%eax
    2558:	64 89 06             	mov    %eax,%fs:(%esi)
    255b:	8d 46 08             	lea    0x8(%esi),%eax
    255e:	64 89 7e 04          	mov    %edi,%fs:0x4(%esi)
    2562:	83 c4 10             	add    $0x10,%esp
    2565:	f6 43 0b 40          	testb  $0x40,0xb(%ebx)
    2569:	75 13                	jne    257e <do_signal+0x99>
    256b:	8d 46 0c             	lea    0xc(%esi),%eax
    256e:	8b 15 00 00 00 00    	mov    0x0,%edx
    2574:	8b 92 10 02 00 00    	mov    0x210(%edx),%edx
    257a:	64 89 56 08          	mov    %edx,%fs:0x8(%esi)
    257e:	8b 54 24 14          	mov    0x14(%esp),%edx
    2582:	64 89 10             	mov    %edx,%fs:(%eax)
    2585:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    2589:	64 89 50 04          	mov    %edx,%fs:0x4(%eax)
    258d:	8b 54 24 20          	mov    0x20(%esp),%edx
    2591:	64 89 50 08          	mov    %edx,%fs:0x8(%eax)
    2595:	8b 54 24 38          	mov    0x38(%esp),%edx
    2599:	64 89 50 0c          	mov    %edx,%fs:0xc(%eax)
    259d:	8b 54 24 30          	mov    0x30(%esp),%edx
    25a1:	64 89 50 10          	mov    %edx,%fs:0x10(%eax)
    25a5:	a1 00 00 00 00       	mov    0x0,%eax
    25aa:	8b 53 04             	mov    0x4(%ebx),%edx
    25ad:	09 90 10 02 00 00    	or     %edx,0x210(%eax)
    25b3:	5b                   	pop    %ebx
    25b4:	5e                   	pop    %esi
    25b5:	5f                   	pop    %edi
    25b6:	c3                   	ret    

000025b7 <kernel_mktime>:
    25b7:	53                   	push   %ebx
    25b8:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    25bc:	8b 51 14             	mov    0x14(%ecx),%edx
    25bf:	8d 42 be             	lea    -0x42(%edx),%eax
    25c2:	89 d3                	mov    %edx,%ebx
    25c4:	83 eb 45             	sub    $0x45,%ebx
    25c7:	0f 48 d8             	cmovs  %eax,%ebx
    25ca:	c1 fb 02             	sar    $0x2,%ebx
    25cd:	69 db 80 51 01 00    	imul   $0x15180,%ebx,%ebx
    25d3:	8d 42 ba             	lea    -0x46(%edx),%eax
    25d6:	69 c0 80 33 e1 01    	imul   $0x1e13380,%eax,%eax
    25dc:	01 d8                	add    %ebx,%eax
    25de:	8b 59 10             	mov    0x10(%ecx),%ebx
    25e1:	03 04 9d e0 00 00 00 	add    0xe0(,%ebx,4),%eax
    25e8:	83 fb 01             	cmp    $0x1,%ebx
    25eb:	7e 0e                	jle    25fb <kernel_mktime+0x44>
    25ed:	83 e2 03             	and    $0x3,%edx
    25f0:	8d 98 80 ae fe ff    	lea    -0x15180(%eax),%ebx
    25f6:	85 d2                	test   %edx,%edx
    25f8:	0f 45 c3             	cmovne %ebx,%eax
    25fb:	8b 51 0c             	mov    0xc(%ecx),%edx
    25fe:	83 ea 01             	sub    $0x1,%edx
    2601:	69 d2 80 51 01 00    	imul   $0x15180,%edx,%edx
    2607:	01 d0                	add    %edx,%eax
    2609:	69 51 08 10 0e 00 00 	imul   $0xe10,0x8(%ecx),%edx
    2610:	01 d0                	add    %edx,%eax
    2612:	6b 51 04 3c          	imul   $0x3c,0x4(%ecx),%edx
    2616:	01 d0                	add    %edx,%eax
    2618:	03 01                	add    (%ecx),%eax
    261a:	5b                   	pop    %ebx
    261b:	c3                   	ret    
