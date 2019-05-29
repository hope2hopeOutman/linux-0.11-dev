
mm.o:     file format elf32-i386


Disassembly of section .text:

00000000 <recov_swap_linear>:
       0:	8b 44 24 04          	mov    0x4(%esp),%eax
       4:	85 c0                	test   %eax,%eax
       6:	74 0a                	je     12 <recov_swap_linear+0x12>
       8:	c1 e8 0c             	shr    $0xc,%eax
       b:	c6 80 00 80 fc ff 00 	movb   $0x0,-0x38000(%eax)
      12:	c3                   	ret    

00000013 <recov_swap_linear_addrs>:
      13:	57                   	push   %edi
      14:	56                   	push   %esi
      15:	53                   	push   %ebx
      16:	8b 7c 24 10          	mov    0x10(%esp),%edi
      1a:	8b 74 24 14          	mov    0x14(%esp),%esi
      1e:	85 f6                	test   %esi,%esi
      20:	7e 1a                	jle    3c <recov_swap_linear_addrs+0x29>
      22:	bb 00 00 00 00       	mov    $0x0,%ebx
      27:	8b 04 9f             	mov    (%edi,%ebx,4),%eax
      2a:	85 c0                	test   %eax,%eax
      2c:	74 09                	je     37 <recov_swap_linear_addrs+0x24>
      2e:	50                   	push   %eax
      2f:	e8 fc ff ff ff       	call   30 <recov_swap_linear_addrs+0x1d>
      34:	83 c4 04             	add    $0x4,%esp
      37:	43                   	inc    %ebx
      38:	39 de                	cmp    %ebx,%esi
      3a:	75 eb                	jne    27 <recov_swap_linear_addrs+0x14>
      3c:	5b                   	pop    %ebx
      3d:	5e                   	pop    %esi
      3e:	5f                   	pop    %edi
      3f:	c3                   	ret    

00000040 <reset_swap_table_entry>:
      40:	83 ec 0c             	sub    $0xc,%esp
      43:	e8 fc ff ff ff       	call   44 <reset_swap_table_entry+0x4>
      48:	8b 54 24 10          	mov    0x10(%esp),%edx
      4c:	c1 ea 14             	shr    $0x14,%edx
      4f:	03 90 04 03 00 00    	add    0x304(%eax),%edx
      55:	89 d0                	mov    %edx,%eax
      57:	25 fc 0f 00 00       	and    $0xffc,%eax
      5c:	8b 10                	mov    (%eax),%edx
      5e:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
      64:	8b 44 24 10          	mov    0x10(%esp),%eax
      68:	c1 e8 0a             	shr    $0xa,%eax
      6b:	25 fc 0f 00 00       	and    $0xffc,%eax
      70:	8b 4c 24 14          	mov    0x14(%esp),%ecx
      74:	83 c9 07             	or     $0x7,%ecx
      77:	89 0c 02             	mov    %ecx,(%edx,%eax,1)
      7a:	83 c4 0c             	add    $0xc,%esp
      7d:	c3                   	ret    

0000007e <remap_linear_addr>:
      7e:	56                   	push   %esi
      7f:	53                   	push   %ebx
      80:	83 ec 04             	sub    $0x4,%esp
      83:	e8 fc ff ff ff       	call   84 <remap_linear_addr+0x6>
      88:	89 c6                	mov    %eax,%esi
      8a:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0
      91:	74 59                	je     ec <remap_linear_addr+0x6e>
      93:	b8 01 00 00 00       	mov    $0x1,%eax
      98:	80 b8 00 00 00 00 00 	cmpb   $0x0,0x0(%eax)
      9f:	75 2c                	jne    cd <remap_linear_addr+0x4f>
      a1:	c6 80 00 00 00 00 01 	movb   $0x1,0x0(%eax)
      a8:	8d 98 00 80 03 00    	lea    0x38000(%eax),%ebx
      ae:	c1 e3 0c             	shl    $0xc,%ebx
      b1:	83 ec 08             	sub    $0x8,%esp
      b4:	8b 44 24 18          	mov    0x18(%esp),%eax
      b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      bd:	50                   	push   %eax
      be:	53                   	push   %ebx
      bf:	e8 fc ff ff ff       	call   c0 <remap_linear_addr+0x42>
      c4:	83 c4 10             	add    $0x10,%esp
      c7:	85 db                	test   %ebx,%ebx
      c9:	75 47                	jne    112 <remap_linear_addr+0x94>
      cb:	eb 08                	jmp    d5 <remap_linear_addr+0x57>
      cd:	40                   	inc    %eax
      ce:	3d 00 80 00 00       	cmp    $0x8000,%eax
      d3:	75 c3                	jne    98 <remap_linear_addr+0x1a>
      d5:	83 ec 0c             	sub    $0xc,%esp
      d8:	68 00 00 00 00       	push   $0x0
      dd:	e8 fc ff ff ff       	call   de <remap_linear_addr+0x60>
      e2:	83 c4 10             	add    $0x10,%esp
      e5:	bb 00 00 00 00       	mov    $0x0,%ebx
      ea:	eb 26                	jmp    112 <remap_linear_addr+0x94>
      ec:	c6 05 00 00 00 00 01 	movb   $0x1,0x0
      f3:	83 ec 08             	sub    $0x8,%esp
      f6:	8b 44 24 18          	mov    0x18(%esp),%eax
      fa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      ff:	50                   	push   %eax
     100:	68 00 00 00 38       	push   $0x38000000
     105:	e8 fc ff ff ff       	call   106 <remap_linear_addr+0x88>
     10a:	83 c4 10             	add    $0x10,%esp
     10d:	bb 00 00 00 38       	mov    $0x38000000,%ebx
     112:	8b 86 04 03 00 00    	mov    0x304(%esi),%eax
     118:	0f 22 d8             	mov    %eax,%cr3
     11b:	89 d8                	mov    %ebx,%eax
     11d:	83 c4 04             	add    $0x4,%esp
     120:	5b                   	pop    %ebx
     121:	5e                   	pop    %esi
     122:	c3                   	ret    

00000123 <check_remap_linear_addr>:
     123:	53                   	push   %ebx
     124:	83 ec 08             	sub    $0x8,%esp
     127:	81 3d 00 00 00 00 00 	cmpl   $0x40000,0x0
     12e:	00 04 00 
     131:	7e 37                	jle    16a <check_remap_linear_addr+0x47>
     133:	8b 44 24 10          	mov    0x10(%esp),%eax
     137:	8b 00                	mov    (%eax),%eax
     139:	3d ff ff ff 37       	cmp    $0x37ffffff,%eax
     13e:	76 31                	jbe    171 <check_remap_linear_addr+0x4e>
     140:	83 ec 0c             	sub    $0xc,%esp
     143:	50                   	push   %eax
     144:	e8 fc ff ff ff       	call   145 <check_remap_linear_addr+0x22>
     149:	89 c3                	mov    %eax,%ebx
     14b:	8b 44 24 20          	mov    0x20(%esp),%eax
     14f:	89 18                	mov    %ebx,(%eax)
     151:	83 c4 10             	add    $0x10,%esp
     154:	85 db                	test   %ebx,%ebx
     156:	75 1e                	jne    176 <check_remap_linear_addr+0x53>
     158:	83 ec 0c             	sub    $0xc,%esp
     15b:	68 20 00 00 00       	push   $0x20
     160:	e8 fc ff ff ff       	call   161 <check_remap_linear_addr+0x3e>
     165:	83 c4 10             	add    $0x10,%esp
     168:	eb 0c                	jmp    176 <check_remap_linear_addr+0x53>
     16a:	bb 00 00 00 00       	mov    $0x0,%ebx
     16f:	eb 05                	jmp    176 <check_remap_linear_addr+0x53>
     171:	bb 00 00 00 00       	mov    $0x0,%ebx
     176:	89 d8                	mov    %ebx,%eax
     178:	83 c4 08             	add    $0x8,%esp
     17b:	5b                   	pop    %ebx
     17c:	c3                   	ret    

0000017d <caching_linear_addr>:
     17d:	56                   	push   %esi
     17e:	53                   	push   %ebx
     17f:	83 ec 04             	sub    $0x4,%esp
     182:	8b 5c 24 14          	mov    0x14(%esp),%ebx
     186:	8b 74 24 18          	mov    0x18(%esp),%esi
     18a:	85 f6                	test   %esi,%esi
     18c:	74 52                	je     1e0 <caching_linear_addr+0x63>
     18e:	85 db                	test   %ebx,%ebx
     190:	7e 31                	jle    1c3 <caching_linear_addr+0x46>
     192:	8b 44 24 10          	mov    0x10(%esp),%eax
     196:	83 38 00             	cmpl   $0x0,(%eax)
     199:	75 17                	jne    1b2 <caching_linear_addr+0x35>
     19b:	eb 0d                	jmp    1aa <caching_linear_addr+0x2d>
     19d:	89 d0                	mov    %edx,%eax
     19f:	83 c2 04             	add    $0x4,%edx
     1a2:	83 7a fc 00          	cmpl   $0x0,-0x4(%edx)
     1a6:	75 16                	jne    1be <caching_linear_addr+0x41>
     1a8:	eb 04                	jmp    1ae <caching_linear_addr+0x31>
     1aa:	8b 44 24 10          	mov    0x10(%esp),%eax
     1ae:	89 30                	mov    %esi,(%eax)
     1b0:	eb 30                	jmp    1e2 <caching_linear_addr+0x65>
     1b2:	8b 44 24 10          	mov    0x10(%esp),%eax
     1b6:	8d 50 04             	lea    0x4(%eax),%edx
     1b9:	b9 00 00 00 00       	mov    $0x0,%ecx
     1be:	41                   	inc    %ecx
     1bf:	39 cb                	cmp    %ecx,%ebx
     1c1:	75 da                	jne    19d <caching_linear_addr+0x20>
     1c3:	83 ec 08             	sub    $0x8,%esp
     1c6:	53                   	push   %ebx
     1c7:	68 00 00 00 00       	push   $0x0
     1cc:	e8 fc ff ff ff       	call   1cd <caching_linear_addr+0x50>
     1d1:	c7 04 24 48 00 00 00 	movl   $0x48,(%esp)
     1d8:	e8 fc ff ff ff       	call   1d9 <caching_linear_addr+0x5c>
     1dd:	83 c4 10             	add    $0x10,%esp
     1e0:	89 f0                	mov    %esi,%eax
     1e2:	83 c4 04             	add    $0x4,%esp
     1e5:	5b                   	pop    %ebx
     1e6:	5e                   	pop    %esi
     1e7:	c3                   	ret    

000001e8 <get_free_page>:
     1e8:	57                   	push   %edi
     1e9:	53                   	push   %ebx
     1ea:	83 ec 10             	sub    $0x10,%esp
     1ed:	68 00 00 00 00       	push   $0x0
     1f2:	e8 fc ff ff ff       	call   1f3 <get_free_page+0xb>
     1f7:	a1 00 00 00 00       	mov    0x0,%eax
     1fc:	8d b8 ff ff ff ff    	lea    -0x1(%eax),%edi
     202:	8b 15 00 00 00 00    	mov    0x0,%edx
     208:	83 c4 10             	add    $0x10,%esp
     20b:	81 3d 00 00 00 00 00 	cmpl   $0x40000,0x0
     212:	00 04 00 
     215:	7e 28                	jle    23f <get_free_page+0x57>
     217:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
     21c:	74 11                	je     22f <get_free_page+0x47>
     21e:	bf 7f 00 00 00       	mov    $0x7f,%edi
     223:	b9 80 00 00 00       	mov    $0x80,%ecx
     228:	bb 00 80 03 00       	mov    $0x38000,%ebx
     22d:	eb 17                	jmp    246 <get_free_page+0x5e>
     22f:	8d 48 80             	lea    -0x80(%eax),%ecx
     232:	81 c2 00 00 08 00    	add    $0x80000,%edx
     238:	bb 00 80 03 00       	mov    $0x38000,%ebx
     23d:	eb 07                	jmp    246 <get_free_page+0x5e>
     23f:	89 c1                	mov    %eax,%ecx
     241:	bb 00 00 04 00       	mov    $0x40000,%ebx
     246:	b8 00 00 00 00       	mov    $0x0,%eax
     24b:	fd                   	std    
     24c:	f2 ae                	repnz scas %es:(%edi),%al
     24e:	75 44                	jne    294 <get_free_page+0xac>
     250:	c6 47 01 01          	movb   $0x1,0x1(%edi)
     254:	c1 e1 0c             	shl    $0xc,%ecx
     257:	01 d1                	add    %edx,%ecx
     259:	c1 e3 0c             	shl    $0xc,%ebx
     25c:	39 d9                	cmp    %ebx,%ecx
     25e:	7c 23                	jl     283 <get_free_page+0x9b>
     260:	51                   	push   %ecx
     261:	e8 fc ff ff ff       	call   262 <get_free_page+0x7a>
     266:	59                   	pop    %ecx
     267:	51                   	push   %ecx
     268:	50                   	push   %eax
     269:	89 c2                	mov    %eax,%edx
     26b:	31 c0                	xor    %eax,%eax
     26d:	b9 00 04 00 00       	mov    $0x400,%ecx
     272:	8d ba fc 0f 00 00    	lea    0xffc(%edx),%edi
     278:	f3 ab                	rep stos %eax,%es:(%edi)
     27a:	e8 fc ff ff ff       	call   27b <get_free_page+0x93>
     27f:	58                   	pop    %eax
     280:	58                   	pop    %eax
     281:	eb 11                	jmp    294 <get_free_page+0xac>
     283:	89 ca                	mov    %ecx,%edx
     285:	b9 00 04 00 00       	mov    $0x400,%ecx
     28a:	8d ba fc 0f 00 00    	lea    0xffc(%edx),%edi
     290:	f3 ab                	rep stos %eax,%es:(%edi)
     292:	89 d0                	mov    %edx,%eax
     294:	fc                   	cld    
     295:	ff 35 00 00 00 00    	pushl  0x0
     29b:	e8 fc ff ff ff       	call   29c <get_free_page+0xb4>
     2a0:	5b                   	pop    %ebx
     2a1:	83 c4 04             	add    $0x4,%esp
     2a4:	5b                   	pop    %ebx
     2a5:	5f                   	pop    %edi
     2a6:	c3                   	ret    

000002a7 <free_page>:
     2a7:	53                   	push   %ebx
     2a8:	83 ec 08             	sub    $0x8,%esp
     2ab:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     2af:	3b 1d 00 00 00 00    	cmp    0x0,%ebx
     2b5:	72 6e                	jb     325 <free_page+0x7e>
     2b7:	a1 00 00 00 00       	mov    0x0,%eax
     2bc:	39 c3                	cmp    %eax,%ebx
     2be:	72 1e                	jb     2de <free_page+0x37>
     2c0:	83 ec 04             	sub    $0x4,%esp
     2c3:	50                   	push   %eax
     2c4:	53                   	push   %ebx
     2c5:	68 6c 00 00 00       	push   $0x6c
     2ca:	e8 fc ff ff ff       	call   2cb <free_page+0x24>
     2cf:	c7 04 24 94 00 00 00 	movl   $0x94,(%esp)
     2d6:	e8 fc ff ff ff       	call   2d7 <free_page+0x30>
     2db:	83 c4 10             	add    $0x10,%esp
     2de:	89 d8                	mov    %ebx,%eax
     2e0:	2b 05 00 00 00 00    	sub    0x0,%eax
     2e6:	c1 e8 0c             	shr    $0xc,%eax
     2e9:	8a 90 00 00 00 00    	mov    0x0(%eax),%dl
     2ef:	84 d2                	test   %dl,%dl
     2f1:	74 0e                	je     301 <free_page+0x5a>
     2f3:	4a                   	dec    %edx
     2f4:	88 90 00 00 00 00    	mov    %dl,0x0(%eax)
     2fa:	b8 01 00 00 00       	mov    $0x1,%eax
     2ff:	eb 29                	jmp    32a <free_page+0x83>
     301:	83 ec 08             	sub    $0x8,%esp
     304:	53                   	push   %ebx
     305:	68 18 00 00 00       	push   $0x18
     30a:	e8 fc ff ff ff       	call   30b <free_page+0x64>
     30f:	c7 04 24 31 00 00 00 	movl   $0x31,(%esp)
     316:	e8 fc ff ff ff       	call   317 <free_page+0x70>
     31b:	83 c4 10             	add    $0x10,%esp
     31e:	b8 00 00 00 00       	mov    $0x0,%eax
     323:	eb 05                	jmp    32a <free_page+0x83>
     325:	b8 01 00 00 00       	mov    $0x1,%eax
     32a:	83 c4 08             	add    $0x8,%esp
     32d:	5b                   	pop    %ebx
     32e:	c3                   	ret    

0000032f <free_page_tables>:
     32f:	55                   	push   %ebp
     330:	57                   	push   %edi
     331:	56                   	push   %esi
     332:	53                   	push   %ebx
     333:	83 ec 2c             	sub    $0x2c,%esp
     336:	8b 74 24 40          	mov    0x40(%esp),%esi
     33a:	8b 5c 24 48          	mov    0x48(%esp),%ebx
     33e:	e8 fc ff ff ff       	call   33f <free_page_tables+0x10>
     343:	89 44 24 0c          	mov    %eax,0xc(%esp)
     347:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     34e:	00 
     34f:	f7 c6 ff ff 3f 00    	test   $0x3fffff,%esi
     355:	74 10                	je     367 <free_page_tables+0x38>
     357:	83 ec 0c             	sub    $0xc,%esp
     35a:	68 b4 00 00 00       	push   $0xb4
     35f:	e8 fc ff ff ff       	call   360 <free_page_tables+0x31>
     364:	83 c4 10             	add    $0x10,%esp
     367:	85 f6                	test   %esi,%esi
     369:	75 2c                	jne    397 <free_page_tables+0x68>
     36b:	83 ec 04             	sub    $0x4,%esp
     36e:	8b 44 24 10          	mov    0x10(%esp),%eax
     372:	ff b0 30 02 00 00    	pushl  0x230(%eax)
     378:	ff b0 2c 02 00 00    	pushl  0x22c(%eax)
     37e:	68 e4 00 00 00       	push   $0xe4
     383:	e8 fc ff ff ff       	call   384 <free_page_tables+0x55>
     388:	c7 04 24 0c 01 00 00 	movl   $0x10c,(%esp)
     38f:	e8 fc ff ff ff       	call   390 <free_page_tables+0x61>
     394:	83 c4 10             	add    $0x10,%esp
     397:	8b bb 04 03 00 00    	mov    0x304(%ebx),%edi
     39d:	8d b7 00 04 00 00    	lea    0x400(%edi),%esi
     3a3:	3b 1d 00 00 00 00    	cmp    0x0,%ebx
     3a9:	74 08                	je     3b3 <free_page_tables+0x84>
     3ab:	3b 1d 04 00 00 00    	cmp    0x4,%ebx
     3b1:	75 10                	jne    3c3 <free_page_tables+0x94>
     3b3:	83 ec 0c             	sub    $0xc,%esp
     3b6:	68 34 01 00 00       	push   $0x134
     3bb:	e8 fc ff ff ff       	call   3bc <free_page_tables+0x8d>
     3c0:	83 c4 10             	add    $0x10,%esp
     3c3:	81 c7 00 10 00 00    	add    $0x1000,%edi
     3c9:	8d 6c 24 18          	lea    0x18(%esp),%ebp
     3cd:	8b 06                	mov    (%esi),%eax
     3cf:	a8 01                	test   $0x1,%al
     3d1:	0f 84 c2 00 00 00    	je     499 <free_page_tables+0x16a>
     3d7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     3dc:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     3e0:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     3e7:	00 
     3e8:	83 ec 0c             	sub    $0xc,%esp
     3eb:	8d 44 24 28          	lea    0x28(%esp),%eax
     3ef:	50                   	push   %eax
     3f0:	e8 fc ff ff ff       	call   3f1 <free_page_tables+0xc2>
     3f5:	83 c4 0c             	add    $0xc,%esp
     3f8:	50                   	push   %eax
     3f9:	6a 01                	push   $0x1
     3fb:	55                   	push   %ebp
     3fc:	e8 fc ff ff ff       	call   3fd <free_page_tables+0xce>
     401:	83 c4 10             	add    $0x10,%esp
     404:	bb 00 04 00 00       	mov    $0x400,%ebx
     409:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     40d:	8b 00                	mov    (%eax),%eax
     40f:	3b 05 00 00 00 00    	cmp    0x0,%eax
     415:	72 35                	jb     44c <free_page_tables+0x11d>
     417:	83 ec 0c             	sub    $0xc,%esp
     41a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     41f:	50                   	push   %eax
     420:	e8 fc ff ff ff       	call   421 <free_page_tables+0xf2>
     425:	83 c4 10             	add    $0x10,%esp
     428:	85 c0                	test   %eax,%eax
     42a:	75 20                	jne    44c <free_page_tables+0x11d>
     42c:	83 ec 08             	sub    $0x8,%esp
     42f:	ff 74 24 24          	pushl  0x24(%esp)
     433:	68 4a 00 00 00       	push   $0x4a
     438:	e8 fc ff ff ff       	call   439 <free_page_tables+0x10a>
     43d:	c7 04 24 68 01 00 00 	movl   $0x168,(%esp)
     444:	e8 fc ff ff ff       	call   445 <free_page_tables+0x116>
     449:	83 c4 10             	add    $0x10,%esp
     44c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     450:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     456:	83 44 24 1c 04       	addl   $0x4,0x1c(%esp)
     45b:	4b                   	dec    %ebx
     45c:	75 ab                	jne    409 <free_page_tables+0xda>
     45e:	83 ec 0c             	sub    $0xc,%esp
     461:	8b 06                	mov    (%esi),%eax
     463:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     468:	50                   	push   %eax
     469:	e8 fc ff ff ff       	call   46a <free_page_tables+0x13b>
     46e:	83 c4 10             	add    $0x10,%esp
     471:	85 c0                	test   %eax,%eax
     473:	75 10                	jne    485 <free_page_tables+0x156>
     475:	83 ec 0c             	sub    $0xc,%esp
     478:	68 94 01 00 00       	push   $0x194
     47d:	e8 fc ff ff ff       	call   47e <free_page_tables+0x14f>
     482:	83 c4 10             	add    $0x10,%esp
     485:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
     48b:	83 ec 08             	sub    $0x8,%esp
     48e:	6a 01                	push   $0x1
     490:	55                   	push   %ebp
     491:	e8 fc ff ff ff       	call   492 <free_page_tables+0x163>
     496:	83 c4 10             	add    $0x10,%esp
     499:	83 c6 04             	add    $0x4,%esi
     49c:	39 f7                	cmp    %esi,%edi
     49e:	0f 85 29 ff ff ff    	jne    3cd <free_page_tables+0x9e>
     4a4:	8b 44 24 0c          	mov    0xc(%esp),%eax
     4a8:	8b 80 04 03 00 00    	mov    0x304(%eax),%eax
     4ae:	0f 22 d8             	mov    %eax,%cr3
     4b1:	b8 00 00 00 00       	mov    $0x0,%eax
     4b6:	83 c4 2c             	add    $0x2c,%esp
     4b9:	5b                   	pop    %ebx
     4ba:	5e                   	pop    %esi
     4bb:	5f                   	pop    %edi
     4bc:	5d                   	pop    %ebp
     4bd:	c3                   	ret    

000004be <copy_page_tables>:
     4be:	55                   	push   %ebp
     4bf:	57                   	push   %edi
     4c0:	56                   	push   %esi
     4c1:	53                   	push   %ebx
     4c2:	83 ec 3c             	sub    $0x3c,%esp
     4c5:	8b 74 24 5c          	mov    0x5c(%esp),%esi
     4c9:	e8 fc ff ff ff       	call   4ca <copy_page_tables+0xc>
     4ce:	89 c3                	mov    %eax,%ebx
     4d0:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
     4d7:	00 
     4d8:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
     4df:	00 
     4e0:	8b 2d 00 00 00 00    	mov    0x0,%ebp
     4e6:	8b 44 24 50          	mov    0x50(%esp),%eax
     4ea:	0b 44 24 54          	or     0x54(%esp),%eax
     4ee:	a9 ff ff 3f 00       	test   $0x3fffff,%eax
     4f3:	74 10                	je     505 <copy_page_tables+0x47>
     4f5:	83 ec 0c             	sub    $0xc,%esp
     4f8:	68 c0 01 00 00       	push   $0x1c0
     4fd:	e8 fc ff ff ff       	call   4fe <copy_page_tables+0x40>
     502:	83 c4 10             	add    $0x10,%esp
     505:	83 ec 0c             	sub    $0xc,%esp
     508:	6a 01                	push   $0x1
     50a:	e8 fc ff ff ff       	call   50b <copy_page_tables+0x4d>
     50f:	89 c7                	mov    %eax,%edi
     511:	89 44 24 10          	mov    %eax,0x10(%esp)
     515:	83 c4 04             	add    $0x4,%esp
     518:	ff b6 c4 03 00 00    	pushl  0x3c4(%esi)
     51e:	ff b6 30 02 00 00    	pushl  0x230(%esi)
     524:	ff b6 c0 03 00 00    	pushl  0x3c0(%esi)
     52a:	50                   	push   %eax
     52b:	68 f0 01 00 00       	push   $0x1f0
     530:	e8 fc ff ff ff       	call   531 <copy_page_tables+0x73>
     535:	83 c4 20             	add    $0x20,%esp
     538:	85 ff                	test   %edi,%edi
     53a:	75 10                	jne    54c <copy_page_tables+0x8e>
     53c:	83 ec 0c             	sub    $0xc,%esp
     53f:	68 28 02 00 00       	push   $0x228
     544:	e8 fc ff ff ff       	call   545 <copy_page_tables+0x87>
     549:	83 c4 10             	add    $0x10,%esp
     54c:	8b 04 24             	mov    (%esp),%eax
     54f:	89 86 04 03 00 00    	mov    %eax,0x304(%esi)
     555:	8b 83 04 03 00 00    	mov    0x304(%ebx),%eax
     55b:	89 44 24 04          	mov    %eax,0x4(%esp)
     55f:	39 eb                	cmp    %ebp,%ebx
     561:	0f 84 d4 01 00 00    	je     73b <copy_page_tables+0x27d>
     567:	c7 44 24 08 00 04 00 	movl   $0x400,0x8(%esp)
     56e:	00 
     56f:	e9 cf 01 00 00       	jmp    743 <copy_page_tables+0x285>
     574:	46                   	inc    %esi
     575:	8b 04 24             	mov    (%esp),%eax
     578:	f6 44 b0 fc 01       	testb  $0x1,-0x4(%eax,%esi,4)
     57d:	74 10                	je     58f <copy_page_tables+0xd1>
     57f:	83 ec 0c             	sub    $0xc,%esp
     582:	68 6c 02 00 00       	push   $0x26c
     587:	e8 fc ff ff ff       	call   588 <copy_page_tables+0xca>
     58c:	83 c4 10             	add    $0x10,%esp
     58f:	8b 44 24 04          	mov    0x4(%esp),%eax
     593:	f6 44 b0 fc 01       	testb  $0x1,-0x4(%eax,%esi,4)
     598:	0f 84 7f 01 00 00    	je     71d <copy_page_tables+0x25f>
     59e:	8d 7c 24 18          	lea    0x18(%esp),%edi
     5a2:	b9 04 00 00 00       	mov    $0x4,%ecx
     5a7:	b8 00 00 00 00       	mov    $0x0,%eax
     5ac:	f3 ab                	rep stos %eax,%es:(%edi)
     5ae:	8b 7c 24 04          	mov    0x4(%esp),%edi
     5b2:	8b 44 b7 fc          	mov    -0x4(%edi,%esi,4),%eax
     5b6:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5ba:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     5bf:	89 44 24 2c          	mov    %eax,0x2c(%esp)
     5c3:	83 ec 0c             	sub    $0xc,%esp
     5c6:	8d 44 24 38          	lea    0x38(%esp),%eax
     5ca:	50                   	push   %eax
     5cb:	e8 fc ff ff ff       	call   5cc <copy_page_tables+0x10e>
     5d0:	83 c4 0c             	add    $0xc,%esp
     5d3:	50                   	push   %eax
     5d4:	6a 04                	push   $0x4
     5d6:	8d 44 24 24          	lea    0x24(%esp),%eax
     5da:	50                   	push   %eax
     5db:	e8 fc ff ff ff       	call   5dc <copy_page_tables+0x11e>
     5e0:	83 c4 10             	add    $0x10,%esp
     5e3:	81 fe 00 01 00 00    	cmp    $0x100,%esi
     5e9:	77 70                	ja     65b <copy_page_tables+0x19d>
     5eb:	8b 44 b7 fc          	mov    -0x4(%edi,%esi,4),%eax
     5ef:	8b 3c 24             	mov    (%esp),%edi
     5f2:	89 44 b7 fc          	mov    %eax,-0x4(%edi,%esi,4)
     5f6:	39 eb                	cmp    %ebp,%ebx
     5f8:	0f 85 b5 00 00 00    	jne    6b3 <copy_page_tables+0x1f5>
     5fe:	a1 00 00 00 00       	mov    0x0,%eax
     603:	05 ff ff 3f 00       	add    $0x3fffff,%eax
     608:	c1 f8 16             	sar    $0x16,%eax
     60b:	39 c6                	cmp    %eax,%esi
     60d:	0f 87 ef 00 00 00    	ja     702 <copy_page_tables+0x244>
     613:	83 ec 0c             	sub    $0xc,%esp
     616:	6a 00                	push   $0x0
     618:	e8 fc ff ff ff       	call   619 <copy_page_tables+0x15b>
     61d:	89 44 24 38          	mov    %eax,0x38(%esp)
     621:	83 c4 10             	add    $0x10,%esp
     624:	85 c0                	test   %eax,%eax
     626:	0f 84 ea 00 00 00    	je     716 <copy_page_tables+0x258>
     62c:	83 c8 07             	or     $0x7,%eax
     62f:	8b 3c 24             	mov    (%esp),%edi
     632:	89 84 b7 fc 03 00 00 	mov    %eax,0x3fc(%edi,%esi,4)
     639:	83 ec 0c             	sub    $0xc,%esp
     63c:	8d 44 24 34          	lea    0x34(%esp),%eax
     640:	50                   	push   %eax
     641:	e8 fc ff ff ff       	call   642 <copy_page_tables+0x184>
     646:	83 c4 0c             	add    $0xc,%esp
     649:	50                   	push   %eax
     64a:	6a 04                	push   $0x4
     64c:	8d 44 24 24          	lea    0x24(%esp),%eax
     650:	50                   	push   %eax
     651:	e8 fc ff ff ff       	call   652 <copy_page_tables+0x194>
     656:	83 c4 10             	add    $0x10,%esp
     659:	eb 47                	jmp    6a2 <copy_page_tables+0x1e4>
     65b:	83 ec 0c             	sub    $0xc,%esp
     65e:	6a 00                	push   $0x0
     660:	e8 fc ff ff ff       	call   661 <copy_page_tables+0x1a3>
     665:	89 44 24 38          	mov    %eax,0x38(%esp)
     669:	83 c4 10             	add    $0x10,%esp
     66c:	85 c0                	test   %eax,%eax
     66e:	0f 84 a2 00 00 00    	je     716 <copy_page_tables+0x258>
     674:	83 c8 07             	or     $0x7,%eax
     677:	8b 3c 24             	mov    (%esp),%edi
     67a:	89 44 b7 fc          	mov    %eax,-0x4(%edi,%esi,4)
     67e:	83 ec 0c             	sub    $0xc,%esp
     681:	8d 44 24 34          	lea    0x34(%esp),%eax
     685:	50                   	push   %eax
     686:	e8 fc ff ff ff       	call   687 <copy_page_tables+0x1c9>
     68b:	83 c4 0c             	add    $0xc,%esp
     68e:	50                   	push   %eax
     68f:	6a 04                	push   $0x4
     691:	8d 44 24 24          	lea    0x24(%esp),%eax
     695:	50                   	push   %eax
     696:	e8 fc ff ff ff       	call   697 <copy_page_tables+0x1d9>
     69b:	83 c4 10             	add    $0x10,%esp
     69e:	39 eb                	cmp    %ebp,%ebx
     6a0:	75 11                	jne    6b3 <copy_page_tables+0x1f5>
     6a2:	a1 00 00 00 00       	mov    0x0,%eax
     6a7:	05 ff ff 3f 00       	add    $0x3fffff,%eax
     6ac:	c1 f8 16             	sar    $0x16,%eax
     6af:	39 c6                	cmp    %eax,%esi
     6b1:	77 4f                	ja     702 <copy_page_tables+0x244>
     6b3:	83 7c 24 28 00       	cmpl   $0x0,0x28(%esp)
     6b8:	74 48                	je     702 <copy_page_tables+0x244>
     6ba:	ba 00 04 00 00       	mov    $0x400,%edx
     6bf:	8b 44 24 2c          	mov    0x2c(%esp),%eax
     6c3:	8b 00                	mov    (%eax),%eax
     6c5:	a8 01                	test   $0x1,%al
     6c7:	74 2c                	je     6f5 <copy_page_tables+0x237>
     6c9:	83 e0 fd             	and    $0xfffffffd,%eax
     6cc:	8b 4c 24 28          	mov    0x28(%esp),%ecx
     6d0:	89 01                	mov    %eax,(%ecx)
     6d2:	39 eb                	cmp    %ebp,%ebx
     6d4:	74 1f                	je     6f5 <copy_page_tables+0x237>
     6d6:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     6dc:	39 c8                	cmp    %ecx,%eax
     6de:	72 15                	jb     6f5 <copy_page_tables+0x237>
     6e0:	89 c7                	mov    %eax,%edi
     6e2:	29 cf                	sub    %ecx,%edi
     6e4:	89 f9                	mov    %edi,%ecx
     6e6:	c1 e9 0c             	shr    $0xc,%ecx
     6e9:	fe 81 00 00 00 00    	incb   0x0(%ecx)
     6ef:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
     6f3:	89 01                	mov    %eax,(%ecx)
     6f5:	83 44 24 2c 04       	addl   $0x4,0x2c(%esp)
     6fa:	83 44 24 28 04       	addl   $0x4,0x28(%esp)
     6ff:	4a                   	dec    %edx
     700:	75 bd                	jne    6bf <copy_page_tables+0x201>
     702:	83 ec 08             	sub    $0x8,%esp
     705:	6a 04                	push   $0x4
     707:	8d 44 24 24          	lea    0x24(%esp),%eax
     70b:	50                   	push   %eax
     70c:	e8 fc ff ff ff       	call   70d <copy_page_tables+0x24f>
     711:	83 c4 10             	add    $0x10,%esp
     714:	eb 07                	jmp    71d <copy_page_tables+0x25f>
     716:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     71b:	eb 30                	jmp    74d <copy_page_tables+0x28f>
     71d:	8b 44 24 08          	mov    0x8(%esp),%eax
     721:	29 f0                	sub    %esi,%eax
     723:	85 c0                	test   %eax,%eax
     725:	0f 8f 49 fe ff ff    	jg     574 <copy_page_tables+0xb6>
     72b:	8b 83 04 03 00 00    	mov    0x304(%ebx),%eax
     731:	0f 22 d8             	mov    %eax,%cr3
     734:	b8 00 00 00 00       	mov    $0x0,%eax
     739:	eb 12                	jmp    74d <copy_page_tables+0x28f>
     73b:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
     742:	00 
     743:	be 00 00 00 00       	mov    $0x0,%esi
     748:	e9 27 fe ff ff       	jmp    574 <copy_page_tables+0xb6>
     74d:	83 c4 3c             	add    $0x3c,%esp
     750:	5b                   	pop    %ebx
     751:	5e                   	pop    %esi
     752:	5f                   	pop    %edi
     753:	5d                   	pop    %ebp
     754:	c3                   	ret    

00000755 <put_page>:
     755:	57                   	push   %edi
     756:	56                   	push   %esi
     757:	53                   	push   %ebx
     758:	83 ec 10             	sub    $0x10,%esp
     75b:	8b 74 24 20          	mov    0x20(%esp),%esi
     75f:	8b 5c 24 24          	mov    0x24(%esp),%ebx
     763:	e8 fc ff ff ff       	call   764 <put_page+0xf>
     768:	89 c7                	mov    %eax,%edi
     76a:	a1 00 00 00 00       	mov    0x0,%eax
     76f:	39 f0                	cmp    %esi,%eax
     771:	77 08                	ja     77b <put_page+0x26>
     773:	3b 35 00 00 00 00    	cmp    0x0,%esi
     779:	72 19                	jb     794 <put_page+0x3f>
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	ff 35 00 00 00 00    	pushl  0x0
     784:	50                   	push   %eax
     785:	53                   	push   %ebx
     786:	56                   	push   %esi
     787:	68 8c 02 00 00       	push   $0x28c
     78c:	e8 fc ff ff ff       	call   78d <put_page+0x38>
     791:	83 c4 20             	add    $0x20,%esp
     794:	89 f0                	mov    %esi,%eax
     796:	2b 05 00 00 00 00    	sub    0x0,%eax
     79c:	c1 e8 0c             	shr    $0xc,%eax
     79f:	8a 80 00 00 00 00    	mov    0x0(%eax),%al
     7a5:	3c 01                	cmp    $0x1,%al
     7a7:	74 13                	je     7bc <put_page+0x67>
     7a9:	0f b6 c0             	movzbl %al,%eax
     7ac:	50                   	push   %eax
     7ad:	53                   	push   %ebx
     7ae:	56                   	push   %esi
     7af:	68 c4 02 00 00       	push   $0x2c4
     7b4:	e8 fc ff ff ff       	call   7b5 <put_page+0x60>
     7b9:	83 c4 10             	add    $0x10,%esp
     7bc:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7c3:	00 
     7c4:	89 da                	mov    %ebx,%edx
     7c6:	c1 ea 16             	shr    $0x16,%edx
     7c9:	8b 87 04 03 00 00    	mov    0x304(%edi),%eax
     7cf:	8d 04 90             	lea    (%eax,%edx,4),%eax
     7d2:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7d6:	8b 00                	mov    (%eax),%eax
     7d8:	89 c7                	mov    %eax,%edi
     7da:	83 e7 01             	and    $0x1,%edi
     7dd:	74 0b                	je     7ea <put_page+0x95>
     7df:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     7e4:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7e8:	eb 20                	jmp    80a <put_page+0xb5>
     7ea:	83 ec 0c             	sub    $0xc,%esp
     7ed:	6a 00                	push   $0x0
     7ef:	e8 fc ff ff ff       	call   7f0 <put_page+0x9b>
     7f4:	83 c4 10             	add    $0x10,%esp
     7f7:	85 c0                	test   %eax,%eax
     7f9:	74 51                	je     84c <put_page+0xf7>
     7fb:	89 c1                	mov    %eax,%ecx
     7fd:	83 c9 07             	or     $0x7,%ecx
     800:	8b 54 24 0c          	mov    0xc(%esp),%edx
     804:	89 0a                	mov    %ecx,(%edx)
     806:	89 44 24 0c          	mov    %eax,0xc(%esp)
     80a:	83 ec 0c             	sub    $0xc,%esp
     80d:	8d 44 24 18          	lea    0x18(%esp),%eax
     811:	50                   	push   %eax
     812:	e8 fc ff ff ff       	call   813 <put_page+0xbe>
     817:	83 c4 0c             	add    $0xc,%esp
     81a:	50                   	push   %eax
     81b:	6a 01                	push   $0x1
     81d:	8d 7c 24 14          	lea    0x14(%esp),%edi
     821:	57                   	push   %edi
     822:	e8 fc ff ff ff       	call   823 <put_page+0xce>
     827:	c1 eb 0c             	shr    $0xc,%ebx
     82a:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
     830:	89 f2                	mov    %esi,%edx
     832:	83 ca 07             	or     $0x7,%edx
     835:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     839:	89 14 98             	mov    %edx,(%eax,%ebx,4)
     83c:	83 c4 08             	add    $0x8,%esp
     83f:	6a 01                	push   $0x1
     841:	57                   	push   %edi
     842:	e8 fc ff ff ff       	call   843 <put_page+0xee>
     847:	83 c4 10             	add    $0x10,%esp
     84a:	89 f7                	mov    %esi,%edi
     84c:	89 f8                	mov    %edi,%eax
     84e:	83 c4 10             	add    $0x10,%esp
     851:	5b                   	pop    %ebx
     852:	5e                   	pop    %esi
     853:	5f                   	pop    %edi
     854:	c3                   	ret    

00000855 <un_wp_page>:
     855:	57                   	push   %edi
     856:	56                   	push   %esi
     857:	53                   	push   %ebx
     858:	83 ec 20             	sub    $0x20,%esp
     85b:	e8 fc ff ff ff       	call   85c <un_wp_page+0x7>
     860:	89 c3                	mov    %eax,%ebx
     862:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     869:	00 
     86a:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     871:	00 
     872:	8b 74 24 30          	mov    0x30(%esp),%esi
     876:	8d 7c 24 0c          	lea    0xc(%esp),%edi
     87a:	b9 03 00 00 00       	mov    $0x3,%ecx
     87f:	b8 00 00 00 00       	mov    $0x0,%eax
     884:	f3 ab                	rep stos %eax,%es:(%edi)
     886:	83 ec 0c             	sub    $0xc,%esp
     889:	8d 44 24 3c          	lea    0x3c(%esp),%eax
     88d:	50                   	push   %eax
     88e:	e8 fc ff ff ff       	call   88f <un_wp_page+0x3a>
     893:	89 c7                	mov    %eax,%edi
     895:	83 c4 0c             	add    $0xc,%esp
     898:	50                   	push   %eax
     899:	6a 03                	push   $0x3
     89b:	8d 44 24 18          	lea    0x18(%esp),%eax
     89f:	50                   	push   %eax
     8a0:	e8 fc ff ff ff       	call   8a1 <un_wp_page+0x4c>
     8a5:	83 c4 10             	add    $0x10,%esp
     8a8:	85 ff                	test   %edi,%edi
     8aa:	74 0a                	je     8b6 <un_wp_page+0x61>
     8ac:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
     8b2:	01 74 24 30          	add    %esi,0x30(%esp)
     8b6:	8b 4c 24 30          	mov    0x30(%esp),%ecx
     8ba:	8b 01                	mov    (%ecx),%eax
     8bc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     8c1:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     8c5:	8b 15 00 00 00 00    	mov    0x0,%edx
     8cb:	39 d0                	cmp    %edx,%eax
     8cd:	72 31                	jb     900 <un_wp_page+0xab>
     8cf:	29 d0                	sub    %edx,%eax
     8d1:	c1 e8 0c             	shr    $0xc,%eax
     8d4:	80 b8 00 00 00 00 01 	cmpb   $0x1,0x0(%eax)
     8db:	75 23                	jne    900 <un_wp_page+0xab>
     8dd:	83 09 02             	orl    $0x2,(%ecx)
     8e0:	83 ec 08             	sub    $0x8,%esp
     8e3:	6a 03                	push   $0x3
     8e5:	8d 44 24 18          	lea    0x18(%esp),%eax
     8e9:	50                   	push   %eax
     8ea:	e8 fc ff ff ff       	call   8eb <un_wp_page+0x96>
     8ef:	8b 83 04 03 00 00    	mov    0x304(%ebx),%eax
     8f5:	0f 22 d8             	mov    %eax,%cr3
     8f8:	83 c4 10             	add    $0x10,%esp
     8fb:	e9 c0 00 00 00       	jmp    9c0 <un_wp_page+0x16b>
     900:	83 ec 0c             	sub    $0xc,%esp
     903:	6a 00                	push   $0x0
     905:	e8 fc ff ff ff       	call   906 <un_wp_page+0xb1>
     90a:	89 44 24 28          	mov    %eax,0x28(%esp)
     90e:	83 c4 10             	add    $0x10,%esp
     911:	85 c0                	test   %eax,%eax
     913:	75 28                	jne    93d <un_wp_page+0xe8>
     915:	83 ec 0c             	sub    $0xc,%esp
     918:	68 63 00 00 00       	push   $0x63
     91d:	e8 fc ff ff ff       	call   91e <un_wp_page+0xc9>
     922:	c7 04 24 7d 00 00 00 	movl   $0x7d,(%esp)
     929:	e8 fc ff ff ff       	call   92a <un_wp_page+0xd5>
     92e:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     935:	e8 fc ff ff ff       	call   936 <un_wp_page+0xe1>
     93a:	83 c4 10             	add    $0x10,%esp
     93d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     941:	8b 15 00 00 00 00    	mov    0x0,%edx
     947:	39 d0                	cmp    %edx,%eax
     949:	72 0b                	jb     956 <un_wp_page+0x101>
     94b:	29 d0                	sub    %edx,%eax
     94d:	c1 e8 0c             	shr    $0xc,%eax
     950:	fe 88 00 00 00 00    	decb   0x0(%eax)
     956:	8b 44 24 18          	mov    0x18(%esp),%eax
     95a:	83 c8 07             	or     $0x7,%eax
     95d:	8b 54 24 30          	mov    0x30(%esp),%edx
     961:	89 02                	mov    %eax,(%edx)
     963:	8b 83 04 03 00 00    	mov    0x304(%ebx),%eax
     969:	0f 22 d8             	mov    %eax,%cr3
     96c:	83 ec 0c             	sub    $0xc,%esp
     96f:	8d 44 24 28          	lea    0x28(%esp),%eax
     973:	50                   	push   %eax
     974:	e8 fc ff ff ff       	call   975 <un_wp_page+0x120>
     979:	83 c4 0c             	add    $0xc,%esp
     97c:	50                   	push   %eax
     97d:	6a 03                	push   $0x3
     97f:	8d 5c 24 18          	lea    0x18(%esp),%ebx
     983:	53                   	push   %ebx
     984:	e8 fc ff ff ff       	call   985 <un_wp_page+0x130>
     989:	83 c4 04             	add    $0x4,%esp
     98c:	8d 44 24 24          	lea    0x24(%esp),%eax
     990:	50                   	push   %eax
     991:	e8 fc ff ff ff       	call   992 <un_wp_page+0x13d>
     996:	83 c4 0c             	add    $0xc,%esp
     999:	50                   	push   %eax
     99a:	6a 03                	push   $0x3
     99c:	53                   	push   %ebx
     99d:	e8 fc ff ff ff       	call   99e <un_wp_page+0x149>
     9a2:	b9 00 04 00 00       	mov    $0x400,%ecx
     9a7:	8b 7c 24 28          	mov    0x28(%esp),%edi
     9ab:	8b 74 24 2c          	mov    0x2c(%esp),%esi
     9af:	fc                   	cld    
     9b0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     9b2:	83 c4 08             	add    $0x8,%esp
     9b5:	6a 03                	push   $0x3
     9b7:	53                   	push   %ebx
     9b8:	e8 fc ff ff ff       	call   9b9 <un_wp_page+0x164>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	83 c4 20             	add    $0x20,%esp
     9c3:	5b                   	pop    %ebx
     9c4:	5e                   	pop    %esi
     9c5:	5f                   	pop    %edi
     9c6:	c3                   	ret    

000009c7 <do_wp_page>:
     9c7:	83 ec 0c             	sub    $0xc,%esp
     9ca:	e8 fc ff ff ff       	call   9cb <do_wp_page+0x4>
     9cf:	83 ec 0c             	sub    $0xc,%esp
     9d2:	8b 54 24 20          	mov    0x20(%esp),%edx
     9d6:	c1 ea 16             	shr    $0x16,%edx
     9d9:	8b 80 04 03 00 00    	mov    0x304(%eax),%eax
     9df:	8b 04 90             	mov    (%eax,%edx,4),%eax
     9e2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     9e7:	89 c2                	mov    %eax,%edx
     9e9:	8b 44 24 20          	mov    0x20(%esp),%eax
     9ed:	c1 e8 0a             	shr    $0xa,%eax
     9f0:	25 fc 0f 00 00       	and    $0xffc,%eax
     9f5:	01 d0                	add    %edx,%eax
     9f7:	50                   	push   %eax
     9f8:	e8 fc ff ff ff       	call   9f9 <do_wp_page+0x32>
     9fd:	83 c4 1c             	add    $0x1c,%esp
     a00:	c3                   	ret    

00000a01 <write_verify>:
     a01:	56                   	push   %esi
     a02:	53                   	push   %ebx
     a03:	83 ec 14             	sub    $0x14,%esp
     a06:	e8 fc ff ff ff       	call   a07 <write_verify+0x6>
     a0b:	8b 54 24 20          	mov    0x20(%esp),%edx
     a0f:	c1 ea 16             	shr    $0x16,%edx
     a12:	8b 80 04 03 00 00    	mov    0x304(%eax),%eax
     a18:	8b 1c 90             	mov    (%eax,%edx,4),%ebx
     a1b:	f6 c3 01             	test   $0x1,%bl
     a1e:	0f 84 85 00 00 00    	je     aa9 <write_verify+0xa8>
     a24:	89 de                	mov    %ebx,%esi
     a26:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
     a2c:	89 74 24 0c          	mov    %esi,0xc(%esp)
     a30:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a37:	00 
     a38:	83 ec 0c             	sub    $0xc,%esp
     a3b:	8d 44 24 18          	lea    0x18(%esp),%eax
     a3f:	50                   	push   %eax
     a40:	e8 fc ff ff ff       	call   a41 <write_verify+0x40>
     a45:	83 c4 0c             	add    $0xc,%esp
     a48:	50                   	push   %eax
     a49:	6a 01                	push   $0x1
     a4b:	8d 44 24 14          	lea    0x14(%esp),%eax
     a4f:	50                   	push   %eax
     a50:	e8 fc ff ff ff       	call   a51 <write_verify+0x50>
     a55:	8b 5c 24 30          	mov    0x30(%esp),%ebx
     a59:	c1 eb 0a             	shr    $0xa,%ebx
     a5c:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
     a62:	89 d8                	mov    %ebx,%eax
     a64:	03 44 24 1c          	add    0x1c(%esp),%eax
     a68:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     a6c:	8b 00                	mov    (%eax),%eax
     a6e:	83 e0 03             	and    $0x3,%eax
     a71:	83 c4 10             	add    $0x10,%esp
     a74:	83 f8 01             	cmp    $0x1,%eax
     a77:	75 1e                	jne    a97 <write_verify+0x96>
     a79:	83 ec 08             	sub    $0x8,%esp
     a7c:	6a 01                	push   $0x1
     a7e:	8d 44 24 14          	lea    0x14(%esp),%eax
     a82:	50                   	push   %eax
     a83:	e8 fc ff ff ff       	call   a84 <write_verify+0x83>
     a88:	01 f3                	add    %esi,%ebx
     a8a:	89 1c 24             	mov    %ebx,(%esp)
     a8d:	e8 fc ff ff ff       	call   a8e <write_verify+0x8d>
     a92:	83 c4 10             	add    $0x10,%esp
     a95:	eb 12                	jmp    aa9 <write_verify+0xa8>
     a97:	83 ec 08             	sub    $0x8,%esp
     a9a:	6a 01                	push   $0x1
     a9c:	8d 44 24 14          	lea    0x14(%esp),%eax
     aa0:	50                   	push   %eax
     aa1:	e8 fc ff ff ff       	call   aa2 <write_verify+0xa1>
     aa6:	83 c4 10             	add    $0x10,%esp
     aa9:	83 c4 14             	add    $0x14,%esp
     aac:	5b                   	pop    %ebx
     aad:	5e                   	pop    %esi
     aae:	c3                   	ret    

00000aaf <get_empty_page>:
     aaf:	56                   	push   %esi
     ab0:	53                   	push   %ebx
     ab1:	83 ec 10             	sub    $0x10,%esp
     ab4:	8b 74 24 1c          	mov    0x1c(%esp),%esi
     ab8:	6a 00                	push   $0x0
     aba:	e8 fc ff ff ff       	call   abb <get_empty_page+0xc>
     abf:	89 c3                	mov    %eax,%ebx
     ac1:	83 c4 10             	add    $0x10,%esp
     ac4:	85 c0                	test   %eax,%eax
     ac6:	74 11                	je     ad9 <get_empty_page+0x2a>
     ac8:	83 ec 08             	sub    $0x8,%esp
     acb:	56                   	push   %esi
     acc:	50                   	push   %eax
     acd:	e8 fc ff ff ff       	call   ace <get_empty_page+0x1f>
     ad2:	83 c4 10             	add    $0x10,%esp
     ad5:	85 c0                	test   %eax,%eax
     ad7:	75 4a                	jne    b23 <get_empty_page+0x74>
     ad9:	83 ec 0c             	sub    $0xc,%esp
     adc:	53                   	push   %ebx
     add:	e8 fc ff ff ff       	call   ade <get_empty_page+0x2f>
     ae2:	83 c4 10             	add    $0x10,%esp
     ae5:	85 c0                	test   %eax,%eax
     ae7:	75 10                	jne    af9 <get_empty_page+0x4a>
     ae9:	83 ec 0c             	sub    $0xc,%esp
     aec:	68 f0 02 00 00       	push   $0x2f0
     af1:	e8 fc ff ff ff       	call   af2 <get_empty_page+0x43>
     af6:	83 c4 10             	add    $0x10,%esp
     af9:	83 ec 04             	sub    $0x4,%esp
     afc:	56                   	push   %esi
     afd:	53                   	push   %ebx
     afe:	68 1c 03 00 00       	push   $0x31c
     b03:	e8 fc ff ff ff       	call   b04 <get_empty_page+0x55>
     b08:	c7 04 24 7d 00 00 00 	movl   $0x7d,(%esp)
     b0f:	e8 fc ff ff ff       	call   b10 <get_empty_page+0x61>
     b14:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     b1b:	e8 fc ff ff ff       	call   b1c <get_empty_page+0x6d>
     b20:	83 c4 10             	add    $0x10,%esp
     b23:	83 c4 04             	add    $0x4,%esp
     b26:	5b                   	pop    %ebx
     b27:	5e                   	pop    %esi
     b28:	c3                   	ret    

00000b29 <try_to_share>:
     b29:	55                   	push   %ebp
     b2a:	57                   	push   %edi
     b2b:	56                   	push   %esi
     b2c:	53                   	push   %ebx
     b2d:	83 ec 1c             	sub    $0x1c,%esp
     b30:	8b 5c 24 30          	mov    0x30(%esp),%ebx
     b34:	8b 7c 24 34          	mov    0x34(%esp),%edi
     b38:	e8 fc ff ff ff       	call   b39 <try_to_share+0x10>
     b3d:	89 c6                	mov    %eax,%esi
     b3f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b46:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     b4d:	00 
     b4e:	89 d8                	mov    %ebx,%eax
     b50:	03 87 18 02 00 00    	add    0x218(%edi),%eax
     b56:	c1 e8 16             	shr    $0x16,%eax
     b59:	8b 97 04 03 00 00    	mov    0x304(%edi),%edx
     b5f:	8d 14 82             	lea    (%edx,%eax,4),%edx
     b62:	89 54 24 0c          	mov    %edx,0xc(%esp)
     b66:	89 d8                	mov    %ebx,%eax
     b68:	03 86 18 02 00 00    	add    0x218(%esi),%eax
     b6e:	c1 e8 16             	shr    $0x16,%eax
     b71:	8b 8e 04 03 00 00    	mov    0x304(%esi),%ecx
     b77:	8d 04 81             	lea    (%ecx,%eax,4),%eax
     b7a:	89 44 24 08          	mov    %eax,0x8(%esp)
     b7e:	8b 02                	mov    (%edx),%eax
     b80:	a8 01                	test   $0x1,%al
     b82:	0f 84 4e 01 00 00    	je     cd6 <try_to_share+0x1ad>
     b88:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     b8d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b91:	83 ec 0c             	sub    $0xc,%esp
     b94:	8d 44 24 18          	lea    0x18(%esp),%eax
     b98:	50                   	push   %eax
     b99:	e8 fc ff ff ff       	call   b9a <try_to_share+0x71>
     b9e:	83 c4 0c             	add    $0xc,%esp
     ba1:	50                   	push   %eax
     ba2:	6a 02                	push   $0x2
     ba4:	8d 44 24 0c          	lea    0xc(%esp),%eax
     ba8:	50                   	push   %eax
     ba9:	e8 fc ff ff ff       	call   baa <try_to_share+0x81>
     bae:	c1 eb 0a             	shr    $0xa,%ebx
     bb1:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
     bb7:	89 d8                	mov    %ebx,%eax
     bb9:	03 44 24 1c          	add    0x1c(%esp),%eax
     bbd:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     bc1:	8b 00                	mov    (%eax),%eax
     bc3:	89 c2                	mov    %eax,%edx
     bc5:	83 e2 41             	and    $0x41,%edx
     bc8:	83 c4 10             	add    $0x10,%esp
     bcb:	83 fa 01             	cmp    $0x1,%edx
     bce:	0f 85 09 01 00 00    	jne    cdd <try_to_share+0x1b4>
     bd4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
     bd9:	89 c7                	mov    %eax,%edi
     bdb:	3b 05 00 00 00 00    	cmp    0x0,%eax
     be1:	0f 83 fd 00 00 00    	jae    ce4 <try_to_share+0x1bb>
     be7:	3b 05 00 00 00 00    	cmp    0x0,%eax
     bed:	0f 82 f8 00 00 00    	jb     ceb <try_to_share+0x1c2>
     bf3:	8b 44 24 08          	mov    0x8(%esp),%eax
     bf7:	8b 28                	mov    (%eax),%ebp
     bf9:	f7 c5 01 00 00 00    	test   $0x1,%ebp
     bff:	75 48                	jne    c49 <try_to_share+0x120>
     c01:	83 ec 0c             	sub    $0xc,%esp
     c04:	6a 00                	push   $0x0
     c06:	e8 fc ff ff ff       	call   c07 <try_to_share+0xde>
     c0b:	89 c5                	mov    %eax,%ebp
     c0d:	83 c4 10             	add    $0x10,%esp
     c10:	85 c0                	test   %eax,%eax
     c12:	74 0d                	je     c21 <try_to_share+0xf8>
     c14:	89 c2                	mov    %eax,%edx
     c16:	83 ca 07             	or     $0x7,%edx
     c19:	8b 44 24 08          	mov    0x8(%esp),%eax
     c1d:	89 10                	mov    %edx,(%eax)
     c1f:	eb 28                	jmp    c49 <try_to_share+0x120>
     c21:	83 ec 0c             	sub    $0xc,%esp
     c24:	68 8d 00 00 00       	push   $0x8d
     c29:	e8 fc ff ff ff       	call   c2a <try_to_share+0x101>
     c2e:	c7 04 24 7d 00 00 00 	movl   $0x7d,(%esp)
     c35:	e8 fc ff ff ff       	call   c36 <try_to_share+0x10d>
     c3a:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     c41:	e8 fc ff ff ff       	call   c42 <try_to_share+0x119>
     c46:	83 c4 10             	add    $0x10,%esp
     c49:	81 e5 00 f0 ff ff    	and    $0xfffff000,%ebp
     c4f:	89 6c 24 08          	mov    %ebp,0x8(%esp)
     c53:	83 ec 0c             	sub    $0xc,%esp
     c56:	8d 44 24 14          	lea    0x14(%esp),%eax
     c5a:	50                   	push   %eax
     c5b:	e8 fc ff ff ff       	call   c5c <try_to_share+0x133>
     c60:	83 c4 0c             	add    $0xc,%esp
     c63:	50                   	push   %eax
     c64:	6a 02                	push   $0x2
     c66:	8d 44 24 0c          	lea    0xc(%esp),%eax
     c6a:	50                   	push   %eax
     c6b:	e8 fc ff ff ff       	call   c6c <try_to_share+0x143>
     c70:	03 5c 24 18          	add    0x18(%esp),%ebx
     c74:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     c78:	83 c4 10             	add    $0x10,%esp
     c7b:	f6 03 01             	testb  $0x1,(%ebx)
     c7e:	74 10                	je     c90 <try_to_share+0x167>
     c80:	83 ec 0c             	sub    $0xc,%esp
     c83:	68 50 03 00 00       	push   $0x350
     c88:	e8 fc ff ff ff       	call   c89 <try_to_share+0x160>
     c8d:	83 c4 10             	add    $0x10,%esp
     c90:	8b 44 24 0c          	mov    0xc(%esp),%eax
     c94:	83 20 fd             	andl   $0xfffffffd,(%eax)
     c97:	8b 44 24 0c          	mov    0xc(%esp),%eax
     c9b:	8b 10                	mov    (%eax),%edx
     c9d:	8b 44 24 08          	mov    0x8(%esp),%eax
     ca1:	89 10                	mov    %edx,(%eax)
     ca3:	83 ec 08             	sub    $0x8,%esp
     ca6:	6a 02                	push   $0x2
     ca8:	8d 44 24 0c          	lea    0xc(%esp),%eax
     cac:	50                   	push   %eax
     cad:	e8 fc ff ff ff       	call   cae <try_to_share+0x185>
     cb2:	8b 86 04 03 00 00    	mov    0x304(%esi),%eax
     cb8:	0f 22 d8             	mov    %eax,%cr3
     cbb:	89 f8                	mov    %edi,%eax
     cbd:	2b 05 00 00 00 00    	sub    0x0,%eax
     cc3:	c1 e8 0c             	shr    $0xc,%eax
     cc6:	fe 80 00 00 00 00    	incb   0x0(%eax)
     ccc:	83 c4 10             	add    $0x10,%esp
     ccf:	b8 01 00 00 00       	mov    $0x1,%eax
     cd4:	eb 1a                	jmp    cf0 <try_to_share+0x1c7>
     cd6:	b8 00 00 00 00       	mov    $0x0,%eax
     cdb:	eb 13                	jmp    cf0 <try_to_share+0x1c7>
     cdd:	b8 00 00 00 00       	mov    $0x0,%eax
     ce2:	eb 0c                	jmp    cf0 <try_to_share+0x1c7>
     ce4:	b8 00 00 00 00       	mov    $0x0,%eax
     ce9:	eb 05                	jmp    cf0 <try_to_share+0x1c7>
     ceb:	b8 00 00 00 00       	mov    $0x0,%eax
     cf0:	83 c4 1c             	add    $0x1c,%esp
     cf3:	5b                   	pop    %ebx
     cf4:	5e                   	pop    %esi
     cf5:	5f                   	pop    %edi
     cf6:	5d                   	pop    %ebp
     cf7:	c3                   	ret    

00000cf8 <share_page>:
     cf8:	57                   	push   %edi
     cf9:	56                   	push   %esi
     cfa:	53                   	push   %ebx
     cfb:	8b 7c 24 10          	mov    0x10(%esp),%edi
     cff:	e8 fc ff ff ff       	call   d00 <share_page+0x8>
     d04:	89 c6                	mov    %eax,%esi
     d06:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
     d0c:	85 c0                	test   %eax,%eax
     d0e:	74 47                	je     d57 <share_page+0x5f>
     d10:	66 83 78 30 01       	cmpw   $0x1,0x30(%eax)
     d15:	76 47                	jbe    d5e <share_page+0x66>
     d17:	bb fc 00 00 00       	mov    $0xfc,%ebx
     d1c:	8b 03                	mov    (%ebx),%eax
     d1e:	85 c0                	test   %eax,%eax
     d20:	74 23                	je     d45 <share_page+0x4d>
     d22:	39 c6                	cmp    %eax,%esi
     d24:	74 1f                	je     d45 <share_page+0x4d>
     d26:	8b 96 78 02 00 00    	mov    0x278(%esi),%edx
     d2c:	39 90 78 02 00 00    	cmp    %edx,0x278(%eax)
     d32:	75 11                	jne    d45 <share_page+0x4d>
     d34:	83 ec 08             	sub    $0x8,%esp
     d37:	50                   	push   %eax
     d38:	57                   	push   %edi
     d39:	e8 fc ff ff ff       	call   d3a <share_page+0x42>
     d3e:	83 c4 10             	add    $0x10,%esp
     d41:	85 c0                	test   %eax,%eax
     d43:	75 20                	jne    d65 <share_page+0x6d>
     d45:	83 eb 04             	sub    $0x4,%ebx
     d48:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
     d4e:	75 cc                	jne    d1c <share_page+0x24>
     d50:	b8 00 00 00 00       	mov    $0x0,%eax
     d55:	eb 13                	jmp    d6a <share_page+0x72>
     d57:	b8 00 00 00 00       	mov    $0x0,%eax
     d5c:	eb 0c                	jmp    d6a <share_page+0x72>
     d5e:	b8 00 00 00 00       	mov    $0x0,%eax
     d63:	eb 05                	jmp    d6a <share_page+0x72>
     d65:	b8 01 00 00 00       	mov    $0x1,%eax
     d6a:	5b                   	pop    %ebx
     d6b:	5e                   	pop    %esi
     d6c:	5f                   	pop    %edi
     d6d:	c3                   	ret    

00000d6e <do_no_page>:
     d6e:	55                   	push   %ebp
     d6f:	57                   	push   %edi
     d70:	56                   	push   %esi
     d71:	53                   	push   %ebx
     d72:	83 ec 2c             	sub    $0x2c,%esp
     d75:	e8 fc ff ff ff       	call   d76 <do_no_page+0x8>
     d7a:	8b 5c 24 44          	mov    0x44(%esp),%ebx
     d7e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
     d84:	89 df                	mov    %ebx,%edi
     d86:	2b b8 18 02 00 00    	sub    0x218(%eax),%edi
     d8c:	83 b8 78 02 00 00 00 	cmpl   $0x0,0x278(%eax)
     d93:	74 0a                	je     d9f <do_no_page+0x31>
     d95:	89 c6                	mov    %eax,%esi
     d97:	3b b8 20 02 00 00    	cmp    0x220(%eax),%edi
     d9d:	72 11                	jb     db0 <do_no_page+0x42>
     d9f:	83 ec 0c             	sub    $0xc,%esp
     da2:	53                   	push   %ebx
     da3:	e8 fc ff ff ff       	call   da4 <do_no_page+0x36>
     da8:	83 c4 10             	add    $0x10,%esp
     dab:	e9 81 01 00 00       	jmp    f31 <do_no_page+0x1c3>
     db0:	83 ec 0c             	sub    $0xc,%esp
     db3:	57                   	push   %edi
     db4:	e8 fc ff ff ff       	call   db5 <do_no_page+0x47>
     db9:	83 c4 10             	add    $0x10,%esp
     dbc:	85 c0                	test   %eax,%eax
     dbe:	0f 85 6d 01 00 00    	jne    f31 <do_no_page+0x1c3>
     dc4:	83 ec 0c             	sub    $0xc,%esp
     dc7:	6a 00                	push   $0x0
     dc9:	e8 fc ff ff ff       	call   dca <do_no_page+0x5c>
     dce:	89 44 24 18          	mov    %eax,0x18(%esp)
     dd2:	83 c4 10             	add    $0x10,%esp
     dd5:	85 c0                	test   %eax,%eax
     dd7:	75 28                	jne    e01 <do_no_page+0x93>
     dd9:	83 ec 0c             	sub    $0xc,%esp
     ddc:	68 78 03 00 00       	push   $0x378
     de1:	e8 fc ff ff ff       	call   de2 <do_no_page+0x74>
     de6:	c7 04 24 7d 00 00 00 	movl   $0x7d,(%esp)
     ded:	e8 fc ff ff ff       	call   dee <do_no_page+0x80>
     df2:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     df9:	e8 fc ff ff ff       	call   dfa <do_no_page+0x8c>
     dfe:	83 c4 10             	add    $0x10,%esp
     e01:	89 f8                	mov    %edi,%eax
     e03:	c1 e8 0a             	shr    $0xa,%eax
     e06:	8d 68 01             	lea    0x1(%eax),%ebp
     e09:	8d 4c 24 10          	lea    0x10(%esp),%ecx
     e0d:	83 c0 05             	add    $0x5,%eax
     e10:	89 44 24 04          	mov    %eax,0x4(%esp)
     e14:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     e18:	89 cb                	mov    %ecx,%ebx
     e1a:	83 ec 08             	sub    $0x8,%esp
     e1d:	55                   	push   %ebp
     e1e:	ff b6 78 02 00 00    	pushl  0x278(%esi)
     e24:	e8 fc ff ff ff       	call   e25 <do_no_page+0xb7>
     e29:	89 03                	mov    %eax,(%ebx)
     e2b:	45                   	inc    %ebp
     e2c:	83 c3 04             	add    $0x4,%ebx
     e2f:	83 c4 10             	add    $0x10,%esp
     e32:	39 6c 24 04          	cmp    %ebp,0x4(%esp)
     e36:	75 e2                	jne    e1a <do_no_page+0xac>
     e38:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     e3c:	83 ec 04             	sub    $0x4,%esp
     e3f:	8d 44 24 14          	lea    0x14(%esp),%eax
     e43:	50                   	push   %eax
     e44:	8b 86 78 02 00 00    	mov    0x278(%esi),%eax
     e4a:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
     e4e:	50                   	push   %eax
     e4f:	8b 6c 24 14          	mov    0x14(%esp),%ebp
     e53:	55                   	push   %ebp
     e54:	e8 fc ff ff ff       	call   e55 <do_no_page+0xe7>
     e59:	2b be 20 02 00 00    	sub    0x220(%esi),%edi
     e5f:	8d b7 00 10 00 00    	lea    0x1000(%edi),%esi
     e65:	83 c4 10             	add    $0x10,%esp
     e68:	85 f6                	test   %esi,%esi
     e6a:	7e 40                	jle    eac <do_no_page+0x13e>
     e6c:	83 ec 0c             	sub    $0xc,%esp
     e6f:	68 9c 03 00 00       	push   $0x39c
     e74:	e8 fc ff ff ff       	call   e75 <do_no_page+0x107>
     e79:	89 2c 24             	mov    %ebp,(%esp)
     e7c:	e8 fc ff ff ff       	call   e7d <do_no_page+0x10f>
     e81:	83 c4 10             	add    $0x10,%esp
     e84:	85 c0                	test   %eax,%eax
     e86:	74 0b                	je     e93 <do_no_page+0x125>
     e88:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
     e8e:	e9 95 00 00 00       	jmp    f28 <do_no_page+0x1ba>
     e93:	8b 4c 24 08          	mov    0x8(%esp),%ecx
     e97:	8d 91 00 10 00 00    	lea    0x1000(%ecx),%edx
     e9d:	e9 86 00 00 00       	jmp    f28 <do_no_page+0x1ba>
     ea2:	4a                   	dec    %edx
     ea3:	c6 02 00             	movb   $0x0,(%edx)
     ea6:	39 ca                	cmp    %ecx,%edx
     ea8:	75 f8                	jne    ea2 <do_no_page+0x134>
     eaa:	eb 05                	jmp    eb1 <do_no_page+0x143>
     eac:	b8 00 00 00 00       	mov    $0x0,%eax
     eb1:	83 ec 0c             	sub    $0xc,%esp
     eb4:	50                   	push   %eax
     eb5:	e8 fc ff ff ff       	call   eb6 <do_no_page+0x148>
     eba:	83 c4 08             	add    $0x8,%esp
     ebd:	53                   	push   %ebx
     ebe:	ff 74 24 14          	pushl  0x14(%esp)
     ec2:	e8 fc ff ff ff       	call   ec3 <do_no_page+0x155>
     ec7:	83 c4 10             	add    $0x10,%esp
     eca:	85 c0                	test   %eax,%eax
     ecc:	75 63                	jne    f31 <do_no_page+0x1c3>
     ece:	83 ec 0c             	sub    $0xc,%esp
     ed1:	68 c8 03 00 00       	push   $0x3c8
     ed6:	e8 fc ff ff ff       	call   ed7 <do_no_page+0x169>
     edb:	83 c4 04             	add    $0x4,%esp
     ede:	ff 74 24 14          	pushl  0x14(%esp)
     ee2:	e8 fc ff ff ff       	call   ee3 <do_no_page+0x175>
     ee7:	83 c4 10             	add    $0x10,%esp
     eea:	85 c0                	test   %eax,%eax
     eec:	75 10                	jne    efe <do_no_page+0x190>
     eee:	83 ec 0c             	sub    $0xc,%esp
     ef1:	68 f4 03 00 00       	push   $0x3f4
     ef6:	e8 fc ff ff ff       	call   ef7 <do_no_page+0x189>
     efb:	83 c4 10             	add    $0x10,%esp
     efe:	83 ec 0c             	sub    $0xc,%esp
     f01:	68 a9 00 00 00       	push   $0xa9
     f06:	e8 fc ff ff ff       	call   f07 <do_no_page+0x199>
     f0b:	c7 04 24 7d 00 00 00 	movl   $0x7d,(%esp)
     f12:	e8 fc ff ff ff       	call   f13 <do_no_page+0x1a5>
     f17:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     f1e:	e8 fc ff ff ff       	call   f1f <do_no_page+0x1b1>
     f23:	83 c4 10             	add    $0x10,%esp
     f26:	eb 09                	jmp    f31 <do_no_page+0x1c3>
     f28:	89 d1                	mov    %edx,%ecx
     f2a:	29 f1                	sub    %esi,%ecx
     f2c:	e9 71 ff ff ff       	jmp    ea2 <do_no_page+0x134>
     f31:	83 c4 2c             	add    $0x2c,%esp
     f34:	5b                   	pop    %ebx
     f35:	5e                   	pop    %esi
     f36:	5f                   	pop    %edi
     f37:	5d                   	pop    %ebp
     f38:	c3                   	ret    

00000f39 <mem_init>:
     f39:	a1 00 00 00 00       	mov    0x0,%eax
     f3e:	85 c0                	test   %eax,%eax
     f40:	7e 12                	jle    f54 <mem_init+0x1b>
     f42:	05 ff ff ff ff       	add    $0xffffffff,%eax
     f47:	ba ff ff ff ff       	mov    $0xffffffff,%edx
     f4c:	c6 00 00             	movb   $0x0,(%eax)
     f4f:	48                   	dec    %eax
     f50:	39 d0                	cmp    %edx,%eax
     f52:	75 f8                	jne    f4c <mem_init+0x13>
     f54:	c3                   	ret    

00000f55 <calc_mem>:
     f55:	56                   	push   %esi
     f56:	53                   	push   %ebx
     f57:	83 ec 04             	sub    $0x4,%esp
     f5a:	8b 0d 00 00 00 00    	mov    0x0,%ecx
     f60:	85 c9                	test   %ecx,%ecx
     f62:	7e 1b                	jle    f7f <calc_mem+0x2a>
     f64:	ba 00 00 00 00       	mov    $0x0,%edx
     f69:	b8 00 00 00 00       	mov    $0x0,%eax
     f6e:	80 b8 00 00 00 00 01 	cmpb   $0x1,0x0(%eax)
     f75:	83 d2 00             	adc    $0x0,%edx
     f78:	40                   	inc    %eax
     f79:	39 c8                	cmp    %ecx,%eax
     f7b:	75 f1                	jne    f6e <calc_mem+0x19>
     f7d:	eb 05                	jmp    f84 <calc_mem+0x2f>
     f7f:	ba 00 00 00 00       	mov    $0x0,%edx
     f84:	83 ec 04             	sub    $0x4,%esp
     f87:	51                   	push   %ecx
     f88:	52                   	push   %edx
     f89:	68 c3 00 00 00       	push   $0xc3
     f8e:	e8 fc ff ff ff       	call   f8f <calc_mem+0x3a>
     f93:	83 c4 10             	add    $0x10,%esp
     f96:	bb 02 00 00 00       	mov    $0x2,%ebx
     f9b:	a1 00 00 00 00       	mov    0x0,%eax
     fa0:	8b 14 98             	mov    (%eax,%ebx,4),%edx
     fa3:	f6 c2 01             	test   $0x1,%dl
     fa6:	74 35                	je     fdd <calc_mem+0x88>
     fa8:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
     fae:	8d b2 00 10 00 00    	lea    0x1000(%edx),%esi
     fb4:	b9 00 00 00 00       	mov    $0x0,%ecx
     fb9:	8b 02                	mov    (%edx),%eax
     fbb:	83 e0 01             	and    $0x1,%eax
     fbe:	83 f8 01             	cmp    $0x1,%eax
     fc1:	83 d9 ff             	sbb    $0xffffffff,%ecx
     fc4:	83 c2 04             	add    $0x4,%edx
     fc7:	39 f2                	cmp    %esi,%edx
     fc9:	75 ee                	jne    fb9 <calc_mem+0x64>
     fcb:	83 ec 04             	sub    $0x4,%esp
     fce:	51                   	push   %ecx
     fcf:	53                   	push   %ebx
     fd0:	68 db 00 00 00       	push   $0xdb
     fd5:	e8 fc ff ff ff       	call   fd6 <calc_mem+0x81>
     fda:	83 c4 10             	add    $0x10,%esp
     fdd:	43                   	inc    %ebx
     fde:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
     fe4:	75 b5                	jne    f9b <calc_mem+0x46>
     fe6:	83 c4 04             	add    $0x4,%esp
     fe9:	5b                   	pop    %ebx
     fea:	5e                   	pop    %esi
     feb:	c3                   	ret    

00000fec <page_fault>:
     fec:	87 04 24             	xchg   %eax,(%esp)
     fef:	51                   	push   %ecx
     ff0:	52                   	push   %edx
     ff1:	31 d2                	xor    %edx,%edx
     ff3:	8c da                	mov    %ds,%edx
     ff5:	52                   	push   %edx
     ff6:	8c c2                	mov    %es,%edx
     ff8:	52                   	push   %edx
     ff9:	8c e2                	mov    %fs,%edx
     ffb:	52                   	push   %edx
     ffc:	ba 10 00 00 00       	mov    $0x10,%edx
    1001:	8e da                	mov    %edx,%ds
    1003:	8e c2                	mov    %edx,%es
    1005:	8e e2                	mov    %edx,%fs
    1007:	0f 20 d2             	mov    %cr2,%edx
    100a:	52                   	push   %edx
    100b:	50                   	push   %eax
    100c:	a9 01 00 00 00       	test   $0x1,%eax
    1011:	75 07                	jne    101a <page_fault+0x2e>
    1013:	e8 fc ff ff ff       	call   1014 <page_fault+0x28>
    1018:	eb 05                	jmp    101f <page_fault+0x33>
    101a:	e8 fc ff ff ff       	call   101b <page_fault+0x2f>
    101f:	83 c4 08             	add    $0x8,%esp
    1022:	0f a1                	pop    %fs
    1024:	07                   	pop    %es
    1025:	1f                   	pop    %ds
    1026:	5a                   	pop    %edx
    1027:	59                   	pop    %ecx
    1028:	58                   	pop    %eax
    1029:	cf                   	iret   
