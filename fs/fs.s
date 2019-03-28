
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
    2d6e:	83 ec 0c             	sub    $0xc,%esp
    2d71:	68 11 02 00 00       	push   $0x211
    2d76:	e8 fc ff ff ff       	call   2d77 <change_ldt+0xc4>
    2d7b:	8b 44 24 24          	mov    0x24(%esp),%eax
    2d7f:	8d 70 7c             	lea    0x7c(%eax),%esi
    2d82:	81 ef 00 10 02 20    	sub    $0x20021000,%edi
    2d88:	83 c4 10             	add    $0x10,%esp
    2d8b:	8b 06                	mov    (%esi),%eax
    2d8d:	85 c0                	test   %eax,%eax
    2d8f:	74 0d                	je     2d9e <change_ldt+0xeb>
    2d91:	83 ec 08             	sub    $0x8,%esp
    2d94:	53                   	push   %ebx
    2d95:	50                   	push   %eax
    2d96:	e8 fc ff ff ff       	call   2d97 <change_ldt+0xe4>
    2d9b:	83 c4 10             	add    $0x10,%esp
    2d9e:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
    2da4:	83 ee 04             	sub    $0x4,%esi
    2da7:	39 fb                	cmp    %edi,%ebx
    2da9:	75 e0                	jne    2d8b <change_ldt+0xd8>
    2dab:	83 ec 0c             	sub    $0xc,%esp
    2dae:	68 2b 02 00 00       	push   $0x22b
    2db3:	e8 fc ff ff ff       	call   2db4 <change_ldt+0x101>
    2db8:	83 c4 10             	add    $0x10,%esp
    2dbb:	b8 00 00 00 e0       	mov    $0xe0000000,%eax
    2dc0:	5b                   	pop    %ebx
    2dc1:	5e                   	pop    %esi
    2dc2:	5f                   	pop    %edi
    2dc3:	c3                   	ret    

00002dc4 <do_execve>:
    2dc4:	55                   	push   %ebp
    2dc5:	57                   	push   %edi
    2dc6:	56                   	push   %esi
    2dc7:	53                   	push   %ebx
    2dc8:	81 ec dc 04 00 00    	sub    $0x4dc,%esp
    2dce:	8b 84 24 f0 04 00 00 	mov    0x4f0(%esp),%eax
    2dd5:	66 83 78 04 0f       	cmpw   $0xf,0x4(%eax)
    2dda:	74 10                	je     2dec <do_execve+0x28>
    2ddc:	83 ec 0c             	sub    $0xc,%esp
    2ddf:	68 d8 01 00 00       	push   $0x1d8
    2de4:	e8 fc ff ff ff       	call   2de5 <do_execve+0x21>
    2de9:	83 c4 10             	add    $0x10,%esp
    2dec:	8d 9c 24 50 04 00 00 	lea    0x450(%esp),%ebx
    2df3:	8d ac 24 d0 04 00 00 	lea    0x4d0(%esp),%ebp
    2dfa:	89 d8                	mov    %ebx,%eax
    2dfc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    2e02:	83 c0 04             	add    $0x4,%eax
    2e05:	39 e8                	cmp    %ebp,%eax
    2e07:	75 f3                	jne    2dfc <do_execve+0x38>
    2e09:	83 ec 0c             	sub    $0xc,%esp
    2e0c:	ff b4 24 04 05 00 00 	pushl  0x504(%esp)
    2e13:	e8 fc ff ff ff       	call   2e14 <do_execve+0x50>
    2e18:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    2e1c:	83 c4 10             	add    $0x10,%esp
    2e1f:	85 c0                	test   %eax,%eax
    2e21:	0f 84 02 07 00 00    	je     3529 <do_execve+0x765>
    2e27:	83 bc 24 fc 04 00 00 	cmpl   $0x0,0x4fc(%esp)
    2e2e:	00 
    2e2f:	74 2e                	je     2e5f <do_execve+0x9b>
    2e31:	8b 84 24 fc 04 00 00 	mov    0x4fc(%esp),%eax
    2e38:	83 c0 04             	add    $0x4,%eax
    2e3b:	8b bc 24 fc 04 00 00 	mov    0x4fc(%esp),%edi
    2e42:	64 8b 17             	mov    %fs:(%edi),%edx
    2e45:	85 d2                	test   %edx,%edx
    2e47:	74 20                	je     2e69 <do_execve+0xa5>
    2e49:	ba 00 00 00 00       	mov    $0x0,%edx
    2e4e:	42                   	inc    %edx
    2e4f:	64 8b 08             	mov    %fs:(%eax),%ecx
    2e52:	8d 40 04             	lea    0x4(%eax),%eax
    2e55:	85 c9                	test   %ecx,%ecx
    2e57:	75 f5                	jne    2e4e <do_execve+0x8a>
    2e59:	89 54 24 14          	mov    %edx,0x14(%esp)
    2e5d:	eb 12                	jmp    2e71 <do_execve+0xad>
    2e5f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2e66:	00 
    2e67:	eb 08                	jmp    2e71 <do_execve+0xad>
    2e69:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2e70:	00 
    2e71:	83 bc 24 00 05 00 00 	cmpl   $0x0,0x500(%esp)
    2e78:	00 
    2e79:	74 2e                	je     2ea9 <do_execve+0xe5>
    2e7b:	8b 84 24 00 05 00 00 	mov    0x500(%esp),%eax
    2e82:	83 c0 04             	add    $0x4,%eax
    2e85:	8b bc 24 00 05 00 00 	mov    0x500(%esp),%edi
    2e8c:	64 8b 17             	mov    %fs:(%edi),%edx
    2e8f:	85 d2                	test   %edx,%edx
    2e91:	74 20                	je     2eb3 <do_execve+0xef>
    2e93:	ba 00 00 00 00       	mov    $0x0,%edx
    2e98:	42                   	inc    %edx
    2e99:	64 8b 08             	mov    %fs:(%eax),%ecx
    2e9c:	8d 40 04             	lea    0x4(%eax),%eax
    2e9f:	85 c9                	test   %ecx,%ecx
    2ea1:	75 f5                	jne    2e98 <do_execve+0xd4>
    2ea3:	89 54 24 20          	mov    %edx,0x20(%esp)
    2ea7:	eb 12                	jmp    2ebb <do_execve+0xf7>
    2ea9:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2eb0:	00 
    2eb1:	eb 08                	jmp    2ebb <do_execve+0xf7>
    2eb3:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2eba:	00 
    2ebb:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    2ebf:	8b 17                	mov    (%edi),%edx
    2ec1:	89 d0                	mov    %edx,%eax
    2ec3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    2ec8:	66 3d 00 80          	cmp    $0x8000,%ax
    2ecc:	0f 85 c0 05 00 00    	jne    3492 <do_execve+0x6ce>
    2ed2:	c7 44 24 18 fc ff 01 	movl   $0x1fffc,0x18(%esp)
    2ed9:	00 
    2eda:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2ee1:	00 
    2ee2:	66 8c e0             	mov    %fs,%ax
    2ee5:	66 89 44 24 0c       	mov    %ax,0xc(%esp)
    2eea:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    2eef:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    2ef3:	89 fb                	mov    %edi,%ebx
    2ef5:	0f b7 c2             	movzwl %dx,%eax
    2ef8:	f6 c6 08             	test   $0x8,%dh
    2efb:	74 0a                	je     2f07 <do_execve+0x143>
    2efd:	0f b7 73 02          	movzwl 0x2(%ebx),%esi
    2f01:	89 74 24 28          	mov    %esi,0x28(%esp)
    2f05:	eb 11                	jmp    2f18 <do_execve+0x154>
    2f07:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f0d:	0f b7 b1 42 02 00 00 	movzwl 0x242(%ecx),%esi
    2f14:	89 74 24 28          	mov    %esi,0x28(%esp)
    2f18:	f6 c6 04             	test   $0x4,%dh
    2f1b:	74 0a                	je     2f27 <do_execve+0x163>
    2f1d:	0f b6 7b 0c          	movzbl 0xc(%ebx),%edi
    2f21:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    2f25:	eb 11                	jmp    2f38 <do_execve+0x174>
    2f27:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f2d:	0f b7 b1 48 02 00 00 	movzwl 0x248(%ecx),%esi
    2f34:	89 74 24 2c          	mov    %esi,0x2c(%esp)
    2f38:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f3e:	66 8b b1 42 02 00 00 	mov    0x242(%ecx),%si
    2f45:	66 3b 73 02          	cmp    0x2(%ebx),%si
    2f49:	75 05                	jne    2f50 <do_execve+0x18c>
    2f4b:	c1 f8 06             	sar    $0x6,%eax
    2f4e:	eb 10                	jmp    2f60 <do_execve+0x19c>
    2f50:	0f b6 7b 0c          	movzbl 0xc(%ebx),%edi
    2f54:	66 39 b9 48 02 00 00 	cmp    %di,0x248(%ecx)
    2f5b:	75 03                	jne    2f60 <do_execve+0x19c>
    2f5d:	c1 f8 03             	sar    $0x3,%eax
    2f60:	a8 01                	test   $0x1,%al
    2f62:	75 12                	jne    2f76 <do_execve+0x1b2>
    2f64:	f6 c2 49             	test   $0x49,%dl
    2f67:	0f 84 2c 05 00 00    	je     3499 <do_execve+0x6d5>
    2f6d:	66 85 f6             	test   %si,%si
    2f70:	0f 85 32 05 00 00    	jne    34a8 <do_execve+0x6e4>
    2f76:	83 ec 08             	sub    $0x8,%esp
    2f79:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    2f7d:	50                   	push   %eax
    2f7e:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    2f82:	50                   	push   %eax
    2f83:	e8 fc ff ff ff       	call   2f84 <do_execve+0x1c0>
    2f88:	89 c2                	mov    %eax,%edx
    2f8a:	83 c4 10             	add    $0x10,%esp
    2f8d:	85 c0                	test   %eax,%eax
    2f8f:	0f 84 22 05 00 00    	je     34b7 <do_execve+0x6f3>
    2f95:	8b 00                	mov    (%eax),%eax
    2f97:	80 38 23             	cmpb   $0x23,(%eax)
    2f9a:	0f 85 24 02 00 00    	jne    31c4 <do_execve+0x400>
    2fa0:	80 78 01 21          	cmpb   $0x21,0x1(%eax)
    2fa4:	0f 85 1a 02 00 00    	jne    31c4 <do_execve+0x400>
    2faa:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    2faf:	0f 85 0f 02 00 00    	jne    31c4 <do_execve+0x400>
    2fb5:	8d 70 02             	lea    0x2(%eax),%esi
    2fb8:	8d 7c 24 51          	lea    0x51(%esp),%edi
    2fbc:	b9 fe 03 00 00       	mov    $0x3fe,%ecx
    2fc1:	fc                   	cld    
    2fc2:	49                   	dec    %ecx
    2fc3:	78 08                	js     2fcd <do_execve+0x209>
    2fc5:	ac                   	lods   %ds:(%esi),%al
    2fc6:	aa                   	stos   %al,%es:(%edi)
    2fc7:	84 c0                	test   %al,%al
    2fc9:	75 f7                	jne    2fc2 <do_execve+0x1fe>
    2fcb:	f3 aa                	rep stos %al,%es:(%edi)
    2fcd:	83 ec 0c             	sub    $0xc,%esp
    2fd0:	52                   	push   %edx
    2fd1:	e8 fc ff ff ff       	call   2fd2 <do_execve+0x20e>
    2fd6:	89 1c 24             	mov    %ebx,(%esp)
    2fd9:	e8 fc ff ff ff       	call   2fda <do_execve+0x216>
    2fde:	c6 84 24 5f 04 00 00 	movb   $0x0,0x45f(%esp)
    2fe5:	00 
    2fe6:	b0 0a                	mov    $0xa,%al
    2fe8:	89 fe                	mov    %edi,%esi
    2fea:	fc                   	cld    
    2feb:	88 c4                	mov    %al,%ah
    2fed:	ac                   	lods   %ds:(%esi),%al
    2fee:	38 e0                	cmp    %ah,%al
    2ff0:	74 09                	je     2ffb <do_execve+0x237>
    2ff2:	84 c0                	test   %al,%al
    2ff4:	75 f7                	jne    2fed <do_execve+0x229>
    2ff6:	be 01 00 00 00       	mov    $0x1,%esi
    2ffb:	89 f0                	mov    %esi,%eax
    2ffd:	48                   	dec    %eax
    2ffe:	83 c4 10             	add    $0x10,%esp
    3001:	85 c0                	test   %eax,%eax
    3003:	0f 84 83 01 00 00    	je     318c <do_execve+0x3c8>
    3009:	c6 00 00             	movb   $0x0,(%eax)
    300c:	8d 5c 24 51          	lea    0x51(%esp),%ebx
    3010:	eb 01                	jmp    3013 <do_execve+0x24f>
    3012:	43                   	inc    %ebx
    3013:	8a 03                	mov    (%ebx),%al
    3015:	3c 20                	cmp    $0x20,%al
    3017:	74 f9                	je     3012 <do_execve+0x24e>
    3019:	3c 09                	cmp    $0x9,%al
    301b:	74 f5                	je     3012 <do_execve+0x24e>
    301d:	85 db                	test   %ebx,%ebx
    301f:	0f 84 75 01 00 00    	je     319a <do_execve+0x3d6>
    3025:	84 c0                	test   %al,%al
    3027:	0f 84 7b 01 00 00    	je     31a8 <do_execve+0x3e4>
    302d:	89 5c 24 48          	mov    %ebx,0x48(%esp)
    3031:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    3038:	00 
    3039:	3c 20                	cmp    $0x20,%al
    303b:	0f 84 ef 04 00 00    	je     3530 <do_execve+0x76c>
    3041:	3c 09                	cmp    $0x9,%al
    3043:	0f 84 eb 04 00 00    	je     3534 <do_execve+0x770>
    3049:	8d 53 01             	lea    0x1(%ebx),%edx
    304c:	3c 2f                	cmp    $0x2f,%al
    304e:	75 04                	jne    3054 <do_execve+0x290>
    3050:	89 54 24 48          	mov    %edx,0x48(%esp)
    3054:	89 d1                	mov    %edx,%ecx
    3056:	8a 02                	mov    (%edx),%al
    3058:	84 c0                	test   %al,%al
    305a:	74 12                	je     306e <do_execve+0x2aa>
    305c:	3c 20                	cmp    $0x20,%al
    305e:	0f 84 d2 04 00 00    	je     3536 <do_execve+0x772>
    3064:	42                   	inc    %edx
    3065:	3c 09                	cmp    $0x9,%al
    3067:	75 e3                	jne    304c <do_execve+0x288>
    3069:	e9 c8 04 00 00       	jmp    3536 <do_execve+0x772>
    306e:	83 ec 08             	sub    $0x8,%esp
    3071:	6a 00                	push   $0x0
    3073:	ff 74 24 24          	pushl  0x24(%esp)
    3077:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    307e:	8b 94 24 10 05 00 00 	mov    0x510(%esp),%edx
    3085:	8b 44 24 30          	mov    0x30(%esp),%eax
    3089:	e8 c4 f8 ff ff       	call   2952 <copy_strings>
    308e:	8b b4 24 0c 05 00 00 	mov    0x50c(%esp),%esi
    3095:	8d 56 04             	lea    0x4(%esi),%edx
    3098:	8b 7c 24 24          	mov    0x24(%esp),%edi
    309c:	8d 77 ff             	lea    -0x1(%edi),%esi
    309f:	83 c4 08             	add    $0x8,%esp
    30a2:	6a 00                	push   $0x0
    30a4:	50                   	push   %eax
    30a5:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30ac:	89 f0                	mov    %esi,%eax
    30ae:	e8 9f f8 ff ff       	call   2952 <copy_strings>
    30b3:	83 c4 08             	add    $0x8,%esp
    30b6:	6a 01                	push   $0x1
    30b8:	50                   	push   %eax
    30b9:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30c0:	8d 94 24 08 05 00 00 	lea    0x508(%esp),%edx
    30c7:	b8 01 00 00 00       	mov    $0x1,%eax
    30cc:	e8 81 f8 ff ff       	call   2952 <copy_strings>
    30d1:	83 c4 10             	add    $0x10,%esp
    30d4:	83 7c 24 4c 00       	cmpl   $0x0,0x4c(%esp)
    30d9:	74 23                	je     30fe <do_execve+0x33a>
    30db:	83 ec 08             	sub    $0x8,%esp
    30de:	6a 02                	push   $0x2
    30e0:	50                   	push   %eax
    30e1:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30e8:	8d 54 24 5c          	lea    0x5c(%esp),%edx
    30ec:	b8 01 00 00 00       	mov    $0x1,%eax
    30f1:	e8 5c f8 ff ff       	call   2952 <copy_strings>
    30f6:	47                   	inc    %edi
    30f7:	89 7c 24 24          	mov    %edi,0x24(%esp)
    30fb:	83 c4 10             	add    $0x10,%esp
    30fe:	83 ec 08             	sub    $0x8,%esp
    3101:	6a 02                	push   $0x2
    3103:	50                   	push   %eax
    3104:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    310b:	8d 54 24 58          	lea    0x58(%esp),%edx
    310f:	b8 01 00 00 00       	mov    $0x1,%eax
    3114:	e8 39 f8 ff ff       	call   2952 <copy_strings>
    3119:	89 44 24 28          	mov    %eax,0x28(%esp)
    311d:	ff 44 24 24          	incl   0x24(%esp)
    3121:	83 c4 10             	add    $0x10,%esp
    3124:	85 c0                	test   %eax,%eax
    3126:	0f 84 8a 00 00 00    	je     31b6 <do_execve+0x3f2>
    312c:	8b 7c 24 24          	mov    0x24(%esp),%edi
    3130:	66 8c d8             	mov    %ds,%ax
    3133:	8e e0                	mov    %eax,%fs
    3135:	83 ec 0c             	sub    $0xc,%esp
    3138:	53                   	push   %ebx
    3139:	e8 fc ff ff ff       	call   313a <do_execve+0x376>
    313e:	89 c3                	mov    %eax,%ebx
    3140:	83 c4 10             	add    $0x10,%esp
    3143:	85 c0                	test   %eax,%eax
    3145:	75 12                	jne    3159 <do_execve+0x395>
    3147:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    314b:	89 f8                	mov    %edi,%eax
    314d:	8e e0                	mov    %eax,%fs
    314f:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    3154:	e9 a4 03 00 00       	jmp    34fd <do_execve+0x739>
    3159:	8b 44 24 0c          	mov    0xc(%esp),%eax
    315d:	8e e0                	mov    %eax,%fs
    315f:	8b 13                	mov    (%ebx),%edx
    3161:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    3168:	00 
    3169:	89 d0                	mov    %edx,%eax
    316b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    3170:	66 3d 00 80          	cmp    $0x8000,%ax
    3174:	0f 84 7b fd ff ff    	je     2ef5 <do_execve+0x131>
    317a:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    317e:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3182:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3187:	e9 62 03 00 00       	jmp    34ee <do_execve+0x72a>
    318c:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3190:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    3195:	e9 63 03 00 00       	jmp    34fd <do_execve+0x739>
    319a:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    319e:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    31a3:	e9 55 03 00 00       	jmp    34fd <do_execve+0x739>
    31a8:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31ac:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    31b1:	e9 47 03 00 00       	jmp    34fd <do_execve+0x739>
    31b6:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31ba:	be f4 ff ff ff       	mov    $0xfffffff4,%esi
    31bf:	e9 39 03 00 00       	jmp    34fd <do_execve+0x739>
    31c4:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    31c8:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31cc:	8b 30                	mov    (%eax),%esi
    31ce:	8b 78 04             	mov    0x4(%eax),%edi
    31d1:	89 7c 24 24          	mov    %edi,0x24(%esp)
    31d5:	8b 78 08             	mov    0x8(%eax),%edi
    31d8:	89 7c 24 3c          	mov    %edi,0x3c(%esp)
    31dc:	8b 78 0c             	mov    0xc(%eax),%edi
    31df:	89 7c 24 38          	mov    %edi,0x38(%esp)
    31e3:	8b 78 10             	mov    0x10(%eax),%edi
    31e6:	89 7c 24 30          	mov    %edi,0x30(%esp)
    31ea:	8b 78 14             	mov    0x14(%eax),%edi
    31ed:	89 7c 24 34          	mov    %edi,0x34(%esp)
    31f1:	8b 78 18             	mov    0x18(%eax),%edi
    31f4:	8b 40 1c             	mov    0x1c(%eax),%eax
    31f7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    31fb:	83 ec 0c             	sub    $0xc,%esp
    31fe:	52                   	push   %edx
    31ff:	e8 fc ff ff ff       	call   3200 <do_execve+0x43c>
    3204:	83 c4 10             	add    $0x10,%esp
    3207:	81 fe 0b 01 00 00    	cmp    $0x10b,%esi
    320d:	0f 85 b3 02 00 00    	jne    34c6 <do_execve+0x702>
    3213:	85 ff                	test   %edi,%edi
    3215:	0f 85 b2 02 00 00    	jne    34cd <do_execve+0x709>
    321b:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    3220:	0f 85 ae 02 00 00    	jne    34d4 <do_execve+0x710>
    3226:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    322a:	03 74 24 24          	add    0x24(%esp),%esi
    322e:	8b 7c 24 38          	mov    0x38(%esp),%edi
    3232:	01 f7                	add    %esi,%edi
    3234:	81 ff 00 00 00 03    	cmp    $0x3000000,%edi
    323a:	0f 87 9b 02 00 00    	ja     34db <do_execve+0x717>
    3240:	8b 44 24 30          	mov    0x30(%esp),%eax
    3244:	8d 84 30 00 04 00 00 	lea    0x400(%eax,%esi,1),%eax
    324b:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    324f:	39 41 04             	cmp    %eax,0x4(%ecx)
    3252:	0f 82 8a 02 00 00    	jb     34e2 <do_execve+0x71e>
    3258:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    325d:	75 4c                	jne    32ab <do_execve+0x4e7>
    325f:	83 ec 08             	sub    $0x8,%esp
    3262:	6a 00                	push   $0x0
    3264:	ff 74 24 24          	pushl  0x24(%esp)
    3268:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    326f:	8b 94 24 10 05 00 00 	mov    0x510(%esp),%edx
    3276:	8b 44 24 30          	mov    0x30(%esp),%eax
    327a:	e8 d3 f6 ff ff       	call   2952 <copy_strings>
    327f:	83 c4 08             	add    $0x8,%esp
    3282:	6a 00                	push   $0x0
    3284:	50                   	push   %eax
    3285:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    328c:	8b 94 24 0c 05 00 00 	mov    0x50c(%esp),%edx
    3293:	8b 44 24 24          	mov    0x24(%esp),%eax
    3297:	e8 b6 f6 ff ff       	call   2952 <copy_strings>
    329c:	89 44 24 28          	mov    %eax,0x28(%esp)
    32a0:	83 c4 10             	add    $0x10,%esp
    32a3:	85 c0                	test   %eax,%eax
    32a5:	0f 84 3e 02 00 00    	je     34e9 <do_execve+0x725>
    32ab:	a1 00 00 00 00       	mov    0x0,%eax
    32b0:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
    32b6:	85 c0                	test   %eax,%eax
    32b8:	74 0c                	je     32c6 <do_execve+0x502>
    32ba:	83 ec 0c             	sub    $0xc,%esp
    32bd:	50                   	push   %eax
    32be:	e8 fc ff ff ff       	call   32bf <do_execve+0x4fb>
    32c3:	83 c4 10             	add    $0x10,%esp
    32c6:	8b 15 00 00 00 00    	mov    0x0,%edx
    32cc:	8b 44 24 0c          	mov    0xc(%esp),%eax
    32d0:	89 82 78 02 00 00    	mov    %eax,0x278(%edx)
    32d6:	8d 42 10             	lea    0x10(%edx),%eax
    32d9:	81 c2 10 02 00 00    	add    $0x210,%edx
    32df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    32e5:	83 c0 10             	add    $0x10,%eax
    32e8:	39 d0                	cmp    %edx,%eax
    32ea:	75 f3                	jne    32df <do_execve+0x51b>
    32ec:	bb 00 00 00 00       	mov    $0x0,%ebx
    32f1:	a1 00 00 00 00       	mov    0x0,%eax
    32f6:	8b 80 7c 02 00 00    	mov    0x27c(%eax),%eax
    32fc:	88 d9                	mov    %bl,%cl
    32fe:	d3 e8                	shr    %cl,%eax
    3300:	a8 01                	test   $0x1,%al
    3302:	74 0c                	je     3310 <do_execve+0x54c>
    3304:	83 ec 0c             	sub    $0xc,%esp
    3307:	53                   	push   %ebx
    3308:	e8 fc ff ff ff       	call   3309 <do_execve+0x545>
    330d:	83 c4 10             	add    $0x10,%esp
    3310:	43                   	inc    %ebx
    3311:	83 fb 14             	cmp    $0x14,%ebx
    3314:	75 db                	jne    32f1 <do_execve+0x52d>
    3316:	a1 00 00 00 00       	mov    0x0,%eax
    331b:	c7 80 7c 02 00 00 00 	movl   $0x0,0x27c(%eax)
    3322:	00 00 00 
    3325:	83 ec 0c             	sub    $0xc,%esp
    3328:	68 fc 01 00 00       	push   $0x1fc
    332d:	e8 fc ff ff ff       	call   332e <do_execve+0x56a>
    3332:	b9 0f 00 00 00       	mov    $0xf,%ecx
    3337:	0f 03 c9             	lsl    %cx,%ecx
    333a:	41                   	inc    %ecx
    333b:	50                   	push   %eax
    333c:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    3342:	8d 83 d8 02 00 00    	lea    0x2d8(%ebx),%eax
    3348:	83 c0 07             	add    $0x7,%eax
    334b:	8a 30                	mov    (%eax),%dh
    334d:	83 e8 03             	sub    $0x3,%eax
    3350:	8a 10                	mov    (%eax),%dl
    3352:	c1 e2 10             	shl    $0x10,%edx
    3355:	83 e8 02             	sub    $0x2,%eax
    3358:	66 8b 10             	mov    (%eax),%dx
    335b:	58                   	pop    %eax
    335c:	6a 01                	push   $0x1
    335e:	53                   	push   %ebx
    335f:	51                   	push   %ecx
    3360:	52                   	push   %edx
    3361:	e8 fc ff ff ff       	call   3362 <do_execve+0x59e>
    3366:	83 c4 14             	add    $0x14,%esp
    3369:	68 28 02 00 00       	push   $0x228
    336e:	e8 fc ff ff ff       	call   336f <do_execve+0x5ab>
    3373:	b9 17 00 00 00       	mov    $0x17,%ecx
    3378:	0f 03 c9             	lsl    %cx,%ecx
    337b:	41                   	inc    %ecx
    337c:	50                   	push   %eax
    337d:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    3383:	8d 83 e0 02 00 00    	lea    0x2e0(%ebx),%eax
    3389:	83 c0 07             	add    $0x7,%eax
    338c:	8a 30                	mov    (%eax),%dh
    338e:	83 e8 03             	sub    $0x3,%eax
    3391:	8a 10                	mov    (%eax),%dl
    3393:	c1 e2 10             	shl    $0x10,%edx
    3396:	83 e8 02             	sub    $0x2,%eax
    3399:	66 8b 10             	mov    (%eax),%dx
    339c:	58                   	pop    %eax
    339d:	6a 01                	push   $0x1
    339f:	53                   	push   %ebx
    33a0:	51                   	push   %ecx
    33a1:	52                   	push   %edx
    33a2:	e8 fc ff ff ff       	call   33a3 <do_execve+0x5df>
    33a7:	83 c4 14             	add    $0x14,%esp
    33aa:	68 58 02 00 00       	push   $0x258
    33af:	e8 fc ff ff ff       	call   33b0 <do_execve+0x5ec>
    33b4:	a1 00 00 00 00       	mov    0x0,%eax
    33b9:	83 c4 10             	add    $0x10,%esp
    33bc:	39 05 00 00 00 00    	cmp    %eax,0x0
    33c2:	75 0a                	jne    33ce <do_execve+0x60a>
    33c4:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
    33cb:	00 00 00 
    33ce:	66 c7 80 64 02 00 00 	movw   $0x0,0x264(%eax)
    33d5:	00 00 
    33d7:	83 ec 08             	sub    $0x8,%esp
    33da:	8d 84 24 58 04 00 00 	lea    0x458(%esp),%eax
    33e1:	50                   	push   %eax
    33e2:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    33e6:	55                   	push   %ebp
    33e7:	e8 fc ff ff ff       	call   33e8 <do_execve+0x624>
    33ec:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    33f0:	8d 9c 01 00 00 fe ff 	lea    -0x20000(%ecx,%eax,1),%ebx
    33f7:	83 c4 08             	add    $0x8,%esp
    33fa:	a1 00 00 00 00       	mov    0x0,%eax
    33ff:	ff b0 78 02 00 00    	pushl  0x278(%eax)
    3405:	68 44 02 00 00       	push   $0x244
    340a:	e8 fc ff ff ff       	call   340b <do_execve+0x647>
    340f:	83 c4 0c             	add    $0xc,%esp
    3412:	ff 74 24 24          	pushl  0x24(%esp)
    3416:	ff 74 24 1c          	pushl  0x1c(%esp)
    341a:	53                   	push   %ebx
    341b:	e8 fc ff ff ff       	call   341c <do_execve+0x658>
    3420:	8b 15 00 00 00 00    	mov    0x0,%edx
    3426:	89 aa 1c 02 00 00    	mov    %ebp,0x21c(%edx)
    342c:	89 b2 20 02 00 00    	mov    %esi,0x220(%edx)
    3432:	89 ba 24 02 00 00    	mov    %edi,0x224(%edx)
    3438:	89 c1                	mov    %eax,%ecx
    343a:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
    3440:	89 8a 28 02 00 00    	mov    %ecx,0x228(%edx)
    3446:	8b 7c 24 38          	mov    0x38(%esp),%edi
    344a:	66 89 ba 42 02 00 00 	mov    %di,0x242(%edx)
    3451:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    3455:	66 89 ba 48 02 00 00 	mov    %di,0x248(%edx)
    345c:	89 f2                	mov    %esi,%edx
    345e:	83 c4 10             	add    $0x10,%esp
    3461:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
    3467:	74 0f                	je     3478 <do_execve+0x6b4>
    3469:	b1 00                	mov    $0x0,%cl
    346b:	42                   	inc    %edx
    346c:	64 88 4a ff          	mov    %cl,%fs:-0x1(%edx)
    3470:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
    3476:	75 f3                	jne    346b <do_execve+0x6a7>
    3478:	8b b4 24 f0 04 00 00 	mov    0x4f0(%esp),%esi
    347f:	8b 7c 24 34          	mov    0x34(%esp),%edi
    3483:	89 3e                	mov    %edi,(%esi)
    3485:	89 46 0c             	mov    %eax,0xc(%esi)
    3488:	b8 00 00 00 00       	mov    $0x0,%eax
    348d:	e9 b1 00 00 00       	jmp    3543 <do_execve+0x77f>
    3492:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3497:	eb 55                	jmp    34ee <do_execve+0x72a>
    3499:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    349d:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    34a1:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34a6:	eb 46                	jmp    34ee <do_execve+0x72a>
    34a8:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    34ac:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    34b0:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34b5:	eb 37                	jmp    34ee <do_execve+0x72a>
    34b7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    34bb:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    34bf:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    34c4:	eb 28                	jmp    34ee <do_execve+0x72a>
    34c6:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34cb:	eb 21                	jmp    34ee <do_execve+0x72a>
    34cd:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34d2:	eb 1a                	jmp    34ee <do_execve+0x72a>
    34d4:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34d9:	eb 13                	jmp    34ee <do_execve+0x72a>
    34db:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34e0:	eb 0c                	jmp    34ee <do_execve+0x72a>
    34e2:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34e7:	eb 05                	jmp    34ee <do_execve+0x72a>
    34e9:	be f4 ff ff ff       	mov    $0xfffffff4,%esi
    34ee:	83 ec 0c             	sub    $0xc,%esp
    34f1:	ff 74 24 18          	pushl  0x18(%esp)
    34f5:	e8 fc ff ff ff       	call   34f6 <do_execve+0x732>
    34fa:	83 c4 10             	add    $0x10,%esp
    34fd:	83 ec 0c             	sub    $0xc,%esp
    3500:	ff 33                	pushl  (%ebx)
    3502:	e8 fc ff ff ff       	call   3503 <do_execve+0x73f>
    3507:	83 c4 10             	add    $0x10,%esp
    350a:	85 c0                	test   %eax,%eax
    350c:	75 10                	jne    351e <do_execve+0x75a>
    350e:	83 ec 0c             	sub    $0xc,%esp
    3511:	68 80 02 00 00       	push   $0x280
    3516:	e8 fc ff ff ff       	call   3517 <do_execve+0x753>
    351b:	83 c4 10             	add    $0x10,%esp
    351e:	83 c3 04             	add    $0x4,%ebx
    3521:	39 eb                	cmp    %ebp,%ebx
    3523:	75 d8                	jne    34fd <do_execve+0x739>
    3525:	89 f0                	mov    %esi,%eax
    3527:	eb 1a                	jmp    3543 <do_execve+0x77f>
    3529:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    352e:	eb 13                	jmp    3543 <do_execve+0x77f>
    3530:	89 d9                	mov    %ebx,%ecx
    3532:	eb 02                	jmp    3536 <do_execve+0x772>
    3534:	89 d9                	mov    %ebx,%ecx
    3536:	c6 01 00             	movb   $0x0,(%ecx)
    3539:	41                   	inc    %ecx
    353a:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
    353e:	e9 2b fb ff ff       	jmp    306e <do_execve+0x2aa>
    3543:	81 c4 dc 04 00 00    	add    $0x4dc,%esp
    3549:	5b                   	pop    %ebx
    354a:	5e                   	pop    %esi
    354b:	5f                   	pop    %edi
    354c:	5d                   	pop    %ebp
    354d:	c3                   	ret    

0000354e <read_pipe>:
    354e:	55                   	push   %ebp
    354f:	57                   	push   %edi
    3550:	56                   	push   %esi
    3551:	53                   	push   %ebx
    3552:	83 ec 1c             	sub    $0x1c,%esp
    3555:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    3559:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3560:	00 
    3561:	8d 7b 20             	lea    0x20(%ebx),%edi
    3564:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    3569:	0f 8f a6 00 00 00    	jg     3615 <read_pipe+0xc7>
    356f:	e9 be 00 00 00       	jmp    3632 <read_pipe+0xe4>
    3574:	83 ec 0c             	sub    $0xc,%esp
    3577:	57                   	push   %edi
    3578:	e8 fc ff ff ff       	call   3579 <read_pipe+0x2b>
    357d:	83 c4 10             	add    $0x10,%esp
    3580:	66 83 7b 30 02       	cmpw   $0x2,0x30(%ebx)
    3585:	0f 85 b6 00 00 00    	jne    3641 <read_pipe+0xf3>
    358b:	83 ec 0c             	sub    $0xc,%esp
    358e:	57                   	push   %edi
    358f:	e8 fc ff ff ff       	call   3590 <read_pipe+0x42>
    3594:	8b 53 10             	mov    0x10(%ebx),%edx
    3597:	0f b7 c2             	movzwl %dx,%eax
    359a:	0f b7 4b 0e          	movzwl 0xe(%ebx),%ecx
    359e:	29 c1                	sub    %eax,%ecx
    35a0:	83 c4 10             	add    $0x10,%esp
    35a3:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    35a9:	74 c9                	je     3574 <read_pipe+0x26>
    35ab:	be 00 10 00 00       	mov    $0x1000,%esi
    35b0:	29 c6                	sub    %eax,%esi
    35b2:	8b 6c 24 38          	mov    0x38(%esp),%ebp
    35b6:	39 cd                	cmp    %ecx,%ebp
    35b8:	7e 02                	jle    35bc <read_pipe+0x6e>
    35ba:	89 cd                	mov    %ecx,%ebp
    35bc:	89 f1                	mov    %esi,%ecx
    35be:	39 ee                	cmp    %ebp,%esi
    35c0:	7e 02                	jle    35c4 <read_pipe+0x76>
    35c2:	89 e9                	mov    %ebp,%ecx
    35c4:	29 4c 24 38          	sub    %ecx,0x38(%esp)
    35c8:	01 4c 24 0c          	add    %ecx,0xc(%esp)
    35cc:	01 ca                	add    %ecx,%edx
    35ce:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    35d4:	66 89 53 10          	mov    %dx,0x10(%ebx)
    35d8:	85 c9                	test   %ecx,%ecx
    35da:	7e 30                	jle    360c <read_pipe+0xbe>
    35dc:	8b 6b 04             	mov    0x4(%ebx),%ebp
    35df:	03 4c 24 34          	add    0x34(%esp),%ecx
    35e3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    35e7:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    35eb:	29 c8                	sub    %ecx,%eax
    35ed:	89 c6                	mov    %eax,%esi
    35ef:	8d 41 01             	lea    0x1(%ecx),%eax
    35f2:	8d 14 30             	lea    (%eax,%esi,1),%edx
    35f5:	8a 54 2a ff          	mov    -0x1(%edx,%ebp,1),%dl
    35f9:	64 88 11             	mov    %dl,%fs:(%ecx)
    35fc:	89 c1                	mov    %eax,%ecx
    35fe:	3b 44 24 08          	cmp    0x8(%esp),%eax
    3602:	75 eb                	jne    35ef <read_pipe+0xa1>
    3604:	8b 44 24 08          	mov    0x8(%esp),%eax
    3608:	89 44 24 34          	mov    %eax,0x34(%esp)
    360c:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    3611:	7f 02                	jg     3615 <read_pipe+0xc7>
    3613:	eb 1d                	jmp    3632 <read_pipe+0xe4>
    3615:	8b 53 10             	mov    0x10(%ebx),%edx
    3618:	0f b7 c2             	movzwl %dx,%eax
    361b:	0f b7 4b 0e          	movzwl 0xe(%ebx),%ecx
    361f:	29 c1                	sub    %eax,%ecx
    3621:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    3627:	0f 84 47 ff ff ff    	je     3574 <read_pipe+0x26>
    362d:	e9 79 ff ff ff       	jmp    35ab <read_pipe+0x5d>
    3632:	83 ec 0c             	sub    $0xc,%esp
    3635:	83 c3 20             	add    $0x20,%ebx
    3638:	53                   	push   %ebx
    3639:	e8 fc ff ff ff       	call   363a <read_pipe+0xec>
    363e:	83 c4 10             	add    $0x10,%esp
    3641:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3645:	83 c4 1c             	add    $0x1c,%esp
    3648:	5b                   	pop    %ebx
    3649:	5e                   	pop    %esi
    364a:	5f                   	pop    %edi
    364b:	5d                   	pop    %ebp
    364c:	c3                   	ret    

0000364d <write_pipe>:
    364d:	55                   	push   %ebp
    364e:	57                   	push   %edi
    364f:	56                   	push   %esi
    3650:	53                   	push   %ebx
    3651:	83 ec 1c             	sub    $0x1c,%esp
    3654:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    3658:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    365f:	00 
    3660:	8d 73 20             	lea    0x20(%ebx),%esi
    3663:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    3668:	0f 8f b9 00 00 00    	jg     3727 <write_pipe+0xda>
    366e:	e9 d4 00 00 00       	jmp    3747 <write_pipe+0xfa>
    3673:	83 ec 0c             	sub    $0xc,%esp
    3676:	56                   	push   %esi
    3677:	e8 fc ff ff ff       	call   3678 <write_pipe+0x2b>
    367c:	83 c4 10             	add    $0x10,%esp
    367f:	66 83 7b 30 02       	cmpw   $0x2,0x30(%ebx)
    3684:	74 1d                	je     36a3 <write_pipe+0x56>
    3686:	a1 00 00 00 00       	mov    0x0,%eax
    368b:	81 48 0c 00 10 00 00 	orl    $0x1000,0xc(%eax)
    3692:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3696:	85 c0                	test   %eax,%eax
    3698:	0f 84 be 00 00 00    	je     375c <write_pipe+0x10f>
    369e:	e9 be 00 00 00       	jmp    3761 <write_pipe+0x114>
    36a3:	83 ec 0c             	sub    $0xc,%esp
    36a6:	56                   	push   %esi
    36a7:	e8 fc ff ff ff       	call   36a8 <write_pipe+0x5b>
    36ac:	66 8b 53 0e          	mov    0xe(%ebx),%dx
    36b0:	0f b7 ca             	movzwl %dx,%ecx
    36b3:	0f b7 43 10          	movzwl 0x10(%ebx),%eax
    36b7:	89 cf                	mov    %ecx,%edi
    36b9:	29 c7                	sub    %eax,%edi
    36bb:	89 f8                	mov    %edi,%eax
    36bd:	f7 d0                	not    %eax
    36bf:	83 c4 10             	add    $0x10,%esp
    36c2:	25 ff 0f 00 00       	and    $0xfff,%eax
    36c7:	74 aa                	je     3673 <write_pipe+0x26>
    36c9:	bd 00 10 00 00       	mov    $0x1000,%ebp
    36ce:	29 cd                	sub    %ecx,%ebp
    36d0:	8b 7c 24 38          	mov    0x38(%esp),%edi
    36d4:	39 c7                	cmp    %eax,%edi
    36d6:	7e 02                	jle    36da <write_pipe+0x8d>
    36d8:	89 c7                	mov    %eax,%edi
    36da:	89 e8                	mov    %ebp,%eax
    36dc:	39 fd                	cmp    %edi,%ebp
    36de:	7e 02                	jle    36e2 <write_pipe+0x95>
    36e0:	89 f8                	mov    %edi,%eax
    36e2:	29 44 24 38          	sub    %eax,0x38(%esp)
    36e6:	01 44 24 0c          	add    %eax,0xc(%esp)
    36ea:	01 c2                	add    %eax,%edx
    36ec:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    36f2:	66 89 53 0e          	mov    %dx,0xe(%ebx)
    36f6:	85 c0                	test   %eax,%eax
    36f8:	7e 24                	jle    371e <write_pipe+0xd1>
    36fa:	03 44 24 34          	add    0x34(%esp),%eax
    36fe:	89 c7                	mov    %eax,%edi
    3700:	8b 44 24 34          	mov    0x34(%esp),%eax
    3704:	29 c1                	sub    %eax,%ecx
    3706:	89 cd                	mov    %ecx,%ebp
    3708:	8d 50 01             	lea    0x1(%eax),%edx
    370b:	64 8a 08             	mov    %fs:(%eax),%cl
    370e:	03 43 04             	add    0x4(%ebx),%eax
    3711:	88 0c 28             	mov    %cl,(%eax,%ebp,1)
    3714:	89 d0                	mov    %edx,%eax
    3716:	39 fa                	cmp    %edi,%edx
    3718:	75 ee                	jne    3708 <write_pipe+0xbb>
    371a:	89 7c 24 34          	mov    %edi,0x34(%esp)
    371e:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    3723:	7f 02                	jg     3727 <write_pipe+0xda>
    3725:	eb 20                	jmp    3747 <write_pipe+0xfa>
    3727:	66 8b 53 0e          	mov    0xe(%ebx),%dx
    372b:	0f b7 ca             	movzwl %dx,%ecx
    372e:	0f b7 43 10          	movzwl 0x10(%ebx),%eax
    3732:	89 cf                	mov    %ecx,%edi
    3734:	29 c7                	sub    %eax,%edi
    3736:	89 f8                	mov    %edi,%eax
    3738:	f7 d0                	not    %eax
    373a:	25 ff 0f 00 00       	and    $0xfff,%eax
    373f:	0f 84 2e ff ff ff    	je     3673 <write_pipe+0x26>
    3745:	eb 82                	jmp    36c9 <write_pipe+0x7c>
    3747:	83 ec 0c             	sub    $0xc,%esp
    374a:	83 c3 20             	add    $0x20,%ebx
    374d:	53                   	push   %ebx
    374e:	e8 fc ff ff ff       	call   374f <write_pipe+0x102>
    3753:	83 c4 10             	add    $0x10,%esp
    3756:	8b 44 24 0c          	mov    0xc(%esp),%eax
    375a:	eb 05                	jmp    3761 <write_pipe+0x114>
    375c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3761:	83 c4 1c             	add    $0x1c,%esp
    3764:	5b                   	pop    %ebx
    3765:	5e                   	pop    %esi
    3766:	5f                   	pop    %edi
    3767:	5d                   	pop    %ebp
    3768:	c3                   	ret    

00003769 <sys_pipe>:
    3769:	56                   	push   %esi
    376a:	53                   	push   %ebx
    376b:	83 ec 14             	sub    $0x14,%esp
    376e:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    3772:	b8 00 00 00 00       	mov    $0x0,%eax
    3777:	be 00 04 00 00       	mov    $0x400,%esi
    377c:	ba 00 00 00 00       	mov    $0x0,%edx
    3781:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
    3786:	75 0b                	jne    3793 <sys_pipe+0x2a>
    3788:	89 44 94 08          	mov    %eax,0x8(%esp,%edx,4)
    378c:	66 ff 40 04          	incw   0x4(%eax)
    3790:	8d 52 01             	lea    0x1(%edx),%edx
    3793:	83 fa 01             	cmp    $0x1,%edx
    3796:	0f 8f 03 01 00 00    	jg     389f <sys_pipe+0x136>
    379c:	83 c0 10             	add    $0x10,%eax
    379f:	39 c6                	cmp    %eax,%esi
    37a1:	75 de                	jne    3781 <sys_pipe+0x18>
    37a3:	e9 e8 00 00 00       	jmp    3890 <sys_pipe+0x127>
    37a8:	8b 44 24 08          	mov    0x8(%esp),%eax
    37ac:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    37b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    37b7:	e9 27 01 00 00       	jmp    38e3 <sys_pipe+0x17a>
    37bc:	83 bc 81 80 02 00 00 	cmpl   $0x0,0x280(%ecx,%eax,4)
    37c3:	00 
    37c4:	75 0f                	jne    37d5 <sys_pipe+0x6c>
    37c6:	89 04 94             	mov    %eax,(%esp,%edx,4)
    37c9:	8b 74 94 08          	mov    0x8(%esp,%edx,4),%esi
    37cd:	89 b4 81 80 02 00 00 	mov    %esi,0x280(%ecx,%eax,4)
    37d4:	42                   	inc    %edx
    37d5:	40                   	inc    %eax
    37d6:	83 fa 01             	cmp    $0x1,%edx
    37d9:	0f 8f fa 00 00 00    	jg     38d9 <sys_pipe+0x170>
    37df:	83 f8 14             	cmp    $0x14,%eax
    37e2:	75 d8                	jne    37bc <sys_pipe+0x53>
    37e4:	e9 d4 00 00 00       	jmp    38bd <sys_pipe+0x154>
    37e9:	8b 04 24             	mov    (%esp),%eax
    37ec:	c7 84 81 80 02 00 00 	movl   $0x0,0x280(%ecx,%eax,4)
    37f3:	00 00 00 00 
    37f7:	8b 44 24 0c          	mov    0xc(%esp),%eax
    37fb:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    3801:	8b 44 24 08          	mov    0x8(%esp),%eax
    3805:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    380b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3810:	e9 ce 00 00 00       	jmp    38e3 <sys_pipe+0x17a>
    3815:	a1 00 00 00 00       	mov    0x0,%eax
    381a:	8b 54 24 04          	mov    0x4(%esp),%edx
    381e:	c7 84 90 80 02 00 00 	movl   $0x0,0x280(%eax,%edx,4)
    3825:	00 00 00 00 
    3829:	8b 14 24             	mov    (%esp),%edx
    382c:	c7 84 90 80 02 00 00 	movl   $0x0,0x280(%eax,%edx,4)
    3833:	00 00 00 00 
    3837:	8b 44 24 0c          	mov    0xc(%esp),%eax
    383b:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    3841:	8b 44 24 08          	mov    0x8(%esp),%eax
    3845:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    384b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3850:	e9 8e 00 00 00       	jmp    38e3 <sys_pipe+0x17a>
    3855:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3859:	8b 54 24 0c          	mov    0xc(%esp),%edx
    385d:	89 42 08             	mov    %eax,0x8(%edx)
    3860:	89 41 08             	mov    %eax,0x8(%ecx)
    3863:	c7 42 0c 00 00 00 00 	movl   $0x0,0xc(%edx)
    386a:	c7 41 0c 00 00 00 00 	movl   $0x0,0xc(%ecx)
    3871:	66 c7 01 01 00       	movw   $0x1,(%ecx)
    3876:	66 c7 02 02 00       	movw   $0x2,(%edx)
    387b:	8b 04 24             	mov    (%esp),%eax
    387e:	64 89 03             	mov    %eax,%fs:(%ebx)
    3881:	8b 44 24 04          	mov    0x4(%esp),%eax
    3885:	64 89 43 04          	mov    %eax,%fs:0x4(%ebx)
    3889:	b8 00 00 00 00       	mov    $0x0,%eax
    388e:	eb 53                	jmp    38e3 <sys_pipe+0x17a>
    3890:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3895:	83 fa 01             	cmp    $0x1,%edx
    3898:	75 49                	jne    38e3 <sys_pipe+0x17a>
    389a:	e9 09 ff ff ff       	jmp    37a8 <sys_pipe+0x3f>
    389f:	83 fa 01             	cmp    $0x1,%edx
    38a2:	0f 84 00 ff ff ff    	je     37a8 <sys_pipe+0x3f>
    38a8:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    38ae:	ba 00 00 00 00       	mov    $0x0,%edx
    38b3:	b8 00 00 00 00       	mov    $0x0,%eax
    38b8:	e9 ff fe ff ff       	jmp    37bc <sys_pipe+0x53>
    38bd:	83 fa 01             	cmp    $0x1,%edx
    38c0:	0f 84 23 ff ff ff    	je     37e9 <sys_pipe+0x80>
    38c6:	e9 2c ff ff ff       	jmp    37f7 <sys_pipe+0x8e>
    38cb:	e8 fc ff ff ff       	call   38cc <sys_pipe+0x163>
    38d0:	85 c0                	test   %eax,%eax
    38d2:	75 81                	jne    3855 <sys_pipe+0xec>
    38d4:	e9 3c ff ff ff       	jmp    3815 <sys_pipe+0xac>
    38d9:	83 fa 01             	cmp    $0x1,%edx
    38dc:	75 ed                	jne    38cb <sys_pipe+0x162>
    38de:	e9 06 ff ff ff       	jmp    37e9 <sys_pipe+0x80>
    38e3:	83 c4 14             	add    $0x14,%esp
    38e6:	5b                   	pop    %ebx
    38e7:	5e                   	pop    %esi
    38e8:	c3                   	ret    

000038e9 <permission>:
    38e9:	56                   	push   %esi
    38ea:	53                   	push   %ebx
    38eb:	0f b7 08             	movzwl (%eax),%ecx
    38ee:	66 83 78 2c 00       	cmpw   $0x0,0x2c(%eax)
    38f3:	74 06                	je     38fb <permission+0x12>
    38f5:	80 78 0d 00          	cmpb   $0x0,0xd(%eax)
    38f9:	74 3e                	je     3939 <permission+0x50>
    38fb:	8b 35 00 00 00 00    	mov    0x0,%esi
    3901:	66 8b 9e 42 02 00 00 	mov    0x242(%esi),%bx
    3908:	66 3b 58 02          	cmp    0x2(%eax),%bx
    390c:	75 05                	jne    3913 <permission+0x2a>
    390e:	c1 f9 06             	sar    $0x6,%ecx
    3911:	eb 10                	jmp    3923 <permission+0x3a>
    3913:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
    3917:	66 39 86 48 02 00 00 	cmp    %ax,0x248(%esi)
    391e:	75 03                	jne    3923 <permission+0x3a>
    3920:	c1 f9 03             	sar    $0x3,%ecx
    3923:	89 d0                	mov    %edx,%eax
    3925:	83 e0 07             	and    $0x7,%eax
    3928:	21 c1                	and    %eax,%ecx
    392a:	39 ca                	cmp    %ecx,%edx
    392c:	74 12                	je     3940 <permission+0x57>
    392e:	66 85 db             	test   %bx,%bx
    3931:	0f 94 c0             	sete   %al
    3934:	0f b6 c0             	movzbl %al,%eax
    3937:	eb 0c                	jmp    3945 <permission+0x5c>
    3939:	b8 00 00 00 00       	mov    $0x0,%eax
    393e:	eb 05                	jmp    3945 <permission+0x5c>
    3940:	b8 01 00 00 00       	mov    $0x1,%eax
    3945:	5b                   	pop    %ebx
    3946:	5e                   	pop    %esi
    3947:	c3                   	ret    

00003948 <find_entry>:
    3948:	55                   	push   %ebp
    3949:	57                   	push   %edi
    394a:	56                   	push   %esi
    394b:	53                   	push   %ebx
    394c:	83 ec 1c             	sub    $0x1c,%esp
    394f:	89 cb                	mov    %ecx,%ebx
    3951:	83 f9 1e             	cmp    $0x1e,%ecx
    3954:	7e 05                	jle    395b <find_entry+0x13>
    3956:	bb 1e 00 00 00       	mov    $0x1e,%ebx
    395b:	8b 08                	mov    (%eax),%ecx
    395d:	8b 79 04             	mov    0x4(%ecx),%edi
    3960:	8b 74 24 30          	mov    0x30(%esp),%esi
    3964:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    396a:	85 db                	test   %ebx,%ebx
    396c:	0f 84 7f 01 00 00    	je     3af1 <find_entry+0x1a9>
    3972:	89 d6                	mov    %edx,%esi
    3974:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3978:	83 fb 02             	cmp    $0x2,%ebx
    397b:	75 67                	jne    39e4 <find_entry+0x9c>
    397d:	64 8a 02             	mov    %fs:(%edx),%al
    3980:	3c 2e                	cmp    $0x2e,%al
    3982:	75 60                	jne    39e4 <find_entry+0x9c>
    3984:	64 8a 42 01          	mov    %fs:0x1(%edx),%al
    3988:	3c 2e                	cmp    $0x2e,%al
    398a:	75 58                	jne    39e4 <find_entry+0x9c>
    398c:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3990:	8b 00                	mov    (%eax),%eax
    3992:	8b 15 00 00 00 00    	mov    0x0,%edx
    3998:	3b 82 74 02 00 00    	cmp    0x274(%edx),%eax
    399e:	74 3f                	je     39df <find_entry+0x97>
    39a0:	66 83 78 2e 01       	cmpw   $0x1,0x2e(%eax)
    39a5:	75 3d                	jne    39e4 <find_entry+0x9c>
    39a7:	83 ec 0c             	sub    $0xc,%esp
    39aa:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    39ae:	50                   	push   %eax
    39af:	e8 fc ff ff ff       	call   39b0 <find_entry+0x68>
    39b4:	89 c5                	mov    %eax,%ebp
    39b6:	83 c4 10             	add    $0x10,%esp
    39b9:	83 78 5c 00          	cmpl   $0x0,0x5c(%eax)
    39bd:	74 25                	je     39e4 <find_entry+0x9c>
    39bf:	83 ec 0c             	sub    $0xc,%esp
    39c2:	8b 44 24 18          	mov    0x18(%esp),%eax
    39c6:	ff 30                	pushl  (%eax)
    39c8:	e8 fc ff ff ff       	call   39c9 <find_entry+0x81>
    39cd:	8b 45 5c             	mov    0x5c(%ebp),%eax
    39d0:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    39d4:	89 01                	mov    %eax,(%ecx)
    39d6:	66 ff 40 30          	incw   0x30(%eax)
    39da:	83 c4 10             	add    $0x10,%esp
    39dd:	eb 05                	jmp    39e4 <find_entry+0x9c>
    39df:	bb 01 00 00 00       	mov    $0x1,%ebx
    39e4:	8b 44 24 0c          	mov    0xc(%esp),%eax
    39e8:	8b 00                	mov    (%eax),%eax
    39ea:	0f b7 50 0e          	movzwl 0xe(%eax),%edx
    39ee:	85 d2                	test   %edx,%edx
    39f0:	0f 84 02 01 00 00    	je     3af8 <find_entry+0x1b0>
    39f6:	83 ec 08             	sub    $0x8,%esp
    39f9:	52                   	push   %edx
    39fa:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    39fe:	50                   	push   %eax
    39ff:	e8 fc ff ff ff       	call   3a00 <find_entry+0xb8>
    3a04:	89 c2                	mov    %eax,%edx
    3a06:	83 c4 10             	add    $0x10,%esp
    3a09:	85 c0                	test   %eax,%eax
    3a0b:	0f 84 ee 00 00 00    	je     3aff <find_entry+0x1b7>
    3a11:	8b 28                	mov    (%eax),%ebp
    3a13:	c1 ef 05             	shr    $0x5,%edi
    3a16:	89 7c 24 08          	mov    %edi,0x8(%esp)
    3a1a:	0f 84 be 00 00 00    	je     3ade <find_entry+0x196>
    3a20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3a27:	00 
    3a28:	8b 02                	mov    (%edx),%eax
    3a2a:	05 00 04 00 00       	add    $0x400,%eax
    3a2f:	39 c5                	cmp    %eax,%ebp
    3a31:	72 55                	jb     3a88 <find_entry+0x140>
    3a33:	83 ec 0c             	sub    $0xc,%esp
    3a36:	52                   	push   %edx
    3a37:	e8 fc ff ff ff       	call   3a38 <find_entry+0xf0>
    3a3c:	8b 44 24 14          	mov    0x14(%esp),%eax
    3a40:	89 c7                	mov    %eax,%edi
    3a42:	83 c4 08             	add    $0x8,%esp
    3a45:	c1 e8 05             	shr    $0x5,%eax
    3a48:	50                   	push   %eax
    3a49:	8b 44 24 18          	mov    0x18(%esp),%eax
    3a4d:	ff 30                	pushl  (%eax)
    3a4f:	e8 fc ff ff ff       	call   3a50 <find_entry+0x108>
    3a54:	83 c4 10             	add    $0x10,%esp
    3a57:	85 c0                	test   %eax,%eax
    3a59:	74 1d                	je     3a78 <find_entry+0x130>
    3a5b:	83 ec 08             	sub    $0x8,%esp
    3a5e:	50                   	push   %eax
    3a5f:	8b 44 24 18          	mov    0x18(%esp),%eax
    3a63:	8b 00                	mov    (%eax),%eax
    3a65:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3a69:	50                   	push   %eax
    3a6a:	e8 fc ff ff ff       	call   3a6b <find_entry+0x123>
    3a6f:	89 c2                	mov    %eax,%edx
    3a71:	83 c4 10             	add    $0x10,%esp
    3a74:	85 c0                	test   %eax,%eax
    3a76:	75 0e                	jne    3a86 <find_entry+0x13e>
    3a78:	8d 47 20             	lea    0x20(%edi),%eax
    3a7b:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a7f:	ba 00 00 00 00       	mov    $0x0,%edx
    3a84:	eb 4a                	jmp    3ad0 <find_entry+0x188>
    3a86:	8b 28                	mov    (%eax),%ebp
    3a88:	85 ed                	test   %ebp,%ebp
    3a8a:	74 3d                	je     3ac9 <find_entry+0x181>
    3a8c:	66 83 7d 00 00       	cmpw   $0x0,0x0(%ebp)
    3a91:	74 36                	je     3ac9 <find_entry+0x181>
    3a93:	83 fb 1e             	cmp    $0x1e,%ebx
    3a96:	7f 31                	jg     3ac9 <find_entry+0x181>
    3a98:	83 fb 1d             	cmp    $0x1d,%ebx
    3a9b:	7f 07                	jg     3aa4 <find_entry+0x15c>
    3a9d:	80 7c 1d 02 00       	cmpb   $0x0,0x2(%ebp,%ebx,1)
    3aa2:	75 25                	jne    3ac9 <find_entry+0x181>
    3aa4:	53                   	push   %ebx
    3aa5:	8d 7d 02             	lea    0x2(%ebp),%edi
    3aa8:	b8 00 00 00 00       	mov    $0x0,%eax
    3aad:	89 d9                	mov    %ebx,%ecx
    3aaf:	fc                   	cld    
    3ab0:	64 f3 a6             	repz cmpsb %es:(%edi),%fs:(%esi)
    3ab3:	0f 94 c0             	sete   %al
    3ab6:	29 cb                	sub    %ecx,%ebx
    3ab8:	29 de                	sub    %ebx,%esi
    3aba:	5b                   	pop    %ebx
    3abb:	85 c0                	test   %eax,%eax
    3abd:	74 0a                	je     3ac9 <find_entry+0x181>
    3abf:	8b 44 24 30          	mov    0x30(%esp),%eax
    3ac3:	89 28                	mov    %ebp,(%eax)
    3ac5:	89 d0                	mov    %edx,%eax
    3ac7:	eb 3b                	jmp    3b04 <find_entry+0x1bc>
    3ac9:	83 c5 20             	add    $0x20,%ebp
    3acc:	ff 44 24 04          	incl   0x4(%esp)
    3ad0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3ad4:	39 4c 24 08          	cmp    %ecx,0x8(%esp)
    3ad8:	0f 8f 4a ff ff ff    	jg     3a28 <find_entry+0xe0>
    3ade:	83 ec 0c             	sub    $0xc,%esp
    3ae1:	52                   	push   %edx
    3ae2:	e8 fc ff ff ff       	call   3ae3 <find_entry+0x19b>
    3ae7:	83 c4 10             	add    $0x10,%esp
    3aea:	b8 00 00 00 00       	mov    $0x0,%eax
    3aef:	eb 13                	jmp    3b04 <find_entry+0x1bc>
    3af1:	b8 00 00 00 00       	mov    $0x0,%eax
    3af6:	eb 0c                	jmp    3b04 <find_entry+0x1bc>
    3af8:	b8 00 00 00 00       	mov    $0x0,%eax
    3afd:	eb 05                	jmp    3b04 <find_entry+0x1bc>
    3aff:	b8 00 00 00 00       	mov    $0x0,%eax
    3b04:	83 c4 1c             	add    $0x1c,%esp
    3b07:	5b                   	pop    %ebx
    3b08:	5e                   	pop    %esi
    3b09:	5f                   	pop    %edi
    3b0a:	5d                   	pop    %ebp
    3b0b:	c3                   	ret    

00003b0c <dir_namei>:
    3b0c:	55                   	push   %ebp
    3b0d:	57                   	push   %edi
    3b0e:	56                   	push   %esi
    3b0f:	53                   	push   %ebx
    3b10:	83 ec 4c             	sub    $0x4c,%esp
    3b13:	89 c5                	mov    %eax,%ebp
    3b15:	89 54 24 08          	mov    %edx,0x8(%esp)
    3b19:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3b1d:	a1 00 00 00 00       	mov    0x0,%eax
    3b22:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
    3b28:	85 c0                	test   %eax,%eax
    3b2a:	74 07                	je     3b33 <dir_namei+0x27>
    3b2c:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    3b31:	75 2d                	jne    3b60 <dir_namei+0x54>
    3b33:	8d 7c 24 20          	lea    0x20(%esp),%edi
    3b37:	b9 08 00 00 00       	mov    $0x8,%ecx
    3b3c:	b8 00 00 00 00       	mov    $0x0,%eax
    3b41:	f3 ab                	rep stos %eax,%es:(%edi)
    3b43:	83 ec 08             	sub    $0x8,%esp
    3b46:	55                   	push   %ebp
    3b47:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3b4b:	50                   	push   %eax
    3b4c:	e8 fc ff ff ff       	call   3b4d <dir_namei+0x41>
    3b51:	c7 04 24 62 02 00 00 	movl   $0x262,(%esp)
    3b58:	e8 fc ff ff ff       	call   3b59 <dir_namei+0x4d>
    3b5d:	83 c4 10             	add    $0x10,%esp
    3b60:	a1 00 00 00 00       	mov    0x0,%eax
    3b65:	8b 80 70 02 00 00    	mov    0x270(%eax),%eax
    3b6b:	85 c0                	test   %eax,%eax
    3b6d:	74 07                	je     3b76 <dir_namei+0x6a>
    3b6f:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    3b74:	75 10                	jne    3b86 <dir_namei+0x7a>
    3b76:	83 ec 0c             	sub    $0xc,%esp
    3b79:	68 70 02 00 00       	push   $0x270
    3b7e:	e8 fc ff ff ff       	call   3b7f <dir_namei+0x73>
    3b83:	83 c4 10             	add    $0x10,%esp
    3b86:	64 8a 45 00          	mov    %fs:0x0(%ebp),%al
    3b8a:	3c 2f                	cmp    $0x2f,%al
    3b8c:	75 14                	jne    3ba2 <dir_namei+0x96>
    3b8e:	a1 00 00 00 00       	mov    0x0,%eax
    3b93:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
    3b99:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3b9d:	8d 75 01             	lea    0x1(%ebp),%esi
    3ba0:	eb 19                	jmp    3bbb <dir_namei+0xaf>
    3ba2:	84 c0                	test   %al,%al
    3ba4:	0f 84 29 01 00 00    	je     3cd3 <dir_namei+0x1c7>
    3baa:	a1 00 00 00 00       	mov    0x0,%eax
    3baf:	8b 80 70 02 00 00    	mov    0x270(%eax),%eax
    3bb5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3bb9:	89 ee                	mov    %ebp,%esi
    3bbb:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3bbf:	66 ff 40 30          	incw   0x30(%eax)
    3bc3:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    3bc7:	8b 07                	mov    (%edi),%eax
    3bc9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    3bce:	66 3d 00 40          	cmp    $0x4000,%ax
    3bd2:	75 2f                	jne    3c03 <dir_namei+0xf7>
    3bd4:	ba 01 00 00 00       	mov    $0x1,%edx
    3bd9:	89 f8                	mov    %edi,%eax
    3bdb:	e8 09 fd ff ff       	call   38e9 <permission>
    3be0:	85 c0                	test   %eax,%eax
    3be2:	74 1f                	je     3c03 <dir_namei+0xf7>
    3be4:	8d 46 01             	lea    0x1(%esi),%eax
    3be7:	64 8a 16             	mov    %fs:(%esi),%dl
    3bea:	84 d2                	test   %dl,%dl
    3bec:	0f 84 90 00 00 00    	je     3c82 <dir_namei+0x176>
    3bf2:	80 fa 2f             	cmp    $0x2f,%dl
    3bf5:	75 1d                	jne    3c14 <dir_namei+0x108>
    3bf7:	89 c3                	mov    %eax,%ebx
    3bf9:	b9 00 00 00 00       	mov    $0x0,%ecx
    3bfe:	e9 ad 00 00 00       	jmp    3cb0 <dir_namei+0x1a4>
    3c03:	83 ec 0c             	sub    $0xc,%esp
    3c06:	57                   	push   %edi
    3c07:	e8 fc ff ff ff       	call   3c08 <dir_namei+0xfc>
    3c0c:	83 c4 10             	add    $0x10,%esp
    3c0f:	e9 bf 00 00 00       	jmp    3cd3 <dir_namei+0x1c7>
    3c14:	89 c1                	mov    %eax,%ecx
    3c16:	29 f1                	sub    %esi,%ecx
    3c18:	8d 58 01             	lea    0x1(%eax),%ebx
    3c1b:	64 8a 10             	mov    %fs:(%eax),%dl
    3c1e:	84 d2                	test   %dl,%dl
    3c20:	74 60                	je     3c82 <dir_namei+0x176>
    3c22:	89 d8                	mov    %ebx,%eax
    3c24:	80 fa 2f             	cmp    $0x2f,%dl
    3c27:	75 eb                	jne    3c14 <dir_namei+0x108>
    3c29:	e9 82 00 00 00       	jmp    3cb0 <dir_namei+0x1a4>
    3c2e:	83 ec 0c             	sub    $0xc,%esp
    3c31:	ff 74 24 28          	pushl  0x28(%esp)
    3c35:	e8 fc ff ff ff       	call   3c36 <dir_namei+0x12a>
    3c3a:	83 c4 10             	add    $0x10,%esp
    3c3d:	e9 91 00 00 00       	jmp    3cd3 <dir_namei+0x1c7>
    3c42:	8b 54 24 20          	mov    0x20(%esp),%edx
    3c46:	0f b7 3a             	movzwl (%edx),%edi
    3c49:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3c4d:	0f b7 72 2c          	movzwl 0x2c(%edx),%esi
    3c51:	83 ec 0c             	sub    $0xc,%esp
    3c54:	50                   	push   %eax
    3c55:	e8 fc ff ff ff       	call   3c56 <dir_namei+0x14a>
    3c5a:	83 c4 04             	add    $0x4,%esp
    3c5d:	ff 74 24 28          	pushl  0x28(%esp)
    3c61:	e8 fc ff ff ff       	call   3c62 <dir_namei+0x156>
    3c66:	83 c4 08             	add    $0x8,%esp
    3c69:	57                   	push   %edi
    3c6a:	56                   	push   %esi
    3c6b:	e8 fc ff ff ff       	call   3c6c <dir_namei+0x160>
    3c70:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    3c74:	83 c4 10             	add    $0x10,%esp
    3c77:	85 c0                	test   %eax,%eax
    3c79:	74 58                	je     3cd3 <dir_namei+0x1c7>
    3c7b:	89 de                	mov    %ebx,%esi
    3c7d:	e9 41 ff ff ff       	jmp    3bc3 <dir_namei+0xb7>
    3c82:	85 ff                	test   %edi,%edi
    3c84:	74 52                	je     3cd8 <dir_namei+0x1cc>
    3c86:	89 e9                	mov    %ebp,%ecx
    3c88:	eb 08                	jmp    3c92 <dir_namei+0x186>
    3c8a:	3c 2f                	cmp    $0x2f,%al
    3c8c:	75 02                	jne    3c90 <dir_namei+0x184>
    3c8e:	89 d1                	mov    %edx,%ecx
    3c90:	89 d5                	mov    %edx,%ebp
    3c92:	8d 55 01             	lea    0x1(%ebp),%edx
    3c95:	64 8a 45 00          	mov    %fs:0x0(%ebp),%al
    3c99:	84 c0                	test   %al,%al
    3c9b:	75 ed                	jne    3c8a <dir_namei+0x17e>
    3c9d:	29 ca                	sub    %ecx,%edx
    3c9f:	8d 42 ff             	lea    -0x1(%edx),%eax
    3ca2:	8b 74 24 08          	mov    0x8(%esp),%esi
    3ca6:	89 06                	mov    %eax,(%esi)
    3ca8:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3cac:	89 08                	mov    %ecx,(%eax)
    3cae:	eb 28                	jmp    3cd8 <dir_namei+0x1cc>
    3cb0:	83 ec 0c             	sub    $0xc,%esp
    3cb3:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3cb7:	50                   	push   %eax
    3cb8:	89 f2                	mov    %esi,%edx
    3cba:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3cbe:	e8 85 fc ff ff       	call   3948 <find_entry>
    3cc3:	83 c4 10             	add    $0x10,%esp
    3cc6:	85 c0                	test   %eax,%eax
    3cc8:	0f 85 74 ff ff ff    	jne    3c42 <dir_namei+0x136>
    3cce:	e9 5b ff ff ff       	jmp    3c2e <dir_namei+0x122>
    3cd3:	bf 00 00 00 00       	mov    $0x0,%edi
    3cd8:	89 f8                	mov    %edi,%eax
    3cda:	83 c4 4c             	add    $0x4c,%esp
    3cdd:	5b                   	pop    %ebx
    3cde:	5e                   	pop    %esi
    3cdf:	5f                   	pop    %edi
    3ce0:	5d                   	pop    %ebp
    3ce1:	c3                   	ret    

00003ce2 <add_entry>:
    3ce2:	55                   	push   %ebp
    3ce3:	57                   	push   %edi
    3ce4:	56                   	push   %esi
    3ce5:	53                   	push   %ebx
    3ce6:	83 ec 1c             	sub    $0x1c,%esp
    3ce9:	8b 7c 24 30          	mov    0x30(%esp),%edi
    3ced:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    3cf3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3cf7:	83 f9 1e             	cmp    $0x1e,%ecx
    3cfa:	7e 08                	jle    3d04 <add_entry+0x22>
    3cfc:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
    3d03:	00 
    3d04:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    3d09:	0f 84 19 01 00 00    	je     3e28 <add_entry+0x146>
    3d0f:	0f b7 48 0e          	movzwl 0xe(%eax),%ecx
    3d13:	85 c9                	test   %ecx,%ecx
    3d15:	0f 84 14 01 00 00    	je     3e2f <add_entry+0x14d>
    3d1b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3d1f:	89 c7                	mov    %eax,%edi
    3d21:	83 ec 08             	sub    $0x8,%esp
    3d24:	51                   	push   %ecx
    3d25:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3d29:	50                   	push   %eax
    3d2a:	e8 fc ff ff ff       	call   3d2b <add_entry+0x49>
    3d2f:	89 c1                	mov    %eax,%ecx
    3d31:	83 c4 10             	add    $0x10,%esp
    3d34:	85 c0                	test   %eax,%eax
    3d36:	0f 84 fa 00 00 00    	je     3e36 <add_entry+0x154>
    3d3c:	8b 18                	mov    (%eax),%ebx
    3d3e:	be 00 00 00 00       	mov    $0x0,%esi
    3d43:	8b 01                	mov    (%ecx),%eax
    3d45:	05 00 04 00 00       	add    $0x400,%eax
    3d4a:	39 c3                	cmp    %eax,%ebx
    3d4c:	72 41                	jb     3d8f <add_entry+0xad>
    3d4e:	83 ec 0c             	sub    $0xc,%esp
    3d51:	51                   	push   %ecx
    3d52:	e8 fc ff ff ff       	call   3d53 <add_entry+0x71>
    3d57:	83 c4 08             	add    $0x8,%esp
    3d5a:	89 f0                	mov    %esi,%eax
    3d5c:	c1 e8 05             	shr    $0x5,%eax
    3d5f:	50                   	push   %eax
    3d60:	57                   	push   %edi
    3d61:	e8 fc ff ff ff       	call   3d62 <add_entry+0x80>
    3d66:	83 c4 10             	add    $0x10,%esp
    3d69:	85 c0                	test   %eax,%eax
    3d6b:	0f 84 cc 00 00 00    	je     3e3d <add_entry+0x15b>
    3d71:	83 ec 08             	sub    $0x8,%esp
    3d74:	50                   	push   %eax
    3d75:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    3d79:	50                   	push   %eax
    3d7a:	e8 fc ff ff ff       	call   3d7b <add_entry+0x99>
    3d7f:	89 c1                	mov    %eax,%ecx
    3d81:	83 c4 10             	add    $0x10,%esp
    3d84:	85 c0                	test   %eax,%eax
    3d86:	75 05                	jne    3d8d <add_entry+0xab>
    3d88:	8d 76 20             	lea    0x20(%esi),%esi
    3d8b:	eb b6                	jmp    3d43 <add_entry+0x61>
    3d8d:	8b 18                	mov    (%eax),%ebx
    3d8f:	89 f0                	mov    %esi,%eax
    3d91:	c1 e0 05             	shl    $0x5,%eax
    3d94:	3b 47 04             	cmp    0x4(%edi),%eax
    3d97:	72 2f                	jb     3dc8 <add_entry+0xe6>
    3d99:	66 c7 03 00 00       	movw   $0x0,(%ebx)
    3d9e:	83 c0 20             	add    $0x20,%eax
    3da1:	89 47 04             	mov    %eax,0x4(%edi)
    3da4:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    3da8:	8b 2d 00 00 00 00    	mov    0x0,%ebp
    3dae:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3db3:	f7 ed                	imul   %ebp
    3db5:	89 d0                	mov    %edx,%eax
    3db7:	c1 f8 05             	sar    $0x5,%eax
    3dba:	c1 fd 1f             	sar    $0x1f,%ebp
    3dbd:	29 e8                	sub    %ebp,%eax
    3dbf:	03 05 00 00 00 00    	add    0x0,%eax
    3dc5:	89 47 28             	mov    %eax,0x28(%edi)
    3dc8:	66 83 3b 00          	cmpw   $0x0,(%ebx)
    3dcc:	75 51                	jne    3e1f <add_entry+0x13d>
    3dce:	8b 35 00 00 00 00    	mov    0x0,%esi
    3dd4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3dd9:	f7 ee                	imul   %esi
    3ddb:	89 d0                	mov    %edx,%eax
    3ddd:	c1 f8 05             	sar    $0x5,%eax
    3de0:	c1 fe 1f             	sar    $0x1f,%esi
    3de3:	29 f0                	sub    %esi,%eax
    3de5:	03 05 00 00 00 00    	add    0x0,%eax
    3deb:	89 47 08             	mov    %eax,0x8(%edi)
    3dee:	b8 00 00 00 00       	mov    $0x0,%eax
    3df3:	8b 74 24 08          	mov    0x8(%esp),%esi
    3df7:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    3dfb:	39 c6                	cmp    %eax,%esi
    3dfd:	7e 06                	jle    3e05 <add_entry+0x123>
    3dff:	64 8a 14 07          	mov    %fs:(%edi,%eax,1),%dl
    3e03:	eb 02                	jmp    3e07 <add_entry+0x125>
    3e05:	b2 00                	mov    $0x0,%dl
    3e07:	88 54 03 02          	mov    %dl,0x2(%ebx,%eax,1)
    3e0b:	40                   	inc    %eax
    3e0c:	83 f8 1e             	cmp    $0x1e,%eax
    3e0f:	75 ea                	jne    3dfb <add_entry+0x119>
    3e11:	c6 41 0b 01          	movb   $0x1,0xb(%ecx)
    3e15:	8b 44 24 30          	mov    0x30(%esp),%eax
    3e19:	89 18                	mov    %ebx,(%eax)
    3e1b:	89 c8                	mov    %ecx,%eax
    3e1d:	eb 23                	jmp    3e42 <add_entry+0x160>
    3e1f:	83 c3 20             	add    $0x20,%ebx
    3e22:	46                   	inc    %esi
    3e23:	e9 1b ff ff ff       	jmp    3d43 <add_entry+0x61>
    3e28:	b8 00 00 00 00       	mov    $0x0,%eax
    3e2d:	eb 13                	jmp    3e42 <add_entry+0x160>
    3e2f:	b8 00 00 00 00       	mov    $0x0,%eax
    3e34:	eb 0c                	jmp    3e42 <add_entry+0x160>
    3e36:	b8 00 00 00 00       	mov    $0x0,%eax
    3e3b:	eb 05                	jmp    3e42 <add_entry+0x160>
    3e3d:	b8 00 00 00 00       	mov    $0x0,%eax
    3e42:	83 c4 1c             	add    $0x1c,%esp
    3e45:	5b                   	pop    %ebx
    3e46:	5e                   	pop    %esi
    3e47:	5f                   	pop    %edi
    3e48:	5d                   	pop    %ebp
    3e49:	c3                   	ret    

00003e4a <namei>:
    3e4a:	56                   	push   %esi
    3e4b:	53                   	push   %ebx
    3e4c:	83 ec 14             	sub    $0x14,%esp
    3e4f:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    3e53:	8d 54 24 08          	lea    0x8(%esp),%edx
    3e57:	8b 44 24 20          	mov    0x20(%esp),%eax
    3e5b:	e8 ac fc ff ff       	call   3b0c <dir_namei>
    3e60:	89 c3                	mov    %eax,%ebx
    3e62:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e66:	85 c0                	test   %eax,%eax
    3e68:	0f 84 9c 00 00 00    	je     3f0a <namei+0xc0>
    3e6e:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3e72:	85 c9                	test   %ecx,%ecx
    3e74:	0f 84 90 00 00 00    	je     3f0a <namei+0xc0>
    3e7a:	83 ec 0c             	sub    $0xc,%esp
    3e7d:	8d 44 24 0c          	lea    0xc(%esp),%eax
    3e81:	50                   	push   %eax
    3e82:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3e86:	8d 44 24 14          	lea    0x14(%esp),%eax
    3e8a:	e8 b9 fa ff ff       	call   3948 <find_entry>
    3e8f:	83 c4 10             	add    $0x10,%esp
    3e92:	85 c0                	test   %eax,%eax
    3e94:	75 16                	jne    3eac <namei+0x62>
    3e96:	83 ec 0c             	sub    $0xc,%esp
    3e99:	ff 74 24 10          	pushl  0x10(%esp)
    3e9d:	e8 fc ff ff ff       	call   3e9e <namei+0x54>
    3ea2:	83 c4 10             	add    $0x10,%esp
    3ea5:	bb 00 00 00 00       	mov    $0x0,%ebx
    3eaa:	eb 5e                	jmp    3f0a <namei+0xc0>
    3eac:	8b 14 24             	mov    (%esp),%edx
    3eaf:	0f b7 32             	movzwl (%edx),%esi
    3eb2:	8b 54 24 04          	mov    0x4(%esp),%edx
    3eb6:	0f b7 5a 2c          	movzwl 0x2c(%edx),%ebx
    3eba:	83 ec 0c             	sub    $0xc,%esp
    3ebd:	50                   	push   %eax
    3ebe:	e8 fc ff ff ff       	call   3ebf <namei+0x75>
    3ec3:	83 c4 04             	add    $0x4,%esp
    3ec6:	ff 74 24 10          	pushl  0x10(%esp)
    3eca:	e8 fc ff ff ff       	call   3ecb <namei+0x81>
    3ecf:	83 c4 08             	add    $0x8,%esp
    3ed2:	56                   	push   %esi
    3ed3:	53                   	push   %ebx
    3ed4:	e8 fc ff ff ff       	call   3ed5 <namei+0x8b>
    3ed9:	89 c3                	mov    %eax,%ebx
    3edb:	89 44 24 14          	mov    %eax,0x14(%esp)
    3edf:	83 c4 10             	add    $0x10,%esp
    3ee2:	85 c0                	test   %eax,%eax
    3ee4:	74 24                	je     3f0a <namei+0xc0>
    3ee6:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    3eec:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3ef1:	f7 e9                	imul   %ecx
    3ef3:	89 d0                	mov    %edx,%eax
    3ef5:	c1 f8 05             	sar    $0x5,%eax
    3ef8:	c1 f9 1f             	sar    $0x1f,%ecx
    3efb:	29 c8                	sub    %ecx,%eax
    3efd:	03 05 00 00 00 00    	add    0x0,%eax
    3f03:	89 43 24             	mov    %eax,0x24(%ebx)
    3f06:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    3f0a:	89 d8                	mov    %ebx,%eax
    3f0c:	83 c4 14             	add    $0x14,%esp
    3f0f:	5b                   	pop    %ebx
    3f10:	5e                   	pop    %esi
    3f11:	c3                   	ret    

00003f12 <open_namei>:
    3f12:	55                   	push   %ebp
    3f13:	57                   	push   %edi
    3f14:	56                   	push   %esi
    3f15:	53                   	push   %ebx
    3f16:	83 ec 1c             	sub    $0x1c,%esp
    3f19:	8b 5c 24 34          	mov    0x34(%esp),%ebx
    3f1d:	89 d8                	mov    %ebx,%eax
    3f1f:	25 03 02 00 00       	and    $0x203,%eax
    3f24:	3d 00 02 00 00       	cmp    $0x200,%eax
    3f29:	75 03                	jne    3f2e <open_namei+0x1c>
    3f2b:	83 cb 01             	or     $0x1,%ebx
    3f2e:	a1 00 00 00 00       	mov    0x0,%eax
    3f33:	8b b0 6c 02 00 00    	mov    0x26c(%eax),%esi
    3f39:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    3f3d:	8d 54 24 08          	lea    0x8(%esp),%edx
    3f41:	8b 44 24 30          	mov    0x30(%esp),%eax
    3f45:	e8 c2 fb ff ff       	call   3b0c <dir_namei>
    3f4a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f4e:	85 c0                	test   %eax,%eax
    3f50:	0f 84 2e 02 00 00    	je     4184 <open_namei+0x272>
    3f56:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3f5a:	85 c9                	test   %ecx,%ecx
    3f5c:	75 2b                	jne    3f89 <open_namei+0x77>
    3f5e:	89 de                	mov    %ebx,%esi
    3f60:	81 e6 43 02 00 00    	and    $0x243,%esi
    3f66:	75 0b                	jne    3f73 <open_namei+0x61>
    3f68:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    3f6c:	89 07                	mov    %eax,(%edi)
    3f6e:	e9 24 02 00 00       	jmp    4197 <open_namei+0x285>
    3f73:	83 ec 0c             	sub    $0xc,%esp
    3f76:	50                   	push   %eax
    3f77:	e8 fc ff ff ff       	call   3f78 <open_namei+0x66>
    3f7c:	83 c4 10             	add    $0x10,%esp
    3f7f:	be eb ff ff ff       	mov    $0xffffffeb,%esi
    3f84:	e9 0e 02 00 00       	jmp    4197 <open_namei+0x285>
    3f89:	83 ec 0c             	sub    $0xc,%esp
    3f8c:	8d 44 24 0c          	lea    0xc(%esp),%eax
    3f90:	50                   	push   %eax
    3f91:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3f95:	8d 44 24 14          	lea    0x14(%esp),%eax
    3f99:	e8 aa f9 ff ff       	call   3948 <find_entry>
    3f9e:	83 c4 10             	add    $0x10,%esp
    3fa1:	85 c0                	test   %eax,%eax
    3fa3:	0f 85 1b 01 00 00    	jne    40c4 <open_namei+0x1b2>
    3fa9:	f6 c3 40             	test   $0x40,%bl
    3fac:	75 19                	jne    3fc7 <open_namei+0xb5>
    3fae:	83 ec 0c             	sub    $0xc,%esp
    3fb1:	ff 74 24 10          	pushl  0x10(%esp)
    3fb5:	e8 fc ff ff ff       	call   3fb6 <open_namei+0xa4>
    3fba:	83 c4 10             	add    $0x10,%esp
    3fbd:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    3fc2:	e9 d0 01 00 00       	jmp    4197 <open_namei+0x285>
    3fc7:	8b 5c 24 04          	mov    0x4(%esp),%ebx
    3fcb:	ba 02 00 00 00       	mov    $0x2,%edx
    3fd0:	89 d8                	mov    %ebx,%eax
    3fd2:	e8 12 f9 ff ff       	call   38e9 <permission>
    3fd7:	85 c0                	test   %eax,%eax
    3fd9:	75 16                	jne    3ff1 <open_namei+0xdf>
    3fdb:	83 ec 0c             	sub    $0xc,%esp
    3fde:	53                   	push   %ebx
    3fdf:	e8 fc ff ff ff       	call   3fe0 <open_namei+0xce>
    3fe4:	83 c4 10             	add    $0x10,%esp
    3fe7:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3fec:	e9 a6 01 00 00       	jmp    4197 <open_namei+0x285>
    3ff1:	83 ec 0c             	sub    $0xc,%esp
    3ff4:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    3ff8:	50                   	push   %eax
    3ff9:	e8 fc ff ff ff       	call   3ffa <open_namei+0xe8>
    3ffe:	89 c3                	mov    %eax,%ebx
    4000:	83 c4 10             	add    $0x10,%esp
    4003:	85 c0                	test   %eax,%eax
    4005:	75 19                	jne    4020 <open_namei+0x10e>
    4007:	83 ec 0c             	sub    $0xc,%esp
    400a:	ff 74 24 10          	pushl  0x10(%esp)
    400e:	e8 fc ff ff ff       	call   400f <open_namei+0xfd>
    4013:	83 c4 10             	add    $0x10,%esp
    4016:	be e4 ff ff ff       	mov    $0xffffffe4,%esi
    401b:	e9 77 01 00 00       	jmp    4197 <open_namei+0x285>
    4020:	a1 00 00 00 00       	mov    0x0,%eax
    4025:	66 8b 80 42 02 00 00 	mov    0x242(%eax),%ax
    402c:	66 89 43 02          	mov    %ax,0x2(%ebx)
    4030:	f7 d6                	not    %esi
    4032:	81 e6 ff 01 00 00    	and    $0x1ff,%esi
    4038:	23 74 24 38          	and    0x38(%esp),%esi
    403c:	81 ce 00 80 00 00    	or     $0x8000,%esi
    4042:	66 89 33             	mov    %si,(%ebx)
    4045:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4049:	83 ec 0c             	sub    $0xc,%esp
    404c:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4050:	50                   	push   %eax
    4051:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4055:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4059:	8b 44 24 14          	mov    0x14(%esp),%eax
    405d:	e8 80 fc ff ff       	call   3ce2 <add_entry>
    4062:	83 c4 10             	add    $0x10,%esp
    4065:	85 c0                	test   %eax,%eax
    4067:	75 25                	jne    408e <open_namei+0x17c>
    4069:	fe 4b 0d             	decb   0xd(%ebx)
    406c:	83 ec 0c             	sub    $0xc,%esp
    406f:	53                   	push   %ebx
    4070:	e8 fc ff ff ff       	call   4071 <open_namei+0x15f>
    4075:	83 c4 04             	add    $0x4,%esp
    4078:	ff 74 24 10          	pushl  0x10(%esp)
    407c:	e8 fc ff ff ff       	call   407d <open_namei+0x16b>
    4081:	83 c4 10             	add    $0x10,%esp
    4084:	be e4 ff ff ff       	mov    $0xffffffe4,%esi
    4089:	e9 09 01 00 00       	jmp    4197 <open_namei+0x285>
    408e:	66 8b 4b 2e          	mov    0x2e(%ebx),%cx
    4092:	8b 14 24             	mov    (%esp),%edx
    4095:	66 89 0a             	mov    %cx,(%edx)
    4098:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    409c:	83 ec 0c             	sub    $0xc,%esp
    409f:	50                   	push   %eax
    40a0:	e8 fc ff ff ff       	call   40a1 <open_namei+0x18f>
    40a5:	83 c4 04             	add    $0x4,%esp
    40a8:	ff 74 24 10          	pushl  0x10(%esp)
    40ac:	e8 fc ff ff ff       	call   40ad <open_namei+0x19b>
    40b1:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    40b5:	89 18                	mov    %ebx,(%eax)
    40b7:	83 c4 10             	add    $0x10,%esp
    40ba:	be 00 00 00 00       	mov    $0x0,%esi
    40bf:	e9 d3 00 00 00       	jmp    4197 <open_namei+0x285>
    40c4:	8b 14 24             	mov    (%esp),%edx
    40c7:	0f b7 2a             	movzwl (%edx),%ebp
    40ca:	8b 54 24 04          	mov    0x4(%esp),%edx
    40ce:	0f b7 7a 2c          	movzwl 0x2c(%edx),%edi
    40d2:	83 ec 0c             	sub    $0xc,%esp
    40d5:	50                   	push   %eax
    40d6:	e8 fc ff ff ff       	call   40d7 <open_namei+0x1c5>
    40db:	83 c4 04             	add    $0x4,%esp
    40de:	ff 74 24 10          	pushl  0x10(%esp)
    40e2:	e8 fc ff ff ff       	call   40e3 <open_namei+0x1d1>
    40e7:	83 c4 10             	add    $0x10,%esp
    40ea:	89 de                	mov    %ebx,%esi
    40ec:	81 e6 80 00 00 00    	and    $0x80,%esi
    40f2:	0f 85 93 00 00 00    	jne    418b <open_namei+0x279>
    40f8:	83 ec 08             	sub    $0x8,%esp
    40fb:	55                   	push   %ebp
    40fc:	57                   	push   %edi
    40fd:	e8 fc ff ff ff       	call   40fe <open_namei+0x1ec>
    4102:	89 c7                	mov    %eax,%edi
    4104:	83 c4 10             	add    $0x10,%esp
    4107:	85 c0                	test   %eax,%eax
    4109:	0f 84 83 00 00 00    	je     4192 <open_namei+0x280>
    410f:	8b 00                	mov    (%eax),%eax
    4111:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    4116:	66 3d 00 40          	cmp    $0x4000,%ax
    411a:	75 05                	jne    4121 <open_namei+0x20f>
    411c:	f6 c3 03             	test   $0x3,%bl
    411f:	75 17                	jne    4138 <open_namei+0x226>
    4121:	89 d8                	mov    %ebx,%eax
    4123:	83 e0 03             	and    $0x3,%eax
    4126:	0f be 90 7d 02 00 00 	movsbl 0x27d(%eax),%edx
    412d:	89 f8                	mov    %edi,%eax
    412f:	e8 b5 f7 ff ff       	call   38e9 <permission>
    4134:	85 c0                	test   %eax,%eax
    4136:	75 13                	jne    414b <open_namei+0x239>
    4138:	83 ec 0c             	sub    $0xc,%esp
    413b:	57                   	push   %edi
    413c:	e8 fc ff ff ff       	call   413d <open_namei+0x22b>
    4141:	83 c4 10             	add    $0x10,%esp
    4144:	be ff ff ff ff       	mov    $0xffffffff,%esi
    4149:	eb 4c                	jmp    4197 <open_namei+0x285>
    414b:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4151:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4156:	f7 e9                	imul   %ecx
    4158:	89 d0                	mov    %edx,%eax
    415a:	c1 f8 05             	sar    $0x5,%eax
    415d:	c1 f9 1f             	sar    $0x1f,%ecx
    4160:	29 c8                	sub    %ecx,%eax
    4162:	03 05 00 00 00 00    	add    0x0,%eax
    4168:	89 47 24             	mov    %eax,0x24(%edi)
    416b:	f6 c7 02             	test   $0x2,%bh
    416e:	74 0c                	je     417c <open_namei+0x26a>
    4170:	83 ec 0c             	sub    $0xc,%esp
    4173:	57                   	push   %edi
    4174:	e8 fc ff ff ff       	call   4175 <open_namei+0x263>
    4179:	83 c4 10             	add    $0x10,%esp
    417c:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    4180:	89 38                	mov    %edi,(%eax)
    4182:	eb 13                	jmp    4197 <open_namei+0x285>
    4184:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    4189:	eb 0c                	jmp    4197 <open_namei+0x285>
    418b:	be ef ff ff ff       	mov    $0xffffffef,%esi
    4190:	eb 05                	jmp    4197 <open_namei+0x285>
    4192:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    4197:	89 f0                	mov    %esi,%eax
    4199:	83 c4 1c             	add    $0x1c,%esp
    419c:	5b                   	pop    %ebx
    419d:	5e                   	pop    %esi
    419e:	5f                   	pop    %edi
    419f:	5d                   	pop    %ebp
    41a0:	c3                   	ret    

000041a1 <sys_mknod>:
    41a1:	57                   	push   %edi
    41a2:	56                   	push   %esi
    41a3:	53                   	push   %ebx
    41a4:	83 ec 10             	sub    $0x10,%esp
    41a7:	8b 74 24 24          	mov    0x24(%esp),%esi
    41ab:	a1 00 00 00 00       	mov    0x0,%eax
    41b0:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    41b7:	00 
    41b8:	0f 85 8c 01 00 00    	jne    434a <sys_mknod+0x1a9>
    41be:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    41c2:	8d 54 24 08          	lea    0x8(%esp),%edx
    41c6:	8b 44 24 20          	mov    0x20(%esp),%eax
    41ca:	e8 3d f9 ff ff       	call   3b0c <dir_namei>
    41cf:	89 c3                	mov    %eax,%ebx
    41d1:	89 44 24 04          	mov    %eax,0x4(%esp)
    41d5:	85 c0                	test   %eax,%eax
    41d7:	0f 84 74 01 00 00    	je     4351 <sys_mknod+0x1b0>
    41dd:	8b 7c 24 08          	mov    0x8(%esp),%edi
    41e1:	85 ff                	test   %edi,%edi
    41e3:	75 16                	jne    41fb <sys_mknod+0x5a>
    41e5:	83 ec 0c             	sub    $0xc,%esp
    41e8:	50                   	push   %eax
    41e9:	e8 fc ff ff ff       	call   41ea <sys_mknod+0x49>
    41ee:	83 c4 10             	add    $0x10,%esp
    41f1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    41f6:	e9 5b 01 00 00       	jmp    4356 <sys_mknod+0x1b5>
    41fb:	ba 02 00 00 00       	mov    $0x2,%edx
    4200:	e8 e4 f6 ff ff       	call   38e9 <permission>
    4205:	85 c0                	test   %eax,%eax
    4207:	75 16                	jne    421f <sys_mknod+0x7e>
    4209:	83 ec 0c             	sub    $0xc,%esp
    420c:	53                   	push   %ebx
    420d:	e8 fc ff ff ff       	call   420e <sys_mknod+0x6d>
    4212:	83 c4 10             	add    $0x10,%esp
    4215:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    421a:	e9 37 01 00 00       	jmp    4356 <sys_mknod+0x1b5>
    421f:	83 ec 0c             	sub    $0xc,%esp
    4222:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4226:	50                   	push   %eax
    4227:	89 f9                	mov    %edi,%ecx
    4229:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    422d:	8d 44 24 14          	lea    0x14(%esp),%eax
    4231:	e8 12 f7 ff ff       	call   3948 <find_entry>
    4236:	83 c4 10             	add    $0x10,%esp
    4239:	85 c0                	test   %eax,%eax
    423b:	74 22                	je     425f <sys_mknod+0xbe>
    423d:	83 ec 0c             	sub    $0xc,%esp
    4240:	50                   	push   %eax
    4241:	e8 fc ff ff ff       	call   4242 <sys_mknod+0xa1>
    4246:	83 c4 04             	add    $0x4,%esp
    4249:	ff 74 24 10          	pushl  0x10(%esp)
    424d:	e8 fc ff ff ff       	call   424e <sys_mknod+0xad>
    4252:	83 c4 10             	add    $0x10,%esp
    4255:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    425a:	e9 f7 00 00 00       	jmp    4356 <sys_mknod+0x1b5>
    425f:	83 ec 0c             	sub    $0xc,%esp
    4262:	8b 44 24 10          	mov    0x10(%esp),%eax
    4266:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    426a:	50                   	push   %eax
    426b:	e8 fc ff ff ff       	call   426c <sys_mknod+0xcb>
    4270:	89 c3                	mov    %eax,%ebx
    4272:	83 c4 10             	add    $0x10,%esp
    4275:	85 c0                	test   %eax,%eax
    4277:	75 19                	jne    4292 <sys_mknod+0xf1>
    4279:	83 ec 0c             	sub    $0xc,%esp
    427c:	ff 74 24 10          	pushl  0x10(%esp)
    4280:	e8 fc ff ff ff       	call   4281 <sys_mknod+0xe0>
    4285:	83 c4 10             	add    $0x10,%esp
    4288:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    428d:	e9 c4 00 00 00       	jmp    4356 <sys_mknod+0x1b5>
    4292:	66 89 30             	mov    %si,(%eax)
    4295:	81 e6 00 b0 00 00    	and    $0xb000,%esi
    429b:	81 fe 00 20 00 00    	cmp    $0x2000,%esi
    42a1:	75 08                	jne    42ab <sys_mknod+0x10a>
    42a3:	8b 44 24 28          	mov    0x28(%esp),%eax
    42a7:	66 89 43 0e          	mov    %ax,0xe(%ebx)
    42ab:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    42b1:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    42b6:	f7 e9                	imul   %ecx
    42b8:	89 d0                	mov    %edx,%eax
    42ba:	c1 f8 05             	sar    $0x5,%eax
    42bd:	c1 f9 1f             	sar    $0x1f,%ecx
    42c0:	29 c8                	sub    %ecx,%eax
    42c2:	03 05 00 00 00 00    	add    0x0,%eax
    42c8:	89 43 24             	mov    %eax,0x24(%ebx)
    42cb:	89 43 08             	mov    %eax,0x8(%ebx)
    42ce:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    42d2:	83 ec 0c             	sub    $0xc,%esp
    42d5:	8d 44 24 0c          	lea    0xc(%esp),%eax
    42d9:	50                   	push   %eax
    42da:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    42de:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    42e2:	8b 44 24 14          	mov    0x14(%esp),%eax
    42e6:	e8 f7 f9 ff ff       	call   3ce2 <add_entry>
    42eb:	89 c6                	mov    %eax,%esi
    42ed:	83 c4 10             	add    $0x10,%esp
    42f0:	85 c0                	test   %eax,%eax
    42f2:	75 22                	jne    4316 <sys_mknod+0x175>
    42f4:	83 ec 0c             	sub    $0xc,%esp
    42f7:	ff 74 24 10          	pushl  0x10(%esp)
    42fb:	e8 fc ff ff ff       	call   42fc <sys_mknod+0x15b>
    4300:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    4304:	89 1c 24             	mov    %ebx,(%esp)
    4307:	e8 fc ff ff ff       	call   4308 <sys_mknod+0x167>
    430c:	83 c4 10             	add    $0x10,%esp
    430f:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4314:	eb 40                	jmp    4356 <sys_mknod+0x1b5>
    4316:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    431a:	8b 04 24             	mov    (%esp),%eax
    431d:	66 89 10             	mov    %dx,(%eax)
    4320:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4324:	83 ec 0c             	sub    $0xc,%esp
    4327:	ff 74 24 10          	pushl  0x10(%esp)
    432b:	e8 fc ff ff ff       	call   432c <sys_mknod+0x18b>
    4330:	89 1c 24             	mov    %ebx,(%esp)
    4333:	e8 fc ff ff ff       	call   4334 <sys_mknod+0x193>
    4338:	89 34 24             	mov    %esi,(%esp)
    433b:	e8 fc ff ff ff       	call   433c <sys_mknod+0x19b>
    4340:	83 c4 10             	add    $0x10,%esp
    4343:	b8 00 00 00 00       	mov    $0x0,%eax
    4348:	eb 0c                	jmp    4356 <sys_mknod+0x1b5>
    434a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    434f:	eb 05                	jmp    4356 <sys_mknod+0x1b5>
    4351:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4356:	83 c4 10             	add    $0x10,%esp
    4359:	5b                   	pop    %ebx
    435a:	5e                   	pop    %esi
    435b:	5f                   	pop    %edi
    435c:	c3                   	ret    

0000435d <sys_mkdir>:
    435d:	a1 00 00 00 00       	mov    0x0,%eax
    4362:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    4369:	00 
    436a:	0f 85 9b 02 00 00    	jne    460b <sys_mkdir+0x2ae>
    4370:	57                   	push   %edi
    4371:	56                   	push   %esi
    4372:	53                   	push   %ebx
    4373:	83 ec 10             	sub    $0x10,%esp
    4376:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    437a:	8d 54 24 08          	lea    0x8(%esp),%edx
    437e:	8b 44 24 20          	mov    0x20(%esp),%eax
    4382:	e8 85 f7 ff ff       	call   3b0c <dir_namei>
    4387:	89 c3                	mov    %eax,%ebx
    4389:	89 44 24 04          	mov    %eax,0x4(%esp)
    438d:	85 c0                	test   %eax,%eax
    438f:	0f 84 7c 02 00 00    	je     4611 <sys_mkdir+0x2b4>
    4395:	8b 74 24 08          	mov    0x8(%esp),%esi
    4399:	85 f6                	test   %esi,%esi
    439b:	75 16                	jne    43b3 <sys_mkdir+0x56>
    439d:	83 ec 0c             	sub    $0xc,%esp
    43a0:	50                   	push   %eax
    43a1:	e8 fc ff ff ff       	call   43a2 <sys_mkdir+0x45>
    43a6:	83 c4 10             	add    $0x10,%esp
    43a9:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    43ae:	e9 63 02 00 00       	jmp    4616 <sys_mkdir+0x2b9>
    43b3:	ba 02 00 00 00       	mov    $0x2,%edx
    43b8:	e8 2c f5 ff ff       	call   38e9 <permission>
    43bd:	85 c0                	test   %eax,%eax
    43bf:	75 16                	jne    43d7 <sys_mkdir+0x7a>
    43c1:	83 ec 0c             	sub    $0xc,%esp
    43c4:	53                   	push   %ebx
    43c5:	e8 fc ff ff ff       	call   43c6 <sys_mkdir+0x69>
    43ca:	83 c4 10             	add    $0x10,%esp
    43cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    43d2:	e9 3f 02 00 00       	jmp    4616 <sys_mkdir+0x2b9>
    43d7:	83 ec 0c             	sub    $0xc,%esp
    43da:	8d 44 24 0c          	lea    0xc(%esp),%eax
    43de:	50                   	push   %eax
    43df:	89 f1                	mov    %esi,%ecx
    43e1:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    43e5:	8d 44 24 14          	lea    0x14(%esp),%eax
    43e9:	e8 5a f5 ff ff       	call   3948 <find_entry>
    43ee:	83 c4 10             	add    $0x10,%esp
    43f1:	85 c0                	test   %eax,%eax
    43f3:	74 22                	je     4417 <sys_mkdir+0xba>
    43f5:	83 ec 0c             	sub    $0xc,%esp
    43f8:	50                   	push   %eax
    43f9:	e8 fc ff ff ff       	call   43fa <sys_mkdir+0x9d>
    43fe:	83 c4 04             	add    $0x4,%esp
    4401:	ff 74 24 10          	pushl  0x10(%esp)
    4405:	e8 fc ff ff ff       	call   4406 <sys_mkdir+0xa9>
    440a:	83 c4 10             	add    $0x10,%esp
    440d:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    4412:	e9 ff 01 00 00       	jmp    4616 <sys_mkdir+0x2b9>
    4417:	83 ec 0c             	sub    $0xc,%esp
    441a:	8b 44 24 10          	mov    0x10(%esp),%eax
    441e:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    4422:	50                   	push   %eax
    4423:	e8 fc ff ff ff       	call   4424 <sys_mkdir+0xc7>
    4428:	89 c3                	mov    %eax,%ebx
    442a:	83 c4 10             	add    $0x10,%esp
    442d:	85 c0                	test   %eax,%eax
    442f:	75 19                	jne    444a <sys_mkdir+0xed>
    4431:	83 ec 0c             	sub    $0xc,%esp
    4434:	ff 74 24 10          	pushl  0x10(%esp)
    4438:	e8 fc ff ff ff       	call   4439 <sys_mkdir+0xdc>
    443d:	83 c4 10             	add    $0x10,%esp
    4440:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4445:	e9 cc 01 00 00       	jmp    4616 <sys_mkdir+0x2b9>
    444a:	c7 40 04 20 00 00 00 	movl   $0x20,0x4(%eax)
    4451:	c6 40 33 01          	movb   $0x1,0x33(%eax)
    4455:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    445b:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4460:	f7 e9                	imul   %ecx
    4462:	89 d0                	mov    %edx,%eax
    4464:	c1 f8 05             	sar    $0x5,%eax
    4467:	c1 f9 1f             	sar    $0x1f,%ecx
    446a:	29 c8                	sub    %ecx,%eax
    446c:	03 05 00 00 00 00    	add    0x0,%eax
    4472:	89 43 24             	mov    %eax,0x24(%ebx)
    4475:	89 43 08             	mov    %eax,0x8(%ebx)
    4478:	83 ec 0c             	sub    $0xc,%esp
    447b:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    447f:	50                   	push   %eax
    4480:	e8 fc ff ff ff       	call   4481 <sys_mkdir+0x124>
    4485:	66 89 43 0e          	mov    %ax,0xe(%ebx)
    4489:	83 c4 10             	add    $0x10,%esp
    448c:	66 85 c0             	test   %ax,%ax
    448f:	75 24                	jne    44b5 <sys_mkdir+0x158>
    4491:	83 ec 0c             	sub    $0xc,%esp
    4494:	ff 74 24 10          	pushl  0x10(%esp)
    4498:	e8 fc ff ff ff       	call   4499 <sys_mkdir+0x13c>
    449d:	fe 4b 0d             	decb   0xd(%ebx)
    44a0:	89 1c 24             	mov    %ebx,(%esp)
    44a3:	e8 fc ff ff ff       	call   44a4 <sys_mkdir+0x147>
    44a8:	83 c4 10             	add    $0x10,%esp
    44ab:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    44b0:	e9 61 01 00 00       	jmp    4616 <sys_mkdir+0x2b9>
    44b5:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    44b9:	83 ec 08             	sub    $0x8,%esp
    44bc:	0f b7 c0             	movzwl %ax,%eax
    44bf:	50                   	push   %eax
    44c0:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    44c4:	50                   	push   %eax
    44c5:	e8 fc ff ff ff       	call   44c6 <sys_mkdir+0x169>
    44ca:	89 c1                	mov    %eax,%ecx
    44cc:	83 c4 10             	add    $0x10,%esp
    44cf:	85 c0                	test   %eax,%eax
    44d1:	75 36                	jne    4509 <sys_mkdir+0x1ac>
    44d3:	83 ec 0c             	sub    $0xc,%esp
    44d6:	ff 74 24 10          	pushl  0x10(%esp)
    44da:	e8 fc ff ff ff       	call   44db <sys_mkdir+0x17e>
    44df:	83 c4 08             	add    $0x8,%esp
    44e2:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    44e6:	50                   	push   %eax
    44e7:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    44eb:	50                   	push   %eax
    44ec:	e8 fc ff ff ff       	call   44ed <sys_mkdir+0x190>
    44f1:	fe 4b 0d             	decb   0xd(%ebx)
    44f4:	89 1c 24             	mov    %ebx,(%esp)
    44f7:	e8 fc ff ff ff       	call   44f8 <sys_mkdir+0x19b>
    44fc:	83 c4 10             	add    $0x10,%esp
    44ff:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    4504:	e9 0d 01 00 00       	jmp    4616 <sys_mkdir+0x2b9>
    4509:	8b 00                	mov    (%eax),%eax
    450b:	89 04 24             	mov    %eax,(%esp)
    450e:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    4512:	66 89 10             	mov    %dx,(%eax)
    4515:	8b 14 24             	mov    (%esp),%edx
    4518:	8d 7a 02             	lea    0x2(%edx),%edi
    451b:	be 82 02 00 00       	mov    $0x282,%esi
    4520:	fc                   	cld    
    4521:	ac                   	lods   %ds:(%esi),%al
    4522:	aa                   	stos   %al,%es:(%edi)
    4523:	84 c0                	test   %al,%al
    4525:	75 fa                	jne    4521 <sys_mkdir+0x1c4>
    4527:	8d 42 20             	lea    0x20(%edx),%eax
    452a:	89 04 24             	mov    %eax,(%esp)
    452d:	8b 44 24 04          	mov    0x4(%esp),%eax
    4531:	66 8b 40 2e          	mov    0x2e(%eax),%ax
    4535:	66 89 42 20          	mov    %ax,0x20(%edx)
    4539:	8d 7a 22             	lea    0x22(%edx),%edi
    453c:	be 84 02 00 00       	mov    $0x284,%esi
    4541:	fc                   	cld    
    4542:	ac                   	lods   %ds:(%esi),%al
    4543:	aa                   	stos   %al,%es:(%edi)
    4544:	84 c0                	test   %al,%al
    4546:	75 fa                	jne    4542 <sys_mkdir+0x1e5>
    4548:	c6 43 0d 02          	movb   $0x2,0xd(%ebx)
    454c:	c6 41 0b 01          	movb   $0x1,0xb(%ecx)
    4550:	83 ec 0c             	sub    $0xc,%esp
    4553:	51                   	push   %ecx
    4554:	e8 fc ff ff ff       	call   4555 <sys_mkdir+0x1f8>
    4559:	a1 00 00 00 00       	mov    0x0,%eax
    455e:	8b 80 6c 02 00 00    	mov    0x26c(%eax),%eax
    4564:	f7 d0                	not    %eax
    4566:	25 ff 01 00 00       	and    $0x1ff,%eax
    456b:	23 44 24 34          	and    0x34(%esp),%eax
    456f:	80 cc 40             	or     $0x40,%ah
    4572:	66 89 03             	mov    %ax,(%ebx)
    4575:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4579:	83 c4 04             	add    $0x4,%esp
    457c:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4580:	50                   	push   %eax
    4581:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    4585:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4589:	8b 44 24 14          	mov    0x14(%esp),%eax
    458d:	e8 50 f7 ff ff       	call   3ce2 <add_entry>
    4592:	89 c6                	mov    %eax,%esi
    4594:	83 c4 10             	add    $0x10,%esp
    4597:	85 c0                	test   %eax,%eax
    4599:	75 34                	jne    45cf <sys_mkdir+0x272>
    459b:	83 ec 0c             	sub    $0xc,%esp
    459e:	ff 74 24 10          	pushl  0x10(%esp)
    45a2:	e8 fc ff ff ff       	call   45a3 <sys_mkdir+0x246>
    45a7:	83 c4 08             	add    $0x8,%esp
    45aa:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    45ae:	50                   	push   %eax
    45af:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    45b3:	50                   	push   %eax
    45b4:	e8 fc ff ff ff       	call   45b5 <sys_mkdir+0x258>
    45b9:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    45bd:	89 1c 24             	mov    %ebx,(%esp)
    45c0:	e8 fc ff ff ff       	call   45c1 <sys_mkdir+0x264>
    45c5:	83 c4 10             	add    $0x10,%esp
    45c8:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    45cd:	eb 47                	jmp    4616 <sys_mkdir+0x2b9>
    45cf:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    45d3:	8b 04 24             	mov    (%esp),%eax
    45d6:	66 89 10             	mov    %dx,(%eax)
    45d9:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    45dd:	8b 44 24 04          	mov    0x4(%esp),%eax
    45e1:	fe 40 0d             	incb   0xd(%eax)
    45e4:	c6 40 33 01          	movb   $0x1,0x33(%eax)
    45e8:	83 ec 0c             	sub    $0xc,%esp
    45eb:	50                   	push   %eax
    45ec:	e8 fc ff ff ff       	call   45ed <sys_mkdir+0x290>
    45f1:	89 1c 24             	mov    %ebx,(%esp)
    45f4:	e8 fc ff ff ff       	call   45f5 <sys_mkdir+0x298>
    45f9:	89 34 24             	mov    %esi,(%esp)
    45fc:	e8 fc ff ff ff       	call   45fd <sys_mkdir+0x2a0>
    4601:	83 c4 10             	add    $0x10,%esp
    4604:	b8 00 00 00 00       	mov    $0x0,%eax
    4609:	eb 0b                	jmp    4616 <sys_mkdir+0x2b9>
    460b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4610:	c3                   	ret    
    4611:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4616:	83 c4 10             	add    $0x10,%esp
    4619:	5b                   	pop    %ebx
    461a:	5e                   	pop    %esi
    461b:	5f                   	pop    %edi
    461c:	c3                   	ret    

0000461d <sys_rmdir>:
    461d:	55                   	push   %ebp
    461e:	57                   	push   %edi
    461f:	56                   	push   %esi
    4620:	53                   	push   %ebx
    4621:	83 ec 2c             	sub    $0x2c,%esp
    4624:	a1 00 00 00 00       	mov    0x0,%eax
    4629:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    4630:	00 
    4631:	0f 85 a4 03 00 00    	jne    49db <sys_rmdir+0x3be>
    4637:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    463b:	8d 54 24 18          	lea    0x18(%esp),%edx
    463f:	8b 44 24 40          	mov    0x40(%esp),%eax
    4643:	e8 c4 f4 ff ff       	call   3b0c <dir_namei>
    4648:	89 c3                	mov    %eax,%ebx
    464a:	89 44 24 14          	mov    %eax,0x14(%esp)
    464e:	85 c0                	test   %eax,%eax
    4650:	0f 84 8c 03 00 00    	je     49e2 <sys_rmdir+0x3c5>
    4656:	8b 74 24 18          	mov    0x18(%esp),%esi
    465a:	85 f6                	test   %esi,%esi
    465c:	75 16                	jne    4674 <sys_rmdir+0x57>
    465e:	83 ec 0c             	sub    $0xc,%esp
    4661:	50                   	push   %eax
    4662:	e8 fc ff ff ff       	call   4663 <sys_rmdir+0x46>
    4667:	83 c4 10             	add    $0x10,%esp
    466a:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    466f:	e9 9e 03 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    4674:	ba 02 00 00 00       	mov    $0x2,%edx
    4679:	e8 6b f2 ff ff       	call   38e9 <permission>
    467e:	85 c0                	test   %eax,%eax
    4680:	75 16                	jne    4698 <sys_rmdir+0x7b>
    4682:	83 ec 0c             	sub    $0xc,%esp
    4685:	53                   	push   %ebx
    4686:	e8 fc ff ff ff       	call   4687 <sys_rmdir+0x6a>
    468b:	83 c4 10             	add    $0x10,%esp
    468e:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4693:	e9 7a 03 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    4698:	83 ec 0c             	sub    $0xc,%esp
    469b:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    469f:	50                   	push   %eax
    46a0:	89 f1                	mov    %esi,%ecx
    46a2:	8b 54 24 2c          	mov    0x2c(%esp),%edx
    46a6:	8d 44 24 24          	lea    0x24(%esp),%eax
    46aa:	e8 99 f2 ff ff       	call   3948 <find_entry>
    46af:	89 c5                	mov    %eax,%ebp
    46b1:	83 c4 10             	add    $0x10,%esp
    46b4:	85 c0                	test   %eax,%eax
    46b6:	75 19                	jne    46d1 <sys_rmdir+0xb4>
    46b8:	83 ec 0c             	sub    $0xc,%esp
    46bb:	ff 74 24 20          	pushl  0x20(%esp)
    46bf:	e8 fc ff ff ff       	call   46c0 <sys_rmdir+0xa3>
    46c4:	83 c4 10             	add    $0x10,%esp
    46c7:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    46cc:	e9 41 03 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    46d1:	83 ec 08             	sub    $0x8,%esp
    46d4:	8b 44 24 18          	mov    0x18(%esp),%eax
    46d8:	0f b7 00             	movzwl (%eax),%eax
    46db:	50                   	push   %eax
    46dc:	8b 44 24 20          	mov    0x20(%esp),%eax
    46e0:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    46e4:	50                   	push   %eax
    46e5:	e8 fc ff ff ff       	call   46e6 <sys_rmdir+0xc9>
    46ea:	89 c3                	mov    %eax,%ebx
    46ec:	83 c4 10             	add    $0x10,%esp
    46ef:	85 c0                	test   %eax,%eax
    46f1:	75 21                	jne    4714 <sys_rmdir+0xf7>
    46f3:	83 ec 0c             	sub    $0xc,%esp
    46f6:	ff 74 24 20          	pushl  0x20(%esp)
    46fa:	e8 fc ff ff ff       	call   46fb <sys_rmdir+0xde>
    46ff:	89 2c 24             	mov    %ebp,(%esp)
    4702:	e8 fc ff ff ff       	call   4703 <sys_rmdir+0xe6>
    4707:	83 c4 10             	add    $0x10,%esp
    470a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    470f:	e9 fe 02 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    4714:	8b 44 24 14          	mov    0x14(%esp),%eax
    4718:	f7 00 00 02 00 00    	testl  $0x200,(%eax)
    471e:	74 3e                	je     475e <sys_rmdir+0x141>
    4720:	8b 15 00 00 00 00    	mov    0x0,%edx
    4726:	66 8b 92 42 02 00 00 	mov    0x242(%edx),%dx
    472d:	66 85 d2             	test   %dx,%dx
    4730:	74 2c                	je     475e <sys_rmdir+0x141>
    4732:	66 3b 53 02          	cmp    0x2(%ebx),%dx
    4736:	74 26                	je     475e <sys_rmdir+0x141>
    4738:	83 ec 0c             	sub    $0xc,%esp
    473b:	50                   	push   %eax
    473c:	e8 fc ff ff ff       	call   473d <sys_rmdir+0x120>
    4741:	89 1c 24             	mov    %ebx,(%esp)
    4744:	e8 fc ff ff ff       	call   4745 <sys_rmdir+0x128>
    4749:	89 2c 24             	mov    %ebp,(%esp)
    474c:	e8 fc ff ff ff       	call   474d <sys_rmdir+0x130>
    4751:	83 c4 10             	add    $0x10,%esp
    4754:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4759:	e9 b4 02 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    475e:	8b 53 2c             	mov    0x2c(%ebx),%edx
    4761:	66 3b 50 2c          	cmp    0x2c(%eax),%dx
    4765:	75 07                	jne    476e <sys_rmdir+0x151>
    4767:	66 83 7b 30 01       	cmpw   $0x1,0x30(%ebx)
    476c:	76 26                	jbe    4794 <sys_rmdir+0x177>
    476e:	83 ec 0c             	sub    $0xc,%esp
    4771:	50                   	push   %eax
    4772:	e8 fc ff ff ff       	call   4773 <sys_rmdir+0x156>
    4777:	89 1c 24             	mov    %ebx,(%esp)
    477a:	e8 fc ff ff ff       	call   477b <sys_rmdir+0x15e>
    477f:	89 2c 24             	mov    %ebp,(%esp)
    4782:	e8 fc ff ff ff       	call   4783 <sys_rmdir+0x166>
    4787:	83 c4 10             	add    $0x10,%esp
    478a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    478f:	e9 7e 02 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    4794:	39 c3                	cmp    %eax,%ebx
    4796:	75 2a                	jne    47c2 <sys_rmdir+0x1a5>
    4798:	83 ec 0c             	sub    $0xc,%esp
    479b:	53                   	push   %ebx
    479c:	e8 fc ff ff ff       	call   479d <sys_rmdir+0x180>
    47a1:	83 c4 04             	add    $0x4,%esp
    47a4:	ff 74 24 20          	pushl  0x20(%esp)
    47a8:	e8 fc ff ff ff       	call   47a9 <sys_rmdir+0x18c>
    47ad:	89 2c 24             	mov    %ebp,(%esp)
    47b0:	e8 fc ff ff ff       	call   47b1 <sys_rmdir+0x194>
    47b5:	83 c4 10             	add    $0x10,%esp
    47b8:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    47bd:	e9 50 02 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    47c2:	8b 03                	mov    (%ebx),%eax
    47c4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    47c9:	66 3d 00 40          	cmp    $0x4000,%ax
    47cd:	74 2a                	je     47f9 <sys_rmdir+0x1dc>
    47cf:	83 ec 0c             	sub    $0xc,%esp
    47d2:	53                   	push   %ebx
    47d3:	e8 fc ff ff ff       	call   47d4 <sys_rmdir+0x1b7>
    47d8:	83 c4 04             	add    $0x4,%esp
    47db:	ff 74 24 20          	pushl  0x20(%esp)
    47df:	e8 fc ff ff ff       	call   47e0 <sys_rmdir+0x1c3>
    47e4:	89 2c 24             	mov    %ebp,(%esp)
    47e7:	e8 fc ff ff ff       	call   47e8 <sys_rmdir+0x1cb>
    47ec:	83 c4 10             	add    $0x10,%esp
    47ef:	bf ec ff ff ff       	mov    $0xffffffec,%edi
    47f4:	e9 19 02 00 00       	jmp    4a12 <sys_rmdir+0x3f5>
    47f9:	8b 43 04             	mov    0x4(%ebx),%eax
    47fc:	c1 e8 05             	shr    $0x5,%eax
    47ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    4803:	83 f8 01             	cmp    $0x1,%eax
    4806:	7e 22                	jle    482a <sys_rmdir+0x20d>
    4808:	66 8b 43 0e          	mov    0xe(%ebx),%ax
    480c:	66 85 c0             	test   %ax,%ax
    480f:	74 19                	je     482a <sys_rmdir+0x20d>
    4811:	83 ec 08             	sub    $0x8,%esp
    4814:	0f b7 c0             	movzwl %ax,%eax
    4817:	50                   	push   %eax
    4818:	0f b7 d2             	movzwl %dx,%edx
    481b:	52                   	push   %edx
    481c:	e8 fc ff ff ff       	call   481d <sys_rmdir+0x200>
    4821:	89 c1                	mov    %eax,%ecx
    4823:	83 c4 10             	add    $0x10,%esp
    4826:	85 c0                	test   %eax,%eax
    4828:	75 1a                	jne    4844 <sys_rmdir+0x227>
    482a:	83 ec 08             	sub    $0x8,%esp
    482d:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4831:	50                   	push   %eax
    4832:	68 a4 02 00 00       	push   $0x2a4
    4837:	e8 fc ff ff ff       	call   4838 <sys_rmdir+0x21b>
    483c:	83 c4 10             	add    $0x10,%esp
    483f:	e9 a9 01 00 00       	jmp    49ed <sys_rmdir+0x3d0>
    4844:	8b 10                	mov    (%eax),%edx
    4846:	66 8b 43 2e          	mov    0x2e(%ebx),%ax
    484a:	66 39 02             	cmp    %ax,(%edx)
    484d:	75 4d                	jne    489c <sys_rmdir+0x27f>
    484f:	66 83 7a 20 00       	cmpw   $0x0,0x20(%edx)
    4854:	74 46                	je     489c <sys_rmdir+0x27f>
    4856:	8d 72 02             	lea    0x2(%edx),%esi
    4859:	bf 82 02 00 00       	mov    $0x282,%edi
    485e:	fc                   	cld    
    485f:	ac                   	lods   %ds:(%esi),%al
    4860:	ae                   	scas   %es:(%edi),%al
    4861:	75 08                	jne    486b <sys_rmdir+0x24e>
    4863:	84 c0                	test   %al,%al
    4865:	75 f8                	jne    485f <sys_rmdir+0x242>
    4867:	31 c0                	xor    %eax,%eax
    4869:	eb 09                	jmp    4874 <sys_rmdir+0x257>
    486b:	b8 01 00 00 00       	mov    $0x1,%eax
    4870:	7c 02                	jl     4874 <sys_rmdir+0x257>
    4872:	f7 d8                	neg    %eax
    4874:	85 c0                	test   %eax,%eax
    4876:	75 24                	jne    489c <sys_rmdir+0x27f>
    4878:	8d 72 22             	lea    0x22(%edx),%esi
    487b:	bf 84 02 00 00       	mov    $0x284,%edi
    4880:	fc                   	cld    
    4881:	ac                   	lods   %ds:(%esi),%al
    4882:	ae                   	scas   %es:(%edi),%al
    4883:	75 08                	jne    488d <sys_rmdir+0x270>
    4885:	84 c0                	test   %al,%al
    4887:	75 f8                	jne    4881 <sys_rmdir+0x264>
    4889:	31 c0                	xor    %eax,%eax
    488b:	eb 09                	jmp    4896 <sys_rmdir+0x279>
    488d:	b8 01 00 00 00       	mov    $0x1,%eax
    4892:	7c 02                	jl     4896 <sys_rmdir+0x279>
    4894:	f7 d8                	neg    %eax
    4896:	89 c7                	mov    %eax,%edi
    4898:	85 c0                	test   %eax,%eax
    489a:	74 1a                	je     48b6 <sys_rmdir+0x299>
    489c:	83 ec 08             	sub    $0x8,%esp
    489f:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    48a3:	50                   	push   %eax
    48a4:	68 a4 02 00 00       	push   $0x2a4
    48a9:	e8 fc ff ff ff       	call   48aa <sys_rmdir+0x28d>
    48ae:	83 c4 10             	add    $0x10,%esp
    48b1:	e9 37 01 00 00       	jmp    49ed <sys_rmdir+0x3d0>
    48b6:	8d 72 40             	lea    0x40(%edx),%esi
    48b9:	83 7c 24 04 02       	cmpl   $0x2,0x4(%esp)
    48be:	0f 8e 8f 00 00 00    	jle    4953 <sys_rmdir+0x336>
    48c4:	b8 02 00 00 00       	mov    $0x2,%eax
    48c9:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    48cd:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    48d1:	89 cd                	mov    %ecx,%ebp
    48d3:	89 c7                	mov    %eax,%edi
    48d5:	8b 45 00             	mov    0x0(%ebp),%eax
    48d8:	05 00 04 00 00       	add    $0x400,%eax
    48dd:	39 c6                	cmp    %eax,%esi
    48df:	72 41                	jb     4922 <sys_rmdir+0x305>
    48e1:	83 ec 0c             	sub    $0xc,%esp
    48e4:	55                   	push   %ebp
    48e5:	e8 fc ff ff ff       	call   48e6 <sys_rmdir+0x2c9>
    48ea:	83 c4 08             	add    $0x8,%esp
    48ed:	89 f8                	mov    %edi,%eax
    48ef:	c1 e8 05             	shr    $0x5,%eax
    48f2:	50                   	push   %eax
    48f3:	53                   	push   %ebx
    48f4:	e8 fc ff ff ff       	call   48f5 <sys_rmdir+0x2d8>
    48f9:	83 c4 10             	add    $0x10,%esp
    48fc:	85 c0                	test   %eax,%eax
    48fe:	75 05                	jne    4905 <sys_rmdir+0x2e8>
    4900:	83 c7 20             	add    $0x20,%edi
    4903:	eb 3e                	jmp    4943 <sys_rmdir+0x326>
    4905:	83 ec 08             	sub    $0x8,%esp
    4908:	50                   	push   %eax
    4909:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    490d:	50                   	push   %eax
    490e:	e8 fc ff ff ff       	call   490f <sys_rmdir+0x2f2>
    4913:	89 c5                	mov    %eax,%ebp
    4915:	83 c4 10             	add    $0x10,%esp
    4918:	85 c0                	test   %eax,%eax
    491a:	0f 84 c9 00 00 00    	je     49e9 <sys_rmdir+0x3cc>
    4920:	8b 30                	mov    (%eax),%esi
    4922:	66 83 3e 00          	cmpw   $0x0,(%esi)
    4926:	74 17                	je     493f <sys_rmdir+0x322>
    4928:	89 e8                	mov    %ebp,%eax
    492a:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    492e:	83 ec 0c             	sub    $0xc,%esp
    4931:	50                   	push   %eax
    4932:	e8 fc ff ff ff       	call   4933 <sys_rmdir+0x316>
    4937:	83 c4 10             	add    $0x10,%esp
    493a:	e9 ae 00 00 00       	jmp    49ed <sys_rmdir+0x3d0>
    493f:	83 c6 20             	add    $0x20,%esi
    4942:	47                   	inc    %edi
    4943:	39 7c 24 04          	cmp    %edi,0x4(%esp)
    4947:	7f 8c                	jg     48d5 <sys_rmdir+0x2b8>
    4949:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    494d:	89 e9                	mov    %ebp,%ecx
    494f:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    4953:	83 ec 0c             	sub    $0xc,%esp
    4956:	51                   	push   %ecx
    4957:	e8 fc ff ff ff       	call   4958 <sys_rmdir+0x33b>
    495c:	8a 43 0d             	mov    0xd(%ebx),%al
    495f:	83 c4 10             	add    $0x10,%esp
    4962:	3c 02                	cmp    $0x2,%al
    4964:	74 14                	je     497a <sys_rmdir+0x35d>
    4966:	83 ec 08             	sub    $0x8,%esp
    4969:	0f b6 c0             	movzbl %al,%eax
    496c:	50                   	push   %eax
    496d:	68 cc 02 00 00       	push   $0x2cc
    4972:	e8 fc ff ff ff       	call   4973 <sys_rmdir+0x356>
    4977:	83 c4 10             	add    $0x10,%esp
    497a:	8b 44 24 10          	mov    0x10(%esp),%eax
    497e:	66 c7 00 00 00       	movw   $0x0,(%eax)
    4983:	c6 45 0b 01          	movb   $0x1,0xb(%ebp)
    4987:	83 ec 0c             	sub    $0xc,%esp
    498a:	55                   	push   %ebp
    498b:	e8 fc ff ff ff       	call   498c <sys_rmdir+0x36f>
    4990:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    4994:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4998:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    499c:	fe 49 0d             	decb   0xd(%ecx)
    499f:	8b 35 00 00 00 00    	mov    0x0,%esi
    49a5:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    49aa:	f7 ee                	imul   %esi
    49ac:	89 d0                	mov    %edx,%eax
    49ae:	c1 f8 05             	sar    $0x5,%eax
    49b1:	c1 fe 1f             	sar    $0x1f,%esi
    49b4:	29 f0                	sub    %esi,%eax
    49b6:	03 05 00 00 00 00    	add    0x0,%eax
    49bc:	89 41 08             	mov    %eax,0x8(%ecx)
    49bf:	89 41 28             	mov    %eax,0x28(%ecx)
    49c2:	c6 41 33 01          	movb   $0x1,0x33(%ecx)
    49c6:	89 0c 24             	mov    %ecx,(%esp)
    49c9:	e8 fc ff ff ff       	call   49ca <sys_rmdir+0x3ad>
    49ce:	89 1c 24             	mov    %ebx,(%esp)
    49d1:	e8 fc ff ff ff       	call   49d2 <sys_rmdir+0x3b5>
    49d6:	83 c4 10             	add    $0x10,%esp
    49d9:	eb 37                	jmp    4a12 <sys_rmdir+0x3f5>
    49db:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    49e0:	eb 30                	jmp    4a12 <sys_rmdir+0x3f5>
    49e2:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    49e7:	eb 29                	jmp    4a12 <sys_rmdir+0x3f5>
    49e9:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    49ed:	83 ec 0c             	sub    $0xc,%esp
    49f0:	53                   	push   %ebx
    49f1:	e8 fc ff ff ff       	call   49f2 <sys_rmdir+0x3d5>
    49f6:	83 c4 04             	add    $0x4,%esp
    49f9:	ff 74 24 20          	pushl  0x20(%esp)
    49fd:	e8 fc ff ff ff       	call   49fe <sys_rmdir+0x3e1>
    4a02:	89 2c 24             	mov    %ebp,(%esp)
    4a05:	e8 fc ff ff ff       	call   4a06 <sys_rmdir+0x3e9>
    4a0a:	83 c4 10             	add    $0x10,%esp
    4a0d:	bf d9 ff ff ff       	mov    $0xffffffd9,%edi
    4a12:	89 f8                	mov    %edi,%eax
    4a14:	83 c4 2c             	add    $0x2c,%esp
    4a17:	5b                   	pop    %ebx
    4a18:	5e                   	pop    %esi
    4a19:	5f                   	pop    %edi
    4a1a:	5d                   	pop    %ebp
    4a1b:	c3                   	ret    

00004a1c <sys_unlink>:
    4a1c:	56                   	push   %esi
    4a1d:	53                   	push   %ebx
    4a1e:	83 ec 14             	sub    $0x14,%esp
    4a21:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    4a25:	8d 54 24 08          	lea    0x8(%esp),%edx
    4a29:	8b 44 24 20          	mov    0x20(%esp),%eax
    4a2d:	e8 da f0 ff ff       	call   3b0c <dir_namei>
    4a32:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a36:	85 c0                	test   %eax,%eax
    4a38:	0f 84 c4 01 00 00    	je     4c02 <sys_unlink+0x1e6>
    4a3e:	89 c3                	mov    %eax,%ebx
    4a40:	8b 74 24 08          	mov    0x8(%esp),%esi
    4a44:	85 f6                	test   %esi,%esi
    4a46:	75 16                	jne    4a5e <sys_unlink+0x42>
    4a48:	83 ec 0c             	sub    $0xc,%esp
    4a4b:	50                   	push   %eax
    4a4c:	e8 fc ff ff ff       	call   4a4d <sys_unlink+0x31>
    4a51:	83 c4 10             	add    $0x10,%esp
    4a54:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4a59:	e9 a9 01 00 00       	jmp    4c07 <sys_unlink+0x1eb>
    4a5e:	ba 02 00 00 00       	mov    $0x2,%edx
    4a63:	e8 81 ee ff ff       	call   38e9 <permission>
    4a68:	85 c0                	test   %eax,%eax
    4a6a:	75 16                	jne    4a82 <sys_unlink+0x66>
    4a6c:	83 ec 0c             	sub    $0xc,%esp
    4a6f:	53                   	push   %ebx
    4a70:	e8 fc ff ff ff       	call   4a71 <sys_unlink+0x55>
    4a75:	83 c4 10             	add    $0x10,%esp
    4a78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4a7d:	e9 85 01 00 00       	jmp    4c07 <sys_unlink+0x1eb>
    4a82:	83 ec 0c             	sub    $0xc,%esp
    4a85:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4a89:	50                   	push   %eax
    4a8a:	89 f1                	mov    %esi,%ecx
    4a8c:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4a90:	8d 44 24 14          	lea    0x14(%esp),%eax
    4a94:	e8 af ee ff ff       	call   3948 <find_entry>
    4a99:	89 c6                	mov    %eax,%esi
    4a9b:	83 c4 10             	add    $0x10,%esp
    4a9e:	85 c0                	test   %eax,%eax
    4aa0:	75 19                	jne    4abb <sys_unlink+0x9f>
    4aa2:	83 ec 0c             	sub    $0xc,%esp
    4aa5:	ff 74 24 10          	pushl  0x10(%esp)
    4aa9:	e8 fc ff ff ff       	call   4aaa <sys_unlink+0x8e>
    4aae:	83 c4 10             	add    $0x10,%esp
    4ab1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4ab6:	e9 4c 01 00 00       	jmp    4c07 <sys_unlink+0x1eb>
    4abb:	83 ec 08             	sub    $0x8,%esp
    4abe:	8b 44 24 08          	mov    0x8(%esp),%eax
    4ac2:	0f b7 00             	movzwl (%eax),%eax
    4ac5:	50                   	push   %eax
    4ac6:	8b 44 24 10          	mov    0x10(%esp),%eax
    4aca:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    4ace:	50                   	push   %eax
    4acf:	e8 fc ff ff ff       	call   4ad0 <sys_unlink+0xb4>
    4ad4:	89 c3                	mov    %eax,%ebx
    4ad6:	83 c4 10             	add    $0x10,%esp
    4ad9:	85 c0                	test   %eax,%eax
    4adb:	75 21                	jne    4afe <sys_unlink+0xe2>
    4add:	83 ec 0c             	sub    $0xc,%esp
    4ae0:	ff 74 24 10          	pushl  0x10(%esp)
    4ae4:	e8 fc ff ff ff       	call   4ae5 <sys_unlink+0xc9>
    4ae9:	89 34 24             	mov    %esi,(%esp)
    4aec:	e8 fc ff ff ff       	call   4aed <sys_unlink+0xd1>
    4af1:	83 c4 10             	add    $0x10,%esp
    4af4:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4af9:	e9 09 01 00 00       	jmp    4c07 <sys_unlink+0x1eb>
    4afe:	8b 44 24 04          	mov    0x4(%esp),%eax
    4b02:	f7 00 00 02 00 00    	testl  $0x200,(%eax)
    4b08:	74 44                	je     4b4e <sys_unlink+0x132>
    4b0a:	8b 15 00 00 00 00    	mov    0x0,%edx
    4b10:	66 8b 92 42 02 00 00 	mov    0x242(%edx),%dx
    4b17:	66 85 d2             	test   %dx,%dx
    4b1a:	74 32                	je     4b4e <sys_unlink+0x132>
    4b1c:	66 3b 53 02          	cmp    0x2(%ebx),%dx
    4b20:	74 2c                	je     4b4e <sys_unlink+0x132>
    4b22:	66 3b 50 02          	cmp    0x2(%eax),%dx
    4b26:	74 26                	je     4b4e <sys_unlink+0x132>
    4b28:	83 ec 0c             	sub    $0xc,%esp
    4b2b:	50                   	push   %eax
    4b2c:	e8 fc ff ff ff       	call   4b2d <sys_unlink+0x111>
    4b31:	89 1c 24             	mov    %ebx,(%esp)
    4b34:	e8 fc ff ff ff       	call   4b35 <sys_unlink+0x119>
    4b39:	89 34 24             	mov    %esi,(%esp)
    4b3c:	e8 fc ff ff ff       	call   4b3d <sys_unlink+0x121>
    4b41:	83 c4 10             	add    $0x10,%esp
    4b44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4b49:	e9 b9 00 00 00       	jmp    4c07 <sys_unlink+0x1eb>
    4b4e:	8b 03                	mov    (%ebx),%eax
    4b50:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    4b55:	66 3d 00 40          	cmp    $0x4000,%ax
    4b59:	75 2a                	jne    4b85 <sys_unlink+0x169>
    4b5b:	83 ec 0c             	sub    $0xc,%esp
    4b5e:	53                   	push   %ebx
    4b5f:	e8 fc ff ff ff       	call   4b60 <sys_unlink+0x144>
    4b64:	83 c4 04             	add    $0x4,%esp
    4b67:	ff 74 24 10          	pushl  0x10(%esp)
    4b6b:	e8 fc ff ff ff       	call   4b6c <sys_unlink+0x150>
    4b70:	89 34 24             	mov    %esi,(%esp)
    4b73:	e8 fc ff ff ff       	call   4b74 <sys_unlink+0x158>
    4b78:	83 c4 10             	add    $0x10,%esp
    4b7b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4b80:	e9 82 00 00 00       	jmp    4c07 <sys_unlink+0x1eb>
    4b85:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    4b89:	75 1d                	jne    4ba8 <sys_unlink+0x18c>
    4b8b:	6a 00                	push   $0x0
    4b8d:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
    4b91:	50                   	push   %eax
    4b92:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4b96:	50                   	push   %eax
    4b97:	68 f0 02 00 00       	push   $0x2f0
    4b9c:	e8 fc ff ff ff       	call   4b9d <sys_unlink+0x181>
    4ba1:	c6 43 0d 01          	movb   $0x1,0xd(%ebx)
    4ba5:	83 c4 10             	add    $0x10,%esp
    4ba8:	8b 04 24             	mov    (%esp),%eax
    4bab:	66 c7 00 00 00       	movw   $0x0,(%eax)
    4bb0:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4bb4:	83 ec 0c             	sub    $0xc,%esp
    4bb7:	56                   	push   %esi
    4bb8:	e8 fc ff ff ff       	call   4bb9 <sys_unlink+0x19d>
    4bbd:	fe 4b 0d             	decb   0xd(%ebx)
    4bc0:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4bc4:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4bca:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4bcf:	f7 e9                	imul   %ecx
    4bd1:	89 d0                	mov    %edx,%eax
    4bd3:	c1 f8 05             	sar    $0x5,%eax
    4bd6:	c1 f9 1f             	sar    $0x1f,%ecx
    4bd9:	29 c8                	sub    %ecx,%eax
    4bdb:	03 05 00 00 00 00    	add    0x0,%eax
    4be1:	89 43 28             	mov    %eax,0x28(%ebx)
    4be4:	89 1c 24             	mov    %ebx,(%esp)
    4be7:	e8 fc ff ff ff       	call   4be8 <sys_unlink+0x1cc>
    4bec:	83 c4 04             	add    $0x4,%esp
    4bef:	ff 74 24 10          	pushl  0x10(%esp)
    4bf3:	e8 fc ff ff ff       	call   4bf4 <sys_unlink+0x1d8>
    4bf8:	83 c4 10             	add    $0x10,%esp
    4bfb:	b8 00 00 00 00       	mov    $0x0,%eax
    4c00:	eb 05                	jmp    4c07 <sys_unlink+0x1eb>
    4c02:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4c07:	83 c4 14             	add    $0x14,%esp
    4c0a:	5b                   	pop    %ebx
    4c0b:	5e                   	pop    %esi
    4c0c:	c3                   	ret    

00004c0d <sys_link>:
    4c0d:	57                   	push   %edi
    4c0e:	56                   	push   %esi
    4c0f:	53                   	push   %ebx
    4c10:	83 ec 1c             	sub    $0x1c,%esp
    4c13:	ff 74 24 2c          	pushl  0x2c(%esp)
    4c17:	e8 fc ff ff ff       	call   4c18 <sys_link+0xb>
    4c1c:	83 c4 10             	add    $0x10,%esp
    4c1f:	85 c0                	test   %eax,%eax
    4c21:	0f 84 b5 01 00 00    	je     4ddc <sys_link+0x1cf>
    4c27:	89 c3                	mov    %eax,%ebx
    4c29:	8b 00                	mov    (%eax),%eax
    4c2b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    4c30:	66 3d 00 40          	cmp    $0x4000,%ax
    4c34:	75 16                	jne    4c4c <sys_link+0x3f>
    4c36:	83 ec 0c             	sub    $0xc,%esp
    4c39:	53                   	push   %ebx
    4c3a:	e8 fc ff ff ff       	call   4c3b <sys_link+0x2e>
    4c3f:	83 c4 10             	add    $0x10,%esp
    4c42:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c47:	e9 95 01 00 00       	jmp    4de1 <sys_link+0x1d4>
    4c4c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4c50:	89 e2                	mov    %esp,%edx
    4c52:	8b 44 24 24          	mov    0x24(%esp),%eax
    4c56:	e8 b1 ee ff ff       	call   3b0c <dir_namei>
    4c5b:	89 c6                	mov    %eax,%esi
    4c5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c61:	85 c0                	test   %eax,%eax
    4c63:	75 16                	jne    4c7b <sys_link+0x6e>
    4c65:	83 ec 0c             	sub    $0xc,%esp
    4c68:	53                   	push   %ebx
    4c69:	e8 fc ff ff ff       	call   4c6a <sys_link+0x5d>
    4c6e:	83 c4 10             	add    $0x10,%esp
    4c71:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
    4c76:	e9 66 01 00 00       	jmp    4de1 <sys_link+0x1d4>
    4c7b:	8b 3c 24             	mov    (%esp),%edi
    4c7e:	85 ff                	test   %edi,%edi
    4c80:	75 22                	jne    4ca4 <sys_link+0x97>
    4c82:	83 ec 0c             	sub    $0xc,%esp
    4c85:	53                   	push   %ebx
    4c86:	e8 fc ff ff ff       	call   4c87 <sys_link+0x7a>
    4c8b:	83 c4 04             	add    $0x4,%esp
    4c8e:	ff 74 24 14          	pushl  0x14(%esp)
    4c92:	e8 fc ff ff ff       	call   4c93 <sys_link+0x86>
    4c97:	83 c4 10             	add    $0x10,%esp
    4c9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c9f:	e9 3d 01 00 00       	jmp    4de1 <sys_link+0x1d4>
    4ca4:	8b 43 2c             	mov    0x2c(%ebx),%eax
    4ca7:	66 39 46 2c          	cmp    %ax,0x2c(%esi)
    4cab:	74 1e                	je     4ccb <sys_link+0xbe>
    4cad:	83 ec 0c             	sub    $0xc,%esp
    4cb0:	56                   	push   %esi
    4cb1:	e8 fc ff ff ff       	call   4cb2 <sys_link+0xa5>
    4cb6:	89 1c 24             	mov    %ebx,(%esp)
    4cb9:	e8 fc ff ff ff       	call   4cba <sys_link+0xad>
    4cbe:	83 c4 10             	add    $0x10,%esp
    4cc1:	b8 ee ff ff ff       	mov    $0xffffffee,%eax
    4cc6:	e9 16 01 00 00       	jmp    4de1 <sys_link+0x1d4>
    4ccb:	ba 02 00 00 00       	mov    $0x2,%edx
    4cd0:	89 f0                	mov    %esi,%eax
    4cd2:	e8 12 ec ff ff       	call   38e9 <permission>
    4cd7:	85 c0                	test   %eax,%eax
    4cd9:	75 1e                	jne    4cf9 <sys_link+0xec>
    4cdb:	83 ec 0c             	sub    $0xc,%esp
    4cde:	56                   	push   %esi
    4cdf:	e8 fc ff ff ff       	call   4ce0 <sys_link+0xd3>
    4ce4:	89 1c 24             	mov    %ebx,(%esp)
    4ce7:	e8 fc ff ff ff       	call   4ce8 <sys_link+0xdb>
    4cec:	83 c4 10             	add    $0x10,%esp
    4cef:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
    4cf4:	e9 e8 00 00 00       	jmp    4de1 <sys_link+0x1d4>
    4cf9:	83 ec 0c             	sub    $0xc,%esp
    4cfc:	8d 44 24 18          	lea    0x18(%esp),%eax
    4d00:	50                   	push   %eax
    4d01:	89 f9                	mov    %edi,%ecx
    4d03:	8b 54 24 14          	mov    0x14(%esp),%edx
    4d07:	8d 44 24 18          	lea    0x18(%esp),%eax
    4d0b:	e8 38 ec ff ff       	call   3948 <find_entry>
    4d10:	83 c4 10             	add    $0x10,%esp
    4d13:	85 c0                	test   %eax,%eax
    4d15:	74 2a                	je     4d41 <sys_link+0x134>
    4d17:	83 ec 0c             	sub    $0xc,%esp
    4d1a:	50                   	push   %eax
    4d1b:	e8 fc ff ff ff       	call   4d1c <sys_link+0x10f>
    4d20:	83 c4 04             	add    $0x4,%esp
    4d23:	ff 74 24 14          	pushl  0x14(%esp)
    4d27:	e8 fc ff ff ff       	call   4d28 <sys_link+0x11b>
    4d2c:	89 1c 24             	mov    %ebx,(%esp)
    4d2f:	e8 fc ff ff ff       	call   4d30 <sys_link+0x123>
    4d34:	83 c4 10             	add    $0x10,%esp
    4d37:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    4d3c:	e9 a0 00 00 00       	jmp    4de1 <sys_link+0x1d4>
    4d41:	83 ec 0c             	sub    $0xc,%esp
    4d44:	8d 44 24 18          	lea    0x18(%esp),%eax
    4d48:	50                   	push   %eax
    4d49:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4d4d:	8b 54 24 14          	mov    0x14(%esp),%edx
    4d51:	8b 44 24 18          	mov    0x18(%esp),%eax
    4d55:	e8 88 ef ff ff       	call   3ce2 <add_entry>
    4d5a:	83 c4 10             	add    $0x10,%esp
    4d5d:	85 c0                	test   %eax,%eax
    4d5f:	75 1e                	jne    4d7f <sys_link+0x172>
    4d61:	83 ec 0c             	sub    $0xc,%esp
    4d64:	ff 74 24 14          	pushl  0x14(%esp)
    4d68:	e8 fc ff ff ff       	call   4d69 <sys_link+0x15c>
    4d6d:	89 1c 24             	mov    %ebx,(%esp)
    4d70:	e8 fc ff ff ff       	call   4d71 <sys_link+0x164>
    4d75:	83 c4 10             	add    $0x10,%esp
    4d78:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4d7d:	eb 62                	jmp    4de1 <sys_link+0x1d4>
    4d7f:	66 8b 4b 2e          	mov    0x2e(%ebx),%cx
    4d83:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4d87:	66 89 0a             	mov    %cx,(%edx)
    4d8a:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4d8e:	83 ec 0c             	sub    $0xc,%esp
    4d91:	50                   	push   %eax
    4d92:	e8 fc ff ff ff       	call   4d93 <sys_link+0x186>
    4d97:	83 c4 04             	add    $0x4,%esp
    4d9a:	ff 74 24 14          	pushl  0x14(%esp)
    4d9e:	e8 fc ff ff ff       	call   4d9f <sys_link+0x192>
    4da3:	fe 43 0d             	incb   0xd(%ebx)
    4da6:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4dac:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4db1:	f7 e9                	imul   %ecx
    4db3:	89 d0                	mov    %edx,%eax
    4db5:	c1 f8 05             	sar    $0x5,%eax
    4db8:	c1 f9 1f             	sar    $0x1f,%ecx
    4dbb:	29 c8                	sub    %ecx,%eax
    4dbd:	03 05 00 00 00 00    	add    0x0,%eax
    4dc3:	89 43 28             	mov    %eax,0x28(%ebx)
    4dc6:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4dca:	89 1c 24             	mov    %ebx,(%esp)
    4dcd:	e8 fc ff ff ff       	call   4dce <sys_link+0x1c1>
    4dd2:	83 c4 10             	add    $0x10,%esp
    4dd5:	b8 00 00 00 00       	mov    $0x0,%eax
    4dda:	eb 05                	jmp    4de1 <sys_link+0x1d4>
    4ddc:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4de1:	83 c4 10             	add    $0x10,%esp
    4de4:	5b                   	pop    %ebx
    4de5:	5e                   	pop    %esi
    4de6:	5f                   	pop    %edi
    4de7:	c3                   	ret    

00004de8 <free_block>:
    4de8:	55                   	push   %ebp
    4de9:	57                   	push   %edi
    4dea:	56                   	push   %esi
    4deb:	53                   	push   %ebx
    4dec:	83 ec 18             	sub    $0x18,%esp
    4def:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    4df3:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    4df7:	57                   	push   %edi
    4df8:	e8 fc ff ff ff       	call   4df9 <free_block+0x11>
    4dfd:	89 c6                	mov    %eax,%esi
    4dff:	83 c4 10             	add    $0x10,%esp
    4e02:	85 c0                	test   %eax,%eax
    4e04:	75 10                	jne    4e16 <free_block+0x2e>
    4e06:	83 ec 0c             	sub    $0xc,%esp
    4e09:	68 1c 03 00 00       	push   $0x31c
    4e0e:	e8 fc ff ff ff       	call   4e0f <free_block+0x27>
    4e13:	83 c4 10             	add    $0x10,%esp
    4e16:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4e1a:	39 d8                	cmp    %ebx,%eax
    4e1c:	7f 08                	jg     4e26 <free_block+0x3e>
    4e1e:	0f b7 46 02          	movzwl 0x2(%esi),%eax
    4e22:	39 c3                	cmp    %eax,%ebx
    4e24:	7c 10                	jl     4e36 <free_block+0x4e>
    4e26:	83 ec 0c             	sub    $0xc,%esp
    4e29:	68 48 03 00 00       	push   $0x348
    4e2e:	e8 fc ff ff ff       	call   4e2f <free_block+0x47>
    4e33:	83 c4 10             	add    $0x10,%esp
    4e36:	83 ec 08             	sub    $0x8,%esp
    4e39:	53                   	push   %ebx
    4e3a:	57                   	push   %edi
    4e3b:	e8 fc ff ff ff       	call   4e3c <free_block+0x54>
    4e40:	83 c4 10             	add    $0x10,%esp
    4e43:	85 c0                	test   %eax,%eax
    4e45:	74 31                	je     4e78 <free_block+0x90>
    4e47:	8a 50 0c             	mov    0xc(%eax),%dl
    4e4a:	80 fa 01             	cmp    $0x1,%dl
    4e4d:	74 15                	je     4e64 <free_block+0x7c>
    4e4f:	0f b6 d2             	movzbl %dl,%edx
    4e52:	52                   	push   %edx
    4e53:	53                   	push   %ebx
    4e54:	57                   	push   %edi
    4e55:	68 70 03 00 00       	push   $0x370
    4e5a:	e8 fc ff ff ff       	call   4e5b <free_block+0x73>
    4e5f:	83 c4 10             	add    $0x10,%esp
    4e62:	eb 76                	jmp    4eda <free_block+0xf2>
    4e64:	c6 40 0b 00          	movb   $0x0,0xb(%eax)
    4e68:	c6 40 0a 00          	movb   $0x0,0xa(%eax)
    4e6c:	83 ec 0c             	sub    $0xc,%esp
    4e6f:	50                   	push   %eax
    4e70:	e8 fc ff ff ff       	call   4e71 <free_block+0x89>
    4e75:	83 c4 10             	add    $0x10,%esp
    4e78:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4e7c:	48                   	dec    %eax
    4e7d:	29 c3                	sub    %eax,%ebx
    4e7f:	89 d8                	mov    %ebx,%eax
    4e81:	85 db                	test   %ebx,%ebx
    4e83:	79 06                	jns    4e8b <free_block+0xa3>
    4e85:	8d 83 ff 1f 00 00    	lea    0x1fff(%ebx),%eax
    4e8b:	c1 f8 0d             	sar    $0xd,%eax
    4e8e:	8d 2c 86             	lea    (%esi,%eax,4),%ebp
    4e91:	89 da                	mov    %ebx,%edx
    4e93:	81 e2 ff 1f 00 00    	and    $0x1fff,%edx
    4e99:	8b 45 34             	mov    0x34(%ebp),%eax
    4e9c:	8b 08                	mov    (%eax),%ecx
    4e9e:	b8 00 00 00 00       	mov    $0x0,%eax
    4ea3:	0f b3 11             	btr    %edx,(%ecx)
    4ea6:	0f 93 c0             	setae  %al
    4ea9:	85 c0                	test   %eax,%eax
    4eab:	74 26                	je     4ed3 <free_block+0xeb>
    4ead:	83 ec 04             	sub    $0x4,%esp
    4eb0:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4eb4:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
    4eb8:	50                   	push   %eax
    4eb9:	57                   	push   %edi
    4eba:	68 87 02 00 00       	push   $0x287
    4ebf:	e8 fc ff ff ff       	call   4ec0 <free_block+0xd8>
    4ec4:	c7 04 24 9c 03 00 00 	movl   $0x39c,(%esp)
    4ecb:	e8 fc ff ff ff       	call   4ecc <free_block+0xe4>
    4ed0:	83 c4 10             	add    $0x10,%esp
    4ed3:	8b 45 34             	mov    0x34(%ebp),%eax
    4ed6:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4eda:	83 c4 0c             	add    $0xc,%esp
    4edd:	5b                   	pop    %ebx
    4ede:	5e                   	pop    %esi
    4edf:	5f                   	pop    %edi
    4ee0:	5d                   	pop    %ebp
    4ee1:	c3                   	ret    

00004ee2 <new_block>:
    4ee2:	55                   	push   %ebp
    4ee3:	57                   	push   %edi
    4ee4:	56                   	push   %esi
    4ee5:	53                   	push   %ebx
    4ee6:	83 ec 28             	sub    $0x28,%esp
    4ee9:	ff 74 24 3c          	pushl  0x3c(%esp)
    4eed:	e8 fc ff ff ff       	call   4eee <new_block+0xc>
    4ef2:	89 c5                	mov    %eax,%ebp
    4ef4:	83 c4 10             	add    $0x10,%esp
    4ef7:	85 c0                	test   %eax,%eax
    4ef9:	75 10                	jne    4f0b <new_block+0x29>
    4efb:	83 ec 0c             	sub    $0xc,%esp
    4efe:	68 bc 03 00 00       	push   $0x3bc
    4f03:	e8 fc ff ff ff       	call   4f04 <new_block+0x22>
    4f08:	83 c4 10             	add    $0x10,%esp
    4f0b:	bb 00 00 00 00       	mov    $0x0,%ebx
    4f10:	8b 7c 9d 34          	mov    0x34(%ebp,%ebx,4),%edi
    4f14:	85 ff                	test   %edi,%edi
    4f16:	74 30                	je     4f48 <new_block+0x66>
    4f18:	8b 37                	mov    (%edi),%esi
    4f1a:	b9 00 00 00 00       	mov    $0x0,%ecx
    4f1f:	fc                   	cld    
    4f20:	56                   	push   %esi
    4f21:	ad                   	lods   %ds:(%esi),%eax
    4f22:	f7 d0                	not    %eax
    4f24:	0f bc d0             	bsf    %eax,%edx
    4f27:	74 05                	je     4f2e <new_block+0x4c>
    4f29:	01 d1                	add    %edx,%ecx
    4f2b:	5e                   	pop    %esi
    4f2c:	eb 0e                	jmp    4f3c <new_block+0x5a>
    4f2e:	83 c1 20             	add    $0x20,%ecx
    4f31:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
    4f37:	7c e8                	jl     4f21 <new_block+0x3f>
    4f39:	83 c4 04             	add    $0x4,%esp
    4f3c:	81 f9 ff 1f 00 00    	cmp    $0x1fff,%ecx
    4f42:	0f 8e c1 00 00 00    	jle    5009 <new_block+0x127>
    4f48:	43                   	inc    %ebx
    4f49:	83 fb 08             	cmp    $0x8,%ebx
    4f4c:	75 c2                	jne    4f10 <new_block+0x2e>
    4f4e:	b8 00 00 00 00       	mov    $0x0,%eax
    4f53:	e9 c0 00 00 00       	jmp    5018 <new_block+0x136>
    4f58:	b8 00 00 00 00       	mov    $0x0,%eax
    4f5d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4f61:	0f ab 16             	bts    %edx,(%esi)
    4f64:	0f 92 c0             	setb   %al
    4f67:	85 c0                	test   %eax,%eax
    4f69:	74 10                	je     4f7b <new_block+0x99>
    4f6b:	83 ec 0c             	sub    $0xc,%esp
    4f6e:	68 98 02 00 00       	push   $0x298
    4f73:	e8 fc ff ff ff       	call   4f74 <new_block+0x92>
    4f78:	83 c4 10             	add    $0x10,%esp
    4f7b:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
    4f7f:	c1 e3 0d             	shl    $0xd,%ebx
    4f82:	0f b7 45 08          	movzwl 0x8(%ebp),%eax
    4f86:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
    4f8a:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    4f8e:	01 c3                	add    %eax,%ebx
    4f90:	0f b7 45 02          	movzwl 0x2(%ebp),%eax
    4f94:	39 c3                	cmp    %eax,%ebx
    4f96:	7d 63                	jge    4ffb <new_block+0x119>
    4f98:	83 ec 08             	sub    $0x8,%esp
    4f9b:	53                   	push   %ebx
    4f9c:	ff 74 24 3c          	pushl  0x3c(%esp)
    4fa0:	e8 fc ff ff ff       	call   4fa1 <new_block+0xbf>
    4fa5:	89 c6                	mov    %eax,%esi
    4fa7:	83 c4 10             	add    $0x10,%esp
    4faa:	85 c0                	test   %eax,%eax
    4fac:	75 10                	jne    4fbe <new_block+0xdc>
    4fae:	83 ec 0c             	sub    $0xc,%esp
    4fb1:	68 b3 02 00 00       	push   $0x2b3
    4fb6:	e8 fc ff ff ff       	call   4fb7 <new_block+0xd5>
    4fbb:	83 c4 10             	add    $0x10,%esp
    4fbe:	80 7e 0c 01          	cmpb   $0x1,0xc(%esi)
    4fc2:	74 10                	je     4fd4 <new_block+0xf2>
    4fc4:	83 ec 0c             	sub    $0xc,%esp
    4fc7:	68 cf 02 00 00       	push   $0x2cf
    4fcc:	e8 fc ff ff ff       	call   4fcd <new_block+0xeb>
    4fd1:	83 c4 10             	add    $0x10,%esp
    4fd4:	8b 3e                	mov    (%esi),%edi
    4fd6:	b9 00 01 00 00       	mov    $0x100,%ecx
    4fdb:	b8 00 00 00 00       	mov    $0x0,%eax
    4fe0:	fc                   	cld    
    4fe1:	f3 ab                	rep stos %eax,%es:(%edi)
    4fe3:	c6 46 0a 01          	movb   $0x1,0xa(%esi)
    4fe7:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4feb:	83 ec 0c             	sub    $0xc,%esp
    4fee:	56                   	push   %esi
    4fef:	e8 fc ff ff ff       	call   4ff0 <new_block+0x10e>
    4ff4:	83 c4 10             	add    $0x10,%esp
    4ff7:	89 d8                	mov    %ebx,%eax
    4ff9:	eb 1d                	jmp    5018 <new_block+0x136>
    4ffb:	b8 00 00 00 00       	mov    $0x0,%eax
    5000:	eb 16                	jmp    5018 <new_block+0x136>
    5002:	b8 00 00 00 00       	mov    $0x0,%eax
    5007:	eb 0f                	jmp    5018 <new_block+0x136>
    5009:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    500d:	83 fb 07             	cmp    $0x7,%ebx
    5010:	0f 8e 42 ff ff ff    	jle    4f58 <new_block+0x76>
    5016:	eb ea                	jmp    5002 <new_block+0x120>
    5018:	83 c4 1c             	add    $0x1c,%esp
    501b:	5b                   	pop    %ebx
    501c:	5e                   	pop    %esi
    501d:	5f                   	pop    %edi
    501e:	5d                   	pop    %ebp
    501f:	c3                   	ret    

00005020 <free_inode>:
    5020:	57                   	push   %edi
    5021:	53                   	push   %ebx
    5022:	83 ec 04             	sub    $0x4,%esp
    5025:	8b 7c 24 10          	mov    0x10(%esp),%edi
    5029:	85 ff                	test   %edi,%edi
    502b:	0f 84 f9 00 00 00    	je     512a <free_inode+0x10a>
    5031:	66 83 7f 2c 00       	cmpw   $0x0,0x2c(%edi)
    5036:	75 11                	jne    5049 <free_inode+0x29>
    5038:	b9 38 00 00 00       	mov    $0x38,%ecx
    503d:	b0 00                	mov    $0x0,%al
    503f:	fc                   	cld    
    5040:	57                   	push   %edi
    5041:	f3 aa                	rep stos %al,%es:(%edi)
    5043:	5f                   	pop    %edi
    5044:	e9 e1 00 00 00       	jmp    512a <free_inode+0x10a>
    5049:	8b 47 30             	mov    0x30(%edi),%eax
    504c:	66 83 f8 01          	cmp    $0x1,%ax
    5050:	76 20                	jbe    5072 <free_inode+0x52>
    5052:	83 ec 08             	sub    $0x8,%esp
    5055:	0f b7 c0             	movzwl %ax,%eax
    5058:	50                   	push   %eax
    5059:	68 ec 03 00 00       	push   $0x3ec
    505e:	e8 fc ff ff ff       	call   505f <free_inode+0x3f>
    5063:	c7 04 24 e8 02 00 00 	movl   $0x2e8,(%esp)
    506a:	e8 fc ff ff ff       	call   506b <free_inode+0x4b>
    506f:	83 c4 10             	add    $0x10,%esp
    5072:	80 7f 0d 00          	cmpb   $0x0,0xd(%edi)
    5076:	74 10                	je     5088 <free_inode+0x68>
    5078:	83 ec 0c             	sub    $0xc,%esp
    507b:	68 10 04 00 00       	push   $0x410
    5080:	e8 fc ff ff ff       	call   5081 <free_inode+0x61>
    5085:	83 c4 10             	add    $0x10,%esp
    5088:	83 ec 0c             	sub    $0xc,%esp
    508b:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    508f:	50                   	push   %eax
    5090:	e8 fc ff ff ff       	call   5091 <free_inode+0x71>
    5095:	89 c3                	mov    %eax,%ebx
    5097:	83 c4 10             	add    $0x10,%esp
    509a:	85 c0                	test   %eax,%eax
    509c:	75 10                	jne    50ae <free_inode+0x8e>
    509e:	83 ec 0c             	sub    $0xc,%esp
    50a1:	68 30 04 00 00       	push   $0x430
    50a6:	e8 fc ff ff ff       	call   50a7 <free_inode+0x87>
    50ab:	83 c4 10             	add    $0x10,%esp
    50ae:	66 8b 47 2e          	mov    0x2e(%edi),%ax
    50b2:	66 85 c0             	test   %ax,%ax
    50b5:	74 05                	je     50bc <free_inode+0x9c>
    50b7:	66 3b 03             	cmp    (%ebx),%ax
    50ba:	76 10                	jbe    50cc <free_inode+0xac>
    50bc:	83 ec 0c             	sub    $0xc,%esp
    50bf:	68 5c 04 00 00       	push   $0x45c
    50c4:	e8 fc ff ff ff       	call   50c5 <free_inode+0xa5>
    50c9:	83 c4 10             	add    $0x10,%esp
    50cc:	66 8b 47 2e          	mov    0x2e(%edi),%ax
    50d0:	66 c1 e8 0d          	shr    $0xd,%ax
    50d4:	0f b7 c0             	movzwl %ax,%eax
    50d7:	8b 5c 83 14          	mov    0x14(%ebx,%eax,4),%ebx
    50db:	85 db                	test   %ebx,%ebx
    50dd:	75 10                	jne    50ef <free_inode+0xcf>
    50df:	83 ec 0c             	sub    $0xc,%esp
    50e2:	68 88 04 00 00       	push   $0x488
    50e7:	e8 fc ff ff ff       	call   50e8 <free_inode+0xc8>
    50ec:	83 c4 10             	add    $0x10,%esp
    50ef:	66 8b 57 2e          	mov    0x2e(%edi),%dx
    50f3:	81 e2 ff 1f 00 00    	and    $0x1fff,%edx
    50f9:	8b 0b                	mov    (%ebx),%ecx
    50fb:	b8 00 00 00 00       	mov    $0x0,%eax
    5100:	0f b3 11             	btr    %edx,(%ecx)
    5103:	0f 93 c0             	setae  %al
    5106:	85 c0                	test   %eax,%eax
    5108:	74 10                	je     511a <free_inode+0xfa>
    510a:	83 ec 0c             	sub    $0xc,%esp
    510d:	68 a8 04 00 00       	push   $0x4a8
    5112:	e8 fc ff ff ff       	call   5113 <free_inode+0xf3>
    5117:	83 c4 10             	add    $0x10,%esp
    511a:	c6 43 0b 01          	movb   $0x1,0xb(%ebx)
    511e:	b9 38 00 00 00       	mov    $0x38,%ecx
    5123:	b0 00                	mov    $0x0,%al
    5125:	fc                   	cld    
    5126:	57                   	push   %edi
    5127:	f3 aa                	rep stos %al,%es:(%edi)
    5129:	5f                   	pop    %edi
    512a:	83 c4 04             	add    $0x4,%esp
    512d:	5b                   	pop    %ebx
    512e:	5f                   	pop    %edi
    512f:	c3                   	ret    

00005130 <new_inode>:
    5130:	55                   	push   %ebp
    5131:	57                   	push   %edi
    5132:	56                   	push   %esi
    5133:	53                   	push   %ebx
    5134:	83 ec 1c             	sub    $0x1c,%esp
    5137:	e8 fc ff ff ff       	call   5138 <new_inode+0x8>
    513c:	85 c0                	test   %eax,%eax
    513e:	0f 84 41 01 00 00    	je     5285 <new_inode+0x155>
    5144:	89 c5                	mov    %eax,%ebp
    5146:	83 ec 0c             	sub    $0xc,%esp
    5149:	ff 74 24 3c          	pushl  0x3c(%esp)
    514d:	e8 fc ff ff ff       	call   514e <new_inode+0x1e>
    5152:	89 44 24 18          	mov    %eax,0x18(%esp)
    5156:	83 c4 10             	add    $0x10,%esp
    5159:	85 c0                	test   %eax,%eax
    515b:	75 10                	jne    516d <new_inode+0x3d>
    515d:	83 ec 0c             	sub    $0xc,%esp
    5160:	68 f3 02 00 00       	push   $0x2f3
    5165:	e8 fc ff ff ff       	call   5166 <new_inode+0x36>
    516a:	83 c4 10             	add    $0x10,%esp
    516d:	be 00 20 00 00       	mov    $0x2000,%esi
    5172:	bb 00 00 00 00       	mov    $0x0,%ebx
    5177:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    517b:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    517f:	8b 7c 9d 14          	mov    0x14(%ebp,%ebx,4),%edi
    5183:	85 ff                	test   %edi,%edi
    5185:	74 2e                	je     51b5 <new_inode+0x85>
    5187:	8b 37                	mov    (%edi),%esi
    5189:	b9 00 00 00 00       	mov    $0x0,%ecx
    518e:	fc                   	cld    
    518f:	56                   	push   %esi
    5190:	ad                   	lods   %ds:(%esi),%eax
    5191:	f7 d0                	not    %eax
    5193:	0f bc d0             	bsf    %eax,%edx
    5196:	74 05                	je     519d <new_inode+0x6d>
    5198:	01 d1                	add    %edx,%ecx
    519a:	5e                   	pop    %esi
    519b:	eb 0e                	jmp    51ab <new_inode+0x7b>
    519d:	83 c1 20             	add    $0x20,%ecx
    51a0:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
    51a6:	7c e8                	jl     5190 <new_inode+0x60>
    51a8:	83 c4 04             	add    $0x4,%esp
    51ab:	89 ce                	mov    %ecx,%esi
    51ad:	81 f9 ff 1f 00 00    	cmp    $0x1fff,%ecx
    51b3:	7e 18                	jle    51cd <new_inode+0x9d>
    51b5:	43                   	inc    %ebx
    51b6:	83 fb 08             	cmp    $0x8,%ebx
    51b9:	75 c4                	jne    517f <new_inode+0x4f>
    51bb:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    51bf:	85 ff                	test   %edi,%edi
    51c1:	74 20                	je     51e3 <new_inode+0xb3>
    51c3:	81 fe ff 1f 00 00    	cmp    $0x1fff,%esi
    51c9:	7f 18                	jg     51e3 <new_inode+0xb3>
    51cb:	eb 04                	jmp    51d1 <new_inode+0xa1>
    51cd:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    51d1:	89 d8                	mov    %ebx,%eax
    51d3:	c1 e0 0d             	shl    $0xd,%eax
    51d6:	01 f0                	add    %esi,%eax
    51d8:	8b 54 24 08          	mov    0x8(%esp),%edx
    51dc:	0f b7 12             	movzwl (%edx),%edx
    51df:	39 d0                	cmp    %edx,%eax
    51e1:	7e 16                	jle    51f9 <new_inode+0xc9>
    51e3:	83 ec 0c             	sub    $0xc,%esp
    51e6:	55                   	push   %ebp
    51e7:	e8 fc ff ff ff       	call   51e8 <new_inode+0xb8>
    51ec:	83 c4 10             	add    $0x10,%esp
    51ef:	b8 00 00 00 00       	mov    $0x0,%eax
    51f4:	e9 91 00 00 00       	jmp    528a <new_inode+0x15a>
    51f9:	8b 17                	mov    (%edi),%edx
    51fb:	b8 00 00 00 00       	mov    $0x0,%eax
    5200:	0f ab 32             	bts    %esi,(%edx)
    5203:	0f 92 c0             	setb   %al
    5206:	85 c0                	test   %eax,%eax
    5208:	74 10                	je     521a <new_inode+0xea>
    520a:	83 ec 0c             	sub    $0xc,%esp
    520d:	68 11 03 00 00       	push   $0x311
    5212:	e8 fc ff ff ff       	call   5213 <new_inode+0xe3>
    5217:	83 c4 10             	add    $0x10,%esp
    521a:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
    521e:	66 c7 45 30 01 00    	movw   $0x1,0x30(%ebp)
    5224:	c6 45 0d 01          	movb   $0x1,0xd(%ebp)
    5228:	8b 44 24 30          	mov    0x30(%esp),%eax
    522c:	66 89 45 2c          	mov    %ax,0x2c(%ebp)
    5230:	a1 00 00 00 00       	mov    0x0,%eax
    5235:	66 8b 80 42 02 00 00 	mov    0x242(%eax),%ax
    523c:	66 89 45 02          	mov    %ax,0x2(%ebp)
    5240:	a1 00 00 00 00       	mov    0x0,%eax
    5245:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
    524b:	88 45 0c             	mov    %al,0xc(%ebp)
    524e:	c6 45 33 01          	movb   $0x1,0x33(%ebp)
    5252:	c1 e3 0d             	shl    $0xd,%ebx
    5255:	01 f3                	add    %esi,%ebx
    5257:	66 89 5d 2e          	mov    %bx,0x2e(%ebp)
    525b:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    5261:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    5266:	f7 e9                	imul   %ecx
    5268:	89 d0                	mov    %edx,%eax
    526a:	c1 f8 05             	sar    $0x5,%eax
    526d:	c1 f9 1f             	sar    $0x1f,%ecx
    5270:	29 c8                	sub    %ecx,%eax
    5272:	03 05 00 00 00 00    	add    0x0,%eax
    5278:	89 45 28             	mov    %eax,0x28(%ebp)
    527b:	89 45 24             	mov    %eax,0x24(%ebp)
    527e:	89 45 08             	mov    %eax,0x8(%ebp)
    5281:	89 e8                	mov    %ebp,%eax
    5283:	eb 05                	jmp    528a <new_inode+0x15a>
    5285:	b8 00 00 00 00       	mov    $0x0,%eax
    528a:	83 c4 1c             	add    $0x1c,%esp
    528d:	5b                   	pop    %ebx
    528e:	5e                   	pop    %esi
    528f:	5f                   	pop    %edi
    5290:	5d                   	pop    %ebp
    5291:	c3                   	ret    

00005292 <dupfd>:
    5292:	83 f8 13             	cmp    $0x13,%eax
    5295:	77 3b                	ja     52d2 <dupfd+0x40>
    5297:	56                   	push   %esi
    5298:	53                   	push   %ebx
    5299:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    529f:	8b 84 83 80 02 00 00 	mov    0x280(%ebx,%eax,4),%eax
    52a6:	85 c0                	test   %eax,%eax
    52a8:	74 2e                	je     52d8 <dupfd+0x46>
    52aa:	83 fa 13             	cmp    $0x13,%edx
    52ad:	77 30                	ja     52df <dupfd+0x4d>
    52af:	83 bc 93 80 02 00 00 	cmpl   $0x0,0x280(%ebx,%edx,4)
    52b6:	00 
    52b7:	75 0c                	jne    52c5 <dupfd+0x33>
    52b9:	eb 2b                	jmp    52e6 <dupfd+0x54>
    52bb:	83 bc 93 80 02 00 00 	cmpl   $0x0,0x280(%ebx,%edx,4)
    52c2:	00 
    52c3:	74 21                	je     52e6 <dupfd+0x54>
    52c5:	42                   	inc    %edx
    52c6:	83 fa 14             	cmp    $0x14,%edx
    52c9:	75 f0                	jne    52bb <dupfd+0x29>
    52cb:	b8 e8 ff ff ff       	mov    $0xffffffe8,%eax
    52d0:	eb 30                	jmp    5302 <dupfd+0x70>
    52d2:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    52d7:	c3                   	ret    
    52d8:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    52dd:	eb 23                	jmp    5302 <dupfd+0x70>
    52df:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    52e4:	eb 1c                	jmp    5302 <dupfd+0x70>
    52e6:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    52eb:	88 d1                	mov    %dl,%cl
    52ed:	d3 c6                	rol    %cl,%esi
    52ef:	21 b3 7c 02 00 00    	and    %esi,0x27c(%ebx)
    52f5:	89 84 93 80 02 00 00 	mov    %eax,0x280(%ebx,%edx,4)
    52fc:	66 ff 40 04          	incw   0x4(%eax)
    5300:	89 d0                	mov    %edx,%eax
    5302:	5b                   	pop    %ebx
    5303:	5e                   	pop    %esi
    5304:	c3                   	ret    

00005305 <sys_dup2>:
    5305:	53                   	push   %ebx
    5306:	83 ec 14             	sub    $0x14,%esp
    5309:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    530d:	53                   	push   %ebx
    530e:	e8 fc ff ff ff       	call   530f <sys_dup2+0xa>
    5313:	89 da                	mov    %ebx,%edx
    5315:	8b 44 24 20          	mov    0x20(%esp),%eax
    5319:	e8 74 ff ff ff       	call   5292 <dupfd>
    531e:	83 c4 18             	add    $0x18,%esp
    5321:	5b                   	pop    %ebx
    5322:	c3                   	ret    

00005323 <sys_dup>:
    5323:	ba 00 00 00 00       	mov    $0x0,%edx
    5328:	8b 44 24 04          	mov    0x4(%esp),%eax
    532c:	e8 61 ff ff ff       	call   5292 <dupfd>
    5331:	c3                   	ret    

00005332 <sys_fcntl>:
    5332:	53                   	push   %ebx
    5333:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    5337:	8b 44 24 0c          	mov    0xc(%esp),%eax
    533b:	83 f9 13             	cmp    $0x13,%ecx
    533e:	0f 87 91 00 00 00    	ja     53d5 <sys_fcntl+0xa3>
    5344:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    534a:	8b 94 8b 80 02 00 00 	mov    0x280(%ebx,%ecx,4),%edx
    5351:	85 d2                	test   %edx,%edx
    5353:	0f 84 83 00 00 00    	je     53dc <sys_fcntl+0xaa>
    5359:	83 f8 04             	cmp    $0x4,%eax
    535c:	0f 87 81 00 00 00    	ja     53e3 <sys_fcntl+0xb1>
    5362:	ff 24 85 20 00 00 00 	jmp    *0x20(,%eax,4)
    5369:	8b 54 24 10          	mov    0x10(%esp),%edx
    536d:	89 c8                	mov    %ecx,%eax
    536f:	e8 1e ff ff ff       	call   5292 <dupfd>
    5374:	eb 72                	jmp    53e8 <sys_fcntl+0xb6>
    5376:	8b 83 7c 02 00 00    	mov    0x27c(%ebx),%eax
    537c:	d3 e8                	shr    %cl,%eax
    537e:	83 e0 01             	and    $0x1,%eax
    5381:	eb 65                	jmp    53e8 <sys_fcntl+0xb6>
    5383:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
    5388:	74 14                	je     539e <sys_fcntl+0x6c>
    538a:	b8 01 00 00 00       	mov    $0x1,%eax
    538f:	d3 e0                	shl    %cl,%eax
    5391:	09 83 7c 02 00 00    	or     %eax,0x27c(%ebx)
    5397:	b8 00 00 00 00       	mov    $0x0,%eax
    539c:	eb 4a                	jmp    53e8 <sys_fcntl+0xb6>
    539e:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    53a3:	d3 c0                	rol    %cl,%eax
    53a5:	21 83 7c 02 00 00    	and    %eax,0x27c(%ebx)
    53ab:	b8 00 00 00 00       	mov    $0x0,%eax
    53b0:	eb 36                	jmp    53e8 <sys_fcntl+0xb6>
    53b2:	0f b7 42 02          	movzwl 0x2(%edx),%eax
    53b6:	eb 30                	jmp    53e8 <sys_fcntl+0xb6>
    53b8:	66 8b 4a 02          	mov    0x2(%edx),%cx
    53bc:	80 e5 f3             	and    $0xf3,%ch
    53bf:	8b 44 24 10          	mov    0x10(%esp),%eax
    53c3:	25 00 0c 00 00       	and    $0xc00,%eax
    53c8:	09 c8                	or     %ecx,%eax
    53ca:	66 89 42 02          	mov    %ax,0x2(%edx)
    53ce:	b8 00 00 00 00       	mov    $0x0,%eax
    53d3:	eb 13                	jmp    53e8 <sys_fcntl+0xb6>
    53d5:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    53da:	eb 0c                	jmp    53e8 <sys_fcntl+0xb6>
    53dc:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    53e1:	eb 05                	jmp    53e8 <sys_fcntl+0xb6>
    53e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    53e8:	5b                   	pop    %ebx
    53e9:	c3                   	ret    

000053ea <sys_ioctl>:
    53ea:	83 ec 0c             	sub    $0xc,%esp
    53ed:	8b 44 24 10          	mov    0x10(%esp),%eax
    53f1:	83 f8 13             	cmp    $0x13,%eax
    53f4:	77 4d                	ja     5443 <sys_ioctl+0x59>
    53f6:	8b 15 00 00 00 00    	mov    0x0,%edx
    53fc:	8b 84 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%eax
    5403:	85 c0                	test   %eax,%eax
    5405:	74 43                	je     544a <sys_ioctl+0x60>
    5407:	8b 50 08             	mov    0x8(%eax),%edx
    540a:	8b 02                	mov    (%edx),%eax
    540c:	25 00 b0 ff ff       	and    $0xffffb000,%eax
    5411:	66 3d 00 20          	cmp    $0x2000,%ax
    5415:	75 3a                	jne    5451 <sys_ioctl+0x67>
    5417:	0f b7 52 0e          	movzwl 0xe(%edx),%edx
    541b:	89 d0                	mov    %edx,%eax
    541d:	c1 e8 08             	shr    $0x8,%eax
    5420:	83 f8 07             	cmp    $0x7,%eax
    5423:	77 33                	ja     5458 <sys_ioctl+0x6e>
    5425:	8b 04 85 40 00 00 00 	mov    0x40(,%eax,4),%eax
    542c:	85 c0                	test   %eax,%eax
    542e:	74 2f                	je     545f <sys_ioctl+0x75>
    5430:	83 ec 04             	sub    $0x4,%esp
    5433:	ff 74 24 1c          	pushl  0x1c(%esp)
    5437:	ff 74 24 1c          	pushl  0x1c(%esp)
    543b:	52                   	push   %edx
    543c:	ff d0                	call   *%eax
    543e:	83 c4 10             	add    $0x10,%esp
    5441:	eb 21                	jmp    5464 <sys_ioctl+0x7a>
    5443:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    5448:	eb 1a                	jmp    5464 <sys_ioctl+0x7a>
    544a:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    544f:	eb 13                	jmp    5464 <sys_ioctl+0x7a>
    5451:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    5456:	eb 0c                	jmp    5464 <sys_ioctl+0x7a>
    5458:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
    545d:	eb 05                	jmp    5464 <sys_ioctl+0x7a>
    545f:	b8 e7 ff ff ff       	mov    $0xffffffe7,%eax
    5464:	83 c4 0c             	add    $0xc,%esp
    5467:	c3                   	ret    

00005468 <free_ind>:
    5468:	85 d2                	test   %edx,%edx
    546a:	74 67                	je     54d3 <free_ind+0x6b>
    546c:	55                   	push   %ebp
    546d:	57                   	push   %edi
    546e:	56                   	push   %esi
    546f:	53                   	push   %ebx
    5470:	83 ec 24             	sub    $0x24,%esp
    5473:	89 54 24 14          	mov    %edx,0x14(%esp)
    5477:	89 c7                	mov    %eax,%edi
    5479:	ff 74 24 14          	pushl  0x14(%esp)
    547d:	50                   	push   %eax
    547e:	e8 fc ff ff ff       	call   547f <free_ind+0x17>
    5483:	89 c5                	mov    %eax,%ebp
    5485:	83 c4 10             	add    $0x10,%esp
    5488:	85 c0                	test   %eax,%eax
    548a:	74 33                	je     54bf <free_ind+0x57>
    548c:	8b 18                	mov    (%eax),%ebx
    548e:	8d b3 00 04 00 00    	lea    0x400(%ebx),%esi
    5494:	66 8b 03             	mov    (%ebx),%ax
    5497:	66 85 c0             	test   %ax,%ax
    549a:	74 10                	je     54ac <free_ind+0x44>
    549c:	83 ec 08             	sub    $0x8,%esp
    549f:	0f b7 c0             	movzwl %ax,%eax
    54a2:	50                   	push   %eax
    54a3:	57                   	push   %edi
    54a4:	e8 fc ff ff ff       	call   54a5 <free_ind+0x3d>
    54a9:	83 c4 10             	add    $0x10,%esp
    54ac:	83 c3 02             	add    $0x2,%ebx
    54af:	39 de                	cmp    %ebx,%esi
    54b1:	75 e1                	jne    5494 <free_ind+0x2c>
    54b3:	83 ec 0c             	sub    $0xc,%esp
    54b6:	55                   	push   %ebp
    54b7:	e8 fc ff ff ff       	call   54b8 <free_ind+0x50>
    54bc:	83 c4 10             	add    $0x10,%esp
    54bf:	83 ec 08             	sub    $0x8,%esp
    54c2:	ff 74 24 14          	pushl  0x14(%esp)
    54c6:	57                   	push   %edi
    54c7:	e8 fc ff ff ff       	call   54c8 <free_ind+0x60>
    54cc:	83 c4 2c             	add    $0x2c,%esp
    54cf:	5b                   	pop    %ebx
    54d0:	5e                   	pop    %esi
    54d1:	5f                   	pop    %edi
    54d2:	5d                   	pop    %ebp
    54d3:	c3                   	ret    

000054d4 <truncate>:
    54d4:	55                   	push   %ebp
    54d5:	57                   	push   %edi
    54d6:	56                   	push   %esi
    54d7:	53                   	push   %ebx
    54d8:	83 ec 1c             	sub    $0x1c,%esp
    54db:	8b 7c 24 30          	mov    0x30(%esp),%edi
    54df:	8b 07                	mov    (%edi),%eax
    54e1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    54e6:	66 3d 00 80          	cmp    $0x8000,%ax
    54ea:	75 08                	jne    54f4 <truncate+0x20>
    54ec:	8d 5f 0e             	lea    0xe(%edi),%ebx
    54ef:	8d 77 1c             	lea    0x1c(%edi),%esi
    54f2:	eb 0c                	jmp    5500 <truncate+0x2c>
    54f4:	66 3d 00 40          	cmp    $0x4000,%ax
    54f8:	0f 85 d9 00 00 00    	jne    55d7 <truncate+0x103>
    54fe:	eb ec                	jmp    54ec <truncate+0x18>
    5500:	66 8b 03             	mov    (%ebx),%ax
    5503:	66 85 c0             	test   %ax,%ax
    5506:	74 19                	je     5521 <truncate+0x4d>
    5508:	83 ec 08             	sub    $0x8,%esp
    550b:	0f b7 c0             	movzwl %ax,%eax
    550e:	50                   	push   %eax
    550f:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    5513:	50                   	push   %eax
    5514:	e8 fc ff ff ff       	call   5515 <truncate+0x41>
    5519:	66 c7 03 00 00       	movw   $0x0,(%ebx)
    551e:	83 c4 10             	add    $0x10,%esp
    5521:	83 c3 02             	add    $0x2,%ebx
    5524:	39 de                	cmp    %ebx,%esi
    5526:	75 d8                	jne    5500 <truncate+0x2c>
    5528:	0f b7 57 1c          	movzwl 0x1c(%edi),%edx
    552c:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    5530:	e8 33 ff ff ff       	call   5468 <free_ind>
    5535:	0f b7 47 1e          	movzwl 0x1e(%edi),%eax
    5539:	89 44 24 08          	mov    %eax,0x8(%esp)
    553d:	85 c0                	test   %eax,%eax
    553f:	74 5c                	je     559d <truncate+0xc9>
    5541:	0f b7 6f 2c          	movzwl 0x2c(%edi),%ebp
    5545:	83 ec 08             	sub    $0x8,%esp
    5548:	ff 74 24 10          	pushl  0x10(%esp)
    554c:	55                   	push   %ebp
    554d:	e8 fc ff ff ff       	call   554e <truncate+0x7a>
    5552:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    5556:	83 c4 10             	add    $0x10,%esp
    5559:	85 c0                	test   %eax,%eax
    555b:	74 30                	je     558d <truncate+0xb9>
    555d:	8b 18                	mov    (%eax),%ebx
    555f:	8d b3 00 04 00 00    	lea    0x400(%ebx),%esi
    5565:	66 8b 13             	mov    (%ebx),%dx
    5568:	66 85 d2             	test   %dx,%dx
    556b:	74 0a                	je     5577 <truncate+0xa3>
    556d:	0f b7 d2             	movzwl %dx,%edx
    5570:	89 e8                	mov    %ebp,%eax
    5572:	e8 f1 fe ff ff       	call   5468 <free_ind>
    5577:	83 c3 02             	add    $0x2,%ebx
    557a:	39 de                	cmp    %ebx,%esi
    557c:	75 e7                	jne    5565 <truncate+0x91>
    557e:	83 ec 0c             	sub    $0xc,%esp
    5581:	ff 74 24 18          	pushl  0x18(%esp)
    5585:	e8 fc ff ff ff       	call   5586 <truncate+0xb2>
    558a:	83 c4 10             	add    $0x10,%esp
    558d:	83 ec 08             	sub    $0x8,%esp
    5590:	ff 74 24 10          	pushl  0x10(%esp)
    5594:	55                   	push   %ebp
    5595:	e8 fc ff ff ff       	call   5596 <truncate+0xc2>
    559a:	83 c4 10             	add    $0x10,%esp
    559d:	66 c7 47 1e 00 00    	movw   $0x0,0x1e(%edi)
    55a3:	66 c7 47 1c 00 00    	movw   $0x0,0x1c(%edi)
    55a9:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
    55b0:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    55b4:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    55ba:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    55bf:	f7 e9                	imul   %ecx
    55c1:	89 d0                	mov    %edx,%eax
    55c3:	c1 f8 05             	sar    $0x5,%eax
    55c6:	c1 f9 1f             	sar    $0x1f,%ecx
    55c9:	29 c8                	sub    %ecx,%eax
    55cb:	03 05 00 00 00 00    	add    0x0,%eax
    55d1:	89 47 28             	mov    %eax,0x28(%edi)
    55d4:	89 47 08             	mov    %eax,0x8(%edi)
    55d7:	83 c4 1c             	add    $0x1c,%esp
    55da:	5b                   	pop    %ebx
    55db:	5e                   	pop    %esi
    55dc:	5f                   	pop    %edi
    55dd:	5d                   	pop    %ebp
    55de:	c3                   	ret    
