
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
     2bb:	83 ec 3c             	sub    $0x3c,%esp
     2be:	8b 74 24 50          	mov    0x50(%esp),%esi
     2c2:	8b 6c 24 54          	mov    0x54(%esp),%ebp
     2c6:	8d 7c 24 0c          	lea    0xc(%esp),%edi
     2ca:	b9 08 00 00 00       	mov    $0x8,%ecx
     2cf:	b8 00 00 00 00       	mov    $0x0,%eax
     2d4:	f3 ab                	rep stos %eax,%es:(%edi)
     2d6:	83 ec 08             	sub    $0x8,%esp
     2d9:	56                   	push   %esi
     2da:	8d 5c 24 18          	lea    0x18(%esp),%ebx
     2de:	53                   	push   %ebx
     2df:	e8 fc ff ff ff       	call   2e0 <sys_open+0x29>
     2e4:	83 c4 08             	add    $0x8,%esp
     2e7:	53                   	push   %ebx
     2e8:	68 00 00 00 00       	push   $0x0
     2ed:	e8 fc ff ff ff       	call   2ee <sys_open+0x37>
     2f2:	a1 00 00 00 00       	mov    0x0,%eax
     2f7:	0f b7 90 6c 02 00 00 	movzwl 0x26c(%eax),%edx
     2fe:	f7 d2                	not    %edx
     300:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
     306:	23 54 24 68          	and    0x68(%esp),%edx
     30a:	83 c4 10             	add    $0x10,%esp
     30d:	83 b8 80 02 00 00 00 	cmpl   $0x0,0x280(%eax)
     314:	0f 84 41 01 00 00    	je     45b <sys_open+0x1a4>
     31a:	bf 01 00 00 00       	mov    $0x1,%edi
     31f:	83 bc b8 80 02 00 00 	cmpl   $0x0,0x280(%eax,%edi,4)
     326:	00 
     327:	0f 84 33 01 00 00    	je     460 <sys_open+0x1a9>
     32d:	47                   	inc    %edi
     32e:	83 ff 14             	cmp    $0x14,%edi
     331:	75 ec                	jne    31f <sys_open+0x68>
     333:	e9 4b 01 00 00       	jmp    483 <sys_open+0x1cc>
     338:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
     33d:	0f 84 77 01 00 00    	je     4ba <sys_open+0x203>
     343:	83 c3 10             	add    $0x10,%ebx
     346:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
     34c:	75 ea                	jne    338 <sys_open+0x81>
     34e:	e9 49 01 00 00       	jmp    49c <sys_open+0x1e5>
     353:	8b 15 00 00 00 00    	mov    0x0,%edx
     359:	c7 84 ba 80 02 00 00 	movl   $0x0,0x280(%edx,%edi,4)
     360:	00 00 00 00 
     364:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
     36a:	e9 73 01 00 00       	jmp    4e2 <sys_open+0x22b>
     36f:	8b 54 24 2c          	mov    0x2c(%esp),%edx
     373:	8b 02                	mov    (%edx),%eax
     375:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     37a:	66 3d 00 20          	cmp    $0x2000,%ax
     37e:	0f 85 96 00 00 00    	jne    41a <sys_open+0x163>
     384:	66 8b 4a 0e          	mov    0xe(%edx),%cx
     388:	89 c8                	mov    %ecx,%eax
     38a:	66 c1 e8 08          	shr    $0x8,%ax
     38e:	66 83 f8 04          	cmp    $0x4,%ax
     392:	75 46                	jne    3da <sys_open+0x123>
     394:	a1 00 00 00 00       	mov    0x0,%eax
     399:	83 b8 3c 02 00 00 00 	cmpl   $0x0,0x23c(%eax)
     3a0:	0f 84 91 00 00 00    	je     437 <sys_open+0x180>
     3a6:	83 b8 68 02 00 00 00 	cmpl   $0x0,0x268(%eax)
     3ad:	0f 89 84 00 00 00    	jns    437 <sys_open+0x180>
     3b3:	0f b6 c9             	movzbl %cl,%ecx
     3b6:	89 88 68 02 00 00    	mov    %ecx,0x268(%eax)
     3bc:	8b b0 34 02 00 00    	mov    0x234(%eax),%esi
     3c2:	8d 04 09             	lea    (%ecx,%ecx,1),%eax
     3c5:	01 c1                	add    %eax,%ecx
     3c7:	89 c8                	mov    %ecx,%eax
     3c9:	c1 e0 05             	shl    $0x5,%eax
     3cc:	89 c1                	mov    %eax,%ecx
     3ce:	c1 e1 05             	shl    $0x5,%ecx
     3d1:	89 b4 08 24 00 00 00 	mov    %esi,0x24(%eax,%ecx,1)
     3d8:	eb 40                	jmp    41a <sys_open+0x163>
     3da:	66 83 f8 05          	cmp    $0x5,%ax
     3de:	75 57                	jne    437 <sys_open+0x180>
     3e0:	a1 00 00 00 00       	mov    0x0,%eax
     3e5:	83 b8 68 02 00 00 00 	cmpl   $0x0,0x268(%eax)
     3ec:	79 49                	jns    437 <sys_open+0x180>
     3ee:	83 ec 0c             	sub    $0xc,%esp
     3f1:	52                   	push   %edx
     3f2:	e8 fc ff ff ff       	call   3f3 <sys_open+0x13c>
     3f7:	a1 00 00 00 00       	mov    0x0,%eax
     3fc:	c7 84 b8 80 02 00 00 	movl   $0x0,0x280(%eax,%edi,4)
     403:	00 00 00 00 
     407:	66 c7 43 04 00 00    	movw   $0x0,0x4(%ebx)
     40d:	83 c4 10             	add    $0x10,%esp
     410:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     415:	e9 c8 00 00 00       	jmp    4e2 <sys_open+0x22b>
     41a:	8b 02                	mov    (%edx),%eax
     41c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     421:	66 3d 00 60          	cmp    $0x6000,%ax
     425:	75 10                	jne    437 <sys_open+0x180>
     427:	83 ec 0c             	sub    $0xc,%esp
     42a:	0f b7 42 0e          	movzwl 0xe(%edx),%eax
     42e:	50                   	push   %eax
     42f:	e8 fc ff ff ff       	call   430 <sys_open+0x179>
     434:	83 c4 10             	add    $0x10,%esp
     437:	8b 44 24 2c          	mov    0x2c(%esp),%eax
     43b:	8b 10                	mov    (%eax),%edx
     43d:	66 89 13             	mov    %dx,(%ebx)
     440:	66 89 6b 02          	mov    %bp,0x2(%ebx)
     444:	66 c7 43 04 01 00    	movw   $0x1,0x4(%ebx)
     44a:	89 43 08             	mov    %eax,0x8(%ebx)
     44d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
     454:	89 f8                	mov    %edi,%eax
     456:	e9 87 00 00 00       	jmp    4e2 <sys_open+0x22b>
     45b:	bf 00 00 00 00       	mov    $0x0,%edi
     460:	bb fe ff ff ff       	mov    $0xfffffffe,%ebx
     465:	89 f9                	mov    %edi,%ecx
     467:	d3 c3                	rol    %cl,%ebx
     469:	21 98 7c 02 00 00    	and    %ebx,0x27c(%eax)
     46f:	66 83 3d 04 00 00 00 	cmpw   $0x0,0x4
     476:	00 
     477:	74 3c                	je     4b5 <sys_open+0x1fe>
     479:	bb 10 00 00 00       	mov    $0x10,%ebx
     47e:	e9 b5 fe ff ff       	jmp    338 <sys_open+0x81>
     483:	83 ec 08             	sub    $0x8,%esp
     486:	6a 16                	push   $0x16
     488:	68 18 00 00 00       	push   $0x18
     48d:	e8 fc ff ff ff       	call   48e <sys_open+0x1d7>
     492:	83 c4 10             	add    $0x10,%esp
     495:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     49a:	eb 46                	jmp    4e2 <sys_open+0x22b>
     49c:	83 ec 08             	sub    $0x8,%esp
     49f:	6a 16                	push   $0x16
     4a1:	68 28 00 00 00       	push   $0x28
     4a6:	e8 fc ff ff ff       	call   4a7 <sys_open+0x1f0>
     4ab:	83 c4 10             	add    $0x10,%esp
     4ae:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     4b3:	eb 2d                	jmp    4e2 <sys_open+0x22b>
     4b5:	bb 00 00 00 00       	mov    $0x0,%ebx
     4ba:	89 9c b8 80 02 00 00 	mov    %ebx,0x280(%eax,%edi,4)
     4c1:	66 ff 43 04          	incw   0x4(%ebx)
     4c5:	8d 44 24 2c          	lea    0x2c(%esp),%eax
     4c9:	50                   	push   %eax
     4ca:	52                   	push   %edx
     4cb:	55                   	push   %ebp
     4cc:	56                   	push   %esi
     4cd:	e8 fc ff ff ff       	call   4ce <sys_open+0x217>
     4d2:	83 c4 10             	add    $0x10,%esp
     4d5:	85 c0                	test   %eax,%eax
     4d7:	0f 89 92 fe ff ff    	jns    36f <sys_open+0xb8>
     4dd:	e9 71 fe ff ff       	jmp    353 <sys_open+0x9c>
     4e2:	83 c4 3c             	add    $0x3c,%esp
     4e5:	5b                   	pop    %ebx
     4e6:	5e                   	pop    %esi
     4e7:	5f                   	pop    %edi
     4e8:	5d                   	pop    %ebp
     4e9:	c3                   	ret    

000004ea <sys_creat>:
     4ea:	83 ec 10             	sub    $0x10,%esp
     4ed:	ff 74 24 18          	pushl  0x18(%esp)
     4f1:	68 40 02 00 00       	push   $0x240
     4f6:	ff 74 24 1c          	pushl  0x1c(%esp)
     4fa:	e8 fc ff ff ff       	call   4fb <sys_creat+0x11>
     4ff:	83 c4 1c             	add    $0x1c,%esp
     502:	c3                   	ret    

00000503 <sys_close>:
     503:	53                   	push   %ebx
     504:	83 ec 08             	sub    $0x8,%esp
     507:	8b 4c 24 10          	mov    0x10(%esp),%ecx
     50b:	83 f9 13             	cmp    $0x13,%ecx
     50e:	77 62                	ja     572 <sys_close+0x6f>
     510:	a1 00 00 00 00       	mov    0x0,%eax
     515:	ba fe ff ff ff       	mov    $0xfffffffe,%edx
     51a:	d3 c2                	rol    %cl,%edx
     51c:	21 90 7c 02 00 00    	and    %edx,0x27c(%eax)
     522:	8d 04 88             	lea    (%eax,%ecx,4),%eax
     525:	8b 98 80 02 00 00    	mov    0x280(%eax),%ebx
     52b:	85 db                	test   %ebx,%ebx
     52d:	74 4a                	je     579 <sys_close+0x76>
     52f:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
     536:	00 00 00 
     539:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
     53e:	75 10                	jne    550 <sys_close+0x4d>
     540:	83 ec 0c             	sub    $0xc,%esp
     543:	68 38 00 00 00       	push   $0x38
     548:	e8 fc ff ff ff       	call   549 <sys_close+0x46>
     54d:	83 c4 10             	add    $0x10,%esp
     550:	8b 43 04             	mov    0x4(%ebx),%eax
     553:	48                   	dec    %eax
     554:	66 89 43 04          	mov    %ax,0x4(%ebx)
     558:	66 85 c0             	test   %ax,%ax
     55b:	75 23                	jne    580 <sys_close+0x7d>
     55d:	83 ec 0c             	sub    $0xc,%esp
     560:	ff 73 08             	pushl  0x8(%ebx)
     563:	e8 fc ff ff ff       	call   564 <sys_close+0x61>
     568:	83 c4 10             	add    $0x10,%esp
     56b:	b8 00 00 00 00       	mov    $0x0,%eax
     570:	eb 13                	jmp    585 <sys_close+0x82>
     572:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     577:	eb 0c                	jmp    585 <sys_close+0x82>
     579:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     57e:	eb 05                	jmp    585 <sys_close+0x82>
     580:	b8 00 00 00 00       	mov    $0x0,%eax
     585:	83 c4 08             	add    $0x8,%esp
     588:	5b                   	pop    %ebx
     589:	c3                   	ret    

0000058a <sys_lseek>:
     58a:	53                   	push   %ebx
     58b:	8b 44 24 08          	mov    0x8(%esp),%eax
     58f:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     593:	83 f8 13             	cmp    $0x13,%eax
     596:	77 66                	ja     5fe <sys_lseek+0x74>
     598:	8b 15 00 00 00 00    	mov    0x0,%edx
     59e:	8b 84 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%eax
     5a5:	85 c0                	test   %eax,%eax
     5a7:	74 5c                	je     605 <sys_lseek+0x7b>
     5a9:	8b 50 08             	mov    0x8(%eax),%edx
     5ac:	85 d2                	test   %edx,%edx
     5ae:	74 5c                	je     60c <sys_lseek+0x82>
     5b0:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
     5b4:	49                   	dec    %ecx
     5b5:	66 83 f9 02          	cmp    $0x2,%cx
     5b9:	77 58                	ja     613 <sys_lseek+0x89>
     5bb:	80 7a 34 00          	cmpb   $0x0,0x34(%edx)
     5bf:	75 59                	jne    61a <sys_lseek+0x90>
     5c1:	83 fb 01             	cmp    $0x1,%ebx
     5c4:	74 19                	je     5df <sys_lseek+0x55>
     5c6:	83 fb 02             	cmp    $0x2,%ebx
     5c9:	74 22                	je     5ed <sys_lseek+0x63>
     5cb:	85 db                	test   %ebx,%ebx
     5cd:	75 52                	jne    621 <sys_lseek+0x97>
     5cf:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
     5d4:	78 52                	js     628 <sys_lseek+0x9e>
     5d6:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     5da:	89 58 0c             	mov    %ebx,0xc(%eax)
     5dd:	eb 1a                	jmp    5f9 <sys_lseek+0x6f>
     5df:	8b 54 24 0c          	mov    0xc(%esp),%edx
     5e3:	03 50 0c             	add    0xc(%eax),%edx
     5e6:	78 47                	js     62f <sys_lseek+0xa5>
     5e8:	89 50 0c             	mov    %edx,0xc(%eax)
     5eb:	eb 0c                	jmp    5f9 <sys_lseek+0x6f>
     5ed:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     5f1:	03 5a 04             	add    0x4(%edx),%ebx
     5f4:	78 40                	js     636 <sys_lseek+0xac>
     5f6:	89 58 0c             	mov    %ebx,0xc(%eax)
     5f9:	8b 40 0c             	mov    0xc(%eax),%eax
     5fc:	eb 3d                	jmp    63b <sys_lseek+0xb1>
     5fe:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     603:	eb 36                	jmp    63b <sys_lseek+0xb1>
     605:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     60a:	eb 2f                	jmp    63b <sys_lseek+0xb1>
     60c:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     611:	eb 28                	jmp    63b <sys_lseek+0xb1>
     613:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
     618:	eb 21                	jmp    63b <sys_lseek+0xb1>
     61a:	b8 e3 ff ff ff       	mov    $0xffffffe3,%eax
     61f:	eb 1a                	jmp    63b <sys_lseek+0xb1>
     621:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     626:	eb 13                	jmp    63b <sys_lseek+0xb1>
     628:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     62d:	eb 0c                	jmp    63b <sys_lseek+0xb1>
     62f:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     634:	eb 05                	jmp    63b <sys_lseek+0xb1>
     636:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     63b:	5b                   	pop    %ebx
     63c:	c3                   	ret    

0000063d <sys_read>:
     63d:	57                   	push   %edi
     63e:	56                   	push   %esi
     63f:	53                   	push   %ebx
     640:	8b 44 24 10          	mov    0x10(%esp),%eax
     644:	8b 5c 24 18          	mov    0x18(%esp),%ebx
     648:	83 f8 13             	cmp    $0x13,%eax
     64b:	0f 87 fc 00 00 00    	ja     74d <sys_read+0x110>
     651:	85 db                	test   %ebx,%ebx
     653:	0f 88 fb 00 00 00    	js     754 <sys_read+0x117>
     659:	8b 15 00 00 00 00    	mov    0x0,%edx
     65f:	8b b4 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%esi
     666:	85 f6                	test   %esi,%esi
     668:	0f 84 ed 00 00 00    	je     75b <sys_read+0x11e>
     66e:	85 db                	test   %ebx,%ebx
     670:	0f 84 ec 00 00 00    	je     762 <sys_read+0x125>
     676:	83 ec 08             	sub    $0x8,%esp
     679:	53                   	push   %ebx
     67a:	ff 74 24 20          	pushl  0x20(%esp)
     67e:	e8 fc ff ff ff       	call   67f <sys_read+0x42>
     683:	8b 46 08             	mov    0x8(%esi),%eax
     686:	83 c4 10             	add    $0x10,%esp
     689:	80 78 34 00          	cmpb   $0x0,0x34(%eax)
     68d:	74 1f                	je     6ae <sys_read+0x71>
     68f:	f6 06 01             	testb  $0x1,(%esi)
     692:	0f 84 d1 00 00 00    	je     769 <sys_read+0x12c>
     698:	83 ec 04             	sub    $0x4,%esp
     69b:	53                   	push   %ebx
     69c:	ff 74 24 1c          	pushl  0x1c(%esp)
     6a0:	50                   	push   %eax
     6a1:	e8 fc ff ff ff       	call   6a2 <sys_read+0x65>
     6a6:	83 c4 10             	add    $0x10,%esp
     6a9:	e9 c7 00 00 00       	jmp    775 <sys_read+0x138>
     6ae:	8b 08                	mov    (%eax),%ecx
     6b0:	89 ca                	mov    %ecx,%edx
     6b2:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
     6b8:	66 81 fa 00 20       	cmp    $0x2000,%dx
     6bd:	75 20                	jne    6df <sys_read+0xa2>
     6bf:	83 ec 0c             	sub    $0xc,%esp
     6c2:	83 c6 0c             	add    $0xc,%esi
     6c5:	56                   	push   %esi
     6c6:	53                   	push   %ebx
     6c7:	ff 74 24 28          	pushl  0x28(%esp)
     6cb:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
     6cf:	50                   	push   %eax
     6d0:	6a 00                	push   $0x0
     6d2:	e8 fc ff ff ff       	call   6d3 <sys_read+0x96>
     6d7:	83 c4 20             	add    $0x20,%esp
     6da:	e9 96 00 00 00       	jmp    775 <sys_read+0x138>
     6df:	66 81 fa 00 60       	cmp    $0x6000,%dx
     6e4:	75 18                	jne    6fe <sys_read+0xc1>
     6e6:	53                   	push   %ebx
     6e7:	ff 74 24 18          	pushl  0x18(%esp)
     6eb:	83 c6 0c             	add    $0xc,%esi
     6ee:	56                   	push   %esi
     6ef:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
     6f3:	50                   	push   %eax
     6f4:	e8 fc ff ff ff       	call   6f5 <sys_read+0xb8>
     6f9:	83 c4 10             	add    $0x10,%esp
     6fc:	eb 77                	jmp    775 <sys_read+0x138>
     6fe:	66 81 fa 00 40       	cmp    $0x4000,%dx
     703:	74 07                	je     70c <sys_read+0xcf>
     705:	66 81 fa 00 80       	cmp    $0x8000,%dx
     70a:	75 26                	jne    732 <sys_read+0xf5>
     70c:	8b 56 0c             	mov    0xc(%esi),%edx
     70f:	8b 48 04             	mov    0x4(%eax),%ecx
     712:	8d 3c 13             	lea    (%ebx,%edx,1),%edi
     715:	39 cf                	cmp    %ecx,%edi
     717:	76 04                	jbe    71d <sys_read+0xe0>
     719:	29 d1                	sub    %edx,%ecx
     71b:	89 cb                	mov    %ecx,%ebx
     71d:	85 db                	test   %ebx,%ebx
     71f:	7e 4f                	jle    770 <sys_read+0x133>
     721:	53                   	push   %ebx
     722:	ff 74 24 18          	pushl  0x18(%esp)
     726:	56                   	push   %esi
     727:	50                   	push   %eax
     728:	e8 fc ff ff ff       	call   729 <sys_read+0xec>
     72d:	83 c4 10             	add    $0x10,%esp
     730:	eb 43                	jmp    775 <sys_read+0x138>
     732:	83 ec 08             	sub    $0x8,%esp
     735:	0f b7 c9             	movzwl %cx,%ecx
     738:	51                   	push   %ecx
     739:	68 4f 00 00 00       	push   $0x4f
     73e:	e8 fc ff ff ff       	call   73f <sys_read+0x102>
     743:	83 c4 10             	add    $0x10,%esp
     746:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     74b:	eb 28                	jmp    775 <sys_read+0x138>
     74d:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     752:	eb 21                	jmp    775 <sys_read+0x138>
     754:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     759:	eb 1a                	jmp    775 <sys_read+0x138>
     75b:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     760:	eb 13                	jmp    775 <sys_read+0x138>
     762:	b8 00 00 00 00       	mov    $0x0,%eax
     767:	eb 0c                	jmp    775 <sys_read+0x138>
     769:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
     76e:	eb 05                	jmp    775 <sys_read+0x138>
     770:	b8 00 00 00 00       	mov    $0x0,%eax
     775:	5b                   	pop    %ebx
     776:	5e                   	pop    %esi
     777:	5f                   	pop    %edi
     778:	c3                   	ret    

00000779 <sys_write>:
     779:	55                   	push   %ebp
     77a:	57                   	push   %edi
     77b:	56                   	push   %esi
     77c:	53                   	push   %ebx
     77d:	83 ec 0c             	sub    $0xc,%esp
     780:	8b 4c 24 20          	mov    0x20(%esp),%ecx
     784:	8b 44 24 28          	mov    0x28(%esp),%eax
     788:	83 f9 13             	cmp    $0x13,%ecx
     78b:	0f 87 dd 00 00 00    	ja     86e <sys_write+0xf5>
     791:	85 c0                	test   %eax,%eax
     793:	0f 88 dc 00 00 00    	js     875 <sys_write+0xfc>
     799:	8b 35 00 00 00 00    	mov    0x0,%esi
     79f:	8b 94 8e 80 02 00 00 	mov    0x280(%esi,%ecx,4),%edx
     7a6:	85 d2                	test   %edx,%edx
     7a8:	0f 84 ce 00 00 00    	je     87c <sys_write+0x103>
     7ae:	85 c0                	test   %eax,%eax
     7b0:	0f 84 cd 00 00 00    	je     883 <sys_write+0x10a>
     7b6:	8b 5a 08             	mov    0x8(%edx),%ebx
     7b9:	80 7b 34 00          	cmpb   $0x0,0x34(%ebx)
     7bd:	74 1f                	je     7de <sys_write+0x65>
     7bf:	f6 02 02             	testb  $0x2,(%edx)
     7c2:	0f 84 c2 00 00 00    	je     88a <sys_write+0x111>
     7c8:	83 ec 04             	sub    $0x4,%esp
     7cb:	50                   	push   %eax
     7cc:	ff 74 24 2c          	pushl  0x2c(%esp)
     7d0:	53                   	push   %ebx
     7d1:	e8 fc ff ff ff       	call   7d2 <sys_write+0x59>
     7d6:	83 c4 10             	add    $0x10,%esp
     7d9:	e9 b1 00 00 00       	jmp    88f <sys_write+0x116>
     7de:	8b 2b                	mov    (%ebx),%ebp
     7e0:	89 ef                	mov    %ebp,%edi
     7e2:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
     7e8:	66 81 ff 00 20       	cmp    $0x2000,%di
     7ed:	75 20                	jne    80f <sys_write+0x96>
     7ef:	83 ec 0c             	sub    $0xc,%esp
     7f2:	83 c2 0c             	add    $0xc,%edx
     7f5:	52                   	push   %edx
     7f6:	50                   	push   %eax
     7f7:	ff 74 24 38          	pushl  0x38(%esp)
     7fb:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
     7ff:	50                   	push   %eax
     800:	6a 01                	push   $0x1
     802:	e8 fc ff ff ff       	call   803 <sys_write+0x8a>
     807:	83 c4 20             	add    $0x20,%esp
     80a:	e9 80 00 00 00       	jmp    88f <sys_write+0x116>
     80f:	66 81 ff 00 60       	cmp    $0x6000,%di
     814:	75 18                	jne    82e <sys_write+0xb5>
     816:	50                   	push   %eax
     817:	ff 74 24 28          	pushl  0x28(%esp)
     81b:	83 c2 0c             	add    $0xc,%edx
     81e:	52                   	push   %edx
     81f:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
     823:	50                   	push   %eax
     824:	e8 fc ff ff ff       	call   825 <sys_write+0xac>
     829:	83 c4 10             	add    $0x10,%esp
     82c:	eb 61                	jmp    88f <sys_write+0x116>
     82e:	66 81 ff 00 80       	cmp    $0x8000,%di
     833:	75 11                	jne    846 <sys_write+0xcd>
     835:	50                   	push   %eax
     836:	ff 74 24 28          	pushl  0x28(%esp)
     83a:	52                   	push   %edx
     83b:	53                   	push   %ebx
     83c:	e8 fc ff ff ff       	call   83d <sys_write+0xc4>
     841:	83 c4 10             	add    $0x10,%esp
     844:	eb 49                	jmp    88f <sys_write+0x116>
     846:	83 ec 0c             	sub    $0xc,%esp
     849:	ff b6 2c 02 00 00    	pushl  0x22c(%esi)
     84f:	ff b6 68 02 00 00    	pushl  0x268(%esi)
     855:	51                   	push   %ecx
     856:	0f b7 ed             	movzwl %bp,%ebp
     859:	55                   	push   %ebp
     85a:	68 00 00 00 00       	push   $0x0
     85f:	e8 fc ff ff ff       	call   860 <sys_write+0xe7>
     864:	83 c4 20             	add    $0x20,%esp
     867:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     86c:	eb 21                	jmp    88f <sys_write+0x116>
     86e:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     873:	eb 1a                	jmp    88f <sys_write+0x116>
     875:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     87a:	eb 13                	jmp    88f <sys_write+0x116>
     87c:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
     881:	eb 0c                	jmp    88f <sys_write+0x116>
     883:	b8 00 00 00 00       	mov    $0x0,%eax
     888:	eb 05                	jmp    88f <sys_write+0x116>
     88a:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
     88f:	83 c4 0c             	add    $0xc,%esp
     892:	5b                   	pop    %ebx
     893:	5e                   	pop    %esi
     894:	5f                   	pop    %edi
     895:	5d                   	pop    %ebp
     896:	c3                   	ret    

00000897 <write_inode>:
     897:	55                   	push   %ebp
     898:	57                   	push   %edi
     899:	56                   	push   %esi
     89a:	53                   	push   %ebx
     89b:	83 ec 0c             	sub    $0xc,%esp
     89e:	89 c3                	mov    %eax,%ebx
     8a0:	fa                   	cli    
     8a1:	80 78 32 00          	cmpb   $0x0,0x32(%eax)
     8a5:	74 15                	je     8bc <write_inode+0x25>
     8a7:	8d 70 20             	lea    0x20(%eax),%esi
     8aa:	83 ec 0c             	sub    $0xc,%esp
     8ad:	56                   	push   %esi
     8ae:	e8 fc ff ff ff       	call   8af <write_inode+0x18>
     8b3:	83 c4 10             	add    $0x10,%esp
     8b6:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     8ba:	75 ee                	jne    8aa <write_inode+0x13>
     8bc:	c6 43 32 01          	movb   $0x1,0x32(%ebx)
     8c0:	fb                   	sti    
     8c1:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     8c5:	74 08                	je     8cf <write_inode+0x38>
     8c7:	8b 43 2c             	mov    0x2c(%ebx),%eax
     8ca:	66 85 c0             	test   %ax,%ax
     8cd:	75 18                	jne    8e7 <write_inode+0x50>
     8cf:	c6 43 32 00          	movb   $0x0,0x32(%ebx)
     8d3:	83 ec 0c             	sub    $0xc,%esp
     8d6:	83 c3 20             	add    $0x20,%ebx
     8d9:	53                   	push   %ebx
     8da:	e8 fc ff ff ff       	call   8db <write_inode+0x44>
     8df:	83 c4 10             	add    $0x10,%esp
     8e2:	e9 9e 00 00 00       	jmp    985 <write_inode+0xee>
     8e7:	83 ec 0c             	sub    $0xc,%esp
     8ea:	0f b7 c0             	movzwl %ax,%eax
     8ed:	50                   	push   %eax
     8ee:	e8 fc ff ff ff       	call   8ef <write_inode+0x58>
     8f3:	89 c6                	mov    %eax,%esi
     8f5:	83 c4 10             	add    $0x10,%esp
     8f8:	85 c0                	test   %eax,%eax
     8fa:	75 10                	jne    90c <write_inode+0x75>
     8fc:	83 ec 0c             	sub    $0xc,%esp
     8ff:	68 38 00 00 00       	push   $0x38
     904:	e8 fc ff ff ff       	call   905 <write_inode+0x6e>
     909:	83 c4 10             	add    $0x10,%esp
     90c:	83 ec 08             	sub    $0x8,%esp
     90f:	0f b7 56 04          	movzwl 0x4(%esi),%edx
     913:	0f b7 46 06          	movzwl 0x6(%esi),%eax
     917:	8d 54 02 02          	lea    0x2(%edx,%eax,1),%edx
     91b:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
     91f:	48                   	dec    %eax
     920:	c1 e8 05             	shr    $0x5,%eax
     923:	01 d0                	add    %edx,%eax
     925:	50                   	push   %eax
     926:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     92a:	50                   	push   %eax
     92b:	e8 fc ff ff ff       	call   92c <write_inode+0x95>
     930:	89 c5                	mov    %eax,%ebp
     932:	83 c4 10             	add    $0x10,%esp
     935:	85 c0                	test   %eax,%eax
     937:	75 10                	jne    949 <write_inode+0xb2>
     939:	83 ec 0c             	sub    $0xc,%esp
     93c:	68 6a 00 00 00       	push   $0x6a
     941:	e8 fc ff ff ff       	call   942 <write_inode+0xab>
     946:	83 c4 10             	add    $0x10,%esp
     949:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
     94d:	48                   	dec    %eax
     94e:	83 e0 1f             	and    $0x1f,%eax
     951:	c1 e0 05             	shl    $0x5,%eax
     954:	03 45 00             	add    0x0(%ebp),%eax
     957:	b9 08 00 00 00       	mov    $0x8,%ecx
     95c:	89 c7                	mov    %eax,%edi
     95e:	89 de                	mov    %ebx,%esi
     960:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     962:	c6 45 0b 01          	movb   $0x1,0xb(%ebp)
     966:	c6 43 33 00          	movb   $0x0,0x33(%ebx)
     96a:	83 ec 0c             	sub    $0xc,%esp
     96d:	55                   	push   %ebp
     96e:	e8 fc ff ff ff       	call   96f <write_inode+0xd8>
     973:	c6 43 32 00          	movb   $0x0,0x32(%ebx)
     977:	83 c3 20             	add    $0x20,%ebx
     97a:	89 1c 24             	mov    %ebx,(%esp)
     97d:	e8 fc ff ff ff       	call   97e <write_inode+0xe7>
     982:	83 c4 10             	add    $0x10,%esp
     985:	83 c4 0c             	add    $0xc,%esp
     988:	5b                   	pop    %ebx
     989:	5e                   	pop    %esi
     98a:	5f                   	pop    %edi
     98b:	5d                   	pop    %ebp
     98c:	c3                   	ret    

0000098d <_bmap>:
     98d:	55                   	push   %ebp
     98e:	57                   	push   %edi
     98f:	56                   	push   %esi
     990:	53                   	push   %ebx
     991:	83 ec 1c             	sub    $0x1c,%esp
     994:	89 c3                	mov    %eax,%ebx
     996:	89 d5                	mov    %edx,%ebp
     998:	89 ce                	mov    %ecx,%esi
     99a:	85 d2                	test   %edx,%edx
     99c:	79 10                	jns    9ae <_bmap+0x21>
     99e:	83 ec 0c             	sub    $0xc,%esp
     9a1:	68 86 00 00 00       	push   $0x86
     9a6:	e8 fc ff ff ff       	call   9a7 <_bmap+0x1a>
     9ab:	83 c4 10             	add    $0x10,%esp
     9ae:	81 fd 06 02 04 00    	cmp    $0x40206,%ebp
     9b4:	7e 10                	jle    9c6 <_bmap+0x39>
     9b6:	83 ec 0c             	sub    $0xc,%esp
     9b9:	68 95 00 00 00       	push   $0x95
     9be:	e8 fc ff ff ff       	call   9bf <_bmap+0x32>
     9c3:	83 c4 10             	add    $0x10,%esp
     9c6:	83 fd 06             	cmp    $0x6,%ebp
     9c9:	7f 58                	jg     a23 <_bmap+0x96>
     9cb:	85 f6                	test   %esi,%esi
     9cd:	74 4a                	je     a19 <_bmap+0x8c>
     9cf:	8d 74 2d 00          	lea    0x0(%ebp,%ebp,1),%esi
     9d3:	01 de                	add    %ebx,%esi
     9d5:	66 83 7e 0e 00       	cmpw   $0x0,0xe(%esi)
     9da:	75 3d                	jne    a19 <_bmap+0x8c>
     9dc:	83 ec 0c             	sub    $0xc,%esp
     9df:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     9e3:	50                   	push   %eax
     9e4:	e8 fc ff ff ff       	call   9e5 <_bmap+0x58>
     9e9:	66 89 46 0e          	mov    %ax,0xe(%esi)
     9ed:	83 c4 10             	add    $0x10,%esp
     9f0:	66 85 c0             	test   %ax,%ax
     9f3:	74 24                	je     a19 <_bmap+0x8c>
     9f5:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     9fb:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     a00:	f7 e9                	imul   %ecx
     a02:	89 d0                	mov    %edx,%eax
     a04:	c1 f8 05             	sar    $0x5,%eax
     a07:	c1 f9 1f             	sar    $0x1f,%ecx
     a0a:	29 c8                	sub    %ecx,%eax
     a0c:	03 05 00 00 00 00    	add    0x0,%eax
     a12:	89 43 28             	mov    %eax,0x28(%ebx)
     a15:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
     a19:	0f b7 44 6b 0e       	movzwl 0xe(%ebx,%ebp,2),%eax
     a1e:	e9 17 03 00 00       	jmp    d3a <_bmap+0x3ad>
     a23:	8d 7d f9             	lea    -0x7(%ebp),%edi
     a26:	81 ff ff 01 00 00    	cmp    $0x1ff,%edi
     a2c:	0f 8f 9a 00 00 00    	jg     acc <_bmap+0x13f>
     a32:	85 f6                	test   %esi,%esi
     a34:	74 51                	je     a87 <_bmap+0xfa>
     a36:	66 83 7b 1c 00       	cmpw   $0x0,0x1c(%ebx)
     a3b:	0f 85 0b 02 00 00    	jne    c4c <_bmap+0x2bf>
     a41:	83 ec 0c             	sub    $0xc,%esp
     a44:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     a48:	50                   	push   %eax
     a49:	e8 fc ff ff ff       	call   a4a <_bmap+0xbd>
     a4e:	66 89 43 1c          	mov    %ax,0x1c(%ebx)
     a52:	83 c4 10             	add    $0x10,%esp
     a55:	66 85 c0             	test   %ax,%ax
     a58:	0f 84 8a 01 00 00    	je     be8 <_bmap+0x25b>
     a5e:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
     a62:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     a68:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     a6d:	f7 e9                	imul   %ecx
     a6f:	89 d0                	mov    %edx,%eax
     a71:	c1 f8 05             	sar    $0x5,%eax
     a74:	c1 f9 1f             	sar    $0x1f,%ecx
     a77:	29 c8                	sub    %ecx,%eax
     a79:	03 05 00 00 00 00    	add    0x0,%eax
     a7f:	89 43 28             	mov    %eax,0x28(%ebx)
     a82:	e9 c5 01 00 00       	jmp    c4c <_bmap+0x2bf>
     a87:	8b 43 1c             	mov    0x1c(%ebx),%eax
     a8a:	66 85 c0             	test   %ax,%ax
     a8d:	0f 84 5f 01 00 00    	je     bf2 <_bmap+0x265>
     a93:	e9 1e 02 00 00       	jmp    cb6 <_bmap+0x329>
     a98:	83 ec 0c             	sub    $0xc,%esp
     a9b:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     a9f:	50                   	push   %eax
     aa0:	e8 fc ff ff ff       	call   aa1 <_bmap+0x114>
     aa5:	89 c6                	mov    %eax,%esi
     aa7:	83 c4 10             	add    $0x10,%esp
     aaa:	85 c0                	test   %eax,%eax
     aac:	74 0b                	je     ab9 <_bmap+0x12c>
     aae:	8b 45 00             	mov    0x0(%ebp),%eax
     ab1:	66 89 34 38          	mov    %si,(%eax,%edi,1)
     ab5:	c6 45 0b 01          	movb   $0x1,0xb(%ebp)
     ab9:	83 ec 0c             	sub    $0xc,%esp
     abc:	55                   	push   %ebp
     abd:	e8 fc ff ff ff       	call   abe <_bmap+0x131>
     ac2:	83 c4 10             	add    $0x10,%esp
     ac5:	89 f0                	mov    %esi,%eax
     ac7:	e9 6e 02 00 00       	jmp    d3a <_bmap+0x3ad>
     acc:	85 f6                	test   %esi,%esi
     ace:	74 51                	je     b21 <_bmap+0x194>
     ad0:	66 83 7b 1e 00       	cmpw   $0x0,0x1e(%ebx)
     ad5:	0f 85 8e 01 00 00    	jne    c69 <_bmap+0x2dc>
     adb:	83 ec 0c             	sub    $0xc,%esp
     ade:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     ae2:	50                   	push   %eax
     ae3:	e8 fc ff ff ff       	call   ae4 <_bmap+0x157>
     ae8:	66 89 43 1e          	mov    %ax,0x1e(%ebx)
     aec:	83 c4 10             	add    $0x10,%esp
     aef:	66 85 c0             	test   %ax,%ax
     af2:	0f 84 04 01 00 00    	je     bfc <_bmap+0x26f>
     af8:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
     afc:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     b02:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
     b07:	f7 e9                	imul   %ecx
     b09:	89 d0                	mov    %edx,%eax
     b0b:	c1 f8 05             	sar    $0x5,%eax
     b0e:	c1 f9 1f             	sar    $0x1f,%ecx
     b11:	29 c8                	sub    %ecx,%eax
     b13:	03 05 00 00 00 00    	add    0x0,%eax
     b19:	89 43 28             	mov    %eax,0x28(%ebx)
     b1c:	e9 48 01 00 00       	jmp    c69 <_bmap+0x2dc>
     b21:	66 8b 43 1e          	mov    0x1e(%ebx),%ax
     b25:	66 85 c0             	test   %ax,%ax
     b28:	0f 84 d8 00 00 00    	je     c06 <_bmap+0x279>
     b2e:	83 ec 08             	sub    $0x8,%esp
     b31:	0f b7 c0             	movzwl %ax,%eax
     b34:	50                   	push   %eax
     b35:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     b39:	50                   	push   %eax
     b3a:	e8 fc ff ff ff       	call   b3b <_bmap+0x1ae>
     b3f:	89 c7                	mov    %eax,%edi
     b41:	83 c4 10             	add    $0x10,%esp
     b44:	85 c0                	test   %eax,%eax
     b46:	0f 84 c4 00 00 00    	je     c10 <_bmap+0x283>
     b4c:	8d 85 f9 fd ff ff    	lea    -0x207(%ebp),%eax
     b52:	89 44 24 08          	mov    %eax,0x8(%esp)
     b56:	c1 f8 09             	sar    $0x9,%eax
     b59:	01 c0                	add    %eax,%eax
     b5b:	89 c2                	mov    %eax,%edx
     b5d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b61:	8b 07                	mov    (%edi),%eax
     b63:	0f b7 2c 10          	movzwl (%eax,%edx,1),%ebp
     b67:	85 f6                	test   %esi,%esi
     b69:	74 35                	je     ba0 <_bmap+0x213>
     b6b:	85 ed                	test   %ebp,%ebp
     b6d:	0f 85 ff 00 00 00    	jne    c72 <_bmap+0x2e5>
     b73:	83 ec 0c             	sub    $0xc,%esp
     b76:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     b7a:	50                   	push   %eax
     b7b:	e8 fc ff ff ff       	call   b7c <_bmap+0x1ef>
     b80:	89 c5                	mov    %eax,%ebp
     b82:	83 c4 10             	add    $0x10,%esp
     b85:	85 c0                	test   %eax,%eax
     b87:	0f 84 07 01 00 00    	je     c94 <_bmap+0x307>
     b8d:	8b 07                	mov    (%edi),%eax
     b8f:	8b 54 24 0c          	mov    0xc(%esp),%edx
     b93:	66 89 2c 10          	mov    %bp,(%eax,%edx,1)
     b97:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
     b9b:	e9 d2 00 00 00       	jmp    c72 <_bmap+0x2e5>
     ba0:	83 ec 0c             	sub    $0xc,%esp
     ba3:	57                   	push   %edi
     ba4:	e8 fc ff ff ff       	call   ba5 <_bmap+0x218>
     ba9:	83 c4 10             	add    $0x10,%esp
     bac:	85 ed                	test   %ebp,%ebp
     bae:	74 6a                	je     c1a <_bmap+0x28d>
     bb0:	e9 69 01 00 00       	jmp    d1e <_bmap+0x391>
     bb5:	83 ec 0c             	sub    $0xc,%esp
     bb8:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     bbc:	50                   	push   %eax
     bbd:	e8 fc ff ff ff       	call   bbe <_bmap+0x231>
     bc2:	89 c6                	mov    %eax,%esi
     bc4:	83 c4 10             	add    $0x10,%esp
     bc7:	85 c0                	test   %eax,%eax
     bc9:	74 0a                	je     bd5 <_bmap+0x248>
     bcb:	8b 07                	mov    (%edi),%eax
     bcd:	66 89 34 28          	mov    %si,(%eax,%ebp,1)
     bd1:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
     bd5:	83 ec 0c             	sub    $0xc,%esp
     bd8:	57                   	push   %edi
     bd9:	e8 fc ff ff ff       	call   bda <_bmap+0x24d>
     bde:	83 c4 10             	add    $0x10,%esp
     be1:	89 f0                	mov    %esi,%eax
     be3:	e9 52 01 00 00       	jmp    d3a <_bmap+0x3ad>
     be8:	b8 00 00 00 00       	mov    $0x0,%eax
     bed:	e9 48 01 00 00       	jmp    d3a <_bmap+0x3ad>
     bf2:	b8 00 00 00 00       	mov    $0x0,%eax
     bf7:	e9 3e 01 00 00       	jmp    d3a <_bmap+0x3ad>
     bfc:	b8 00 00 00 00       	mov    $0x0,%eax
     c01:	e9 34 01 00 00       	jmp    d3a <_bmap+0x3ad>
     c06:	b8 00 00 00 00       	mov    $0x0,%eax
     c0b:	e9 2a 01 00 00       	jmp    d3a <_bmap+0x3ad>
     c10:	b8 00 00 00 00       	mov    $0x0,%eax
     c15:	e9 20 01 00 00       	jmp    d3a <_bmap+0x3ad>
     c1a:	b8 00 00 00 00       	mov    $0x0,%eax
     c1f:	e9 16 01 00 00       	jmp    d3a <_bmap+0x3ad>
     c24:	b8 00 00 00 00       	mov    $0x0,%eax
     c29:	e9 0c 01 00 00       	jmp    d3a <_bmap+0x3ad>
     c2e:	b8 00 00 00 00       	mov    $0x0,%eax
     c33:	e9 02 01 00 00       	jmp    d3a <_bmap+0x3ad>
     c38:	b8 00 00 00 00       	mov    $0x0,%eax
     c3d:	e9 f8 00 00 00       	jmp    d3a <_bmap+0x3ad>
     c42:	b8 00 00 00 00       	mov    $0x0,%eax
     c47:	e9 ee 00 00 00       	jmp    d3a <_bmap+0x3ad>
     c4c:	83 ec 08             	sub    $0x8,%esp
     c4f:	0f b7 43 1c          	movzwl 0x1c(%ebx),%eax
     c53:	50                   	push   %eax
     c54:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     c58:	50                   	push   %eax
     c59:	e8 fc ff ff ff       	call   c5a <_bmap+0x2cd>
     c5e:	89 c5                	mov    %eax,%ebp
     c60:	83 c4 10             	add    $0x10,%esp
     c63:	85 c0                	test   %eax,%eax
     c65:	75 6e                	jne    cd5 <_bmap+0x348>
     c67:	eb bb                	jmp    c24 <_bmap+0x297>
     c69:	66 8b 43 1e          	mov    0x1e(%ebx),%ax
     c6d:	e9 bc fe ff ff       	jmp    b2e <_bmap+0x1a1>
     c72:	83 ec 0c             	sub    $0xc,%esp
     c75:	57                   	push   %edi
     c76:	e8 fc ff ff ff       	call   c77 <_bmap+0x2ea>
     c7b:	83 c4 08             	add    $0x8,%esp
     c7e:	55                   	push   %ebp
     c7f:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     c83:	50                   	push   %eax
     c84:	e8 fc ff ff ff       	call   c85 <_bmap+0x2f8>
     c89:	89 c7                	mov    %eax,%edi
     c8b:	83 c4 10             	add    $0x10,%esp
     c8e:	85 c0                	test   %eax,%eax
     c90:	74 9c                	je     c2e <_bmap+0x2a1>
     c92:	eb 56                	jmp    cea <_bmap+0x35d>
     c94:	83 ec 0c             	sub    $0xc,%esp
     c97:	57                   	push   %edi
     c98:	e8 fc ff ff ff       	call   c99 <_bmap+0x30c>
     c9d:	83 c4 10             	add    $0x10,%esp
     ca0:	b8 00 00 00 00       	mov    $0x0,%eax
     ca5:	e9 90 00 00 00       	jmp    d3a <_bmap+0x3ad>
     caa:	8b 45 00             	mov    0x0(%ebp),%eax
     cad:	0f b7 34 78          	movzwl (%eax,%edi,2),%esi
     cb1:	e9 03 fe ff ff       	jmp    ab9 <_bmap+0x12c>
     cb6:	83 ec 08             	sub    $0x8,%esp
     cb9:	0f b7 c0             	movzwl %ax,%eax
     cbc:	50                   	push   %eax
     cbd:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     cc1:	50                   	push   %eax
     cc2:	e8 fc ff ff ff       	call   cc3 <_bmap+0x336>
     cc7:	89 c5                	mov    %eax,%ebp
     cc9:	83 c4 10             	add    $0x10,%esp
     ccc:	85 c0                	test   %eax,%eax
     cce:	75 da                	jne    caa <_bmap+0x31d>
     cd0:	e9 63 ff ff ff       	jmp    c38 <_bmap+0x2ab>
     cd5:	01 ff                	add    %edi,%edi
     cd7:	8b 00                	mov    (%eax),%eax
     cd9:	0f b7 34 38          	movzwl (%eax,%edi,1),%esi
     cdd:	85 f6                	test   %esi,%esi
     cdf:	0f 85 d4 fd ff ff    	jne    ab9 <_bmap+0x12c>
     ce5:	e9 ae fd ff ff       	jmp    a98 <_bmap+0x10b>
     cea:	8b 44 24 08          	mov    0x8(%esp),%eax
     cee:	25 ff 01 00 00       	and    $0x1ff,%eax
     cf3:	8d 2c 00             	lea    (%eax,%eax,1),%ebp
     cf6:	8b 07                	mov    (%edi),%eax
     cf8:	0f b7 34 28          	movzwl (%eax,%ebp,1),%esi
     cfc:	85 f6                	test   %esi,%esi
     cfe:	0f 85 d1 fe ff ff    	jne    bd5 <_bmap+0x248>
     d04:	e9 ac fe ff ff       	jmp    bb5 <_bmap+0x228>
     d09:	8b 54 24 08          	mov    0x8(%esp),%edx
     d0d:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
     d13:	8b 07                	mov    (%edi),%eax
     d15:	0f b7 34 50          	movzwl (%eax,%edx,2),%esi
     d19:	e9 b7 fe ff ff       	jmp    bd5 <_bmap+0x248>
     d1e:	83 ec 08             	sub    $0x8,%esp
     d21:	55                   	push   %ebp
     d22:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
     d26:	50                   	push   %eax
     d27:	e8 fc ff ff ff       	call   d28 <_bmap+0x39b>
     d2c:	89 c7                	mov    %eax,%edi
     d2e:	83 c4 10             	add    $0x10,%esp
     d31:	85 c0                	test   %eax,%eax
     d33:	75 d4                	jne    d09 <_bmap+0x37c>
     d35:	e9 08 ff ff ff       	jmp    c42 <_bmap+0x2b5>
     d3a:	83 c4 1c             	add    $0x1c,%esp
     d3d:	5b                   	pop    %ebx
     d3e:	5e                   	pop    %esi
     d3f:	5f                   	pop    %edi
     d40:	5d                   	pop    %ebp
     d41:	c3                   	ret    

00000d42 <invalidate_inodes>:
     d42:	55                   	push   %ebp
     d43:	57                   	push   %edi
     d44:	56                   	push   %esi
     d45:	53                   	push   %ebx
     d46:	83 ec 0c             	sub    $0xc,%esp
     d49:	8b 6c 24 20          	mov    0x20(%esp),%ebp
     d4d:	be 20 00 00 00       	mov    $0x20,%esi
     d52:	bf 20 07 00 00       	mov    $0x720,%edi
     d57:	fa                   	cli    
     d58:	89 f3                	mov    %esi,%ebx
     d5a:	80 7e 12 00          	cmpb   $0x0,0x12(%esi)
     d5e:	74 12                	je     d72 <invalidate_inodes+0x30>
     d60:	83 ec 0c             	sub    $0xc,%esp
     d63:	53                   	push   %ebx
     d64:	e8 fc ff ff ff       	call   d65 <invalidate_inodes+0x23>
     d69:	83 c4 10             	add    $0x10,%esp
     d6c:	80 7b 12 00          	cmpb   $0x0,0x12(%ebx)
     d70:	75 ee                	jne    d60 <invalidate_inodes+0x1e>
     d72:	fb                   	sti    
     d73:	0f b7 43 0c          	movzwl 0xc(%ebx),%eax
     d77:	39 e8                	cmp    %ebp,%eax
     d79:	75 21                	jne    d9c <invalidate_inodes+0x5a>
     d7b:	66 83 7b 10 00       	cmpw   $0x0,0x10(%ebx)
     d80:	74 10                	je     d92 <invalidate_inodes+0x50>
     d82:	83 ec 0c             	sub    $0xc,%esp
     d85:	68 60 00 00 00       	push   $0x60
     d8a:	e8 fc ff ff ff       	call   d8b <invalidate_inodes+0x49>
     d8f:	83 c4 10             	add    $0x10,%esp
     d92:	c6 43 13 00          	movb   $0x0,0x13(%ebx)
     d96:	66 c7 43 0c 00 00    	movw   $0x0,0xc(%ebx)
     d9c:	83 c6 38             	add    $0x38,%esi
     d9f:	39 fe                	cmp    %edi,%esi
     da1:	75 b4                	jne    d57 <invalidate_inodes+0x15>
     da3:	83 c4 0c             	add    $0xc,%esp
     da6:	5b                   	pop    %ebx
     da7:	5e                   	pop    %esi
     da8:	5f                   	pop    %edi
     da9:	5d                   	pop    %ebp
     daa:	c3                   	ret    

00000dab <sync_inodes>:
     dab:	56                   	push   %esi
     dac:	53                   	push   %ebx
     dad:	83 ec 04             	sub    $0x4,%esp
     db0:	bb 00 00 00 00       	mov    $0x0,%ebx
     db5:	fa                   	cli    
     db6:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     dba:	74 15                	je     dd1 <sync_inodes+0x26>
     dbc:	8d 73 20             	lea    0x20(%ebx),%esi
     dbf:	83 ec 0c             	sub    $0xc,%esp
     dc2:	56                   	push   %esi
     dc3:	e8 fc ff ff ff       	call   dc4 <sync_inodes+0x19>
     dc8:	83 c4 10             	add    $0x10,%esp
     dcb:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     dcf:	75 ee                	jne    dbf <sync_inodes+0x14>
     dd1:	fb                   	sti    
     dd2:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     dd6:	74 0d                	je     de5 <sync_inodes+0x3a>
     dd8:	80 7b 34 00          	cmpb   $0x0,0x34(%ebx)
     ddc:	75 07                	jne    de5 <sync_inodes+0x3a>
     dde:	89 d8                	mov    %ebx,%eax
     de0:	e8 b2 fa ff ff       	call   897 <write_inode>
     de5:	83 c3 38             	add    $0x38,%ebx
     de8:	81 fb 00 07 00 00    	cmp    $0x700,%ebx
     dee:	75 c5                	jne    db5 <sync_inodes+0xa>
     df0:	83 c4 04             	add    $0x4,%esp
     df3:	5b                   	pop    %ebx
     df4:	5e                   	pop    %esi
     df5:	c3                   	ret    

00000df6 <bmap>:
     df6:	83 ec 0c             	sub    $0xc,%esp
     df9:	b9 00 00 00 00       	mov    $0x0,%ecx
     dfe:	8b 54 24 14          	mov    0x14(%esp),%edx
     e02:	8b 44 24 10          	mov    0x10(%esp),%eax
     e06:	e8 82 fb ff ff       	call   98d <_bmap>
     e0b:	83 c4 0c             	add    $0xc,%esp
     e0e:	c3                   	ret    

00000e0f <create_block>:
     e0f:	83 ec 0c             	sub    $0xc,%esp
     e12:	b9 01 00 00 00       	mov    $0x1,%ecx
     e17:	8b 54 24 14          	mov    0x14(%esp),%edx
     e1b:	8b 44 24 10          	mov    0x10(%esp),%eax
     e1f:	e8 69 fb ff ff       	call   98d <_bmap>
     e24:	83 c4 0c             	add    $0xc,%esp
     e27:	c3                   	ret    

00000e28 <iput>:
     e28:	56                   	push   %esi
     e29:	53                   	push   %ebx
     e2a:	83 ec 04             	sub    $0x4,%esp
     e2d:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     e31:	85 db                	test   %ebx,%ebx
     e33:	0f 84 4d 01 00 00    	je     f86 <iput+0x15e>
     e39:	fa                   	cli    
     e3a:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     e3e:	74 15                	je     e55 <iput+0x2d>
     e40:	8d 73 20             	lea    0x20(%ebx),%esi
     e43:	83 ec 0c             	sub    $0xc,%esp
     e46:	56                   	push   %esi
     e47:	e8 fc ff ff ff       	call   e48 <iput+0x20>
     e4c:	83 c4 10             	add    $0x10,%esp
     e4f:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     e53:	75 ee                	jne    e43 <iput+0x1b>
     e55:	fb                   	sti    
     e56:	66 83 7b 30 00       	cmpw   $0x0,0x30(%ebx)
     e5b:	75 10                	jne    e6d <iput+0x45>
     e5d:	83 ec 0c             	sub    $0xc,%esp
     e60:	68 80 00 00 00       	push   $0x80
     e65:	e8 fc ff ff ff       	call   e66 <iput+0x3e>
     e6a:	83 c4 10             	add    $0x10,%esp
     e6d:	80 7b 34 00          	cmpb   $0x0,0x34(%ebx)
     e71:	74 55                	je     ec8 <iput+0xa0>
     e73:	83 ec 0c             	sub    $0xc,%esp
     e76:	8d 43 20             	lea    0x20(%ebx),%eax
     e79:	50                   	push   %eax
     e7a:	e8 fc ff ff ff       	call   e7b <iput+0x53>
     e7f:	8b 43 30             	mov    0x30(%ebx),%eax
     e82:	48                   	dec    %eax
     e83:	66 89 43 30          	mov    %ax,0x30(%ebx)
     e87:	83 c4 10             	add    $0x10,%esp
     e8a:	66 85 c0             	test   %ax,%ax
     e8d:	0f 85 f3 00 00 00    	jne    f86 <iput+0x15e>
     e93:	83 ec 0c             	sub    $0xc,%esp
     e96:	ff 73 04             	pushl  0x4(%ebx)
     e99:	e8 fc ff ff ff       	call   e9a <iput+0x72>
     e9e:	83 c4 10             	add    $0x10,%esp
     ea1:	85 c0                	test   %eax,%eax
     ea3:	75 10                	jne    eb5 <iput+0x8d>
     ea5:	83 ec 0c             	sub    $0xc,%esp
     ea8:	68 a0 00 00 00       	push   $0xa0
     ead:	e8 fc ff ff ff       	call   eae <iput+0x86>
     eb2:	83 c4 10             	add    $0x10,%esp
     eb5:	66 c7 43 30 00 00    	movw   $0x0,0x30(%ebx)
     ebb:	c6 43 33 00          	movb   $0x0,0x33(%ebx)
     ebf:	c6 43 34 00          	movb   $0x0,0x34(%ebx)
     ec3:	e9 be 00 00 00       	jmp    f86 <iput+0x15e>
     ec8:	66 83 7b 2c 00       	cmpw   $0x0,0x2c(%ebx)
     ecd:	75 09                	jne    ed8 <iput+0xb0>
     ecf:	66 ff 4b 30          	decw   0x30(%ebx)
     ed3:	e9 ae 00 00 00       	jmp    f86 <iput+0x15e>
     ed8:	8b 03                	mov    (%ebx),%eax
     eda:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     edf:	66 3d 00 60          	cmp    $0x6000,%ax
     ee3:	75 2d                	jne    f12 <iput+0xea>
     ee5:	83 ec 0c             	sub    $0xc,%esp
     ee8:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
     eec:	50                   	push   %eax
     eed:	e8 fc ff ff ff       	call   eee <iput+0xc6>
     ef2:	fa                   	cli    
     ef3:	83 c4 10             	add    $0x10,%esp
     ef6:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     efa:	74 15                	je     f11 <iput+0xe9>
     efc:	8d 73 20             	lea    0x20(%ebx),%esi
     eff:	83 ec 0c             	sub    $0xc,%esp
     f02:	56                   	push   %esi
     f03:	e8 fc ff ff ff       	call   f04 <iput+0xdc>
     f08:	83 c4 10             	add    $0x10,%esp
     f0b:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     f0f:	75 ee                	jne    eff <iput+0xd7>
     f11:	fb                   	sti    
     f12:	8b 43 30             	mov    0x30(%ebx),%eax
     f15:	66 83 f8 01          	cmp    $0x1,%ax
     f19:	77 11                	ja     f2c <iput+0x104>
     f1b:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
     f1f:	74 18                	je     f39 <iput+0x111>
     f21:	8d 73 20             	lea    0x20(%ebx),%esi
     f24:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     f28:	75 2b                	jne    f55 <iput+0x12d>
     f2a:	eb 55                	jmp    f81 <iput+0x159>
     f2c:	48                   	dec    %eax
     f2d:	66 89 43 30          	mov    %ax,0x30(%ebx)
     f31:	eb 53                	jmp    f86 <iput+0x15e>
     f33:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
     f37:	75 16                	jne    f4f <iput+0x127>
     f39:	83 ec 0c             	sub    $0xc,%esp
     f3c:	53                   	push   %ebx
     f3d:	e8 fc ff ff ff       	call   f3e <iput+0x116>
     f42:	89 1c 24             	mov    %ebx,(%esp)
     f45:	e8 fc ff ff ff       	call   f46 <iput+0x11e>
     f4a:	83 c4 10             	add    $0x10,%esp
     f4d:	eb 37                	jmp    f86 <iput+0x15e>
     f4f:	80 7b 33 00          	cmpb   $0x0,0x33(%ebx)
     f53:	74 2c                	je     f81 <iput+0x159>
     f55:	89 d8                	mov    %ebx,%eax
     f57:	e8 3b f9 ff ff       	call   897 <write_inode>
     f5c:	fa                   	cli    
     f5d:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     f61:	74 12                	je     f75 <iput+0x14d>
     f63:	83 ec 0c             	sub    $0xc,%esp
     f66:	56                   	push   %esi
     f67:	e8 fc ff ff ff       	call   f68 <iput+0x140>
     f6c:	83 c4 10             	add    $0x10,%esp
     f6f:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
     f73:	75 ee                	jne    f63 <iput+0x13b>
     f75:	fb                   	sti    
     f76:	8b 43 30             	mov    0x30(%ebx),%eax
     f79:	66 83 f8 01          	cmp    $0x1,%ax
     f7d:	76 b4                	jbe    f33 <iput+0x10b>
     f7f:	eb ab                	jmp    f2c <iput+0x104>
     f81:	48                   	dec    %eax
     f82:	66 89 43 30          	mov    %ax,0x30(%ebx)
     f86:	83 c4 04             	add    $0x4,%esp
     f89:	5b                   	pop    %ebx
     f8a:	5e                   	pop    %esi
     f8b:	c3                   	ret    

00000f8c <get_empty_inode>:
     f8c:	57                   	push   %edi
     f8d:	56                   	push   %esi
     f8e:	53                   	push   %ebx
     f8f:	bb 2e 07 00 00       	mov    $0x72e,%ebx
     f94:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     f9a:	ba 20 00 00 00       	mov    $0x20,%edx
     f9f:	bf 00 00 00 00       	mov    $0x0,%edi
     fa4:	8d 41 38             	lea    0x38(%ecx),%eax
     fa7:	3d 00 07 00 00       	cmp    $0x700,%eax
     fac:	72 05                	jb     fb3 <get_empty_inode+0x27>
     fae:	b8 00 00 00 00       	mov    $0x0,%eax
     fb3:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
     fb8:	75 12                	jne    fcc <get_empty_inode+0x40>
     fba:	66 83 78 32 00       	cmpw   $0x0,0x32(%eax)
     fbf:	75 09                	jne    fca <get_empty_inode+0x3e>
     fc1:	a3 00 00 00 00       	mov    %eax,0x0
     fc6:	89 c7                	mov    %eax,%edi
     fc8:	eb 0c                	jmp    fd6 <get_empty_inode+0x4a>
     fca:	89 c7                	mov    %eax,%edi
     fcc:	89 c1                	mov    %eax,%ecx
     fce:	4a                   	dec    %edx
     fcf:	75 d3                	jne    fa4 <get_empty_inode+0x18>
     fd1:	a3 00 00 00 00       	mov    %eax,0x0
     fd6:	85 ff                	test   %edi,%edi
     fd8:	75 35                	jne    100f <get_empty_inode+0x83>
     fda:	be 2e 00 00 00       	mov    $0x2e,%esi
     fdf:	83 ec 04             	sub    $0x4,%esp
     fe2:	0f b7 06             	movzwl (%esi),%eax
     fe5:	50                   	push   %eax
     fe6:	0f b7 46 fe          	movzwl -0x2(%esi),%eax
     fea:	50                   	push   %eax
     feb:	68 a6 00 00 00       	push   $0xa6
     ff0:	e8 fc ff ff ff       	call   ff1 <get_empty_inode+0x65>
     ff5:	83 c6 38             	add    $0x38,%esi
     ff8:	83 c4 10             	add    $0x10,%esp
     ffb:	39 de                	cmp    %ebx,%esi
     ffd:	75 e0                	jne    fdf <get_empty_inode+0x53>
     fff:	83 ec 0c             	sub    $0xc,%esp
    1002:	68 b1 00 00 00       	push   $0xb1
    1007:	e8 fc ff ff ff       	call   1008 <get_empty_inode+0x7c>
    100c:	83 c4 10             	add    $0x10,%esp
    100f:	fa                   	cli    
    1010:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    1014:	74 15                	je     102b <get_empty_inode+0x9f>
    1016:	8d 77 20             	lea    0x20(%edi),%esi
    1019:	83 ec 0c             	sub    $0xc,%esp
    101c:	56                   	push   %esi
    101d:	e8 fc ff ff ff       	call   101e <get_empty_inode+0x92>
    1022:	83 c4 10             	add    $0x10,%esp
    1025:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    1029:	75 ee                	jne    1019 <get_empty_inode+0x8d>
    102b:	fb                   	sti    
    102c:	80 7f 33 00          	cmpb   $0x0,0x33(%edi)
    1030:	74 2a                	je     105c <get_empty_inode+0xd0>
    1032:	8d 77 20             	lea    0x20(%edi),%esi
    1035:	89 f8                	mov    %edi,%eax
    1037:	e8 5b f8 ff ff       	call   897 <write_inode>
    103c:	fa                   	cli    
    103d:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    1041:	74 12                	je     1055 <get_empty_inode+0xc9>
    1043:	83 ec 0c             	sub    $0xc,%esp
    1046:	56                   	push   %esi
    1047:	e8 fc ff ff ff       	call   1048 <get_empty_inode+0xbc>
    104c:	83 c4 10             	add    $0x10,%esp
    104f:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    1053:	75 ee                	jne    1043 <get_empty_inode+0xb7>
    1055:	fb                   	sti    
    1056:	80 7f 33 00          	cmpb   $0x0,0x33(%edi)
    105a:	75 d9                	jne    1035 <get_empty_inode+0xa9>
    105c:	66 83 7f 30 00       	cmpw   $0x0,0x30(%edi)
    1061:	0f 85 2d ff ff ff    	jne    f94 <get_empty_inode+0x8>
    1067:	b9 38 00 00 00       	mov    $0x38,%ecx
    106c:	b0 00                	mov    $0x0,%al
    106e:	fc                   	cld    
    106f:	57                   	push   %edi
    1070:	f3 aa                	rep stos %al,%es:(%edi)
    1072:	5f                   	pop    %edi
    1073:	66 c7 47 30 01 00    	movw   $0x1,0x30(%edi)
    1079:	89 f8                	mov    %edi,%eax
    107b:	5b                   	pop    %ebx
    107c:	5e                   	pop    %esi
    107d:	5f                   	pop    %edi
    107e:	c3                   	ret    

0000107f <get_pipe_inode>:
    107f:	53                   	push   %ebx
    1080:	83 ec 08             	sub    $0x8,%esp
    1083:	e8 fc ff ff ff       	call   1084 <get_pipe_inode+0x5>
    1088:	85 c0                	test   %eax,%eax
    108a:	74 38                	je     10c4 <get_pipe_inode+0x45>
    108c:	89 c3                	mov    %eax,%ebx
    108e:	83 ec 0c             	sub    $0xc,%esp
    1091:	6a 00                	push   $0x0
    1093:	e8 fc ff ff ff       	call   1094 <get_pipe_inode+0x15>
    1098:	89 43 04             	mov    %eax,0x4(%ebx)
    109b:	83 c4 10             	add    $0x10,%esp
    109e:	85 c0                	test   %eax,%eax
    10a0:	75 08                	jne    10aa <get_pipe_inode+0x2b>
    10a2:	66 c7 43 30 00 00    	movw   $0x0,0x30(%ebx)
    10a8:	eb 1f                	jmp    10c9 <get_pipe_inode+0x4a>
    10aa:	66 c7 43 30 02 00    	movw   $0x2,0x30(%ebx)
    10b0:	66 c7 43 10 00 00    	movw   $0x0,0x10(%ebx)
    10b6:	66 c7 43 0e 00 00    	movw   $0x0,0xe(%ebx)
    10bc:	c6 43 34 01          	movb   $0x1,0x34(%ebx)
    10c0:	89 d8                	mov    %ebx,%eax
    10c2:	eb 05                	jmp    10c9 <get_pipe_inode+0x4a>
    10c4:	b8 00 00 00 00       	mov    $0x0,%eax
    10c9:	83 c4 08             	add    $0x8,%esp
    10cc:	5b                   	pop    %ebx
    10cd:	c3                   	ret    

000010ce <iget>:
    10ce:	55                   	push   %ebp
    10cf:	57                   	push   %edi
    10d0:	56                   	push   %esi
    10d1:	53                   	push   %ebx
    10d2:	83 ec 1c             	sub    $0x1c,%esp
    10d5:	83 7c 24 30 00       	cmpl   $0x0,0x30(%esp)
    10da:	75 10                	jne    10ec <iget+0x1e>
    10dc:	83 ec 0c             	sub    $0xc,%esp
    10df:	68 c7 00 00 00       	push   $0xc7
    10e4:	e8 fc ff ff ff       	call   10e5 <iget+0x17>
    10e9:	83 c4 10             	add    $0x10,%esp
    10ec:	e8 fc ff ff ff       	call   10ed <iget+0x1f>
    10f1:	89 c3                	mov    %eax,%ebx
    10f3:	bf 00 00 00 00       	mov    $0x0,%edi
    10f8:	0f b7 77 2c          	movzwl 0x2c(%edi),%esi
    10fc:	3b 74 24 30          	cmp    0x30(%esp),%esi
    1100:	75 0e                	jne    1110 <iget+0x42>
    1102:	0f b7 47 2e          	movzwl 0x2e(%edi),%eax
    1106:	89 44 24 0c          	mov    %eax,0xc(%esp)
    110a:	3b 44 24 34          	cmp    0x34(%esp),%eax
    110e:	74 10                	je     1120 <iget+0x52>
    1110:	83 c7 38             	add    $0x38,%edi
    1113:	81 ff 00 07 00 00    	cmp    $0x700,%edi
    1119:	72 dd                	jb     10f8 <iget+0x2a>
    111b:	e9 9d 00 00 00       	jmp    11bd <iget+0xef>
    1120:	fa                   	cli    
    1121:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    1125:	74 15                	je     113c <iget+0x6e>
    1127:	8d 6f 20             	lea    0x20(%edi),%ebp
    112a:	83 ec 0c             	sub    $0xc,%esp
    112d:	55                   	push   %ebp
    112e:	e8 fc ff ff ff       	call   112f <iget+0x61>
    1133:	83 c4 10             	add    $0x10,%esp
    1136:	80 7f 32 00          	cmpb   $0x0,0x32(%edi)
    113a:	75 ee                	jne    112a <iget+0x5c>
    113c:	fb                   	sti    
    113d:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    1141:	3b 44 24 30          	cmp    0x30(%esp),%eax
    1145:	0f 85 98 01 00 00    	jne    12e3 <iget+0x215>
    114b:	0f b7 57 2e          	movzwl 0x2e(%edi),%edx
    114f:	3b 54 24 34          	cmp    0x34(%esp),%edx
    1153:	0f 85 88 01 00 00    	jne    12e1 <iget+0x213>
    1159:	66 ff 47 30          	incw   0x30(%edi)
    115d:	80 7f 35 00          	cmpb   $0x0,0x35(%edi)
    1161:	74 3f                	je     11a2 <iget+0xd4>
    1163:	39 3d 5c 00 00 00    	cmp    %edi,0x5c
    1169:	0f 84 47 01 00 00    	je     12b6 <iget+0x1e8>
    116f:	b8 c8 00 00 00       	mov    $0xc8,%eax
    1174:	be 01 00 00 00       	mov    $0x1,%esi
    1179:	39 38                	cmp    %edi,(%eax)
    117b:	0f 84 3a 01 00 00    	je     12bb <iget+0x1ed>
    1181:	46                   	inc    %esi
    1182:	83 c0 6c             	add    $0x6c,%eax
    1185:	83 fe 08             	cmp    $0x8,%esi
    1188:	75 ef                	jne    1179 <iget+0xab>
    118a:	e9 0b 01 00 00       	jmp    129a <iget+0x1cc>
    118f:	83 ec 0c             	sub    $0xc,%esp
    1192:	53                   	push   %ebx
    1193:	e8 fc ff ff ff       	call   1194 <iget+0xc6>
    1198:	83 c4 10             	add    $0x10,%esp
    119b:	89 f8                	mov    %edi,%eax
    119d:	e9 57 01 00 00       	jmp    12f9 <iget+0x22b>
    11a2:	85 db                	test   %ebx,%ebx
    11a4:	0f 84 e5 00 00 00    	je     128f <iget+0x1c1>
    11aa:	83 ec 0c             	sub    $0xc,%esp
    11ad:	53                   	push   %ebx
    11ae:	e8 fc ff ff ff       	call   11af <iget+0xe1>
    11b3:	83 c4 10             	add    $0x10,%esp
    11b6:	89 f8                	mov    %edi,%eax
    11b8:	e9 3c 01 00 00       	jmp    12f9 <iget+0x22b>
    11bd:	85 db                	test   %ebx,%ebx
    11bf:	0f 84 ce 00 00 00    	je     1293 <iget+0x1c5>
    11c5:	8b 44 24 30          	mov    0x30(%esp),%eax
    11c9:	66 89 43 2c          	mov    %ax,0x2c(%ebx)
    11cd:	8b 44 24 34          	mov    0x34(%esp),%eax
    11d1:	66 89 43 2e          	mov    %ax,0x2e(%ebx)
    11d5:	fa                   	cli    
    11d6:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
    11da:	74 15                	je     11f1 <iget+0x123>
    11dc:	8d 73 20             	lea    0x20(%ebx),%esi
    11df:	83 ec 0c             	sub    $0xc,%esp
    11e2:	56                   	push   %esi
    11e3:	e8 fc ff ff ff       	call   11e4 <iget+0x116>
    11e8:	83 c4 10             	add    $0x10,%esp
    11eb:	80 7b 32 00          	cmpb   $0x0,0x32(%ebx)
    11ef:	75 ee                	jne    11df <iget+0x111>
    11f1:	c6 43 32 01          	movb   $0x1,0x32(%ebx)
    11f5:	fb                   	sti    
    11f6:	83 ec 0c             	sub    $0xc,%esp
    11f9:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    11fd:	50                   	push   %eax
    11fe:	e8 fc ff ff ff       	call   11ff <iget+0x131>
    1203:	89 c6                	mov    %eax,%esi
    1205:	83 c4 10             	add    $0x10,%esp
    1208:	85 c0                	test   %eax,%eax
    120a:	75 10                	jne    121c <iget+0x14e>
    120c:	83 ec 0c             	sub    $0xc,%esp
    120f:	68 c0 00 00 00       	push   $0xc0
    1214:	e8 fc ff ff ff       	call   1215 <iget+0x147>
    1219:	83 c4 10             	add    $0x10,%esp
    121c:	83 ec 08             	sub    $0x8,%esp
    121f:	0f b7 56 04          	movzwl 0x4(%esi),%edx
    1223:	0f b7 46 06          	movzwl 0x6(%esi),%eax
    1227:	8d 54 02 02          	lea    0x2(%edx,%eax,1),%edx
    122b:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
    122f:	48                   	dec    %eax
    1230:	c1 e8 05             	shr    $0x5,%eax
    1233:	01 d0                	add    %edx,%eax
    1235:	50                   	push   %eax
    1236:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    123a:	50                   	push   %eax
    123b:	e8 fc ff ff ff       	call   123c <iget+0x16e>
    1240:	89 c5                	mov    %eax,%ebp
    1242:	83 c4 10             	add    $0x10,%esp
    1245:	85 c0                	test   %eax,%eax
    1247:	75 10                	jne    1259 <iget+0x18b>
    1249:	83 ec 0c             	sub    $0xc,%esp
    124c:	68 6a 00 00 00       	push   $0x6a
    1251:	e8 fc ff ff ff       	call   1252 <iget+0x184>
    1256:	83 c4 10             	add    $0x10,%esp
    1259:	0f b7 73 2e          	movzwl 0x2e(%ebx),%esi
    125d:	4e                   	dec    %esi
    125e:	83 e6 1f             	and    $0x1f,%esi
    1261:	c1 e6 05             	shl    $0x5,%esi
    1264:	03 75 00             	add    0x0(%ebp),%esi
    1267:	b9 08 00 00 00       	mov    $0x8,%ecx
    126c:	89 df                	mov    %ebx,%edi
    126e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    1270:	83 ec 0c             	sub    $0xc,%esp
    1273:	55                   	push   %ebp
    1274:	e8 fc ff ff ff       	call   1275 <iget+0x1a7>
    1279:	c6 43 32 00          	movb   $0x0,0x32(%ebx)
    127d:	8d 43 20             	lea    0x20(%ebx),%eax
    1280:	89 04 24             	mov    %eax,(%esp)
    1283:	e8 fc ff ff ff       	call   1284 <iget+0x1b6>
    1288:	83 c4 10             	add    $0x10,%esp
    128b:	89 d8                	mov    %ebx,%eax
    128d:	eb 6a                	jmp    12f9 <iget+0x22b>
    128f:	89 f8                	mov    %edi,%eax
    1291:	eb 66                	jmp    12f9 <iget+0x22b>
    1293:	b8 00 00 00 00       	mov    $0x0,%eax
    1298:	eb 5f                	jmp    12f9 <iget+0x22b>
    129a:	83 ec 0c             	sub    $0xc,%esp
    129d:	68 d8 00 00 00       	push   $0xd8
    12a2:	e8 fc ff ff ff       	call   12a3 <iget+0x1d5>
    12a7:	83 c4 10             	add    $0x10,%esp
    12aa:	85 db                	test   %ebx,%ebx
    12ac:	0f 85 dd fe ff ff    	jne    118f <iget+0xc1>
    12b2:	89 f8                	mov    %edi,%eax
    12b4:	eb 43                	jmp    12f9 <iget+0x22b>
    12b6:	be 00 00 00 00       	mov    $0x0,%esi
    12bb:	83 ec 0c             	sub    $0xc,%esp
    12be:	57                   	push   %edi
    12bf:	e8 fc ff ff ff       	call   12c0 <iget+0x1f2>
    12c4:	8d 04 36             	lea    (%esi,%esi,1),%eax
    12c7:	01 c6                	add    %eax,%esi
    12c9:	8d 04 f6             	lea    (%esi,%esi,8),%eax
    12cc:	0f b7 34 85 54 00 00 	movzwl 0x54(,%eax,4),%esi
    12d3:	00 
    12d4:	83 c4 10             	add    $0x10,%esp
    12d7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    12de:	00 
    12df:	eb 02                	jmp    12e3 <iget+0x215>
    12e1:	89 c6                	mov    %eax,%esi
    12e3:	8b 44 24 0c          	mov    0xc(%esp),%eax
    12e7:	89 44 24 34          	mov    %eax,0x34(%esp)
    12eb:	89 74 24 30          	mov    %esi,0x30(%esp)
    12ef:	bf 00 00 00 00       	mov    $0x0,%edi
    12f4:	e9 ff fd ff ff       	jmp    10f8 <iget+0x2a>
    12f9:	83 c4 1c             	add    $0x1c,%esp
    12fc:	5b                   	pop    %ebx
    12fd:	5e                   	pop    %esi
    12fe:	5f                   	pop    %edi
    12ff:	5d                   	pop    %ebp
    1300:	c3                   	ret    

00001301 <find_buffer>:
    1301:	56                   	push   %esi
    1302:	53                   	push   %ebx
    1303:	89 c1                	mov    %eax,%ecx
    1305:	89 d3                	mov    %edx,%ebx
    1307:	31 d0                	xor    %edx,%eax
    1309:	be 33 01 00 00       	mov    $0x133,%esi
    130e:	ba 00 00 00 00       	mov    $0x0,%edx
    1313:	f7 f6                	div    %esi
    1315:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
    131c:	85 c0                	test   %eax,%eax
    131e:	74 16                	je     1336 <find_buffer+0x35>
    1320:	0f b7 50 08          	movzwl 0x8(%eax),%edx
    1324:	39 d1                	cmp    %edx,%ecx
    1326:	75 05                	jne    132d <find_buffer+0x2c>
    1328:	39 58 04             	cmp    %ebx,0x4(%eax)
    132b:	74 0e                	je     133b <find_buffer+0x3a>
    132d:	8b 40 18             	mov    0x18(%eax),%eax
    1330:	85 c0                	test   %eax,%eax
    1332:	75 ec                	jne    1320 <find_buffer+0x1f>
    1334:	eb 05                	jmp    133b <find_buffer+0x3a>
    1336:	b8 00 00 00 00       	mov    $0x0,%eax
    133b:	5b                   	pop    %ebx
    133c:	5e                   	pop    %esi
    133d:	c3                   	ret    

0000133e <sys_sync>:
    133e:	57                   	push   %edi
    133f:	56                   	push   %esi
    1340:	53                   	push   %ebx
    1341:	e8 fc ff ff ff       	call   1342 <sys_sync+0x4>
    1346:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    134c:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    1353:	7e 42                	jle    1397 <sys_sync+0x59>
    1355:	bf 00 00 00 00       	mov    $0x0,%edi
    135a:	fa                   	cli    
    135b:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    135f:	74 15                	je     1376 <sys_sync+0x38>
    1361:	8d 73 10             	lea    0x10(%ebx),%esi
    1364:	83 ec 0c             	sub    $0xc,%esp
    1367:	56                   	push   %esi
    1368:	e8 fc ff ff ff       	call   1369 <sys_sync+0x2b>
    136d:	83 c4 10             	add    $0x10,%esp
    1370:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1374:	75 ee                	jne    1364 <sys_sync+0x26>
    1376:	fb                   	sti    
    1377:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    137b:	74 0e                	je     138b <sys_sync+0x4d>
    137d:	83 ec 08             	sub    $0x8,%esp
    1380:	53                   	push   %ebx
    1381:	6a 01                	push   $0x1
    1383:	e8 fc ff ff ff       	call   1384 <sys_sync+0x46>
    1388:	83 c4 10             	add    $0x10,%esp
    138b:	47                   	inc    %edi
    138c:	83 c3 24             	add    $0x24,%ebx
    138f:	39 3d 00 00 00 00    	cmp    %edi,0x0
    1395:	7f c3                	jg     135a <sys_sync+0x1c>
    1397:	b8 00 00 00 00       	mov    $0x0,%eax
    139c:	5b                   	pop    %ebx
    139d:	5e                   	pop    %esi
    139e:	5f                   	pop    %edi
    139f:	c3                   	ret    

000013a0 <sync_dev>:
    13a0:	55                   	push   %ebp
    13a1:	57                   	push   %edi
    13a2:	56                   	push   %esi
    13a3:	53                   	push   %ebx
    13a4:	83 ec 0c             	sub    $0xc,%esp
    13a7:	8b 7c 24 20          	mov    0x20(%esp),%edi
    13ab:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    13b1:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    13b8:	7e 52                	jle    140c <sync_dev+0x6c>
    13ba:	be 00 00 00 00       	mov    $0x0,%esi
    13bf:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    13c3:	39 f8                	cmp    %edi,%eax
    13c5:	75 39                	jne    1400 <sync_dev+0x60>
    13c7:	fa                   	cli    
    13c8:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    13cc:	74 15                	je     13e3 <sync_dev+0x43>
    13ce:	8d 6b 10             	lea    0x10(%ebx),%ebp
    13d1:	83 ec 0c             	sub    $0xc,%esp
    13d4:	55                   	push   %ebp
    13d5:	e8 fc ff ff ff       	call   13d6 <sync_dev+0x36>
    13da:	83 c4 10             	add    $0x10,%esp
    13dd:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    13e1:	75 ee                	jne    13d1 <sync_dev+0x31>
    13e3:	fb                   	sti    
    13e4:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    13e8:	39 c7                	cmp    %eax,%edi
    13ea:	75 14                	jne    1400 <sync_dev+0x60>
    13ec:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    13f0:	74 0e                	je     1400 <sync_dev+0x60>
    13f2:	83 ec 08             	sub    $0x8,%esp
    13f5:	53                   	push   %ebx
    13f6:	6a 01                	push   $0x1
    13f8:	e8 fc ff ff ff       	call   13f9 <sync_dev+0x59>
    13fd:	83 c4 10             	add    $0x10,%esp
    1400:	46                   	inc    %esi
    1401:	83 c3 24             	add    $0x24,%ebx
    1404:	39 35 00 00 00 00    	cmp    %esi,0x0
    140a:	7f b3                	jg     13bf <sync_dev+0x1f>
    140c:	e8 fc ff ff ff       	call   140d <sync_dev+0x6d>
    1411:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1417:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    141e:	7e 52                	jle    1472 <sync_dev+0xd2>
    1420:	be 00 00 00 00       	mov    $0x0,%esi
    1425:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    1429:	39 c7                	cmp    %eax,%edi
    142b:	75 39                	jne    1466 <sync_dev+0xc6>
    142d:	fa                   	cli    
    142e:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1432:	74 15                	je     1449 <sync_dev+0xa9>
    1434:	8d 6b 10             	lea    0x10(%ebx),%ebp
    1437:	83 ec 0c             	sub    $0xc,%esp
    143a:	55                   	push   %ebp
    143b:	e8 fc ff ff ff       	call   143c <sync_dev+0x9c>
    1440:	83 c4 10             	add    $0x10,%esp
    1443:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1447:	75 ee                	jne    1437 <sync_dev+0x97>
    1449:	fb                   	sti    
    144a:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    144e:	39 c7                	cmp    %eax,%edi
    1450:	75 14                	jne    1466 <sync_dev+0xc6>
    1452:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    1456:	74 0e                	je     1466 <sync_dev+0xc6>
    1458:	83 ec 08             	sub    $0x8,%esp
    145b:	53                   	push   %ebx
    145c:	6a 01                	push   $0x1
    145e:	e8 fc ff ff ff       	call   145f <sync_dev+0xbf>
    1463:	83 c4 10             	add    $0x10,%esp
    1466:	46                   	inc    %esi
    1467:	83 c3 24             	add    $0x24,%ebx
    146a:	39 35 00 00 00 00    	cmp    %esi,0x0
    1470:	7f b3                	jg     1425 <sync_dev+0x85>
    1472:	b8 00 00 00 00       	mov    $0x0,%eax
    1477:	83 c4 0c             	add    $0xc,%esp
    147a:	5b                   	pop    %ebx
    147b:	5e                   	pop    %esi
    147c:	5f                   	pop    %edi
    147d:	5d                   	pop    %ebp
    147e:	c3                   	ret    

0000147f <invalidate_buffers>:
    147f:	55                   	push   %ebp
    1480:	57                   	push   %edi
    1481:	56                   	push   %esi
    1482:	53                   	push   %ebx
    1483:	83 ec 0c             	sub    $0xc,%esp
    1486:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    148a:	8b 35 00 00 00 00    	mov    0x0,%esi
    1490:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    1497:	7e 48                	jle    14e1 <invalidate_buffers+0x62>
    1499:	83 c6 10             	add    $0x10,%esi
    149c:	bf 00 00 00 00       	mov    $0x0,%edi
    14a1:	89 f3                	mov    %esi,%ebx
    14a3:	0f b7 46 f8          	movzwl -0x8(%esi),%eax
    14a7:	39 e8                	cmp    %ebp,%eax
    14a9:	75 2a                	jne    14d5 <invalidate_buffers+0x56>
    14ab:	fa                   	cli    
    14ac:	80 7e fd 00          	cmpb   $0x0,-0x3(%esi)
    14b0:	74 12                	je     14c4 <invalidate_buffers+0x45>
    14b2:	83 ec 0c             	sub    $0xc,%esp
    14b5:	53                   	push   %ebx
    14b6:	e8 fc ff ff ff       	call   14b7 <invalidate_buffers+0x38>
    14bb:	83 c4 10             	add    $0x10,%esp
    14be:	80 7b fd 00          	cmpb   $0x0,-0x3(%ebx)
    14c2:	75 ee                	jne    14b2 <invalidate_buffers+0x33>
    14c4:	fb                   	sti    
    14c5:	0f b7 43 f8          	movzwl -0x8(%ebx),%eax
    14c9:	39 c5                	cmp    %eax,%ebp
    14cb:	75 08                	jne    14d5 <invalidate_buffers+0x56>
    14cd:	c6 43 fb 00          	movb   $0x0,-0x5(%ebx)
    14d1:	c6 43 fa 00          	movb   $0x0,-0x6(%ebx)
    14d5:	47                   	inc    %edi
    14d6:	83 c6 24             	add    $0x24,%esi
    14d9:	39 3d 00 00 00 00    	cmp    %edi,0x0
    14df:	7f c0                	jg     14a1 <invalidate_buffers+0x22>
    14e1:	83 c4 0c             	add    $0xc,%esp
    14e4:	5b                   	pop    %ebx
    14e5:	5e                   	pop    %esi
    14e6:	5f                   	pop    %edi
    14e7:	5d                   	pop    %ebp
    14e8:	c3                   	ret    

000014e9 <check_disk_change>:
    14e9:	57                   	push   %edi
    14ea:	56                   	push   %esi
    14eb:	53                   	push   %ebx
    14ec:	8b 74 24 10          	mov    0x10(%esp),%esi
    14f0:	89 f0                	mov    %esi,%eax
    14f2:	c1 e8 08             	shr    $0x8,%eax
    14f5:	83 f8 02             	cmp    $0x2,%eax
    14f8:	75 4d                	jne    1547 <check_disk_change+0x5e>
    14fa:	83 ec 0c             	sub    $0xc,%esp
    14fd:	89 f0                	mov    %esi,%eax
    14ff:	83 e0 03             	and    $0x3,%eax
    1502:	50                   	push   %eax
    1503:	e8 fc ff ff ff       	call   1504 <check_disk_change+0x1b>
    1508:	83 c4 10             	add    $0x10,%esp
    150b:	85 c0                	test   %eax,%eax
    150d:	74 38                	je     1547 <check_disk_change+0x5e>
    150f:	bb 54 00 00 00       	mov    $0x54,%ebx
    1514:	bf b4 03 00 00       	mov    $0x3b4,%edi
    1519:	0f b7 03             	movzwl (%ebx),%eax
    151c:	39 c6                	cmp    %eax,%esi
    151e:	75 0c                	jne    152c <check_disk_change+0x43>
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	56                   	push   %esi
    1524:	e8 fc ff ff ff       	call   1525 <check_disk_change+0x3c>
    1529:	83 c4 10             	add    $0x10,%esp
    152c:	83 c3 6c             	add    $0x6c,%ebx
    152f:	39 fb                	cmp    %edi,%ebx
    1531:	75 e6                	jne    1519 <check_disk_change+0x30>
    1533:	83 ec 0c             	sub    $0xc,%esp
    1536:	56                   	push   %esi
    1537:	e8 fc ff ff ff       	call   1538 <check_disk_change+0x4f>
    153c:	89 34 24             	mov    %esi,(%esp)
    153f:	e8 fc ff ff ff       	call   1540 <check_disk_change+0x57>
    1544:	83 c4 10             	add    $0x10,%esp
    1547:	5b                   	pop    %ebx
    1548:	5e                   	pop    %esi
    1549:	5f                   	pop    %edi
    154a:	c3                   	ret    

0000154b <get_hash_table>:
    154b:	55                   	push   %ebp
    154c:	57                   	push   %edi
    154d:	56                   	push   %esi
    154e:	53                   	push   %ebx
    154f:	83 ec 0c             	sub    $0xc,%esp
    1552:	8b 7c 24 20          	mov    0x20(%esp),%edi
    1556:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    155a:	89 ea                	mov    %ebp,%edx
    155c:	89 f8                	mov    %edi,%eax
    155e:	e8 9e fd ff ff       	call   1301 <find_buffer>
    1563:	89 c3                	mov    %eax,%ebx
    1565:	85 c0                	test   %eax,%eax
    1567:	74 32                	je     159b <get_hash_table+0x50>
    1569:	fe 40 0c             	incb   0xc(%eax)
    156c:	fa                   	cli    
    156d:	80 78 0d 00          	cmpb   $0x0,0xd(%eax)
    1571:	74 15                	je     1588 <get_hash_table+0x3d>
    1573:	8d 70 10             	lea    0x10(%eax),%esi
    1576:	83 ec 0c             	sub    $0xc,%esp
    1579:	56                   	push   %esi
    157a:	e8 fc ff ff ff       	call   157b <get_hash_table+0x30>
    157f:	83 c4 10             	add    $0x10,%esp
    1582:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1586:	75 ee                	jne    1576 <get_hash_table+0x2b>
    1588:	fb                   	sti    
    1589:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    158d:	39 c7                	cmp    %eax,%edi
    158f:	75 05                	jne    1596 <get_hash_table+0x4b>
    1591:	39 6b 04             	cmp    %ebp,0x4(%ebx)
    1594:	74 0c                	je     15a2 <get_hash_table+0x57>
    1596:	fe 4b 0c             	decb   0xc(%ebx)
    1599:	eb bf                	jmp    155a <get_hash_table+0xf>
    159b:	b8 00 00 00 00       	mov    $0x0,%eax
    15a0:	eb 02                	jmp    15a4 <get_hash_table+0x59>
    15a2:	89 d8                	mov    %ebx,%eax
    15a4:	83 c4 0c             	add    $0xc,%esp
    15a7:	5b                   	pop    %ebx
    15a8:	5e                   	pop    %esi
    15a9:	5f                   	pop    %edi
    15aa:	5d                   	pop    %ebp
    15ab:	c3                   	ret    

000015ac <getblk>:
    15ac:	55                   	push   %ebp
    15ad:	57                   	push   %edi
    15ae:	56                   	push   %esi
    15af:	53                   	push   %ebx
    15b0:	83 ec 0c             	sub    $0xc,%esp
    15b3:	8b 74 24 20          	mov    0x20(%esp),%esi
    15b7:	83 ec 08             	sub    $0x8,%esp
    15ba:	ff 74 24 2c          	pushl  0x2c(%esp)
    15be:	56                   	push   %esi
    15bf:	e8 fc ff ff ff       	call   15c0 <getblk+0x14>
    15c4:	89 c3                	mov    %eax,%ebx
    15c6:	83 c4 10             	add    $0x10,%esp
    15c9:	85 c0                	test   %eax,%eax
    15cb:	0f 85 ca 01 00 00    	jne    179b <getblk+0x1ef>
    15d1:	8b 2d 08 07 00 00    	mov    0x708,%ebp
    15d7:	89 e8                	mov    %ebp,%eax
    15d9:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
    15dd:	75 30                	jne    160f <getblk+0x63>
    15df:	85 db                	test   %ebx,%ebx
    15e1:	74 1c                	je     15ff <getblk+0x53>
    15e3:	0f b6 50 0b          	movzbl 0xb(%eax),%edx
    15e7:	01 d2                	add    %edx,%edx
    15e9:	0f b6 48 0d          	movzbl 0xd(%eax),%ecx
    15ed:	01 d1                	add    %edx,%ecx
    15ef:	0f b6 53 0b          	movzbl 0xb(%ebx),%edx
    15f3:	01 d2                	add    %edx,%edx
    15f5:	0f b6 7b 0d          	movzbl 0xd(%ebx),%edi
    15f9:	01 fa                	add    %edi,%edx
    15fb:	39 d1                	cmp    %edx,%ecx
    15fd:	7d 10                	jge    160f <getblk+0x63>
    15ff:	0f b6 50 0b          	movzbl 0xb(%eax),%edx
    1603:	01 d2                	add    %edx,%edx
    1605:	0f b6 48 0d          	movzbl 0xd(%eax),%ecx
    1609:	01 ca                	add    %ecx,%edx
    160b:	74 0b                	je     1618 <getblk+0x6c>
    160d:	89 c3                	mov    %eax,%ebx
    160f:	8b 40 20             	mov    0x20(%eax),%eax
    1612:	39 c5                	cmp    %eax,%ebp
    1614:	75 c3                	jne    15d9 <getblk+0x2d>
    1616:	eb 02                	jmp    161a <getblk+0x6e>
    1618:	89 c3                	mov    %eax,%ebx
    161a:	85 db                	test   %ebx,%ebx
    161c:	75 12                	jne    1630 <getblk+0x84>
    161e:	83 ec 0c             	sub    $0xc,%esp
    1621:	68 04 07 00 00       	push   $0x704
    1626:	e8 fc ff ff ff       	call   1627 <getblk+0x7b>
    162b:	83 c4 10             	add    $0x10,%esp
    162e:	eb 87                	jmp    15b7 <getblk+0xb>
    1630:	fa                   	cli    
    1631:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1635:	74 15                	je     164c <getblk+0xa0>
    1637:	8d 7b 10             	lea    0x10(%ebx),%edi
    163a:	83 ec 0c             	sub    $0xc,%esp
    163d:	57                   	push   %edi
    163e:	e8 fc ff ff ff       	call   163f <getblk+0x93>
    1643:	83 c4 10             	add    $0x10,%esp
    1646:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    164a:	75 ee                	jne    163a <getblk+0x8e>
    164c:	fb                   	sti    
    164d:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
    1651:	0f 85 60 ff ff ff    	jne    15b7 <getblk+0xb>
    1657:	8d 7b 10             	lea    0x10(%ebx),%edi
    165a:	eb 34                	jmp    1690 <getblk+0xe4>
    165c:	83 ec 0c             	sub    $0xc,%esp
    165f:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    1663:	50                   	push   %eax
    1664:	e8 fc ff ff ff       	call   1665 <getblk+0xb9>
    1669:	fa                   	cli    
    166a:	83 c4 10             	add    $0x10,%esp
    166d:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1671:	74 12                	je     1685 <getblk+0xd9>
    1673:	83 ec 0c             	sub    $0xc,%esp
    1676:	57                   	push   %edi
    1677:	e8 fc ff ff ff       	call   1678 <getblk+0xcc>
    167c:	83 c4 10             	add    $0x10,%esp
    167f:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1683:	75 ee                	jne    1673 <getblk+0xc7>
    1685:	fb                   	sti    
    1686:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
    168a:	0f 85 27 ff ff ff    	jne    15b7 <getblk+0xb>
    1690:	80 7b 0b 00          	cmpb   $0x0,0xb(%ebx)
    1694:	75 c6                	jne    165c <getblk+0xb0>
    1696:	8b 54 24 24          	mov    0x24(%esp),%edx
    169a:	89 f0                	mov    %esi,%eax
    169c:	e8 60 fc ff ff       	call   1301 <find_buffer>
    16a1:	85 c0                	test   %eax,%eax
    16a3:	0f 85 0e ff ff ff    	jne    15b7 <getblk+0xb>
    16a9:	c6 43 0c 01          	movb   $0x1,0xc(%ebx)
    16ad:	c6 43 0b 00          	movb   $0x0,0xb(%ebx)
    16b1:	c6 43 0a 00          	movb   $0x0,0xa(%ebx)
    16b5:	8b 43 18             	mov    0x18(%ebx),%eax
    16b8:	85 c0                	test   %eax,%eax
    16ba:	74 06                	je     16c2 <getblk+0x116>
    16bc:	8b 53 14             	mov    0x14(%ebx),%edx
    16bf:	89 50 14             	mov    %edx,0x14(%eax)
    16c2:	8b 43 14             	mov    0x14(%ebx),%eax
    16c5:	85 c0                	test   %eax,%eax
    16c7:	74 06                	je     16cf <getblk+0x123>
    16c9:	8b 53 18             	mov    0x18(%ebx),%edx
    16cc:	89 50 18             	mov    %edx,0x18(%eax)
    16cf:	0f b7 43 08          	movzwl 0x8(%ebx),%eax
    16d3:	33 43 04             	xor    0x4(%ebx),%eax
    16d6:	b9 33 01 00 00       	mov    $0x133,%ecx
    16db:	ba 00 00 00 00       	mov    $0x0,%edx
    16e0:	f7 f1                	div    %ecx
    16e2:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
    16e9:	39 c3                	cmp    %eax,%ebx
    16eb:	75 0a                	jne    16f7 <getblk+0x14b>
    16ed:	8b 40 18             	mov    0x18(%eax),%eax
    16f0:	89 04 95 00 00 00 00 	mov    %eax,0x0(,%edx,4)
    16f7:	83 7b 1c 00          	cmpl   $0x0,0x1c(%ebx)
    16fb:	74 06                	je     1703 <getblk+0x157>
    16fd:	83 7b 20 00          	cmpl   $0x0,0x20(%ebx)
    1701:	75 10                	jne    1713 <getblk+0x167>
    1703:	83 ec 0c             	sub    $0xc,%esp
    1706:	68 f5 00 00 00       	push   $0xf5
    170b:	e8 fc ff ff ff       	call   170c <getblk+0x160>
    1710:	83 c4 10             	add    $0x10,%esp
    1713:	8b 43 1c             	mov    0x1c(%ebx),%eax
    1716:	8b 53 20             	mov    0x20(%ebx),%edx
    1719:	89 50 20             	mov    %edx,0x20(%eax)
    171c:	8b 43 20             	mov    0x20(%ebx),%eax
    171f:	8b 53 1c             	mov    0x1c(%ebx),%edx
    1722:	89 50 1c             	mov    %edx,0x1c(%eax)
    1725:	a1 08 07 00 00       	mov    0x708,%eax
    172a:	39 c3                	cmp    %eax,%ebx
    172c:	75 08                	jne    1736 <getblk+0x18a>
    172e:	8b 40 20             	mov    0x20(%eax),%eax
    1731:	a3 08 07 00 00       	mov    %eax,0x708
    1736:	66 89 73 08          	mov    %si,0x8(%ebx)
    173a:	8b 44 24 24          	mov    0x24(%esp),%eax
    173e:	89 43 04             	mov    %eax,0x4(%ebx)
    1741:	a1 08 07 00 00       	mov    0x708,%eax
    1746:	89 43 20             	mov    %eax,0x20(%ebx)
    1749:	8b 50 1c             	mov    0x1c(%eax),%edx
    174c:	89 53 1c             	mov    %edx,0x1c(%ebx)
    174f:	8b 50 1c             	mov    0x1c(%eax),%edx
    1752:	89 5a 20             	mov    %ebx,0x20(%edx)
    1755:	89 58 1c             	mov    %ebx,0x1c(%eax)
    1758:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    175f:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    1766:	8b 43 08             	mov    0x8(%ebx),%eax
    1769:	66 85 c0             	test   %ax,%ax
    176c:	74 2d                	je     179b <getblk+0x1ef>
    176e:	0f b7 c0             	movzwl %ax,%eax
    1771:	33 43 04             	xor    0x4(%ebx),%eax
    1774:	b9 33 01 00 00       	mov    $0x133,%ecx
    1779:	ba 00 00 00 00       	mov    $0x0,%edx
    177e:	f7 f1                	div    %ecx
    1780:	8b 04 95 00 00 00 00 	mov    0x0(,%edx,4),%eax
    1787:	89 43 18             	mov    %eax,0x18(%ebx)
    178a:	89 1c 95 00 00 00 00 	mov    %ebx,0x0(,%edx,4)
    1791:	8b 43 18             	mov    0x18(%ebx),%eax
    1794:	85 c0                	test   %eax,%eax
    1796:	74 03                	je     179b <getblk+0x1ef>
    1798:	89 58 14             	mov    %ebx,0x14(%eax)
    179b:	89 d8                	mov    %ebx,%eax
    179d:	83 c4 0c             	add    $0xc,%esp
    17a0:	5b                   	pop    %ebx
    17a1:	5e                   	pop    %esi
    17a2:	5f                   	pop    %edi
    17a3:	5d                   	pop    %ebp
    17a4:	c3                   	ret    

000017a5 <brelse>:
    17a5:	56                   	push   %esi
    17a6:	53                   	push   %ebx
    17a7:	83 ec 04             	sub    $0x4,%esp
    17aa:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    17ae:	85 db                	test   %ebx,%ebx
    17b0:	74 4a                	je     17fc <brelse+0x57>
    17b2:	fa                   	cli    
    17b3:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    17b7:	74 15                	je     17ce <brelse+0x29>
    17b9:	8d 73 10             	lea    0x10(%ebx),%esi
    17bc:	83 ec 0c             	sub    $0xc,%esp
    17bf:	56                   	push   %esi
    17c0:	e8 fc ff ff ff       	call   17c1 <brelse+0x1c>
    17c5:	83 c4 10             	add    $0x10,%esp
    17c8:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    17cc:	75 ee                	jne    17bc <brelse+0x17>
    17ce:	fb                   	sti    
    17cf:	8a 43 0c             	mov    0xc(%ebx),%al
    17d2:	8d 50 ff             	lea    -0x1(%eax),%edx
    17d5:	88 53 0c             	mov    %dl,0xc(%ebx)
    17d8:	84 c0                	test   %al,%al
    17da:	75 10                	jne    17ec <brelse+0x47>
    17dc:	83 ec 0c             	sub    $0xc,%esp
    17df:	68 0f 01 00 00       	push   $0x10f
    17e4:	e8 fc ff ff ff       	call   17e5 <brelse+0x40>
    17e9:	83 c4 10             	add    $0x10,%esp
    17ec:	83 ec 0c             	sub    $0xc,%esp
    17ef:	68 04 07 00 00       	push   $0x704
    17f4:	e8 fc ff ff ff       	call   17f5 <brelse+0x50>
    17f9:	83 c4 10             	add    $0x10,%esp
    17fc:	83 c4 04             	add    $0x4,%esp
    17ff:	5b                   	pop    %ebx
    1800:	5e                   	pop    %esi
    1801:	c3                   	ret    

00001802 <bread>:
    1802:	56                   	push   %esi
    1803:	53                   	push   %ebx
    1804:	83 ec 0c             	sub    $0xc,%esp
    1807:	ff 74 24 1c          	pushl  0x1c(%esp)
    180b:	ff 74 24 1c          	pushl  0x1c(%esp)
    180f:	e8 fc ff ff ff       	call   1810 <bread+0xe>
    1814:	89 c3                	mov    %eax,%ebx
    1816:	83 c4 10             	add    $0x10,%esp
    1819:	85 c0                	test   %eax,%eax
    181b:	75 10                	jne    182d <bread+0x2b>
    181d:	83 ec 0c             	sub    $0xc,%esp
    1820:	68 2a 01 00 00       	push   $0x12a
    1825:	e8 fc ff ff ff       	call   1826 <bread+0x24>
    182a:	83 c4 10             	add    $0x10,%esp
    182d:	80 7b 0a 00          	cmpb   $0x0,0xa(%ebx)
    1831:	75 58                	jne    188b <bread+0x89>
    1833:	83 ec 08             	sub    $0x8,%esp
    1836:	53                   	push   %ebx
    1837:	6a 00                	push   $0x0
    1839:	e8 fc ff ff ff       	call   183a <bread+0x38>
    183e:	fa                   	cli    
    183f:	83 c4 10             	add    $0x10,%esp
    1842:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1846:	74 15                	je     185d <bread+0x5b>
    1848:	8d 73 10             	lea    0x10(%ebx),%esi
    184b:	83 ec 0c             	sub    $0xc,%esp
    184e:	56                   	push   %esi
    184f:	e8 fc ff ff ff       	call   1850 <bread+0x4e>
    1854:	83 c4 10             	add    $0x10,%esp
    1857:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    185b:	75 ee                	jne    184b <bread+0x49>
    185d:	fb                   	sti    
    185e:	89 d8                	mov    %ebx,%eax
    1860:	80 7b 0a 00          	cmpb   $0x0,0xa(%ebx)
    1864:	75 27                	jne    188d <bread+0x8b>
    1866:	83 ec 0c             	sub    $0xc,%esp
    1869:	53                   	push   %ebx
    186a:	e8 fc ff ff ff       	call   186b <bread+0x69>
    186f:	83 c4 08             	add    $0x8,%esp
    1872:	0f b6 43 0a          	movzbl 0xa(%ebx),%eax
    1876:	50                   	push   %eax
    1877:	68 e4 00 00 00       	push   $0xe4
    187c:	e8 fc ff ff ff       	call   187d <bread+0x7b>
    1881:	83 c4 10             	add    $0x10,%esp
    1884:	b8 00 00 00 00       	mov    $0x0,%eax
    1889:	eb 02                	jmp    188d <bread+0x8b>
    188b:	89 d8                	mov    %ebx,%eax
    188d:	83 c4 04             	add    $0x4,%esp
    1890:	5b                   	pop    %ebx
    1891:	5e                   	pop    %esi
    1892:	c3                   	ret    

00001893 <bread_page>:
    1893:	55                   	push   %ebp
    1894:	57                   	push   %edi
    1895:	56                   	push   %esi
    1896:	53                   	push   %ebx
    1897:	83 ec 48             	sub    $0x48,%esp
    189a:	8b 6c 24 60          	mov    0x60(%esp),%ebp
    189e:	8b 74 24 64          	mov    0x64(%esp),%esi
    18a2:	8b 44 24 5c          	mov    0x5c(%esp),%eax
    18a6:	89 44 24 38          	mov    %eax,0x38(%esp)
    18aa:	8d 44 24 38          	lea    0x38(%esp),%eax
    18ae:	50                   	push   %eax
    18af:	e8 fc ff ff ff       	call   18b0 <bread_page+0x1d>
    18b4:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    18b8:	83 c4 10             	add    $0x10,%esp
    18bb:	bb 00 00 00 00       	mov    $0x0,%ebx
    18c0:	8b 04 9e             	mov    (%esi,%ebx,4),%eax
    18c3:	85 c0                	test   %eax,%eax
    18c5:	74 2b                	je     18f2 <bread_page+0x5f>
    18c7:	83 ec 08             	sub    $0x8,%esp
    18ca:	50                   	push   %eax
    18cb:	55                   	push   %ebp
    18cc:	e8 fc ff ff ff       	call   18cd <bread_page+0x3a>
    18d1:	89 44 9c 2c          	mov    %eax,0x2c(%esp,%ebx,4)
    18d5:	83 c4 10             	add    $0x10,%esp
    18d8:	85 c0                	test   %eax,%eax
    18da:	74 1e                	je     18fa <bread_page+0x67>
    18dc:	80 78 0a 00          	cmpb   $0x0,0xa(%eax)
    18e0:	75 18                	jne    18fa <bread_page+0x67>
    18e2:	83 ec 08             	sub    $0x8,%esp
    18e5:	50                   	push   %eax
    18e6:	6a 00                	push   $0x0
    18e8:	e8 fc ff ff ff       	call   18e9 <bread_page+0x56>
    18ed:	83 c4 10             	add    $0x10,%esp
    18f0:	eb 08                	jmp    18fa <bread_page+0x67>
    18f2:	c7 44 9c 1c 00 00 00 	movl   $0x0,0x1c(%esp,%ebx,4)
    18f9:	00 
    18fa:	43                   	inc    %ebx
    18fb:	83 fb 04             	cmp    $0x4,%ebx
    18fe:	75 c0                	jne    18c0 <bread_page+0x2d>
    1900:	8d 6c 24 1c          	lea    0x1c(%esp),%ebp
    1904:	8b 5d 00             	mov    0x0(%ebp),%ebx
    1907:	85 db                	test   %ebx,%ebx
    1909:	74 3d                	je     1948 <bread_page+0xb5>
    190b:	fa                   	cli    
    190c:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1910:	74 15                	je     1927 <bread_page+0x94>
    1912:	8d 73 10             	lea    0x10(%ebx),%esi
    1915:	83 ec 0c             	sub    $0xc,%esp
    1918:	56                   	push   %esi
    1919:	e8 fc ff ff ff       	call   191a <bread_page+0x87>
    191e:	83 c4 10             	add    $0x10,%esp
    1921:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    1925:	75 ee                	jne    1915 <bread_page+0x82>
    1927:	fb                   	sti    
    1928:	80 7b 0a 00          	cmpb   $0x0,0xa(%ebx)
    192c:	74 0e                	je     193c <bread_page+0xa9>
    192e:	8b 33                	mov    (%ebx),%esi
    1930:	b9 00 01 00 00       	mov    $0x100,%ecx
    1935:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    1939:	fc                   	cld    
    193a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    193c:	83 ec 0c             	sub    $0xc,%esp
    193f:	53                   	push   %ebx
    1940:	e8 fc ff ff ff       	call   1941 <bread_page+0xae>
    1945:	83 c4 10             	add    $0x10,%esp
    1948:	83 c5 04             	add    $0x4,%ebp
    194b:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    194f:	39 e8                	cmp    %ebp,%eax
    1951:	75 b1                	jne    1904 <bread_page+0x71>
    1953:	83 ec 0c             	sub    $0xc,%esp
    1956:	ff 74 24 18          	pushl  0x18(%esp)
    195a:	e8 fc ff ff ff       	call   195b <bread_page+0xc8>
    195f:	83 c4 4c             	add    $0x4c,%esp
    1962:	5b                   	pop    %ebx
    1963:	5e                   	pop    %esi
    1964:	5f                   	pop    %edi
    1965:	5d                   	pop    %ebp
    1966:	c3                   	ret    

00001967 <breada>:
    1967:	55                   	push   %ebp
    1968:	57                   	push   %edi
    1969:	56                   	push   %esi
    196a:	53                   	push   %ebx
    196b:	83 ec 14             	sub    $0x14,%esp
    196e:	8b 6c 24 28          	mov    0x28(%esp),%ebp
    1972:	ff 74 24 2c          	pushl  0x2c(%esp)
    1976:	55                   	push   %ebp
    1977:	e8 fc ff ff ff       	call   1978 <breada+0x11>
    197c:	89 c7                	mov    %eax,%edi
    197e:	83 c4 10             	add    $0x10,%esp
    1981:	85 c0                	test   %eax,%eax
    1983:	75 10                	jne    1995 <breada+0x2e>
    1985:	83 ec 0c             	sub    $0xc,%esp
    1988:	68 2a 01 00 00       	push   $0x12a
    198d:	e8 fc ff ff ff       	call   198e <breada+0x27>
    1992:	83 c4 10             	add    $0x10,%esp
    1995:	80 7f 0a 00          	cmpb   $0x0,0xa(%edi)
    1999:	75 0e                	jne    19a9 <breada+0x42>
    199b:	83 ec 08             	sub    $0x8,%esp
    199e:	57                   	push   %edi
    199f:	6a 00                	push   $0x0
    19a1:	e8 fc ff ff ff       	call   19a2 <breada+0x3b>
    19a6:	83 c4 10             	add    $0x10,%esp
    19a9:	8d 74 24 28          	lea    0x28(%esp),%esi
    19ad:	eb 2a                	jmp    19d9 <breada+0x72>
    19af:	83 ec 08             	sub    $0x8,%esp
    19b2:	50                   	push   %eax
    19b3:	55                   	push   %ebp
    19b4:	e8 fc ff ff ff       	call   19b5 <breada+0x4e>
    19b9:	89 c3                	mov    %eax,%ebx
    19bb:	83 c4 10             	add    $0x10,%esp
    19be:	85 c0                	test   %eax,%eax
    19c0:	74 17                	je     19d9 <breada+0x72>
    19c2:	80 78 0a 00          	cmpb   $0x0,0xa(%eax)
    19c6:	75 0e                	jne    19d6 <breada+0x6f>
    19c8:	83 ec 08             	sub    $0x8,%esp
    19cb:	57                   	push   %edi
    19cc:	6a 02                	push   $0x2
    19ce:	e8 fc ff ff ff       	call   19cf <breada+0x68>
    19d3:	83 c4 10             	add    $0x10,%esp
    19d6:	fe 4b 0c             	decb   0xc(%ebx)
    19d9:	83 c6 04             	add    $0x4,%esi
    19dc:	8b 46 fc             	mov    -0x4(%esi),%eax
    19df:	89 44 24 24          	mov    %eax,0x24(%esp)
    19e3:	85 c0                	test   %eax,%eax
    19e5:	79 c8                	jns    19af <breada+0x48>
    19e7:	fa                   	cli    
    19e8:	80 7f 0d 00          	cmpb   $0x0,0xd(%edi)
    19ec:	74 15                	je     1a03 <breada+0x9c>
    19ee:	8d 5f 10             	lea    0x10(%edi),%ebx
    19f1:	83 ec 0c             	sub    $0xc,%esp
    19f4:	53                   	push   %ebx
    19f5:	e8 fc ff ff ff       	call   19f6 <breada+0x8f>
    19fa:	83 c4 10             	add    $0x10,%esp
    19fd:	80 7f 0d 00          	cmpb   $0x0,0xd(%edi)
    1a01:	75 ee                	jne    19f1 <breada+0x8a>
    1a03:	fb                   	sti    
    1a04:	89 f8                	mov    %edi,%eax
    1a06:	80 7f 0a 00          	cmpb   $0x0,0xa(%edi)
    1a0a:	75 11                	jne    1a1d <breada+0xb6>
    1a0c:	83 ec 0c             	sub    $0xc,%esp
    1a0f:	57                   	push   %edi
    1a10:	e8 fc ff ff ff       	call   1a11 <breada+0xaa>
    1a15:	83 c4 10             	add    $0x10,%esp
    1a18:	b8 00 00 00 00       	mov    $0x0,%eax
    1a1d:	83 c4 0c             	add    $0xc,%esp
    1a20:	5b                   	pop    %ebx
    1a21:	5e                   	pop    %esi
    1a22:	5f                   	pop    %edi
    1a23:	5d                   	pop    %ebp
    1a24:	c3                   	ret    

00001a25 <buffer_init>:
    1a25:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1a2b:	8b 54 24 04          	mov    0x4(%esp),%edx
    1a2f:	c1 e2 0c             	shl    $0xc,%edx
    1a32:	81 fa 00 00 10 00    	cmp    $0x100000,%edx
    1a38:	75 53                	jne    1a8d <buffer_init+0x68>
    1a3a:	ba 00 00 0a 00       	mov    $0xa0000,%edx
    1a3f:	eb 4c                	jmp    1a8d <buffer_init+0x68>
    1a41:	66 c7 40 e4 00 00    	movw   $0x0,-0x1c(%eax)
    1a47:	c6 40 e7 00          	movb   $0x0,-0x19(%eax)
    1a4b:	c6 40 e8 00          	movb   $0x0,-0x18(%eax)
    1a4f:	c6 40 e9 00          	movb   $0x0,-0x17(%eax)
    1a53:	c6 40 e6 00          	movb   $0x0,-0x1a(%eax)
    1a57:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    1a5e:	c7 40 f4 00 00 00 00 	movl   $0x0,-0xc(%eax)
    1a65:	c7 40 f0 00 00 00 00 	movl   $0x0,-0x10(%eax)
    1a6c:	89 50 dc             	mov    %edx,-0x24(%eax)
    1a6f:	8d 48 b8             	lea    -0x48(%eax),%ecx
    1a72:	89 48 f8             	mov    %ecx,-0x8(%eax)
    1a75:	89 40 fc             	mov    %eax,-0x4(%eax)
    1a78:	ff 05 00 00 00 00    	incl   0x0
    1a7e:	81 fa 00 00 10 00    	cmp    $0x100000,%edx
    1a84:	75 05                	jne    1a8b <buffer_init+0x66>
    1a86:	ba 00 00 0a 00       	mov    $0xa0000,%edx
    1a8b:	89 c1                	mov    %eax,%ecx
    1a8d:	81 ea 00 04 00 00    	sub    $0x400,%edx
    1a93:	8d 41 24             	lea    0x24(%ecx),%eax
    1a96:	39 c2                	cmp    %eax,%edx
    1a98:	73 a7                	jae    1a41 <buffer_init+0x1c>
    1a9a:	a1 00 00 00 00       	mov    0x0,%eax
    1a9f:	a3 08 07 00 00       	mov    %eax,0x708
    1aa4:	8d 51 dc             	lea    -0x24(%ecx),%edx
    1aa7:	89 50 1c             	mov    %edx,0x1c(%eax)
    1aaa:	89 41 fc             	mov    %eax,-0x4(%ecx)
    1aad:	b8 00 00 00 00       	mov    $0x0,%eax
    1ab2:	ba cc 04 00 00       	mov    $0x4cc,%edx
    1ab7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    1abd:	83 c0 04             	add    $0x4,%eax
    1ac0:	39 d0                	cmp    %edx,%eax
    1ac2:	75 f3                	jne    1ab7 <buffer_init+0x92>
    1ac4:	c3                   	ret    

00001ac5 <free_super>:
    1ac5:	83 ec 18             	sub    $0x18,%esp
    1ac8:	fa                   	cli    
    1ac9:	c6 40 68 00          	movb   $0x0,0x68(%eax)
    1acd:	83 c0 64             	add    $0x64,%eax
    1ad0:	50                   	push   %eax
    1ad1:	e8 fc ff ff ff       	call   1ad2 <free_super+0xd>
    1ad6:	fb                   	sti    
    1ad7:	83 c4 1c             	add    $0x1c,%esp
    1ada:	c3                   	ret    

00001adb <get_super>:
    1adb:	57                   	push   %edi
    1adc:	56                   	push   %esi
    1add:	53                   	push   %ebx
    1ade:	8b 7c 24 10          	mov    0x10(%esp),%edi
    1ae2:	85 ff                	test   %edi,%edi
    1ae4:	74 4b                	je     1b31 <get_super+0x56>
    1ae6:	bb 00 00 00 00       	mov    $0x0,%ebx
    1aeb:	0f b7 43 54          	movzwl 0x54(%ebx),%eax
    1aef:	39 c7                	cmp    %eax,%edi
    1af1:	75 2c                	jne    1b1f <get_super+0x44>
    1af3:	fa                   	cli    
    1af4:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1af8:	74 15                	je     1b0f <get_super+0x34>
    1afa:	8d 73 64             	lea    0x64(%ebx),%esi
    1afd:	83 ec 0c             	sub    $0xc,%esp
    1b00:	56                   	push   %esi
    1b01:	e8 fc ff ff ff       	call   1b02 <get_super+0x27>
    1b06:	83 c4 10             	add    $0x10,%esp
    1b09:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1b0d:	75 ee                	jne    1afd <get_super+0x22>
    1b0f:	fb                   	sti    
    1b10:	0f b7 43 54          	movzwl 0x54(%ebx),%eax
    1b14:	39 c7                	cmp    %eax,%edi
    1b16:	74 20                	je     1b38 <get_super+0x5d>
    1b18:	bb 00 00 00 00       	mov    $0x0,%ebx
    1b1d:	eb cc                	jmp    1aeb <get_super+0x10>
    1b1f:	83 c3 6c             	add    $0x6c,%ebx
    1b22:	81 fb 60 03 00 00    	cmp    $0x360,%ebx
    1b28:	72 c1                	jb     1aeb <get_super+0x10>
    1b2a:	b8 00 00 00 00       	mov    $0x0,%eax
    1b2f:	eb 09                	jmp    1b3a <get_super+0x5f>
    1b31:	b8 00 00 00 00       	mov    $0x0,%eax
    1b36:	eb 02                	jmp    1b3a <get_super+0x5f>
    1b38:	89 d8                	mov    %ebx,%eax
    1b3a:	5b                   	pop    %ebx
    1b3b:	5e                   	pop    %esi
    1b3c:	5f                   	pop    %edi
    1b3d:	c3                   	ret    

00001b3e <read_super>:
    1b3e:	85 c0                	test   %eax,%eax
    1b40:	0f 84 58 02 00 00    	je     1d9e <read_super+0x260>
    1b46:	55                   	push   %ebp
    1b47:	57                   	push   %edi
    1b48:	56                   	push   %esi
    1b49:	53                   	push   %ebx
    1b4a:	83 ec 28             	sub    $0x28,%esp
    1b4d:	89 c5                	mov    %eax,%ebp
    1b4f:	50                   	push   %eax
    1b50:	e8 fc ff ff ff       	call   1b51 <read_super+0x13>
    1b55:	89 2c 24             	mov    %ebp,(%esp)
    1b58:	e8 fc ff ff ff       	call   1b59 <read_super+0x1b>
    1b5d:	83 c4 10             	add    $0x10,%esp
    1b60:	85 c0                	test   %eax,%eax
    1b62:	0f 85 41 02 00 00    	jne    1da9 <read_super+0x26b>
    1b68:	66 83 3d 54 00 00 00 	cmpw   $0x0,0x54
    1b6f:	00 
    1b70:	74 1e                	je     1b90 <read_super+0x52>
    1b72:	bb 00 00 00 00       	mov    $0x0,%ebx
    1b77:	eb 07                	jmp    1b80 <read_super+0x42>
    1b79:	66 83 7b 54 00       	cmpw   $0x0,0x54(%ebx)
    1b7e:	74 15                	je     1b95 <read_super+0x57>
    1b80:	83 c3 6c             	add    $0x6c,%ebx
    1b83:	81 fb 60 03 00 00    	cmp    $0x360,%ebx
    1b89:	75 ee                	jne    1b79 <read_super+0x3b>
    1b8b:	e9 14 02 00 00       	jmp    1da4 <read_super+0x266>
    1b90:	bb 00 00 00 00       	mov    $0x0,%ebx
    1b95:	66 89 6b 54          	mov    %bp,0x54(%ebx)
    1b99:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
    1ba0:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
    1ba7:	c7 43 60 00 00 00 00 	movl   $0x0,0x60(%ebx)
    1bae:	c6 43 69 00          	movb   $0x0,0x69(%ebx)
    1bb2:	c6 43 6a 00          	movb   $0x0,0x6a(%ebx)
    1bb6:	fa                   	cli    
    1bb7:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1bbb:	74 15                	je     1bd2 <read_super+0x94>
    1bbd:	8d 73 64             	lea    0x64(%ebx),%esi
    1bc0:	83 ec 0c             	sub    $0xc,%esp
    1bc3:	56                   	push   %esi
    1bc4:	e8 fc ff ff ff       	call   1bc5 <read_super+0x87>
    1bc9:	83 c4 10             	add    $0x10,%esp
    1bcc:	80 7b 68 00          	cmpb   $0x0,0x68(%ebx)
    1bd0:	75 ee                	jne    1bc0 <read_super+0x82>
    1bd2:	c6 43 68 01          	movb   $0x1,0x68(%ebx)
    1bd6:	fb                   	sti    
    1bd7:	83 ec 08             	sub    $0x8,%esp
    1bda:	6a 01                	push   $0x1
    1bdc:	55                   	push   %ebp
    1bdd:	e8 fc ff ff ff       	call   1bde <read_super+0xa0>
    1be2:	89 c7                	mov    %eax,%edi
    1be4:	83 c4 10             	add    $0x10,%esp
    1be7:	85 c0                	test   %eax,%eax
    1be9:	75 17                	jne    1c02 <read_super+0xc4>
    1beb:	66 c7 43 54 00 00    	movw   $0x0,0x54(%ebx)
    1bf1:	89 d8                	mov    %ebx,%eax
    1bf3:	e8 cd fe ff ff       	call   1ac5 <free_super>
    1bf8:	b8 00 00 00 00       	mov    $0x0,%eax
    1bfd:	e9 a7 01 00 00       	jmp    1da9 <read_super+0x26b>
    1c02:	83 ec 0c             	sub    $0xc,%esp
    1c05:	68 47 01 00 00       	push   $0x147
    1c0a:	e8 fc ff ff ff       	call   1c0b <read_super+0xcd>
    1c0f:	89 f8                	mov    %edi,%eax
    1c11:	8b 37                	mov    (%edi),%esi
    1c13:	b9 05 00 00 00       	mov    $0x5,%ecx
    1c18:	89 df                	mov    %ebx,%edi
    1c1a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    1c1c:	89 04 24             	mov    %eax,(%esp)
    1c1f:	e8 fc ff ff ff       	call   1c20 <read_super+0xe2>
    1c24:	83 c4 10             	add    $0x10,%esp
    1c27:	66 81 7b 10 8f 13    	cmpw   $0x138f,0x10(%ebx)
    1c2d:	74 28                	je     1c57 <read_super+0x119>
    1c2f:	66 c7 43 54 00 00    	movw   $0x0,0x54(%ebx)
    1c35:	89 d8                	mov    %ebx,%eax
    1c37:	e8 89 fe ff ff       	call   1ac5 <free_super>
    1c3c:	83 ec 08             	sub    $0x8,%esp
    1c3f:	55                   	push   %ebp
    1c40:	68 14 01 00 00       	push   $0x114
    1c45:	e8 fc ff ff ff       	call   1c46 <read_super+0x108>
    1c4a:	83 c4 10             	add    $0x10,%esp
    1c4d:	b8 00 00 00 00       	mov    $0x0,%eax
    1c52:	e9 52 01 00 00       	jmp    1da9 <read_super+0x26b>
    1c57:	8d 43 14             	lea    0x14(%ebx),%eax
    1c5a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c5e:	8d 4b 34             	lea    0x34(%ebx),%ecx
    1c61:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    1c65:	89 ca                	mov    %ecx,%edx
    1c67:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    1c6d:	83 c0 04             	add    $0x4,%eax
    1c70:	39 c2                	cmp    %eax,%edx
    1c72:	75 f3                	jne    1c67 <read_super+0x129>
    1c74:	8d 43 54             	lea    0x54(%ebx),%eax
    1c77:	89 c2                	mov    %eax,%edx
    1c79:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1c7d:	8b 44 24 04          	mov    0x4(%esp),%eax
    1c81:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    1c87:	83 c0 04             	add    $0x4,%eax
    1c8a:	39 c2                	cmp    %eax,%edx
    1c8c:	75 f3                	jne    1c81 <read_super+0x143>
    1c8e:	83 ec 04             	sub    $0x4,%esp
    1c91:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1c95:	50                   	push   %eax
    1c96:	0f b7 43 04          	movzwl 0x4(%ebx),%eax
    1c9a:	50                   	push   %eax
    1c9b:	68 3c 01 00 00       	push   $0x13c
    1ca0:	e8 fc ff ff ff       	call   1ca1 <read_super+0x163>
    1ca5:	83 c4 10             	add    $0x10,%esp
    1ca8:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
    1cad:	74 1c                	je     1ccb <read_super+0x18d>
    1caf:	be 02 00 00 00       	mov    $0x2,%esi
    1cb4:	83 ec 08             	sub    $0x8,%esp
    1cb7:	56                   	push   %esi
    1cb8:	55                   	push   %ebp
    1cb9:	e8 fc ff ff ff       	call   1cba <read_super+0x17c>
    1cbe:	89 44 b3 0c          	mov    %eax,0xc(%ebx,%esi,4)
    1cc2:	83 c4 10             	add    $0x10,%esp
    1cc5:	85 c0                	test   %eax,%eax
    1cc7:	75 15                	jne    1cde <read_super+0x1a0>
    1cc9:	eb 05                	jmp    1cd0 <read_super+0x192>
    1ccb:	be 02 00 00 00       	mov    $0x2,%esi
    1cd0:	bf 00 00 00 00       	mov    $0x0,%edi
    1cd5:	66 83 7b 06 00       	cmpw   $0x0,0x6(%ebx)
    1cda:	75 10                	jne    1cec <read_super+0x1ae>
    1cdc:	eb 2d                	jmp    1d0b <read_super+0x1cd>
    1cde:	46                   	inc    %esi
    1cdf:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
    1ce3:	8d 46 fe             	lea    -0x2(%esi),%eax
    1ce6:	39 c2                	cmp    %eax,%edx
    1ce8:	7f ca                	jg     1cb4 <read_super+0x176>
    1cea:	eb e4                	jmp    1cd0 <read_super+0x192>
    1cec:	83 ec 08             	sub    $0x8,%esp
    1cef:	56                   	push   %esi
    1cf0:	55                   	push   %ebp
    1cf1:	e8 fc ff ff ff       	call   1cf2 <read_super+0x1b4>
    1cf6:	89 44 bb 34          	mov    %eax,0x34(%ebx,%edi,4)
    1cfa:	83 c4 10             	add    $0x10,%esp
    1cfd:	85 c0                	test   %eax,%eax
    1cff:	74 0a                	je     1d0b <read_super+0x1cd>
    1d01:	46                   	inc    %esi
    1d02:	47                   	inc    %edi
    1d03:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1d07:	39 f8                	cmp    %edi,%eax
    1d09:	7f e1                	jg     1cec <read_super+0x1ae>
    1d0b:	83 ec 04             	sub    $0x4,%esp
    1d0e:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
    1d12:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1d16:	8d 44 02 02          	lea    0x2(%edx,%eax,1),%eax
    1d1a:	50                   	push   %eax
    1d1b:	56                   	push   %esi
    1d1c:	68 63 01 00 00       	push   $0x163
    1d21:	e8 fc ff ff ff       	call   1d22 <read_super+0x1e4>
    1d26:	0f b7 53 04          	movzwl 0x4(%ebx),%edx
    1d2a:	0f b7 43 06          	movzwl 0x6(%ebx),%eax
    1d2e:	8d 44 02 02          	lea    0x2(%edx,%eax,1),%eax
    1d32:	83 c4 10             	add    $0x10,%esp
    1d35:	39 f0                	cmp    %esi,%eax
    1d37:	74 4a                	je     1d83 <read_super+0x245>
    1d39:	8b 74 24 08          	mov    0x8(%esp),%esi
    1d3d:	8b 7c 24 04          	mov    0x4(%esp),%edi
    1d41:	83 ec 0c             	sub    $0xc,%esp
    1d44:	ff 36                	pushl  (%esi)
    1d46:	e8 fc ff ff ff       	call   1d47 <read_super+0x209>
    1d4b:	83 c6 04             	add    $0x4,%esi
    1d4e:	83 c4 10             	add    $0x10,%esp
    1d51:	39 f7                	cmp    %esi,%edi
    1d53:	75 ec                	jne    1d41 <read_super+0x203>
    1d55:	89 fe                	mov    %edi,%esi
    1d57:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    1d5b:	83 ec 0c             	sub    $0xc,%esp
    1d5e:	ff 36                	pushl  (%esi)
    1d60:	e8 fc ff ff ff       	call   1d61 <read_super+0x223>
    1d65:	83 c6 04             	add    $0x4,%esi
    1d68:	83 c4 10             	add    $0x10,%esp
    1d6b:	39 fe                	cmp    %edi,%esi
    1d6d:	75 ec                	jne    1d5b <read_super+0x21d>
    1d6f:	66 c7 43 54 00 00    	movw   $0x0,0x54(%ebx)
    1d75:	89 d8                	mov    %ebx,%eax
    1d77:	e8 49 fd ff ff       	call   1ac5 <free_super>
    1d7c:	b8 00 00 00 00       	mov    $0x0,%eax
    1d81:	eb 26                	jmp    1da9 <read_super+0x26b>
    1d83:	8b 43 14             	mov    0x14(%ebx),%eax
    1d86:	8b 00                	mov    (%eax),%eax
    1d88:	80 08 01             	orb    $0x1,(%eax)
    1d8b:	8b 43 34             	mov    0x34(%ebx),%eax
    1d8e:	8b 00                	mov    (%eax),%eax
    1d90:	80 08 01             	orb    $0x1,(%eax)
    1d93:	89 d8                	mov    %ebx,%eax
    1d95:	e8 2b fd ff ff       	call   1ac5 <free_super>
    1d9a:	89 d8                	mov    %ebx,%eax
    1d9c:	eb 0b                	jmp    1da9 <read_super+0x26b>
    1d9e:	b8 00 00 00 00       	mov    $0x0,%eax
    1da3:	c3                   	ret    
    1da4:	b8 00 00 00 00       	mov    $0x0,%eax
    1da9:	83 c4 1c             	add    $0x1c,%esp
    1dac:	5b                   	pop    %ebx
    1dad:	5e                   	pop    %esi
    1dae:	5f                   	pop    %edi
    1daf:	5d                   	pop    %ebp
    1db0:	c3                   	ret    

00001db1 <put_super>:
    1db1:	57                   	push   %edi
    1db2:	56                   	push   %esi
    1db3:	53                   	push   %ebx
    1db4:	8b 44 24 10          	mov    0x10(%esp),%eax
    1db8:	39 05 00 00 00 00    	cmp    %eax,0x0
    1dbe:	75 15                	jne    1dd5 <put_super+0x24>
    1dc0:	83 ec 0c             	sub    $0xc,%esp
    1dc3:	68 60 01 00 00       	push   $0x160
    1dc8:	e8 fc ff ff ff       	call   1dc9 <put_super+0x18>
    1dcd:	83 c4 10             	add    $0x10,%esp
    1dd0:	e9 89 00 00 00       	jmp    1e5e <put_super+0xad>
    1dd5:	83 ec 0c             	sub    $0xc,%esp
    1dd8:	50                   	push   %eax
    1dd9:	e8 fc ff ff ff       	call   1dda <put_super+0x29>
    1dde:	89 c7                	mov    %eax,%edi
    1de0:	83 c4 10             	add    $0x10,%esp
    1de3:	85 c0                	test   %eax,%eax
    1de5:	74 77                	je     1e5e <put_super+0xad>
    1de7:	83 78 5c 00          	cmpl   $0x0,0x5c(%eax)
    1deb:	74 12                	je     1dff <put_super+0x4e>
    1ded:	83 ec 0c             	sub    $0xc,%esp
    1df0:	68 90 01 00 00       	push   $0x190
    1df5:	e8 fc ff ff ff       	call   1df6 <put_super+0x45>
    1dfa:	83 c4 10             	add    $0x10,%esp
    1dfd:	eb 5f                	jmp    1e5e <put_super+0xad>
    1dff:	fa                   	cli    
    1e00:	80 78 68 00          	cmpb   $0x0,0x68(%eax)
    1e04:	74 15                	je     1e1b <put_super+0x6a>
    1e06:	8d 58 64             	lea    0x64(%eax),%ebx
    1e09:	83 ec 0c             	sub    $0xc,%esp
    1e0c:	53                   	push   %ebx
    1e0d:	e8 fc ff ff ff       	call   1e0e <put_super+0x5d>
    1e12:	83 c4 10             	add    $0x10,%esp
    1e15:	80 7f 68 00          	cmpb   $0x0,0x68(%edi)
    1e19:	75 ee                	jne    1e09 <put_super+0x58>
    1e1b:	c6 47 68 01          	movb   $0x1,0x68(%edi)
    1e1f:	fb                   	sti    
    1e20:	66 c7 47 54 00 00    	movw   $0x0,0x54(%edi)
    1e26:	8d 77 14             	lea    0x14(%edi),%esi
    1e29:	8d 5f 34             	lea    0x34(%edi),%ebx
    1e2c:	83 ec 0c             	sub    $0xc,%esp
    1e2f:	ff 36                	pushl  (%esi)
    1e31:	e8 fc ff ff ff       	call   1e32 <put_super+0x81>
    1e36:	83 c6 04             	add    $0x4,%esi
    1e39:	83 c4 10             	add    $0x10,%esp
    1e3c:	39 de                	cmp    %ebx,%esi
    1e3e:	75 ec                	jne    1e2c <put_super+0x7b>
    1e40:	8d 77 54             	lea    0x54(%edi),%esi
    1e43:	83 ec 0c             	sub    $0xc,%esp
    1e46:	ff 33                	pushl  (%ebx)
    1e48:	e8 fc ff ff ff       	call   1e49 <put_super+0x98>
    1e4d:	83 c3 04             	add    $0x4,%ebx
    1e50:	83 c4 10             	add    $0x10,%esp
    1e53:	39 de                	cmp    %ebx,%esi
    1e55:	75 ec                	jne    1e43 <put_super+0x92>
    1e57:	89 f8                	mov    %edi,%eax
    1e59:	e8 67 fc ff ff       	call   1ac5 <free_super>
    1e5e:	5b                   	pop    %ebx
    1e5f:	5e                   	pop    %esi
    1e60:	5f                   	pop    %edi
    1e61:	c3                   	ret    

00001e62 <sys_umount>:
    1e62:	56                   	push   %esi
    1e63:	53                   	push   %ebx
    1e64:	83 ec 10             	sub    $0x10,%esp
    1e67:	ff 74 24 1c          	pushl  0x1c(%esp)
    1e6b:	e8 fc ff ff ff       	call   1e6c <sys_umount+0xa>
    1e70:	83 c4 10             	add    $0x10,%esp
    1e73:	85 c0                	test   %eax,%eax
    1e75:	0f 84 db 00 00 00    	je     1f56 <sys_umount+0xf4>
    1e7b:	0f b7 58 0e          	movzwl 0xe(%eax),%ebx
    1e7f:	8b 10                	mov    (%eax),%edx
    1e81:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    1e87:	66 81 fa 00 60       	cmp    $0x6000,%dx
    1e8c:	74 16                	je     1ea4 <sys_umount+0x42>
    1e8e:	83 ec 0c             	sub    $0xc,%esp
    1e91:	50                   	push   %eax
    1e92:	e8 fc ff ff ff       	call   1e93 <sys_umount+0x31>
    1e97:	83 c4 10             	add    $0x10,%esp
    1e9a:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
    1e9f:	e9 d3 00 00 00       	jmp    1f77 <sys_umount+0x115>
    1ea4:	83 ec 0c             	sub    $0xc,%esp
    1ea7:	50                   	push   %eax
    1ea8:	e8 fc ff ff ff       	call   1ea9 <sys_umount+0x47>
    1ead:	83 c4 10             	add    $0x10,%esp
    1eb0:	3b 1d 00 00 00 00    	cmp    0x0,%ebx
    1eb6:	0f 84 a1 00 00 00    	je     1f5d <sys_umount+0xfb>
    1ebc:	83 ec 0c             	sub    $0xc,%esp
    1ebf:	53                   	push   %ebx
    1ec0:	e8 fc ff ff ff       	call   1ec1 <sys_umount+0x5f>
    1ec5:	89 c6                	mov    %eax,%esi
    1ec7:	83 c4 10             	add    $0x10,%esp
    1eca:	85 c0                	test   %eax,%eax
    1ecc:	0f 84 92 00 00 00    	je     1f64 <sys_umount+0x102>
    1ed2:	8b 40 5c             	mov    0x5c(%eax),%eax
    1ed5:	85 c0                	test   %eax,%eax
    1ed7:	0f 84 8e 00 00 00    	je     1f6b <sys_umount+0x109>
    1edd:	80 78 35 00          	cmpb   $0x0,0x35(%eax)
    1ee1:	75 10                	jne    1ef3 <sys_umount+0x91>
    1ee3:	83 ec 0c             	sub    $0xc,%esp
    1ee6:	68 7f 01 00 00       	push   $0x17f
    1eeb:	e8 fc ff ff ff       	call   1eec <sys_umount+0x8a>
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	b8 00 00 00 00       	mov    $0x0,%eax
    1ef8:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
    1efc:	39 d3                	cmp    %edx,%ebx
    1efe:	75 07                	jne    1f07 <sys_umount+0xa5>
    1f00:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    1f05:	75 6b                	jne    1f72 <sys_umount+0x110>
    1f07:	83 c0 38             	add    $0x38,%eax
    1f0a:	3d 00 07 00 00       	cmp    $0x700,%eax
    1f0f:	75 e7                	jne    1ef8 <sys_umount+0x96>
    1f11:	8b 46 5c             	mov    0x5c(%esi),%eax
    1f14:	c6 40 35 00          	movb   $0x0,0x35(%eax)
    1f18:	83 ec 0c             	sub    $0xc,%esp
    1f1b:	ff 76 5c             	pushl  0x5c(%esi)
    1f1e:	e8 fc ff ff ff       	call   1f1f <sys_umount+0xbd>
    1f23:	c7 46 5c 00 00 00 00 	movl   $0x0,0x5c(%esi)
    1f2a:	83 c4 04             	add    $0x4,%esp
    1f2d:	ff 76 58             	pushl  0x58(%esi)
    1f30:	e8 fc ff ff ff       	call   1f31 <sys_umount+0xcf>
    1f35:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
    1f3c:	89 1c 24             	mov    %ebx,(%esp)
    1f3f:	e8 fc ff ff ff       	call   1f40 <sys_umount+0xde>
    1f44:	89 1c 24             	mov    %ebx,(%esp)
    1f47:	e8 fc ff ff ff       	call   1f48 <sys_umount+0xe6>
    1f4c:	83 c4 10             	add    $0x10,%esp
    1f4f:	b8 00 00 00 00       	mov    $0x0,%eax
    1f54:	eb 21                	jmp    1f77 <sys_umount+0x115>
    1f56:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1f5b:	eb 1a                	jmp    1f77 <sys_umount+0x115>
    1f5d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    1f62:	eb 13                	jmp    1f77 <sys_umount+0x115>
    1f64:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1f69:	eb 0c                	jmp    1f77 <sys_umount+0x115>
    1f6b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    1f70:	eb 05                	jmp    1f77 <sys_umount+0x115>
    1f72:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    1f77:	83 c4 04             	add    $0x4,%esp
    1f7a:	5b                   	pop    %ebx
    1f7b:	5e                   	pop    %esi
    1f7c:	c3                   	ret    

00001f7d <sys_mount>:
    1f7d:	56                   	push   %esi
    1f7e:	53                   	push   %ebx
    1f7f:	83 ec 10             	sub    $0x10,%esp
    1f82:	ff 74 24 1c          	pushl  0x1c(%esp)
    1f86:	e8 fc ff ff ff       	call   1f87 <sys_mount+0xa>
    1f8b:	83 c4 10             	add    $0x10,%esp
    1f8e:	85 c0                	test   %eax,%eax
    1f90:	0f 84 f1 00 00 00    	je     2087 <sys_mount+0x10a>
    1f96:	0f b7 70 0e          	movzwl 0xe(%eax),%esi
    1f9a:	8b 10                	mov    (%eax),%edx
    1f9c:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    1fa2:	66 81 fa 00 60       	cmp    $0x6000,%dx
    1fa7:	74 16                	je     1fbf <sys_mount+0x42>
    1fa9:	83 ec 0c             	sub    $0xc,%esp
    1fac:	50                   	push   %eax
    1fad:	e8 fc ff ff ff       	call   1fae <sys_mount+0x31>
    1fb2:	83 c4 10             	add    $0x10,%esp
    1fb5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fba:	e9 d4 00 00 00       	jmp    2093 <sys_mount+0x116>
    1fbf:	83 ec 0c             	sub    $0xc,%esp
    1fc2:	50                   	push   %eax
    1fc3:	e8 fc ff ff ff       	call   1fc4 <sys_mount+0x47>
    1fc8:	83 c4 04             	add    $0x4,%esp
    1fcb:	ff 74 24 20          	pushl  0x20(%esp)
    1fcf:	e8 fc ff ff ff       	call   1fd0 <sys_mount+0x53>
    1fd4:	89 c3                	mov    %eax,%ebx
    1fd6:	83 c4 10             	add    $0x10,%esp
    1fd9:	85 c0                	test   %eax,%eax
    1fdb:	0f 84 ad 00 00 00    	je     208e <sys_mount+0x111>
    1fe1:	66 83 78 30 01       	cmpw   $0x1,0x30(%eax)
    1fe6:	75 07                	jne    1fef <sys_mount+0x72>
    1fe8:	66 83 78 2e 01       	cmpw   $0x1,0x2e(%eax)
    1fed:	75 16                	jne    2005 <sys_mount+0x88>
    1fef:	83 ec 0c             	sub    $0xc,%esp
    1ff2:	53                   	push   %ebx
    1ff3:	e8 fc ff ff ff       	call   1ff4 <sys_mount+0x77>
    1ff8:	83 c4 10             	add    $0x10,%esp
    1ffb:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    2000:	e9 8e 00 00 00       	jmp    2093 <sys_mount+0x116>
    2005:	8b 00                	mov    (%eax),%eax
    2007:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    200c:	66 3d 00 40          	cmp    $0x4000,%ax
    2010:	74 13                	je     2025 <sys_mount+0xa8>
    2012:	83 ec 0c             	sub    $0xc,%esp
    2015:	53                   	push   %ebx
    2016:	e8 fc ff ff ff       	call   2017 <sys_mount+0x9a>
    201b:	83 c4 10             	add    $0x10,%esp
    201e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2023:	eb 6e                	jmp    2093 <sys_mount+0x116>
    2025:	89 f0                	mov    %esi,%eax
    2027:	e8 12 fb ff ff       	call   1b3e <read_super>
    202c:	85 c0                	test   %eax,%eax
    202e:	75 13                	jne    2043 <sys_mount+0xc6>
    2030:	83 ec 0c             	sub    $0xc,%esp
    2033:	53                   	push   %ebx
    2034:	e8 fc ff ff ff       	call   2035 <sys_mount+0xb8>
    2039:	83 c4 10             	add    $0x10,%esp
    203c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    2041:	eb 50                	jmp    2093 <sys_mount+0x116>
    2043:	83 78 5c 00          	cmpl   $0x0,0x5c(%eax)
    2047:	74 13                	je     205c <sys_mount+0xdf>
    2049:	83 ec 0c             	sub    $0xc,%esp
    204c:	53                   	push   %ebx
    204d:	e8 fc ff ff ff       	call   204e <sys_mount+0xd1>
    2052:	83 c4 10             	add    $0x10,%esp
    2055:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
    205a:	eb 37                	jmp    2093 <sys_mount+0x116>
    205c:	80 7b 35 00          	cmpb   $0x0,0x35(%ebx)
    2060:	74 13                	je     2075 <sys_mount+0xf8>
    2062:	83 ec 0c             	sub    $0xc,%esp
    2065:	53                   	push   %ebx
    2066:	e8 fc ff ff ff       	call   2067 <sys_mount+0xea>
    206b:	83 c4 10             	add    $0x10,%esp
    206e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2073:	eb 1e                	jmp    2093 <sys_mount+0x116>
    2075:	89 58 5c             	mov    %ebx,0x5c(%eax)
    2078:	c6 43 35 01          	movb   $0x1,0x35(%ebx)
    207c:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    2080:	b8 00 00 00 00       	mov    $0x0,%eax
    2085:	eb 0c                	jmp    2093 <sys_mount+0x116>
    2087:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    208c:	eb 05                	jmp    2093 <sys_mount+0x116>
    208e:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    2093:	83 c4 04             	add    $0x4,%esp
    2096:	5b                   	pop    %ebx
    2097:	5e                   	pop    %esi
    2098:	c3                   	ret    

00002099 <mount_root>:
    2099:	b8 04 00 00 00       	mov    $0x4,%eax
    209e:	ba 04 04 00 00       	mov    $0x404,%edx
    20a3:	66 c7 00 00 00       	movw   $0x0,(%eax)
    20a8:	83 c0 10             	add    $0x10,%eax
    20ab:	39 c2                	cmp    %eax,%edx
    20ad:	75 f4                	jne    20a3 <mount_root+0xa>
    20af:	55                   	push   %ebp
    20b0:	57                   	push   %edi
    20b1:	56                   	push   %esi
    20b2:	53                   	push   %ebx
    20b3:	83 ec 0c             	sub    $0xc,%esp
    20b6:	a1 00 00 00 00       	mov    0x0,%eax
    20bb:	c1 e8 08             	shr    $0x8,%eax
    20be:	83 f8 02             	cmp    $0x2,%eax
    20c1:	75 15                	jne    20d8 <mount_root+0x3f>
    20c3:	83 ec 0c             	sub    $0xc,%esp
    20c6:	68 b4 01 00 00       	push   $0x1b4
    20cb:	e8 fc ff ff ff       	call   20cc <mount_root+0x33>
    20d0:	e8 fc ff ff ff       	call   20d1 <mount_root+0x38>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	b8 00 00 00 00       	mov    $0x0,%eax
    20dd:	66 c7 40 54 00 00    	movw   $0x0,0x54(%eax)
    20e3:	c6 40 68 00          	movb   $0x0,0x68(%eax)
    20e7:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
    20ee:	83 c0 6c             	add    $0x6c,%eax
    20f1:	3d 60 03 00 00       	cmp    $0x360,%eax
    20f6:	75 e5                	jne    20dd <mount_root+0x44>
    20f8:	a1 00 00 00 00       	mov    0x0,%eax
    20fd:	e8 3c fa ff ff       	call   1b3e <read_super>
    2102:	89 c6                	mov    %eax,%esi
    2104:	85 c0                	test   %eax,%eax
    2106:	75 10                	jne    2118 <mount_root+0x7f>
    2108:	83 ec 0c             	sub    $0xc,%esp
    210b:	68 9c 01 00 00       	push   $0x19c
    2110:	e8 fc ff ff ff       	call   2111 <mount_root+0x78>
    2115:	83 c4 10             	add    $0x10,%esp
    2118:	83 ec 08             	sub    $0x8,%esp
    211b:	0f b7 46 10          	movzwl 0x10(%esi),%eax
    211f:	50                   	push   %eax
    2120:	68 b4 01 00 00       	push   $0x1b4
    2125:	e8 fc ff ff ff       	call   2126 <mount_root+0x8d>
    212a:	83 c4 08             	add    $0x8,%esp
    212d:	6a 01                	push   $0x1
    212f:	ff 35 00 00 00 00    	pushl  0x0
    2135:	e8 fc ff ff ff       	call   2136 <mount_root+0x9d>
    213a:	89 c3                	mov    %eax,%ebx
    213c:	83 c4 10             	add    $0x10,%esp
    213f:	85 c0                	test   %eax,%eax
    2141:	75 10                	jne    2153 <mount_root+0xba>
    2143:	83 ec 0c             	sub    $0xc,%esp
    2146:	68 c1 01 00 00       	push   $0x1c1
    214b:	e8 fc ff ff ff       	call   214c <mount_root+0xb3>
    2150:	83 c4 10             	add    $0x10,%esp
    2153:	66 83 43 30 03       	addw   $0x3,0x30(%ebx)
    2158:	89 5e 5c             	mov    %ebx,0x5c(%esi)
    215b:	89 5e 58             	mov    %ebx,0x58(%esi)
    215e:	a1 00 00 00 00       	mov    0x0,%eax
    2163:	89 98 70 02 00 00    	mov    %ebx,0x270(%eax)
    2169:	89 98 74 02 00 00    	mov    %ebx,0x274(%eax)
    216f:	0f b7 5e 02          	movzwl 0x2(%esi),%ebx
    2173:	83 ec 08             	sub    $0x8,%esp
    2176:	53                   	push   %ebx
    2177:	68 df 01 00 00       	push   $0x1df
    217c:	e8 fc ff ff ff       	call   217d <mount_root+0xe4>
    2181:	83 c4 10             	add    $0x10,%esp
    2184:	ba 00 00 00 00       	mov    $0x0,%edx
    2189:	bf 00 00 00 00       	mov    $0x0,%edi
    218e:	eb 22                	jmp    21b2 <mount_root+0x119>
    2190:	89 d9                	mov    %ebx,%ecx
    2192:	81 e1 ff 1f 00 00    	and    $0x1fff,%ecx
    2198:	89 d8                	mov    %ebx,%eax
    219a:	c1 f8 0d             	sar    $0xd,%eax
    219d:	8b 44 86 34          	mov    0x34(%esi,%eax,4),%eax
    21a1:	8b 28                	mov    (%eax),%ebp
    21a3:	89 f8                	mov    %edi,%eax
    21a5:	0f a3 4d 00          	bt     %ecx,0x0(%ebp)
    21a9:	0f 92 c0             	setb   %al
    21ac:	83 f8 01             	cmp    $0x1,%eax
    21af:	83 d2 00             	adc    $0x0,%edx
    21b2:	4b                   	dec    %ebx
    21b3:	79 db                	jns    2190 <mount_root+0xf7>
    21b5:	83 ec 04             	sub    $0x4,%esp
    21b8:	0f b7 46 02          	movzwl 0x2(%esi),%eax
    21bc:	50                   	push   %eax
    21bd:	52                   	push   %edx
    21be:	68 ef 01 00 00       	push   $0x1ef
    21c3:	e8 fc ff ff ff       	call   21c4 <mount_root+0x12b>
    21c8:	0f b7 16             	movzwl (%esi),%edx
    21cb:	42                   	inc    %edx
    21cc:	83 c4 10             	add    $0x10,%esp
    21cf:	b9 00 00 00 00       	mov    $0x0,%ecx
    21d4:	bf 00 00 00 00       	mov    $0x0,%edi
    21d9:	eb 22                	jmp    21fd <mount_root+0x164>
    21db:	89 d3                	mov    %edx,%ebx
    21dd:	81 e3 ff 1f 00 00    	and    $0x1fff,%ebx
    21e3:	89 d0                	mov    %edx,%eax
    21e5:	c1 f8 0d             	sar    $0xd,%eax
    21e8:	8b 44 86 14          	mov    0x14(%esi,%eax,4),%eax
    21ec:	8b 28                	mov    (%eax),%ebp
    21ee:	89 f8                	mov    %edi,%eax
    21f0:	0f a3 5d 00          	bt     %ebx,0x0(%ebp)
    21f4:	0f 92 c0             	setb   %al
    21f7:	83 f8 01             	cmp    $0x1,%eax
    21fa:	83 d1 00             	adc    $0x0,%ecx
    21fd:	4a                   	dec    %edx
    21fe:	79 db                	jns    21db <mount_root+0x142>
    2200:	83 ec 04             	sub    $0x4,%esp
    2203:	0f b7 06             	movzwl (%esi),%eax
    2206:	50                   	push   %eax
    2207:	51                   	push   %ecx
    2208:	68 05 02 00 00       	push   $0x205
    220d:	e8 fc ff ff ff       	call   220e <mount_root+0x175>
    2212:	83 c4 1c             	add    $0x1c,%esp
    2215:	5b                   	pop    %ebx
    2216:	5e                   	pop    %esi
    2217:	5f                   	pop    %edi
    2218:	5d                   	pop    %ebp
    2219:	c3                   	ret    

0000221a <block_write>:
    221a:	55                   	push   %ebp
    221b:	57                   	push   %edi
    221c:	56                   	push   %esi
    221d:	53                   	push   %ebx
    221e:	83 ec 1c             	sub    $0x1c,%esp
    2221:	8b 44 24 34          	mov    0x34(%esp),%eax
    2225:	8b 30                	mov    (%eax),%esi
    2227:	89 f0                	mov    %esi,%eax
    2229:	c1 f8 0a             	sar    $0xa,%eax
    222c:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
    2232:	83 7c 24 3c 00       	cmpl   $0x0,0x3c(%esp)
    2237:	0f 8e ec 00 00 00    	jle    2329 <block_write+0x10f>
    223d:	8d 68 01             	lea    0x1(%eax),%ebp
    2240:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2247:	00 
    2248:	8d 55 ff             	lea    -0x1(%ebp),%edx
    224b:	b8 00 04 00 00       	mov    $0x400,%eax
    2250:	29 f0                	sub    %esi,%eax
    2252:	89 c3                	mov    %eax,%ebx
    2254:	3b 44 24 3c          	cmp    0x3c(%esp),%eax
    2258:	7e 04                	jle    225e <block_write+0x44>
    225a:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
    225e:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
    2264:	75 1a                	jne    2280 <block_write+0x66>
    2266:	83 ec 08             	sub    $0x8,%esp
    2269:	52                   	push   %edx
    226a:	ff 74 24 3c          	pushl  0x3c(%esp)
    226e:	e8 fc ff ff ff       	call   226f <block_write+0x55>
    2273:	83 c4 10             	add    $0x10,%esp
    2276:	85 c0                	test   %eax,%eax
    2278:	0f 85 b9 00 00 00    	jne    2337 <block_write+0x11d>
    227e:	eb 1b                	jmp    229b <block_write+0x81>
    2280:	83 ec 0c             	sub    $0xc,%esp
    2283:	6a ff                	push   $0xffffffff
    2285:	8d 45 01             	lea    0x1(%ebp),%eax
    2288:	50                   	push   %eax
    2289:	55                   	push   %ebp
    228a:	52                   	push   %edx
    228b:	ff 74 24 4c          	pushl  0x4c(%esp)
    228f:	e8 fc ff ff ff       	call   2290 <block_write+0x76>
    2294:	83 c4 20             	add    $0x20,%esp
    2297:	85 c0                	test   %eax,%eax
    2299:	75 11                	jne    22ac <block_write+0x92>
    229b:	8b 44 24 0c          	mov    0xc(%esp),%eax
    229f:	85 c0                	test   %eax,%eax
    22a1:	0f 84 89 00 00 00    	je     2330 <block_write+0x116>
    22a7:	e9 b4 00 00 00       	jmp    2360 <block_write+0x146>
    22ac:	03 30                	add    (%eax),%esi
    22ae:	8b 7c 24 34          	mov    0x34(%esp),%edi
    22b2:	01 1f                	add    %ebx,(%edi)
    22b4:	01 5c 24 0c          	add    %ebx,0xc(%esp)
    22b8:	29 5c 24 3c          	sub    %ebx,0x3c(%esp)
    22bc:	8d 7b ff             	lea    -0x1(%ebx),%edi
    22bf:	89 7c 24 08          	mov    %edi,0x8(%esp)
    22c3:	85 db                	test   %ebx,%ebx
    22c5:	7e 3b                	jle    2302 <block_write+0xe8>
    22c7:	8b 4c 24 38          	mov    0x38(%esp),%ecx
    22cb:	ba 00 00 00 00       	mov    $0x0,%edx
    22d0:	8b 7c 24 08          	mov    0x8(%esp),%edi
    22d4:	47                   	inc    %edi
    22d5:	64 8a 19             	mov    %fs:(%ecx),%bl
    22d8:	88 1c 16             	mov    %bl,(%esi,%edx,1)
    22db:	42                   	inc    %edx
    22dc:	89 fb                	mov    %edi,%ebx
    22de:	29 d3                	sub    %edx,%ebx
    22e0:	8d 49 01             	lea    0x1(%ecx),%ecx
    22e3:	85 db                	test   %ebx,%ebx
    22e5:	7f ee                	jg     22d5 <block_write+0xbb>
    22e7:	8b 7c 24 08          	mov    0x8(%esp),%edi
    22eb:	89 fa                	mov    %edi,%edx
    22ed:	85 ff                	test   %edi,%edi
    22ef:	79 05                	jns    22f6 <block_write+0xdc>
    22f1:	ba 00 00 00 00       	mov    $0x0,%edx
    22f6:	8b 74 24 38          	mov    0x38(%esp),%esi
    22fa:	8d 74 16 01          	lea    0x1(%esi,%edx,1),%esi
    22fe:	89 74 24 38          	mov    %esi,0x38(%esp)
    2302:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    2306:	83 ec 0c             	sub    $0xc,%esp
    2309:	50                   	push   %eax
    230a:	e8 fc ff ff ff       	call   230b <block_write+0xf1>
    230f:	45                   	inc    %ebp
    2310:	be 00 00 00 00       	mov    $0x0,%esi
    2315:	83 c4 10             	add    $0x10,%esp
    2318:	83 7c 24 3c 00       	cmpl   $0x0,0x3c(%esp)
    231d:	0f 8f 25 ff ff ff    	jg     2248 <block_write+0x2e>
    2323:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2327:	eb 37                	jmp    2360 <block_write+0x146>
    2329:	b8 00 00 00 00       	mov    $0x0,%eax
    232e:	eb 30                	jmp    2360 <block_write+0x146>
    2330:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
    2335:	eb 29                	jmp    2360 <block_write+0x146>
    2337:	03 30                	add    (%eax),%esi
    2339:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    233d:	81 01 00 04 00 00    	addl   $0x400,(%ecx)
    2343:	81 44 24 0c 00 04 00 	addl   $0x400,0xc(%esp)
    234a:	00 
    234b:	81 6c 24 3c 00 04 00 	subl   $0x400,0x3c(%esp)
    2352:	00 
    2353:	c7 44 24 08 ff 03 00 	movl   $0x3ff,0x8(%esp)
    235a:	00 
    235b:	e9 67 ff ff ff       	jmp    22c7 <block_write+0xad>
    2360:	83 c4 1c             	add    $0x1c,%esp
    2363:	5b                   	pop    %ebx
    2364:	5e                   	pop    %esi
    2365:	5f                   	pop    %edi
    2366:	5d                   	pop    %ebp
    2367:	c3                   	ret    

00002368 <block_read>:
    2368:	55                   	push   %ebp
    2369:	57                   	push   %edi
    236a:	56                   	push   %esi
    236b:	53                   	push   %ebx
    236c:	83 ec 1c             	sub    $0x1c,%esp
    236f:	8b 74 24 38          	mov    0x38(%esp),%esi
    2373:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
    2377:	8b 44 24 34          	mov    0x34(%esp),%eax
    237b:	8b 18                	mov    (%eax),%ebx
    237d:	89 d8                	mov    %ebx,%eax
    237f:	c1 e8 0a             	shr    $0xa,%eax
    2382:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
    2388:	85 ed                	test   %ebp,%ebp
    238a:	0f 8e 88 00 00 00    	jle    2418 <block_read+0xb0>
    2390:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2397:	00 
    2398:	ba 00 04 00 00       	mov    $0x400,%edx
    239d:	29 da                	sub    %ebx,%edx
    239f:	89 d7                	mov    %edx,%edi
    23a1:	39 ea                	cmp    %ebp,%edx
    23a3:	7e 02                	jle    23a7 <block_read+0x3f>
    23a5:	89 ef                	mov    %ebp,%edi
    23a7:	8d 48 01             	lea    0x1(%eax),%ecx
    23aa:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    23ae:	83 ec 0c             	sub    $0xc,%esp
    23b1:	6a ff                	push   $0xffffffff
    23b3:	8d 50 02             	lea    0x2(%eax),%edx
    23b6:	52                   	push   %edx
    23b7:	51                   	push   %ecx
    23b8:	50                   	push   %eax
    23b9:	ff 74 24 4c          	pushl  0x4c(%esp)
    23bd:	e8 fc ff ff ff       	call   23be <block_read+0x56>
    23c2:	83 c4 20             	add    $0x20,%esp
    23c5:	85 c0                	test   %eax,%eax
    23c7:	75 0a                	jne    23d3 <block_read+0x6b>
    23c9:	8b 44 24 0c          	mov    0xc(%esp),%eax
    23cd:	85 c0                	test   %eax,%eax
    23cf:	74 4e                	je     241f <block_read+0xb7>
    23d1:	eb 51                	jmp    2424 <block_read+0xbc>
    23d3:	03 18                	add    (%eax),%ebx
    23d5:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    23d9:	01 39                	add    %edi,(%ecx)
    23db:	01 7c 24 0c          	add    %edi,0xc(%esp)
    23df:	29 fd                	sub    %edi,%ebp
    23e1:	85 ff                	test   %edi,%edi
    23e3:	7e 14                	jle    23f9 <block_read+0x91>
    23e5:	01 f7                	add    %esi,%edi
    23e7:	8d 56 01             	lea    0x1(%esi),%edx
    23ea:	43                   	inc    %ebx
    23eb:	8a 4b ff             	mov    -0x1(%ebx),%cl
    23ee:	64 88 0e             	mov    %cl,%fs:(%esi)
    23f1:	89 d6                	mov    %edx,%esi
    23f3:	39 d7                	cmp    %edx,%edi
    23f5:	75 f0                	jne    23e7 <block_read+0x7f>
    23f7:	89 fe                	mov    %edi,%esi
    23f9:	83 ec 0c             	sub    $0xc,%esp
    23fc:	50                   	push   %eax
    23fd:	e8 fc ff ff ff       	call   23fe <block_read+0x96>
    2402:	8b 44 24 18          	mov    0x18(%esp),%eax
    2406:	bb 00 00 00 00       	mov    $0x0,%ebx
    240b:	83 c4 10             	add    $0x10,%esp
    240e:	85 ed                	test   %ebp,%ebp
    2410:	7f 86                	jg     2398 <block_read+0x30>
    2412:	8b 44 24 0c          	mov    0xc(%esp),%eax
    2416:	eb 0c                	jmp    2424 <block_read+0xbc>
    2418:	b8 00 00 00 00       	mov    $0x0,%eax
    241d:	eb 05                	jmp    2424 <block_read+0xbc>
    241f:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
    2424:	83 c4 1c             	add    $0x1c,%esp
    2427:	5b                   	pop    %ebx
    2428:	5e                   	pop    %esi
    2429:	5f                   	pop    %edi
    242a:	5d                   	pop    %ebp
    242b:	c3                   	ret    

0000242c <rw_memory>:
    242c:	57                   	push   %edi
    242d:	56                   	push   %esi
    242e:	53                   	push   %ebx
    242f:	8b 74 24 10          	mov    0x10(%esp),%esi
    2433:	83 7c 24 14 03       	cmpl   $0x3,0x14(%esp)
    2438:	74 09                	je     2443 <rw_memory+0x17>
    243a:	83 7c 24 14 04       	cmpl   $0x4,0x14(%esp)
    243f:	75 64                	jne    24a5 <rw_memory+0x79>
    2441:	eb 0a                	jmp    244d <rw_memory+0x21>
    2443:	85 f6                	test   %esi,%esi
    2445:	74 65                	je     24ac <rw_memory+0x80>
    2447:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    244b:	eb 64                	jmp    24b1 <rw_memory+0x85>
    244d:	8b 44 24 20          	mov    0x20(%esp),%eax
    2451:	8b 38                	mov    (%eax),%edi
    2453:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    2458:	7e 39                	jle    2493 <rw_memory+0x67>
    245a:	81 ff ff ff 00 00    	cmp    $0xffff,%edi
    2460:	7f 35                	jg     2497 <rw_memory+0x6b>
    2462:	8b 44 24 18          	mov    0x18(%esp),%eax
    2466:	8d 58 01             	lea    0x1(%eax),%ebx
    2469:	89 f9                	mov    %edi,%ecx
    246b:	03 4c 24 1c          	add    0x1c(%esp),%ecx
    246f:	89 fa                	mov    %edi,%edx
    2471:	85 f6                	test   %esi,%esi
    2473:	75 07                	jne    247c <rw_memory+0x50>
    2475:	ec                   	in     (%dx),%al
    2476:	64 88 43 ff          	mov    %al,%fs:-0x1(%ebx)
    247a:	eb 05                	jmp    2481 <rw_memory+0x55>
    247c:	64 8a 43 ff          	mov    %fs:-0x1(%ebx),%al
    2480:	ee                   	out    %al,(%dx)
    2481:	42                   	inc    %edx
    2482:	39 ca                	cmp    %ecx,%edx
    2484:	74 13                	je     2499 <rw_memory+0x6d>
    2486:	43                   	inc    %ebx
    2487:	81 fa 00 00 01 00    	cmp    $0x10000,%edx
    248d:	75 e2                	jne    2471 <rw_memory+0x45>
    248f:	89 d1                	mov    %edx,%ecx
    2491:	eb 06                	jmp    2499 <rw_memory+0x6d>
    2493:	89 f9                	mov    %edi,%ecx
    2495:	eb 02                	jmp    2499 <rw_memory+0x6d>
    2497:	89 f9                	mov    %edi,%ecx
    2499:	8b 44 24 20          	mov    0x20(%esp),%eax
    249d:	89 08                	mov    %ecx,(%eax)
    249f:	89 c8                	mov    %ecx,%eax
    24a1:	29 f8                	sub    %edi,%eax
    24a3:	eb 0c                	jmp    24b1 <rw_memory+0x85>
    24a5:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
    24aa:	eb 05                	jmp    24b1 <rw_memory+0x85>
    24ac:	b8 00 00 00 00       	mov    $0x0,%eax
    24b1:	5b                   	pop    %ebx
    24b2:	5e                   	pop    %esi
    24b3:	5f                   	pop    %edi
    24b4:	c3                   	ret    

000024b5 <rw_ttyx>:
    24b5:	83 ec 0c             	sub    $0xc,%esp
    24b8:	8b 44 24 14          	mov    0x14(%esp),%eax
    24bc:	8b 54 24 18          	mov    0x18(%esp),%edx
    24c0:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    24c4:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    24c9:	75 10                	jne    24db <rw_ttyx+0x26>
    24cb:	83 ec 04             	sub    $0x4,%esp
    24ce:	51                   	push   %ecx
    24cf:	52                   	push   %edx
    24d0:	50                   	push   %eax
    24d1:	e8 fc ff ff ff       	call   24d2 <rw_ttyx+0x1d>
    24d6:	83 c4 10             	add    $0x10,%esp
    24d9:	eb 0e                	jmp    24e9 <rw_ttyx+0x34>
    24db:	83 ec 04             	sub    $0x4,%esp
    24de:	51                   	push   %ecx
    24df:	52                   	push   %edx
    24e0:	50                   	push   %eax
    24e1:	e8 fc ff ff ff       	call   24e2 <rw_ttyx+0x2d>
    24e6:	83 c4 10             	add    $0x10,%esp
    24e9:	83 c4 0c             	add    $0xc,%esp
    24ec:	c3                   	ret    

000024ed <rw_tty>:
    24ed:	a1 00 00 00 00       	mov    0x0,%eax
    24f2:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
    24f8:	85 c0                	test   %eax,%eax
    24fa:	78 1e                	js     251a <rw_tty+0x2d>
    24fc:	83 ec 18             	sub    $0x18,%esp
    24ff:	ff 74 24 2c          	pushl  0x2c(%esp)
    2503:	ff 74 24 2c          	pushl  0x2c(%esp)
    2507:	ff 74 24 2c          	pushl  0x2c(%esp)
    250b:	50                   	push   %eax
    250c:	ff 74 24 2c          	pushl  0x2c(%esp)
    2510:	e8 a0 ff ff ff       	call   24b5 <rw_ttyx>
    2515:	83 c4 20             	add    $0x20,%esp
    2518:	eb 06                	jmp    2520 <rw_tty+0x33>
    251a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    251f:	c3                   	ret    
    2520:	83 c4 0c             	add    $0xc,%esp
    2523:	c3                   	ret    

00002524 <rw_char>:
    2524:	83 ec 0c             	sub    $0xc,%esp
    2527:	8b 44 24 14          	mov    0x14(%esp),%eax
    252b:	c1 e8 08             	shr    $0x8,%eax
    252e:	83 f8 07             	cmp    $0x7,%eax
    2531:	77 2b                	ja     255e <rw_char+0x3a>
    2533:	8b 14 85 00 00 00 00 	mov    0x0(,%eax,4),%edx
    253a:	85 d2                	test   %edx,%edx
    253c:	74 27                	je     2565 <rw_char+0x41>
    253e:	83 ec 0c             	sub    $0xc,%esp
    2541:	ff 74 24 2c          	pushl  0x2c(%esp)
    2545:	ff 74 24 2c          	pushl  0x2c(%esp)
    2549:	ff 74 24 2c          	pushl  0x2c(%esp)
    254d:	0f b6 44 24 2c       	movzbl 0x2c(%esp),%eax
    2552:	50                   	push   %eax
    2553:	ff 74 24 2c          	pushl  0x2c(%esp)
    2557:	ff d2                	call   *%edx
    2559:	83 c4 20             	add    $0x20,%esp
    255c:	eb 0c                	jmp    256a <rw_char+0x46>
    255e:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
    2563:	eb 05                	jmp    256a <rw_char+0x46>
    2565:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
    256a:	83 c4 0c             	add    $0xc,%esp
    256d:	c3                   	ret    

0000256e <file_read>:
    256e:	55                   	push   %ebp
    256f:	89 e5                	mov    %esp,%ebp
    2571:	57                   	push   %edi
    2572:	56                   	push   %esi
    2573:	53                   	push   %ebx
    2574:	83 ec 1c             	sub    $0x1c,%esp
    2577:	8b 7d 0c             	mov    0xc(%ebp),%edi
    257a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    257d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2581:	0f 8e f1 00 00 00    	jle    2678 <file_read+0x10a>
    2587:	8b 45 14             	mov    0x14(%ebp),%eax
    258a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    258d:	83 ec 08             	sub    $0x8,%esp
    2590:	8b 47 0c             	mov    0xc(%edi),%eax
    2593:	85 c0                	test   %eax,%eax
    2595:	79 05                	jns    259c <file_read+0x2e>
    2597:	05 ff 03 00 00       	add    $0x3ff,%eax
    259c:	c1 f8 0a             	sar    $0xa,%eax
    259f:	50                   	push   %eax
    25a0:	ff 75 08             	pushl  0x8(%ebp)
    25a3:	e8 fc ff ff ff       	call   25a4 <file_read+0x36>
    25a8:	83 c4 10             	add    $0x10,%esp
    25ab:	85 c0                	test   %eax,%eax
    25ad:	0f 84 d9 00 00 00    	je     268c <file_read+0x11e>
    25b3:	83 ec 08             	sub    $0x8,%esp
    25b6:	50                   	push   %eax
    25b7:	8b 45 08             	mov    0x8(%ebp),%eax
    25ba:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    25be:	50                   	push   %eax
    25bf:	e8 fc ff ff ff       	call   25c0 <file_read+0x52>
    25c4:	89 c1                	mov    %eax,%ecx
    25c6:	83 c4 10             	add    $0x10,%esp
    25c9:	85 c0                	test   %eax,%eax
    25cb:	0f 85 fa 00 00 00    	jne    26cb <file_read+0x15d>
    25d1:	eb 6e                	jmp    2641 <file_read+0xd3>
    25d3:	8d 53 01             	lea    0x1(%ebx),%edx
    25d6:	40                   	inc    %eax
    25d7:	8a 48 ff             	mov    -0x1(%eax),%cl
    25da:	64 88 0b             	mov    %cl,%fs:(%ebx)
    25dd:	89 d3                	mov    %edx,%ebx
    25df:	39 d6                	cmp    %edx,%esi
    25e1:	75 f0                	jne    25d3 <file_read+0x65>
    25e3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    25e6:	eb 02                	jmp    25ea <file_read+0x7c>
    25e8:	89 de                	mov    %ebx,%esi
    25ea:	83 ec 0c             	sub    $0xc,%esp
    25ed:	51                   	push   %ecx
    25ee:	e8 fc ff ff ff       	call   25ef <file_read+0x81>
    25f3:	83 c4 10             	add    $0x10,%esp
    25f6:	89 f3                	mov    %esi,%ebx
    25f8:	eb 13                	jmp    260d <file_read+0x9f>
    25fa:	8d 53 01             	lea    0x1(%ebx),%edx
    25fd:	b1 00                	mov    $0x0,%cl
    25ff:	64 88 0b             	mov    %cl,%fs:(%ebx)
    2602:	89 d3                	mov    %edx,%ebx
    2604:	39 d0                	cmp    %edx,%eax
    2606:	75 f2                	jne    25fa <file_read+0x8c>
    2608:	89 75 e4             	mov    %esi,-0x1c(%ebp)
    260b:	89 c3                	mov    %eax,%ebx
    260d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2611:	0f 85 76 ff ff ff    	jne    258d <file_read+0x1f>
    2617:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    261a:	89 c6                	mov    %eax,%esi
    261c:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2622:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    2627:	f7 e9                	imul   %ecx
    2629:	89 d0                	mov    %edx,%eax
    262b:	c1 f8 05             	sar    $0x5,%eax
    262e:	c1 f9 1f             	sar    $0x1f,%ecx
    2631:	29 c8                	sub    %ecx,%eax
    2633:	03 05 00 00 00 00    	add    0x0,%eax
    2639:	8b 7d 08             	mov    0x8(%ebp),%edi
    263c:	89 47 24             	mov    %eax,0x24(%edi)
    263f:	eb 2d                	jmp    266e <file_read+0x100>
    2641:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2644:	89 c6                	mov    %eax,%esi
    2646:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    264c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    2651:	f7 e9                	imul   %ecx
    2653:	89 d0                	mov    %edx,%eax
    2655:	c1 f8 05             	sar    $0x5,%eax
    2658:	c1 f9 1f             	sar    $0x1f,%ecx
    265b:	29 c8                	sub    %ecx,%eax
    265d:	03 05 00 00 00 00    	add    0x0,%eax
    2663:	8b 7d 08             	mov    0x8(%ebp),%edi
    2666:	89 47 24             	mov    %eax,0x24(%edi)
    2669:	39 75 14             	cmp    %esi,0x14(%ebp)
    266c:	74 14                	je     2682 <file_read+0x114>
    266e:	8b 45 14             	mov    0x14(%ebp),%eax
    2671:	29 f0                	sub    %esi,%eax
    2673:	e9 9b 00 00 00       	jmp    2713 <file_read+0x1a5>
    2678:	b8 00 00 00 00       	mov    $0x0,%eax
    267d:	e9 91 00 00 00       	jmp    2713 <file_read+0x1a5>
    2682:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    2687:	e9 87 00 00 00       	jmp    2713 <file_read+0x1a5>
    268c:	8b 57 0c             	mov    0xc(%edi),%edx
    268f:	89 d0                	mov    %edx,%eax
    2691:	25 ff 03 00 80       	and    $0x800003ff,%eax
    2696:	79 07                	jns    269f <file_read+0x131>
    2698:	48                   	dec    %eax
    2699:	0d 00 fc ff ff       	or     $0xfffffc00,%eax
    269e:	40                   	inc    %eax
    269f:	b9 00 04 00 00       	mov    $0x400,%ecx
    26a4:	29 c1                	sub    %eax,%ecx
    26a6:	89 c8                	mov    %ecx,%eax
    26a8:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    26ab:	39 f1                	cmp    %esi,%ecx
    26ad:	7e 02                	jle    26b1 <file_read+0x143>
    26af:	89 f0                	mov    %esi,%eax
    26b1:	01 c2                	add    %eax,%edx
    26b3:	89 57 0c             	mov    %edx,0xc(%edi)
    26b6:	29 45 e4             	sub    %eax,-0x1c(%ebp)
    26b9:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    26bc:	85 c0                	test   %eax,%eax
    26be:	0f 8e 49 ff ff ff    	jle    260d <file_read+0x9f>
    26c4:	01 d8                	add    %ebx,%eax
    26c6:	e9 2f ff ff ff       	jmp    25fa <file_read+0x8c>
    26cb:	8b 57 0c             	mov    0xc(%edi),%edx
    26ce:	89 d6                	mov    %edx,%esi
    26d0:	81 e6 ff 03 00 80    	and    $0x800003ff,%esi
    26d6:	79 08                	jns    26e0 <file_read+0x172>
    26d8:	4e                   	dec    %esi
    26d9:	81 ce 00 fc ff ff    	or     $0xfffffc00,%esi
    26df:	46                   	inc    %esi
    26e0:	89 75 e0             	mov    %esi,-0x20(%ebp)
    26e3:	b8 00 04 00 00       	mov    $0x400,%eax
    26e8:	29 f0                	sub    %esi,%eax
    26ea:	89 c6                	mov    %eax,%esi
    26ec:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    26ef:	7e 03                	jle    26f4 <file_read+0x186>
    26f1:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    26f4:	01 f2                	add    %esi,%edx
    26f6:	89 57 0c             	mov    %edx,0xc(%edi)
    26f9:	29 75 e4             	sub    %esi,-0x1c(%ebp)
    26fc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    26ff:	03 01                	add    (%ecx),%eax
    2701:	85 f6                	test   %esi,%esi
    2703:	0f 8e df fe ff ff    	jle    25e8 <file_read+0x7a>
    2709:	01 de                	add    %ebx,%esi
    270b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    270e:	e9 c0 fe ff ff       	jmp    25d3 <file_read+0x65>
    2713:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2716:	5b                   	pop    %ebx
    2717:	5e                   	pop    %esi
    2718:	5f                   	pop    %edi
    2719:	5d                   	pop    %ebp
    271a:	c3                   	ret    

0000271b <file_write>:
    271b:	55                   	push   %ebp
    271c:	89 e5                	mov    %esp,%ebp
    271e:	57                   	push   %edi
    271f:	56                   	push   %esi
    2720:	53                   	push   %ebx
    2721:	83 ec 1c             	sub    $0x1c,%esp
    2724:	8b 5d 10             	mov    0x10(%ebp),%ebx
    2727:	8b 45 0c             	mov    0xc(%ebp),%eax
    272a:	f6 40 03 04          	testb  $0x4,0x3(%eax)
    272e:	74 08                	je     2738 <file_write+0x1d>
    2730:	8b 45 08             	mov    0x8(%ebp),%eax
    2733:	8b 70 04             	mov    0x4(%eax),%esi
    2736:	eb 06                	jmp    273e <file_write+0x23>
    2738:	8b 45 0c             	mov    0xc(%ebp),%eax
    273b:	8b 70 0c             	mov    0xc(%eax),%esi
    273e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2742:	0f 8e c3 00 00 00    	jle    280b <file_write+0xf0>
    2748:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    274f:	83 ec 08             	sub    $0x8,%esp
    2752:	89 f0                	mov    %esi,%eax
    2754:	85 f6                	test   %esi,%esi
    2756:	79 06                	jns    275e <file_write+0x43>
    2758:	8d 86 ff 03 00 00    	lea    0x3ff(%esi),%eax
    275e:	c1 f8 0a             	sar    $0xa,%eax
    2761:	50                   	push   %eax
    2762:	ff 75 08             	pushl  0x8(%ebp)
    2765:	e8 fc ff ff ff       	call   2766 <file_write+0x4b>
    276a:	83 c4 10             	add    $0x10,%esp
    276d:	85 c0                	test   %eax,%eax
    276f:	0f 84 9f 00 00 00    	je     2814 <file_write+0xf9>
    2775:	83 ec 08             	sub    $0x8,%esp
    2778:	50                   	push   %eax
    2779:	8b 45 08             	mov    0x8(%ebp),%eax
    277c:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    2780:	50                   	push   %eax
    2781:	e8 fc ff ff ff       	call   2782 <file_write+0x67>
    2786:	83 c4 10             	add    $0x10,%esp
    2789:	85 c0                	test   %eax,%eax
    278b:	0f 84 85 00 00 00    	je     2816 <file_write+0xfb>
    2791:	89 f1                	mov    %esi,%ecx
    2793:	81 e1 ff 03 00 80    	and    $0x800003ff,%ecx
    2799:	79 08                	jns    27a3 <file_write+0x88>
    279b:	49                   	dec    %ecx
    279c:	81 c9 00 fc ff ff    	or     $0xfffffc00,%ecx
    27a2:	41                   	inc    %ecx
    27a3:	89 ca                	mov    %ecx,%edx
    27a5:	03 10                	add    (%eax),%edx
    27a7:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    27ab:	bf 00 04 00 00       	mov    $0x400,%edi
    27b0:	29 cf                	sub    %ecx,%edi
    27b2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    27b5:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    27b8:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    27bb:	89 f9                	mov    %edi,%ecx
    27bd:	3b 7d e0             	cmp    -0x20(%ebp),%edi
    27c0:	7e 03                	jle    27c5 <file_write+0xaa>
    27c2:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    27c5:	01 ce                	add    %ecx,%esi
    27c7:	8b 7d 08             	mov    0x8(%ebp),%edi
    27ca:	39 77 04             	cmp    %esi,0x4(%edi)
    27cd:	73 07                	jae    27d6 <file_write+0xbb>
    27cf:	89 77 04             	mov    %esi,0x4(%edi)
    27d2:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    27d6:	01 4d e4             	add    %ecx,-0x1c(%ebp)
    27d9:	85 c9                	test   %ecx,%ecx
    27db:	7e 14                	jle    27f1 <file_write+0xd6>
    27dd:	01 d9                	add    %ebx,%ecx
    27df:	42                   	inc    %edx
    27e0:	8d 7b 01             	lea    0x1(%ebx),%edi
    27e3:	64 8a 1b             	mov    %fs:(%ebx),%bl
    27e6:	88 5a ff             	mov    %bl,-0x1(%edx)
    27e9:	89 fb                	mov    %edi,%ebx
    27eb:	39 cf                	cmp    %ecx,%edi
    27ed:	75 f0                	jne    27df <file_write+0xc4>
    27ef:	89 cb                	mov    %ecx,%ebx
    27f1:	83 ec 0c             	sub    $0xc,%esp
    27f4:	50                   	push   %eax
    27f5:	e8 fc ff ff ff       	call   27f6 <file_write+0xdb>
    27fa:	83 c4 10             	add    $0x10,%esp
    27fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2800:	39 45 14             	cmp    %eax,0x14(%ebp)
    2803:	0f 8f 46 ff ff ff    	jg     274f <file_write+0x34>
    2809:	eb 0b                	jmp    2816 <file_write+0xfb>
    280b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    2812:	eb 02                	jmp    2816 <file_write+0xfb>
    2814:	eb 00                	jmp    2816 <file_write+0xfb>
    2816:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    281c:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    2822:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    2827:	f7 e9                	imul   %ecx
    2829:	89 d0                	mov    %edx,%eax
    282b:	c1 f8 05             	sar    $0x5,%eax
    282e:	c1 f9 1f             	sar    $0x1f,%ecx
    2831:	29 c8                	sub    %ecx,%eax
    2833:	01 d8                	add    %ebx,%eax
    2835:	8b 55 08             	mov    0x8(%ebp),%edx
    2838:	89 42 08             	mov    %eax,0x8(%edx)
    283b:	8b 45 0c             	mov    0xc(%ebp),%eax
    283e:	f6 40 03 04          	testb  $0x4,0x3(%eax)
    2842:	75 22                	jne    2866 <file_write+0x14b>
    2844:	89 70 0c             	mov    %esi,0xc(%eax)
    2847:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    284d:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    2852:	f7 e9                	imul   %ecx
    2854:	89 d0                	mov    %edx,%eax
    2856:	c1 f8 05             	sar    $0x5,%eax
    2859:	c1 f9 1f             	sar    $0x1f,%ecx
    285c:	29 c8                	sub    %ecx,%eax
    285e:	01 c3                	add    %eax,%ebx
    2860:	8b 45 08             	mov    0x8(%ebp),%eax
    2863:	89 58 28             	mov    %ebx,0x28(%eax)
    2866:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2869:	85 c0                	test   %eax,%eax
    286b:	75 05                	jne    2872 <file_write+0x157>
    286d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2872:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2875:	5b                   	pop    %ebx
    2876:	5e                   	pop    %esi
    2877:	5f                   	pop    %edi
    2878:	5d                   	pop    %ebp
    2879:	c3                   	ret    

0000287a <cp_stat>:
    287a:	56                   	push   %esi
    287b:	53                   	push   %ebx
    287c:	83 ec 2c             	sub    $0x2c,%esp
    287f:	89 c6                	mov    %eax,%esi
    2881:	89 d3                	mov    %edx,%ebx
    2883:	6a 20                	push   $0x20
    2885:	52                   	push   %edx
    2886:	e8 fc ff ff ff       	call   2887 <cp_stat+0xd>
    288b:	8b 46 2c             	mov    0x2c(%esi),%eax
    288e:	66 89 44 24 10       	mov    %ax,0x10(%esp)
    2893:	66 8b 46 2e          	mov    0x2e(%esi),%ax
    2897:	66 89 44 24 12       	mov    %ax,0x12(%esp)
    289c:	8b 06                	mov    (%esi),%eax
    289e:	66 89 44 24 14       	mov    %ax,0x14(%esp)
    28a3:	8a 46 0d             	mov    0xd(%esi),%al
    28a6:	88 44 24 16          	mov    %al,0x16(%esp)
    28aa:	66 8b 46 02          	mov    0x2(%esi),%ax
    28ae:	66 89 44 24 18       	mov    %ax,0x18(%esp)
    28b3:	8a 46 0c             	mov    0xc(%esi),%al
    28b6:	88 44 24 1a          	mov    %al,0x1a(%esp)
    28ba:	66 8b 46 0e          	mov    0xe(%esi),%ax
    28be:	66 89 44 24 1c       	mov    %ax,0x1c(%esp)
    28c3:	8b 46 04             	mov    0x4(%esi),%eax
    28c6:	89 44 24 20          	mov    %eax,0x20(%esp)
    28ca:	8b 46 24             	mov    0x24(%esi),%eax
    28cd:	89 44 24 24          	mov    %eax,0x24(%esp)
    28d1:	8b 46 08             	mov    0x8(%esi),%eax
    28d4:	89 44 24 28          	mov    %eax,0x28(%esp)
    28d8:	8b 46 28             	mov    0x28(%esi),%eax
    28db:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    28df:	83 c4 10             	add    $0x10,%esp
    28e2:	b8 00 00 00 00       	mov    $0x0,%eax
    28e7:	8a 0c 04             	mov    (%esp,%eax,1),%cl
    28ea:	64 88 0c 03          	mov    %cl,%fs:(%ebx,%eax,1)
    28ee:	40                   	inc    %eax
    28ef:	83 f8 20             	cmp    $0x20,%eax
    28f2:	75 f3                	jne    28e7 <cp_stat+0x6d>
    28f4:	83 c4 24             	add    $0x24,%esp
    28f7:	5b                   	pop    %ebx
    28f8:	5e                   	pop    %esi
    28f9:	c3                   	ret    

000028fa <sys_stat>:
    28fa:	53                   	push   %ebx
    28fb:	83 ec 14             	sub    $0x14,%esp
    28fe:	ff 74 24 1c          	pushl  0x1c(%esp)
    2902:	e8 fc ff ff ff       	call   2903 <sys_stat+0x9>
    2907:	83 c4 10             	add    $0x10,%esp
    290a:	85 c0                	test   %eax,%eax
    290c:	74 1e                	je     292c <sys_stat+0x32>
    290e:	89 c3                	mov    %eax,%ebx
    2910:	8b 54 24 14          	mov    0x14(%esp),%edx
    2914:	e8 61 ff ff ff       	call   287a <cp_stat>
    2919:	83 ec 0c             	sub    $0xc,%esp
    291c:	53                   	push   %ebx
    291d:	e8 fc ff ff ff       	call   291e <sys_stat+0x24>
    2922:	83 c4 10             	add    $0x10,%esp
    2925:	b8 00 00 00 00       	mov    $0x0,%eax
    292a:	eb 05                	jmp    2931 <sys_stat+0x37>
    292c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    2931:	83 c4 08             	add    $0x8,%esp
    2934:	5b                   	pop    %ebx
    2935:	c3                   	ret    

00002936 <sys_fstat>:
    2936:	83 ec 0c             	sub    $0xc,%esp
    2939:	8b 44 24 10          	mov    0x10(%esp),%eax
    293d:	83 f8 13             	cmp    $0x13,%eax
    2940:	77 28                	ja     296a <sys_fstat+0x34>
    2942:	8b 15 00 00 00 00    	mov    0x0,%edx
    2948:	8b 84 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%eax
    294f:	85 c0                	test   %eax,%eax
    2951:	74 1e                	je     2971 <sys_fstat+0x3b>
    2953:	8b 40 08             	mov    0x8(%eax),%eax
    2956:	85 c0                	test   %eax,%eax
    2958:	74 1e                	je     2978 <sys_fstat+0x42>
    295a:	8b 54 24 14          	mov    0x14(%esp),%edx
    295e:	e8 17 ff ff ff       	call   287a <cp_stat>
    2963:	b8 00 00 00 00       	mov    $0x0,%eax
    2968:	eb 13                	jmp    297d <sys_fstat+0x47>
    296a:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    296f:	eb 0c                	jmp    297d <sys_fstat+0x47>
    2971:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    2976:	eb 05                	jmp    297d <sys_fstat+0x47>
    2978:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    297d:	83 c4 0c             	add    $0xc,%esp
    2980:	c3                   	ret    

00002981 <copy_strings>:
    2981:	55                   	push   %ebp
    2982:	57                   	push   %edi
    2983:	56                   	push   %esi
    2984:	53                   	push   %ebx
    2985:	83 ec 3c             	sub    $0x3c,%esp
    2988:	83 7c 24 50 00       	cmpl   $0x0,0x50(%esp)
    298d:	0f 84 3e 01 00 00    	je     2ad1 <copy_strings+0x150>
    2993:	89 c3                	mov    %eax,%ebx
    2995:	66 8c d8             	mov    %ds,%ax
    2998:	89 c6                	mov    %eax,%esi
    299a:	66 89 44 24 1c       	mov    %ax,0x1c(%esp)
    299f:	66 8c e0             	mov    %fs,%ax
    29a2:	66 89 44 24 1e       	mov    %ax,0x1e(%esp)
    29a7:	66 89 44 24 1a       	mov    %ax,0x1a(%esp)
    29ac:	83 7c 24 54 02       	cmpl   $0x2,0x54(%esp)
    29b1:	75 04                	jne    29b7 <copy_strings+0x36>
    29b3:	89 f0                	mov    %esi,%eax
    29b5:	8e e0                	mov    %eax,%fs
    29b7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    29bb:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
    29c2:	00 
    29c3:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    29c7:	8d 44 9a fc          	lea    -0x4(%edx,%ebx,4),%eax
    29cb:	89 44 24 10          	mov    %eax,0x10(%esp)
    29cf:	bd 00 00 00 00       	mov    $0x0,%ebp
    29d4:	e9 c4 00 00 00       	jmp    2a9d <copy_strings+0x11c>
    29d9:	83 7c 24 54 01       	cmpl   $0x1,0x54(%esp)
    29de:	0f 85 14 01 00 00    	jne    2af8 <copy_strings+0x177>
    29e4:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    29e8:	8e e0                	mov    %eax,%fs
    29ea:	8b 44 24 10          	mov    0x10(%esp),%eax
    29ee:	64 8b 00             	mov    %fs:(%eax),%eax
    29f1:	89 c6                	mov    %eax,%esi
    29f3:	85 c0                	test   %eax,%eax
    29f5:	0f 84 79 01 00 00    	je     2b74 <copy_strings+0x1f3>
    29fb:	66 8b 44 24 1a       	mov    0x1a(%esp),%ax
    2a00:	8e e0                	mov    %eax,%fs
    2a02:	bf 00 00 00 00       	mov    $0x0,%edi
    2a07:	47                   	inc    %edi
    2a08:	8d 5e 01             	lea    0x1(%esi),%ebx
    2a0b:	64 8a 06             	mov    %fs:(%esi),%al
    2a0e:	89 de                	mov    %ebx,%esi
    2a10:	84 c0                	test   %al,%al
    2a12:	75 f3                	jne    2a07 <copy_strings+0x86>
    2a14:	85 ff                	test   %edi,%edi
    2a16:	74 74                	je     2a8c <copy_strings+0x10b>
    2a18:	8b 74 24 50          	mov    0x50(%esp),%esi
    2a1c:	4e                   	dec    %esi
    2a1d:	4b                   	dec    %ebx
    2a1e:	4d                   	dec    %ebp
    2a1f:	79 55                	jns    2a76 <copy_strings+0xf5>
    2a21:	83 ec 08             	sub    $0x8,%esp
    2a24:	6a 01                	push   $0x1
    2a26:	8d 44 24 34          	lea    0x34(%esp),%eax
    2a2a:	50                   	push   %eax
    2a2b:	e8 fc ff ff ff       	call   2a2c <copy_strings+0xab>
    2a30:	89 f5                	mov    %esi,%ebp
    2a32:	81 e5 ff 0f 00 00    	and    $0xfff,%ebp
    2a38:	83 c4 10             	add    $0x10,%esp
    2a3b:	83 7c 24 54 02       	cmpl   $0x2,0x54(%esp)
    2a40:	0f 85 0f 01 00 00    	jne    2b55 <copy_strings+0x1d4>
    2a46:	66 8b 44 24 1a       	mov    0x1a(%esp),%ax
    2a4b:	8e e0                	mov    %eax,%fs
    2a4d:	89 f0                	mov    %esi,%eax
    2a4f:	c1 e8 0c             	shr    $0xc,%eax
    2a52:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    2a56:	8d 04 81             	lea    (%ecx,%eax,4),%eax
    2a59:	89 44 24 14          	mov    %eax,0x14(%esp)
    2a5d:	8b 00                	mov    (%eax),%eax
    2a5f:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    2a63:	85 c0                	test   %eax,%eax
    2a65:	0f 84 58 01 00 00    	je     2bc3 <copy_strings+0x242>
    2a6b:	e9 9b 00 00 00       	jmp    2b0b <copy_strings+0x18a>
    2a70:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    2a74:	8e e0                	mov    %eax,%fs
    2a76:	64 8a 13             	mov    %fs:(%ebx),%dl
    2a79:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    2a7d:	88 14 28             	mov    %dl,(%eax,%ebp,1)
    2a80:	89 f0                	mov    %esi,%eax
    2a82:	2b 44 24 50          	sub    0x50(%esp),%eax
    2a86:	01 f8                	add    %edi,%eax
    2a88:	75 92                	jne    2a1c <copy_strings+0x9b>
    2a8a:	eb 04                	jmp    2a90 <copy_strings+0x10f>
    2a8c:	8b 74 24 50          	mov    0x50(%esp),%esi
    2a90:	ff 4c 24 0c          	decl   0xc(%esp)
    2a94:	83 6c 24 10 04       	subl   $0x4,0x10(%esp)
    2a99:	89 74 24 50          	mov    %esi,0x50(%esp)
    2a9d:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    2aa2:	0f 8f 31 ff ff ff    	jg     29d9 <copy_strings+0x58>
    2aa8:	83 ec 08             	sub    $0x8,%esp
    2aab:	6a 01                	push   $0x1
    2aad:	8d 44 24 34          	lea    0x34(%esp),%eax
    2ab1:	50                   	push   %eax
    2ab2:	e8 fc ff ff ff       	call   2ab3 <copy_strings+0x132>
    2ab7:	83 c4 10             	add    $0x10,%esp
    2aba:	83 7c 24 54 02       	cmpl   $0x2,0x54(%esp)
    2abf:	75 1a                	jne    2adb <copy_strings+0x15a>
    2ac1:	66 8b 44 24 1e       	mov    0x1e(%esp),%ax
    2ac6:	8e e0                	mov    %eax,%fs
    2ac8:	8b 44 24 50          	mov    0x50(%esp),%eax
    2acc:	e9 58 01 00 00       	jmp    2c29 <copy_strings+0x2a8>
    2ad1:	b8 00 00 00 00       	mov    $0x0,%eax
    2ad6:	e9 4e 01 00 00       	jmp    2c29 <copy_strings+0x2a8>
    2adb:	8b 44 24 50          	mov    0x50(%esp),%eax
    2adf:	e9 45 01 00 00       	jmp    2c29 <copy_strings+0x2a8>
    2ae4:	b8 00 00 00 00       	mov    $0x0,%eax
    2ae9:	e9 3b 01 00 00       	jmp    2c29 <copy_strings+0x2a8>
    2aee:	b8 00 00 00 00       	mov    $0x0,%eax
    2af3:	e9 31 01 00 00       	jmp    2c29 <copy_strings+0x2a8>
    2af8:	8b 44 24 10          	mov    0x10(%esp),%eax
    2afc:	64 8b 00             	mov    %fs:(%eax),%eax
    2aff:	89 c6                	mov    %eax,%esi
    2b01:	85 c0                	test   %eax,%eax
    2b03:	0f 85 f9 fe ff ff    	jne    2a02 <copy_strings+0x81>
    2b09:	eb 7e                	jmp    2b89 <copy_strings+0x208>
    2b0b:	83 ec 0c             	sub    $0xc,%esp
    2b0e:	8d 44 24 38          	lea    0x38(%esp),%eax
    2b12:	50                   	push   %eax
    2b13:	e8 fc ff ff ff       	call   2b14 <copy_strings+0x193>
    2b18:	83 c4 0c             	add    $0xc,%esp
    2b1b:	50                   	push   %eax
    2b1c:	6a 01                	push   $0x1
    2b1e:	8d 44 24 34          	lea    0x34(%esp),%eax
    2b22:	50                   	push   %eax
    2b23:	e8 fc ff ff ff       	call   2b24 <copy_strings+0x1a3>
    2b28:	83 c4 10             	add    $0x10,%esp
    2b2b:	e9 40 ff ff ff       	jmp    2a70 <copy_strings+0xef>
    2b30:	83 ec 0c             	sub    $0xc,%esp
    2b33:	8d 44 24 38          	lea    0x38(%esp),%eax
    2b37:	50                   	push   %eax
    2b38:	e8 fc ff ff ff       	call   2b39 <copy_strings+0x1b8>
    2b3d:	83 c4 0c             	add    $0xc,%esp
    2b40:	50                   	push   %eax
    2b41:	6a 01                	push   $0x1
    2b43:	8d 44 24 34          	lea    0x34(%esp),%eax
    2b47:	50                   	push   %eax
    2b48:	e8 fc ff ff ff       	call   2b49 <copy_strings+0x1c8>
    2b4d:	83 c4 10             	add    $0x10,%esp
    2b50:	e9 21 ff ff ff       	jmp    2a76 <copy_strings+0xf5>
    2b55:	89 f0                	mov    %esi,%eax
    2b57:	c1 e8 0c             	shr    $0xc,%eax
    2b5a:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    2b5e:	8d 04 81             	lea    (%ecx,%eax,4),%eax
    2b61:	89 44 24 14          	mov    %eax,0x14(%esp)
    2b65:	8b 00                	mov    (%eax),%eax
    2b67:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    2b6b:	85 c0                	test   %eax,%eax
    2b6d:	75 c1                	jne    2b30 <copy_strings+0x1af>
    2b6f:	e9 94 00 00 00       	jmp    2c08 <copy_strings+0x287>
    2b74:	83 ec 0c             	sub    $0xc,%esp
    2b77:	68 1b 02 00 00       	push   $0x21b
    2b7c:	e8 fc ff ff ff       	call   2b7d <copy_strings+0x1fc>
    2b81:	83 c4 10             	add    $0x10,%esp
    2b84:	e9 72 fe ff ff       	jmp    29fb <copy_strings+0x7a>
    2b89:	83 ec 0c             	sub    $0xc,%esp
    2b8c:	68 1b 02 00 00       	push   $0x21b
    2b91:	e8 fc ff ff ff       	call   2b92 <copy_strings+0x211>
    2b96:	83 c4 10             	add    $0x10,%esp
    2b99:	e9 64 fe ff ff       	jmp    2a02 <copy_strings+0x81>
    2b9e:	83 ec 0c             	sub    $0xc,%esp
    2ba1:	8d 44 24 38          	lea    0x38(%esp),%eax
    2ba5:	50                   	push   %eax
    2ba6:	e8 fc ff ff ff       	call   2ba7 <copy_strings+0x226>
    2bab:	83 c4 0c             	add    $0xc,%esp
    2bae:	50                   	push   %eax
    2baf:	6a 01                	push   $0x1
    2bb1:	8d 44 24 34          	lea    0x34(%esp),%eax
    2bb5:	50                   	push   %eax
    2bb6:	e8 fc ff ff ff       	call   2bb7 <copy_strings+0x236>
    2bbb:	83 c4 10             	add    $0x10,%esp
    2bbe:	e9 ad fe ff ff       	jmp    2a70 <copy_strings+0xef>
    2bc3:	83 ec 0c             	sub    $0xc,%esp
    2bc6:	6a 00                	push   $0x0
    2bc8:	e8 fc ff ff ff       	call   2bc9 <copy_strings+0x248>
    2bcd:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    2bd1:	89 01                	mov    %eax,(%ecx)
    2bd3:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    2bd7:	83 c4 10             	add    $0x10,%esp
    2bda:	85 c0                	test   %eax,%eax
    2bdc:	75 c0                	jne    2b9e <copy_strings+0x21d>
    2bde:	e9 01 ff ff ff       	jmp    2ae4 <copy_strings+0x163>
    2be3:	83 ec 0c             	sub    $0xc,%esp
    2be6:	8d 44 24 38          	lea    0x38(%esp),%eax
    2bea:	50                   	push   %eax
    2beb:	e8 fc ff ff ff       	call   2bec <copy_strings+0x26b>
    2bf0:	83 c4 0c             	add    $0xc,%esp
    2bf3:	50                   	push   %eax
    2bf4:	6a 01                	push   $0x1
    2bf6:	8d 44 24 34          	lea    0x34(%esp),%eax
    2bfa:	50                   	push   %eax
    2bfb:	e8 fc ff ff ff       	call   2bfc <copy_strings+0x27b>
    2c00:	83 c4 10             	add    $0x10,%esp
    2c03:	e9 6e fe ff ff       	jmp    2a76 <copy_strings+0xf5>
    2c08:	83 ec 0c             	sub    $0xc,%esp
    2c0b:	6a 00                	push   $0x0
    2c0d:	e8 fc ff ff ff       	call   2c0e <copy_strings+0x28d>
    2c12:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    2c16:	89 01                	mov    %eax,(%ecx)
    2c18:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    2c1c:	83 c4 10             	add    $0x10,%esp
    2c1f:	85 c0                	test   %eax,%eax
    2c21:	0f 84 c7 fe ff ff    	je     2aee <copy_strings+0x16d>
    2c27:	eb ba                	jmp    2be3 <copy_strings+0x262>
    2c29:	83 c4 3c             	add    $0x3c,%esp
    2c2c:	5b                   	pop    %ebx
    2c2d:	5e                   	pop    %esi
    2c2e:	5f                   	pop    %edi
    2c2f:	5d                   	pop    %ebp
    2c30:	c3                   	ret    

00002c31 <create_tables>:
    2c31:	55                   	push   %ebp
    2c32:	57                   	push   %edi
    2c33:	56                   	push   %esi
    2c34:	53                   	push   %ebx
    2c35:	83 ec 04             	sub    $0x4,%esp
    2c38:	8b 44 24 18          	mov    0x18(%esp),%eax
    2c3c:	89 c2                	mov    %eax,%edx
    2c3e:	83 e2 fc             	and    $0xfffffffc,%edx
    2c41:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    2c45:	f7 d1                	not    %ecx
    2c47:	8d 2c 8a             	lea    (%edx,%ecx,4),%ebp
    2c4a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    2c4e:	f7 d2                	not    %edx
    2c50:	8d 7c 95 00          	lea    0x0(%ebp,%edx,4),%edi
    2c54:	64 89 6f fc          	mov    %ebp,%fs:-0x4(%edi)
    2c58:	64 89 7f f8          	mov    %edi,%fs:-0x8(%edi)
    2c5c:	8d 77 f4             	lea    -0xc(%edi),%esi
    2c5f:	89 34 24             	mov    %esi,(%esp)
    2c62:	8b 74 24 1c          	mov    0x1c(%esp),%esi
    2c66:	64 89 77 f4          	mov    %esi,%fs:-0xc(%edi)
    2c6a:	89 f3                	mov    %esi,%ebx
    2c6c:	89 f9                	mov    %edi,%ecx
    2c6e:	eb 15                	jmp    2c85 <create_tables+0x54>
    2c70:	8d 71 04             	lea    0x4(%ecx),%esi
    2c73:	64 89 01             	mov    %eax,%fs:(%ecx)
    2c76:	8d 50 01             	lea    0x1(%eax),%edx
    2c79:	64 8a 08             	mov    %fs:(%eax),%cl
    2c7c:	89 d0                	mov    %edx,%eax
    2c7e:	84 c9                	test   %cl,%cl
    2c80:	75 f4                	jne    2c76 <create_tables+0x45>
    2c82:	4b                   	dec    %ebx
    2c83:	89 f1                	mov    %esi,%ecx
    2c85:	85 db                	test   %ebx,%ebx
    2c87:	7f e7                	jg     2c70 <create_tables+0x3f>
    2c89:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    2c8d:	85 d2                	test   %edx,%edx
    2c8f:	79 05                	jns    2c96 <create_tables+0x65>
    2c91:	ba 00 00 00 00       	mov    $0x0,%edx
    2c96:	b9 00 00 00 00       	mov    $0x0,%ecx
    2c9b:	64 89 0c 97          	mov    %ecx,%fs:(%edi,%edx,4)
    2c9f:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    2ca3:	89 e9                	mov    %ebp,%ecx
    2ca5:	eb 15                	jmp    2cbc <create_tables+0x8b>
    2ca7:	8d 71 04             	lea    0x4(%ecx),%esi
    2caa:	64 89 01             	mov    %eax,%fs:(%ecx)
    2cad:	8d 50 01             	lea    0x1(%eax),%edx
    2cb0:	64 8a 08             	mov    %fs:(%eax),%cl
    2cb3:	89 d0                	mov    %edx,%eax
    2cb5:	84 c9                	test   %cl,%cl
    2cb7:	75 f4                	jne    2cad <create_tables+0x7c>
    2cb9:	4b                   	dec    %ebx
    2cba:	89 f1                	mov    %esi,%ecx
    2cbc:	85 db                	test   %ebx,%ebx
    2cbe:	7f e7                	jg     2ca7 <create_tables+0x76>
    2cc0:	8b 44 24 20          	mov    0x20(%esp),%eax
    2cc4:	85 c0                	test   %eax,%eax
    2cc6:	79 05                	jns    2ccd <create_tables+0x9c>
    2cc8:	b8 00 00 00 00       	mov    $0x0,%eax
    2ccd:	ba 00 00 00 00       	mov    $0x0,%edx
    2cd2:	64 89 54 85 00       	mov    %edx,%fs:0x0(%ebp,%eax,4)
    2cd7:	8b 04 24             	mov    (%esp),%eax
    2cda:	83 c4 04             	add    $0x4,%esp
    2cdd:	5b                   	pop    %ebx
    2cde:	5e                   	pop    %esi
    2cdf:	5f                   	pop    %edi
    2ce0:	5d                   	pop    %ebp
    2ce1:	c3                   	ret    

00002ce2 <change_ldt>:
    2ce2:	57                   	push   %edi
    2ce3:	56                   	push   %esi
    2ce4:	53                   	push   %ebx
    2ce5:	8b 44 24 10          	mov    0x10(%esp),%eax
    2ce9:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
    2cef:	50                   	push   %eax
    2cf0:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2cf6:	8d 81 d8 02 00 00    	lea    0x2d8(%ecx),%eax
    2cfc:	83 c0 07             	add    $0x7,%eax
    2cff:	8a 30                	mov    (%eax),%dh
    2d01:	83 e8 03             	sub    $0x3,%eax
    2d04:	8a 10                	mov    (%eax),%dl
    2d06:	c1 e2 10             	shl    $0x10,%edx
    2d09:	83 e8 02             	sub    $0x2,%eax
    2d0c:	66 8b 10             	mov    (%eax),%dx
    2d0f:	58                   	pop    %eax
    2d10:	89 d7                	mov    %edx,%edi
    2d12:	66 89 91 da 02 00 00 	mov    %dx,0x2da(%ecx)
    2d19:	c1 ca 10             	ror    $0x10,%edx
    2d1c:	88 91 dc 02 00 00    	mov    %dl,0x2dc(%ecx)
    2d22:	88 b1 df 02 00 00    	mov    %dh,0x2df(%ecx)
    2d28:	c1 ca 10             	ror    $0x10,%edx
    2d2b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    2d31:	8d 53 ff             	lea    -0x1(%ebx),%edx
    2d34:	c1 ea 0c             	shr    $0xc,%edx
    2d37:	66 89 91 d8 02 00 00 	mov    %dx,0x2d8(%ecx)
    2d3e:	c1 ca 10             	ror    $0x10,%edx
    2d41:	8a b1 de 02 00 00    	mov    0x2de(%ecx),%dh
    2d47:	80 e6 f0             	and    $0xf0,%dh
    2d4a:	08 f2                	or     %dh,%dl
    2d4c:	88 91 de 02 00 00    	mov    %dl,0x2de(%ecx)
    2d52:	c1 ca 10             	ror    $0x10,%edx
    2d55:	89 fa                	mov    %edi,%edx
    2d57:	66 89 91 e2 02 00 00 	mov    %dx,0x2e2(%ecx)
    2d5e:	c1 ca 10             	ror    $0x10,%edx
    2d61:	88 91 e4 02 00 00    	mov    %dl,0x2e4(%ecx)
    2d67:	88 b1 e7 02 00 00    	mov    %dh,0x2e7(%ecx)
    2d6d:	c1 ca 10             	ror    $0x10,%edx
    2d70:	ba ff ff 0b 00       	mov    $0xbffff,%edx
    2d75:	66 89 91 e0 02 00 00 	mov    %dx,0x2e0(%ecx)
    2d7c:	c1 ca 10             	ror    $0x10,%edx
    2d7f:	8a b1 e6 02 00 00    	mov    0x2e6(%ecx),%dh
    2d85:	80 e6 f0             	and    $0xf0,%dh
    2d88:	08 f2                	or     %dh,%dl
    2d8a:	88 91 e6 02 00 00    	mov    %dl,0x2e6(%ecx)
    2d90:	c1 ca 10             	ror    $0x10,%edx
    2d93:	6a 17                	push   $0x17
    2d95:	0f a1                	pop    %fs
    2d97:	8d 9f 00 f0 ff bf    	lea    -0x40001000(%edi),%ebx
    2d9d:	8b 44 24 14          	mov    0x14(%esp),%eax
    2da1:	8d 70 7c             	lea    0x7c(%eax),%esi
    2da4:	81 ef 00 10 02 40    	sub    $0x40021000,%edi
    2daa:	8b 06                	mov    (%esi),%eax
    2dac:	85 c0                	test   %eax,%eax
    2dae:	74 0d                	je     2dbd <change_ldt+0xdb>
    2db0:	83 ec 08             	sub    $0x8,%esp
    2db3:	53                   	push   %ebx
    2db4:	50                   	push   %eax
    2db5:	e8 fc ff ff ff       	call   2db6 <change_ldt+0xd4>
    2dba:	83 c4 10             	add    $0x10,%esp
    2dbd:	81 eb 00 10 00 00    	sub    $0x1000,%ebx
    2dc3:	83 ee 04             	sub    $0x4,%esi
    2dc6:	39 fb                	cmp    %edi,%ebx
    2dc8:	75 e0                	jne    2daa <change_ldt+0xc8>
    2dca:	b8 00 00 00 c0       	mov    $0xc0000000,%eax
    2dcf:	5b                   	pop    %ebx
    2dd0:	5e                   	pop    %esi
    2dd1:	5f                   	pop    %edi
    2dd2:	c3                   	ret    

00002dd3 <do_execve>:
    2dd3:	55                   	push   %ebp
    2dd4:	57                   	push   %edi
    2dd5:	56                   	push   %esi
    2dd6:	53                   	push   %ebx
    2dd7:	81 ec dc 04 00 00    	sub    $0x4dc,%esp
    2ddd:	8b 84 24 f0 04 00 00 	mov    0x4f0(%esp),%eax
    2de4:	66 83 78 04 0f       	cmpw   $0xf,0x4(%eax)
    2de9:	74 10                	je     2dfb <do_execve+0x28>
    2deb:	83 ec 0c             	sub    $0xc,%esp
    2dee:	68 d8 01 00 00       	push   $0x1d8
    2df3:	e8 fc ff ff ff       	call   2df4 <do_execve+0x21>
    2df8:	83 c4 10             	add    $0x10,%esp
    2dfb:	8d 9c 24 50 04 00 00 	lea    0x450(%esp),%ebx
    2e02:	8d ac 24 d0 04 00 00 	lea    0x4d0(%esp),%ebp
    2e09:	89 d8                	mov    %ebx,%eax
    2e0b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    2e11:	83 c0 04             	add    $0x4,%eax
    2e14:	39 e8                	cmp    %ebp,%eax
    2e16:	75 f3                	jne    2e0b <do_execve+0x38>
    2e18:	83 ec 0c             	sub    $0xc,%esp
    2e1b:	ff b4 24 04 05 00 00 	pushl  0x504(%esp)
    2e22:	e8 fc ff ff ff       	call   2e23 <do_execve+0x50>
    2e27:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    2e2b:	83 c4 10             	add    $0x10,%esp
    2e2e:	85 c0                	test   %eax,%eax
    2e30:	0f 84 ca 06 00 00    	je     3500 <do_execve+0x72d>
    2e36:	83 bc 24 fc 04 00 00 	cmpl   $0x0,0x4fc(%esp)
    2e3d:	00 
    2e3e:	74 2e                	je     2e6e <do_execve+0x9b>
    2e40:	8b 84 24 fc 04 00 00 	mov    0x4fc(%esp),%eax
    2e47:	83 c0 04             	add    $0x4,%eax
    2e4a:	8b bc 24 fc 04 00 00 	mov    0x4fc(%esp),%edi
    2e51:	64 8b 17             	mov    %fs:(%edi),%edx
    2e54:	85 d2                	test   %edx,%edx
    2e56:	74 20                	je     2e78 <do_execve+0xa5>
    2e58:	ba 00 00 00 00       	mov    $0x0,%edx
    2e5d:	42                   	inc    %edx
    2e5e:	64 8b 08             	mov    %fs:(%eax),%ecx
    2e61:	8d 40 04             	lea    0x4(%eax),%eax
    2e64:	85 c9                	test   %ecx,%ecx
    2e66:	75 f5                	jne    2e5d <do_execve+0x8a>
    2e68:	89 54 24 14          	mov    %edx,0x14(%esp)
    2e6c:	eb 12                	jmp    2e80 <do_execve+0xad>
    2e6e:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2e75:	00 
    2e76:	eb 08                	jmp    2e80 <do_execve+0xad>
    2e78:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2e7f:	00 
    2e80:	83 bc 24 00 05 00 00 	cmpl   $0x0,0x500(%esp)
    2e87:	00 
    2e88:	74 2e                	je     2eb8 <do_execve+0xe5>
    2e8a:	8b 84 24 00 05 00 00 	mov    0x500(%esp),%eax
    2e91:	83 c0 04             	add    $0x4,%eax
    2e94:	8b bc 24 00 05 00 00 	mov    0x500(%esp),%edi
    2e9b:	64 8b 17             	mov    %fs:(%edi),%edx
    2e9e:	85 d2                	test   %edx,%edx
    2ea0:	74 20                	je     2ec2 <do_execve+0xef>
    2ea2:	ba 00 00 00 00       	mov    $0x0,%edx
    2ea7:	42                   	inc    %edx
    2ea8:	64 8b 08             	mov    %fs:(%eax),%ecx
    2eab:	8d 40 04             	lea    0x4(%eax),%eax
    2eae:	85 c9                	test   %ecx,%ecx
    2eb0:	75 f5                	jne    2ea7 <do_execve+0xd4>
    2eb2:	89 54 24 20          	mov    %edx,0x20(%esp)
    2eb6:	eb 12                	jmp    2eca <do_execve+0xf7>
    2eb8:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2ebf:	00 
    2ec0:	eb 08                	jmp    2eca <do_execve+0xf7>
    2ec2:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
    2ec9:	00 
    2eca:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    2ece:	8b 17                	mov    (%edi),%edx
    2ed0:	89 d0                	mov    %edx,%eax
    2ed2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    2ed7:	66 3d 00 80          	cmp    $0x8000,%ax
    2edb:	0f 85 88 05 00 00    	jne    3469 <do_execve+0x696>
    2ee1:	c7 44 24 18 fc ff 01 	movl   $0x1fffc,0x18(%esp)
    2ee8:	00 
    2ee9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2ef0:	00 
    2ef1:	66 8c e0             	mov    %fs,%ax
    2ef4:	66 89 44 24 0c       	mov    %ax,0xc(%esp)
    2ef9:	66 89 44 24 24       	mov    %ax,0x24(%esp)
    2efe:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    2f02:	89 fb                	mov    %edi,%ebx
    2f04:	0f b7 c2             	movzwl %dx,%eax
    2f07:	f6 c6 08             	test   $0x8,%dh
    2f0a:	74 0a                	je     2f16 <do_execve+0x143>
    2f0c:	0f b7 73 02          	movzwl 0x2(%ebx),%esi
    2f10:	89 74 24 28          	mov    %esi,0x28(%esp)
    2f14:	eb 11                	jmp    2f27 <do_execve+0x154>
    2f16:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f1c:	0f b7 b1 42 02 00 00 	movzwl 0x242(%ecx),%esi
    2f23:	89 74 24 28          	mov    %esi,0x28(%esp)
    2f27:	f6 c6 04             	test   $0x4,%dh
    2f2a:	74 0a                	je     2f36 <do_execve+0x163>
    2f2c:	0f b6 7b 0c          	movzbl 0xc(%ebx),%edi
    2f30:	89 7c 24 2c          	mov    %edi,0x2c(%esp)
    2f34:	eb 11                	jmp    2f47 <do_execve+0x174>
    2f36:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f3c:	0f b7 b1 48 02 00 00 	movzwl 0x248(%ecx),%esi
    2f43:	89 74 24 2c          	mov    %esi,0x2c(%esp)
    2f47:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    2f4d:	66 8b b1 42 02 00 00 	mov    0x242(%ecx),%si
    2f54:	66 3b 73 02          	cmp    0x2(%ebx),%si
    2f58:	75 05                	jne    2f5f <do_execve+0x18c>
    2f5a:	c1 f8 06             	sar    $0x6,%eax
    2f5d:	eb 10                	jmp    2f6f <do_execve+0x19c>
    2f5f:	0f b6 7b 0c          	movzbl 0xc(%ebx),%edi
    2f63:	66 39 b9 48 02 00 00 	cmp    %di,0x248(%ecx)
    2f6a:	75 03                	jne    2f6f <do_execve+0x19c>
    2f6c:	c1 f8 03             	sar    $0x3,%eax
    2f6f:	a8 01                	test   $0x1,%al
    2f71:	75 12                	jne    2f85 <do_execve+0x1b2>
    2f73:	f6 c2 49             	test   $0x49,%dl
    2f76:	0f 84 f4 04 00 00    	je     3470 <do_execve+0x69d>
    2f7c:	66 85 f6             	test   %si,%si
    2f7f:	0f 85 fa 04 00 00    	jne    347f <do_execve+0x6ac>
    2f85:	83 ec 08             	sub    $0x8,%esp
    2f88:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    2f8c:	50                   	push   %eax
    2f8d:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    2f91:	50                   	push   %eax
    2f92:	e8 fc ff ff ff       	call   2f93 <do_execve+0x1c0>
    2f97:	89 c2                	mov    %eax,%edx
    2f99:	83 c4 10             	add    $0x10,%esp
    2f9c:	85 c0                	test   %eax,%eax
    2f9e:	0f 84 ea 04 00 00    	je     348e <do_execve+0x6bb>
    2fa4:	8b 00                	mov    (%eax),%eax
    2fa6:	80 38 23             	cmpb   $0x23,(%eax)
    2fa9:	0f 85 24 02 00 00    	jne    31d3 <do_execve+0x400>
    2faf:	80 78 01 21          	cmpb   $0x21,0x1(%eax)
    2fb3:	0f 85 1a 02 00 00    	jne    31d3 <do_execve+0x400>
    2fb9:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    2fbe:	0f 85 0f 02 00 00    	jne    31d3 <do_execve+0x400>
    2fc4:	8d 70 02             	lea    0x2(%eax),%esi
    2fc7:	8d 7c 24 51          	lea    0x51(%esp),%edi
    2fcb:	b9 fe 03 00 00       	mov    $0x3fe,%ecx
    2fd0:	fc                   	cld    
    2fd1:	49                   	dec    %ecx
    2fd2:	78 08                	js     2fdc <do_execve+0x209>
    2fd4:	ac                   	lods   %ds:(%esi),%al
    2fd5:	aa                   	stos   %al,%es:(%edi)
    2fd6:	84 c0                	test   %al,%al
    2fd8:	75 f7                	jne    2fd1 <do_execve+0x1fe>
    2fda:	f3 aa                	rep stos %al,%es:(%edi)
    2fdc:	83 ec 0c             	sub    $0xc,%esp
    2fdf:	52                   	push   %edx
    2fe0:	e8 fc ff ff ff       	call   2fe1 <do_execve+0x20e>
    2fe5:	89 1c 24             	mov    %ebx,(%esp)
    2fe8:	e8 fc ff ff ff       	call   2fe9 <do_execve+0x216>
    2fed:	c6 84 24 5f 04 00 00 	movb   $0x0,0x45f(%esp)
    2ff4:	00 
    2ff5:	b0 0a                	mov    $0xa,%al
    2ff7:	89 fe                	mov    %edi,%esi
    2ff9:	fc                   	cld    
    2ffa:	88 c4                	mov    %al,%ah
    2ffc:	ac                   	lods   %ds:(%esi),%al
    2ffd:	38 e0                	cmp    %ah,%al
    2fff:	74 09                	je     300a <do_execve+0x237>
    3001:	84 c0                	test   %al,%al
    3003:	75 f7                	jne    2ffc <do_execve+0x229>
    3005:	be 01 00 00 00       	mov    $0x1,%esi
    300a:	89 f0                	mov    %esi,%eax
    300c:	48                   	dec    %eax
    300d:	83 c4 10             	add    $0x10,%esp
    3010:	85 c0                	test   %eax,%eax
    3012:	0f 84 83 01 00 00    	je     319b <do_execve+0x3c8>
    3018:	c6 00 00             	movb   $0x0,(%eax)
    301b:	8d 5c 24 51          	lea    0x51(%esp),%ebx
    301f:	eb 01                	jmp    3022 <do_execve+0x24f>
    3021:	43                   	inc    %ebx
    3022:	8a 03                	mov    (%ebx),%al
    3024:	3c 20                	cmp    $0x20,%al
    3026:	74 f9                	je     3021 <do_execve+0x24e>
    3028:	3c 09                	cmp    $0x9,%al
    302a:	74 f5                	je     3021 <do_execve+0x24e>
    302c:	85 db                	test   %ebx,%ebx
    302e:	0f 84 75 01 00 00    	je     31a9 <do_execve+0x3d6>
    3034:	84 c0                	test   %al,%al
    3036:	0f 84 7b 01 00 00    	je     31b7 <do_execve+0x3e4>
    303c:	89 5c 24 48          	mov    %ebx,0x48(%esp)
    3040:	c7 44 24 4c 00 00 00 	movl   $0x0,0x4c(%esp)
    3047:	00 
    3048:	3c 20                	cmp    $0x20,%al
    304a:	0f 84 b7 04 00 00    	je     3507 <do_execve+0x734>
    3050:	3c 09                	cmp    $0x9,%al
    3052:	0f 84 b3 04 00 00    	je     350b <do_execve+0x738>
    3058:	8d 53 01             	lea    0x1(%ebx),%edx
    305b:	3c 2f                	cmp    $0x2f,%al
    305d:	75 04                	jne    3063 <do_execve+0x290>
    305f:	89 54 24 48          	mov    %edx,0x48(%esp)
    3063:	89 d1                	mov    %edx,%ecx
    3065:	8a 02                	mov    (%edx),%al
    3067:	84 c0                	test   %al,%al
    3069:	74 12                	je     307d <do_execve+0x2aa>
    306b:	3c 20                	cmp    $0x20,%al
    306d:	0f 84 9a 04 00 00    	je     350d <do_execve+0x73a>
    3073:	42                   	inc    %edx
    3074:	3c 09                	cmp    $0x9,%al
    3076:	75 e3                	jne    305b <do_execve+0x288>
    3078:	e9 90 04 00 00       	jmp    350d <do_execve+0x73a>
    307d:	83 ec 08             	sub    $0x8,%esp
    3080:	6a 00                	push   $0x0
    3082:	ff 74 24 24          	pushl  0x24(%esp)
    3086:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    308d:	8b 94 24 10 05 00 00 	mov    0x510(%esp),%edx
    3094:	8b 44 24 30          	mov    0x30(%esp),%eax
    3098:	e8 e4 f8 ff ff       	call   2981 <copy_strings>
    309d:	8b b4 24 0c 05 00 00 	mov    0x50c(%esp),%esi
    30a4:	8d 56 04             	lea    0x4(%esi),%edx
    30a7:	8b 7c 24 24          	mov    0x24(%esp),%edi
    30ab:	8d 77 ff             	lea    -0x1(%edi),%esi
    30ae:	83 c4 08             	add    $0x8,%esp
    30b1:	6a 00                	push   $0x0
    30b3:	50                   	push   %eax
    30b4:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30bb:	89 f0                	mov    %esi,%eax
    30bd:	e8 bf f8 ff ff       	call   2981 <copy_strings>
    30c2:	83 c4 08             	add    $0x8,%esp
    30c5:	6a 01                	push   $0x1
    30c7:	50                   	push   %eax
    30c8:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30cf:	8d 94 24 08 05 00 00 	lea    0x508(%esp),%edx
    30d6:	b8 01 00 00 00       	mov    $0x1,%eax
    30db:	e8 a1 f8 ff ff       	call   2981 <copy_strings>
    30e0:	83 c4 10             	add    $0x10,%esp
    30e3:	83 7c 24 4c 00       	cmpl   $0x0,0x4c(%esp)
    30e8:	74 23                	je     310d <do_execve+0x33a>
    30ea:	83 ec 08             	sub    $0x8,%esp
    30ed:	6a 02                	push   $0x2
    30ef:	50                   	push   %eax
    30f0:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    30f7:	8d 54 24 5c          	lea    0x5c(%esp),%edx
    30fb:	b8 01 00 00 00       	mov    $0x1,%eax
    3100:	e8 7c f8 ff ff       	call   2981 <copy_strings>
    3105:	47                   	inc    %edi
    3106:	89 7c 24 24          	mov    %edi,0x24(%esp)
    310a:	83 c4 10             	add    $0x10,%esp
    310d:	83 ec 08             	sub    $0x8,%esp
    3110:	6a 02                	push   $0x2
    3112:	50                   	push   %eax
    3113:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    311a:	8d 54 24 58          	lea    0x58(%esp),%edx
    311e:	b8 01 00 00 00       	mov    $0x1,%eax
    3123:	e8 59 f8 ff ff       	call   2981 <copy_strings>
    3128:	89 44 24 28          	mov    %eax,0x28(%esp)
    312c:	ff 44 24 24          	incl   0x24(%esp)
    3130:	83 c4 10             	add    $0x10,%esp
    3133:	85 c0                	test   %eax,%eax
    3135:	0f 84 8a 00 00 00    	je     31c5 <do_execve+0x3f2>
    313b:	8b 7c 24 24          	mov    0x24(%esp),%edi
    313f:	66 8c d8             	mov    %ds,%ax
    3142:	8e e0                	mov    %eax,%fs
    3144:	83 ec 0c             	sub    $0xc,%esp
    3147:	53                   	push   %ebx
    3148:	e8 fc ff ff ff       	call   3149 <do_execve+0x376>
    314d:	89 c3                	mov    %eax,%ebx
    314f:	83 c4 10             	add    $0x10,%esp
    3152:	85 c0                	test   %eax,%eax
    3154:	75 12                	jne    3168 <do_execve+0x395>
    3156:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    315a:	89 f8                	mov    %edi,%eax
    315c:	8e e0                	mov    %eax,%fs
    315e:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    3163:	e9 6c 03 00 00       	jmp    34d4 <do_execve+0x701>
    3168:	8b 44 24 0c          	mov    0xc(%esp),%eax
    316c:	8e e0                	mov    %eax,%fs
    316e:	8b 13                	mov    (%ebx),%edx
    3170:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    3177:	00 
    3178:	89 d0                	mov    %edx,%eax
    317a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    317f:	66 3d 00 80          	cmp    $0x8000,%ax
    3183:	0f 84 7b fd ff ff    	je     2f04 <do_execve+0x131>
    3189:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    318d:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3191:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3196:	e9 2a 03 00 00       	jmp    34c5 <do_execve+0x6f2>
    319b:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    319f:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    31a4:	e9 2b 03 00 00       	jmp    34d4 <do_execve+0x701>
    31a9:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31ad:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    31b2:	e9 1d 03 00 00       	jmp    34d4 <do_execve+0x701>
    31b7:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31bb:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    31c0:	e9 0f 03 00 00       	jmp    34d4 <do_execve+0x701>
    31c5:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31c9:	be f4 ff ff ff       	mov    $0xfffffff4,%esi
    31ce:	e9 01 03 00 00       	jmp    34d4 <do_execve+0x701>
    31d3:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    31d7:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    31db:	8b 30                	mov    (%eax),%esi
    31dd:	8b 78 04             	mov    0x4(%eax),%edi
    31e0:	89 7c 24 24          	mov    %edi,0x24(%esp)
    31e4:	8b 78 08             	mov    0x8(%eax),%edi
    31e7:	89 7c 24 3c          	mov    %edi,0x3c(%esp)
    31eb:	8b 78 0c             	mov    0xc(%eax),%edi
    31ee:	89 7c 24 38          	mov    %edi,0x38(%esp)
    31f2:	8b 78 10             	mov    0x10(%eax),%edi
    31f5:	89 7c 24 30          	mov    %edi,0x30(%esp)
    31f9:	8b 78 14             	mov    0x14(%eax),%edi
    31fc:	89 7c 24 34          	mov    %edi,0x34(%esp)
    3200:	8b 78 18             	mov    0x18(%eax),%edi
    3203:	8b 40 1c             	mov    0x1c(%eax),%eax
    3206:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    320a:	83 ec 0c             	sub    $0xc,%esp
    320d:	52                   	push   %edx
    320e:	e8 fc ff ff ff       	call   320f <do_execve+0x43c>
    3213:	83 c4 10             	add    $0x10,%esp
    3216:	81 fe 0b 01 00 00    	cmp    $0x10b,%esi
    321c:	0f 85 7b 02 00 00    	jne    349d <do_execve+0x6ca>
    3222:	85 ff                	test   %edi,%edi
    3224:	0f 85 7a 02 00 00    	jne    34a4 <do_execve+0x6d1>
    322a:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
    322f:	0f 85 76 02 00 00    	jne    34ab <do_execve+0x6d8>
    3235:	8b 74 24 3c          	mov    0x3c(%esp),%esi
    3239:	03 74 24 24          	add    0x24(%esp),%esi
    323d:	8b 7c 24 38          	mov    0x38(%esp),%edi
    3241:	01 f7                	add    %esi,%edi
    3243:	81 ff 00 00 00 03    	cmp    $0x3000000,%edi
    3249:	0f 87 63 02 00 00    	ja     34b2 <do_execve+0x6df>
    324f:	8b 44 24 30          	mov    0x30(%esp),%eax
    3253:	8d 84 30 00 04 00 00 	lea    0x400(%eax,%esi,1),%eax
    325a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    325e:	39 41 04             	cmp    %eax,0x4(%ecx)
    3261:	0f 82 52 02 00 00    	jb     34b9 <do_execve+0x6e6>
    3267:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
    326c:	75 4c                	jne    32ba <do_execve+0x4e7>
    326e:	83 ec 08             	sub    $0x8,%esp
    3271:	6a 00                	push   $0x0
    3273:	ff 74 24 24          	pushl  0x24(%esp)
    3277:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    327e:	8b 94 24 10 05 00 00 	mov    0x510(%esp),%edx
    3285:	8b 44 24 30          	mov    0x30(%esp),%eax
    3289:	e8 f3 f6 ff ff       	call   2981 <copy_strings>
    328e:	83 c4 08             	add    $0x8,%esp
    3291:	6a 00                	push   $0x0
    3293:	50                   	push   %eax
    3294:	8d 8c 24 60 04 00 00 	lea    0x460(%esp),%ecx
    329b:	8b 94 24 0c 05 00 00 	mov    0x50c(%esp),%edx
    32a2:	8b 44 24 24          	mov    0x24(%esp),%eax
    32a6:	e8 d6 f6 ff ff       	call   2981 <copy_strings>
    32ab:	89 44 24 28          	mov    %eax,0x28(%esp)
    32af:	83 c4 10             	add    $0x10,%esp
    32b2:	85 c0                	test   %eax,%eax
    32b4:	0f 84 06 02 00 00    	je     34c0 <do_execve+0x6ed>
    32ba:	a1 00 00 00 00       	mov    0x0,%eax
    32bf:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
    32c5:	85 c0                	test   %eax,%eax
    32c7:	74 0c                	je     32d5 <do_execve+0x502>
    32c9:	83 ec 0c             	sub    $0xc,%esp
    32cc:	50                   	push   %eax
    32cd:	e8 fc ff ff ff       	call   32ce <do_execve+0x4fb>
    32d2:	83 c4 10             	add    $0x10,%esp
    32d5:	8b 15 00 00 00 00    	mov    0x0,%edx
    32db:	8b 44 24 0c          	mov    0xc(%esp),%eax
    32df:	89 82 78 02 00 00    	mov    %eax,0x278(%edx)
    32e5:	8d 42 10             	lea    0x10(%edx),%eax
    32e8:	81 c2 10 02 00 00    	add    $0x210,%edx
    32ee:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    32f4:	83 c0 10             	add    $0x10,%eax
    32f7:	39 d0                	cmp    %edx,%eax
    32f9:	75 f3                	jne    32ee <do_execve+0x51b>
    32fb:	bb 00 00 00 00       	mov    $0x0,%ebx
    3300:	a1 00 00 00 00       	mov    0x0,%eax
    3305:	8b 80 7c 02 00 00    	mov    0x27c(%eax),%eax
    330b:	88 d9                	mov    %bl,%cl
    330d:	d3 e8                	shr    %cl,%eax
    330f:	a8 01                	test   $0x1,%al
    3311:	74 0c                	je     331f <do_execve+0x54c>
    3313:	83 ec 0c             	sub    $0xc,%esp
    3316:	53                   	push   %ebx
    3317:	e8 fc ff ff ff       	call   3318 <do_execve+0x545>
    331c:	83 c4 10             	add    $0x10,%esp
    331f:	43                   	inc    %ebx
    3320:	83 fb 14             	cmp    $0x14,%ebx
    3323:	75 db                	jne    3300 <do_execve+0x52d>
    3325:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    332b:	c7 81 7c 02 00 00 00 	movl   $0x0,0x27c(%ecx)
    3332:	00 00 00 
    3335:	bb 0f 00 00 00       	mov    $0xf,%ebx
    333a:	0f 03 db             	lsl    %bx,%ebx
    333d:	43                   	inc    %ebx
    333e:	50                   	push   %eax
    333f:	8d 81 d8 02 00 00    	lea    0x2d8(%ecx),%eax
    3345:	83 c0 07             	add    $0x7,%eax
    3348:	8a 30                	mov    (%eax),%dh
    334a:	83 e8 03             	sub    $0x3,%eax
    334d:	8a 10                	mov    (%eax),%dl
    334f:	c1 e2 10             	shl    $0x10,%edx
    3352:	83 e8 02             	sub    $0x2,%eax
    3355:	66 8b 10             	mov    (%eax),%dx
    3358:	58                   	pop    %eax
    3359:	6a 01                	push   $0x1
    335b:	51                   	push   %ecx
    335c:	53                   	push   %ebx
    335d:	52                   	push   %edx
    335e:	e8 fc ff ff ff       	call   335f <do_execve+0x58c>
    3363:	b9 17 00 00 00       	mov    $0x17,%ecx
    3368:	0f 03 c9             	lsl    %cx,%ecx
    336b:	41                   	inc    %ecx
    336c:	50                   	push   %eax
    336d:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    3373:	8d 83 e0 02 00 00    	lea    0x2e0(%ebx),%eax
    3379:	83 c0 07             	add    $0x7,%eax
    337c:	8a 30                	mov    (%eax),%dh
    337e:	83 e8 03             	sub    $0x3,%eax
    3381:	8a 10                	mov    (%eax),%dl
    3383:	c1 e2 10             	shl    $0x10,%edx
    3386:	83 e8 02             	sub    $0x2,%eax
    3389:	66 8b 10             	mov    (%eax),%dx
    338c:	58                   	pop    %eax
    338d:	6a 01                	push   $0x1
    338f:	53                   	push   %ebx
    3390:	51                   	push   %ecx
    3391:	52                   	push   %edx
    3392:	e8 fc ff ff ff       	call   3393 <do_execve+0x5c0>
    3397:	a1 00 00 00 00       	mov    0x0,%eax
    339c:	83 c4 20             	add    $0x20,%esp
    339f:	39 05 00 00 00 00    	cmp    %eax,0x0
    33a5:	75 0a                	jne    33b1 <do_execve+0x5de>
    33a7:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
    33ae:	00 00 00 
    33b1:	66 c7 80 64 02 00 00 	movw   $0x0,0x264(%eax)
    33b8:	00 00 
    33ba:	83 ec 08             	sub    $0x8,%esp
    33bd:	8d 84 24 58 04 00 00 	lea    0x458(%esp),%eax
    33c4:	50                   	push   %eax
    33c5:	8b 6c 24 30          	mov    0x30(%esp),%ebp
    33c9:	55                   	push   %ebp
    33ca:	e8 fc ff ff ff       	call   33cb <do_execve+0x5f8>
    33cf:	8b 4c 24 28          	mov    0x28(%esp),%ecx
    33d3:	8d 9c 01 00 00 fe ff 	lea    -0x20000(%ecx,%eax,1),%ebx
    33da:	c7 04 24 29 02 00 00 	movl   $0x229,(%esp)
    33e1:	e8 fc ff ff ff       	call   33e2 <do_execve+0x60f>
    33e6:	83 c4 0c             	add    $0xc,%esp
    33e9:	ff 74 24 24          	pushl  0x24(%esp)
    33ed:	ff 74 24 1c          	pushl  0x1c(%esp)
    33f1:	53                   	push   %ebx
    33f2:	e8 fc ff ff ff       	call   33f3 <do_execve+0x620>
    33f7:	8b 15 00 00 00 00    	mov    0x0,%edx
    33fd:	89 aa 1c 02 00 00    	mov    %ebp,0x21c(%edx)
    3403:	89 b2 20 02 00 00    	mov    %esi,0x220(%edx)
    3409:	89 ba 24 02 00 00    	mov    %edi,0x224(%edx)
    340f:	89 c1                	mov    %eax,%ecx
    3411:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
    3417:	89 8a 28 02 00 00    	mov    %ecx,0x228(%edx)
    341d:	8b 7c 24 38          	mov    0x38(%esp),%edi
    3421:	66 89 ba 42 02 00 00 	mov    %di,0x242(%edx)
    3428:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    342c:	66 89 ba 48 02 00 00 	mov    %di,0x248(%edx)
    3433:	89 f2                	mov    %esi,%edx
    3435:	83 c4 10             	add    $0x10,%esp
    3438:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
    343e:	74 0f                	je     344f <do_execve+0x67c>
    3440:	b1 00                	mov    $0x0,%cl
    3442:	42                   	inc    %edx
    3443:	64 88 4a ff          	mov    %cl,%fs:-0x1(%edx)
    3447:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
    344d:	75 f3                	jne    3442 <do_execve+0x66f>
    344f:	8b b4 24 f0 04 00 00 	mov    0x4f0(%esp),%esi
    3456:	8b 7c 24 34          	mov    0x34(%esp),%edi
    345a:	89 3e                	mov    %edi,(%esi)
    345c:	89 46 0c             	mov    %eax,0xc(%esi)
    345f:	b8 00 00 00 00       	mov    $0x0,%eax
    3464:	e9 b1 00 00 00       	jmp    351a <do_execve+0x747>
    3469:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    346e:	eb 55                	jmp    34c5 <do_execve+0x6f2>
    3470:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3474:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3478:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    347d:	eb 46                	jmp    34c5 <do_execve+0x6f2>
    347f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3483:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3487:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    348c:	eb 37                	jmp    34c5 <do_execve+0x6f2>
    348e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3492:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
    3496:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    349b:	eb 28                	jmp    34c5 <do_execve+0x6f2>
    349d:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34a2:	eb 21                	jmp    34c5 <do_execve+0x6f2>
    34a4:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34a9:	eb 1a                	jmp    34c5 <do_execve+0x6f2>
    34ab:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34b0:	eb 13                	jmp    34c5 <do_execve+0x6f2>
    34b2:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34b7:	eb 0c                	jmp    34c5 <do_execve+0x6f2>
    34b9:	be f8 ff ff ff       	mov    $0xfffffff8,%esi
    34be:	eb 05                	jmp    34c5 <do_execve+0x6f2>
    34c0:	be f4 ff ff ff       	mov    $0xfffffff4,%esi
    34c5:	83 ec 0c             	sub    $0xc,%esp
    34c8:	ff 74 24 18          	pushl  0x18(%esp)
    34cc:	e8 fc ff ff ff       	call   34cd <do_execve+0x6fa>
    34d1:	83 c4 10             	add    $0x10,%esp
    34d4:	83 ec 0c             	sub    $0xc,%esp
    34d7:	ff 33                	pushl  (%ebx)
    34d9:	e8 fc ff ff ff       	call   34da <do_execve+0x707>
    34de:	83 c4 10             	add    $0x10,%esp
    34e1:	85 c0                	test   %eax,%eax
    34e3:	75 10                	jne    34f5 <do_execve+0x722>
    34e5:	83 ec 0c             	sub    $0xc,%esp
    34e8:	68 fc 01 00 00       	push   $0x1fc
    34ed:	e8 fc ff ff ff       	call   34ee <do_execve+0x71b>
    34f2:	83 c4 10             	add    $0x10,%esp
    34f5:	83 c3 04             	add    $0x4,%ebx
    34f8:	39 eb                	cmp    %ebp,%ebx
    34fa:	75 d8                	jne    34d4 <do_execve+0x701>
    34fc:	89 f0                	mov    %esi,%eax
    34fe:	eb 1a                	jmp    351a <do_execve+0x747>
    3500:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    3505:	eb 13                	jmp    351a <do_execve+0x747>
    3507:	89 d9                	mov    %ebx,%ecx
    3509:	eb 02                	jmp    350d <do_execve+0x73a>
    350b:	89 d9                	mov    %ebx,%ecx
    350d:	c6 01 00             	movb   $0x0,(%ecx)
    3510:	41                   	inc    %ecx
    3511:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
    3515:	e9 63 fb ff ff       	jmp    307d <do_execve+0x2aa>
    351a:	81 c4 dc 04 00 00    	add    $0x4dc,%esp
    3520:	5b                   	pop    %ebx
    3521:	5e                   	pop    %esi
    3522:	5f                   	pop    %edi
    3523:	5d                   	pop    %ebp
    3524:	c3                   	ret    

00003525 <read_pipe>:
    3525:	55                   	push   %ebp
    3526:	57                   	push   %edi
    3527:	56                   	push   %esi
    3528:	53                   	push   %ebx
    3529:	83 ec 1c             	sub    $0x1c,%esp
    352c:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    3530:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3537:	00 
    3538:	8d 7b 20             	lea    0x20(%ebx),%edi
    353b:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    3540:	0f 8f a6 00 00 00    	jg     35ec <read_pipe+0xc7>
    3546:	e9 be 00 00 00       	jmp    3609 <read_pipe+0xe4>
    354b:	83 ec 0c             	sub    $0xc,%esp
    354e:	57                   	push   %edi
    354f:	e8 fc ff ff ff       	call   3550 <read_pipe+0x2b>
    3554:	83 c4 10             	add    $0x10,%esp
    3557:	66 83 7b 30 02       	cmpw   $0x2,0x30(%ebx)
    355c:	0f 85 b6 00 00 00    	jne    3618 <read_pipe+0xf3>
    3562:	83 ec 0c             	sub    $0xc,%esp
    3565:	57                   	push   %edi
    3566:	e8 fc ff ff ff       	call   3567 <read_pipe+0x42>
    356b:	8b 53 10             	mov    0x10(%ebx),%edx
    356e:	0f b7 c2             	movzwl %dx,%eax
    3571:	0f b7 4b 0e          	movzwl 0xe(%ebx),%ecx
    3575:	29 c1                	sub    %eax,%ecx
    3577:	83 c4 10             	add    $0x10,%esp
    357a:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    3580:	74 c9                	je     354b <read_pipe+0x26>
    3582:	be 00 10 00 00       	mov    $0x1000,%esi
    3587:	29 c6                	sub    %eax,%esi
    3589:	8b 6c 24 38          	mov    0x38(%esp),%ebp
    358d:	39 cd                	cmp    %ecx,%ebp
    358f:	7e 02                	jle    3593 <read_pipe+0x6e>
    3591:	89 cd                	mov    %ecx,%ebp
    3593:	89 f1                	mov    %esi,%ecx
    3595:	39 ee                	cmp    %ebp,%esi
    3597:	7e 02                	jle    359b <read_pipe+0x76>
    3599:	89 e9                	mov    %ebp,%ecx
    359b:	29 4c 24 38          	sub    %ecx,0x38(%esp)
    359f:	01 4c 24 0c          	add    %ecx,0xc(%esp)
    35a3:	01 ca                	add    %ecx,%edx
    35a5:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    35ab:	66 89 53 10          	mov    %dx,0x10(%ebx)
    35af:	85 c9                	test   %ecx,%ecx
    35b1:	7e 30                	jle    35e3 <read_pipe+0xbe>
    35b3:	8b 6b 04             	mov    0x4(%ebx),%ebp
    35b6:	03 4c 24 34          	add    0x34(%esp),%ecx
    35ba:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    35be:	8b 4c 24 34          	mov    0x34(%esp),%ecx
    35c2:	29 c8                	sub    %ecx,%eax
    35c4:	89 c6                	mov    %eax,%esi
    35c6:	8d 41 01             	lea    0x1(%ecx),%eax
    35c9:	8d 14 30             	lea    (%eax,%esi,1),%edx
    35cc:	8a 54 2a ff          	mov    -0x1(%edx,%ebp,1),%dl
    35d0:	64 88 11             	mov    %dl,%fs:(%ecx)
    35d3:	89 c1                	mov    %eax,%ecx
    35d5:	3b 44 24 08          	cmp    0x8(%esp),%eax
    35d9:	75 eb                	jne    35c6 <read_pipe+0xa1>
    35db:	8b 44 24 08          	mov    0x8(%esp),%eax
    35df:	89 44 24 34          	mov    %eax,0x34(%esp)
    35e3:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    35e8:	7f 02                	jg     35ec <read_pipe+0xc7>
    35ea:	eb 1d                	jmp    3609 <read_pipe+0xe4>
    35ec:	8b 53 10             	mov    0x10(%ebx),%edx
    35ef:	0f b7 c2             	movzwl %dx,%eax
    35f2:	0f b7 4b 0e          	movzwl 0xe(%ebx),%ecx
    35f6:	29 c1                	sub    %eax,%ecx
    35f8:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    35fe:	0f 84 47 ff ff ff    	je     354b <read_pipe+0x26>
    3604:	e9 79 ff ff ff       	jmp    3582 <read_pipe+0x5d>
    3609:	83 ec 0c             	sub    $0xc,%esp
    360c:	83 c3 20             	add    $0x20,%ebx
    360f:	53                   	push   %ebx
    3610:	e8 fc ff ff ff       	call   3611 <read_pipe+0xec>
    3615:	83 c4 10             	add    $0x10,%esp
    3618:	8b 44 24 0c          	mov    0xc(%esp),%eax
    361c:	83 c4 1c             	add    $0x1c,%esp
    361f:	5b                   	pop    %ebx
    3620:	5e                   	pop    %esi
    3621:	5f                   	pop    %edi
    3622:	5d                   	pop    %ebp
    3623:	c3                   	ret    

00003624 <write_pipe>:
    3624:	55                   	push   %ebp
    3625:	57                   	push   %edi
    3626:	56                   	push   %esi
    3627:	53                   	push   %ebx
    3628:	83 ec 1c             	sub    $0x1c,%esp
    362b:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    362f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3636:	00 
    3637:	8d 73 20             	lea    0x20(%ebx),%esi
    363a:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    363f:	0f 8f b9 00 00 00    	jg     36fe <write_pipe+0xda>
    3645:	e9 d4 00 00 00       	jmp    371e <write_pipe+0xfa>
    364a:	83 ec 0c             	sub    $0xc,%esp
    364d:	56                   	push   %esi
    364e:	e8 fc ff ff ff       	call   364f <write_pipe+0x2b>
    3653:	83 c4 10             	add    $0x10,%esp
    3656:	66 83 7b 30 02       	cmpw   $0x2,0x30(%ebx)
    365b:	74 1d                	je     367a <write_pipe+0x56>
    365d:	a1 00 00 00 00       	mov    0x0,%eax
    3662:	81 48 0c 00 10 00 00 	orl    $0x1000,0xc(%eax)
    3669:	8b 44 24 0c          	mov    0xc(%esp),%eax
    366d:	85 c0                	test   %eax,%eax
    366f:	0f 84 be 00 00 00    	je     3733 <write_pipe+0x10f>
    3675:	e9 be 00 00 00       	jmp    3738 <write_pipe+0x114>
    367a:	83 ec 0c             	sub    $0xc,%esp
    367d:	56                   	push   %esi
    367e:	e8 fc ff ff ff       	call   367f <write_pipe+0x5b>
    3683:	66 8b 53 0e          	mov    0xe(%ebx),%dx
    3687:	0f b7 ca             	movzwl %dx,%ecx
    368a:	0f b7 43 10          	movzwl 0x10(%ebx),%eax
    368e:	89 cf                	mov    %ecx,%edi
    3690:	29 c7                	sub    %eax,%edi
    3692:	89 f8                	mov    %edi,%eax
    3694:	f7 d0                	not    %eax
    3696:	83 c4 10             	add    $0x10,%esp
    3699:	25 ff 0f 00 00       	and    $0xfff,%eax
    369e:	74 aa                	je     364a <write_pipe+0x26>
    36a0:	bd 00 10 00 00       	mov    $0x1000,%ebp
    36a5:	29 cd                	sub    %ecx,%ebp
    36a7:	8b 7c 24 38          	mov    0x38(%esp),%edi
    36ab:	39 c7                	cmp    %eax,%edi
    36ad:	7e 02                	jle    36b1 <write_pipe+0x8d>
    36af:	89 c7                	mov    %eax,%edi
    36b1:	89 e8                	mov    %ebp,%eax
    36b3:	39 fd                	cmp    %edi,%ebp
    36b5:	7e 02                	jle    36b9 <write_pipe+0x95>
    36b7:	89 f8                	mov    %edi,%eax
    36b9:	29 44 24 38          	sub    %eax,0x38(%esp)
    36bd:	01 44 24 0c          	add    %eax,0xc(%esp)
    36c1:	01 c2                	add    %eax,%edx
    36c3:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
    36c9:	66 89 53 0e          	mov    %dx,0xe(%ebx)
    36cd:	85 c0                	test   %eax,%eax
    36cf:	7e 24                	jle    36f5 <write_pipe+0xd1>
    36d1:	03 44 24 34          	add    0x34(%esp),%eax
    36d5:	89 c7                	mov    %eax,%edi
    36d7:	8b 44 24 34          	mov    0x34(%esp),%eax
    36db:	29 c1                	sub    %eax,%ecx
    36dd:	89 cd                	mov    %ecx,%ebp
    36df:	8d 50 01             	lea    0x1(%eax),%edx
    36e2:	64 8a 08             	mov    %fs:(%eax),%cl
    36e5:	03 43 04             	add    0x4(%ebx),%eax
    36e8:	88 0c 28             	mov    %cl,(%eax,%ebp,1)
    36eb:	89 d0                	mov    %edx,%eax
    36ed:	39 fa                	cmp    %edi,%edx
    36ef:	75 ee                	jne    36df <write_pipe+0xbb>
    36f1:	89 7c 24 34          	mov    %edi,0x34(%esp)
    36f5:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
    36fa:	7f 02                	jg     36fe <write_pipe+0xda>
    36fc:	eb 20                	jmp    371e <write_pipe+0xfa>
    36fe:	66 8b 53 0e          	mov    0xe(%ebx),%dx
    3702:	0f b7 ca             	movzwl %dx,%ecx
    3705:	0f b7 43 10          	movzwl 0x10(%ebx),%eax
    3709:	89 cf                	mov    %ecx,%edi
    370b:	29 c7                	sub    %eax,%edi
    370d:	89 f8                	mov    %edi,%eax
    370f:	f7 d0                	not    %eax
    3711:	25 ff 0f 00 00       	and    $0xfff,%eax
    3716:	0f 84 2e ff ff ff    	je     364a <write_pipe+0x26>
    371c:	eb 82                	jmp    36a0 <write_pipe+0x7c>
    371e:	83 ec 0c             	sub    $0xc,%esp
    3721:	83 c3 20             	add    $0x20,%ebx
    3724:	53                   	push   %ebx
    3725:	e8 fc ff ff ff       	call   3726 <write_pipe+0x102>
    372a:	83 c4 10             	add    $0x10,%esp
    372d:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3731:	eb 05                	jmp    3738 <write_pipe+0x114>
    3733:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3738:	83 c4 1c             	add    $0x1c,%esp
    373b:	5b                   	pop    %ebx
    373c:	5e                   	pop    %esi
    373d:	5f                   	pop    %edi
    373e:	5d                   	pop    %ebp
    373f:	c3                   	ret    

00003740 <sys_pipe>:
    3740:	56                   	push   %esi
    3741:	53                   	push   %ebx
    3742:	83 ec 14             	sub    $0x14,%esp
    3745:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    3749:	b8 00 00 00 00       	mov    $0x0,%eax
    374e:	be 00 04 00 00       	mov    $0x400,%esi
    3753:	ba 00 00 00 00       	mov    $0x0,%edx
    3758:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
    375d:	75 0b                	jne    376a <sys_pipe+0x2a>
    375f:	89 44 94 08          	mov    %eax,0x8(%esp,%edx,4)
    3763:	66 ff 40 04          	incw   0x4(%eax)
    3767:	8d 52 01             	lea    0x1(%edx),%edx
    376a:	83 fa 01             	cmp    $0x1,%edx
    376d:	0f 8f 03 01 00 00    	jg     3876 <sys_pipe+0x136>
    3773:	83 c0 10             	add    $0x10,%eax
    3776:	39 c6                	cmp    %eax,%esi
    3778:	75 de                	jne    3758 <sys_pipe+0x18>
    377a:	e9 e8 00 00 00       	jmp    3867 <sys_pipe+0x127>
    377f:	8b 44 24 08          	mov    0x8(%esp),%eax
    3783:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    3789:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    378e:	e9 27 01 00 00       	jmp    38ba <sys_pipe+0x17a>
    3793:	83 bc 81 80 02 00 00 	cmpl   $0x0,0x280(%ecx,%eax,4)
    379a:	00 
    379b:	75 0f                	jne    37ac <sys_pipe+0x6c>
    379d:	89 04 94             	mov    %eax,(%esp,%edx,4)
    37a0:	8b 74 94 08          	mov    0x8(%esp,%edx,4),%esi
    37a4:	89 b4 81 80 02 00 00 	mov    %esi,0x280(%ecx,%eax,4)
    37ab:	42                   	inc    %edx
    37ac:	40                   	inc    %eax
    37ad:	83 fa 01             	cmp    $0x1,%edx
    37b0:	0f 8f fa 00 00 00    	jg     38b0 <sys_pipe+0x170>
    37b6:	83 f8 14             	cmp    $0x14,%eax
    37b9:	75 d8                	jne    3793 <sys_pipe+0x53>
    37bb:	e9 d4 00 00 00       	jmp    3894 <sys_pipe+0x154>
    37c0:	8b 04 24             	mov    (%esp),%eax
    37c3:	c7 84 81 80 02 00 00 	movl   $0x0,0x280(%ecx,%eax,4)
    37ca:	00 00 00 00 
    37ce:	8b 44 24 0c          	mov    0xc(%esp),%eax
    37d2:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    37d8:	8b 44 24 08          	mov    0x8(%esp),%eax
    37dc:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    37e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    37e7:	e9 ce 00 00 00       	jmp    38ba <sys_pipe+0x17a>
    37ec:	a1 00 00 00 00       	mov    0x0,%eax
    37f1:	8b 54 24 04          	mov    0x4(%esp),%edx
    37f5:	c7 84 90 80 02 00 00 	movl   $0x0,0x280(%eax,%edx,4)
    37fc:	00 00 00 00 
    3800:	8b 14 24             	mov    (%esp),%edx
    3803:	c7 84 90 80 02 00 00 	movl   $0x0,0x280(%eax,%edx,4)
    380a:	00 00 00 00 
    380e:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3812:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    3818:	8b 44 24 08          	mov    0x8(%esp),%eax
    381c:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
    3822:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3827:	e9 8e 00 00 00       	jmp    38ba <sys_pipe+0x17a>
    382c:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3830:	8b 54 24 0c          	mov    0xc(%esp),%edx
    3834:	89 42 08             	mov    %eax,0x8(%edx)
    3837:	89 41 08             	mov    %eax,0x8(%ecx)
    383a:	c7 42 0c 00 00 00 00 	movl   $0x0,0xc(%edx)
    3841:	c7 41 0c 00 00 00 00 	movl   $0x0,0xc(%ecx)
    3848:	66 c7 01 01 00       	movw   $0x1,(%ecx)
    384d:	66 c7 02 02 00       	movw   $0x2,(%edx)
    3852:	8b 04 24             	mov    (%esp),%eax
    3855:	64 89 03             	mov    %eax,%fs:(%ebx)
    3858:	8b 44 24 04          	mov    0x4(%esp),%eax
    385c:	64 89 43 04          	mov    %eax,%fs:0x4(%ebx)
    3860:	b8 00 00 00 00       	mov    $0x0,%eax
    3865:	eb 53                	jmp    38ba <sys_pipe+0x17a>
    3867:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    386c:	83 fa 01             	cmp    $0x1,%edx
    386f:	75 49                	jne    38ba <sys_pipe+0x17a>
    3871:	e9 09 ff ff ff       	jmp    377f <sys_pipe+0x3f>
    3876:	83 fa 01             	cmp    $0x1,%edx
    3879:	0f 84 00 ff ff ff    	je     377f <sys_pipe+0x3f>
    387f:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    3885:	ba 00 00 00 00       	mov    $0x0,%edx
    388a:	b8 00 00 00 00       	mov    $0x0,%eax
    388f:	e9 ff fe ff ff       	jmp    3793 <sys_pipe+0x53>
    3894:	83 fa 01             	cmp    $0x1,%edx
    3897:	0f 84 23 ff ff ff    	je     37c0 <sys_pipe+0x80>
    389d:	e9 2c ff ff ff       	jmp    37ce <sys_pipe+0x8e>
    38a2:	e8 fc ff ff ff       	call   38a3 <sys_pipe+0x163>
    38a7:	85 c0                	test   %eax,%eax
    38a9:	75 81                	jne    382c <sys_pipe+0xec>
    38ab:	e9 3c ff ff ff       	jmp    37ec <sys_pipe+0xac>
    38b0:	83 fa 01             	cmp    $0x1,%edx
    38b3:	75 ed                	jne    38a2 <sys_pipe+0x162>
    38b5:	e9 06 ff ff ff       	jmp    37c0 <sys_pipe+0x80>
    38ba:	83 c4 14             	add    $0x14,%esp
    38bd:	5b                   	pop    %ebx
    38be:	5e                   	pop    %esi
    38bf:	c3                   	ret    

000038c0 <permission>:
    38c0:	56                   	push   %esi
    38c1:	53                   	push   %ebx
    38c2:	0f b7 08             	movzwl (%eax),%ecx
    38c5:	66 83 78 2c 00       	cmpw   $0x0,0x2c(%eax)
    38ca:	74 06                	je     38d2 <permission+0x12>
    38cc:	80 78 0d 00          	cmpb   $0x0,0xd(%eax)
    38d0:	74 3e                	je     3910 <permission+0x50>
    38d2:	8b 35 00 00 00 00    	mov    0x0,%esi
    38d8:	66 8b 9e 42 02 00 00 	mov    0x242(%esi),%bx
    38df:	66 3b 58 02          	cmp    0x2(%eax),%bx
    38e3:	75 05                	jne    38ea <permission+0x2a>
    38e5:	c1 f9 06             	sar    $0x6,%ecx
    38e8:	eb 10                	jmp    38fa <permission+0x3a>
    38ea:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
    38ee:	66 39 86 48 02 00 00 	cmp    %ax,0x248(%esi)
    38f5:	75 03                	jne    38fa <permission+0x3a>
    38f7:	c1 f9 03             	sar    $0x3,%ecx
    38fa:	89 d0                	mov    %edx,%eax
    38fc:	83 e0 07             	and    $0x7,%eax
    38ff:	21 c1                	and    %eax,%ecx
    3901:	39 ca                	cmp    %ecx,%edx
    3903:	74 12                	je     3917 <permission+0x57>
    3905:	66 85 db             	test   %bx,%bx
    3908:	0f 94 c0             	sete   %al
    390b:	0f b6 c0             	movzbl %al,%eax
    390e:	eb 0c                	jmp    391c <permission+0x5c>
    3910:	b8 00 00 00 00       	mov    $0x0,%eax
    3915:	eb 05                	jmp    391c <permission+0x5c>
    3917:	b8 01 00 00 00       	mov    $0x1,%eax
    391c:	5b                   	pop    %ebx
    391d:	5e                   	pop    %esi
    391e:	c3                   	ret    

0000391f <find_entry>:
    391f:	55                   	push   %ebp
    3920:	57                   	push   %edi
    3921:	56                   	push   %esi
    3922:	53                   	push   %ebx
    3923:	83 ec 1c             	sub    $0x1c,%esp
    3926:	89 cb                	mov    %ecx,%ebx
    3928:	83 f9 1e             	cmp    $0x1e,%ecx
    392b:	7e 05                	jle    3932 <find_entry+0x13>
    392d:	bb 1e 00 00 00       	mov    $0x1e,%ebx
    3932:	8b 08                	mov    (%eax),%ecx
    3934:	8b 79 04             	mov    0x4(%ecx),%edi
    3937:	8b 74 24 30          	mov    0x30(%esp),%esi
    393b:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    3941:	85 db                	test   %ebx,%ebx
    3943:	0f 84 7f 01 00 00    	je     3ac8 <find_entry+0x1a9>
    3949:	89 d6                	mov    %edx,%esi
    394b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    394f:	83 fb 02             	cmp    $0x2,%ebx
    3952:	75 67                	jne    39bb <find_entry+0x9c>
    3954:	64 8a 02             	mov    %fs:(%edx),%al
    3957:	3c 2e                	cmp    $0x2e,%al
    3959:	75 60                	jne    39bb <find_entry+0x9c>
    395b:	64 8a 42 01          	mov    %fs:0x1(%edx),%al
    395f:	3c 2e                	cmp    $0x2e,%al
    3961:	75 58                	jne    39bb <find_entry+0x9c>
    3963:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3967:	8b 00                	mov    (%eax),%eax
    3969:	8b 15 00 00 00 00    	mov    0x0,%edx
    396f:	3b 82 74 02 00 00    	cmp    0x274(%edx),%eax
    3975:	74 3f                	je     39b6 <find_entry+0x97>
    3977:	66 83 78 2e 01       	cmpw   $0x1,0x2e(%eax)
    397c:	75 3d                	jne    39bb <find_entry+0x9c>
    397e:	83 ec 0c             	sub    $0xc,%esp
    3981:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3985:	50                   	push   %eax
    3986:	e8 fc ff ff ff       	call   3987 <find_entry+0x68>
    398b:	89 c5                	mov    %eax,%ebp
    398d:	83 c4 10             	add    $0x10,%esp
    3990:	83 78 5c 00          	cmpl   $0x0,0x5c(%eax)
    3994:	74 25                	je     39bb <find_entry+0x9c>
    3996:	83 ec 0c             	sub    $0xc,%esp
    3999:	8b 44 24 18          	mov    0x18(%esp),%eax
    399d:	ff 30                	pushl  (%eax)
    399f:	e8 fc ff ff ff       	call   39a0 <find_entry+0x81>
    39a4:	8b 45 5c             	mov    0x5c(%ebp),%eax
    39a7:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    39ab:	89 01                	mov    %eax,(%ecx)
    39ad:	66 ff 40 30          	incw   0x30(%eax)
    39b1:	83 c4 10             	add    $0x10,%esp
    39b4:	eb 05                	jmp    39bb <find_entry+0x9c>
    39b6:	bb 01 00 00 00       	mov    $0x1,%ebx
    39bb:	8b 44 24 0c          	mov    0xc(%esp),%eax
    39bf:	8b 00                	mov    (%eax),%eax
    39c1:	0f b7 50 0e          	movzwl 0xe(%eax),%edx
    39c5:	85 d2                	test   %edx,%edx
    39c7:	0f 84 02 01 00 00    	je     3acf <find_entry+0x1b0>
    39cd:	83 ec 08             	sub    $0x8,%esp
    39d0:	52                   	push   %edx
    39d1:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    39d5:	50                   	push   %eax
    39d6:	e8 fc ff ff ff       	call   39d7 <find_entry+0xb8>
    39db:	89 c2                	mov    %eax,%edx
    39dd:	83 c4 10             	add    $0x10,%esp
    39e0:	85 c0                	test   %eax,%eax
    39e2:	0f 84 ee 00 00 00    	je     3ad6 <find_entry+0x1b7>
    39e8:	8b 28                	mov    (%eax),%ebp
    39ea:	c1 ef 05             	shr    $0x5,%edi
    39ed:	89 7c 24 08          	mov    %edi,0x8(%esp)
    39f1:	0f 84 be 00 00 00    	je     3ab5 <find_entry+0x196>
    39f7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    39fe:	00 
    39ff:	8b 02                	mov    (%edx),%eax
    3a01:	05 00 04 00 00       	add    $0x400,%eax
    3a06:	39 c5                	cmp    %eax,%ebp
    3a08:	72 55                	jb     3a5f <find_entry+0x140>
    3a0a:	83 ec 0c             	sub    $0xc,%esp
    3a0d:	52                   	push   %edx
    3a0e:	e8 fc ff ff ff       	call   3a0f <find_entry+0xf0>
    3a13:	8b 44 24 14          	mov    0x14(%esp),%eax
    3a17:	89 c7                	mov    %eax,%edi
    3a19:	83 c4 08             	add    $0x8,%esp
    3a1c:	c1 e8 05             	shr    $0x5,%eax
    3a1f:	50                   	push   %eax
    3a20:	8b 44 24 18          	mov    0x18(%esp),%eax
    3a24:	ff 30                	pushl  (%eax)
    3a26:	e8 fc ff ff ff       	call   3a27 <find_entry+0x108>
    3a2b:	83 c4 10             	add    $0x10,%esp
    3a2e:	85 c0                	test   %eax,%eax
    3a30:	74 1d                	je     3a4f <find_entry+0x130>
    3a32:	83 ec 08             	sub    $0x8,%esp
    3a35:	50                   	push   %eax
    3a36:	8b 44 24 18          	mov    0x18(%esp),%eax
    3a3a:	8b 00                	mov    (%eax),%eax
    3a3c:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3a40:	50                   	push   %eax
    3a41:	e8 fc ff ff ff       	call   3a42 <find_entry+0x123>
    3a46:	89 c2                	mov    %eax,%edx
    3a48:	83 c4 10             	add    $0x10,%esp
    3a4b:	85 c0                	test   %eax,%eax
    3a4d:	75 0e                	jne    3a5d <find_entry+0x13e>
    3a4f:	8d 47 20             	lea    0x20(%edi),%eax
    3a52:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a56:	ba 00 00 00 00       	mov    $0x0,%edx
    3a5b:	eb 4a                	jmp    3aa7 <find_entry+0x188>
    3a5d:	8b 28                	mov    (%eax),%ebp
    3a5f:	85 ed                	test   %ebp,%ebp
    3a61:	74 3d                	je     3aa0 <find_entry+0x181>
    3a63:	66 83 7d 00 00       	cmpw   $0x0,0x0(%ebp)
    3a68:	74 36                	je     3aa0 <find_entry+0x181>
    3a6a:	83 fb 1e             	cmp    $0x1e,%ebx
    3a6d:	7f 31                	jg     3aa0 <find_entry+0x181>
    3a6f:	83 fb 1d             	cmp    $0x1d,%ebx
    3a72:	7f 07                	jg     3a7b <find_entry+0x15c>
    3a74:	80 7c 1d 02 00       	cmpb   $0x0,0x2(%ebp,%ebx,1)
    3a79:	75 25                	jne    3aa0 <find_entry+0x181>
    3a7b:	53                   	push   %ebx
    3a7c:	8d 7d 02             	lea    0x2(%ebp),%edi
    3a7f:	b8 00 00 00 00       	mov    $0x0,%eax
    3a84:	89 d9                	mov    %ebx,%ecx
    3a86:	fc                   	cld    
    3a87:	64 f3 a6             	repz cmpsb %es:(%edi),%fs:(%esi)
    3a8a:	0f 94 c0             	sete   %al
    3a8d:	29 cb                	sub    %ecx,%ebx
    3a8f:	29 de                	sub    %ebx,%esi
    3a91:	5b                   	pop    %ebx
    3a92:	85 c0                	test   %eax,%eax
    3a94:	74 0a                	je     3aa0 <find_entry+0x181>
    3a96:	8b 44 24 30          	mov    0x30(%esp),%eax
    3a9a:	89 28                	mov    %ebp,(%eax)
    3a9c:	89 d0                	mov    %edx,%eax
    3a9e:	eb 3b                	jmp    3adb <find_entry+0x1bc>
    3aa0:	83 c5 20             	add    $0x20,%ebp
    3aa3:	ff 44 24 04          	incl   0x4(%esp)
    3aa7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    3aab:	39 4c 24 08          	cmp    %ecx,0x8(%esp)
    3aaf:	0f 8f 4a ff ff ff    	jg     39ff <find_entry+0xe0>
    3ab5:	83 ec 0c             	sub    $0xc,%esp
    3ab8:	52                   	push   %edx
    3ab9:	e8 fc ff ff ff       	call   3aba <find_entry+0x19b>
    3abe:	83 c4 10             	add    $0x10,%esp
    3ac1:	b8 00 00 00 00       	mov    $0x0,%eax
    3ac6:	eb 13                	jmp    3adb <find_entry+0x1bc>
    3ac8:	b8 00 00 00 00       	mov    $0x0,%eax
    3acd:	eb 0c                	jmp    3adb <find_entry+0x1bc>
    3acf:	b8 00 00 00 00       	mov    $0x0,%eax
    3ad4:	eb 05                	jmp    3adb <find_entry+0x1bc>
    3ad6:	b8 00 00 00 00       	mov    $0x0,%eax
    3adb:	83 c4 1c             	add    $0x1c,%esp
    3ade:	5b                   	pop    %ebx
    3adf:	5e                   	pop    %esi
    3ae0:	5f                   	pop    %edi
    3ae1:	5d                   	pop    %ebp
    3ae2:	c3                   	ret    

00003ae3 <dir_namei>:
    3ae3:	55                   	push   %ebp
    3ae4:	57                   	push   %edi
    3ae5:	56                   	push   %esi
    3ae6:	53                   	push   %ebx
    3ae7:	83 ec 4c             	sub    $0x4c,%esp
    3aea:	89 c5                	mov    %eax,%ebp
    3aec:	89 54 24 08          	mov    %edx,0x8(%esp)
    3af0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3af4:	a1 00 00 00 00       	mov    0x0,%eax
    3af9:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
    3aff:	85 c0                	test   %eax,%eax
    3b01:	74 07                	je     3b0a <dir_namei+0x27>
    3b03:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    3b08:	75 2d                	jne    3b37 <dir_namei+0x54>
    3b0a:	8d 7c 24 20          	lea    0x20(%esp),%edi
    3b0e:	b9 08 00 00 00       	mov    $0x8,%ecx
    3b13:	b8 00 00 00 00       	mov    $0x0,%eax
    3b18:	f3 ab                	rep stos %eax,%es:(%edi)
    3b1a:	83 ec 08             	sub    $0x8,%esp
    3b1d:	55                   	push   %ebp
    3b1e:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3b22:	50                   	push   %eax
    3b23:	e8 fc ff ff ff       	call   3b24 <dir_namei+0x41>
    3b28:	c7 04 24 38 02 00 00 	movl   $0x238,(%esp)
    3b2f:	e8 fc ff ff ff       	call   3b30 <dir_namei+0x4d>
    3b34:	83 c4 10             	add    $0x10,%esp
    3b37:	a1 00 00 00 00       	mov    0x0,%eax
    3b3c:	8b 80 70 02 00 00    	mov    0x270(%eax),%eax
    3b42:	85 c0                	test   %eax,%eax
    3b44:	74 07                	je     3b4d <dir_namei+0x6a>
    3b46:	66 83 78 30 00       	cmpw   $0x0,0x30(%eax)
    3b4b:	75 10                	jne    3b5d <dir_namei+0x7a>
    3b4d:	83 ec 0c             	sub    $0xc,%esp
    3b50:	68 46 02 00 00       	push   $0x246
    3b55:	e8 fc ff ff ff       	call   3b56 <dir_namei+0x73>
    3b5a:	83 c4 10             	add    $0x10,%esp
    3b5d:	64 8a 45 00          	mov    %fs:0x0(%ebp),%al
    3b61:	3c 2f                	cmp    $0x2f,%al
    3b63:	75 14                	jne    3b79 <dir_namei+0x96>
    3b65:	a1 00 00 00 00       	mov    0x0,%eax
    3b6a:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
    3b70:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3b74:	8d 75 01             	lea    0x1(%ebp),%esi
    3b77:	eb 19                	jmp    3b92 <dir_namei+0xaf>
    3b79:	84 c0                	test   %al,%al
    3b7b:	0f 84 29 01 00 00    	je     3caa <dir_namei+0x1c7>
    3b81:	a1 00 00 00 00       	mov    0x0,%eax
    3b86:	8b 80 70 02 00 00    	mov    0x270(%eax),%eax
    3b8c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    3b90:	89 ee                	mov    %ebp,%esi
    3b92:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    3b96:	66 ff 40 30          	incw   0x30(%eax)
    3b9a:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    3b9e:	8b 07                	mov    (%edi),%eax
    3ba0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    3ba5:	66 3d 00 40          	cmp    $0x4000,%ax
    3ba9:	75 2f                	jne    3bda <dir_namei+0xf7>
    3bab:	ba 01 00 00 00       	mov    $0x1,%edx
    3bb0:	89 f8                	mov    %edi,%eax
    3bb2:	e8 09 fd ff ff       	call   38c0 <permission>
    3bb7:	85 c0                	test   %eax,%eax
    3bb9:	74 1f                	je     3bda <dir_namei+0xf7>
    3bbb:	8d 46 01             	lea    0x1(%esi),%eax
    3bbe:	64 8a 16             	mov    %fs:(%esi),%dl
    3bc1:	84 d2                	test   %dl,%dl
    3bc3:	0f 84 90 00 00 00    	je     3c59 <dir_namei+0x176>
    3bc9:	80 fa 2f             	cmp    $0x2f,%dl
    3bcc:	75 1d                	jne    3beb <dir_namei+0x108>
    3bce:	89 c3                	mov    %eax,%ebx
    3bd0:	b9 00 00 00 00       	mov    $0x0,%ecx
    3bd5:	e9 ad 00 00 00       	jmp    3c87 <dir_namei+0x1a4>
    3bda:	83 ec 0c             	sub    $0xc,%esp
    3bdd:	57                   	push   %edi
    3bde:	e8 fc ff ff ff       	call   3bdf <dir_namei+0xfc>
    3be3:	83 c4 10             	add    $0x10,%esp
    3be6:	e9 bf 00 00 00       	jmp    3caa <dir_namei+0x1c7>
    3beb:	89 c1                	mov    %eax,%ecx
    3bed:	29 f1                	sub    %esi,%ecx
    3bef:	8d 58 01             	lea    0x1(%eax),%ebx
    3bf2:	64 8a 10             	mov    %fs:(%eax),%dl
    3bf5:	84 d2                	test   %dl,%dl
    3bf7:	74 60                	je     3c59 <dir_namei+0x176>
    3bf9:	89 d8                	mov    %ebx,%eax
    3bfb:	80 fa 2f             	cmp    $0x2f,%dl
    3bfe:	75 eb                	jne    3beb <dir_namei+0x108>
    3c00:	e9 82 00 00 00       	jmp    3c87 <dir_namei+0x1a4>
    3c05:	83 ec 0c             	sub    $0xc,%esp
    3c08:	ff 74 24 28          	pushl  0x28(%esp)
    3c0c:	e8 fc ff ff ff       	call   3c0d <dir_namei+0x12a>
    3c11:	83 c4 10             	add    $0x10,%esp
    3c14:	e9 91 00 00 00       	jmp    3caa <dir_namei+0x1c7>
    3c19:	8b 54 24 20          	mov    0x20(%esp),%edx
    3c1d:	0f b7 3a             	movzwl (%edx),%edi
    3c20:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3c24:	0f b7 72 2c          	movzwl 0x2c(%edx),%esi
    3c28:	83 ec 0c             	sub    $0xc,%esp
    3c2b:	50                   	push   %eax
    3c2c:	e8 fc ff ff ff       	call   3c2d <dir_namei+0x14a>
    3c31:	83 c4 04             	add    $0x4,%esp
    3c34:	ff 74 24 28          	pushl  0x28(%esp)
    3c38:	e8 fc ff ff ff       	call   3c39 <dir_namei+0x156>
    3c3d:	83 c4 08             	add    $0x8,%esp
    3c40:	57                   	push   %edi
    3c41:	56                   	push   %esi
    3c42:	e8 fc ff ff ff       	call   3c43 <dir_namei+0x160>
    3c47:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    3c4b:	83 c4 10             	add    $0x10,%esp
    3c4e:	85 c0                	test   %eax,%eax
    3c50:	74 58                	je     3caa <dir_namei+0x1c7>
    3c52:	89 de                	mov    %ebx,%esi
    3c54:	e9 41 ff ff ff       	jmp    3b9a <dir_namei+0xb7>
    3c59:	85 ff                	test   %edi,%edi
    3c5b:	74 52                	je     3caf <dir_namei+0x1cc>
    3c5d:	89 e9                	mov    %ebp,%ecx
    3c5f:	eb 08                	jmp    3c69 <dir_namei+0x186>
    3c61:	3c 2f                	cmp    $0x2f,%al
    3c63:	75 02                	jne    3c67 <dir_namei+0x184>
    3c65:	89 d1                	mov    %edx,%ecx
    3c67:	89 d5                	mov    %edx,%ebp
    3c69:	8d 55 01             	lea    0x1(%ebp),%edx
    3c6c:	64 8a 45 00          	mov    %fs:0x0(%ebp),%al
    3c70:	84 c0                	test   %al,%al
    3c72:	75 ed                	jne    3c61 <dir_namei+0x17e>
    3c74:	29 ca                	sub    %ecx,%edx
    3c76:	8d 42 ff             	lea    -0x1(%edx),%eax
    3c79:	8b 74 24 08          	mov    0x8(%esp),%esi
    3c7d:	89 06                	mov    %eax,(%esi)
    3c7f:	8b 44 24 0c          	mov    0xc(%esp),%eax
    3c83:	89 08                	mov    %ecx,(%eax)
    3c85:	eb 28                	jmp    3caf <dir_namei+0x1cc>
    3c87:	83 ec 0c             	sub    $0xc,%esp
    3c8a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3c8e:	50                   	push   %eax
    3c8f:	89 f2                	mov    %esi,%edx
    3c91:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    3c95:	e8 85 fc ff ff       	call   391f <find_entry>
    3c9a:	83 c4 10             	add    $0x10,%esp
    3c9d:	85 c0                	test   %eax,%eax
    3c9f:	0f 85 74 ff ff ff    	jne    3c19 <dir_namei+0x136>
    3ca5:	e9 5b ff ff ff       	jmp    3c05 <dir_namei+0x122>
    3caa:	bf 00 00 00 00       	mov    $0x0,%edi
    3caf:	89 f8                	mov    %edi,%eax
    3cb1:	83 c4 4c             	add    $0x4c,%esp
    3cb4:	5b                   	pop    %ebx
    3cb5:	5e                   	pop    %esi
    3cb6:	5f                   	pop    %edi
    3cb7:	5d                   	pop    %ebp
    3cb8:	c3                   	ret    

00003cb9 <add_entry>:
    3cb9:	55                   	push   %ebp
    3cba:	57                   	push   %edi
    3cbb:	56                   	push   %esi
    3cbc:	53                   	push   %ebx
    3cbd:	83 ec 1c             	sub    $0x1c,%esp
    3cc0:	8b 7c 24 30          	mov    0x30(%esp),%edi
    3cc4:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    3cca:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3cce:	83 f9 1e             	cmp    $0x1e,%ecx
    3cd1:	7e 08                	jle    3cdb <add_entry+0x22>
    3cd3:	c7 44 24 08 1e 00 00 	movl   $0x1e,0x8(%esp)
    3cda:	00 
    3cdb:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
    3ce0:	0f 84 19 01 00 00    	je     3dff <add_entry+0x146>
    3ce6:	0f b7 48 0e          	movzwl 0xe(%eax),%ecx
    3cea:	85 c9                	test   %ecx,%ecx
    3cec:	0f 84 14 01 00 00    	je     3e06 <add_entry+0x14d>
    3cf2:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3cf6:	89 c7                	mov    %eax,%edi
    3cf8:	83 ec 08             	sub    $0x8,%esp
    3cfb:	51                   	push   %ecx
    3cfc:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    3d00:	50                   	push   %eax
    3d01:	e8 fc ff ff ff       	call   3d02 <add_entry+0x49>
    3d06:	89 c1                	mov    %eax,%ecx
    3d08:	83 c4 10             	add    $0x10,%esp
    3d0b:	85 c0                	test   %eax,%eax
    3d0d:	0f 84 fa 00 00 00    	je     3e0d <add_entry+0x154>
    3d13:	8b 18                	mov    (%eax),%ebx
    3d15:	be 00 00 00 00       	mov    $0x0,%esi
    3d1a:	8b 01                	mov    (%ecx),%eax
    3d1c:	05 00 04 00 00       	add    $0x400,%eax
    3d21:	39 c3                	cmp    %eax,%ebx
    3d23:	72 41                	jb     3d66 <add_entry+0xad>
    3d25:	83 ec 0c             	sub    $0xc,%esp
    3d28:	51                   	push   %ecx
    3d29:	e8 fc ff ff ff       	call   3d2a <add_entry+0x71>
    3d2e:	83 c4 08             	add    $0x8,%esp
    3d31:	89 f0                	mov    %esi,%eax
    3d33:	c1 e8 05             	shr    $0x5,%eax
    3d36:	50                   	push   %eax
    3d37:	57                   	push   %edi
    3d38:	e8 fc ff ff ff       	call   3d39 <add_entry+0x80>
    3d3d:	83 c4 10             	add    $0x10,%esp
    3d40:	85 c0                	test   %eax,%eax
    3d42:	0f 84 cc 00 00 00    	je     3e14 <add_entry+0x15b>
    3d48:	83 ec 08             	sub    $0x8,%esp
    3d4b:	50                   	push   %eax
    3d4c:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    3d50:	50                   	push   %eax
    3d51:	e8 fc ff ff ff       	call   3d52 <add_entry+0x99>
    3d56:	89 c1                	mov    %eax,%ecx
    3d58:	83 c4 10             	add    $0x10,%esp
    3d5b:	85 c0                	test   %eax,%eax
    3d5d:	75 05                	jne    3d64 <add_entry+0xab>
    3d5f:	8d 76 20             	lea    0x20(%esi),%esi
    3d62:	eb b6                	jmp    3d1a <add_entry+0x61>
    3d64:	8b 18                	mov    (%eax),%ebx
    3d66:	89 f0                	mov    %esi,%eax
    3d68:	c1 e0 05             	shl    $0x5,%eax
    3d6b:	3b 47 04             	cmp    0x4(%edi),%eax
    3d6e:	72 2f                	jb     3d9f <add_entry+0xe6>
    3d70:	66 c7 03 00 00       	movw   $0x0,(%ebx)
    3d75:	83 c0 20             	add    $0x20,%eax
    3d78:	89 47 04             	mov    %eax,0x4(%edi)
    3d7b:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    3d7f:	8b 2d 00 00 00 00    	mov    0x0,%ebp
    3d85:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3d8a:	f7 ed                	imul   %ebp
    3d8c:	89 d0                	mov    %edx,%eax
    3d8e:	c1 f8 05             	sar    $0x5,%eax
    3d91:	c1 fd 1f             	sar    $0x1f,%ebp
    3d94:	29 e8                	sub    %ebp,%eax
    3d96:	03 05 00 00 00 00    	add    0x0,%eax
    3d9c:	89 47 28             	mov    %eax,0x28(%edi)
    3d9f:	66 83 3b 00          	cmpw   $0x0,(%ebx)
    3da3:	75 51                	jne    3df6 <add_entry+0x13d>
    3da5:	8b 35 00 00 00 00    	mov    0x0,%esi
    3dab:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3db0:	f7 ee                	imul   %esi
    3db2:	89 d0                	mov    %edx,%eax
    3db4:	c1 f8 05             	sar    $0x5,%eax
    3db7:	c1 fe 1f             	sar    $0x1f,%esi
    3dba:	29 f0                	sub    %esi,%eax
    3dbc:	03 05 00 00 00 00    	add    0x0,%eax
    3dc2:	89 47 08             	mov    %eax,0x8(%edi)
    3dc5:	b8 00 00 00 00       	mov    $0x0,%eax
    3dca:	8b 74 24 08          	mov    0x8(%esp),%esi
    3dce:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    3dd2:	39 c6                	cmp    %eax,%esi
    3dd4:	7e 06                	jle    3ddc <add_entry+0x123>
    3dd6:	64 8a 14 07          	mov    %fs:(%edi,%eax,1),%dl
    3dda:	eb 02                	jmp    3dde <add_entry+0x125>
    3ddc:	b2 00                	mov    $0x0,%dl
    3dde:	88 54 03 02          	mov    %dl,0x2(%ebx,%eax,1)
    3de2:	40                   	inc    %eax
    3de3:	83 f8 1e             	cmp    $0x1e,%eax
    3de6:	75 ea                	jne    3dd2 <add_entry+0x119>
    3de8:	c6 41 0b 01          	movb   $0x1,0xb(%ecx)
    3dec:	8b 44 24 30          	mov    0x30(%esp),%eax
    3df0:	89 18                	mov    %ebx,(%eax)
    3df2:	89 c8                	mov    %ecx,%eax
    3df4:	eb 23                	jmp    3e19 <add_entry+0x160>
    3df6:	83 c3 20             	add    $0x20,%ebx
    3df9:	46                   	inc    %esi
    3dfa:	e9 1b ff ff ff       	jmp    3d1a <add_entry+0x61>
    3dff:	b8 00 00 00 00       	mov    $0x0,%eax
    3e04:	eb 13                	jmp    3e19 <add_entry+0x160>
    3e06:	b8 00 00 00 00       	mov    $0x0,%eax
    3e0b:	eb 0c                	jmp    3e19 <add_entry+0x160>
    3e0d:	b8 00 00 00 00       	mov    $0x0,%eax
    3e12:	eb 05                	jmp    3e19 <add_entry+0x160>
    3e14:	b8 00 00 00 00       	mov    $0x0,%eax
    3e19:	83 c4 1c             	add    $0x1c,%esp
    3e1c:	5b                   	pop    %ebx
    3e1d:	5e                   	pop    %esi
    3e1e:	5f                   	pop    %edi
    3e1f:	5d                   	pop    %ebp
    3e20:	c3                   	ret    

00003e21 <namei>:
    3e21:	56                   	push   %esi
    3e22:	53                   	push   %ebx
    3e23:	83 ec 14             	sub    $0x14,%esp
    3e26:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    3e2a:	8d 54 24 08          	lea    0x8(%esp),%edx
    3e2e:	8b 44 24 20          	mov    0x20(%esp),%eax
    3e32:	e8 ac fc ff ff       	call   3ae3 <dir_namei>
    3e37:	89 c3                	mov    %eax,%ebx
    3e39:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e3d:	85 c0                	test   %eax,%eax
    3e3f:	0f 84 9c 00 00 00    	je     3ee1 <namei+0xc0>
    3e45:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3e49:	85 c9                	test   %ecx,%ecx
    3e4b:	0f 84 90 00 00 00    	je     3ee1 <namei+0xc0>
    3e51:	83 ec 0c             	sub    $0xc,%esp
    3e54:	8d 44 24 0c          	lea    0xc(%esp),%eax
    3e58:	50                   	push   %eax
    3e59:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3e5d:	8d 44 24 14          	lea    0x14(%esp),%eax
    3e61:	e8 b9 fa ff ff       	call   391f <find_entry>
    3e66:	83 c4 10             	add    $0x10,%esp
    3e69:	85 c0                	test   %eax,%eax
    3e6b:	75 16                	jne    3e83 <namei+0x62>
    3e6d:	83 ec 0c             	sub    $0xc,%esp
    3e70:	ff 74 24 10          	pushl  0x10(%esp)
    3e74:	e8 fc ff ff ff       	call   3e75 <namei+0x54>
    3e79:	83 c4 10             	add    $0x10,%esp
    3e7c:	bb 00 00 00 00       	mov    $0x0,%ebx
    3e81:	eb 5e                	jmp    3ee1 <namei+0xc0>
    3e83:	8b 14 24             	mov    (%esp),%edx
    3e86:	0f b7 32             	movzwl (%edx),%esi
    3e89:	8b 54 24 04          	mov    0x4(%esp),%edx
    3e8d:	0f b7 5a 2c          	movzwl 0x2c(%edx),%ebx
    3e91:	83 ec 0c             	sub    $0xc,%esp
    3e94:	50                   	push   %eax
    3e95:	e8 fc ff ff ff       	call   3e96 <namei+0x75>
    3e9a:	83 c4 04             	add    $0x4,%esp
    3e9d:	ff 74 24 10          	pushl  0x10(%esp)
    3ea1:	e8 fc ff ff ff       	call   3ea2 <namei+0x81>
    3ea6:	83 c4 08             	add    $0x8,%esp
    3ea9:	56                   	push   %esi
    3eaa:	53                   	push   %ebx
    3eab:	e8 fc ff ff ff       	call   3eac <namei+0x8b>
    3eb0:	89 c3                	mov    %eax,%ebx
    3eb2:	89 44 24 14          	mov    %eax,0x14(%esp)
    3eb6:	83 c4 10             	add    $0x10,%esp
    3eb9:	85 c0                	test   %eax,%eax
    3ebb:	74 24                	je     3ee1 <namei+0xc0>
    3ebd:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    3ec3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    3ec8:	f7 e9                	imul   %ecx
    3eca:	89 d0                	mov    %edx,%eax
    3ecc:	c1 f8 05             	sar    $0x5,%eax
    3ecf:	c1 f9 1f             	sar    $0x1f,%ecx
    3ed2:	29 c8                	sub    %ecx,%eax
    3ed4:	03 05 00 00 00 00    	add    0x0,%eax
    3eda:	89 43 24             	mov    %eax,0x24(%ebx)
    3edd:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    3ee1:	89 d8                	mov    %ebx,%eax
    3ee3:	83 c4 14             	add    $0x14,%esp
    3ee6:	5b                   	pop    %ebx
    3ee7:	5e                   	pop    %esi
    3ee8:	c3                   	ret    

00003ee9 <open_namei>:
    3ee9:	55                   	push   %ebp
    3eea:	57                   	push   %edi
    3eeb:	56                   	push   %esi
    3eec:	53                   	push   %ebx
    3eed:	83 ec 1c             	sub    $0x1c,%esp
    3ef0:	8b 5c 24 34          	mov    0x34(%esp),%ebx
    3ef4:	89 d8                	mov    %ebx,%eax
    3ef6:	25 03 02 00 00       	and    $0x203,%eax
    3efb:	3d 00 02 00 00       	cmp    $0x200,%eax
    3f00:	75 03                	jne    3f05 <open_namei+0x1c>
    3f02:	83 cb 01             	or     $0x1,%ebx
    3f05:	a1 00 00 00 00       	mov    0x0,%eax
    3f0a:	8b b0 6c 02 00 00    	mov    0x26c(%eax),%esi
    3f10:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    3f14:	8d 54 24 08          	lea    0x8(%esp),%edx
    3f18:	8b 44 24 30          	mov    0x30(%esp),%eax
    3f1c:	e8 c2 fb ff ff       	call   3ae3 <dir_namei>
    3f21:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f25:	85 c0                	test   %eax,%eax
    3f27:	0f 84 2e 02 00 00    	je     415b <open_namei+0x272>
    3f2d:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    3f31:	85 c9                	test   %ecx,%ecx
    3f33:	75 2b                	jne    3f60 <open_namei+0x77>
    3f35:	89 de                	mov    %ebx,%esi
    3f37:	81 e6 43 02 00 00    	and    $0x243,%esi
    3f3d:	75 0b                	jne    3f4a <open_namei+0x61>
    3f3f:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
    3f43:	89 07                	mov    %eax,(%edi)
    3f45:	e9 24 02 00 00       	jmp    416e <open_namei+0x285>
    3f4a:	83 ec 0c             	sub    $0xc,%esp
    3f4d:	50                   	push   %eax
    3f4e:	e8 fc ff ff ff       	call   3f4f <open_namei+0x66>
    3f53:	83 c4 10             	add    $0x10,%esp
    3f56:	be eb ff ff ff       	mov    $0xffffffeb,%esi
    3f5b:	e9 0e 02 00 00       	jmp    416e <open_namei+0x285>
    3f60:	83 ec 0c             	sub    $0xc,%esp
    3f63:	8d 44 24 0c          	lea    0xc(%esp),%eax
    3f67:	50                   	push   %eax
    3f68:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    3f6c:	8d 44 24 14          	lea    0x14(%esp),%eax
    3f70:	e8 aa f9 ff ff       	call   391f <find_entry>
    3f75:	83 c4 10             	add    $0x10,%esp
    3f78:	85 c0                	test   %eax,%eax
    3f7a:	0f 85 1b 01 00 00    	jne    409b <open_namei+0x1b2>
    3f80:	f6 c3 40             	test   $0x40,%bl
    3f83:	75 19                	jne    3f9e <open_namei+0xb5>
    3f85:	83 ec 0c             	sub    $0xc,%esp
    3f88:	ff 74 24 10          	pushl  0x10(%esp)
    3f8c:	e8 fc ff ff ff       	call   3f8d <open_namei+0xa4>
    3f91:	83 c4 10             	add    $0x10,%esp
    3f94:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    3f99:	e9 d0 01 00 00       	jmp    416e <open_namei+0x285>
    3f9e:	8b 5c 24 04          	mov    0x4(%esp),%ebx
    3fa2:	ba 02 00 00 00       	mov    $0x2,%edx
    3fa7:	89 d8                	mov    %ebx,%eax
    3fa9:	e8 12 f9 ff ff       	call   38c0 <permission>
    3fae:	85 c0                	test   %eax,%eax
    3fb0:	75 16                	jne    3fc8 <open_namei+0xdf>
    3fb2:	83 ec 0c             	sub    $0xc,%esp
    3fb5:	53                   	push   %ebx
    3fb6:	e8 fc ff ff ff       	call   3fb7 <open_namei+0xce>
    3fbb:	83 c4 10             	add    $0x10,%esp
    3fbe:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    3fc3:	e9 a6 01 00 00       	jmp    416e <open_namei+0x285>
    3fc8:	83 ec 0c             	sub    $0xc,%esp
    3fcb:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    3fcf:	50                   	push   %eax
    3fd0:	e8 fc ff ff ff       	call   3fd1 <open_namei+0xe8>
    3fd5:	89 c3                	mov    %eax,%ebx
    3fd7:	83 c4 10             	add    $0x10,%esp
    3fda:	85 c0                	test   %eax,%eax
    3fdc:	75 19                	jne    3ff7 <open_namei+0x10e>
    3fde:	83 ec 0c             	sub    $0xc,%esp
    3fe1:	ff 74 24 10          	pushl  0x10(%esp)
    3fe5:	e8 fc ff ff ff       	call   3fe6 <open_namei+0xfd>
    3fea:	83 c4 10             	add    $0x10,%esp
    3fed:	be e4 ff ff ff       	mov    $0xffffffe4,%esi
    3ff2:	e9 77 01 00 00       	jmp    416e <open_namei+0x285>
    3ff7:	a1 00 00 00 00       	mov    0x0,%eax
    3ffc:	66 8b 80 42 02 00 00 	mov    0x242(%eax),%ax
    4003:	66 89 43 02          	mov    %ax,0x2(%ebx)
    4007:	f7 d6                	not    %esi
    4009:	81 e6 ff 01 00 00    	and    $0x1ff,%esi
    400f:	23 74 24 38          	and    0x38(%esp),%esi
    4013:	81 ce 00 80 00 00    	or     $0x8000,%esi
    4019:	66 89 33             	mov    %si,(%ebx)
    401c:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4020:	83 ec 0c             	sub    $0xc,%esp
    4023:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4027:	50                   	push   %eax
    4028:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    402c:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4030:	8b 44 24 14          	mov    0x14(%esp),%eax
    4034:	e8 80 fc ff ff       	call   3cb9 <add_entry>
    4039:	83 c4 10             	add    $0x10,%esp
    403c:	85 c0                	test   %eax,%eax
    403e:	75 25                	jne    4065 <open_namei+0x17c>
    4040:	fe 4b 0d             	decb   0xd(%ebx)
    4043:	83 ec 0c             	sub    $0xc,%esp
    4046:	53                   	push   %ebx
    4047:	e8 fc ff ff ff       	call   4048 <open_namei+0x15f>
    404c:	83 c4 04             	add    $0x4,%esp
    404f:	ff 74 24 10          	pushl  0x10(%esp)
    4053:	e8 fc ff ff ff       	call   4054 <open_namei+0x16b>
    4058:	83 c4 10             	add    $0x10,%esp
    405b:	be e4 ff ff ff       	mov    $0xffffffe4,%esi
    4060:	e9 09 01 00 00       	jmp    416e <open_namei+0x285>
    4065:	66 8b 4b 2e          	mov    0x2e(%ebx),%cx
    4069:	8b 14 24             	mov    (%esp),%edx
    406c:	66 89 0a             	mov    %cx,(%edx)
    406f:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4073:	83 ec 0c             	sub    $0xc,%esp
    4076:	50                   	push   %eax
    4077:	e8 fc ff ff ff       	call   4078 <open_namei+0x18f>
    407c:	83 c4 04             	add    $0x4,%esp
    407f:	ff 74 24 10          	pushl  0x10(%esp)
    4083:	e8 fc ff ff ff       	call   4084 <open_namei+0x19b>
    4088:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    408c:	89 18                	mov    %ebx,(%eax)
    408e:	83 c4 10             	add    $0x10,%esp
    4091:	be 00 00 00 00       	mov    $0x0,%esi
    4096:	e9 d3 00 00 00       	jmp    416e <open_namei+0x285>
    409b:	8b 14 24             	mov    (%esp),%edx
    409e:	0f b7 2a             	movzwl (%edx),%ebp
    40a1:	8b 54 24 04          	mov    0x4(%esp),%edx
    40a5:	0f b7 7a 2c          	movzwl 0x2c(%edx),%edi
    40a9:	83 ec 0c             	sub    $0xc,%esp
    40ac:	50                   	push   %eax
    40ad:	e8 fc ff ff ff       	call   40ae <open_namei+0x1c5>
    40b2:	83 c4 04             	add    $0x4,%esp
    40b5:	ff 74 24 10          	pushl  0x10(%esp)
    40b9:	e8 fc ff ff ff       	call   40ba <open_namei+0x1d1>
    40be:	83 c4 10             	add    $0x10,%esp
    40c1:	89 de                	mov    %ebx,%esi
    40c3:	81 e6 80 00 00 00    	and    $0x80,%esi
    40c9:	0f 85 93 00 00 00    	jne    4162 <open_namei+0x279>
    40cf:	83 ec 08             	sub    $0x8,%esp
    40d2:	55                   	push   %ebp
    40d3:	57                   	push   %edi
    40d4:	e8 fc ff ff ff       	call   40d5 <open_namei+0x1ec>
    40d9:	89 c7                	mov    %eax,%edi
    40db:	83 c4 10             	add    $0x10,%esp
    40de:	85 c0                	test   %eax,%eax
    40e0:	0f 84 83 00 00 00    	je     4169 <open_namei+0x280>
    40e6:	8b 00                	mov    (%eax),%eax
    40e8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    40ed:	66 3d 00 40          	cmp    $0x4000,%ax
    40f1:	75 05                	jne    40f8 <open_namei+0x20f>
    40f3:	f6 c3 03             	test   $0x3,%bl
    40f6:	75 17                	jne    410f <open_namei+0x226>
    40f8:	89 d8                	mov    %ebx,%eax
    40fa:	83 e0 03             	and    $0x3,%eax
    40fd:	0f be 90 53 02 00 00 	movsbl 0x253(%eax),%edx
    4104:	89 f8                	mov    %edi,%eax
    4106:	e8 b5 f7 ff ff       	call   38c0 <permission>
    410b:	85 c0                	test   %eax,%eax
    410d:	75 13                	jne    4122 <open_namei+0x239>
    410f:	83 ec 0c             	sub    $0xc,%esp
    4112:	57                   	push   %edi
    4113:	e8 fc ff ff ff       	call   4114 <open_namei+0x22b>
    4118:	83 c4 10             	add    $0x10,%esp
    411b:	be ff ff ff ff       	mov    $0xffffffff,%esi
    4120:	eb 4c                	jmp    416e <open_namei+0x285>
    4122:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4128:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    412d:	f7 e9                	imul   %ecx
    412f:	89 d0                	mov    %edx,%eax
    4131:	c1 f8 05             	sar    $0x5,%eax
    4134:	c1 f9 1f             	sar    $0x1f,%ecx
    4137:	29 c8                	sub    %ecx,%eax
    4139:	03 05 00 00 00 00    	add    0x0,%eax
    413f:	89 47 24             	mov    %eax,0x24(%edi)
    4142:	f6 c7 02             	test   $0x2,%bh
    4145:	74 0c                	je     4153 <open_namei+0x26a>
    4147:	83 ec 0c             	sub    $0xc,%esp
    414a:	57                   	push   %edi
    414b:	e8 fc ff ff ff       	call   414c <open_namei+0x263>
    4150:	83 c4 10             	add    $0x10,%esp
    4153:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    4157:	89 38                	mov    %edi,(%eax)
    4159:	eb 13                	jmp    416e <open_namei+0x285>
    415b:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    4160:	eb 0c                	jmp    416e <open_namei+0x285>
    4162:	be ef ff ff ff       	mov    $0xffffffef,%esi
    4167:	eb 05                	jmp    416e <open_namei+0x285>
    4169:	be f3 ff ff ff       	mov    $0xfffffff3,%esi
    416e:	89 f0                	mov    %esi,%eax
    4170:	83 c4 1c             	add    $0x1c,%esp
    4173:	5b                   	pop    %ebx
    4174:	5e                   	pop    %esi
    4175:	5f                   	pop    %edi
    4176:	5d                   	pop    %ebp
    4177:	c3                   	ret    

00004178 <sys_mknod>:
    4178:	57                   	push   %edi
    4179:	56                   	push   %esi
    417a:	53                   	push   %ebx
    417b:	83 ec 10             	sub    $0x10,%esp
    417e:	8b 74 24 24          	mov    0x24(%esp),%esi
    4182:	a1 00 00 00 00       	mov    0x0,%eax
    4187:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    418e:	00 
    418f:	0f 85 8c 01 00 00    	jne    4321 <sys_mknod+0x1a9>
    4195:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    4199:	8d 54 24 08          	lea    0x8(%esp),%edx
    419d:	8b 44 24 20          	mov    0x20(%esp),%eax
    41a1:	e8 3d f9 ff ff       	call   3ae3 <dir_namei>
    41a6:	89 c3                	mov    %eax,%ebx
    41a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    41ac:	85 c0                	test   %eax,%eax
    41ae:	0f 84 74 01 00 00    	je     4328 <sys_mknod+0x1b0>
    41b4:	8b 7c 24 08          	mov    0x8(%esp),%edi
    41b8:	85 ff                	test   %edi,%edi
    41ba:	75 16                	jne    41d2 <sys_mknod+0x5a>
    41bc:	83 ec 0c             	sub    $0xc,%esp
    41bf:	50                   	push   %eax
    41c0:	e8 fc ff ff ff       	call   41c1 <sys_mknod+0x49>
    41c5:	83 c4 10             	add    $0x10,%esp
    41c8:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    41cd:	e9 5b 01 00 00       	jmp    432d <sys_mknod+0x1b5>
    41d2:	ba 02 00 00 00       	mov    $0x2,%edx
    41d7:	e8 e4 f6 ff ff       	call   38c0 <permission>
    41dc:	85 c0                	test   %eax,%eax
    41de:	75 16                	jne    41f6 <sys_mknod+0x7e>
    41e0:	83 ec 0c             	sub    $0xc,%esp
    41e3:	53                   	push   %ebx
    41e4:	e8 fc ff ff ff       	call   41e5 <sys_mknod+0x6d>
    41e9:	83 c4 10             	add    $0x10,%esp
    41ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    41f1:	e9 37 01 00 00       	jmp    432d <sys_mknod+0x1b5>
    41f6:	83 ec 0c             	sub    $0xc,%esp
    41f9:	8d 44 24 0c          	lea    0xc(%esp),%eax
    41fd:	50                   	push   %eax
    41fe:	89 f9                	mov    %edi,%ecx
    4200:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4204:	8d 44 24 14          	lea    0x14(%esp),%eax
    4208:	e8 12 f7 ff ff       	call   391f <find_entry>
    420d:	83 c4 10             	add    $0x10,%esp
    4210:	85 c0                	test   %eax,%eax
    4212:	74 22                	je     4236 <sys_mknod+0xbe>
    4214:	83 ec 0c             	sub    $0xc,%esp
    4217:	50                   	push   %eax
    4218:	e8 fc ff ff ff       	call   4219 <sys_mknod+0xa1>
    421d:	83 c4 04             	add    $0x4,%esp
    4220:	ff 74 24 10          	pushl  0x10(%esp)
    4224:	e8 fc ff ff ff       	call   4225 <sys_mknod+0xad>
    4229:	83 c4 10             	add    $0x10,%esp
    422c:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    4231:	e9 f7 00 00 00       	jmp    432d <sys_mknod+0x1b5>
    4236:	83 ec 0c             	sub    $0xc,%esp
    4239:	8b 44 24 10          	mov    0x10(%esp),%eax
    423d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    4241:	50                   	push   %eax
    4242:	e8 fc ff ff ff       	call   4243 <sys_mknod+0xcb>
    4247:	89 c3                	mov    %eax,%ebx
    4249:	83 c4 10             	add    $0x10,%esp
    424c:	85 c0                	test   %eax,%eax
    424e:	75 19                	jne    4269 <sys_mknod+0xf1>
    4250:	83 ec 0c             	sub    $0xc,%esp
    4253:	ff 74 24 10          	pushl  0x10(%esp)
    4257:	e8 fc ff ff ff       	call   4258 <sys_mknod+0xe0>
    425c:	83 c4 10             	add    $0x10,%esp
    425f:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4264:	e9 c4 00 00 00       	jmp    432d <sys_mknod+0x1b5>
    4269:	66 89 30             	mov    %si,(%eax)
    426c:	81 e6 00 b0 00 00    	and    $0xb000,%esi
    4272:	81 fe 00 20 00 00    	cmp    $0x2000,%esi
    4278:	75 08                	jne    4282 <sys_mknod+0x10a>
    427a:	8b 44 24 28          	mov    0x28(%esp),%eax
    427e:	66 89 43 0e          	mov    %ax,0xe(%ebx)
    4282:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4288:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    428d:	f7 e9                	imul   %ecx
    428f:	89 d0                	mov    %edx,%eax
    4291:	c1 f8 05             	sar    $0x5,%eax
    4294:	c1 f9 1f             	sar    $0x1f,%ecx
    4297:	29 c8                	sub    %ecx,%eax
    4299:	03 05 00 00 00 00    	add    0x0,%eax
    429f:	89 43 24             	mov    %eax,0x24(%ebx)
    42a2:	89 43 08             	mov    %eax,0x8(%ebx)
    42a5:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    42a9:	83 ec 0c             	sub    $0xc,%esp
    42ac:	8d 44 24 0c          	lea    0xc(%esp),%eax
    42b0:	50                   	push   %eax
    42b1:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    42b5:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    42b9:	8b 44 24 14          	mov    0x14(%esp),%eax
    42bd:	e8 f7 f9 ff ff       	call   3cb9 <add_entry>
    42c2:	89 c6                	mov    %eax,%esi
    42c4:	83 c4 10             	add    $0x10,%esp
    42c7:	85 c0                	test   %eax,%eax
    42c9:	75 22                	jne    42ed <sys_mknod+0x175>
    42cb:	83 ec 0c             	sub    $0xc,%esp
    42ce:	ff 74 24 10          	pushl  0x10(%esp)
    42d2:	e8 fc ff ff ff       	call   42d3 <sys_mknod+0x15b>
    42d7:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    42db:	89 1c 24             	mov    %ebx,(%esp)
    42de:	e8 fc ff ff ff       	call   42df <sys_mknod+0x167>
    42e3:	83 c4 10             	add    $0x10,%esp
    42e6:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    42eb:	eb 40                	jmp    432d <sys_mknod+0x1b5>
    42ed:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    42f1:	8b 04 24             	mov    (%esp),%eax
    42f4:	66 89 10             	mov    %dx,(%eax)
    42f7:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    42fb:	83 ec 0c             	sub    $0xc,%esp
    42fe:	ff 74 24 10          	pushl  0x10(%esp)
    4302:	e8 fc ff ff ff       	call   4303 <sys_mknod+0x18b>
    4307:	89 1c 24             	mov    %ebx,(%esp)
    430a:	e8 fc ff ff ff       	call   430b <sys_mknod+0x193>
    430f:	89 34 24             	mov    %esi,(%esp)
    4312:	e8 fc ff ff ff       	call   4313 <sys_mknod+0x19b>
    4317:	83 c4 10             	add    $0x10,%esp
    431a:	b8 00 00 00 00       	mov    $0x0,%eax
    431f:	eb 0c                	jmp    432d <sys_mknod+0x1b5>
    4321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4326:	eb 05                	jmp    432d <sys_mknod+0x1b5>
    4328:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    432d:	83 c4 10             	add    $0x10,%esp
    4330:	5b                   	pop    %ebx
    4331:	5e                   	pop    %esi
    4332:	5f                   	pop    %edi
    4333:	c3                   	ret    

00004334 <sys_mkdir>:
    4334:	a1 00 00 00 00       	mov    0x0,%eax
    4339:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    4340:	00 
    4341:	0f 85 9b 02 00 00    	jne    45e2 <sys_mkdir+0x2ae>
    4347:	57                   	push   %edi
    4348:	56                   	push   %esi
    4349:	53                   	push   %ebx
    434a:	83 ec 10             	sub    $0x10,%esp
    434d:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    4351:	8d 54 24 08          	lea    0x8(%esp),%edx
    4355:	8b 44 24 20          	mov    0x20(%esp),%eax
    4359:	e8 85 f7 ff ff       	call   3ae3 <dir_namei>
    435e:	89 c3                	mov    %eax,%ebx
    4360:	89 44 24 04          	mov    %eax,0x4(%esp)
    4364:	85 c0                	test   %eax,%eax
    4366:	0f 84 7c 02 00 00    	je     45e8 <sys_mkdir+0x2b4>
    436c:	8b 74 24 08          	mov    0x8(%esp),%esi
    4370:	85 f6                	test   %esi,%esi
    4372:	75 16                	jne    438a <sys_mkdir+0x56>
    4374:	83 ec 0c             	sub    $0xc,%esp
    4377:	50                   	push   %eax
    4378:	e8 fc ff ff ff       	call   4379 <sys_mkdir+0x45>
    437d:	83 c4 10             	add    $0x10,%esp
    4380:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4385:	e9 63 02 00 00       	jmp    45ed <sys_mkdir+0x2b9>
    438a:	ba 02 00 00 00       	mov    $0x2,%edx
    438f:	e8 2c f5 ff ff       	call   38c0 <permission>
    4394:	85 c0                	test   %eax,%eax
    4396:	75 16                	jne    43ae <sys_mkdir+0x7a>
    4398:	83 ec 0c             	sub    $0xc,%esp
    439b:	53                   	push   %ebx
    439c:	e8 fc ff ff ff       	call   439d <sys_mkdir+0x69>
    43a1:	83 c4 10             	add    $0x10,%esp
    43a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    43a9:	e9 3f 02 00 00       	jmp    45ed <sys_mkdir+0x2b9>
    43ae:	83 ec 0c             	sub    $0xc,%esp
    43b1:	8d 44 24 0c          	lea    0xc(%esp),%eax
    43b5:	50                   	push   %eax
    43b6:	89 f1                	mov    %esi,%ecx
    43b8:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    43bc:	8d 44 24 14          	lea    0x14(%esp),%eax
    43c0:	e8 5a f5 ff ff       	call   391f <find_entry>
    43c5:	83 c4 10             	add    $0x10,%esp
    43c8:	85 c0                	test   %eax,%eax
    43ca:	74 22                	je     43ee <sys_mkdir+0xba>
    43cc:	83 ec 0c             	sub    $0xc,%esp
    43cf:	50                   	push   %eax
    43d0:	e8 fc ff ff ff       	call   43d1 <sys_mkdir+0x9d>
    43d5:	83 c4 04             	add    $0x4,%esp
    43d8:	ff 74 24 10          	pushl  0x10(%esp)
    43dc:	e8 fc ff ff ff       	call   43dd <sys_mkdir+0xa9>
    43e1:	83 c4 10             	add    $0x10,%esp
    43e4:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    43e9:	e9 ff 01 00 00       	jmp    45ed <sys_mkdir+0x2b9>
    43ee:	83 ec 0c             	sub    $0xc,%esp
    43f1:	8b 44 24 10          	mov    0x10(%esp),%eax
    43f5:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    43f9:	50                   	push   %eax
    43fa:	e8 fc ff ff ff       	call   43fb <sys_mkdir+0xc7>
    43ff:	89 c3                	mov    %eax,%ebx
    4401:	83 c4 10             	add    $0x10,%esp
    4404:	85 c0                	test   %eax,%eax
    4406:	75 19                	jne    4421 <sys_mkdir+0xed>
    4408:	83 ec 0c             	sub    $0xc,%esp
    440b:	ff 74 24 10          	pushl  0x10(%esp)
    440f:	e8 fc ff ff ff       	call   4410 <sys_mkdir+0xdc>
    4414:	83 c4 10             	add    $0x10,%esp
    4417:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    441c:	e9 cc 01 00 00       	jmp    45ed <sys_mkdir+0x2b9>
    4421:	c7 40 04 20 00 00 00 	movl   $0x20,0x4(%eax)
    4428:	c6 40 33 01          	movb   $0x1,0x33(%eax)
    442c:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4432:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4437:	f7 e9                	imul   %ecx
    4439:	89 d0                	mov    %edx,%eax
    443b:	c1 f8 05             	sar    $0x5,%eax
    443e:	c1 f9 1f             	sar    $0x1f,%ecx
    4441:	29 c8                	sub    %ecx,%eax
    4443:	03 05 00 00 00 00    	add    0x0,%eax
    4449:	89 43 24             	mov    %eax,0x24(%ebx)
    444c:	89 43 08             	mov    %eax,0x8(%ebx)
    444f:	83 ec 0c             	sub    $0xc,%esp
    4452:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4456:	50                   	push   %eax
    4457:	e8 fc ff ff ff       	call   4458 <sys_mkdir+0x124>
    445c:	66 89 43 0e          	mov    %ax,0xe(%ebx)
    4460:	83 c4 10             	add    $0x10,%esp
    4463:	66 85 c0             	test   %ax,%ax
    4466:	75 24                	jne    448c <sys_mkdir+0x158>
    4468:	83 ec 0c             	sub    $0xc,%esp
    446b:	ff 74 24 10          	pushl  0x10(%esp)
    446f:	e8 fc ff ff ff       	call   4470 <sys_mkdir+0x13c>
    4474:	fe 4b 0d             	decb   0xd(%ebx)
    4477:	89 1c 24             	mov    %ebx,(%esp)
    447a:	e8 fc ff ff ff       	call   447b <sys_mkdir+0x147>
    447f:	83 c4 10             	add    $0x10,%esp
    4482:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4487:	e9 61 01 00 00       	jmp    45ed <sys_mkdir+0x2b9>
    448c:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4490:	83 ec 08             	sub    $0x8,%esp
    4493:	0f b7 c0             	movzwl %ax,%eax
    4496:	50                   	push   %eax
    4497:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    449b:	50                   	push   %eax
    449c:	e8 fc ff ff ff       	call   449d <sys_mkdir+0x169>
    44a1:	89 c1                	mov    %eax,%ecx
    44a3:	83 c4 10             	add    $0x10,%esp
    44a6:	85 c0                	test   %eax,%eax
    44a8:	75 36                	jne    44e0 <sys_mkdir+0x1ac>
    44aa:	83 ec 0c             	sub    $0xc,%esp
    44ad:	ff 74 24 10          	pushl  0x10(%esp)
    44b1:	e8 fc ff ff ff       	call   44b2 <sys_mkdir+0x17e>
    44b6:	83 c4 08             	add    $0x8,%esp
    44b9:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    44bd:	50                   	push   %eax
    44be:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    44c2:	50                   	push   %eax
    44c3:	e8 fc ff ff ff       	call   44c4 <sys_mkdir+0x190>
    44c8:	fe 4b 0d             	decb   0xd(%ebx)
    44cb:	89 1c 24             	mov    %ebx,(%esp)
    44ce:	e8 fc ff ff ff       	call   44cf <sys_mkdir+0x19b>
    44d3:	83 c4 10             	add    $0x10,%esp
    44d6:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    44db:	e9 0d 01 00 00       	jmp    45ed <sys_mkdir+0x2b9>
    44e0:	8b 00                	mov    (%eax),%eax
    44e2:	89 04 24             	mov    %eax,(%esp)
    44e5:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    44e9:	66 89 10             	mov    %dx,(%eax)
    44ec:	8b 14 24             	mov    (%esp),%edx
    44ef:	8d 7a 02             	lea    0x2(%edx),%edi
    44f2:	be 58 02 00 00       	mov    $0x258,%esi
    44f7:	fc                   	cld    
    44f8:	ac                   	lods   %ds:(%esi),%al
    44f9:	aa                   	stos   %al,%es:(%edi)
    44fa:	84 c0                	test   %al,%al
    44fc:	75 fa                	jne    44f8 <sys_mkdir+0x1c4>
    44fe:	8d 42 20             	lea    0x20(%edx),%eax
    4501:	89 04 24             	mov    %eax,(%esp)
    4504:	8b 44 24 04          	mov    0x4(%esp),%eax
    4508:	66 8b 40 2e          	mov    0x2e(%eax),%ax
    450c:	66 89 42 20          	mov    %ax,0x20(%edx)
    4510:	8d 7a 22             	lea    0x22(%edx),%edi
    4513:	be 5a 02 00 00       	mov    $0x25a,%esi
    4518:	fc                   	cld    
    4519:	ac                   	lods   %ds:(%esi),%al
    451a:	aa                   	stos   %al,%es:(%edi)
    451b:	84 c0                	test   %al,%al
    451d:	75 fa                	jne    4519 <sys_mkdir+0x1e5>
    451f:	c6 43 0d 02          	movb   $0x2,0xd(%ebx)
    4523:	c6 41 0b 01          	movb   $0x1,0xb(%ecx)
    4527:	83 ec 0c             	sub    $0xc,%esp
    452a:	51                   	push   %ecx
    452b:	e8 fc ff ff ff       	call   452c <sys_mkdir+0x1f8>
    4530:	a1 00 00 00 00       	mov    0x0,%eax
    4535:	8b 80 6c 02 00 00    	mov    0x26c(%eax),%eax
    453b:	f7 d0                	not    %eax
    453d:	25 ff 01 00 00       	and    $0x1ff,%eax
    4542:	23 44 24 34          	and    0x34(%esp),%eax
    4546:	80 cc 40             	or     $0x40,%ah
    4549:	66 89 03             	mov    %ax,(%ebx)
    454c:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4550:	83 c4 04             	add    $0x4,%esp
    4553:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4557:	50                   	push   %eax
    4558:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    455c:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4560:	8b 44 24 14          	mov    0x14(%esp),%eax
    4564:	e8 50 f7 ff ff       	call   3cb9 <add_entry>
    4569:	89 c6                	mov    %eax,%esi
    456b:	83 c4 10             	add    $0x10,%esp
    456e:	85 c0                	test   %eax,%eax
    4570:	75 34                	jne    45a6 <sys_mkdir+0x272>
    4572:	83 ec 0c             	sub    $0xc,%esp
    4575:	ff 74 24 10          	pushl  0x10(%esp)
    4579:	e8 fc ff ff ff       	call   457a <sys_mkdir+0x246>
    457e:	83 c4 08             	add    $0x8,%esp
    4581:	0f b7 43 0e          	movzwl 0xe(%ebx),%eax
    4585:	50                   	push   %eax
    4586:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    458a:	50                   	push   %eax
    458b:	e8 fc ff ff ff       	call   458c <sys_mkdir+0x258>
    4590:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    4594:	89 1c 24             	mov    %ebx,(%esp)
    4597:	e8 fc ff ff ff       	call   4598 <sys_mkdir+0x264>
    459c:	83 c4 10             	add    $0x10,%esp
    459f:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    45a4:	eb 47                	jmp    45ed <sys_mkdir+0x2b9>
    45a6:	66 8b 53 2e          	mov    0x2e(%ebx),%dx
    45aa:	8b 04 24             	mov    (%esp),%eax
    45ad:	66 89 10             	mov    %dx,(%eax)
    45b0:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    45b4:	8b 44 24 04          	mov    0x4(%esp),%eax
    45b8:	fe 40 0d             	incb   0xd(%eax)
    45bb:	c6 40 33 01          	movb   $0x1,0x33(%eax)
    45bf:	83 ec 0c             	sub    $0xc,%esp
    45c2:	50                   	push   %eax
    45c3:	e8 fc ff ff ff       	call   45c4 <sys_mkdir+0x290>
    45c8:	89 1c 24             	mov    %ebx,(%esp)
    45cb:	e8 fc ff ff ff       	call   45cc <sys_mkdir+0x298>
    45d0:	89 34 24             	mov    %esi,(%esp)
    45d3:	e8 fc ff ff ff       	call   45d4 <sys_mkdir+0x2a0>
    45d8:	83 c4 10             	add    $0x10,%esp
    45db:	b8 00 00 00 00       	mov    $0x0,%eax
    45e0:	eb 0b                	jmp    45ed <sys_mkdir+0x2b9>
    45e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    45e7:	c3                   	ret    
    45e8:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    45ed:	83 c4 10             	add    $0x10,%esp
    45f0:	5b                   	pop    %ebx
    45f1:	5e                   	pop    %esi
    45f2:	5f                   	pop    %edi
    45f3:	c3                   	ret    

000045f4 <sys_rmdir>:
    45f4:	55                   	push   %ebp
    45f5:	57                   	push   %edi
    45f6:	56                   	push   %esi
    45f7:	53                   	push   %ebx
    45f8:	83 ec 2c             	sub    $0x2c,%esp
    45fb:	a1 00 00 00 00       	mov    0x0,%eax
    4600:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    4607:	00 
    4608:	0f 85 a4 03 00 00    	jne    49b2 <sys_rmdir+0x3be>
    460e:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
    4612:	8d 54 24 18          	lea    0x18(%esp),%edx
    4616:	8b 44 24 40          	mov    0x40(%esp),%eax
    461a:	e8 c4 f4 ff ff       	call   3ae3 <dir_namei>
    461f:	89 c3                	mov    %eax,%ebx
    4621:	89 44 24 14          	mov    %eax,0x14(%esp)
    4625:	85 c0                	test   %eax,%eax
    4627:	0f 84 8c 03 00 00    	je     49b9 <sys_rmdir+0x3c5>
    462d:	8b 74 24 18          	mov    0x18(%esp),%esi
    4631:	85 f6                	test   %esi,%esi
    4633:	75 16                	jne    464b <sys_rmdir+0x57>
    4635:	83 ec 0c             	sub    $0xc,%esp
    4638:	50                   	push   %eax
    4639:	e8 fc ff ff ff       	call   463a <sys_rmdir+0x46>
    463e:	83 c4 10             	add    $0x10,%esp
    4641:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    4646:	e9 9e 03 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    464b:	ba 02 00 00 00       	mov    $0x2,%edx
    4650:	e8 6b f2 ff ff       	call   38c0 <permission>
    4655:	85 c0                	test   %eax,%eax
    4657:	75 16                	jne    466f <sys_rmdir+0x7b>
    4659:	83 ec 0c             	sub    $0xc,%esp
    465c:	53                   	push   %ebx
    465d:	e8 fc ff ff ff       	call   465e <sys_rmdir+0x6a>
    4662:	83 c4 10             	add    $0x10,%esp
    4665:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    466a:	e9 7a 03 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    466f:	83 ec 0c             	sub    $0xc,%esp
    4672:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    4676:	50                   	push   %eax
    4677:	89 f1                	mov    %esi,%ecx
    4679:	8b 54 24 2c          	mov    0x2c(%esp),%edx
    467d:	8d 44 24 24          	lea    0x24(%esp),%eax
    4681:	e8 99 f2 ff ff       	call   391f <find_entry>
    4686:	89 c5                	mov    %eax,%ebp
    4688:	83 c4 10             	add    $0x10,%esp
    468b:	85 c0                	test   %eax,%eax
    468d:	75 19                	jne    46a8 <sys_rmdir+0xb4>
    468f:	83 ec 0c             	sub    $0xc,%esp
    4692:	ff 74 24 20          	pushl  0x20(%esp)
    4696:	e8 fc ff ff ff       	call   4697 <sys_rmdir+0xa3>
    469b:	83 c4 10             	add    $0x10,%esp
    469e:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    46a3:	e9 41 03 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    46a8:	83 ec 08             	sub    $0x8,%esp
    46ab:	8b 44 24 18          	mov    0x18(%esp),%eax
    46af:	0f b7 00             	movzwl (%eax),%eax
    46b2:	50                   	push   %eax
    46b3:	8b 44 24 20          	mov    0x20(%esp),%eax
    46b7:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    46bb:	50                   	push   %eax
    46bc:	e8 fc ff ff ff       	call   46bd <sys_rmdir+0xc9>
    46c1:	89 c3                	mov    %eax,%ebx
    46c3:	83 c4 10             	add    $0x10,%esp
    46c6:	85 c0                	test   %eax,%eax
    46c8:	75 21                	jne    46eb <sys_rmdir+0xf7>
    46ca:	83 ec 0c             	sub    $0xc,%esp
    46cd:	ff 74 24 20          	pushl  0x20(%esp)
    46d1:	e8 fc ff ff ff       	call   46d2 <sys_rmdir+0xde>
    46d6:	89 2c 24             	mov    %ebp,(%esp)
    46d9:	e8 fc ff ff ff       	call   46da <sys_rmdir+0xe6>
    46de:	83 c4 10             	add    $0x10,%esp
    46e1:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    46e6:	e9 fe 02 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    46eb:	8b 44 24 14          	mov    0x14(%esp),%eax
    46ef:	f7 00 00 02 00 00    	testl  $0x200,(%eax)
    46f5:	74 3e                	je     4735 <sys_rmdir+0x141>
    46f7:	8b 15 00 00 00 00    	mov    0x0,%edx
    46fd:	66 8b 92 42 02 00 00 	mov    0x242(%edx),%dx
    4704:	66 85 d2             	test   %dx,%dx
    4707:	74 2c                	je     4735 <sys_rmdir+0x141>
    4709:	66 3b 53 02          	cmp    0x2(%ebx),%dx
    470d:	74 26                	je     4735 <sys_rmdir+0x141>
    470f:	83 ec 0c             	sub    $0xc,%esp
    4712:	50                   	push   %eax
    4713:	e8 fc ff ff ff       	call   4714 <sys_rmdir+0x120>
    4718:	89 1c 24             	mov    %ebx,(%esp)
    471b:	e8 fc ff ff ff       	call   471c <sys_rmdir+0x128>
    4720:	89 2c 24             	mov    %ebp,(%esp)
    4723:	e8 fc ff ff ff       	call   4724 <sys_rmdir+0x130>
    4728:	83 c4 10             	add    $0x10,%esp
    472b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4730:	e9 b4 02 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    4735:	8b 53 2c             	mov    0x2c(%ebx),%edx
    4738:	66 3b 50 2c          	cmp    0x2c(%eax),%dx
    473c:	75 07                	jne    4745 <sys_rmdir+0x151>
    473e:	66 83 7b 30 01       	cmpw   $0x1,0x30(%ebx)
    4743:	76 26                	jbe    476b <sys_rmdir+0x177>
    4745:	83 ec 0c             	sub    $0xc,%esp
    4748:	50                   	push   %eax
    4749:	e8 fc ff ff ff       	call   474a <sys_rmdir+0x156>
    474e:	89 1c 24             	mov    %ebx,(%esp)
    4751:	e8 fc ff ff ff       	call   4752 <sys_rmdir+0x15e>
    4756:	89 2c 24             	mov    %ebp,(%esp)
    4759:	e8 fc ff ff ff       	call   475a <sys_rmdir+0x166>
    475e:	83 c4 10             	add    $0x10,%esp
    4761:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4766:	e9 7e 02 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    476b:	39 c3                	cmp    %eax,%ebx
    476d:	75 2a                	jne    4799 <sys_rmdir+0x1a5>
    476f:	83 ec 0c             	sub    $0xc,%esp
    4772:	53                   	push   %ebx
    4773:	e8 fc ff ff ff       	call   4774 <sys_rmdir+0x180>
    4778:	83 c4 04             	add    $0x4,%esp
    477b:	ff 74 24 20          	pushl  0x20(%esp)
    477f:	e8 fc ff ff ff       	call   4780 <sys_rmdir+0x18c>
    4784:	89 2c 24             	mov    %ebp,(%esp)
    4787:	e8 fc ff ff ff       	call   4788 <sys_rmdir+0x194>
    478c:	83 c4 10             	add    $0x10,%esp
    478f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    4794:	e9 50 02 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    4799:	8b 03                	mov    (%ebx),%eax
    479b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    47a0:	66 3d 00 40          	cmp    $0x4000,%ax
    47a4:	74 2a                	je     47d0 <sys_rmdir+0x1dc>
    47a6:	83 ec 0c             	sub    $0xc,%esp
    47a9:	53                   	push   %ebx
    47aa:	e8 fc ff ff ff       	call   47ab <sys_rmdir+0x1b7>
    47af:	83 c4 04             	add    $0x4,%esp
    47b2:	ff 74 24 20          	pushl  0x20(%esp)
    47b6:	e8 fc ff ff ff       	call   47b7 <sys_rmdir+0x1c3>
    47bb:	89 2c 24             	mov    %ebp,(%esp)
    47be:	e8 fc ff ff ff       	call   47bf <sys_rmdir+0x1cb>
    47c3:	83 c4 10             	add    $0x10,%esp
    47c6:	bf ec ff ff ff       	mov    $0xffffffec,%edi
    47cb:	e9 19 02 00 00       	jmp    49e9 <sys_rmdir+0x3f5>
    47d0:	8b 43 04             	mov    0x4(%ebx),%eax
    47d3:	c1 e8 05             	shr    $0x5,%eax
    47d6:	89 44 24 04          	mov    %eax,0x4(%esp)
    47da:	83 f8 01             	cmp    $0x1,%eax
    47dd:	7e 22                	jle    4801 <sys_rmdir+0x20d>
    47df:	66 8b 43 0e          	mov    0xe(%ebx),%ax
    47e3:	66 85 c0             	test   %ax,%ax
    47e6:	74 19                	je     4801 <sys_rmdir+0x20d>
    47e8:	83 ec 08             	sub    $0x8,%esp
    47eb:	0f b7 c0             	movzwl %ax,%eax
    47ee:	50                   	push   %eax
    47ef:	0f b7 d2             	movzwl %dx,%edx
    47f2:	52                   	push   %edx
    47f3:	e8 fc ff ff ff       	call   47f4 <sys_rmdir+0x200>
    47f8:	89 c1                	mov    %eax,%ecx
    47fa:	83 c4 10             	add    $0x10,%esp
    47fd:	85 c0                	test   %eax,%eax
    47ff:	75 1a                	jne    481b <sys_rmdir+0x227>
    4801:	83 ec 08             	sub    $0x8,%esp
    4804:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4808:	50                   	push   %eax
    4809:	68 20 02 00 00       	push   $0x220
    480e:	e8 fc ff ff ff       	call   480f <sys_rmdir+0x21b>
    4813:	83 c4 10             	add    $0x10,%esp
    4816:	e9 a9 01 00 00       	jmp    49c4 <sys_rmdir+0x3d0>
    481b:	8b 10                	mov    (%eax),%edx
    481d:	66 8b 43 2e          	mov    0x2e(%ebx),%ax
    4821:	66 39 02             	cmp    %ax,(%edx)
    4824:	75 4d                	jne    4873 <sys_rmdir+0x27f>
    4826:	66 83 7a 20 00       	cmpw   $0x0,0x20(%edx)
    482b:	74 46                	je     4873 <sys_rmdir+0x27f>
    482d:	8d 72 02             	lea    0x2(%edx),%esi
    4830:	bf 58 02 00 00       	mov    $0x258,%edi
    4835:	fc                   	cld    
    4836:	ac                   	lods   %ds:(%esi),%al
    4837:	ae                   	scas   %es:(%edi),%al
    4838:	75 08                	jne    4842 <sys_rmdir+0x24e>
    483a:	84 c0                	test   %al,%al
    483c:	75 f8                	jne    4836 <sys_rmdir+0x242>
    483e:	31 c0                	xor    %eax,%eax
    4840:	eb 09                	jmp    484b <sys_rmdir+0x257>
    4842:	b8 01 00 00 00       	mov    $0x1,%eax
    4847:	7c 02                	jl     484b <sys_rmdir+0x257>
    4849:	f7 d8                	neg    %eax
    484b:	85 c0                	test   %eax,%eax
    484d:	75 24                	jne    4873 <sys_rmdir+0x27f>
    484f:	8d 72 22             	lea    0x22(%edx),%esi
    4852:	bf 5a 02 00 00       	mov    $0x25a,%edi
    4857:	fc                   	cld    
    4858:	ac                   	lods   %ds:(%esi),%al
    4859:	ae                   	scas   %es:(%edi),%al
    485a:	75 08                	jne    4864 <sys_rmdir+0x270>
    485c:	84 c0                	test   %al,%al
    485e:	75 f8                	jne    4858 <sys_rmdir+0x264>
    4860:	31 c0                	xor    %eax,%eax
    4862:	eb 09                	jmp    486d <sys_rmdir+0x279>
    4864:	b8 01 00 00 00       	mov    $0x1,%eax
    4869:	7c 02                	jl     486d <sys_rmdir+0x279>
    486b:	f7 d8                	neg    %eax
    486d:	89 c7                	mov    %eax,%edi
    486f:	85 c0                	test   %eax,%eax
    4871:	74 1a                	je     488d <sys_rmdir+0x299>
    4873:	83 ec 08             	sub    $0x8,%esp
    4876:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    487a:	50                   	push   %eax
    487b:	68 20 02 00 00       	push   $0x220
    4880:	e8 fc ff ff ff       	call   4881 <sys_rmdir+0x28d>
    4885:	83 c4 10             	add    $0x10,%esp
    4888:	e9 37 01 00 00       	jmp    49c4 <sys_rmdir+0x3d0>
    488d:	8d 72 40             	lea    0x40(%edx),%esi
    4890:	83 7c 24 04 02       	cmpl   $0x2,0x4(%esp)
    4895:	0f 8e 8f 00 00 00    	jle    492a <sys_rmdir+0x336>
    489b:	b8 02 00 00 00       	mov    $0x2,%eax
    48a0:	89 7c 24 0c          	mov    %edi,0xc(%esp)
    48a4:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    48a8:	89 cd                	mov    %ecx,%ebp
    48aa:	89 c7                	mov    %eax,%edi
    48ac:	8b 45 00             	mov    0x0(%ebp),%eax
    48af:	05 00 04 00 00       	add    $0x400,%eax
    48b4:	39 c6                	cmp    %eax,%esi
    48b6:	72 41                	jb     48f9 <sys_rmdir+0x305>
    48b8:	83 ec 0c             	sub    $0xc,%esp
    48bb:	55                   	push   %ebp
    48bc:	e8 fc ff ff ff       	call   48bd <sys_rmdir+0x2c9>
    48c1:	83 c4 08             	add    $0x8,%esp
    48c4:	89 f8                	mov    %edi,%eax
    48c6:	c1 e8 05             	shr    $0x5,%eax
    48c9:	50                   	push   %eax
    48ca:	53                   	push   %ebx
    48cb:	e8 fc ff ff ff       	call   48cc <sys_rmdir+0x2d8>
    48d0:	83 c4 10             	add    $0x10,%esp
    48d3:	85 c0                	test   %eax,%eax
    48d5:	75 05                	jne    48dc <sys_rmdir+0x2e8>
    48d7:	83 c7 20             	add    $0x20,%edi
    48da:	eb 3e                	jmp    491a <sys_rmdir+0x326>
    48dc:	83 ec 08             	sub    $0x8,%esp
    48df:	50                   	push   %eax
    48e0:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    48e4:	50                   	push   %eax
    48e5:	e8 fc ff ff ff       	call   48e6 <sys_rmdir+0x2f2>
    48ea:	89 c5                	mov    %eax,%ebp
    48ec:	83 c4 10             	add    $0x10,%esp
    48ef:	85 c0                	test   %eax,%eax
    48f1:	0f 84 c9 00 00 00    	je     49c0 <sys_rmdir+0x3cc>
    48f7:	8b 30                	mov    (%eax),%esi
    48f9:	66 83 3e 00          	cmpw   $0x0,(%esi)
    48fd:	74 17                	je     4916 <sys_rmdir+0x322>
    48ff:	89 e8                	mov    %ebp,%eax
    4901:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    4905:	83 ec 0c             	sub    $0xc,%esp
    4908:	50                   	push   %eax
    4909:	e8 fc ff ff ff       	call   490a <sys_rmdir+0x316>
    490e:	83 c4 10             	add    $0x10,%esp
    4911:	e9 ae 00 00 00       	jmp    49c4 <sys_rmdir+0x3d0>
    4916:	83 c6 20             	add    $0x20,%esi
    4919:	47                   	inc    %edi
    491a:	39 7c 24 04          	cmp    %edi,0x4(%esp)
    491e:	7f 8c                	jg     48ac <sys_rmdir+0x2b8>
    4920:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    4924:	89 e9                	mov    %ebp,%ecx
    4926:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    492a:	83 ec 0c             	sub    $0xc,%esp
    492d:	51                   	push   %ecx
    492e:	e8 fc ff ff ff       	call   492f <sys_rmdir+0x33b>
    4933:	8a 43 0d             	mov    0xd(%ebx),%al
    4936:	83 c4 10             	add    $0x10,%esp
    4939:	3c 02                	cmp    $0x2,%al
    493b:	74 14                	je     4951 <sys_rmdir+0x35d>
    493d:	83 ec 08             	sub    $0x8,%esp
    4940:	0f b6 c0             	movzbl %al,%eax
    4943:	50                   	push   %eax
    4944:	68 48 02 00 00       	push   $0x248
    4949:	e8 fc ff ff ff       	call   494a <sys_rmdir+0x356>
    494e:	83 c4 10             	add    $0x10,%esp
    4951:	8b 44 24 10          	mov    0x10(%esp),%eax
    4955:	66 c7 00 00 00       	movw   $0x0,(%eax)
    495a:	c6 45 0b 01          	movb   $0x1,0xb(%ebp)
    495e:	83 ec 0c             	sub    $0xc,%esp
    4961:	55                   	push   %ebp
    4962:	e8 fc ff ff ff       	call   4963 <sys_rmdir+0x36f>
    4967:	c6 43 0d 00          	movb   $0x0,0xd(%ebx)
    496b:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    496f:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    4973:	fe 49 0d             	decb   0xd(%ecx)
    4976:	8b 35 00 00 00 00    	mov    0x0,%esi
    497c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4981:	f7 ee                	imul   %esi
    4983:	89 d0                	mov    %edx,%eax
    4985:	c1 f8 05             	sar    $0x5,%eax
    4988:	c1 fe 1f             	sar    $0x1f,%esi
    498b:	29 f0                	sub    %esi,%eax
    498d:	03 05 00 00 00 00    	add    0x0,%eax
    4993:	89 41 08             	mov    %eax,0x8(%ecx)
    4996:	89 41 28             	mov    %eax,0x28(%ecx)
    4999:	c6 41 33 01          	movb   $0x1,0x33(%ecx)
    499d:	89 0c 24             	mov    %ecx,(%esp)
    49a0:	e8 fc ff ff ff       	call   49a1 <sys_rmdir+0x3ad>
    49a5:	89 1c 24             	mov    %ebx,(%esp)
    49a8:	e8 fc ff ff ff       	call   49a9 <sys_rmdir+0x3b5>
    49ad:	83 c4 10             	add    $0x10,%esp
    49b0:	eb 37                	jmp    49e9 <sys_rmdir+0x3f5>
    49b2:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    49b7:	eb 30                	jmp    49e9 <sys_rmdir+0x3f5>
    49b9:	bf fe ff ff ff       	mov    $0xfffffffe,%edi
    49be:	eb 29                	jmp    49e9 <sys_rmdir+0x3f5>
    49c0:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    49c4:	83 ec 0c             	sub    $0xc,%esp
    49c7:	53                   	push   %ebx
    49c8:	e8 fc ff ff ff       	call   49c9 <sys_rmdir+0x3d5>
    49cd:	83 c4 04             	add    $0x4,%esp
    49d0:	ff 74 24 20          	pushl  0x20(%esp)
    49d4:	e8 fc ff ff ff       	call   49d5 <sys_rmdir+0x3e1>
    49d9:	89 2c 24             	mov    %ebp,(%esp)
    49dc:	e8 fc ff ff ff       	call   49dd <sys_rmdir+0x3e9>
    49e1:	83 c4 10             	add    $0x10,%esp
    49e4:	bf d9 ff ff ff       	mov    $0xffffffd9,%edi
    49e9:	89 f8                	mov    %edi,%eax
    49eb:	83 c4 2c             	add    $0x2c,%esp
    49ee:	5b                   	pop    %ebx
    49ef:	5e                   	pop    %esi
    49f0:	5f                   	pop    %edi
    49f1:	5d                   	pop    %ebp
    49f2:	c3                   	ret    

000049f3 <sys_unlink>:
    49f3:	56                   	push   %esi
    49f4:	53                   	push   %ebx
    49f5:	83 ec 14             	sub    $0x14,%esp
    49f8:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
    49fc:	8d 54 24 08          	lea    0x8(%esp),%edx
    4a00:	8b 44 24 20          	mov    0x20(%esp),%eax
    4a04:	e8 da f0 ff ff       	call   3ae3 <dir_namei>
    4a09:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a0d:	85 c0                	test   %eax,%eax
    4a0f:	0f 84 c4 01 00 00    	je     4bd9 <sys_unlink+0x1e6>
    4a15:	89 c3                	mov    %eax,%ebx
    4a17:	8b 74 24 08          	mov    0x8(%esp),%esi
    4a1b:	85 f6                	test   %esi,%esi
    4a1d:	75 16                	jne    4a35 <sys_unlink+0x42>
    4a1f:	83 ec 0c             	sub    $0xc,%esp
    4a22:	50                   	push   %eax
    4a23:	e8 fc ff ff ff       	call   4a24 <sys_unlink+0x31>
    4a28:	83 c4 10             	add    $0x10,%esp
    4a2b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4a30:	e9 a9 01 00 00       	jmp    4bde <sys_unlink+0x1eb>
    4a35:	ba 02 00 00 00       	mov    $0x2,%edx
    4a3a:	e8 81 ee ff ff       	call   38c0 <permission>
    4a3f:	85 c0                	test   %eax,%eax
    4a41:	75 16                	jne    4a59 <sys_unlink+0x66>
    4a43:	83 ec 0c             	sub    $0xc,%esp
    4a46:	53                   	push   %ebx
    4a47:	e8 fc ff ff ff       	call   4a48 <sys_unlink+0x55>
    4a4c:	83 c4 10             	add    $0x10,%esp
    4a4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4a54:	e9 85 01 00 00       	jmp    4bde <sys_unlink+0x1eb>
    4a59:	83 ec 0c             	sub    $0xc,%esp
    4a5c:	8d 44 24 0c          	lea    0xc(%esp),%eax
    4a60:	50                   	push   %eax
    4a61:	89 f1                	mov    %esi,%ecx
    4a63:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    4a67:	8d 44 24 14          	lea    0x14(%esp),%eax
    4a6b:	e8 af ee ff ff       	call   391f <find_entry>
    4a70:	89 c6                	mov    %eax,%esi
    4a72:	83 c4 10             	add    $0x10,%esp
    4a75:	85 c0                	test   %eax,%eax
    4a77:	75 19                	jne    4a92 <sys_unlink+0x9f>
    4a79:	83 ec 0c             	sub    $0xc,%esp
    4a7c:	ff 74 24 10          	pushl  0x10(%esp)
    4a80:	e8 fc ff ff ff       	call   4a81 <sys_unlink+0x8e>
    4a85:	83 c4 10             	add    $0x10,%esp
    4a88:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4a8d:	e9 4c 01 00 00       	jmp    4bde <sys_unlink+0x1eb>
    4a92:	83 ec 08             	sub    $0x8,%esp
    4a95:	8b 44 24 08          	mov    0x8(%esp),%eax
    4a99:	0f b7 00             	movzwl (%eax),%eax
    4a9c:	50                   	push   %eax
    4a9d:	8b 44 24 10          	mov    0x10(%esp),%eax
    4aa1:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
    4aa5:	50                   	push   %eax
    4aa6:	e8 fc ff ff ff       	call   4aa7 <sys_unlink+0xb4>
    4aab:	89 c3                	mov    %eax,%ebx
    4aad:	83 c4 10             	add    $0x10,%esp
    4ab0:	85 c0                	test   %eax,%eax
    4ab2:	75 21                	jne    4ad5 <sys_unlink+0xe2>
    4ab4:	83 ec 0c             	sub    $0xc,%esp
    4ab7:	ff 74 24 10          	pushl  0x10(%esp)
    4abb:	e8 fc ff ff ff       	call   4abc <sys_unlink+0xc9>
    4ac0:	89 34 24             	mov    %esi,(%esp)
    4ac3:	e8 fc ff ff ff       	call   4ac4 <sys_unlink+0xd1>
    4ac8:	83 c4 10             	add    $0x10,%esp
    4acb:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4ad0:	e9 09 01 00 00       	jmp    4bde <sys_unlink+0x1eb>
    4ad5:	8b 44 24 04          	mov    0x4(%esp),%eax
    4ad9:	f7 00 00 02 00 00    	testl  $0x200,(%eax)
    4adf:	74 44                	je     4b25 <sys_unlink+0x132>
    4ae1:	8b 15 00 00 00 00    	mov    0x0,%edx
    4ae7:	66 8b 92 42 02 00 00 	mov    0x242(%edx),%dx
    4aee:	66 85 d2             	test   %dx,%dx
    4af1:	74 32                	je     4b25 <sys_unlink+0x132>
    4af3:	66 3b 53 02          	cmp    0x2(%ebx),%dx
    4af7:	74 2c                	je     4b25 <sys_unlink+0x132>
    4af9:	66 3b 50 02          	cmp    0x2(%eax),%dx
    4afd:	74 26                	je     4b25 <sys_unlink+0x132>
    4aff:	83 ec 0c             	sub    $0xc,%esp
    4b02:	50                   	push   %eax
    4b03:	e8 fc ff ff ff       	call   4b04 <sys_unlink+0x111>
    4b08:	89 1c 24             	mov    %ebx,(%esp)
    4b0b:	e8 fc ff ff ff       	call   4b0c <sys_unlink+0x119>
    4b10:	89 34 24             	mov    %esi,(%esp)
    4b13:	e8 fc ff ff ff       	call   4b14 <sys_unlink+0x121>
    4b18:	83 c4 10             	add    $0x10,%esp
    4b1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4b20:	e9 b9 00 00 00       	jmp    4bde <sys_unlink+0x1eb>
    4b25:	8b 03                	mov    (%ebx),%eax
    4b27:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    4b2c:	66 3d 00 40          	cmp    $0x4000,%ax
    4b30:	75 2a                	jne    4b5c <sys_unlink+0x169>
    4b32:	83 ec 0c             	sub    $0xc,%esp
    4b35:	53                   	push   %ebx
    4b36:	e8 fc ff ff ff       	call   4b37 <sys_unlink+0x144>
    4b3b:	83 c4 04             	add    $0x4,%esp
    4b3e:	ff 74 24 10          	pushl  0x10(%esp)
    4b42:	e8 fc ff ff ff       	call   4b43 <sys_unlink+0x150>
    4b47:	89 34 24             	mov    %esi,(%esp)
    4b4a:	e8 fc ff ff ff       	call   4b4b <sys_unlink+0x158>
    4b4f:	83 c4 10             	add    $0x10,%esp
    4b52:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4b57:	e9 82 00 00 00       	jmp    4bde <sys_unlink+0x1eb>
    4b5c:	80 7b 0d 00          	cmpb   $0x0,0xd(%ebx)
    4b60:	75 1d                	jne    4b7f <sys_unlink+0x18c>
    4b62:	6a 00                	push   $0x0
    4b64:	0f b7 43 2e          	movzwl 0x2e(%ebx),%eax
    4b68:	50                   	push   %eax
    4b69:	0f b7 43 2c          	movzwl 0x2c(%ebx),%eax
    4b6d:	50                   	push   %eax
    4b6e:	68 6c 02 00 00       	push   $0x26c
    4b73:	e8 fc ff ff ff       	call   4b74 <sys_unlink+0x181>
    4b78:	c6 43 0d 01          	movb   $0x1,0xd(%ebx)
    4b7c:	83 c4 10             	add    $0x10,%esp
    4b7f:	8b 04 24             	mov    (%esp),%eax
    4b82:	66 c7 00 00 00       	movw   $0x0,(%eax)
    4b87:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4b8b:	83 ec 0c             	sub    $0xc,%esp
    4b8e:	56                   	push   %esi
    4b8f:	e8 fc ff ff ff       	call   4b90 <sys_unlink+0x19d>
    4b94:	fe 4b 0d             	decb   0xd(%ebx)
    4b97:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4b9b:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4ba1:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4ba6:	f7 e9                	imul   %ecx
    4ba8:	89 d0                	mov    %edx,%eax
    4baa:	c1 f8 05             	sar    $0x5,%eax
    4bad:	c1 f9 1f             	sar    $0x1f,%ecx
    4bb0:	29 c8                	sub    %ecx,%eax
    4bb2:	03 05 00 00 00 00    	add    0x0,%eax
    4bb8:	89 43 28             	mov    %eax,0x28(%ebx)
    4bbb:	89 1c 24             	mov    %ebx,(%esp)
    4bbe:	e8 fc ff ff ff       	call   4bbf <sys_unlink+0x1cc>
    4bc3:	83 c4 04             	add    $0x4,%esp
    4bc6:	ff 74 24 10          	pushl  0x10(%esp)
    4bca:	e8 fc ff ff ff       	call   4bcb <sys_unlink+0x1d8>
    4bcf:	83 c4 10             	add    $0x10,%esp
    4bd2:	b8 00 00 00 00       	mov    $0x0,%eax
    4bd7:	eb 05                	jmp    4bde <sys_unlink+0x1eb>
    4bd9:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4bde:	83 c4 14             	add    $0x14,%esp
    4be1:	5b                   	pop    %ebx
    4be2:	5e                   	pop    %esi
    4be3:	c3                   	ret    

00004be4 <sys_link>:
    4be4:	57                   	push   %edi
    4be5:	56                   	push   %esi
    4be6:	53                   	push   %ebx
    4be7:	83 ec 1c             	sub    $0x1c,%esp
    4bea:	ff 74 24 2c          	pushl  0x2c(%esp)
    4bee:	e8 fc ff ff ff       	call   4bef <sys_link+0xb>
    4bf3:	83 c4 10             	add    $0x10,%esp
    4bf6:	85 c0                	test   %eax,%eax
    4bf8:	0f 84 b5 01 00 00    	je     4db3 <sys_link+0x1cf>
    4bfe:	89 c3                	mov    %eax,%ebx
    4c00:	8b 00                	mov    (%eax),%eax
    4c02:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    4c07:	66 3d 00 40          	cmp    $0x4000,%ax
    4c0b:	75 16                	jne    4c23 <sys_link+0x3f>
    4c0d:	83 ec 0c             	sub    $0xc,%esp
    4c10:	53                   	push   %ebx
    4c11:	e8 fc ff ff ff       	call   4c12 <sys_link+0x2e>
    4c16:	83 c4 10             	add    $0x10,%esp
    4c19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c1e:	e9 95 01 00 00       	jmp    4db8 <sys_link+0x1d4>
    4c23:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    4c27:	89 e2                	mov    %esp,%edx
    4c29:	8b 44 24 24          	mov    0x24(%esp),%eax
    4c2d:	e8 b1 ee ff ff       	call   3ae3 <dir_namei>
    4c32:	89 c6                	mov    %eax,%esi
    4c34:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c38:	85 c0                	test   %eax,%eax
    4c3a:	75 16                	jne    4c52 <sys_link+0x6e>
    4c3c:	83 ec 0c             	sub    $0xc,%esp
    4c3f:	53                   	push   %ebx
    4c40:	e8 fc ff ff ff       	call   4c41 <sys_link+0x5d>
    4c45:	83 c4 10             	add    $0x10,%esp
    4c48:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
    4c4d:	e9 66 01 00 00       	jmp    4db8 <sys_link+0x1d4>
    4c52:	8b 3c 24             	mov    (%esp),%edi
    4c55:	85 ff                	test   %edi,%edi
    4c57:	75 22                	jne    4c7b <sys_link+0x97>
    4c59:	83 ec 0c             	sub    $0xc,%esp
    4c5c:	53                   	push   %ebx
    4c5d:	e8 fc ff ff ff       	call   4c5e <sys_link+0x7a>
    4c62:	83 c4 04             	add    $0x4,%esp
    4c65:	ff 74 24 14          	pushl  0x14(%esp)
    4c69:	e8 fc ff ff ff       	call   4c6a <sys_link+0x86>
    4c6e:	83 c4 10             	add    $0x10,%esp
    4c71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4c76:	e9 3d 01 00 00       	jmp    4db8 <sys_link+0x1d4>
    4c7b:	8b 43 2c             	mov    0x2c(%ebx),%eax
    4c7e:	66 39 46 2c          	cmp    %ax,0x2c(%esi)
    4c82:	74 1e                	je     4ca2 <sys_link+0xbe>
    4c84:	83 ec 0c             	sub    $0xc,%esp
    4c87:	56                   	push   %esi
    4c88:	e8 fc ff ff ff       	call   4c89 <sys_link+0xa5>
    4c8d:	89 1c 24             	mov    %ebx,(%esp)
    4c90:	e8 fc ff ff ff       	call   4c91 <sys_link+0xad>
    4c95:	83 c4 10             	add    $0x10,%esp
    4c98:	b8 ee ff ff ff       	mov    $0xffffffee,%eax
    4c9d:	e9 16 01 00 00       	jmp    4db8 <sys_link+0x1d4>
    4ca2:	ba 02 00 00 00       	mov    $0x2,%edx
    4ca7:	89 f0                	mov    %esi,%eax
    4ca9:	e8 12 ec ff ff       	call   38c0 <permission>
    4cae:	85 c0                	test   %eax,%eax
    4cb0:	75 1e                	jne    4cd0 <sys_link+0xec>
    4cb2:	83 ec 0c             	sub    $0xc,%esp
    4cb5:	56                   	push   %esi
    4cb6:	e8 fc ff ff ff       	call   4cb7 <sys_link+0xd3>
    4cbb:	89 1c 24             	mov    %ebx,(%esp)
    4cbe:	e8 fc ff ff ff       	call   4cbf <sys_link+0xdb>
    4cc3:	83 c4 10             	add    $0x10,%esp
    4cc6:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
    4ccb:	e9 e8 00 00 00       	jmp    4db8 <sys_link+0x1d4>
    4cd0:	83 ec 0c             	sub    $0xc,%esp
    4cd3:	8d 44 24 18          	lea    0x18(%esp),%eax
    4cd7:	50                   	push   %eax
    4cd8:	89 f9                	mov    %edi,%ecx
    4cda:	8b 54 24 14          	mov    0x14(%esp),%edx
    4cde:	8d 44 24 18          	lea    0x18(%esp),%eax
    4ce2:	e8 38 ec ff ff       	call   391f <find_entry>
    4ce7:	83 c4 10             	add    $0x10,%esp
    4cea:	85 c0                	test   %eax,%eax
    4cec:	74 2a                	je     4d18 <sys_link+0x134>
    4cee:	83 ec 0c             	sub    $0xc,%esp
    4cf1:	50                   	push   %eax
    4cf2:	e8 fc ff ff ff       	call   4cf3 <sys_link+0x10f>
    4cf7:	83 c4 04             	add    $0x4,%esp
    4cfa:	ff 74 24 14          	pushl  0x14(%esp)
    4cfe:	e8 fc ff ff ff       	call   4cff <sys_link+0x11b>
    4d03:	89 1c 24             	mov    %ebx,(%esp)
    4d06:	e8 fc ff ff ff       	call   4d07 <sys_link+0x123>
    4d0b:	83 c4 10             	add    $0x10,%esp
    4d0e:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
    4d13:	e9 a0 00 00 00       	jmp    4db8 <sys_link+0x1d4>
    4d18:	83 ec 0c             	sub    $0xc,%esp
    4d1b:	8d 44 24 18          	lea    0x18(%esp),%eax
    4d1f:	50                   	push   %eax
    4d20:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    4d24:	8b 54 24 14          	mov    0x14(%esp),%edx
    4d28:	8b 44 24 18          	mov    0x18(%esp),%eax
    4d2c:	e8 88 ef ff ff       	call   3cb9 <add_entry>
    4d31:	83 c4 10             	add    $0x10,%esp
    4d34:	85 c0                	test   %eax,%eax
    4d36:	75 1e                	jne    4d56 <sys_link+0x172>
    4d38:	83 ec 0c             	sub    $0xc,%esp
    4d3b:	ff 74 24 14          	pushl  0x14(%esp)
    4d3f:	e8 fc ff ff ff       	call   4d40 <sys_link+0x15c>
    4d44:	89 1c 24             	mov    %ebx,(%esp)
    4d47:	e8 fc ff ff ff       	call   4d48 <sys_link+0x164>
    4d4c:	83 c4 10             	add    $0x10,%esp
    4d4f:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
    4d54:	eb 62                	jmp    4db8 <sys_link+0x1d4>
    4d56:	66 8b 4b 2e          	mov    0x2e(%ebx),%cx
    4d5a:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4d5e:	66 89 0a             	mov    %cx,(%edx)
    4d61:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4d65:	83 ec 0c             	sub    $0xc,%esp
    4d68:	50                   	push   %eax
    4d69:	e8 fc ff ff ff       	call   4d6a <sys_link+0x186>
    4d6e:	83 c4 04             	add    $0x4,%esp
    4d71:	ff 74 24 14          	pushl  0x14(%esp)
    4d75:	e8 fc ff ff ff       	call   4d76 <sys_link+0x192>
    4d7a:	fe 43 0d             	incb   0xd(%ebx)
    4d7d:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    4d83:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    4d88:	f7 e9                	imul   %ecx
    4d8a:	89 d0                	mov    %edx,%eax
    4d8c:	c1 f8 05             	sar    $0x5,%eax
    4d8f:	c1 f9 1f             	sar    $0x1f,%ecx
    4d92:	29 c8                	sub    %ecx,%eax
    4d94:	03 05 00 00 00 00    	add    0x0,%eax
    4d9a:	89 43 28             	mov    %eax,0x28(%ebx)
    4d9d:	c6 43 33 01          	movb   $0x1,0x33(%ebx)
    4da1:	89 1c 24             	mov    %ebx,(%esp)
    4da4:	e8 fc ff ff ff       	call   4da5 <sys_link+0x1c1>
    4da9:	83 c4 10             	add    $0x10,%esp
    4dac:	b8 00 00 00 00       	mov    $0x0,%eax
    4db1:	eb 05                	jmp    4db8 <sys_link+0x1d4>
    4db3:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    4db8:	83 c4 10             	add    $0x10,%esp
    4dbb:	5b                   	pop    %ebx
    4dbc:	5e                   	pop    %esi
    4dbd:	5f                   	pop    %edi
    4dbe:	c3                   	ret    

00004dbf <free_block>:
    4dbf:	55                   	push   %ebp
    4dc0:	57                   	push   %edi
    4dc1:	56                   	push   %esi
    4dc2:	53                   	push   %ebx
    4dc3:	83 ec 18             	sub    $0x18,%esp
    4dc6:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
    4dca:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    4dce:	57                   	push   %edi
    4dcf:	e8 fc ff ff ff       	call   4dd0 <free_block+0x11>
    4dd4:	89 c6                	mov    %eax,%esi
    4dd6:	83 c4 10             	add    $0x10,%esp
    4dd9:	85 c0                	test   %eax,%eax
    4ddb:	75 10                	jne    4ded <free_block+0x2e>
    4ddd:	83 ec 0c             	sub    $0xc,%esp
    4de0:	68 98 02 00 00       	push   $0x298
    4de5:	e8 fc ff ff ff       	call   4de6 <free_block+0x27>
    4dea:	83 c4 10             	add    $0x10,%esp
    4ded:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4df1:	39 d8                	cmp    %ebx,%eax
    4df3:	7f 08                	jg     4dfd <free_block+0x3e>
    4df5:	0f b7 46 02          	movzwl 0x2(%esi),%eax
    4df9:	39 c3                	cmp    %eax,%ebx
    4dfb:	7c 10                	jl     4e0d <free_block+0x4e>
    4dfd:	83 ec 0c             	sub    $0xc,%esp
    4e00:	68 c4 02 00 00       	push   $0x2c4
    4e05:	e8 fc ff ff ff       	call   4e06 <free_block+0x47>
    4e0a:	83 c4 10             	add    $0x10,%esp
    4e0d:	83 ec 08             	sub    $0x8,%esp
    4e10:	53                   	push   %ebx
    4e11:	57                   	push   %edi
    4e12:	e8 fc ff ff ff       	call   4e13 <free_block+0x54>
    4e17:	83 c4 10             	add    $0x10,%esp
    4e1a:	85 c0                	test   %eax,%eax
    4e1c:	74 31                	je     4e4f <free_block+0x90>
    4e1e:	8a 50 0c             	mov    0xc(%eax),%dl
    4e21:	80 fa 01             	cmp    $0x1,%dl
    4e24:	74 15                	je     4e3b <free_block+0x7c>
    4e26:	0f b6 d2             	movzbl %dl,%edx
    4e29:	52                   	push   %edx
    4e2a:	53                   	push   %ebx
    4e2b:	57                   	push   %edi
    4e2c:	68 ec 02 00 00       	push   $0x2ec
    4e31:	e8 fc ff ff ff       	call   4e32 <free_block+0x73>
    4e36:	83 c4 10             	add    $0x10,%esp
    4e39:	eb 76                	jmp    4eb1 <free_block+0xf2>
    4e3b:	c6 40 0b 00          	movb   $0x0,0xb(%eax)
    4e3f:	c6 40 0a 00          	movb   $0x0,0xa(%eax)
    4e43:	83 ec 0c             	sub    $0xc,%esp
    4e46:	50                   	push   %eax
    4e47:	e8 fc ff ff ff       	call   4e48 <free_block+0x89>
    4e4c:	83 c4 10             	add    $0x10,%esp
    4e4f:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4e53:	48                   	dec    %eax
    4e54:	29 c3                	sub    %eax,%ebx
    4e56:	89 d8                	mov    %ebx,%eax
    4e58:	85 db                	test   %ebx,%ebx
    4e5a:	79 06                	jns    4e62 <free_block+0xa3>
    4e5c:	8d 83 ff 1f 00 00    	lea    0x1fff(%ebx),%eax
    4e62:	c1 f8 0d             	sar    $0xd,%eax
    4e65:	8d 2c 86             	lea    (%esi,%eax,4),%ebp
    4e68:	89 da                	mov    %ebx,%edx
    4e6a:	81 e2 ff 1f 00 00    	and    $0x1fff,%edx
    4e70:	8b 45 34             	mov    0x34(%ebp),%eax
    4e73:	8b 08                	mov    (%eax),%ecx
    4e75:	b8 00 00 00 00       	mov    $0x0,%eax
    4e7a:	0f b3 11             	btr    %edx,(%ecx)
    4e7d:	0f 93 c0             	setae  %al
    4e80:	85 c0                	test   %eax,%eax
    4e82:	74 26                	je     4eaa <free_block+0xeb>
    4e84:	83 ec 04             	sub    $0x4,%esp
    4e87:	0f b7 46 08          	movzwl 0x8(%esi),%eax
    4e8b:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
    4e8f:	50                   	push   %eax
    4e90:	57                   	push   %edi
    4e91:	68 5d 02 00 00       	push   $0x25d
    4e96:	e8 fc ff ff ff       	call   4e97 <free_block+0xd8>
    4e9b:	c7 04 24 18 03 00 00 	movl   $0x318,(%esp)
    4ea2:	e8 fc ff ff ff       	call   4ea3 <free_block+0xe4>
    4ea7:	83 c4 10             	add    $0x10,%esp
    4eaa:	8b 45 34             	mov    0x34(%ebp),%eax
    4ead:	c6 40 0b 01          	movb   $0x1,0xb(%eax)
    4eb1:	83 c4 0c             	add    $0xc,%esp
    4eb4:	5b                   	pop    %ebx
    4eb5:	5e                   	pop    %esi
    4eb6:	5f                   	pop    %edi
    4eb7:	5d                   	pop    %ebp
    4eb8:	c3                   	ret    

00004eb9 <new_block>:
    4eb9:	55                   	push   %ebp
    4eba:	57                   	push   %edi
    4ebb:	56                   	push   %esi
    4ebc:	53                   	push   %ebx
    4ebd:	83 ec 28             	sub    $0x28,%esp
    4ec0:	ff 74 24 3c          	pushl  0x3c(%esp)
    4ec4:	e8 fc ff ff ff       	call   4ec5 <new_block+0xc>
    4ec9:	89 c5                	mov    %eax,%ebp
    4ecb:	83 c4 10             	add    $0x10,%esp
    4ece:	85 c0                	test   %eax,%eax
    4ed0:	75 10                	jne    4ee2 <new_block+0x29>
    4ed2:	83 ec 0c             	sub    $0xc,%esp
    4ed5:	68 38 03 00 00       	push   $0x338
    4eda:	e8 fc ff ff ff       	call   4edb <new_block+0x22>
    4edf:	83 c4 10             	add    $0x10,%esp
    4ee2:	bb 00 00 00 00       	mov    $0x0,%ebx
    4ee7:	8b 7c 9d 34          	mov    0x34(%ebp,%ebx,4),%edi
    4eeb:	85 ff                	test   %edi,%edi
    4eed:	74 30                	je     4f1f <new_block+0x66>
    4eef:	8b 37                	mov    (%edi),%esi
    4ef1:	b9 00 00 00 00       	mov    $0x0,%ecx
    4ef6:	fc                   	cld    
    4ef7:	56                   	push   %esi
    4ef8:	ad                   	lods   %ds:(%esi),%eax
    4ef9:	f7 d0                	not    %eax
    4efb:	0f bc d0             	bsf    %eax,%edx
    4efe:	74 05                	je     4f05 <new_block+0x4c>
    4f00:	01 d1                	add    %edx,%ecx
    4f02:	5e                   	pop    %esi
    4f03:	eb 0e                	jmp    4f13 <new_block+0x5a>
    4f05:	83 c1 20             	add    $0x20,%ecx
    4f08:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
    4f0e:	7c e8                	jl     4ef8 <new_block+0x3f>
    4f10:	83 c4 04             	add    $0x4,%esp
    4f13:	81 f9 ff 1f 00 00    	cmp    $0x1fff,%ecx
    4f19:	0f 8e c1 00 00 00    	jle    4fe0 <new_block+0x127>
    4f1f:	43                   	inc    %ebx
    4f20:	83 fb 08             	cmp    $0x8,%ebx
    4f23:	75 c2                	jne    4ee7 <new_block+0x2e>
    4f25:	b8 00 00 00 00       	mov    $0x0,%eax
    4f2a:	e9 c0 00 00 00       	jmp    4fef <new_block+0x136>
    4f2f:	b8 00 00 00 00       	mov    $0x0,%eax
    4f34:	8b 54 24 0c          	mov    0xc(%esp),%edx
    4f38:	0f ab 16             	bts    %edx,(%esi)
    4f3b:	0f 92 c0             	setb   %al
    4f3e:	85 c0                	test   %eax,%eax
    4f40:	74 10                	je     4f52 <new_block+0x99>
    4f42:	83 ec 0c             	sub    $0xc,%esp
    4f45:	68 6e 02 00 00       	push   $0x26e
    4f4a:	e8 fc ff ff ff       	call   4f4b <new_block+0x92>
    4f4f:	83 c4 10             	add    $0x10,%esp
    4f52:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
    4f56:	c1 e3 0d             	shl    $0xd,%ebx
    4f59:	0f b7 45 08          	movzwl 0x8(%ebp),%eax
    4f5d:	8d 44 03 ff          	lea    -0x1(%ebx,%eax,1),%eax
    4f61:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    4f65:	01 c3                	add    %eax,%ebx
    4f67:	0f b7 45 02          	movzwl 0x2(%ebp),%eax
    4f6b:	39 c3                	cmp    %eax,%ebx
    4f6d:	7d 63                	jge    4fd2 <new_block+0x119>
    4f6f:	83 ec 08             	sub    $0x8,%esp
    4f72:	53                   	push   %ebx
    4f73:	ff 74 24 3c          	pushl  0x3c(%esp)
    4f77:	e8 fc ff ff ff       	call   4f78 <new_block+0xbf>
    4f7c:	89 c6                	mov    %eax,%esi
    4f7e:	83 c4 10             	add    $0x10,%esp
    4f81:	85 c0                	test   %eax,%eax
    4f83:	75 10                	jne    4f95 <new_block+0xdc>
    4f85:	83 ec 0c             	sub    $0xc,%esp
    4f88:	68 89 02 00 00       	push   $0x289
    4f8d:	e8 fc ff ff ff       	call   4f8e <new_block+0xd5>
    4f92:	83 c4 10             	add    $0x10,%esp
    4f95:	80 7e 0c 01          	cmpb   $0x1,0xc(%esi)
    4f99:	74 10                	je     4fab <new_block+0xf2>
    4f9b:	83 ec 0c             	sub    $0xc,%esp
    4f9e:	68 a5 02 00 00       	push   $0x2a5
    4fa3:	e8 fc ff ff ff       	call   4fa4 <new_block+0xeb>
    4fa8:	83 c4 10             	add    $0x10,%esp
    4fab:	8b 3e                	mov    (%esi),%edi
    4fad:	b9 00 01 00 00       	mov    $0x100,%ecx
    4fb2:	b8 00 00 00 00       	mov    $0x0,%eax
    4fb7:	fc                   	cld    
    4fb8:	f3 ab                	rep stos %eax,%es:(%edi)
    4fba:	c6 46 0a 01          	movb   $0x1,0xa(%esi)
    4fbe:	c6 46 0b 01          	movb   $0x1,0xb(%esi)
    4fc2:	83 ec 0c             	sub    $0xc,%esp
    4fc5:	56                   	push   %esi
    4fc6:	e8 fc ff ff ff       	call   4fc7 <new_block+0x10e>
    4fcb:	83 c4 10             	add    $0x10,%esp
    4fce:	89 d8                	mov    %ebx,%eax
    4fd0:	eb 1d                	jmp    4fef <new_block+0x136>
    4fd2:	b8 00 00 00 00       	mov    $0x0,%eax
    4fd7:	eb 16                	jmp    4fef <new_block+0x136>
    4fd9:	b8 00 00 00 00       	mov    $0x0,%eax
    4fde:	eb 0f                	jmp    4fef <new_block+0x136>
    4fe0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4fe4:	83 fb 07             	cmp    $0x7,%ebx
    4fe7:	0f 8e 42 ff ff ff    	jle    4f2f <new_block+0x76>
    4fed:	eb ea                	jmp    4fd9 <new_block+0x120>
    4fef:	83 c4 1c             	add    $0x1c,%esp
    4ff2:	5b                   	pop    %ebx
    4ff3:	5e                   	pop    %esi
    4ff4:	5f                   	pop    %edi
    4ff5:	5d                   	pop    %ebp
    4ff6:	c3                   	ret    

00004ff7 <free_inode>:
    4ff7:	57                   	push   %edi
    4ff8:	53                   	push   %ebx
    4ff9:	83 ec 04             	sub    $0x4,%esp
    4ffc:	8b 7c 24 10          	mov    0x10(%esp),%edi
    5000:	85 ff                	test   %edi,%edi
    5002:	0f 84 f9 00 00 00    	je     5101 <free_inode+0x10a>
    5008:	66 83 7f 2c 00       	cmpw   $0x0,0x2c(%edi)
    500d:	75 11                	jne    5020 <free_inode+0x29>
    500f:	b9 38 00 00 00       	mov    $0x38,%ecx
    5014:	b0 00                	mov    $0x0,%al
    5016:	fc                   	cld    
    5017:	57                   	push   %edi
    5018:	f3 aa                	rep stos %al,%es:(%edi)
    501a:	5f                   	pop    %edi
    501b:	e9 e1 00 00 00       	jmp    5101 <free_inode+0x10a>
    5020:	8b 47 30             	mov    0x30(%edi),%eax
    5023:	66 83 f8 01          	cmp    $0x1,%ax
    5027:	76 20                	jbe    5049 <free_inode+0x52>
    5029:	83 ec 08             	sub    $0x8,%esp
    502c:	0f b7 c0             	movzwl %ax,%eax
    502f:	50                   	push   %eax
    5030:	68 68 03 00 00       	push   $0x368
    5035:	e8 fc ff ff ff       	call   5036 <free_inode+0x3f>
    503a:	c7 04 24 be 02 00 00 	movl   $0x2be,(%esp)
    5041:	e8 fc ff ff ff       	call   5042 <free_inode+0x4b>
    5046:	83 c4 10             	add    $0x10,%esp
    5049:	80 7f 0d 00          	cmpb   $0x0,0xd(%edi)
    504d:	74 10                	je     505f <free_inode+0x68>
    504f:	83 ec 0c             	sub    $0xc,%esp
    5052:	68 8c 03 00 00       	push   $0x38c
    5057:	e8 fc ff ff ff       	call   5058 <free_inode+0x61>
    505c:	83 c4 10             	add    $0x10,%esp
    505f:	83 ec 0c             	sub    $0xc,%esp
    5062:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    5066:	50                   	push   %eax
    5067:	e8 fc ff ff ff       	call   5068 <free_inode+0x71>
    506c:	89 c3                	mov    %eax,%ebx
    506e:	83 c4 10             	add    $0x10,%esp
    5071:	85 c0                	test   %eax,%eax
    5073:	75 10                	jne    5085 <free_inode+0x8e>
    5075:	83 ec 0c             	sub    $0xc,%esp
    5078:	68 ac 03 00 00       	push   $0x3ac
    507d:	e8 fc ff ff ff       	call   507e <free_inode+0x87>
    5082:	83 c4 10             	add    $0x10,%esp
    5085:	66 8b 47 2e          	mov    0x2e(%edi),%ax
    5089:	66 85 c0             	test   %ax,%ax
    508c:	74 05                	je     5093 <free_inode+0x9c>
    508e:	66 3b 03             	cmp    (%ebx),%ax
    5091:	76 10                	jbe    50a3 <free_inode+0xac>
    5093:	83 ec 0c             	sub    $0xc,%esp
    5096:	68 d8 03 00 00       	push   $0x3d8
    509b:	e8 fc ff ff ff       	call   509c <free_inode+0xa5>
    50a0:	83 c4 10             	add    $0x10,%esp
    50a3:	66 8b 47 2e          	mov    0x2e(%edi),%ax
    50a7:	66 c1 e8 0d          	shr    $0xd,%ax
    50ab:	0f b7 c0             	movzwl %ax,%eax
    50ae:	8b 5c 83 14          	mov    0x14(%ebx,%eax,4),%ebx
    50b2:	85 db                	test   %ebx,%ebx
    50b4:	75 10                	jne    50c6 <free_inode+0xcf>
    50b6:	83 ec 0c             	sub    $0xc,%esp
    50b9:	68 04 04 00 00       	push   $0x404
    50be:	e8 fc ff ff ff       	call   50bf <free_inode+0xc8>
    50c3:	83 c4 10             	add    $0x10,%esp
    50c6:	66 8b 57 2e          	mov    0x2e(%edi),%dx
    50ca:	81 e2 ff 1f 00 00    	and    $0x1fff,%edx
    50d0:	8b 0b                	mov    (%ebx),%ecx
    50d2:	b8 00 00 00 00       	mov    $0x0,%eax
    50d7:	0f b3 11             	btr    %edx,(%ecx)
    50da:	0f 93 c0             	setae  %al
    50dd:	85 c0                	test   %eax,%eax
    50df:	74 10                	je     50f1 <free_inode+0xfa>
    50e1:	83 ec 0c             	sub    $0xc,%esp
    50e4:	68 24 04 00 00       	push   $0x424
    50e9:	e8 fc ff ff ff       	call   50ea <free_inode+0xf3>
    50ee:	83 c4 10             	add    $0x10,%esp
    50f1:	c6 43 0b 01          	movb   $0x1,0xb(%ebx)
    50f5:	b9 38 00 00 00       	mov    $0x38,%ecx
    50fa:	b0 00                	mov    $0x0,%al
    50fc:	fc                   	cld    
    50fd:	57                   	push   %edi
    50fe:	f3 aa                	rep stos %al,%es:(%edi)
    5100:	5f                   	pop    %edi
    5101:	83 c4 04             	add    $0x4,%esp
    5104:	5b                   	pop    %ebx
    5105:	5f                   	pop    %edi
    5106:	c3                   	ret    

00005107 <new_inode>:
    5107:	55                   	push   %ebp
    5108:	57                   	push   %edi
    5109:	56                   	push   %esi
    510a:	53                   	push   %ebx
    510b:	83 ec 1c             	sub    $0x1c,%esp
    510e:	e8 fc ff ff ff       	call   510f <new_inode+0x8>
    5113:	85 c0                	test   %eax,%eax
    5115:	0f 84 41 01 00 00    	je     525c <new_inode+0x155>
    511b:	89 c5                	mov    %eax,%ebp
    511d:	83 ec 0c             	sub    $0xc,%esp
    5120:	ff 74 24 3c          	pushl  0x3c(%esp)
    5124:	e8 fc ff ff ff       	call   5125 <new_inode+0x1e>
    5129:	89 44 24 18          	mov    %eax,0x18(%esp)
    512d:	83 c4 10             	add    $0x10,%esp
    5130:	85 c0                	test   %eax,%eax
    5132:	75 10                	jne    5144 <new_inode+0x3d>
    5134:	83 ec 0c             	sub    $0xc,%esp
    5137:	68 c9 02 00 00       	push   $0x2c9
    513c:	e8 fc ff ff ff       	call   513d <new_inode+0x36>
    5141:	83 c4 10             	add    $0x10,%esp
    5144:	be 00 20 00 00       	mov    $0x2000,%esi
    5149:	bb 00 00 00 00       	mov    $0x0,%ebx
    514e:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    5152:	8b 6c 24 08          	mov    0x8(%esp),%ebp
    5156:	8b 7c 9d 14          	mov    0x14(%ebp,%ebx,4),%edi
    515a:	85 ff                	test   %edi,%edi
    515c:	74 2e                	je     518c <new_inode+0x85>
    515e:	8b 37                	mov    (%edi),%esi
    5160:	b9 00 00 00 00       	mov    $0x0,%ecx
    5165:	fc                   	cld    
    5166:	56                   	push   %esi
    5167:	ad                   	lods   %ds:(%esi),%eax
    5168:	f7 d0                	not    %eax
    516a:	0f bc d0             	bsf    %eax,%edx
    516d:	74 05                	je     5174 <new_inode+0x6d>
    516f:	01 d1                	add    %edx,%ecx
    5171:	5e                   	pop    %esi
    5172:	eb 0e                	jmp    5182 <new_inode+0x7b>
    5174:	83 c1 20             	add    $0x20,%ecx
    5177:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
    517d:	7c e8                	jl     5167 <new_inode+0x60>
    517f:	83 c4 04             	add    $0x4,%esp
    5182:	89 ce                	mov    %ecx,%esi
    5184:	81 f9 ff 1f 00 00    	cmp    $0x1fff,%ecx
    518a:	7e 18                	jle    51a4 <new_inode+0x9d>
    518c:	43                   	inc    %ebx
    518d:	83 fb 08             	cmp    $0x8,%ebx
    5190:	75 c4                	jne    5156 <new_inode+0x4f>
    5192:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    5196:	85 ff                	test   %edi,%edi
    5198:	74 20                	je     51ba <new_inode+0xb3>
    519a:	81 fe ff 1f 00 00    	cmp    $0x1fff,%esi
    51a0:	7f 18                	jg     51ba <new_inode+0xb3>
    51a2:	eb 04                	jmp    51a8 <new_inode+0xa1>
    51a4:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
    51a8:	89 d8                	mov    %ebx,%eax
    51aa:	c1 e0 0d             	shl    $0xd,%eax
    51ad:	01 f0                	add    %esi,%eax
    51af:	8b 54 24 08          	mov    0x8(%esp),%edx
    51b3:	0f b7 12             	movzwl (%edx),%edx
    51b6:	39 d0                	cmp    %edx,%eax
    51b8:	7e 16                	jle    51d0 <new_inode+0xc9>
    51ba:	83 ec 0c             	sub    $0xc,%esp
    51bd:	55                   	push   %ebp
    51be:	e8 fc ff ff ff       	call   51bf <new_inode+0xb8>
    51c3:	83 c4 10             	add    $0x10,%esp
    51c6:	b8 00 00 00 00       	mov    $0x0,%eax
    51cb:	e9 91 00 00 00       	jmp    5261 <new_inode+0x15a>
    51d0:	8b 17                	mov    (%edi),%edx
    51d2:	b8 00 00 00 00       	mov    $0x0,%eax
    51d7:	0f ab 32             	bts    %esi,(%edx)
    51da:	0f 92 c0             	setb   %al
    51dd:	85 c0                	test   %eax,%eax
    51df:	74 10                	je     51f1 <new_inode+0xea>
    51e1:	83 ec 0c             	sub    $0xc,%esp
    51e4:	68 e7 02 00 00       	push   $0x2e7
    51e9:	e8 fc ff ff ff       	call   51ea <new_inode+0xe3>
    51ee:	83 c4 10             	add    $0x10,%esp
    51f1:	c6 47 0b 01          	movb   $0x1,0xb(%edi)
    51f5:	66 c7 45 30 01 00    	movw   $0x1,0x30(%ebp)
    51fb:	c6 45 0d 01          	movb   $0x1,0xd(%ebp)
    51ff:	8b 44 24 30          	mov    0x30(%esp),%eax
    5203:	66 89 45 2c          	mov    %ax,0x2c(%ebp)
    5207:	a1 00 00 00 00       	mov    0x0,%eax
    520c:	66 8b 80 42 02 00 00 	mov    0x242(%eax),%ax
    5213:	66 89 45 02          	mov    %ax,0x2(%ebp)
    5217:	a1 00 00 00 00       	mov    0x0,%eax
    521c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
    5222:	88 45 0c             	mov    %al,0xc(%ebp)
    5225:	c6 45 33 01          	movb   $0x1,0x33(%ebp)
    5229:	c1 e3 0d             	shl    $0xd,%ebx
    522c:	01 f3                	add    %esi,%ebx
    522e:	66 89 5d 2e          	mov    %bx,0x2e(%ebp)
    5232:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    5238:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    523d:	f7 e9                	imul   %ecx
    523f:	89 d0                	mov    %edx,%eax
    5241:	c1 f8 05             	sar    $0x5,%eax
    5244:	c1 f9 1f             	sar    $0x1f,%ecx
    5247:	29 c8                	sub    %ecx,%eax
    5249:	03 05 00 00 00 00    	add    0x0,%eax
    524f:	89 45 28             	mov    %eax,0x28(%ebp)
    5252:	89 45 24             	mov    %eax,0x24(%ebp)
    5255:	89 45 08             	mov    %eax,0x8(%ebp)
    5258:	89 e8                	mov    %ebp,%eax
    525a:	eb 05                	jmp    5261 <new_inode+0x15a>
    525c:	b8 00 00 00 00       	mov    $0x0,%eax
    5261:	83 c4 1c             	add    $0x1c,%esp
    5264:	5b                   	pop    %ebx
    5265:	5e                   	pop    %esi
    5266:	5f                   	pop    %edi
    5267:	5d                   	pop    %ebp
    5268:	c3                   	ret    

00005269 <dupfd>:
    5269:	83 f8 13             	cmp    $0x13,%eax
    526c:	77 3b                	ja     52a9 <dupfd+0x40>
    526e:	56                   	push   %esi
    526f:	53                   	push   %ebx
    5270:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    5276:	8b 84 83 80 02 00 00 	mov    0x280(%ebx,%eax,4),%eax
    527d:	85 c0                	test   %eax,%eax
    527f:	74 2e                	je     52af <dupfd+0x46>
    5281:	83 fa 13             	cmp    $0x13,%edx
    5284:	77 30                	ja     52b6 <dupfd+0x4d>
    5286:	83 bc 93 80 02 00 00 	cmpl   $0x0,0x280(%ebx,%edx,4)
    528d:	00 
    528e:	75 0c                	jne    529c <dupfd+0x33>
    5290:	eb 2b                	jmp    52bd <dupfd+0x54>
    5292:	83 bc 93 80 02 00 00 	cmpl   $0x0,0x280(%ebx,%edx,4)
    5299:	00 
    529a:	74 21                	je     52bd <dupfd+0x54>
    529c:	42                   	inc    %edx
    529d:	83 fa 14             	cmp    $0x14,%edx
    52a0:	75 f0                	jne    5292 <dupfd+0x29>
    52a2:	b8 e8 ff ff ff       	mov    $0xffffffe8,%eax
    52a7:	eb 30                	jmp    52d9 <dupfd+0x70>
    52a9:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    52ae:	c3                   	ret    
    52af:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    52b4:	eb 23                	jmp    52d9 <dupfd+0x70>
    52b6:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    52bb:	eb 1c                	jmp    52d9 <dupfd+0x70>
    52bd:	be fe ff ff ff       	mov    $0xfffffffe,%esi
    52c2:	88 d1                	mov    %dl,%cl
    52c4:	d3 c6                	rol    %cl,%esi
    52c6:	21 b3 7c 02 00 00    	and    %esi,0x27c(%ebx)
    52cc:	89 84 93 80 02 00 00 	mov    %eax,0x280(%ebx,%edx,4)
    52d3:	66 ff 40 04          	incw   0x4(%eax)
    52d7:	89 d0                	mov    %edx,%eax
    52d9:	5b                   	pop    %ebx
    52da:	5e                   	pop    %esi
    52db:	c3                   	ret    

000052dc <sys_dup2>:
    52dc:	53                   	push   %ebx
    52dd:	83 ec 14             	sub    $0x14,%esp
    52e0:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    52e4:	53                   	push   %ebx
    52e5:	e8 fc ff ff ff       	call   52e6 <sys_dup2+0xa>
    52ea:	89 da                	mov    %ebx,%edx
    52ec:	8b 44 24 20          	mov    0x20(%esp),%eax
    52f0:	e8 74 ff ff ff       	call   5269 <dupfd>
    52f5:	83 c4 18             	add    $0x18,%esp
    52f8:	5b                   	pop    %ebx
    52f9:	c3                   	ret    

000052fa <sys_dup>:
    52fa:	ba 00 00 00 00       	mov    $0x0,%edx
    52ff:	8b 44 24 04          	mov    0x4(%esp),%eax
    5303:	e8 61 ff ff ff       	call   5269 <dupfd>
    5308:	c3                   	ret    

00005309 <sys_fcntl>:
    5309:	53                   	push   %ebx
    530a:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    530e:	8b 44 24 0c          	mov    0xc(%esp),%eax
    5312:	83 f9 13             	cmp    $0x13,%ecx
    5315:	0f 87 91 00 00 00    	ja     53ac <sys_fcntl+0xa3>
    531b:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    5321:	8b 94 8b 80 02 00 00 	mov    0x280(%ebx,%ecx,4),%edx
    5328:	85 d2                	test   %edx,%edx
    532a:	0f 84 83 00 00 00    	je     53b3 <sys_fcntl+0xaa>
    5330:	83 f8 04             	cmp    $0x4,%eax
    5333:	0f 87 81 00 00 00    	ja     53ba <sys_fcntl+0xb1>
    5339:	ff 24 85 20 00 00 00 	jmp    *0x20(,%eax,4)
    5340:	8b 54 24 10          	mov    0x10(%esp),%edx
    5344:	89 c8                	mov    %ecx,%eax
    5346:	e8 1e ff ff ff       	call   5269 <dupfd>
    534b:	eb 72                	jmp    53bf <sys_fcntl+0xb6>
    534d:	8b 83 7c 02 00 00    	mov    0x27c(%ebx),%eax
    5353:	d3 e8                	shr    %cl,%eax
    5355:	83 e0 01             	and    $0x1,%eax
    5358:	eb 65                	jmp    53bf <sys_fcntl+0xb6>
    535a:	f6 44 24 10 01       	testb  $0x1,0x10(%esp)
    535f:	74 14                	je     5375 <sys_fcntl+0x6c>
    5361:	b8 01 00 00 00       	mov    $0x1,%eax
    5366:	d3 e0                	shl    %cl,%eax
    5368:	09 83 7c 02 00 00    	or     %eax,0x27c(%ebx)
    536e:	b8 00 00 00 00       	mov    $0x0,%eax
    5373:	eb 4a                	jmp    53bf <sys_fcntl+0xb6>
    5375:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
    537a:	d3 c0                	rol    %cl,%eax
    537c:	21 83 7c 02 00 00    	and    %eax,0x27c(%ebx)
    5382:	b8 00 00 00 00       	mov    $0x0,%eax
    5387:	eb 36                	jmp    53bf <sys_fcntl+0xb6>
    5389:	0f b7 42 02          	movzwl 0x2(%edx),%eax
    538d:	eb 30                	jmp    53bf <sys_fcntl+0xb6>
    538f:	66 8b 4a 02          	mov    0x2(%edx),%cx
    5393:	80 e5 f3             	and    $0xf3,%ch
    5396:	8b 44 24 10          	mov    0x10(%esp),%eax
    539a:	25 00 0c 00 00       	and    $0xc00,%eax
    539f:	09 c8                	or     %ecx,%eax
    53a1:	66 89 42 02          	mov    %ax,0x2(%edx)
    53a5:	b8 00 00 00 00       	mov    $0x0,%eax
    53aa:	eb 13                	jmp    53bf <sys_fcntl+0xb6>
    53ac:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    53b1:	eb 0c                	jmp    53bf <sys_fcntl+0xb6>
    53b3:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    53b8:	eb 05                	jmp    53bf <sys_fcntl+0xb6>
    53ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    53bf:	5b                   	pop    %ebx
    53c0:	c3                   	ret    

000053c1 <sys_ioctl>:
    53c1:	83 ec 0c             	sub    $0xc,%esp
    53c4:	8b 44 24 10          	mov    0x10(%esp),%eax
    53c8:	83 f8 13             	cmp    $0x13,%eax
    53cb:	77 4d                	ja     541a <sys_ioctl+0x59>
    53cd:	8b 15 00 00 00 00    	mov    0x0,%edx
    53d3:	8b 84 82 80 02 00 00 	mov    0x280(%edx,%eax,4),%eax
    53da:	85 c0                	test   %eax,%eax
    53dc:	74 43                	je     5421 <sys_ioctl+0x60>
    53de:	8b 50 08             	mov    0x8(%eax),%edx
    53e1:	8b 02                	mov    (%edx),%eax
    53e3:	25 00 b0 ff ff       	and    $0xffffb000,%eax
    53e8:	66 3d 00 20          	cmp    $0x2000,%ax
    53ec:	75 3a                	jne    5428 <sys_ioctl+0x67>
    53ee:	0f b7 52 0e          	movzwl 0xe(%edx),%edx
    53f2:	89 d0                	mov    %edx,%eax
    53f4:	c1 e8 08             	shr    $0x8,%eax
    53f7:	83 f8 07             	cmp    $0x7,%eax
    53fa:	77 33                	ja     542f <sys_ioctl+0x6e>
    53fc:	8b 04 85 40 00 00 00 	mov    0x40(,%eax,4),%eax
    5403:	85 c0                	test   %eax,%eax
    5405:	74 2f                	je     5436 <sys_ioctl+0x75>
    5407:	83 ec 04             	sub    $0x4,%esp
    540a:	ff 74 24 1c          	pushl  0x1c(%esp)
    540e:	ff 74 24 1c          	pushl  0x1c(%esp)
    5412:	52                   	push   %edx
    5413:	ff d0                	call   *%eax
    5415:	83 c4 10             	add    $0x10,%esp
    5418:	eb 21                	jmp    543b <sys_ioctl+0x7a>
    541a:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    541f:	eb 1a                	jmp    543b <sys_ioctl+0x7a>
    5421:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
    5426:	eb 13                	jmp    543b <sys_ioctl+0x7a>
    5428:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    542d:	eb 0c                	jmp    543b <sys_ioctl+0x7a>
    542f:	b8 ed ff ff ff       	mov    $0xffffffed,%eax
    5434:	eb 05                	jmp    543b <sys_ioctl+0x7a>
    5436:	b8 e7 ff ff ff       	mov    $0xffffffe7,%eax
    543b:	83 c4 0c             	add    $0xc,%esp
    543e:	c3                   	ret    

0000543f <free_ind>:
    543f:	85 d2                	test   %edx,%edx
    5441:	74 67                	je     54aa <free_ind+0x6b>
    5443:	55                   	push   %ebp
    5444:	57                   	push   %edi
    5445:	56                   	push   %esi
    5446:	53                   	push   %ebx
    5447:	83 ec 24             	sub    $0x24,%esp
    544a:	89 54 24 14          	mov    %edx,0x14(%esp)
    544e:	89 c7                	mov    %eax,%edi
    5450:	ff 74 24 14          	pushl  0x14(%esp)
    5454:	50                   	push   %eax
    5455:	e8 fc ff ff ff       	call   5456 <free_ind+0x17>
    545a:	89 c5                	mov    %eax,%ebp
    545c:	83 c4 10             	add    $0x10,%esp
    545f:	85 c0                	test   %eax,%eax
    5461:	74 33                	je     5496 <free_ind+0x57>
    5463:	8b 18                	mov    (%eax),%ebx
    5465:	8d b3 00 04 00 00    	lea    0x400(%ebx),%esi
    546b:	66 8b 03             	mov    (%ebx),%ax
    546e:	66 85 c0             	test   %ax,%ax
    5471:	74 10                	je     5483 <free_ind+0x44>
    5473:	83 ec 08             	sub    $0x8,%esp
    5476:	0f b7 c0             	movzwl %ax,%eax
    5479:	50                   	push   %eax
    547a:	57                   	push   %edi
    547b:	e8 fc ff ff ff       	call   547c <free_ind+0x3d>
    5480:	83 c4 10             	add    $0x10,%esp
    5483:	83 c3 02             	add    $0x2,%ebx
    5486:	39 de                	cmp    %ebx,%esi
    5488:	75 e1                	jne    546b <free_ind+0x2c>
    548a:	83 ec 0c             	sub    $0xc,%esp
    548d:	55                   	push   %ebp
    548e:	e8 fc ff ff ff       	call   548f <free_ind+0x50>
    5493:	83 c4 10             	add    $0x10,%esp
    5496:	83 ec 08             	sub    $0x8,%esp
    5499:	ff 74 24 14          	pushl  0x14(%esp)
    549d:	57                   	push   %edi
    549e:	e8 fc ff ff ff       	call   549f <free_ind+0x60>
    54a3:	83 c4 2c             	add    $0x2c,%esp
    54a6:	5b                   	pop    %ebx
    54a7:	5e                   	pop    %esi
    54a8:	5f                   	pop    %edi
    54a9:	5d                   	pop    %ebp
    54aa:	c3                   	ret    

000054ab <truncate>:
    54ab:	55                   	push   %ebp
    54ac:	57                   	push   %edi
    54ad:	56                   	push   %esi
    54ae:	53                   	push   %ebx
    54af:	83 ec 1c             	sub    $0x1c,%esp
    54b2:	8b 7c 24 30          	mov    0x30(%esp),%edi
    54b6:	8b 07                	mov    (%edi),%eax
    54b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    54bd:	66 3d 00 80          	cmp    $0x8000,%ax
    54c1:	75 08                	jne    54cb <truncate+0x20>
    54c3:	8d 5f 0e             	lea    0xe(%edi),%ebx
    54c6:	8d 77 1c             	lea    0x1c(%edi),%esi
    54c9:	eb 0c                	jmp    54d7 <truncate+0x2c>
    54cb:	66 3d 00 40          	cmp    $0x4000,%ax
    54cf:	0f 85 d9 00 00 00    	jne    55ae <truncate+0x103>
    54d5:	eb ec                	jmp    54c3 <truncate+0x18>
    54d7:	66 8b 03             	mov    (%ebx),%ax
    54da:	66 85 c0             	test   %ax,%ax
    54dd:	74 19                	je     54f8 <truncate+0x4d>
    54df:	83 ec 08             	sub    $0x8,%esp
    54e2:	0f b7 c0             	movzwl %ax,%eax
    54e5:	50                   	push   %eax
    54e6:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    54ea:	50                   	push   %eax
    54eb:	e8 fc ff ff ff       	call   54ec <truncate+0x41>
    54f0:	66 c7 03 00 00       	movw   $0x0,(%ebx)
    54f5:	83 c4 10             	add    $0x10,%esp
    54f8:	83 c3 02             	add    $0x2,%ebx
    54fb:	39 de                	cmp    %ebx,%esi
    54fd:	75 d8                	jne    54d7 <truncate+0x2c>
    54ff:	0f b7 57 1c          	movzwl 0x1c(%edi),%edx
    5503:	0f b7 47 2c          	movzwl 0x2c(%edi),%eax
    5507:	e8 33 ff ff ff       	call   543f <free_ind>
    550c:	0f b7 47 1e          	movzwl 0x1e(%edi),%eax
    5510:	89 44 24 08          	mov    %eax,0x8(%esp)
    5514:	85 c0                	test   %eax,%eax
    5516:	74 5c                	je     5574 <truncate+0xc9>
    5518:	0f b7 6f 2c          	movzwl 0x2c(%edi),%ebp
    551c:	83 ec 08             	sub    $0x8,%esp
    551f:	ff 74 24 10          	pushl  0x10(%esp)
    5523:	55                   	push   %ebp
    5524:	e8 fc ff ff ff       	call   5525 <truncate+0x7a>
    5529:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    552d:	83 c4 10             	add    $0x10,%esp
    5530:	85 c0                	test   %eax,%eax
    5532:	74 30                	je     5564 <truncate+0xb9>
    5534:	8b 18                	mov    (%eax),%ebx
    5536:	8d b3 00 04 00 00    	lea    0x400(%ebx),%esi
    553c:	66 8b 13             	mov    (%ebx),%dx
    553f:	66 85 d2             	test   %dx,%dx
    5542:	74 0a                	je     554e <truncate+0xa3>
    5544:	0f b7 d2             	movzwl %dx,%edx
    5547:	89 e8                	mov    %ebp,%eax
    5549:	e8 f1 fe ff ff       	call   543f <free_ind>
    554e:	83 c3 02             	add    $0x2,%ebx
    5551:	39 de                	cmp    %ebx,%esi
    5553:	75 e7                	jne    553c <truncate+0x91>
    5555:	83 ec 0c             	sub    $0xc,%esp
    5558:	ff 74 24 18          	pushl  0x18(%esp)
    555c:	e8 fc ff ff ff       	call   555d <truncate+0xb2>
    5561:	83 c4 10             	add    $0x10,%esp
    5564:	83 ec 08             	sub    $0x8,%esp
    5567:	ff 74 24 10          	pushl  0x10(%esp)
    556b:	55                   	push   %ebp
    556c:	e8 fc ff ff ff       	call   556d <truncate+0xc2>
    5571:	83 c4 10             	add    $0x10,%esp
    5574:	66 c7 47 1e 00 00    	movw   $0x0,0x1e(%edi)
    557a:	66 c7 47 1c 00 00    	movw   $0x0,0x1c(%edi)
    5580:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
    5587:	c6 47 33 01          	movb   $0x1,0x33(%edi)
    558b:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    5591:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    5596:	f7 e9                	imul   %ecx
    5598:	89 d0                	mov    %edx,%eax
    559a:	c1 f8 05             	sar    $0x5,%eax
    559d:	c1 f9 1f             	sar    $0x1f,%ecx
    55a0:	29 c8                	sub    %ecx,%eax
    55a2:	03 05 00 00 00 00    	add    0x0,%eax
    55a8:	89 47 28             	mov    %eax,0x28(%edi)
    55ab:	89 47 08             	mov    %eax,0x8(%edi)
    55ae:	83 c4 1c             	add    $0x1c,%esp
    55b1:	5b                   	pop    %ebx
    55b2:	5e                   	pop    %esi
    55b3:	5f                   	pop    %edi
    55b4:	5d                   	pop    %ebp
    55b5:	c3                   	ret    
