
fs.o:     file format elf32-i386


Disassembly of section .text:

00000000 <sys_ustat>:
       0:	b8 da ff ff ff       	mov    $0xffffffda,%eax
       5:	c3                   	ret    

00000006 <sys_utime>:
       6:	53                   	push   %ebx
       7:	83 ec 14             	sub    $0x14,%esp
       a:	8b 5c 24 20          	mov    0x20(%esp),%ebx
       e:	ff 74 24 1c          	pushl  0x1c(%esp)
      12:	e8 fc ff ff ff       	call   13 <sys_utime+0xd>
      17:	83 c4 10             	add    $0x10,%esp
      1a:	85 c0                	test   %eax,%eax
      1c:	74 4b                	je     69 <sys_utime+0x63>
      1e:	89 c1                	mov    %eax,%ecx
      20:	85 db                	test   %ebx,%ebx
      22:	74 09                	je     2d <sys_utime+0x27>
      24:	64 8b 03             	mov    %fs:(%ebx),%eax
      27:	64 8b 53 04          	mov    %fs:0x4(%ebx),%edx
      2b:	eb 1f                	jmp    4c <sys_utime+0x46>
      2d:	8b 1d 00 00 00 00    	mov    0x0,%ebx
      33:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
      38:	f7 eb                	imul   %ebx
      3a:	89 d0                	mov    %edx,%eax
      3c:	c1 f8 05             	sar    $0x5,%eax
      3f:	c1 fb 1f             	sar    $0x1f,%ebx
      42:	29 d8                	sub    %ebx,%eax
      44:	03 05 00 00 00 00    	add    0x0,%eax
      4a:	89 c2                	mov    %eax,%edx
      4c:	89 41 24             	mov    %eax,0x24(%ecx)
      4f:	89 51 08             	mov    %edx,0x8(%ecx)
      52:	c6 41 33 01          	movb   $0x1,0x33(%ecx)
      56:	83 ec 0c             	sub    $0xc,%esp
      59:	51                   	push   %ecx
      5a:	e8 fc ff ff ff       	call   5b <sys_utime+0x55>
      5f:	83 c4 10             	add    $0x10,%esp
      62:	b8 00 00 00 00       	mov    $0x0,%eax
      67:	eb 05                	jmp    6e <sys_utime+0x68>
      69:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
      6e:	83 c4 08             	add    $0x8,%esp
      71:	5b                   	pop    %ebx
      72:	c3                   	ret    

00000073 <sys_access>:
      73:	55                   	push   %ebp
      74:	57                   	push   %edi
      75:	56                   	push   %esi
      76:	53                   	push   %ebx
      77:	83 ec 18             	sub    $0x18,%esp
      7a:	8b 6c 24 30          	mov    0x30(%esp),%ebp
      7e:	83 e5 07             	and    $0x7,%ebp
      81:	ff 74 24 2c          	pushl  0x2c(%esp)
      85:	e8 fc ff ff ff       	call   86 <sys_access+0x13>
      8a:	83 c4 10             	add    $0x10,%esp
      8d:	85 c0                	test   %eax,%eax
      8f:	74 61                	je     f2 <sys_access+0x7f>
      91:	89 c3                	mov    %eax,%ebx
      93:	8b 38                	mov    (%eax),%edi
      95:	89 fe                	mov    %edi,%esi
      97:	81 e6 ff 01 00 00    	and    $0x1ff,%esi
      9d:	83 ec 0c             	sub    $0xc,%esp
      a0:	50                   	push   %eax
      a1:	e8 fc ff ff ff       	call   a2 <sys_access+0x2f>
      a6:	8b 15 00 00 00 00    	mov    0x0,%edx
      ac:	8b 82 40 02 00 00    	mov    0x240(%edx),%eax
      b2:	83 c4 10             	add    $0x10,%esp
      b5:	66 3b 43 02          	cmp    0x2(%ebx),%ax
      b9:	75 05                	jne    c0 <sys_access+0x4d>
      bb:	c1 fe 06             	sar    $0x6,%esi
      be:	eb 10                	jmp    d0 <sys_access+0x5d>
      c0:	0f b6 4b 0c          	movzbl 0xc(%ebx),%ecx
      c4:	66 39 8a 46 02 00 00 	cmp    %cx,0x246(%edx)
      cb:	75 03                	jne    d0 <sys_access+0x5d>
      cd:	c1 fe 06             	sar    $0x6,%esi
      d0:	21 ee                	and    %ebp,%esi
      d2:	39 f5                	cmp    %esi,%ebp
      d4:	74 23                	je     f9 <sys_access+0x86>
      d6:	66 85 c0             	test   %ax,%ax
      d9:	75 25                	jne    100 <sys_access+0x8d>
      db:	8b 44 24 24          	mov    0x24(%esp),%eax
      df:	83 e0 01             	and    $0x1,%eax
      e2:	74 21                	je     105 <sys_access+0x92>
      e4:	83 e7 49             	and    $0x49,%edi
      e7:	66 83 ff 01          	cmp    $0x1,%di
      eb:	19 c0                	sbb    %eax,%eax
      ed:	83 e0 f3             	and    $0xfffffff3,%eax
      f0:	eb 13                	jmp    105 <sys_access+0x92>
      f2:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
      f7:	eb 0c                	jmp    105 <sys_access+0x92>
      f9:	b8 00 00 00 00       	mov    $0x0,%eax
      fe:	eb 05                	jmp    105 <sys_access+0x92>
     100:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
     105:	83 c4 0c             	add    $0xc,%esp
     108:	5b                   	pop    %ebx
     109:	5e                   	pop    %esi
     10a:	5f                   	pop    %edi
     10b:	5d                   	pop    %ebp
     10c:	c3                   	ret    

0000010d <sys_chdir>:
     10d:	53                   	push   %ebx
     10e:	83 ec 14             	sub    $0x14,%esp
     111:	ff 74 24 1c          	pushl  0x1c(%esp)
     115:	e8 fc ff ff ff       	call   116 <sys_chdir+0x9>
     11a:	83 c4 10             	add    $0x10,%esp
     11d:	85 c0                	test   %eax,%eax
     11f:	74 4a                	je     16b <sys_chdir+0x5e>
     121:	89 c3                	mov    %eax,%ebx
     123:	8b 00                	mov    (%eax),%eax
     125:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     12a:	66 3d 00 40          	cmp    $0x4000,%ax
     12e:	74 13                	je     143 <sys_chdir+0x36>
     130:	83 ec 0c             	sub    $0xc,%esp
     133:	53                   	push   %ebx
     134:	e8 fc ff ff ff       	call   135 <sys_chdir+0x28>
     139:	83 c4 10             	add    $0x10,%esp
     13c:	b8 ec ff ff ff       	mov    $0xffffffec,%eax
     141:	eb 2d                	jmp    170 <sys_chdir+0x63>
     143:	83 ec 0c             	sub    $0xc,%esp
     146:	a1 00 00 00 00       	mov    0x0,%eax
     14b:	ff b0 70 02 00 00    	pushl  0x270(%eax)
     151:	e8 fc ff ff ff       	call   152 <sys_chdir+0x45>
     156:	a1 00 00 00 00       	mov    0x0,%eax
     15b:	89 98 70 02 00 00    	mov    %ebx,0x270(%eax)
     161:	83 c4 10             	add    $0x10,%esp
     164:	b8 00 00 00 00       	mov    $0x0,%eax
     169:	eb 05                	jmp    170 <sys_chdir+0x63>
     16b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
     170:	83 c4 08             	add    $0x8,%esp
     173:	5b                   	pop    %ebx
     174:	c3                   	ret    

00000175 <sys_chroot>:
     175:	53                   	push   %ebx
     176:	83 ec 14             	sub    $0x14,%esp
     179:	ff 74 24 1c          	pushl  0x1c(%esp)
     17d:	e8 fc ff ff ff       	call   17e <sys_chroot+0x9>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	74 4a                	je     1d3 <sys_chroot+0x5e>
     189:	89 c3                	mov    %eax,%ebx
     18b:	8b 00                	mov    (%eax),%eax
     18d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     192:	66 3d 00 40          	cmp    $0x4000,%ax
     196:	74 13                	je     1ab <sys_chroot+0x36>
     198:	83 ec 0c             	sub    $0xc,%esp
     19b:	53                   	push   %ebx
     19c:	e8 fc ff ff ff       	call   19d <sys_chroot+0x28>
     1a1:	83 c4 10             	add    $0x10,%esp
     1a4:	b8 ec ff ff ff       	mov    $0xffffffec,%eax
     1a9:	eb 2d                	jmp    1d8 <sys_chroot+0x63>
     1ab:	83 ec 0c             	sub    $0xc,%esp
     1ae:	a1 00 00 00 00       	mov    0x0,%eax
     1b3:	ff b0 74 02 00 00    	pushl  0x274(%eax)
     1b9:	e8 fc ff ff ff       	call   1ba <sys_chroot+0x45>
     1be:	a1 00 00 00 00       	mov    0x0,%eax
     1c3:	89 98 74 02 00 00    	mov    %ebx,0x274(%eax)
     1c9:	83 c4 10             	add    $0x10,%esp
     1cc:	b8 00 00 00 00       	mov    $0x0,%eax
     1d1:	eb 05                	jmp    1d8 <sys_chroot+0x63>
     1d3:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
     1d8:	83 c4 08             	add    $0x8,%esp
     1db:	5b                   	pop    %ebx
     1dc:	c3                   	ret    

000001dd <sys_chmod>:
     1dd:	83 ec 18             	sub    $0x18,%esp
     1e0:	ff 74 24 1c          	pushl  0x1c(%esp)
     1e4:	e8 fc ff ff ff       	call   1e5 <sys_chmod+0x8>
     1e9:	83 c4 10             	add    $0x10,%esp
     1ec:	85 c0                	test   %eax,%eax
     1ee:	74 59                	je     249 <sys_chmod+0x6c>
     1f0:	8b 15 00 00 00 00    	mov    0x0,%edx
     1f6:	66 8b 92 42 02 00 00 	mov    0x242(%edx),%dx
     1fd:	66 3b 50 02          	cmp    0x2(%eax),%dx
     201:	74 18                	je     21b <sys_chmod+0x3e>
     203:	66 85 d2             	test   %dx,%dx
     206:	74 13                	je     21b <sys_chmod+0x3e>
     208:	83 ec 0c             	sub    $0xc,%esp
     20b:	50                   	push   %eax
     20c:	e8 fc ff ff ff       	call   20d <sys_chmod+0x30>
     211:	83 c4 10             	add    $0x10,%esp
     214:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
     219:	eb 33                	jmp    24e <sys_chmod+0x71>
     21b:	8b 08                	mov    (%eax),%ecx
     21d:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
     223:	8b 54 24 14          	mov    0x14(%esp),%edx
     227:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
     22d:	09 ca                	or     %ecx,%edx
     22f:	66 89 10             	mov    %dx,(%eax)
     232:	c6 40 33 01          	movb   $0x1,0x33(%eax)
     236:	83 ec 0c             	sub    $0xc,%esp
     239:	50                   	push   %eax
     23a:	e8 fc ff ff ff       	call   23b <sys_chmod+0x5e>
     23f:	83 c4 10             	add    $0x10,%esp
     242:	b8 00 00 00 00       	mov    $0x0,%eax
     247:	eb 05                	jmp    24e <sys_chmod+0x71>
     249:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
     24e:	83 c4 0c             	add    $0xc,%esp
     251:	c3                   	ret    

00000252 <sys_chown>:
     252:	83 ec 18             	sub    $0x18,%esp
     255:	ff 74 24 1c          	pushl  0x1c(%esp)
     259:	e8 fc ff ff ff       	call   25a <sys_chown+0x8>
     25e:	83 c4 10             	add    $0x10,%esp
     261:	85 c0                	test   %eax,%eax
     263:	74 49                	je     2ae <sys_chown+0x5c>
     265:	8b 15 00 00 00 00    	mov    0x0,%edx
     26b:	66 83 ba 42 02 00 00 	cmpw   $0x0,0x242(%edx)
     272:	00 
     273:	74 13                	je     288 <sys_chown+0x36>
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	50                   	push   %eax
     279:	e8 fc ff ff ff       	call   27a <sys_chown+0x28>
     27e:	83 c4 10             	add    $0x10,%esp
     281:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
     286:	eb 2b                	jmp    2b3 <sys_chown+0x61>
     288:	8b 54 24 14          	mov    0x14(%esp),%edx
     28c:	66 89 50 02          	mov    %dx,0x2(%eax)
     290:	8b 54 24 18          	mov    0x18(%esp),%edx
     294:	88 50 0c             	mov    %dl,0xc(%eax)
     297:	c6 40 33 01          	movb   $0x1,0x33(%eax)
     29b:	83 ec 0c             	sub    $0xc,%esp
     29e:	50                   	push   %eax
     29f:	e8 fc ff ff ff       	call   2a0 <sys_chown+0x4e>
     2a4:	83 c4 10             	add    $0x10,%esp
     2a7:	b8 00 00 00 00       	mov    $0x0,%eax
     2ac:	eb 05                	jmp    2b3 <sys_chown+0x61>
     2ae:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
     2b3:	83 c4 0c             	add    $0xc,%esp
     2b6:	c3                   	ret    

000002b7 <sys_open>:
     2b7:	55                   	push   %ebp
     2b8:	57                   	push   %edi
     2b9:	56                   	push   %esi
     2ba:	53                   	push   %ebx
     2bb:	83 ec 1c             	sub    $0x1c,%esp
     2be:	8b 7c 24 34          	mov    0x34(%esp),%edi
     2c2:	a1 00 00 00 00       	mov    0x0,%eax
     2c7:	0f b7 90 6c 02 00 00 	movzwl 0x26c(%eax),%edx
     2ce:	f7 d2                	not    %edx
     2d0:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
     2d6:	23 54 24 38          	and    0x38(%esp),%edx
     2da:	83 b8 80 02 00 00 00 	cmpl   $0x0,0x280(%eax)
     2e1:	0f 84 41 01 00 00    	je     428 <sys_open+0x171>
     2e7:	be 01 00 00 00       	mov    $0x1,%esi
     2ec:	83 bc b0 80 02 00 00 	cmpl   $0x0,0x280(%eax,%esi,4)
     2f3:	00 
     2f4:	0f 84 33 01 00 00    	je     42d <sys_open+0x176>
     2fa:	46                   	inc    %esi
     2fb:	83 fe 14             	cmp    $0x14,%esi
     2fe:	75 ec                	jne    2ec <sys_open+0x35>
     300:	e9 4b 01 00 00       	jmp    450 <sys_open+0x199>
     305:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
     30a:	0f 84 77 01 00 00    	je     487 <sys_open+0x1d0>
     310:	83 c3 10             	add    $0x10,%ebx
     313:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
     319:	75 ea                	jne    305 <sys_open+0x4e>
     31b:	e9 49 01 00 00       	jmp    469 <sys_open+0x1b2>
     320:	8b 15 00 00 00 00    	mov    0x0,%edx
     326:	c7 84 b2 80 02 00 00 	movl   $0x0,0x280(%edx,%esi,4)
     32d:	00 00 00 00 
     331:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
     337:	e9 76 01 00 00       	jmp    4b2 <sys_open+0x1fb>
     33c:	8b 54 24 0c          	mov    0xc(%esp),%edx
     340:	8b 02                	mov    (%edx),%eax
     342:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     347:	66 3d 00 20          	cmp    $0x2000,%ax
     34b:	0f 85 96 00 00 00    	jne    3e7 <sys_open+0x130>
     351:	66 8b 4a 0e          	mov    0xe(%edx),%cx
     355:	89 c8                	mov    %ecx,%eax
     357:	66 c1 e8 08          	shr    $0x8,%ax
     35b:	66 83 f8 04          	cmp    $0x4,%ax
     35f:	75 46                	jne    3a7 <sys_open+0xf0>
     361:	a1 00 00 00 00       	mov    0x0,%eax
     366:	83 b8 3c 02 00 00 00 	cmpl   $0x0,0x23c(%eax)
     36d:	0f 84 91 00 00 00    	je     404 <sys_open+0x14d>
     373:	83 b8 68 02 00 00 00 	cmpl   $0x0,0x268(%eax)
     37a:	0f 89 84 00 00 00    	jns    404 <sys_open+0x14d>
     380:	0f b6 c9             	movzbl %cl,%ecx
     383:	89 88 68 02 00 00    	mov    %ecx,0x268(%eax)
     389:	8b a8 34 02 00 00    	mov    0x234(%eax),%ebp
     38f:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
     392:	01 c1                	add    %eax,%ecx
     394:	89 c8                	mov    %ecx,%eax
     396:	c1 e0 05             	shl    $0x5,%eax
     399:	89 c1                	mov    %eax,%ecx
     39b:	c1 e1 05             	shl    $0x5,%ecx
     39e:	89 ac 08 24 00 00 00 	mov    %ebp,0x24(%eax,%ecx,1)
     3a5:	eb 40                	jmp    3e7 <sys_open+0x130>
     3a7:	66 83 f8 05          	cmp    $0x5,%ax
     3ab:	75 57                	jne    404 <sys_open+0x14d>
     3ad:	a1 00 00 00 00       	mov    0x0,%eax
     3b2:	83 b8 68 02 00 00 00 	cmpl   $0x0,0x268(%eax)
     3b9:	79 49                	jns    404 <sys_open+0x14d>
     3bb:	83 ec 0c             	sub    $0xc,%esp
     3be:	52                   	push   %edx
     3bf:	e8 fc ff ff ff       	call   3c0 <sys_open+0x109>
     3c4:	a1 00 00 00 00       	mov    0x0,%eax
     3c9:	c7 84 b0 80 02 00 00 	movl   $0x0,0x280(%eax,%esi,4)
     3d0:	00 00 00 00 
     3d4:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
     3da:	83 c4 10             	add    $0x10,%esp
     3dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     3e2:	e9 cb 00 00 00       	jmp    4b2 <sys_open+0x1fb>
     3e7:	8b 02                	mov    (%edx),%eax
     3e9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     3ee:	66 3d 00 60          	cmp    $0x6000,%ax
     3f2:	75 10                	jne    404 <sys_open+0x14d>
     3f4:	83 ec 0c             	sub    $0xc,%esp
     3f7:	0f b7 42 0e          	movzwl 0xe(%edx),%eax
     3fb:	50                   	push   %eax
     3fc:	e8 fc ff ff ff       	call   3fd <sys_open+0x146>
     401:	83 c4 10             	add    $0x10,%esp
     404:	8b 44 24 0c          	mov    0xc(%esp),%eax
     408:	8b 10                	mov    (%eax),%edx
     40a:	66 89 13             	mov    %dx,(%ebx)
     40d:	66 89 7b 02          	mov    %di,0x2(%ebx)
     411:	66 c7 43 04 01 00    	movw   $0x1,0x4(%ebx)
     417:	89 43 08             	mov    %eax,0x8(%ebx)
     41a:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
     421:	89 f0                	mov    %esi,%eax
     423:	e9 8a 00 00 00       	jmp    4b2 <sys_open+0x1fb>
     428:	be 00 00 00 00       	mov    $0x0,%esi
     42d:	bb fe ff ff ff       	mov    $0xfffffffe,%ebx
     432:	89 f1                	mov    %esi,%ecx
     434:	d3 c3                	rol    %cl,%ebx
     436:	21 98 7c 02 00 00    	and    %ebx,0x27c(%eax)
     43c:	66 83 3d 04 00 00 00 	cmpw   $0x0,0x4
     443:	00 
     444:	74 3c                	je     482 <sys_open+0x1cb>
     446:	bb 10 00 00 00       	mov    $0x10,%ebx
     44b:	e9 b5 fe ff ff       	jmp    305 <sys_open+0x4e>
     450:	83 ec 08             	sub    $0x8,%esp
     453:	6a 16                	push   $0x16
     455:	68 00 00 00 00       	push   $0x0
     45a:	e8 fc ff ff ff       	call   45b <sys_open+0x1a4>
     45f:	83 c4 10             	add    $0x10,%esp
     462:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     467:	eb 49                	jmp    4b2 <sys_open+0x1fb>
     469:	83 ec 08             	sub    $0x8,%esp
     46c:	6a 16                	push   $0x16
     46e:	68 10 00 00 00       	push   $0x10
     473:	e8 fc ff ff ff       	call   474 <sys_open+0x1bd>
     478:	83 c4 10             	add    $0x10,%esp
     47b:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     480:	eb 30                	jmp    4b2 <sys_open+0x1fb>
     482:	bb 00 00 00 00       	mov    $0x0,%ebx
     487:	89 9c b0 80 02 00 00 	mov    %ebx,0x280(%eax,%esi,4)
     48e:	66 ff 43 04          	incw   0x4(%ebx)
     492:	8d 44 24 0c          	lea    0xc(%esp),%eax
     496:	50                   	push   %eax
     497:	52                   	push   %edx
     498:	57                   	push   %edi
     499:	ff 74 24 3c          	pushl  0x3c(%esp)
     49d:	e8 fc ff ff ff       	call   49e <sys_open+0x1e7>
     4a2:	83 c4 10             	add    $0x10,%esp
     4a5:	85 c0                	test   %eax,%eax
     4a7:	0f 89 8f fe ff ff    	jns    33c <sys_open+0x85>
     4ad:	e9 6e fe ff ff       	jmp    320 <sys_open+0x69>
     4b2:	83 c4 1c             	add    $0x1c,%esp
     4b5:	5b                   	pop    %ebx
     4b6:	5e                   	pop    %esi
     4b7:	5f                   	pop    %edi
     4b8:	5d                   	pop    %ebp
     4b9:	c3                   	ret    

000004ba <sys_creat>:
     4ba:	83 ec 10             	sub    $0x10,%esp
     4bd:	ff 74 24 18          	pushl  0x18(%esp)
     4c1:	68 40 02 00 00       	push   $0x240
     4c6:	ff 74 24 1c          	pushl  0x1c(%esp)
     4ca:	e8 fc ff ff ff       	call   4cb <sys_creat+0x11>
     4cf:	83 c4 1c             	add    $0x1c,%esp
     4d2:	c3                   	ret    

000004d3 <sys_close>:
     4d3:	53                   	push   %ebx
     4d4:	83 ec 08             	sub    $0x8,%esp
     4d7:	8b 4c 24 10          	mov    0x10(%esp),%ecx
     4db:	83 f9 13             	cmp    $0x13,%ecx
     4de:	77 62                	ja     542 <sys_close+0x6f>
     4e0:	a1 00 00 00 00       	mov    0x0,%eax
     4e5:	ba fe ff ff ff       	mov    $0xfffffffe,%edx
     4ea:	d3 c2                	rol    %cl,%edx
     4ec:	21 90 7c 02 00 00    	and    %edx,0x27c(%eax)
     4f2:	8d 04 88             	lea    (%eax,%ecx,4),%eax
     4f5:	8b 98 80 02 00 00    	mov    0x280(%eax),%ebx
     4fb:	85 db                	test   %ebx,%ebx
     4fd:	74 4a                	je     549 <sys_close+0x76>
     4ff:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
     506:	00 00 00 
     509:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
     50e:	75 10                	jne    520 <sys_close+0x4d>
     510:	83 ec 0c             	sub    $0xc,%esp
     513:	68 20 00 00 00       	push   $0x20
     518:	e8 fc ff ff ff       	call   519 <sys_close+0x46>
     51d:	83 c4 10             	add    $0x10,%esp
     520:	8b 43 04             	mov    0x4(%ebx),%eax
     523:	48                   	dec    %eax
     524:	66 89 43 04          	mov    %ax,0x4(%ebx)
     528:	66 85 c0             	test   %ax,%ax
     52b:	75 23                	jne    550 <sys_close+0x7d>
     52d:	83 ec 0c             	sub    $0xc,%esp
     530:	ff 73 08             	pushl  0x8(%ebx)
     533:	e8 fc ff ff ff       	call   534 <sys_close+0x61>
     538:	83 c4 10             	add    $0x10,%esp
     53b:	b8 00 00 00 00       	mov    $0x0,%eax
     540:	eb 13                	jmp    555 <sys_close+0x82>
     542:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     547:	eb 0c                	jmp    555 <sys_close+0x82>
     549:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     54e:	eb 05                	jmp    555 <sys_close+0x82>
     550:	b8 00 00 00 00       	mov    $0x0,%eax
     555:	83 c4 08             	add    $0x8,%esp
     558:	5b                   	pop    %ebx
     559:	c3                   	ret    

0000055a <sys_lseek>:
     55a:	53                   	push   %ebx
     55b:	8b 44 24 08          	mov    0x8(%esp),%eax
     55f:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     563:	83 f8 13             	cmp    $0x13,%eax
     566:	77 66                	ja     5ce <sys_lseek+0x74>
     568:	8b 15 00 00 00 00    	mov    0x0,%edx
     56e:	8b 84 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%eax
     575:	85 c0                	test   %eax,%eax
     577:	74 5c                	je     5d5 <sys_lseek+0x7b>
     579:	8b 50 08             	mov    0x8(%eax),%edx
     57c:	85 d2                	test   %edx,%edx
     57e:	74 5c                	je     5dc <sys_lseek+0x82>
     580:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
     584:	49                   	dec    %ecx
     585:	66 83 f9 02          	cmp    $0x2,%cx
     589:	77 58                	ja     5e3 <sys_lseek+0x89>
     58b:	80 7a 34 00          	cmpb   $0x0,0x34(%edx)
     58f:	75 59                	jne    5ea <sys_lseek+0x90>
     591:	83 fb 01             	cmp    $0x1,%ebx
     594:	74 19                	je     5af <sys_lseek+0x55>
     596:	83 fb 02             	cmp    $0x2,%ebx
     599:	74 22                	je     5bd <sys_lseek+0x63>
     59b:	85 db                	test   %ebx,%ebx
     59d:	75 52                	jne    5f1 <sys_lseek+0x97>
     59f:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
     5a4:	78 52                	js     5f8 <sys_lseek+0x9e>
     5a6:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     5aa:	89 58 0c             	mov    %ebx,0xc(%eax)
     5ad:	eb 1a                	jmp    5c9 <sys_lseek+0x6f>
     5af:	8b 54 24 0c          	mov    0xc(%esp),%edx
     5b3:	03 50 0c             	add    0xc(%eax),%edx
     5b6:	78 47                	js     5ff <sys_lseek+0xa5>
     5b8:	89 50 0c             	mov    %edx,0xc(%eax)
     5bb:	eb 0c                	jmp    5c9 <sys_lseek+0x6f>
     5bd:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     5c1:	03 5a 04             	add    0x4(%edx),%ebx
     5c4:	78 40                	js     606 <sys_lseek+0xac>
     5c6:	89 58 0c             	mov    %ebx,0xc(%eax)
     5c9:	8b 40 0c             	mov    0xc(%eax),%eax
     5cc:	eb 3d                	jmp    60b <sys_lseek+0xb1>
     5ce:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     5d3:	eb 36                	jmp    60b <sys_lseek+0xb1>
     5d5:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     5da:	eb 2f                	jmp    60b <sys_lseek+0xb1>
     5dc:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     5e1:	eb 28                	jmp    60b <sys_lseek+0xb1>
     5e3:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     5e8:	eb 21                	jmp    60b <sys_lseek+0xb1>
     5ea:	b8 e3 ff ff ff       	mov    $0xffffffe3,%eax
     5ef:	eb 1a                	jmp    60b <sys_lseek+0xb1>
     5f1:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     5f6:	eb 13                	jmp    60b <sys_lseek+0xb1>
     5f8:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     5fd:	eb 0c                	jmp    60b <sys_lseek+0xb1>
     5ff:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     604:	eb 05                	jmp    60b <sys_lseek+0xb1>
     606:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     60b:	5b                   	pop    %ebx
     60c:	c3                   	ret    

0000060d <sys_read>:
     60d:	57                   	push   %edi
     60e:	56                   	push   %esi
     60f:	53                   	push   %ebx
     610:	8b 44 24 10          	mov    0x10(%esp),%eax
     614:	8b 5c 24 18          	mov    0x18(%esp),%ebx
     618:	83 f8 13             	cmp    $0x13,%eax
     61b:	0f 87 fc 00 00 00    	ja     71d <sys_read+0x110>
     621:	85 db                	test   %ebx,%ebx
     623:	0f 88 fb 00 00 00    	js     724 <sys_read+0x117>
     629:	8b 15 00 00 00 00    	mov    0x0,%edx
     62f:	8b b4 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%esi
     636:	85 f6                	test   %esi,%esi
     638:	0f 84 ed 00 00 00    	je     72b <sys_read+0x11e>
     63e:	85 db                	test   %ebx,%ebx
     640:	0f 84 ec 00 00 00    	je     732 <sys_read+0x125>
     646:	83 ec 08             	sub    $0x8,%esp
     649:	53                   	push   %ebx
     64a:	ff 74 24 20          	pushl  0x20(%esp)
     64e:	e8 fc ff ff ff       	call   64f <sys_read+0x42>
     653:	8b 46 08             	mov    0x8(%esi),%eax
     656:	83 c4 10             	add    $0x10,%esp
     659:	80 78 34 00          	cmpb   $0x0,0x34(%eax)
     65d:	74 1f                	je     67e <sys_read+0x71>
     65f:	f6 06 01             	testb  $0x1,(%esi)
     662:	0f 84 d1 00 00 00    	je     739 <sys_read+0x12c>
     668:	83 ec 04             	sub    $0x4,%esp
     66b:	53                   	push   %ebx
     66c:	ff 74 24 1c          	pushl  0x1c(%esp)
     670:	50                   	push   %eax
     671:	e8 fc ff ff ff       	call   672 <sys_read+0x65>
     676:	83 c4 10             	add    $0x10,%esp
     679:	e9 c7 00 00 00       	jmp    745 <sys_read+0x138>
     67e:	8b 08                	mov    (%eax),%ecx
     680:	89 ca                	mov    %ecx,%edx
     682:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
     688:	66 81 fa 00 20       	cmp    $0x2000,%dx
     68d:	75 20                	jne    6af <sys_read+0xa2>
     68f:	83 ec 0c             	sub    $0xc,%esp
     692:	83 c6 0c             	add    $0xc,%esi
     695:	56                   	push   %esi
     696:	53                   	push   %ebx
     697:	ff 74 24 28          	pushl  0x28(%esp)
     69b:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
     69f:	50                   	push   %eax
     6a0:	6a 00                	push   $0x0
     6a2:	e8 fc ff ff ff       	call   6a3 <sys_read+0x96>
     6a7:	83 c4 20             	add    $0x20,%esp
     6aa:	e9 96 00 00 00       	jmp    745 <sys_read+0x138>
     6af:	66 81 fa 00 60       	cmp    $0x6000,%dx
     6b4:	75 18                	jne    6ce <sys_read+0xc1>
     6b6:	53                   	push   %ebx
     6b7:	ff 74 24 18          	pushl  0x18(%esp)
     6bb:	83 c6 0c             	add    $0xc,%esi
     6be:	56                   	push   %esi
     6bf:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
     6c3:	50                   	push   %eax
     6c4:	e8 fc ff ff ff       	call   6c5 <sys_read+0xb8>
     6c9:	83 c4 10             	add    $0x10,%esp
     6cc:	eb 77                	jmp    745 <sys_read+0x138>
     6ce:	66 81 fa 00 40       	cmp    $0x4000,%dx
     6d3:	74 07                	je     6dc <sys_read+0xcf>
     6d5:	66 81 fa 00 80       	cmp    $0x8000,%dx
     6da:	75 26                	jne    702 <sys_read+0xf5>
     6dc:	8b 56 0c             	mov    0xc(%esi),%edx
     6df:	8b 48 04             	mov    0x4(%eax),%ecx
     6e2:	8d 3c 13             	lea    (%ebx,%edx,1),%edi
     6e5:	39 cf                	cmp    %ecx,%edi
     6e7:	76 04                	jbe    6ed <sys_read+0xe0>
     6e9:	29 d1                	sub    %edx,%ecx
     6eb:	89 cb                	mov    %ecx,%ebx
     6ed:	85 db                	test   %ebx,%ebx
     6ef:	7e 4f                	jle    740 <sys_read+0x133>
     6f1:	53                   	push   %ebx
     6f2:	ff 74 24 18          	pushl  0x18(%esp)
     6f6:	56                   	push   %esi
     6f7:	50                   	push   %eax
     6f8:	e8 fc ff ff ff       	call   6f9 <sys_read+0xec>
     6fd:	83 c4 10             	add    $0x10,%esp
     700:	eb 43                	jmp    745 <sys_read+0x138>
     702:	83 ec 08             	sub    $0x8,%esp
     705:	0f b7 c9             	movzwl %cx,%ecx
     708:	51                   	push   %ecx
     709:	68 37 00 00 00       	push   $0x37
     70e:	e8 fc ff ff ff       	call   70f <sys_read+0x102>
     713:	83 c4 10             	add    $0x10,%esp
     716:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     71b:	eb 28                	jmp    745 <sys_read+0x138>
     71d:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     722:	eb 21                	jmp    745 <sys_read+0x138>
     724:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     729:	eb 1a                	jmp    745 <sys_read+0x138>
     72b:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     730:	eb 13                	jmp    745 <sys_read+0x138>
     732:	b8 00 00 00 00       	mov    $0x0,%eax
     737:	eb 0c                	jmp    745 <sys_read+0x138>
     739:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
     73e:	eb 05                	jmp    745 <sys_read+0x138>
     740:	b8 00 00 00 00       	mov    $0x0,%eax
     745:	5b                   	pop    %ebx
     746:	5e                   	pop    %esi
     747:	5f                   	pop    %edi
     748:	c3                   	ret    

00000749 <sys_write>:
     749:	55                   	push   %ebp
     74a:	57                   	push   %edi
     74b:	56                   	push   %esi
     74c:	53                   	push   %ebx
     74d:	83 ec 0c             	sub    $0xc,%esp
     750:	8b 4c 24 20          	mov    0x20(%esp),%ecx
     754:	8b 44 24 28          	mov    0x28(%esp),%eax
     758:	83 f9 13             	cmp    $0x13,%ecx
     75b:	0f 87 dd 00 00 00    	ja     83e <sys_write+0xf5>
     761:	85 c0                	test   %eax,%eax
     763:	0f 88 dc 00 00 00    	js     845 <sys_write+0xfc>
     769:	8b 35 00 00 00 00    	mov    0x0,%esi
     76f:	8b 94 8e 80 02 00 00 	mov    0x280(%esi,%ecx,4),%edx
     776:	85 d2                	test   %edx,%edx
     778:	0f 84 ce 00 00 00    	je     84c <sys_write+0x103>
     77e:	85 c0                	test   %eax,%eax
     780:	0f 84 cd 00 00 00    	je     853 <sys_write+0x10a>
     786:	8b 5a 08             	mov    0x8(%edx),%ebx
     789:	80 7b 34 00          	cmpb   $0x0,0x34(%ebx)
     78d:	74 1f                	je     7ae <sys_write+0x65>
     78f:	f6 02 02             	testb  $0x2,(%edx)
     792:	0f 84 c2 00 00 00    	je     85a <sys_write+0x111>
     798:	83 ec 04             	sub    $0x4,%esp
     79b:	50                   	push   %eax
     79c:	ff 74 24 2c          	pushl  0x2c(%esp)
     7a0:	53                   	push   %ebx
     7a1:	e8 fc ff ff ff       	call   7a2 <sys_write+0x59>
     7a6:	83 c4 10             	add    $0x10,%esp
     7a9:	e9 b1 00 00 00       	jmp    85f <sys_write+0x116>
     7ae:	8b 2b                	mov    (%ebx),%ebp
     7b0:	89 ef                	mov    %ebp,%edi
     7b2:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
     7b8:	66 81 ff 00 20       	cmp    $0x2000,%di
     7bd:	75 20                	jne    7df <sys_write+0x96>
     7bf:	83 ec 0c             	sub    $0xc,%esp
     7c2:	83 c2 0c             	add    $0xc,%edx
     7c5:	52                   	push   %edx
     7c6:	50                   	push   %eax
     7c7:	ff 74 24 38          	pushl  0x38(%esp)
     7cb:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
     7cf:	50                   	push   %eax
     7d0:	6a 01                	push   $0x1
     7d2:	e8 fc ff ff ff       	call   7d3 <sys_write+0x8a>
     7d7:	83 c4 20             	add    $0x20,%esp
     7da:	e9 80 00 00 00       	jmp    85f <sys_write+0x116>
     7df:	66 81 ff 00 60       	cmp    $0x6000,%di
     7e4:	75 18                	jne    7fe <sys_write+0xb5>
     7e6:	50                   	push   %eax
     7e7:	ff 74 24 28          	pushl  0x28(%esp)
     7eb:	83 c2 0c             	add    $0xc,%edx
     7ee:	52                   	push   %edx
     7ef:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
     7f3:	50                   	push   %eax
     7f4:	e8 fc ff ff ff       	call   7f5 <sys_write+0xac>
     7f9:	83 c4 10             	add    $0x10,%esp
     7fc:	eb 61                	jmp    85f <sys_write+0x116>
     7fe:	66 81 ff 00 80       	cmp    $0x8000,%di
     803:	75 11                	jne    816 <sys_write+0xcd>
     805:	50                   	push   %eax
     806:	ff 74 24 28          	pushl  0x28(%esp)
     80a:	52                   	push   %edx
     80b:	53                   	push   %ebx
     80c:	e8 fc ff ff ff       	call   80d <sys_write+0xc4>
     811:	83 c4 10             	add    $0x10,%esp
     814:	eb 49                	jmp    85f <sys_write+0x116>
     816:	83 ec 0c             	sub    $0xc,%esp
     819:	ff b6 2c 02 00 00    	pushl  0x22c(%esi)
     81f:	ff b6 68 02 00 00    	pushl  0x268(%esi)
     825:	51                   	push   %ecx
     826:	0f b7 ed             	movzwl %bp,%ebp
     829:	55                   	push   %ebp
     82a:	68 00 00 00 00       	push   $0x0
     82f:	e8 fc ff ff ff       	call   830 <sys_write+0xe7>
     834:	83 c4 20             	add    $0x20,%esp
     837:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     83c:	eb 21                	jmp    85f <sys_write+0x116>
     83e:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     843:	eb 1a                	jmp    85f <sys_write+0x116>
     845:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     84a:	eb 13                	jmp    85f <sys_write+0x116>
     84c:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     851:	eb 0c                	jmp    85f <sys_write+0x116>
     853:	b8 00 00 00 00       	mov    $0x0,%eax
     858:	eb 05                	jmp    85f <sys_write+0x116>
     85a:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
     85f:	83 c4 0c             	add    $0xc,%esp
     862:	5b                   	pop    %ebx
     863:	5e                   	pop    %esi
     864:	5f                   	pop    %edi
     865:	5d                   	pop    %ebp
     866:	c3                   	ret    

00000867 <write_inode>:
     867:	55                   	push   %ebp
     868:	57                   	push   %edi
     869:	56                   	push   %esi
     86a:	53                   	push   %ebx
     86b:	83 ec 0c             	sub    $0xc,%esp
     86e:	89 c3                	mov    %eax,%ebx
     870:	fa                   	cli    
     871:	80 78 32 00          	cmpb   $0x0,0x32(%eax)
     875:	74 15                	je     88c <write_inode+0x25>
     877:	8d 70 20             	lea    0x20(%eax),%esi
     87a:	83 ec 0c             	sub    $0xc,%esp
     87d:	56                   	push   %esi
     87e:	e8 fc ff ff ff       	call   87f <write_inode+0x18>
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     88a:	75 ee                	jne    87a <write_inode+0x13>
     88c:	c6 43 32 01          	movb   $0x1,0x32(%ebx)
     890:	fb                   	sti    
     891:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     895:	74 08                	je     89f <write_inode+0x38>
     897:	8b 43 2c             	mov    0x2c(%ebx),%eax
     89a:	66 85 c0             	test   %ax,%ax
     89d:	75 18                	jne    8b7 <write_inode+0x50>
     89f:	c6 43 32 00          	movb   $0x0,0x32(%ebx)
     8a3:	83 ec 0c             	sub    $0xc,%esp
     8a6:	83 c3 20             	add    $0x20,%ebx
     8a9:	53                   	push   %ebx
     8aa:	e8 fc ff ff ff       	call   8ab <write_inode+0x44>
     8af:	83 c4 10             	add    $0x10,%esp
     8b2:	e9 9e 00 00 00       	jmp    955 <write_inode+0xee>
     8b7:	83 ec 0c             	sub    $0xc,%esp
     8ba:	0f b7 c0             	movzwl %ax,%eax
     8bd:	50                   	push   %eax
     8be:	e8 fc ff ff ff       	call   8bf <write_inode+0x58>
     8c3:	89 c6                	mov    %eax,%esi
     8c5:	83 c4 10             	add    $0x10,%esp
     8c8:	85 c0                	test   %eax,%eax
     8ca:	75 10                	jne    8dc <write_inode+0x75>
     8cc:	83 ec 0c             	sub    $0xc,%esp
     8cf:	68 38 00 00 00       	push   $0x38
     8d4:	e8 fc ff ff ff       	call   8d5 <write_inode+0x6e>
     8d9:	83 c4 10             	add    $0x10,%esp
     8dc:	83 ec 08             	sub    $0x8,%esp
     8df:	0f b7 56 04          	movzwl 0x4(%esi),%edx
     8e3:	0f b7 46 06          	movzwl 0x6(%esi),%eax
     8e7:	8d 54 02 02          	lea    0x2(%edx,%eax,1),%edx
     8eb:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
     8ef:	48                   	dec    %eax
     8f0:	c1 e8 05             	shr    $0x5,%eax
     8f3:	01 d0                	add    %edx,%eax
     8f5:	50                   	push   %eax
     8f6:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     8fa:	50                   	push   %eax
     8fb:	e8 fc ff ff ff       	call   8fc <write_inode+0x95>
     900:	89 c5                	mov    %eax,%ebp
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	75 10                	jne    919 <write_inode+0xb2>
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 52 00 00 00       	push   $0x52
     911:	e8 fc ff ff ff       	call   912 <write_inode+0xab>
     916:	83 c4 10             	add    $0x10,%esp
     919:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
     91d:	48                   	dec    %eax
     91e:	83 e0 1f             	and    $0x1f,%eax
     921:	c1 e0 05             	shl    $0x5,%eax
     924:	03 45 00             	add    0x0(%ebp),%eax
     927:	b9 08 00 00 00       	mov    $0x8,%ecx
     92c:	89 c7                	mov    %eax,%edi
     92e:	89 de                	mov    %ebx,%esi
     930:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     932:	c6 45 0b 01          	movb   $0x1,0xb(%ebp)
     936:	c6 43 33 00          	movb   $0x0,0x33(%ebx)
     93a:	83 ec 0c             	sub    $0xc,%esp
     93d:	55                   	push   %ebp
     93e:	e8 fc ff ff ff       	call   93f <write_inode+0xd8>
     943:	c6 43 32 00          	movb   $0x0,0x32(%ebx)
     947:	83 c3 20             	add    $0x20,%ebx
     94a:	89 1c 24             	mov    %ebx,(%esp)
     94d:	e8 fc ff ff ff       	call   94e <write_inode+0xe7>
     952:	83 c4 10             	add    $0x10,%esp
     955:	83 c4 0c             	add    $0xc,%esp
     958:	5b                   	pop    %ebx
     959:	5e                   	pop    %esi
     95a:	5f                   	pop    %edi
     95b:	5d                   	pop    %ebp
     95c:	c3                   	ret    

0000095d <_bmap>:
     95d:	55                   	push   %ebp
     95e:	57                   	push   %edi
     95f:	56                   	push   %esi
     960:	53                   	push   %ebx
     961:	83 ec 1c             	sub    $0x1c,%esp
     964:	89 c3                	mov    %eax,%ebx
     966:	89 d5                	mov    %edx,%ebp
     968:	89 ce                	mov    %ecx,%esi
     96a:	85 d2                	test   %edx,%edx
     96c:	79 10                	jns    97e <_bmap+0x21>
     96e:	83 ec 0c             	sub    $0xc,%esp
     971:	68 6e 00 00 00       	push   $0x6e
     976:	e8 fc ff ff ff       	call   977 <_bmap+0x1a>
     97b:	83 c4 10             	add    $0x10,%esp
     97e:	81 fd 06 02 04 00    	cmp    $0x40206,%ebp
     984:	7e 10                	jle    996 <_bmap+0x39>
     986:	83 ec 0c             	sub    $0xc,%esp
     989:	68 7d 00 00 00       	push   $0x7d
     98e:	e8 fc ff ff ff       	call   98f <_bmap+0x32>
     993:	83 c4 10             	add    $0x10,%esp
     996:	83 fd 06             	cmp    $0x6,%ebp
     999:	7f 58                	jg     9f3 <_bmap+0x96>
     99b:	85 f6                	test   %esi,%esi
     99d:	74 4a                	je     9e9 <_bmap+0x8c>
     99f:	8d 74 2d 00          	lea    0x0(%ebp,%ebp,1),%esi
     9a3:	01 de                	add    %ebx,%esi
     9a5:	66 83 7e 0e 00       	cmpw   $0x0,0xe(%esi)
     9aa:	75 3d                	jne    9e9 <_bmap+0x8c>
     9ac:	83 ec 0c             	sub    $0xc,%esp
     9af:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     9b3:	50                   	push   %eax
     9b4:	e8 fc ff ff ff       	call   9b5 <_bmap+0x58>
     9b9:	66 89 46 0e          	mov    %ax,0xe(%esi)
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	66 85 c0             	test   %ax,%ax
     9c3:	74 24                	je     9e9 <_bmap+0x8c>
     9c5:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     9cb:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     9d0:	f7 e9                	imul   %ecx
     9d2:	89 d0                	mov    %edx,%eax
     9d4:	c1 f8 05             	sar    $0x5,%eax
     9d7:	c1 f9 1f             	sar    $0x1f,%ecx
     9da:	29 c8                	sub    %ecx,%eax
     9dc:	03 05 00 00 00 00    	add    0x0,%eax
     9e2:	89 43 28             	mov    %eax,0x28(%ebx)
     9e5:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
     9e9:	0f b7 44 6b 0e       	movzwl 0xe(%ebx,%ebp,2),%eax
     9ee:	e9 17 03 00 00       	jmp    d0a <_bmap+0x3ad>
     9f3:	8d 7d f9             	lea    -0x7(%ebp),%edi
     9f6:	81 ff ff 01 00 00    	cmp    $0x1ff,%edi
     9fc:	0f 8f 9a 00 00 00    	jg     a9c <_bmap+0x13f>
     a02:	85 f6                	test   %esi,%esi
     a04:	74 51                	je     a57 <_bmap+0xfa>
     a06:	66 83 7b 1c 00       	cmpw   $0x0,0x1c(%ebx)
     a0b:	0f 85 0b 02 00 00    	jne    c1c <_bmap+0x2bf>
     a11:	83 ec 0c             	sub    $0xc,%esp
     a14:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     a18:	50                   	push   %eax
     a19:	e8 fc ff ff ff       	call   a1a <_bmap+0xbd>
     a1e:	66 89 43 1c          	mov    %ax,0x1c(%ebx)
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	66 85 c0             	test   %ax,%ax
     a28:	0f 84 8a 01 00 00    	je     bb8 <_bmap+0x25b>
     a2e:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
     a32:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     a38:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     a3d:	f7 e9                	imul   %ecx
     a3f:	89 d0                	mov    %edx,%eax
     a41:	c1 f8 05             	sar    $0x5,%eax
     a44:	c1 f9 1f             	sar    $0x1f,%ecx
     a47:	29 c8                	sub    %ecx,%eax
     a49:	03 05 00 00 00 00    	add    0x0,%eax
     a4f:	89 43 28             	mov    %eax,0x28(%ebx)
     a52:	e9 c5 01 00 00       	jmp    c1c <_bmap+0x2bf>
     a57:	8b 43 1c             	mov    0x1c(%ebx),%eax
     a5a:	66 85 c0             	test   %ax,%ax
     a5d:	0f 84 5f 01 00 00    	je     bc2 <_bmap+0x265>
     a63:	e9 1e 02 00 00       	jmp    c86 <_bmap+0x329>
     a68:	83 ec 0c             	sub    $0xc,%esp
     a6b:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     a6f:	50                   	push   %eax
     a70:	e8 fc ff ff ff       	call   a71 <_bmap+0x114>
     a75:	89 c6                	mov    %eax,%esi
     a77:	83 c4 10             	add    $0x10,%esp
     a7a:	85 c0                	test   %eax,%eax
     a7c:	74 0b                	je     a89 <_bmap+0x12c>
     a7e:	8b 45 00             	mov    0x0(%ebp),%eax
     a81:	66 89 34 38          	mov    %si,(%eax,%edi,1)
     a85:	c6 45 0b 01          	movb   $0x1,0xb(%ebp)
     a89:	83 ec 0c             	sub    $0xc,%esp
     a8c:	55                   	push   %ebp
     a8d:	e8 fc ff ff ff       	call   a8e <_bmap+0x131>
     a92:	83 c4 10             	add    $0x10,%esp
     a95:	89 f0                	mov    %esi,%eax
     a97:	e9 6e 02 00 00       	jmp    d0a <_bmap+0x3ad>
     a9c:	85 f6                	test   %esi,%esi
     a9e:	74 51                	je     af1 <_bmap+0x194>
     aa0:	66 83 7b 1e 00       	cmpw   $0x0,0x1e(%ebx)
     aa5:	0f 85 8e 01 00 00    	jne    c39 <_bmap+0x2dc>
     aab:	83 ec 0c             	sub    $0xc,%esp
     aae:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     ab2:	50                   	push   %eax
     ab3:	e8 fc ff ff ff       	call   ab4 <_bmap+0x157>
     ab8:	66 89 43 1e          	mov    %ax,0x1e(%ebx)
     abc:	83 c4 10             	add    $0x10,%esp
     abf:	66 85 c0             	test   %ax,%ax
     ac2:	0f 84 04 01 00 00    	je     bcc <_bmap+0x26f>
     ac8:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
     acc:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     ad2:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     ad7:	f7 e9                	imul   %ecx
     ad9:	89 d0                	mov    %edx,%eax
     adb:	c1 f8 05             	sar    $0x5,%eax
     ade:	c1 f9 1f             	sar    $0x1f,%ecx
     ae1:	29 c8                	sub    %ecx,%eax
     ae3:	03 05 00 00 00 00    	add    0x0,%eax
     ae9:	89 43 28             	mov    %eax,0x28(%ebx)
     aec:	e9 48 01 00 00       	jmp    c39 <_bmap+0x2dc>
     af1:	66 8b 43 1e          	mov    0x1e(%ebx),%ax
     af5:	66 85 c0             	test   %ax,%ax
     af8:	0f 84 d8 00 00 00    	je     bd6 <_bmap+0x279>
     afe:	83 ec 08             	sub    $0x8,%esp
     b01:	0f b7 c0             	movzwl %ax,%eax
     b04:	50                   	push   %eax
     b05:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     b09:	50                   	push   %eax
     b0a:	e8 fc ff ff ff       	call   b0b <_bmap+0x1ae>
     b0f:	89 c7                	mov    %eax,%edi
     b11:	83 c4 10             	add    $0x10,%esp
     b14:	85 c0                	test   %eax,%eax
     b16:	0f 84 c4 00 00 00    	je     be0 <_bmap+0x283>
     b1c:	8d 85 f9 fd ff ff    	lea    -0x207(%ebp),%eax
     b22:	89 44 24 08          	mov    %eax,0x8(%esp)
     b26:	c1 f8 09             	sar    $0x9,%eax
     b29:	01 c0                	add    %eax,%eax
     b2b:	89 c2                	mov    %eax,%edx
     b2d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b31:	8b 07                	mov    (%edi),%eax
     b33:	0f b7 2c 10          	movzwl (%eax,%edx,1),%ebp
     b37:	85 f6                	test   %esi,%esi
     b39:	74 35                	je     b70 <_bmap+0x213>
     b3b:	85 ed                	test   %ebp,%ebp
     b3d:	0f 85 ff 00 00 00    	jne    c42 <_bmap+0x2e5>
     b43:	83 ec 0c             	sub    $0xc,%esp
     b46:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     b4a:	50                   	push   %eax
     b4b:	e8 fc ff ff ff       	call   b4c <_bmap+0x1ef>
     b50:	89 c5                	mov    %eax,%ebp
     b52:	83 c4 10             	add    $0x10,%esp
     b55:	85 c0                	test   %eax,%eax
     b57:	0f 84 07 01 00 00    	je     c64 <_bmap+0x307>
     b5d:	8b 07                	mov    (%edi),%eax
     b5f:	8b 54 24 0c          	mov    0xc(%esp),%edx
     b63:	66 89 2c 10          	mov    %bp,(%eax,%edx,1)
     b67:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
     b6b:	e9 d2 00 00 00       	jmp    c42 <_bmap+0x2e5>
     b70:	83 ec 0c             	sub    $0xc,%esp
     b73:	57                   	push   %edi
     b74:	e8 fc ff ff ff       	call   b75 <_bmap+0x218>
     b79:	83 c4 10             	add    $0x10,%esp
     b7c:	85 ed                	test   %ebp,%ebp
     b7e:	74 6a                	je     bea <_bmap+0x28d>
     b80:	e9 69 01 00 00       	jmp    cee <_bmap+0x391>
     b85:	83 ec 0c             	sub    $0xc,%esp
     b88:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     b8c:	50                   	push   %eax
     b8d:	e8 fc ff ff ff       	call   b8e <_bmap+0x231>
     b92:	89 c6                	mov    %eax,%esi
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	85 c0                	test   %eax,%eax
     b99:	74 0a                	je     ba5 <_bmap+0x248>
     b9b:	8b 07                	mov    (%edi),%eax
     b9d:	66 89 34 28          	mov    %si,(%eax,%ebp,1)
     ba1:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
     ba5:	83 ec 0c             	sub    $0xc,%esp
     ba8:	57                   	push   %edi
     ba9:	e8 fc ff ff ff       	call   baa <_bmap+0x24d>
     bae:	83 c4 10             	add    $0x10,%esp
     bb1:	89 f0                	mov    %esi,%eax
     bb3:	e9 52 01 00 00       	jmp    d0a <_bmap+0x3ad>
     bb8:	b8 00 00 00 00       	mov    $0x0,%eax
     bbd:	e9 48 01 00 00       	jmp    d0a <_bmap+0x3ad>
     bc2:	b8 00 00 00 00       	mov    $0x0,%eax
     bc7:	e9 3e 01 00 00       	jmp    d0a <_bmap+0x3ad>
     bcc:	b8 00 00 00 00       	mov    $0x0,%eax
     bd1:	e9 34 01 00 00       	jmp    d0a <_bmap+0x3ad>
     bd6:	b8 00 00 00 00       	mov    $0x0,%eax
     bdb:	e9 2a 01 00 00       	jmp    d0a <_bmap+0x3ad>
     be0:	b8 00 00 00 00       	mov    $0x0,%eax
     be5:	e9 20 01 00 00       	jmp    d0a <_bmap+0x3ad>
     bea:	b8 00 00 00 00       	mov    $0x0,%eax
     bef:	e9 16 01 00 00       	jmp    d0a <_bmap+0x3ad>
     bf4:	b8 00 00 00 00       	mov    $0x0,%eax
     bf9:	e9 0c 01 00 00       	jmp    d0a <_bmap+0x3ad>
     bfe:	b8 00 00 00 00       	mov    $0x0,%eax
     c03:	e9 02 01 00 00       	jmp    d0a <_bmap+0x3ad>
     c08:	b8 00 00 00 00       	mov    $0x0,%eax
     c0d:	e9 f8 00 00 00       	jmp    d0a <_bmap+0x3ad>
     c12:	b8 00 00 00 00       	mov    $0x0,%eax
     c17:	e9 ee 00 00 00       	jmp    d0a <_bmap+0x3ad>
     c1c:	83 ec 08             	sub    $0x8,%esp
     c1f:	0f b7 43 1c          	movzwl 0x1c(%ebx),%eax
     c23:	50                   	push   %eax
     c24:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     c28:	50                   	push   %eax
     c29:	e8 fc ff ff ff       	call   c2a <_bmap+0x2cd>
     c2e:	89 c5                	mov    %eax,%ebp
     c30:	83 c4 10             	add    $0x10,%esp
     c33:	85 c0                	test   %eax,%eax
     c35:	75 6e                	jne    ca5 <_bmap+0x348>
     c37:	eb bb                	jmp    bf4 <_bmap+0x297>
     c39:	66 8b 43 1e          	mov    0x1e(%ebx),%ax
     c3d:	e9 bc fe ff ff       	jmp    afe <_bmap+0x1a1>
     c42:	83 ec 0c             	sub    $0xc,%esp
     c45:	57                   	push   %edi
     c46:	e8 fc ff ff ff       	call   c47 <_bmap+0x2ea>
     c4b:	83 c4 08             	add    $0x8,%esp
     c4e:	55                   	push   %ebp
     c4f:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     c53:	50                   	push   %eax
     c54:	e8 fc ff ff ff       	call   c55 <_bmap+0x2f8>
     c59:	89 c7                	mov    %eax,%edi
     c5b:	83 c4 10             	add    $0x10,%esp
     c5e:	85 c0                	test   %eax,%eax
     c60:	74 9c                	je     bfe <_bmap+0x2a1>
     c62:	eb 56                	jmp    cba <_bmap+0x35d>
     c64:	83 ec 0c             	sub    $0xc,%esp
     c67:	57                   	push   %edi
     c68:	e8 fc ff ff ff       	call   c69 <_bmap+0x30c>
     c6d:	83 c4 10             	add    $0x10,%esp
     c70:	b8 00 00 00 00       	mov    $0x0,%eax
     c75:	e9 90 00 00 00       	jmp    d0a <_bmap+0x3ad>
     c7a:	8b 45 00             	mov    0x0(%ebp),%eax
     c7d:	0f b7 34 78          	movzwl (%eax,%edi,2),%esi
     c81:	e9 03 fe ff ff       	jmp    a89 <_bmap+0x12c>
     c86:	83 ec 08             	sub    $0x8,%esp
     c89:	0f b7 c0             	movzwl %ax,%eax
     c8c:	50                   	push   %eax
     c8d:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     c91:	50                   	push   %eax
     c92:	e8 fc ff ff ff       	call   c93 <_bmap+0x336>
     c97:	89 c5                	mov    %eax,%ebp
     c99:	83 c4 10             	add    $0x10,%esp
     c9c:	85 c0                	test   %eax,%eax
     c9e:	75 da                	jne    c7a <_bmap+0x31d>
     ca0:	e9 63 ff ff ff       	jmp    c08 <_bmap+0x2ab>
     ca5:	01 ff                	add    %edi,%edi
     ca7:	8b 00                	mov    (%eax),%eax
     ca9:	0f b7 34 38          	movzwl (%eax,%edi,1),%esi
     cad:	85 f6                	test   %esi,%esi
     caf:	0f 85 d4 fd ff ff    	jne    a89 <_bmap+0x12c>
     cb5:	e9 ae fd ff ff       	jmp    a68 <_bmap+0x10b>
     cba:	8b 44 24 08          	mov    0x8(%esp),%eax
     cbe:	25 ff 01 00 00       	and    $0x1ff,%eax
     cc3:	8d 2c 00             	lea    (%eax,%eax,1),%ebp
     cc6:	8b 07                	mov    (%edi),%eax
     cc8:	0f b7 34 28          	movzwl (%eax,%ebp,1),%esi
     ccc:	85 f6                	test   %esi,%esi
     cce:	0f 85 d1 fe ff ff    	jne    ba5 <_bmap+0x248>
     cd4:	e9 ac fe ff ff       	jmp    b85 <_bmap+0x228>
     cd9:	8b 54 24 08          	mov    0x8(%esp),%edx
     cdd:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
     ce3:	8b 07                	mov    (%edi),%eax
     ce5:	0f b7 34 50          	movzwl (%eax,%edx,2),%esi
     ce9:	e9 b7 fe ff ff       	jmp    ba5 <_bmap+0x248>
     cee:	83 ec 08             	sub    $0x8,%esp
     cf1:	55                   	push   %ebp
     cf2:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     cf6:	50                   	push   %eax
     cf7:	e8 fc ff ff ff       	call   cf8 <_bmap+0x39b>
     cfc:	89 c7                	mov    %eax,%edi
     cfe:	83 c4 10             	add    $0x10,%esp
     d01:	85 c0                	test   %eax,%eax
     d03:	75 d4                	jne    cd9 <_bmap+0x37c>
     d05:	e9 08 ff ff ff       	jmp    c12 <_bmap+0x2b5>
     d0a:	83 c4 1c             	add    $0x1c,%esp
     d0d:	5b                   	pop    %ebx
     d0e:	5e                   	pop    %esi
     d0f:	5f                   	pop    %edi
     d10:	5d                   	pop    %ebp
     d11:	c3                   	ret    

00000d12 <invalidate_inodes>:
     d12:	55                   	push   %ebp
     d13:	57                   	push   %edi
     d14:	56                   	push   %esi
     d15:	53                   	push   %ebx
     d16:	83 ec 0c             	sub    $0xc,%esp
     d19:	8b 6c 24 20          	mov    0x20(%esp),%ebp
     d1d:	be 20 00 00 00       	mov    $0x20,%esi
     d22:	bf 20 07 00 00       	mov    $0x720,%edi
     d27:	fa                   	cli    
     d28:	89 f3                	mov    %esi,%ebx
     d2a:	80 7e 12 00          	cmpb   $0x0,0x12(%esi)
     d2e:	74 12                	je     d42 <invalidate_inodes+0x30>
     d30:	83 ec 0c             	sub    $0xc,%esp
     d33:	53                   	push   %ebx
     d34:	e8 fc ff ff ff       	call   d35 <invalidate_inodes+0x23>
     d39:	83 c4 10             	add    $0x10,%esp
     d3c:	80 7b 12 00          	cmpb   $0x0,0x12(%ebx)
     d40:	75 ee                	jne    d30 <invalidate_inodes+0x1e>
     d42:	fb                   	sti    
     d43:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
     d47:	39 e8                	cmp    %ebp,%eax
     d49:	75 21                	jne    d6c <invalidate_inodes+0x5a>
     d4b:	66 83 7b 10 00       	cmpw   $0x0,0x10(%ebx)
     d50:	74 10                	je     d62 <invalidate_inodes+0x50>
     d52:	83 ec 0c             	sub    $0xc,%esp
     d55:	68 60 00 00 00       	push   $0x60
     d5a:	e8 fc ff ff ff       	call   d5b <invalidate_inodes+0x49>
     d5f:	83 c4 10             	add    $0x10,%esp
     d62:	c6 43 13 00          	movb   $0x0,0x13(%ebx)
     d66:	66 c7 43 0c 00 00    	movw   $0x0,0xc(%ebx)
     d6c:	83 c6 38             	add    $0x38,%esi
     d6f:	39 fe                	cmp    %edi,%esi
     d71:	75 b4                	jne    d27 <invalidate_inodes+0x15>
     d73:	83 c4 0c             	add    $0xc,%esp
     d76:	5b                   	pop    %ebx
     d77:	5e                   	pop    %esi
     d78:	5f                   	pop    %edi
     d79:	5d                   	pop    %ebp
     d7a:	c3                   	ret    

00000d7b <sync_inodes>:
     d7b:	56                   	push   %esi
     d7c:	53                   	push   %ebx
     d7d:	83 ec 04             	sub    $0x4,%esp
     d80:	bb 00 00 00 00       	mov    $0x0,%ebx
     d85:	fa                   	cli    
     d86:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     d8a:	74 15                	je     da1 <sync_inodes+0x26>
     d8c:	8d 73 20             	lea    0x20(%ebx),%esi
     d8f:	83 ec 0c             	sub    $0xc,%esp
     d92:	56                   	push   %esi
     d93:	e8 fc ff ff ff       	call   d94 <sync_inodes+0x19>
     d98:	83 c4 10             	add    $0x10,%esp
     d9b:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     d9f:	75 ee                	jne    d8f <sync_inodes+0x14>
     da1:	fb                   	sti    
     da2:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     da6:	74 0d                	je     db5 <sync_inodes+0x3a>
     da8:	80 7b 34 00          	cmpb   $0x0,0x34(%ebx)
     dac:	75 07                	jne    db5 <sync_inodes+0x3a>
     dae:	89 d8                	mov    %ebx,%eax
     db0:	e8 b2 fa ff ff       	call   867 <write_inode>
     db5:	83 c3 38             	add    $0x38,%ebx
     db8:	81 fb 00 07 00 00    	cmp    $0x700,%ebx
     dbe:	75 c5                	jne    d85 <sync_inodes+0xa>
     dc0:	83 c4 04             	add    $0x4,%esp
     dc3:	5b                   	pop    %ebx
     dc4:	5e                   	pop    %esi
     dc5:	c3                   	ret    

00000dc6 <bmap>:
     dc6:	83 ec 0c             	sub    $0xc,%esp
     dc9:	b9 00 00 00 00       	mov    $0x0,%ecx
     dce:	8b 54 24 14          	mov    0x14(%esp),%edx
     dd2:	8b 44 24 10          	mov    0x10(%esp),%eax
     dd6:	e8 82 fb ff ff       	call   95d <_bmap>
     ddb:	83 c4 0c             	add    $0xc,%esp
     dde:	c3                   	ret    

00000ddf <create_block>:
     ddf:	83 ec 0c             	sub    $0xc,%esp
     de2:	b9 01 00 00 00       	mov    $0x1,%ecx
     de7:	8b 54 24 14          	mov    0x14(%esp),%edx
     deb:	8b 44 24 10          	mov    0x10(%esp),%eax
     def:	e8 69 fb ff ff       	call   95d <_bmap>
     df4:	83 c4 0c             	add    $0xc,%esp
     df7:	c3                   	ret    

00000df8 <iput>:
     df8:	56                   	push   %esi
     df9:	53                   	push   %ebx
     dfa:	83 ec 04             	sub    $0x4,%esp
     dfd:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     e01:	85 db                	test   %ebx,%ebx
     e03:	0f 84 4d 01 00 00    	je     f56 <iput+0x15e>
     e09:	fa                   	cli    
     e0a:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     e0e:	74 15                	je     e25 <iput+0x2d>
     e10:	8d 73 20             	lea    0x20(%ebx),%esi
     e13:	83 ec 0c             	sub    $0xc,%esp
     e16:	56                   	push   %esi
     e17:	e8 fc ff ff ff       	call   e18 <iput+0x20>
     e1c:	83 c4 10             	add    $0x10,%esp
     e1f:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     e23:	75 ee                	jne    e13 <iput+0x1b>
     e25:	fb                   	sti    
     e26:	66 83 7b 30 00       	cmpw   $0x0,0x30(%ebx)
     e2b:	75 10                	jne    e3d <iput+0x45>
     e2d:	83 ec 0c             	sub    $0xc,%esp
     e30:	68 80 00 00 00       	push   $0x80
     e35:	e8 fc ff ff ff       	call   e36 <iput+0x3e>
     e3a:	83 c4 10             	add    $0x10,%esp
     e3d:	80 7b 34 00          	cmpb   $0x0,0x34(%ebx)
     e41:	74 55                	je     e98 <iput+0xa0>
     e43:	83 ec 0c             	sub    $0xc,%esp
     e46:	8d 43 20             	lea    0x20(%ebx),%eax
     e49:	50                   	push   %eax
     e4a:	e8 fc ff ff ff       	call   e4b <iput+0x53>
     e4f:	8b 43 30             	mov    0x30(%ebx),%eax
     e52:	48                   	dec    %eax
     e53:	66 89 43 30          	mov    %ax,0x30(%ebx)
     e57:	83 c4 10             	add    $0x10,%esp
     e5a:	66 85 c0             	test   %ax,%ax
     e5d:	0f 85 f3 00 00 00    	jne    f56 <iput+0x15e>
     e63:	83 ec 0c             	sub    $0xc,%esp
     e66:	ff 73 04             	pushl  0x4(%ebx)
     e69:	e8 fc ff ff ff       	call   e6a <iput+0x72>
     e6e:	83 c4 10             	add    $0x10,%esp
     e71:	85 c0                	test   %eax,%eax
     e73:	75 10                	jne    e85 <iput+0x8d>
     e75:	83 ec 0c             	sub    $0xc,%esp
     e78:	68 a0 00 00 00       	push   $0xa0
     e7d:	e8 fc ff ff ff       	call   e7e <iput+0x86>
     e82:	83 c4 10             	add    $0x10,%esp
     e85:	66 c7 43 30 00 00    	movw   $0x0,0x30(%ebx)
     e8b:	c6 43 33 00          	movb   $0x0,0x33(%ebx)
     e8f:	c6 43 34 00          	movb   $0x0,0x34(%ebx)
     e93:	e9 be 00 00 00       	jmp    f56 <iput+0x15e>
     e98:	66 83 7b 2c 00       	cmpw   $0x0,0x2c(%ebx)
     e9d:	75 09                	jne    ea8 <iput+0xb0>
     e9f:	66 ff 4b 30          	decw   0x30(%ebx)
     ea3:	e9 ae 00 00 00       	jmp    f56 <iput+0x15e>
     ea8:	8b 03                	mov    (%ebx),%eax
     eaa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     eaf:	66 3d 00 60          	cmp    $0x6000,%ax
     eb3:	75 2d                	jne    ee2 <iput+0xea>
     eb5:	83 ec 0c             	sub    $0xc,%esp
     eb8:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
     ebc:	50                   	push   %eax
     ebd:	e8 fc ff ff ff       	call   ebe <iput+0xc6>
     ec2:	fa                   	cli    
     ec3:	83 c4 10             	add    $0x10,%esp
     ec6:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     eca:	74 15                	je     ee1 <iput+0xe9>
     ecc:	8d 73 20             	lea    0x20(%ebx),%esi
     ecf:	83 ec 0c             	sub    $0xc,%esp
     ed2:	56                   	push   %esi
     ed3:	e8 fc ff ff ff       	call   ed4 <iput+0xdc>
     ed8:	83 c4 10             	add    $0x10,%esp
     edb:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     edf:	75 ee                	jne    ecf <iput+0xd7>
     ee1:	fb                   	sti    
     ee2:	8b 43 30             	mov    0x30(%ebx),%eax
     ee5:	66 83 f8 01          	cmp    $0x1,%ax
     ee9:	77 11                	ja     efc <iput+0x104>
     eeb:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
     eef:	74 18                	je     f09 <iput+0x111>
     ef1:	8d 73 20             	lea    0x20(%ebx),%esi
     ef4:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     ef8:	75 2b                	jne    f25 <iput+0x12d>
     efa:	eb 55                	jmp    f51 <iput+0x159>
     efc:	48                   	dec    %eax
     efd:	66 89 43 30          	mov    %ax,0x30(%ebx)
     f01:	eb 53                	jmp    f56 <iput+0x15e>
     f03:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
     f07:	75 16                	jne    f1f <iput+0x127>
     f09:	83 ec 0c             	sub    $0xc,%esp
     f0c:	53                   	push   %ebx
     f0d:	e8 fc ff ff ff       	call   f0e <iput+0x116>
     f12:	89 1c 24             	mov    %ebx,(%esp)
     f15:	e8 fc ff ff ff       	call   f16 <iput+0x11e>
     f1a:	83 c4 10             	add    $0x10,%esp
     f1d:	eb 37                	jmp    f56 <iput+0x15e>
     f1f:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     f23:	74 2c                	je     f51 <iput+0x159>
     f25:	89 d8                	mov    %ebx,%eax
     f27:	e8 3b f9 ff ff       	call   867 <write_inode>
     f2c:	fa                   	cli    
     f2d:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     f31:	74 12                	je     f45 <iput+0x14d>
     f33:	83 ec 0c             	sub    $0xc,%esp
     f36:	56                   	push   %esi
     f37:	e8 fc ff ff ff       	call   f38 <iput+0x140>
     f3c:	83 c4 10             	add    $0x10,%esp
     f3f:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     f43:	75 ee                	jne    f33 <iput+0x13b>
     f45:	fb                   	sti    
     f46:	8b 43 30             	mov    0x30(%ebx),%eax
     f49:	66 83 f8 01          	cmp    $0x1,%ax
     f4d:	76 b4                	jbe    f03 <iput+0x10b>
     f4f:	eb ab                	jmp    efc <iput+0x104>
     f51:	48                   	dec    %eax
     f52:	66 89 43 30          	mov    %ax,0x30(%ebx)
     f56:	83 c4 04             	add    $0x4,%esp
     f59:	5b                   	pop    %ebx
     f5a:	5e                   	pop    %esi
     f5b:	c3                   	ret    

00000f5c <get_empty_inode>:
     f5c:	57                   	push   %edi
     f5d:	56                   	push   %esi
     f5e:	53                   	push   %ebx
     f5f:	bb 2e 07 00 00       	mov    $0x72e,%ebx
     f64:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     f6a:	ba 20 00 00 00       	mov    $0x20,%edx
     f6f:	bf 00 00 00 00       	mov    $0x0,%edi
     f74:	8d 41 38             	lea    0x38(%ecx),%eax
     f77:	3d 00 07 00 00       	cmp    $0x700,%eax
     f7c:	72 05                	jb     f83 <get_empty_inode+0x27>
     f7e:	b8 00 00 00 00       	mov    $0x0,%eax
     f83:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
     f88:	75 12                	jne    f9c <get_empty_inode+0x40>
     f8a:	66 83 78 32 00       	cmpw   $0x0,0x32(%eax)
     f8f:	75 09                	jne    f9a <get_empty_inode+0x3e>
     f91:	a3 00 00 00 00       	mov    %eax,0x0
     f96:	89 c7                	mov    %eax,%edi
     f98:	eb 0c                	jmp    fa6 <get_empty_inode+0x4a>
     f9a:	89 c7                	mov    %eax,%edi
     f9c:	89 c1                	mov    %eax,%ecx
     f9e:	4a                   	dec    %edx
     f9f:	75 d3                	jne    f74 <get_empty_inode+0x18>
     fa1:	a3 00 00 00 00       	mov    %eax,0x0
     fa6:	85 ff                	test   %edi,%edi
     fa8:	75 35                	jne    fdf <get_empty_inode+0x83>
     faa:	be 2e 00 00 00       	mov    $0x2e,%esi
     faf:	83 ec 04             	sub    $0x4,%esp
     fb2:	0f b7 06             	movzwl (%esi),%eax
     fb5:	50                   	push   %eax
     fb6:	0f b7 46 fe          	movzwl -0x2(%esi),%eax
     fba:	50                   	push   %eax
     fbb:	68 8e 00 00 00       	push   $0x8e
     fc0:	e8 fc ff ff ff       	call   fc1 <get_empty_inode+0x65>
     fc5:	83 c6 38             	add    $0x38,%esi
     fc8:	83 c4 10             	add    $0x10,%esp
     fcb:	39 de                	cmp    %ebx,%esi
     fcd:	75 e0                	jne    faf <get_empty_inode+0x53>
     fcf:	83 ec 0c             	sub    $0xc,%esp
     fd2:	68 99 00 00 00       	push   $0x99
     fd7:	e8 fc ff ff ff       	call   fd8 <get_empty_inode+0x7c>
     fdc:	83 c4 10             	add    $0x10,%esp
     fdf:	fa                   	cli    
     fe0:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
     fe4:	74 15                	je     ffb <get_empty_inode+0x9f>
     fe6:	8d 77 20             	lea    0x20(%edi),%esi
     fe9:	83 ec 0c             	sub    $0xc,%esp
     fec:	56                   	push   %esi
     fed:	e8 fc ff ff ff       	call   fee <get_empty_inode+0x92>
     ff2:	83 c4 10             	add    $0x10,%esp
     ff5:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
     ff9:	75 ee                	jne    fe9 <get_empty_inode+0x8d>
     ffb:	fb                   	sti    
     ffc:	80 7f 33 00          	cmpb   $0x0,0x33(%edi)
    1000:	74 2a                	je     102c <get_empty_inode+0xd0>
    1002:	8d 77 20             	lea    0x20(%edi),%esi
    1005:	89 f8                	mov    %edi,%eax
    1007:	e8 5b f8 ff ff       	call   867 <write_inode>
    100c:	fa                   	cli    
    100d:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    1011:	74 12                	je     1025 <get_empty_inode+0xc9>
    1013:	83 ec 0c             	sub    $0xc,%esp
    1016:	56                   	push   %esi
    1017:	e8 fc ff ff ff       	call   1018 <get_empty_inode+0xbc>
    101c:	83 c4 10             	add    $0x10,%esp
    101f:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    1023:	75 ee                	jne    1013 <get_empty_inode+0xb7>
    1025:	fb                   	sti    
    1026:	80 7f 33 00          	cmpb   $0x0,0x33(%edi)
    102a:	75 d9                	jne    1005 <get_empty_inode+0xa9>
    102c:	66 83 7f 30 00       	cmpw   $0x0,0x30(%edi)
    1031:	0f 85 2d ff ff ff    	jne    f64 <get_empty_inode+0x8>
    1037:	b9 38 00 00 00       	mov    $0x38,%ecx
    103c:	b0 00                	mov    $0x0,%al
    103e:	fc                   	cld    
    103f:	57                   	push   %edi
    1040:	f3 aa                	rep stos %al,%es:(%edi)
    1042:	5f                   	pop    %edi
    1043:	66 c7 47 30 01 00    	movw   $0x1,0x30(%edi)
    1049:	89 f8                	mov    %edi,%eax
    104b:	5b                   	pop    %ebx
    104c:	5e                   	pop    %esi
    104d:	5f                   	pop    %edi
    104e:	c3                   	ret    

0000104f <get_pipe_inode>:
    104f:	53                   	push   %ebx
    1050:	83 ec 08             	sub    $0x8,%esp
    1053:	e8 fc ff ff ff       	call   1054 <get_pipe_inode+0x5>
    1058:	85 c0                	test   %eax,%eax
    105a:	74 38                	je     1094 <get_pipe_inode+0x45>
    105c:	89 c3                	mov    %eax,%ebx
    105e:	83 ec 0c             	sub    $0xc,%esp
    1061:	6a 00                	push   $0x0
    1063:	e8 fc ff ff ff       	call   1064 <get_pipe_inode+0x15>
    1068:	89 43 04             	mov    %eax,0x4(%ebx)
    106b:	83 c4 10             	add    $0x10,%esp
    106e:	85 c0                	test   %eax,%eax
    1070:	75 08                	jne    107a <get_pipe_inode+0x2b>
    1072:	66 c7 43 30 00 00    	movw   $0x0,0x30(%ebx)
    1078:	eb 1f                	jmp    1099 <get_pipe_inode+0x4a>
    107a:	66 c7 43 30 02 00    	movw   $0x2,0x30(%ebx)
    1080:	66 c7 43 10 00 00    	movw   $0x0,0x10(%ebx)
    1086:	66 c7 43 0e 00 00    	movw   $0x0,0xe(%ebx)
    108c:	c6 43 34 01          	movb   $0x1,0x34(%ebx)
    1090:	89 d8                	mov    %ebx,%eax
    1092:	eb 05                	jmp    1099 <get_pipe_inode+0x4a>
    1094:	b8 00 00 00 00       	mov    $0x0,%eax
    1099:	83 c4 08             	add    $0x8,%esp
    109c:	5b                   	pop    %ebx
    109d:	c3                   	ret    

0000109e <iget>:
    109e:	55                   	push   %ebp
    109f:	57                   	push   %edi
    10a0:	56                   	push   %esi
    10a1:	53                   	push   %ebx
    10a2:	83 ec 1c             	sub    $0x1c,%esp
    10a5:	83 7c 24 30 00       	cmpl   $0x0,0x30(%esp)
    10aa:	75 10                	jne    10bc <iget+0x1e>
    10ac:	83 ec 0c             	sub    $0xc,%esp
    10af:	68 af 00 00 00       	push   $0xaf
    10b4:	e8 fc ff ff ff       	call   10b5 <iget+0x17>
    10b9:	83 c4 10             	add    $0x10,%esp
    10bc:	e8 fc ff ff ff       	call   10bd <iget+0x1f>
    10c1:	89 c3                	mov    %eax,%ebx
    10c3:	bf 00 00 00 00       	mov    $0x0,%edi
    10c8:	0f b7 77 2c          	movzwl 0x2c(%edi),%esi
    10cc:	3b 74 24 30          	cmp    0x30(%esp),%esi
    10d0:	75 0e                	jne    10e0 <iget+0x42>
    10d2:	0f b7 47 2e          	movzwl 0x2e(%edi),%eax
    10d6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    10da:	3b 44 24 34          	cmp    0x34(%esp),%eax
    10de:	74 10                	je     10f0 <iget+0x52>
    10e0:	83 c7 38             	add    $0x38,%edi
    10e3:	81 ff 00 07 00 00    	cmp    $0x700,%edi
    10e9:	72 dd                	jb     10c8 <iget+0x2a>
    10eb:	e9 9d 00 00 00       	jmp    118d <iget+0xef>
    10f0:	fa                   	cli    
    10f1:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    10f5:	74 15                	je     110c <iget+0x6e>
    10f7:	8d 6f 20             	lea    0x20(%edi),%ebp
    10fa:	83 ec 0c             	sub    $0xc,%esp
    10fd:	55                   	push   %ebp
    10fe:	e8 fc ff ff ff       	call   10ff <iget+0x61>
    1103:	83 c4 10             	add    $0x10,%esp
    1106:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    110a:	75 ee                	jne    10fa <iget+0x5c>
    110c:	fb                   	sti    
    110d:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    1111:	3b 44 24 30          	cmp    0x30(%esp),%eax
    1115:	0f 85 98 01 00 00    	jne    12b3 <iget+0x215>
    111b:	0f b7 57 2e          	movzwl 0x2e(%edi),%edx
    111f:	3b 54 24 34          	cmp    0x34(%esp),%edx
    1123:	0f 85 88 01 00 00    	jne    12b1 <iget+0x213>
    1129:	66 ff 47 30          	incw   0x30(%edi)
    112d:	80 7f 35 00          	cmpb   $0x0,0x35(%edi)
    1131:	74 3f                	je     1172 <iget+0xd4>
    1133:	39 3d 5c 00 00 00    	cmp    %edi,0x5c
    1139:	0f 84 47 01 00 00    	je     1286 <iget+0x1e8>
    113f:	b8 c8 00 00 00       	mov    $0xc8,%eax
    1144:	be 01 00 00 00       	mov    $0x1,%esi
    1149:	39 38                	cmp    %edi,(%eax)
    114b:	0f 84 3a 01 00 00    	je     128b <iget+0x1ed>
    1151:	46                   	inc    %esi
    1152:	83 c0 6c             	add    $0x6c,%eax
    1155:	83 fe 08             	cmp    $0x8,%esi
    1158:	75 ef                	jne    1149 <iget+0xab>
    115a:	e9 0b 01 00 00       	jmp    126a <iget+0x1cc>
    115f:	83 ec 0c             	sub    $0xc,%esp
    1162:	53                   	push   %ebx
    1163:	e8 fc ff ff ff       	call   1164 <iget+0xc6>
    1168:	83 c4 10             	add    $0x10,%esp
    116b:	89 f8                	mov    %edi,%eax
    116d:	e9 57 01 00 00       	jmp    12c9 <iget+0x22b>
    1172:	85 db                	test   %ebx,%ebx
    1174:	0f 84 e5 00 00 00    	je     125f <iget+0x1c1>
    117a:	83 ec 0c             	sub    $0xc,%esp
    117d:	53                   	push   %ebx
    117e:	e8 fc ff ff ff       	call   117f <iget+0xe1>
    1183:	83 c4 10             	add    $0x10,%esp
    1186:	89 f8                	mov    %edi,%eax
    1188:	e9 3c 01 00 00       	jmp    12c9 <iget+0x22b>
    118d:	85 db                	test   %ebx,%ebx
    118f:	0f 84 ce 00 00 00    	je     1263 <iget+0x1c5>
    1195:	8b 44 24 30          	mov    0x30(%esp),%eax
    1199:	66 89 43 2c          	mov    %ax,0x2c(%ebx)
    119d:	8b 44 24 34          	mov    0x34(%esp),%eax
    11a1:	66 89 43 2e          	mov    %ax,0x2e(%ebx)
    11a5:	fa                   	cli    
    11a6:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
    11aa:	74 15                	je     11c1 <iget+0x123>
    11ac:	8d 73 20             	lea    0x20(%ebx),%esi
    11af:	83 ec 0c             	sub    $0xc,%esp
    11b2:	56                   	push   %esi
    11b3:	e8 fc ff ff ff       	call   11b4 <iget+0x116>
    11b8:	83 c4 10             	add    $0x10,%esp
    11bb:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
    11bf:	75 ee                	jne    11af <iget+0x111>
    11c1:	c6 43 32 01          	movb   $0x1,0x32(%ebx)
    11c5:	fb                   	sti    
    11c6:	83 ec 0c             	sub    $0xc,%esp
    11c9:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    11cd:	50                   	push   %eax
    11ce:	e8 fc ff ff ff       	call   11cf <iget+0x131>
    11d3:	89 c6                	mov    %eax,%esi
    11d5:	83 c4 10             	add    $0x10,%esp
    11d8:	85 c0                	test   %eax,%eax
    11da:	75 10                	jne    11ec <iget+0x14e>
    11dc:	83 ec 0c             	sub    $0xc,%esp
    11df:	68 c0 00 00 00       	push   $0xc0
    11e4:	e8 fc ff ff ff       	call   11e5 <iget+0x147>
    11e9:	83 c4 10             	add    $0x10,%esp
    11ec:	83 ec 08             	sub    $0x8,%esp
    11ef:	0f b7 56 04          	movzwl 0x4(%esi),%edx
    11f3:	0f b7 46 06          	movzwl 0x6(%esi),%eax
    11f7:	8d 54 02 02          	lea    0x2(%edx,%eax,1),%edx
    11fb:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
    11ff:	48                   	dec    %eax
    1200:	c1 e8 05             	shr    $0x5,%eax
    1203:	01 d0                	add    %edx,%eax
    1205:	50                   	push   %eax
    1206:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    120a:	50                   	push   %eax
    120b:	e8 fc ff ff ff       	call   120c <iget+0x16e>
    1210:	89 c5                	mov    %eax,%ebp
    1212:	83 c4 10             	add    $0x10,%esp
    1215:	85 c0                	test   %eax,%eax
    1217:	75 10                	jne    1229 <iget+0x18b>
    1219:	83 ec 0c             	sub    $0xc,%esp
    121c:	68 52 00 00 00       	push   $0x52
    1221:	e8 fc ff ff ff       	call   1222 <iget+0x184>
    1226:	83 c4 10             	add    $0x10,%esp
    1229:	0f b7 73 2e          	movzwl 0x2e(%ebx),%esi
    122d:	4e                   	dec    %esi
    122e:	83 e6 1f             	and    $0x1f,%esi
    1231:	c1 e6 05             	shl    $0x5,%esi
    1234:	03 75 00             	add    0x0(%ebp),%esi
    1237:	b9 08 00 00 00       	mov    $0x8,%ecx
    123c:	89 df                	mov    %ebx,%edi
    123e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    1240:	83 ec 0c             	sub    $0xc,%esp
    1243:	55                   	push   %ebp
    1244:	e8 fc ff ff ff       	call   1245 <iget+0x1a7>
    1249:	c6 43 32 00          	movb   $0x0,0x32(%ebx)
    124d:	8d 43 20             	lea    0x20(%ebx),%eax
    1250:	89 04 24             	mov    %eax,(%esp)
    1253:	e8 fc ff ff ff       	call   1254 <iget+0x1b6>
    1258:	83 c4 10             	add    $0x10,%esp
    125b:	89 d8                	mov    %ebx,%eax
    125d:	eb 6a                	jmp    12c9 <iget+0x22b>
    125f:	89 f8                	mov    %edi,%eax
    1261:	eb 66                	jmp    12c9 <iget+0x22b>
    1263:	b8 00 00 00 00       	mov    $0x0,%eax
    1268:	eb 5f                	jmp    12c9 <iget+0x22b>
    126a:	83 ec 0c             	sub    $0xc,%esp
    126d:	68 c0 00 00 00       	push   $0xc0
    1272:	e8 fc ff ff ff       	call   1273 <iget+0x1d5>
    1277:	83 c4 10             	add    $0x10,%esp
    127a:	85 db                	test   %ebx,%ebx
    127c:	0f 85 dd fe ff ff    	jne    115f <iget+0xc1>
    1282:	89 f8                	mov    %edi,%eax
    1284:	eb 43                	jmp    12c9 <iget+0x22b>
    1286:	be 00 00 00 00       	mov    $0x0,%esi
    128b:	83 ec 0c             	sub    $0xc,%esp
    128e:	57                   	push   %edi
    128f:	e8 fc ff ff ff       	call   1290 <iget+0x1f2>
    1294:	8d 04 36             	lea    (%esi,%esi,1),%eax
    1297:	01 c6                	add    %eax,%esi
    1299:	8d 04 f6             	lea    (%esi,%esi,8),%eax
    129c:	0f b7 34 85 54 00 00 	movzwl 0x54(,%eax,4),%esi
    12a3:	00 
    12a4:	83 c4 10             	add    $0x10,%esp
    12a7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    12ae:	00 
    12af:	eb 02                	jmp    12b3 <iget+0x215>
    12b1:	89 c6                	mov    %eax,%esi
    12b3:	8b 44 24 0c          	mov    0xc(%esp),%eax
    12b7:	89 44 24 34          	mov    %eax,0x34(%esp)
    12bb:	89 74 24 30          	mov    %esi,0x30(%esp)
    12bf:	bf 00 00 00 00       	mov    $0x0,%edi
    12c4:	e9 ff fd ff ff       	jmp    10c8 <iget+0x2a>
    12c9:	83 c4 1c             	add    $0x1c,%esp
    12cc:	5b                   	pop    %ebx
    12cd:	5e                   	pop    %esi
    12ce:	5f                   	pop    %edi
    12cf:	5d                   	pop    %ebp
    12d0:	c3                   	ret    

000012d1 <find_buffer>:
    12d1:	56                   	push   %esi
    12d2:	53                   	push   %ebx
    12d3:	89 c1                	mov    %eax,%ecx
    12d5:	89 d3                	mov    %edx,%ebx
    12d7:	31 d0                	xor    %edx,%eax
    12d9:	be 33 01 00 00       	mov    $0x133,%esi
    12de:	ba 00 00 00 00       	mov    $0x0,%edx
    12e3:	f7 f6                	div    %esi
    12e5:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
    12ec:	85 c0                	test   %eax,%eax
    12ee:	74 16                	je     1306 <find_buffer+0x35>
    12f0:	0f b7 50 08          	movzwl 0x8(%eax),%edx
    12f4:	39 d1                	cmp    %edx,%ecx
    12f6:	75 05                	jne    12fd <find_buffer+0x2c>
    12f8:	39 58 04             	cmp    %ebx,0x4(%eax)
    12fb:	74 0e                	je     130b <find_buffer+0x3a>
    12fd:	8b 40 18             	mov    0x18(%eax),%eax
    1300:	85 c0                	test   %eax,%eax
    1302:	75 ec                	jne    12f0 <find_buffer+0x1f>
    1304:	eb 05                	jmp    130b <find_buffer+0x3a>
    1306:	b8 00 00 00 00       	mov    $0x0,%eax
    130b:	5b                   	pop    %ebx
    130c:	5e                   	pop    %esi
    130d:	c3                   	ret    

0000130e <sys_sync>:
    130e:	57                   	push   %edi
    130f:	56                   	push   %esi
    1310:	53                   	push   %ebx
    1311:	e8 fc ff ff ff       	call   1312 <sys_sync+0x4>
    1316:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    131c:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    1323:	7e 42                	jle    1367 <sys_sync+0x59>
    1325:	bf 00 00 00 00       	mov    $0x0,%edi
    132a:	fa                   	cli    
    132b:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    132f:	74 15                	je     1346 <sys_sync+0x38>
    1331:	8d 73 10             	lea    0x10(%ebx),%esi
    1334:	83 ec 0c             	sub    $0xc,%esp
    1337:	56                   	push   %esi
    1338:	e8 fc ff ff ff       	call   1339 <sys_sync+0x2b>
    133d:	83 c4 10             	add    $0x10,%esp
    1340:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1344:	75 ee                	jne    1334 <sys_sync+0x26>
    1346:	fb                   	sti    
    1347:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    134b:	74 0e                	je     135b <sys_sync+0x4d>
    134d:	83 ec 08             	sub    $0x8,%esp
    1350:	53                   	push   %ebx
    1351:	6a 01                	push   $0x1
    1353:	e8 fc ff ff ff       	call   1354 <sys_sync+0x46>
    1358:	83 c4 10             	add    $0x10,%esp
    135b:	47                   	inc    %edi
    135c:	83 c3 24             	add    $0x24,%ebx
    135f:	39 3d 00 00 00 00    	cmp    %edi,0x0
    1365:	7f c3                	jg     132a <sys_sync+0x1c>
    1367:	b8 00 00 00 00       	mov    $0x0,%eax
    136c:	5b                   	pop    %ebx
    136d:	5e                   	pop    %esi
    136e:	5f                   	pop    %edi
    136f:	c3                   	ret    

00001370 <sync_dev>:
    1370:	55                   	push   %ebp
    1371:	57                   	push   %edi
    1372:	56                   	push   %esi
    1373:	53                   	push   %ebx
    1374:	83 ec 0c             	sub    $0xc,%esp
    1377:	8b 7c 24 20          	mov    0x20(%esp),%edi
    137b:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1381:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    1388:	7e 52                	jle    13dc <sync_dev+0x6c>
    138a:	be 00 00 00 00       	mov    $0x0,%esi
    138f:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    1393:	39 f8                	cmp    %edi,%eax
    1395:	75 39                	jne    13d0 <sync_dev+0x60>
    1397:	fa                   	cli    
    1398:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    139c:	74 15                	je     13b3 <sync_dev+0x43>
    139e:	8d 6b 10             	lea    0x10(%ebx),%ebp
    13a1:	83 ec 0c             	sub    $0xc,%esp
    13a4:	55                   	push   %ebp
    13a5:	e8 fc ff ff ff       	call   13a6 <sync_dev+0x36>
    13aa:	83 c4 10             	add    $0x10,%esp
    13ad:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    13b1:	75 ee                	jne    13a1 <sync_dev+0x31>
    13b3:	fb                   	sti    
    13b4:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    13b8:	39 c7                	cmp    %eax,%edi
    13ba:	75 14                	jne    13d0 <sync_dev+0x60>
    13bc:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    13c0:	74 0e                	je     13d0 <sync_dev+0x60>
    13c2:	83 ec 08             	sub    $0x8,%esp
    13c5:	53                   	push   %ebx
    13c6:	6a 01                	push   $0x1
    13c8:	e8 fc ff ff ff       	call   13c9 <sync_dev+0x59>
    13cd:	83 c4 10             	add    $0x10,%esp
    13d0:	46                   	inc    %esi
    13d1:	83 c3 24             	add    $0x24,%ebx
    13d4:	39 35 00 00 00 00    	cmp    %esi,0x0
    13da:	7f b3                	jg     138f <sync_dev+0x1f>
    13dc:	e8 fc ff ff ff       	call   13dd <sync_dev+0x6d>
    13e1:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    13e7:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    13ee:	7e 52                	jle    1442 <sync_dev+0xd2>
    13f0:	be 00 00 00 00       	mov    $0x0,%esi
    13f5:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    13f9:	39 c7                	cmp    %eax,%edi
    13fb:	75 39                	jne    1436 <sync_dev+0xc6>
    13fd:	fa                   	cli    
    13fe:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1402:	74 15                	je     1419 <sync_dev+0xa9>
    1404:	8d 6b 10             	lea    0x10(%ebx),%ebp
    1407:	83 ec 0c             	sub    $0xc,%esp
    140a:	55                   	push   %ebp
    140b:	e8 fc ff ff ff       	call   140c <sync_dev+0x9c>
    1410:	83 c4 10             	add    $0x10,%esp
    1413:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1417:	75 ee                	jne    1407 <sync_dev+0x97>
    1419:	fb                   	sti    
    141a:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    141e:	39 c7                	cmp    %eax,%edi
    1420:	75 14                	jne    1436 <sync_dev+0xc6>
    1422:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    1426:	74 0e                	je     1436 <sync_dev+0xc6>
    1428:	83 ec 08             	sub    $0x8,%esp
    142b:	53                   	push   %ebx
    142c:	6a 01                	push   $0x1
    142e:	e8 fc ff ff ff       	call   142f <sync_dev+0xbf>
    1433:	83 c4 10             	add    $0x10,%esp
    1436:	46                   	inc    %esi
    1437:	83 c3 24             	add    $0x24,%ebx
    143a:	39 35 00 00 00 00    	cmp    %esi,0x0
    1440:	7f b3                	jg     13f5 <sync_dev+0x85>
    1442:	b8 00 00 00 00       	mov    $0x0,%eax
    1447:	83 c4 0c             	add    $0xc,%esp
    144a:	5b                   	pop    %ebx
    144b:	5e                   	pop    %esi
    144c:	5f                   	pop    %edi
    144d:	5d                   	pop    %ebp
    144e:	c3                   	ret    

0000144f <invalidate_buffers>:
    144f:	55                   	push   %ebp
    1450:	57                   	push   %edi
    1451:	56                   	push   %esi
    1452:	53                   	push   %ebx
    1453:	83 ec 0c             	sub    $0xc,%esp
    1456:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    145a:	8b 35 00 00 00 00    	mov    0x0,%esi
    1460:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    1467:	7e 48                	jle    14b1 <invalidate_buffers+0x62>
    1469:	83 c6 10             	add    $0x10,%esi
    146c:	bf 00 00 00 00       	mov    $0x0,%edi
    1471:	89 f3                	mov    %esi,%ebx
    1473:	0f b7 46 f8          	movzwl -0x8(%esi),%eax
    1477:	39 e8                	cmp    %ebp,%eax
    1479:	75 2a                	jne    14a5 <invalidate_buffers+0x56>
    147b:	fa                   	cli    
    147c:	80 7e fd 00          	cmpb   $0x0,-0x3(%esi)
    1480:	74 12                	je     1494 <invalidate_buffers+0x45>
    1482:	83 ec 0c             	sub    $0xc,%esp
    1485:	53                   	push   %ebx
    1486:	e8 fc ff ff ff       	call   1487 <invalidate_buffers+0x38>
    148b:	83 c4 10             	add    $0x10,%esp
    148e:	80 7b fd 00          	cmpb   $0x0,-0x3(%ebx)
    1492:	75 ee                	jne    1482 <invalidate_buffers+0x33>
    1494:	fb                   	sti    
    1495:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
    1499:	39 c5                	cmp    %eax,%ebp
    149b:	75 08                	jne    14a5 <invalidate_buffers+0x56>
    149d:	c6 43 fb 00          	movb   $0x0,-0x5(%ebx)
    14a1:	c6 43 fa 00          	movb   $0x0,-0x6(%ebx)
    14a5:	47                   	inc    %edi
    14a6:	83 c6 24             	add    $0x24,%esi
    14a9:	39 3d 00 00 00 00    	cmp    %edi,0x0
    14af:	7f c0                	jg     1471 <invalidate_buffers+0x22>
    14b1:	83 c4 0c             	add    $0xc,%esp
    14b4:	5b                   	pop    %ebx
    14b5:	5e                   	pop    %esi
    14b6:	5f                   	pop    %edi
    14b7:	5d                   	pop    %ebp
    14b8:	c3                   	ret    

000014b9 <check_disk_change>:
    14b9:	57                   	push   %edi
    14ba:	56                   	push   %esi
    14bb:	53                   	push   %ebx
    14bc:	8b 74 24 10          	mov    0x10(%esp),%esi
    14c0:	89 f0                	mov    %esi,%eax
    14c2:	c1 e8 08             	shr    $0x8,%eax
    14c5:	83 f8 02             	cmp    $0x2,%eax
    14c8:	75 4d                	jne    1517 <check_disk_change+0x5e>
    14ca:	83 ec 0c             	sub    $0xc,%esp
    14cd:	89 f0                	mov    %esi,%eax
    14cf:	83 e0 03             	and    $0x3,%eax
    14d2:	50                   	push   %eax
    14d3:	e8 fc ff ff ff       	call   14d4 <check_disk_change+0x1b>
    14d8:	83 c4 10             	add    $0x10,%esp
    14db:	85 c0                	test   %eax,%eax
    14dd:	74 38                	je     1517 <check_disk_change+0x5e>
    14df:	bb 54 00 00 00       	mov    $0x54,%ebx
    14e4:	bf b4 03 00 00       	mov    $0x3b4,%edi
    14e9:	0f b7 03             	movzwl (%ebx),%eax
    14ec:	39 c6                	cmp    %eax,%esi
    14ee:	75 0c                	jne    14fc <check_disk_change+0x43>
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	56                   	push   %esi
    14f4:	e8 fc ff ff ff       	call   14f5 <check_disk_change+0x3c>
    14f9:	83 c4 10             	add    $0x10,%esp
    14fc:	83 c3 6c             	add    $0x6c,%ebx
    14ff:	39 fb                	cmp    %edi,%ebx
    1501:	75 e6                	jne    14e9 <check_disk_change+0x30>
    1503:	83 ec 0c             	sub    $0xc,%esp
    1506:	56                   	push   %esi
    1507:	e8 fc ff ff ff       	call   1508 <check_disk_change+0x4f>
    150c:	89 34 24             	mov    %esi,(%esp)
    150f:	e8 fc ff ff ff       	call   1510 <check_disk_change+0x57>
    1514:	83 c4 10             	add    $0x10,%esp
    1517:	5b                   	pop    %ebx
    1518:	5e                   	pop    %esi
    1519:	5f                   	pop    %edi
    151a:	c3                   	ret    

0000151b <get_hash_table>:
    151b:	55                   	push   %ebp
    151c:	57                   	push   %edi
    151d:	56                   	push   %esi
    151e:	53                   	push   %ebx
    151f:	83 ec 0c             	sub    $0xc,%esp
    1522:	8b 7c 24 20          	mov    0x20(%esp),%edi
    1526:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    152a:	89 ea                	mov    %ebp,%edx
    152c:	89 f8                	mov    %edi,%eax
    152e:	e8 9e fd ff ff       	call   12d1 <find_buffer>
    1533:	89 c3                	mov    %eax,%ebx
    1535:	85 c0                	test   %eax,%eax
    1537:	74 32                	je     156b <get_hash_table+0x50>
    1539:	fe 40 0c             	incb   0xc(%eax)
    153c:	fa                   	cli    
    153d:	80 78 0d 00          	cmpb   $0x0,0xd(%eax)
    1541:	74 15                	je     1558 <get_hash_table+0x3d>
    1543:	8d 70 10             	lea    0x10(%eax),%esi
    1546:	83 ec 0c             	sub    $0xc,%esp
    1549:	56                   	push   %esi
    154a:	e8 fc ff ff ff       	call   154b <get_hash_table+0x30>
    154f:	83 c4 10             	add    $0x10,%esp
    1552:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1556:	75 ee                	jne    1546 <get_hash_table+0x2b>
    1558:	fb                   	sti    
    1559:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    155d:	39 c7                	cmp    %eax,%edi
    155f:	75 05                	jne    1566 <get_hash_table+0x4b>
    1561:	39 6b 04             	cmp    %ebp,0x4(%ebx)
    1564:	74 0c                	je     1572 <get_hash_table+0x57>
    1566:	fe 4b 0c             	decb   0xc(%ebx)
    1569:	eb bf                	jmp    152a <get_hash_table+0xf>
    156b:	b8 00 00 00 00       	mov    $0x0,%eax
    1570:	eb 02                	jmp    1574 <get_hash_table+0x59>
    1572:	89 d8                	mov    %ebx,%eax
    1574:	83 c4 0c             	add    $0xc,%esp
    1577:	5b                   	pop    %ebx
    1578:	5e                   	pop    %esi
    1579:	5f                   	pop    %edi
    157a:	5d                   	pop    %ebp
    157b:	c3                   	ret    

0000157c <getblk>:
    157c:	55                   	push   %ebp
    157d:	57                   	push   %edi
    157e:	56                   	push   %esi
    157f:	53                   	push   %ebx
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	8b 74 24 20          	mov    0x20(%esp),%esi
    1587:	83 ec 08             	sub    $0x8,%esp
    158a:	ff 74 24 2c          	pushl  0x2c(%esp)
    158e:	56                   	push   %esi
    158f:	e8 fc ff ff ff       	call   1590 <getblk+0x14>
    1594:	89 c3                	mov    %eax,%ebx
    1596:	83 c4 10             	add    $0x10,%esp
    1599:	85 c0                	test   %eax,%eax
    159b:	0f 85 ca 01 00 00    	jne    176b <getblk+0x1ef>
    15a1:	8b 2d 08 07 00 00    	mov    0x708,%ebp
    15a7:	89 e8                	mov    %ebp,%eax
    15a9:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
    15ad:	75 30                	jne    15df <getblk+0x63>
    15af:	85 db                	test   %ebx,%ebx
    15b1:	74 1c                	je     15cf <getblk+0x53>
    15b3:	0f b6 50 0b          	movzbl 0xb(%eax),%edx
    15b7:	01 d2                	add    %edx,%edx
    15b9:	0f b6 48 0d          	movzbl 0xd(%eax),%ecx
    15bd:	01 d1                	add    %edx,%ecx
    15bf:	0f b6 53 0b          	movzbl 0xb(%ebx),%edx
    15c3:	01 d2                	add    %edx,%edx
    15c5:	0f b6 7b 0d          	movzbl 0xd(%ebx),%edi
    15c9:	01 fa                	add    %edi,%edx
    15cb:	39 d1                	cmp    %edx,%ecx
    15cd:	7d 10                	jge    15df <getblk+0x63>
    15cf:	0f b6 50 0b          	movzbl 0xb(%eax),%edx
    15d3:	01 d2                	add    %edx,%edx
    15d5:	0f b6 48 0d          	movzbl 0xd(%eax),%ecx
    15d9:	01 ca                	add    %ecx,%edx
    15db:	74 0b                	je     15e8 <getblk+0x6c>
    15dd:	89 c3                	mov    %eax,%ebx
    15df:	8b 40 20             	mov    0x20(%eax),%eax
    15e2:	39 c5                	cmp    %eax,%ebp
    15e4:	75 c3                	jne    15a9 <getblk+0x2d>
    15e6:	eb 02                	jmp    15ea <getblk+0x6e>
    15e8:	89 c3                	mov    %eax,%ebx
    15ea:	85 db                	test   %ebx,%ebx
    15ec:	75 12                	jne    1600 <getblk+0x84>
    15ee:	83 ec 0c             	sub    $0xc,%esp
    15f1:	68 04 07 00 00       	push   $0x704
    15f6:	e8 fc ff ff ff       	call   15f7 <getblk+0x7b>
    15fb:	83 c4 10             	add    $0x10,%esp
    15fe:	eb 87                	jmp    1587 <getblk+0xb>
    1600:	fa                   	cli    
    1601:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1605:	74 15                	je     161c <getblk+0xa0>
    1607:	8d 7b 10             	lea    0x10(%ebx),%edi
    160a:	83 ec 0c             	sub    $0xc,%esp
    160d:	57                   	push   %edi
    160e:	e8 fc ff ff ff       	call   160f <getblk+0x93>
    1613:	83 c4 10             	add    $0x10,%esp
    1616:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    161a:	75 ee                	jne    160a <getblk+0x8e>
    161c:	fb                   	sti    
    161d:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
    1621:	0f 85 60 ff ff ff    	jne    1587 <getblk+0xb>
    1627:	8d 7b 10             	lea    0x10(%ebx),%edi
    162a:	eb 34                	jmp    1660 <getblk+0xe4>
    162c:	83 ec 0c             	sub    $0xc,%esp
    162f:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    1633:	50                   	push   %eax
    1634:	e8 fc ff ff ff       	call   1635 <getblk+0xb9>
    1639:	fa                   	cli    
    163a:	83 c4 10             	add    $0x10,%esp
    163d:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1641:	74 12                	je     1655 <getblk+0xd9>
    1643:	83 ec 0c             	sub    $0xc,%esp
    1646:	57                   	push   %edi
    1647:	e8 fc ff ff ff       	call   1648 <getblk+0xcc>
    164c:	83 c4 10             	add    $0x10,%esp
    164f:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1653:	75 ee                	jne    1643 <getblk+0xc7>
    1655:	fb                   	sti    
    1656:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
    165a:	0f 85 27 ff ff ff    	jne    1587 <getblk+0xb>
    1660:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    1664:	75 c6                	jne    162c <getblk+0xb0>
    1666:	8b 54 24 24          	mov    0x24(%esp),%edx
    166a:	89 f0                	mov    %esi,%eax
    166c:	e8 60 fc ff ff       	call   12d1 <find_buffer>
    1671:	85 c0                	test   %eax,%eax
    1673:	0f 85 0e ff ff ff    	jne    1587 <getblk+0xb>
    1679:	c6 43 0c 01          	movb   $0x1,0xc(%ebx)
    167d:	c6 43 0b 00          	movb   $0x0,0xb(%ebx)
    1681:	c6 43 0a 00          	movb   $0x0,0xa(%ebx)
    1685:	8b 43 18             	mov    0x18(%ebx),%eax
    1688:	85 c0                	test   %eax,%eax
    168a:	74 06                	je     1692 <getblk+0x116>
    168c:	8b 53 14             	mov    0x14(%ebx),%edx
    168f:	89 50 14             	mov    %edx,0x14(%eax)
    1692:	8b 43 14             	mov    0x14(%ebx),%eax
    1695:	85 c0                	test   %eax,%eax
    1697:	74 06                	je     169f <getblk+0x123>
    1699:	8b 53 18             	mov    0x18(%ebx),%edx
    169c:	89 50 18             	mov    %edx,0x18(%eax)
    169f:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    16a3:	33 43 04             	xor    0x4(%ebx),%eax
    16a6:	b9 33 01 00 00       	mov    $0x133,%ecx
    16ab:	ba 00 00 00 00       	mov    $0x0,%edx
    16b0:	f7 f1                	div    %ecx
    16b2:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
    16b9:	39 c3                	cmp    %eax,%ebx
    16bb:	75 0a                	jne    16c7 <getblk+0x14b>
    16bd:	8b 40 18             	mov    0x18(%eax),%eax
    16c0:	89 04 95 00 00 00 00 	mov    %eax,0x0(,%edx,4)
    16c7:	83 7b 1c 00          	cmpl   $0x0,0x1c(%ebx)
    16cb:	74 06                	je     16d3 <getblk+0x157>
    16cd:	83 7b 20 00          	cmpl   $0x0,0x20(%ebx)
    16d1:	75 10                	jne    16e3 <getblk+0x167>
    16d3:	83 ec 0c             	sub    $0xc,%esp
    16d6:	68 dd 00 00 00       	push   $0xdd
    16db:	e8 fc ff ff ff       	call   16dc <getblk+0x160>
    16e0:	83 c4 10             	add    $0x10,%esp
    16e3:	8b 43 1c             	mov    0x1c(%ebx),%eax
    16e6:	8b 53 20             	mov    0x20(%ebx),%edx
    16e9:	89 50 20             	mov    %edx,0x20(%eax)
    16ec:	8b 43 20             	mov    0x20(%ebx),%eax
    16ef:	8b 53 1c             	mov    0x1c(%ebx),%edx
    16f2:	89 50 1c             	mov    %edx,0x1c(%eax)
    16f5:	a1 08 07 00 00       	mov    0x708,%eax
    16fa:	39 c3                	cmp    %eax,%ebx
    16fc:	75 08                	jne    1706 <getblk+0x18a>
    16fe:	8b 40 20             	mov    0x20(%eax),%eax
    1701:	a3 08 07 00 00       	mov    %eax,0x708
    1706:	66 89 73 08          	mov    %si,0x8(%ebx)
    170a:	8b 44 24 24          	mov    0x24(%esp),%eax
    170e:	89 43 04             	mov    %eax,0x4(%ebx)
    1711:	a1 08 07 00 00       	mov    0x708,%eax
    1716:	89 43 20             	mov    %eax,0x20(%ebx)
    1719:	8b 50 1c             	mov    0x1c(%eax),%edx
    171c:	89 53 1c             	mov    %edx,0x1c(%ebx)
    171f:	8b 50 1c             	mov    0x1c(%eax),%edx
    1722:	89 5a 20             	mov    %ebx,0x20(%edx)
    1725:	89 58 1c             	mov    %ebx,0x1c(%eax)
    1728:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    172f:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    1736:	8b 43 08             	mov    0x8(%ebx),%eax
    1739:	66 85 c0             	test   %ax,%ax
    173c:	74 2d                	je     176b <getblk+0x1ef>
    173e:	0f b7 c0             	movzwl %ax,%eax
    1741:	33 43 04             	xor    0x4(%ebx),%eax
    1744:	b9 33 01 00 00       	mov    $0x133,%ecx
    1749:	ba 00 00 00 00       	mov    $0x0,%edx
    174e:	f7 f1                	div    %ecx
    1750:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
    1757:	89 43 18             	mov    %eax,0x18(%ebx)
    175a:	89 1c 95 00 00 00 00 	mov    %ebx,0x0(,%edx,4)
    1761:	8b 43 18             	mov    0x18(%ebx),%eax
    1764:	85 c0                	test   %eax,%eax
    1766:	74 03                	je     176b <getblk+0x1ef>
    1768:	89 58 14             	mov    %ebx,0x14(%eax)
    176b:	89 d8                	mov    %ebx,%eax
    176d:	83 c4 0c             	add    $0xc,%esp
    1770:	5b                   	pop    %ebx
    1771:	5e                   	pop    %esi
    1772:	5f                   	pop    %edi
    1773:	5d                   	pop    %ebp
    1774:	c3                   	ret    

00001775 <brelse>:
    1775:	56                   	push   %esi
    1776:	53                   	push   %ebx
    1777:	83 ec 04             	sub    $0x4,%esp
    177a:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    177e:	85 db                	test   %ebx,%ebx
    1780:	74 4a                	je     17cc <brelse+0x57>
    1782:	fa                   	cli    
    1783:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1787:	74 15                	je     179e <brelse+0x29>
    1789:	8d 73 10             	lea    0x10(%ebx),%esi
    178c:	83 ec 0c             	sub    $0xc,%esp
    178f:	56                   	push   %esi
    1790:	e8 fc ff ff ff       	call   1791 <brelse+0x1c>
    1795:	83 c4 10             	add    $0x10,%esp
    1798:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    179c:	75 ee                	jne    178c <brelse+0x17>
    179e:	fb                   	sti    
    179f:	8a 43 0c             	mov    0xc(%ebx),%al
    17a2:	8d 50 ff             	lea    -0x1(%eax),%edx
    17a5:	88 53 0c             	mov    %dl,0xc(%ebx)
    17a8:	84 c0                	test   %al,%al
    17aa:	75 10                	jne    17bc <brelse+0x47>
    17ac:	83 ec 0c             	sub    $0xc,%esp
    17af:	68 f7 00 00 00       	push   $0xf7
    17b4:	e8 fc ff ff ff       	call   17b5 <brelse+0x40>
    17b9:	83 c4 10             	add    $0x10,%esp
    17bc:	83 ec 0c             	sub    $0xc,%esp
    17bf:	68 04 07 00 00       	push   $0x704
    17c4:	e8 fc ff ff ff       	call   17c5 <brelse+0x50>
    17c9:	83 c4 10             	add    $0x10,%esp
    17cc:	83 c4 04             	add    $0x4,%esp
    17cf:	5b                   	pop    %ebx
    17d0:	5e                   	pop    %esi
    17d1:	c3                   	ret    

000017d2 <bread>:
    17d2:	56                   	push   %esi
    17d3:	53                   	push   %ebx
    17d4:	83 ec 0c             	sub    $0xc,%esp
    17d7:	ff 74 24 1c          	pushl  0x1c(%esp)
    17db:	ff 74 24 1c          	pushl  0x1c(%esp)
    17df:	e8 fc ff ff ff       	call   17e0 <bread+0xe>
    17e4:	89 c3                	mov    %eax,%ebx
    17e6:	83 c4 10             	add    $0x10,%esp
    17e9:	85 c0                	test   %eax,%eax
    17eb:	75 10                	jne    17fd <bread+0x2b>
    17ed:	83 ec 0c             	sub    $0xc,%esp
    17f0:	68 12 01 00 00       	push   $0x112
    17f5:	e8 fc ff ff ff       	call   17f6 <bread+0x24>
    17fa:	83 c4 10             	add    $0x10,%esp
    17fd:	80 7b 0a 00          	cmpb   $0x0,0xa(%ebx)
    1801:	75 58                	jne    185b <bread+0x89>
    1803:	83 ec 08             	sub    $0x8,%esp
    1806:	53                   	push   %ebx
    1807:	6a 00                	push   $0x0
    1809:	e8 fc ff ff ff       	call   180a <bread+0x38>
    180e:	fa                   	cli    
    180f:	83 c4 10             	add    $0x10,%esp
    1812:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1816:	74 15                	je     182d <bread+0x5b>
    1818:	8d 73 10             	lea    0x10(%ebx),%esi
    181b:	83 ec 0c             	sub    $0xc,%esp
    181e:	56                   	push   %esi
    181f:	e8 fc ff ff ff       	call   1820 <bread+0x4e>
    1824:	83 c4 10             	add    $0x10,%esp
    1827:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    182b:	75 ee                	jne    181b <bread+0x49>
    182d:	fb                   	sti    
    182e:	89 d8                	mov    %ebx,%eax
    1830:	80 7b 0a 00          	cmpb   $0x0,0xa(%ebx)
    1834:	75 27                	jne    185d <bread+0x8b>
    1836:	83 ec 0c             	sub    $0xc,%esp
    1839:	53                   	push   %ebx
    183a:	e8 fc ff ff ff       	call   183b <bread+0x69>
    183f:	83 c4 08             	add    $0x8,%esp
    1842:	0f b6 43 0a          	movzbl 0xa(%ebx),%eax
    1846:	50                   	push   %eax
    1847:	68 e4 00 00 00       	push   $0xe4
    184c:	e8 fc ff ff ff       	call   184d <bread+0x7b>
    1851:	83 c4 10             	add    $0x10,%esp
    1854:	b8 00 00 00 00       	mov    $0x0,%eax
    1859:	eb 02                	jmp    185d <bread+0x8b>
    185b:	89 d8                	mov    %ebx,%eax
    185d:	83 c4 04             	add    $0x4,%esp
    1860:	5b                   	pop    %ebx
    1861:	5e                   	pop    %esi
    1862:	c3                   	ret    

00001863 <bread_page>:
    1863:	55                   	push   %ebp
    1864:	57                   	push   %edi
    1865:	56                   	push   %esi
    1866:	53                   	push   %ebx
    1867:	83 ec 48             	sub    $0x48,%esp
    186a:	8b 74 24 60          	mov    0x60(%esp),%esi
    186e:	8b 6c 24 64          	mov    0x64(%esp),%ebp
    1872:	8b 44 24 5c          	mov    0x5c(%esp),%eax
    1876:	89 44 24 38          	mov    %eax,0x38(%esp)
    187a:	8d 44 24 38          	lea    0x38(%esp),%eax
    187e:	50                   	push   %eax
    187f:	e8 fc ff ff ff       	call   1880 <bread_page+0x1d>
    1884:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    1888:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    188c:	83 c4 10             	add    $0x10,%esp
    188f:	bb 00 00 00 00       	mov    $0x0,%ebx
    1894:	8b 44 9d 00          	mov    0x0(%ebp,%ebx,4),%eax
    1898:	85 c0                	test   %eax,%eax
    189a:	74 2b                	je     18c7 <bread_page+0x64>
    189c:	83 ec 08             	sub    $0x8,%esp
    189f:	50                   	push   %eax
    18a0:	56                   	push   %esi
    18a1:	e8 fc ff ff ff       	call   18a2 <bread_page+0x3f>
    18a6:	89 44 9c 2c          	mov    %eax,0x2c(%esp,%ebx,4)
    18aa:	83 c4 10             	add    $0x10,%esp
    18ad:	85 c0                	test   %eax,%eax
    18af:	74 1e                	je     18cf <bread_page+0x6c>
    18b1:	80 78 0a 00          	cmpb   $0x0,0xa(%eax)
    18b5:	75 18                	jne    18cf <bread_page+0x6c>
    18b7:	83 ec 08             	sub    $0x8,%esp
    18ba:	50                   	push   %eax
    18bb:	6a 00                	push   $0x0
    18bd:	e8 fc ff ff ff       	call   18be <bread_page+0x5b>
    18c2:	83 c4 10             	add    $0x10,%esp
    18c5:	eb 08                	jmp    18cf <bread_page+0x6c>
    18c7:	c7 44 9c 1c 00 00 00 	movl   $0x0,0x1c(%esp,%ebx,4)
    18ce:	00 
    18cf:	43                   	inc    %ebx
    18d0:	83 fb 04             	cmp    $0x4,%ebx
    18d3:	75 bf                	jne    1894 <bread_page+0x31>
    18d5:	8d 6c 24 1c          	lea    0x1c(%esp),%ebp
    18d9:	8b 5d 00             	mov    0x0(%ebp),%ebx
    18dc:	85 db                	test   %ebx,%ebx
    18de:	74 39                	je     1919 <bread_page+0xb6>
    18e0:	fa                   	cli    
    18e1:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    18e5:	74 15                	je     18fc <bread_page+0x99>
    18e7:	8d 73 10             	lea    0x10(%ebx),%esi
    18ea:	83 ec 0c             	sub    $0xc,%esp
    18ed:	56                   	push   %esi
    18ee:	e8 fc ff ff ff       	call   18ef <bread_page+0x8c>
    18f3:	83 c4 10             	add    $0x10,%esp
    18f6:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    18fa:	75 ee                	jne    18ea <bread_page+0x87>
    18fc:	fb                   	sti    
    18fd:	80 7b 0a 00          	cmpb   $0x0,0xa(%ebx)
    1901:	74 0a                	je     190d <bread_page+0xaa>
    1903:	8b 33                	mov    (%ebx),%esi
    1905:	b9 00 01 00 00       	mov    $0x100,%ecx
    190a:	fc                   	cld    
    190b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    190d:	83 ec 0c             	sub    $0xc,%esp
    1910:	53                   	push   %ebx
    1911:	e8 fc ff ff ff       	call   1912 <bread_page+0xaf>
    1916:	83 c4 10             	add    $0x10,%esp
    1919:	83 c5 04             	add    $0x4,%ebp
    191c:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    1920:	39 e8                	cmp    %ebp,%eax
    1922:	75 b5                	jne    18d9 <bread_page+0x76>
    1924:	83 ec 0c             	sub    $0xc,%esp
    1927:	ff 74 24 18          	pushl  0x18(%esp)
    192b:	e8 fc ff ff ff       	call   192c <bread_page+0xc9>
    1930:	83 c4 4c             	add    $0x4c,%esp
    1933:	5b                   	pop    %ebx
    1934:	5e                   	pop    %esi
    1935:	5f                   	pop    %edi
    1936:	5d                   	pop    %ebp
    1937:	c3                   	ret    

00001938 <breada>:
    1938:	55                   	push   %ebp
    1939:	57                   	push   %edi
    193a:	56                   	push   %esi
    193b:	53                   	push   %ebx
    193c:	83 ec 14             	sub    $0x14,%esp
    193f:	8b 6c 24 28          	mov    0x28(%esp),%ebp
    1943:	ff 74 24 2c          	pushl  0x2c(%esp)
    1947:	55                   	push   %ebp
    1948:	e8 fc ff ff ff       	call   1949 <breada+0x11>
    194d:	89 c7                	mov    %eax,%edi
    194f:	83 c4 10             	add    $0x10,%esp
    1952:	85 c0                	test   %eax,%eax
    1954:	75 10                	jne    1966 <breada+0x2e>
    1956:	83 ec 0c             	sub    $0xc,%esp
    1959:	68 12 01 00 00       	push   $0x112
    195e:	e8 fc ff ff ff       	call   195f <breada+0x27>
    1963:	83 c4 10             	add    $0x10,%esp
    1966:	80 7f 0a 00          	cmpb   $0x0,0xa(%edi)
    196a:	75 0e                	jne    197a <breada+0x42>
    196c:	83 ec 08             	sub    $0x8,%esp
    196f:	57                   	push   %edi
    1970:	6a 00                	push   $0x0
    1972:	e8 fc ff ff ff       	call   1973 <breada+0x3b>
    1977:	83 c4 10             	add    $0x10,%esp
    197a:	8d 74 24 28          	lea    0x28(%esp),%esi
    197e:	eb 2a                	jmp    19aa <breada+0x72>
    1980:	83 ec 08             	sub    $0x8,%esp
    1983:	50                   	push   %eax
    1984:	55                   	push   %ebp
    1985:	e8 fc ff ff ff       	call   1986 <breada+0x4e>
    198a:	89 c3                	mov    %eax,%ebx
    198c:	83 c4 10             	add    $0x10,%esp
    198f:	85 c0                	test   %eax,%eax
    1991:	74 17                	je     19aa <breada+0x72>
    1993:	80 78 0a 00          	cmpb   $0x0,0xa(%eax)
    1997:	75 0e                	jne    19a7 <breada+0x6f>
    1999:	83 ec 08             	sub    $0x8,%esp
    199c:	57                   	push   %edi
    199d:	6a 02                	push   $0x2
    199f:	e8 fc ff ff ff       	call   19a0 <breada+0x68>
    19a4:	83 c4 10             	add    $0x10,%esp
    19a7:	fe 4b 0c             	decb   0xc(%ebx)
    19aa:	83 c6 04             	add    $0x4,%esi
    19ad:	8b 46 fc             	mov    -0x4(%esi),%eax
    19b0:	89 44 24 24          	mov    %eax,0x24(%esp)
    19b4:	85 c0                	test   %eax,%eax
    19b6:	79 c8                	jns    1980 <breada+0x48>
    19b8:	fa                   	cli    
    19b9:	80 7f 0d 00          	cmpb   $0x0,0xd(%edi)
    19bd:	74 15                	je     19d4 <breada+0x9c>
    19bf:	8d 5f 10             	lea    0x10(%edi),%ebx
    19c2:	83 ec 0c             	sub    $0xc,%esp
    19c5:	53                   	push   %ebx
    19c6:	e8 fc ff ff ff       	call   19c7 <breada+0x8f>
    19cb:	83 c4 10             	add    $0x10,%esp
    19ce:	80 7f 0d 00          	cmpb   $0x0,0xd(%edi)
    19d2:	75 ee                	jne    19c2 <breada+0x8a>
    19d4:	fb                   	sti    
    19d5:	89 f8                	mov    %edi,%eax
    19d7:	80 7f 0a 00          	cmpb   $0x0,0xa(%edi)
    19db:	75 11                	jne    19ee <breada+0xb6>
    19dd:	83 ec 0c             	sub    $0xc,%esp
    19e0:	57                   	push   %edi
    19e1:	e8 fc ff ff ff       	call   19e2 <breada+0xaa>
    19e6:	83 c4 10             	add    $0x10,%esp
    19e9:	b8 00 00 00 00       	mov    $0x0,%eax
    19ee:	83 c4 0c             	add    $0xc,%esp
    19f1:	5b                   	pop    %ebx
    19f2:	5e                   	pop    %esi
    19f3:	5f                   	pop    %edi
    19f4:	5d                   	pop    %ebp
    19f5:	c3                   	ret    

000019f6 <buffer_init>:
    19f6:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    19fc:	8b 54 24 04          	mov    0x4(%esp),%edx
    1a00:	c1 e2 0c             	shl    $0xc,%edx
    1a03:	81 fa 00 00 10 00    	cmp    $0x100000,%edx
    1a09:	75 53                	jne    1a5e <buffer_init+0x68>
    1a0b:	ba 00 00 0a 00       	mov    $0xa0000,%edx
    1a10:	eb 4c                	jmp    1a5e <buffer_init+0x68>
    1a12:	66 c7 40 e4 00 00    	movw   $0x0,-0x1c(%eax)
    1a18:	c6 40 e7 00          	movb   $0x0,-0x19(%eax)
    1a1c:	c6 40 e8 00          	movb   $0x0,-0x18(%eax)
    1a20:	c6 40 e9 00          	movb   $0x0,-0x17(%eax)
    1a24:	c6 40 e6 00          	movb   $0x0,-0x1a(%eax)
    1a28:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    1a2f:	c7 40 f4 00 00 00 00 	movl   $0x0,-0xc(%eax)
    1a36:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
    1a3d:	89 50 dc             	mov    %edx,-0x24(%eax)
    1a40:	8d 48 b8             	lea    -0x48(%eax),%ecx
    1a43:	89 48 f8             	mov    %ecx,-0x8(%eax)
    1a46:	89 40 fc             	mov    %eax,-0x4(%eax)
    1a49:	ff 05 00 00 00 00    	incl   0x0
    1a4f:	81 fa 00 00 10 00    	cmp    $0x100000,%edx
    1a55:	75 05                	jne    1a5c <buffer_init+0x66>
    1a57:	ba 00 00 0a 00       	mov    $0xa0000,%edx
    1a5c:	89 c1                	mov    %eax,%ecx
    1a5e:	81 ea 00 04 00 00    	sub    $0x400,%edx
    1a64:	8d 41 24             	lea    0x24(%ecx),%eax
    1a67:	39 c2                	cmp    %eax,%edx
    1a69:	73 a7                	jae    1a12 <buffer_init+0x1c>
    1a6b:	a1 00 00 00 00       	mov    0x0,%eax
    1a70:	a3 08 07 00 00       	mov    %eax,0x708
    1a75:	8d 51 dc             	lea    -0x24(%ecx),%edx
    1a78:	89 50 1c             	mov    %edx,0x1c(%eax)
    1a7b:	89 41 fc             	mov    %eax,-0x4(%ecx)
    1a7e:	b8 00 00 00 00       	mov    $0x0,%eax
    1a83:	ba cc 04 00 00       	mov    $0x4cc,%edx
    1a88:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    1a8e:	83 c0 04             	add    $0x4,%eax
    1a91:	39 d0                	cmp    %edx,%eax
    1a93:	75 f3                	jne    1a88 <buffer_init+0x92>
    1a95:	c3                   	ret    

00001a96 <free_super>:
    1a96:	83 ec 18             	sub    $0x18,%esp
    1a99:	fa                   	cli    
    1a9a:	c6 40 68 00          	movb   $0x0,0x68(%eax)
    1a9e:	83 c0 64             	add    $0x64,%eax
    1aa1:	50                   	push   %eax
    1aa2:	e8 fc ff ff ff       	call   1aa3 <free_super+0xd>
    1aa7:	fb                   	sti    
    1aa8:	83 c4 1c             	add    $0x1c,%esp
    1aab:	c3                   	ret    

00001aac <get_super>:
    1aac:	57                   	push   %edi
    1aad:	56                   	push   %esi
    1aae:	53                   	push   %ebx
    1aaf:	8b 7c 24 10          	mov    0x10(%esp),%edi
    1ab3:	85 ff                	test   %edi,%edi
    1ab5:	74 4b                	je     1b02 <get_super+0x56>
    1ab7:	bb 00 00 00 00       	mov    $0x0,%ebx
    1abc:	0f b7 43 54          	movzwl 0x54(%ebx),%eax
    1ac0:	39 c7                	cmp    %eax,%edi
    1ac2:	75 2c                	jne    1af0 <get_super+0x44>
    1ac4:	fa                   	cli    
    1ac5:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1ac9:	74 15                	je     1ae0 <get_super+0x34>
    1acb:	8d 73 64             	lea    0x64(%ebx),%esi
    1ace:	83 ec 0c             	sub    $0xc,%esp
    1ad1:	56                   	push   %esi
    1ad2:	e8 fc ff ff ff       	call   1ad3 <get_super+0x27>
    1ad7:	83 c4 10             	add    $0x10,%esp
    1ada:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1ade:	75 ee                	jne    1ace <get_super+0x22>
    1ae0:	fb                   	sti    
    1ae1:	0f b7 43 54          	movzwl 0x54(%ebx),%eax
    1ae5:	39 c7                	cmp    %eax,%edi
    1ae7:	74 20                	je     1b09 <get_super+0x5d>
    1ae9:	bb 00 00 00 00       	mov    $0x0,%ebx
    1aee:	eb cc                	jmp    1abc <get_super+0x10>
    1af0:	83 c3 6c             	add    $0x6c,%ebx
    1af3:	81 fb 60 03 00 00    	cmp    $0x360,%ebx
    1af9:	72 c1                	jb     1abc <get_super+0x10>
    1afb:	b8 00 00 00 00       	mov    $0x0,%eax
    1b00:	eb 09                	jmp    1b0b <get_super+0x5f>
    1b02:	b8 00 00 00 00       	mov    $0x0,%eax
    1b07:	eb 02                	jmp    1b0b <get_super+0x5f>
    1b09:	89 d8                	mov    %ebx,%eax
    1b0b:	5b                   	pop    %ebx
    1b0c:	5e                   	pop    %esi
    1b0d:	5f                   	pop    %edi
    1b0e:	c3                   	ret    

00001b0f <read_super>:
    1b0f:	85 c0                	test   %eax,%eax
    1b11:	0f 84 58 02 00 00    	je     1d6f <read_super+0x260>
    1b17:	55                   	push   %ebp
    1b18:	57                   	push   %edi
    1b19:	56                   	push   %esi
    1b1a:	53                   	push   %ebx
    1b1b:	83 ec 28             	sub    $0x28,%esp
    1b1e:	89 c5                	mov    %eax,%ebp
    1b20:	50                   	push   %eax
    1b21:	e8 fc ff ff ff       	call   1b22 <read_super+0x13>
    1b26:	89 2c 24             	mov    %ebp,(%esp)
    1b29:	e8 fc ff ff ff       	call   1b2a <read_super+0x1b>
    1b2e:	83 c4 10             	add    $0x10,%esp
    1b31:	85 c0                	test   %eax,%eax
    1b33:	0f 85 41 02 00 00    	jne    1d7a <read_super+0x26b>
    1b39:	66 83 3d 54 00 00 00 	cmpw   $0x0,0x54
    1b40:	00 
    1b41:	74 1e                	je     1b61 <read_super+0x52>
    1b43:	bb 00 00 00 00       	mov    $0x0,%ebx
    1b48:	eb 07                	jmp    1b51 <read_super+0x42>
    1b4a:	66 83 7b 54 00       	cmpw   $0x0,0x54(%ebx)
    1b4f:	74 15                	je     1b66 <read_super+0x57>
    1b51:	83 c3 6c             	add    $0x6c,%ebx
    1b54:	81 fb 60 03 00 00    	cmp    $0x360,%ebx
    1b5a:	75 ee                	jne    1b4a <read_super+0x3b>
    1b5c:	e9 14 02 00 00       	jmp    1d75 <read_super+0x266>
    1b61:	bb 00 00 00 00       	mov    $0x0,%ebx
    1b66:	66 89 6b 54          	mov    %bp,0x54(%ebx)
    1b6a:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
    1b71:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
    1b78:	c7 43 60 00 00 00 00 	movl   $0x0,0x60(%ebx)
    1b7f:	c6 43 69 00          	movb   $0x0,0x69(%ebx)
    1b83:	c6 43 6a 00          	movb   $0x0,0x6a(%ebx)
    1b87:	fa                   	cli    
    1b88:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1b8c:	74 15                	je     1ba3 <read_super+0x94>
    1b8e:	8d 73 64             	lea    0x64(%ebx),%esi
    1b91:	83 ec 0c             	sub    $0xc,%esp
    1b94:	56                   	push   %esi
    1b95:	e8 fc ff ff ff       	call   1b96 <read_super+0x87>
    1b9a:	83 c4 10             	add    $0x10,%esp
    1b9d:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1ba1:	75 ee                	jne    1b91 <read_super+0x82>
    1ba3:	c6 43 68 01          	movb   $0x1,0x68(%ebx)
    1ba7:	fb                   	sti    
    1ba8:	83 ec 08             	sub    $0x8,%esp
    1bab:	6a 01                	push   $0x1
    1bad:	55                   	push   %ebp
    1bae:	e8 fc ff ff ff       	call   1baf <read_super+0xa0>
    1bb3:	89 c7                	mov    %eax,%edi
    1bb5:	83 c4 10             	add    $0x10,%esp
    1bb8:	85 c0                	test   %eax,%eax
    1bba:	75 17                	jne    1bd3 <read_super+0xc4>
    1bbc:	66 c7 43 54 00 00    	movw   $0x0,0x54(%ebx)
    1bc2:	89 d8                	mov    %ebx,%eax
    1bc4:	e8 cd fe ff ff       	call   1a96 <free_super>
    1bc9:	b8 00 00 00 00       	mov    $0x0,%eax
    1bce:	e9 a7 01 00 00       	jmp    1d7a <read_super+0x26b>
    1bd3:	83 ec 0c             	sub    $0xc,%esp
    1bd6:	68 2f 01 00 00       	push   $0x12f
    1bdb:	e8 fc ff ff ff       	call   1bdc <read_super+0xcd>
    1be0:	89 f8                	mov    %edi,%eax
    1be2:	8b 37                	mov    (%edi),%esi
    1be4:	b9 05 00 00 00       	mov    $0x5,%ecx
    1be9:	89 df                	mov    %ebx,%edi
    1beb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    1bed:	89 04 24             	mov    %eax,(%esp)
    1bf0:	e8 fc ff ff ff       	call   1bf1 <read_super+0xe2>
    1bf5:	83 c4 10             	add    $0x10,%esp
    1bf8:	66 81 7b 10 8f 13    	cmpw   $0x138f,0x10(%ebx)
    1bfe:	74 28                	je     1c28 <read_super+0x119>
    1c00:	66 c7 43 54 00 00    	movw   $0x0,0x54(%ebx)
    1c06:	89 d8                	mov    %ebx,%eax
    1c08:	e8 89 fe ff ff       	call   1a96 <free_super>
    1c0d:	83 ec 08             	sub    $0x8,%esp
    1c10:	55                   	push   %ebp
    1c11:	68 14 01 00 00       	push   $0x114
    1c16:	e8 fc ff ff ff       	call   1c17 <read_super+0x108>
    1c1b:	83 c4 10             	add    $0x10,%esp
    1c1e:	b8 00 00 00 00       	mov    $0x0,%eax
    1c23:	e9 52 01 00 00       	jmp    1d7a <read_super+0x26b>
    1c28:	8d 43 14             	lea    0x14(%ebx),%eax
    1c2b:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c2f:	8d 4b 34             	lea    0x34(%ebx),%ecx
    1c32:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1c36:	89 ca                	mov    %ecx,%edx
    1c38:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    1c3e:	83 c0 04             	add    $0x4,%eax
    1c41:	39 c2                	cmp    %eax,%edx
    1c43:	75 f3                	jne    1c38 <read_super+0x129>
    1c45:	8d 43 54             	lea    0x54(%ebx),%eax
    1c48:	89 c2                	mov    %eax,%edx
    1c4a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1c4e:	8b 44 24 04          	mov    0x4(%esp),%eax
    1c52:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    1c58:	83 c0 04             	add    $0x4,%eax
    1c5b:	39 c2                	cmp    %eax,%edx
    1c5d:	75 f3                	jne    1c52 <read_super+0x143>
    1c5f:	83 ec 04             	sub    $0x4,%esp
    1c62:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1c66:	50                   	push   %eax
    1c67:	0f b7 43 04          	movzwl 0x4(%ebx),%eax
    1c6b:	50                   	push   %eax
    1c6c:	68 3c 01 00 00       	push   $0x13c
    1c71:	e8 fc ff ff ff       	call   1c72 <read_super+0x163>
    1c76:	83 c4 10             	add    $0x10,%esp
    1c79:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
    1c7e:	74 1c                	je     1c9c <read_super+0x18d>
    1c80:	be 02 00 00 00       	mov    $0x2,%esi
    1c85:	83 ec 08             	sub    $0x8,%esp
    1c88:	56                   	push   %esi
    1c89:	55                   	push   %ebp
    1c8a:	e8 fc ff ff ff       	call   1c8b <read_super+0x17c>
    1c8f:	89 44 b3 0c          	mov    %eax,0xc(%ebx,%esi,4)
    1c93:	83 c4 10             	add    $0x10,%esp
    1c96:	85 c0                	test   %eax,%eax
    1c98:	75 15                	jne    1caf <read_super+0x1a0>
    1c9a:	eb 05                	jmp    1ca1 <read_super+0x192>
    1c9c:	be 02 00 00 00       	mov    $0x2,%esi
    1ca1:	bf 00 00 00 00       	mov    $0x0,%edi
    1ca6:	66 83 7b 06 00       	cmpw   $0x0,0x6(%ebx)
    1cab:	75 10                	jne    1cbd <read_super+0x1ae>
    1cad:	eb 2d                	jmp    1cdc <read_super+0x1cd>
    1caf:	46                   	inc    %esi
    1cb0:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
    1cb4:	8d 46 fe             	lea    -0x2(%esi),%eax
    1cb7:	39 c2                	cmp    %eax,%edx
    1cb9:	7f ca                	jg     1c85 <read_super+0x176>
    1cbb:	eb e4                	jmp    1ca1 <read_super+0x192>
    1cbd:	83 ec 08             	sub    $0x8,%esp
    1cc0:	56                   	push   %esi
    1cc1:	55                   	push   %ebp
    1cc2:	e8 fc ff ff ff       	call   1cc3 <read_super+0x1b4>
    1cc7:	89 44 bb 34          	mov    %eax,0x34(%ebx,%edi,4)
    1ccb:	83 c4 10             	add    $0x10,%esp
    1cce:	85 c0                	test   %eax,%eax
    1cd0:	74 0a                	je     1cdc <read_super+0x1cd>
    1cd2:	46                   	inc    %esi
    1cd3:	47                   	inc    %edi
    1cd4:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1cd8:	39 f8                	cmp    %edi,%eax
    1cda:	7f e1                	jg     1cbd <read_super+0x1ae>
    1cdc:	83 ec 04             	sub    $0x4,%esp
    1cdf:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
    1ce3:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1ce7:	8d 44 02 02          	lea    0x2(%edx,%eax,1),%eax
    1ceb:	50                   	push   %eax
    1cec:	56                   	push   %esi
    1ced:	68 4b 01 00 00       	push   $0x14b
    1cf2:	e8 fc ff ff ff       	call   1cf3 <read_super+0x1e4>
    1cf7:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
    1cfb:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1cff:	8d 44 02 02          	lea    0x2(%edx,%eax,1),%eax
    1d03:	83 c4 10             	add    $0x10,%esp
    1d06:	39 f0                	cmp    %esi,%eax
    1d08:	74 4a                	je     1d54 <read_super+0x245>
    1d0a:	8b 74 24 08          	mov    0x8(%esp),%esi
    1d0e:	8b 7c 24 04          	mov    0x4(%esp),%edi
    1d12:	83 ec 0c             	sub    $0xc,%esp
    1d15:	ff 36                	pushl  (%esi)
    1d17:	e8 fc ff ff ff       	call   1d18 <read_super+0x209>
    1d1c:	83 c6 04             	add    $0x4,%esi
    1d1f:	83 c4 10             	add    $0x10,%esp
    1d22:	39 f7                	cmp    %esi,%edi
    1d24:	75 ec                	jne    1d12 <read_super+0x203>
    1d26:	89 fe                	mov    %edi,%esi
    1d28:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    1d2c:	83 ec 0c             	sub    $0xc,%esp
    1d2f:	ff 36                	pushl  (%esi)
    1d31:	e8 fc ff ff ff       	call   1d32 <read_super+0x223>
    1d36:	83 c6 04             	add    $0x4,%esi
    1d39:	83 c4 10             	add    $0x10,%esp
    1d3c:	39 fe                	cmp    %edi,%esi
    1d3e:	75 ec                	jne    1d2c <read_super+0x21d>
    1d40:	66 c7 43 54 00 00    	movw   $0x0,0x54(%ebx)
    1d46:	89 d8                	mov    %ebx,%eax
    1d48:	e8 49 fd ff ff       	call   1a96 <free_super>
    1d4d:	b8 00 00 00 00       	mov    $0x0,%eax
    1d52:	eb 26                	jmp    1d7a <read_super+0x26b>
    1d54:	8b 43 14             	mov    0x14(%ebx),%eax
    1d57:	8b 00                	mov    (%eax),%eax
    1d59:	80 08 01             	orb    $0x1,(%eax)
    1d5c:	8b 43 34             	mov    0x34(%ebx),%eax
    1d5f:	8b 00                	mov    (%eax),%eax
    1d61:	80 08 01             	orb    $0x1,(%eax)
    1d64:	89 d8                	mov    %ebx,%eax
    1d66:	e8 2b fd ff ff       	call   1a96 <free_super>
    1d6b:	89 d8                	mov    %ebx,%eax
    1d6d:	eb 0b                	jmp    1d7a <read_super+0x26b>
    1d6f:	b8 00 00 00 00       	mov    $0x0,%eax
    1d74:	c3                   	ret    
    1d75:	b8 00 00 00 00       	mov    $0x0,%eax
    1d7a:	83 c4 1c             	add    $0x1c,%esp
    1d7d:	5b                   	pop    %ebx
    1d7e:	5e                   	pop    %esi
    1d7f:	5f                   	pop    %edi
    1d80:	5d                   	pop    %ebp
    1d81:	c3                   	ret    

00001d82 <put_super>:
    1d82:	57                   	push   %edi
    1d83:	56                   	push   %esi
    1d84:	53                   	push   %ebx
    1d85:	8b 44 24 10          	mov    0x10(%esp),%eax
    1d89:	39 05 00 00 00 00    	cmp    %eax,0x0
    1d8f:	75 15                	jne    1da6 <put_super+0x24>
    1d91:	83 ec 0c             	sub    $0xc,%esp
    1d94:	68 60 01 00 00       	push   $0x160
    1d99:	e8 fc ff ff ff       	call   1d9a <put_super+0x18>
    1d9e:	83 c4 10             	add    $0x10,%esp
    1da1:	e9 89 00 00 00       	jmp    1e2f <put_super+0xad>
    1da6:	83 ec 0c             	sub    $0xc,%esp
    1da9:	50                   	push   %eax
    1daa:	e8 fc ff ff ff       	call   1dab <put_super+0x29>
    1daf:	89 c7                	mov    %eax,%edi
    1db1:	83 c4 10             	add    $0x10,%esp
    1db4:	85 c0                	test   %eax,%eax
    1db6:	74 77                	je     1e2f <put_super+0xad>
    1db8:	83 78 5c 00          	cmpl   $0x0,0x5c(%eax)
    1dbc:	74 12                	je     1dd0 <put_super+0x4e>
    1dbe:	83 ec 0c             	sub    $0xc,%esp
    1dc1:	68 90 01 00 00       	push   $0x190
    1dc6:	e8 fc ff ff ff       	call   1dc7 <put_super+0x45>
    1dcb:	83 c4 10             	add    $0x10,%esp
    1dce:	eb 5f                	jmp    1e2f <put_super+0xad>
    1dd0:	fa                   	cli    
    1dd1:	80 78 68 00          	cmpb   $0x0,0x68(%eax)
    1dd5:	74 15                	je     1dec <put_super+0x6a>
    1dd7:	8d 58 64             	lea    0x64(%eax),%ebx
    1dda:	83 ec 0c             	sub    $0xc,%esp
    1ddd:	53                   	push   %ebx
    1dde:	e8 fc ff ff ff       	call   1ddf <put_super+0x5d>
    1de3:	83 c4 10             	add    $0x10,%esp
    1de6:	80 7f 68 00          	cmpb   $0x0,0x68(%edi)
    1dea:	75 ee                	jne    1dda <put_super+0x58>
    1dec:	c6 47 68 01          	movb   $0x1,0x68(%edi)
    1df0:	fb                   	sti    
    1df1:	66 c7 47 54 00 00    	movw   $0x0,0x54(%edi)
    1df7:	8d 77 14             	lea    0x14(%edi),%esi
    1dfa:	8d 5f 34             	lea    0x34(%edi),%ebx
    1dfd:	83 ec 0c             	sub    $0xc,%esp
    1e00:	ff 36                	pushl  (%esi)
    1e02:	e8 fc ff ff ff       	call   1e03 <put_super+0x81>
    1e07:	83 c6 04             	add    $0x4,%esi
    1e0a:	83 c4 10             	add    $0x10,%esp
    1e0d:	39 de                	cmp    %ebx,%esi
    1e0f:	75 ec                	jne    1dfd <put_super+0x7b>
    1e11:	8d 77 54             	lea    0x54(%edi),%esi
    1e14:	83 ec 0c             	sub    $0xc,%esp
    1e17:	ff 33                	pushl  (%ebx)
    1e19:	e8 fc ff ff ff       	call   1e1a <put_super+0x98>
    1e1e:	83 c3 04             	add    $0x4,%ebx
    1e21:	83 c4 10             	add    $0x10,%esp
    1e24:	39 de                	cmp    %ebx,%esi
    1e26:	75 ec                	jne    1e14 <put_super+0x92>
    1e28:	89 f8                	mov    %edi,%eax
    1e2a:	e8 67 fc ff ff       	call   1a96 <free_super>
    1e2f:	5b                   	pop    %ebx
    1e30:	5e                   	pop    %esi
    1e31:	5f                   	pop    %edi
    1e32:	c3                   	ret    

00001e33 <sys_umount>:
    1e33:	56                   	push   %esi
    1e34:	53                   	push   %ebx
    1e35:	83 ec 10             	sub    $0x10,%esp
    1e38:	ff 74 24 1c          	pushl  0x1c(%esp)
    1e3c:	e8 fc ff ff ff       	call   1e3d <sys_umount+0xa>
    1e41:	83 c4 10             	add    $0x10,%esp
    1e44:	85 c0                	test   %eax,%eax
    1e46:	0f 84 db 00 00 00    	je     1f27 <sys_umount+0xf4>
    1e4c:	0f b7 58 0e          	movzwl 0xe(%eax),%ebx
    1e50:	8b 10                	mov    (%eax),%edx
    1e52:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    1e58:	66 81 fa 00 60       	cmp    $0x6000,%dx
    1e5d:	74 16                	je     1e75 <sys_umount+0x42>
    1e5f:	83 ec 0c             	sub    $0xc,%esp
    1e62:	50                   	push   %eax
    1e63:	e8 fc ff ff ff       	call   1e64 <sys_umount+0x31>
    1e68:	83 c4 10             	add    $0x10,%esp
    1e6b:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
    1e70:	e9 d3 00 00 00       	jmp    1f48 <sys_umount+0x115>
    1e75:	83 ec 0c             	sub    $0xc,%esp
    1e78:	50                   	push   %eax
    1e79:	e8 fc ff ff ff       	call   1e7a <sys_umount+0x47>
    1e7e:	83 c4 10             	add    $0x10,%esp
    1e81:	3b 1d 00 00 00 00    	cmp    0x0,%ebx
    1e87:	0f 84 a1 00 00 00    	je     1f2e <sys_umount+0xfb>
    1e8d:	83 ec 0c             	sub    $0xc,%esp
    1e90:	53                   	push   %ebx
    1e91:	e8 fc ff ff ff       	call   1e92 <sys_umount+0x5f>
    1e96:	89 c6                	mov    %eax,%esi
    1e98:	83 c4 10             	add    $0x10,%esp
    1e9b:	85 c0                	test   %eax,%eax
    1e9d:	0f 84 92 00 00 00    	je     1f35 <sys_umount+0x102>
    1ea3:	8b 40 5c             	mov    0x5c(%eax),%eax
    1ea6:	85 c0                	test   %eax,%eax
    1ea8:	0f 84 8e 00 00 00    	je     1f3c <sys_umount+0x109>
    1eae:	80 78 35 00          	cmpb   $0x0,0x35(%eax)
    1eb2:	75 10                	jne    1ec4 <sys_umount+0x91>
    1eb4:	83 ec 0c             	sub    $0xc,%esp
    1eb7:	68 67 01 00 00       	push   $0x167
    1ebc:	e8 fc ff ff ff       	call   1ebd <sys_umount+0x8a>
    1ec1:	83 c4 10             	add    $0x10,%esp
    1ec4:	b8 00 00 00 00       	mov    $0x0,%eax
    1ec9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
    1ecd:	39 d3                	cmp    %edx,%ebx
    1ecf:	75 07                	jne    1ed8 <sys_umount+0xa5>
    1ed1:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    1ed6:	75 6b                	jne    1f43 <sys_umount+0x110>
    1ed8:	83 c0 38             	add    $0x38,%eax
    1edb:	3d 00 07 00 00       	cmp    $0x700,%eax
    1ee0:	75 e7                	jne    1ec9 <sys_umount+0x96>
    1ee2:	8b 46 5c             	mov    0x5c(%esi),%eax
    1ee5:	c6 40 35 00          	movb   $0x0,0x35(%eax)
    1ee9:	83 ec 0c             	sub    $0xc,%esp
    1eec:	ff 76 5c             	pushl  0x5c(%esi)
    1eef:	e8 fc ff ff ff       	call   1ef0 <sys_umount+0xbd>
    1ef4:	c7 46 5c 00 00 00 00 	movl   $0x0,0x5c(%esi)
    1efb:	83 c4 04             	add    $0x4,%esp
    1efe:	ff 76 58             	pushl  0x58(%esi)
    1f01:	e8 fc ff ff ff       	call   1f02 <sys_umount+0xcf>
    1f06:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
    1f0d:	89 1c 24             	mov    %ebx,(%esp)
    1f10:	e8 fc ff ff ff       	call   1f11 <sys_umount+0xde>
    1f15:	89 1c 24             	mov    %ebx,(%esp)
    1f18:	e8 fc ff ff ff       	call   1f19 <sys_umount+0xe6>
    1f1d:	83 c4 10             	add    $0x10,%esp
    1f20:	b8 00 00 00 00       	mov    $0x0,%eax
    1f25:	eb 21                	jmp    1f48 <sys_umount+0x115>
    1f27:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1f2c:	eb 1a                	jmp    1f48 <sys_umount+0x115>
    1f2e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    1f33:	eb 13                	jmp    1f48 <sys_umount+0x115>
    1f35:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1f3a:	eb 0c                	jmp    1f48 <sys_umount+0x115>
    1f3c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1f41:	eb 05                	jmp    1f48 <sys_umount+0x115>
    1f43:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    1f48:	83 c4 04             	add    $0x4,%esp
    1f4b:	5b                   	pop    %ebx
    1f4c:	5e                   	pop    %esi
    1f4d:	c3                   	ret    

00001f4e <sys_mount>:
    1f4e:	56                   	push   %esi
    1f4f:	53                   	push   %ebx
    1f50:	83 ec 10             	sub    $0x10,%esp
    1f53:	ff 74 24 1c          	pushl  0x1c(%esp)
    1f57:	e8 fc ff ff ff       	call   1f58 <sys_mount+0xa>
    1f5c:	83 c4 10             	add    $0x10,%esp
    1f5f:	85 c0                	test   %eax,%eax
    1f61:	0f 84 f1 00 00 00    	je     2058 <sys_mount+0x10a>
    1f67:	0f b7 70 0e          	movzwl 0xe(%eax),%esi
    1f6b:	8b 10                	mov    (%eax),%edx
    1f6d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    1f73:	66 81 fa 00 60       	cmp    $0x6000,%dx
    1f78:	74 16                	je     1f90 <sys_mount+0x42>
    1f7a:	83 ec 0c             	sub    $0xc,%esp
    1f7d:	50                   	push   %eax
    1f7e:	e8 fc ff ff ff       	call   1f7f <sys_mount+0x31>
    1f83:	83 c4 10             	add    $0x10,%esp
    1f86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f8b:	e9 d4 00 00 00       	jmp    2064 <sys_mount+0x116>
    1f90:	83 ec 0c             	sub    $0xc,%esp
    1f93:	50                   	push   %eax
    1f94:	e8 fc ff ff ff       	call   1f95 <sys_mount+0x47>
    1f99:	83 c4 04             	add    $0x4,%esp
    1f9c:	ff 74 24 20          	pushl  0x20(%esp)
    1fa0:	e8 fc ff ff ff       	call   1fa1 <sys_mount+0x53>
    1fa5:	89 c3                	mov    %eax,%ebx
    1fa7:	83 c4 10             	add    $0x10,%esp
    1faa:	85 c0                	test   %eax,%eax
    1fac:	0f 84 ad 00 00 00    	je     205f <sys_mount+0x111>
    1fb2:	66 83 78 30 01       	cmpw   $0x1,0x30(%eax)
    1fb7:	75 07                	jne    1fc0 <sys_mount+0x72>
    1fb9:	66 83 78 2e 01       	cmpw   $0x1,0x2e(%eax)
    1fbe:	75 16                	jne    1fd6 <sys_mount+0x88>
    1fc0:	83 ec 0c             	sub    $0xc,%esp
    1fc3:	53                   	push   %ebx
    1fc4:	e8 fc ff ff ff       	call   1fc5 <sys_mount+0x77>
    1fc9:	83 c4 10             	add    $0x10,%esp
    1fcc:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    1fd1:	e9 8e 00 00 00       	jmp    2064 <sys_mount+0x116>
    1fd6:	8b 00                	mov    (%eax),%eax
    1fd8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    1fdd:	66 3d 00 40          	cmp    $0x4000,%ax
    1fe1:	74 13                	je     1ff6 <sys_mount+0xa8>
    1fe3:	83 ec 0c             	sub    $0xc,%esp
    1fe6:	53                   	push   %ebx
    1fe7:	e8 fc ff ff ff       	call   1fe8 <sys_mount+0x9a>
    1fec:	83 c4 10             	add    $0x10,%esp
    1fef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ff4:	eb 6e                	jmp    2064 <sys_mount+0x116>
    1ff6:	89 f0                	mov    %esi,%eax
    1ff8:	e8 12 fb ff ff       	call   1b0f <read_super>
    1ffd:	85 c0                	test   %eax,%eax
    1fff:	75 13                	jne    2014 <sys_mount+0xc6>
    2001:	83 ec 0c             	sub    $0xc,%esp
    2004:	53                   	push   %ebx
    2005:	e8 fc ff ff ff       	call   2006 <sys_mount+0xb8>
    200a:	83 c4 10             	add    $0x10,%esp
    200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    2012:	eb 50                	jmp    2064 <sys_mount+0x116>
    2014:	83 78 5c 00          	cmpl   $0x0,0x5c(%eax)
    2018:	74 13                	je     202d <sys_mount+0xdf>
    201a:	83 ec 0c             	sub    $0xc,%esp
    201d:	53                   	push   %ebx
    201e:	e8 fc ff ff ff       	call   201f <sys_mount+0xd1>
    2023:	83 c4 10             	add    $0x10,%esp
    2026:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    202b:	eb 37                	jmp    2064 <sys_mount+0x116>
    202d:	80 7b 35 00          	cmpb   $0x0,0x35(%ebx)
    2031:	74 13                	je     2046 <sys_mount+0xf8>
    2033:	83 ec 0c             	sub    $0xc,%esp
    2036:	53                   	push   %ebx
    2037:	e8 fc ff ff ff       	call   2038 <sys_mount+0xea>
    203c:	83 c4 10             	add    $0x10,%esp
    203f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2044:	eb 1e                	jmp    2064 <sys_mount+0x116>
    2046:	89 58 5c             	mov    %ebx,0x5c(%eax)
    2049:	c6 43 35 01          	movb   $0x1,0x35(%ebx)
    204d:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    2051:	b8 00 00 00 00       	mov    $0x0,%eax
    2056:	eb 0c                	jmp    2064 <sys_mount+0x116>
    2058:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    205d:	eb 05                	jmp    2064 <sys_mount+0x116>
    205f:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    2064:	83 c4 04             	add    $0x4,%esp
    2067:	5b                   	pop    %ebx
    2068:	5e                   	pop    %esi
    2069:	c3                   	ret    

0000206a <mount_root>:
    206a:	b8 04 00 00 00       	mov    $0x4,%eax
    206f:	ba 04 04 00 00       	mov    $0x404,%edx
    2074:	66 c7 00 00 00       	movw   $0x0,(%eax)
    2079:	83 c0 10             	add    $0x10,%eax
    207c:	39 c2                	cmp    %eax,%edx
    207e:	75 f4                	jne    2074 <mount_root+0xa>
    2080:	55                   	push   %ebp
    2081:	57                   	push   %edi
    2082:	56                   	push   %esi
    2083:	53                   	push   %ebx
    2084:	83 ec 0c             	sub    $0xc,%esp
    2087:	a1 00 00 00 00       	mov    0x0,%eax
    208c:	c1 e8 08             	shr    $0x8,%eax
    208f:	83 f8 02             	cmp    $0x2,%eax
    2092:	75 15                	jne    20a9 <mount_root+0x3f>
    2094:	83 ec 0c             	sub    $0xc,%esp
    2097:	68 b4 01 00 00       	push   $0x1b4
    209c:	e8 fc ff ff ff       	call   209d <mount_root+0x33>
    20a1:	e8 fc ff ff ff       	call   20a2 <mount_root+0x38>
    20a6:	83 c4 10             	add    $0x10,%esp
    20a9:	b8 00 00 00 00       	mov    $0x0,%eax
    20ae:	66 c7 40 54 00 00    	movw   $0x0,0x54(%eax)
    20b4:	c6 40 68 00          	movb   $0x0,0x68(%eax)
    20b8:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
    20bf:	83 c0 6c             	add    $0x6c,%eax
    20c2:	3d 60 03 00 00       	cmp    $0x360,%eax
    20c7:	75 e5                	jne    20ae <mount_root+0x44>
    20c9:	a1 00 00 00 00       	mov    0x0,%eax
    20ce:	e8 3c fa ff ff       	call   1b0f <read_super>
    20d3:	89 c6                	mov    %eax,%esi
    20d5:	85 c0                	test   %eax,%eax
    20d7:	75 10                	jne    20e9 <mount_root+0x7f>
    20d9:	83 ec 0c             	sub    $0xc,%esp
    20dc:	68 84 01 00 00       	push   $0x184
    20e1:	e8 fc ff ff ff       	call   20e2 <mount_root+0x78>
    20e6:	83 c4 10             	add    $0x10,%esp
    20e9:	83 ec 08             	sub    $0x8,%esp
    20ec:	0f b7 46 10          	movzwl 0x10(%esi),%eax
    20f0:	50                   	push   %eax
    20f1:	68 9c 01 00 00       	push   $0x19c
    20f6:	e8 fc ff ff ff       	call   20f7 <mount_root+0x8d>
    20fb:	83 c4 08             	add    $0x8,%esp
    20fe:	6a 01                	push   $0x1
    2100:	ff 35 00 00 00 00    	pushl  0x0
    2106:	e8 fc ff ff ff       	call   2107 <mount_root+0x9d>
    210b:	89 c3                	mov    %eax,%ebx
    210d:	83 c4 10             	add    $0x10,%esp
    2110:	85 c0                	test   %eax,%eax
    2112:	75 10                	jne    2124 <mount_root+0xba>
    2114:	83 ec 0c             	sub    $0xc,%esp
    2117:	68 a9 01 00 00       	push   $0x1a9
    211c:	e8 fc ff ff ff       	call   211d <mount_root+0xb3>
    2121:	83 c4 10             	add    $0x10,%esp
    2124:	66 83 43 30 03       	addw   $0x3,0x30(%ebx)
    2129:	89 5e 5c             	mov    %ebx,0x5c(%esi)
    212c:	89 5e 58             	mov    %ebx,0x58(%esi)
    212f:	a1 00 00 00 00       	mov    0x0,%eax
    2134:	89 98 70 02 00 00    	mov    %ebx,0x270(%eax)
    213a:	89 98 74 02 00 00    	mov    %ebx,0x274(%eax)
    2140:	0f b7 5e 02          	movzwl 0x2(%esi),%ebx
    2144:	83 ec 08             	sub    $0x8,%esp
    2147:	53                   	push   %ebx
    2148:	68 c7 01 00 00       	push   $0x1c7
    214d:	e8 fc ff ff ff       	call   214e <mount_root+0xe4>
    2152:	83 c4 10             	add    $0x10,%esp
    2155:	ba 00 00 00 00       	mov    $0x0,%edx
    215a:	bf 00 00 00 00       	mov    $0x0,%edi
    215f:	eb 22                	jmp    2183 <mount_root+0x119>
    2161:	89 d9                	mov    %ebx,%ecx
    2163:	81 e1 ff 1f 00 00    	and    $0x1fff,%ecx
    2169:	89 d8                	mov    %ebx,%eax
    216b:	c1 f8 0d             	sar    $0xd,%eax
    216e:	8b 44 86 34          	mov    0x34(%esi,%eax,4),%eax
    2172:	8b 28                	mov    (%eax),%ebp
    2174:	89 f8                	mov    %edi,%eax
    2176:	0f a3 4d 00          	bt     %ecx,0x0(%ebp)
    217a:	0f 92 c0             	setb   %al
    217d:	83 f8 01             	cmp    $0x1,%eax
    2180:	83 d2 00             	adc    $0x0,%edx
    2183:	4b                   	dec    %ebx
    2184:	79 db                	jns    2161 <mount_root+0xf7>
    2186:	83 ec 04             	sub    $0x4,%esp
    2189:	0f b7 46 02          	movzwl 0x2(%esi),%eax
    218d:	50                   	push   %eax
    218e:	52                   	push   %edx
    218f:	68 d7 01 00 00       	push   $0x1d7
    2194:	e8 fc ff ff ff       	call   2195 <mount_root+0x12b>
    2199:	0f b7 16             	movzwl (%esi),%edx
    219c:	42                   	inc    %edx
    219d:	83 c4 10             	add    $0x10,%esp
    21a0:	b9 00 00 00 00       	mov    $0x0,%ecx
    21a5:	bf 00 00 00 00       	mov    $0x0,%edi
    21aa:	eb 22                	jmp    21ce <mount_root+0x164>
    21ac:	89 d3                	mov    %edx,%ebx
    21ae:	81 e3 ff 1f 00 00    	and    $0x1fff,%ebx
    21b4:	89 d0                	mov    %edx,%eax
    21b6:	c1 f8 0d             	sar    $0xd,%eax
    21b9:	8b 44 86 14          	mov    0x14(%esi,%eax,4),%eax
    21bd:	8b 28                	mov    (%eax),%ebp
    21bf:	89 f8                	mov    %edi,%eax
    21c1:	0f a3 5d 00          	bt     %ebx,0x0(%ebp)
    21c5:	0f 92 c0             	setb   %al
    21c8:	83 f8 01             	cmp    $0x1,%eax
    21cb:	83 d1 00             	adc    $0x0,%ecx
    21ce:	4a                   	dec    %edx
    21cf:	79 db                	jns    21ac <mount_root+0x142>
    21d1:	83 ec 04             	sub    $0x4,%esp
    21d4:	0f b7 06             	movzwl (%esi),%eax
    21d7:	50                   	push   %eax
    21d8:	51                   	push   %ecx
    21d9:	68 ed 01 00 00       	push   $0x1ed
    21de:	e8 fc ff ff ff       	call   21df <mount_root+0x175>
    21e3:	83 c4 1c             	add    $0x1c,%esp
    21e6:	5b                   	pop    %ebx
    21e7:	5e                   	pop    %esi
    21e8:	5f                   	pop    %edi
    21e9:	5d                   	pop    %ebp
    21ea:	c3                   	ret    

000021eb <block_write>:
    21eb:	55                   	push   %ebp
    21ec:	57                   	push   %edi
    21ed:	56                   	push   %esi
    21ee:	53                   	push   %ebx
    21ef:	83 ec 1c             	sub    $0x1c,%esp
    21f2:	8b 44 24 34          	mov    0x34(%esp),%eax
    21f6:	8b 30                	mov    (%eax),%esi
    21f8:	89 f0                	mov    %esi,%eax
    21fa:	c1 f8 0a             	sar    $0xa,%eax
    21fd:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
    2203:	83 7c 24 3c 00       	cmpl   $0x0,0x3c(%esp)
    2208:	0f 8e ec 00 00 00    	jle    22fa <block_write+0x10f>
    220e:	8d 68 01             	lea    0x1(%eax),%ebp
    2211:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2218:	00 
    2219:	8d 55 ff             	lea    -0x1(%ebp),%edx
    221c:	b8 00 04 00 00       	mov    $0x400,%eax
    2221:	29 f0                	sub    %esi,%eax
    2223:	89 c3                	mov    %eax,%ebx
    2225:	3b 44 24 3c          	cmp    0x3c(%esp),%eax
    2229:	7e 04                	jle    222f <block_write+0x44>
    222b:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
    222f:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
    2235:	75 1a                	jne    2251 <block_write+0x66>
    2237:	83 ec 08             	sub    $0x8,%esp
    223a:	52                   	push   %edx
    223b:	ff 74 24 3c          	pushl  0x3c(%esp)
    223f:	e8 fc ff ff ff       	call   2240 <block_write+0x55>
    2244:	83 c4 10             	add    $0x10,%esp
    2247:	85 c0                	test   %eax,%eax
    2249:	0f 85 b9 00 00 00    	jne    2308 <block_write+0x11d>
    224f:	eb 1b                	jmp    226c <block_write+0x81>
    2251:	83 ec 0c             	sub    $0xc,%esp
    2254:	6a ff                	push   $0xffffffff
    2256:	8d 45 01             	lea    0x1(%ebp),%eax
    2259:	50                   	push   %eax
    225a:	55                   	push   %ebp
    225b:	52                   	push   %edx
    225c:	ff 74 24 4c          	pushl  0x4c(%esp)
    2260:	e8 fc ff ff ff       	call   2261 <block_write+0x76>
    2265:	83 c4 20             	add    $0x20,%esp
    2268:	85 c0                	test   %eax,%eax
    226a:	75 11                	jne    227d <block_write+0x92>
    226c:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2270:	85 c0                	test   %eax,%eax
    2272:	0f 84 89 00 00 00    	je     2301 <block_write+0x116>
    2278:	e9 b4 00 00 00       	jmp    2331 <block_write+0x146>
    227d:	03 30                	add    (%eax),%esi
    227f:	8b 7c 24 34          	mov    0x34(%esp),%edi
    2283:	01 1f                	add    %ebx,(%edi)
    2285:	01 5c 24 0c          	add    %ebx,0xc(%esp)
    2289:	29 5c 24 3c          	sub    %ebx,0x3c(%esp)
    228d:	8d 7b ff             	lea    -0x1(%ebx),%edi
    2290:	89 7c 24 08          	mov    %edi,0x8(%esp)
    2294:	85 db                	test   %ebx,%ebx
    2296:	7e 3b                	jle    22d3 <block_write+0xe8>
    2298:	8b 4c 24 38          	mov    0x38(%esp),%ecx
    229c:	ba 00 00 00 00       	mov    $0x0,%edx
    22a1:	8b 7c 24 08          	mov    0x8(%esp),%edi
    22a5:	47                   	inc    %edi
    22a6:	64 8a 19             	mov    %fs:(%ecx),%bl
    22a9:	88 1c 16             	mov    %bl,(%esi,%edx,1)
    22ac:	42                   	inc    %edx
    22ad:	89 fb                	mov    %edi,%ebx
    22af:	29 d3                	sub    %edx,%ebx
    22b1:	8d 49 01             	lea    0x1(%ecx),%ecx
    22b4:	85 db                	test   %ebx,%ebx
    22b6:	7f ee                	jg     22a6 <block_write+0xbb>
    22b8:	8b 7c 24 08          	mov    0x8(%esp),%edi
    22bc:	89 fa                	mov    %edi,%edx
    22be:	85 ff                	test   %edi,%edi
    22c0:	79 05                	jns    22c7 <block_write+0xdc>
    22c2:	ba 00 00 00 00       	mov    $0x0,%edx
    22c7:	8b 74 24 38          	mov    0x38(%esp),%esi
    22cb:	8d 74 16 01          	lea    0x1(%esi,%edx,1),%esi
    22cf:	89 74 24 38          	mov    %esi,0x38(%esp)
    22d3:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    22d7:	83 ec 0c             	sub    $0xc,%esp
    22da:	50                   	push   %eax
    22db:	e8 fc ff ff ff       	call   22dc <block_write+0xf1>
    22e0:	45                   	inc    %ebp
    22e1:	be 00 00 00 00       	mov    $0x0,%esi
    22e6:	83 c4 10             	add    $0x10,%esp
    22e9:	83 7c 24 3c 00       	cmpl   $0x0,0x3c(%esp)
    22ee:	0f 8f 25 ff ff ff    	jg     2219 <block_write+0x2e>
    22f4:	8b 44 24 0c          	mov    0xc(%esp),%eax
    22f8:	eb 37                	jmp    2331 <block_write+0x146>
    22fa:	b8 00 00 00 00       	mov    $0x0,%eax
    22ff:	eb 30                	jmp    2331 <block_write+0x146>
    2301:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
    2306:	eb 29                	jmp    2331 <block_write+0x146>
    2308:	03 30                	add    (%eax),%esi
    230a:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    230e:	81 01 00 04 00 00    	addl   $0x400,(%ecx)
    2314:	81 44 24 0c 00 04 00 	addl   $0x400,0xc(%esp)
    231b:	00 
    231c:	81 6c 24 3c 00 04 00 	subl   $0x400,0x3c(%esp)
    2323:	00 
    2324:	c7 44 24 08 ff 03 00 	movl   $0x3ff,0x8(%esp)
    232b:	00 
    232c:	e9 67 ff ff ff       	jmp    2298 <block_write+0xad>
    2331:	83 c4 1c             	add    $0x1c,%esp
    2334:	5b                   	pop    %ebx
    2335:	5e                   	pop    %esi
    2336:	5f                   	pop    %edi
    2337:	5d                   	pop    %ebp
    2338:	c3                   	ret    

00002339 <block_read>:
    2339:	55                   	push   %ebp
    233a:	57                   	push   %edi
    233b:	56                   	push   %esi
    233c:	53                   	push   %ebx
    233d:	83 ec 1c             	sub    $0x1c,%esp
    2340:	8b 74 24 38          	mov    0x38(%esp),%esi
    2344:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
    2348:	8b 44 24 34          	mov    0x34(%esp),%eax
    234c:	8b 18                	mov    (%eax),%ebx
    234e:	89 d8                	mov    %ebx,%eax
    2350:	c1 e8 0a             	shr    $0xa,%eax
    2353:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
    2359:	85 ed                	test   %ebp,%ebp
    235b:	0f 8e 88 00 00 00    	jle    23e9 <block_read+0xb0>
    2361:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2368:	00 
    2369:	ba 00 04 00 00       	mov    $0x400,%edx
    236e:	29 da                	sub    %ebx,%edx
    2370:	89 d7                	mov    %edx,%edi
    2372:	39 ea                	cmp    %ebp,%edx
    2374:	7e 02                	jle    2378 <block_read+0x3f>
    2376:	89 ef                	mov    %ebp,%edi
    2378:	8d 48 01             	lea    0x1(%eax),%ecx
    237b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    237f:	83 ec 0c             	sub    $0xc,%esp
    2382:	6a ff                	push   $0xffffffff
    2384:	8d 50 02             	lea    0x2(%eax),%edx
    2387:	52                   	push   %edx
    2388:	51                   	push   %ecx
    2389:	50                   	push   %eax
    238a:	ff 74 24 4c          	pushl  0x4c(%esp)
    238e:	e8 fc ff ff ff       	call   238f <block_read+0x56>
    2393:	83 c4 20             	add    $0x20,%esp
    2396:	85 c0                	test   %eax,%eax
    2398:	75 0a                	jne    23a4 <block_read+0x6b>
    239a:	8b 44 24 0c          	mov    0xc(%esp),%eax
    239e:	85 c0                	test   %eax,%eax
    23a0:	74 4e                	je     23f0 <block_read+0xb7>
    23a2:	eb 51                	jmp    23f5 <block_read+0xbc>
    23a4:	03 18                	add    (%eax),%ebx
    23a6:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    23aa:	01 39                	add    %edi,(%ecx)
    23ac:	01 7c 24 0c          	add    %edi,0xc(%esp)
    23b0:	29 fd                	sub    %edi,%ebp
    23b2:	85 ff                	test   %edi,%edi
    23b4:	7e 14                	jle    23ca <block_read+0x91>
    23b6:	01 f7                	add    %esi,%edi
    23b8:	8d 56 01             	lea    0x1(%esi),%edx
    23bb:	43                   	inc    %ebx
    23bc:	8a 4b ff             	mov    -0x1(%ebx),%cl
    23bf:	64 88 0e             	mov    %cl,%fs:(%esi)
    23c2:	89 d6                	mov    %edx,%esi
    23c4:	39 d7                	cmp    %edx,%edi
    23c6:	75 f0                	jne    23b8 <block_read+0x7f>
    23c8:	89 fe                	mov    %edi,%esi
    23ca:	83 ec 0c             	sub    $0xc,%esp
    23cd:	50                   	push   %eax
    23ce:	e8 fc ff ff ff       	call   23cf <block_read+0x96>
    23d3:	8b 44 24 18          	mov    0x18(%esp),%eax
    23d7:	bb 00 00 00 00       	mov    $0x0,%ebx
    23dc:	83 c4 10             	add    $0x10,%esp
    23df:	85 ed                	test   %ebp,%ebp
    23e1:	7f 86                	jg     2369 <block_read+0x30>
    23e3:	8b 44 24 0c          	mov    0xc(%esp),%eax
    23e7:	eb 0c                	jmp    23f5 <block_read+0xbc>
    23e9:	b8 00 00 00 00       	mov    $0x0,%eax
    23ee:	eb 05                	jmp    23f5 <block_read+0xbc>
    23f0:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
    23f5:	83 c4 1c             	add    $0x1c,%esp
    23f8:	5b                   	pop    %ebx
    23f9:	5e                   	pop    %esi
    23fa:	5f                   	pop    %edi
    23fb:	5d                   	pop    %ebp
    23fc:	c3                   	ret    

000023fd <rw_memory>:
    23fd:	57                   	push   %edi
    23fe:	56                   	push   %esi
    23ff:	53                   	push   %ebx
    2400:	8b 74 24 10          	mov    0x10(%esp),%esi
    2404:	83 7c 24 14 03       	cmpl   $0x3,0x14(%esp)
    2409:	74 09                	je     2414 <rw_memory+0x17>
    240b:	83 7c 24 14 04       	cmpl   $0x4,0x14(%esp)
    2410:	75 64                	jne    2476 <rw_memory+0x79>
    2412:	eb 0a                	jmp    241e <rw_memory+0x21>
    2414:	85 f6                	test   %esi,%esi
    2416:	74 65                	je     247d <rw_memory+0x80>
    2418:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    241c:	eb 64                	jmp    2482 <rw_memory+0x85>
    241e:	8b 44 24 20          	mov    0x20(%esp),%eax
    2422:	8b 38                	mov    (%eax),%edi
    2424:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    2429:	7e 39                	jle    2464 <rw_memory+0x67>
    242b:	81 ff ff ff 00 00    	cmp    $0xffff,%edi
    2431:	7f 35                	jg     2468 <rw_memory+0x6b>
    2433:	8b 44 24 18          	mov    0x18(%esp),%eax
    2437:	8d 58 01             	lea    0x1(%eax),%ebx
    243a:	89 f9                	mov    %edi,%ecx
    243c:	03 4c 24 1c          	add    0x1c(%esp),%ecx
    2440:	89 fa                	mov    %edi,%edx
    2442:	85 f6                	test   %esi,%esi
    2444:	75 07                	jne    244d <rw_memory+0x50>
    2446:	ec                   	in     (%dx),%al
    2447:	64 88 43 ff          	mov    %al,%fs:-0x1(%ebx)
    244b:	eb 05                	jmp    2452 <rw_memory+0x55>
    244d:	64 8a 43 ff          	mov    %fs:-0x1(%ebx),%al
    2451:	ee                   	out    %al,(%dx)
    2452:	42                   	inc    %edx
    2453:	39 ca                	cmp    %ecx,%edx
    2455:	74 13                	je     246a <rw_memory+0x6d>
    2457:	43                   	inc    %ebx
    2458:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
    245e:	75 e2                	jne    2442 <rw_memory+0x45>
    2460:	89 d1                	mov    %edx,%ecx
    2462:	eb 06                	jmp    246a <rw_memory+0x6d>
    2464:	89 f9                	mov    %edi,%ecx
    2466:	eb 02                	jmp    246a <rw_memory+0x6d>
    2468:	89 f9                	mov    %edi,%ecx
    246a:	8b 44 24 20          	mov    0x20(%esp),%eax
    246e:	89 08                	mov    %ecx,(%eax)
    2470:	89 c8                	mov    %ecx,%eax
    2472:	29 f8                	sub    %edi,%eax
    2474:	eb 0c                	jmp    2482 <rw_memory+0x85>
    2476:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
    247b:	eb 05                	jmp    2482 <rw_memory+0x85>
    247d:	b8 00 00 00 00       	mov    $0x0,%eax
    2482:	5b                   	pop    %ebx
    2483:	5e                   	pop    %esi
    2484:	5f                   	pop    %edi
    2485:	c3                   	ret    

00002486 <rw_ttyx>:
    2486:	83 ec 0c             	sub    $0xc,%esp
    2489:	8b 44 24 14          	mov    0x14(%esp),%eax
    248d:	8b 54 24 18          	mov    0x18(%esp),%edx
    2491:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    2495:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    249a:	75 10                	jne    24ac <rw_ttyx+0x26>
    249c:	83 ec 04             	sub    $0x4,%esp
    249f:	51                   	push   %ecx
    24a0:	52                   	push   %edx
    24a1:	50                   	push   %eax
    24a2:	e8 fc ff ff ff       	call   24a3 <rw_ttyx+0x1d>
    24a7:	83 c4 10             	add    $0x10,%esp
    24aa:	eb 0e                	jmp    24ba <rw_ttyx+0x34>
    24ac:	83 ec 04             	sub    $0x4,%esp
    24af:	51                   	push   %ecx
    24b0:	52                   	push   %edx
    24b1:	50                   	push   %eax
    24b2:	e8 fc ff ff ff       	call   24b3 <rw_ttyx+0x2d>
    24b7:	83 c4 10             	add    $0x10,%esp
    24ba:	83 c4 0c             	add    $0xc,%esp
    24bd:	c3                   	ret    

000024be <rw_tty>:
    24be:	a1 00 00 00 00       	mov    0x0,%eax
    24c3:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
    24c9:	85 c0                	test   %eax,%eax
    24cb:	78 1e                	js     24eb <rw_tty+0x2d>
    24cd:	83 ec 18             	sub    $0x18,%esp
    24d0:	ff 74 24 2c          	pushl  0x2c(%esp)
    24d4:	ff 74 24 2c          	pushl  0x2c(%esp)
    24d8:	ff 74 24 2c          	pushl  0x2c(%esp)
    24dc:	50                   	push   %eax
    24dd:	ff 74 24 2c          	pushl  0x2c(%esp)
    24e1:	e8 a0 ff ff ff       	call   2486 <rw_ttyx>
    24e6:	83 c4 20             	add    $0x20,%esp
    24e9:	eb 06                	jmp    24f1 <rw_tty+0x33>
    24eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    24f0:	c3                   	ret    
    24f1:	83 c4 0c             	add    $0xc,%esp
    24f4:	c3                   	ret    

000024f5 <rw_char>:
    24f5:	83 ec 0c             	sub    $0xc,%esp
    24f8:	8b 44 24 14          	mov    0x14(%esp),%eax
    24fc:	c1 e8 08             	shr    $0x8,%eax
    24ff:	83 f8 07             	cmp    $0x7,%eax
    2502:	77 2b                	ja     252f <rw_char+0x3a>
    2504:	8b 14 85 00 00 00 00 	mov    0x0(,%eax,4),%edx
    250b:	85 d2                	test   %edx,%edx
    250d:	74 27                	je     2536 <rw_char+0x41>
    250f:	83 ec 0c             	sub    $0xc,%esp
    2512:	ff 74 24 2c          	pushl  0x2c(%esp)
    2516:	ff 74 24 2c          	pushl  0x2c(%esp)
    251a:	ff 74 24 2c          	pushl  0x2c(%esp)
    251e:	0f b6 44 24 2c       	movzbl 0x2c(%esp),%eax
    2523:	50                   	push   %eax
    2524:	ff 74 24 2c          	pushl  0x2c(%esp)
    2528:	ff d2                	call   *%edx
    252a:	83 c4 20             	add    $0x20,%esp
    252d:	eb 0c                	jmp    253b <rw_char+0x46>
    252f:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
    2534:	eb 05                	jmp    253b <rw_char+0x46>
    2536:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
    253b:	83 c4 0c             	add    $0xc,%esp
    253e:	c3                   	ret    

0000253f <file_read>:
    253f:	55                   	push   %ebp
    2540:	89 e5                	mov    %esp,%ebp
    2542:	57                   	push   %edi
    2543:	56                   	push   %esi
    2544:	53                   	push   %ebx
    2545:	83 ec 1c             	sub    $0x1c,%esp
    2548:	8b 7d 0c             	mov    0xc(%ebp),%edi
    254b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    254e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2552:	0f 8e f1 00 00 00    	jle    2649 <file_read+0x10a>
    2558:	8b 45 14             	mov    0x14(%ebp),%eax
    255b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    255e:	83 ec 08             	sub    $0x8,%esp
    2561:	8b 47 0c             	mov    0xc(%edi),%eax
    2564:	85 c0                	test   %eax,%eax
    2566:	79 05                	jns    256d <file_read+0x2e>
    2568:	05 ff 03 00 00       	add    $0x3ff,%eax
    256d:	c1 f8 0a             	sar    $0xa,%eax
    2570:	50                   	push   %eax
    2571:	ff 75 08             	pushl  0x8(%ebp)
    2574:	e8 fc ff ff ff       	call   2575 <file_read+0x36>
    2579:	83 c4 10             	add    $0x10,%esp
    257c:	85 c0                	test   %eax,%eax
    257e:	0f 84 d9 00 00 00    	je     265d <file_read+0x11e>
    2584:	83 ec 08             	sub    $0x8,%esp
    2587:	50                   	push   %eax
    2588:	8b 45 08             	mov    0x8(%ebp),%eax
    258b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    258f:	50                   	push   %eax
    2590:	e8 fc ff ff ff       	call   2591 <file_read+0x52>
    2595:	89 c1                	mov    %eax,%ecx
    2597:	83 c4 10             	add    $0x10,%esp
    259a:	85 c0                	test   %eax,%eax
    259c:	0f 85 fa 00 00 00    	jne    269c <file_read+0x15d>
    25a2:	eb 6e                	jmp    2612 <file_read+0xd3>
    25a4:	8d 53 01             	lea    0x1(%ebx),%edx
    25a7:	40                   	inc    %eax
    25a8:	8a 48 ff             	mov    -0x1(%eax),%cl
    25ab:	64 88 0b             	mov    %cl,%fs:(%ebx)
    25ae:	89 d3                	mov    %edx,%ebx
    25b0:	39 d6                	cmp    %edx,%esi
    25b2:	75 f0                	jne    25a4 <file_read+0x65>
    25b4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    25b7:	eb 02                	jmp    25bb <file_read+0x7c>
    25b9:	89 de                	mov    %ebx,%esi
    25bb:	83 ec 0c             	sub    $0xc,%esp
    25be:	51                   	push   %ecx
    25bf:	e8 fc ff ff ff       	call   25c0 <file_read+0x81>
    25c4:	83 c4 10             	add    $0x10,%esp
    25c7:	89 f3                	mov    %esi,%ebx
    25c9:	eb 13                	jmp    25de <file_read+0x9f>
    25cb:	8d 53 01             	lea    0x1(%ebx),%edx
    25ce:	b1 00                	mov    $0x0,%cl
    25d0:	64 88 0b             	mov    %cl,%fs:(%ebx)
    25d3:	89 d3                	mov    %edx,%ebx
    25d5:	39 d0                	cmp    %edx,%eax
    25d7:	75 f2                	jne    25cb <file_read+0x8c>
    25d9:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    25dc:	89 c3                	mov    %eax,%ebx
    25de:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    25e2:	0f 85 76 ff ff ff    	jne    255e <file_read+0x1f>
    25e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    25eb:	89 c6                	mov    %eax,%esi
    25ed:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    25f3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    25f8:	f7 e9                	imul   %ecx
    25fa:	89 d0                	mov    %edx,%eax
    25fc:	c1 f8 05             	sar    $0x5,%eax
    25ff:	c1 f9 1f             	sar    $0x1f,%ecx
    2602:	29 c8                	sub    %ecx,%eax
    2604:	03 05 00 00 00 00    	add    0x0,%eax
    260a:	8b 7d 08             	mov    0x8(%ebp),%edi
    260d:	89 47 24             	mov    %eax,0x24(%edi)
    2610:	eb 2d                	jmp    263f <file_read+0x100>
    2612:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2615:	89 c6                	mov    %eax,%esi
    2617:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    261d:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    2622:	f7 e9                	imul   %ecx
    2624:	89 d0                	mov    %edx,%eax
    2626:	c1 f8 05             	sar    $0x5,%eax
    2629:	c1 f9 1f             	sar    $0x1f,%ecx
    262c:	29 c8                	sub    %ecx,%eax
    262e:	03 05 00 00 00 00    	add    0x0,%eax
    2634:	8b 7d 08             	mov    0x8(%ebp),%edi
    2637:	89 47 24             	mov    %eax,0x24(%edi)
    263a:	39 75 14             	cmp    %esi,0x14(%ebp)
    263d:	74 14                	je     2653 <file_read+0x114>
    263f:	8b 45 14             	mov    0x14(%ebp),%eax
    2642:	29 f0                	sub    %esi,%eax
    2644:	e9 9b 00 00 00       	jmp    26e4 <file_read+0x1a5>
    2649:	b8 00 00 00 00       	mov    $0x0,%eax
    264e:	e9 91 00 00 00       	jmp    26e4 <file_read+0x1a5>
    2653:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    2658:	e9 87 00 00 00       	jmp    26e4 <file_read+0x1a5>
    265d:	8b 57 0c             	mov    0xc(%edi),%edx
    2660:	89 d0                	mov    %edx,%eax
    2662:	25 ff 03 00 80       	and    $0x800003ff,%eax
    2667:	79 07                	jns    2670 <file_read+0x131>
    2669:	48                   	dec    %eax
    266a:	0d 00 fc ff ff       	or     $0xfffffc00,%eax
    266f:	40                   	inc    %eax
    2670:	b9 00 04 00 00       	mov    $0x400,%ecx
    2675:	29 c1                	sub    %eax,%ecx
    2677:	89 c8                	mov    %ecx,%eax
    2679:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    267c:	39 f1                	cmp    %esi,%ecx
    267e:	7e 02                	jle    2682 <file_read+0x143>
    2680:	89 f0                	mov    %esi,%eax
    2682:	01 c2                	add    %eax,%edx
    2684:	89 57 0c             	mov    %edx,0xc(%edi)
    2687:	29 45 e4             	sub    %eax,-0x1c(%ebp)
    268a:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    268d:	85 c0                	test   %eax,%eax
    268f:	0f 8e 49 ff ff ff    	jle    25de <file_read+0x9f>
    2695:	01 d8                	add    %ebx,%eax
    2697:	e9 2f ff ff ff       	jmp    25cb <file_read+0x8c>
    269c:	8b 57 0c             	mov    0xc(%edi),%edx
    269f:	89 d6                	mov    %edx,%esi
    26a1:	81 e6 ff 03 00 80    	and    $0x800003ff,%esi
    26a7:	79 08                	jns    26b1 <file_read+0x172>
    26a9:	4e                   	dec    %esi
    26aa:	81 ce 00 fc ff ff    	or     $0xfffffc00,%esi
    26b0:	46                   	inc    %esi
    26b1:	89 75 e0             	mov    %esi,-0x20(%ebp)
    26b4:	b8 00 04 00 00       	mov    $0x400,%eax
    26b9:	29 f0                	sub    %esi,%eax
    26bb:	89 c6                	mov    %eax,%esi
    26bd:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    26c0:	7e 03                	jle    26c5 <file_read+0x186>
    26c2:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    26c5:	01 f2                	add    %esi,%edx
    26c7:	89 57 0c             	mov    %edx,0xc(%edi)
    26ca:	29 75 e4             	sub    %esi,-0x1c(%ebp)
    26cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
    26d0:	03 01                	add    (%ecx),%eax
    26d2:	85 f6                	test   %esi,%esi
    26d4:	0f 8e df fe ff ff    	jle    25b9 <file_read+0x7a>
    26da:	01 de                	add    %ebx,%esi
    26dc:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    26df:	e9 c0 fe ff ff       	jmp    25a4 <file_read+0x65>
    26e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    26e7:	5b                   	pop    %ebx
    26e8:	5e                   	pop    %esi
    26e9:	5f                   	pop    %edi
    26ea:	5d                   	pop    %ebp
    26eb:	c3                   	ret    

000026ec <file_write>:
    26ec:	55                   	push   %ebp
    26ed:	89 e5                	mov    %esp,%ebp
    26ef:	57                   	push   %edi
    26f0:	56                   	push   %esi
    26f1:	53                   	push   %ebx
    26f2:	83 ec 1c             	sub    $0x1c,%esp
    26f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
    26f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    26fb:	f6 40 03 04          	testb  $0x4,0x3(%eax)
    26ff:	74 08                	je     2709 <file_write+0x1d>
    2701:	8b 45 08             	mov    0x8(%ebp),%eax
    2704:	8b 70 04             	mov    0x4(%eax),%esi
    2707:	eb 06                	jmp    270f <file_write+0x23>
    2709:	8b 45 0c             	mov    0xc(%ebp),%eax
    270c:	8b 70 0c             	mov    0xc(%eax),%esi
    270f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2713:	0f 8e c3 00 00 00    	jle    27dc <file_write+0xf0>
    2719:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    2720:	83 ec 08             	sub    $0x8,%esp
    2723:	89 f0                	mov    %esi,%eax
    2725:	85 f6                	test   %esi,%esi
    2727:	79 06                	jns    272f <file_write+0x43>
    2729:	8d 86 ff 03 00 00    	lea    0x3ff(%esi),%eax
    272f:	c1 f8 0a             	sar    $0xa,%eax
    2732:	50                   	push   %eax
    2733:	ff 75 08             	pushl  0x8(%ebp)
    2736:	e8 fc ff ff ff       	call   2737 <file_write+0x4b>
    273b:	83 c4 10             	add    $0x10,%esp
    273e:	85 c0                	test   %eax,%eax
    2740:	0f 84 9f 00 00 00    	je     27e5 <file_write+0xf9>
    2746:	83 ec 08             	sub    $0x8,%esp
    2749:	50                   	push   %eax
    274a:	8b 45 08             	mov    0x8(%ebp),%eax
    274d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    2751:	50                   	push   %eax
    2752:	e8 fc ff ff ff       	call   2753 <file_write+0x67>
    2757:	83 c4 10             	add    $0x10,%esp
    275a:	85 c0                	test   %eax,%eax
    275c:	0f 84 85 00 00 00    	je     27e7 <file_write+0xfb>
    2762:	89 f1                	mov    %esi,%ecx
    2764:	81 e1 ff 03 00 80    	and    $0x800003ff,%ecx
    276a:	79 08                	jns    2774 <file_write+0x88>
    276c:	49                   	dec    %ecx
    276d:	81 c9 00 fc ff ff    	or     $0xfffffc00,%ecx
    2773:	41                   	inc    %ecx
    2774:	89 ca                	mov    %ecx,%edx
    2776:	03 10                	add    (%eax),%edx
    2778:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    277c:	bf 00 04 00 00       	mov    $0x400,%edi
    2781:	29 cf                	sub    %ecx,%edi
    2783:	8b 4d 14             	mov    0x14(%ebp),%ecx
    2786:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    2789:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    278c:	89 f9                	mov    %edi,%ecx
    278e:	3b 7d e0             	cmp    -0x20(%ebp),%edi
    2791:	7e 03                	jle    2796 <file_write+0xaa>
    2793:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    2796:	01 ce                	add    %ecx,%esi
    2798:	8b 7d 08             	mov    0x8(%ebp),%edi
    279b:	39 77 04             	cmp    %esi,0x4(%edi)
    279e:	73 07                	jae    27a7 <file_write+0xbb>
    27a0:	89 77 04             	mov    %esi,0x4(%edi)
    27a3:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    27a7:	01 4d e4             	add    %ecx,-0x1c(%ebp)
    27aa:	85 c9                	test   %ecx,%ecx
    27ac:	7e 14                	jle    27c2 <file_write+0xd6>
    27ae:	01 d9                	add    %ebx,%ecx
    27b0:	42                   	inc    %edx
    27b1:	8d 7b 01             	lea    0x1(%ebx),%edi
    27b4:	64 8a 1b             	mov    %fs:(%ebx),%bl
    27b7:	88 5a ff             	mov    %bl,-0x1(%edx)
    27ba:	89 fb                	mov    %edi,%ebx
    27bc:	39 cf                	cmp    %ecx,%edi
    27be:	75 f0                	jne    27b0 <file_write+0xc4>
    27c0:	89 cb                	mov    %ecx,%ebx
    27c2:	83 ec 0c             	sub    $0xc,%esp
    27c5:	50                   	push   %eax
    27c6:	e8 fc ff ff ff       	call   27c7 <file_write+0xdb>
    27cb:	83 c4 10             	add    $0x10,%esp
    27ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    27d1:	39 45 14             	cmp    %eax,0x14(%ebp)
    27d4:	0f 8f 46 ff ff ff    	jg     2720 <file_write+0x34>
    27da:	eb 0b                	jmp    27e7 <file_write+0xfb>
    27dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    27e3:	eb 02                	jmp    27e7 <file_write+0xfb>
    27e5:	eb 00                	jmp    27e7 <file_write+0xfb>
    27e7:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    27ed:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    27f3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    27f8:	f7 e9                	imul   %ecx
    27fa:	89 d0                	mov    %edx,%eax
    27fc:	c1 f8 05             	sar    $0x5,%eax
    27ff:	c1 f9 1f             	sar    $0x1f,%ecx
    2802:	29 c8                	sub    %ecx,%eax
    2804:	01 d8                	add    %ebx,%eax
    2806:	8b 55 08             	mov    0x8(%ebp),%edx
    2809:	89 42 08             	mov    %eax,0x8(%edx)
    280c:	8b 45 0c             	mov    0xc(%ebp),%eax
    280f:	f6 40 03 04          	testb  $0x4,0x3(%eax)
    2813:	75 22                	jne    2837 <file_write+0x14b>
    2815:	89 70 0c             	mov    %esi,0xc(%eax)
    2818:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    281e:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    2823:	f7 e9                	imul   %ecx
    2825:	89 d0                	mov    %edx,%eax
    2827:	c1 f8 05             	sar    $0x5,%eax
    282a:	c1 f9 1f             	sar    $0x1f,%ecx
    282d:	29 c8                	sub    %ecx,%eax
    282f:	01 c3                	add    %eax,%ebx
    2831:	8b 45 08             	mov    0x8(%ebp),%eax
    2834:	89 58 28             	mov    %ebx,0x28(%eax)
    2837:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    283a:	85 c0                	test   %eax,%eax
    283c:	75 05                	jne    2843 <file_write+0x157>
    283e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2843:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2846:	5b                   	pop    %ebx
    2847:	5e                   	pop    %esi
    2848:	5f                   	pop    %edi
    2849:	5d                   	pop    %ebp
    284a:	c3                   	ret    

0000284b <cp_stat>:
    284b:	56                   	push   %esi
    284c:	53                   	push   %ebx
    284d:	83 ec 2c             	sub    $0x2c,%esp
    2850:	89 c6                	mov    %eax,%esi
    2852:	89 d3                	mov    %edx,%ebx
    2854:	6a 20                	push   $0x20
    2856:	52                   	push   %edx
    2857:	e8 fc ff ff ff       	call   2858 <cp_stat+0xd>
    285c:	8b 46 2c             	mov    0x2c(%esi),%eax
    285f:	66 89 44 24 10       	mov    %ax,0x10(%esp)
    2864:	66 8b 46 2e          	mov    0x2e(%esi),%ax
    2868:	66 89 44 24 12       	mov    %ax,0x12(%esp)
    286d:	8b 06                	mov    (%esi),%eax
    286f:	66 89 44 24 14       	mov    %ax,0x14(%esp)
    2874:	8a 46 0d             	mov    0xd(%esi),%al
    2877:	88 44 24 16          	mov    %al,0x16(%esp)
    287b:	66 8b 46 02          	mov    0x2(%esi),%ax
    287f:	66 89 44 24 18       	mov    %ax,0x18(%esp)
    2884:	8a 46 0c             	mov    0xc(%esi),%al
    2887:	88 44 24 1a          	mov    %al,0x1a(%esp)
    288b:	66 8b 46 0e          	mov    0xe(%esi),%ax
    288f:	66 89 44 24 1c       	mov    %ax,0x1c(%esp)
    2894:	8b 46 04             	mov    0x4(%esi),%eax
    2897:	89 44 24 20          	mov    %eax,0x20(%esp)
    289b:	8b 46 24             	mov    0x24(%esi),%eax
    289e:	89 44 24 24          	mov    %eax,0x24(%esp)
    28a2:	8b 46 08             	mov    0x8(%esi),%eax
    28a5:	89 44 24 28          	mov    %eax,0x28(%esp)
    28a9:	8b 46 28             	mov    0x28(%esi),%eax
    28ac:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    28b0:	83 c4 10             	add    $0x10,%esp
    28b3:	b8 00 00 00 00       	mov    $0x0,%eax
    28b8:	8a 0c 04             	mov    (%esp,%eax,1),%cl
    28bb:	64 88 0c 03          	mov    %cl,%fs:(%ebx,%eax,1)
    28bf:	40                   	inc    %eax
    28c0:	83 f8 20             	cmp    $0x20,%eax
    28c3:	75 f3                	jne    28b8 <cp_stat+0x6d>
    28c5:	83 c4 24             	add    $0x24,%esp
    28c8:	5b                   	pop    %ebx
    28c9:	5e                   	pop    %esi
    28ca:	c3                   	ret    

000028cb <sys_stat>:
    28cb:	53                   	push   %ebx
    28cc:	83 ec 14             	sub    $0x14,%esp
    28cf:	ff 74 24 1c          	pushl  0x1c(%esp)
    28d3:	e8 fc ff ff ff       	call   28d4 <sys_stat+0x9>
    28d8:	83 c4 10             	add    $0x10,%esp
    28db:	85 c0                	test   %eax,%eax
    28dd:	74 1e                	je     28fd <sys_stat+0x32>
    28df:	89 c3                	mov    %eax,%ebx
    28e1:	8b 54 24 14          	mov    0x14(%esp),%edx
    28e5:	e8 61 ff ff ff       	call   284b <cp_stat>
    28ea:	83 ec 0c             	sub    $0xc,%esp
    28ed:	53                   	push   %ebx
    28ee:	e8 fc ff ff ff       	call   28ef <sys_stat+0x24>
    28f3:	83 c4 10             	add    $0x10,%esp
    28f6:	b8 00 00 00 00       	mov    $0x0,%eax
    28fb:	eb 05                	jmp    2902 <sys_stat+0x37>
    28fd:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    2902:	83 c4 08             	add    $0x8,%esp
    2905:	5b                   	pop    %ebx
    2906:	c3                   	ret    

00002907 <sys_fstat>:
    2907:	83 ec 0c             	sub    $0xc,%esp
    290a:	8b 44 24 10          	mov    0x10(%esp),%eax
    290e:	83 f8 13             	cmp    $0x13,%eax
    2911:	77 28                	ja     293b <sys_fstat+0x34>
    2913:	8b 15 00 00 00 00    	mov    0x0,%edx
    2919:	8b 84 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%eax
    2920:	85 c0                	test   %eax,%eax
    2922:	74 1e                	je     2942 <sys_fstat+0x3b>
    2924:	8b 40 08             	mov    0x8(%eax),%eax
    2927:	85 c0                	test   %eax,%eax
    2929:	74 1e                	je     2949 <sys_fstat+0x42>
    292b:	8b 54 24 14          	mov    0x14(%esp),%edx
    292f:	e8 17 ff ff ff       	call   284b <cp_stat>
    2934:	b8 00 00 00 00       	mov    $0x0,%eax
    2939:	eb 13                	jmp    294e <sys_fstat+0x47>
    293b:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    2940:	eb 0c                	jmp    294e <sys_fstat+0x47>
    2942:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    2947:	eb 05                	jmp    294e <sys_fstat+0x47>
    2949:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    294e:	83 c4 0c             	add    $0xc,%esp
    2951:	c3                   	ret    

00002952 <copy_strings>:
    2952:	55                   	push   %ebp
    2953:	57                   	push   %edi
    2954:	56                   	push   %esi
    2955:	53                   	push   %ebx
    2956:	83 ec 3c             	sub    $0x3c,%esp
    2959:	83 7c 24 50 00       	cmpl   $0x0,0x50(%esp)
    295e:	0f 84 3e 01 00 00    	je     2aa2 <copy_strings+0x150>
    2964:	89 c3                	mov    %eax,%ebx
    2966:	66 8c d8             	mov    %ds,%ax
    2969:	89 c6                	mov    %eax,%esi
    296b:	66 89 44 24 1c       	mov    %ax,0x1c(%esp)
    2970:	66 8c e0             	mov    %fs,%ax
    2973:	66 89 44 24 1e       	mov    %ax,0x1e(%esp)
    2978:	66 89 44 24 1a       	mov    %ax,0x1a(%esp)
    297d:	83 7c 24 54 02       	cmpl   $0x2,0x54(%esp)
    2982:	75 04                	jne    2988 <copy_strings+0x36>
    2984:	89 f0                	mov    %esi,%eax
    2986:	8e e0                	mov    %eax,%fs
    2988:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    298c:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    2993:	00 
    2994:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    2998:	8d 44 9a fc          	lea    -0x4(%edx,%ebx,4),%eax
    299c:	89 44 24 10          	mov    %eax,0x10(%esp)
    29a0:	bd 00 00 00 00       	mov    $0x0,%ebp
    29a5:	e9 c4 00 00 00       	jmp    2a6e <copy_strings+0x11c>
    29aa:	83 7c 24 54 01       	cmpl   $0x1,0x54(%esp)
    29af:	0f 85 14 01 00 00    	jne    2ac9 <copy_strings+0x177>
    29b5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    29b9:	8e e0                	mov    %eax,%fs
    29bb:	8b 44 24 10          	mov    0x10(%esp),%eax
    29bf:	64 8b 00             	mov    %fs:(%eax),%eax
    29c2:	89 c6                	mov    %eax,%esi
    29c4:	85 c0                	test   %eax,%eax
    29c6:	0f 84 79 01 00 00    	je     2b45 <copy_strings+0x1f3>
    29cc:	66 8b 44 24 1a       	mov    0x1a(%esp),%ax
    29d1:	8e e0                	mov    %eax,%fs
    29d3:	bf 00 00 00 00       	mov    $0x0,%edi
    29d8:	47                   	inc    %edi
    29d9:	8d 5e 01             	lea    0x1(%esi),%ebx
    29dc:	64 8a 06             	mov    %fs:(%esi),%al
    29df:	89 de                	mov    %ebx,%esi
    29e1:	84 c0                	test   %al,%al
    29e3:	75 f3                	jne    29d8 <copy_strings+0x86>
    29e5:	85 ff                	test   %edi,%edi
    29e7:	74 74                	je     2a5d <copy_strings+0x10b>
    29e9:	8b 74 24 50          	mov    0x50(%esp),%esi
    29ed:	4e                   	dec    %esi
    29ee:	4b                   	dec    %ebx
    29ef:	4d                   	dec    %ebp
    29f0:	79 55                	jns    2a47 <copy_strings+0xf5>
    29f2:	83 ec 08             	sub    $0x8,%esp
    29f5:	6a 01                	push   $0x1
    29f7:	8d 44 24 34          	lea    0x34(%esp),%eax
    29fb:	50                   	push   %eax
    29fc:	e8 fc ff ff ff       	call   29fd <copy_strings+0xab>
    2a01:	89 f5                	mov    %esi,%ebp
    2a03:	81 e5 ff 0f 00 00    	and    $0xfff,%ebp
    2a09:	83 c4 10             	add    $0x10,%esp
    2a0c:	83 7c 24 54 02       	cmpl   $0x2,0x54(%esp)
    2a11:	0f 85 0f 01 00 00    	jne    2b26 <copy_strings+0x1d4>
    2a17:	66 8b 44 24 1a       	mov    0x1a(%esp),%ax
    2a1c:	8e e0                	mov    %eax,%fs
    2a1e:	89 f0                	mov    %esi,%eax
    2a20:	c1 e8 0c             	shr    $0xc,%eax
    2a23:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    2a27:	8d 04 81             	lea    (%ecx,%eax,4),%eax
    2a2a:	89 44 24 14          	mov    %eax,0x14(%esp)
    2a2e:	8b 00                	mov    (%eax),%eax
    2a30:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    2a34:	85 c0                	test   %eax,%eax
    2a36:	0f 84 58 01 00 00    	je     2b94 <copy_strings+0x242>
    2a3c:	e9 9b 00 00 00       	jmp    2adc <copy_strings+0x18a>
    2a41:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    2a45:	8e e0                	mov    %eax,%fs
    2a47:	64 8a 13             	mov    %fs:(%ebx),%dl
    2a4a:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    2a4e:	88 14 28             	mov    %dl,(%eax,%ebp,1)
    2a51:	89 f0                	mov    %esi,%eax
    2a53:	2b 44 24 50          	sub    0x50(%esp),%eax
    2a57:	01 f8                	add    %edi,%eax
    2a59:	75 92                	jne    29ed <copy_strings+0x9b>
    2a5b:	eb 04                	jmp    2a61 <copy_strings+0x10f>
    2a5d:	8b 74 24 50          	mov    0x50(%esp),%esi
    2a61:	ff 4c 24 0c          	decl   0xc(%esp)
    2a65:	83 6c 24 10 04       	subl   $0x4,0x10(%esp)
    2a6a:	89 74 24 50          	mov    %esi,0x50(%esp)
    2a6e:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    2a73:	0f 8f 31 ff ff ff    	jg     29aa <copy_strings+0x58>
    2a79:	83 ec 08             	sub    $0x8,%esp
    2a7c:	6a 01                	push   $0x1
    2a7e:	8d 44 24 34          	lea    0x34(%esp),%eax
    2a82:	50                   	push   %eax
    2a83:	e8 fc ff ff ff       	call   2a84 <copy_strings+0x132>
    2a88:	83 c4 10             	add    $0x10,%esp
    2a8b:	83 7c 24 54 02       	cmpl   $0x2,0x54(%esp)
    2a90:	75 1a                	jne    2aac <copy_strings+0x15a>
    2a92:	66 8b 44 24 1e       	mov    0x1e(%esp),%ax
    2a97:	8e e0                	mov    %eax,%fs
    2a99:	8b 44 24 50          	mov    0x50(%esp),%eax
    2a9d:	e9 58 01 00 00       	jmp    2bfa <copy_strings+0x2a8>
    2aa2:	b8 00 00 00 00       	mov    $0x0,%eax
    2aa7:	e9 4e 01 00 00       	jmp    2bfa <copy_strings+0x2a8>
    2aac:	8b 44 24 50          	mov    0x50(%esp),%eax
    2ab0:	e9 45 01 00 00       	jmp    2bfa <copy_strings+0x2a8>
    2ab5:	b8 00 00 00 00       	mov    $0x0,%eax
    2aba:	e9 3b 01 00 00       	jmp    2bfa <copy_strings+0x2a8>
    2abf:	b8 00 00 00 00       	mov    $0x0,%eax
    2ac4:	e9 31 01 00 00       	jmp    2bfa <copy_strings+0x2a8>
    2ac9:	8b 44 24 10          	mov    0x10(%esp),%eax
    2acd:	64 8b 00             	mov    %fs:(%eax),%eax
    2ad0:	89 c6                	mov    %eax,%esi
    2ad2:	85 c0                	test   %eax,%eax
    2ad4:	0f 85 f9 fe ff ff    	jne    29d3 <copy_strings+0x81>
    2ada:	eb 7e                	jmp    2b5a <copy_strings+0x208>
    2adc:	83 ec 0c             	sub    $0xc,%esp
    2adf:	8d 44 24 38          	lea    0x38(%esp),%eax
    2ae3:	50                   	push   %eax
    2ae4:	e8 fc ff ff ff       	call   2ae5 <copy_strings+0x193>
    2ae9:	83 c4 0c             	add    $0xc,%esp
    2aec:	50                   	push   %eax
    2aed:	6a 01                	push   $0x1
    2aef:	8d 44 24 34          	lea    0x34(%esp),%eax
    2af3:	50                   	push   %eax
    2af4:	e8 fc ff ff ff       	call   2af5 <copy_strings+0x1a3>
    2af9:	83 c4 10             	add    $0x10,%esp
    2afc:	e9 40 ff ff ff       	jmp    2a41 <copy_strings+0xef>
    2b01:	83 ec 0c             	sub    $0xc,%esp
    2b04:	8d 44 24 38          	lea    0x38(%esp),%eax
    2b08:	50                   	push   %eax
    2b09:	e8 fc ff ff ff       	call   2b0a <copy_strings+0x1b8>
    2b0e:	83 c4 0c             	add    $0xc,%esp
    2b11:	50                   	push   %eax
    2b12:	6a 01                	push   $0x1
    2b14:	8d 44 24 34          	lea    0x34(%esp),%eax
    2b18:	50                   	push   %eax
    2b19:	e8 fc ff ff ff       	call   2b1a <copy_strings+0x1c8>
    2b1e:	83 c4 10             	add    $0x10,%esp
    2b21:	e9 21 ff ff ff       	jmp    2a47 <copy_strings+0xf5>
    2b26:	89 f0                	mov    %esi,%eax
    2b28:	c1 e8 0c             	shr    $0xc,%eax
    2b2b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    2b2f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
    2b32:	89 44 24 14          	mov    %eax,0x14(%esp)
    2b36:	8b 00                	mov    (%eax),%eax
    2b38:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    2b3c:	85 c0                	test   %eax,%eax
    2b3e:	75 c1                	jne    2b01 <copy_strings+0x1af>
    2b40:	e9 94 00 00 00       	jmp    2bd9 <copy_strings+0x287>
    2b45:	83 ec 0c             	sub    $0xc,%esp
    2b48:	68 03 02 00 00       	push   $0x203
    2b4d:	e8 fc ff ff ff       	call   2b4e <copy_strings+0x1fc>
    2b52:	83 c4 10             	add    $0x10,%esp
    2b55:	e9 72 fe ff ff       	jmp    29cc <copy_strings+0x7a>
    2b5a:	83 ec 0c             	sub    $0xc,%esp
    2b5d:	68 03 02 00 00       	push   $0x203
    2b62:	e8 fc ff ff ff       	call   2b63 <copy_strings+0x211>
    2b67:	83 c4 10             	add    $0x10,%esp
    2b6a:	e9 64 fe ff ff       	jmp    29d3 <copy_strings+0x81>
    2b6f:	83 ec 0c             	sub    $0xc,%esp
    2b72:	8d 44 24 38          	lea    0x38(%esp),%eax
    2b76:	50                   	push   %eax
    2b77:	e8 fc ff ff ff       	call   2b78 <copy_strings+0x226>
    2b7c:	83 c4 0c             	add    $0xc,%esp
    2b7f:	50                   	push   %eax
    2b80:	6a 01                	push   $0x1
    2b82:	8d 44 24 34          	lea    0x34(%esp),%eax
    2b86:	50                   	push   %eax
    2b87:	e8 fc ff ff ff       	call   2b88 <copy_strings+0x236>
    2b8c:	83 c4 10             	add    $0x10,%esp
    2b8f:	e9 ad fe ff ff       	jmp    2a41 <copy_strings+0xef>
    2b94:	83 ec 0c             	sub    $0xc,%esp
    2b97:	6a 00                	push   $0x0
    2b99:	e8 fc ff ff ff       	call   2b9a <copy_strings+0x248>
    2b9e:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    2ba2:	89 01                	mov    %eax,(%ecx)
    2ba4:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    2ba8:	83 c4 10             	add    $0x10,%esp
    2bab:	85 c0                	test   %eax,%eax
    2bad:	75 c0                	jne    2b6f <copy_strings+0x21d>
    2baf:	e9 01 ff ff ff       	jmp    2ab5 <copy_strings+0x163>
    2bb4:	83 ec 0c             	sub    $0xc,%esp
    2bb7:	8d 44 24 38          	lea    0x38(%esp),%eax
    2bbb:	50                   	push   %eax
    2bbc:	e8 fc ff ff ff       	call   2bbd <copy_strings+0x26b>
    2bc1:	83 c4 0c             	add    $0xc,%esp
    2bc4:	50                   	push   %eax
    2bc5:	6a 01                	push   $0x1
    2bc7:	8d 44 24 34          	lea    0x34(%esp),%eax
    2bcb:	50                   	push   %eax
    2bcc:	e8 fc ff ff ff       	call   2bcd <copy_strings+0x27b>
    2bd1:	83 c4 10             	add    $0x10,%esp
    2bd4:	e9 6e fe ff ff       	jmp    2a47 <copy_strings+0xf5>
    2bd9:	83 ec 0c             	sub    $0xc,%esp
    2bdc:	6a 00                	push   $0x0
    2bde:	e8 fc ff ff ff       	call   2bdf <copy_strings+0x28d>
    2be3:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    2be7:	89 01                	mov    %eax,(%ecx)
    2be9:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    2bed:	83 c4 10             	add    $0x10,%esp
    2bf0:	85 c0                	test   %eax,%eax
    2bf2:	0f 84 c7 fe ff ff    	je     2abf <copy_strings+0x16d>
    2bf8:	eb ba                	jmp    2bb4 <copy_strings+0x262>
    2bfa:	83 c4 3c             	add    $0x3c,%esp
    2bfd:	5b                   	pop    %ebx
    2bfe:	5e                   	pop    %esi
    2bff:	5f                   	pop    %edi
    2c00:	5d                   	pop    %ebp
    2c01:	c3                   	ret    

00002c02 <create_tables>:
    2c02:	55                   	push   %ebp
    2c03:	57                   	push   %edi
    2c04:	56                   	push   %esi
    2c05:	53                   	push   %ebx
    2c06:	83 ec 04             	sub    $0x4,%esp
    2c09:	8b 44 24 18          	mov    0x18(%esp),%eax
    2c0d:	89 c2                	mov    %eax,%edx
    2c0f:	83 e2 fc             	and    $0xfffffffc,%edx
    2c12:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    2c16:	f7 d1                	not    %ecx
    2c18:	8d 2c 8a             	lea    (%edx,%ecx,4),%ebp
    2c1b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    2c1f:	f7 d2                	not    %edx
    2c21:	8d 7c 95 00          	lea    0x0(%ebp,%edx,4),%edi
    2c25:	64 89 6f fc          	mov    %ebp,%fs:-0x4(%edi)
    2c29:	64 89 7f f8          	mov    %edi,%fs:-0x8(%edi)
    2c2d:	8d 77 f4             	lea    -0xc(%edi),%esi
    2c30:	89 34 24             	mov    %esi,(%esp)
    2c33:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    2c37:	64 89 77 f4          	mov    %esi,%fs:-0xc(%edi)
    2c3b:	89 f3                	mov    %esi,%ebx
    2c3d:	89 f9                	mov    %edi,%ecx
    2c3f:	eb 15                	jmp    2c56 <create_tables+0x54>
    2c41:	8d 71 04             	lea    0x4(%ecx),%esi
    2c44:	64 89 01             	mov    %eax,%fs:(%ecx)
    2c47:	8d 50 01             	lea    0x1(%eax),%edx
    2c4a:	64 8a 08             	mov    %fs:(%eax),%cl
    2c4d:	89 d0                	mov    %edx,%eax
    2c4f:	84 c9                	test   %cl,%cl
    2c51:	75 f4                	jne    2c47 <create_tables+0x45>
    2c53:	4b                   	dec    %ebx
    2c54:	89 f1                	mov    %esi,%ecx
    2c56:	85 db                	test   %ebx,%ebx
    2c58:	7f e7                	jg     2c41 <create_tables+0x3f>
    2c5a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    2c5e:	85 d2                	test   %edx,%edx
    2c60:	79 05                	jns    2c67 <create_tables+0x65>
    2c62:	ba 00 00 00 00       	mov    $0x0,%edx
    2c67:	b9 00 00 00 00       	mov    $0x0,%ecx
    2c6c:	64 89 0c 97          	mov    %ecx,%fs:(%edi,%edx,4)
    2c70:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    2c74:	89 e9                	mov    %ebp,%ecx
    2c76:	eb 15                	jmp    2c8d <create_tables+0x8b>
    2c78:	8d 71 04             	lea    0x4(%ecx),%esi
    2c7b:	64 89 01             	mov    %eax,%fs:(%ecx)
    2c7e:	8d 50 01             	lea    0x1(%eax),%edx
    2c81:	64 8a 08             	mov    %fs:(%eax),%cl
    2c84:	89 d0                	mov    %edx,%eax
    2c86:	84 c9                	test   %cl,%cl
    2c88:	75 f4                	jne    2c7e <create_tables+0x7c>
    2c8a:	4b                   	dec    %ebx
    2c8b:	89 f1                	mov    %esi,%ecx
    2c8d:	85 db                	test   %ebx,%ebx
    2c8f:	7f e7                	jg     2c78 <create_tables+0x76>
    2c91:	8b 44 24 20          	mov    0x20(%esp),%eax
    2c95:	85 c0                	test   %eax,%eax
    2c97:	79 05                	jns    2c9e <create_tables+0x9c>
    2c99:	b8 00 00 00 00       	mov    $0x0,%eax
    2c9e:	ba 00 00 00 00       	mov    $0x0,%edx
    2ca3:	64 89 54 85 00       	mov    %edx,%fs:0x0(%ebp,%eax,4)
    2ca8:	8b 04 24             	mov    (%esp),%eax
    2cab:	83 c4 04             	add    $0x4,%esp
    2cae:	5b                   	pop    %ebx
    2caf:	5e                   	pop    %esi
    2cb0:	5f                   	pop    %edi
    2cb1:	5d                   	pop    %ebp
    2cb2:	c3                   	ret    

00002cb3 <change_ldt>:
    2cb3:	57                   	push   %edi
    2cb4:	56                   	push   %esi
    2cb5:	53                   	push   %ebx
    2cb6:	8b 44 24 10          	mov    0x10(%esp),%eax
    2cba:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
    2cc0:	50                   	push   %eax
    2cc1:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2cc7:	8d 81 d8 02 00 00    	lea    0x2d8(%ecx),%eax
    2ccd:	83 c0 07             	add    $0x7,%eax
    2cd0:	8a 30                	mov    (%eax),%dh
    2cd2:	83 e8 03             	sub    $0x3,%eax
    2cd5:	8a 10                	mov    (%eax),%dl
    2cd7:	c1 e2 10             	shl    $0x10,%edx
    2cda:	83 e8 02             	sub    $0x2,%eax
    2cdd:	66 8b 10             	mov    (%eax),%dx
    2ce0:	58                   	pop    %eax
    2ce1:	89 d7                	mov    %edx,%edi
    2ce3:	66 89 91 da 02 00 00 	mov    %dx,0x2da(%ecx)
    2cea:	c1 ca 10             	ror    $0x10,%edx
    2ced:	88 91 dc 02 00 00    	mov    %dl,0x2dc(%ecx)
    2cf3:	88 b1 df 02 00 00    	mov    %dh,0x2df(%ecx)
    2cf9:	c1 ca 10             	ror    $0x10,%edx
    2cfc:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    2d02:	8d 53 ff             	lea    -0x1(%ebx),%edx
    2d05:	c1 ea 0c             	shr    $0xc,%edx
    2d08:	66 89 91 d8 02 00 00 	mov    %dx,0x2d8(%ecx)
    2d0f:	c1 ca 10             	ror    $0x10,%edx
    2d12:	8a b1 de 02 00 00    	mov    0x2de(%ecx),%dh
    2d18:	80 e6 f0             	and    $0xf0,%dh
    2d1b:	08 f2                	or     %dh,%dl
    2d1d:	88 91 de 02 00 00    	mov    %dl,0x2de(%ecx)
    2d23:	c1 ca 10             	ror    $0x10,%edx
    2d26:	89 fa                	mov    %edi,%edx
    2d28:	66 89 91 e2 02 00 00 	mov    %dx,0x2e2(%ecx)
    2d2f:	c1 ca 10             	ror    $0x10,%edx
    2d32:	88 91 e4 02 00 00    	mov    %dl,0x2e4(%ecx)
    2d38:	88 b1 e7 02 00 00    	mov    %dh,0x2e7(%ecx)
    2d3e:	c1 ca 10             	ror    $0x10,%edx
    2d41:	ba ff ff 0d 00       	mov    $0xdffff,%edx
    2d46:	66 89 91 e0 02 00 00 	mov    %dx,0x2e0(%ecx)
    2d4d:	c1 ca 10             	ror    $0x10,%edx
    2d50:	8a b1 e6 02 00 00    	mov    0x2e6(%ecx),%dh
    2d56:	80 e6 f0             	and    $0xf0,%dh
    2d59:	08 f2                	or     %dh,%dl
    2d5b:	88 91 e6 02 00 00    	mov    %dl,0x2e6(%ecx)
    2d61:	c1 ca 10             	ror    $0x10,%edx
    2d64:	6a 17                	push   $0x17
    2d66:	0f a1                	pop    %fs
    2d68:	8d 9f 00 f0 ff df    	lea    -0x20001000(%edi),%ebx
    2d6e:	8b 44 24 14          	mov    0x14(%esp),%eax
    2d72:	8d 70 7c             	lea    0x7c(%eax),%esi
    2d75:	81 ef 00 10 02 20    	sub    $0x20021000,%edi
    2d7b:	8b 06                	mov    (%esi),%eax
    2d7d:	85 c0                	test   %eax,%eax
    2d7f:	74 0d                	je     2d8e <change_ldt+0xdb>
    2d81:	83 ec 08             	sub    $0x8,%esp
    2d84:	53                   	push   %ebx
    2d85:	50                   	push   %eax
    2d86:	e8 fc ff ff ff       	call   2d87 <change_ldt+0xd4>
    2d8b:	83 c4 10             	add    $0x10,%esp
    2d8e:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
    2d94:	83 ee 04             	sub    $0x4,%esi
    2d97:	39 fb                	cmp    %edi,%ebx
    2d99:	75 e0                	jne    2d7b <change_ldt+0xc8>
    2d9b:	b8 00 00 00 e0       	mov    $0xe0000000,%eax
    2da0:	5b                   	pop    %ebx
    2da1:	5e                   	pop    %esi
    2da2:	5f                   	pop    %edi
    2da3:	c3                   	ret    

00002da4 <do_execve>:
    2da4:	55                   	push   %ebp
    2da5:	57                   	push   %edi
    2da6:	56                   	push   %esi
    2da7:	53                   	push   %ebx
    2da8:	81 ec dc 04 00 00    	sub    $0x4dc,%esp
    2dae:	8b 84 24 f0 04 00 00 	mov    0x4f0(%esp),%eax
    2db5:	66 83 78 04 0f       	cmpw   $0xf,0x4(%eax)
    2dba:	74 10                	je     2dcc <do_execve+0x28>
    2dbc:	83 ec 0c             	sub    $0xc,%esp
    2dbf:	68 d8 01 00 00       	push   $0x1d8
    2dc4:	e8 fc ff ff ff       	call   2dc5 <do_execve+0x21>
    2dc9:	83 c4 10             	add    $0x10,%esp
    2dcc:	8d 9c 24 50 04 00 00 	lea    0x450(%esp),%ebx
    2dd3:	8d ac 24 d0 04 00 00 	lea    0x4d0(%esp),%ebp
    2dda:	89 d8                	mov    %ebx,%eax
    2ddc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    2de2:	83 c0 04             	add    $0x4,%eax
    2de5:	39 e8                	cmp    %ebp,%eax
    2de7:	75 f3                	jne    2ddc <do_execve+0x38>
    2de9:	83 ec 0c             	sub    $0xc,%esp
    2dec:	ff b4 24 04 05 00 00 	pushl  0x504(%esp)
    2df3:	e8 fc ff ff ff       	call   2df4 <do_execve+0x50>
    2df8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    2dfc:	83 c4 10             	add    $0x10,%esp
    2dff:	85 c0                	test   %eax,%eax
    2e01:	0f 84 d7 06 00 00    	je     34de <do_execve+0x73a>
    2e07:	83 bc 24 fc 04 00 00 	cmpl   $0x0,0x4fc(%esp)
    2e0e:	00 
    2e0f:	74 2e                	je     2e3f <do_execve+0x9b>
    2e11:	8b 84 24 fc 04 00 00 	mov    0x4fc(%esp),%eax
    2e18:	83 c0 04             	add    $0x4,%eax
    2e1b:	8b bc 24 fc 04 00 00 	mov    0x4fc(%esp),%edi
    2e22:	64 8b 17             	mov    %fs:(%edi),%edx
    2e25:	85 d2                	test   %edx,%edx
    2e27:	74 20                	je     2e49 <do_execve+0xa5>
    2e29:	ba 00 00 00 00       	mov    $0x0,%edx
    2e2e:	42                   	inc    %edx
    2e2f:	64 8b 08             	mov    %fs:(%eax),%ecx
    2e32:	8d 40 04             	lea    0x4(%eax),%eax
    2e35:	85 c9                	test   %ecx,%ecx
    2e37:	75 f5                	jne    2e2e <do_execve+0x8a>
    2e39:	89 54 24 14          	mov    %edx,0x14(%esp)
    2e3d:	eb 12                	jmp    2e51 <do_execve+0xad>
    2e3f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2e46:	00 
    2e47:	eb 08                	jmp    2e51 <do_execve+0xad>
    2e49:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2e50:	00 
    2e51:	83 bc 24 00 05 00 00 	cmpl   $0x0,0x500(%esp)
    2e58:	00 
    2e59:	74 2e                	je     2e89 <do_execve+0xe5>
    2e5b:	8b 84 24 00 05 00 00 	mov    0x500(%esp),%eax
    2e62:	83 c0 04             	add    $0x4,%eax
    2e65:	8b bc 24 00 05 00 00 	mov    0x500(%esp),%edi
    2e6c:	64 8b 17             	mov    %fs:(%edi),%edx
    2e6f:	85 d2                	test   %edx,%edx
    2e71:	74 20                	je     2e93 <do_execve+0xef>
    2e73:	ba 00 00 00 00       	mov    $0x0,%edx
    2e78:	42                   	inc    %edx
    2e79:	64 8b 08             	mov    %fs:(%eax),%ecx
    2e7c:	8d 40 04             	lea    0x4(%eax),%eax
    2e7f:	85 c9                	test   %ecx,%ecx
    2e81:	75 f5                	jne    2e78 <do_execve+0xd4>
    2e83:	89 54 24 20          	mov    %edx,0x20(%esp)
    2e87:	eb 12                	jmp    2e9b <do_execve+0xf7>
    2e89:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2e90:	00 
    2e91:	eb 08                	jmp    2e9b <do_execve+0xf7>
    2e93:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2e9a:	00 
    2e9b:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    2e9f:	8b 17                	mov    (%edi),%edx
    2ea1:	89 d0                	mov    %edx,%eax
    2ea3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    2ea8:	66 3d 00 80          	cmp    $0x8000,%ax
    2eac:	0f 85 95 05 00 00    	jne    3447 <do_execve+0x6a3>
    2eb2:	c7 44 24 18 fc ff 01 	movl   $0x1fffc,0x18(%esp)
    2eb9:	00 
    2eba:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2ec1:	00 
    2ec2:	66 8c e0             	mov    %fs,%ax
    2ec5:	66 89 44 24 0c       	mov    %ax,0xc(%esp)
    2eca:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    2ecf:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    2ed3:	89 fb                	mov    %edi,%ebx
    2ed5:	0f b7 c2             	movzwl %dx,%eax
    2ed8:	f6 c6 08             	test   $0x8,%dh
    2edb:	74 0a                	je     2ee7 <do_execve+0x143>
    2edd:	0f b7 73 02          	movzwl 0x2(%ebx),%esi
    2ee1:	89 74 24 28          	mov    %esi,0x28(%esp)
    2ee5:	eb 11                	jmp    2ef8 <do_execve+0x154>
    2ee7:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2eed:	0f b7 b1 42 02 00 00 	movzwl 0x242(%ecx),%esi
    2ef4:	89 74 24 28          	mov    %esi,0x28(%esp)
    2ef8:	f6 c6 04             	test   $0x4,%dh
    2efb:	74 0a                	je     2f07 <do_execve+0x163>
    2efd:	0f b6 7b 0c          	movzbl 0xc(%ebx),%edi
    2f01:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    2f05:	eb 11                	jmp    2f18 <do_execve+0x174>
    2f07:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f0d:	0f b7 b1 48 02 00 00 	movzwl 0x248(%ecx),%esi
    2f14:	89 74 24 2c          	mov    %esi,0x2c(%esp)
    2f18:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f1e:	66 8b b1 42 02 00 00 	mov    0x242(%ecx),%si
    2f25:	66 3b 73 02          	cmp    0x2(%ebx),%si
    2f29:	75 05                	jne    2f30 <do_execve+0x18c>
    2f2b:	c1 f8 06             	sar    $0x6,%eax
    2f2e:	eb 10                	jmp    2f40 <do_execve+0x19c>
    2f30:	0f b6 7b 0c          	movzbl 0xc(%ebx),%edi
    2f34:	66 39 b9 48 02 00 00 	cmp    %di,0x248(%ecx)
    2f3b:	75 03                	jne    2f40 <do_execve+0x19c>
    2f3d:	c1 f8 03             	sar    $0x3,%eax
    2f40:	a8 01                	test   $0x1,%al
    2f42:	75 12                	jne    2f56 <do_execve+0x1b2>
    2f44:	f6 c2 49             	test   $0x49,%dl
    2f47:	0f 84 01 05 00 00    	je     344e <do_execve+0x6aa>
    2f4d:	66 85 f6             	test   %si,%si
    2f50:	0f 85 07 05 00 00    	jne    345d <do_execve+0x6b9>
    2f56:	83 ec 08             	sub    $0x8,%esp
    2f59:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    2f5d:	50                   	push   %eax
    2f5e:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    2f62:	50                   	push   %eax
    2f63:	e8 fc ff ff ff       	call   2f64 <do_execve+0x1c0>
    2f68:	89 c2                	mov    %eax,%edx
    2f6a:	83 c4 10             	add    $0x10,%esp
    2f6d:	85 c0                	test   %eax,%eax
    2f6f:	0f 84 f7 04 00 00    	je     346c <do_execve+0x6c8>
    2f75:	8b 00                	mov    (%eax),%eax
    2f77:	80 38 23             	cmpb   $0x23,(%eax)
    2f7a:	0f 85 24 02 00 00    	jne    31a4 <do_execve+0x400>
    2f80:	80 78 01 21          	cmpb   $0x21,0x1(%eax)
    2f84:	0f 85 1a 02 00 00    	jne    31a4 <do_execve+0x400>
    2f8a:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    2f8f:	0f 85 0f 02 00 00    	jne    31a4 <do_execve+0x400>
    2f95:	8d 70 02             	lea    0x2(%eax),%esi
    2f98:	8d 7c 24 51          	lea    0x51(%esp),%edi
    2f9c:	b9 fe 03 00 00       	mov    $0x3fe,%ecx
    2fa1:	fc                   	cld    
    2fa2:	49                   	dec    %ecx
    2fa3:	78 08                	js     2fad <do_execve+0x209>
    2fa5:	ac                   	lods   %ds:(%esi),%al
    2fa6:	aa                   	stos   %al,%es:(%edi)
    2fa7:	84 c0                	test   %al,%al
    2fa9:	75 f7                	jne    2fa2 <do_execve+0x1fe>
    2fab:	f3 aa                	rep stos %al,%es:(%edi)
    2fad:	83 ec 0c             	sub    $0xc,%esp
    2fb0:	52                   	push   %edx
    2fb1:	e8 fc ff ff ff       	call   2fb2 <do_execve+0x20e>
    2fb6:	89 1c 24             	mov    %ebx,(%esp)
    2fb9:	e8 fc ff ff ff       	call   2fba <do_execve+0x216>
    2fbe:	c6 84 24 5f 04 00 00 	movb   $0x0,0x45f(%esp)
    2fc5:	00 
    2fc6:	b0 0a                	mov    $0xa,%al
    2fc8:	89 fe                	mov    %edi,%esi
    2fca:	fc                   	cld    
    2fcb:	88 c4                	mov    %al,%ah
    2fcd:	ac                   	lods   %ds:(%esi),%al
    2fce:	38 e0                	cmp    %ah,%al
    2fd0:	74 09                	je     2fdb <do_execve+0x237>
    2fd2:	84 c0                	test   %al,%al
    2fd4:	75 f7                	jne    2fcd <do_execve+0x229>
    2fd6:	be 01 00 00 00       	mov    $0x1,%esi
    2fdb:	89 f0                	mov    %esi,%eax
    2fdd:	48                   	dec    %eax
    2fde:	83 c4 10             	add    $0x10,%esp
    2fe1:	85 c0                	test   %eax,%eax
    2fe3:	0f 84 83 01 00 00    	je     316c <do_execve+0x3c8>
    2fe9:	c6 00 00             	movb   $0x0,(%eax)
    2fec:	8d 5c 24 51          	lea    0x51(%esp),%ebx
    2ff0:	eb 01                	jmp    2ff3 <do_execve+0x24f>
    2ff2:	43                   	inc    %ebx
    2ff3:	8a 03                	mov    (%ebx),%al
    2ff5:	3c 20                	cmp    $0x20,%al
    2ff7:	74 f9                	je     2ff2 <do_execve+0x24e>
    2ff9:	3c 09                	cmp    $0x9,%al
    2ffb:	74 f5                	je     2ff2 <do_execve+0x24e>
    2ffd:	85 db                	test   %ebx,%ebx
    2fff:	0f 84 75 01 00 00    	je     317a <do_execve+0x3d6>
    3005:	84 c0                	test   %al,%al
    3007:	0f 84 7b 01 00 00    	je     3188 <do_execve+0x3e4>
    300d:	89 5c 24 48          	mov    %ebx,0x48(%esp)
    3011:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    3018:	00 
    3019:	3c 20                	cmp    $0x20,%al
    301b:	0f 84 c4 04 00 00    	je     34e5 <do_execve+0x741>
    3021:	3c 09                	cmp    $0x9,%al
    3023:	0f 84 c0 04 00 00    	je     34e9 <do_execve+0x745>
    3029:	8d 53 01             	lea    0x1(%ebx),%edx
    302c:	3c 2f                	cmp    $0x2f,%al
    302e:	75 04                	jne    3034 <do_execve+0x290>
    3030:	89 54 24 48          	mov    %edx,0x48(%esp)
    3034:	89 d1                	mov    %edx,%ecx
    3036:	8a 02                	mov    (%edx),%al
    3038:	84 c0                	test   %al,%al
    303a:	74 12                	je     304e <do_execve+0x2aa>
    303c:	3c 20                	cmp    $0x20,%al
    303e:	0f 84 a7 04 00 00    	je     34eb <do_execve+0x747>
    3044:	42                   	inc    %edx
    3045:	3c 09                	cmp    $0x9,%al
    3047:	75 e3                	jne    302c <do_execve+0x288>
    3049:	e9 9d 04 00 00       	jmp    34eb <do_execve+0x747>
    304e:	83 ec 08             	sub    $0x8,%esp
    3051:	6a 00                	push   $0x0
    3053:	ff 74 24 24          	pushl  0x24(%esp)
    3057:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    305e:	8b 94 24 10 05 00 00 	mov    0x510(%esp),%edx
    3065:	8b 44 24 30          	mov    0x30(%esp),%eax
    3069:	e8 e4 f8 ff ff       	call   2952 <copy_strings>
    306e:	8b b4 24 0c 05 00 00 	mov    0x50c(%esp),%esi
    3075:	8d 56 04             	lea    0x4(%esi),%edx
    3078:	8b 7c 24 24          	mov    0x24(%esp),%edi
    307c:	8d 77 ff             	lea    -0x1(%edi),%esi
    307f:	83 c4 08             	add    $0x8,%esp
    3082:	6a 00                	push   $0x0
    3084:	50                   	push   %eax
    3085:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    308c:	89 f0                	mov    %esi,%eax
    308e:	e8 bf f8 ff ff       	call   2952 <copy_strings>
    3093:	83 c4 08             	add    $0x8,%esp
    3096:	6a 01                	push   $0x1
    3098:	50                   	push   %eax
    3099:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30a0:	8d 94 24 08 05 00 00 	lea    0x508(%esp),%edx
    30a7:	b8 01 00 00 00       	mov    $0x1,%eax
    30ac:	e8 a1 f8 ff ff       	call   2952 <copy_strings>
    30b1:	83 c4 10             	add    $0x10,%esp
    30b4:	83 7c 24 4c 00       	cmpl   $0x0,0x4c(%esp)
    30b9:	74 23                	je     30de <do_execve+0x33a>
    30bb:	83 ec 08             	sub    $0x8,%esp
    30be:	6a 02                	push   $0x2
    30c0:	50                   	push   %eax
    30c1:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30c8:	8d 54 24 5c          	lea    0x5c(%esp),%edx
    30cc:	b8 01 00 00 00       	mov    $0x1,%eax
    30d1:	e8 7c f8 ff ff       	call   2952 <copy_strings>
    30d6:	47                   	inc    %edi
    30d7:	89 7c 24 24          	mov    %edi,0x24(%esp)
    30db:	83 c4 10             	add    $0x10,%esp
    30de:	83 ec 08             	sub    $0x8,%esp
    30e1:	6a 02                	push   $0x2
    30e3:	50                   	push   %eax
    30e4:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30eb:	8d 54 24 58          	lea    0x58(%esp),%edx
    30ef:	b8 01 00 00 00       	mov    $0x1,%eax
    30f4:	e8 59 f8 ff ff       	call   2952 <copy_strings>
    30f9:	89 44 24 28          	mov    %eax,0x28(%esp)
    30fd:	ff 44 24 24          	incl   0x24(%esp)
    3101:	83 c4 10             	add    $0x10,%esp
    3104:	85 c0                	test   %eax,%eax
    3106:	0f 84 8a 00 00 00    	je     3196 <do_execve+0x3f2>
    310c:	8b 7c 24 24          	mov    0x24(%esp),%edi
    3110:	66 8c d8             	mov    %ds,%ax
    3113:	8e e0                	mov    %eax,%fs
    3115:	83 ec 0c             	sub    $0xc,%esp
    3118:	53                   	push   %ebx
    3119:	e8 fc ff ff ff       	call   311a <do_execve+0x376>
    311e:	89 c3                	mov    %eax,%ebx
    3120:	83 c4 10             	add    $0x10,%esp
    3123:	85 c0                	test   %eax,%eax
    3125:	75 12                	jne    3139 <do_execve+0x395>
    3127:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    312b:	89 f8                	mov    %edi,%eax
    312d:	8e e0                	mov    %eax,%fs
    312f:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    3134:	e9 79 03 00 00       	jmp    34b2 <do_execve+0x70e>
    3139:	8b 44 24 0c          	mov    0xc(%esp),%eax
    313d:	8e e0                	mov    %eax,%fs
    313f:	8b 13                	mov    (%ebx),%edx
    3141:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    3148:	00 
    3149:	89 d0                	mov    %edx,%eax
    314b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    3150:	66 3d 00 80          	cmp    $0x8000,%ax
    3154:	0f 84 7b fd ff ff    	je     2ed5 <do_execve+0x131>
    315a:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    315e:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3162:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3167:	e9 37 03 00 00       	jmp    34a3 <do_execve+0x6ff>
    316c:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3170:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    3175:	e9 38 03 00 00       	jmp    34b2 <do_execve+0x70e>
    317a:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    317e:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    3183:	e9 2a 03 00 00       	jmp    34b2 <do_execve+0x70e>
    3188:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    318c:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    3191:	e9 1c 03 00 00       	jmp    34b2 <do_execve+0x70e>
    3196:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    319a:	be f4 ff ff ff       	mov    $0xfffffff4,%esi
    319f:	e9 0e 03 00 00       	jmp    34b2 <do_execve+0x70e>
    31a4:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    31a8:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31ac:	8b 30                	mov    (%eax),%esi
    31ae:	8b 78 04             	mov    0x4(%eax),%edi
    31b1:	89 7c 24 24          	mov    %edi,0x24(%esp)
    31b5:	8b 78 08             	mov    0x8(%eax),%edi
    31b8:	89 7c 24 3c          	mov    %edi,0x3c(%esp)
    31bc:	8b 78 0c             	mov    0xc(%eax),%edi
    31bf:	89 7c 24 38          	mov    %edi,0x38(%esp)
    31c3:	8b 78 10             	mov    0x10(%eax),%edi
    31c6:	89 7c 24 30          	mov    %edi,0x30(%esp)
    31ca:	8b 78 14             	mov    0x14(%eax),%edi
    31cd:	89 7c 24 34          	mov    %edi,0x34(%esp)
    31d1:	8b 78 18             	mov    0x18(%eax),%edi
    31d4:	8b 40 1c             	mov    0x1c(%eax),%eax
    31d7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    31db:	83 ec 0c             	sub    $0xc,%esp
    31de:	52                   	push   %edx
    31df:	e8 fc ff ff ff       	call   31e0 <do_execve+0x43c>
    31e4:	83 c4 10             	add    $0x10,%esp
    31e7:	81 fe 0b 01 00 00    	cmp    $0x10b,%esi
    31ed:	0f 85 88 02 00 00    	jne    347b <do_execve+0x6d7>
    31f3:	85 ff                	test   %edi,%edi
    31f5:	0f 85 87 02 00 00    	jne    3482 <do_execve+0x6de>
    31fb:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    3200:	0f 85 83 02 00 00    	jne    3489 <do_execve+0x6e5>
    3206:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    320a:	03 74 24 24          	add    0x24(%esp),%esi
    320e:	8b 7c 24 38          	mov    0x38(%esp),%edi
    3212:	01 f7                	add    %esi,%edi
    3214:	81 ff 00 00 00 03    	cmp    $0x3000000,%edi
    321a:	0f 87 70 02 00 00    	ja     3490 <do_execve+0x6ec>
    3220:	8b 44 24 30          	mov    0x30(%esp),%eax
    3224:	8d 84 30 00 04 00 00 	lea    0x400(%eax,%esi,1),%eax
    322b:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    322f:	39 41 04             	cmp    %eax,0x4(%ecx)
    3232:	0f 82 5f 02 00 00    	jb     3497 <do_execve+0x6f3>
    3238:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    323d:	75 4c                	jne    328b <do_execve+0x4e7>
    323f:	83 ec 08             	sub    $0x8,%esp
    3242:	6a 00                	push   $0x0
    3244:	ff 74 24 24          	pushl  0x24(%esp)
    3248:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    324f:	8b 94 24 10 05 00 00 	mov    0x510(%esp),%edx
    3256:	8b 44 24 30          	mov    0x30(%esp),%eax
    325a:	e8 f3 f6 ff ff       	call   2952 <copy_strings>
    325f:	83 c4 08             	add    $0x8,%esp
    3262:	6a 00                	push   $0x0
    3264:	50                   	push   %eax
    3265:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    326c:	8b 94 24 0c 05 00 00 	mov    0x50c(%esp),%edx
    3273:	8b 44 24 24          	mov    0x24(%esp),%eax
    3277:	e8 d6 f6 ff ff       	call   2952 <copy_strings>
    327c:	89 44 24 28          	mov    %eax,0x28(%esp)
    3280:	83 c4 10             	add    $0x10,%esp
    3283:	85 c0                	test   %eax,%eax
    3285:	0f 84 13 02 00 00    	je     349e <do_execve+0x6fa>
    328b:	a1 00 00 00 00       	mov    0x0,%eax
    3290:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
    3296:	85 c0                	test   %eax,%eax
    3298:	74 0c                	je     32a6 <do_execve+0x502>
    329a:	83 ec 0c             	sub    $0xc,%esp
    329d:	50                   	push   %eax
    329e:	e8 fc ff ff ff       	call   329f <do_execve+0x4fb>
    32a3:	83 c4 10             	add    $0x10,%esp
    32a6:	8b 15 00 00 00 00    	mov    0x0,%edx
    32ac:	8b 44 24 0c          	mov    0xc(%esp),%eax
    32b0:	89 82 78 02 00 00    	mov    %eax,0x278(%edx)
    32b6:	8d 42 10             	lea    0x10(%edx),%eax
    32b9:	81 c2 10 02 00 00    	add    $0x210,%edx
    32bf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    32c5:	83 c0 10             	add    $0x10,%eax
    32c8:	39 d0                	cmp    %edx,%eax
    32ca:	75 f3                	jne    32bf <do_execve+0x51b>
    32cc:	bb 00 00 00 00       	mov    $0x0,%ebx
    32d1:	a1 00 00 00 00       	mov    0x0,%eax
    32d6:	8b 80 7c 02 00 00    	mov    0x27c(%eax),%eax
    32dc:	88 d9                	mov    %bl,%cl
    32de:	d3 e8                	shr    %cl,%eax
    32e0:	a8 01                	test   $0x1,%al
    32e2:	74 0c                	je     32f0 <do_execve+0x54c>
    32e4:	83 ec 0c             	sub    $0xc,%esp
    32e7:	53                   	push   %ebx
    32e8:	e8 fc ff ff ff       	call   32e9 <do_execve+0x545>
    32ed:	83 c4 10             	add    $0x10,%esp
    32f0:	43                   	inc    %ebx
    32f1:	83 fb 14             	cmp    $0x14,%ebx
    32f4:	75 db                	jne    32d1 <do_execve+0x52d>
    32f6:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    32fc:	c7 81 7c 02 00 00 00 	movl   $0x0,0x27c(%ecx)
    3303:	00 00 00 
    3306:	bb 0f 00 00 00       	mov    $0xf,%ebx
    330b:	0f 03 db             	lsl    %bx,%ebx
    330e:	43                   	inc    %ebx
    330f:	50                   	push   %eax
    3310:	8d 81 d8 02 00 00    	lea    0x2d8(%ecx),%eax
    3316:	83 c0 07             	add    $0x7,%eax
    3319:	8a 30                	mov    (%eax),%dh
    331b:	83 e8 03             	sub    $0x3,%eax
    331e:	8a 10                	mov    (%eax),%dl
    3320:	c1 e2 10             	shl    $0x10,%edx
    3323:	83 e8 02             	sub    $0x2,%eax
    3326:	66 8b 10             	mov    (%eax),%dx
    3329:	58                   	pop    %eax
    332a:	6a 01                	push   $0x1
    332c:	51                   	push   %ecx
    332d:	53                   	push   %ebx
    332e:	52                   	push   %edx
    332f:	e8 fc ff ff ff       	call   3330 <do_execve+0x58c>
    3334:	b9 17 00 00 00       	mov    $0x17,%ecx
    3339:	0f 03 c9             	lsl    %cx,%ecx
    333c:	41                   	inc    %ecx
    333d:	50                   	push   %eax
    333e:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    3344:	8d 83 e0 02 00 00    	lea    0x2e0(%ebx),%eax
    334a:	83 c0 07             	add    $0x7,%eax
    334d:	8a 30                	mov    (%eax),%dh
    334f:	83 e8 03             	sub    $0x3,%eax
    3352:	8a 10                	mov    (%eax),%dl
    3354:	c1 e2 10             	shl    $0x10,%edx
    3357:	83 e8 02             	sub    $0x2,%eax
    335a:	66 8b 10             	mov    (%eax),%dx
    335d:	58                   	pop    %eax
    335e:	6a 01                	push   $0x1
    3360:	53                   	push   %ebx
    3361:	51                   	push   %ecx
    3362:	52                   	push   %edx
    3363:	e8 fc ff ff ff       	call   3364 <do_execve+0x5c0>
    3368:	a1 00 00 00 00       	mov    0x0,%eax
    336d:	83 c4 20             	add    $0x20,%esp
    3370:	39 05 00 00 00 00    	cmp    %eax,0x0
    3376:	75 0a                	jne    3382 <do_execve+0x5de>
    3378:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
    337f:	00 00 00 
    3382:	66 c7 80 64 02 00 00 	movw   $0x0,0x264(%eax)
    3389:	00 00 
    338b:	83 ec 08             	sub    $0x8,%esp
    338e:	8d 84 24 58 04 00 00 	lea    0x458(%esp),%eax
    3395:	50                   	push   %eax
    3396:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    339a:	55                   	push   %ebp
    339b:	e8 fc ff ff ff       	call   339c <do_execve+0x5f8>
    33a0:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    33a4:	8d 9c 01 00 00 fe ff 	lea    -0x20000(%ecx,%eax,1),%ebx
    33ab:	83 c4 0c             	add    $0xc,%esp
    33ae:	55                   	push   %ebp
    33af:	a1 00 00 00 00       	mov    0x0,%eax
    33b4:	ff b0 78 02 00 00    	pushl  0x278(%eax)
    33ba:	68 fc 01 00 00       	push   $0x1fc
    33bf:	e8 fc ff ff ff       	call   33c0 <do_execve+0x61c>
    33c4:	83 c4 0c             	add    $0xc,%esp
    33c7:	ff 74 24 24          	pushl  0x24(%esp)
    33cb:	ff 74 24 1c          	pushl  0x1c(%esp)
    33cf:	53                   	push   %ebx
    33d0:	e8 fc ff ff ff       	call   33d1 <do_execve+0x62d>
    33d5:	8b 15 00 00 00 00    	mov    0x0,%edx
    33db:	89 aa 1c 02 00 00    	mov    %ebp,0x21c(%edx)
    33e1:	89 b2 20 02 00 00    	mov    %esi,0x220(%edx)
    33e7:	89 ba 24 02 00 00    	mov    %edi,0x224(%edx)
    33ed:	89 c1                	mov    %eax,%ecx
    33ef:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
    33f5:	89 8a 28 02 00 00    	mov    %ecx,0x228(%edx)
    33fb:	8b 7c 24 38          	mov    0x38(%esp),%edi
    33ff:	66 89 ba 42 02 00 00 	mov    %di,0x242(%edx)
    3406:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    340a:	66 89 ba 48 02 00 00 	mov    %di,0x248(%edx)
    3411:	89 f2                	mov    %esi,%edx
    3413:	83 c4 10             	add    $0x10,%esp
    3416:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
    341c:	74 0f                	je     342d <do_execve+0x689>
    341e:	b1 00                	mov    $0x0,%cl
    3420:	42                   	inc    %edx
    3421:	64 88 4a ff          	mov    %cl,%fs:-0x1(%edx)
    3425:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
    342b:	75 f3                	jne    3420 <do_execve+0x67c>
    342d:	8b b4 24 f0 04 00 00 	mov    0x4f0(%esp),%esi
    3434:	8b 7c 24 34          	mov    0x34(%esp),%edi
    3438:	89 3e                	mov    %edi,(%esi)
    343a:	89 46 0c             	mov    %eax,0xc(%esi)
    343d:	b8 00 00 00 00       	mov    $0x0,%eax
    3442:	e9 b1 00 00 00       	jmp    34f8 <do_execve+0x754>
    3447:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    344c:	eb 55                	jmp    34a3 <do_execve+0x6ff>
    344e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3452:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3456:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    345b:	eb 46                	jmp    34a3 <do_execve+0x6ff>
    345d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3461:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3465:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    346a:	eb 37                	jmp    34a3 <do_execve+0x6ff>
    346c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3470:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3474:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3479:	eb 28                	jmp    34a3 <do_execve+0x6ff>
    347b:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    3480:	eb 21                	jmp    34a3 <do_execve+0x6ff>
    3482:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    3487:	eb 1a                	jmp    34a3 <do_execve+0x6ff>
    3489:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    348e:	eb 13                	jmp    34a3 <do_execve+0x6ff>
    3490:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    3495:	eb 0c                	jmp    34a3 <do_execve+0x6ff>
    3497:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    349c:	eb 05                	jmp    34a3 <do_execve+0x6ff>
    349e:	be f4 ff ff ff       	mov    $0xfffffff4,%esi
    34a3:	83 ec 0c             	sub    $0xc,%esp
    34a6:	ff 74 24 18          	pushl  0x18(%esp)
    34aa:	e8 fc ff ff ff       	call   34ab <do_execve+0x707>
    34af:	83 c4 10             	add    $0x10,%esp
    34b2:	83 ec 0c             	sub    $0xc,%esp
    34b5:	ff 33                	pushl  (%ebx)
    34b7:	e8 fc ff ff ff       	call   34b8 <do_execve+0x714>
    34bc:	83 c4 10             	add    $0x10,%esp
    34bf:	85 c0                	test   %eax,%eax
    34c1:	75 10                	jne    34d3 <do_execve+0x72f>
    34c3:	83 ec 0c             	sub    $0xc,%esp
    34c6:	68 28 02 00 00       	push   $0x228
    34cb:	e8 fc ff ff ff       	call   34cc <do_execve+0x728>
    34d0:	83 c4 10             	add    $0x10,%esp
    34d3:	83 c3 04             	add    $0x4,%ebx
    34d6:	39 eb                	cmp    %ebp,%ebx
    34d8:	75 d8                	jne    34b2 <do_execve+0x70e>
    34da:	89 f0                	mov    %esi,%eax
    34dc:	eb 1a                	jmp    34f8 <do_execve+0x754>
    34de:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    34e3:	eb 13                	jmp    34f8 <do_execve+0x754>
    34e5:	89 d9                	mov    %ebx,%ecx
    34e7:	eb 02                	jmp    34eb <do_execve+0x747>
    34e9:	89 d9                	mov    %ebx,%ecx
    34eb:	c6 01 00             	movb   $0x0,(%ecx)
    34ee:	41                   	inc    %ecx
    34ef:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
    34f3:	e9 56 fb ff ff       	jmp    304e <do_execve+0x2aa>
    34f8:	81 c4 dc 04 00 00    	add    $0x4dc,%esp
    34fe:	5b                   	pop    %ebx
    34ff:	5e                   	pop    %esi
    3500:	5f                   	pop    %edi
    3501:	5d                   	pop    %ebp
    3502:	c3                   	ret    

00003503 <read_pipe>:
    3503:	55                   	push   %ebp
    3504:	57                   	push   %edi
    3505:	56                   	push   %esi
    3506:	53                   	push   %ebx
    3507:	83 ec 1c             	sub    $0x1c,%esp
    350a:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    350e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3515:	00 
    3516:	8d 7b 20             	lea    0x20(%ebx),%edi
    3519:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    351e:	0f 8f a6 00 00 00    	jg     35ca <read_pipe+0xc7>
    3524:	e9 be 00 00 00       	jmp    35e7 <read_pipe+0xe4>
    3529:	83 ec 0c             	sub    $0xc,%esp
    352c:	57                   	push   %edi
    352d:	e8 fc ff ff ff       	call   352e <read_pipe+0x2b>
    3532:	83 c4 10             	add    $0x10,%esp
    3535:	66 83 7b 30 02       	cmpw   $0x2,0x30(%ebx)
    353a:	0f 85 b6 00 00 00    	jne    35f6 <read_pipe+0xf3>
    3540:	83 ec 0c             	sub    $0xc,%esp
    3543:	57                   	push   %edi
    3544:	e8 fc ff ff ff       	call   3545 <read_pipe+0x42>
    3549:	8b 53 10             	mov    0x10(%ebx),%edx
    354c:	0f b7 c2             	movzwl %dx,%eax
    354f:	0f b7 4b 0e          	movzwl 0xe(%ebx),%ecx
    3553:	29 c1                	sub    %eax,%ecx
    3555:	83 c4 10             	add    $0x10,%esp
    3558:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    355e:	74 c9                	je     3529 <read_pipe+0x26>
    3560:	be 00 10 00 00       	mov    $0x1000,%esi
    3565:	29 c6                	sub    %eax,%esi
    3567:	8b 6c 24 38          	mov    0x38(%esp),%ebp
    356b:	39 cd                	cmp    %ecx,%ebp
    356d:	7e 02                	jle    3571 <read_pipe+0x6e>
    356f:	89 cd                	mov    %ecx,%ebp
    3571:	89 f1                	mov    %esi,%ecx
    3573:	39 ee                	cmp    %ebp,%esi
    3575:	7e 02                	jle    3579 <read_pipe+0x76>
    3577:	89 e9                	mov    %ebp,%ecx
    3579:	29 4c 24 38          	sub    %ecx,0x38(%esp)
    357d:	01 4c 24 0c          	add    %ecx,0xc(%esp)
    3581:	01 ca                	add    %ecx,%edx
    3583:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    3589:	66 89 53 10          	mov    %dx,0x10(%ebx)
    358d:	85 c9                	test   %ecx,%ecx
    358f:	7e 30                	jle    35c1 <read_pipe+0xbe>
    3591:	8b 6b 04             	mov    0x4(%ebx),%ebp
    3594:	03 4c 24 34          	add    0x34(%esp),%ecx
    3598:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    359c:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    35a0:	29 c8                	sub    %ecx,%eax
    35a2:	89 c6                	mov    %eax,%esi
    35a4:	8d 41 01             	lea    0x1(%ecx),%eax
    35a7:	8d 14 30             	lea    (%eax,%esi,1),%edx
    35aa:	8a 54 2a ff          	mov    -0x1(%edx,%ebp,1),%dl
    35ae:	64 88 11             	mov    %dl,%fs:(%ecx)
    35b1:	89 c1                	mov    %eax,%ecx
    35b3:	3b 44 24 08          	cmp    0x8(%esp),%eax
    35b7:	75 eb                	jne    35a4 <read_pipe+0xa1>
    35b9:	8b 44 24 08          	mov    0x8(%esp),%eax
    35bd:	89 44 24 34          	mov    %eax,0x34(%esp)
    35c1:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    35c6:	7f 02                	jg     35ca <read_pipe+0xc7>
    35c8:	eb 1d                	jmp    35e7 <read_pipe+0xe4>
    35ca:	8b 53 10             	mov    0x10(%ebx),%edx
    35cd:	0f b7 c2             	movzwl %dx,%eax
    35d0:	0f b7 4b 0e          	movzwl 0xe(%ebx),%ecx
    35d4:	29 c1                	sub    %eax,%ecx
    35d6:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    35dc:	0f 84 47 ff ff ff    	je     3529 <read_pipe+0x26>
    35e2:	e9 79 ff ff ff       	jmp    3560 <read_pipe+0x5d>
    35e7:	83 ec 0c             	sub    $0xc,%esp
    35ea:	83 c3 20             	add    $0x20,%ebx
    35ed:	53                   	push   %ebx
    35ee:	e8 fc ff ff ff       	call   35ef <read_pipe+0xec>
    35f3:	83 c4 10             	add    $0x10,%esp
    35f6:	8b 44 24 0c          	mov    0xc(%esp),%eax
    35fa:	83 c4 1c             	add    $0x1c,%esp
    35fd:	5b                   	pop    %ebx
    35fe:	5e                   	pop    %esi
    35ff:	5f                   	pop    %edi
    3600:	5d                   	pop    %ebp
    3601:	c3                   	ret    

00003602 <write_pipe>:
    3602:	55                   	push   %ebp
    3603:	57                   	push   %edi
    3604:	56                   	push   %esi
    3605:	53                   	push   %ebx
    3606:	83 ec 1c             	sub    $0x1c,%esp
    3609:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    360d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3614:	00 
    3615:	8d 73 20             	lea    0x20(%ebx),%esi
    3618:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    361d:	0f 8f b9 00 00 00    	jg     36dc <write_pipe+0xda>
    3623:	e9 d4 00 00 00       	jmp    36fc <write_pipe+0xfa>
    3628:	83 ec 0c             	sub    $0xc,%esp
    362b:	56                   	push   %esi
    362c:	e8 fc ff ff ff       	call   362d <write_pipe+0x2b>
    3631:	83 c4 10             	add    $0x10,%esp
    3634:	66 83 7b 30 02       	cmpw   $0x2,0x30(%ebx)
    3639:	74 1d                	je     3658 <write_pipe+0x56>
    363b:	a1 00 00 00 00       	mov    0x0,%eax
    3640:	81 48 0c 00 10 00 00 	orl    $0x1000,0xc(%eax)
    3647:	8b 44 24 0c          	mov    0xc(%esp),%eax
    364b:	85 c0                	test   %eax,%eax
    364d:	0f 84 be 00 00 00    	je     3711 <write_pipe+0x10f>
    3653:	e9 be 00 00 00       	jmp    3716 <write_pipe+0x114>
    3658:	83 ec 0c             	sub    $0xc,%esp
    365b:	56                   	push   %esi
    365c:	e8 fc ff ff ff       	call   365d <write_pipe+0x5b>
    3661:	66 8b 53 0e          	mov    0xe(%ebx),%dx
    3665:	0f b7 ca             	movzwl %dx,%ecx
    3668:	0f b7 43 10          	movzwl 0x10(%ebx),%eax
    366c:	89 cf                	mov    %ecx,%edi
    366e:	29 c7                	sub    %eax,%edi
    3670:	89 f8                	mov    %edi,%eax
    3672:	f7 d0                	not    %eax
    3674:	83 c4 10             	add    $0x10,%esp
    3677:	25 ff 0f 00 00       	and    $0xfff,%eax
    367c:	74 aa                	je     3628 <write_pipe+0x26>
    367e:	bd 00 10 00 00       	mov    $0x1000,%ebp
    3683:	29 cd                	sub    %ecx,%ebp
    3685:	8b 7c 24 38          	mov    0x38(%esp),%edi
    3689:	39 c7                	cmp    %eax,%edi
    368b:	7e 02                	jle    368f <write_pipe+0x8d>
    368d:	89 c7                	mov    %eax,%edi
    368f:	89 e8                	mov    %ebp,%eax
    3691:	39 fd                	cmp    %edi,%ebp
    3693:	7e 02                	jle    3697 <write_pipe+0x95>
    3695:	89 f8                	mov    %edi,%eax
    3697:	29 44 24 38          	sub    %eax,0x38(%esp)
    369b:	01 44 24 0c          	add    %eax,0xc(%esp)
    369f:	01 c2                	add    %eax,%edx
    36a1:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    36a7:	66 89 53 0e          	mov    %dx,0xe(%ebx)
    36ab:	85 c0                	test   %eax,%eax
    36ad:	7e 24                	jle    36d3 <write_pipe+0xd1>
    36af:	03 44 24 34          	add    0x34(%esp),%eax
    36b3:	89 c7                	mov    %eax,%edi
    36b5:	8b 44 24 34          	mov    0x34(%esp),%eax
    36b9:	29 c1                	sub    %eax,%ecx
    36bb:	89 cd                	mov    %ecx,%ebp
    36bd:	8d 50 01             	lea    0x1(%eax),%edx
    36c0:	64 8a 08             	mov    %fs:(%eax),%cl
    36c3:	03 43 04             	add    0x4(%ebx),%eax
    36c6:	88 0c 28             	mov    %cl,(%eax,%ebp,1)
    36c9:	89 d0                	mov    %edx,%eax
    36cb:	39 fa                	cmp    %edi,%edx
    36cd:	75 ee                	jne    36bd <write_pipe+0xbb>
    36cf:	89 7c 24 34          	mov    %edi,0x34(%esp)
    36d3:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    36d8:	7f 02                	jg     36dc <write_pipe+0xda>
    36da:	eb 20                	jmp    36fc <write_pipe+0xfa>
    36dc:	66 8b 53 0e          	mov    0xe(%ebx),%dx
    36e0:	0f b7 ca             	movzwl %dx,%ecx
    36e3:	0f b7 43 10          	movzwl 0x10(%ebx),%eax
    36e7:	89 cf                	mov    %ecx,%edi
    36e9:	29 c7                	sub    %eax,%edi
    36eb:	89 f8                	mov    %edi,%eax
    36ed:	f7 d0                	not    %eax
    36ef:	25 ff 0f 00 00       	and    $0xfff,%eax
    36f4:	0f 84 2e ff ff ff    	je     3628 <write_pipe+0x26>
    36fa:	eb 82                	jmp    367e <write_pipe+0x7c>
    36fc:	83 ec 0c             	sub    $0xc,%esp
    36ff:	83 c3 20             	add    $0x20,%ebx
    3702:	53                   	push   %ebx
    3703:	e8 fc ff ff ff       	call   3704 <write_pipe+0x102>
    3708:	83 c4 10             	add    $0x10,%esp
    370b:	8b 44 24 0c          	mov    0xc(%esp),%eax
    370f:	eb 05                	jmp    3716 <write_pipe+0x114>
    3711:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3716:	83 c4 1c             	add    $0x1c,%esp
    3719:	5b                   	pop    %ebx
    371a:	5e                   	pop    %esi
    371b:	5f                   	pop    %edi
    371c:	5d                   	pop    %ebp
    371d:	c3                   	ret    

0000371e <sys_pipe>:
    371e:	56                   	push   %esi
    371f:	53                   	push   %ebx
    3720:	83 ec 14             	sub    $0x14,%esp
    3723:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    3727:	b8 00 00 00 00       	mov    $0x0,%eax
    372c:	be 00 04 00 00       	mov    $0x400,%esi
    3731:	ba 00 00 00 00       	mov    $0x0,%edx
    3736:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
    373b:	75 0b                	jne    3748 <sys_pipe+0x2a>
    373d:	89 44 94 08          	mov    %eax,0x8(%esp,%edx,4)
    3741:	66 ff 40 04          	incw   0x4(%eax)
    3745:	8d 52 01             	lea    0x1(%edx),%edx
    3748:	83 fa 01             	cmp    $0x1,%edx
    374b:	0f 8f 03 01 00 00    	jg     3854 <sys_pipe+0x136>
    3751:	83 c0 10             	add    $0x10,%eax
    3754:	39 c6                	cmp    %eax,%esi
    3756:	75 de                	jne    3736 <sys_pipe+0x18>
    3758:	e9 e8 00 00 00       	jmp    3845 <sys_pipe+0x127>
    375d:	8b 44 24 08          	mov    0x8(%esp),%eax
    3761:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    3767:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    376c:	e9 27 01 00 00       	jmp    3898 <sys_pipe+0x17a>
    3771:	83 bc 81 80 02 00 00 	cmpl   $0x0,0x280(%ecx,%eax,4)
    3778:	00 
    3779:	75 0f                	jne    378a <sys_pipe+0x6c>
    377b:	89 04 94             	mov    %eax,(%esp,%edx,4)
    377e:	8b 74 94 08          	mov    0x8(%esp,%edx,4),%esi
    3782:	89 b4 81 80 02 00 00 	mov    %esi,0x280(%ecx,%eax,4)
    3789:	42                   	inc    %edx
    378a:	40                   	inc    %eax
    378b:	83 fa 01             	cmp    $0x1,%edx
    378e:	0f 8f fa 00 00 00    	jg     388e <sys_pipe+0x170>
    3794:	83 f8 14             	cmp    $0x14,%eax
    3797:	75 d8                	jne    3771 <sys_pipe+0x53>
    3799:	e9 d4 00 00 00       	jmp    3872 <sys_pipe+0x154>
    379e:	8b 04 24             	mov    (%esp),%eax
    37a1:	c7 84 81 80 02 00 00 	movl   $0x0,0x280(%ecx,%eax,4)
    37a8:	00 00 00 00 
    37ac:	8b 44 24 0c          	mov    0xc(%esp),%eax
    37b0:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    37b6:	8b 44 24 08          	mov    0x8(%esp),%eax
    37ba:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    37c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    37c5:	e9 ce 00 00 00       	jmp    3898 <sys_pipe+0x17a>
    37ca:	a1 00 00 00 00       	mov    0x0,%eax
    37cf:	8b 54 24 04          	mov    0x4(%esp),%edx
    37d3:	c7 84 90 80 02 00 00 	movl   $0x0,0x280(%eax,%edx,4)
    37da:	00 00 00 00 
    37de:	8b 14 24             	mov    (%esp),%edx
    37e1:	c7 84 90 80 02 00 00 	movl   $0x0,0x280(%eax,%edx,4)
    37e8:	00 00 00 00 
    37ec:	8b 44 24 0c          	mov    0xc(%esp),%eax
    37f0:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    37f6:	8b 44 24 08          	mov    0x8(%esp),%eax
    37fa:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    3800:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3805:	e9 8e 00 00 00       	jmp    3898 <sys_pipe+0x17a>
    380a:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    380e:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3812:	89 42 08             	mov    %eax,0x8(%edx)
    3815:	89 41 08             	mov    %eax,0x8(%ecx)
    3818:	c7 42 0c 00 00 00 00 	movl   $0x0,0xc(%edx)
    381f:	c7 41 0c 00 00 00 00 	movl   $0x0,0xc(%ecx)
    3826:	66 c7 01 01 00       	movw   $0x1,(%ecx)
    382b:	66 c7 02 02 00       	movw   $0x2,(%edx)
    3830:	8b 04 24             	mov    (%esp),%eax
    3833:	64 89 03             	mov    %eax,%fs:(%ebx)
    3836:	8b 44 24 04          	mov    0x4(%esp),%eax
    383a:	64 89 43 04          	mov    %eax,%fs:0x4(%ebx)
    383e:	b8 00 00 00 00       	mov    $0x0,%eax
    3843:	eb 53                	jmp    3898 <sys_pipe+0x17a>
    3845:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    384a:	83 fa 01             	cmp    $0x1,%edx
    384d:	75 49                	jne    3898 <sys_pipe+0x17a>
    384f:	e9 09 ff ff ff       	jmp    375d <sys_pipe+0x3f>
    3854:	83 fa 01             	cmp    $0x1,%edx
    3857:	0f 84 00 ff ff ff    	je     375d <sys_pipe+0x3f>
    385d:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    3863:	ba 00 00 00 00       	mov    $0x0,%edx
    3868:	b8 00 00 00 00       	mov    $0x0,%eax
    386d:	e9 ff fe ff ff       	jmp    3771 <sys_pipe+0x53>
    3872:	83 fa 01             	cmp    $0x1,%edx
    3875:	0f 84 23 ff ff ff    	je     379e <sys_pipe+0x80>
    387b:	e9 2c ff ff ff       	jmp    37ac <sys_pipe+0x8e>
    3880:	e8 fc ff ff ff       	call   3881 <sys_pipe+0x163>
    3885:	85 c0                	test   %eax,%eax
    3887:	75 81                	jne    380a <sys_pipe+0xec>
    3889:	e9 3c ff ff ff       	jmp    37ca <sys_pipe+0xac>
    388e:	83 fa 01             	cmp    $0x1,%edx
    3891:	75 ed                	jne    3880 <sys_pipe+0x162>
    3893:	e9 06 ff ff ff       	jmp    379e <sys_pipe+0x80>
    3898:	83 c4 14             	add    $0x14,%esp
    389b:	5b                   	pop    %ebx
    389c:	5e                   	pop    %esi
    389d:	c3                   	ret    

0000389e <permission>:
    389e:	56                   	push   %esi
    389f:	53                   	push   %ebx
    38a0:	0f b7 08             	movzwl (%eax),%ecx
    38a3:	66 83 78 2c 00       	cmpw   $0x0,0x2c(%eax)
    38a8:	74 06                	je     38b0 <permission+0x12>
    38aa:	80 78 0d 00          	cmpb   $0x0,0xd(%eax)
    38ae:	74 3e                	je     38ee <permission+0x50>
    38b0:	8b 35 00 00 00 00    	mov    0x0,%esi
    38b6:	66 8b 9e 42 02 00 00 	mov    0x242(%esi),%bx
    38bd:	66 3b 58 02          	cmp    0x2(%eax),%bx
    38c1:	75 05                	jne    38c8 <permission+0x2a>
    38c3:	c1 f9 06             	sar    $0x6,%ecx
    38c6:	eb 10                	jmp    38d8 <permission+0x3a>
    38c8:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
    38cc:	66 39 86 48 02 00 00 	cmp    %ax,0x248(%esi)
    38d3:	75 03                	jne    38d8 <permission+0x3a>
    38d5:	c1 f9 03             	sar    $0x3,%ecx
    38d8:	89 d0                	mov    %edx,%eax
    38da:	83 e0 07             	and    $0x7,%eax
    38dd:	21 c1                	and    %eax,%ecx
    38df:	39 ca                	cmp    %ecx,%edx
    38e1:	74 12                	je     38f5 <permission+0x57>
    38e3:	66 85 db             	test   %bx,%bx
    38e6:	0f 94 c0             	sete   %al
    38e9:	0f b6 c0             	movzbl %al,%eax
    38ec:	eb 0c                	jmp    38fa <permission+0x5c>
    38ee:	b8 00 00 00 00       	mov    $0x0,%eax
    38f3:	eb 05                	jmp    38fa <permission+0x5c>
    38f5:	b8 01 00 00 00       	mov    $0x1,%eax
    38fa:	5b                   	pop    %ebx
    38fb:	5e                   	pop    %esi
    38fc:	c3                   	ret    

000038fd <find_entry>:
    38fd:	55                   	push   %ebp
    38fe:	57                   	push   %edi
    38ff:	56                   	push   %esi
    3900:	53                   	push   %ebx
    3901:	83 ec 1c             	sub    $0x1c,%esp
    3904:	89 cb                	mov    %ecx,%ebx
    3906:	83 f9 1e             	cmp    $0x1e,%ecx
    3909:	7e 05                	jle    3910 <find_entry+0x13>
    390b:	bb 1e 00 00 00       	mov    $0x1e,%ebx
    3910:	8b 08                	mov    (%eax),%ecx
    3912:	8b 79 04             	mov    0x4(%ecx),%edi
    3915:	8b 74 24 30          	mov    0x30(%esp),%esi
    3919:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    391f:	85 db                	test   %ebx,%ebx
    3921:	0f 84 7f 01 00 00    	je     3aa6 <find_entry+0x1a9>
    3927:	89 d6                	mov    %edx,%esi
    3929:	89 44 24 0c          	mov    %eax,0xc(%esp)
    392d:	83 fb 02             	cmp    $0x2,%ebx
    3930:	75 67                	jne    3999 <find_entry+0x9c>
    3932:	64 8a 02             	mov    %fs:(%edx),%al
    3935:	3c 2e                	cmp    $0x2e,%al
    3937:	75 60                	jne    3999 <find_entry+0x9c>
    3939:	64 8a 42 01          	mov    %fs:0x1(%edx),%al
    393d:	3c 2e                	cmp    $0x2e,%al
    393f:	75 58                	jne    3999 <find_entry+0x9c>
    3941:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3945:	8b 00                	mov    (%eax),%eax
    3947:	8b 15 00 00 00 00    	mov    0x0,%edx
    394d:	3b 82 74 02 00 00    	cmp    0x274(%edx),%eax
    3953:	74 3f                	je     3994 <find_entry+0x97>
    3955:	66 83 78 2e 01       	cmpw   $0x1,0x2e(%eax)
    395a:	75 3d                	jne    3999 <find_entry+0x9c>
    395c:	83 ec 0c             	sub    $0xc,%esp
    395f:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3963:	50                   	push   %eax
    3964:	e8 fc ff ff ff       	call   3965 <find_entry+0x68>
    3969:	89 c5                	mov    %eax,%ebp
    396b:	83 c4 10             	add    $0x10,%esp
    396e:	83 78 5c 00          	cmpl   $0x0,0x5c(%eax)
    3972:	74 25                	je     3999 <find_entry+0x9c>
    3974:	83 ec 0c             	sub    $0xc,%esp
    3977:	8b 44 24 18          	mov    0x18(%esp),%eax
    397b:	ff 30                	pushl  (%eax)
    397d:	e8 fc ff ff ff       	call   397e <find_entry+0x81>
    3982:	8b 45 5c             	mov    0x5c(%ebp),%eax
    3985:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    3989:	89 01                	mov    %eax,(%ecx)
    398b:	66 ff 40 30          	incw   0x30(%eax)
    398f:	83 c4 10             	add    $0x10,%esp
    3992:	eb 05                	jmp    3999 <find_entry+0x9c>
    3994:	bb 01 00 00 00       	mov    $0x1,%ebx
    3999:	8b 44 24 0c          	mov    0xc(%esp),%eax
    399d:	8b 00                	mov    (%eax),%eax
    399f:	0f b7 50 0e          	movzwl 0xe(%eax),%edx
    39a3:	85 d2                	test   %edx,%edx
    39a5:	0f 84 02 01 00 00    	je     3aad <find_entry+0x1b0>
    39ab:	83 ec 08             	sub    $0x8,%esp
    39ae:	52                   	push   %edx
    39af:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    39b3:	50                   	push   %eax
    39b4:	e8 fc ff ff ff       	call   39b5 <find_entry+0xb8>
    39b9:	89 c2                	mov    %eax,%edx
    39bb:	83 c4 10             	add    $0x10,%esp
    39be:	85 c0                	test   %eax,%eax
    39c0:	0f 84 ee 00 00 00    	je     3ab4 <find_entry+0x1b7>
    39c6:	8b 28                	mov    (%eax),%ebp
    39c8:	c1 ef 05             	shr    $0x5,%edi
    39cb:	89 7c 24 08          	mov    %edi,0x8(%esp)
    39cf:	0f 84 be 00 00 00    	je     3a93 <find_entry+0x196>
    39d5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    39dc:	00 
    39dd:	8b 02                	mov    (%edx),%eax
    39df:	05 00 04 00 00       	add    $0x400,%eax
    39e4:	39 c5                	cmp    %eax,%ebp
    39e6:	72 55                	jb     3a3d <find_entry+0x140>
    39e8:	83 ec 0c             	sub    $0xc,%esp
    39eb:	52                   	push   %edx
    39ec:	e8 fc ff ff ff       	call   39ed <find_entry+0xf0>
    39f1:	8b 44 24 14          	mov    0x14(%esp),%eax
    39f5:	89 c7                	mov    %eax,%edi
    39f7:	83 c4 08             	add    $0x8,%esp
    39fa:	c1 e8 05             	shr    $0x5,%eax
    39fd:	50                   	push   %eax
    39fe:	8b 44 24 18          	mov    0x18(%esp),%eax
    3a02:	ff 30                	pushl  (%eax)
    3a04:	e8 fc ff ff ff       	call   3a05 <find_entry+0x108>
    3a09:	83 c4 10             	add    $0x10,%esp
    3a0c:	85 c0                	test   %eax,%eax
    3a0e:	74 1d                	je     3a2d <find_entry+0x130>
    3a10:	83 ec 08             	sub    $0x8,%esp
    3a13:	50                   	push   %eax
    3a14:	8b 44 24 18          	mov    0x18(%esp),%eax
    3a18:	8b 00                	mov    (%eax),%eax
    3a1a:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3a1e:	50                   	push   %eax
    3a1f:	e8 fc ff ff ff       	call   3a20 <find_entry+0x123>
    3a24:	89 c2                	mov    %eax,%edx
    3a26:	83 c4 10             	add    $0x10,%esp
    3a29:	85 c0                	test   %eax,%eax
    3a2b:	75 0e                	jne    3a3b <find_entry+0x13e>
    3a2d:	8d 47 20             	lea    0x20(%edi),%eax
    3a30:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a34:	ba 00 00 00 00       	mov    $0x0,%edx
    3a39:	eb 4a                	jmp    3a85 <find_entry+0x188>
    3a3b:	8b 28                	mov    (%eax),%ebp
    3a3d:	85 ed                	test   %ebp,%ebp
    3a3f:	74 3d                	je     3a7e <find_entry+0x181>
    3a41:	66 83 7d 00 00       	cmpw   $0x0,0x0(%ebp)
    3a46:	74 36                	je     3a7e <find_entry+0x181>
    3a48:	83 fb 1e             	cmp    $0x1e,%ebx
    3a4b:	7f 31                	jg     3a7e <find_entry+0x181>
    3a4d:	83 fb 1d             	cmp    $0x1d,%ebx
    3a50:	7f 07                	jg     3a59 <find_entry+0x15c>
    3a52:	80 7c 1d 02 00       	cmpb   $0x0,0x2(%ebp,%ebx,1)
    3a57:	75 25                	jne    3a7e <find_entry+0x181>
    3a59:	53                   	push   %ebx
    3a5a:	8d 7d 02             	lea    0x2(%ebp),%edi
    3a5d:	b8 00 00 00 00       	mov    $0x0,%eax
    3a62:	89 d9                	mov    %ebx,%ecx
    3a64:	fc                   	cld    
    3a65:	64 f3 a6             	repz cmpsb %es:(%edi),%fs:(%esi)
    3a68:	0f 94 c0             	sete   %al
    3a6b:	29 cb                	sub    %ecx,%ebx
    3a6d:	29 de                	sub    %ebx,%esi
    3a6f:	5b                   	pop    %ebx
    3a70:	85 c0                	test   %eax,%eax
    3a72:	74 0a                	je     3a7e <find_entry+0x181>
    3a74:	8b 44 24 30          	mov    0x30(%esp),%eax
    3a78:	89 28                	mov    %ebp,(%eax)
    3a7a:	89 d0                	mov    %edx,%eax
    3a7c:	eb 3b                	jmp    3ab9 <find_entry+0x1bc>
    3a7e:	83 c5 20             	add    $0x20,%ebp
    3a81:	ff 44 24 04          	incl   0x4(%esp)
    3a85:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3a89:	39 4c 24 08          	cmp    %ecx,0x8(%esp)
    3a8d:	0f 8f 4a ff ff ff    	jg     39dd <find_entry+0xe0>
    3a93:	83 ec 0c             	sub    $0xc,%esp
    3a96:	52                   	push   %edx
    3a97:	e8 fc ff ff ff       	call   3a98 <find_entry+0x19b>
    3a9c:	83 c4 10             	add    $0x10,%esp
    3a9f:	b8 00 00 00 00       	mov    $0x0,%eax
    3aa4:	eb 13                	jmp    3ab9 <find_entry+0x1bc>
    3aa6:	b8 00 00 00 00       	mov    $0x0,%eax
    3aab:	eb 0c                	jmp    3ab9 <find_entry+0x1bc>
    3aad:	b8 00 00 00 00       	mov    $0x0,%eax
    3ab2:	eb 05                	jmp    3ab9 <find_entry+0x1bc>
    3ab4:	b8 00 00 00 00       	mov    $0x0,%eax
    3ab9:	83 c4 1c             	add    $0x1c,%esp
    3abc:	5b                   	pop    %ebx
    3abd:	5e                   	pop    %esi
    3abe:	5f                   	pop    %edi
    3abf:	5d                   	pop    %ebp
    3ac0:	c3                   	ret    

00003ac1 <dir_namei>:
    3ac1:	55                   	push   %ebp
    3ac2:	57                   	push   %edi
    3ac3:	56                   	push   %esi
    3ac4:	53                   	push   %ebx
    3ac5:	83 ec 4c             	sub    $0x4c,%esp
    3ac8:	89 c5                	mov    %eax,%ebp
    3aca:	89 54 24 08          	mov    %edx,0x8(%esp)
    3ace:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3ad2:	a1 00 00 00 00       	mov    0x0,%eax
    3ad7:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
    3add:	85 c0                	test   %eax,%eax
    3adf:	74 07                	je     3ae8 <dir_namei+0x27>
    3ae1:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    3ae6:	75 2d                	jne    3b15 <dir_namei+0x54>
    3ae8:	8d 7c 24 20          	lea    0x20(%esp),%edi
    3aec:	b9 08 00 00 00       	mov    $0x8,%ecx
    3af1:	b8 00 00 00 00       	mov    $0x0,%eax
    3af6:	f3 ab                	rep stos %eax,%es:(%edi)
    3af8:	83 ec 08             	sub    $0x8,%esp
    3afb:	55                   	push   %ebp
    3afc:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3b00:	50                   	push   %eax
    3b01:	e8 fc ff ff ff       	call   3b02 <dir_namei+0x41>
    3b06:	c7 04 24 11 02 00 00 	movl   $0x211,(%esp)
    3b0d:	e8 fc ff ff ff       	call   3b0e <dir_namei+0x4d>
    3b12:	83 c4 10             	add    $0x10,%esp
    3b15:	a1 00 00 00 00       	mov    0x0,%eax
    3b1a:	8b 80 70 02 00 00    	mov    0x270(%eax),%eax
    3b20:	85 c0                	test   %eax,%eax
    3b22:	74 07                	je     3b2b <dir_namei+0x6a>
    3b24:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    3b29:	75 10                	jne    3b3b <dir_namei+0x7a>
    3b2b:	83 ec 0c             	sub    $0xc,%esp
    3b2e:	68 1f 02 00 00       	push   $0x21f
    3b33:	e8 fc ff ff ff       	call   3b34 <dir_namei+0x73>
    3b38:	83 c4 10             	add    $0x10,%esp
    3b3b:	64 8a 45 00          	mov    %fs:0x0(%ebp),%al
    3b3f:	3c 2f                	cmp    $0x2f,%al
    3b41:	75 14                	jne    3b57 <dir_namei+0x96>
    3b43:	a1 00 00 00 00       	mov    0x0,%eax
    3b48:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
    3b4e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3b52:	8d 75 01             	lea    0x1(%ebp),%esi
    3b55:	eb 19                	jmp    3b70 <dir_namei+0xaf>
    3b57:	84 c0                	test   %al,%al
    3b59:	0f 84 29 01 00 00    	je     3c88 <dir_namei+0x1c7>
    3b5f:	a1 00 00 00 00       	mov    0x0,%eax
    3b64:	8b 80 70 02 00 00    	mov    0x270(%eax),%eax
    3b6a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3b6e:	89 ee                	mov    %ebp,%esi
    3b70:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3b74:	66 ff 40 30          	incw   0x30(%eax)
    3b78:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    3b7c:	8b 07                	mov    (%edi),%eax
    3b7e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    3b83:	66 3d 00 40          	cmp    $0x4000,%ax
    3b87:	75 2f                	jne    3bb8 <dir_namei+0xf7>
    3b89:	ba 01 00 00 00       	mov    $0x1,%edx
    3b8e:	89 f8                	mov    %edi,%eax
    3b90:	e8 09 fd ff ff       	call   389e <permission>
    3b95:	85 c0                	test   %eax,%eax
    3b97:	74 1f                	je     3bb8 <dir_namei+0xf7>
    3b99:	8d 46 01             	lea    0x1(%esi),%eax
    3b9c:	64 8a 16             	mov    %fs:(%esi),%dl
    3b9f:	84 d2                	test   %dl,%dl
    3ba1:	0f 84 90 00 00 00    	je     3c37 <dir_namei+0x176>
    3ba7:	80 fa 2f             	cmp    $0x2f,%dl
    3baa:	75 1d                	jne    3bc9 <dir_namei+0x108>
    3bac:	89 c3                	mov    %eax,%ebx
    3bae:	b9 00 00 00 00       	mov    $0x0,%ecx
    3bb3:	e9 ad 00 00 00       	jmp    3c65 <dir_namei+0x1a4>
    3bb8:	83 ec 0c             	sub    $0xc,%esp
    3bbb:	57                   	push   %edi
    3bbc:	e8 fc ff ff ff       	call   3bbd <dir_namei+0xfc>
    3bc1:	83 c4 10             	add    $0x10,%esp
    3bc4:	e9 bf 00 00 00       	jmp    3c88 <dir_namei+0x1c7>
    3bc9:	89 c1                	mov    %eax,%ecx
    3bcb:	29 f1                	sub    %esi,%ecx
    3bcd:	8d 58 01             	lea    0x1(%eax),%ebx
    3bd0:	64 8a 10             	mov    %fs:(%eax),%dl
    3bd3:	84 d2                	test   %dl,%dl
    3bd5:	74 60                	je     3c37 <dir_namei+0x176>
    3bd7:	89 d8                	mov    %ebx,%eax
    3bd9:	80 fa 2f             	cmp    $0x2f,%dl
    3bdc:	75 eb                	jne    3bc9 <dir_namei+0x108>
    3bde:	e9 82 00 00 00       	jmp    3c65 <dir_namei+0x1a4>
    3be3:	83 ec 0c             	sub    $0xc,%esp
    3be6:	ff 74 24 28          	pushl  0x28(%esp)
    3bea:	e8 fc ff ff ff       	call   3beb <dir_namei+0x12a>
    3bef:	83 c4 10             	add    $0x10,%esp
    3bf2:	e9 91 00 00 00       	jmp    3c88 <dir_namei+0x1c7>
    3bf7:	8b 54 24 20          	mov    0x20(%esp),%edx
    3bfb:	0f b7 3a             	movzwl (%edx),%edi
    3bfe:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3c02:	0f b7 72 2c          	movzwl 0x2c(%edx),%esi
    3c06:	83 ec 0c             	sub    $0xc,%esp
    3c09:	50                   	push   %eax
    3c0a:	e8 fc ff ff ff       	call   3c0b <dir_namei+0x14a>
    3c0f:	83 c4 04             	add    $0x4,%esp
    3c12:	ff 74 24 28          	pushl  0x28(%esp)
    3c16:	e8 fc ff ff ff       	call   3c17 <dir_namei+0x156>
    3c1b:	83 c4 08             	add    $0x8,%esp
    3c1e:	57                   	push   %edi
    3c1f:	56                   	push   %esi
    3c20:	e8 fc ff ff ff       	call   3c21 <dir_namei+0x160>
    3c25:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    3c29:	83 c4 10             	add    $0x10,%esp
    3c2c:	85 c0                	test   %eax,%eax
    3c2e:	74 58                	je     3c88 <dir_namei+0x1c7>
    3c30:	89 de                	mov    %ebx,%esi
    3c32:	e9 41 ff ff ff       	jmp    3b78 <dir_namei+0xb7>
    3c37:	85 ff                	test   %edi,%edi
    3c39:	74 52                	je     3c8d <dir_namei+0x1cc>
    3c3b:	89 e9                	mov    %ebp,%ecx
    3c3d:	eb 08                	jmp    3c47 <dir_namei+0x186>
    3c3f:	3c 2f                	cmp    $0x2f,%al
    3c41:	75 02                	jne    3c45 <dir_namei+0x184>
    3c43:	89 d1                	mov    %edx,%ecx
    3c45:	89 d5                	mov    %edx,%ebp
    3c47:	8d 55 01             	lea    0x1(%ebp),%edx
    3c4a:	64 8a 45 00          	mov    %fs:0x0(%ebp),%al
    3c4e:	84 c0                	test   %al,%al
    3c50:	75 ed                	jne    3c3f <dir_namei+0x17e>
    3c52:	29 ca                	sub    %ecx,%edx
    3c54:	8d 42 ff             	lea    -0x1(%edx),%eax
    3c57:	8b 74 24 08          	mov    0x8(%esp),%esi
    3c5b:	89 06                	mov    %eax,(%esi)
    3c5d:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3c61:	89 08                	mov    %ecx,(%eax)
    3c63:	eb 28                	jmp    3c8d <dir_namei+0x1cc>
    3c65:	83 ec 0c             	sub    $0xc,%esp
    3c68:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3c6c:	50                   	push   %eax
    3c6d:	89 f2                	mov    %esi,%edx
    3c6f:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3c73:	e8 85 fc ff ff       	call   38fd <find_entry>
    3c78:	83 c4 10             	add    $0x10,%esp
    3c7b:	85 c0                	test   %eax,%eax
    3c7d:	0f 85 74 ff ff ff    	jne    3bf7 <dir_namei+0x136>
    3c83:	e9 5b ff ff ff       	jmp    3be3 <dir_namei+0x122>
    3c88:	bf 00 00 00 00       	mov    $0x0,%edi
    3c8d:	89 f8                	mov    %edi,%eax
    3c8f:	83 c4 4c             	add    $0x4c,%esp
    3c92:	5b                   	pop    %ebx
    3c93:	5e                   	pop    %esi
    3c94:	5f                   	pop    %edi
    3c95:	5d                   	pop    %ebp
    3c96:	c3                   	ret    

00003c97 <add_entry>:
    3c97:	55                   	push   %ebp
    3c98:	57                   	push   %edi
    3c99:	56                   	push   %esi
    3c9a:	53                   	push   %ebx
    3c9b:	83 ec 1c             	sub    $0x1c,%esp
    3c9e:	8b 7c 24 30          	mov    0x30(%esp),%edi
    3ca2:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    3ca8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3cac:	83 f9 1e             	cmp    $0x1e,%ecx
    3caf:	7e 08                	jle    3cb9 <add_entry+0x22>
    3cb1:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
    3cb8:	00 
    3cb9:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    3cbe:	0f 84 19 01 00 00    	je     3ddd <add_entry+0x146>
    3cc4:	0f b7 48 0e          	movzwl 0xe(%eax),%ecx
    3cc8:	85 c9                	test   %ecx,%ecx
    3cca:	0f 84 14 01 00 00    	je     3de4 <add_entry+0x14d>
    3cd0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3cd4:	89 c7                	mov    %eax,%edi
    3cd6:	83 ec 08             	sub    $0x8,%esp
    3cd9:	51                   	push   %ecx
    3cda:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3cde:	50                   	push   %eax
    3cdf:	e8 fc ff ff ff       	call   3ce0 <add_entry+0x49>
    3ce4:	89 c1                	mov    %eax,%ecx
    3ce6:	83 c4 10             	add    $0x10,%esp
    3ce9:	85 c0                	test   %eax,%eax
    3ceb:	0f 84 fa 00 00 00    	je     3deb <add_entry+0x154>
    3cf1:	8b 18                	mov    (%eax),%ebx
    3cf3:	be 00 00 00 00       	mov    $0x0,%esi
    3cf8:	8b 01                	mov    (%ecx),%eax
    3cfa:	05 00 04 00 00       	add    $0x400,%eax
    3cff:	39 c3                	cmp    %eax,%ebx
    3d01:	72 41                	jb     3d44 <add_entry+0xad>
    3d03:	83 ec 0c             	sub    $0xc,%esp
    3d06:	51                   	push   %ecx
    3d07:	e8 fc ff ff ff       	call   3d08 <add_entry+0x71>
    3d0c:	83 c4 08             	add    $0x8,%esp
    3d0f:	89 f0                	mov    %esi,%eax
    3d11:	c1 e8 05             	shr    $0x5,%eax
    3d14:	50                   	push   %eax
    3d15:	57                   	push   %edi
    3d16:	e8 fc ff ff ff       	call   3d17 <add_entry+0x80>
    3d1b:	83 c4 10             	add    $0x10,%esp
    3d1e:	85 c0                	test   %eax,%eax
    3d20:	0f 84 cc 00 00 00    	je     3df2 <add_entry+0x15b>
    3d26:	83 ec 08             	sub    $0x8,%esp
    3d29:	50                   	push   %eax
    3d2a:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    3d2e:	50                   	push   %eax
    3d2f:	e8 fc ff ff ff       	call   3d30 <add_entry+0x99>
    3d34:	89 c1                	mov    %eax,%ecx
    3d36:	83 c4 10             	add    $0x10,%esp
    3d39:	85 c0                	test   %eax,%eax
    3d3b:	75 05                	jne    3d42 <add_entry+0xab>
    3d3d:	8d 76 20             	lea    0x20(%esi),%esi
    3d40:	eb b6                	jmp    3cf8 <add_entry+0x61>
    3d42:	8b 18                	mov    (%eax),%ebx
    3d44:	89 f0                	mov    %esi,%eax
    3d46:	c1 e0 05             	shl    $0x5,%eax
    3d49:	3b 47 04             	cmp    0x4(%edi),%eax
    3d4c:	72 2f                	jb     3d7d <add_entry+0xe6>
    3d4e:	66 c7 03 00 00       	movw   $0x0,(%ebx)
    3d53:	83 c0 20             	add    $0x20,%eax
    3d56:	89 47 04             	mov    %eax,0x4(%edi)
    3d59:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    3d5d:	8b 2d 00 00 00 00    	mov    0x0,%ebp
    3d63:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3d68:	f7 ed                	imul   %ebp
    3d6a:	89 d0                	mov    %edx,%eax
    3d6c:	c1 f8 05             	sar    $0x5,%eax
    3d6f:	c1 fd 1f             	sar    $0x1f,%ebp
    3d72:	29 e8                	sub    %ebp,%eax
    3d74:	03 05 00 00 00 00    	add    0x0,%eax
    3d7a:	89 47 28             	mov    %eax,0x28(%edi)
    3d7d:	66 83 3b 00          	cmpw   $0x0,(%ebx)
    3d81:	75 51                	jne    3dd4 <add_entry+0x13d>
    3d83:	8b 35 00 00 00 00    	mov    0x0,%esi
    3d89:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3d8e:	f7 ee                	imul   %esi
    3d90:	89 d0                	mov    %edx,%eax
    3d92:	c1 f8 05             	sar    $0x5,%eax
    3d95:	c1 fe 1f             	sar    $0x1f,%esi
    3d98:	29 f0                	sub    %esi,%eax
    3d9a:	03 05 00 00 00 00    	add    0x0,%eax
    3da0:	89 47 08             	mov    %eax,0x8(%edi)
    3da3:	b8 00 00 00 00       	mov    $0x0,%eax
    3da8:	8b 74 24 08          	mov    0x8(%esp),%esi
    3dac:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    3db0:	39 c6                	cmp    %eax,%esi
    3db2:	7e 06                	jle    3dba <add_entry+0x123>
    3db4:	64 8a 14 07          	mov    %fs:(%edi,%eax,1),%dl
    3db8:	eb 02                	jmp    3dbc <add_entry+0x125>
    3dba:	b2 00                	mov    $0x0,%dl
    3dbc:	88 54 03 02          	mov    %dl,0x2(%ebx,%eax,1)
    3dc0:	40                   	inc    %eax
    3dc1:	83 f8 1e             	cmp    $0x1e,%eax
    3dc4:	75 ea                	jne    3db0 <add_entry+0x119>
    3dc6:	c6 41 0b 01          	movb   $0x1,0xb(%ecx)
    3dca:	8b 44 24 30          	mov    0x30(%esp),%eax
    3dce:	89 18                	mov    %ebx,(%eax)
    3dd0:	89 c8                	mov    %ecx,%eax
    3dd2:	eb 23                	jmp    3df7 <add_entry+0x160>
    3dd4:	83 c3 20             	add    $0x20,%ebx
    3dd7:	46                   	inc    %esi
    3dd8:	e9 1b ff ff ff       	jmp    3cf8 <add_entry+0x61>
    3ddd:	b8 00 00 00 00       	mov    $0x0,%eax
    3de2:	eb 13                	jmp    3df7 <add_entry+0x160>
    3de4:	b8 00 00 00 00       	mov    $0x0,%eax
    3de9:	eb 0c                	jmp    3df7 <add_entry+0x160>
    3deb:	b8 00 00 00 00       	mov    $0x0,%eax
    3df0:	eb 05                	jmp    3df7 <add_entry+0x160>
    3df2:	b8 00 00 00 00       	mov    $0x0,%eax
    3df7:	83 c4 1c             	add    $0x1c,%esp
    3dfa:	5b                   	pop    %ebx
    3dfb:	5e                   	pop    %esi
    3dfc:	5f                   	pop    %edi
    3dfd:	5d                   	pop    %ebp
    3dfe:	c3                   	ret    

00003dff <namei>:
    3dff:	56                   	push   %esi
    3e00:	53                   	push   %ebx
    3e01:	83 ec 14             	sub    $0x14,%esp
    3e04:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    3e08:	8d 54 24 08          	lea    0x8(%esp),%edx
    3e0c:	8b 44 24 20          	mov    0x20(%esp),%eax
    3e10:	e8 ac fc ff ff       	call   3ac1 <dir_namei>
    3e15:	89 c3                	mov    %eax,%ebx
    3e17:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e1b:	85 c0                	test   %eax,%eax
    3e1d:	0f 84 9c 00 00 00    	je     3ebf <namei+0xc0>
    3e23:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3e27:	85 c9                	test   %ecx,%ecx
    3e29:	0f 84 90 00 00 00    	je     3ebf <namei+0xc0>
    3e2f:	83 ec 0c             	sub    $0xc,%esp
    3e32:	8d 44 24 0c          	lea    0xc(%esp),%eax
    3e36:	50                   	push   %eax
    3e37:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3e3b:	8d 44 24 14          	lea    0x14(%esp),%eax
    3e3f:	e8 b9 fa ff ff       	call   38fd <find_entry>
    3e44:	83 c4 10             	add    $0x10,%esp
    3e47:	85 c0                	test   %eax,%eax
    3e49:	75 16                	jne    3e61 <namei+0x62>
    3e4b:	83 ec 0c             	sub    $0xc,%esp
    3e4e:	ff 74 24 10          	pushl  0x10(%esp)
    3e52:	e8 fc ff ff ff       	call   3e53 <namei+0x54>
    3e57:	83 c4 10             	add    $0x10,%esp
    3e5a:	bb 00 00 00 00       	mov    $0x0,%ebx
    3e5f:	eb 5e                	jmp    3ebf <namei+0xc0>
    3e61:	8b 14 24             	mov    (%esp),%edx
    3e64:	0f b7 32             	movzwl (%edx),%esi
    3e67:	8b 54 24 04          	mov    0x4(%esp),%edx
    3e6b:	0f b7 5a 2c          	movzwl 0x2c(%edx),%ebx
    3e6f:	83 ec 0c             	sub    $0xc,%esp
    3e72:	50                   	push   %eax
    3e73:	e8 fc ff ff ff       	call   3e74 <namei+0x75>
    3e78:	83 c4 04             	add    $0x4,%esp
    3e7b:	ff 74 24 10          	pushl  0x10(%esp)
    3e7f:	e8 fc ff ff ff       	call   3e80 <namei+0x81>
    3e84:	83 c4 08             	add    $0x8,%esp
    3e87:	56                   	push   %esi
    3e88:	53                   	push   %ebx
    3e89:	e8 fc ff ff ff       	call   3e8a <namei+0x8b>
    3e8e:	89 c3                	mov    %eax,%ebx
    3e90:	89 44 24 14          	mov    %eax,0x14(%esp)
    3e94:	83 c4 10             	add    $0x10,%esp
    3e97:	85 c0                	test   %eax,%eax
    3e99:	74 24                	je     3ebf <namei+0xc0>
    3e9b:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    3ea1:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3ea6:	f7 e9                	imul   %ecx
    3ea8:	89 d0                	mov    %edx,%eax
    3eaa:	c1 f8 05             	sar    $0x5,%eax
    3ead:	c1 f9 1f             	sar    $0x1f,%ecx
    3eb0:	29 c8                	sub    %ecx,%eax
    3eb2:	03 05 00 00 00 00    	add    0x0,%eax
    3eb8:	89 43 24             	mov    %eax,0x24(%ebx)
    3ebb:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    3ebf:	89 d8                	mov    %ebx,%eax
    3ec1:	83 c4 14             	add    $0x14,%esp
    3ec4:	5b                   	pop    %ebx
    3ec5:	5e                   	pop    %esi
    3ec6:	c3                   	ret    

00003ec7 <open_namei>:
    3ec7:	55                   	push   %ebp
    3ec8:	57                   	push   %edi
    3ec9:	56                   	push   %esi
    3eca:	53                   	push   %ebx
    3ecb:	83 ec 1c             	sub    $0x1c,%esp
    3ece:	8b 5c 24 34          	mov    0x34(%esp),%ebx
    3ed2:	89 d8                	mov    %ebx,%eax
    3ed4:	25 03 02 00 00       	and    $0x203,%eax
    3ed9:	3d 00 02 00 00       	cmp    $0x200,%eax
    3ede:	75 03                	jne    3ee3 <open_namei+0x1c>
    3ee0:	83 cb 01             	or     $0x1,%ebx
    3ee3:	a1 00 00 00 00       	mov    0x0,%eax
    3ee8:	8b b0 6c 02 00 00    	mov    0x26c(%eax),%esi
    3eee:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    3ef2:	8d 54 24 08          	lea    0x8(%esp),%edx
    3ef6:	8b 44 24 30          	mov    0x30(%esp),%eax
    3efa:	e8 c2 fb ff ff       	call   3ac1 <dir_namei>
    3eff:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f03:	85 c0                	test   %eax,%eax
    3f05:	0f 84 2e 02 00 00    	je     4139 <open_namei+0x272>
    3f0b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3f0f:	85 c9                	test   %ecx,%ecx
    3f11:	75 2b                	jne    3f3e <open_namei+0x77>
    3f13:	89 de                	mov    %ebx,%esi
    3f15:	81 e6 43 02 00 00    	and    $0x243,%esi
    3f1b:	75 0b                	jne    3f28 <open_namei+0x61>
    3f1d:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    3f21:	89 07                	mov    %eax,(%edi)
    3f23:	e9 24 02 00 00       	jmp    414c <open_namei+0x285>
    3f28:	83 ec 0c             	sub    $0xc,%esp
    3f2b:	50                   	push   %eax
    3f2c:	e8 fc ff ff ff       	call   3f2d <open_namei+0x66>
    3f31:	83 c4 10             	add    $0x10,%esp
    3f34:	be eb ff ff ff       	mov    $0xffffffeb,%esi
    3f39:	e9 0e 02 00 00       	jmp    414c <open_namei+0x285>
    3f3e:	83 ec 0c             	sub    $0xc,%esp
    3f41:	8d 44 24 0c          	lea    0xc(%esp),%eax
    3f45:	50                   	push   %eax
    3f46:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3f4a:	8d 44 24 14          	lea    0x14(%esp),%eax
    3f4e:	e8 aa f9 ff ff       	call   38fd <find_entry>
    3f53:	83 c4 10             	add    $0x10,%esp
    3f56:	85 c0                	test   %eax,%eax
    3f58:	0f 85 1b 01 00 00    	jne    4079 <open_namei+0x1b2>
    3f5e:	f6 c3 40             	test   $0x40,%bl
    3f61:	75 19                	jne    3f7c <open_namei+0xb5>
    3f63:	83 ec 0c             	sub    $0xc,%esp
    3f66:	ff 74 24 10          	pushl  0x10(%esp)
    3f6a:	e8 fc ff ff ff       	call   3f6b <open_namei+0xa4>
    3f6f:	83 c4 10             	add    $0x10,%esp
    3f72:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    3f77:	e9 d0 01 00 00       	jmp    414c <open_namei+0x285>
    3f7c:	8b 5c 24 04          	mov    0x4(%esp),%ebx
    3f80:	ba 02 00 00 00       	mov    $0x2,%edx
    3f85:	89 d8                	mov    %ebx,%eax
    3f87:	e8 12 f9 ff ff       	call   389e <permission>
    3f8c:	85 c0                	test   %eax,%eax
    3f8e:	75 16                	jne    3fa6 <open_namei+0xdf>
    3f90:	83 ec 0c             	sub    $0xc,%esp
    3f93:	53                   	push   %ebx
    3f94:	e8 fc ff ff ff       	call   3f95 <open_namei+0xce>
    3f99:	83 c4 10             	add    $0x10,%esp
    3f9c:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3fa1:	e9 a6 01 00 00       	jmp    414c <open_namei+0x285>
    3fa6:	83 ec 0c             	sub    $0xc,%esp
    3fa9:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    3fad:	50                   	push   %eax
    3fae:	e8 fc ff ff ff       	call   3faf <open_namei+0xe8>
    3fb3:	89 c3                	mov    %eax,%ebx
    3fb5:	83 c4 10             	add    $0x10,%esp
    3fb8:	85 c0                	test   %eax,%eax
    3fba:	75 19                	jne    3fd5 <open_namei+0x10e>
    3fbc:	83 ec 0c             	sub    $0xc,%esp
    3fbf:	ff 74 24 10          	pushl  0x10(%esp)
    3fc3:	e8 fc ff ff ff       	call   3fc4 <open_namei+0xfd>
    3fc8:	83 c4 10             	add    $0x10,%esp
    3fcb:	be e4 ff ff ff       	mov    $0xffffffe4,%esi
    3fd0:	e9 77 01 00 00       	jmp    414c <open_namei+0x285>
    3fd5:	a1 00 00 00 00       	mov    0x0,%eax
    3fda:	66 8b 80 42 02 00 00 	mov    0x242(%eax),%ax
    3fe1:	66 89 43 02          	mov    %ax,0x2(%ebx)
    3fe5:	f7 d6                	not    %esi
    3fe7:	81 e6 ff 01 00 00    	and    $0x1ff,%esi
    3fed:	23 74 24 38          	and    0x38(%esp),%esi
    3ff1:	81 ce 00 80 00 00    	or     $0x8000,%esi
    3ff7:	66 89 33             	mov    %si,(%ebx)
    3ffa:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    3ffe:	83 ec 0c             	sub    $0xc,%esp
    4001:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4005:	50                   	push   %eax
    4006:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    400a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    400e:	8b 44 24 14          	mov    0x14(%esp),%eax
    4012:	e8 80 fc ff ff       	call   3c97 <add_entry>
    4017:	83 c4 10             	add    $0x10,%esp
    401a:	85 c0                	test   %eax,%eax
    401c:	75 25                	jne    4043 <open_namei+0x17c>
    401e:	fe 4b 0d             	decb   0xd(%ebx)
    4021:	83 ec 0c             	sub    $0xc,%esp
    4024:	53                   	push   %ebx
    4025:	e8 fc ff ff ff       	call   4026 <open_namei+0x15f>
    402a:	83 c4 04             	add    $0x4,%esp
    402d:	ff 74 24 10          	pushl  0x10(%esp)
    4031:	e8 fc ff ff ff       	call   4032 <open_namei+0x16b>
    4036:	83 c4 10             	add    $0x10,%esp
    4039:	be e4 ff ff ff       	mov    $0xffffffe4,%esi
    403e:	e9 09 01 00 00       	jmp    414c <open_namei+0x285>
    4043:	66 8b 4b 2e          	mov    0x2e(%ebx),%cx
    4047:	8b 14 24             	mov    (%esp),%edx
    404a:	66 89 0a             	mov    %cx,(%edx)
    404d:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4051:	83 ec 0c             	sub    $0xc,%esp
    4054:	50                   	push   %eax
    4055:	e8 fc ff ff ff       	call   4056 <open_namei+0x18f>
    405a:	83 c4 04             	add    $0x4,%esp
    405d:	ff 74 24 10          	pushl  0x10(%esp)
    4061:	e8 fc ff ff ff       	call   4062 <open_namei+0x19b>
    4066:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    406a:	89 18                	mov    %ebx,(%eax)
    406c:	83 c4 10             	add    $0x10,%esp
    406f:	be 00 00 00 00       	mov    $0x0,%esi
    4074:	e9 d3 00 00 00       	jmp    414c <open_namei+0x285>
    4079:	8b 14 24             	mov    (%esp),%edx
    407c:	0f b7 2a             	movzwl (%edx),%ebp
    407f:	8b 54 24 04          	mov    0x4(%esp),%edx
    4083:	0f b7 7a 2c          	movzwl 0x2c(%edx),%edi
    4087:	83 ec 0c             	sub    $0xc,%esp
    408a:	50                   	push   %eax
    408b:	e8 fc ff ff ff       	call   408c <open_namei+0x1c5>
    4090:	83 c4 04             	add    $0x4,%esp
    4093:	ff 74 24 10          	pushl  0x10(%esp)
    4097:	e8 fc ff ff ff       	call   4098 <open_namei+0x1d1>
    409c:	83 c4 10             	add    $0x10,%esp
    409f:	89 de                	mov    %ebx,%esi
    40a1:	81 e6 80 00 00 00    	and    $0x80,%esi
    40a7:	0f 85 93 00 00 00    	jne    4140 <open_namei+0x279>
    40ad:	83 ec 08             	sub    $0x8,%esp
    40b0:	55                   	push   %ebp
    40b1:	57                   	push   %edi
    40b2:	e8 fc ff ff ff       	call   40b3 <open_namei+0x1ec>
    40b7:	89 c7                	mov    %eax,%edi
    40b9:	83 c4 10             	add    $0x10,%esp
    40bc:	85 c0                	test   %eax,%eax
    40be:	0f 84 83 00 00 00    	je     4147 <open_namei+0x280>
    40c4:	8b 00                	mov    (%eax),%eax
    40c6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    40cb:	66 3d 00 40          	cmp    $0x4000,%ax
    40cf:	75 05                	jne    40d6 <open_namei+0x20f>
    40d1:	f6 c3 03             	test   $0x3,%bl
    40d4:	75 17                	jne    40ed <open_namei+0x226>
    40d6:	89 d8                	mov    %ebx,%eax
    40d8:	83 e0 03             	and    $0x3,%eax
    40db:	0f be 90 2c 02 00 00 	movsbl 0x22c(%eax),%edx
    40e2:	89 f8                	mov    %edi,%eax
    40e4:	e8 b5 f7 ff ff       	call   389e <permission>
    40e9:	85 c0                	test   %eax,%eax
    40eb:	75 13                	jne    4100 <open_namei+0x239>
    40ed:	83 ec 0c             	sub    $0xc,%esp
    40f0:	57                   	push   %edi
    40f1:	e8 fc ff ff ff       	call   40f2 <open_namei+0x22b>
    40f6:	83 c4 10             	add    $0x10,%esp
    40f9:	be ff ff ff ff       	mov    $0xffffffff,%esi
    40fe:	eb 4c                	jmp    414c <open_namei+0x285>
    4100:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4106:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    410b:	f7 e9                	imul   %ecx
    410d:	89 d0                	mov    %edx,%eax
    410f:	c1 f8 05             	sar    $0x5,%eax
    4112:	c1 f9 1f             	sar    $0x1f,%ecx
    4115:	29 c8                	sub    %ecx,%eax
    4117:	03 05 00 00 00 00    	add    0x0,%eax
    411d:	89 47 24             	mov    %eax,0x24(%edi)
    4120:	f6 c7 02             	test   $0x2,%bh
    4123:	74 0c                	je     4131 <open_namei+0x26a>
    4125:	83 ec 0c             	sub    $0xc,%esp
    4128:	57                   	push   %edi
    4129:	e8 fc ff ff ff       	call   412a <open_namei+0x263>
    412e:	83 c4 10             	add    $0x10,%esp
    4131:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    4135:	89 38                	mov    %edi,(%eax)
    4137:	eb 13                	jmp    414c <open_namei+0x285>
    4139:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    413e:	eb 0c                	jmp    414c <open_namei+0x285>
    4140:	be ef ff ff ff       	mov    $0xffffffef,%esi
    4145:	eb 05                	jmp    414c <open_namei+0x285>
    4147:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    414c:	89 f0                	mov    %esi,%eax
    414e:	83 c4 1c             	add    $0x1c,%esp
    4151:	5b                   	pop    %ebx
    4152:	5e                   	pop    %esi
    4153:	5f                   	pop    %edi
    4154:	5d                   	pop    %ebp
    4155:	c3                   	ret    

00004156 <sys_mknod>:
    4156:	57                   	push   %edi
    4157:	56                   	push   %esi
    4158:	53                   	push   %ebx
    4159:	83 ec 10             	sub    $0x10,%esp
    415c:	8b 74 24 24          	mov    0x24(%esp),%esi
    4160:	a1 00 00 00 00       	mov    0x0,%eax
    4165:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    416c:	00 
    416d:	0f 85 8c 01 00 00    	jne    42ff <sys_mknod+0x1a9>
    4173:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    4177:	8d 54 24 08          	lea    0x8(%esp),%edx
    417b:	8b 44 24 20          	mov    0x20(%esp),%eax
    417f:	e8 3d f9 ff ff       	call   3ac1 <dir_namei>
    4184:	89 c3                	mov    %eax,%ebx
    4186:	89 44 24 04          	mov    %eax,0x4(%esp)
    418a:	85 c0                	test   %eax,%eax
    418c:	0f 84 74 01 00 00    	je     4306 <sys_mknod+0x1b0>
    4192:	8b 7c 24 08          	mov    0x8(%esp),%edi
    4196:	85 ff                	test   %edi,%edi
    4198:	75 16                	jne    41b0 <sys_mknod+0x5a>
    419a:	83 ec 0c             	sub    $0xc,%esp
    419d:	50                   	push   %eax
    419e:	e8 fc ff ff ff       	call   419f <sys_mknod+0x49>
    41a3:	83 c4 10             	add    $0x10,%esp
    41a6:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    41ab:	e9 5b 01 00 00       	jmp    430b <sys_mknod+0x1b5>
    41b0:	ba 02 00 00 00       	mov    $0x2,%edx
    41b5:	e8 e4 f6 ff ff       	call   389e <permission>
    41ba:	85 c0                	test   %eax,%eax
    41bc:	75 16                	jne    41d4 <sys_mknod+0x7e>
    41be:	83 ec 0c             	sub    $0xc,%esp
    41c1:	53                   	push   %ebx
    41c2:	e8 fc ff ff ff       	call   41c3 <sys_mknod+0x6d>
    41c7:	83 c4 10             	add    $0x10,%esp
    41ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    41cf:	e9 37 01 00 00       	jmp    430b <sys_mknod+0x1b5>
    41d4:	83 ec 0c             	sub    $0xc,%esp
    41d7:	8d 44 24 0c          	lea    0xc(%esp),%eax
    41db:	50                   	push   %eax
    41dc:	89 f9                	mov    %edi,%ecx
    41de:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    41e2:	8d 44 24 14          	lea    0x14(%esp),%eax
    41e6:	e8 12 f7 ff ff       	call   38fd <find_entry>
    41eb:	83 c4 10             	add    $0x10,%esp
    41ee:	85 c0                	test   %eax,%eax
    41f0:	74 22                	je     4214 <sys_mknod+0xbe>
    41f2:	83 ec 0c             	sub    $0xc,%esp
    41f5:	50                   	push   %eax
    41f6:	e8 fc ff ff ff       	call   41f7 <sys_mknod+0xa1>
    41fb:	83 c4 04             	add    $0x4,%esp
    41fe:	ff 74 24 10          	pushl  0x10(%esp)
    4202:	e8 fc ff ff ff       	call   4203 <sys_mknod+0xad>
    4207:	83 c4 10             	add    $0x10,%esp
    420a:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    420f:	e9 f7 00 00 00       	jmp    430b <sys_mknod+0x1b5>
    4214:	83 ec 0c             	sub    $0xc,%esp
    4217:	8b 44 24 10          	mov    0x10(%esp),%eax
    421b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    421f:	50                   	push   %eax
    4220:	e8 fc ff ff ff       	call   4221 <sys_mknod+0xcb>
    4225:	89 c3                	mov    %eax,%ebx
    4227:	83 c4 10             	add    $0x10,%esp
    422a:	85 c0                	test   %eax,%eax
    422c:	75 19                	jne    4247 <sys_mknod+0xf1>
    422e:	83 ec 0c             	sub    $0xc,%esp
    4231:	ff 74 24 10          	pushl  0x10(%esp)
    4235:	e8 fc ff ff ff       	call   4236 <sys_mknod+0xe0>
    423a:	83 c4 10             	add    $0x10,%esp
    423d:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4242:	e9 c4 00 00 00       	jmp    430b <sys_mknod+0x1b5>
    4247:	66 89 30             	mov    %si,(%eax)
    424a:	81 e6 00 b0 00 00    	and    $0xb000,%esi
    4250:	81 fe 00 20 00 00    	cmp    $0x2000,%esi
    4256:	75 08                	jne    4260 <sys_mknod+0x10a>
    4258:	8b 44 24 28          	mov    0x28(%esp),%eax
    425c:	66 89 43 0e          	mov    %ax,0xe(%ebx)
    4260:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4266:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    426b:	f7 e9                	imul   %ecx
    426d:	89 d0                	mov    %edx,%eax
    426f:	c1 f8 05             	sar    $0x5,%eax
    4272:	c1 f9 1f             	sar    $0x1f,%ecx
    4275:	29 c8                	sub    %ecx,%eax
    4277:	03 05 00 00 00 00    	add    0x0,%eax
    427d:	89 43 24             	mov    %eax,0x24(%ebx)
    4280:	89 43 08             	mov    %eax,0x8(%ebx)
    4283:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4287:	83 ec 0c             	sub    $0xc,%esp
    428a:	8d 44 24 0c          	lea    0xc(%esp),%eax
    428e:	50                   	push   %eax
    428f:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4293:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4297:	8b 44 24 14          	mov    0x14(%esp),%eax
    429b:	e8 f7 f9 ff ff       	call   3c97 <add_entry>
    42a0:	89 c6                	mov    %eax,%esi
    42a2:	83 c4 10             	add    $0x10,%esp
    42a5:	85 c0                	test   %eax,%eax
    42a7:	75 22                	jne    42cb <sys_mknod+0x175>
    42a9:	83 ec 0c             	sub    $0xc,%esp
    42ac:	ff 74 24 10          	pushl  0x10(%esp)
    42b0:	e8 fc ff ff ff       	call   42b1 <sys_mknod+0x15b>
    42b5:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    42b9:	89 1c 24             	mov    %ebx,(%esp)
    42bc:	e8 fc ff ff ff       	call   42bd <sys_mknod+0x167>
    42c1:	83 c4 10             	add    $0x10,%esp
    42c4:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    42c9:	eb 40                	jmp    430b <sys_mknod+0x1b5>
    42cb:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    42cf:	8b 04 24             	mov    (%esp),%eax
    42d2:	66 89 10             	mov    %dx,(%eax)
    42d5:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    42d9:	83 ec 0c             	sub    $0xc,%esp
    42dc:	ff 74 24 10          	pushl  0x10(%esp)
    42e0:	e8 fc ff ff ff       	call   42e1 <sys_mknod+0x18b>
    42e5:	89 1c 24             	mov    %ebx,(%esp)
    42e8:	e8 fc ff ff ff       	call   42e9 <sys_mknod+0x193>
    42ed:	89 34 24             	mov    %esi,(%esp)
    42f0:	e8 fc ff ff ff       	call   42f1 <sys_mknod+0x19b>
    42f5:	83 c4 10             	add    $0x10,%esp
    42f8:	b8 00 00 00 00       	mov    $0x0,%eax
    42fd:	eb 0c                	jmp    430b <sys_mknod+0x1b5>
    42ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4304:	eb 05                	jmp    430b <sys_mknod+0x1b5>
    4306:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    430b:	83 c4 10             	add    $0x10,%esp
    430e:	5b                   	pop    %ebx
    430f:	5e                   	pop    %esi
    4310:	5f                   	pop    %edi
    4311:	c3                   	ret    

00004312 <sys_mkdir>:
    4312:	a1 00 00 00 00       	mov    0x0,%eax
    4317:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    431e:	00 
    431f:	0f 85 9b 02 00 00    	jne    45c0 <sys_mkdir+0x2ae>
    4325:	57                   	push   %edi
    4326:	56                   	push   %esi
    4327:	53                   	push   %ebx
    4328:	83 ec 10             	sub    $0x10,%esp
    432b:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    432f:	8d 54 24 08          	lea    0x8(%esp),%edx
    4333:	8b 44 24 20          	mov    0x20(%esp),%eax
    4337:	e8 85 f7 ff ff       	call   3ac1 <dir_namei>
    433c:	89 c3                	mov    %eax,%ebx
    433e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4342:	85 c0                	test   %eax,%eax
    4344:	0f 84 7c 02 00 00    	je     45c6 <sys_mkdir+0x2b4>
    434a:	8b 74 24 08          	mov    0x8(%esp),%esi
    434e:	85 f6                	test   %esi,%esi
    4350:	75 16                	jne    4368 <sys_mkdir+0x56>
    4352:	83 ec 0c             	sub    $0xc,%esp
    4355:	50                   	push   %eax
    4356:	e8 fc ff ff ff       	call   4357 <sys_mkdir+0x45>
    435b:	83 c4 10             	add    $0x10,%esp
    435e:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4363:	e9 63 02 00 00       	jmp    45cb <sys_mkdir+0x2b9>
    4368:	ba 02 00 00 00       	mov    $0x2,%edx
    436d:	e8 2c f5 ff ff       	call   389e <permission>
    4372:	85 c0                	test   %eax,%eax
    4374:	75 16                	jne    438c <sys_mkdir+0x7a>
    4376:	83 ec 0c             	sub    $0xc,%esp
    4379:	53                   	push   %ebx
    437a:	e8 fc ff ff ff       	call   437b <sys_mkdir+0x69>
    437f:	83 c4 10             	add    $0x10,%esp
    4382:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4387:	e9 3f 02 00 00       	jmp    45cb <sys_mkdir+0x2b9>
    438c:	83 ec 0c             	sub    $0xc,%esp
    438f:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4393:	50                   	push   %eax
    4394:	89 f1                	mov    %esi,%ecx
    4396:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    439a:	8d 44 24 14          	lea    0x14(%esp),%eax
    439e:	e8 5a f5 ff ff       	call   38fd <find_entry>
    43a3:	83 c4 10             	add    $0x10,%esp
    43a6:	85 c0                	test   %eax,%eax
    43a8:	74 22                	je     43cc <sys_mkdir+0xba>
    43aa:	83 ec 0c             	sub    $0xc,%esp
    43ad:	50                   	push   %eax
    43ae:	e8 fc ff ff ff       	call   43af <sys_mkdir+0x9d>
    43b3:	83 c4 04             	add    $0x4,%esp
    43b6:	ff 74 24 10          	pushl  0x10(%esp)
    43ba:	e8 fc ff ff ff       	call   43bb <sys_mkdir+0xa9>
    43bf:	83 c4 10             	add    $0x10,%esp
    43c2:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    43c7:	e9 ff 01 00 00       	jmp    45cb <sys_mkdir+0x2b9>
    43cc:	83 ec 0c             	sub    $0xc,%esp
    43cf:	8b 44 24 10          	mov    0x10(%esp),%eax
    43d3:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    43d7:	50                   	push   %eax
    43d8:	e8 fc ff ff ff       	call   43d9 <sys_mkdir+0xc7>
    43dd:	89 c3                	mov    %eax,%ebx
    43df:	83 c4 10             	add    $0x10,%esp
    43e2:	85 c0                	test   %eax,%eax
    43e4:	75 19                	jne    43ff <sys_mkdir+0xed>
    43e6:	83 ec 0c             	sub    $0xc,%esp
    43e9:	ff 74 24 10          	pushl  0x10(%esp)
    43ed:	e8 fc ff ff ff       	call   43ee <sys_mkdir+0xdc>
    43f2:	83 c4 10             	add    $0x10,%esp
    43f5:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    43fa:	e9 cc 01 00 00       	jmp    45cb <sys_mkdir+0x2b9>
    43ff:	c7 40 04 20 00 00 00 	movl   $0x20,0x4(%eax)
    4406:	c6 40 33 01          	movb   $0x1,0x33(%eax)
    440a:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4410:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4415:	f7 e9                	imul   %ecx
    4417:	89 d0                	mov    %edx,%eax
    4419:	c1 f8 05             	sar    $0x5,%eax
    441c:	c1 f9 1f             	sar    $0x1f,%ecx
    441f:	29 c8                	sub    %ecx,%eax
    4421:	03 05 00 00 00 00    	add    0x0,%eax
    4427:	89 43 24             	mov    %eax,0x24(%ebx)
    442a:	89 43 08             	mov    %eax,0x8(%ebx)
    442d:	83 ec 0c             	sub    $0xc,%esp
    4430:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4434:	50                   	push   %eax
    4435:	e8 fc ff ff ff       	call   4436 <sys_mkdir+0x124>
    443a:	66 89 43 0e          	mov    %ax,0xe(%ebx)
    443e:	83 c4 10             	add    $0x10,%esp
    4441:	66 85 c0             	test   %ax,%ax
    4444:	75 24                	jne    446a <sys_mkdir+0x158>
    4446:	83 ec 0c             	sub    $0xc,%esp
    4449:	ff 74 24 10          	pushl  0x10(%esp)
    444d:	e8 fc ff ff ff       	call   444e <sys_mkdir+0x13c>
    4452:	fe 4b 0d             	decb   0xd(%ebx)
    4455:	89 1c 24             	mov    %ebx,(%esp)
    4458:	e8 fc ff ff ff       	call   4459 <sys_mkdir+0x147>
    445d:	83 c4 10             	add    $0x10,%esp
    4460:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4465:	e9 61 01 00 00       	jmp    45cb <sys_mkdir+0x2b9>
    446a:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    446e:	83 ec 08             	sub    $0x8,%esp
    4471:	0f b7 c0             	movzwl %ax,%eax
    4474:	50                   	push   %eax
    4475:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4479:	50                   	push   %eax
    447a:	e8 fc ff ff ff       	call   447b <sys_mkdir+0x169>
    447f:	89 c1                	mov    %eax,%ecx
    4481:	83 c4 10             	add    $0x10,%esp
    4484:	85 c0                	test   %eax,%eax
    4486:	75 36                	jne    44be <sys_mkdir+0x1ac>
    4488:	83 ec 0c             	sub    $0xc,%esp
    448b:	ff 74 24 10          	pushl  0x10(%esp)
    448f:	e8 fc ff ff ff       	call   4490 <sys_mkdir+0x17e>
    4494:	83 c4 08             	add    $0x8,%esp
    4497:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    449b:	50                   	push   %eax
    449c:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    44a0:	50                   	push   %eax
    44a1:	e8 fc ff ff ff       	call   44a2 <sys_mkdir+0x190>
    44a6:	fe 4b 0d             	decb   0xd(%ebx)
    44a9:	89 1c 24             	mov    %ebx,(%esp)
    44ac:	e8 fc ff ff ff       	call   44ad <sys_mkdir+0x19b>
    44b1:	83 c4 10             	add    $0x10,%esp
    44b4:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    44b9:	e9 0d 01 00 00       	jmp    45cb <sys_mkdir+0x2b9>
    44be:	8b 00                	mov    (%eax),%eax
    44c0:	89 04 24             	mov    %eax,(%esp)
    44c3:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    44c7:	66 89 10             	mov    %dx,(%eax)
    44ca:	8b 14 24             	mov    (%esp),%edx
    44cd:	8d 7a 02             	lea    0x2(%edx),%edi
    44d0:	be 31 02 00 00       	mov    $0x231,%esi
    44d5:	fc                   	cld    
    44d6:	ac                   	lods   %ds:(%esi),%al
    44d7:	aa                   	stos   %al,%es:(%edi)
    44d8:	84 c0                	test   %al,%al
    44da:	75 fa                	jne    44d6 <sys_mkdir+0x1c4>
    44dc:	8d 42 20             	lea    0x20(%edx),%eax
    44df:	89 04 24             	mov    %eax,(%esp)
    44e2:	8b 44 24 04          	mov    0x4(%esp),%eax
    44e6:	66 8b 40 2e          	mov    0x2e(%eax),%ax
    44ea:	66 89 42 20          	mov    %ax,0x20(%edx)
    44ee:	8d 7a 22             	lea    0x22(%edx),%edi
    44f1:	be 33 02 00 00       	mov    $0x233,%esi
    44f6:	fc                   	cld    
    44f7:	ac                   	lods   %ds:(%esi),%al
    44f8:	aa                   	stos   %al,%es:(%edi)
    44f9:	84 c0                	test   %al,%al
    44fb:	75 fa                	jne    44f7 <sys_mkdir+0x1e5>
    44fd:	c6 43 0d 02          	movb   $0x2,0xd(%ebx)
    4501:	c6 41 0b 01          	movb   $0x1,0xb(%ecx)
    4505:	83 ec 0c             	sub    $0xc,%esp
    4508:	51                   	push   %ecx
    4509:	e8 fc ff ff ff       	call   450a <sys_mkdir+0x1f8>
    450e:	a1 00 00 00 00       	mov    0x0,%eax
    4513:	8b 80 6c 02 00 00    	mov    0x26c(%eax),%eax
    4519:	f7 d0                	not    %eax
    451b:	25 ff 01 00 00       	and    $0x1ff,%eax
    4520:	23 44 24 34          	and    0x34(%esp),%eax
    4524:	80 cc 40             	or     $0x40,%ah
    4527:	66 89 03             	mov    %ax,(%ebx)
    452a:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    452e:	83 c4 04             	add    $0x4,%esp
    4531:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4535:	50                   	push   %eax
    4536:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    453a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    453e:	8b 44 24 14          	mov    0x14(%esp),%eax
    4542:	e8 50 f7 ff ff       	call   3c97 <add_entry>
    4547:	89 c6                	mov    %eax,%esi
    4549:	83 c4 10             	add    $0x10,%esp
    454c:	85 c0                	test   %eax,%eax
    454e:	75 34                	jne    4584 <sys_mkdir+0x272>
    4550:	83 ec 0c             	sub    $0xc,%esp
    4553:	ff 74 24 10          	pushl  0x10(%esp)
    4557:	e8 fc ff ff ff       	call   4558 <sys_mkdir+0x246>
    455c:	83 c4 08             	add    $0x8,%esp
    455f:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    4563:	50                   	push   %eax
    4564:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4568:	50                   	push   %eax
    4569:	e8 fc ff ff ff       	call   456a <sys_mkdir+0x258>
    456e:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    4572:	89 1c 24             	mov    %ebx,(%esp)
    4575:	e8 fc ff ff ff       	call   4576 <sys_mkdir+0x264>
    457a:	83 c4 10             	add    $0x10,%esp
    457d:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4582:	eb 47                	jmp    45cb <sys_mkdir+0x2b9>
    4584:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    4588:	8b 04 24             	mov    (%esp),%eax
    458b:	66 89 10             	mov    %dx,(%eax)
    458e:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4592:	8b 44 24 04          	mov    0x4(%esp),%eax
    4596:	fe 40 0d             	incb   0xd(%eax)
    4599:	c6 40 33 01          	movb   $0x1,0x33(%eax)
    459d:	83 ec 0c             	sub    $0xc,%esp
    45a0:	50                   	push   %eax
    45a1:	e8 fc ff ff ff       	call   45a2 <sys_mkdir+0x290>
    45a6:	89 1c 24             	mov    %ebx,(%esp)
    45a9:	e8 fc ff ff ff       	call   45aa <sys_mkdir+0x298>
    45ae:	89 34 24             	mov    %esi,(%esp)
    45b1:	e8 fc ff ff ff       	call   45b2 <sys_mkdir+0x2a0>
    45b6:	83 c4 10             	add    $0x10,%esp
    45b9:	b8 00 00 00 00       	mov    $0x0,%eax
    45be:	eb 0b                	jmp    45cb <sys_mkdir+0x2b9>
    45c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    45c5:	c3                   	ret    
    45c6:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    45cb:	83 c4 10             	add    $0x10,%esp
    45ce:	5b                   	pop    %ebx
    45cf:	5e                   	pop    %esi
    45d0:	5f                   	pop    %edi
    45d1:	c3                   	ret    

000045d2 <sys_rmdir>:
    45d2:	55                   	push   %ebp
    45d3:	57                   	push   %edi
    45d4:	56                   	push   %esi
    45d5:	53                   	push   %ebx
    45d6:	83 ec 2c             	sub    $0x2c,%esp
    45d9:	a1 00 00 00 00       	mov    0x0,%eax
    45de:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    45e5:	00 
    45e6:	0f 85 a4 03 00 00    	jne    4990 <sys_rmdir+0x3be>
    45ec:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    45f0:	8d 54 24 18          	lea    0x18(%esp),%edx
    45f4:	8b 44 24 40          	mov    0x40(%esp),%eax
    45f8:	e8 c4 f4 ff ff       	call   3ac1 <dir_namei>
    45fd:	89 c3                	mov    %eax,%ebx
    45ff:	89 44 24 14          	mov    %eax,0x14(%esp)
    4603:	85 c0                	test   %eax,%eax
    4605:	0f 84 8c 03 00 00    	je     4997 <sys_rmdir+0x3c5>
    460b:	8b 74 24 18          	mov    0x18(%esp),%esi
    460f:	85 f6                	test   %esi,%esi
    4611:	75 16                	jne    4629 <sys_rmdir+0x57>
    4613:	83 ec 0c             	sub    $0xc,%esp
    4616:	50                   	push   %eax
    4617:	e8 fc ff ff ff       	call   4618 <sys_rmdir+0x46>
    461c:	83 c4 10             	add    $0x10,%esp
    461f:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    4624:	e9 9e 03 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    4629:	ba 02 00 00 00       	mov    $0x2,%edx
    462e:	e8 6b f2 ff ff       	call   389e <permission>
    4633:	85 c0                	test   %eax,%eax
    4635:	75 16                	jne    464d <sys_rmdir+0x7b>
    4637:	83 ec 0c             	sub    $0xc,%esp
    463a:	53                   	push   %ebx
    463b:	e8 fc ff ff ff       	call   463c <sys_rmdir+0x6a>
    4640:	83 c4 10             	add    $0x10,%esp
    4643:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4648:	e9 7a 03 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    464d:	83 ec 0c             	sub    $0xc,%esp
    4650:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    4654:	50                   	push   %eax
    4655:	89 f1                	mov    %esi,%ecx
    4657:	8b 54 24 2c          	mov    0x2c(%esp),%edx
    465b:	8d 44 24 24          	lea    0x24(%esp),%eax
    465f:	e8 99 f2 ff ff       	call   38fd <find_entry>
    4664:	89 c5                	mov    %eax,%ebp
    4666:	83 c4 10             	add    $0x10,%esp
    4669:	85 c0                	test   %eax,%eax
    466b:	75 19                	jne    4686 <sys_rmdir+0xb4>
    466d:	83 ec 0c             	sub    $0xc,%esp
    4670:	ff 74 24 20          	pushl  0x20(%esp)
    4674:	e8 fc ff ff ff       	call   4675 <sys_rmdir+0xa3>
    4679:	83 c4 10             	add    $0x10,%esp
    467c:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    4681:	e9 41 03 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    4686:	83 ec 08             	sub    $0x8,%esp
    4689:	8b 44 24 18          	mov    0x18(%esp),%eax
    468d:	0f b7 00             	movzwl (%eax),%eax
    4690:	50                   	push   %eax
    4691:	8b 44 24 20          	mov    0x20(%esp),%eax
    4695:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    4699:	50                   	push   %eax
    469a:	e8 fc ff ff ff       	call   469b <sys_rmdir+0xc9>
    469f:	89 c3                	mov    %eax,%ebx
    46a1:	83 c4 10             	add    $0x10,%esp
    46a4:	85 c0                	test   %eax,%eax
    46a6:	75 21                	jne    46c9 <sys_rmdir+0xf7>
    46a8:	83 ec 0c             	sub    $0xc,%esp
    46ab:	ff 74 24 20          	pushl  0x20(%esp)
    46af:	e8 fc ff ff ff       	call   46b0 <sys_rmdir+0xde>
    46b4:	89 2c 24             	mov    %ebp,(%esp)
    46b7:	e8 fc ff ff ff       	call   46b8 <sys_rmdir+0xe6>
    46bc:	83 c4 10             	add    $0x10,%esp
    46bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    46c4:	e9 fe 02 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    46c9:	8b 44 24 14          	mov    0x14(%esp),%eax
    46cd:	f7 00 00 02 00 00    	testl  $0x200,(%eax)
    46d3:	74 3e                	je     4713 <sys_rmdir+0x141>
    46d5:	8b 15 00 00 00 00    	mov    0x0,%edx
    46db:	66 8b 92 42 02 00 00 	mov    0x242(%edx),%dx
    46e2:	66 85 d2             	test   %dx,%dx
    46e5:	74 2c                	je     4713 <sys_rmdir+0x141>
    46e7:	66 3b 53 02          	cmp    0x2(%ebx),%dx
    46eb:	74 26                	je     4713 <sys_rmdir+0x141>
    46ed:	83 ec 0c             	sub    $0xc,%esp
    46f0:	50                   	push   %eax
    46f1:	e8 fc ff ff ff       	call   46f2 <sys_rmdir+0x120>
    46f6:	89 1c 24             	mov    %ebx,(%esp)
    46f9:	e8 fc ff ff ff       	call   46fa <sys_rmdir+0x128>
    46fe:	89 2c 24             	mov    %ebp,(%esp)
    4701:	e8 fc ff ff ff       	call   4702 <sys_rmdir+0x130>
    4706:	83 c4 10             	add    $0x10,%esp
    4709:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    470e:	e9 b4 02 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    4713:	8b 53 2c             	mov    0x2c(%ebx),%edx
    4716:	66 3b 50 2c          	cmp    0x2c(%eax),%dx
    471a:	75 07                	jne    4723 <sys_rmdir+0x151>
    471c:	66 83 7b 30 01       	cmpw   $0x1,0x30(%ebx)
    4721:	76 26                	jbe    4749 <sys_rmdir+0x177>
    4723:	83 ec 0c             	sub    $0xc,%esp
    4726:	50                   	push   %eax
    4727:	e8 fc ff ff ff       	call   4728 <sys_rmdir+0x156>
    472c:	89 1c 24             	mov    %ebx,(%esp)
    472f:	e8 fc ff ff ff       	call   4730 <sys_rmdir+0x15e>
    4734:	89 2c 24             	mov    %ebp,(%esp)
    4737:	e8 fc ff ff ff       	call   4738 <sys_rmdir+0x166>
    473c:	83 c4 10             	add    $0x10,%esp
    473f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4744:	e9 7e 02 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    4749:	39 c3                	cmp    %eax,%ebx
    474b:	75 2a                	jne    4777 <sys_rmdir+0x1a5>
    474d:	83 ec 0c             	sub    $0xc,%esp
    4750:	53                   	push   %ebx
    4751:	e8 fc ff ff ff       	call   4752 <sys_rmdir+0x180>
    4756:	83 c4 04             	add    $0x4,%esp
    4759:	ff 74 24 20          	pushl  0x20(%esp)
    475d:	e8 fc ff ff ff       	call   475e <sys_rmdir+0x18c>
    4762:	89 2c 24             	mov    %ebp,(%esp)
    4765:	e8 fc ff ff ff       	call   4766 <sys_rmdir+0x194>
    476a:	83 c4 10             	add    $0x10,%esp
    476d:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4772:	e9 50 02 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    4777:	8b 03                	mov    (%ebx),%eax
    4779:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    477e:	66 3d 00 40          	cmp    $0x4000,%ax
    4782:	74 2a                	je     47ae <sys_rmdir+0x1dc>
    4784:	83 ec 0c             	sub    $0xc,%esp
    4787:	53                   	push   %ebx
    4788:	e8 fc ff ff ff       	call   4789 <sys_rmdir+0x1b7>
    478d:	83 c4 04             	add    $0x4,%esp
    4790:	ff 74 24 20          	pushl  0x20(%esp)
    4794:	e8 fc ff ff ff       	call   4795 <sys_rmdir+0x1c3>
    4799:	89 2c 24             	mov    %ebp,(%esp)
    479c:	e8 fc ff ff ff       	call   479d <sys_rmdir+0x1cb>
    47a1:	83 c4 10             	add    $0x10,%esp
    47a4:	bf ec ff ff ff       	mov    $0xffffffec,%edi
    47a9:	e9 19 02 00 00       	jmp    49c7 <sys_rmdir+0x3f5>
    47ae:	8b 43 04             	mov    0x4(%ebx),%eax
    47b1:	c1 e8 05             	shr    $0x5,%eax
    47b4:	89 44 24 04          	mov    %eax,0x4(%esp)
    47b8:	83 f8 01             	cmp    $0x1,%eax
    47bb:	7e 22                	jle    47df <sys_rmdir+0x20d>
    47bd:	66 8b 43 0e          	mov    0xe(%ebx),%ax
    47c1:	66 85 c0             	test   %ax,%ax
    47c4:	74 19                	je     47df <sys_rmdir+0x20d>
    47c6:	83 ec 08             	sub    $0x8,%esp
    47c9:	0f b7 c0             	movzwl %ax,%eax
    47cc:	50                   	push   %eax
    47cd:	0f b7 d2             	movzwl %dx,%edx
    47d0:	52                   	push   %edx
    47d1:	e8 fc ff ff ff       	call   47d2 <sys_rmdir+0x200>
    47d6:	89 c1                	mov    %eax,%ecx
    47d8:	83 c4 10             	add    $0x10,%esp
    47db:	85 c0                	test   %eax,%eax
    47dd:	75 1a                	jne    47f9 <sys_rmdir+0x227>
    47df:	83 ec 08             	sub    $0x8,%esp
    47e2:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    47e6:	50                   	push   %eax
    47e7:	68 4c 02 00 00       	push   $0x24c
    47ec:	e8 fc ff ff ff       	call   47ed <sys_rmdir+0x21b>
    47f1:	83 c4 10             	add    $0x10,%esp
    47f4:	e9 a9 01 00 00       	jmp    49a2 <sys_rmdir+0x3d0>
    47f9:	8b 10                	mov    (%eax),%edx
    47fb:	66 8b 43 2e          	mov    0x2e(%ebx),%ax
    47ff:	66 39 02             	cmp    %ax,(%edx)
    4802:	75 4d                	jne    4851 <sys_rmdir+0x27f>
    4804:	66 83 7a 20 00       	cmpw   $0x0,0x20(%edx)
    4809:	74 46                	je     4851 <sys_rmdir+0x27f>
    480b:	8d 72 02             	lea    0x2(%edx),%esi
    480e:	bf 31 02 00 00       	mov    $0x231,%edi
    4813:	fc                   	cld    
    4814:	ac                   	lods   %ds:(%esi),%al
    4815:	ae                   	scas   %es:(%edi),%al
    4816:	75 08                	jne    4820 <sys_rmdir+0x24e>
    4818:	84 c0                	test   %al,%al
    481a:	75 f8                	jne    4814 <sys_rmdir+0x242>
    481c:	31 c0                	xor    %eax,%eax
    481e:	eb 09                	jmp    4829 <sys_rmdir+0x257>
    4820:	b8 01 00 00 00       	mov    $0x1,%eax
    4825:	7c 02                	jl     4829 <sys_rmdir+0x257>
    4827:	f7 d8                	neg    %eax
    4829:	85 c0                	test   %eax,%eax
    482b:	75 24                	jne    4851 <sys_rmdir+0x27f>
    482d:	8d 72 22             	lea    0x22(%edx),%esi
    4830:	bf 33 02 00 00       	mov    $0x233,%edi
    4835:	fc                   	cld    
    4836:	ac                   	lods   %ds:(%esi),%al
    4837:	ae                   	scas   %es:(%edi),%al
    4838:	75 08                	jne    4842 <sys_rmdir+0x270>
    483a:	84 c0                	test   %al,%al
    483c:	75 f8                	jne    4836 <sys_rmdir+0x264>
    483e:	31 c0                	xor    %eax,%eax
    4840:	eb 09                	jmp    484b <sys_rmdir+0x279>
    4842:	b8 01 00 00 00       	mov    $0x1,%eax
    4847:	7c 02                	jl     484b <sys_rmdir+0x279>
    4849:	f7 d8                	neg    %eax
    484b:	89 c7                	mov    %eax,%edi
    484d:	85 c0                	test   %eax,%eax
    484f:	74 1a                	je     486b <sys_rmdir+0x299>
    4851:	83 ec 08             	sub    $0x8,%esp
    4854:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4858:	50                   	push   %eax
    4859:	68 4c 02 00 00       	push   $0x24c
    485e:	e8 fc ff ff ff       	call   485f <sys_rmdir+0x28d>
    4863:	83 c4 10             	add    $0x10,%esp
    4866:	e9 37 01 00 00       	jmp    49a2 <sys_rmdir+0x3d0>
    486b:	8d 72 40             	lea    0x40(%edx),%esi
    486e:	83 7c 24 04 02       	cmpl   $0x2,0x4(%esp)
    4873:	0f 8e 8f 00 00 00    	jle    4908 <sys_rmdir+0x336>
    4879:	b8 02 00 00 00       	mov    $0x2,%eax
    487e:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    4882:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    4886:	89 cd                	mov    %ecx,%ebp
    4888:	89 c7                	mov    %eax,%edi
    488a:	8b 45 00             	mov    0x0(%ebp),%eax
    488d:	05 00 04 00 00       	add    $0x400,%eax
    4892:	39 c6                	cmp    %eax,%esi
    4894:	72 41                	jb     48d7 <sys_rmdir+0x305>
    4896:	83 ec 0c             	sub    $0xc,%esp
    4899:	55                   	push   %ebp
    489a:	e8 fc ff ff ff       	call   489b <sys_rmdir+0x2c9>
    489f:	83 c4 08             	add    $0x8,%esp
    48a2:	89 f8                	mov    %edi,%eax
    48a4:	c1 e8 05             	shr    $0x5,%eax
    48a7:	50                   	push   %eax
    48a8:	53                   	push   %ebx
    48a9:	e8 fc ff ff ff       	call   48aa <sys_rmdir+0x2d8>
    48ae:	83 c4 10             	add    $0x10,%esp
    48b1:	85 c0                	test   %eax,%eax
    48b3:	75 05                	jne    48ba <sys_rmdir+0x2e8>
    48b5:	83 c7 20             	add    $0x20,%edi
    48b8:	eb 3e                	jmp    48f8 <sys_rmdir+0x326>
    48ba:	83 ec 08             	sub    $0x8,%esp
    48bd:	50                   	push   %eax
    48be:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    48c2:	50                   	push   %eax
    48c3:	e8 fc ff ff ff       	call   48c4 <sys_rmdir+0x2f2>
    48c8:	89 c5                	mov    %eax,%ebp
    48ca:	83 c4 10             	add    $0x10,%esp
    48cd:	85 c0                	test   %eax,%eax
    48cf:	0f 84 c9 00 00 00    	je     499e <sys_rmdir+0x3cc>
    48d5:	8b 30                	mov    (%eax),%esi
    48d7:	66 83 3e 00          	cmpw   $0x0,(%esi)
    48db:	74 17                	je     48f4 <sys_rmdir+0x322>
    48dd:	89 e8                	mov    %ebp,%eax
    48df:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    48e3:	83 ec 0c             	sub    $0xc,%esp
    48e6:	50                   	push   %eax
    48e7:	e8 fc ff ff ff       	call   48e8 <sys_rmdir+0x316>
    48ec:	83 c4 10             	add    $0x10,%esp
    48ef:	e9 ae 00 00 00       	jmp    49a2 <sys_rmdir+0x3d0>
    48f4:	83 c6 20             	add    $0x20,%esi
    48f7:	47                   	inc    %edi
    48f8:	39 7c 24 04          	cmp    %edi,0x4(%esp)
    48fc:	7f 8c                	jg     488a <sys_rmdir+0x2b8>
    48fe:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    4902:	89 e9                	mov    %ebp,%ecx
    4904:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    4908:	83 ec 0c             	sub    $0xc,%esp
    490b:	51                   	push   %ecx
    490c:	e8 fc ff ff ff       	call   490d <sys_rmdir+0x33b>
    4911:	8a 43 0d             	mov    0xd(%ebx),%al
    4914:	83 c4 10             	add    $0x10,%esp
    4917:	3c 02                	cmp    $0x2,%al
    4919:	74 14                	je     492f <sys_rmdir+0x35d>
    491b:	83 ec 08             	sub    $0x8,%esp
    491e:	0f b6 c0             	movzbl %al,%eax
    4921:	50                   	push   %eax
    4922:	68 74 02 00 00       	push   $0x274
    4927:	e8 fc ff ff ff       	call   4928 <sys_rmdir+0x356>
    492c:	83 c4 10             	add    $0x10,%esp
    492f:	8b 44 24 10          	mov    0x10(%esp),%eax
    4933:	66 c7 00 00 00       	movw   $0x0,(%eax)
    4938:	c6 45 0b 01          	movb   $0x1,0xb(%ebp)
    493c:	83 ec 0c             	sub    $0xc,%esp
    493f:	55                   	push   %ebp
    4940:	e8 fc ff ff ff       	call   4941 <sys_rmdir+0x36f>
    4945:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    4949:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    494d:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    4951:	fe 49 0d             	decb   0xd(%ecx)
    4954:	8b 35 00 00 00 00    	mov    0x0,%esi
    495a:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    495f:	f7 ee                	imul   %esi
    4961:	89 d0                	mov    %edx,%eax
    4963:	c1 f8 05             	sar    $0x5,%eax
    4966:	c1 fe 1f             	sar    $0x1f,%esi
    4969:	29 f0                	sub    %esi,%eax
    496b:	03 05 00 00 00 00    	add    0x0,%eax
    4971:	89 41 08             	mov    %eax,0x8(%ecx)
    4974:	89 41 28             	mov    %eax,0x28(%ecx)
    4977:	c6 41 33 01          	movb   $0x1,0x33(%ecx)
    497b:	89 0c 24             	mov    %ecx,(%esp)
    497e:	e8 fc ff ff ff       	call   497f <sys_rmdir+0x3ad>
    4983:	89 1c 24             	mov    %ebx,(%esp)
    4986:	e8 fc ff ff ff       	call   4987 <sys_rmdir+0x3b5>
    498b:	83 c4 10             	add    $0x10,%esp
    498e:	eb 37                	jmp    49c7 <sys_rmdir+0x3f5>
    4990:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4995:	eb 30                	jmp    49c7 <sys_rmdir+0x3f5>
    4997:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    499c:	eb 29                	jmp    49c7 <sys_rmdir+0x3f5>
    499e:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    49a2:	83 ec 0c             	sub    $0xc,%esp
    49a5:	53                   	push   %ebx
    49a6:	e8 fc ff ff ff       	call   49a7 <sys_rmdir+0x3d5>
    49ab:	83 c4 04             	add    $0x4,%esp
    49ae:	ff 74 24 20          	pushl  0x20(%esp)
    49b2:	e8 fc ff ff ff       	call   49b3 <sys_rmdir+0x3e1>
    49b7:	89 2c 24             	mov    %ebp,(%esp)
    49ba:	e8 fc ff ff ff       	call   49bb <sys_rmdir+0x3e9>
    49bf:	83 c4 10             	add    $0x10,%esp
    49c2:	bf d9 ff ff ff       	mov    $0xffffffd9,%edi
    49c7:	89 f8                	mov    %edi,%eax
    49c9:	83 c4 2c             	add    $0x2c,%esp
    49cc:	5b                   	pop    %ebx
    49cd:	5e                   	pop    %esi
    49ce:	5f                   	pop    %edi
    49cf:	5d                   	pop    %ebp
    49d0:	c3                   	ret    

000049d1 <sys_unlink>:
    49d1:	56                   	push   %esi
    49d2:	53                   	push   %ebx
    49d3:	83 ec 14             	sub    $0x14,%esp
    49d6:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    49da:	8d 54 24 08          	lea    0x8(%esp),%edx
    49de:	8b 44 24 20          	mov    0x20(%esp),%eax
    49e2:	e8 da f0 ff ff       	call   3ac1 <dir_namei>
    49e7:	89 44 24 04          	mov    %eax,0x4(%esp)
    49eb:	85 c0                	test   %eax,%eax
    49ed:	0f 84 c4 01 00 00    	je     4bb7 <sys_unlink+0x1e6>
    49f3:	89 c3                	mov    %eax,%ebx
    49f5:	8b 74 24 08          	mov    0x8(%esp),%esi
    49f9:	85 f6                	test   %esi,%esi
    49fb:	75 16                	jne    4a13 <sys_unlink+0x42>
    49fd:	83 ec 0c             	sub    $0xc,%esp
    4a00:	50                   	push   %eax
    4a01:	e8 fc ff ff ff       	call   4a02 <sys_unlink+0x31>
    4a06:	83 c4 10             	add    $0x10,%esp
    4a09:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4a0e:	e9 a9 01 00 00       	jmp    4bbc <sys_unlink+0x1eb>
    4a13:	ba 02 00 00 00       	mov    $0x2,%edx
    4a18:	e8 81 ee ff ff       	call   389e <permission>
    4a1d:	85 c0                	test   %eax,%eax
    4a1f:	75 16                	jne    4a37 <sys_unlink+0x66>
    4a21:	83 ec 0c             	sub    $0xc,%esp
    4a24:	53                   	push   %ebx
    4a25:	e8 fc ff ff ff       	call   4a26 <sys_unlink+0x55>
    4a2a:	83 c4 10             	add    $0x10,%esp
    4a2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4a32:	e9 85 01 00 00       	jmp    4bbc <sys_unlink+0x1eb>
    4a37:	83 ec 0c             	sub    $0xc,%esp
    4a3a:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4a3e:	50                   	push   %eax
    4a3f:	89 f1                	mov    %esi,%ecx
    4a41:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4a45:	8d 44 24 14          	lea    0x14(%esp),%eax
    4a49:	e8 af ee ff ff       	call   38fd <find_entry>
    4a4e:	89 c6                	mov    %eax,%esi
    4a50:	83 c4 10             	add    $0x10,%esp
    4a53:	85 c0                	test   %eax,%eax
    4a55:	75 19                	jne    4a70 <sys_unlink+0x9f>
    4a57:	83 ec 0c             	sub    $0xc,%esp
    4a5a:	ff 74 24 10          	pushl  0x10(%esp)
    4a5e:	e8 fc ff ff ff       	call   4a5f <sys_unlink+0x8e>
    4a63:	83 c4 10             	add    $0x10,%esp
    4a66:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4a6b:	e9 4c 01 00 00       	jmp    4bbc <sys_unlink+0x1eb>
    4a70:	83 ec 08             	sub    $0x8,%esp
    4a73:	8b 44 24 08          	mov    0x8(%esp),%eax
    4a77:	0f b7 00             	movzwl (%eax),%eax
    4a7a:	50                   	push   %eax
    4a7b:	8b 44 24 10          	mov    0x10(%esp),%eax
    4a7f:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    4a83:	50                   	push   %eax
    4a84:	e8 fc ff ff ff       	call   4a85 <sys_unlink+0xb4>
    4a89:	89 c3                	mov    %eax,%ebx
    4a8b:	83 c4 10             	add    $0x10,%esp
    4a8e:	85 c0                	test   %eax,%eax
    4a90:	75 21                	jne    4ab3 <sys_unlink+0xe2>
    4a92:	83 ec 0c             	sub    $0xc,%esp
    4a95:	ff 74 24 10          	pushl  0x10(%esp)
    4a99:	e8 fc ff ff ff       	call   4a9a <sys_unlink+0xc9>
    4a9e:	89 34 24             	mov    %esi,(%esp)
    4aa1:	e8 fc ff ff ff       	call   4aa2 <sys_unlink+0xd1>
    4aa6:	83 c4 10             	add    $0x10,%esp
    4aa9:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4aae:	e9 09 01 00 00       	jmp    4bbc <sys_unlink+0x1eb>
    4ab3:	8b 44 24 04          	mov    0x4(%esp),%eax
    4ab7:	f7 00 00 02 00 00    	testl  $0x200,(%eax)
    4abd:	74 44                	je     4b03 <sys_unlink+0x132>
    4abf:	8b 15 00 00 00 00    	mov    0x0,%edx
    4ac5:	66 8b 92 42 02 00 00 	mov    0x242(%edx),%dx
    4acc:	66 85 d2             	test   %dx,%dx
    4acf:	74 32                	je     4b03 <sys_unlink+0x132>
    4ad1:	66 3b 53 02          	cmp    0x2(%ebx),%dx
    4ad5:	74 2c                	je     4b03 <sys_unlink+0x132>
    4ad7:	66 3b 50 02          	cmp    0x2(%eax),%dx
    4adb:	74 26                	je     4b03 <sys_unlink+0x132>
    4add:	83 ec 0c             	sub    $0xc,%esp
    4ae0:	50                   	push   %eax
    4ae1:	e8 fc ff ff ff       	call   4ae2 <sys_unlink+0x111>
    4ae6:	89 1c 24             	mov    %ebx,(%esp)
    4ae9:	e8 fc ff ff ff       	call   4aea <sys_unlink+0x119>
    4aee:	89 34 24             	mov    %esi,(%esp)
    4af1:	e8 fc ff ff ff       	call   4af2 <sys_unlink+0x121>
    4af6:	83 c4 10             	add    $0x10,%esp
    4af9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4afe:	e9 b9 00 00 00       	jmp    4bbc <sys_unlink+0x1eb>
    4b03:	8b 03                	mov    (%ebx),%eax
    4b05:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    4b0a:	66 3d 00 40          	cmp    $0x4000,%ax
    4b0e:	75 2a                	jne    4b3a <sys_unlink+0x169>
    4b10:	83 ec 0c             	sub    $0xc,%esp
    4b13:	53                   	push   %ebx
    4b14:	e8 fc ff ff ff       	call   4b15 <sys_unlink+0x144>
    4b19:	83 c4 04             	add    $0x4,%esp
    4b1c:	ff 74 24 10          	pushl  0x10(%esp)
    4b20:	e8 fc ff ff ff       	call   4b21 <sys_unlink+0x150>
    4b25:	89 34 24             	mov    %esi,(%esp)
    4b28:	e8 fc ff ff ff       	call   4b29 <sys_unlink+0x158>
    4b2d:	83 c4 10             	add    $0x10,%esp
    4b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4b35:	e9 82 00 00 00       	jmp    4bbc <sys_unlink+0x1eb>
    4b3a:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    4b3e:	75 1d                	jne    4b5d <sys_unlink+0x18c>
    4b40:	6a 00                	push   $0x0
    4b42:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
    4b46:	50                   	push   %eax
    4b47:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4b4b:	50                   	push   %eax
    4b4c:	68 98 02 00 00       	push   $0x298
    4b51:	e8 fc ff ff ff       	call   4b52 <sys_unlink+0x181>
    4b56:	c6 43 0d 01          	movb   $0x1,0xd(%ebx)
    4b5a:	83 c4 10             	add    $0x10,%esp
    4b5d:	8b 04 24             	mov    (%esp),%eax
    4b60:	66 c7 00 00 00       	movw   $0x0,(%eax)
    4b65:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4b69:	83 ec 0c             	sub    $0xc,%esp
    4b6c:	56                   	push   %esi
    4b6d:	e8 fc ff ff ff       	call   4b6e <sys_unlink+0x19d>
    4b72:	fe 4b 0d             	decb   0xd(%ebx)
    4b75:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4b79:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4b7f:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4b84:	f7 e9                	imul   %ecx
    4b86:	89 d0                	mov    %edx,%eax
    4b88:	c1 f8 05             	sar    $0x5,%eax
    4b8b:	c1 f9 1f             	sar    $0x1f,%ecx
    4b8e:	29 c8                	sub    %ecx,%eax
    4b90:	03 05 00 00 00 00    	add    0x0,%eax
    4b96:	89 43 28             	mov    %eax,0x28(%ebx)
    4b99:	89 1c 24             	mov    %ebx,(%esp)
    4b9c:	e8 fc ff ff ff       	call   4b9d <sys_unlink+0x1cc>
    4ba1:	83 c4 04             	add    $0x4,%esp
    4ba4:	ff 74 24 10          	pushl  0x10(%esp)
    4ba8:	e8 fc ff ff ff       	call   4ba9 <sys_unlink+0x1d8>
    4bad:	83 c4 10             	add    $0x10,%esp
    4bb0:	b8 00 00 00 00       	mov    $0x0,%eax
    4bb5:	eb 05                	jmp    4bbc <sys_unlink+0x1eb>
    4bb7:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4bbc:	83 c4 14             	add    $0x14,%esp
    4bbf:	5b                   	pop    %ebx
    4bc0:	5e                   	pop    %esi
    4bc1:	c3                   	ret    

00004bc2 <sys_link>:
    4bc2:	57                   	push   %edi
    4bc3:	56                   	push   %esi
    4bc4:	53                   	push   %ebx
    4bc5:	83 ec 1c             	sub    $0x1c,%esp
    4bc8:	ff 74 24 2c          	pushl  0x2c(%esp)
    4bcc:	e8 fc ff ff ff       	call   4bcd <sys_link+0xb>
    4bd1:	83 c4 10             	add    $0x10,%esp
    4bd4:	85 c0                	test   %eax,%eax
    4bd6:	0f 84 b5 01 00 00    	je     4d91 <sys_link+0x1cf>
    4bdc:	89 c3                	mov    %eax,%ebx
    4bde:	8b 00                	mov    (%eax),%eax
    4be0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    4be5:	66 3d 00 40          	cmp    $0x4000,%ax
    4be9:	75 16                	jne    4c01 <sys_link+0x3f>
    4beb:	83 ec 0c             	sub    $0xc,%esp
    4bee:	53                   	push   %ebx
    4bef:	e8 fc ff ff ff       	call   4bf0 <sys_link+0x2e>
    4bf4:	83 c4 10             	add    $0x10,%esp
    4bf7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4bfc:	e9 95 01 00 00       	jmp    4d96 <sys_link+0x1d4>
    4c01:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4c05:	89 e2                	mov    %esp,%edx
    4c07:	8b 44 24 24          	mov    0x24(%esp),%eax
    4c0b:	e8 b1 ee ff ff       	call   3ac1 <dir_namei>
    4c10:	89 c6                	mov    %eax,%esi
    4c12:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c16:	85 c0                	test   %eax,%eax
    4c18:	75 16                	jne    4c30 <sys_link+0x6e>
    4c1a:	83 ec 0c             	sub    $0xc,%esp
    4c1d:	53                   	push   %ebx
    4c1e:	e8 fc ff ff ff       	call   4c1f <sys_link+0x5d>
    4c23:	83 c4 10             	add    $0x10,%esp
    4c26:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
    4c2b:	e9 66 01 00 00       	jmp    4d96 <sys_link+0x1d4>
    4c30:	8b 3c 24             	mov    (%esp),%edi
    4c33:	85 ff                	test   %edi,%edi
    4c35:	75 22                	jne    4c59 <sys_link+0x97>
    4c37:	83 ec 0c             	sub    $0xc,%esp
    4c3a:	53                   	push   %ebx
    4c3b:	e8 fc ff ff ff       	call   4c3c <sys_link+0x7a>
    4c40:	83 c4 04             	add    $0x4,%esp
    4c43:	ff 74 24 14          	pushl  0x14(%esp)
    4c47:	e8 fc ff ff ff       	call   4c48 <sys_link+0x86>
    4c4c:	83 c4 10             	add    $0x10,%esp
    4c4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c54:	e9 3d 01 00 00       	jmp    4d96 <sys_link+0x1d4>
    4c59:	8b 43 2c             	mov    0x2c(%ebx),%eax
    4c5c:	66 39 46 2c          	cmp    %ax,0x2c(%esi)
    4c60:	74 1e                	je     4c80 <sys_link+0xbe>
    4c62:	83 ec 0c             	sub    $0xc,%esp
    4c65:	56                   	push   %esi
    4c66:	e8 fc ff ff ff       	call   4c67 <sys_link+0xa5>
    4c6b:	89 1c 24             	mov    %ebx,(%esp)
    4c6e:	e8 fc ff ff ff       	call   4c6f <sys_link+0xad>
    4c73:	83 c4 10             	add    $0x10,%esp
    4c76:	b8 ee ff ff ff       	mov    $0xffffffee,%eax
    4c7b:	e9 16 01 00 00       	jmp    4d96 <sys_link+0x1d4>
    4c80:	ba 02 00 00 00       	mov    $0x2,%edx
    4c85:	89 f0                	mov    %esi,%eax
    4c87:	e8 12 ec ff ff       	call   389e <permission>
    4c8c:	85 c0                	test   %eax,%eax
    4c8e:	75 1e                	jne    4cae <sys_link+0xec>
    4c90:	83 ec 0c             	sub    $0xc,%esp
    4c93:	56                   	push   %esi
    4c94:	e8 fc ff ff ff       	call   4c95 <sys_link+0xd3>
    4c99:	89 1c 24             	mov    %ebx,(%esp)
    4c9c:	e8 fc ff ff ff       	call   4c9d <sys_link+0xdb>
    4ca1:	83 c4 10             	add    $0x10,%esp
    4ca4:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
    4ca9:	e9 e8 00 00 00       	jmp    4d96 <sys_link+0x1d4>
    4cae:	83 ec 0c             	sub    $0xc,%esp
    4cb1:	8d 44 24 18          	lea    0x18(%esp),%eax
    4cb5:	50                   	push   %eax
    4cb6:	89 f9                	mov    %edi,%ecx
    4cb8:	8b 54 24 14          	mov    0x14(%esp),%edx
    4cbc:	8d 44 24 18          	lea    0x18(%esp),%eax
    4cc0:	e8 38 ec ff ff       	call   38fd <find_entry>
    4cc5:	83 c4 10             	add    $0x10,%esp
    4cc8:	85 c0                	test   %eax,%eax
    4cca:	74 2a                	je     4cf6 <sys_link+0x134>
    4ccc:	83 ec 0c             	sub    $0xc,%esp
    4ccf:	50                   	push   %eax
    4cd0:	e8 fc ff ff ff       	call   4cd1 <sys_link+0x10f>
    4cd5:	83 c4 04             	add    $0x4,%esp
    4cd8:	ff 74 24 14          	pushl  0x14(%esp)
    4cdc:	e8 fc ff ff ff       	call   4cdd <sys_link+0x11b>
    4ce1:	89 1c 24             	mov    %ebx,(%esp)
    4ce4:	e8 fc ff ff ff       	call   4ce5 <sys_link+0x123>
    4ce9:	83 c4 10             	add    $0x10,%esp
    4cec:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    4cf1:	e9 a0 00 00 00       	jmp    4d96 <sys_link+0x1d4>
    4cf6:	83 ec 0c             	sub    $0xc,%esp
    4cf9:	8d 44 24 18          	lea    0x18(%esp),%eax
    4cfd:	50                   	push   %eax
    4cfe:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4d02:	8b 54 24 14          	mov    0x14(%esp),%edx
    4d06:	8b 44 24 18          	mov    0x18(%esp),%eax
    4d0a:	e8 88 ef ff ff       	call   3c97 <add_entry>
    4d0f:	83 c4 10             	add    $0x10,%esp
    4d12:	85 c0                	test   %eax,%eax
    4d14:	75 1e                	jne    4d34 <sys_link+0x172>
    4d16:	83 ec 0c             	sub    $0xc,%esp
    4d19:	ff 74 24 14          	pushl  0x14(%esp)
    4d1d:	e8 fc ff ff ff       	call   4d1e <sys_link+0x15c>
    4d22:	89 1c 24             	mov    %ebx,(%esp)
    4d25:	e8 fc ff ff ff       	call   4d26 <sys_link+0x164>
    4d2a:	83 c4 10             	add    $0x10,%esp
    4d2d:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4d32:	eb 62                	jmp    4d96 <sys_link+0x1d4>
    4d34:	66 8b 4b 2e          	mov    0x2e(%ebx),%cx
    4d38:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4d3c:	66 89 0a             	mov    %cx,(%edx)
    4d3f:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4d43:	83 ec 0c             	sub    $0xc,%esp
    4d46:	50                   	push   %eax
    4d47:	e8 fc ff ff ff       	call   4d48 <sys_link+0x186>
    4d4c:	83 c4 04             	add    $0x4,%esp
    4d4f:	ff 74 24 14          	pushl  0x14(%esp)
    4d53:	e8 fc ff ff ff       	call   4d54 <sys_link+0x192>
    4d58:	fe 43 0d             	incb   0xd(%ebx)
    4d5b:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4d61:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4d66:	f7 e9                	imul   %ecx
    4d68:	89 d0                	mov    %edx,%eax
    4d6a:	c1 f8 05             	sar    $0x5,%eax
    4d6d:	c1 f9 1f             	sar    $0x1f,%ecx
    4d70:	29 c8                	sub    %ecx,%eax
    4d72:	03 05 00 00 00 00    	add    0x0,%eax
    4d78:	89 43 28             	mov    %eax,0x28(%ebx)
    4d7b:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4d7f:	89 1c 24             	mov    %ebx,(%esp)
    4d82:	e8 fc ff ff ff       	call   4d83 <sys_link+0x1c1>
    4d87:	83 c4 10             	add    $0x10,%esp
    4d8a:	b8 00 00 00 00       	mov    $0x0,%eax
    4d8f:	eb 05                	jmp    4d96 <sys_link+0x1d4>
    4d91:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4d96:	83 c4 10             	add    $0x10,%esp
    4d99:	5b                   	pop    %ebx
    4d9a:	5e                   	pop    %esi
    4d9b:	5f                   	pop    %edi
    4d9c:	c3                   	ret    

00004d9d <free_block>:
    4d9d:	55                   	push   %ebp
    4d9e:	57                   	push   %edi
    4d9f:	56                   	push   %esi
    4da0:	53                   	push   %ebx
    4da1:	83 ec 18             	sub    $0x18,%esp
    4da4:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    4da8:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    4dac:	57                   	push   %edi
    4dad:	e8 fc ff ff ff       	call   4dae <free_block+0x11>
    4db2:	89 c6                	mov    %eax,%esi
    4db4:	83 c4 10             	add    $0x10,%esp
    4db7:	85 c0                	test   %eax,%eax
    4db9:	75 10                	jne    4dcb <free_block+0x2e>
    4dbb:	83 ec 0c             	sub    $0xc,%esp
    4dbe:	68 c4 02 00 00       	push   $0x2c4
    4dc3:	e8 fc ff ff ff       	call   4dc4 <free_block+0x27>
    4dc8:	83 c4 10             	add    $0x10,%esp
    4dcb:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4dcf:	39 d8                	cmp    %ebx,%eax
    4dd1:	7f 08                	jg     4ddb <free_block+0x3e>
    4dd3:	0f b7 46 02          	movzwl 0x2(%esi),%eax
    4dd7:	39 c3                	cmp    %eax,%ebx
    4dd9:	7c 10                	jl     4deb <free_block+0x4e>
    4ddb:	83 ec 0c             	sub    $0xc,%esp
    4dde:	68 f0 02 00 00       	push   $0x2f0
    4de3:	e8 fc ff ff ff       	call   4de4 <free_block+0x47>
    4de8:	83 c4 10             	add    $0x10,%esp
    4deb:	83 ec 08             	sub    $0x8,%esp
    4dee:	53                   	push   %ebx
    4def:	57                   	push   %edi
    4df0:	e8 fc ff ff ff       	call   4df1 <free_block+0x54>
    4df5:	83 c4 10             	add    $0x10,%esp
    4df8:	85 c0                	test   %eax,%eax
    4dfa:	74 31                	je     4e2d <free_block+0x90>
    4dfc:	8a 50 0c             	mov    0xc(%eax),%dl
    4dff:	80 fa 01             	cmp    $0x1,%dl
    4e02:	74 15                	je     4e19 <free_block+0x7c>
    4e04:	0f b6 d2             	movzbl %dl,%edx
    4e07:	52                   	push   %edx
    4e08:	53                   	push   %ebx
    4e09:	57                   	push   %edi
    4e0a:	68 18 03 00 00       	push   $0x318
    4e0f:	e8 fc ff ff ff       	call   4e10 <free_block+0x73>
    4e14:	83 c4 10             	add    $0x10,%esp
    4e17:	eb 76                	jmp    4e8f <free_block+0xf2>
    4e19:	c6 40 0b 00          	movb   $0x0,0xb(%eax)
    4e1d:	c6 40 0a 00          	movb   $0x0,0xa(%eax)
    4e21:	83 ec 0c             	sub    $0xc,%esp
    4e24:	50                   	push   %eax
    4e25:	e8 fc ff ff ff       	call   4e26 <free_block+0x89>
    4e2a:	83 c4 10             	add    $0x10,%esp
    4e2d:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4e31:	48                   	dec    %eax
    4e32:	29 c3                	sub    %eax,%ebx
    4e34:	89 d8                	mov    %ebx,%eax
    4e36:	85 db                	test   %ebx,%ebx
    4e38:	79 06                	jns    4e40 <free_block+0xa3>
    4e3a:	8d 83 ff 1f 00 00    	lea    0x1fff(%ebx),%eax
    4e40:	c1 f8 0d             	sar    $0xd,%eax
    4e43:	8d 2c 86             	lea    (%esi,%eax,4),%ebp
    4e46:	89 da                	mov    %ebx,%edx
    4e48:	81 e2 ff 1f 00 00    	and    $0x1fff,%edx
    4e4e:	8b 45 34             	mov    0x34(%ebp),%eax
    4e51:	8b 08                	mov    (%eax),%ecx
    4e53:	b8 00 00 00 00       	mov    $0x0,%eax
    4e58:	0f b3 11             	btr    %edx,(%ecx)
    4e5b:	0f 93 c0             	setae  %al
    4e5e:	85 c0                	test   %eax,%eax
    4e60:	74 26                	je     4e88 <free_block+0xeb>
    4e62:	83 ec 04             	sub    $0x4,%esp
    4e65:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4e69:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
    4e6d:	50                   	push   %eax
    4e6e:	57                   	push   %edi
    4e6f:	68 36 02 00 00       	push   $0x236
    4e74:	e8 fc ff ff ff       	call   4e75 <free_block+0xd8>
    4e79:	c7 04 24 44 03 00 00 	movl   $0x344,(%esp)
    4e80:	e8 fc ff ff ff       	call   4e81 <free_block+0xe4>
    4e85:	83 c4 10             	add    $0x10,%esp
    4e88:	8b 45 34             	mov    0x34(%ebp),%eax
    4e8b:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4e8f:	83 c4 0c             	add    $0xc,%esp
    4e92:	5b                   	pop    %ebx
    4e93:	5e                   	pop    %esi
    4e94:	5f                   	pop    %edi
    4e95:	5d                   	pop    %ebp
    4e96:	c3                   	ret    

00004e97 <new_block>:
    4e97:	55                   	push   %ebp
    4e98:	57                   	push   %edi
    4e99:	56                   	push   %esi
    4e9a:	53                   	push   %ebx
    4e9b:	83 ec 28             	sub    $0x28,%esp
    4e9e:	ff 74 24 3c          	pushl  0x3c(%esp)
    4ea2:	e8 fc ff ff ff       	call   4ea3 <new_block+0xc>
    4ea7:	89 c5                	mov    %eax,%ebp
    4ea9:	83 c4 10             	add    $0x10,%esp
    4eac:	85 c0                	test   %eax,%eax
    4eae:	75 10                	jne    4ec0 <new_block+0x29>
    4eb0:	83 ec 0c             	sub    $0xc,%esp
    4eb3:	68 64 03 00 00       	push   $0x364
    4eb8:	e8 fc ff ff ff       	call   4eb9 <new_block+0x22>
    4ebd:	83 c4 10             	add    $0x10,%esp
    4ec0:	bb 00 00 00 00       	mov    $0x0,%ebx
    4ec5:	8b 7c 9d 34          	mov    0x34(%ebp,%ebx,4),%edi
    4ec9:	85 ff                	test   %edi,%edi
    4ecb:	74 30                	je     4efd <new_block+0x66>
    4ecd:	8b 37                	mov    (%edi),%esi
    4ecf:	b9 00 00 00 00       	mov    $0x0,%ecx
    4ed4:	fc                   	cld    
    4ed5:	56                   	push   %esi
    4ed6:	ad                   	lods   %ds:(%esi),%eax
    4ed7:	f7 d0                	not    %eax
    4ed9:	0f bc d0             	bsf    %eax,%edx
    4edc:	74 05                	je     4ee3 <new_block+0x4c>
    4ede:	01 d1                	add    %edx,%ecx
    4ee0:	5e                   	pop    %esi
    4ee1:	eb 0e                	jmp    4ef1 <new_block+0x5a>
    4ee3:	83 c1 20             	add    $0x20,%ecx
    4ee6:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
    4eec:	7c e8                	jl     4ed6 <new_block+0x3f>
    4eee:	83 c4 04             	add    $0x4,%esp
    4ef1:	81 f9 ff 1f 00 00    	cmp    $0x1fff,%ecx
    4ef7:	0f 8e c1 00 00 00    	jle    4fbe <new_block+0x127>
    4efd:	43                   	inc    %ebx
    4efe:	83 fb 08             	cmp    $0x8,%ebx
    4f01:	75 c2                	jne    4ec5 <new_block+0x2e>
    4f03:	b8 00 00 00 00       	mov    $0x0,%eax
    4f08:	e9 c0 00 00 00       	jmp    4fcd <new_block+0x136>
    4f0d:	b8 00 00 00 00       	mov    $0x0,%eax
    4f12:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4f16:	0f ab 16             	bts    %edx,(%esi)
    4f19:	0f 92 c0             	setb   %al
    4f1c:	85 c0                	test   %eax,%eax
    4f1e:	74 10                	je     4f30 <new_block+0x99>
    4f20:	83 ec 0c             	sub    $0xc,%esp
    4f23:	68 47 02 00 00       	push   $0x247
    4f28:	e8 fc ff ff ff       	call   4f29 <new_block+0x92>
    4f2d:	83 c4 10             	add    $0x10,%esp
    4f30:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
    4f34:	c1 e3 0d             	shl    $0xd,%ebx
    4f37:	0f b7 45 08          	movzwl 0x8(%ebp),%eax
    4f3b:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
    4f3f:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    4f43:	01 c3                	add    %eax,%ebx
    4f45:	0f b7 45 02          	movzwl 0x2(%ebp),%eax
    4f49:	39 c3                	cmp    %eax,%ebx
    4f4b:	7d 63                	jge    4fb0 <new_block+0x119>
    4f4d:	83 ec 08             	sub    $0x8,%esp
    4f50:	53                   	push   %ebx
    4f51:	ff 74 24 3c          	pushl  0x3c(%esp)
    4f55:	e8 fc ff ff ff       	call   4f56 <new_block+0xbf>
    4f5a:	89 c6                	mov    %eax,%esi
    4f5c:	83 c4 10             	add    $0x10,%esp
    4f5f:	85 c0                	test   %eax,%eax
    4f61:	75 10                	jne    4f73 <new_block+0xdc>
    4f63:	83 ec 0c             	sub    $0xc,%esp
    4f66:	68 62 02 00 00       	push   $0x262
    4f6b:	e8 fc ff ff ff       	call   4f6c <new_block+0xd5>
    4f70:	83 c4 10             	add    $0x10,%esp
    4f73:	80 7e 0c 01          	cmpb   $0x1,0xc(%esi)
    4f77:	74 10                	je     4f89 <new_block+0xf2>
    4f79:	83 ec 0c             	sub    $0xc,%esp
    4f7c:	68 7e 02 00 00       	push   $0x27e
    4f81:	e8 fc ff ff ff       	call   4f82 <new_block+0xeb>
    4f86:	83 c4 10             	add    $0x10,%esp
    4f89:	8b 3e                	mov    (%esi),%edi
    4f8b:	b9 00 01 00 00       	mov    $0x100,%ecx
    4f90:	b8 00 00 00 00       	mov    $0x0,%eax
    4f95:	fc                   	cld    
    4f96:	f3 ab                	rep stos %eax,%es:(%edi)
    4f98:	c6 46 0a 01          	movb   $0x1,0xa(%esi)
    4f9c:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4fa0:	83 ec 0c             	sub    $0xc,%esp
    4fa3:	56                   	push   %esi
    4fa4:	e8 fc ff ff ff       	call   4fa5 <new_block+0x10e>
    4fa9:	83 c4 10             	add    $0x10,%esp
    4fac:	89 d8                	mov    %ebx,%eax
    4fae:	eb 1d                	jmp    4fcd <new_block+0x136>
    4fb0:	b8 00 00 00 00       	mov    $0x0,%eax
    4fb5:	eb 16                	jmp    4fcd <new_block+0x136>
    4fb7:	b8 00 00 00 00       	mov    $0x0,%eax
    4fbc:	eb 0f                	jmp    4fcd <new_block+0x136>
    4fbe:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4fc2:	83 fb 07             	cmp    $0x7,%ebx
    4fc5:	0f 8e 42 ff ff ff    	jle    4f0d <new_block+0x76>
    4fcb:	eb ea                	jmp    4fb7 <new_block+0x120>
    4fcd:	83 c4 1c             	add    $0x1c,%esp
    4fd0:	5b                   	pop    %ebx
    4fd1:	5e                   	pop    %esi
    4fd2:	5f                   	pop    %edi
    4fd3:	5d                   	pop    %ebp
    4fd4:	c3                   	ret    

00004fd5 <free_inode>:
    4fd5:	57                   	push   %edi
    4fd6:	53                   	push   %ebx
    4fd7:	83 ec 04             	sub    $0x4,%esp
    4fda:	8b 7c 24 10          	mov    0x10(%esp),%edi
    4fde:	85 ff                	test   %edi,%edi
    4fe0:	0f 84 f9 00 00 00    	je     50df <free_inode+0x10a>
    4fe6:	66 83 7f 2c 00       	cmpw   $0x0,0x2c(%edi)
    4feb:	75 11                	jne    4ffe <free_inode+0x29>
    4fed:	b9 38 00 00 00       	mov    $0x38,%ecx
    4ff2:	b0 00                	mov    $0x0,%al
    4ff4:	fc                   	cld    
    4ff5:	57                   	push   %edi
    4ff6:	f3 aa                	rep stos %al,%es:(%edi)
    4ff8:	5f                   	pop    %edi
    4ff9:	e9 e1 00 00 00       	jmp    50df <free_inode+0x10a>
    4ffe:	8b 47 30             	mov    0x30(%edi),%eax
    5001:	66 83 f8 01          	cmp    $0x1,%ax
    5005:	76 20                	jbe    5027 <free_inode+0x52>
    5007:	83 ec 08             	sub    $0x8,%esp
    500a:	0f b7 c0             	movzwl %ax,%eax
    500d:	50                   	push   %eax
    500e:	68 94 03 00 00       	push   $0x394
    5013:	e8 fc ff ff ff       	call   5014 <free_inode+0x3f>
    5018:	c7 04 24 97 02 00 00 	movl   $0x297,(%esp)
    501f:	e8 fc ff ff ff       	call   5020 <free_inode+0x4b>
    5024:	83 c4 10             	add    $0x10,%esp
    5027:	80 7f 0d 00          	cmpb   $0x0,0xd(%edi)
    502b:	74 10                	je     503d <free_inode+0x68>
    502d:	83 ec 0c             	sub    $0xc,%esp
    5030:	68 b8 03 00 00       	push   $0x3b8
    5035:	e8 fc ff ff ff       	call   5036 <free_inode+0x61>
    503a:	83 c4 10             	add    $0x10,%esp
    503d:	83 ec 0c             	sub    $0xc,%esp
    5040:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    5044:	50                   	push   %eax
    5045:	e8 fc ff ff ff       	call   5046 <free_inode+0x71>
    504a:	89 c3                	mov    %eax,%ebx
    504c:	83 c4 10             	add    $0x10,%esp
    504f:	85 c0                	test   %eax,%eax
    5051:	75 10                	jne    5063 <free_inode+0x8e>
    5053:	83 ec 0c             	sub    $0xc,%esp
    5056:	68 d8 03 00 00       	push   $0x3d8
    505b:	e8 fc ff ff ff       	call   505c <free_inode+0x87>
    5060:	83 c4 10             	add    $0x10,%esp
    5063:	66 8b 47 2e          	mov    0x2e(%edi),%ax
    5067:	66 85 c0             	test   %ax,%ax
    506a:	74 05                	je     5071 <free_inode+0x9c>
    506c:	66 3b 03             	cmp    (%ebx),%ax
    506f:	76 10                	jbe    5081 <free_inode+0xac>
    5071:	83 ec 0c             	sub    $0xc,%esp
    5074:	68 04 04 00 00       	push   $0x404
    5079:	e8 fc ff ff ff       	call   507a <free_inode+0xa5>
    507e:	83 c4 10             	add    $0x10,%esp
    5081:	66 8b 47 2e          	mov    0x2e(%edi),%ax
    5085:	66 c1 e8 0d          	shr    $0xd,%ax
    5089:	0f b7 c0             	movzwl %ax,%eax
    508c:	8b 5c 83 14          	mov    0x14(%ebx,%eax,4),%ebx
    5090:	85 db                	test   %ebx,%ebx
    5092:	75 10                	jne    50a4 <free_inode+0xcf>
    5094:	83 ec 0c             	sub    $0xc,%esp
    5097:	68 30 04 00 00       	push   $0x430
    509c:	e8 fc ff ff ff       	call   509d <free_inode+0xc8>
    50a1:	83 c4 10             	add    $0x10,%esp
    50a4:	66 8b 57 2e          	mov    0x2e(%edi),%dx
    50a8:	81 e2 ff 1f 00 00    	and    $0x1fff,%edx
    50ae:	8b 0b                	mov    (%ebx),%ecx
    50b0:	b8 00 00 00 00       	mov    $0x0,%eax
    50b5:	0f b3 11             	btr    %edx,(%ecx)
    50b8:	0f 93 c0             	setae  %al
    50bb:	85 c0                	test   %eax,%eax
    50bd:	74 10                	je     50cf <free_inode+0xfa>
    50bf:	83 ec 0c             	sub    $0xc,%esp
    50c2:	68 50 04 00 00       	push   $0x450
    50c7:	e8 fc ff ff ff       	call   50c8 <free_inode+0xf3>
    50cc:	83 c4 10             	add    $0x10,%esp
    50cf:	c6 43 0b 01          	movb   $0x1,0xb(%ebx)
    50d3:	b9 38 00 00 00       	mov    $0x38,%ecx
    50d8:	b0 00                	mov    $0x0,%al
    50da:	fc                   	cld    
    50db:	57                   	push   %edi
    50dc:	f3 aa                	rep stos %al,%es:(%edi)
    50de:	5f                   	pop    %edi
    50df:	83 c4 04             	add    $0x4,%esp
    50e2:	5b                   	pop    %ebx
    50e3:	5f                   	pop    %edi
    50e4:	c3                   	ret    

000050e5 <new_inode>:
    50e5:	55                   	push   %ebp
    50e6:	57                   	push   %edi
    50e7:	56                   	push   %esi
    50e8:	53                   	push   %ebx
    50e9:	83 ec 1c             	sub    $0x1c,%esp
    50ec:	e8 fc ff ff ff       	call   50ed <new_inode+0x8>
    50f1:	85 c0                	test   %eax,%eax
    50f3:	0f 84 41 01 00 00    	je     523a <new_inode+0x155>
    50f9:	89 c5                	mov    %eax,%ebp
    50fb:	83 ec 0c             	sub    $0xc,%esp
    50fe:	ff 74 24 3c          	pushl  0x3c(%esp)
    5102:	e8 fc ff ff ff       	call   5103 <new_inode+0x1e>
    5107:	89 44 24 18          	mov    %eax,0x18(%esp)
    510b:	83 c4 10             	add    $0x10,%esp
    510e:	85 c0                	test   %eax,%eax
    5110:	75 10                	jne    5122 <new_inode+0x3d>
    5112:	83 ec 0c             	sub    $0xc,%esp
    5115:	68 a2 02 00 00       	push   $0x2a2
    511a:	e8 fc ff ff ff       	call   511b <new_inode+0x36>
    511f:	83 c4 10             	add    $0x10,%esp
    5122:	be 00 20 00 00       	mov    $0x2000,%esi
    5127:	bb 00 00 00 00       	mov    $0x0,%ebx
    512c:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    5130:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    5134:	8b 7c 9d 14          	mov    0x14(%ebp,%ebx,4),%edi
    5138:	85 ff                	test   %edi,%edi
    513a:	74 2e                	je     516a <new_inode+0x85>
    513c:	8b 37                	mov    (%edi),%esi
    513e:	b9 00 00 00 00       	mov    $0x0,%ecx
    5143:	fc                   	cld    
    5144:	56                   	push   %esi
    5145:	ad                   	lods   %ds:(%esi),%eax
    5146:	f7 d0                	not    %eax
    5148:	0f bc d0             	bsf    %eax,%edx
    514b:	74 05                	je     5152 <new_inode+0x6d>
    514d:	01 d1                	add    %edx,%ecx
    514f:	5e                   	pop    %esi
    5150:	eb 0e                	jmp    5160 <new_inode+0x7b>
    5152:	83 c1 20             	add    $0x20,%ecx
    5155:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
    515b:	7c e8                	jl     5145 <new_inode+0x60>
    515d:	83 c4 04             	add    $0x4,%esp
    5160:	89 ce                	mov    %ecx,%esi
    5162:	81 f9 ff 1f 00 00    	cmp    $0x1fff,%ecx
    5168:	7e 18                	jle    5182 <new_inode+0x9d>
    516a:	43                   	inc    %ebx
    516b:	83 fb 08             	cmp    $0x8,%ebx
    516e:	75 c4                	jne    5134 <new_inode+0x4f>
    5170:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    5174:	85 ff                	test   %edi,%edi
    5176:	74 20                	je     5198 <new_inode+0xb3>
    5178:	81 fe ff 1f 00 00    	cmp    $0x1fff,%esi
    517e:	7f 18                	jg     5198 <new_inode+0xb3>
    5180:	eb 04                	jmp    5186 <new_inode+0xa1>
    5182:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    5186:	89 d8                	mov    %ebx,%eax
    5188:	c1 e0 0d             	shl    $0xd,%eax
    518b:	01 f0                	add    %esi,%eax
    518d:	8b 54 24 08          	mov    0x8(%esp),%edx
    5191:	0f b7 12             	movzwl (%edx),%edx
    5194:	39 d0                	cmp    %edx,%eax
    5196:	7e 16                	jle    51ae <new_inode+0xc9>
    5198:	83 ec 0c             	sub    $0xc,%esp
    519b:	55                   	push   %ebp
    519c:	e8 fc ff ff ff       	call   519d <new_inode+0xb8>
    51a1:	83 c4 10             	add    $0x10,%esp
    51a4:	b8 00 00 00 00       	mov    $0x0,%eax
    51a9:	e9 91 00 00 00       	jmp    523f <new_inode+0x15a>
    51ae:	8b 17                	mov    (%edi),%edx
    51b0:	b8 00 00 00 00       	mov    $0x0,%eax
    51b5:	0f ab 32             	bts    %esi,(%edx)
    51b8:	0f 92 c0             	setb   %al
    51bb:	85 c0                	test   %eax,%eax
    51bd:	74 10                	je     51cf <new_inode+0xea>
    51bf:	83 ec 0c             	sub    $0xc,%esp
    51c2:	68 c0 02 00 00       	push   $0x2c0
    51c7:	e8 fc ff ff ff       	call   51c8 <new_inode+0xe3>
    51cc:	83 c4 10             	add    $0x10,%esp
    51cf:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
    51d3:	66 c7 45 30 01 00    	movw   $0x1,0x30(%ebp)
    51d9:	c6 45 0d 01          	movb   $0x1,0xd(%ebp)
    51dd:	8b 44 24 30          	mov    0x30(%esp),%eax
    51e1:	66 89 45 2c          	mov    %ax,0x2c(%ebp)
    51e5:	a1 00 00 00 00       	mov    0x0,%eax
    51ea:	66 8b 80 42 02 00 00 	mov    0x242(%eax),%ax
    51f1:	66 89 45 02          	mov    %ax,0x2(%ebp)
    51f5:	a1 00 00 00 00       	mov    0x0,%eax
    51fa:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
    5200:	88 45 0c             	mov    %al,0xc(%ebp)
    5203:	c6 45 33 01          	movb   $0x1,0x33(%ebp)
    5207:	c1 e3 0d             	shl    $0xd,%ebx
    520a:	01 f3                	add    %esi,%ebx
    520c:	66 89 5d 2e          	mov    %bx,0x2e(%ebp)
    5210:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    5216:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    521b:	f7 e9                	imul   %ecx
    521d:	89 d0                	mov    %edx,%eax
    521f:	c1 f8 05             	sar    $0x5,%eax
    5222:	c1 f9 1f             	sar    $0x1f,%ecx
    5225:	29 c8                	sub    %ecx,%eax
    5227:	03 05 00 00 00 00    	add    0x0,%eax
    522d:	89 45 28             	mov    %eax,0x28(%ebp)
    5230:	89 45 24             	mov    %eax,0x24(%ebp)
    5233:	89 45 08             	mov    %eax,0x8(%ebp)
    5236:	89 e8                	mov    %ebp,%eax
    5238:	eb 05                	jmp    523f <new_inode+0x15a>
    523a:	b8 00 00 00 00       	mov    $0x0,%eax
    523f:	83 c4 1c             	add    $0x1c,%esp
    5242:	5b                   	pop    %ebx
    5243:	5e                   	pop    %esi
    5244:	5f                   	pop    %edi
    5245:	5d                   	pop    %ebp
    5246:	c3                   	ret    

00005247 <dupfd>:
    5247:	83 f8 13             	cmp    $0x13,%eax
    524a:	77 3b                	ja     5287 <dupfd+0x40>
    524c:	56                   	push   %esi
    524d:	53                   	push   %ebx
    524e:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    5254:	8b 84 83 80 02 00 00 	mov    0x280(%ebx,%eax,4),%eax
    525b:	85 c0                	test   %eax,%eax
    525d:	74 2e                	je     528d <dupfd+0x46>
    525f:	83 fa 13             	cmp    $0x13,%edx
    5262:	77 30                	ja     5294 <dupfd+0x4d>
    5264:	83 bc 93 80 02 00 00 	cmpl   $0x0,0x280(%ebx,%edx,4)
    526b:	00 
    526c:	75 0c                	jne    527a <dupfd+0x33>
    526e:	eb 2b                	jmp    529b <dupfd+0x54>
    5270:	83 bc 93 80 02 00 00 	cmpl   $0x0,0x280(%ebx,%edx,4)
    5277:	00 
    5278:	74 21                	je     529b <dupfd+0x54>
    527a:	42                   	inc    %edx
    527b:	83 fa 14             	cmp    $0x14,%edx
    527e:	75 f0                	jne    5270 <dupfd+0x29>
    5280:	b8 e8 ff ff ff       	mov    $0xffffffe8,%eax
    5285:	eb 30                	jmp    52b7 <dupfd+0x70>
    5287:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    528c:	c3                   	ret    
    528d:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    5292:	eb 23                	jmp    52b7 <dupfd+0x70>
    5294:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    5299:	eb 1c                	jmp    52b7 <dupfd+0x70>
    529b:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    52a0:	88 d1                	mov    %dl,%cl
    52a2:	d3 c6                	rol    %cl,%esi
    52a4:	21 b3 7c 02 00 00    	and    %esi,0x27c(%ebx)
    52aa:	89 84 93 80 02 00 00 	mov    %eax,0x280(%ebx,%edx,4)
    52b1:	66 ff 40 04          	incw   0x4(%eax)
    52b5:	89 d0                	mov    %edx,%eax
    52b7:	5b                   	pop    %ebx
    52b8:	5e                   	pop    %esi
    52b9:	c3                   	ret    

000052ba <sys_dup2>:
    52ba:	53                   	push   %ebx
    52bb:	83 ec 14             	sub    $0x14,%esp
    52be:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    52c2:	53                   	push   %ebx
    52c3:	e8 fc ff ff ff       	call   52c4 <sys_dup2+0xa>
    52c8:	89 da                	mov    %ebx,%edx
    52ca:	8b 44 24 20          	mov    0x20(%esp),%eax
    52ce:	e8 74 ff ff ff       	call   5247 <dupfd>
    52d3:	83 c4 18             	add    $0x18,%esp
    52d6:	5b                   	pop    %ebx
    52d7:	c3                   	ret    

000052d8 <sys_dup>:
    52d8:	ba 00 00 00 00       	mov    $0x0,%edx
    52dd:	8b 44 24 04          	mov    0x4(%esp),%eax
    52e1:	e8 61 ff ff ff       	call   5247 <dupfd>
    52e6:	c3                   	ret    

000052e7 <sys_fcntl>:
    52e7:	53                   	push   %ebx
    52e8:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    52ec:	8b 44 24 0c          	mov    0xc(%esp),%eax
    52f0:	83 f9 13             	cmp    $0x13,%ecx
    52f3:	0f 87 91 00 00 00    	ja     538a <sys_fcntl+0xa3>
    52f9:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    52ff:	8b 94 8b 80 02 00 00 	mov    0x280(%ebx,%ecx,4),%edx
    5306:	85 d2                	test   %edx,%edx
    5308:	0f 84 83 00 00 00    	je     5391 <sys_fcntl+0xaa>
    530e:	83 f8 04             	cmp    $0x4,%eax
    5311:	0f 87 81 00 00 00    	ja     5398 <sys_fcntl+0xb1>
    5317:	ff 24 85 20 00 00 00 	jmp    *0x20(,%eax,4)
    531e:	8b 54 24 10          	mov    0x10(%esp),%edx
    5322:	89 c8                	mov    %ecx,%eax
    5324:	e8 1e ff ff ff       	call   5247 <dupfd>
    5329:	eb 72                	jmp    539d <sys_fcntl+0xb6>
    532b:	8b 83 7c 02 00 00    	mov    0x27c(%ebx),%eax
    5331:	d3 e8                	shr    %cl,%eax
    5333:	83 e0 01             	and    $0x1,%eax
    5336:	eb 65                	jmp    539d <sys_fcntl+0xb6>
    5338:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
    533d:	74 14                	je     5353 <sys_fcntl+0x6c>
    533f:	b8 01 00 00 00       	mov    $0x1,%eax
    5344:	d3 e0                	shl    %cl,%eax
    5346:	09 83 7c 02 00 00    	or     %eax,0x27c(%ebx)
    534c:	b8 00 00 00 00       	mov    $0x0,%eax
    5351:	eb 4a                	jmp    539d <sys_fcntl+0xb6>
    5353:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    5358:	d3 c0                	rol    %cl,%eax
    535a:	21 83 7c 02 00 00    	and    %eax,0x27c(%ebx)
    5360:	b8 00 00 00 00       	mov    $0x0,%eax
    5365:	eb 36                	jmp    539d <sys_fcntl+0xb6>
    5367:	0f b7 42 02          	movzwl 0x2(%edx),%eax
    536b:	eb 30                	jmp    539d <sys_fcntl+0xb6>
    536d:	66 8b 4a 02          	mov    0x2(%edx),%cx
    5371:	80 e5 f3             	and    $0xf3,%ch
    5374:	8b 44 24 10          	mov    0x10(%esp),%eax
    5378:	25 00 0c 00 00       	and    $0xc00,%eax
    537d:	09 c8                	or     %ecx,%eax
    537f:	66 89 42 02          	mov    %ax,0x2(%edx)
    5383:	b8 00 00 00 00       	mov    $0x0,%eax
    5388:	eb 13                	jmp    539d <sys_fcntl+0xb6>
    538a:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    538f:	eb 0c                	jmp    539d <sys_fcntl+0xb6>
    5391:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    5396:	eb 05                	jmp    539d <sys_fcntl+0xb6>
    5398:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    539d:	5b                   	pop    %ebx
    539e:	c3                   	ret    

0000539f <sys_ioctl>:
    539f:	83 ec 0c             	sub    $0xc,%esp
    53a2:	8b 44 24 10          	mov    0x10(%esp),%eax
    53a6:	83 f8 13             	cmp    $0x13,%eax
    53a9:	77 4d                	ja     53f8 <sys_ioctl+0x59>
    53ab:	8b 15 00 00 00 00    	mov    0x0,%edx
    53b1:	8b 84 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%eax
    53b8:	85 c0                	test   %eax,%eax
    53ba:	74 43                	je     53ff <sys_ioctl+0x60>
    53bc:	8b 50 08             	mov    0x8(%eax),%edx
    53bf:	8b 02                	mov    (%edx),%eax
    53c1:	25 00 b0 ff ff       	and    $0xffffb000,%eax
    53c6:	66 3d 00 20          	cmp    $0x2000,%ax
    53ca:	75 3a                	jne    5406 <sys_ioctl+0x67>
    53cc:	0f b7 52 0e          	movzwl 0xe(%edx),%edx
    53d0:	89 d0                	mov    %edx,%eax
    53d2:	c1 e8 08             	shr    $0x8,%eax
    53d5:	83 f8 07             	cmp    $0x7,%eax
    53d8:	77 33                	ja     540d <sys_ioctl+0x6e>
    53da:	8b 04 85 40 00 00 00 	mov    0x40(,%eax,4),%eax
    53e1:	85 c0                	test   %eax,%eax
    53e3:	74 2f                	je     5414 <sys_ioctl+0x75>
    53e5:	83 ec 04             	sub    $0x4,%esp
    53e8:	ff 74 24 1c          	pushl  0x1c(%esp)
    53ec:	ff 74 24 1c          	pushl  0x1c(%esp)
    53f0:	52                   	push   %edx
    53f1:	ff d0                	call   *%eax
    53f3:	83 c4 10             	add    $0x10,%esp
    53f6:	eb 21                	jmp    5419 <sys_ioctl+0x7a>
    53f8:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    53fd:	eb 1a                	jmp    5419 <sys_ioctl+0x7a>
    53ff:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    5404:	eb 13                	jmp    5419 <sys_ioctl+0x7a>
    5406:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    540b:	eb 0c                	jmp    5419 <sys_ioctl+0x7a>
    540d:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
    5412:	eb 05                	jmp    5419 <sys_ioctl+0x7a>
    5414:	b8 e7 ff ff ff       	mov    $0xffffffe7,%eax
    5419:	83 c4 0c             	add    $0xc,%esp
    541c:	c3                   	ret    

0000541d <free_ind>:
    541d:	85 d2                	test   %edx,%edx
    541f:	74 67                	je     5488 <free_ind+0x6b>
    5421:	55                   	push   %ebp
    5422:	57                   	push   %edi
    5423:	56                   	push   %esi
    5424:	53                   	push   %ebx
    5425:	83 ec 24             	sub    $0x24,%esp
    5428:	89 54 24 14          	mov    %edx,0x14(%esp)
    542c:	89 c7                	mov    %eax,%edi
    542e:	ff 74 24 14          	pushl  0x14(%esp)
    5432:	50                   	push   %eax
    5433:	e8 fc ff ff ff       	call   5434 <free_ind+0x17>
    5438:	89 c5                	mov    %eax,%ebp
    543a:	83 c4 10             	add    $0x10,%esp
    543d:	85 c0                	test   %eax,%eax
    543f:	74 33                	je     5474 <free_ind+0x57>
    5441:	8b 18                	mov    (%eax),%ebx
    5443:	8d b3 00 04 00 00    	lea    0x400(%ebx),%esi
    5449:	66 8b 03             	mov    (%ebx),%ax
    544c:	66 85 c0             	test   %ax,%ax
    544f:	74 10                	je     5461 <free_ind+0x44>
    5451:	83 ec 08             	sub    $0x8,%esp
    5454:	0f b7 c0             	movzwl %ax,%eax
    5457:	50                   	push   %eax
    5458:	57                   	push   %edi
    5459:	e8 fc ff ff ff       	call   545a <free_ind+0x3d>
    545e:	83 c4 10             	add    $0x10,%esp
    5461:	83 c3 02             	add    $0x2,%ebx
    5464:	39 de                	cmp    %ebx,%esi
    5466:	75 e1                	jne    5449 <free_ind+0x2c>
    5468:	83 ec 0c             	sub    $0xc,%esp
    546b:	55                   	push   %ebp
    546c:	e8 fc ff ff ff       	call   546d <free_ind+0x50>
    5471:	83 c4 10             	add    $0x10,%esp
    5474:	83 ec 08             	sub    $0x8,%esp
    5477:	ff 74 24 14          	pushl  0x14(%esp)
    547b:	57                   	push   %edi
    547c:	e8 fc ff ff ff       	call   547d <free_ind+0x60>
    5481:	83 c4 2c             	add    $0x2c,%esp
    5484:	5b                   	pop    %ebx
    5485:	5e                   	pop    %esi
    5486:	5f                   	pop    %edi
    5487:	5d                   	pop    %ebp
    5488:	c3                   	ret    

00005489 <truncate>:
    5489:	55                   	push   %ebp
    548a:	57                   	push   %edi
    548b:	56                   	push   %esi
    548c:	53                   	push   %ebx
    548d:	83 ec 1c             	sub    $0x1c,%esp
    5490:	8b 7c 24 30          	mov    0x30(%esp),%edi
    5494:	8b 07                	mov    (%edi),%eax
    5496:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    549b:	66 3d 00 80          	cmp    $0x8000,%ax
    549f:	75 08                	jne    54a9 <truncate+0x20>
    54a1:	8d 5f 0e             	lea    0xe(%edi),%ebx
    54a4:	8d 77 1c             	lea    0x1c(%edi),%esi
    54a7:	eb 0c                	jmp    54b5 <truncate+0x2c>
    54a9:	66 3d 00 40          	cmp    $0x4000,%ax
    54ad:	0f 85 d9 00 00 00    	jne    558c <truncate+0x103>
    54b3:	eb ec                	jmp    54a1 <truncate+0x18>
    54b5:	66 8b 03             	mov    (%ebx),%ax
    54b8:	66 85 c0             	test   %ax,%ax
    54bb:	74 19                	je     54d6 <truncate+0x4d>
    54bd:	83 ec 08             	sub    $0x8,%esp
    54c0:	0f b7 c0             	movzwl %ax,%eax
    54c3:	50                   	push   %eax
    54c4:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    54c8:	50                   	push   %eax
    54c9:	e8 fc ff ff ff       	call   54ca <truncate+0x41>
    54ce:	66 c7 03 00 00       	movw   $0x0,(%ebx)
    54d3:	83 c4 10             	add    $0x10,%esp
    54d6:	83 c3 02             	add    $0x2,%ebx
    54d9:	39 de                	cmp    %ebx,%esi
    54db:	75 d8                	jne    54b5 <truncate+0x2c>
    54dd:	0f b7 57 1c          	movzwl 0x1c(%edi),%edx
    54e1:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    54e5:	e8 33 ff ff ff       	call   541d <free_ind>
    54ea:	0f b7 47 1e          	movzwl 0x1e(%edi),%eax
    54ee:	89 44 24 08          	mov    %eax,0x8(%esp)
    54f2:	85 c0                	test   %eax,%eax
    54f4:	74 5c                	je     5552 <truncate+0xc9>
    54f6:	0f b7 6f 2c          	movzwl 0x2c(%edi),%ebp
    54fa:	83 ec 08             	sub    $0x8,%esp
    54fd:	ff 74 24 10          	pushl  0x10(%esp)
    5501:	55                   	push   %ebp
    5502:	e8 fc ff ff ff       	call   5503 <truncate+0x7a>
    5507:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    550b:	83 c4 10             	add    $0x10,%esp
    550e:	85 c0                	test   %eax,%eax
    5510:	74 30                	je     5542 <truncate+0xb9>
    5512:	8b 18                	mov    (%eax),%ebx
    5514:	8d b3 00 04 00 00    	lea    0x400(%ebx),%esi
    551a:	66 8b 13             	mov    (%ebx),%dx
    551d:	66 85 d2             	test   %dx,%dx
    5520:	74 0a                	je     552c <truncate+0xa3>
    5522:	0f b7 d2             	movzwl %dx,%edx
    5525:	89 e8                	mov    %ebp,%eax
    5527:	e8 f1 fe ff ff       	call   541d <free_ind>
    552c:	83 c3 02             	add    $0x2,%ebx
    552f:	39 de                	cmp    %ebx,%esi
    5531:	75 e7                	jne    551a <truncate+0x91>
    5533:	83 ec 0c             	sub    $0xc,%esp
    5536:	ff 74 24 18          	pushl  0x18(%esp)
    553a:	e8 fc ff ff ff       	call   553b <truncate+0xb2>
    553f:	83 c4 10             	add    $0x10,%esp
    5542:	83 ec 08             	sub    $0x8,%esp
    5545:	ff 74 24 10          	pushl  0x10(%esp)
    5549:	55                   	push   %ebp
    554a:	e8 fc ff ff ff       	call   554b <truncate+0xc2>
    554f:	83 c4 10             	add    $0x10,%esp
    5552:	66 c7 47 1e 00 00    	movw   $0x0,0x1e(%edi)
    5558:	66 c7 47 1c 00 00    	movw   $0x0,0x1c(%edi)
    555e:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
    5565:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    5569:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    556f:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    5574:	f7 e9                	imul   %ecx
    5576:	89 d0                	mov    %edx,%eax
    5578:	c1 f8 05             	sar    $0x5,%eax
    557b:	c1 f9 1f             	sar    $0x1f,%ecx
    557e:	29 c8                	sub    %ecx,%eax
    5580:	03 05 00 00 00 00    	add    0x0,%eax
    5586:	89 47 28             	mov    %eax,0x28(%edi)
    5589:	89 47 08             	mov    %eax,0x8(%edi)
    558c:	83 c4 1c             	add    $0x1c,%esp
    558f:	5b                   	pop    %ebx
    5590:	5e                   	pop    %esi
    5591:	5f                   	pop    %edi
    5592:	5d                   	pop    %ebp
    5593:	c3                   	ret    
