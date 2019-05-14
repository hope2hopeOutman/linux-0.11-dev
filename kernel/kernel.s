
kernel.o:     file format elf32-i386


Disassembly of section .text:

00000000 <show_task>:
       0:	53                   	push   %ebx
       1:	83 ec 08             	sub    $0x8,%esp
       4:	8b 5c 24 14          	mov    0x14(%esp),%ebx
       8:	ff 33                	pushl  (%ebx)
       a:	ff b3 2c 02 00 00    	pushl  0x22c(%ebx)
      10:	ff 74 24 18          	pushl  0x18(%esp)
      14:	68 00 00 00 00       	push   $0x0
      19:	e8 fc ff ff ff       	call   1a <show_task+0x1a>
      1e:	83 c4 10             	add    $0x10,%esp
      21:	b8 01 00 00 00       	mov    $0x1,%eax
      26:	80 bb c0 03 00 00 00 	cmpb   $0x0,0x3c0(%ebx)
      2d:	74 11                	je     40 <show_task+0x40>
      2f:	b8 00 00 00 00       	mov    $0x0,%eax
      34:	eb 14                	jmp    4a <show_task+0x4a>
      36:	83 c0 01             	add    $0x1,%eax
      39:	3d 40 0c 00 00       	cmp    $0xc40,%eax
      3e:	74 0a                	je     4a <show_task+0x4a>
      40:	80 bc 03 c0 03 00 00 	cmpb   $0x0,0x3c0(%ebx,%eax,1)
      47:	00 
      48:	74 ec                	je     36 <show_task+0x36>
      4a:	83 ec 04             	sub    $0x4,%esp
      4d:	68 40 0c 00 00       	push   $0xc40
      52:	50                   	push   %eax
      53:	68 00 00 00 00       	push   $0x0
      58:	e8 fc ff ff ff       	call   59 <show_task+0x59>
      5d:	83 c4 18             	add    $0x18,%esp
      60:	5b                   	pop    %ebx
      61:	c3                   	ret    

00000062 <show_stat>:
      62:	53                   	push   %ebx
      63:	83 ec 08             	sub    $0x8,%esp
      66:	bb 00 00 00 00       	mov    $0x0,%ebx
      6b:	8b 04 9d 00 00 00 00 	mov    0x0(,%ebx,4),%eax
      72:	85 c0                	test   %eax,%eax
      74:	74 0d                	je     83 <show_stat+0x21>
      76:	83 ec 08             	sub    $0x8,%esp
      79:	50                   	push   %eax
      7a:	53                   	push   %ebx
      7b:	e8 fc ff ff ff       	call   7c <show_stat+0x1a>
      80:	83 c4 10             	add    $0x10,%esp
      83:	83 c3 01             	add    $0x1,%ebx
      86:	83 fb 40             	cmp    $0x40,%ebx
      89:	75 e0                	jne    6b <show_stat+0x9>
      8b:	83 c4 08             	add    $0x8,%esp
      8e:	5b                   	pop    %ebx
      8f:	c3                   	ret    

00000090 <get_current_apic_id>:
      90:	53                   	push   %ebx
      91:	b8 01 00 00 00       	mov    $0x1,%eax
      96:	0f a2                	cpuid  
      98:	c1 eb 18             	shr    $0x18,%ebx
      9b:	89 d8                	mov    %ebx,%eax
      9d:	5b                   	pop    %ebx
      9e:	c3                   	ret    

0000009f <get_apic_info>:
      9f:	8b 54 24 04          	mov    0x4(%esp),%edx
      a3:	3b 15 04 00 00 00    	cmp    0x4,%edx
      a9:	74 32                	je     dd <get_apic_info+0x3e>
      ab:	3b 15 1c 00 00 00    	cmp    0x1c,%edx
      b1:	74 1c                	je     cf <get_apic_info+0x30>
      b3:	3b 15 34 00 00 00    	cmp    0x34,%edx
      b9:	74 1b                	je     d6 <get_apic_info+0x37>
      bb:	b8 00 00 00 00       	mov    $0x0,%eax
      c0:	39 15 4c 00 00 00    	cmp    %edx,0x4c
      c6:	75 24                	jne    ec <get_apic_info+0x4d>
      c8:	b8 03 00 00 00       	mov    $0x3,%eax
      cd:	eb 13                	jmp    e2 <get_apic_info+0x43>
      cf:	b8 01 00 00 00       	mov    $0x1,%eax
      d4:	eb 0c                	jmp    e2 <get_apic_info+0x43>
      d6:	b8 02 00 00 00       	mov    $0x2,%eax
      db:	eb 05                	jmp    e2 <get_apic_info+0x43>
      dd:	b8 00 00 00 00       	mov    $0x0,%eax
      e2:	8d 04 40             	lea    (%eax,%eax,2),%eax
      e5:	8d 04 c5 00 00 00 00 	lea    0x0(,%eax,8),%eax
      ec:	f3 c3                	repz ret 

000000ee <get_current_task>:
      ee:	e8 fc ff ff ff       	call   ef <get_current_task+0x1>
      f3:	50                   	push   %eax
      f4:	e8 fc ff ff ff       	call   f5 <get_current_task+0x7>
      f9:	83 c4 04             	add    $0x4,%esp
      fc:	8b 40 14             	mov    0x14(%eax),%eax
      ff:	c3                   	ret    

00000100 <sys_alarm>:
     100:	56                   	push   %esi
     101:	53                   	push   %ebx
     102:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     106:	e8 fc ff ff ff       	call   107 <sys_alarm+0x7>
     10b:	89 c6                	mov    %eax,%esi
     10d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
     113:	85 c0                	test   %eax,%eax
     115:	74 1b                	je     132 <sys_alarm+0x32>
     117:	8b 15 00 00 00 00    	mov    0x0,%edx
     11d:	29 d0                	sub    %edx,%eax
     11f:	89 c1                	mov    %eax,%ecx
     121:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
     126:	f7 ea                	imul   %edx
     128:	89 d0                	mov    %edx,%eax
     12a:	c1 f8 05             	sar    $0x5,%eax
     12d:	c1 f9 1f             	sar    $0x1f,%ecx
     130:	29 c8                	sub    %ecx,%eax
     132:	85 db                	test   %ebx,%ebx
     134:	7e 0d                	jle    143 <sys_alarm+0x43>
     136:	8b 15 00 00 00 00    	mov    0x0,%edx
     13c:	6b db 64             	imul   $0x64,%ebx,%ebx
     13f:	01 d3                	add    %edx,%ebx
     141:	eb 05                	jmp    148 <sys_alarm+0x48>
     143:	bb 00 00 00 00       	mov    $0x0,%ebx
     148:	89 9e 4c 02 00 00    	mov    %ebx,0x24c(%esi)
     14e:	5b                   	pop    %ebx
     14f:	5e                   	pop    %esi
     150:	c3                   	ret    

00000151 <sys_getpid>:
     151:	e8 fc ff ff ff       	call   152 <sys_getpid+0x1>
     156:	8b 80 2c 02 00 00    	mov    0x22c(%eax),%eax
     15c:	c3                   	ret    

0000015d <sys_getppid>:
     15d:	e8 fc ff ff ff       	call   15e <sys_getppid+0x1>
     162:	8b 80 30 02 00 00    	mov    0x230(%eax),%eax
     168:	c3                   	ret    

00000169 <sys_getuid>:
     169:	e8 fc ff ff ff       	call   16a <sys_getuid+0x1>
     16e:	0f b7 80 40 02 00 00 	movzwl 0x240(%eax),%eax
     175:	c3                   	ret    

00000176 <sys_geteuid>:
     176:	e8 fc ff ff ff       	call   177 <sys_geteuid+0x1>
     17b:	0f b7 80 42 02 00 00 	movzwl 0x242(%eax),%eax
     182:	c3                   	ret    

00000183 <sys_getgid>:
     183:	e8 fc ff ff ff       	call   184 <sys_getgid+0x1>
     188:	0f b7 80 46 02 00 00 	movzwl 0x246(%eax),%eax
     18f:	c3                   	ret    

00000190 <sys_getegid>:
     190:	e8 fc ff ff ff       	call   191 <sys_getegid+0x1>
     195:	0f b7 80 48 02 00 00 	movzwl 0x248(%eax),%eax
     19c:	c3                   	ret    

0000019d <sys_nice>:
     19d:	e8 fc ff ff ff       	call   19e <sys_nice+0x1>
     1a2:	8b 50 08             	mov    0x8(%eax),%edx
     1a5:	2b 54 24 04          	sub    0x4(%esp),%edx
     1a9:	85 d2                	test   %edx,%edx
     1ab:	7e 03                	jle    1b0 <sys_nice+0x13>
     1ad:	89 50 08             	mov    %edx,0x8(%eax)
     1b0:	b8 00 00 00 00       	mov    $0x0,%eax
     1b5:	c3                   	ret    

000001b6 <reset_cpu_load>:
     1b6:	c7 05 10 00 00 00 00 	movl   $0x0,0x10
     1bd:	00 00 00 
     1c0:	c7 05 28 00 00 00 00 	movl   $0x0,0x28
     1c7:	00 00 00 
     1ca:	c7 05 40 00 00 00 00 	movl   $0x0,0x40
     1d1:	00 00 00 
     1d4:	c7 05 58 00 00 00 00 	movl   $0x0,0x58
     1db:	00 00 00 
     1de:	c3                   	ret    

000001df <get_min_load_ap>:
     1df:	53                   	push   %ebx
     1e0:	a1 28 00 00 00       	mov    0x28,%eax
     1e5:	83 f8 ff             	cmp    $0xffffffff,%eax
     1e8:	0f 94 c2             	sete   %dl
     1eb:	0f b6 d2             	movzbl %dl,%edx
     1ee:	8b 0d 40 00 00 00    	mov    0x40,%ecx
     1f4:	83 f9 ff             	cmp    $0xffffffff,%ecx
     1f7:	74 0b                	je     204 <get_min_load_ap+0x25>
     1f9:	39 c1                	cmp    %eax,%ecx
     1fb:	19 c0                	sbb    %eax,%eax
     1fd:	f7 d0                	not    %eax
     1ff:	83 c0 02             	add    $0x2,%eax
     202:	eb 08                	jmp    20c <get_min_load_ap+0x2d>
     204:	83 c2 01             	add    $0x1,%edx
     207:	b8 01 00 00 00       	mov    $0x1,%eax
     20c:	8b 0d 58 00 00 00    	mov    0x58,%ecx
     212:	83 f9 ff             	cmp    $0xffffffff,%ecx
     215:	75 05                	jne    21c <get_min_load_ap+0x3d>
     217:	83 c2 01             	add    $0x1,%edx
     21a:	eb 15                	jmp    231 <get_min_load_ap+0x52>
     21c:	8d 1c 40             	lea    (%eax,%eax,2),%ebx
     21f:	8d 1c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ebx
     226:	3b 4b 10             	cmp    0x10(%ebx),%ecx
     229:	b9 03 00 00 00       	mov    $0x3,%ecx
     22e:	0f 42 c1             	cmovb  %ecx,%eax
     231:	83 fa 03             	cmp    $0x3,%edx
     234:	75 0c                	jne    242 <get_min_load_ap+0x63>
     236:	e8 fc ff ff ff       	call   237 <get_min_load_ap+0x58>
     23b:	a1 4c 00 00 00       	mov    0x4c,%eax
     240:	eb 0a                	jmp    24c <get_min_load_ap+0x6d>
     242:	8d 04 40             	lea    (%eax,%eax,2),%eax
     245:	8b 04 c5 04 00 00 00 	mov    0x4(,%eax,8),%eax
     24c:	5b                   	pop    %ebx
     24d:	c3                   	ret    

0000024e <send_IPI>:
     24e:	53                   	push   %ebx
     24f:	8b 44 24 08          	mov    0x8(%esp),%eax
     253:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
     257:	8b 15 00 00 00 00    	mov    0x0,%edx
     25d:	83 c2 10             	add    $0x10,%edx
     260:	c1 e0 18             	shl    $0x18,%eax
     263:	89 02                	mov    %eax,(%edx)
     265:	8b 15 00 00 00 00    	mov    0x0,%edx
     26b:	81 c3 00 40 00 00    	add    $0x4000,%ebx
     271:	89 1a                	mov    %ebx,(%edx)
     273:	31 c0                	xor    %eax,%eax
     275:	8b 02                	mov    (%edx),%eax
     277:	25 00 10 00 00       	and    $0x1000,%eax
     27c:	83 f8 00             	cmp    $0x0,%eax
     27f:	75 f2                	jne    273 <send_IPI+0x25>
     281:	5b                   	pop    %ebx
     282:	c3                   	ret    

00000283 <send_EOI>:
     283:	e8 fc ff ff ff       	call   284 <send_EOI+0x1>
     288:	50                   	push   %eax
     289:	e8 fc ff ff ff       	call   28a <send_EOI+0x7>
     28e:	83 c4 04             	add    $0x4,%esp
     291:	85 c0                	test   %eax,%eax
     293:	74 0e                	je     2a3 <send_EOI+0x20>
     295:	8b 40 08             	mov    0x8(%eax),%eax
     298:	05 b0 00 00 00       	add    $0xb0,%eax
     29d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     2a3:	f3 c3                	repz ret 

000002a5 <get_apic_index>:
     2a5:	8b 54 24 04          	mov    0x4(%esp),%edx
     2a9:	3b 15 04 00 00 00    	cmp    0x4,%edx
     2af:	74 2f                	je     2e0 <get_apic_index+0x3b>
     2b1:	3b 15 1c 00 00 00    	cmp    0x1c,%edx
     2b7:	74 1b                	je     2d4 <get_apic_index+0x2f>
     2b9:	3b 15 34 00 00 00    	cmp    0x34,%edx
     2bf:	74 19                	je     2da <get_apic_index+0x35>
     2c1:	b8 00 00 00 00       	mov    $0x0,%eax
     2c6:	39 15 4c 00 00 00    	cmp    %edx,0x4c
     2cc:	75 17                	jne    2e5 <get_apic_index+0x40>
     2ce:	b8 03 00 00 00       	mov    $0x3,%eax
     2d3:	c3                   	ret    
     2d4:	b8 01 00 00 00       	mov    $0x1,%eax
     2d9:	c3                   	ret    
     2da:	b8 02 00 00 00       	mov    $0x2,%eax
     2df:	c3                   	ret    
     2e0:	b8 00 00 00 00       	mov    $0x0,%eax
     2e5:	f3 c3                	repz ret 

000002e7 <math_state_restore>:
     2e7:	e8 fc ff ff ff       	call   2e8 <math_state_restore+0x1>
     2ec:	8b 15 00 00 00 00    	mov    0x0,%edx
     2f2:	39 d0                	cmp    %edx,%eax
     2f4:	74 2c                	je     322 <math_state_restore+0x3b>
     2f6:	9b                   	fwait
     2f7:	85 d2                	test   %edx,%edx
     2f9:	74 06                	je     301 <math_state_restore+0x1a>
     2fb:	dd b2 50 03 00 00    	fnsave 0x350(%edx)
     301:	a3 00 00 00 00       	mov    %eax,0x0
     306:	66 83 b8 64 02 00 00 	cmpw   $0x0,0x264(%eax)
     30d:	00 
     30e:	74 07                	je     317 <math_state_restore+0x30>
     310:	dd a0 50 03 00 00    	frstor 0x350(%eax)
     316:	c3                   	ret    
     317:	db e3                	fninit 
     319:	66 c7 80 64 02 00 00 	movw   $0x1,0x264(%eax)
     320:	01 00 
     322:	f3 c3                	repz ret 

00000324 <schedule>:
     324:	55                   	push   %ebp
     325:	57                   	push   %edi
     326:	56                   	push   %esi
     327:	53                   	push   %ebx
     328:	83 ec 1c             	sub    $0x1c,%esp
     32b:	e8 fc ff ff ff       	call   32c <schedule+0x8>
     330:	89 c6                	mov    %eax,%esi
     332:	50                   	push   %eax
     333:	e8 fc ff ff ff       	call   334 <schedule+0x10>
     338:	83 c4 04             	add    $0x4,%esp
     33b:	89 c3                	mov    %eax,%ebx
     33d:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
     344:	75 f7                	jne    33d <schedule+0x19>
     346:	b8 01 00 00 00       	mov    $0x1,%eax
     34b:	f0 87 05 00 00 00 00 	lock xchg %eax,0x0
     352:	83 f8 00             	cmp    $0x0,%eax
     355:	75 e6                	jne    33d <schedule+0x19>
     357:	ba fc 00 00 00       	mov    $0xfc,%edx
     35c:	8b 02                	mov    (%edx),%eax
     35e:	85 c0                	test   %eax,%eax
     360:	74 46                	je     3a8 <schedule+0x84>
     362:	8b 88 4c 02 00 00    	mov    0x24c(%eax),%ecx
     368:	85 c9                	test   %ecx,%ecx
     36a:	74 1d                	je     389 <schedule+0x65>
     36c:	8b 3d 00 00 00 00    	mov    0x0,%edi
     372:	39 f9                	cmp    %edi,%ecx
     374:	7d 13                	jge    389 <schedule+0x65>
     376:	81 48 0c 00 20 00 00 	orl    $0x2000,0xc(%eax)
     37d:	8b 02                	mov    (%edx),%eax
     37f:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
     386:	00 00 00 
     389:	8b 0a                	mov    (%edx),%ecx
     38b:	8b 81 10 02 00 00    	mov    0x210(%ecx),%eax
     391:	25 ff fe fb ff       	and    $0xfffbfeff,%eax
     396:	f7 d0                	not    %eax
     398:	85 41 0c             	test   %eax,0xc(%ecx)
     39b:	74 0b                	je     3a8 <schedule+0x84>
     39d:	83 39 01             	cmpl   $0x1,(%ecx)
     3a0:	75 06                	jne    3a8 <schedule+0x84>
     3a2:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
     3a8:	83 ea 04             	sub    $0x4,%edx
     3ab:	81 fa 00 00 00 00    	cmp    $0x0,%edx
     3b1:	75 a9                	jne    35c <schedule+0x38>
     3b3:	b8 3f 00 00 00       	mov    $0x3f,%eax
     3b8:	bd ff ff ff ff       	mov    $0xffffffff,%ebp
     3bd:	bf 00 00 00 00       	mov    $0x0,%edi
     3c2:	8b 14 85 00 00 00 00 	mov    0x0(,%eax,4),%edx
     3c9:	85 d2                	test   %edx,%edx
     3cb:	74 19                	je     3e6 <schedule+0xc2>
     3cd:	83 3a 00             	cmpl   $0x0,(%edx)
     3d0:	75 14                	jne    3e6 <schedule+0xc2>
     3d2:	8b 4a 04             	mov    0x4(%edx),%ecx
     3d5:	39 e9                	cmp    %ebp,%ecx
     3d7:	7e 0d                	jle    3e6 <schedule+0xc2>
     3d9:	83 ba bc 03 00 00 00 	cmpl   $0x0,0x3bc(%edx)
     3e0:	0f 44 e9             	cmove  %ecx,%ebp
     3e3:	0f 44 f8             	cmove  %eax,%edi
     3e6:	83 e8 01             	sub    $0x1,%eax
     3e9:	75 d7                	jne    3c2 <schedule+0x9e>
     3eb:	85 ed                	test   %ebp,%ebp
     3ed:	75 23                	jne    412 <schedule+0xee>
     3ef:	b9 fc 00 00 00       	mov    $0xfc,%ecx
     3f4:	8b 11                	mov    (%ecx),%edx
     3f6:	85 d2                	test   %edx,%edx
     3f8:	74 0b                	je     405 <schedule+0xe1>
     3fa:	8b 42 04             	mov    0x4(%edx),%eax
     3fd:	d1 f8                	sar    %eax
     3ff:	03 42 08             	add    0x8(%edx),%eax
     402:	89 42 04             	mov    %eax,0x4(%edx)
     405:	83 e9 04             	sub    $0x4,%ecx
     408:	81 f9 00 00 00 00    	cmp    $0x0,%ecx
     40e:	75 e4                	jne    3f4 <schedule+0xd0>
     410:	eb a1                	jmp    3b3 <schedule+0x8f>
     412:	3b 35 04 00 00 00    	cmp    0x4,%esi
     418:	75 77                	jne    491 <schedule+0x16d>
     41a:	e8 fc ff ff ff       	call   41b <schedule+0xf7>
     41f:	89 c5                	mov    %eax,%ebp
     421:	39 c6                	cmp    %eax,%esi
     423:	0f 84 dd 00 00 00    	je     506 <schedule+0x1e2>
     429:	8b 04 bd 00 00 00 00 	mov    0x0(,%edi,4),%eax
     430:	3b 05 00 00 00 00    	cmp    0x0,%eax
     436:	0f 84 ca 00 00 00    	je     506 <schedule+0x1e2>
     43c:	3b 05 04 00 00 00    	cmp    0x4,%eax
     442:	0f 84 be 00 00 00    	je     506 <schedule+0x1e2>
     448:	83 ec 0c             	sub    $0xc,%esp
     44b:	68 17 00 00 00       	push   $0x17
     450:	e8 fc ff ff ff       	call   451 <schedule+0x12d>
     455:	83 c4 08             	add    $0x8,%esp
     458:	68 82 00 00 00       	push   $0x82
     45d:	55                   	push   %ebp
     45e:	e8 fc ff ff ff       	call   45f <schedule+0x13b>
     463:	c7 04 24 29 00 00 00 	movl   $0x29,(%esp)
     46a:	e8 fc ff ff ff       	call   46b <schedule+0x147>
     46f:	8d 44 2d 00          	lea    0x0(%ebp,%ebp,1),%eax
     473:	8d 14 28             	lea    (%eax,%ebp,1),%edx
     476:	8b 04 d5 10 00 00 00 	mov    0x10(,%edx,8),%eax
     47d:	83 c0 01             	add    $0x1,%eax
     480:	89 04 d5 10 00 00 00 	mov    %eax,0x10(,%edx,8)
     487:	83 c4 10             	add    $0x10,%esp
     48a:	bf 01 00 00 00       	mov    $0x1,%edi
     48f:	eb 75                	jmp    506 <schedule+0x1e2>
     491:	8b 04 bd 00 00 00 00 	mov    0x0(,%edi,4),%eax
     498:	3b 05 00 00 00 00    	cmp    0x0,%eax
     49e:	74 08                	je     4a8 <schedule+0x184>
     4a0:	3b 05 04 00 00 00    	cmp    0x4,%eax
     4a6:	75 19                	jne    4c1 <schedule+0x19d>
     4a8:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
     4af:	7e 07                	jle    4b8 <schedule+0x194>
     4b1:	83 2d 00 00 00 00 01 	subl   $0x1,0x0
     4b8:	83 7b 14 00          	cmpl   $0x0,0x14(%ebx)
     4bc:	75 5a                	jne    518 <schedule+0x1f4>
     4be:	f4                   	hlt    
     4bf:	eb 19                	jmp    4da <schedule+0x1b6>
     4c1:	8b 53 14             	mov    0x14(%ebx),%edx
     4c4:	c7 82 bc 03 00 00 00 	movl   $0x0,0x3bc(%edx)
     4cb:	00 00 00 
     4ce:	c7 80 bc 03 00 00 01 	movl   $0x1,0x3bc(%eax)
     4d5:	00 00 00 
     4d8:	eb 2c                	jmp    506 <schedule+0x1e2>
     4da:	89 fa                	mov    %edi,%edx
     4dc:	c1 e2 04             	shl    $0x4,%edx
     4df:	83 c2 20             	add    $0x20,%edx
     4e2:	8b 0c bd 00 00 00 00 	mov    0x0(,%edi,4),%ecx
     4e9:	39 4b 14             	cmp    %ecx,0x14(%ebx)
     4ec:	74 16                	je     504 <schedule+0x1e0>
     4ee:	66 89 54 24 0c       	mov    %dx,0xc(%esp)
     4f3:	87 4b 14             	xchg   %ecx,0x14(%ebx)
     4f6:	ff 6c 24 08          	ljmp   *0x8(%esp)
     4fa:	39 0d 00 00 00 00    	cmp    %ecx,0x0
     500:	75 02                	jne    504 <schedule+0x1e0>
     502:	0f 06                	clts   
     504:	eb 12                	jmp    518 <schedule+0x1f4>
     506:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
     50d:	7e 07                	jle    516 <schedule+0x1f2>
     50f:	83 2d 00 00 00 00 01 	subl   $0x1,0x0
     516:	eb c2                	jmp    4da <schedule+0x1b6>
     518:	83 c4 1c             	add    $0x1c,%esp
     51b:	5b                   	pop    %ebx
     51c:	5e                   	pop    %esi
     51d:	5f                   	pop    %edi
     51e:	5d                   	pop    %ebp
     51f:	c3                   	ret    

00000520 <sys_pause>:
     520:	83 ec 0c             	sub    $0xc,%esp
     523:	e8 fc ff ff ff       	call   524 <sys_pause+0x4>
     528:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
     52e:	e8 fc ff ff ff       	call   52f <sys_pause+0xf>
     533:	b8 00 00 00 00       	mov    $0x0,%eax
     538:	83 c4 0c             	add    $0xc,%esp
     53b:	c3                   	ret    

0000053c <sleep_on>:
     53c:	57                   	push   %edi
     53d:	56                   	push   %esi
     53e:	53                   	push   %ebx
     53f:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     543:	e8 fc ff ff ff       	call   544 <sleep_on+0x8>
     548:	85 db                	test   %ebx,%ebx
     54a:	74 32                	je     57e <sleep_on+0x42>
     54c:	89 c6                	mov    %eax,%esi
     54e:	3d 00 00 00 00       	cmp    $0x0,%eax
     553:	75 10                	jne    565 <sleep_on+0x29>
     555:	83 ec 0c             	sub    $0xc,%esp
     558:	68 3a 00 00 00       	push   $0x3a
     55d:	e8 fc ff ff ff       	call   55e <sleep_on+0x22>
     562:	83 c4 10             	add    $0x10,%esp
     565:	8b 3b                	mov    (%ebx),%edi
     567:	89 33                	mov    %esi,(%ebx)
     569:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
     56f:	e8 fc ff ff ff       	call   570 <sleep_on+0x34>
     574:	85 ff                	test   %edi,%edi
     576:	74 06                	je     57e <sleep_on+0x42>
     578:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
     57e:	5b                   	pop    %ebx
     57f:	5e                   	pop    %esi
     580:	5f                   	pop    %edi
     581:	c3                   	ret    

00000582 <interruptible_sleep_on>:
     582:	57                   	push   %edi
     583:	56                   	push   %esi
     584:	53                   	push   %ebx
     585:	8b 74 24 10          	mov    0x10(%esp),%esi
     589:	e8 fc ff ff ff       	call   58a <interruptible_sleep_on+0x8>
     58e:	85 f6                	test   %esi,%esi
     590:	74 46                	je     5d8 <interruptible_sleep_on+0x56>
     592:	89 c3                	mov    %eax,%ebx
     594:	3d 00 00 00 00       	cmp    $0x0,%eax
     599:	75 10                	jne    5ab <interruptible_sleep_on+0x29>
     59b:	83 ec 0c             	sub    $0xc,%esp
     59e:	68 3a 00 00 00       	push   $0x3a
     5a3:	e8 fc ff ff ff       	call   5a4 <interruptible_sleep_on+0x22>
     5a8:	83 c4 10             	add    $0x10,%esp
     5ab:	8b 3e                	mov    (%esi),%edi
     5ad:	89 1e                	mov    %ebx,(%esi)
     5af:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
     5b5:	e8 fc ff ff ff       	call   5b6 <interruptible_sleep_on+0x34>
     5ba:	8b 06                	mov    (%esi),%eax
     5bc:	39 c3                	cmp    %eax,%ebx
     5be:	74 0c                	je     5cc <interruptible_sleep_on+0x4a>
     5c0:	85 c0                	test   %eax,%eax
     5c2:	74 08                	je     5cc <interruptible_sleep_on+0x4a>
     5c4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     5ca:	eb e3                	jmp    5af <interruptible_sleep_on+0x2d>
     5cc:	89 3e                	mov    %edi,(%esi)
     5ce:	85 ff                	test   %edi,%edi
     5d0:	74 06                	je     5d8 <interruptible_sleep_on+0x56>
     5d2:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
     5d8:	5b                   	pop    %ebx
     5d9:	5e                   	pop    %esi
     5da:	5f                   	pop    %edi
     5db:	c3                   	ret    

000005dc <wake_up>:
     5dc:	8b 44 24 04          	mov    0x4(%esp),%eax
     5e0:	85 c0                	test   %eax,%eax
     5e2:	74 0c                	je     5f0 <wake_up+0x14>
     5e4:	8b 00                	mov    (%eax),%eax
     5e6:	85 c0                	test   %eax,%eax
     5e8:	74 06                	je     5f0 <wake_up+0x14>
     5ea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     5f0:	f3 c3                	repz ret 

000005f2 <ticks_to_floppy_on>:
     5f2:	56                   	push   %esi
     5f3:	53                   	push   %ebx
     5f4:	83 ec 04             	sub    $0x4,%esp
     5f7:	8b 74 24 10          	mov    0x10(%esp),%esi
     5fb:	b8 10 00 00 00       	mov    $0x10,%eax
     600:	89 f1                	mov    %esi,%ecx
     602:	d3 e0                	shl    %cl,%eax
     604:	89 c3                	mov    %eax,%ebx
     606:	83 fe 03             	cmp    $0x3,%esi
     609:	76 10                	jbe    61b <ticks_to_floppy_on+0x29>
     60b:	83 ec 0c             	sub    $0xc,%esp
     60e:	68 52 00 00 00       	push   $0x52
     613:	e8 fc ff ff ff       	call   614 <ticks_to_floppy_on+0x22>
     618:	83 c4 10             	add    $0x10,%esp
     61b:	c7 04 b5 20 03 00 00 	movl   $0x2710,0x320(,%esi,4)
     622:	10 27 00 00 
     626:	fa                   	cli    
     627:	0f b6 0d 00 00 00 00 	movzbl 0x0,%ecx
     62e:	89 d8                	mov    %ebx,%eax
     630:	09 c8                	or     %ecx,%eax
     632:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0
     639:	75 05                	jne    640 <ticks_to_floppy_on+0x4e>
     63b:	83 e0 fc             	and    $0xfffffffc,%eax
     63e:	09 f0                	or     %esi,%eax
     640:	38 c8                	cmp    %cl,%al
     642:	74 34                	je     678 <ticks_to_floppy_on+0x86>
     644:	ba f2 03 00 00       	mov    $0x3f2,%edx
     649:	ee                   	out    %al,(%dx)
     64a:	31 c1                	xor    %eax,%ecx
     64c:	f6 c1 f0             	test   $0xf0,%cl
     64f:	74 0d                	je     65e <ticks_to_floppy_on+0x6c>
     651:	c7 04 b5 30 03 00 00 	movl   $0x32,0x330(,%esi,4)
     658:	32 00 00 00 
     65c:	eb 15                	jmp    673 <ticks_to_floppy_on+0x81>
     65e:	83 3c b5 30 03 00 00 	cmpl   $0x1,0x330(,%esi,4)
     665:	01 
     666:	7f 0b                	jg     673 <ticks_to_floppy_on+0x81>
     668:	c7 04 b5 30 03 00 00 	movl   $0x2,0x330(,%esi,4)
     66f:	02 00 00 00 
     673:	a2 00 00 00 00       	mov    %al,0x0
     678:	fb                   	sti    
     679:	8b 04 b5 30 03 00 00 	mov    0x330(,%esi,4),%eax
     680:	83 c4 04             	add    $0x4,%esp
     683:	5b                   	pop    %ebx
     684:	5e                   	pop    %esi
     685:	c3                   	ret    

00000686 <floppy_on>:
     686:	56                   	push   %esi
     687:	53                   	push   %ebx
     688:	83 ec 04             	sub    $0x4,%esp
     68b:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     68f:	fa                   	cli    
     690:	8d 34 9d 40 03 00 00 	lea    0x340(,%ebx,4),%esi
     697:	eb 0c                	jmp    6a5 <floppy_on+0x1f>
     699:	83 ec 0c             	sub    $0xc,%esp
     69c:	56                   	push   %esi
     69d:	e8 fc ff ff ff       	call   69e <floppy_on+0x18>
     6a2:	83 c4 10             	add    $0x10,%esp
     6a5:	83 ec 0c             	sub    $0xc,%esp
     6a8:	53                   	push   %ebx
     6a9:	e8 fc ff ff ff       	call   6aa <floppy_on+0x24>
     6ae:	83 c4 10             	add    $0x10,%esp
     6b1:	85 c0                	test   %eax,%eax
     6b3:	75 e4                	jne    699 <floppy_on+0x13>
     6b5:	fb                   	sti    
     6b6:	83 c4 04             	add    $0x4,%esp
     6b9:	5b                   	pop    %ebx
     6ba:	5e                   	pop    %esi
     6bb:	c3                   	ret    

000006bc <floppy_off>:
     6bc:	8b 44 24 04          	mov    0x4(%esp),%eax
     6c0:	c7 04 85 20 03 00 00 	movl   $0x12c,0x320(,%eax,4)
     6c7:	2c 01 00 00 
     6cb:	c3                   	ret    

000006cc <do_floppy_timer>:
     6cc:	57                   	push   %edi
     6cd:	56                   	push   %esi
     6ce:	53                   	push   %ebx
     6cf:	bb 00 00 00 00       	mov    $0x0,%ebx
     6d4:	be 10 00 00 00       	mov    $0x10,%esi
     6d9:	bf f2 03 00 00       	mov    $0x3f2,%edi
     6de:	0f b6 05 00 00 00 00 	movzbl 0x0,%eax
     6e5:	89 f1                	mov    %esi,%ecx
     6e7:	84 c8                	test   %cl,%al
     6e9:	74 4b                	je     736 <do_floppy_timer+0x6a>
     6eb:	8b 93 30 03 00 00    	mov    0x330(%ebx),%edx
     6f1:	85 d2                	test   %edx,%edx
     6f3:	74 1e                	je     713 <do_floppy_timer+0x47>
     6f5:	83 ea 01             	sub    $0x1,%edx
     6f8:	89 93 30 03 00 00    	mov    %edx,0x330(%ebx)
     6fe:	85 d2                	test   %edx,%edx
     700:	75 34                	jne    736 <do_floppy_timer+0x6a>
     702:	8d 83 40 03 00 00    	lea    0x340(%ebx),%eax
     708:	50                   	push   %eax
     709:	e8 fc ff ff ff       	call   70a <do_floppy_timer+0x3e>
     70e:	83 c4 04             	add    $0x4,%esp
     711:	eb 23                	jmp    736 <do_floppy_timer+0x6a>
     713:	8b 93 20 03 00 00    	mov    0x320(%ebx),%edx
     719:	85 d2                	test   %edx,%edx
     71b:	75 10                	jne    72d <do_floppy_timer+0x61>
     71d:	89 f2                	mov    %esi,%edx
     71f:	f7 d2                	not    %edx
     721:	21 d0                	and    %edx,%eax
     723:	a2 00 00 00 00       	mov    %al,0x0
     728:	89 fa                	mov    %edi,%edx
     72a:	ee                   	out    %al,(%dx)
     72b:	eb 09                	jmp    736 <do_floppy_timer+0x6a>
     72d:	83 ea 01             	sub    $0x1,%edx
     730:	89 93 20 03 00 00    	mov    %edx,0x320(%ebx)
     736:	01 f6                	add    %esi,%esi
     738:	83 c3 04             	add    $0x4,%ebx
     73b:	83 fb 10             	cmp    $0x10,%ebx
     73e:	75 9e                	jne    6de <do_floppy_timer+0x12>
     740:	5b                   	pop    %ebx
     741:	5e                   	pop    %esi
     742:	5f                   	pop    %edi
     743:	c3                   	ret    

00000744 <add_timer>:
     744:	57                   	push   %edi
     745:	56                   	push   %esi
     746:	53                   	push   %ebx
     747:	8b 74 24 10          	mov    0x10(%esp),%esi
     74b:	8b 7c 24 14          	mov    0x14(%esp),%edi
     74f:	85 ff                	test   %edi,%edi
     751:	0f 84 99 00 00 00    	je     7f0 <add_timer+0xac>
     757:	fa                   	cli    
     758:	85 f6                	test   %esi,%esi
     75a:	7e 14                	jle    770 <add_timer+0x2c>
     75c:	83 3d 24 00 00 00 00 	cmpl   $0x0,0x24
     763:	0f 84 80 00 00 00    	je     7e9 <add_timer+0xa5>
     769:	bb 20 00 00 00       	mov    $0x20,%ebx
     76e:	eb 0a                	jmp    77a <add_timer+0x36>
     770:	ff d7                	call   *%edi
     772:	eb 60                	jmp    7d4 <add_timer+0x90>
     774:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
     778:	74 0d                	je     787 <add_timer+0x43>
     77a:	83 c3 0c             	add    $0xc,%ebx
     77d:	81 fb 20 03 00 00    	cmp    $0x320,%ebx
     783:	75 ef                	jne    774 <add_timer+0x30>
     785:	eb 50                	jmp    7d7 <add_timer+0x93>
     787:	89 7b 04             	mov    %edi,0x4(%ebx)
     78a:	89 33                	mov    %esi,(%ebx)
     78c:	8b 15 10 00 00 00    	mov    0x10,%edx
     792:	89 53 08             	mov    %edx,0x8(%ebx)
     795:	89 1d 10 00 00 00    	mov    %ebx,0x10
     79b:	85 d2                	test   %edx,%edx
     79d:	74 35                	je     7d4 <add_timer+0x90>
     79f:	8b 0a                	mov    (%edx),%ecx
     7a1:	39 ce                	cmp    %ecx,%esi
     7a3:	7e 2f                	jle    7d4 <add_timer+0x90>
     7a5:	89 f0                	mov    %esi,%eax
     7a7:	29 c8                	sub    %ecx,%eax
     7a9:	89 03                	mov    %eax,(%ebx)
     7ab:	8b 43 04             	mov    0x4(%ebx),%eax
     7ae:	8b 4a 04             	mov    0x4(%edx),%ecx
     7b1:	89 4b 04             	mov    %ecx,0x4(%ebx)
     7b4:	89 42 04             	mov    %eax,0x4(%edx)
     7b7:	8b 13                	mov    (%ebx),%edx
     7b9:	8b 43 08             	mov    0x8(%ebx),%eax
     7bc:	8b 08                	mov    (%eax),%ecx
     7be:	89 0b                	mov    %ecx,(%ebx)
     7c0:	89 10                	mov    %edx,(%eax)
     7c2:	8b 5b 08             	mov    0x8(%ebx),%ebx
     7c5:	8b 53 08             	mov    0x8(%ebx),%edx
     7c8:	85 d2                	test   %edx,%edx
     7ca:	74 08                	je     7d4 <add_timer+0x90>
     7cc:	8b 0a                	mov    (%edx),%ecx
     7ce:	8b 03                	mov    (%ebx),%eax
     7d0:	39 c1                	cmp    %eax,%ecx
     7d2:	7c d3                	jl     7a7 <add_timer+0x63>
     7d4:	fb                   	sti    
     7d5:	eb 19                	jmp    7f0 <add_timer+0xac>
     7d7:	83 ec 0c             	sub    $0xc,%esp
     7da:	68 62 00 00 00       	push   $0x62
     7df:	e8 fc ff ff ff       	call   7e0 <add_timer+0x9c>
     7e4:	83 c4 10             	add    $0x10,%esp
     7e7:	eb 9e                	jmp    787 <add_timer+0x43>
     7e9:	bb 20 00 00 00       	mov    $0x20,%ebx
     7ee:	eb 97                	jmp    787 <add_timer+0x43>
     7f0:	5b                   	pop    %ebx
     7f1:	5e                   	pop    %esi
     7f2:	5f                   	pop    %edi
     7f3:	c3                   	ret    

000007f4 <do_timer>:
     7f4:	56                   	push   %esi
     7f5:	53                   	push   %ebx
     7f6:	83 ec 04             	sub    $0x4,%esp
     7f9:	8b 74 24 10          	mov    0x10(%esp),%esi
     7fd:	e8 fc ff ff ff       	call   7fe <do_timer+0xa>
     802:	89 c3                	mov    %eax,%ebx
     804:	a1 00 00 00 00       	mov    0x0,%eax
     809:	85 c0                	test   %eax,%eax
     80b:	74 11                	je     81e <do_timer+0x2a>
     80d:	83 e8 01             	sub    $0x1,%eax
     810:	a3 00 00 00 00       	mov    %eax,0x0
     815:	85 c0                	test   %eax,%eax
     817:	75 05                	jne    81e <do_timer+0x2a>
     819:	e8 fc ff ff ff       	call   81a <do_timer+0x26>
     81e:	85 f6                	test   %esi,%esi
     820:	74 09                	je     82b <do_timer+0x37>
     822:	83 83 50 02 00 00 01 	addl   $0x1,0x250(%ebx)
     829:	eb 07                	jmp    832 <do_timer+0x3e>
     82b:	83 83 54 02 00 00 01 	addl   $0x1,0x254(%ebx)
     832:	a1 10 00 00 00       	mov    0x10,%eax
     837:	85 c0                	test   %eax,%eax
     839:	74 2d                	je     868 <do_timer+0x74>
     83b:	8b 08                	mov    (%eax),%ecx
     83d:	8d 51 ff             	lea    -0x1(%ecx),%edx
     840:	89 10                	mov    %edx,(%eax)
     842:	85 d2                	test   %edx,%edx
     844:	7f 22                	jg     868 <do_timer+0x74>
     846:	8b 50 04             	mov    0x4(%eax),%edx
     849:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     850:	8b 40 08             	mov    0x8(%eax),%eax
     853:	a3 10 00 00 00       	mov    %eax,0x10
     858:	ff d2                	call   *%edx
     85a:	a1 10 00 00 00       	mov    0x10,%eax
     85f:	85 c0                	test   %eax,%eax
     861:	74 05                	je     868 <do_timer+0x74>
     863:	83 38 00             	cmpl   $0x0,(%eax)
     866:	7e de                	jle    846 <do_timer+0x52>
     868:	f6 05 00 00 00 00 f0 	testb  $0xf0,0x0
     86f:	74 05                	je     876 <do_timer+0x82>
     871:	e8 fc ff ff ff       	call   872 <do_timer+0x7e>
     876:	8b 43 04             	mov    0x4(%ebx),%eax
     879:	83 e8 01             	sub    $0x1,%eax
     87c:	85 c0                	test   %eax,%eax
     87e:	7e 05                	jle    885 <do_timer+0x91>
     880:	89 43 04             	mov    %eax,0x4(%ebx)
     883:	eb 10                	jmp    895 <do_timer+0xa1>
     885:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
     88c:	85 f6                	test   %esi,%esi
     88e:	74 05                	je     895 <do_timer+0xa1>
     890:	e8 fc ff ff ff       	call   891 <do_timer+0x9d>
     895:	83 c4 04             	add    $0x4,%esp
     898:	5b                   	pop    %ebx
     899:	5e                   	pop    %esi
     89a:	c3                   	ret    

0000089b <sched_init>:
     89b:	b8 e8 02 00 00       	mov    $0x2e8,%eax
     8a0:	66 c7 05 20 00 00 00 	movw   $0x68,0x20
     8a7:	68 00 
     8a9:	66 a3 22 00 00 00    	mov    %ax,0x22
     8af:	c1 c8 10             	ror    $0x10,%eax
     8b2:	a2 24 00 00 00       	mov    %al,0x24
     8b7:	c6 05 25 00 00 00 89 	movb   $0x89,0x25
     8be:	c6 05 26 00 00 00 00 	movb   $0x0,0x26
     8c5:	88 25 27 00 00 00    	mov    %ah,0x27
     8cb:	c1 c8 10             	ror    $0x10,%eax
     8ce:	b8 d0 02 00 00       	mov    $0x2d0,%eax
     8d3:	66 c7 05 28 00 00 00 	movw   $0x68,0x28
     8da:	68 00 
     8dc:	66 a3 2a 00 00 00    	mov    %ax,0x2a
     8e2:	c1 c8 10             	ror    $0x10,%eax
     8e5:	a2 2c 00 00 00       	mov    %al,0x2c
     8ea:	c6 05 2d 00 00 00 82 	movb   $0x82,0x2d
     8f1:	c6 05 2e 00 00 00 00 	movb   $0x0,0x2e
     8f8:	88 25 2f 00 00 00    	mov    %ah,0x2f
     8fe:	c1 c8 10             	ror    $0x10,%eax
     901:	ba 04 00 00 00       	mov    $0x4,%edx
     906:	b8 30 00 00 00       	mov    $0x30,%eax
     90b:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
     911:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     918:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     91e:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
     925:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     92c:	83 c0 10             	add    $0x10,%eax
     92f:	83 c2 04             	add    $0x4,%edx
     932:	3d 20 04 00 00       	cmp    $0x420,%eax
     937:	75 d2                	jne    90b <sched_init+0x70>
     939:	9c                   	pushf  
     93a:	81 24 24 ff bf ff ff 	andl   $0xffffbfff,(%esp)
     941:	9d                   	popf   
     942:	b8 20 00 00 00       	mov    $0x20,%eax
     947:	0f 00 d8             	ltr    %ax
     94a:	b8 28 00 00 00       	mov    $0x28,%eax
     94f:	0f 00 d0             	lldt   %ax
     952:	ba 43 00 00 00       	mov    $0x43,%edx
     957:	b8 36 00 00 00       	mov    $0x36,%eax
     95c:	ee                   	out    %al,(%dx)
     95d:	eb 00                	jmp    95f <sched_init+0xc4>
     95f:	eb 00                	jmp    961 <sched_init+0xc6>
     961:	ba 40 00 00 00       	mov    $0x40,%edx
     966:	b8 9b 00 00 00       	mov    $0x9b,%eax
     96b:	ee                   	out    %al,(%dx)
     96c:	eb 00                	jmp    96e <sched_init+0xd3>
     96e:	eb 00                	jmp    970 <sched_init+0xd5>
     970:	b8 2e 00 00 00       	mov    $0x2e,%eax
     975:	ee                   	out    %al,(%dx)
     976:	b8 00 00 08 00       	mov    $0x80000,%eax
     97b:	ba 00 00 00 00       	mov    $0x0,%edx
     980:	66 89 d0             	mov    %dx,%ax
     983:	66 ba 00 8e          	mov    $0x8e00,%dx
     987:	a3 00 01 00 00       	mov    %eax,0x100
     98c:	89 15 04 01 00 00    	mov    %edx,0x104
     992:	ba 21 00 00 00       	mov    $0x21,%edx
     997:	ec                   	in     (%dx),%al
     998:	eb 00                	jmp    99a <sched_init+0xff>
     99a:	eb 00                	jmp    99c <sched_init+0x101>
     99c:	25 fe 00 00 00       	and    $0xfe,%eax
     9a1:	ee                   	out    %al,(%dx)
     9a2:	b8 00 00 08 00       	mov    $0x80000,%eax
     9a7:	ba 00 00 00 00       	mov    $0x0,%edx
     9ac:	66 89 d0             	mov    %dx,%ax
     9af:	66 ba 00 ef          	mov    $0xef00,%dx
     9b3:	a3 00 04 00 00       	mov    %eax,0x400
     9b8:	89 15 04 04 00 00    	mov    %edx,0x404
     9be:	c3                   	ret    
     9bf:	90                   	nop
     9c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     9c5:	cf                   	iret   
     9c6:	66 90                	xchg   %ax,%ax
     9c8:	68 08 0a 00 00       	push   $0xa08
     9cd:	e9 fc ff ff ff       	jmp    9ce <sched_init+0x133>
     9d2:	66 90                	xchg   %ax,%ax

000009d4 <system_call>:
     9d4:	83 f8 47             	cmp    $0x47,%eax
     9d7:	77 e7                	ja     9c0 <sched_init+0x125>
     9d9:	1e                   	push   %ds
     9da:	06                   	push   %es
     9db:	0f a0                	push   %fs
     9dd:	52                   	push   %edx
     9de:	51                   	push   %ecx
     9df:	53                   	push   %ebx
     9e0:	ba 10 00 00 00       	mov    $0x10,%edx
     9e5:	8e da                	mov    %edx,%ds
     9e7:	8e c2                	mov    %edx,%es
     9e9:	ba 17 00 00 00       	mov    $0x17,%edx
     9ee:	8e e2                	mov    %edx,%fs
     9f0:	ff 14 85 00 00 00 00 	call   *0x0(,%eax,4)
     9f7:	50                   	push   %eax
     9f8:	e8 fc ff ff ff       	call   9f9 <system_call+0x25>
     9fd:	83 38 00             	cmpl   $0x0,(%eax)
     a00:	75 c6                	jne    9c8 <sched_init+0x12d>
     a02:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
     a06:	74 c0                	je     9c8 <sched_init+0x12d>
     a08:	e8 fc ff ff ff       	call   a09 <system_call+0x35>
     a0d:	3b 05 00 00 00 00    	cmp    0x0,%eax
     a13:	74 30                	je     a45 <system_call+0x71>
     a15:	66 83 7c 24 20 0f    	cmpw   $0xf,0x20(%esp)
     a1b:	75 28                	jne    a45 <system_call+0x71>
     a1d:	66 83 7c 24 2c 17    	cmpw   $0x17,0x2c(%esp)
     a23:	75 20                	jne    a45 <system_call+0x71>
     a25:	8b 58 0c             	mov    0xc(%eax),%ebx
     a28:	8b 88 10 02 00 00    	mov    0x210(%eax),%ecx
     a2e:	f7 d1                	not    %ecx
     a30:	21 d9                	and    %ebx,%ecx
     a32:	0f bc c9             	bsf    %ecx,%ecx
     a35:	74 0e                	je     a45 <system_call+0x71>
     a37:	0f b3 cb             	btr    %ecx,%ebx
     a3a:	89 58 0c             	mov    %ebx,0xc(%eax)
     a3d:	41                   	inc    %ecx
     a3e:	51                   	push   %ecx
     a3f:	e8 fc ff ff ff       	call   a40 <system_call+0x6c>
     a44:	58                   	pop    %eax
     a45:	58                   	pop    %eax
     a46:	5b                   	pop    %ebx
     a47:	59                   	pop    %ecx
     a48:	5a                   	pop    %edx
     a49:	0f a1                	pop    %fs
     a4b:	07                   	pop    %es
     a4c:	1f                   	pop    %ds
     a4d:	cf                   	iret   
     a4e:	66 90                	xchg   %ax,%ax

00000a50 <coprocessor_error>:
     a50:	1e                   	push   %ds
     a51:	06                   	push   %es
     a52:	0f a0                	push   %fs
     a54:	52                   	push   %edx
     a55:	51                   	push   %ecx
     a56:	53                   	push   %ebx
     a57:	50                   	push   %eax
     a58:	b8 10 00 00 00       	mov    $0x10,%eax
     a5d:	8e d8                	mov    %eax,%ds
     a5f:	8e c0                	mov    %eax,%es
     a61:	b8 17 00 00 00       	mov    $0x17,%eax
     a66:	8e e0                	mov    %eax,%fs
     a68:	68 08 0a 00 00       	push   $0xa08
     a6d:	e9 fc ff ff ff       	jmp    a6e <coprocessor_error+0x1e>
     a72:	66 90                	xchg   %ax,%ax

00000a74 <device_not_available>:
     a74:	1e                   	push   %ds
     a75:	06                   	push   %es
     a76:	0f a0                	push   %fs
     a78:	52                   	push   %edx
     a79:	51                   	push   %ecx
     a7a:	53                   	push   %ebx
     a7b:	50                   	push   %eax
     a7c:	b8 10 00 00 00       	mov    $0x10,%eax
     a81:	8e d8                	mov    %eax,%ds
     a83:	8e c0                	mov    %eax,%es
     a85:	b8 17 00 00 00       	mov    $0x17,%eax
     a8a:	8e e0                	mov    %eax,%fs
     a8c:	68 08 0a 00 00       	push   $0xa08
     a91:	0f 06                	clts   
     a93:	0f 20 c0             	mov    %cr0,%eax
     a96:	a9 04 00 00 00       	test   $0x4,%eax
     a9b:	0f 84 fc ff ff ff    	je     a9d <device_not_available+0x29>
     aa1:	55                   	push   %ebp
     aa2:	56                   	push   %esi
     aa3:	57                   	push   %edi
     aa4:	e8 fc ff ff ff       	call   aa5 <device_not_available+0x31>
     aa9:	5f                   	pop    %edi
     aaa:	5e                   	pop    %esi
     aab:	5d                   	pop    %ebp
     aac:	c3                   	ret    
     aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <timer_interrupt>:
     ab0:	1e                   	push   %ds
     ab1:	06                   	push   %es
     ab2:	0f a0                	push   %fs
     ab4:	52                   	push   %edx
     ab5:	51                   	push   %ecx
     ab6:	53                   	push   %ebx
     ab7:	50                   	push   %eax
     ab8:	b8 10 00 00 00       	mov    $0x10,%eax
     abd:	8e d8                	mov    %eax,%ds
     abf:	8e c0                	mov    %eax,%es
     ac1:	b8 17 00 00 00       	mov    $0x17,%eax
     ac6:	8e e0                	mov    %eax,%fs
     ac8:	ff 05 00 00 00 00    	incl   0x0
     ace:	b0 20                	mov    $0x20,%al
     ad0:	e6 20                	out    %al,$0x20
     ad2:	8b 44 24 20          	mov    0x20(%esp),%eax
     ad6:	83 e0 03             	and    $0x3,%eax
     ad9:	50                   	push   %eax
     ada:	e8 fc ff ff ff       	call   adb <timer_interrupt+0x2b>
     adf:	83 c4 04             	add    $0x4,%esp
     ae2:	e9 21 ff ff ff       	jmp    a08 <system_call+0x34>
     ae7:	90                   	nop

00000ae8 <sys_execve>:
     ae8:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     aec:	50                   	push   %eax
     aed:	e8 fc ff ff ff       	call   aee <sys_execve+0x6>
     af2:	83 c4 04             	add    $0x4,%esp
     af5:	c3                   	ret    
     af6:	66 90                	xchg   %ax,%ax

00000af8 <sys_fork>:
     af8:	e8 fc ff ff ff       	call   af9 <sys_fork+0x1>
     afd:	85 c0                	test   %eax,%eax
     aff:	78 0e                	js     b0f <sys_fork+0x17>
     b01:	0f a8                	push   %gs
     b03:	56                   	push   %esi
     b04:	57                   	push   %edi
     b05:	55                   	push   %ebp
     b06:	50                   	push   %eax
     b07:	e8 fc ff ff ff       	call   b08 <sys_fork+0x10>
     b0c:	83 c4 14             	add    $0x14,%esp
     b0f:	c3                   	ret    

00000b10 <hd_interrupt>:
     b10:	50                   	push   %eax
     b11:	51                   	push   %ecx
     b12:	52                   	push   %edx
     b13:	1e                   	push   %ds
     b14:	06                   	push   %es
     b15:	0f a0                	push   %fs
     b17:	b8 10 00 00 00       	mov    $0x10,%eax
     b1c:	8e d8                	mov    %eax,%ds
     b1e:	8e c0                	mov    %eax,%es
     b20:	b8 17 00 00 00       	mov    $0x17,%eax
     b25:	8e e0                	mov    %eax,%fs
     b27:	b0 20                	mov    $0x20,%al
     b29:	e6 a0                	out    %al,$0xa0
     b2b:	eb 00                	jmp    b2d <hd_interrupt+0x1d>
     b2d:	eb 00                	jmp    b2f <hd_interrupt+0x1f>
     b2f:	31 d2                	xor    %edx,%edx
     b31:	87 15 00 00 00 00    	xchg   %edx,0x0
     b37:	85 d2                	test   %edx,%edx
     b39:	75 05                	jne    b40 <hd_interrupt+0x30>
     b3b:	ba 00 00 00 00       	mov    $0x0,%edx
     b40:	e6 20                	out    %al,$0x20
     b42:	ff d2                	call   *%edx
     b44:	0f a1                	pop    %fs
     b46:	07                   	pop    %es
     b47:	1f                   	pop    %ds
     b48:	5a                   	pop    %edx
     b49:	59                   	pop    %ecx
     b4a:	58                   	pop    %eax
     b4b:	cf                   	iret   

00000b4c <floppy_interrupt>:
     b4c:	50                   	push   %eax
     b4d:	51                   	push   %ecx
     b4e:	52                   	push   %edx
     b4f:	1e                   	push   %ds
     b50:	06                   	push   %es
     b51:	0f a0                	push   %fs
     b53:	b8 10 00 00 00       	mov    $0x10,%eax
     b58:	8e d8                	mov    %eax,%ds
     b5a:	8e c0                	mov    %eax,%es
     b5c:	b8 17 00 00 00       	mov    $0x17,%eax
     b61:	8e e0                	mov    %eax,%fs
     b63:	b0 20                	mov    $0x20,%al
     b65:	e6 20                	out    %al,$0x20
     b67:	31 c0                	xor    %eax,%eax
     b69:	87 05 00 00 00 00    	xchg   %eax,0x0
     b6f:	85 c0                	test   %eax,%eax
     b71:	75 05                	jne    b78 <floppy_interrupt+0x2c>
     b73:	b8 00 00 00 00       	mov    $0x0,%eax
     b78:	ff d0                	call   *%eax
     b7a:	0f a1                	pop    %fs
     b7c:	07                   	pop    %es
     b7d:	1f                   	pop    %ds
     b7e:	5a                   	pop    %edx
     b7f:	59                   	pop    %ecx
     b80:	58                   	pop    %eax
     b81:	cf                   	iret   

00000b82 <parallel_interrupt>:
     b82:	50                   	push   %eax
     b83:	b0 20                	mov    $0x20,%al
     b85:	e6 20                	out    %al,$0x20
     b87:	58                   	pop    %eax
     b88:	cf                   	iret   

00000b89 <parse_cpu_topology>:
     b89:	50                   	push   %eax
     b8a:	53                   	push   %ebx
     b8b:	51                   	push   %ecx
     b8c:	52                   	push   %edx
     b8d:	b8 01 00 00 00       	mov    $0x1,%eax
     b92:	0f a2                	cpuid  
     b94:	5a                   	pop    %edx
     b95:	59                   	pop    %ecx
     b96:	5b                   	pop    %ebx
     b97:	58                   	pop    %eax
     b98:	cf                   	iret   

00000b99 <handle_ipi_interrupt>:
     b99:	50                   	push   %eax
     b9a:	53                   	push   %ebx
     b9b:	51                   	push   %ecx
     b9c:	52                   	push   %edx
     b9d:	e8 fc ff ff ff       	call   b9e <handle_ipi_interrupt+0x5>
     ba2:	e8 fc ff ff ff       	call   ba3 <handle_ipi_interrupt+0xa>
     ba7:	5a                   	pop    %edx
     ba8:	59                   	pop    %ecx
     ba9:	5b                   	pop    %ebx
     baa:	58                   	pop    %eax
     bab:	cf                   	iret   
     bac:	55                   	push   %ebp
     bad:	57                   	push   %edi
     bae:	56                   	push   %esi
     baf:	53                   	push   %ebx
     bb0:	83 ec 1c             	sub    $0x1c,%esp
     bb3:	89 c5                	mov    %eax,%ebp
     bb5:	89 d6                	mov    %edx,%esi
     bb7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     bbb:	e8 fc ff ff ff       	call   bbc <handle_ipi_interrupt+0x23>
     bc0:	89 c7                	mov    %eax,%edi
     bc2:	89 f3                	mov    %esi,%ebx
     bc4:	83 ec 04             	sub    $0x4,%esp
     bc7:	0f b7 44 24 10       	movzwl 0x10(%esp),%eax
     bcc:	50                   	push   %eax
     bcd:	55                   	push   %ebp
     bce:	68 7d 00 00 00       	push   $0x7d
     bd3:	e8 fc ff ff ff       	call   bd4 <handle_ipi_interrupt+0x3b>
     bd8:	83 c4 08             	add    $0x8,%esp
     bdb:	ff 76 0c             	pushl  0xc(%esi)
     bde:	ff 76 10             	pushl  0x10(%esi)
     be1:	ff 76 08             	pushl  0x8(%esi)
     be4:	ff 36                	pushl  (%esi)
     be6:	ff 76 04             	pushl  0x4(%esi)
     be9:	68 28 00 00 00       	push   $0x28
     bee:	e8 fc ff ff ff       	call   bef <handle_ipi_interrupt+0x56>
     bf3:	66 8c e0             	mov    %fs,%ax
     bf6:	83 c4 18             	add    $0x18,%esp
     bf9:	0f b7 c0             	movzwl %ax,%eax
     bfc:	50                   	push   %eax
     bfd:	68 88 00 00 00       	push   $0x88
     c02:	e8 fc ff ff ff       	call   c03 <handle_ipi_interrupt+0x6a>
     c07:	b9 17 00 00 00       	mov    $0x17,%ecx
     c0c:	0f 03 c9             	lsl    %cx,%ecx
     c0f:	41                   	inc    %ecx
     c10:	50                   	push   %eax
     c11:	8d 87 d8 02 00 00    	lea    0x2d8(%edi),%eax
     c17:	83 c0 07             	add    $0x7,%eax
     c1a:	8a 30                	mov    (%eax),%dh
     c1c:	83 e8 03             	sub    $0x3,%eax
     c1f:	8a 10                	mov    (%eax),%dl
     c21:	c1 e2 10             	shl    $0x10,%edx
     c24:	83 e8 02             	sub    $0x2,%eax
     c27:	66 8b 10             	mov    (%eax),%dx
     c2a:	58                   	pop    %eax
     c2b:	83 c4 0c             	add    $0xc,%esp
     c2e:	51                   	push   %ecx
     c2f:	52                   	push   %edx
     c30:	68 92 00 00 00       	push   $0x92
     c35:	e8 fc ff ff ff       	call   c36 <handle_ipi_interrupt+0x9d>
     c3a:	83 c4 10             	add    $0x10,%esp
     c3d:	83 7e 10 17          	cmpl   $0x17,0x10(%esi)
     c41:	75 52                	jne    c95 <handle_ipi_interrupt+0xfc>
     c43:	83 ec 0c             	sub    $0xc,%esp
     c46:	68 a7 00 00 00       	push   $0xa7
     c4b:	e8 fc ff ff ff       	call   c4c <handle_ipi_interrupt+0xb3>
     c50:	83 c4 10             	add    $0x10,%esp
     c53:	be 00 00 00 00       	mov    $0x0,%esi
     c58:	bd 17 00 00 00       	mov    $0x17,%ebp
     c5d:	8b 53 0c             	mov    0xc(%ebx),%edx
     c60:	89 e8                	mov    %ebp,%eax
     c62:	0f a0                	push   %fs
     c64:	8e e0                	mov    %eax,%fs
     c66:	64 8b 04 32          	mov    %fs:(%edx,%esi,1),%eax
     c6a:	0f a1                	pop    %fs
     c6c:	83 ec 08             	sub    $0x8,%esp
     c6f:	50                   	push   %eax
     c70:	68 af 00 00 00       	push   $0xaf
     c75:	e8 fc ff ff ff       	call   c76 <handle_ipi_interrupt+0xdd>
     c7a:	83 c6 04             	add    $0x4,%esi
     c7d:	83 c4 10             	add    $0x10,%esp
     c80:	83 fe 10             	cmp    $0x10,%esi
     c83:	75 d8                	jne    c5d <handle_ipi_interrupt+0xc4>
     c85:	83 ec 0c             	sub    $0xc,%esp
     c88:	68 b3 00 00 00       	push   $0xb3
     c8d:	e8 fc ff ff ff       	call   c8e <handle_ipi_interrupt+0xf5>
     c92:	83 c4 10             	add    $0x10,%esp
     c95:	b8 00 00 00 00       	mov    $0x0,%eax
     c9a:	66 0f 00 c8          	str    %ax
     c9e:	83 e8 20             	sub    $0x20,%eax
     ca1:	c1 e8 04             	shr    $0x4,%eax
     ca4:	83 ec 04             	sub    $0x4,%esp
     ca7:	0f b7 c0             	movzwl %ax,%eax
     caa:	50                   	push   %eax
     cab:	ff b7 2c 02 00 00    	pushl  0x22c(%edi)
     cb1:	68 b5 00 00 00       	push   $0xb5
     cb6:	e8 fc ff ff ff       	call   cb7 <handle_ipi_interrupt+0x11e>
     cbb:	83 c4 10             	add    $0x10,%esp
     cbe:	be 00 00 00 00       	mov    $0x0,%esi
     cc3:	8b 43 04             	mov    0x4(%ebx),%eax
     cc6:	8b 13                	mov    (%ebx),%edx
     cc8:	0f a0                	push   %fs
     cca:	8e e0                	mov    %eax,%fs
     ccc:	64 8a 04 32          	mov    %fs:(%edx,%esi,1),%al
     cd0:	0f a1                	pop    %fs
     cd2:	83 ec 08             	sub    $0x8,%esp
     cd5:	0f b6 c0             	movzbl %al,%eax
     cd8:	50                   	push   %eax
     cd9:	68 cf 00 00 00       	push   $0xcf
     cde:	e8 fc ff ff ff       	call   cdf <handle_ipi_interrupt+0x146>
     ce3:	83 c6 01             	add    $0x1,%esi
     ce6:	83 c4 10             	add    $0x10,%esp
     ce9:	83 fe 0a             	cmp    $0xa,%esi
     cec:	75 d5                	jne    cc3 <handle_ipi_interrupt+0x12a>
     cee:	83 ec 0c             	sub    $0xc,%esp
     cf1:	68 d5 00 00 00       	push   $0xd5
     cf6:	e8 fc ff ff ff       	call   cf7 <handle_ipi_interrupt+0x15e>
     cfb:	c7 04 24 50 00 00 00 	movl   $0x50,(%esp)
     d02:	e8 fc ff ff ff       	call   d03 <handle_ipi_interrupt+0x16a>
     d07:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     d0e:	e8 fc ff ff ff       	call   d0f <handle_ipi_interrupt+0x176>
     d13:	83 c4 2c             	add    $0x2c,%esp
     d16:	5b                   	pop    %ebx
     d17:	5e                   	pop    %esi
     d18:	5f                   	pop    %edi
     d19:	5d                   	pop    %ebp
     d1a:	c3                   	ret    

00000d1b <do_double_fault>:
     d1b:	83 ec 0c             	sub    $0xc,%esp
     d1e:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     d22:	8b 54 24 10          	mov    0x10(%esp),%edx
     d26:	b8 d8 00 00 00       	mov    $0xd8,%eax
     d2b:	e8 7c fe ff ff       	call   bac <handle_ipi_interrupt+0x13>
     d30:	83 c4 0c             	add    $0xc,%esp
     d33:	c3                   	ret    

00000d34 <do_general_protection>:
     d34:	83 ec 0c             	sub    $0xc,%esp
     d37:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     d3b:	8b 54 24 10          	mov    0x10(%esp),%edx
     d3f:	b8 e5 00 00 00       	mov    $0xe5,%eax
     d44:	e8 63 fe ff ff       	call   bac <handle_ipi_interrupt+0x13>
     d49:	83 c4 0c             	add    $0xc,%esp
     d4c:	c3                   	ret    

00000d4d <do_divide_error>:
     d4d:	83 ec 0c             	sub    $0xc,%esp
     d50:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     d54:	8b 54 24 10          	mov    0x10(%esp),%edx
     d58:	b8 f8 00 00 00       	mov    $0xf8,%eax
     d5d:	e8 4a fe ff ff       	call   bac <handle_ipi_interrupt+0x13>
     d62:	83 c4 0c             	add    $0xc,%esp
     d65:	c3                   	ret    

00000d66 <do_int3>:
     d66:	56                   	push   %esi
     d67:	53                   	push   %ebx
     d68:	83 ec 10             	sub    $0x10,%esp
     d6b:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
     d6f:	be 00 00 00 00       	mov    $0x0,%esi
     d74:	89 f0                	mov    %esi,%eax
     d76:	66 0f 00 c8          	str    %ax
     d7a:	89 c6                	mov    %eax,%esi
     d7c:	ff 74 24 3c          	pushl  0x3c(%esp)
     d80:	ff 74 24 44          	pushl  0x44(%esp)
     d84:	ff 74 24 4c          	pushl  0x4c(%esp)
     d88:	ff 74 24 54          	pushl  0x54(%esp)
     d8c:	68 78 00 00 00       	push   $0x78
     d91:	e8 fc ff ff ff       	call   d92 <do_int3+0x2c>
     d96:	83 c4 14             	add    $0x14,%esp
     d99:	53                   	push   %ebx
     d9a:	ff 74 24 34          	pushl  0x34(%esp)
     d9e:	ff 74 24 40          	pushl  0x40(%esp)
     da2:	ff 74 24 40          	pushl  0x40(%esp)
     da6:	68 a0 00 00 00       	push   $0xa0
     dab:	e8 fc ff ff ff       	call   dac <do_int3+0x46>
     db0:	83 c4 14             	add    $0x14,%esp
     db3:	56                   	push   %esi
     db4:	ff 74 24 28          	pushl  0x28(%esp)
     db8:	ff 74 24 30          	pushl  0x30(%esp)
     dbc:	ff 74 24 38          	pushl  0x38(%esp)
     dc0:	68 c8 00 00 00       	push   $0xc8
     dc5:	e8 fc ff ff ff       	call   dc6 <do_int3+0x60>
     dca:	83 c4 20             	add    $0x20,%esp
     dcd:	ff 73 08             	pushl  0x8(%ebx)
     dd0:	ff 73 04             	pushl  0x4(%ebx)
     dd3:	ff 33                	pushl  (%ebx)
     dd5:	68 ec 00 00 00       	push   $0xec
     dda:	e8 fc ff ff ff       	call   ddb <do_int3+0x75>
     ddf:	83 c4 14             	add    $0x14,%esp
     de2:	5b                   	pop    %ebx
     de3:	5e                   	pop    %esi
     de4:	c3                   	ret    

00000de5 <do_nmi>:
     de5:	83 ec 0c             	sub    $0xc,%esp
     de8:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     dec:	8b 54 24 10          	mov    0x10(%esp),%edx
     df0:	b8 05 01 00 00       	mov    $0x105,%eax
     df5:	e8 b2 fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     dfa:	83 c4 0c             	add    $0xc,%esp
     dfd:	c3                   	ret    

00000dfe <do_debug>:
     dfe:	83 ec 0c             	sub    $0xc,%esp
     e01:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e05:	8b 54 24 10          	mov    0x10(%esp),%edx
     e09:	b8 09 01 00 00       	mov    $0x109,%eax
     e0e:	e8 99 fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     e13:	83 c4 0c             	add    $0xc,%esp
     e16:	c3                   	ret    

00000e17 <do_overflow>:
     e17:	83 ec 0c             	sub    $0xc,%esp
     e1a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e1e:	8b 54 24 10          	mov    0x10(%esp),%edx
     e22:	b8 0f 01 00 00       	mov    $0x10f,%eax
     e27:	e8 80 fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     e2c:	83 c4 0c             	add    $0xc,%esp
     e2f:	c3                   	ret    

00000e30 <do_bounds>:
     e30:	83 ec 0c             	sub    $0xc,%esp
     e33:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e37:	8b 54 24 10          	mov    0x10(%esp),%edx
     e3b:	b8 18 01 00 00       	mov    $0x118,%eax
     e40:	e8 67 fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     e45:	83 c4 0c             	add    $0xc,%esp
     e48:	c3                   	ret    

00000e49 <do_invalid_op>:
     e49:	83 ec 0c             	sub    $0xc,%esp
     e4c:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e50:	8b 54 24 10          	mov    0x10(%esp),%edx
     e54:	b8 1f 01 00 00       	mov    $0x11f,%eax
     e59:	e8 4e fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     e5e:	83 c4 0c             	add    $0xc,%esp
     e61:	c3                   	ret    

00000e62 <do_device_not_available>:
     e62:	83 ec 0c             	sub    $0xc,%esp
     e65:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e69:	8b 54 24 10          	mov    0x10(%esp),%edx
     e6d:	b8 2f 01 00 00       	mov    $0x12f,%eax
     e72:	e8 35 fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     e77:	83 c4 0c             	add    $0xc,%esp
     e7a:	c3                   	ret    

00000e7b <do_coprocessor_segment_overrun>:
     e7b:	83 ec 0c             	sub    $0xc,%esp
     e7e:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e82:	8b 54 24 10          	mov    0x10(%esp),%edx
     e86:	b8 44 01 00 00       	mov    $0x144,%eax
     e8b:	e8 1c fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     e90:	83 c4 0c             	add    $0xc,%esp
     e93:	c3                   	ret    

00000e94 <do_invalid_TSS>:
     e94:	83 ec 0c             	sub    $0xc,%esp
     e97:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e9b:	8b 54 24 10          	mov    0x10(%esp),%edx
     e9f:	b8 60 01 00 00       	mov    $0x160,%eax
     ea4:	e8 03 fd ff ff       	call   bac <handle_ipi_interrupt+0x13>
     ea9:	83 c4 0c             	add    $0xc,%esp
     eac:	c3                   	ret    

00000ead <do_segment_not_present>:
     ead:	83 ec 0c             	sub    $0xc,%esp
     eb0:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     eb4:	8b 54 24 10          	mov    0x10(%esp),%edx
     eb8:	b8 6c 01 00 00       	mov    $0x16c,%eax
     ebd:	e8 ea fc ff ff       	call   bac <handle_ipi_interrupt+0x13>
     ec2:	83 c4 0c             	add    $0xc,%esp
     ec5:	c3                   	ret    

00000ec6 <do_stack_segment>:
     ec6:	83 ec 0c             	sub    $0xc,%esp
     ec9:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     ecd:	8b 54 24 10          	mov    0x10(%esp),%edx
     ed1:	b8 80 01 00 00       	mov    $0x180,%eax
     ed6:	e8 d1 fc ff ff       	call   bac <handle_ipi_interrupt+0x13>
     edb:	83 c4 0c             	add    $0xc,%esp
     ede:	c3                   	ret    

00000edf <do_coprocessor_error>:
     edf:	83 ec 0c             	sub    $0xc,%esp
     ee2:	e8 fc ff ff ff       	call   ee3 <do_coprocessor_error+0x4>
     ee7:	39 05 00 00 00 00    	cmp    %eax,0x0
     eed:	75 12                	jne    f01 <do_coprocessor_error+0x22>
     eef:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     ef3:	8b 54 24 10          	mov    0x10(%esp),%edx
     ef7:	b8 8e 01 00 00       	mov    $0x18e,%eax
     efc:	e8 ab fc ff ff       	call   bac <handle_ipi_interrupt+0x13>
     f01:	83 c4 0c             	add    $0xc,%esp
     f04:	c3                   	ret    

00000f05 <do_reserved>:
     f05:	83 ec 0c             	sub    $0xc,%esp
     f08:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     f0c:	8b 54 24 10          	mov    0x10(%esp),%edx
     f10:	b8 a0 01 00 00       	mov    $0x1a0,%eax
     f15:	e8 92 fc ff ff       	call   bac <handle_ipi_interrupt+0x13>
     f1a:	83 c4 0c             	add    $0xc,%esp
     f1d:	c3                   	ret    

00000f1e <trap_init>:
     f1e:	53                   	push   %ebx
     f1f:	b8 00 00 08 00       	mov    $0x80000,%eax
     f24:	ba 00 00 00 00       	mov    $0x0,%edx
     f29:	66 89 d0             	mov    %dx,%ax
     f2c:	66 ba 00 8f          	mov    $0x8f00,%dx
     f30:	a3 00 00 00 00       	mov    %eax,0x0
     f35:	89 15 04 00 00 00    	mov    %edx,0x4
     f3b:	ba 00 00 00 00       	mov    $0x0,%edx
     f40:	66 89 d0             	mov    %dx,%ax
     f43:	66 ba 00 8f          	mov    $0x8f00,%dx
     f47:	a3 08 00 00 00       	mov    %eax,0x8
     f4c:	89 15 0c 00 00 00    	mov    %edx,0xc
     f52:	ba 00 00 00 00       	mov    $0x0,%edx
     f57:	66 89 d0             	mov    %dx,%ax
     f5a:	66 ba 00 8f          	mov    $0x8f00,%dx
     f5e:	a3 10 00 00 00       	mov    %eax,0x10
     f63:	89 15 14 00 00 00    	mov    %edx,0x14
     f69:	ba 00 00 00 00       	mov    $0x0,%edx
     f6e:	66 89 d0             	mov    %dx,%ax
     f71:	66 ba 00 ef          	mov    $0xef00,%dx
     f75:	a3 18 00 00 00       	mov    %eax,0x18
     f7a:	89 15 1c 00 00 00    	mov    %edx,0x1c
     f80:	ba 00 00 00 00       	mov    $0x0,%edx
     f85:	66 89 d0             	mov    %dx,%ax
     f88:	66 ba 00 ef          	mov    $0xef00,%dx
     f8c:	a3 20 00 00 00       	mov    %eax,0x20
     f91:	89 15 24 00 00 00    	mov    %edx,0x24
     f97:	ba 00 00 00 00       	mov    $0x0,%edx
     f9c:	66 89 d0             	mov    %dx,%ax
     f9f:	66 ba 00 ef          	mov    $0xef00,%dx
     fa3:	a3 28 00 00 00       	mov    %eax,0x28
     fa8:	89 15 2c 00 00 00    	mov    %edx,0x2c
     fae:	ba 00 00 00 00       	mov    $0x0,%edx
     fb3:	66 89 d0             	mov    %dx,%ax
     fb6:	66 ba 00 8f          	mov    $0x8f00,%dx
     fba:	a3 30 00 00 00       	mov    %eax,0x30
     fbf:	89 15 34 00 00 00    	mov    %edx,0x34
     fc5:	ba 00 00 00 00       	mov    $0x0,%edx
     fca:	66 89 d0             	mov    %dx,%ax
     fcd:	66 ba 00 8f          	mov    $0x8f00,%dx
     fd1:	a3 38 00 00 00       	mov    %eax,0x38
     fd6:	89 15 3c 00 00 00    	mov    %edx,0x3c
     fdc:	ba 00 00 00 00       	mov    $0x0,%edx
     fe1:	66 89 d0             	mov    %dx,%ax
     fe4:	66 ba 00 8f          	mov    $0x8f00,%dx
     fe8:	a3 40 00 00 00       	mov    %eax,0x40
     fed:	89 15 44 00 00 00    	mov    %edx,0x44
     ff3:	ba 00 00 00 00       	mov    $0x0,%edx
     ff8:	66 89 d0             	mov    %dx,%ax
     ffb:	66 ba 00 8f          	mov    $0x8f00,%dx
     fff:	a3 48 00 00 00       	mov    %eax,0x48
    1004:	89 15 4c 00 00 00    	mov    %edx,0x4c
    100a:	ba 00 00 00 00       	mov    $0x0,%edx
    100f:	66 89 d0             	mov    %dx,%ax
    1012:	66 ba 00 8f          	mov    $0x8f00,%dx
    1016:	a3 50 00 00 00       	mov    %eax,0x50
    101b:	89 15 54 00 00 00    	mov    %edx,0x54
    1021:	ba 00 00 00 00       	mov    $0x0,%edx
    1026:	66 89 d0             	mov    %dx,%ax
    1029:	66 ba 00 8f          	mov    $0x8f00,%dx
    102d:	a3 58 00 00 00       	mov    %eax,0x58
    1032:	89 15 5c 00 00 00    	mov    %edx,0x5c
    1038:	ba 00 00 00 00       	mov    $0x0,%edx
    103d:	66 89 d0             	mov    %dx,%ax
    1040:	66 ba 00 8f          	mov    $0x8f00,%dx
    1044:	a3 60 00 00 00       	mov    %eax,0x60
    1049:	89 15 64 00 00 00    	mov    %edx,0x64
    104f:	ba 00 00 00 00       	mov    $0x0,%edx
    1054:	66 89 d0             	mov    %dx,%ax
    1057:	66 ba 00 8f          	mov    $0x8f00,%dx
    105b:	a3 68 00 00 00       	mov    %eax,0x68
    1060:	89 15 6c 00 00 00    	mov    %edx,0x6c
    1066:	ba 00 00 00 00       	mov    $0x0,%edx
    106b:	66 89 d0             	mov    %dx,%ax
    106e:	66 ba 00 8f          	mov    $0x8f00,%dx
    1072:	a3 70 00 00 00       	mov    %eax,0x70
    1077:	89 15 74 00 00 00    	mov    %edx,0x74
    107d:	ba 00 00 00 00       	mov    $0x0,%edx
    1082:	66 89 d0             	mov    %dx,%ax
    1085:	66 ba 00 8f          	mov    $0x8f00,%dx
    1089:	a3 78 00 00 00       	mov    %eax,0x78
    108e:	89 15 7c 00 00 00    	mov    %edx,0x7c
    1094:	ba 00 00 00 00       	mov    $0x0,%edx
    1099:	66 89 d0             	mov    %dx,%ax
    109c:	66 ba 00 8f          	mov    $0x8f00,%dx
    10a0:	a3 80 00 00 00       	mov    %eax,0x80
    10a5:	89 15 84 00 00 00    	mov    %edx,0x84
    10ab:	b9 88 00 00 00       	mov    $0x88,%ecx
    10b0:	bb 80 01 00 00       	mov    $0x180,%ebx
    10b5:	ba 00 00 00 00       	mov    $0x0,%edx
    10ba:	66 89 d0             	mov    %dx,%ax
    10bd:	66 ba 00 8f          	mov    $0x8f00,%dx
    10c1:	89 01                	mov    %eax,(%ecx)
    10c3:	89 51 04             	mov    %edx,0x4(%ecx)
    10c6:	83 c1 08             	add    $0x8,%ecx
    10c9:	39 d9                	cmp    %ebx,%ecx
    10cb:	75 ed                	jne    10ba <trap_init+0x19c>
    10cd:	b8 00 00 08 00       	mov    $0x80000,%eax
    10d2:	ba 00 00 00 00       	mov    $0x0,%edx
    10d7:	66 89 d0             	mov    %dx,%ax
    10da:	66 ba 00 8f          	mov    $0x8f00,%dx
    10de:	a3 68 01 00 00       	mov    %eax,0x168
    10e3:	89 15 6c 01 00 00    	mov    %edx,0x16c
    10e9:	ba 21 00 00 00       	mov    $0x21,%edx
    10ee:	ec                   	in     (%dx),%al
    10ef:	eb 00                	jmp    10f1 <trap_init+0x1d3>
    10f1:	eb 00                	jmp    10f3 <trap_init+0x1d5>
    10f3:	25 fb 00 00 00       	and    $0xfb,%eax
    10f8:	ee                   	out    %al,(%dx)
    10f9:	eb 00                	jmp    10fb <trap_init+0x1dd>
    10fb:	eb 00                	jmp    10fd <trap_init+0x1df>
    10fd:	ba a1 00 00 00       	mov    $0xa1,%edx
    1102:	ec                   	in     (%dx),%al
    1103:	eb 00                	jmp    1105 <trap_init+0x1e7>
    1105:	eb 00                	jmp    1107 <trap_init+0x1e9>
    1107:	25 df 00 00 00       	and    $0xdf,%eax
    110c:	ee                   	out    %al,(%dx)
    110d:	b8 00 00 08 00       	mov    $0x80000,%eax
    1112:	ba 00 00 00 00       	mov    $0x0,%edx
    1117:	66 89 d0             	mov    %dx,%ax
    111a:	66 ba 00 8f          	mov    $0x8f00,%dx
    111e:	a3 38 01 00 00       	mov    %eax,0x138
    1123:	89 15 3c 01 00 00    	mov    %edx,0x13c
    1129:	5b                   	pop    %ebx
    112a:	c3                   	ret    

0000112b <ipi_intr_init>:
    112b:	b8 00 00 08 00       	mov    $0x80000,%eax
    1130:	ba 00 00 00 00       	mov    $0x0,%edx
    1135:	66 89 d0             	mov    %dx,%ax
    1138:	66 ba 00 8e          	mov    $0x8e00,%dx
    113c:	a3 08 04 00 00       	mov    %eax,0x408
    1141:	89 15 0c 04 00 00    	mov    %edx,0x40c
    1147:	ba 00 00 00 00       	mov    $0x0,%edx
    114c:	66 89 d0             	mov    %dx,%ax
    114f:	66 ba 00 8e          	mov    $0x8e00,%dx
    1153:	a3 10 04 00 00       	mov    %eax,0x410
    1158:	89 15 14 04 00 00    	mov    %edx,0x414
    115e:	c3                   	ret    

0000115f <divide_error>:
    115f:	68 00 00 00 00       	push   $0x0
    1164:	87 04 24             	xchg   %eax,(%esp)
    1167:	53                   	push   %ebx
    1168:	51                   	push   %ecx
    1169:	52                   	push   %edx
    116a:	57                   	push   %edi
    116b:	56                   	push   %esi
    116c:	55                   	push   %ebp
    116d:	1e                   	push   %ds
    116e:	06                   	push   %es
    116f:	0f a0                	push   %fs
    1171:	6a 00                	push   $0x0
    1173:	8d 54 24 2c          	lea    0x2c(%esp),%edx
    1177:	52                   	push   %edx
    1178:	ba 10 00 00 00       	mov    $0x10,%edx
    117d:	8e da                	mov    %edx,%ds
    117f:	8e c2                	mov    %edx,%es
    1181:	8e e2                	mov    %edx,%fs
    1183:	ff d0                	call   *%eax
    1185:	83 c4 08             	add    $0x8,%esp
    1188:	0f a1                	pop    %fs
    118a:	07                   	pop    %es
    118b:	1f                   	pop    %ds
    118c:	5d                   	pop    %ebp
    118d:	5e                   	pop    %esi
    118e:	5f                   	pop    %edi
    118f:	5a                   	pop    %edx
    1190:	59                   	pop    %ecx
    1191:	5b                   	pop    %ebx
    1192:	58                   	pop    %eax
    1193:	cf                   	iret   

00001194 <debug>:
    1194:	68 00 00 00 00       	push   $0x0
    1199:	eb c9                	jmp    1164 <divide_error+0x5>

0000119b <nmi>:
    119b:	68 00 00 00 00       	push   $0x0
    11a0:	eb c2                	jmp    1164 <divide_error+0x5>

000011a2 <int3>:
    11a2:	68 00 00 00 00       	push   $0x0
    11a7:	eb bb                	jmp    1164 <divide_error+0x5>

000011a9 <overflow>:
    11a9:	68 00 00 00 00       	push   $0x0
    11ae:	eb b4                	jmp    1164 <divide_error+0x5>

000011b0 <bounds>:
    11b0:	68 00 00 00 00       	push   $0x0
    11b5:	eb ad                	jmp    1164 <divide_error+0x5>

000011b7 <invalid_op>:
    11b7:	68 00 00 00 00       	push   $0x0
    11bc:	eb a6                	jmp    1164 <divide_error+0x5>

000011be <coprocessor_segment_overrun>:
    11be:	68 00 00 00 00       	push   $0x0
    11c3:	eb 9f                	jmp    1164 <divide_error+0x5>

000011c5 <reserved>:
    11c5:	68 00 00 00 00       	push   $0x0
    11ca:	eb 98                	jmp    1164 <divide_error+0x5>

000011cc <irq13>:
    11cc:	50                   	push   %eax
    11cd:	30 c0                	xor    %al,%al
    11cf:	e6 f0                	out    %al,$0xf0
    11d1:	b0 20                	mov    $0x20,%al
    11d3:	e6 20                	out    %al,$0x20
    11d5:	eb 00                	jmp    11d7 <irq13+0xb>
    11d7:	eb 00                	jmp    11d9 <irq13+0xd>
    11d9:	e6 a0                	out    %al,$0xa0
    11db:	58                   	pop    %eax
    11dc:	e9 fc ff ff ff       	jmp    11dd <irq13+0x11>

000011e1 <double_fault>:
    11e1:	68 00 00 00 00       	push   $0x0
    11e6:	87 44 24 04          	xchg   %eax,0x4(%esp)
    11ea:	87 1c 24             	xchg   %ebx,(%esp)
    11ed:	51                   	push   %ecx
    11ee:	52                   	push   %edx
    11ef:	57                   	push   %edi
    11f0:	56                   	push   %esi
    11f1:	55                   	push   %ebp
    11f2:	1e                   	push   %ds
    11f3:	06                   	push   %es
    11f4:	0f a0                	push   %fs
    11f6:	50                   	push   %eax
    11f7:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    11fb:	50                   	push   %eax
    11fc:	b8 10 00 00 00       	mov    $0x10,%eax
    1201:	8e d8                	mov    %eax,%ds
    1203:	8e c0                	mov    %eax,%es
    1205:	8e e0                	mov    %eax,%fs
    1207:	ff d3                	call   *%ebx
    1209:	83 c4 08             	add    $0x8,%esp
    120c:	0f a1                	pop    %fs
    120e:	07                   	pop    %es
    120f:	1f                   	pop    %ds
    1210:	5d                   	pop    %ebp
    1211:	5e                   	pop    %esi
    1212:	5f                   	pop    %edi
    1213:	5a                   	pop    %edx
    1214:	59                   	pop    %ecx
    1215:	5b                   	pop    %ebx
    1216:	58                   	pop    %eax
    1217:	cf                   	iret   

00001218 <invalid_TSS>:
    1218:	68 00 00 00 00       	push   $0x0
    121d:	eb c7                	jmp    11e6 <double_fault+0x5>

0000121f <segment_not_present>:
    121f:	68 00 00 00 00       	push   $0x0
    1224:	eb c0                	jmp    11e6 <double_fault+0x5>

00001226 <stack_segment>:
    1226:	68 00 00 00 00       	push   $0x0
    122b:	eb b9                	jmp    11e6 <double_fault+0x5>

0000122d <general_protection>:
    122d:	68 00 00 00 00       	push   $0x0
    1232:	eb b2                	jmp    11e6 <double_fault+0x5>

00001234 <verify_area>:
    1234:	56                   	push   %esi
    1235:	53                   	push   %ebx
    1236:	83 ec 04             	sub    $0x4,%esp
    1239:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    123d:	e8 fc ff ff ff       	call   123e <verify_area+0xa>
    1242:	89 d9                	mov    %ebx,%ecx
    1244:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    124a:	03 4c 24 14          	add    0x14(%esp),%ecx
    124e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    1254:	50                   	push   %eax
    1255:	05 e0 02 00 00       	add    $0x2e0,%eax
    125a:	83 c0 07             	add    $0x7,%eax
    125d:	8a 30                	mov    (%eax),%dh
    125f:	83 e8 03             	sub    $0x3,%eax
    1262:	8a 10                	mov    (%eax),%dl
    1264:	c1 e2 10             	shl    $0x10,%edx
    1267:	83 e8 02             	sub    $0x2,%eax
    126a:	66 8b 10             	mov    (%eax),%dx
    126d:	58                   	pop    %eax
    126e:	01 d3                	add    %edx,%ebx
    1270:	85 c9                	test   %ecx,%ecx
    1272:	7e 26                	jle    129a <verify_area+0x66>
    1274:	83 e9 01             	sub    $0x1,%ecx
    1277:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
    127d:	8d b4 0b 00 10 00 00 	lea    0x1000(%ebx,%ecx,1),%esi
    1284:	83 ec 0c             	sub    $0xc,%esp
    1287:	53                   	push   %ebx
    1288:	e8 fc ff ff ff       	call   1289 <verify_area+0x55>
    128d:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    1293:	83 c4 10             	add    $0x10,%esp
    1296:	39 f3                	cmp    %esi,%ebx
    1298:	75 ea                	jne    1284 <verify_area+0x50>
    129a:	83 c4 04             	add    $0x4,%esp
    129d:	5b                   	pop    %ebx
    129e:	5e                   	pop    %esi
    129f:	c3                   	ret    

000012a0 <copy_mem>:
    12a0:	53                   	push   %ebx
    12a1:	83 ec 08             	sub    $0x8,%esp
    12a4:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    12a8:	c7 83 18 02 00 00 00 	movl   $0x40000000,0x218(%ebx)
    12af:	00 00 40 
    12b2:	ba 00 00 00 40       	mov    $0x40000000,%edx
    12b7:	66 89 93 da 02 00 00 	mov    %dx,0x2da(%ebx)
    12be:	c1 ca 10             	ror    $0x10,%edx
    12c1:	88 93 dc 02 00 00    	mov    %dl,0x2dc(%ebx)
    12c7:	88 b3 df 02 00 00    	mov    %dh,0x2df(%ebx)
    12cd:	c1 ca 10             	ror    $0x10,%edx
    12d0:	66 89 93 e2 02 00 00 	mov    %dx,0x2e2(%ebx)
    12d7:	c1 ca 10             	ror    $0x10,%edx
    12da:	88 93 e4 02 00 00    	mov    %dl,0x2e4(%ebx)
    12e0:	88 b3 e7 02 00 00    	mov    %dh,0x2e7(%ebx)
    12e6:	c1 ca 10             	ror    $0x10,%edx
    12e9:	ba ff ff 0b 00       	mov    $0xbffff,%edx
    12ee:	66 89 93 d8 02 00 00 	mov    %dx,0x2d8(%ebx)
    12f5:	c1 ca 10             	ror    $0x10,%edx
    12f8:	8a b3 de 02 00 00    	mov    0x2de(%ebx),%dh
    12fe:	80 e6 f0             	and    $0xf0,%dh
    1301:	08 f2                	or     %dh,%dl
    1303:	88 93 de 02 00 00    	mov    %dl,0x2de(%ebx)
    1309:	c1 ca 10             	ror    $0x10,%edx
    130c:	66 89 93 e0 02 00 00 	mov    %dx,0x2e0(%ebx)
    1313:	c1 ca 10             	ror    $0x10,%edx
    1316:	8a b3 e6 02 00 00    	mov    0x2e6(%ebx),%dh
    131c:	80 e6 f0             	and    $0xf0,%dh
    131f:	08 f2                	or     %dh,%dl
    1321:	88 93 e6 02 00 00    	mov    %dl,0x2e6(%ebx)
    1327:	c1 ca 10             	ror    $0x10,%edx
    132a:	53                   	push   %ebx
    132b:	68 00 00 00 c0       	push   $0xc0000000
    1330:	68 00 00 00 40       	push   $0x40000000
    1335:	6a 00                	push   $0x0
    1337:	e8 fc ff ff ff       	call   1338 <copy_mem+0x98>
    133c:	83 c4 10             	add    $0x10,%esp
    133f:	85 c0                	test   %eax,%eax
    1341:	74 1b                	je     135e <copy_mem+0xbe>
    1343:	83 ec 04             	sub    $0x4,%esp
    1346:	53                   	push   %ebx
    1347:	68 00 00 00 c0       	push   $0xc0000000
    134c:	68 00 00 00 40       	push   $0x40000000
    1351:	e8 fc ff ff ff       	call   1352 <copy_mem+0xb2>
    1356:	83 c4 10             	add    $0x10,%esp
    1359:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
    135e:	83 c4 08             	add    $0x8,%esp
    1361:	5b                   	pop    %ebx
    1362:	c3                   	ret    

00001363 <copy_process>:
    1363:	55                   	push   %ebp
    1364:	57                   	push   %edi
    1365:	56                   	push   %esi
    1366:	53                   	push   %ebx
    1367:	83 ec 0c             	sub    $0xc,%esp
    136a:	e8 fc ff ff ff       	call   136b <copy_process+0x8>
    136f:	89 c5                	mov    %eax,%ebp
    1371:	83 ec 0c             	sub    $0xc,%esp
    1374:	6a 01                	push   $0x1
    1376:	e8 fc ff ff ff       	call   1377 <copy_process+0x14>
    137b:	89 c3                	mov    %eax,%ebx
    137d:	83 c4 10             	add    $0x10,%esp
    1380:	85 c0                	test   %eax,%eax
    1382:	0f 84 a7 02 00 00    	je     162f <copy_process+0x2cc>
    1388:	8b 74 24 20          	mov    0x20(%esp),%esi
    138c:	89 04 b5 00 00 00 00 	mov    %eax,0x0(,%esi,4)
    1393:	b9 f0 00 00 00       	mov    $0xf0,%ecx
    1398:	89 c7                	mov    %eax,%edi
    139a:	89 ee                	mov    %ebp,%esi
    139c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    139e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    13a4:	a1 00 00 00 00       	mov    0x0,%eax
    13a9:	89 83 2c 02 00 00    	mov    %eax,0x22c(%ebx)
    13af:	8b 85 2c 02 00 00    	mov    0x22c(%ebp),%eax
    13b5:	89 83 30 02 00 00    	mov    %eax,0x230(%ebx)
    13bb:	8b 43 08             	mov    0x8(%ebx),%eax
    13be:	89 43 04             	mov    %eax,0x4(%ebx)
    13c1:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    13c8:	c7 83 4c 02 00 00 00 	movl   $0x0,0x24c(%ebx)
    13cf:	00 00 00 
    13d2:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
    13d9:	00 00 00 
    13dc:	c7 83 54 02 00 00 00 	movl   $0x0,0x254(%ebx)
    13e3:	00 00 00 
    13e6:	c7 83 50 02 00 00 00 	movl   $0x0,0x250(%ebx)
    13ed:	00 00 00 
    13f0:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
    13f7:	00 00 00 
    13fa:	c7 83 58 02 00 00 00 	movl   $0x0,0x258(%ebx)
    1401:	00 00 00 
    1404:	a1 00 00 00 00       	mov    0x0,%eax
    1409:	89 83 60 02 00 00    	mov    %eax,0x260(%ebx)
    140f:	c7 83 e8 02 00 00 00 	movl   $0x0,0x2e8(%ebx)
    1416:	00 00 00 
    1419:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
    141f:	89 83 ec 02 00 00    	mov    %eax,0x2ec(%ebx)
    1425:	c7 83 f0 02 00 00 10 	movl   $0x10,0x2f0(%ebx)
    142c:	00 00 00 
    142f:	8b 44 24 50          	mov    0x50(%esp),%eax
    1433:	89 83 08 03 00 00    	mov    %eax,0x308(%ebx)
    1439:	8b 44 24 58          	mov    0x58(%esp),%eax
    143d:	89 83 0c 03 00 00    	mov    %eax,0x30c(%ebx)
    1443:	c7 83 10 03 00 00 00 	movl   $0x0,0x310(%ebx)
    144a:	00 00 00 
    144d:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    1451:	89 83 14 03 00 00    	mov    %eax,0x314(%ebx)
    1457:	8b 44 24 40          	mov    0x40(%esp),%eax
    145b:	89 83 18 03 00 00    	mov    %eax,0x318(%ebx)
    1461:	8b 44 24 38          	mov    0x38(%esp),%eax
    1465:	89 83 1c 03 00 00    	mov    %eax,0x31c(%ebx)
    146b:	8b 44 24 5c          	mov    0x5c(%esp),%eax
    146f:	89 83 20 03 00 00    	mov    %eax,0x320(%ebx)
    1475:	8b 44 24 24          	mov    0x24(%esp),%eax
    1479:	89 83 24 03 00 00    	mov    %eax,0x324(%ebx)
    147f:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    1483:	89 83 28 03 00 00    	mov    %eax,0x328(%ebx)
    1489:	8b 44 24 28          	mov    0x28(%esp),%eax
    148d:	89 83 2c 03 00 00    	mov    %eax,0x32c(%ebx)
    1493:	0f b7 44 24 48       	movzwl 0x48(%esp),%eax
    1498:	89 83 30 03 00 00    	mov    %eax,0x330(%ebx)
    149e:	0f b7 44 24 54       	movzwl 0x54(%esp),%eax
    14a3:	89 83 34 03 00 00    	mov    %eax,0x334(%ebx)
    14a9:	0f b7 44 24 60       	movzwl 0x60(%esp),%eax
    14ae:	89 83 38 03 00 00    	mov    %eax,0x338(%ebx)
    14b4:	0f b7 44 24 4c       	movzwl 0x4c(%esp),%eax
    14b9:	89 83 3c 03 00 00    	mov    %eax,0x33c(%ebx)
    14bf:	0f b7 44 24 44       	movzwl 0x44(%esp),%eax
    14c4:	89 83 40 03 00 00    	mov    %eax,0x340(%ebx)
    14ca:	0f b7 44 24 30       	movzwl 0x30(%esp),%eax
    14cf:	89 83 44 03 00 00    	mov    %eax,0x344(%ebx)
    14d5:	8b 44 24 20          	mov    0x20(%esp),%eax
    14d9:	c1 e0 04             	shl    $0x4,%eax
    14dc:	83 c0 28             	add    $0x28,%eax
    14df:	89 83 48 03 00 00    	mov    %eax,0x348(%ebx)
    14e5:	c7 83 4c 03 00 00 00 	movl   $0x80000000,0x34c(%ebx)
    14ec:	00 00 80 
    14ef:	3b 2d 00 00 00 00    	cmp    0x0,%ebp
    14f5:	75 08                	jne    14ff <copy_process+0x19c>
    14f7:	0f 06                	clts   
    14f9:	dd b3 50 03 00 00    	fnsave 0x350(%ebx)
    14ff:	83 ec 08             	sub    $0x8,%esp
    1502:	53                   	push   %ebx
    1503:	ff 74 24 2c          	pushl  0x2c(%esp)
    1507:	e8 fc ff ff ff       	call   1508 <copy_process+0x1a5>
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    1515:	8d 8b d0 02 00 00    	lea    0x2d0(%ebx),%ecx
    151b:	85 c0                	test   %eax,%eax
    151d:	74 44                	je     1563 <copy_process+0x200>
    151f:	8b 44 24 20          	mov    0x20(%esp),%eax
    1523:	c7 04 85 00 00 00 00 	movl   $0x0,0x0(,%eax,4)
    152a:	00 00 00 00 
    152e:	83 ec 0c             	sub    $0xc,%esp
    1531:	53                   	push   %ebx
    1532:	e8 fc ff ff ff       	call   1533 <copy_process+0x1d0>
    1537:	89 c2                	mov    %eax,%edx
    1539:	83 c4 10             	add    $0x10,%esp
    153c:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1541:	85 d2                	test   %edx,%edx
    1543:	0f 85 eb 00 00 00    	jne    1634 <copy_process+0x2d1>
    1549:	83 ec 0c             	sub    $0xc,%esp
    154c:	68 10 01 00 00       	push   $0x110
    1551:	e8 fc ff ff ff       	call   1552 <copy_process+0x1ef>
    1556:	83 c4 10             	add    $0x10,%esp
    1559:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    155e:	e9 d1 00 00 00       	jmp    1634 <copy_process+0x2d1>
    1563:	8b 02                	mov    (%edx),%eax
    1565:	85 c0                	test   %eax,%eax
    1567:	74 05                	je     156e <copy_process+0x20b>
    1569:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
    156e:	83 c2 04             	add    $0x4,%edx
    1571:	39 ca                	cmp    %ecx,%edx
    1573:	75 ee                	jne    1563 <copy_process+0x200>
    1575:	8b 85 70 02 00 00    	mov    0x270(%ebp),%eax
    157b:	85 c0                	test   %eax,%eax
    157d:	74 05                	je     1584 <copy_process+0x221>
    157f:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    1584:	8b 85 74 02 00 00    	mov    0x274(%ebp),%eax
    158a:	85 c0                	test   %eax,%eax
    158c:	74 05                	je     1593 <copy_process+0x230>
    158e:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    1593:	8b 85 78 02 00 00    	mov    0x278(%ebp),%eax
    1599:	85 c0                	test   %eax,%eax
    159b:	74 05                	je     15a2 <copy_process+0x23f>
    159d:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    15a2:	8b 44 24 20          	mov    0x20(%esp),%eax
    15a6:	8d 54 00 04          	lea    0x4(%eax,%eax,1),%edx
    15aa:	8d 83 e8 02 00 00    	lea    0x2e8(%ebx),%eax
    15b0:	66 c7 04 d5 00 00 00 	movw   $0x68,0x0(,%edx,8)
    15b7:	00 68 00 
    15ba:	66 89 04 d5 02 00 00 	mov    %ax,0x2(,%edx,8)
    15c1:	00 
    15c2:	c1 c8 10             	ror    $0x10,%eax
    15c5:	88 04 d5 04 00 00 00 	mov    %al,0x4(,%edx,8)
    15cc:	c6 04 d5 05 00 00 00 	movb   $0x89,0x5(,%edx,8)
    15d3:	89 
    15d4:	c6 04 d5 06 00 00 00 	movb   $0x0,0x6(,%edx,8)
    15db:	00 
    15dc:	88 24 d5 07 00 00 00 	mov    %ah,0x7(,%edx,8)
    15e3:	c1 c8 10             	ror    $0x10,%eax
    15e6:	8d 83 d0 02 00 00    	lea    0x2d0(%ebx),%eax
    15ec:	66 c7 04 d5 08 00 00 	movw   $0x68,0x8(,%edx,8)
    15f3:	00 68 00 
    15f6:	66 89 04 d5 0a 00 00 	mov    %ax,0xa(,%edx,8)
    15fd:	00 
    15fe:	c1 c8 10             	ror    $0x10,%eax
    1601:	88 04 d5 0c 00 00 00 	mov    %al,0xc(,%edx,8)
    1608:	c6 04 d5 0d 00 00 00 	movb   $0x82,0xd(,%edx,8)
    160f:	82 
    1610:	c6 04 d5 0e 00 00 00 	movb   $0x0,0xe(,%edx,8)
    1617:	00 
    1618:	88 24 d5 0f 00 00 00 	mov    %ah,0xf(,%edx,8)
    161f:	c1 c8 10             	ror    $0x10,%eax
    1622:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    1628:	a1 00 00 00 00       	mov    0x0,%eax
    162d:	eb 05                	jmp    1634 <copy_process+0x2d1>
    162f:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1634:	83 c4 0c             	add    $0xc,%esp
    1637:	5b                   	pop    %ebx
    1638:	5e                   	pop    %esi
    1639:	5f                   	pop    %edi
    163a:	5d                   	pop    %ebp
    163b:	c3                   	ret    

0000163c <find_empty_process>:
    163c:	56                   	push   %esi
    163d:	53                   	push   %ebx
    163e:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    1645:	75 f7                	jne    163e <find_empty_process+0x2>
    1647:	b8 01 00 00 00       	mov    $0x1,%eax
    164c:	f0 87 05 00 00 00 00 	lock xchg %eax,0x0
    1653:	83 f8 00             	cmp    $0x0,%eax
    1656:	75 e6                	jne    163e <find_empty_process+0x2>
    1658:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    165e:	be 01 00 00 00       	mov    $0x1,%esi
    1663:	bb 00 01 00 00       	mov    $0x100,%ebx
    1668:	83 c1 01             	add    $0x1,%ecx
    166b:	0f 48 ce             	cmovs  %esi,%ecx
    166e:	b8 00 00 00 00       	mov    $0x0,%eax
    1673:	8b 10                	mov    (%eax),%edx
    1675:	85 d2                	test   %edx,%edx
    1677:	74 08                	je     1681 <find_empty_process+0x45>
    1679:	39 8a 2c 02 00 00    	cmp    %ecx,0x22c(%edx)
    167f:	74 e7                	je     1668 <find_empty_process+0x2c>
    1681:	83 c0 04             	add    $0x4,%eax
    1684:	39 c3                	cmp    %eax,%ebx
    1686:	75 eb                	jne    1673 <find_empty_process+0x37>
    1688:	89 0d 00 00 00 00    	mov    %ecx,0x0
    168e:	83 3d 04 00 00 00 00 	cmpl   $0x0,0x4
    1695:	74 11                	je     16a8 <find_empty_process+0x6c>
    1697:	b8 02 00 00 00       	mov    $0x2,%eax
    169c:	83 3c 85 00 00 00 00 	cmpl   $0x0,0x0(,%eax,4)
    16a3:	00 
    16a4:	75 19                	jne    16bf <find_empty_process+0x83>
    16a6:	eb 05                	jmp    16ad <find_empty_process+0x71>
    16a8:	b8 01 00 00 00       	mov    $0x1,%eax
    16ad:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    16b4:	7e 07                	jle    16bd <find_empty_process+0x81>
    16b6:	83 2d 00 00 00 00 01 	subl   $0x1,0x0
    16bd:	eb 1d                	jmp    16dc <find_empty_process+0xa0>
    16bf:	83 c0 01             	add    $0x1,%eax
    16c2:	83 f8 40             	cmp    $0x40,%eax
    16c5:	75 d5                	jne    169c <find_empty_process+0x60>
    16c7:	83 3d 00 00 00 00 00 	cmpl   $0x0,0x0
    16ce:	7e 07                	jle    16d7 <find_empty_process+0x9b>
    16d0:	83 2d 00 00 00 00 01 	subl   $0x1,0x0
    16d7:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    16dc:	5b                   	pop    %ebx
    16dd:	5e                   	pop    %esi
    16de:	c3                   	ret    

000016df <panic>:
    16df:	83 ec 14             	sub    $0x14,%esp
    16e2:	ff 74 24 18          	pushl  0x18(%esp)
    16e6:	68 ba 01 00 00       	push   $0x1ba
    16eb:	e8 fc ff ff ff       	call   16ec <panic+0xd>
    16f0:	e8 fc ff ff ff       	call   16f1 <panic+0x12>
    16f5:	83 c4 10             	add    $0x10,%esp
    16f8:	39 05 00 00 00 00    	cmp    %eax,0x0
    16fe:	75 12                	jne    1712 <panic+0x33>
    1700:	83 ec 0c             	sub    $0xc,%esp
    1703:	68 3c 01 00 00       	push   $0x13c
    1708:	e8 fc ff ff ff       	call   1709 <panic+0x2a>
    170d:	83 c4 10             	add    $0x10,%esp
    1710:	eb 05                	jmp    1717 <panic+0x38>
    1712:	e8 fc ff ff ff       	call   1713 <panic+0x34>
    1717:	eb fe                	jmp    1717 <panic+0x38>

00001719 <printk>:
    1719:	53                   	push   %ebx
    171a:	83 ec 0c             	sub    $0xc,%esp
    171d:	8d 44 24 18          	lea    0x18(%esp),%eax
    1721:	50                   	push   %eax
    1722:	ff 74 24 18          	pushl  0x18(%esp)
    1726:	68 60 03 00 00       	push   $0x360
    172b:	e8 fc ff ff ff       	call   172c <printk+0x13>
    1730:	89 c3                	mov    %eax,%ebx
    1732:	0f a0                	push   %fs
    1734:	1e                   	push   %ds
    1735:	0f a1                	pop    %fs
    1737:	53                   	push   %ebx
    1738:	68 60 03 00 00       	push   $0x360
    173d:	6a 00                	push   $0x0
    173f:	e8 fc ff ff ff       	call   1740 <printk+0x27>
    1744:	83 c4 08             	add    $0x8,%esp
    1747:	5b                   	pop    %ebx
    1748:	0f a1                	pop    %fs
    174a:	89 d8                	mov    %ebx,%eax
    174c:	83 c4 18             	add    $0x18,%esp
    174f:	5b                   	pop    %ebx
    1750:	c3                   	ret    

00001751 <cpy_str_to_kernel>:
    1751:	57                   	push   %edi
    1752:	56                   	push   %esi
    1753:	8b 44 24 0c          	mov    0xc(%esp),%eax
    1757:	8b 74 24 10          	mov    0x10(%esp),%esi
    175b:	89 c7                	mov    %eax,%edi
    175d:	1e                   	push   %ds
    175e:	0f a0                	push   %fs
    1760:	1f                   	pop    %ds
    1761:	fc                   	cld    
    1762:	ac                   	lods   %ds:(%esi),%al
    1763:	aa                   	stos   %al,%es:(%edi)
    1764:	84 c0                	test   %al,%al
    1766:	75 fa                	jne    1762 <cpy_str_to_kernel+0x11>
    1768:	1f                   	pop    %ds
    1769:	5e                   	pop    %esi
    176a:	5f                   	pop    %edi
    176b:	c3                   	ret    
    176c:	55                   	push   %ebp
    176d:	57                   	push   %edi
    176e:	56                   	push   %esi
    176f:	53                   	push   %ebx
    1770:	83 ec 38             	sub    $0x38,%esp
    1773:	89 c3                	mov    %eax,%ebx
    1775:	89 d5                	mov    %edx,%ebp
    1777:	8b 44 24 54          	mov    0x54(%esp),%eax
    177b:	83 e0 40             	and    $0x40,%eax
    177e:	b8 84 01 00 00       	mov    $0x184,%eax
    1783:	be 5c 01 00 00       	mov    $0x15c,%esi
    1788:	0f 45 f0             	cmovne %eax,%esi
    178b:	8b 54 24 54          	mov    0x54(%esp),%edx
    178f:	83 e2 10             	and    $0x10,%edx
    1792:	8b 44 24 54          	mov    0x54(%esp),%eax
    1796:	83 e0 fe             	and    $0xfffffffe,%eax
    1799:	85 d2                	test   %edx,%edx
    179b:	0f 44 44 24 54       	cmove  0x54(%esp),%eax
    17a0:	89 44 24 54          	mov    %eax,0x54(%esp)
    17a4:	8d 41 fe             	lea    -0x2(%ecx),%eax
    17a7:	83 f8 22             	cmp    $0x22,%eax
    17aa:	0f 87 8a 01 00 00    	ja     193a <cpy_str_to_kernel+0x1e9>
    17b0:	89 cf                	mov    %ecx,%edi
    17b2:	8b 44 24 54          	mov    0x54(%esp),%eax
    17b6:	83 e0 01             	and    $0x1,%eax
    17b9:	83 f8 01             	cmp    $0x1,%eax
    17bc:	19 c0                	sbb    %eax,%eax
    17be:	83 e0 f0             	and    $0xfffffff0,%eax
    17c1:	83 c0 30             	add    $0x30,%eax
    17c4:	88 44 24 07          	mov    %al,0x7(%esp)
    17c8:	f6 44 24 54 02       	testb  $0x2,0x54(%esp)
    17cd:	74 15                	je     17e4 <cpy_str_to_kernel+0x93>
    17cf:	89 e8                	mov    %ebp,%eax
    17d1:	c1 e8 1f             	shr    $0x1f,%eax
    17d4:	84 c0                	test   %al,%al
    17d6:	74 0c                	je     17e4 <cpy_str_to_kernel+0x93>
    17d8:	f7 dd                	neg    %ebp
    17da:	c6 44 24 06 2d       	movb   $0x2d,0x6(%esp)
    17df:	e9 6d 01 00 00       	jmp    1951 <cpy_str_to_kernel+0x200>
    17e4:	f6 44 24 54 04       	testb  $0x4,0x54(%esp)
    17e9:	0f 85 56 01 00 00    	jne    1945 <cpy_str_to_kernel+0x1f4>
    17ef:	f6 44 24 54 08       	testb  $0x8,0x54(%esp)
    17f4:	0f 85 52 01 00 00    	jne    194c <cpy_str_to_kernel+0x1fb>
    17fa:	c6 44 24 06 00       	movb   $0x0,0x6(%esp)
    17ff:	8b 44 24 54          	mov    0x54(%esp),%eax
    1803:	83 e0 20             	and    $0x20,%eax
    1806:	89 04 24             	mov    %eax,(%esp)
    1809:	0f 84 4c 01 00 00    	je     195b <cpy_str_to_kernel+0x20a>
    180f:	83 ff 10             	cmp    $0x10,%edi
    1812:	75 07                	jne    181b <cpy_str_to_kernel+0xca>
    1814:	83 6c 24 4c 02       	subl   $0x2,0x4c(%esp)
    1819:	eb 0d                	jmp    1828 <cpy_str_to_kernel+0xd7>
    181b:	83 ff 08             	cmp    $0x8,%edi
    181e:	0f 94 c0             	sete   %al
    1821:	0f b6 c0             	movzbl %al,%eax
    1824:	29 44 24 4c          	sub    %eax,0x4c(%esp)
    1828:	85 ed                	test   %ebp,%ebp
    182a:	75 0c                	jne    1838 <cpy_str_to_kernel+0xe7>
    182c:	c6 44 24 14 30       	movb   $0x30,0x14(%esp)
    1831:	b9 01 00 00 00       	mov    $0x1,%ecx
    1836:	eb 1f                	jmp    1857 <cpy_str_to_kernel+0x106>
    1838:	b9 00 00 00 00       	mov    $0x0,%ecx
    183d:	83 c1 01             	add    $0x1,%ecx
    1840:	89 e8                	mov    %ebp,%eax
    1842:	ba 00 00 00 00       	mov    $0x0,%edx
    1847:	f7 f7                	div    %edi
    1849:	89 c5                	mov    %eax,%ebp
    184b:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
    184f:	88 54 0c 13          	mov    %dl,0x13(%esp,%ecx,1)
    1853:	85 c0                	test   %eax,%eax
    1855:	75 e6                	jne    183d <cpy_str_to_kernel+0xec>
    1857:	3b 4c 24 50          	cmp    0x50(%esp),%ecx
    185b:	89 cd                	mov    %ecx,%ebp
    185d:	0f 4c 6c 24 50       	cmovl  0x50(%esp),%ebp
    1862:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    1866:	29 e8                	sub    %ebp,%eax
    1868:	f6 44 24 54 11       	testb  $0x11,0x54(%esp)
    186d:	75 20                	jne    188f <cpy_str_to_kernel+0x13e>
    186f:	8d 50 ff             	lea    -0x1(%eax),%edx
    1872:	85 c0                	test   %eax,%eax
    1874:	7e 17                	jle    188d <cpy_str_to_kernel+0x13c>
    1876:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    1879:	83 c3 01             	add    $0x1,%ebx
    187c:	c6 43 ff 20          	movb   $0x20,-0x1(%ebx)
    1880:	39 d3                	cmp    %edx,%ebx
    1882:	75 f5                	jne    1879 <cpy_str_to_kernel+0x128>
    1884:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1889:	89 d3                	mov    %edx,%ebx
    188b:	eb 02                	jmp    188f <cpy_str_to_kernel+0x13e>
    188d:	89 d0                	mov    %edx,%eax
    188f:	0f b6 54 24 06       	movzbl 0x6(%esp),%edx
    1894:	84 d2                	test   %dl,%dl
    1896:	74 05                	je     189d <cpy_str_to_kernel+0x14c>
    1898:	88 13                	mov    %dl,(%ebx)
    189a:	8d 5b 01             	lea    0x1(%ebx),%ebx
    189d:	83 3c 24 00          	cmpl   $0x0,(%esp)
    18a1:	74 1f                	je     18c2 <cpy_str_to_kernel+0x171>
    18a3:	83 ff 08             	cmp    $0x8,%edi
    18a6:	75 08                	jne    18b0 <cpy_str_to_kernel+0x15f>
    18a8:	c6 03 30             	movb   $0x30,(%ebx)
    18ab:	8d 5b 01             	lea    0x1(%ebx),%ebx
    18ae:	eb 12                	jmp    18c2 <cpy_str_to_kernel+0x171>
    18b0:	83 ff 10             	cmp    $0x10,%edi
    18b3:	75 0d                	jne    18c2 <cpy_str_to_kernel+0x171>
    18b5:	c6 03 30             	movb   $0x30,(%ebx)
    18b8:	0f b6 56 21          	movzbl 0x21(%esi),%edx
    18bc:	88 53 01             	mov    %dl,0x1(%ebx)
    18bf:	8d 5b 02             	lea    0x2(%ebx),%ebx
    18c2:	f6 44 24 54 10       	testb  $0x10,0x54(%esp)
    18c7:	75 23                	jne    18ec <cpy_str_to_kernel+0x19b>
    18c9:	8d 50 ff             	lea    -0x1(%eax),%edx
    18cc:	85 c0                	test   %eax,%eax
    18ce:	7e 1a                	jle    18ea <cpy_str_to_kernel+0x199>
    18d0:	01 d8                	add    %ebx,%eax
    18d2:	0f b6 54 24 07       	movzbl 0x7(%esp),%edx
    18d7:	83 c3 01             	add    $0x1,%ebx
    18da:	88 53 ff             	mov    %dl,-0x1(%ebx)
    18dd:	39 c3                	cmp    %eax,%ebx
    18df:	75 f6                	jne    18d7 <cpy_str_to_kernel+0x186>
    18e1:	89 c3                	mov    %eax,%ebx
    18e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    18e8:	eb 02                	jmp    18ec <cpy_str_to_kernel+0x19b>
    18ea:	89 d0                	mov    %edx,%eax
    18ec:	39 e9                	cmp    %ebp,%ecx
    18ee:	7d 13                	jge    1903 <cpy_str_to_kernel+0x1b2>
    18f0:	89 ef                	mov    %ebp,%edi
    18f2:	29 cf                	sub    %ecx,%edi
    18f4:	01 df                	add    %ebx,%edi
    18f6:	83 c3 01             	add    $0x1,%ebx
    18f9:	c6 43 ff 30          	movb   $0x30,-0x1(%ebx)
    18fd:	39 df                	cmp    %ebx,%edi
    18ff:	75 f5                	jne    18f6 <cpy_str_to_kernel+0x1a5>
    1901:	eb 02                	jmp    1905 <cpy_str_to_kernel+0x1b4>
    1903:	89 df                	mov    %ebx,%edi
    1905:	85 c9                	test   %ecx,%ecx
    1907:	7e 1e                	jle    1927 <cpy_str_to_kernel+0x1d6>
    1909:	89 ce                	mov    %ecx,%esi
    190b:	8d 54 0c 13          	lea    0x13(%esp,%ecx,1),%edx
    190f:	8d 6c 24 13          	lea    0x13(%esp),%ebp
    1913:	89 f9                	mov    %edi,%ecx
    1915:	83 c1 01             	add    $0x1,%ecx
    1918:	0f b6 1a             	movzbl (%edx),%ebx
    191b:	88 59 ff             	mov    %bl,-0x1(%ecx)
    191e:	83 ea 01             	sub    $0x1,%edx
    1921:	39 d5                	cmp    %edx,%ebp
    1923:	75 f0                	jne    1915 <cpy_str_to_kernel+0x1c4>
    1925:	01 f7                	add    %esi,%edi
    1927:	85 c0                	test   %eax,%eax
    1929:	7e 16                	jle    1941 <cpy_str_to_kernel+0x1f0>
    192b:	01 f8                	add    %edi,%eax
    192d:	83 c7 01             	add    $0x1,%edi
    1930:	c6 47 ff 20          	movb   $0x20,-0x1(%edi)
    1934:	39 f8                	cmp    %edi,%eax
    1936:	75 f5                	jne    192d <cpy_str_to_kernel+0x1dc>
    1938:	eb 2e                	jmp    1968 <cpy_str_to_kernel+0x217>
    193a:	b8 00 00 00 00       	mov    $0x0,%eax
    193f:	eb 27                	jmp    1968 <cpy_str_to_kernel+0x217>
    1941:	89 f8                	mov    %edi,%eax
    1943:	eb 23                	jmp    1968 <cpy_str_to_kernel+0x217>
    1945:	c6 44 24 06 2b       	movb   $0x2b,0x6(%esp)
    194a:	eb 05                	jmp    1951 <cpy_str_to_kernel+0x200>
    194c:	c6 44 24 06 20       	movb   $0x20,0x6(%esp)
    1951:	83 6c 24 4c 01       	subl   $0x1,0x4c(%esp)
    1956:	e9 a4 fe ff ff       	jmp    17ff <cpy_str_to_kernel+0xae>
    195b:	85 ed                	test   %ebp,%ebp
    195d:	0f 84 c9 fe ff ff    	je     182c <cpy_str_to_kernel+0xdb>
    1963:	e9 d0 fe ff ff       	jmp    1838 <cpy_str_to_kernel+0xe7>
    1968:	83 c4 38             	add    $0x38,%esp
    196b:	5b                   	pop    %ebx
    196c:	5e                   	pop    %esi
    196d:	5f                   	pop    %edi
    196e:	5d                   	pop    %ebp
    196f:	c3                   	ret    

00001970 <vsprintf>:
    1970:	55                   	push   %ebp
    1971:	57                   	push   %edi
    1972:	56                   	push   %esi
    1973:	53                   	push   %ebx
    1974:	83 ec 08             	sub    $0x8,%esp
    1977:	8b 44 24 20          	mov    0x20(%esp),%eax
    197b:	0f b6 10             	movzbl (%eax),%edx
    197e:	84 d2                	test   %dl,%dl
    1980:	0f 84 58 03 00 00    	je     1cde <vsprintf+0x36e>
    1986:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    198a:	80 fa 25             	cmp    $0x25,%dl
    198d:	74 0d                	je     199c <vsprintf+0x2c>
    198f:	88 55 00             	mov    %dl,0x0(%ebp)
    1992:	89 c3                	mov    %eax,%ebx
    1994:	8d 6d 01             	lea    0x1(%ebp),%ebp
    1997:	e9 31 03 00 00       	jmp    1ccd <vsprintf+0x35d>
    199c:	be 00 00 00 00       	mov    $0x0,%esi
    19a1:	83 c0 01             	add    $0x1,%eax
    19a4:	0f b6 08             	movzbl (%eax),%ecx
    19a7:	8d 51 e0             	lea    -0x20(%ecx),%edx
    19aa:	80 fa 10             	cmp    $0x10,%dl
    19ad:	77 23                	ja     19d2 <vsprintf+0x62>
    19af:	0f b6 d2             	movzbl %dl,%edx
    19b2:	ff 24 95 00 00 00 00 	jmp    *0x0(,%edx,4)
    19b9:	83 ce 10             	or     $0x10,%esi
    19bc:	eb e3                	jmp    19a1 <vsprintf+0x31>
    19be:	83 ce 04             	or     $0x4,%esi
    19c1:	eb de                	jmp    19a1 <vsprintf+0x31>
    19c3:	83 ce 08             	or     $0x8,%esi
    19c6:	eb d9                	jmp    19a1 <vsprintf+0x31>
    19c8:	83 ce 20             	or     $0x20,%esi
    19cb:	eb d4                	jmp    19a1 <vsprintf+0x31>
    19cd:	83 ce 01             	or     $0x1,%esi
    19d0:	eb cf                	jmp    19a1 <vsprintf+0x31>
    19d2:	8d 51 d0             	lea    -0x30(%ecx),%edx
    19d5:	80 fa 09             	cmp    $0x9,%dl
    19d8:	77 21                	ja     19fb <vsprintf+0x8b>
    19da:	ba 00 00 00 00       	mov    $0x0,%edx
    19df:	83 c0 01             	add    $0x1,%eax
    19e2:	8d 14 92             	lea    (%edx,%edx,4),%edx
    19e5:	0f be c9             	movsbl %cl,%ecx
    19e8:	8d 54 51 d0          	lea    -0x30(%ecx,%edx,2),%edx
    19ec:	0f b6 08             	movzbl (%eax),%ecx
    19ef:	8d 59 d0             	lea    -0x30(%ecx),%ebx
    19f2:	80 fb 09             	cmp    $0x9,%bl
    19f5:	76 e8                	jbe    19df <vsprintf+0x6f>
    19f7:	89 c3                	mov    %eax,%ebx
    19f9:	eb 27                	jmp    1a22 <vsprintf+0xb2>
    19fb:	89 c3                	mov    %eax,%ebx
    19fd:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    1a02:	80 f9 2a             	cmp    $0x2a,%cl
    1a05:	75 1b                	jne    1a22 <vsprintf+0xb2>
    1a07:	8b 7c 24 24          	mov    0x24(%esp),%edi
    1a0b:	8d 4f 04             	lea    0x4(%edi),%ecx
    1a0e:	8b 17                	mov    (%edi),%edx
    1a10:	85 d2                	test   %edx,%edx
    1a12:	0f 89 cc 02 00 00    	jns    1ce4 <vsprintf+0x374>
    1a18:	f7 da                	neg    %edx
    1a1a:	83 ce 10             	or     $0x10,%esi
    1a1d:	e9 c2 02 00 00       	jmp    1ce4 <vsprintf+0x374>
    1a22:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1a29:	80 3b 2e             	cmpb   $0x2e,(%ebx)
    1a2c:	75 53                	jne    1a81 <vsprintf+0x111>
    1a2e:	8d 7b 01             	lea    0x1(%ebx),%edi
    1a31:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    1a35:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1a38:	80 f9 09             	cmp    $0x9,%cl
    1a3b:	77 1f                	ja     1a5c <vsprintf+0xec>
    1a3d:	b9 00 00 00 00       	mov    $0x0,%ecx
    1a42:	83 c7 01             	add    $0x1,%edi
    1a45:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1a48:	0f be c0             	movsbl %al,%eax
    1a4b:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
    1a4f:	0f b6 07             	movzbl (%edi),%eax
    1a52:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1a55:	80 fb 09             	cmp    $0x9,%bl
    1a58:	76 e8                	jbe    1a42 <vsprintf+0xd2>
    1a5a:	eb 16                	jmp    1a72 <vsprintf+0x102>
    1a5c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    1a61:	3c 2a                	cmp    $0x2a,%al
    1a63:	75 0d                	jne    1a72 <vsprintf+0x102>
    1a65:	8b 44 24 24          	mov    0x24(%esp),%eax
    1a69:	8b 08                	mov    (%eax),%ecx
    1a6b:	8d 40 04             	lea    0x4(%eax),%eax
    1a6e:	89 44 24 24          	mov    %eax,0x24(%esp)
    1a72:	85 c9                	test   %ecx,%ecx
    1a74:	b8 00 00 00 00       	mov    $0x0,%eax
    1a79:	0f 48 c8             	cmovs  %eax,%ecx
    1a7c:	89 0c 24             	mov    %ecx,(%esp)
    1a7f:	89 fb                	mov    %edi,%ebx
    1a81:	0f b6 03             	movzbl (%ebx),%eax
    1a84:	89 c1                	mov    %eax,%ecx
    1a86:	83 e1 df             	and    $0xffffffdf,%ecx
    1a89:	80 f9 4c             	cmp    $0x4c,%cl
    1a8c:	74 04                	je     1a92 <vsprintf+0x122>
    1a8e:	3c 68                	cmp    $0x68,%al
    1a90:	75 03                	jne    1a95 <vsprintf+0x125>
    1a92:	83 c3 01             	add    $0x1,%ebx
    1a95:	0f b6 0b             	movzbl (%ebx),%ecx
    1a98:	8d 41 a8             	lea    -0x58(%ecx),%eax
    1a9b:	3c 20                	cmp    $0x20,%al
    1a9d:	0f 87 f4 01 00 00    	ja     1c97 <vsprintf+0x327>
    1aa3:	0f b6 c0             	movzbl %al,%eax
    1aa6:	ff 24 85 44 00 00 00 	jmp    *0x44(,%eax,4)
    1aad:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1ab3:	75 21                	jne    1ad6 <vsprintf+0x166>
    1ab5:	8d 42 ff             	lea    -0x1(%edx),%eax
    1ab8:	85 c0                	test   %eax,%eax
    1aba:	7e 18                	jle    1ad4 <vsprintf+0x164>
    1abc:	8d 44 15 ff          	lea    -0x1(%ebp,%edx,1),%eax
    1ac0:	83 c5 01             	add    $0x1,%ebp
    1ac3:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    1ac7:	39 c5                	cmp    %eax,%ebp
    1ac9:	75 f5                	jne    1ac0 <vsprintf+0x150>
    1acb:	ba 00 00 00 00       	mov    $0x0,%edx
    1ad0:	89 c5                	mov    %eax,%ebp
    1ad2:	eb 02                	jmp    1ad6 <vsprintf+0x166>
    1ad4:	89 c2                	mov    %eax,%edx
    1ad6:	8b 44 24 24          	mov    0x24(%esp),%eax
    1ada:	8d 70 04             	lea    0x4(%eax),%esi
    1add:	8d 4d 01             	lea    0x1(%ebp),%ecx
    1ae0:	8b 00                	mov    (%eax),%eax
    1ae2:	88 45 00             	mov    %al,0x0(%ebp)
    1ae5:	8d 42 ff             	lea    -0x1(%edx),%eax
    1ae8:	85 c0                	test   %eax,%eax
    1aea:	0f 8e cb 01 00 00    	jle    1cbb <vsprintf+0x34b>
    1af0:	89 d7                	mov    %edx,%edi
    1af2:	01 ea                	add    %ebp,%edx
    1af4:	89 c8                	mov    %ecx,%eax
    1af6:	83 c0 01             	add    $0x1,%eax
    1af9:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    1afd:	39 d0                	cmp    %edx,%eax
    1aff:	75 f5                	jne    1af6 <vsprintf+0x186>
    1b01:	8d 6c 39 ff          	lea    -0x1(%ecx,%edi,1),%ebp
    1b05:	89 74 24 24          	mov    %esi,0x24(%esp)
    1b09:	e9 bf 01 00 00       	jmp    1ccd <vsprintf+0x35d>
    1b0e:	8b 44 24 24          	mov    0x24(%esp),%eax
    1b12:	83 c0 04             	add    $0x4,%eax
    1b15:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b19:	8b 44 24 24          	mov    0x24(%esp),%eax
    1b1d:	8b 38                	mov    (%eax),%edi
    1b1f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    1b24:	b8 00 00 00 00       	mov    $0x0,%eax
    1b29:	fc                   	cld    
    1b2a:	f2 ae                	repnz scas %es:(%edi),%al
    1b2c:	f7 d1                	not    %ecx
    1b2e:	49                   	dec    %ecx
    1b2f:	89 c8                	mov    %ecx,%eax
    1b31:	f7 d0                	not    %eax
    1b33:	01 c7                	add    %eax,%edi
    1b35:	8b 04 24             	mov    (%esp),%eax
    1b38:	85 c0                	test   %eax,%eax
    1b3a:	78 0b                	js     1b47 <vsprintf+0x1d7>
    1b3c:	39 c8                	cmp    %ecx,%eax
    1b3e:	0f 9c c0             	setl   %al
    1b41:	84 c0                	test   %al,%al
    1b43:	0f 45 0c 24          	cmovne (%esp),%ecx
    1b47:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1b4d:	75 23                	jne    1b72 <vsprintf+0x202>
    1b4f:	8d 42 ff             	lea    -0x1(%edx),%eax
    1b52:	39 d1                	cmp    %edx,%ecx
    1b54:	7d 1a                	jge    1b70 <vsprintf+0x200>
    1b56:	89 ce                	mov    %ecx,%esi
    1b58:	29 ca                	sub    %ecx,%edx
    1b5a:	8d 44 15 00          	lea    0x0(%ebp,%edx,1),%eax
    1b5e:	83 c5 01             	add    $0x1,%ebp
    1b61:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    1b65:	39 c5                	cmp    %eax,%ebp
    1b67:	75 f5                	jne    1b5e <vsprintf+0x1ee>
    1b69:	8d 56 ff             	lea    -0x1(%esi),%edx
    1b6c:	89 c5                	mov    %eax,%ebp
    1b6e:	eb 02                	jmp    1b72 <vsprintf+0x202>
    1b70:	89 c2                	mov    %eax,%edx
    1b72:	85 c9                	test   %ecx,%ecx
    1b74:	7e 1e                	jle    1b94 <vsprintf+0x224>
    1b76:	b8 00 00 00 00       	mov    $0x0,%eax
    1b7b:	89 d6                	mov    %edx,%esi
    1b7d:	0f b6 14 07          	movzbl (%edi,%eax,1),%edx
    1b81:	88 54 05 00          	mov    %dl,0x0(%ebp,%eax,1)
    1b85:	83 c0 01             	add    $0x1,%eax
    1b88:	39 c1                	cmp    %eax,%ecx
    1b8a:	75 f1                	jne    1b7d <vsprintf+0x20d>
    1b8c:	89 f2                	mov    %esi,%edx
    1b8e:	8d 44 0d 00          	lea    0x0(%ebp,%ecx,1),%eax
    1b92:	eb 02                	jmp    1b96 <vsprintf+0x226>
    1b94:	89 e8                	mov    %ebp,%eax
    1b96:	39 d1                	cmp    %edx,%ecx
    1b98:	0f 8d 25 01 00 00    	jge    1cc3 <vsprintf+0x353>
    1b9e:	29 ca                	sub    %ecx,%edx
    1ba0:	8d 2c 10             	lea    (%eax,%edx,1),%ebp
    1ba3:	83 c0 01             	add    $0x1,%eax
    1ba6:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    1baa:	39 c5                	cmp    %eax,%ebp
    1bac:	75 f5                	jne    1ba3 <vsprintf+0x233>
    1bae:	8b 44 24 04          	mov    0x4(%esp),%eax
    1bb2:	89 44 24 24          	mov    %eax,0x24(%esp)
    1bb6:	e9 12 01 00 00       	jmp    1ccd <vsprintf+0x35d>
    1bbb:	8b 44 24 24          	mov    0x24(%esp),%eax
    1bbf:	8d 78 04             	lea    0x4(%eax),%edi
    1bc2:	56                   	push   %esi
    1bc3:	ff 74 24 04          	pushl  0x4(%esp)
    1bc7:	52                   	push   %edx
    1bc8:	b9 08 00 00 00       	mov    $0x8,%ecx
    1bcd:	8b 44 24 30          	mov    0x30(%esp),%eax
    1bd1:	8b 10                	mov    (%eax),%edx
    1bd3:	89 e8                	mov    %ebp,%eax
    1bd5:	e8 92 fb ff ff       	call   176c <cpy_str_to_kernel+0x1b>
    1bda:	89 c5                	mov    %eax,%ebp
    1bdc:	83 c4 0c             	add    $0xc,%esp
    1bdf:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1be3:	e9 e5 00 00 00       	jmp    1ccd <vsprintf+0x35d>
    1be8:	83 fa ff             	cmp    $0xffffffff,%edx
    1beb:	75 08                	jne    1bf5 <vsprintf+0x285>
    1bed:	83 ce 01             	or     $0x1,%esi
    1bf0:	ba 08 00 00 00       	mov    $0x8,%edx
    1bf5:	8b 44 24 24          	mov    0x24(%esp),%eax
    1bf9:	8d 78 04             	lea    0x4(%eax),%edi
    1bfc:	56                   	push   %esi
    1bfd:	ff 74 24 04          	pushl  0x4(%esp)
    1c01:	52                   	push   %edx
    1c02:	b9 10 00 00 00       	mov    $0x10,%ecx
    1c07:	8b 44 24 30          	mov    0x30(%esp),%eax
    1c0b:	8b 10                	mov    (%eax),%edx
    1c0d:	89 e8                	mov    %ebp,%eax
    1c0f:	e8 58 fb ff ff       	call   176c <cpy_str_to_kernel+0x1b>
    1c14:	89 c5                	mov    %eax,%ebp
    1c16:	83 c4 0c             	add    $0xc,%esp
    1c19:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1c1d:	e9 ab 00 00 00       	jmp    1ccd <vsprintf+0x35d>
    1c22:	83 ce 40             	or     $0x40,%esi
    1c25:	8b 44 24 24          	mov    0x24(%esp),%eax
    1c29:	8d 78 04             	lea    0x4(%eax),%edi
    1c2c:	56                   	push   %esi
    1c2d:	ff 74 24 04          	pushl  0x4(%esp)
    1c31:	52                   	push   %edx
    1c32:	b9 10 00 00 00       	mov    $0x10,%ecx
    1c37:	8b 44 24 30          	mov    0x30(%esp),%eax
    1c3b:	8b 10                	mov    (%eax),%edx
    1c3d:	89 e8                	mov    %ebp,%eax
    1c3f:	e8 28 fb ff ff       	call   176c <cpy_str_to_kernel+0x1b>
    1c44:	89 c5                	mov    %eax,%ebp
    1c46:	83 c4 0c             	add    $0xc,%esp
    1c49:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1c4d:	eb 7e                	jmp    1ccd <vsprintf+0x35d>
    1c4f:	83 ce 02             	or     $0x2,%esi
    1c52:	8b 44 24 24          	mov    0x24(%esp),%eax
    1c56:	8d 78 04             	lea    0x4(%eax),%edi
    1c59:	56                   	push   %esi
    1c5a:	ff 74 24 04          	pushl  0x4(%esp)
    1c5e:	52                   	push   %edx
    1c5f:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1c64:	8b 44 24 30          	mov    0x30(%esp),%eax
    1c68:	8b 10                	mov    (%eax),%edx
    1c6a:	89 e8                	mov    %ebp,%eax
    1c6c:	e8 fb fa ff ff       	call   176c <cpy_str_to_kernel+0x1b>
    1c71:	89 c5                	mov    %eax,%ebp
    1c73:	83 c4 0c             	add    $0xc,%esp
    1c76:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1c7a:	eb 51                	jmp    1ccd <vsprintf+0x35d>
    1c7c:	8b 44 24 24          	mov    0x24(%esp),%eax
    1c80:	8b 00                	mov    (%eax),%eax
    1c82:	89 ea                	mov    %ebp,%edx
    1c84:	2b 54 24 1c          	sub    0x1c(%esp),%edx
    1c88:	89 10                	mov    %edx,(%eax)
    1c8a:	8b 44 24 24          	mov    0x24(%esp),%eax
    1c8e:	8d 40 04             	lea    0x4(%eax),%eax
    1c91:	89 44 24 24          	mov    %eax,0x24(%esp)
    1c95:	eb 36                	jmp    1ccd <vsprintf+0x35d>
    1c97:	80 f9 25             	cmp    $0x25,%cl
    1c9a:	74 10                	je     1cac <vsprintf+0x33c>
    1c9c:	8d 45 01             	lea    0x1(%ebp),%eax
    1c9f:	c6 45 00 25          	movb   $0x25,0x0(%ebp)
    1ca3:	0f b6 0b             	movzbl (%ebx),%ecx
    1ca6:	84 c9                	test   %cl,%cl
    1ca8:	74 0a                	je     1cb4 <vsprintf+0x344>
    1caa:	89 c5                	mov    %eax,%ebp
    1cac:	88 4d 00             	mov    %cl,0x0(%ebp)
    1caf:	8d 6d 01             	lea    0x1(%ebp),%ebp
    1cb2:	eb 19                	jmp    1ccd <vsprintf+0x35d>
    1cb4:	83 eb 01             	sub    $0x1,%ebx
    1cb7:	89 c5                	mov    %eax,%ebp
    1cb9:	eb 12                	jmp    1ccd <vsprintf+0x35d>
    1cbb:	89 cd                	mov    %ecx,%ebp
    1cbd:	89 74 24 24          	mov    %esi,0x24(%esp)
    1cc1:	eb 0a                	jmp    1ccd <vsprintf+0x35d>
    1cc3:	89 c5                	mov    %eax,%ebp
    1cc5:	8b 44 24 04          	mov    0x4(%esp),%eax
    1cc9:	89 44 24 24          	mov    %eax,0x24(%esp)
    1ccd:	8d 43 01             	lea    0x1(%ebx),%eax
    1cd0:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
    1cd4:	84 d2                	test   %dl,%dl
    1cd6:	0f 85 ae fc ff ff    	jne    198a <vsprintf+0x1a>
    1cdc:	eb 18                	jmp    1cf6 <vsprintf+0x386>
    1cde:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1ce2:	eb 12                	jmp    1cf6 <vsprintf+0x386>
    1ce4:	89 c3                	mov    %eax,%ebx
    1ce6:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    1cea:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1cf1:	e9 8b fd ff ff       	jmp    1a81 <vsprintf+0x111>
    1cf6:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
    1cfa:	89 e8                	mov    %ebp,%eax
    1cfc:	2b 44 24 1c          	sub    0x1c(%esp),%eax
    1d00:	83 c4 08             	add    $0x8,%esp
    1d03:	5b                   	pop    %ebx
    1d04:	5e                   	pop    %esi
    1d05:	5f                   	pop    %edi
    1d06:	5d                   	pop    %ebp
    1d07:	c3                   	ret    

00001d08 <sys_ftime>:
    1d08:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1d0d:	c3                   	ret    

00001d0e <sys_break>:
    1d0e:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1d13:	c3                   	ret    

00001d14 <sys_ptrace>:
    1d14:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1d19:	c3                   	ret    

00001d1a <sys_stty>:
    1d1a:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1d1f:	c3                   	ret    

00001d20 <sys_gtty>:
    1d20:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1d25:	c3                   	ret    

00001d26 <sys_rename>:
    1d26:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1d2b:	c3                   	ret    

00001d2c <sys_prof>:
    1d2c:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1d31:	c3                   	ret    

00001d32 <sys_setregid>:
    1d32:	57                   	push   %edi
    1d33:	56                   	push   %esi
    1d34:	53                   	push   %ebx
    1d35:	8b 7c 24 10          	mov    0x10(%esp),%edi
    1d39:	8b 74 24 14          	mov    0x14(%esp),%esi
    1d3d:	e8 fc ff ff ff       	call   1d3e <sys_setregid+0xc>
    1d42:	89 c3                	mov    %eax,%ebx
    1d44:	85 ff                	test   %edi,%edi
    1d46:	7e 21                	jle    1d69 <sys_setregid+0x37>
    1d48:	0f b7 80 46 02 00 00 	movzwl 0x246(%eax),%eax
    1d4f:	39 c7                	cmp    %eax,%edi
    1d51:	74 0f                	je     1d62 <sys_setregid+0x30>
    1d53:	e8 fc ff ff ff       	call   1d54 <sys_setregid+0x22>
    1d58:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1d5f:	00 
    1d60:	75 49                	jne    1dab <sys_setregid+0x79>
    1d62:	66 89 bb 46 02 00 00 	mov    %di,0x246(%ebx)
    1d69:	85 f6                	test   %esi,%esi
    1d6b:	7e 45                	jle    1db2 <sys_setregid+0x80>
    1d6d:	0f b7 83 46 02 00 00 	movzwl 0x246(%ebx),%eax
    1d74:	39 c6                	cmp    %eax,%esi
    1d76:	74 25                	je     1d9d <sys_setregid+0x6b>
    1d78:	0f b7 83 48 02 00 00 	movzwl 0x248(%ebx),%eax
    1d7f:	39 c6                	cmp    %eax,%esi
    1d81:	74 1a                	je     1d9d <sys_setregid+0x6b>
    1d83:	0f b7 83 4a 02 00 00 	movzwl 0x24a(%ebx),%eax
    1d8a:	39 c6                	cmp    %eax,%esi
    1d8c:	74 0f                	je     1d9d <sys_setregid+0x6b>
    1d8e:	e8 fc ff ff ff       	call   1d8f <sys_setregid+0x5d>
    1d93:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1d9a:	00 
    1d9b:	75 1c                	jne    1db9 <sys_setregid+0x87>
    1d9d:	66 89 b3 48 02 00 00 	mov    %si,0x248(%ebx)
    1da4:	b8 00 00 00 00       	mov    $0x0,%eax
    1da9:	eb 13                	jmp    1dbe <sys_setregid+0x8c>
    1dab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1db0:	eb 0c                	jmp    1dbe <sys_setregid+0x8c>
    1db2:	b8 00 00 00 00       	mov    $0x0,%eax
    1db7:	eb 05                	jmp    1dbe <sys_setregid+0x8c>
    1db9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1dbe:	5b                   	pop    %ebx
    1dbf:	5e                   	pop    %esi
    1dc0:	5f                   	pop    %edi
    1dc1:	c3                   	ret    

00001dc2 <sys_setgid>:
    1dc2:	83 ec 14             	sub    $0x14,%esp
    1dc5:	8b 44 24 18          	mov    0x18(%esp),%eax
    1dc9:	50                   	push   %eax
    1dca:	50                   	push   %eax
    1dcb:	e8 fc ff ff ff       	call   1dcc <sys_setgid+0xa>
    1dd0:	83 c4 1c             	add    $0x1c,%esp
    1dd3:	c3                   	ret    

00001dd4 <sys_acct>:
    1dd4:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1dd9:	c3                   	ret    

00001dda <sys_phys>:
    1dda:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1ddf:	c3                   	ret    

00001de0 <sys_lock>:
    1de0:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1de5:	c3                   	ret    

00001de6 <sys_mpx>:
    1de6:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1deb:	c3                   	ret    

00001dec <sys_ulimit>:
    1dec:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1df1:	c3                   	ret    

00001df2 <sys_time>:
    1df2:	56                   	push   %esi
    1df3:	53                   	push   %ebx
    1df4:	83 ec 04             	sub    $0x4,%esp
    1df7:	8b 74 24 10          	mov    0x10(%esp),%esi
    1dfb:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1e01:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1e06:	89 c8                	mov    %ecx,%eax
    1e08:	f7 ea                	imul   %edx
    1e0a:	c1 fa 05             	sar    $0x5,%edx
    1e0d:	c1 f9 1f             	sar    $0x1f,%ecx
    1e10:	29 ca                	sub    %ecx,%edx
    1e12:	89 d3                	mov    %edx,%ebx
    1e14:	03 1d 00 00 00 00    	add    0x0,%ebx
    1e1a:	85 f6                	test   %esi,%esi
    1e1c:	74 11                	je     1e2f <sys_time+0x3d>
    1e1e:	83 ec 08             	sub    $0x8,%esp
    1e21:	6a 04                	push   $0x4
    1e23:	56                   	push   %esi
    1e24:	e8 fc ff ff ff       	call   1e25 <sys_time+0x33>
    1e29:	64 89 1e             	mov    %ebx,%fs:(%esi)
    1e2c:	83 c4 10             	add    $0x10,%esp
    1e2f:	89 d8                	mov    %ebx,%eax
    1e31:	83 c4 04             	add    $0x4,%esp
    1e34:	5b                   	pop    %ebx
    1e35:	5e                   	pop    %esi
    1e36:	c3                   	ret    

00001e37 <sys_setreuid>:
    1e37:	55                   	push   %ebp
    1e38:	57                   	push   %edi
    1e39:	56                   	push   %esi
    1e3a:	53                   	push   %ebx
    1e3b:	83 ec 0c             	sub    $0xc,%esp
    1e3e:	8b 74 24 24          	mov    0x24(%esp),%esi
    1e42:	e8 fc ff ff ff       	call   1e43 <sys_setreuid+0xc>
    1e47:	89 c3                	mov    %eax,%ebx
    1e49:	0f b7 a8 40 02 00 00 	movzwl 0x240(%eax),%ebp
    1e50:	0f b7 fd             	movzwl %bp,%edi
    1e53:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
    1e58:	7e 2e                	jle    1e88 <sys_setreuid+0x51>
    1e5a:	0f b7 80 42 02 00 00 	movzwl 0x242(%eax),%eax
    1e61:	3b 44 24 20          	cmp    0x20(%esp),%eax
    1e65:	74 15                	je     1e7c <sys_setreuid+0x45>
    1e67:	3b 7c 24 20          	cmp    0x20(%esp),%edi
    1e6b:	74 0f                	je     1e7c <sys_setreuid+0x45>
    1e6d:	e8 fc ff ff ff       	call   1e6e <sys_setreuid+0x37>
    1e72:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1e79:	00 
    1e7a:	75 4a                	jne    1ec6 <sys_setreuid+0x8f>
    1e7c:	0f b7 44 24 20       	movzwl 0x20(%esp),%eax
    1e81:	66 89 83 40 02 00 00 	mov    %ax,0x240(%ebx)
    1e88:	85 f6                	test   %esi,%esi
    1e8a:	7e 41                	jle    1ecd <sys_setreuid+0x96>
    1e8c:	39 f7                	cmp    %esi,%edi
    1e8e:	74 1a                	je     1eaa <sys_setreuid+0x73>
    1e90:	0f b7 83 42 02 00 00 	movzwl 0x242(%ebx),%eax
    1e97:	39 c6                	cmp    %eax,%esi
    1e99:	74 0f                	je     1eaa <sys_setreuid+0x73>
    1e9b:	e8 fc ff ff ff       	call   1e9c <sys_setreuid+0x65>
    1ea0:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1ea7:	00 
    1ea8:	75 0e                	jne    1eb8 <sys_setreuid+0x81>
    1eaa:	66 89 b3 42 02 00 00 	mov    %si,0x242(%ebx)
    1eb1:	b8 00 00 00 00       	mov    $0x0,%eax
    1eb6:	eb 1a                	jmp    1ed2 <sys_setreuid+0x9b>
    1eb8:	66 89 ab 40 02 00 00 	mov    %bp,0x240(%ebx)
    1ebf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ec4:	eb 0c                	jmp    1ed2 <sys_setreuid+0x9b>
    1ec6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1ecb:	eb 05                	jmp    1ed2 <sys_setreuid+0x9b>
    1ecd:	b8 00 00 00 00       	mov    $0x0,%eax
    1ed2:	83 c4 0c             	add    $0xc,%esp
    1ed5:	5b                   	pop    %ebx
    1ed6:	5e                   	pop    %esi
    1ed7:	5f                   	pop    %edi
    1ed8:	5d                   	pop    %ebp
    1ed9:	c3                   	ret    

00001eda <sys_setuid>:
    1eda:	83 ec 14             	sub    $0x14,%esp
    1edd:	8b 44 24 18          	mov    0x18(%esp),%eax
    1ee1:	50                   	push   %eax
    1ee2:	50                   	push   %eax
    1ee3:	e8 fc ff ff ff       	call   1ee4 <sys_setuid+0xa>
    1ee8:	83 c4 1c             	add    $0x1c,%esp
    1eeb:	c3                   	ret    

00001eec <sys_stime>:
    1eec:	53                   	push   %ebx
    1eed:	83 ec 08             	sub    $0x8,%esp
    1ef0:	e8 fc ff ff ff       	call   1ef1 <sys_stime+0x5>
    1ef5:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1efc:	00 
    1efd:	75 2d                	jne    1f2c <sys_stime+0x40>
    1eff:	8b 44 24 10          	mov    0x10(%esp),%eax
    1f03:	64 8b 08             	mov    %fs:(%eax),%ecx
    1f06:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1f0c:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1f11:	89 d8                	mov    %ebx,%eax
    1f13:	f7 ea                	imul   %edx
    1f15:	c1 fa 05             	sar    $0x5,%edx
    1f18:	c1 fb 1f             	sar    $0x1f,%ebx
    1f1b:	29 da                	sub    %ebx,%edx
    1f1d:	29 d1                	sub    %edx,%ecx
    1f1f:	89 0d 00 00 00 00    	mov    %ecx,0x0
    1f25:	b8 00 00 00 00       	mov    $0x0,%eax
    1f2a:	eb 05                	jmp    1f31 <sys_stime+0x45>
    1f2c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f31:	83 c4 08             	add    $0x8,%esp
    1f34:	5b                   	pop    %ebx
    1f35:	c3                   	ret    

00001f36 <sys_times>:
    1f36:	56                   	push   %esi
    1f37:	53                   	push   %ebx
    1f38:	83 ec 04             	sub    $0x4,%esp
    1f3b:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1f3f:	85 db                	test   %ebx,%ebx
    1f41:	74 3c                	je     1f7f <sys_times+0x49>
    1f43:	e8 fc ff ff ff       	call   1f44 <sys_times+0xe>
    1f48:	89 c6                	mov    %eax,%esi
    1f4a:	83 ec 08             	sub    $0x8,%esp
    1f4d:	6a 10                	push   $0x10
    1f4f:	53                   	push   %ebx
    1f50:	e8 fc ff ff ff       	call   1f51 <sys_times+0x1b>
    1f55:	8b 86 50 02 00 00    	mov    0x250(%esi),%eax
    1f5b:	64 89 03             	mov    %eax,%fs:(%ebx)
    1f5e:	8b 86 54 02 00 00    	mov    0x254(%esi),%eax
    1f64:	64 89 43 04          	mov    %eax,%fs:0x4(%ebx)
    1f68:	8b 86 58 02 00 00    	mov    0x258(%esi),%eax
    1f6e:	64 89 43 08          	mov    %eax,%fs:0x8(%ebx)
    1f72:	8b 86 5c 02 00 00    	mov    0x25c(%esi),%eax
    1f78:	64 89 43 0c          	mov    %eax,%fs:0xc(%ebx)
    1f7c:	83 c4 10             	add    $0x10,%esp
    1f7f:	a1 00 00 00 00       	mov    0x0,%eax
    1f84:	83 c4 04             	add    $0x4,%esp
    1f87:	5b                   	pop    %ebx
    1f88:	5e                   	pop    %esi
    1f89:	c3                   	ret    

00001f8a <sys_brk>:
    1f8a:	53                   	push   %ebx
    1f8b:	83 ec 08             	sub    $0x8,%esp
    1f8e:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1f92:	e8 fc ff ff ff       	call   1f93 <sys_brk+0x9>
    1f97:	39 98 1c 02 00 00    	cmp    %ebx,0x21c(%eax)
    1f9d:	77 16                	ja     1fb5 <sys_brk+0x2b>
    1f9f:	8b 88 28 02 00 00    	mov    0x228(%eax),%ecx
    1fa5:	8d 91 00 c0 ff ff    	lea    -0x4000(%ecx),%edx
    1fab:	39 d3                	cmp    %edx,%ebx
    1fad:	73 06                	jae    1fb5 <sys_brk+0x2b>
    1faf:	89 98 24 02 00 00    	mov    %ebx,0x224(%eax)
    1fb5:	8b 80 24 02 00 00    	mov    0x224(%eax),%eax
    1fbb:	83 c4 08             	add    $0x8,%esp
    1fbe:	5b                   	pop    %ebx
    1fbf:	c3                   	ret    

00001fc0 <sys_setpgid>:
    1fc0:	57                   	push   %edi
    1fc1:	56                   	push   %esi
    1fc2:	53                   	push   %ebx
    1fc3:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1fc7:	8b 74 24 14          	mov    0x14(%esp),%esi
    1fcb:	e8 fc ff ff ff       	call   1fcc <sys_setpgid+0xc>
    1fd0:	85 db                	test   %ebx,%ebx
    1fd2:	75 06                	jne    1fda <sys_setpgid+0x1a>
    1fd4:	8b 98 2c 02 00 00    	mov    0x22c(%eax),%ebx
    1fda:	85 f6                	test   %esi,%esi
    1fdc:	75 06                	jne    1fe4 <sys_setpgid+0x24>
    1fde:	8b b0 2c 02 00 00    	mov    0x22c(%eax),%esi
    1fe4:	ba 00 00 00 00       	mov    $0x0,%edx
    1fe9:	bf 00 01 00 00       	mov    $0x100,%edi
    1fee:	8b 0a                	mov    (%edx),%ecx
    1ff0:	85 c9                	test   %ecx,%ecx
    1ff2:	74 2c                	je     2020 <sys_setpgid+0x60>
    1ff4:	3b 99 2c 02 00 00    	cmp    0x22c(%ecx),%ebx
    1ffa:	75 24                	jne    2020 <sys_setpgid+0x60>
    1ffc:	83 b9 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ecx)
    2003:	75 29                	jne    202e <sys_setpgid+0x6e>
    2005:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
    200b:	39 81 38 02 00 00    	cmp    %eax,0x238(%ecx)
    2011:	75 22                	jne    2035 <sys_setpgid+0x75>
    2013:	89 b1 34 02 00 00    	mov    %esi,0x234(%ecx)
    2019:	b8 00 00 00 00       	mov    $0x0,%eax
    201e:	eb 1a                	jmp    203a <sys_setpgid+0x7a>
    2020:	83 c2 04             	add    $0x4,%edx
    2023:	39 fa                	cmp    %edi,%edx
    2025:	75 c7                	jne    1fee <sys_setpgid+0x2e>
    2027:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
    202c:	eb 0c                	jmp    203a <sys_setpgid+0x7a>
    202e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2033:	eb 05                	jmp    203a <sys_setpgid+0x7a>
    2035:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    203a:	5b                   	pop    %ebx
    203b:	5e                   	pop    %esi
    203c:	5f                   	pop    %edi
    203d:	c3                   	ret    

0000203e <sys_getpgrp>:
    203e:	83 ec 0c             	sub    $0xc,%esp
    2041:	e8 fc ff ff ff       	call   2042 <sys_getpgrp+0x4>
    2046:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
    204c:	83 c4 0c             	add    $0xc,%esp
    204f:	c3                   	ret    

00002050 <sys_setsid>:
    2050:	53                   	push   %ebx
    2051:	83 ec 08             	sub    $0x8,%esp
    2054:	e8 fc ff ff ff       	call   2055 <sys_setsid+0x5>
    2059:	89 c3                	mov    %eax,%ebx
    205b:	83 b8 3c 02 00 00 00 	cmpl   $0x0,0x23c(%eax)
    2062:	74 0f                	je     2073 <sys_setsid+0x23>
    2064:	e8 fc ff ff ff       	call   2065 <sys_setsid+0x15>
    2069:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    2070:	00 
    2071:	75 28                	jne    209b <sys_setsid+0x4b>
    2073:	c7 83 3c 02 00 00 01 	movl   $0x1,0x23c(%ebx)
    207a:	00 00 00 
    207d:	8b 83 2c 02 00 00    	mov    0x22c(%ebx),%eax
    2083:	89 83 34 02 00 00    	mov    %eax,0x234(%ebx)
    2089:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
    208f:	c7 83 68 02 00 00 ff 	movl   $0xffffffff,0x268(%ebx)
    2096:	ff ff ff 
    2099:	eb 05                	jmp    20a0 <sys_setsid+0x50>
    209b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    20a0:	83 c4 08             	add    $0x8,%esp
    20a3:	5b                   	pop    %ebx
    20a4:	c3                   	ret    

000020a5 <sys_uname>:
    20a5:	53                   	push   %ebx
    20a6:	83 ec 08             	sub    $0x8,%esp
    20a9:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    20ad:	85 db                	test   %ebx,%ebx
    20af:	74 2d                	je     20de <sys_uname+0x39>
    20b1:	83 ec 08             	sub    $0x8,%esp
    20b4:	6a 2d                	push   $0x2d
    20b6:	53                   	push   %ebx
    20b7:	e8 fc ff ff ff       	call   20b8 <sys_uname+0x13>
    20bc:	83 c4 10             	add    $0x10,%esp
    20bf:	b8 00 00 00 00       	mov    $0x0,%eax
    20c4:	0f b6 90 a0 1b 00 00 	movzbl 0x1ba0(%eax),%edx
    20cb:	64 88 14 03          	mov    %dl,%fs:(%ebx,%eax,1)
    20cf:	83 c0 01             	add    $0x1,%eax
    20d2:	83 f8 2d             	cmp    $0x2d,%eax
    20d5:	75 ed                	jne    20c4 <sys_uname+0x1f>
    20d7:	b8 00 00 00 00       	mov    $0x0,%eax
    20dc:	eb 05                	jmp    20e3 <sys_uname+0x3e>
    20de:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    20e3:	83 c4 08             	add    $0x8,%esp
    20e6:	5b                   	pop    %ebx
    20e7:	c3                   	ret    

000020e8 <sys_umask>:
    20e8:	83 ec 0c             	sub    $0xc,%esp
    20eb:	e8 fc ff ff ff       	call   20ec <sys_umask+0x4>
    20f0:	89 c1                	mov    %eax,%ecx
    20f2:	0f b7 80 6c 02 00 00 	movzwl 0x26c(%eax),%eax
    20f9:	0f b7 54 24 10       	movzwl 0x10(%esp),%edx
    20fe:	66 81 e2 ff 01       	and    $0x1ff,%dx
    2103:	66 89 91 6c 02 00 00 	mov    %dx,0x26c(%ecx)
    210a:	83 c4 0c             	add    $0xc,%esp
    210d:	c3                   	ret    

0000210e <release>:
    210e:	53                   	push   %ebx
    210f:	83 ec 08             	sub    $0x8,%esp
    2112:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    2116:	85 db                	test   %ebx,%ebx
    2118:	0f 84 8c 00 00 00    	je     21aa <release+0x9c>
    211e:	3b 1d 04 00 00 00    	cmp    0x4,%ebx
    2124:	74 10                	je     2136 <release+0x28>
    2126:	b8 02 00 00 00       	mov    $0x2,%eax
    212b:	3b 1c 85 00 00 00 00 	cmp    0x0(,%eax,4),%ebx
    2132:	75 5e                	jne    2192 <release+0x84>
    2134:	eb 05                	jmp    213b <release+0x2d>
    2136:	b8 01 00 00 00       	mov    $0x1,%eax
    213b:	c7 04 85 00 00 00 00 	movl   $0x0,0x0(,%eax,4)
    2142:	00 00 00 00 
    2146:	83 ec 0c             	sub    $0xc,%esp
    2149:	ff b3 04 03 00 00    	pushl  0x304(%ebx)
    214f:	e8 fc ff ff ff       	call   2150 <release+0x42>
    2154:	83 c4 10             	add    $0x10,%esp
    2157:	85 c0                	test   %eax,%eax
    2159:	75 10                	jne    216b <release+0x5d>
    215b:	83 ec 0c             	sub    $0xc,%esp
    215e:	68 ac 01 00 00       	push   $0x1ac
    2163:	e8 fc ff ff ff       	call   2164 <release+0x56>
    2168:	83 c4 10             	add    $0x10,%esp
    216b:	83 ec 0c             	sub    $0xc,%esp
    216e:	53                   	push   %ebx
    216f:	e8 fc ff ff ff       	call   2170 <release+0x62>
    2174:	83 c4 10             	add    $0x10,%esp
    2177:	85 c0                	test   %eax,%eax
    2179:	75 10                	jne    218b <release+0x7d>
    217b:	83 ec 0c             	sub    $0xc,%esp
    217e:	68 d8 01 00 00       	push   $0x1d8
    2183:	e8 fc ff ff ff       	call   2184 <release+0x76>
    2188:	83 c4 10             	add    $0x10,%esp
    218b:	e8 fc ff ff ff       	call   218c <release+0x7e>
    2190:	eb 18                	jmp    21aa <release+0x9c>
    2192:	83 c0 01             	add    $0x1,%eax
    2195:	83 f8 40             	cmp    $0x40,%eax
    2198:	75 91                	jne    212b <release+0x1d>
    219a:	83 ec 0c             	sub    $0xc,%esp
    219d:	68 00 02 00 00       	push   $0x200
    21a2:	e8 fc ff ff ff       	call   21a3 <release+0x95>
    21a7:	83 c4 10             	add    $0x10,%esp
    21aa:	83 c4 08             	add    $0x8,%esp
    21ad:	5b                   	pop    %ebx
    21ae:	c3                   	ret    

000021af <send_sig>:
    21af:	56                   	push   %esi
    21b0:	53                   	push   %ebx
    21b1:	83 ec 04             	sub    $0x4,%esp
    21b4:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    21b8:	8b 74 24 14          	mov    0x14(%esp),%esi
    21bc:	e8 fc ff ff ff       	call   21bd <send_sig+0xe>
    21c1:	8d 53 ff             	lea    -0x1(%ebx),%edx
    21c4:	83 fa 1f             	cmp    $0x1f,%edx
    21c7:	77 3e                	ja     2207 <send_sig+0x58>
    21c9:	85 f6                	test   %esi,%esi
    21cb:	74 3a                	je     2207 <send_sig+0x58>
    21cd:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    21d2:	75 1f                	jne    21f3 <send_sig+0x44>
    21d4:	0f b7 8e 42 02 00 00 	movzwl 0x242(%esi),%ecx
    21db:	66 39 88 42 02 00 00 	cmp    %cx,0x242(%eax)
    21e2:	74 0f                	je     21f3 <send_sig+0x44>
    21e4:	e8 fc ff ff ff       	call   21e5 <send_sig+0x36>
    21e9:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    21f0:	00 
    21f1:	75 1b                	jne    220e <send_sig+0x5f>
    21f3:	8d 4b ff             	lea    -0x1(%ebx),%ecx
    21f6:	b8 01 00 00 00       	mov    $0x1,%eax
    21fb:	d3 e0                	shl    %cl,%eax
    21fd:	09 46 0c             	or     %eax,0xc(%esi)
    2200:	b8 00 00 00 00       	mov    $0x0,%eax
    2205:	eb 0c                	jmp    2213 <send_sig+0x64>
    2207:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    220c:	eb 05                	jmp    2213 <send_sig+0x64>
    220e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2213:	83 c4 04             	add    $0x4,%esp
    2216:	5b                   	pop    %ebx
    2217:	5e                   	pop    %esi
    2218:	c3                   	ret    

00002219 <kill_session>:
    2219:	53                   	push   %ebx
    221a:	83 ec 08             	sub    $0x8,%esp
    221d:	e8 fc ff ff ff       	call   221e <kill_session+0x5>
    2222:	ba 00 01 00 00       	mov    $0x100,%edx
    2227:	eb 18                	jmp    2241 <kill_session+0x28>
    2229:	8b 0a                	mov    (%edx),%ecx
    222b:	85 c9                	test   %ecx,%ecx
    222d:	74 12                	je     2241 <kill_session+0x28>
    222f:	8b 98 38 02 00 00    	mov    0x238(%eax),%ebx
    2235:	39 99 38 02 00 00    	cmp    %ebx,0x238(%ecx)
    223b:	75 04                	jne    2241 <kill_session+0x28>
    223d:	83 49 0c 01          	orl    $0x1,0xc(%ecx)
    2241:	83 ea 04             	sub    $0x4,%edx
    2244:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    224a:	75 dd                	jne    2229 <kill_session+0x10>
    224c:	83 c4 08             	add    $0x8,%esp
    224f:	5b                   	pop    %ebx
    2250:	c3                   	ret    

00002251 <sys_kill>:
    2251:	55                   	push   %ebp
    2252:	57                   	push   %edi
    2253:	56                   	push   %esi
    2254:	53                   	push   %ebx
    2255:	83 ec 0c             	sub    $0xc,%esp
    2258:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    225c:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    2260:	e8 fc ff ff ff       	call   2261 <sys_kill+0x10>
    2265:	85 db                	test   %ebx,%ebx
    2267:	74 2c                	je     2295 <sys_kill+0x44>
    2269:	eb 46                	jmp    22b1 <sys_kill+0x60>
    226b:	8b 03                	mov    (%ebx),%eax
    226d:	85 c0                	test   %eax,%eax
    226f:	74 30                	je     22a1 <sys_kill+0x50>
    2271:	8b 96 2c 02 00 00    	mov    0x22c(%esi),%edx
    2277:	39 90 34 02 00 00    	cmp    %edx,0x234(%eax)
    227d:	75 22                	jne    22a1 <sys_kill+0x50>
    227f:	83 ec 04             	sub    $0x4,%esp
    2282:	6a 01                	push   $0x1
    2284:	50                   	push   %eax
    2285:	55                   	push   %ebp
    2286:	e8 fc ff ff ff       	call   2287 <sys_kill+0x36>
    228b:	83 c4 10             	add    $0x10,%esp
    228e:	85 c0                	test   %eax,%eax
    2290:	0f 45 f8             	cmovne %eax,%edi
    2293:	eb 0c                	jmp    22a1 <sys_kill+0x50>
    2295:	89 c6                	mov    %eax,%esi
    2297:	bf 00 00 00 00       	mov    $0x0,%edi
    229c:	bb 00 01 00 00       	mov    $0x100,%ebx
    22a1:	83 eb 04             	sub    $0x4,%ebx
    22a4:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
    22aa:	75 bf                	jne    226b <sys_kill+0x1a>
    22ac:	e9 aa 00 00 00       	jmp    235b <sys_kill+0x10a>
    22b1:	bf 00 00 00 00       	mov    $0x0,%edi
    22b6:	be 00 01 00 00       	mov    $0x100,%esi
    22bb:	85 db                	test   %ebx,%ebx
    22bd:	7f 24                	jg     22e3 <sys_kill+0x92>
    22bf:	eb 2f                	jmp    22f0 <sys_kill+0x9f>
    22c1:	8b 06                	mov    (%esi),%eax
    22c3:	85 c0                	test   %eax,%eax
    22c5:	74 1c                	je     22e3 <sys_kill+0x92>
    22c7:	3b 98 2c 02 00 00    	cmp    0x22c(%eax),%ebx
    22cd:	75 14                	jne    22e3 <sys_kill+0x92>
    22cf:	83 ec 04             	sub    $0x4,%esp
    22d2:	6a 00                	push   $0x0
    22d4:	50                   	push   %eax
    22d5:	55                   	push   %ebp
    22d6:	e8 fc ff ff ff       	call   22d7 <sys_kill+0x86>
    22db:	83 c4 10             	add    $0x10,%esp
    22de:	85 c0                	test   %eax,%eax
    22e0:	0f 45 f8             	cmovne %eax,%edi
    22e3:	83 ee 04             	sub    $0x4,%esi
    22e6:	81 fe 00 00 00 00    	cmp    $0x0,%esi
    22ec:	75 d3                	jne    22c1 <sys_kill+0x70>
    22ee:	eb 6b                	jmp    235b <sys_kill+0x10a>
    22f0:	bf 00 00 00 00       	mov    $0x0,%edi
    22f5:	83 fb ff             	cmp    $0xffffffff,%ebx
    22f8:	75 61                	jne    235b <sys_kill+0x10a>
    22fa:	eb 46                	jmp    2342 <sys_kill+0xf1>
    22fc:	83 ec 04             	sub    $0x4,%esp
    22ff:	6a 00                	push   $0x0
    2301:	ff 33                	pushl  (%ebx)
    2303:	55                   	push   %ebp
    2304:	e8 fc ff ff ff       	call   2305 <sys_kill+0xb4>
    2309:	83 c4 10             	add    $0x10,%esp
    230c:	85 c0                	test   %eax,%eax
    230e:	75 3e                	jne    234e <sys_kill+0xfd>
    2310:	eb 23                	jmp    2335 <sys_kill+0xe4>
    2312:	8b 03                	mov    (%ebx),%eax
    2314:	85 c0                	test   %eax,%eax
    2316:	74 1d                	je     2335 <sys_kill+0xe4>
    2318:	83 b8 34 02 00 00 01 	cmpl   $0x1,0x234(%eax)
    231f:	75 14                	jne    2335 <sys_kill+0xe4>
    2321:	83 ec 04             	sub    $0x4,%esp
    2324:	6a 00                	push   $0x0
    2326:	50                   	push   %eax
    2327:	55                   	push   %ebp
    2328:	e8 fc ff ff ff       	call   2329 <sys_kill+0xd8>
    232d:	83 c4 10             	add    $0x10,%esp
    2330:	85 c0                	test   %eax,%eax
    2332:	0f 45 f8             	cmovne %eax,%edi
    2335:	83 eb 04             	sub    $0x4,%ebx
    2338:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
    233e:	77 d2                	ja     2312 <sys_kill+0xc1>
    2340:	eb 0e                	jmp    2350 <sys_kill+0xff>
    2342:	bf 00 00 00 00       	mov    $0x0,%edi
    2347:	bb 00 01 00 00       	mov    $0x100,%ebx
    234c:	eb 02                	jmp    2350 <sys_kill+0xff>
    234e:	89 c7                	mov    %eax,%edi
    2350:	83 eb 04             	sub    $0x4,%ebx
    2353:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
    2359:	77 a1                	ja     22fc <sys_kill+0xab>
    235b:	89 f8                	mov    %edi,%eax
    235d:	83 c4 0c             	add    $0xc,%esp
    2360:	5b                   	pop    %ebx
    2361:	5e                   	pop    %esi
    2362:	5f                   	pop    %edi
    2363:	5d                   	pop    %ebp
    2364:	c3                   	ret    

00002365 <tell_father>:
    2365:	56                   	push   %esi
    2366:	53                   	push   %ebx
    2367:	83 ec 04             	sub    $0x4,%esp
    236a:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    236e:	e8 fc ff ff ff       	call   236f <tell_father+0xa>
    2373:	89 c6                	mov    %eax,%esi
    2375:	85 db                	test   %ebx,%ebx
    2377:	74 28                	je     23a1 <tell_father+0x3c>
    2379:	b8 00 00 00 00       	mov    $0x0,%eax
    237e:	b9 00 01 00 00       	mov    $0x100,%ecx
    2383:	8b 10                	mov    (%eax),%edx
    2385:	85 d2                	test   %edx,%edx
    2387:	74 11                	je     239a <tell_father+0x35>
    2389:	3b 9a 2c 02 00 00    	cmp    0x22c(%edx),%ebx
    238f:	75 09                	jne    239a <tell_father+0x35>
    2391:	81 4a 0c 00 00 01 00 	orl    $0x10000,0xc(%edx)
    2398:	eb 1f                	jmp    23b9 <tell_father+0x54>
    239a:	83 c0 04             	add    $0x4,%eax
    239d:	39 c8                	cmp    %ecx,%eax
    239f:	75 e2                	jne    2383 <tell_father+0x1e>
    23a1:	83 ec 0c             	sub    $0xc,%esp
    23a4:	68 cd 01 00 00       	push   $0x1cd
    23a9:	e8 fc ff ff ff       	call   23aa <tell_father+0x45>
    23ae:	89 34 24             	mov    %esi,(%esp)
    23b1:	e8 fc ff ff ff       	call   23b2 <tell_father+0x4d>
    23b6:	83 c4 10             	add    $0x10,%esp
    23b9:	83 c4 04             	add    $0x4,%esp
    23bc:	5b                   	pop    %ebx
    23bd:	5e                   	pop    %esi
    23be:	c3                   	ret    

000023bf <do_exit>:
    23bf:	57                   	push   %edi
    23c0:	56                   	push   %esi
    23c1:	53                   	push   %ebx
    23c2:	e8 fc ff ff ff       	call   23c3 <do_exit+0x4>
    23c7:	89 c6                	mov    %eax,%esi
    23c9:	b9 0f 00 00 00       	mov    $0xf,%ecx
    23ce:	0f 03 c9             	lsl    %cx,%ecx
    23d1:	41                   	inc    %ecx
    23d2:	50                   	push   %eax
    23d3:	8d 80 d8 02 00 00    	lea    0x2d8(%eax),%eax
    23d9:	83 c0 07             	add    $0x7,%eax
    23dc:	8a 30                	mov    (%eax),%dh
    23de:	83 e8 03             	sub    $0x3,%eax
    23e1:	8a 10                	mov    (%eax),%dl
    23e3:	c1 e2 10             	shl    $0x10,%edx
    23e6:	83 e8 02             	sub    $0x2,%eax
    23e9:	66 8b 10             	mov    (%eax),%dx
    23ec:	58                   	pop    %eax
    23ed:	83 ec 04             	sub    $0x4,%esp
    23f0:	56                   	push   %esi
    23f1:	51                   	push   %ecx
    23f2:	52                   	push   %edx
    23f3:	e8 fc ff ff ff       	call   23f4 <do_exit+0x35>
    23f8:	b9 17 00 00 00       	mov    $0x17,%ecx
    23fd:	0f 03 c9             	lsl    %cx,%ecx
    2400:	41                   	inc    %ecx
    2401:	50                   	push   %eax
    2402:	8d 86 e0 02 00 00    	lea    0x2e0(%esi),%eax
    2408:	83 c0 07             	add    $0x7,%eax
    240b:	8a 30                	mov    (%eax),%dh
    240d:	83 e8 03             	sub    $0x3,%eax
    2410:	8a 10                	mov    (%eax),%dl
    2412:	c1 e2 10             	shl    $0x10,%edx
    2415:	83 e8 02             	sub    $0x2,%eax
    2418:	66 8b 10             	mov    (%eax),%dx
    241b:	58                   	pop    %eax
    241c:	83 c4 0c             	add    $0xc,%esp
    241f:	56                   	push   %esi
    2420:	51                   	push   %ecx
    2421:	52                   	push   %edx
    2422:	e8 fc ff ff ff       	call   2423 <do_exit+0x64>
    2427:	bb 00 00 00 00       	mov    $0x0,%ebx
    242c:	bf 00 01 00 00       	mov    $0x100,%edi
    2431:	83 c4 10             	add    $0x10,%esp
    2434:	8b 03                	mov    (%ebx),%eax
    2436:	85 c0                	test   %eax,%eax
    2438:	74 32                	je     246c <do_exit+0xad>
    243a:	8b 96 2c 02 00 00    	mov    0x22c(%esi),%edx
    2440:	39 90 30 02 00 00    	cmp    %edx,0x230(%eax)
    2446:	75 24                	jne    246c <do_exit+0xad>
    2448:	c7 80 30 02 00 00 01 	movl   $0x1,0x230(%eax)
    244f:	00 00 00 
    2452:	83 38 03             	cmpl   $0x3,(%eax)
    2455:	75 15                	jne    246c <do_exit+0xad>
    2457:	83 ec 04             	sub    $0x4,%esp
    245a:	6a 01                	push   $0x1
    245c:	ff 35 04 00 00 00    	pushl  0x4
    2462:	6a 11                	push   $0x11
    2464:	e8 fc ff ff ff       	call   2465 <do_exit+0xa6>
    2469:	83 c4 10             	add    $0x10,%esp
    246c:	83 c3 04             	add    $0x4,%ebx
    246f:	39 fb                	cmp    %edi,%ebx
    2471:	75 c1                	jne    2434 <do_exit+0x75>
    2473:	bb 00 00 00 00       	mov    $0x0,%ebx
    2478:	83 bc 9e 80 02 00 00 	cmpl   $0x0,0x280(%esi,%ebx,4)
    247f:	00 
    2480:	74 0c                	je     248e <do_exit+0xcf>
    2482:	83 ec 0c             	sub    $0xc,%esp
    2485:	53                   	push   %ebx
    2486:	e8 fc ff ff ff       	call   2487 <do_exit+0xc8>
    248b:	83 c4 10             	add    $0x10,%esp
    248e:	83 c3 01             	add    $0x1,%ebx
    2491:	83 fb 14             	cmp    $0x14,%ebx
    2494:	75 e2                	jne    2478 <do_exit+0xb9>
    2496:	83 ec 0c             	sub    $0xc,%esp
    2499:	ff b6 70 02 00 00    	pushl  0x270(%esi)
    249f:	e8 fc ff ff ff       	call   24a0 <do_exit+0xe1>
    24a4:	c7 86 70 02 00 00 00 	movl   $0x0,0x270(%esi)
    24ab:	00 00 00 
    24ae:	83 c4 04             	add    $0x4,%esp
    24b1:	ff b6 74 02 00 00    	pushl  0x274(%esi)
    24b7:	e8 fc ff ff ff       	call   24b8 <do_exit+0xf9>
    24bc:	c7 86 74 02 00 00 00 	movl   $0x0,0x274(%esi)
    24c3:	00 00 00 
    24c6:	83 c4 04             	add    $0x4,%esp
    24c9:	ff b6 78 02 00 00    	pushl  0x278(%esi)
    24cf:	e8 fc ff ff ff       	call   24d0 <do_exit+0x111>
    24d4:	c7 86 78 02 00 00 00 	movl   $0x0,0x278(%esi)
    24db:	00 00 00 
    24de:	83 c4 10             	add    $0x10,%esp
    24e1:	83 be 3c 02 00 00 00 	cmpl   $0x0,0x23c(%esi)
    24e8:	0f 84 9e 00 00 00    	je     258c <do_exit+0x1cd>
    24ee:	8b 86 68 02 00 00    	mov    0x268(%esi),%eax
    24f4:	85 c0                	test   %eax,%eax
    24f6:	0f 88 86 00 00 00    	js     2582 <do_exit+0x1c3>
    24fc:	69 c0 60 0c 00 00    	imul   $0xc60,%eax,%eax
    2502:	c7 80 24 00 00 00 00 	movl   $0x0,0x24(%eax)
    2509:	00 00 00 
    250c:	3b 35 00 00 00 00    	cmp    0x0,%esi
    2512:	75 0a                	jne    251e <do_exit+0x15f>
    2514:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
    251b:	00 00 00 
    251e:	83 be 3c 02 00 00 00 	cmpl   $0x0,0x23c(%esi)
    2525:	74 05                	je     252c <do_exit+0x16d>
    2527:	e8 fc ff ff ff       	call   2528 <do_exit+0x169>
    252c:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
    2532:	8b 44 24 10          	mov    0x10(%esp),%eax
    2536:	89 86 14 02 00 00    	mov    %eax,0x214(%esi)
    253c:	83 ec 0c             	sub    $0xc,%esp
    253f:	ff b6 30 02 00 00    	pushl  0x230(%esi)
    2545:	e8 fc ff ff ff       	call   2546 <do_exit+0x187>
    254a:	e8 fc ff ff ff       	call   254b <do_exit+0x18c>
    254f:	83 c4 10             	add    $0x10,%esp
    2552:	3b 05 04 00 00 00    	cmp    0x4,%eax
    2558:	75 07                	jne    2561 <do_exit+0x1a2>
    255a:	e8 fc ff ff ff       	call   255b <do_exit+0x19c>
    255f:	eb 38                	jmp    2599 <do_exit+0x1da>
    2561:	e8 fc ff ff ff       	call   2562 <do_exit+0x1a3>
    2566:	83 ec 0c             	sub    $0xc,%esp
    2569:	50                   	push   %eax
    256a:	e8 fc ff ff ff       	call   256b <do_exit+0x1ac>
    256f:	83 c4 08             	add    $0x8,%esp
    2572:	68 00 00 00 00       	push   $0x0
    2577:	50                   	push   %eax
    2578:	e8 fc ff ff ff       	call   2579 <do_exit+0x1ba>
    257d:	83 c4 10             	add    $0x10,%esp
    2580:	eb 17                	jmp    2599 <do_exit+0x1da>
    2582:	3b 35 00 00 00 00    	cmp    0x0,%esi
    2588:	75 9d                	jne    2527 <do_exit+0x168>
    258a:	eb 88                	jmp    2514 <do_exit+0x155>
    258c:	3b 35 00 00 00 00    	cmp    0x0,%esi
    2592:	75 98                	jne    252c <do_exit+0x16d>
    2594:	e9 7b ff ff ff       	jmp    2514 <do_exit+0x155>
    2599:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    259e:	5b                   	pop    %ebx
    259f:	5e                   	pop    %esi
    25a0:	5f                   	pop    %edi
    25a1:	c3                   	ret    

000025a2 <sys_exit>:
    25a2:	83 ec 18             	sub    $0x18,%esp
    25a5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    25a9:	c1 e0 08             	shl    $0x8,%eax
    25ac:	0f b7 c0             	movzwl %ax,%eax
    25af:	50                   	push   %eax
    25b0:	e8 fc ff ff ff       	call   25b1 <sys_exit+0xf>
    25b5:	83 c4 1c             	add    $0x1c,%esp
    25b8:	c3                   	ret    

000025b9 <sys_waitpid>:
    25b9:	55                   	push   %ebp
    25ba:	57                   	push   %edi
    25bb:	56                   	push   %esi
    25bc:	53                   	push   %ebx
    25bd:	83 ec 1c             	sub    $0x1c,%esp
    25c0:	8b 74 24 30          	mov    0x30(%esp),%esi
    25c4:	e8 fc ff ff ff       	call   25c5 <sys_waitpid+0xc>
    25c9:	89 c3                	mov    %eax,%ebx
    25cb:	83 ec 08             	sub    $0x8,%esp
    25ce:	6a 04                	push   $0x4
    25d0:	ff 74 24 40          	pushl  0x40(%esp)
    25d4:	e8 fc ff ff ff       	call   25d5 <sys_waitpid+0x1c>
    25d9:	83 c4 10             	add    $0x10,%esp
    25dc:	8b 7c 24 38          	mov    0x38(%esp),%edi
    25e0:	83 e7 02             	and    $0x2,%edi
    25e3:	89 f5                	mov    %esi,%ebp
    25e5:	f7 dd                	neg    %ebp
    25e7:	b8 fc 00 00 00       	mov    $0xfc,%eax
    25ec:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    25f3:	00 
    25f4:	8b 10                	mov    (%eax),%edx
    25f6:	39 d3                	cmp    %edx,%ebx
    25f8:	0f 84 bb 00 00 00    	je     26b9 <sys_waitpid+0x100>
    25fe:	85 d2                	test   %edx,%edx
    2600:	0f 84 b3 00 00 00    	je     26b9 <sys_waitpid+0x100>
    2606:	8b 8b 2c 02 00 00    	mov    0x22c(%ebx),%ecx
    260c:	39 8a 30 02 00 00    	cmp    %ecx,0x230(%edx)
    2612:	0f 85 a1 00 00 00    	jne    26b9 <sys_waitpid+0x100>
    2618:	85 f6                	test   %esi,%esi
    261a:	7e 0e                	jle    262a <sys_waitpid+0x71>
    261c:	3b b2 2c 02 00 00    	cmp    0x22c(%edx),%esi
    2622:	0f 85 91 00 00 00    	jne    26b9 <sys_waitpid+0x100>
    2628:	eb 21                	jmp    264b <sys_waitpid+0x92>
    262a:	85 f6                	test   %esi,%esi
    262c:	75 10                	jne    263e <sys_waitpid+0x85>
    262e:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
    2634:	39 8a 34 02 00 00    	cmp    %ecx,0x234(%edx)
    263a:	75 7d                	jne    26b9 <sys_waitpid+0x100>
    263c:	eb 0d                	jmp    264b <sys_waitpid+0x92>
    263e:	83 fe ff             	cmp    $0xffffffff,%esi
    2641:	74 08                	je     264b <sys_waitpid+0x92>
    2643:	39 aa 34 02 00 00    	cmp    %ebp,0x234(%edx)
    2649:	75 6e                	jne    26b9 <sys_waitpid+0x100>
    264b:	8b 0a                	mov    (%edx),%ecx
    264d:	83 f9 03             	cmp    $0x3,%ecx
    2650:	74 20                	je     2672 <sys_waitpid+0xb9>
    2652:	83 f9 04             	cmp    $0x4,%ecx
    2655:	75 5a                	jne    26b1 <sys_waitpid+0xf8>
    2657:	85 ff                	test   %edi,%edi
    2659:	74 5e                	je     26b9 <sys_waitpid+0x100>
    265b:	b8 7f 00 00 00       	mov    $0x7f,%eax
    2660:	8b 7c 24 34          	mov    0x34(%esp),%edi
    2664:	64 89 07             	mov    %eax,%fs:(%edi)
    2667:	8b 82 2c 02 00 00    	mov    0x22c(%edx),%eax
    266d:	e9 94 00 00 00       	jmp    2706 <sys_waitpid+0x14d>
    2672:	8b 92 50 02 00 00    	mov    0x250(%edx),%edx
    2678:	01 93 58 02 00 00    	add    %edx,0x258(%ebx)
    267e:	8b 10                	mov    (%eax),%edx
    2680:	8b 92 54 02 00 00    	mov    0x254(%edx),%edx
    2686:	01 93 5c 02 00 00    	add    %edx,0x25c(%ebx)
    268c:	8b 00                	mov    (%eax),%eax
    268e:	8b 98 2c 02 00 00    	mov    0x22c(%eax),%ebx
    2694:	8b b0 14 02 00 00    	mov    0x214(%eax),%esi
    269a:	83 ec 0c             	sub    $0xc,%esp
    269d:	50                   	push   %eax
    269e:	e8 fc ff ff ff       	call   269f <sys_waitpid+0xe6>
    26a3:	8b 44 24 44          	mov    0x44(%esp),%eax
    26a7:	64 89 30             	mov    %esi,%fs:(%eax)
    26aa:	83 c4 10             	add    $0x10,%esp
    26ad:	89 d8                	mov    %ebx,%eax
    26af:	eb 55                	jmp    2706 <sys_waitpid+0x14d>
    26b1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    26b8:	00 
    26b9:	83 e8 04             	sub    $0x4,%eax
    26bc:	3d 00 00 00 00       	cmp    $0x0,%eax
    26c1:	0f 85 2d ff ff ff    	jne    25f4 <sys_waitpid+0x3b>
    26c7:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    26cc:	74 2c                	je     26fa <sys_waitpid+0x141>
    26ce:	f6 44 24 38 01       	testb  $0x1,0x38(%esp)
    26d3:	75 2c                	jne    2701 <sys_waitpid+0x148>
    26d5:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    26db:	e8 fc ff ff ff       	call   26dc <sys_waitpid+0x123>
    26e0:	8b 43 0c             	mov    0xc(%ebx),%eax
    26e3:	25 ff ff fe ff       	and    $0xfffeffff,%eax
    26e8:	89 43 0c             	mov    %eax,0xc(%ebx)
    26eb:	85 c0                	test   %eax,%eax
    26ed:	0f 84 f4 fe ff ff    	je     25e7 <sys_waitpid+0x2e>
    26f3:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    26f8:	eb 0c                	jmp    2706 <sys_waitpid+0x14d>
    26fa:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
    26ff:	eb 05                	jmp    2706 <sys_waitpid+0x14d>
    2701:	b8 00 00 00 00       	mov    $0x0,%eax
    2706:	83 c4 1c             	add    $0x1c,%esp
    2709:	5b                   	pop    %ebx
    270a:	5e                   	pop    %esi
    270b:	5f                   	pop    %edi
    270c:	5d                   	pop    %ebp
    270d:	c3                   	ret    

0000270e <sys_sgetmask>:
    270e:	83 ec 0c             	sub    $0xc,%esp
    2711:	e8 fc ff ff ff       	call   2712 <sys_sgetmask+0x4>
    2716:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
    271c:	83 c4 0c             	add    $0xc,%esp
    271f:	c3                   	ret    

00002720 <sys_ssetmask>:
    2720:	83 ec 0c             	sub    $0xc,%esp
    2723:	e8 fc ff ff ff       	call   2724 <sys_ssetmask+0x4>
    2728:	89 c1                	mov    %eax,%ecx
    272a:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
    2730:	8b 54 24 10          	mov    0x10(%esp),%edx
    2734:	80 e6 fe             	and    $0xfe,%dh
    2737:	89 91 10 02 00 00    	mov    %edx,0x210(%ecx)
    273d:	83 c4 0c             	add    $0xc,%esp
    2740:	c3                   	ret    

00002741 <sys_signal>:
    2741:	53                   	push   %ebx
    2742:	83 ec 08             	sub    $0x8,%esp
    2745:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    2749:	e8 fc ff ff ff       	call   274a <sys_signal+0x9>
    274e:	8d 4b ff             	lea    -0x1(%ebx),%ecx
    2751:	83 f9 1f             	cmp    $0x1f,%ecx
    2754:	77 2a                	ja     2780 <sys_signal+0x3f>
    2756:	83 fb 09             	cmp    $0x9,%ebx
    2759:	74 25                	je     2780 <sys_signal+0x3f>
    275b:	c1 e3 04             	shl    $0x4,%ebx
    275e:	8d 14 18             	lea    (%eax,%ebx,1),%edx
    2761:	8b 02                	mov    (%edx),%eax
    2763:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    2767:	89 0a                	mov    %ecx,(%edx)
    2769:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
    2770:	c7 42 08 00 00 00 c0 	movl   $0xc0000000,0x8(%edx)
    2777:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    277b:	89 4a 0c             	mov    %ecx,0xc(%edx)
    277e:	eb 05                	jmp    2785 <sys_signal+0x44>
    2780:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2785:	83 c4 08             	add    $0x8,%esp
    2788:	5b                   	pop    %ebx
    2789:	c3                   	ret    

0000278a <sys_sigaction>:
    278a:	55                   	push   %ebp
    278b:	57                   	push   %edi
    278c:	56                   	push   %esi
    278d:	53                   	push   %ebx
    278e:	83 ec 2c             	sub    $0x2c,%esp
    2791:	8b 7c 24 40          	mov    0x40(%esp),%edi
    2795:	8b 5c 24 44          	mov    0x44(%esp),%ebx
    2799:	8b 74 24 48          	mov    0x48(%esp),%esi
    279d:	e8 fc ff ff ff       	call   279e <sys_sigaction+0x14>
    27a2:	89 c5                	mov    %eax,%ebp
    27a4:	8d 47 ff             	lea    -0x1(%edi),%eax
    27a7:	83 f8 1f             	cmp    $0x1f,%eax
    27aa:	0f 87 8e 00 00 00    	ja     283e <sys_sigaction+0xb4>
    27b0:	83 ff 09             	cmp    $0x9,%edi
    27b3:	0f 84 85 00 00 00    	je     283e <sys_sigaction+0xb4>
    27b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    27bd:	89 f8                	mov    %edi,%eax
    27bf:	c1 e0 04             	shl    $0x4,%eax
    27c2:	01 e8                	add    %ebp,%eax
    27c4:	8b 10                	mov    (%eax),%edx
    27c6:	89 54 24 10          	mov    %edx,0x10(%esp)
    27ca:	8b 50 04             	mov    0x4(%eax),%edx
    27cd:	89 54 24 14          	mov    %edx,0x14(%esp)
    27d1:	8b 50 08             	mov    0x8(%eax),%edx
    27d4:	89 54 24 18          	mov    %edx,0x18(%esp)
    27d8:	8b 40 0c             	mov    0xc(%eax),%eax
    27db:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    27df:	89 f8                	mov    %edi,%eax
    27e1:	c1 e0 04             	shl    $0x4,%eax
    27e4:	8d 04 28             	lea    (%eax,%ebp,1),%eax
    27e7:	8d 48 10             	lea    0x10(%eax),%ecx
    27ea:	83 c0 01             	add    $0x1,%eax
    27ed:	64 8a 13             	mov    %fs:(%ebx),%dl
    27f0:	88 50 ff             	mov    %dl,-0x1(%eax)
    27f3:	8d 5b 01             	lea    0x1(%ebx),%ebx
    27f6:	39 c8                	cmp    %ecx,%eax
    27f8:	75 f0                	jne    27ea <sys_sigaction+0x60>
    27fa:	eb 5d                	jmp    2859 <sys_sigaction+0xcf>
    27fc:	0f b6 10             	movzbl (%eax),%edx
    27ff:	64 88 16             	mov    %dl,%fs:(%esi)
    2802:	83 c0 01             	add    $0x1,%eax
    2805:	83 c6 01             	add    $0x1,%esi
    2808:	8d 4c 24 20          	lea    0x20(%esp),%ecx
    280c:	39 c8                	cmp    %ecx,%eax
    280e:	75 ec                	jne    27fc <sys_sigaction+0x72>
    2810:	c1 e7 04             	shl    $0x4,%edi
    2813:	01 fd                	add    %edi,%ebp
    2815:	8b 45 08             	mov    0x8(%ebp),%eax
    2818:	25 00 00 00 40       	and    $0x40000000,%eax
    281d:	74 0e                	je     282d <sys_sigaction+0xa3>
    281f:	c7 45 04 00 00 00 00 	movl   $0x0,0x4(%ebp)
    2826:	b8 00 00 00 00       	mov    $0x0,%eax
    282b:	eb 32                	jmp    285f <sys_sigaction+0xd5>
    282d:	ba 01 00 00 00       	mov    $0x1,%edx
    2832:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
    2837:	d3 e2                	shl    %cl,%edx
    2839:	09 55 04             	or     %edx,0x4(%ebp)
    283c:	eb 21                	jmp    285f <sys_sigaction+0xd5>
    283e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2843:	eb 1a                	jmp    285f <sys_sigaction+0xd5>
    2845:	83 ec 08             	sub    $0x8,%esp
    2848:	6a 10                	push   $0x10
    284a:	56                   	push   %esi
    284b:	e8 fc ff ff ff       	call   284c <sys_sigaction+0xc2>
    2850:	83 c4 10             	add    $0x10,%esp
    2853:	8d 44 24 10          	lea    0x10(%esp),%eax
    2857:	eb a3                	jmp    27fc <sys_sigaction+0x72>
    2859:	85 f6                	test   %esi,%esi
    285b:	75 e8                	jne    2845 <sys_sigaction+0xbb>
    285d:	eb b1                	jmp    2810 <sys_sigaction+0x86>
    285f:	83 c4 2c             	add    $0x2c,%esp
    2862:	5b                   	pop    %ebx
    2863:	5e                   	pop    %esi
    2864:	5f                   	pop    %edi
    2865:	5d                   	pop    %ebp
    2866:	c3                   	ret    

00002867 <do_signal>:
    2867:	55                   	push   %ebp
    2868:	57                   	push   %edi
    2869:	56                   	push   %esi
    286a:	53                   	push   %ebx
    286b:	83 ec 0c             	sub    $0xc,%esp
    286e:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    2872:	e8 fc ff ff ff       	call   2873 <do_signal+0xc>
    2877:	89 c7                	mov    %eax,%edi
    2879:	89 e8                	mov    %ebp,%eax
    287b:	c1 e0 04             	shl    $0x4,%eax
    287e:	8d 34 38             	lea    (%eax,%edi,1),%esi
    2881:	8b 06                	mov    (%esi),%eax
    2883:	83 f8 01             	cmp    $0x1,%eax
    2886:	0f 84 a6 00 00 00    	je     2932 <do_signal+0xcb>
    288c:	85 c0                	test   %eax,%eax
    288e:	75 1f                	jne    28af <do_signal+0x48>
    2890:	83 fd 11             	cmp    $0x11,%ebp
    2893:	0f 84 99 00 00 00    	je     2932 <do_signal+0xcb>
    2899:	83 ec 0c             	sub    $0xc,%esp
    289c:	8d 4d ff             	lea    -0x1(%ebp),%ecx
    289f:	b8 01 00 00 00       	mov    $0x1,%eax
    28a4:	d3 e0                	shl    %cl,%eax
    28a6:	50                   	push   %eax
    28a7:	e8 fc ff ff ff       	call   28a8 <do_signal+0x41>
    28ac:	83 c4 10             	add    $0x10,%esp
    28af:	8b 46 08             	mov    0x8(%esi),%eax
    28b2:	85 c0                	test   %eax,%eax
    28b4:	79 06                	jns    28bc <do_signal+0x55>
    28b6:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    28bc:	25 00 00 00 40       	and    $0x40000000,%eax
    28c1:	83 f8 01             	cmp    $0x1,%eax
    28c4:	19 c0                	sbb    %eax,%eax
    28c6:	f7 d0                	not    %eax
    28c8:	8d 04 85 20 00 00 00 	lea    0x20(,%eax,4),%eax
    28cf:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
    28d3:	29 c3                	sub    %eax,%ebx
    28d5:	83 ec 08             	sub    $0x8,%esp
    28d8:	50                   	push   %eax
    28d9:	53                   	push   %ebx
    28da:	e8 fc ff ff ff       	call   28db <do_signal+0x74>
    28df:	8b 46 0c             	mov    0xc(%esi),%eax
    28e2:	64 89 03             	mov    %eax,%fs:(%ebx)
    28e5:	8d 43 08             	lea    0x8(%ebx),%eax
    28e8:	64 89 6b 04          	mov    %ebp,%fs:0x4(%ebx)
    28ec:	83 c4 10             	add    $0x10,%esp
    28ef:	f6 46 0b 40          	testb  $0x40,0xb(%esi)
    28f3:	75 0d                	jne    2902 <do_signal+0x9b>
    28f5:	8d 43 0c             	lea    0xc(%ebx),%eax
    28f8:	8b 97 10 02 00 00    	mov    0x210(%edi),%edx
    28fe:	64 89 53 08          	mov    %edx,%fs:0x8(%ebx)
    2902:	8b 54 24 24          	mov    0x24(%esp),%edx
    2906:	64 89 10             	mov    %edx,%fs:(%eax)
    2909:	8b 54 24 2c          	mov    0x2c(%esp),%edx
    290d:	64 89 50 04          	mov    %edx,%fs:0x4(%eax)
    2911:	8b 54 24 30          	mov    0x30(%esp),%edx
    2915:	64 89 50 08          	mov    %edx,%fs:0x8(%eax)
    2919:	8b 54 24 48          	mov    0x48(%esp),%edx
    291d:	64 89 50 0c          	mov    %edx,%fs:0xc(%eax)
    2921:	8b 54 24 40          	mov    0x40(%esp),%edx
    2925:	64 89 50 10          	mov    %edx,%fs:0x10(%eax)
    2929:	8b 46 04             	mov    0x4(%esi),%eax
    292c:	09 87 10 02 00 00    	or     %eax,0x210(%edi)
    2932:	83 c4 0c             	add    $0xc,%esp
    2935:	5b                   	pop    %ebx
    2936:	5e                   	pop    %esi
    2937:	5f                   	pop    %edi
    2938:	5d                   	pop    %ebp
    2939:	c3                   	ret    

0000293a <kernel_mktime>:
    293a:	53                   	push   %ebx
    293b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    293f:	8b 51 14             	mov    0x14(%ecx),%edx
    2942:	8d 42 be             	lea    -0x42(%edx),%eax
    2945:	89 d3                	mov    %edx,%ebx
    2947:	83 eb 45             	sub    $0x45,%ebx
    294a:	0f 48 d8             	cmovs  %eax,%ebx
    294d:	c1 fb 02             	sar    $0x2,%ebx
    2950:	69 db 80 51 01 00    	imul   $0x15180,%ebx,%ebx
    2956:	8d 42 ba             	lea    -0x46(%edx),%eax
    2959:	69 c0 80 33 e1 01    	imul   $0x1e13380,%eax,%eax
    295f:	01 d8                	add    %ebx,%eax
    2961:	8b 59 10             	mov    0x10(%ecx),%ebx
    2964:	03 04 9d e0 00 00 00 	add    0xe0(,%ebx,4),%eax
    296b:	83 fb 01             	cmp    $0x1,%ebx
    296e:	7e 0e                	jle    297e <kernel_mktime+0x44>
    2970:	83 e2 03             	and    $0x3,%edx
    2973:	8d 98 80 ae fe ff    	lea    -0x15180(%eax),%ebx
    2979:	85 d2                	test   %edx,%edx
    297b:	0f 45 c3             	cmovne %ebx,%eax
    297e:	8b 51 0c             	mov    0xc(%ecx),%edx
    2981:	83 ea 01             	sub    $0x1,%edx
    2984:	69 d2 80 51 01 00    	imul   $0x15180,%edx,%edx
    298a:	01 d0                	add    %edx,%eax
    298c:	69 51 08 10 0e 00 00 	imul   $0xe10,0x8(%ecx),%edx
    2993:	01 d0                	add    %edx,%eax
    2995:	6b 51 04 3c          	imul   $0x3c,0x4(%ecx),%edx
    2999:	01 d0                	add    %edx,%eax
    299b:	03 01                	add    (%ecx),%eax
    299d:	5b                   	pop    %ebx
    299e:	c3                   	ret    
