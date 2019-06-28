
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
      26:	80 bb c8 03 00 00 00 	cmpb   $0x0,0x3c8(%ebx)
      2d:	74 11                	je     40 <show_task+0x40>
      2f:	b8 00 00 00 00       	mov    $0x0,%eax
      34:	eb 14                	jmp    4a <show_task+0x4a>
      36:	83 c0 01             	add    $0x1,%eax
      39:	3d 38 0c 00 00       	cmp    $0xc38,%eax
      3e:	74 0a                	je     4a <show_task+0x4a>
      40:	80 bc 03 c8 03 00 00 	cmpb   $0x0,0x3c8(%ebx,%eax,1)
      47:	00 
      48:	74 ec                	je     36 <show_task+0x36>
      4a:	83 ec 04             	sub    $0x4,%esp
      4d:	68 38 0c 00 00       	push   $0xc38
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

000002e7 <reset_ap_tss>:
     2e7:	8b 54 24 04          	mov    0x4(%esp),%edx
     2eb:	8d 4c 12 04          	lea    0x4(%edx,%edx,1),%ecx
     2ef:	b8 e8 02 00 00       	mov    $0x2e8,%eax
     2f4:	66 c7 04 cd 00 00 00 	movw   $0x68,0x0(,%ecx,8)
     2fb:	00 68 00 
     2fe:	66 89 04 cd 02 00 00 	mov    %ax,0x2(,%ecx,8)
     305:	00 
     306:	c1 c8 10             	ror    $0x10,%eax
     309:	88 04 cd 04 00 00 00 	mov    %al,0x4(,%ecx,8)
     310:	c6 04 cd 05 00 00 00 	movb   $0x89,0x5(,%ecx,8)
     317:	89 
     318:	c6 04 cd 06 00 00 00 	movb   $0x0,0x6(,%ecx,8)
     31f:	00 
     320:	88 24 cd 07 00 00 00 	mov    %ah,0x7(,%ecx,8)
     327:	c1 c8 10             	ror    $0x10,%eax
     32a:	c1 e2 04             	shl    $0x4,%edx
     32d:	8d 42 20             	lea    0x20(%edx),%eax
     330:	0f 00 d8             	ltr    %ax
     333:	c3                   	ret    

00000334 <reset_ap_default_task>:
     334:	e8 fc ff ff ff       	call   335 <reset_ap_default_task+0x1>
     339:	50                   	push   %eax
     33a:	e8 fc ff ff ff       	call   33b <reset_ap_default_task+0x7>
     33f:	83 c4 04             	add    $0x4,%esp
     342:	8d 04 40             	lea    (%eax,%eax,2),%eax
     345:	c7 04 c5 14 00 00 00 	movl   $0x0,0x14(,%eax,8)
     34c:	00 00 00 00 
     350:	c3                   	ret    

00000351 <lock_op>:
     351:	53                   	push   %ebx
     352:	83 ec 08             	sub    $0x8,%esp
     355:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     359:	83 3b 01             	cmpl   $0x1,(%ebx)
     35c:	76 10                	jbe    36e <lock_op+0x1d>
     35e:	83 ec 0c             	sub    $0xc,%esp
     361:	68 17 00 00 00       	push   $0x17
     366:	e8 fc ff ff ff       	call   367 <lock_op+0x16>
     36b:	83 c4 10             	add    $0x10,%esp
     36e:	83 3b 00             	cmpl   $0x0,(%ebx)
     371:	75 fb                	jne    36e <lock_op+0x1d>
     373:	ba 01 00 00 00       	mov    $0x1,%edx
     378:	f0 87 13             	lock xchg %edx,(%ebx)
     37b:	83 fa 00             	cmp    $0x0,%edx
     37e:	75 ee                	jne    36e <lock_op+0x1d>
     380:	83 c4 08             	add    $0x8,%esp
     383:	5b                   	pop    %ebx
     384:	c3                   	ret    

00000385 <unlock_op>:
     385:	53                   	push   %ebx
     386:	8b 5c 24 08          	mov    0x8(%esp),%ebx
     38a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
     390:	5b                   	pop    %ebx
     391:	c3                   	ret    

00000392 <math_state_restore>:
     392:	e8 fc ff ff ff       	call   393 <math_state_restore+0x1>
     397:	8b 15 00 00 00 00    	mov    0x0,%edx
     39d:	39 d0                	cmp    %edx,%eax
     39f:	74 2c                	je     3cd <math_state_restore+0x3b>
     3a1:	9b                   	fwait
     3a2:	85 d2                	test   %edx,%edx
     3a4:	74 06                	je     3ac <math_state_restore+0x1a>
     3a6:	dd b2 50 03 00 00    	fnsave 0x350(%edx)
     3ac:	a3 00 00 00 00       	mov    %eax,0x0
     3b1:	66 83 b8 64 02 00 00 	cmpw   $0x0,0x264(%eax)
     3b8:	00 
     3b9:	74 07                	je     3c2 <math_state_restore+0x30>
     3bb:	dd a0 50 03 00 00    	frstor 0x350(%eax)
     3c1:	c3                   	ret    
     3c2:	db e3                	fninit 
     3c4:	66 c7 80 64 02 00 00 	movw   $0x1,0x264(%eax)
     3cb:	01 00 
     3cd:	f3 c3                	repz ret 

000003cf <schedule>:
     3cf:	55                   	push   %ebp
     3d0:	57                   	push   %edi
     3d1:	56                   	push   %esi
     3d2:	53                   	push   %ebx
     3d3:	83 ec 1c             	sub    $0x1c,%esp
     3d6:	e8 fc ff ff ff       	call   3d7 <schedule+0x8>
     3db:	89 c3                	mov    %eax,%ebx
     3dd:	50                   	push   %eax
     3de:	e8 fc ff ff ff       	call   3df <schedule+0x10>
     3e3:	83 ec 08             	sub    $0x8,%esp
     3e6:	89 c5                	mov    %eax,%ebp
     3e8:	68 00 00 00 00       	push   $0x0
     3ed:	e8 fc ff ff ff       	call   3ee <schedule+0x1f>
     3f2:	83 c4 10             	add    $0x10,%esp
     3f5:	ba fc 00 00 00       	mov    $0xfc,%edx
     3fa:	8b 02                	mov    (%edx),%eax
     3fc:	85 c0                	test   %eax,%eax
     3fe:	74 46                	je     446 <schedule+0x77>
     400:	8b 88 4c 02 00 00    	mov    0x24c(%eax),%ecx
     406:	85 c9                	test   %ecx,%ecx
     408:	74 1d                	je     427 <schedule+0x58>
     40a:	8b 35 00 00 00 00    	mov    0x0,%esi
     410:	39 f1                	cmp    %esi,%ecx
     412:	7d 13                	jge    427 <schedule+0x58>
     414:	81 48 0c 00 20 00 00 	orl    $0x2000,0xc(%eax)
     41b:	8b 02                	mov    (%edx),%eax
     41d:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
     424:	00 00 00 
     427:	8b 0a                	mov    (%edx),%ecx
     429:	8b 81 10 02 00 00    	mov    0x210(%ecx),%eax
     42f:	25 ff fe fb ff       	and    $0xfffbfeff,%eax
     434:	f7 d0                	not    %eax
     436:	85 41 0c             	test   %eax,0xc(%ecx)
     439:	74 0b                	je     446 <schedule+0x77>
     43b:	83 39 01             	cmpl   $0x1,(%ecx)
     43e:	75 06                	jne    446 <schedule+0x77>
     440:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
     446:	83 ea 04             	sub    $0x4,%edx
     449:	81 fa 00 00 00 00    	cmp    $0x0,%edx
     44f:	75 a9                	jne    3fa <schedule+0x2b>
     451:	b8 3f 00 00 00       	mov    $0x3f,%eax
     456:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     45b:	be 00 00 00 00       	mov    $0x0,%esi
     460:	8b 14 85 00 00 00 00 	mov    0x0(,%eax,4),%edx
     467:	85 d2                	test   %edx,%edx
     469:	74 19                	je     484 <schedule+0xb5>
     46b:	83 3a 00             	cmpl   $0x0,(%edx)
     46e:	75 14                	jne    484 <schedule+0xb5>
     470:	8b 4a 04             	mov    0x4(%edx),%ecx
     473:	39 f9                	cmp    %edi,%ecx
     475:	7e 0d                	jle    484 <schedule+0xb5>
     477:	83 ba bc 03 00 00 00 	cmpl   $0x0,0x3bc(%edx)
     47e:	0f 44 f9             	cmove  %ecx,%edi
     481:	0f 44 f0             	cmove  %eax,%esi
     484:	83 e8 01             	sub    $0x1,%eax
     487:	75 d7                	jne    460 <schedule+0x91>
     489:	85 ff                	test   %edi,%edi
     48b:	75 23                	jne    4b0 <schedule+0xe1>
     48d:	b9 fc 00 00 00       	mov    $0xfc,%ecx
     492:	8b 11                	mov    (%ecx),%edx
     494:	85 d2                	test   %edx,%edx
     496:	74 0b                	je     4a3 <schedule+0xd4>
     498:	8b 42 04             	mov    0x4(%edx),%eax
     49b:	d1 f8                	sar    %eax
     49d:	03 42 08             	add    0x8(%edx),%eax
     4a0:	89 42 04             	mov    %eax,0x4(%edx)
     4a3:	83 e9 04             	sub    $0x4,%ecx
     4a6:	81 f9 00 00 00 00    	cmp    $0x0,%ecx
     4ac:	75 e4                	jne    492 <schedule+0xc3>
     4ae:	eb a1                	jmp    451 <schedule+0x82>
     4b0:	3b 1d 04 00 00 00    	cmp    0x4,%ebx
     4b6:	75 68                	jne    520 <schedule+0x151>
     4b8:	e8 fc ff ff ff       	call   4b9 <schedule+0xea>
     4bd:	89 c7                	mov    %eax,%edi
     4bf:	39 c3                	cmp    %eax,%ebx
     4c1:	0f 84 cd 00 00 00    	je     594 <schedule+0x1c5>
     4c7:	8b 04 b5 00 00 00 00 	mov    0x0(,%esi,4),%eax
     4ce:	3b 05 00 00 00 00    	cmp    0x0,%eax
     4d4:	0f 84 ba 00 00 00    	je     594 <schedule+0x1c5>
     4da:	3b 05 04 00 00 00    	cmp    0x4,%eax
     4e0:	0f 84 ae 00 00 00    	je     594 <schedule+0x1c5>
     4e6:	83 ec 08             	sub    $0x8,%esp
     4e9:	68 82 00 00 00       	push   $0x82
     4ee:	57                   	push   %edi
     4ef:	e8 fc ff ff ff       	call   4f0 <schedule+0x121>
     4f4:	bb 00 00 00 00       	mov    $0x0,%ebx
     4f9:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
     4ff:	8d 04 3f             	lea    (%edi,%edi,1),%eax
     502:	8d 14 38             	lea    (%eax,%edi,1),%edx
     505:	8b 04 d5 10 00 00 00 	mov    0x10(,%edx,8),%eax
     50c:	83 c0 01             	add    $0x1,%eax
     50f:	89 04 d5 10 00 00 00 	mov    %eax,0x10(,%edx,8)
     516:	83 c4 10             	add    $0x10,%esp
     519:	be 01 00 00 00       	mov    $0x1,%esi
     51e:	eb 48                	jmp    568 <schedule+0x199>
     520:	8b 04 b5 00 00 00 00 	mov    0x0(,%esi,4),%eax
     527:	3b 05 00 00 00 00    	cmp    0x0,%eax
     52d:	74 08                	je     537 <schedule+0x168>
     52f:	3b 05 04 00 00 00    	cmp    0x4,%eax
     535:	75 14                	jne    54b <schedule+0x17c>
     537:	bb 00 00 00 00       	mov    $0x0,%ebx
     53c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
     542:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     546:	75 59                	jne    5a1 <schedule+0x1d2>
     548:	f4                   	hlt    
     549:	eb 1d                	jmp    568 <schedule+0x199>
     54b:	8b 55 14             	mov    0x14(%ebp),%edx
     54e:	85 d2                	test   %edx,%edx
     550:	74 0a                	je     55c <schedule+0x18d>
     552:	c7 82 bc 03 00 00 00 	movl   $0x0,0x3bc(%edx)
     559:	00 00 00 
     55c:	c7 80 bc 03 00 00 01 	movl   $0x1,0x3bc(%eax)
     563:	00 00 00 
     566:	eb 2c                	jmp    594 <schedule+0x1c5>
     568:	89 f2                	mov    %esi,%edx
     56a:	c1 e2 04             	shl    $0x4,%edx
     56d:	83 c2 20             	add    $0x20,%edx
     570:	8b 0c b5 00 00 00 00 	mov    0x0(,%esi,4),%ecx
     577:	39 4d 14             	cmp    %ecx,0x14(%ebp)
     57a:	74 16                	je     592 <schedule+0x1c3>
     57c:	66 89 54 24 0c       	mov    %dx,0xc(%esp)
     581:	87 4d 14             	xchg   %ecx,0x14(%ebp)
     584:	ff 6c 24 08          	ljmp   *0x8(%esp)
     588:	39 0d 00 00 00 00    	cmp    %ecx,0x0
     58e:	75 02                	jne    592 <schedule+0x1c3>
     590:	0f 06                	clts   
     592:	eb 0d                	jmp    5a1 <schedule+0x1d2>
     594:	bb 00 00 00 00       	mov    $0x0,%ebx
     599:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
     59f:	eb c7                	jmp    568 <schedule+0x199>
     5a1:	83 c4 1c             	add    $0x1c,%esp
     5a4:	5b                   	pop    %ebx
     5a5:	5e                   	pop    %esi
     5a6:	5f                   	pop    %edi
     5a7:	5d                   	pop    %ebp
     5a8:	c3                   	ret    

000005a9 <sys_pause>:
     5a9:	83 ec 0c             	sub    $0xc,%esp
     5ac:	e8 fc ff ff ff       	call   5ad <sys_pause+0x4>
     5b1:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
     5b7:	e8 fc ff ff ff       	call   5b8 <sys_pause+0xf>
     5bc:	b8 00 00 00 00       	mov    $0x0,%eax
     5c1:	83 c4 0c             	add    $0xc,%esp
     5c4:	c3                   	ret    

000005c5 <sleep_on>:
     5c5:	57                   	push   %edi
     5c6:	56                   	push   %esi
     5c7:	53                   	push   %ebx
     5c8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     5cc:	83 ec 0c             	sub    $0xc,%esp
     5cf:	68 00 00 00 00       	push   $0x0
     5d4:	e8 fc ff ff ff       	call   5d5 <sleep_on+0x10>
     5d9:	e8 fc ff ff ff       	call   5da <sleep_on+0x15>
     5de:	83 c4 10             	add    $0x10,%esp
     5e1:	85 db                	test   %ebx,%ebx
     5e3:	74 3d                	je     622 <sleep_on+0x5d>
     5e5:	89 c6                	mov    %eax,%esi
     5e7:	3d 00 00 00 00       	cmp    $0x0,%eax
     5ec:	75 10                	jne    5fe <sleep_on+0x39>
     5ee:	83 ec 0c             	sub    $0xc,%esp
     5f1:	68 2d 00 00 00       	push   $0x2d
     5f6:	e8 fc ff ff ff       	call   5f7 <sleep_on+0x32>
     5fb:	83 c4 10             	add    $0x10,%esp
     5fe:	8b 3b                	mov    (%ebx),%edi
     600:	89 33                	mov    %esi,(%ebx)
     602:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
     608:	bb 00 00 00 00       	mov    $0x0,%ebx
     60d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
     613:	e8 fc ff ff ff       	call   614 <sleep_on+0x4f>
     618:	85 ff                	test   %edi,%edi
     61a:	74 06                	je     622 <sleep_on+0x5d>
     61c:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
     622:	5b                   	pop    %ebx
     623:	5e                   	pop    %esi
     624:	5f                   	pop    %edi
     625:	c3                   	ret    

00000626 <interruptible_sleep_on>:
     626:	57                   	push   %edi
     627:	56                   	push   %esi
     628:	53                   	push   %ebx
     629:	8b 74 24 10          	mov    0x10(%esp),%esi
     62d:	e8 fc ff ff ff       	call   62e <interruptible_sleep_on+0x8>
     632:	85 f6                	test   %esi,%esi
     634:	74 46                	je     67c <interruptible_sleep_on+0x56>
     636:	89 c3                	mov    %eax,%ebx
     638:	3d 00 00 00 00       	cmp    $0x0,%eax
     63d:	75 10                	jne    64f <interruptible_sleep_on+0x29>
     63f:	83 ec 0c             	sub    $0xc,%esp
     642:	68 2d 00 00 00       	push   $0x2d
     647:	e8 fc ff ff ff       	call   648 <interruptible_sleep_on+0x22>
     64c:	83 c4 10             	add    $0x10,%esp
     64f:	8b 3e                	mov    (%esi),%edi
     651:	89 1e                	mov    %ebx,(%esi)
     653:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
     659:	e8 fc ff ff ff       	call   65a <interruptible_sleep_on+0x34>
     65e:	8b 06                	mov    (%esi),%eax
     660:	39 c3                	cmp    %eax,%ebx
     662:	74 0c                	je     670 <interruptible_sleep_on+0x4a>
     664:	85 c0                	test   %eax,%eax
     666:	74 08                	je     670 <interruptible_sleep_on+0x4a>
     668:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     66e:	eb e3                	jmp    653 <interruptible_sleep_on+0x2d>
     670:	89 3e                	mov    %edi,(%esi)
     672:	85 ff                	test   %edi,%edi
     674:	74 06                	je     67c <interruptible_sleep_on+0x56>
     676:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
     67c:	5b                   	pop    %ebx
     67d:	5e                   	pop    %esi
     67e:	5f                   	pop    %edi
     67f:	c3                   	ret    

00000680 <wake_up>:
     680:	8b 44 24 04          	mov    0x4(%esp),%eax
     684:	85 c0                	test   %eax,%eax
     686:	74 0c                	je     694 <wake_up+0x14>
     688:	8b 00                	mov    (%eax),%eax
     68a:	85 c0                	test   %eax,%eax
     68c:	74 06                	je     694 <wake_up+0x14>
     68e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     694:	f3 c3                	repz ret 

00000696 <ticks_to_floppy_on>:
     696:	56                   	push   %esi
     697:	53                   	push   %ebx
     698:	83 ec 04             	sub    $0x4,%esp
     69b:	8b 74 24 10          	mov    0x10(%esp),%esi
     69f:	b8 10 00 00 00       	mov    $0x10,%eax
     6a4:	89 f1                	mov    %esi,%ecx
     6a6:	d3 e0                	shl    %cl,%eax
     6a8:	89 c3                	mov    %eax,%ebx
     6aa:	83 fe 03             	cmp    $0x3,%esi
     6ad:	76 10                	jbe    6bf <ticks_to_floppy_on+0x29>
     6af:	83 ec 0c             	sub    $0xc,%esp
     6b2:	68 45 00 00 00       	push   $0x45
     6b7:	e8 fc ff ff ff       	call   6b8 <ticks_to_floppy_on+0x22>
     6bc:	83 c4 10             	add    $0x10,%esp
     6bf:	c7 04 b5 20 03 00 00 	movl   $0x2710,0x320(,%esi,4)
     6c6:	10 27 00 00 
     6ca:	fa                   	cli    
     6cb:	0f b6 0d 00 00 00 00 	movzbl 0x0,%ecx
     6d2:	89 d8                	mov    %ebx,%eax
     6d4:	09 c8                	or     %ecx,%eax
     6d6:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0
     6dd:	75 05                	jne    6e4 <ticks_to_floppy_on+0x4e>
     6df:	83 e0 fc             	and    $0xfffffffc,%eax
     6e2:	09 f0                	or     %esi,%eax
     6e4:	38 c8                	cmp    %cl,%al
     6e6:	74 34                	je     71c <ticks_to_floppy_on+0x86>
     6e8:	ba f2 03 00 00       	mov    $0x3f2,%edx
     6ed:	ee                   	out    %al,(%dx)
     6ee:	31 c1                	xor    %eax,%ecx
     6f0:	f6 c1 f0             	test   $0xf0,%cl
     6f3:	74 0d                	je     702 <ticks_to_floppy_on+0x6c>
     6f5:	c7 04 b5 30 03 00 00 	movl   $0x32,0x330(,%esi,4)
     6fc:	32 00 00 00 
     700:	eb 15                	jmp    717 <ticks_to_floppy_on+0x81>
     702:	83 3c b5 30 03 00 00 	cmpl   $0x1,0x330(,%esi,4)
     709:	01 
     70a:	7f 0b                	jg     717 <ticks_to_floppy_on+0x81>
     70c:	c7 04 b5 30 03 00 00 	movl   $0x2,0x330(,%esi,4)
     713:	02 00 00 00 
     717:	a2 00 00 00 00       	mov    %al,0x0
     71c:	fb                   	sti    
     71d:	8b 04 b5 30 03 00 00 	mov    0x330(,%esi,4),%eax
     724:	83 c4 04             	add    $0x4,%esp
     727:	5b                   	pop    %ebx
     728:	5e                   	pop    %esi
     729:	c3                   	ret    

0000072a <floppy_on>:
     72a:	56                   	push   %esi
     72b:	53                   	push   %ebx
     72c:	83 ec 04             	sub    $0x4,%esp
     72f:	8b 5c 24 10          	mov    0x10(%esp),%ebx
     733:	fa                   	cli    
     734:	8d 34 9d 40 03 00 00 	lea    0x340(,%ebx,4),%esi
     73b:	eb 0c                	jmp    749 <floppy_on+0x1f>
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 fc ff ff ff       	call   742 <floppy_on+0x18>
     746:	83 c4 10             	add    $0x10,%esp
     749:	83 ec 0c             	sub    $0xc,%esp
     74c:	53                   	push   %ebx
     74d:	e8 fc ff ff ff       	call   74e <floppy_on+0x24>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	75 e4                	jne    73d <floppy_on+0x13>
     759:	fb                   	sti    
     75a:	83 c4 04             	add    $0x4,%esp
     75d:	5b                   	pop    %ebx
     75e:	5e                   	pop    %esi
     75f:	c3                   	ret    

00000760 <floppy_off>:
     760:	8b 44 24 04          	mov    0x4(%esp),%eax
     764:	c7 04 85 20 03 00 00 	movl   $0x12c,0x320(,%eax,4)
     76b:	2c 01 00 00 
     76f:	c3                   	ret    

00000770 <do_floppy_timer>:
     770:	57                   	push   %edi
     771:	56                   	push   %esi
     772:	53                   	push   %ebx
     773:	bb 00 00 00 00       	mov    $0x0,%ebx
     778:	be 10 00 00 00       	mov    $0x10,%esi
     77d:	bf f2 03 00 00       	mov    $0x3f2,%edi
     782:	0f b6 05 00 00 00 00 	movzbl 0x0,%eax
     789:	89 f1                	mov    %esi,%ecx
     78b:	84 c8                	test   %cl,%al
     78d:	74 4b                	je     7da <do_floppy_timer+0x6a>
     78f:	8b 93 30 03 00 00    	mov    0x330(%ebx),%edx
     795:	85 d2                	test   %edx,%edx
     797:	74 1e                	je     7b7 <do_floppy_timer+0x47>
     799:	83 ea 01             	sub    $0x1,%edx
     79c:	89 93 30 03 00 00    	mov    %edx,0x330(%ebx)
     7a2:	85 d2                	test   %edx,%edx
     7a4:	75 34                	jne    7da <do_floppy_timer+0x6a>
     7a6:	8d 83 40 03 00 00    	lea    0x340(%ebx),%eax
     7ac:	50                   	push   %eax
     7ad:	e8 fc ff ff ff       	call   7ae <do_floppy_timer+0x3e>
     7b2:	83 c4 04             	add    $0x4,%esp
     7b5:	eb 23                	jmp    7da <do_floppy_timer+0x6a>
     7b7:	8b 93 20 03 00 00    	mov    0x320(%ebx),%edx
     7bd:	85 d2                	test   %edx,%edx
     7bf:	75 10                	jne    7d1 <do_floppy_timer+0x61>
     7c1:	89 f2                	mov    %esi,%edx
     7c3:	f7 d2                	not    %edx
     7c5:	21 d0                	and    %edx,%eax
     7c7:	a2 00 00 00 00       	mov    %al,0x0
     7cc:	89 fa                	mov    %edi,%edx
     7ce:	ee                   	out    %al,(%dx)
     7cf:	eb 09                	jmp    7da <do_floppy_timer+0x6a>
     7d1:	83 ea 01             	sub    $0x1,%edx
     7d4:	89 93 20 03 00 00    	mov    %edx,0x320(%ebx)
     7da:	01 f6                	add    %esi,%esi
     7dc:	83 c3 04             	add    $0x4,%ebx
     7df:	83 fb 10             	cmp    $0x10,%ebx
     7e2:	75 9e                	jne    782 <do_floppy_timer+0x12>
     7e4:	5b                   	pop    %ebx
     7e5:	5e                   	pop    %esi
     7e6:	5f                   	pop    %edi
     7e7:	c3                   	ret    

000007e8 <add_timer>:
     7e8:	57                   	push   %edi
     7e9:	56                   	push   %esi
     7ea:	53                   	push   %ebx
     7eb:	8b 74 24 10          	mov    0x10(%esp),%esi
     7ef:	8b 7c 24 14          	mov    0x14(%esp),%edi
     7f3:	85 ff                	test   %edi,%edi
     7f5:	0f 84 99 00 00 00    	je     894 <add_timer+0xac>
     7fb:	fa                   	cli    
     7fc:	85 f6                	test   %esi,%esi
     7fe:	7e 14                	jle    814 <add_timer+0x2c>
     800:	83 3d 24 00 00 00 00 	cmpl   $0x0,0x24
     807:	0f 84 80 00 00 00    	je     88d <add_timer+0xa5>
     80d:	bb 20 00 00 00       	mov    $0x20,%ebx
     812:	eb 0a                	jmp    81e <add_timer+0x36>
     814:	ff d7                	call   *%edi
     816:	eb 60                	jmp    878 <add_timer+0x90>
     818:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
     81c:	74 0d                	je     82b <add_timer+0x43>
     81e:	83 c3 0c             	add    $0xc,%ebx
     821:	81 fb 20 03 00 00    	cmp    $0x320,%ebx
     827:	75 ef                	jne    818 <add_timer+0x30>
     829:	eb 50                	jmp    87b <add_timer+0x93>
     82b:	89 7b 04             	mov    %edi,0x4(%ebx)
     82e:	89 33                	mov    %esi,(%ebx)
     830:	8b 15 18 00 00 00    	mov    0x18,%edx
     836:	89 53 08             	mov    %edx,0x8(%ebx)
     839:	89 1d 18 00 00 00    	mov    %ebx,0x18
     83f:	85 d2                	test   %edx,%edx
     841:	74 35                	je     878 <add_timer+0x90>
     843:	8b 0a                	mov    (%edx),%ecx
     845:	39 ce                	cmp    %ecx,%esi
     847:	7e 2f                	jle    878 <add_timer+0x90>
     849:	89 f0                	mov    %esi,%eax
     84b:	29 c8                	sub    %ecx,%eax
     84d:	89 03                	mov    %eax,(%ebx)
     84f:	8b 43 04             	mov    0x4(%ebx),%eax
     852:	8b 4a 04             	mov    0x4(%edx),%ecx
     855:	89 4b 04             	mov    %ecx,0x4(%ebx)
     858:	89 42 04             	mov    %eax,0x4(%edx)
     85b:	8b 13                	mov    (%ebx),%edx
     85d:	8b 43 08             	mov    0x8(%ebx),%eax
     860:	8b 08                	mov    (%eax),%ecx
     862:	89 0b                	mov    %ecx,(%ebx)
     864:	89 10                	mov    %edx,(%eax)
     866:	8b 5b 08             	mov    0x8(%ebx),%ebx
     869:	8b 53 08             	mov    0x8(%ebx),%edx
     86c:	85 d2                	test   %edx,%edx
     86e:	74 08                	je     878 <add_timer+0x90>
     870:	8b 0a                	mov    (%edx),%ecx
     872:	8b 03                	mov    (%ebx),%eax
     874:	39 c1                	cmp    %eax,%ecx
     876:	7c d3                	jl     84b <add_timer+0x63>
     878:	fb                   	sti    
     879:	eb 19                	jmp    894 <add_timer+0xac>
     87b:	83 ec 0c             	sub    $0xc,%esp
     87e:	68 55 00 00 00       	push   $0x55
     883:	e8 fc ff ff ff       	call   884 <add_timer+0x9c>
     888:	83 c4 10             	add    $0x10,%esp
     88b:	eb 9e                	jmp    82b <add_timer+0x43>
     88d:	bb 20 00 00 00       	mov    $0x20,%ebx
     892:	eb 97                	jmp    82b <add_timer+0x43>
     894:	5b                   	pop    %ebx
     895:	5e                   	pop    %esi
     896:	5f                   	pop    %edi
     897:	c3                   	ret    

00000898 <do_timer>:
     898:	56                   	push   %esi
     899:	53                   	push   %ebx
     89a:	83 ec 04             	sub    $0x4,%esp
     89d:	8b 74 24 10          	mov    0x10(%esp),%esi
     8a1:	e8 fc ff ff ff       	call   8a2 <do_timer+0xa>
     8a6:	89 c3                	mov    %eax,%ebx
     8a8:	a1 00 00 00 00       	mov    0x0,%eax
     8ad:	85 c0                	test   %eax,%eax
     8af:	74 11                	je     8c2 <do_timer+0x2a>
     8b1:	83 e8 01             	sub    $0x1,%eax
     8b4:	a3 00 00 00 00       	mov    %eax,0x0
     8b9:	85 c0                	test   %eax,%eax
     8bb:	75 05                	jne    8c2 <do_timer+0x2a>
     8bd:	e8 fc ff ff ff       	call   8be <do_timer+0x26>
     8c2:	85 f6                	test   %esi,%esi
     8c4:	74 09                	je     8cf <do_timer+0x37>
     8c6:	83 83 50 02 00 00 01 	addl   $0x1,0x250(%ebx)
     8cd:	eb 07                	jmp    8d6 <do_timer+0x3e>
     8cf:	83 83 54 02 00 00 01 	addl   $0x1,0x254(%ebx)
     8d6:	a1 18 00 00 00       	mov    0x18,%eax
     8db:	85 c0                	test   %eax,%eax
     8dd:	74 2d                	je     90c <do_timer+0x74>
     8df:	8b 08                	mov    (%eax),%ecx
     8e1:	8d 51 ff             	lea    -0x1(%ecx),%edx
     8e4:	89 10                	mov    %edx,(%eax)
     8e6:	85 d2                	test   %edx,%edx
     8e8:	7f 22                	jg     90c <do_timer+0x74>
     8ea:	8b 50 04             	mov    0x4(%eax),%edx
     8ed:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     8f4:	8b 40 08             	mov    0x8(%eax),%eax
     8f7:	a3 18 00 00 00       	mov    %eax,0x18
     8fc:	ff d2                	call   *%edx
     8fe:	a1 18 00 00 00       	mov    0x18,%eax
     903:	85 c0                	test   %eax,%eax
     905:	74 05                	je     90c <do_timer+0x74>
     907:	83 38 00             	cmpl   $0x0,(%eax)
     90a:	7e de                	jle    8ea <do_timer+0x52>
     90c:	f6 05 00 00 00 00 f0 	testb  $0xf0,0x0
     913:	74 05                	je     91a <do_timer+0x82>
     915:	e8 fc ff ff ff       	call   916 <do_timer+0x7e>
     91a:	8b 43 04             	mov    0x4(%ebx),%eax
     91d:	83 e8 01             	sub    $0x1,%eax
     920:	85 c0                	test   %eax,%eax
     922:	7e 05                	jle    929 <do_timer+0x91>
     924:	89 43 04             	mov    %eax,0x4(%ebx)
     927:	eb 31                	jmp    95a <do_timer+0xc2>
     929:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
     930:	e8 fc ff ff ff       	call   931 <do_timer+0x99>
     935:	85 c0                	test   %eax,%eax
     937:	74 18                	je     951 <do_timer+0xb9>
     939:	83 ec 08             	sub    $0x8,%esp
     93c:	50                   	push   %eax
     93d:	68 70 00 00 00       	push   $0x70
     942:	e8 fc ff ff ff       	call   943 <do_timer+0xab>
     947:	83 05 00 00 00 00 01 	addl   $0x1,0x0
     94e:	83 c4 10             	add    $0x10,%esp
     951:	85 f6                	test   %esi,%esi
     953:	74 05                	je     95a <do_timer+0xc2>
     955:	e8 fc ff ff ff       	call   956 <do_timer+0xbe>
     95a:	83 c4 04             	add    $0x4,%esp
     95d:	5b                   	pop    %ebx
     95e:	5e                   	pop    %esi
     95f:	c3                   	ret    

00000960 <sched_init>:
     960:	b8 e8 02 00 00       	mov    $0x2e8,%eax
     965:	66 c7 05 20 00 00 00 	movw   $0x68,0x20
     96c:	68 00 
     96e:	66 a3 22 00 00 00    	mov    %ax,0x22
     974:	c1 c8 10             	ror    $0x10,%eax
     977:	a2 24 00 00 00       	mov    %al,0x24
     97c:	c6 05 25 00 00 00 89 	movb   $0x89,0x25
     983:	c6 05 26 00 00 00 00 	movb   $0x0,0x26
     98a:	88 25 27 00 00 00    	mov    %ah,0x27
     990:	c1 c8 10             	ror    $0x10,%eax
     993:	b8 d0 02 00 00       	mov    $0x2d0,%eax
     998:	66 c7 05 28 00 00 00 	movw   $0x68,0x28
     99f:	68 00 
     9a1:	66 a3 2a 00 00 00    	mov    %ax,0x2a
     9a7:	c1 c8 10             	ror    $0x10,%eax
     9aa:	a2 2c 00 00 00       	mov    %al,0x2c
     9af:	c6 05 2d 00 00 00 82 	movb   $0x82,0x2d
     9b6:	c6 05 2e 00 00 00 00 	movb   $0x0,0x2e
     9bd:	88 25 2f 00 00 00    	mov    %ah,0x2f
     9c3:	c1 c8 10             	ror    $0x10,%eax
     9c6:	ba 04 00 00 00       	mov    $0x4,%edx
     9cb:	b8 30 00 00 00       	mov    $0x30,%eax
     9d0:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
     9d6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
     9dd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
     9e3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
     9ea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     9f1:	83 c0 10             	add    $0x10,%eax
     9f4:	83 c2 04             	add    $0x4,%edx
     9f7:	3d 20 04 00 00       	cmp    $0x420,%eax
     9fc:	75 d2                	jne    9d0 <sched_init+0x70>
     9fe:	9c                   	pushf  
     9ff:	81 24 24 ff bf ff ff 	andl   $0xffffbfff,(%esp)
     a06:	9d                   	popf   
     a07:	b8 20 00 00 00       	mov    $0x20,%eax
     a0c:	0f 00 d8             	ltr    %ax
     a0f:	b8 28 00 00 00       	mov    $0x28,%eax
     a14:	0f 00 d0             	lldt   %ax
     a17:	b8 00 00 08 00       	mov    $0x80000,%eax
     a1c:	ba 00 00 00 00       	mov    $0x0,%edx
     a21:	66 89 d0             	mov    %dx,%ax
     a24:	66 ba 00 8e          	mov    $0x8e00,%dx
     a28:	a3 18 04 00 00       	mov    %eax,0x418
     a2d:	89 15 1c 04 00 00    	mov    %edx,0x41c
     a33:	ba 00 00 00 00       	mov    $0x0,%edx
     a38:	66 89 d0             	mov    %dx,%ax
     a3b:	66 ba 00 ef          	mov    $0xef00,%dx
     a3f:	a3 00 04 00 00       	mov    %eax,0x400
     a44:	89 15 04 04 00 00    	mov    %edx,0x404
     a4a:	c3                   	ret    
     a4b:	90                   	nop
     a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     a51:	cf                   	iret   
     a52:	66 90                	xchg   %ax,%ax
     a54:	68 94 0a 00 00       	push   $0xa94
     a59:	e9 fc ff ff ff       	jmp    a5a <sched_init+0xfa>
     a5e:	66 90                	xchg   %ax,%ax

00000a60 <system_call>:
     a60:	83 f8 47             	cmp    $0x47,%eax
     a63:	77 e7                	ja     a4c <sched_init+0xec>
     a65:	1e                   	push   %ds
     a66:	06                   	push   %es
     a67:	0f a0                	push   %fs
     a69:	52                   	push   %edx
     a6a:	51                   	push   %ecx
     a6b:	53                   	push   %ebx
     a6c:	ba 10 00 00 00       	mov    $0x10,%edx
     a71:	8e da                	mov    %edx,%ds
     a73:	8e c2                	mov    %edx,%es
     a75:	ba 17 00 00 00       	mov    $0x17,%edx
     a7a:	8e e2                	mov    %edx,%fs
     a7c:	ff 14 85 00 00 00 00 	call   *0x0(,%eax,4)
     a83:	50                   	push   %eax
     a84:	e8 fc ff ff ff       	call   a85 <system_call+0x25>
     a89:	83 38 00             	cmpl   $0x0,(%eax)
     a8c:	75 c6                	jne    a54 <sched_init+0xf4>
     a8e:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
     a92:	74 c0                	je     a54 <sched_init+0xf4>
     a94:	e8 fc ff ff ff       	call   a95 <system_call+0x35>
     a99:	3b 05 00 00 00 00    	cmp    0x0,%eax
     a9f:	74 30                	je     ad1 <system_call+0x71>
     aa1:	66 83 7c 24 20 0f    	cmpw   $0xf,0x20(%esp)
     aa7:	75 28                	jne    ad1 <system_call+0x71>
     aa9:	66 83 7c 24 2c 17    	cmpw   $0x17,0x2c(%esp)
     aaf:	75 20                	jne    ad1 <system_call+0x71>
     ab1:	8b 58 0c             	mov    0xc(%eax),%ebx
     ab4:	8b 88 10 02 00 00    	mov    0x210(%eax),%ecx
     aba:	f7 d1                	not    %ecx
     abc:	21 d9                	and    %ebx,%ecx
     abe:	0f bc c9             	bsf    %ecx,%ecx
     ac1:	74 0e                	je     ad1 <system_call+0x71>
     ac3:	0f b3 cb             	btr    %ecx,%ebx
     ac6:	89 58 0c             	mov    %ebx,0xc(%eax)
     ac9:	41                   	inc    %ecx
     aca:	51                   	push   %ecx
     acb:	e8 fc ff ff ff       	call   acc <system_call+0x6c>
     ad0:	58                   	pop    %eax
     ad1:	58                   	pop    %eax
     ad2:	5b                   	pop    %ebx
     ad3:	59                   	pop    %ecx
     ad4:	5a                   	pop    %edx
     ad5:	0f a1                	pop    %fs
     ad7:	07                   	pop    %es
     ad8:	1f                   	pop    %ds
     ad9:	cf                   	iret   
     ada:	66 90                	xchg   %ax,%ax

00000adc <coprocessor_error>:
     adc:	1e                   	push   %ds
     add:	06                   	push   %es
     ade:	0f a0                	push   %fs
     ae0:	52                   	push   %edx
     ae1:	51                   	push   %ecx
     ae2:	53                   	push   %ebx
     ae3:	50                   	push   %eax
     ae4:	b8 10 00 00 00       	mov    $0x10,%eax
     ae9:	8e d8                	mov    %eax,%ds
     aeb:	8e c0                	mov    %eax,%es
     aed:	b8 17 00 00 00       	mov    $0x17,%eax
     af2:	8e e0                	mov    %eax,%fs
     af4:	68 94 0a 00 00       	push   $0xa94
     af9:	e9 fc ff ff ff       	jmp    afa <coprocessor_error+0x1e>
     afe:	66 90                	xchg   %ax,%ax

00000b00 <device_not_available>:
     b00:	1e                   	push   %ds
     b01:	06                   	push   %es
     b02:	0f a0                	push   %fs
     b04:	52                   	push   %edx
     b05:	51                   	push   %ecx
     b06:	53                   	push   %ebx
     b07:	50                   	push   %eax
     b08:	b8 10 00 00 00       	mov    $0x10,%eax
     b0d:	8e d8                	mov    %eax,%ds
     b0f:	8e c0                	mov    %eax,%es
     b11:	b8 17 00 00 00       	mov    $0x17,%eax
     b16:	8e e0                	mov    %eax,%fs
     b18:	68 94 0a 00 00       	push   $0xa94
     b1d:	0f 06                	clts   
     b1f:	0f 20 c0             	mov    %cr0,%eax
     b22:	a9 04 00 00 00       	test   $0x4,%eax
     b27:	0f 84 fc ff ff ff    	je     b29 <device_not_available+0x29>
     b2d:	55                   	push   %ebp
     b2e:	56                   	push   %esi
     b2f:	57                   	push   %edi
     b30:	e8 fc ff ff ff       	call   b31 <device_not_available+0x31>
     b35:	5f                   	pop    %edi
     b36:	5e                   	pop    %esi
     b37:	5d                   	pop    %ebp
     b38:	c3                   	ret    
     b39:	8d 76 00             	lea    0x0(%esi),%esi

00000b3c <timer_interrupt>:
     b3c:	1e                   	push   %ds
     b3d:	06                   	push   %es
     b3e:	0f a0                	push   %fs
     b40:	52                   	push   %edx
     b41:	51                   	push   %ecx
     b42:	53                   	push   %ebx
     b43:	50                   	push   %eax
     b44:	b8 10 00 00 00       	mov    $0x10,%eax
     b49:	8e d8                	mov    %eax,%ds
     b4b:	8e c0                	mov    %eax,%es
     b4d:	b8 17 00 00 00       	mov    $0x17,%eax
     b52:	8e e0                	mov    %eax,%fs
     b54:	ff 05 00 00 00 00    	incl   0x0
     b5a:	b0 20                	mov    $0x20,%al
     b5c:	e6 20                	out    %al,$0x20
     b5e:	8b 44 24 20          	mov    0x20(%esp),%eax
     b62:	83 e0 03             	and    $0x3,%eax
     b65:	50                   	push   %eax
     b66:	e8 fc ff ff ff       	call   b67 <timer_interrupt+0x2b>
     b6b:	83 c4 04             	add    $0x4,%esp
     b6e:	e9 21 ff ff ff       	jmp    a94 <system_call+0x34>
     b73:	90                   	nop

00000b74 <sys_execve>:
     b74:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     b78:	50                   	push   %eax
     b79:	e8 fc ff ff ff       	call   b7a <sys_execve+0x6>
     b7e:	83 c4 04             	add    $0x4,%esp
     b81:	c3                   	ret    
     b82:	66 90                	xchg   %ax,%ax

00000b84 <sys_fork>:
     b84:	e8 fc ff ff ff       	call   b85 <sys_fork+0x1>
     b89:	85 c0                	test   %eax,%eax
     b8b:	78 0e                	js     b9b <sys_fork+0x17>
     b8d:	0f a8                	push   %gs
     b8f:	56                   	push   %esi
     b90:	57                   	push   %edi
     b91:	55                   	push   %ebp
     b92:	50                   	push   %eax
     b93:	e8 fc ff ff ff       	call   b94 <sys_fork+0x10>
     b98:	83 c4 14             	add    $0x14,%esp
     b9b:	c3                   	ret    

00000b9c <hd_interrupt>:
     b9c:	50                   	push   %eax
     b9d:	51                   	push   %ecx
     b9e:	52                   	push   %edx
     b9f:	1e                   	push   %ds
     ba0:	06                   	push   %es
     ba1:	0f a0                	push   %fs
     ba3:	b8 10 00 00 00       	mov    $0x10,%eax
     ba8:	8e d8                	mov    %eax,%ds
     baa:	8e c0                	mov    %eax,%es
     bac:	b8 17 00 00 00       	mov    $0x17,%eax
     bb1:	8e e0                	mov    %eax,%fs
     bb3:	b0 20                	mov    $0x20,%al
     bb5:	e6 a0                	out    %al,$0xa0
     bb7:	eb 00                	jmp    bb9 <hd_interrupt+0x1d>
     bb9:	eb 00                	jmp    bbb <hd_interrupt+0x1f>
     bbb:	31 d2                	xor    %edx,%edx
     bbd:	87 15 00 00 00 00    	xchg   %edx,0x0
     bc3:	85 d2                	test   %edx,%edx
     bc5:	75 05                	jne    bcc <hd_interrupt+0x30>
     bc7:	ba 00 00 00 00       	mov    $0x0,%edx
     bcc:	e6 20                	out    %al,$0x20
     bce:	ff d2                	call   *%edx
     bd0:	0f a1                	pop    %fs
     bd2:	07                   	pop    %es
     bd3:	1f                   	pop    %ds
     bd4:	5a                   	pop    %edx
     bd5:	59                   	pop    %ecx
     bd6:	58                   	pop    %eax
     bd7:	cf                   	iret   

00000bd8 <floppy_interrupt>:
     bd8:	50                   	push   %eax
     bd9:	51                   	push   %ecx
     bda:	52                   	push   %edx
     bdb:	1e                   	push   %ds
     bdc:	06                   	push   %es
     bdd:	0f a0                	push   %fs
     bdf:	b8 10 00 00 00       	mov    $0x10,%eax
     be4:	8e d8                	mov    %eax,%ds
     be6:	8e c0                	mov    %eax,%es
     be8:	b8 17 00 00 00       	mov    $0x17,%eax
     bed:	8e e0                	mov    %eax,%fs
     bef:	b0 20                	mov    $0x20,%al
     bf1:	e6 20                	out    %al,$0x20
     bf3:	31 c0                	xor    %eax,%eax
     bf5:	87 05 00 00 00 00    	xchg   %eax,0x0
     bfb:	85 c0                	test   %eax,%eax
     bfd:	75 05                	jne    c04 <floppy_interrupt+0x2c>
     bff:	b8 00 00 00 00       	mov    $0x0,%eax
     c04:	ff d0                	call   *%eax
     c06:	0f a1                	pop    %fs
     c08:	07                   	pop    %es
     c09:	1f                   	pop    %ds
     c0a:	5a                   	pop    %edx
     c0b:	59                   	pop    %ecx
     c0c:	58                   	pop    %eax
     c0d:	cf                   	iret   

00000c0e <parallel_interrupt>:
     c0e:	50                   	push   %eax
     c0f:	b0 20                	mov    $0x20,%al
     c11:	e6 20                	out    %al,$0x20
     c13:	58                   	pop    %eax
     c14:	cf                   	iret   

00000c15 <parse_cpu_topology>:
     c15:	50                   	push   %eax
     c16:	53                   	push   %ebx
     c17:	51                   	push   %ecx
     c18:	52                   	push   %edx
     c19:	b8 01 00 00 00       	mov    $0x1,%eax
     c1e:	0f a2                	cpuid  
     c20:	5a                   	pop    %edx
     c21:	59                   	pop    %ecx
     c22:	5b                   	pop    %ebx
     c23:	58                   	pop    %eax
     c24:	cf                   	iret   

00000c25 <handle_ipi_interrupt>:
     c25:	50                   	push   %eax
     c26:	53                   	push   %ebx
     c27:	51                   	push   %ecx
     c28:	52                   	push   %edx
     c29:	e8 fc ff ff ff       	call   c2a <handle_ipi_interrupt+0x5>
     c2e:	e8 fc ff ff ff       	call   c2f <handle_ipi_interrupt+0xa>
     c33:	5a                   	pop    %edx
     c34:	59                   	pop    %ecx
     c35:	5b                   	pop    %ebx
     c36:	58                   	pop    %eax
     c37:	cf                   	iret   
     c38:	55                   	push   %ebp
     c39:	57                   	push   %edi
     c3a:	56                   	push   %esi
     c3b:	53                   	push   %ebx
     c3c:	83 ec 1c             	sub    $0x1c,%esp
     c3f:	89 c5                	mov    %eax,%ebp
     c41:	89 d6                	mov    %edx,%esi
     c43:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     c47:	e8 fc ff ff ff       	call   c48 <handle_ipi_interrupt+0x23>
     c4c:	89 c7                	mov    %eax,%edi
     c4e:	89 f3                	mov    %esi,%ebx
     c50:	83 ec 04             	sub    $0x4,%esp
     c53:	0f b7 44 24 10       	movzwl 0x10(%esp),%eax
     c58:	50                   	push   %eax
     c59:	55                   	push   %ebp
     c5a:	68 7f 00 00 00       	push   $0x7f
     c5f:	e8 fc ff ff ff       	call   c60 <handle_ipi_interrupt+0x3b>
     c64:	83 c4 08             	add    $0x8,%esp
     c67:	ff 76 0c             	pushl  0xc(%esi)
     c6a:	ff 76 10             	pushl  0x10(%esi)
     c6d:	ff 76 08             	pushl  0x8(%esi)
     c70:	ff 36                	pushl  (%esi)
     c72:	ff 76 04             	pushl  0x4(%esi)
     c75:	68 28 00 00 00       	push   $0x28
     c7a:	e8 fc ff ff ff       	call   c7b <handle_ipi_interrupt+0x56>
     c7f:	66 8c e0             	mov    %fs,%ax
     c82:	83 c4 18             	add    $0x18,%esp
     c85:	0f b7 c0             	movzwl %ax,%eax
     c88:	50                   	push   %eax
     c89:	68 8a 00 00 00       	push   $0x8a
     c8e:	e8 fc ff ff ff       	call   c8f <handle_ipi_interrupt+0x6a>
     c93:	b9 17 00 00 00       	mov    $0x17,%ecx
     c98:	0f 03 c9             	lsl    %cx,%ecx
     c9b:	41                   	inc    %ecx
     c9c:	50                   	push   %eax
     c9d:	8d 87 d8 02 00 00    	lea    0x2d8(%edi),%eax
     ca3:	83 c0 07             	add    $0x7,%eax
     ca6:	8a 30                	mov    (%eax),%dh
     ca8:	83 e8 03             	sub    $0x3,%eax
     cab:	8a 10                	mov    (%eax),%dl
     cad:	c1 e2 10             	shl    $0x10,%edx
     cb0:	83 e8 02             	sub    $0x2,%eax
     cb3:	66 8b 10             	mov    (%eax),%dx
     cb6:	58                   	pop    %eax
     cb7:	83 c4 0c             	add    $0xc,%esp
     cba:	51                   	push   %ecx
     cbb:	52                   	push   %edx
     cbc:	68 94 00 00 00       	push   $0x94
     cc1:	e8 fc ff ff ff       	call   cc2 <handle_ipi_interrupt+0x9d>
     cc6:	83 c4 10             	add    $0x10,%esp
     cc9:	83 7e 10 17          	cmpl   $0x17,0x10(%esi)
     ccd:	75 52                	jne    d21 <handle_ipi_interrupt+0xfc>
     ccf:	83 ec 0c             	sub    $0xc,%esp
     cd2:	68 a9 00 00 00       	push   $0xa9
     cd7:	e8 fc ff ff ff       	call   cd8 <handle_ipi_interrupt+0xb3>
     cdc:	83 c4 10             	add    $0x10,%esp
     cdf:	be 00 00 00 00       	mov    $0x0,%esi
     ce4:	bd 17 00 00 00       	mov    $0x17,%ebp
     ce9:	8b 53 0c             	mov    0xc(%ebx),%edx
     cec:	89 e8                	mov    %ebp,%eax
     cee:	0f a0                	push   %fs
     cf0:	8e e0                	mov    %eax,%fs
     cf2:	64 8b 04 32          	mov    %fs:(%edx,%esi,1),%eax
     cf6:	0f a1                	pop    %fs
     cf8:	83 ec 08             	sub    $0x8,%esp
     cfb:	50                   	push   %eax
     cfc:	68 b1 00 00 00       	push   $0xb1
     d01:	e8 fc ff ff ff       	call   d02 <handle_ipi_interrupt+0xdd>
     d06:	83 c6 04             	add    $0x4,%esi
     d09:	83 c4 10             	add    $0x10,%esp
     d0c:	83 fe 10             	cmp    $0x10,%esi
     d0f:	75 d8                	jne    ce9 <handle_ipi_interrupt+0xc4>
     d11:	83 ec 0c             	sub    $0xc,%esp
     d14:	68 b5 00 00 00       	push   $0xb5
     d19:	e8 fc ff ff ff       	call   d1a <handle_ipi_interrupt+0xf5>
     d1e:	83 c4 10             	add    $0x10,%esp
     d21:	b8 00 00 00 00       	mov    $0x0,%eax
     d26:	66 0f 00 c8          	str    %ax
     d2a:	83 e8 20             	sub    $0x20,%eax
     d2d:	c1 e8 04             	shr    $0x4,%eax
     d30:	83 ec 04             	sub    $0x4,%esp
     d33:	0f b7 c0             	movzwl %ax,%eax
     d36:	50                   	push   %eax
     d37:	ff b7 2c 02 00 00    	pushl  0x22c(%edi)
     d3d:	68 b7 00 00 00       	push   $0xb7
     d42:	e8 fc ff ff ff       	call   d43 <handle_ipi_interrupt+0x11e>
     d47:	83 c4 10             	add    $0x10,%esp
     d4a:	be 00 00 00 00       	mov    $0x0,%esi
     d4f:	8b 43 04             	mov    0x4(%ebx),%eax
     d52:	8b 13                	mov    (%ebx),%edx
     d54:	0f a0                	push   %fs
     d56:	8e e0                	mov    %eax,%fs
     d58:	64 8a 04 32          	mov    %fs:(%edx,%esi,1),%al
     d5c:	0f a1                	pop    %fs
     d5e:	83 ec 08             	sub    $0x8,%esp
     d61:	0f b6 c0             	movzbl %al,%eax
     d64:	50                   	push   %eax
     d65:	68 d1 00 00 00       	push   $0xd1
     d6a:	e8 fc ff ff ff       	call   d6b <handle_ipi_interrupt+0x146>
     d6f:	83 c6 01             	add    $0x1,%esi
     d72:	83 c4 10             	add    $0x10,%esp
     d75:	83 fe 0a             	cmp    $0xa,%esi
     d78:	75 d5                	jne    d4f <handle_ipi_interrupt+0x12a>
     d7a:	83 ec 0c             	sub    $0xc,%esp
     d7d:	68 d7 00 00 00       	push   $0xd7
     d82:	e8 fc ff ff ff       	call   d83 <handle_ipi_interrupt+0x15e>
     d87:	c7 04 24 50 00 00 00 	movl   $0x50,(%esp)
     d8e:	e8 fc ff ff ff       	call   d8f <handle_ipi_interrupt+0x16a>
     d93:	c7 04 24 0b 00 00 00 	movl   $0xb,(%esp)
     d9a:	e8 fc ff ff ff       	call   d9b <handle_ipi_interrupt+0x176>
     d9f:	83 c4 2c             	add    $0x2c,%esp
     da2:	5b                   	pop    %ebx
     da3:	5e                   	pop    %esi
     da4:	5f                   	pop    %edi
     da5:	5d                   	pop    %ebp
     da6:	c3                   	ret    

00000da7 <do_double_fault>:
     da7:	83 ec 0c             	sub    $0xc,%esp
     daa:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     dae:	8b 54 24 10          	mov    0x10(%esp),%edx
     db2:	b8 da 00 00 00       	mov    $0xda,%eax
     db7:	e8 7c fe ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     dbc:	83 c4 0c             	add    $0xc,%esp
     dbf:	c3                   	ret    

00000dc0 <do_general_protection>:
     dc0:	83 ec 0c             	sub    $0xc,%esp
     dc3:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     dc7:	8b 54 24 10          	mov    0x10(%esp),%edx
     dcb:	b8 e7 00 00 00       	mov    $0xe7,%eax
     dd0:	e8 63 fe ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     dd5:	83 c4 0c             	add    $0xc,%esp
     dd8:	c3                   	ret    

00000dd9 <do_divide_error>:
     dd9:	83 ec 0c             	sub    $0xc,%esp
     ddc:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     de0:	8b 54 24 10          	mov    0x10(%esp),%edx
     de4:	b8 fa 00 00 00       	mov    $0xfa,%eax
     de9:	e8 4a fe ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     dee:	83 c4 0c             	add    $0xc,%esp
     df1:	c3                   	ret    

00000df2 <do_int3>:
     df2:	56                   	push   %esi
     df3:	53                   	push   %ebx
     df4:	83 ec 10             	sub    $0x10,%esp
     df7:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
     dfb:	be 00 00 00 00       	mov    $0x0,%esi
     e00:	89 f0                	mov    %esi,%eax
     e02:	66 0f 00 c8          	str    %ax
     e06:	89 c6                	mov    %eax,%esi
     e08:	ff 74 24 3c          	pushl  0x3c(%esp)
     e0c:	ff 74 24 44          	pushl  0x44(%esp)
     e10:	ff 74 24 4c          	pushl  0x4c(%esp)
     e14:	ff 74 24 54          	pushl  0x54(%esp)
     e18:	68 78 00 00 00       	push   $0x78
     e1d:	e8 fc ff ff ff       	call   e1e <do_int3+0x2c>
     e22:	83 c4 14             	add    $0x14,%esp
     e25:	53                   	push   %ebx
     e26:	ff 74 24 34          	pushl  0x34(%esp)
     e2a:	ff 74 24 40          	pushl  0x40(%esp)
     e2e:	ff 74 24 40          	pushl  0x40(%esp)
     e32:	68 a0 00 00 00       	push   $0xa0
     e37:	e8 fc ff ff ff       	call   e38 <do_int3+0x46>
     e3c:	83 c4 14             	add    $0x14,%esp
     e3f:	56                   	push   %esi
     e40:	ff 74 24 28          	pushl  0x28(%esp)
     e44:	ff 74 24 30          	pushl  0x30(%esp)
     e48:	ff 74 24 38          	pushl  0x38(%esp)
     e4c:	68 c8 00 00 00       	push   $0xc8
     e51:	e8 fc ff ff ff       	call   e52 <do_int3+0x60>
     e56:	83 c4 20             	add    $0x20,%esp
     e59:	ff 73 08             	pushl  0x8(%ebx)
     e5c:	ff 73 04             	pushl  0x4(%ebx)
     e5f:	ff 33                	pushl  (%ebx)
     e61:	68 ec 00 00 00       	push   $0xec
     e66:	e8 fc ff ff ff       	call   e67 <do_int3+0x75>
     e6b:	83 c4 14             	add    $0x14,%esp
     e6e:	5b                   	pop    %ebx
     e6f:	5e                   	pop    %esi
     e70:	c3                   	ret    

00000e71 <do_nmi>:
     e71:	83 ec 0c             	sub    $0xc,%esp
     e74:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e78:	8b 54 24 10          	mov    0x10(%esp),%edx
     e7c:	b8 07 01 00 00       	mov    $0x107,%eax
     e81:	e8 b2 fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     e86:	83 c4 0c             	add    $0xc,%esp
     e89:	c3                   	ret    

00000e8a <do_debug>:
     e8a:	83 ec 0c             	sub    $0xc,%esp
     e8d:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     e91:	8b 54 24 10          	mov    0x10(%esp),%edx
     e95:	b8 0b 01 00 00       	mov    $0x10b,%eax
     e9a:	e8 99 fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     e9f:	83 c4 0c             	add    $0xc,%esp
     ea2:	c3                   	ret    

00000ea3 <do_overflow>:
     ea3:	83 ec 0c             	sub    $0xc,%esp
     ea6:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     eaa:	8b 54 24 10          	mov    0x10(%esp),%edx
     eae:	b8 11 01 00 00       	mov    $0x111,%eax
     eb3:	e8 80 fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     eb8:	83 c4 0c             	add    $0xc,%esp
     ebb:	c3                   	ret    

00000ebc <do_bounds>:
     ebc:	83 ec 0c             	sub    $0xc,%esp
     ebf:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     ec3:	8b 54 24 10          	mov    0x10(%esp),%edx
     ec7:	b8 1a 01 00 00       	mov    $0x11a,%eax
     ecc:	e8 67 fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     ed1:	83 c4 0c             	add    $0xc,%esp
     ed4:	c3                   	ret    

00000ed5 <do_invalid_op>:
     ed5:	83 ec 0c             	sub    $0xc,%esp
     ed8:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     edc:	8b 54 24 10          	mov    0x10(%esp),%edx
     ee0:	b8 21 01 00 00       	mov    $0x121,%eax
     ee5:	e8 4e fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     eea:	83 c4 0c             	add    $0xc,%esp
     eed:	c3                   	ret    

00000eee <do_device_not_available>:
     eee:	83 ec 0c             	sub    $0xc,%esp
     ef1:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     ef5:	8b 54 24 10          	mov    0x10(%esp),%edx
     ef9:	b8 31 01 00 00       	mov    $0x131,%eax
     efe:	e8 35 fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     f03:	83 c4 0c             	add    $0xc,%esp
     f06:	c3                   	ret    

00000f07 <do_coprocessor_segment_overrun>:
     f07:	83 ec 0c             	sub    $0xc,%esp
     f0a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     f0e:	8b 54 24 10          	mov    0x10(%esp),%edx
     f12:	b8 46 01 00 00       	mov    $0x146,%eax
     f17:	e8 1c fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     f1c:	83 c4 0c             	add    $0xc,%esp
     f1f:	c3                   	ret    

00000f20 <do_invalid_TSS>:
     f20:	83 ec 0c             	sub    $0xc,%esp
     f23:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     f27:	8b 54 24 10          	mov    0x10(%esp),%edx
     f2b:	b8 62 01 00 00       	mov    $0x162,%eax
     f30:	e8 03 fd ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     f35:	83 c4 0c             	add    $0xc,%esp
     f38:	c3                   	ret    

00000f39 <do_segment_not_present>:
     f39:	83 ec 0c             	sub    $0xc,%esp
     f3c:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     f40:	8b 54 24 10          	mov    0x10(%esp),%edx
     f44:	b8 6e 01 00 00       	mov    $0x16e,%eax
     f49:	e8 ea fc ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     f4e:	83 c4 0c             	add    $0xc,%esp
     f51:	c3                   	ret    

00000f52 <do_stack_segment>:
     f52:	83 ec 0c             	sub    $0xc,%esp
     f55:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     f59:	8b 54 24 10          	mov    0x10(%esp),%edx
     f5d:	b8 82 01 00 00       	mov    $0x182,%eax
     f62:	e8 d1 fc ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     f67:	83 c4 0c             	add    $0xc,%esp
     f6a:	c3                   	ret    

00000f6b <do_coprocessor_error>:
     f6b:	83 ec 0c             	sub    $0xc,%esp
     f6e:	e8 fc ff ff ff       	call   f6f <do_coprocessor_error+0x4>
     f73:	39 05 00 00 00 00    	cmp    %eax,0x0
     f79:	75 12                	jne    f8d <do_coprocessor_error+0x22>
     f7b:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     f7f:	8b 54 24 10          	mov    0x10(%esp),%edx
     f83:	b8 90 01 00 00       	mov    $0x190,%eax
     f88:	e8 ab fc ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     f8d:	83 c4 0c             	add    $0xc,%esp
     f90:	c3                   	ret    

00000f91 <do_reserved>:
     f91:	83 ec 0c             	sub    $0xc,%esp
     f94:	8b 4c 24 14          	mov    0x14(%esp),%ecx
     f98:	8b 54 24 10          	mov    0x10(%esp),%edx
     f9c:	b8 a2 01 00 00       	mov    $0x1a2,%eax
     fa1:	e8 92 fc ff ff       	call   c38 <handle_ipi_interrupt+0x13>
     fa6:	83 c4 0c             	add    $0xc,%esp
     fa9:	c3                   	ret    

00000faa <trap_init>:
     faa:	53                   	push   %ebx
     fab:	b8 00 00 08 00       	mov    $0x80000,%eax
     fb0:	ba 00 00 00 00       	mov    $0x0,%edx
     fb5:	66 89 d0             	mov    %dx,%ax
     fb8:	66 ba 00 8f          	mov    $0x8f00,%dx
     fbc:	a3 00 00 00 00       	mov    %eax,0x0
     fc1:	89 15 04 00 00 00    	mov    %edx,0x4
     fc7:	ba 00 00 00 00       	mov    $0x0,%edx
     fcc:	66 89 d0             	mov    %dx,%ax
     fcf:	66 ba 00 8f          	mov    $0x8f00,%dx
     fd3:	a3 08 00 00 00       	mov    %eax,0x8
     fd8:	89 15 0c 00 00 00    	mov    %edx,0xc
     fde:	ba 00 00 00 00       	mov    $0x0,%edx
     fe3:	66 89 d0             	mov    %dx,%ax
     fe6:	66 ba 00 8f          	mov    $0x8f00,%dx
     fea:	a3 10 00 00 00       	mov    %eax,0x10
     fef:	89 15 14 00 00 00    	mov    %edx,0x14
     ff5:	ba 00 00 00 00       	mov    $0x0,%edx
     ffa:	66 89 d0             	mov    %dx,%ax
     ffd:	66 ba 00 ef          	mov    $0xef00,%dx
    1001:	a3 18 00 00 00       	mov    %eax,0x18
    1006:	89 15 1c 00 00 00    	mov    %edx,0x1c
    100c:	ba 00 00 00 00       	mov    $0x0,%edx
    1011:	66 89 d0             	mov    %dx,%ax
    1014:	66 ba 00 ef          	mov    $0xef00,%dx
    1018:	a3 20 00 00 00       	mov    %eax,0x20
    101d:	89 15 24 00 00 00    	mov    %edx,0x24
    1023:	ba 00 00 00 00       	mov    $0x0,%edx
    1028:	66 89 d0             	mov    %dx,%ax
    102b:	66 ba 00 ef          	mov    $0xef00,%dx
    102f:	a3 28 00 00 00       	mov    %eax,0x28
    1034:	89 15 2c 00 00 00    	mov    %edx,0x2c
    103a:	ba 00 00 00 00       	mov    $0x0,%edx
    103f:	66 89 d0             	mov    %dx,%ax
    1042:	66 ba 00 8f          	mov    $0x8f00,%dx
    1046:	a3 30 00 00 00       	mov    %eax,0x30
    104b:	89 15 34 00 00 00    	mov    %edx,0x34
    1051:	ba 00 00 00 00       	mov    $0x0,%edx
    1056:	66 89 d0             	mov    %dx,%ax
    1059:	66 ba 00 8f          	mov    $0x8f00,%dx
    105d:	a3 38 00 00 00       	mov    %eax,0x38
    1062:	89 15 3c 00 00 00    	mov    %edx,0x3c
    1068:	ba 00 00 00 00       	mov    $0x0,%edx
    106d:	66 89 d0             	mov    %dx,%ax
    1070:	66 ba 00 8f          	mov    $0x8f00,%dx
    1074:	a3 40 00 00 00       	mov    %eax,0x40
    1079:	89 15 44 00 00 00    	mov    %edx,0x44
    107f:	ba 00 00 00 00       	mov    $0x0,%edx
    1084:	66 89 d0             	mov    %dx,%ax
    1087:	66 ba 00 8f          	mov    $0x8f00,%dx
    108b:	a3 48 00 00 00       	mov    %eax,0x48
    1090:	89 15 4c 00 00 00    	mov    %edx,0x4c
    1096:	ba 00 00 00 00       	mov    $0x0,%edx
    109b:	66 89 d0             	mov    %dx,%ax
    109e:	66 ba 00 8f          	mov    $0x8f00,%dx
    10a2:	a3 50 00 00 00       	mov    %eax,0x50
    10a7:	89 15 54 00 00 00    	mov    %edx,0x54
    10ad:	ba 00 00 00 00       	mov    $0x0,%edx
    10b2:	66 89 d0             	mov    %dx,%ax
    10b5:	66 ba 00 8f          	mov    $0x8f00,%dx
    10b9:	a3 58 00 00 00       	mov    %eax,0x58
    10be:	89 15 5c 00 00 00    	mov    %edx,0x5c
    10c4:	ba 00 00 00 00       	mov    $0x0,%edx
    10c9:	66 89 d0             	mov    %dx,%ax
    10cc:	66 ba 00 8f          	mov    $0x8f00,%dx
    10d0:	a3 60 00 00 00       	mov    %eax,0x60
    10d5:	89 15 64 00 00 00    	mov    %edx,0x64
    10db:	ba 00 00 00 00       	mov    $0x0,%edx
    10e0:	66 89 d0             	mov    %dx,%ax
    10e3:	66 ba 00 8f          	mov    $0x8f00,%dx
    10e7:	a3 68 00 00 00       	mov    %eax,0x68
    10ec:	89 15 6c 00 00 00    	mov    %edx,0x6c
    10f2:	ba 00 00 00 00       	mov    $0x0,%edx
    10f7:	66 89 d0             	mov    %dx,%ax
    10fa:	66 ba 00 8f          	mov    $0x8f00,%dx
    10fe:	a3 70 00 00 00       	mov    %eax,0x70
    1103:	89 15 74 00 00 00    	mov    %edx,0x74
    1109:	ba 00 00 00 00       	mov    $0x0,%edx
    110e:	66 89 d0             	mov    %dx,%ax
    1111:	66 ba 00 8f          	mov    $0x8f00,%dx
    1115:	a3 78 00 00 00       	mov    %eax,0x78
    111a:	89 15 7c 00 00 00    	mov    %edx,0x7c
    1120:	ba 00 00 00 00       	mov    $0x0,%edx
    1125:	66 89 d0             	mov    %dx,%ax
    1128:	66 ba 00 8f          	mov    $0x8f00,%dx
    112c:	a3 80 00 00 00       	mov    %eax,0x80
    1131:	89 15 84 00 00 00    	mov    %edx,0x84
    1137:	b9 88 00 00 00       	mov    $0x88,%ecx
    113c:	bb 80 01 00 00       	mov    $0x180,%ebx
    1141:	ba 00 00 00 00       	mov    $0x0,%edx
    1146:	66 89 d0             	mov    %dx,%ax
    1149:	66 ba 00 8f          	mov    $0x8f00,%dx
    114d:	89 01                	mov    %eax,(%ecx)
    114f:	89 51 04             	mov    %edx,0x4(%ecx)
    1152:	83 c1 08             	add    $0x8,%ecx
    1155:	39 d9                	cmp    %ebx,%ecx
    1157:	75 ed                	jne    1146 <trap_init+0x19c>
    1159:	b8 00 00 08 00       	mov    $0x80000,%eax
    115e:	ba 00 00 00 00       	mov    $0x0,%edx
    1163:	66 89 d0             	mov    %dx,%ax
    1166:	66 ba 00 8f          	mov    $0x8f00,%dx
    116a:	a3 68 01 00 00       	mov    %eax,0x168
    116f:	89 15 6c 01 00 00    	mov    %edx,0x16c
    1175:	ba 21 00 00 00       	mov    $0x21,%edx
    117a:	ec                   	in     (%dx),%al
    117b:	eb 00                	jmp    117d <trap_init+0x1d3>
    117d:	eb 00                	jmp    117f <trap_init+0x1d5>
    117f:	25 fb 00 00 00       	and    $0xfb,%eax
    1184:	ee                   	out    %al,(%dx)
    1185:	eb 00                	jmp    1187 <trap_init+0x1dd>
    1187:	eb 00                	jmp    1189 <trap_init+0x1df>
    1189:	ba a1 00 00 00       	mov    $0xa1,%edx
    118e:	ec                   	in     (%dx),%al
    118f:	eb 00                	jmp    1191 <trap_init+0x1e7>
    1191:	eb 00                	jmp    1193 <trap_init+0x1e9>
    1193:	25 df 00 00 00       	and    $0xdf,%eax
    1198:	ee                   	out    %al,(%dx)
    1199:	b8 00 00 08 00       	mov    $0x80000,%eax
    119e:	ba 00 00 00 00       	mov    $0x0,%edx
    11a3:	66 89 d0             	mov    %dx,%ax
    11a6:	66 ba 00 8f          	mov    $0x8f00,%dx
    11aa:	a3 38 01 00 00       	mov    %eax,0x138
    11af:	89 15 3c 01 00 00    	mov    %edx,0x13c
    11b5:	5b                   	pop    %ebx
    11b6:	c3                   	ret    

000011b7 <ipi_intr_init>:
    11b7:	b8 00 00 08 00       	mov    $0x80000,%eax
    11bc:	ba 00 00 00 00       	mov    $0x0,%edx
    11c1:	66 89 d0             	mov    %dx,%ax
    11c4:	66 ba 00 8e          	mov    $0x8e00,%dx
    11c8:	a3 08 04 00 00       	mov    %eax,0x408
    11cd:	89 15 0c 04 00 00    	mov    %edx,0x40c
    11d3:	ba 00 00 00 00       	mov    $0x0,%edx
    11d8:	66 89 d0             	mov    %dx,%ax
    11db:	66 ba 00 8e          	mov    $0x8e00,%dx
    11df:	a3 10 04 00 00       	mov    %eax,0x410
    11e4:	89 15 14 04 00 00    	mov    %edx,0x414
    11ea:	c3                   	ret    

000011eb <divide_error>:
    11eb:	68 00 00 00 00       	push   $0x0
    11f0:	87 04 24             	xchg   %eax,(%esp)
    11f3:	53                   	push   %ebx
    11f4:	51                   	push   %ecx
    11f5:	52                   	push   %edx
    11f6:	57                   	push   %edi
    11f7:	56                   	push   %esi
    11f8:	55                   	push   %ebp
    11f9:	1e                   	push   %ds
    11fa:	06                   	push   %es
    11fb:	0f a0                	push   %fs
    11fd:	6a 00                	push   $0x0
    11ff:	8d 54 24 2c          	lea    0x2c(%esp),%edx
    1203:	52                   	push   %edx
    1204:	ba 10 00 00 00       	mov    $0x10,%edx
    1209:	8e da                	mov    %edx,%ds
    120b:	8e c2                	mov    %edx,%es
    120d:	8e e2                	mov    %edx,%fs
    120f:	ff d0                	call   *%eax
    1211:	83 c4 08             	add    $0x8,%esp
    1214:	0f a1                	pop    %fs
    1216:	07                   	pop    %es
    1217:	1f                   	pop    %ds
    1218:	5d                   	pop    %ebp
    1219:	5e                   	pop    %esi
    121a:	5f                   	pop    %edi
    121b:	5a                   	pop    %edx
    121c:	59                   	pop    %ecx
    121d:	5b                   	pop    %ebx
    121e:	58                   	pop    %eax
    121f:	cf                   	iret   

00001220 <debug>:
    1220:	68 00 00 00 00       	push   $0x0
    1225:	eb c9                	jmp    11f0 <divide_error+0x5>

00001227 <nmi>:
    1227:	68 00 00 00 00       	push   $0x0
    122c:	eb c2                	jmp    11f0 <divide_error+0x5>

0000122e <int3>:
    122e:	68 00 00 00 00       	push   $0x0
    1233:	eb bb                	jmp    11f0 <divide_error+0x5>

00001235 <overflow>:
    1235:	68 00 00 00 00       	push   $0x0
    123a:	eb b4                	jmp    11f0 <divide_error+0x5>

0000123c <bounds>:
    123c:	68 00 00 00 00       	push   $0x0
    1241:	eb ad                	jmp    11f0 <divide_error+0x5>

00001243 <invalid_op>:
    1243:	68 00 00 00 00       	push   $0x0
    1248:	eb a6                	jmp    11f0 <divide_error+0x5>

0000124a <coprocessor_segment_overrun>:
    124a:	68 00 00 00 00       	push   $0x0
    124f:	eb 9f                	jmp    11f0 <divide_error+0x5>

00001251 <reserved>:
    1251:	68 00 00 00 00       	push   $0x0
    1256:	eb 98                	jmp    11f0 <divide_error+0x5>

00001258 <irq13>:
    1258:	50                   	push   %eax
    1259:	30 c0                	xor    %al,%al
    125b:	e6 f0                	out    %al,$0xf0
    125d:	b0 20                	mov    $0x20,%al
    125f:	e6 20                	out    %al,$0x20
    1261:	eb 00                	jmp    1263 <irq13+0xb>
    1263:	eb 00                	jmp    1265 <irq13+0xd>
    1265:	e6 a0                	out    %al,$0xa0
    1267:	58                   	pop    %eax
    1268:	e9 fc ff ff ff       	jmp    1269 <irq13+0x11>

0000126d <double_fault>:
    126d:	68 00 00 00 00       	push   $0x0
    1272:	87 44 24 04          	xchg   %eax,0x4(%esp)
    1276:	87 1c 24             	xchg   %ebx,(%esp)
    1279:	51                   	push   %ecx
    127a:	52                   	push   %edx
    127b:	57                   	push   %edi
    127c:	56                   	push   %esi
    127d:	55                   	push   %ebp
    127e:	1e                   	push   %ds
    127f:	06                   	push   %es
    1280:	0f a0                	push   %fs
    1282:	50                   	push   %eax
    1283:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    1287:	50                   	push   %eax
    1288:	b8 10 00 00 00       	mov    $0x10,%eax
    128d:	8e d8                	mov    %eax,%ds
    128f:	8e c0                	mov    %eax,%es
    1291:	8e e0                	mov    %eax,%fs
    1293:	ff d3                	call   *%ebx
    1295:	83 c4 08             	add    $0x8,%esp
    1298:	0f a1                	pop    %fs
    129a:	07                   	pop    %es
    129b:	1f                   	pop    %ds
    129c:	5d                   	pop    %ebp
    129d:	5e                   	pop    %esi
    129e:	5f                   	pop    %edi
    129f:	5a                   	pop    %edx
    12a0:	59                   	pop    %ecx
    12a1:	5b                   	pop    %ebx
    12a2:	58                   	pop    %eax
    12a3:	cf                   	iret   

000012a4 <invalid_TSS>:
    12a4:	68 00 00 00 00       	push   $0x0
    12a9:	eb c7                	jmp    1272 <double_fault+0x5>

000012ab <segment_not_present>:
    12ab:	68 00 00 00 00       	push   $0x0
    12b0:	eb c0                	jmp    1272 <double_fault+0x5>

000012b2 <stack_segment>:
    12b2:	68 00 00 00 00       	push   $0x0
    12b7:	eb b9                	jmp    1272 <double_fault+0x5>

000012b9 <general_protection>:
    12b9:	68 00 00 00 00       	push   $0x0
    12be:	eb b2                	jmp    1272 <double_fault+0x5>

000012c0 <verify_area>:
    12c0:	56                   	push   %esi
    12c1:	53                   	push   %ebx
    12c2:	83 ec 04             	sub    $0x4,%esp
    12c5:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    12c9:	e8 fc ff ff ff       	call   12ca <verify_area+0xa>
    12ce:	89 d9                	mov    %ebx,%ecx
    12d0:	81 e1 ff 0f 00 00    	and    $0xfff,%ecx
    12d6:	03 4c 24 14          	add    0x14(%esp),%ecx
    12da:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
    12e0:	50                   	push   %eax
    12e1:	05 e0 02 00 00       	add    $0x2e0,%eax
    12e6:	83 c0 07             	add    $0x7,%eax
    12e9:	8a 30                	mov    (%eax),%dh
    12eb:	83 e8 03             	sub    $0x3,%eax
    12ee:	8a 10                	mov    (%eax),%dl
    12f0:	c1 e2 10             	shl    $0x10,%edx
    12f3:	83 e8 02             	sub    $0x2,%eax
    12f6:	66 8b 10             	mov    (%eax),%dx
    12f9:	58                   	pop    %eax
    12fa:	01 d3                	add    %edx,%ebx
    12fc:	85 c9                	test   %ecx,%ecx
    12fe:	7e 26                	jle    1326 <verify_area+0x66>
    1300:	83 e9 01             	sub    $0x1,%ecx
    1303:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
    1309:	8d b4 0b 00 10 00 00 	lea    0x1000(%ebx,%ecx,1),%esi
    1310:	83 ec 0c             	sub    $0xc,%esp
    1313:	53                   	push   %ebx
    1314:	e8 fc ff ff ff       	call   1315 <verify_area+0x55>
    1319:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    131f:	83 c4 10             	add    $0x10,%esp
    1322:	39 f3                	cmp    %esi,%ebx
    1324:	75 ea                	jne    1310 <verify_area+0x50>
    1326:	83 c4 04             	add    $0x4,%esp
    1329:	5b                   	pop    %ebx
    132a:	5e                   	pop    %esi
    132b:	c3                   	ret    

0000132c <copy_mem>:
    132c:	53                   	push   %ebx
    132d:	83 ec 08             	sub    $0x8,%esp
    1330:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    1334:	c7 83 18 02 00 00 00 	movl   $0x40000000,0x218(%ebx)
    133b:	00 00 40 
    133e:	ba 00 00 00 40       	mov    $0x40000000,%edx
    1343:	66 89 93 da 02 00 00 	mov    %dx,0x2da(%ebx)
    134a:	c1 ca 10             	ror    $0x10,%edx
    134d:	88 93 dc 02 00 00    	mov    %dl,0x2dc(%ebx)
    1353:	88 b3 df 02 00 00    	mov    %dh,0x2df(%ebx)
    1359:	c1 ca 10             	ror    $0x10,%edx
    135c:	66 89 93 e2 02 00 00 	mov    %dx,0x2e2(%ebx)
    1363:	c1 ca 10             	ror    $0x10,%edx
    1366:	88 93 e4 02 00 00    	mov    %dl,0x2e4(%ebx)
    136c:	88 b3 e7 02 00 00    	mov    %dh,0x2e7(%ebx)
    1372:	c1 ca 10             	ror    $0x10,%edx
    1375:	ba ff ff 0b 00       	mov    $0xbffff,%edx
    137a:	66 89 93 d8 02 00 00 	mov    %dx,0x2d8(%ebx)
    1381:	c1 ca 10             	ror    $0x10,%edx
    1384:	8a b3 de 02 00 00    	mov    0x2de(%ebx),%dh
    138a:	80 e6 f0             	and    $0xf0,%dh
    138d:	08 f2                	or     %dh,%dl
    138f:	88 93 de 02 00 00    	mov    %dl,0x2de(%ebx)
    1395:	c1 ca 10             	ror    $0x10,%edx
    1398:	66 89 93 e0 02 00 00 	mov    %dx,0x2e0(%ebx)
    139f:	c1 ca 10             	ror    $0x10,%edx
    13a2:	8a b3 e6 02 00 00    	mov    0x2e6(%ebx),%dh
    13a8:	80 e6 f0             	and    $0xf0,%dh
    13ab:	08 f2                	or     %dh,%dl
    13ad:	88 93 e6 02 00 00    	mov    %dl,0x2e6(%ebx)
    13b3:	c1 ca 10             	ror    $0x10,%edx
    13b6:	53                   	push   %ebx
    13b7:	68 00 00 00 c0       	push   $0xc0000000
    13bc:	68 00 00 00 40       	push   $0x40000000
    13c1:	6a 00                	push   $0x0
    13c3:	e8 fc ff ff ff       	call   13c4 <copy_mem+0x98>
    13c8:	83 c4 10             	add    $0x10,%esp
    13cb:	85 c0                	test   %eax,%eax
    13cd:	74 1b                	je     13ea <copy_mem+0xbe>
    13cf:	83 ec 04             	sub    $0x4,%esp
    13d2:	53                   	push   %ebx
    13d3:	68 00 00 00 c0       	push   $0xc0000000
    13d8:	68 00 00 00 40       	push   $0x40000000
    13dd:	e8 fc ff ff ff       	call   13de <copy_mem+0xb2>
    13e2:	83 c4 10             	add    $0x10,%esp
    13e5:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
    13ea:	83 c4 08             	add    $0x8,%esp
    13ed:	5b                   	pop    %ebx
    13ee:	c3                   	ret    

000013ef <copy_process>:
    13ef:	55                   	push   %ebp
    13f0:	57                   	push   %edi
    13f1:	56                   	push   %esi
    13f2:	53                   	push   %ebx
    13f3:	83 ec 0c             	sub    $0xc,%esp
    13f6:	e8 fc ff ff ff       	call   13f7 <copy_process+0x8>
    13fb:	89 c5                	mov    %eax,%ebp
    13fd:	83 ec 0c             	sub    $0xc,%esp
    1400:	6a 01                	push   $0x1
    1402:	e8 fc ff ff ff       	call   1403 <copy_process+0x14>
    1407:	89 c3                	mov    %eax,%ebx
    1409:	83 c4 10             	add    $0x10,%esp
    140c:	85 c0                	test   %eax,%eax
    140e:	0f 84 c7 02 00 00    	je     16db <copy_process+0x2ec>
    1414:	8b 74 24 20          	mov    0x20(%esp),%esi
    1418:	89 04 b5 00 00 00 00 	mov    %eax,0x0(,%esi,4)
    141f:	b9 f2 00 00 00       	mov    $0xf2,%ecx
    1424:	89 c7                	mov    %eax,%edi
    1426:	89 ee                	mov    %ebp,%esi
    1428:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    142a:	8b 44 24 20          	mov    0x20(%esp),%eax
    142e:	89 83 c0 03 00 00    	mov    %eax,0x3c0(%ebx)
    1434:	8b 85 c0 03 00 00    	mov    0x3c0(%ebp),%eax
    143a:	89 83 c4 03 00 00    	mov    %eax,0x3c4(%ebx)
    1440:	c7 83 bc 03 00 00 00 	movl   $0x0,0x3bc(%ebx)
    1447:	00 00 00 
    144a:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
    1450:	a1 00 00 00 00       	mov    0x0,%eax
    1455:	89 83 2c 02 00 00    	mov    %eax,0x22c(%ebx)
    145b:	8b 85 2c 02 00 00    	mov    0x22c(%ebp),%eax
    1461:	89 83 30 02 00 00    	mov    %eax,0x230(%ebx)
    1467:	8b 43 08             	mov    0x8(%ebx),%eax
    146a:	89 43 04             	mov    %eax,0x4(%ebx)
    146d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    1474:	c7 83 4c 02 00 00 00 	movl   $0x0,0x24c(%ebx)
    147b:	00 00 00 
    147e:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
    1485:	00 00 00 
    1488:	c7 83 54 02 00 00 00 	movl   $0x0,0x254(%ebx)
    148f:	00 00 00 
    1492:	c7 83 50 02 00 00 00 	movl   $0x0,0x250(%ebx)
    1499:	00 00 00 
    149c:	c7 83 5c 02 00 00 00 	movl   $0x0,0x25c(%ebx)
    14a3:	00 00 00 
    14a6:	c7 83 58 02 00 00 00 	movl   $0x0,0x258(%ebx)
    14ad:	00 00 00 
    14b0:	a1 00 00 00 00       	mov    0x0,%eax
    14b5:	89 83 60 02 00 00    	mov    %eax,0x260(%ebx)
    14bb:	c7 83 e8 02 00 00 00 	movl   $0x0,0x2e8(%ebx)
    14c2:	00 00 00 
    14c5:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
    14cb:	89 83 ec 02 00 00    	mov    %eax,0x2ec(%ebx)
    14d1:	c7 83 f0 02 00 00 10 	movl   $0x10,0x2f0(%ebx)
    14d8:	00 00 00 
    14db:	8b 44 24 50          	mov    0x50(%esp),%eax
    14df:	89 83 08 03 00 00    	mov    %eax,0x308(%ebx)
    14e5:	8b 44 24 58          	mov    0x58(%esp),%eax
    14e9:	89 83 0c 03 00 00    	mov    %eax,0x30c(%ebx)
    14ef:	c7 83 10 03 00 00 00 	movl   $0x0,0x310(%ebx)
    14f6:	00 00 00 
    14f9:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    14fd:	89 83 14 03 00 00    	mov    %eax,0x314(%ebx)
    1503:	8b 44 24 40          	mov    0x40(%esp),%eax
    1507:	89 83 18 03 00 00    	mov    %eax,0x318(%ebx)
    150d:	8b 44 24 38          	mov    0x38(%esp),%eax
    1511:	89 83 1c 03 00 00    	mov    %eax,0x31c(%ebx)
    1517:	8b 44 24 5c          	mov    0x5c(%esp),%eax
    151b:	89 83 20 03 00 00    	mov    %eax,0x320(%ebx)
    1521:	8b 44 24 24          	mov    0x24(%esp),%eax
    1525:	89 83 24 03 00 00    	mov    %eax,0x324(%ebx)
    152b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    152f:	89 83 28 03 00 00    	mov    %eax,0x328(%ebx)
    1535:	8b 44 24 28          	mov    0x28(%esp),%eax
    1539:	89 83 2c 03 00 00    	mov    %eax,0x32c(%ebx)
    153f:	0f b7 44 24 48       	movzwl 0x48(%esp),%eax
    1544:	89 83 30 03 00 00    	mov    %eax,0x330(%ebx)
    154a:	0f b7 44 24 54       	movzwl 0x54(%esp),%eax
    154f:	89 83 34 03 00 00    	mov    %eax,0x334(%ebx)
    1555:	0f b7 44 24 60       	movzwl 0x60(%esp),%eax
    155a:	89 83 38 03 00 00    	mov    %eax,0x338(%ebx)
    1560:	0f b7 44 24 4c       	movzwl 0x4c(%esp),%eax
    1565:	89 83 3c 03 00 00    	mov    %eax,0x33c(%ebx)
    156b:	0f b7 44 24 44       	movzwl 0x44(%esp),%eax
    1570:	89 83 40 03 00 00    	mov    %eax,0x340(%ebx)
    1576:	0f b7 44 24 30       	movzwl 0x30(%esp),%eax
    157b:	89 83 44 03 00 00    	mov    %eax,0x344(%ebx)
    1581:	8b 44 24 20          	mov    0x20(%esp),%eax
    1585:	c1 e0 04             	shl    $0x4,%eax
    1588:	83 c0 28             	add    $0x28,%eax
    158b:	89 83 48 03 00 00    	mov    %eax,0x348(%ebx)
    1591:	c7 83 4c 03 00 00 00 	movl   $0x80000000,0x34c(%ebx)
    1598:	00 00 80 
    159b:	3b 2d 00 00 00 00    	cmp    0x0,%ebp
    15a1:	75 08                	jne    15ab <copy_process+0x1bc>
    15a3:	0f 06                	clts   
    15a5:	dd b3 50 03 00 00    	fnsave 0x350(%ebx)
    15ab:	83 ec 08             	sub    $0x8,%esp
    15ae:	53                   	push   %ebx
    15af:	ff 74 24 2c          	pushl  0x2c(%esp)
    15b3:	e8 fc ff ff ff       	call   15b4 <copy_process+0x1c5>
    15b8:	83 c4 10             	add    $0x10,%esp
    15bb:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    15c1:	8d 8b d0 02 00 00    	lea    0x2d0(%ebx),%ecx
    15c7:	85 c0                	test   %eax,%eax
    15c9:	74 44                	je     160f <copy_process+0x220>
    15cb:	8b 44 24 20          	mov    0x20(%esp),%eax
    15cf:	c7 04 85 00 00 00 00 	movl   $0x0,0x0(,%eax,4)
    15d6:	00 00 00 00 
    15da:	83 ec 0c             	sub    $0xc,%esp
    15dd:	53                   	push   %ebx
    15de:	e8 fc ff ff ff       	call   15df <copy_process+0x1f0>
    15e3:	89 c2                	mov    %eax,%edx
    15e5:	83 c4 10             	add    $0x10,%esp
    15e8:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    15ed:	85 d2                	test   %edx,%edx
    15ef:	0f 85 eb 00 00 00    	jne    16e0 <copy_process+0x2f1>
    15f5:	83 ec 0c             	sub    $0xc,%esp
    15f8:	68 10 01 00 00       	push   $0x110
    15fd:	e8 fc ff ff ff       	call   15fe <copy_process+0x20f>
    1602:	83 c4 10             	add    $0x10,%esp
    1605:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    160a:	e9 d1 00 00 00       	jmp    16e0 <copy_process+0x2f1>
    160f:	8b 02                	mov    (%edx),%eax
    1611:	85 c0                	test   %eax,%eax
    1613:	74 05                	je     161a <copy_process+0x22b>
    1615:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
    161a:	83 c2 04             	add    $0x4,%edx
    161d:	39 ca                	cmp    %ecx,%edx
    161f:	75 ee                	jne    160f <copy_process+0x220>
    1621:	8b 85 70 02 00 00    	mov    0x270(%ebp),%eax
    1627:	85 c0                	test   %eax,%eax
    1629:	74 05                	je     1630 <copy_process+0x241>
    162b:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    1630:	8b 85 74 02 00 00    	mov    0x274(%ebp),%eax
    1636:	85 c0                	test   %eax,%eax
    1638:	74 05                	je     163f <copy_process+0x250>
    163a:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    163f:	8b 85 78 02 00 00    	mov    0x278(%ebp),%eax
    1645:	85 c0                	test   %eax,%eax
    1647:	74 05                	je     164e <copy_process+0x25f>
    1649:	66 83 40 30 01       	addw   $0x1,0x30(%eax)
    164e:	8b 44 24 20          	mov    0x20(%esp),%eax
    1652:	8d 54 00 04          	lea    0x4(%eax,%eax,1),%edx
    1656:	8d 83 e8 02 00 00    	lea    0x2e8(%ebx),%eax
    165c:	66 c7 04 d5 00 00 00 	movw   $0x68,0x0(,%edx,8)
    1663:	00 68 00 
    1666:	66 89 04 d5 02 00 00 	mov    %ax,0x2(,%edx,8)
    166d:	00 
    166e:	c1 c8 10             	ror    $0x10,%eax
    1671:	88 04 d5 04 00 00 00 	mov    %al,0x4(,%edx,8)
    1678:	c6 04 d5 05 00 00 00 	movb   $0x89,0x5(,%edx,8)
    167f:	89 
    1680:	c6 04 d5 06 00 00 00 	movb   $0x0,0x6(,%edx,8)
    1687:	00 
    1688:	88 24 d5 07 00 00 00 	mov    %ah,0x7(,%edx,8)
    168f:	c1 c8 10             	ror    $0x10,%eax
    1692:	8d 83 d0 02 00 00    	lea    0x2d0(%ebx),%eax
    1698:	66 c7 04 d5 08 00 00 	movw   $0x68,0x8(,%edx,8)
    169f:	00 68 00 
    16a2:	66 89 04 d5 0a 00 00 	mov    %ax,0xa(,%edx,8)
    16a9:	00 
    16aa:	c1 c8 10             	ror    $0x10,%eax
    16ad:	88 04 d5 0c 00 00 00 	mov    %al,0xc(,%edx,8)
    16b4:	c6 04 d5 0d 00 00 00 	movb   $0x82,0xd(,%edx,8)
    16bb:	82 
    16bc:	c6 04 d5 0e 00 00 00 	movb   $0x0,0xe(,%edx,8)
    16c3:	00 
    16c4:	88 24 d5 0f 00 00 00 	mov    %ah,0xf(,%edx,8)
    16cb:	c1 c8 10             	ror    $0x10,%eax
    16ce:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    16d4:	a1 00 00 00 00       	mov    0x0,%eax
    16d9:	eb 05                	jmp    16e0 <copy_process+0x2f1>
    16db:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    16e0:	83 c4 0c             	add    $0xc,%esp
    16e3:	5b                   	pop    %ebx
    16e4:	5e                   	pop    %esi
    16e5:	5f                   	pop    %edi
    16e6:	5d                   	pop    %ebp
    16e7:	c3                   	ret    

000016e8 <find_empty_process>:
    16e8:	56                   	push   %esi
    16e9:	53                   	push   %ebx
    16ea:	83 ec 10             	sub    $0x10,%esp
    16ed:	68 00 00 00 00       	push   $0x0
    16f2:	e8 fc ff ff ff       	call   16f3 <find_empty_process+0xb>
    16f7:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    16fd:	83 c4 10             	add    $0x10,%esp
    1700:	be 01 00 00 00       	mov    $0x1,%esi
    1705:	bb 00 01 00 00       	mov    $0x100,%ebx
    170a:	83 c1 01             	add    $0x1,%ecx
    170d:	0f 48 ce             	cmovs  %esi,%ecx
    1710:	b8 00 00 00 00       	mov    $0x0,%eax
    1715:	8b 10                	mov    (%eax),%edx
    1717:	85 d2                	test   %edx,%edx
    1719:	74 08                	je     1723 <find_empty_process+0x3b>
    171b:	39 8a 2c 02 00 00    	cmp    %ecx,0x22c(%edx)
    1721:	74 e7                	je     170a <find_empty_process+0x22>
    1723:	83 c0 04             	add    $0x4,%eax
    1726:	39 c3                	cmp    %eax,%ebx
    1728:	75 eb                	jne    1715 <find_empty_process+0x2d>
    172a:	89 0d 00 00 00 00    	mov    %ecx,0x0
    1730:	83 3d 04 00 00 00 00 	cmpl   $0x0,0x4
    1737:	74 11                	je     174a <find_empty_process+0x62>
    1739:	bb 02 00 00 00       	mov    $0x2,%ebx
    173e:	83 3c 9d 00 00 00 00 	cmpl   $0x0,0x0(,%ebx,4)
    1745:	00 
    1746:	75 1b                	jne    1763 <find_empty_process+0x7b>
    1748:	eb 05                	jmp    174f <find_empty_process+0x67>
    174a:	bb 01 00 00 00       	mov    $0x1,%ebx
    174f:	83 ec 0c             	sub    $0xc,%esp
    1752:	68 00 00 00 00       	push   $0x0
    1757:	e8 fc ff ff ff       	call   1758 <find_empty_process+0x70>
    175c:	83 c4 10             	add    $0x10,%esp
    175f:	89 d8                	mov    %ebx,%eax
    1761:	eb 1d                	jmp    1780 <find_empty_process+0x98>
    1763:	83 c3 01             	add    $0x1,%ebx
    1766:	83 fb 40             	cmp    $0x40,%ebx
    1769:	75 d3                	jne    173e <find_empty_process+0x56>
    176b:	83 ec 0c             	sub    $0xc,%esp
    176e:	68 00 00 00 00       	push   $0x0
    1773:	e8 fc ff ff ff       	call   1774 <find_empty_process+0x8c>
    1778:	83 c4 10             	add    $0x10,%esp
    177b:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
    1780:	83 c4 04             	add    $0x4,%esp
    1783:	5b                   	pop    %ebx
    1784:	5e                   	pop    %esi
    1785:	c3                   	ret    

00001786 <panic>:
    1786:	83 ec 14             	sub    $0x14,%esp
    1789:	ff 74 24 18          	pushl  0x18(%esp)
    178d:	68 bc 01 00 00       	push   $0x1bc
    1792:	e8 fc ff ff ff       	call   1793 <panic+0xd>
    1797:	e8 fc ff ff ff       	call   1798 <panic+0x12>
    179c:	83 c4 10             	add    $0x10,%esp
    179f:	39 05 00 00 00 00    	cmp    %eax,0x0
    17a5:	75 12                	jne    17b9 <panic+0x33>
    17a7:	83 ec 0c             	sub    $0xc,%esp
    17aa:	68 3c 01 00 00       	push   $0x13c
    17af:	e8 fc ff ff ff       	call   17b0 <panic+0x2a>
    17b4:	83 c4 10             	add    $0x10,%esp
    17b7:	eb 05                	jmp    17be <panic+0x38>
    17b9:	e8 fc ff ff ff       	call   17ba <panic+0x34>
    17be:	eb fe                	jmp    17be <panic+0x38>

000017c0 <printk>:
    17c0:	53                   	push   %ebx
    17c1:	83 ec 14             	sub    $0x14,%esp
    17c4:	68 00 00 00 00       	push   $0x0
    17c9:	e8 fc ff ff ff       	call   17ca <printk+0xa>
    17ce:	83 c4 0c             	add    $0xc,%esp
    17d1:	8d 44 24 18          	lea    0x18(%esp),%eax
    17d5:	50                   	push   %eax
    17d6:	ff 74 24 18          	pushl  0x18(%esp)
    17da:	68 00 00 00 00       	push   $0x0
    17df:	e8 fc ff ff ff       	call   17e0 <printk+0x20>
    17e4:	89 c3                	mov    %eax,%ebx
    17e6:	0f a0                	push   %fs
    17e8:	1e                   	push   %ds
    17e9:	0f a1                	pop    %fs
    17eb:	53                   	push   %ebx
    17ec:	68 00 00 00 00       	push   $0x0
    17f1:	6a 00                	push   $0x0
    17f3:	e8 fc ff ff ff       	call   17f4 <printk+0x34>
    17f8:	83 c4 08             	add    $0x8,%esp
    17fb:	5b                   	pop    %ebx
    17fc:	0f a1                	pop    %fs
    17fe:	89 d8                	mov    %ebx,%eax
    1800:	83 c4 18             	add    $0x18,%esp
    1803:	5b                   	pop    %ebx
    1804:	c3                   	ret    

00001805 <cpy_str_to_kernel>:
    1805:	57                   	push   %edi
    1806:	56                   	push   %esi
    1807:	8b 44 24 0c          	mov    0xc(%esp),%eax
    180b:	8b 74 24 10          	mov    0x10(%esp),%esi
    180f:	89 c7                	mov    %eax,%edi
    1811:	1e                   	push   %ds
    1812:	0f a0                	push   %fs
    1814:	1f                   	pop    %ds
    1815:	fc                   	cld    
    1816:	ac                   	lods   %ds:(%esi),%al
    1817:	aa                   	stos   %al,%es:(%edi)
    1818:	84 c0                	test   %al,%al
    181a:	75 fa                	jne    1816 <cpy_str_to_kernel+0x11>
    181c:	1f                   	pop    %ds
    181d:	5e                   	pop    %esi
    181e:	5f                   	pop    %edi
    181f:	c3                   	ret    
    1820:	55                   	push   %ebp
    1821:	57                   	push   %edi
    1822:	56                   	push   %esi
    1823:	53                   	push   %ebx
    1824:	83 ec 38             	sub    $0x38,%esp
    1827:	89 c3                	mov    %eax,%ebx
    1829:	89 d5                	mov    %edx,%ebp
    182b:	8b 44 24 54          	mov    0x54(%esp),%eax
    182f:	83 e0 40             	and    $0x40,%eax
    1832:	b8 84 01 00 00       	mov    $0x184,%eax
    1837:	be 5c 01 00 00       	mov    $0x15c,%esi
    183c:	0f 45 f0             	cmovne %eax,%esi
    183f:	8b 54 24 54          	mov    0x54(%esp),%edx
    1843:	83 e2 10             	and    $0x10,%edx
    1846:	8b 44 24 54          	mov    0x54(%esp),%eax
    184a:	83 e0 fe             	and    $0xfffffffe,%eax
    184d:	85 d2                	test   %edx,%edx
    184f:	0f 44 44 24 54       	cmove  0x54(%esp),%eax
    1854:	89 44 24 54          	mov    %eax,0x54(%esp)
    1858:	8d 41 fe             	lea    -0x2(%ecx),%eax
    185b:	83 f8 22             	cmp    $0x22,%eax
    185e:	0f 87 8a 01 00 00    	ja     19ee <cpy_str_to_kernel+0x1e9>
    1864:	89 cf                	mov    %ecx,%edi
    1866:	8b 44 24 54          	mov    0x54(%esp),%eax
    186a:	83 e0 01             	and    $0x1,%eax
    186d:	83 f8 01             	cmp    $0x1,%eax
    1870:	19 c0                	sbb    %eax,%eax
    1872:	83 e0 f0             	and    $0xfffffff0,%eax
    1875:	83 c0 30             	add    $0x30,%eax
    1878:	88 44 24 07          	mov    %al,0x7(%esp)
    187c:	f6 44 24 54 02       	testb  $0x2,0x54(%esp)
    1881:	74 15                	je     1898 <cpy_str_to_kernel+0x93>
    1883:	89 e8                	mov    %ebp,%eax
    1885:	c1 e8 1f             	shr    $0x1f,%eax
    1888:	84 c0                	test   %al,%al
    188a:	74 0c                	je     1898 <cpy_str_to_kernel+0x93>
    188c:	f7 dd                	neg    %ebp
    188e:	c6 44 24 06 2d       	movb   $0x2d,0x6(%esp)
    1893:	e9 6d 01 00 00       	jmp    1a05 <cpy_str_to_kernel+0x200>
    1898:	f6 44 24 54 04       	testb  $0x4,0x54(%esp)
    189d:	0f 85 56 01 00 00    	jne    19f9 <cpy_str_to_kernel+0x1f4>
    18a3:	f6 44 24 54 08       	testb  $0x8,0x54(%esp)
    18a8:	0f 85 52 01 00 00    	jne    1a00 <cpy_str_to_kernel+0x1fb>
    18ae:	c6 44 24 06 00       	movb   $0x0,0x6(%esp)
    18b3:	8b 44 24 54          	mov    0x54(%esp),%eax
    18b7:	83 e0 20             	and    $0x20,%eax
    18ba:	89 04 24             	mov    %eax,(%esp)
    18bd:	0f 84 4c 01 00 00    	je     1a0f <cpy_str_to_kernel+0x20a>
    18c3:	83 ff 10             	cmp    $0x10,%edi
    18c6:	75 07                	jne    18cf <cpy_str_to_kernel+0xca>
    18c8:	83 6c 24 4c 02       	subl   $0x2,0x4c(%esp)
    18cd:	eb 0d                	jmp    18dc <cpy_str_to_kernel+0xd7>
    18cf:	83 ff 08             	cmp    $0x8,%edi
    18d2:	0f 94 c0             	sete   %al
    18d5:	0f b6 c0             	movzbl %al,%eax
    18d8:	29 44 24 4c          	sub    %eax,0x4c(%esp)
    18dc:	85 ed                	test   %ebp,%ebp
    18de:	75 0c                	jne    18ec <cpy_str_to_kernel+0xe7>
    18e0:	c6 44 24 14 30       	movb   $0x30,0x14(%esp)
    18e5:	b9 01 00 00 00       	mov    $0x1,%ecx
    18ea:	eb 1f                	jmp    190b <cpy_str_to_kernel+0x106>
    18ec:	b9 00 00 00 00       	mov    $0x0,%ecx
    18f1:	83 c1 01             	add    $0x1,%ecx
    18f4:	89 e8                	mov    %ebp,%eax
    18f6:	ba 00 00 00 00       	mov    $0x0,%edx
    18fb:	f7 f7                	div    %edi
    18fd:	89 c5                	mov    %eax,%ebp
    18ff:	0f b6 14 16          	movzbl (%esi,%edx,1),%edx
    1903:	88 54 0c 13          	mov    %dl,0x13(%esp,%ecx,1)
    1907:	85 c0                	test   %eax,%eax
    1909:	75 e6                	jne    18f1 <cpy_str_to_kernel+0xec>
    190b:	3b 4c 24 50          	cmp    0x50(%esp),%ecx
    190f:	89 cd                	mov    %ecx,%ebp
    1911:	0f 4c 6c 24 50       	cmovl  0x50(%esp),%ebp
    1916:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    191a:	29 e8                	sub    %ebp,%eax
    191c:	f6 44 24 54 11       	testb  $0x11,0x54(%esp)
    1921:	75 20                	jne    1943 <cpy_str_to_kernel+0x13e>
    1923:	8d 50 ff             	lea    -0x1(%eax),%edx
    1926:	85 c0                	test   %eax,%eax
    1928:	7e 17                	jle    1941 <cpy_str_to_kernel+0x13c>
    192a:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    192d:	83 c3 01             	add    $0x1,%ebx
    1930:	c6 43 ff 20          	movb   $0x20,-0x1(%ebx)
    1934:	39 d3                	cmp    %edx,%ebx
    1936:	75 f5                	jne    192d <cpy_str_to_kernel+0x128>
    1938:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    193d:	89 d3                	mov    %edx,%ebx
    193f:	eb 02                	jmp    1943 <cpy_str_to_kernel+0x13e>
    1941:	89 d0                	mov    %edx,%eax
    1943:	0f b6 54 24 06       	movzbl 0x6(%esp),%edx
    1948:	84 d2                	test   %dl,%dl
    194a:	74 05                	je     1951 <cpy_str_to_kernel+0x14c>
    194c:	88 13                	mov    %dl,(%ebx)
    194e:	8d 5b 01             	lea    0x1(%ebx),%ebx
    1951:	83 3c 24 00          	cmpl   $0x0,(%esp)
    1955:	74 1f                	je     1976 <cpy_str_to_kernel+0x171>
    1957:	83 ff 08             	cmp    $0x8,%edi
    195a:	75 08                	jne    1964 <cpy_str_to_kernel+0x15f>
    195c:	c6 03 30             	movb   $0x30,(%ebx)
    195f:	8d 5b 01             	lea    0x1(%ebx),%ebx
    1962:	eb 12                	jmp    1976 <cpy_str_to_kernel+0x171>
    1964:	83 ff 10             	cmp    $0x10,%edi
    1967:	75 0d                	jne    1976 <cpy_str_to_kernel+0x171>
    1969:	c6 03 30             	movb   $0x30,(%ebx)
    196c:	0f b6 56 21          	movzbl 0x21(%esi),%edx
    1970:	88 53 01             	mov    %dl,0x1(%ebx)
    1973:	8d 5b 02             	lea    0x2(%ebx),%ebx
    1976:	f6 44 24 54 10       	testb  $0x10,0x54(%esp)
    197b:	75 23                	jne    19a0 <cpy_str_to_kernel+0x19b>
    197d:	8d 50 ff             	lea    -0x1(%eax),%edx
    1980:	85 c0                	test   %eax,%eax
    1982:	7e 1a                	jle    199e <cpy_str_to_kernel+0x199>
    1984:	01 d8                	add    %ebx,%eax
    1986:	0f b6 54 24 07       	movzbl 0x7(%esp),%edx
    198b:	83 c3 01             	add    $0x1,%ebx
    198e:	88 53 ff             	mov    %dl,-0x1(%ebx)
    1991:	39 c3                	cmp    %eax,%ebx
    1993:	75 f6                	jne    198b <cpy_str_to_kernel+0x186>
    1995:	89 c3                	mov    %eax,%ebx
    1997:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    199c:	eb 02                	jmp    19a0 <cpy_str_to_kernel+0x19b>
    199e:	89 d0                	mov    %edx,%eax
    19a0:	39 e9                	cmp    %ebp,%ecx
    19a2:	7d 13                	jge    19b7 <cpy_str_to_kernel+0x1b2>
    19a4:	89 ef                	mov    %ebp,%edi
    19a6:	29 cf                	sub    %ecx,%edi
    19a8:	01 df                	add    %ebx,%edi
    19aa:	83 c3 01             	add    $0x1,%ebx
    19ad:	c6 43 ff 30          	movb   $0x30,-0x1(%ebx)
    19b1:	39 df                	cmp    %ebx,%edi
    19b3:	75 f5                	jne    19aa <cpy_str_to_kernel+0x1a5>
    19b5:	eb 02                	jmp    19b9 <cpy_str_to_kernel+0x1b4>
    19b7:	89 df                	mov    %ebx,%edi
    19b9:	85 c9                	test   %ecx,%ecx
    19bb:	7e 1e                	jle    19db <cpy_str_to_kernel+0x1d6>
    19bd:	89 ce                	mov    %ecx,%esi
    19bf:	8d 54 0c 13          	lea    0x13(%esp,%ecx,1),%edx
    19c3:	8d 6c 24 13          	lea    0x13(%esp),%ebp
    19c7:	89 f9                	mov    %edi,%ecx
    19c9:	83 c1 01             	add    $0x1,%ecx
    19cc:	0f b6 1a             	movzbl (%edx),%ebx
    19cf:	88 59 ff             	mov    %bl,-0x1(%ecx)
    19d2:	83 ea 01             	sub    $0x1,%edx
    19d5:	39 d5                	cmp    %edx,%ebp
    19d7:	75 f0                	jne    19c9 <cpy_str_to_kernel+0x1c4>
    19d9:	01 f7                	add    %esi,%edi
    19db:	85 c0                	test   %eax,%eax
    19dd:	7e 16                	jle    19f5 <cpy_str_to_kernel+0x1f0>
    19df:	01 f8                	add    %edi,%eax
    19e1:	83 c7 01             	add    $0x1,%edi
    19e4:	c6 47 ff 20          	movb   $0x20,-0x1(%edi)
    19e8:	39 f8                	cmp    %edi,%eax
    19ea:	75 f5                	jne    19e1 <cpy_str_to_kernel+0x1dc>
    19ec:	eb 2e                	jmp    1a1c <cpy_str_to_kernel+0x217>
    19ee:	b8 00 00 00 00       	mov    $0x0,%eax
    19f3:	eb 27                	jmp    1a1c <cpy_str_to_kernel+0x217>
    19f5:	89 f8                	mov    %edi,%eax
    19f7:	eb 23                	jmp    1a1c <cpy_str_to_kernel+0x217>
    19f9:	c6 44 24 06 2b       	movb   $0x2b,0x6(%esp)
    19fe:	eb 05                	jmp    1a05 <cpy_str_to_kernel+0x200>
    1a00:	c6 44 24 06 20       	movb   $0x20,0x6(%esp)
    1a05:	83 6c 24 4c 01       	subl   $0x1,0x4c(%esp)
    1a0a:	e9 a4 fe ff ff       	jmp    18b3 <cpy_str_to_kernel+0xae>
    1a0f:	85 ed                	test   %ebp,%ebp
    1a11:	0f 84 c9 fe ff ff    	je     18e0 <cpy_str_to_kernel+0xdb>
    1a17:	e9 d0 fe ff ff       	jmp    18ec <cpy_str_to_kernel+0xe7>
    1a1c:	83 c4 38             	add    $0x38,%esp
    1a1f:	5b                   	pop    %ebx
    1a20:	5e                   	pop    %esi
    1a21:	5f                   	pop    %edi
    1a22:	5d                   	pop    %ebp
    1a23:	c3                   	ret    

00001a24 <vsprintf>:
    1a24:	55                   	push   %ebp
    1a25:	57                   	push   %edi
    1a26:	56                   	push   %esi
    1a27:	53                   	push   %ebx
    1a28:	83 ec 08             	sub    $0x8,%esp
    1a2b:	8b 44 24 20          	mov    0x20(%esp),%eax
    1a2f:	0f b6 10             	movzbl (%eax),%edx
    1a32:	84 d2                	test   %dl,%dl
    1a34:	0f 84 58 03 00 00    	je     1d92 <vsprintf+0x36e>
    1a3a:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1a3e:	80 fa 25             	cmp    $0x25,%dl
    1a41:	74 0d                	je     1a50 <vsprintf+0x2c>
    1a43:	88 55 00             	mov    %dl,0x0(%ebp)
    1a46:	89 c3                	mov    %eax,%ebx
    1a48:	8d 6d 01             	lea    0x1(%ebp),%ebp
    1a4b:	e9 31 03 00 00       	jmp    1d81 <vsprintf+0x35d>
    1a50:	be 00 00 00 00       	mov    $0x0,%esi
    1a55:	83 c0 01             	add    $0x1,%eax
    1a58:	0f b6 08             	movzbl (%eax),%ecx
    1a5b:	8d 51 e0             	lea    -0x20(%ecx),%edx
    1a5e:	80 fa 10             	cmp    $0x10,%dl
    1a61:	77 23                	ja     1a86 <vsprintf+0x62>
    1a63:	0f b6 d2             	movzbl %dl,%edx
    1a66:	ff 24 95 00 00 00 00 	jmp    *0x0(,%edx,4)
    1a6d:	83 ce 10             	or     $0x10,%esi
    1a70:	eb e3                	jmp    1a55 <vsprintf+0x31>
    1a72:	83 ce 04             	or     $0x4,%esi
    1a75:	eb de                	jmp    1a55 <vsprintf+0x31>
    1a77:	83 ce 08             	or     $0x8,%esi
    1a7a:	eb d9                	jmp    1a55 <vsprintf+0x31>
    1a7c:	83 ce 20             	or     $0x20,%esi
    1a7f:	eb d4                	jmp    1a55 <vsprintf+0x31>
    1a81:	83 ce 01             	or     $0x1,%esi
    1a84:	eb cf                	jmp    1a55 <vsprintf+0x31>
    1a86:	8d 51 d0             	lea    -0x30(%ecx),%edx
    1a89:	80 fa 09             	cmp    $0x9,%dl
    1a8c:	77 21                	ja     1aaf <vsprintf+0x8b>
    1a8e:	ba 00 00 00 00       	mov    $0x0,%edx
    1a93:	83 c0 01             	add    $0x1,%eax
    1a96:	8d 14 92             	lea    (%edx,%edx,4),%edx
    1a99:	0f be c9             	movsbl %cl,%ecx
    1a9c:	8d 54 51 d0          	lea    -0x30(%ecx,%edx,2),%edx
    1aa0:	0f b6 08             	movzbl (%eax),%ecx
    1aa3:	8d 59 d0             	lea    -0x30(%ecx),%ebx
    1aa6:	80 fb 09             	cmp    $0x9,%bl
    1aa9:	76 e8                	jbe    1a93 <vsprintf+0x6f>
    1aab:	89 c3                	mov    %eax,%ebx
    1aad:	eb 27                	jmp    1ad6 <vsprintf+0xb2>
    1aaf:	89 c3                	mov    %eax,%ebx
    1ab1:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    1ab6:	80 f9 2a             	cmp    $0x2a,%cl
    1ab9:	75 1b                	jne    1ad6 <vsprintf+0xb2>
    1abb:	8b 7c 24 24          	mov    0x24(%esp),%edi
    1abf:	8d 4f 04             	lea    0x4(%edi),%ecx
    1ac2:	8b 17                	mov    (%edi),%edx
    1ac4:	85 d2                	test   %edx,%edx
    1ac6:	0f 89 cc 02 00 00    	jns    1d98 <vsprintf+0x374>
    1acc:	f7 da                	neg    %edx
    1ace:	83 ce 10             	or     $0x10,%esi
    1ad1:	e9 c2 02 00 00       	jmp    1d98 <vsprintf+0x374>
    1ad6:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1add:	80 3b 2e             	cmpb   $0x2e,(%ebx)
    1ae0:	75 53                	jne    1b35 <vsprintf+0x111>
    1ae2:	8d 7b 01             	lea    0x1(%ebx),%edi
    1ae5:	0f b6 43 01          	movzbl 0x1(%ebx),%eax
    1ae9:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1aec:	80 f9 09             	cmp    $0x9,%cl
    1aef:	77 1f                	ja     1b10 <vsprintf+0xec>
    1af1:	b9 00 00 00 00       	mov    $0x0,%ecx
    1af6:	83 c7 01             	add    $0x1,%edi
    1af9:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1afc:	0f be c0             	movsbl %al,%eax
    1aff:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
    1b03:	0f b6 07             	movzbl (%edi),%eax
    1b06:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1b09:	80 fb 09             	cmp    $0x9,%bl
    1b0c:	76 e8                	jbe    1af6 <vsprintf+0xd2>
    1b0e:	eb 16                	jmp    1b26 <vsprintf+0x102>
    1b10:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    1b15:	3c 2a                	cmp    $0x2a,%al
    1b17:	75 0d                	jne    1b26 <vsprintf+0x102>
    1b19:	8b 44 24 24          	mov    0x24(%esp),%eax
    1b1d:	8b 08                	mov    (%eax),%ecx
    1b1f:	8d 40 04             	lea    0x4(%eax),%eax
    1b22:	89 44 24 24          	mov    %eax,0x24(%esp)
    1b26:	85 c9                	test   %ecx,%ecx
    1b28:	b8 00 00 00 00       	mov    $0x0,%eax
    1b2d:	0f 48 c8             	cmovs  %eax,%ecx
    1b30:	89 0c 24             	mov    %ecx,(%esp)
    1b33:	89 fb                	mov    %edi,%ebx
    1b35:	0f b6 03             	movzbl (%ebx),%eax
    1b38:	89 c1                	mov    %eax,%ecx
    1b3a:	83 e1 df             	and    $0xffffffdf,%ecx
    1b3d:	80 f9 4c             	cmp    $0x4c,%cl
    1b40:	74 04                	je     1b46 <vsprintf+0x122>
    1b42:	3c 68                	cmp    $0x68,%al
    1b44:	75 03                	jne    1b49 <vsprintf+0x125>
    1b46:	83 c3 01             	add    $0x1,%ebx
    1b49:	0f b6 0b             	movzbl (%ebx),%ecx
    1b4c:	8d 41 a8             	lea    -0x58(%ecx),%eax
    1b4f:	3c 20                	cmp    $0x20,%al
    1b51:	0f 87 f4 01 00 00    	ja     1d4b <vsprintf+0x327>
    1b57:	0f b6 c0             	movzbl %al,%eax
    1b5a:	ff 24 85 44 00 00 00 	jmp    *0x44(,%eax,4)
    1b61:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1b67:	75 21                	jne    1b8a <vsprintf+0x166>
    1b69:	8d 42 ff             	lea    -0x1(%edx),%eax
    1b6c:	85 c0                	test   %eax,%eax
    1b6e:	7e 18                	jle    1b88 <vsprintf+0x164>
    1b70:	8d 44 15 ff          	lea    -0x1(%ebp,%edx,1),%eax
    1b74:	83 c5 01             	add    $0x1,%ebp
    1b77:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    1b7b:	39 c5                	cmp    %eax,%ebp
    1b7d:	75 f5                	jne    1b74 <vsprintf+0x150>
    1b7f:	ba 00 00 00 00       	mov    $0x0,%edx
    1b84:	89 c5                	mov    %eax,%ebp
    1b86:	eb 02                	jmp    1b8a <vsprintf+0x166>
    1b88:	89 c2                	mov    %eax,%edx
    1b8a:	8b 44 24 24          	mov    0x24(%esp),%eax
    1b8e:	8d 70 04             	lea    0x4(%eax),%esi
    1b91:	8d 4d 01             	lea    0x1(%ebp),%ecx
    1b94:	8b 00                	mov    (%eax),%eax
    1b96:	88 45 00             	mov    %al,0x0(%ebp)
    1b99:	8d 42 ff             	lea    -0x1(%edx),%eax
    1b9c:	85 c0                	test   %eax,%eax
    1b9e:	0f 8e cb 01 00 00    	jle    1d6f <vsprintf+0x34b>
    1ba4:	89 d7                	mov    %edx,%edi
    1ba6:	01 ea                	add    %ebp,%edx
    1ba8:	89 c8                	mov    %ecx,%eax
    1baa:	83 c0 01             	add    $0x1,%eax
    1bad:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    1bb1:	39 d0                	cmp    %edx,%eax
    1bb3:	75 f5                	jne    1baa <vsprintf+0x186>
    1bb5:	8d 6c 39 ff          	lea    -0x1(%ecx,%edi,1),%ebp
    1bb9:	89 74 24 24          	mov    %esi,0x24(%esp)
    1bbd:	e9 bf 01 00 00       	jmp    1d81 <vsprintf+0x35d>
    1bc2:	8b 44 24 24          	mov    0x24(%esp),%eax
    1bc6:	83 c0 04             	add    $0x4,%eax
    1bc9:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bcd:	8b 44 24 24          	mov    0x24(%esp),%eax
    1bd1:	8b 38                	mov    (%eax),%edi
    1bd3:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    1bd8:	b8 00 00 00 00       	mov    $0x0,%eax
    1bdd:	fc                   	cld    
    1bde:	f2 ae                	repnz scas %es:(%edi),%al
    1be0:	f7 d1                	not    %ecx
    1be2:	49                   	dec    %ecx
    1be3:	89 c8                	mov    %ecx,%eax
    1be5:	f7 d0                	not    %eax
    1be7:	01 c7                	add    %eax,%edi
    1be9:	8b 04 24             	mov    (%esp),%eax
    1bec:	85 c0                	test   %eax,%eax
    1bee:	78 0b                	js     1bfb <vsprintf+0x1d7>
    1bf0:	39 c8                	cmp    %ecx,%eax
    1bf2:	0f 9c c0             	setl   %al
    1bf5:	84 c0                	test   %al,%al
    1bf7:	0f 45 0c 24          	cmovne (%esp),%ecx
    1bfb:	f7 c6 10 00 00 00    	test   $0x10,%esi
    1c01:	75 23                	jne    1c26 <vsprintf+0x202>
    1c03:	8d 42 ff             	lea    -0x1(%edx),%eax
    1c06:	39 d1                	cmp    %edx,%ecx
    1c08:	7d 1a                	jge    1c24 <vsprintf+0x200>
    1c0a:	89 ce                	mov    %ecx,%esi
    1c0c:	29 ca                	sub    %ecx,%edx
    1c0e:	8d 44 15 00          	lea    0x0(%ebp,%edx,1),%eax
    1c12:	83 c5 01             	add    $0x1,%ebp
    1c15:	c6 45 ff 20          	movb   $0x20,-0x1(%ebp)
    1c19:	39 c5                	cmp    %eax,%ebp
    1c1b:	75 f5                	jne    1c12 <vsprintf+0x1ee>
    1c1d:	8d 56 ff             	lea    -0x1(%esi),%edx
    1c20:	89 c5                	mov    %eax,%ebp
    1c22:	eb 02                	jmp    1c26 <vsprintf+0x202>
    1c24:	89 c2                	mov    %eax,%edx
    1c26:	85 c9                	test   %ecx,%ecx
    1c28:	7e 1e                	jle    1c48 <vsprintf+0x224>
    1c2a:	b8 00 00 00 00       	mov    $0x0,%eax
    1c2f:	89 d6                	mov    %edx,%esi
    1c31:	0f b6 14 07          	movzbl (%edi,%eax,1),%edx
    1c35:	88 54 05 00          	mov    %dl,0x0(%ebp,%eax,1)
    1c39:	83 c0 01             	add    $0x1,%eax
    1c3c:	39 c1                	cmp    %eax,%ecx
    1c3e:	75 f1                	jne    1c31 <vsprintf+0x20d>
    1c40:	89 f2                	mov    %esi,%edx
    1c42:	8d 44 0d 00          	lea    0x0(%ebp,%ecx,1),%eax
    1c46:	eb 02                	jmp    1c4a <vsprintf+0x226>
    1c48:	89 e8                	mov    %ebp,%eax
    1c4a:	39 d1                	cmp    %edx,%ecx
    1c4c:	0f 8d 25 01 00 00    	jge    1d77 <vsprintf+0x353>
    1c52:	29 ca                	sub    %ecx,%edx
    1c54:	8d 2c 10             	lea    (%eax,%edx,1),%ebp
    1c57:	83 c0 01             	add    $0x1,%eax
    1c5a:	c6 40 ff 20          	movb   $0x20,-0x1(%eax)
    1c5e:	39 c5                	cmp    %eax,%ebp
    1c60:	75 f5                	jne    1c57 <vsprintf+0x233>
    1c62:	8b 44 24 04          	mov    0x4(%esp),%eax
    1c66:	89 44 24 24          	mov    %eax,0x24(%esp)
    1c6a:	e9 12 01 00 00       	jmp    1d81 <vsprintf+0x35d>
    1c6f:	8b 44 24 24          	mov    0x24(%esp),%eax
    1c73:	8d 78 04             	lea    0x4(%eax),%edi
    1c76:	56                   	push   %esi
    1c77:	ff 74 24 04          	pushl  0x4(%esp)
    1c7b:	52                   	push   %edx
    1c7c:	b9 08 00 00 00       	mov    $0x8,%ecx
    1c81:	8b 44 24 30          	mov    0x30(%esp),%eax
    1c85:	8b 10                	mov    (%eax),%edx
    1c87:	89 e8                	mov    %ebp,%eax
    1c89:	e8 92 fb ff ff       	call   1820 <cpy_str_to_kernel+0x1b>
    1c8e:	89 c5                	mov    %eax,%ebp
    1c90:	83 c4 0c             	add    $0xc,%esp
    1c93:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1c97:	e9 e5 00 00 00       	jmp    1d81 <vsprintf+0x35d>
    1c9c:	83 fa ff             	cmp    $0xffffffff,%edx
    1c9f:	75 08                	jne    1ca9 <vsprintf+0x285>
    1ca1:	83 ce 01             	or     $0x1,%esi
    1ca4:	ba 08 00 00 00       	mov    $0x8,%edx
    1ca9:	8b 44 24 24          	mov    0x24(%esp),%eax
    1cad:	8d 78 04             	lea    0x4(%eax),%edi
    1cb0:	56                   	push   %esi
    1cb1:	ff 74 24 04          	pushl  0x4(%esp)
    1cb5:	52                   	push   %edx
    1cb6:	b9 10 00 00 00       	mov    $0x10,%ecx
    1cbb:	8b 44 24 30          	mov    0x30(%esp),%eax
    1cbf:	8b 10                	mov    (%eax),%edx
    1cc1:	89 e8                	mov    %ebp,%eax
    1cc3:	e8 58 fb ff ff       	call   1820 <cpy_str_to_kernel+0x1b>
    1cc8:	89 c5                	mov    %eax,%ebp
    1cca:	83 c4 0c             	add    $0xc,%esp
    1ccd:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1cd1:	e9 ab 00 00 00       	jmp    1d81 <vsprintf+0x35d>
    1cd6:	83 ce 40             	or     $0x40,%esi
    1cd9:	8b 44 24 24          	mov    0x24(%esp),%eax
    1cdd:	8d 78 04             	lea    0x4(%eax),%edi
    1ce0:	56                   	push   %esi
    1ce1:	ff 74 24 04          	pushl  0x4(%esp)
    1ce5:	52                   	push   %edx
    1ce6:	b9 10 00 00 00       	mov    $0x10,%ecx
    1ceb:	8b 44 24 30          	mov    0x30(%esp),%eax
    1cef:	8b 10                	mov    (%eax),%edx
    1cf1:	89 e8                	mov    %ebp,%eax
    1cf3:	e8 28 fb ff ff       	call   1820 <cpy_str_to_kernel+0x1b>
    1cf8:	89 c5                	mov    %eax,%ebp
    1cfa:	83 c4 0c             	add    $0xc,%esp
    1cfd:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1d01:	eb 7e                	jmp    1d81 <vsprintf+0x35d>
    1d03:	83 ce 02             	or     $0x2,%esi
    1d06:	8b 44 24 24          	mov    0x24(%esp),%eax
    1d0a:	8d 78 04             	lea    0x4(%eax),%edi
    1d0d:	56                   	push   %esi
    1d0e:	ff 74 24 04          	pushl  0x4(%esp)
    1d12:	52                   	push   %edx
    1d13:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1d18:	8b 44 24 30          	mov    0x30(%esp),%eax
    1d1c:	8b 10                	mov    (%eax),%edx
    1d1e:	89 e8                	mov    %ebp,%eax
    1d20:	e8 fb fa ff ff       	call   1820 <cpy_str_to_kernel+0x1b>
    1d25:	89 c5                	mov    %eax,%ebp
    1d27:	83 c4 0c             	add    $0xc,%esp
    1d2a:	89 7c 24 24          	mov    %edi,0x24(%esp)
    1d2e:	eb 51                	jmp    1d81 <vsprintf+0x35d>
    1d30:	8b 44 24 24          	mov    0x24(%esp),%eax
    1d34:	8b 00                	mov    (%eax),%eax
    1d36:	89 ea                	mov    %ebp,%edx
    1d38:	2b 54 24 1c          	sub    0x1c(%esp),%edx
    1d3c:	89 10                	mov    %edx,(%eax)
    1d3e:	8b 44 24 24          	mov    0x24(%esp),%eax
    1d42:	8d 40 04             	lea    0x4(%eax),%eax
    1d45:	89 44 24 24          	mov    %eax,0x24(%esp)
    1d49:	eb 36                	jmp    1d81 <vsprintf+0x35d>
    1d4b:	80 f9 25             	cmp    $0x25,%cl
    1d4e:	74 10                	je     1d60 <vsprintf+0x33c>
    1d50:	8d 45 01             	lea    0x1(%ebp),%eax
    1d53:	c6 45 00 25          	movb   $0x25,0x0(%ebp)
    1d57:	0f b6 0b             	movzbl (%ebx),%ecx
    1d5a:	84 c9                	test   %cl,%cl
    1d5c:	74 0a                	je     1d68 <vsprintf+0x344>
    1d5e:	89 c5                	mov    %eax,%ebp
    1d60:	88 4d 00             	mov    %cl,0x0(%ebp)
    1d63:	8d 6d 01             	lea    0x1(%ebp),%ebp
    1d66:	eb 19                	jmp    1d81 <vsprintf+0x35d>
    1d68:	83 eb 01             	sub    $0x1,%ebx
    1d6b:	89 c5                	mov    %eax,%ebp
    1d6d:	eb 12                	jmp    1d81 <vsprintf+0x35d>
    1d6f:	89 cd                	mov    %ecx,%ebp
    1d71:	89 74 24 24          	mov    %esi,0x24(%esp)
    1d75:	eb 0a                	jmp    1d81 <vsprintf+0x35d>
    1d77:	89 c5                	mov    %eax,%ebp
    1d79:	8b 44 24 04          	mov    0x4(%esp),%eax
    1d7d:	89 44 24 24          	mov    %eax,0x24(%esp)
    1d81:	8d 43 01             	lea    0x1(%ebx),%eax
    1d84:	0f b6 53 01          	movzbl 0x1(%ebx),%edx
    1d88:	84 d2                	test   %dl,%dl
    1d8a:	0f 85 ae fc ff ff    	jne    1a3e <vsprintf+0x1a>
    1d90:	eb 18                	jmp    1daa <vsprintf+0x386>
    1d92:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
    1d96:	eb 12                	jmp    1daa <vsprintf+0x386>
    1d98:	89 c3                	mov    %eax,%ebx
    1d9a:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    1d9e:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
    1da5:	e9 8b fd ff ff       	jmp    1b35 <vsprintf+0x111>
    1daa:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
    1dae:	89 e8                	mov    %ebp,%eax
    1db0:	2b 44 24 1c          	sub    0x1c(%esp),%eax
    1db4:	83 c4 08             	add    $0x8,%esp
    1db7:	5b                   	pop    %ebx
    1db8:	5e                   	pop    %esi
    1db9:	5f                   	pop    %edi
    1dba:	5d                   	pop    %ebp
    1dbb:	c3                   	ret    

00001dbc <sys_ftime>:
    1dbc:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1dc1:	c3                   	ret    

00001dc2 <sys_break>:
    1dc2:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1dc7:	c3                   	ret    

00001dc8 <sys_ptrace>:
    1dc8:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1dcd:	c3                   	ret    

00001dce <sys_stty>:
    1dce:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1dd3:	c3                   	ret    

00001dd4 <sys_gtty>:
    1dd4:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1dd9:	c3                   	ret    

00001dda <sys_rename>:
    1dda:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1ddf:	c3                   	ret    

00001de0 <sys_prof>:
    1de0:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1de5:	c3                   	ret    

00001de6 <sys_setregid>:
    1de6:	57                   	push   %edi
    1de7:	56                   	push   %esi
    1de8:	53                   	push   %ebx
    1de9:	8b 7c 24 10          	mov    0x10(%esp),%edi
    1ded:	8b 74 24 14          	mov    0x14(%esp),%esi
    1df1:	e8 fc ff ff ff       	call   1df2 <sys_setregid+0xc>
    1df6:	89 c3                	mov    %eax,%ebx
    1df8:	85 ff                	test   %edi,%edi
    1dfa:	7e 21                	jle    1e1d <sys_setregid+0x37>
    1dfc:	0f b7 80 46 02 00 00 	movzwl 0x246(%eax),%eax
    1e03:	39 c7                	cmp    %eax,%edi
    1e05:	74 0f                	je     1e16 <sys_setregid+0x30>
    1e07:	e8 fc ff ff ff       	call   1e08 <sys_setregid+0x22>
    1e0c:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1e13:	00 
    1e14:	75 49                	jne    1e5f <sys_setregid+0x79>
    1e16:	66 89 bb 46 02 00 00 	mov    %di,0x246(%ebx)
    1e1d:	85 f6                	test   %esi,%esi
    1e1f:	7e 45                	jle    1e66 <sys_setregid+0x80>
    1e21:	0f b7 83 46 02 00 00 	movzwl 0x246(%ebx),%eax
    1e28:	39 c6                	cmp    %eax,%esi
    1e2a:	74 25                	je     1e51 <sys_setregid+0x6b>
    1e2c:	0f b7 83 48 02 00 00 	movzwl 0x248(%ebx),%eax
    1e33:	39 c6                	cmp    %eax,%esi
    1e35:	74 1a                	je     1e51 <sys_setregid+0x6b>
    1e37:	0f b7 83 4a 02 00 00 	movzwl 0x24a(%ebx),%eax
    1e3e:	39 c6                	cmp    %eax,%esi
    1e40:	74 0f                	je     1e51 <sys_setregid+0x6b>
    1e42:	e8 fc ff ff ff       	call   1e43 <sys_setregid+0x5d>
    1e47:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1e4e:	00 
    1e4f:	75 1c                	jne    1e6d <sys_setregid+0x87>
    1e51:	66 89 b3 48 02 00 00 	mov    %si,0x248(%ebx)
    1e58:	b8 00 00 00 00       	mov    $0x0,%eax
    1e5d:	eb 13                	jmp    1e72 <sys_setregid+0x8c>
    1e5f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1e64:	eb 0c                	jmp    1e72 <sys_setregid+0x8c>
    1e66:	b8 00 00 00 00       	mov    $0x0,%eax
    1e6b:	eb 05                	jmp    1e72 <sys_setregid+0x8c>
    1e6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1e72:	5b                   	pop    %ebx
    1e73:	5e                   	pop    %esi
    1e74:	5f                   	pop    %edi
    1e75:	c3                   	ret    

00001e76 <sys_setgid>:
    1e76:	83 ec 14             	sub    $0x14,%esp
    1e79:	8b 44 24 18          	mov    0x18(%esp),%eax
    1e7d:	50                   	push   %eax
    1e7e:	50                   	push   %eax
    1e7f:	e8 fc ff ff ff       	call   1e80 <sys_setgid+0xa>
    1e84:	83 c4 1c             	add    $0x1c,%esp
    1e87:	c3                   	ret    

00001e88 <sys_acct>:
    1e88:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1e8d:	c3                   	ret    

00001e8e <sys_phys>:
    1e8e:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1e93:	c3                   	ret    

00001e94 <sys_lock>:
    1e94:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1e99:	c3                   	ret    

00001e9a <sys_mpx>:
    1e9a:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1e9f:	c3                   	ret    

00001ea0 <sys_ulimit>:
    1ea0:	b8 da ff ff ff       	mov    $0xffffffda,%eax
    1ea5:	c3                   	ret    

00001ea6 <sys_time>:
    1ea6:	56                   	push   %esi
    1ea7:	53                   	push   %ebx
    1ea8:	83 ec 04             	sub    $0x4,%esp
    1eab:	8b 74 24 10          	mov    0x10(%esp),%esi
    1eaf:	8b 0d 00 00 00 00    	mov    0x0,%ecx
    1eb5:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1eba:	89 c8                	mov    %ecx,%eax
    1ebc:	f7 ea                	imul   %edx
    1ebe:	c1 fa 05             	sar    $0x5,%edx
    1ec1:	c1 f9 1f             	sar    $0x1f,%ecx
    1ec4:	29 ca                	sub    %ecx,%edx
    1ec6:	89 d3                	mov    %edx,%ebx
    1ec8:	03 1d 00 00 00 00    	add    0x0,%ebx
    1ece:	85 f6                	test   %esi,%esi
    1ed0:	74 11                	je     1ee3 <sys_time+0x3d>
    1ed2:	83 ec 08             	sub    $0x8,%esp
    1ed5:	6a 04                	push   $0x4
    1ed7:	56                   	push   %esi
    1ed8:	e8 fc ff ff ff       	call   1ed9 <sys_time+0x33>
    1edd:	64 89 1e             	mov    %ebx,%fs:(%esi)
    1ee0:	83 c4 10             	add    $0x10,%esp
    1ee3:	89 d8                	mov    %ebx,%eax
    1ee5:	83 c4 04             	add    $0x4,%esp
    1ee8:	5b                   	pop    %ebx
    1ee9:	5e                   	pop    %esi
    1eea:	c3                   	ret    

00001eeb <sys_setreuid>:
    1eeb:	55                   	push   %ebp
    1eec:	57                   	push   %edi
    1eed:	56                   	push   %esi
    1eee:	53                   	push   %ebx
    1eef:	83 ec 0c             	sub    $0xc,%esp
    1ef2:	8b 74 24 24          	mov    0x24(%esp),%esi
    1ef6:	e8 fc ff ff ff       	call   1ef7 <sys_setreuid+0xc>
    1efb:	89 c3                	mov    %eax,%ebx
    1efd:	0f b7 a8 40 02 00 00 	movzwl 0x240(%eax),%ebp
    1f04:	0f b7 fd             	movzwl %bp,%edi
    1f07:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
    1f0c:	7e 2e                	jle    1f3c <sys_setreuid+0x51>
    1f0e:	0f b7 80 42 02 00 00 	movzwl 0x242(%eax),%eax
    1f15:	3b 44 24 20          	cmp    0x20(%esp),%eax
    1f19:	74 15                	je     1f30 <sys_setreuid+0x45>
    1f1b:	3b 7c 24 20          	cmp    0x20(%esp),%edi
    1f1f:	74 0f                	je     1f30 <sys_setreuid+0x45>
    1f21:	e8 fc ff ff ff       	call   1f22 <sys_setreuid+0x37>
    1f26:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1f2d:	00 
    1f2e:	75 4a                	jne    1f7a <sys_setreuid+0x8f>
    1f30:	0f b7 44 24 20       	movzwl 0x20(%esp),%eax
    1f35:	66 89 83 40 02 00 00 	mov    %ax,0x240(%ebx)
    1f3c:	85 f6                	test   %esi,%esi
    1f3e:	7e 41                	jle    1f81 <sys_setreuid+0x96>
    1f40:	39 f7                	cmp    %esi,%edi
    1f42:	74 1a                	je     1f5e <sys_setreuid+0x73>
    1f44:	0f b7 83 42 02 00 00 	movzwl 0x242(%ebx),%eax
    1f4b:	39 c6                	cmp    %eax,%esi
    1f4d:	74 0f                	je     1f5e <sys_setreuid+0x73>
    1f4f:	e8 fc ff ff ff       	call   1f50 <sys_setreuid+0x65>
    1f54:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1f5b:	00 
    1f5c:	75 0e                	jne    1f6c <sys_setreuid+0x81>
    1f5e:	66 89 b3 42 02 00 00 	mov    %si,0x242(%ebx)
    1f65:	b8 00 00 00 00       	mov    $0x0,%eax
    1f6a:	eb 1a                	jmp    1f86 <sys_setreuid+0x9b>
    1f6c:	66 89 ab 40 02 00 00 	mov    %bp,0x240(%ebx)
    1f73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f78:	eb 0c                	jmp    1f86 <sys_setreuid+0x9b>
    1f7a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f7f:	eb 05                	jmp    1f86 <sys_setreuid+0x9b>
    1f81:	b8 00 00 00 00       	mov    $0x0,%eax
    1f86:	83 c4 0c             	add    $0xc,%esp
    1f89:	5b                   	pop    %ebx
    1f8a:	5e                   	pop    %esi
    1f8b:	5f                   	pop    %edi
    1f8c:	5d                   	pop    %ebp
    1f8d:	c3                   	ret    

00001f8e <sys_setuid>:
    1f8e:	83 ec 14             	sub    $0x14,%esp
    1f91:	8b 44 24 18          	mov    0x18(%esp),%eax
    1f95:	50                   	push   %eax
    1f96:	50                   	push   %eax
    1f97:	e8 fc ff ff ff       	call   1f98 <sys_setuid+0xa>
    1f9c:	83 c4 1c             	add    $0x1c,%esp
    1f9f:	c3                   	ret    

00001fa0 <sys_stime>:
    1fa0:	53                   	push   %ebx
    1fa1:	83 ec 08             	sub    $0x8,%esp
    1fa4:	e8 fc ff ff ff       	call   1fa5 <sys_stime+0x5>
    1fa9:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    1fb0:	00 
    1fb1:	75 2d                	jne    1fe0 <sys_stime+0x40>
    1fb3:	8b 44 24 10          	mov    0x10(%esp),%eax
    1fb7:	64 8b 08             	mov    %fs:(%eax),%ecx
    1fba:	8b 1d 00 00 00 00    	mov    0x0,%ebx
    1fc0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    1fc5:	89 d8                	mov    %ebx,%eax
    1fc7:	f7 ea                	imul   %edx
    1fc9:	c1 fa 05             	sar    $0x5,%edx
    1fcc:	c1 fb 1f             	sar    $0x1f,%ebx
    1fcf:	29 da                	sub    %ebx,%edx
    1fd1:	29 d1                	sub    %edx,%ecx
    1fd3:	89 0d 00 00 00 00    	mov    %ecx,0x0
    1fd9:	b8 00 00 00 00       	mov    $0x0,%eax
    1fde:	eb 05                	jmp    1fe5 <sys_stime+0x45>
    1fe0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fe5:	83 c4 08             	add    $0x8,%esp
    1fe8:	5b                   	pop    %ebx
    1fe9:	c3                   	ret    

00001fea <sys_times>:
    1fea:	56                   	push   %esi
    1feb:	53                   	push   %ebx
    1fec:	83 ec 04             	sub    $0x4,%esp
    1fef:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    1ff3:	85 db                	test   %ebx,%ebx
    1ff5:	74 3c                	je     2033 <sys_times+0x49>
    1ff7:	e8 fc ff ff ff       	call   1ff8 <sys_times+0xe>
    1ffc:	89 c6                	mov    %eax,%esi
    1ffe:	83 ec 08             	sub    $0x8,%esp
    2001:	6a 10                	push   $0x10
    2003:	53                   	push   %ebx
    2004:	e8 fc ff ff ff       	call   2005 <sys_times+0x1b>
    2009:	8b 86 50 02 00 00    	mov    0x250(%esi),%eax
    200f:	64 89 03             	mov    %eax,%fs:(%ebx)
    2012:	8b 86 54 02 00 00    	mov    0x254(%esi),%eax
    2018:	64 89 43 04          	mov    %eax,%fs:0x4(%ebx)
    201c:	8b 86 58 02 00 00    	mov    0x258(%esi),%eax
    2022:	64 89 43 08          	mov    %eax,%fs:0x8(%ebx)
    2026:	8b 86 5c 02 00 00    	mov    0x25c(%esi),%eax
    202c:	64 89 43 0c          	mov    %eax,%fs:0xc(%ebx)
    2030:	83 c4 10             	add    $0x10,%esp
    2033:	a1 00 00 00 00       	mov    0x0,%eax
    2038:	83 c4 04             	add    $0x4,%esp
    203b:	5b                   	pop    %ebx
    203c:	5e                   	pop    %esi
    203d:	c3                   	ret    

0000203e <sys_brk>:
    203e:	53                   	push   %ebx
    203f:	83 ec 08             	sub    $0x8,%esp
    2042:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    2046:	e8 fc ff ff ff       	call   2047 <sys_brk+0x9>
    204b:	39 98 1c 02 00 00    	cmp    %ebx,0x21c(%eax)
    2051:	77 16                	ja     2069 <sys_brk+0x2b>
    2053:	8b 88 28 02 00 00    	mov    0x228(%eax),%ecx
    2059:	8d 91 00 c0 ff ff    	lea    -0x4000(%ecx),%edx
    205f:	39 d3                	cmp    %edx,%ebx
    2061:	73 06                	jae    2069 <sys_brk+0x2b>
    2063:	89 98 24 02 00 00    	mov    %ebx,0x224(%eax)
    2069:	8b 80 24 02 00 00    	mov    0x224(%eax),%eax
    206f:	83 c4 08             	add    $0x8,%esp
    2072:	5b                   	pop    %ebx
    2073:	c3                   	ret    

00002074 <sys_setpgid>:
    2074:	57                   	push   %edi
    2075:	56                   	push   %esi
    2076:	53                   	push   %ebx
    2077:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    207b:	8b 74 24 14          	mov    0x14(%esp),%esi
    207f:	e8 fc ff ff ff       	call   2080 <sys_setpgid+0xc>
    2084:	85 db                	test   %ebx,%ebx
    2086:	75 06                	jne    208e <sys_setpgid+0x1a>
    2088:	8b 98 2c 02 00 00    	mov    0x22c(%eax),%ebx
    208e:	85 f6                	test   %esi,%esi
    2090:	75 06                	jne    2098 <sys_setpgid+0x24>
    2092:	8b b0 2c 02 00 00    	mov    0x22c(%eax),%esi
    2098:	ba 00 00 00 00       	mov    $0x0,%edx
    209d:	bf 00 01 00 00       	mov    $0x100,%edi
    20a2:	8b 0a                	mov    (%edx),%ecx
    20a4:	85 c9                	test   %ecx,%ecx
    20a6:	74 2c                	je     20d4 <sys_setpgid+0x60>
    20a8:	3b 99 2c 02 00 00    	cmp    0x22c(%ecx),%ebx
    20ae:	75 24                	jne    20d4 <sys_setpgid+0x60>
    20b0:	83 b9 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ecx)
    20b7:	75 29                	jne    20e2 <sys_setpgid+0x6e>
    20b9:	8b 80 38 02 00 00    	mov    0x238(%eax),%eax
    20bf:	39 81 38 02 00 00    	cmp    %eax,0x238(%ecx)
    20c5:	75 22                	jne    20e9 <sys_setpgid+0x75>
    20c7:	89 b1 34 02 00 00    	mov    %esi,0x234(%ecx)
    20cd:	b8 00 00 00 00       	mov    $0x0,%eax
    20d2:	eb 1a                	jmp    20ee <sys_setpgid+0x7a>
    20d4:	83 c2 04             	add    $0x4,%edx
    20d7:	39 fa                	cmp    %edi,%edx
    20d9:	75 c7                	jne    20a2 <sys_setpgid+0x2e>
    20db:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
    20e0:	eb 0c                	jmp    20ee <sys_setpgid+0x7a>
    20e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    20e7:	eb 05                	jmp    20ee <sys_setpgid+0x7a>
    20e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    20ee:	5b                   	pop    %ebx
    20ef:	5e                   	pop    %esi
    20f0:	5f                   	pop    %edi
    20f1:	c3                   	ret    

000020f2 <sys_getpgrp>:
    20f2:	83 ec 0c             	sub    $0xc,%esp
    20f5:	e8 fc ff ff ff       	call   20f6 <sys_getpgrp+0x4>
    20fa:	8b 80 34 02 00 00    	mov    0x234(%eax),%eax
    2100:	83 c4 0c             	add    $0xc,%esp
    2103:	c3                   	ret    

00002104 <sys_setsid>:
    2104:	53                   	push   %ebx
    2105:	83 ec 08             	sub    $0x8,%esp
    2108:	e8 fc ff ff ff       	call   2109 <sys_setsid+0x5>
    210d:	89 c3                	mov    %eax,%ebx
    210f:	83 b8 3c 02 00 00 00 	cmpl   $0x0,0x23c(%eax)
    2116:	74 0f                	je     2127 <sys_setsid+0x23>
    2118:	e8 fc ff ff ff       	call   2119 <sys_setsid+0x15>
    211d:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    2124:	00 
    2125:	75 28                	jne    214f <sys_setsid+0x4b>
    2127:	c7 83 3c 02 00 00 01 	movl   $0x1,0x23c(%ebx)
    212e:	00 00 00 
    2131:	8b 83 2c 02 00 00    	mov    0x22c(%ebx),%eax
    2137:	89 83 34 02 00 00    	mov    %eax,0x234(%ebx)
    213d:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
    2143:	c7 83 68 02 00 00 ff 	movl   $0xffffffff,0x268(%ebx)
    214a:	ff ff ff 
    214d:	eb 05                	jmp    2154 <sys_setsid+0x50>
    214f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2154:	83 c4 08             	add    $0x8,%esp
    2157:	5b                   	pop    %ebx
    2158:	c3                   	ret    

00002159 <sys_uname>:
    2159:	53                   	push   %ebx
    215a:	83 ec 08             	sub    $0x8,%esp
    215d:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    2161:	85 db                	test   %ebx,%ebx
    2163:	74 2d                	je     2192 <sys_uname+0x39>
    2165:	83 ec 08             	sub    $0x8,%esp
    2168:	6a 2d                	push   $0x2d
    216a:	53                   	push   %ebx
    216b:	e8 fc ff ff ff       	call   216c <sys_uname+0x13>
    2170:	83 c4 10             	add    $0x10,%esp
    2173:	b8 00 00 00 00       	mov    $0x0,%eax
    2178:	0f b6 90 a0 2b 00 00 	movzbl 0x2ba0(%eax),%edx
    217f:	64 88 14 03          	mov    %dl,%fs:(%ebx,%eax,1)
    2183:	83 c0 01             	add    $0x1,%eax
    2186:	83 f8 2d             	cmp    $0x2d,%eax
    2189:	75 ed                	jne    2178 <sys_uname+0x1f>
    218b:	b8 00 00 00 00       	mov    $0x0,%eax
    2190:	eb 05                	jmp    2197 <sys_uname+0x3e>
    2192:	b8 9d ff ff ff       	mov    $0xffffff9d,%eax
    2197:	83 c4 08             	add    $0x8,%esp
    219a:	5b                   	pop    %ebx
    219b:	c3                   	ret    

0000219c <sys_umask>:
    219c:	83 ec 0c             	sub    $0xc,%esp
    219f:	e8 fc ff ff ff       	call   21a0 <sys_umask+0x4>
    21a4:	89 c1                	mov    %eax,%ecx
    21a6:	0f b7 80 6c 02 00 00 	movzwl 0x26c(%eax),%eax
    21ad:	0f b7 54 24 10       	movzwl 0x10(%esp),%edx
    21b2:	66 81 e2 ff 01       	and    $0x1ff,%dx
    21b7:	66 89 91 6c 02 00 00 	mov    %dx,0x26c(%ecx)
    21be:	83 c4 0c             	add    $0xc,%esp
    21c1:	c3                   	ret    

000021c2 <release>:
    21c2:	53                   	push   %ebx
    21c3:	83 ec 08             	sub    $0x8,%esp
    21c6:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    21ca:	85 db                	test   %ebx,%ebx
    21cc:	0f 84 8c 00 00 00    	je     225e <release+0x9c>
    21d2:	3b 1d 04 00 00 00    	cmp    0x4,%ebx
    21d8:	74 10                	je     21ea <release+0x28>
    21da:	b8 02 00 00 00       	mov    $0x2,%eax
    21df:	3b 1c 85 00 00 00 00 	cmp    0x0(,%eax,4),%ebx
    21e6:	75 5e                	jne    2246 <release+0x84>
    21e8:	eb 05                	jmp    21ef <release+0x2d>
    21ea:	b8 01 00 00 00       	mov    $0x1,%eax
    21ef:	c7 04 85 00 00 00 00 	movl   $0x0,0x0(,%eax,4)
    21f6:	00 00 00 00 
    21fa:	83 ec 0c             	sub    $0xc,%esp
    21fd:	ff b3 04 03 00 00    	pushl  0x304(%ebx)
    2203:	e8 fc ff ff ff       	call   2204 <release+0x42>
    2208:	83 c4 10             	add    $0x10,%esp
    220b:	85 c0                	test   %eax,%eax
    220d:	75 10                	jne    221f <release+0x5d>
    220f:	83 ec 0c             	sub    $0xc,%esp
    2212:	68 ac 01 00 00       	push   $0x1ac
    2217:	e8 fc ff ff ff       	call   2218 <release+0x56>
    221c:	83 c4 10             	add    $0x10,%esp
    221f:	83 ec 0c             	sub    $0xc,%esp
    2222:	53                   	push   %ebx
    2223:	e8 fc ff ff ff       	call   2224 <release+0x62>
    2228:	83 c4 10             	add    $0x10,%esp
    222b:	85 c0                	test   %eax,%eax
    222d:	75 10                	jne    223f <release+0x7d>
    222f:	83 ec 0c             	sub    $0xc,%esp
    2232:	68 d8 01 00 00       	push   $0x1d8
    2237:	e8 fc ff ff ff       	call   2238 <release+0x76>
    223c:	83 c4 10             	add    $0x10,%esp
    223f:	e8 fc ff ff ff       	call   2240 <release+0x7e>
    2244:	eb 18                	jmp    225e <release+0x9c>
    2246:	83 c0 01             	add    $0x1,%eax
    2249:	83 f8 40             	cmp    $0x40,%eax
    224c:	75 91                	jne    21df <release+0x1d>
    224e:	83 ec 0c             	sub    $0xc,%esp
    2251:	68 00 02 00 00       	push   $0x200
    2256:	e8 fc ff ff ff       	call   2257 <release+0x95>
    225b:	83 c4 10             	add    $0x10,%esp
    225e:	83 c4 08             	add    $0x8,%esp
    2261:	5b                   	pop    %ebx
    2262:	c3                   	ret    

00002263 <send_sig>:
    2263:	56                   	push   %esi
    2264:	53                   	push   %ebx
    2265:	83 ec 04             	sub    $0x4,%esp
    2268:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    226c:	8b 74 24 14          	mov    0x14(%esp),%esi
    2270:	e8 fc ff ff ff       	call   2271 <send_sig+0xe>
    2275:	8d 53 ff             	lea    -0x1(%ebx),%edx
    2278:	83 fa 1f             	cmp    $0x1f,%edx
    227b:	77 3e                	ja     22bb <send_sig+0x58>
    227d:	85 f6                	test   %esi,%esi
    227f:	74 3a                	je     22bb <send_sig+0x58>
    2281:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
    2286:	75 1f                	jne    22a7 <send_sig+0x44>
    2288:	0f b7 8e 42 02 00 00 	movzwl 0x242(%esi),%ecx
    228f:	66 39 88 42 02 00 00 	cmp    %cx,0x242(%eax)
    2296:	74 0f                	je     22a7 <send_sig+0x44>
    2298:	e8 fc ff ff ff       	call   2299 <send_sig+0x36>
    229d:	66 83 b8 42 02 00 00 	cmpw   $0x0,0x242(%eax)
    22a4:	00 
    22a5:	75 1b                	jne    22c2 <send_sig+0x5f>
    22a7:	8d 4b ff             	lea    -0x1(%ebx),%ecx
    22aa:	b8 01 00 00 00       	mov    $0x1,%eax
    22af:	d3 e0                	shl    %cl,%eax
    22b1:	09 46 0c             	or     %eax,0xc(%esi)
    22b4:	b8 00 00 00 00       	mov    $0x0,%eax
    22b9:	eb 0c                	jmp    22c7 <send_sig+0x64>
    22bb:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
    22c0:	eb 05                	jmp    22c7 <send_sig+0x64>
    22c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    22c7:	83 c4 04             	add    $0x4,%esp
    22ca:	5b                   	pop    %ebx
    22cb:	5e                   	pop    %esi
    22cc:	c3                   	ret    

000022cd <kill_session>:
    22cd:	53                   	push   %ebx
    22ce:	83 ec 08             	sub    $0x8,%esp
    22d1:	e8 fc ff ff ff       	call   22d2 <kill_session+0x5>
    22d6:	ba 00 01 00 00       	mov    $0x100,%edx
    22db:	eb 18                	jmp    22f5 <kill_session+0x28>
    22dd:	8b 0a                	mov    (%edx),%ecx
    22df:	85 c9                	test   %ecx,%ecx
    22e1:	74 12                	je     22f5 <kill_session+0x28>
    22e3:	8b 98 38 02 00 00    	mov    0x238(%eax),%ebx
    22e9:	39 99 38 02 00 00    	cmp    %ebx,0x238(%ecx)
    22ef:	75 04                	jne    22f5 <kill_session+0x28>
    22f1:	83 49 0c 01          	orl    $0x1,0xc(%ecx)
    22f5:	83 ea 04             	sub    $0x4,%edx
    22f8:	81 fa 00 00 00 00    	cmp    $0x0,%edx
    22fe:	75 dd                	jne    22dd <kill_session+0x10>
    2300:	83 c4 08             	add    $0x8,%esp
    2303:	5b                   	pop    %ebx
    2304:	c3                   	ret    

00002305 <sys_kill>:
    2305:	55                   	push   %ebp
    2306:	57                   	push   %edi
    2307:	56                   	push   %esi
    2308:	53                   	push   %ebx
    2309:	83 ec 0c             	sub    $0xc,%esp
    230c:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    2310:	8b 6c 24 24          	mov    0x24(%esp),%ebp
    2314:	e8 fc ff ff ff       	call   2315 <sys_kill+0x10>
    2319:	85 db                	test   %ebx,%ebx
    231b:	74 2c                	je     2349 <sys_kill+0x44>
    231d:	eb 46                	jmp    2365 <sys_kill+0x60>
    231f:	8b 03                	mov    (%ebx),%eax
    2321:	85 c0                	test   %eax,%eax
    2323:	74 30                	je     2355 <sys_kill+0x50>
    2325:	8b 96 2c 02 00 00    	mov    0x22c(%esi),%edx
    232b:	39 90 34 02 00 00    	cmp    %edx,0x234(%eax)
    2331:	75 22                	jne    2355 <sys_kill+0x50>
    2333:	83 ec 04             	sub    $0x4,%esp
    2336:	6a 01                	push   $0x1
    2338:	50                   	push   %eax
    2339:	55                   	push   %ebp
    233a:	e8 fc ff ff ff       	call   233b <sys_kill+0x36>
    233f:	83 c4 10             	add    $0x10,%esp
    2342:	85 c0                	test   %eax,%eax
    2344:	0f 45 f8             	cmovne %eax,%edi
    2347:	eb 0c                	jmp    2355 <sys_kill+0x50>
    2349:	89 c6                	mov    %eax,%esi
    234b:	bf 00 00 00 00       	mov    $0x0,%edi
    2350:	bb 00 01 00 00       	mov    $0x100,%ebx
    2355:	83 eb 04             	sub    $0x4,%ebx
    2358:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
    235e:	75 bf                	jne    231f <sys_kill+0x1a>
    2360:	e9 aa 00 00 00       	jmp    240f <sys_kill+0x10a>
    2365:	bf 00 00 00 00       	mov    $0x0,%edi
    236a:	be 00 01 00 00       	mov    $0x100,%esi
    236f:	85 db                	test   %ebx,%ebx
    2371:	7f 24                	jg     2397 <sys_kill+0x92>
    2373:	eb 2f                	jmp    23a4 <sys_kill+0x9f>
    2375:	8b 06                	mov    (%esi),%eax
    2377:	85 c0                	test   %eax,%eax
    2379:	74 1c                	je     2397 <sys_kill+0x92>
    237b:	3b 98 2c 02 00 00    	cmp    0x22c(%eax),%ebx
    2381:	75 14                	jne    2397 <sys_kill+0x92>
    2383:	83 ec 04             	sub    $0x4,%esp
    2386:	6a 00                	push   $0x0
    2388:	50                   	push   %eax
    2389:	55                   	push   %ebp
    238a:	e8 fc ff ff ff       	call   238b <sys_kill+0x86>
    238f:	83 c4 10             	add    $0x10,%esp
    2392:	85 c0                	test   %eax,%eax
    2394:	0f 45 f8             	cmovne %eax,%edi
    2397:	83 ee 04             	sub    $0x4,%esi
    239a:	81 fe 00 00 00 00    	cmp    $0x0,%esi
    23a0:	75 d3                	jne    2375 <sys_kill+0x70>
    23a2:	eb 6b                	jmp    240f <sys_kill+0x10a>
    23a4:	bf 00 00 00 00       	mov    $0x0,%edi
    23a9:	83 fb ff             	cmp    $0xffffffff,%ebx
    23ac:	75 61                	jne    240f <sys_kill+0x10a>
    23ae:	eb 46                	jmp    23f6 <sys_kill+0xf1>
    23b0:	83 ec 04             	sub    $0x4,%esp
    23b3:	6a 00                	push   $0x0
    23b5:	ff 33                	pushl  (%ebx)
    23b7:	55                   	push   %ebp
    23b8:	e8 fc ff ff ff       	call   23b9 <sys_kill+0xb4>
    23bd:	83 c4 10             	add    $0x10,%esp
    23c0:	85 c0                	test   %eax,%eax
    23c2:	75 3e                	jne    2402 <sys_kill+0xfd>
    23c4:	eb 23                	jmp    23e9 <sys_kill+0xe4>
    23c6:	8b 03                	mov    (%ebx),%eax
    23c8:	85 c0                	test   %eax,%eax
    23ca:	74 1d                	je     23e9 <sys_kill+0xe4>
    23cc:	83 b8 34 02 00 00 01 	cmpl   $0x1,0x234(%eax)
    23d3:	75 14                	jne    23e9 <sys_kill+0xe4>
    23d5:	83 ec 04             	sub    $0x4,%esp
    23d8:	6a 00                	push   $0x0
    23da:	50                   	push   %eax
    23db:	55                   	push   %ebp
    23dc:	e8 fc ff ff ff       	call   23dd <sys_kill+0xd8>
    23e1:	83 c4 10             	add    $0x10,%esp
    23e4:	85 c0                	test   %eax,%eax
    23e6:	0f 45 f8             	cmovne %eax,%edi
    23e9:	83 eb 04             	sub    $0x4,%ebx
    23ec:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
    23f2:	77 d2                	ja     23c6 <sys_kill+0xc1>
    23f4:	eb 0e                	jmp    2404 <sys_kill+0xff>
    23f6:	bf 00 00 00 00       	mov    $0x0,%edi
    23fb:	bb 00 01 00 00       	mov    $0x100,%ebx
    2400:	eb 02                	jmp    2404 <sys_kill+0xff>
    2402:	89 c7                	mov    %eax,%edi
    2404:	83 eb 04             	sub    $0x4,%ebx
    2407:	81 fb 00 00 00 00    	cmp    $0x0,%ebx
    240d:	77 a1                	ja     23b0 <sys_kill+0xab>
    240f:	89 f8                	mov    %edi,%eax
    2411:	83 c4 0c             	add    $0xc,%esp
    2414:	5b                   	pop    %ebx
    2415:	5e                   	pop    %esi
    2416:	5f                   	pop    %edi
    2417:	5d                   	pop    %ebp
    2418:	c3                   	ret    

00002419 <tell_father>:
    2419:	56                   	push   %esi
    241a:	53                   	push   %ebx
    241b:	83 ec 04             	sub    $0x4,%esp
    241e:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    2422:	e8 fc ff ff ff       	call   2423 <tell_father+0xa>
    2427:	89 c6                	mov    %eax,%esi
    2429:	85 db                	test   %ebx,%ebx
    242b:	74 28                	je     2455 <tell_father+0x3c>
    242d:	b8 00 00 00 00       	mov    $0x0,%eax
    2432:	b9 00 01 00 00       	mov    $0x100,%ecx
    2437:	8b 10                	mov    (%eax),%edx
    2439:	85 d2                	test   %edx,%edx
    243b:	74 11                	je     244e <tell_father+0x35>
    243d:	3b 9a 2c 02 00 00    	cmp    0x22c(%edx),%ebx
    2443:	75 09                	jne    244e <tell_father+0x35>
    2445:	81 4a 0c 00 00 01 00 	orl    $0x10000,0xc(%edx)
    244c:	eb 1f                	jmp    246d <tell_father+0x54>
    244e:	83 c0 04             	add    $0x4,%eax
    2451:	39 c8                	cmp    %ecx,%eax
    2453:	75 e2                	jne    2437 <tell_father+0x1e>
    2455:	83 ec 0c             	sub    $0xc,%esp
    2458:	68 cf 01 00 00       	push   $0x1cf
    245d:	e8 fc ff ff ff       	call   245e <tell_father+0x45>
    2462:	89 34 24             	mov    %esi,(%esp)
    2465:	e8 fc ff ff ff       	call   2466 <tell_father+0x4d>
    246a:	83 c4 10             	add    $0x10,%esp
    246d:	83 c4 04             	add    $0x4,%esp
    2470:	5b                   	pop    %ebx
    2471:	5e                   	pop    %esi
    2472:	c3                   	ret    

00002473 <do_exit>:
    2473:	57                   	push   %edi
    2474:	56                   	push   %esi
    2475:	53                   	push   %ebx
    2476:	e8 fc ff ff ff       	call   2477 <do_exit+0x4>
    247b:	89 c6                	mov    %eax,%esi
    247d:	b9 0f 00 00 00       	mov    $0xf,%ecx
    2482:	0f 03 c9             	lsl    %cx,%ecx
    2485:	41                   	inc    %ecx
    2486:	50                   	push   %eax
    2487:	8d 80 d8 02 00 00    	lea    0x2d8(%eax),%eax
    248d:	83 c0 07             	add    $0x7,%eax
    2490:	8a 30                	mov    (%eax),%dh
    2492:	83 e8 03             	sub    $0x3,%eax
    2495:	8a 10                	mov    (%eax),%dl
    2497:	c1 e2 10             	shl    $0x10,%edx
    249a:	83 e8 02             	sub    $0x2,%eax
    249d:	66 8b 10             	mov    (%eax),%dx
    24a0:	58                   	pop    %eax
    24a1:	83 ec 04             	sub    $0x4,%esp
    24a4:	56                   	push   %esi
    24a5:	51                   	push   %ecx
    24a6:	52                   	push   %edx
    24a7:	e8 fc ff ff ff       	call   24a8 <do_exit+0x35>
    24ac:	b9 17 00 00 00       	mov    $0x17,%ecx
    24b1:	0f 03 c9             	lsl    %cx,%ecx
    24b4:	41                   	inc    %ecx
    24b5:	50                   	push   %eax
    24b6:	8d 86 e0 02 00 00    	lea    0x2e0(%esi),%eax
    24bc:	83 c0 07             	add    $0x7,%eax
    24bf:	8a 30                	mov    (%eax),%dh
    24c1:	83 e8 03             	sub    $0x3,%eax
    24c4:	8a 10                	mov    (%eax),%dl
    24c6:	c1 e2 10             	shl    $0x10,%edx
    24c9:	83 e8 02             	sub    $0x2,%eax
    24cc:	66 8b 10             	mov    (%eax),%dx
    24cf:	58                   	pop    %eax
    24d0:	83 c4 0c             	add    $0xc,%esp
    24d3:	56                   	push   %esi
    24d4:	51                   	push   %ecx
    24d5:	52                   	push   %edx
    24d6:	e8 fc ff ff ff       	call   24d7 <do_exit+0x64>
    24db:	bb 00 00 00 00       	mov    $0x0,%ebx
    24e0:	bf 00 01 00 00       	mov    $0x100,%edi
    24e5:	83 c4 10             	add    $0x10,%esp
    24e8:	8b 03                	mov    (%ebx),%eax
    24ea:	85 c0                	test   %eax,%eax
    24ec:	74 32                	je     2520 <do_exit+0xad>
    24ee:	8b 96 2c 02 00 00    	mov    0x22c(%esi),%edx
    24f4:	39 90 30 02 00 00    	cmp    %edx,0x230(%eax)
    24fa:	75 24                	jne    2520 <do_exit+0xad>
    24fc:	c7 80 30 02 00 00 01 	movl   $0x1,0x230(%eax)
    2503:	00 00 00 
    2506:	83 38 03             	cmpl   $0x3,(%eax)
    2509:	75 15                	jne    2520 <do_exit+0xad>
    250b:	83 ec 04             	sub    $0x4,%esp
    250e:	6a 01                	push   $0x1
    2510:	ff 35 04 00 00 00    	pushl  0x4
    2516:	6a 11                	push   $0x11
    2518:	e8 fc ff ff ff       	call   2519 <do_exit+0xa6>
    251d:	83 c4 10             	add    $0x10,%esp
    2520:	83 c3 04             	add    $0x4,%ebx
    2523:	39 fb                	cmp    %edi,%ebx
    2525:	75 c1                	jne    24e8 <do_exit+0x75>
    2527:	bb 00 00 00 00       	mov    $0x0,%ebx
    252c:	83 bc 9e 80 02 00 00 	cmpl   $0x0,0x280(%esi,%ebx,4)
    2533:	00 
    2534:	74 0c                	je     2542 <do_exit+0xcf>
    2536:	83 ec 0c             	sub    $0xc,%esp
    2539:	53                   	push   %ebx
    253a:	e8 fc ff ff ff       	call   253b <do_exit+0xc8>
    253f:	83 c4 10             	add    $0x10,%esp
    2542:	83 c3 01             	add    $0x1,%ebx
    2545:	83 fb 14             	cmp    $0x14,%ebx
    2548:	75 e2                	jne    252c <do_exit+0xb9>
    254a:	83 ec 0c             	sub    $0xc,%esp
    254d:	ff b6 70 02 00 00    	pushl  0x270(%esi)
    2553:	e8 fc ff ff ff       	call   2554 <do_exit+0xe1>
    2558:	c7 86 70 02 00 00 00 	movl   $0x0,0x270(%esi)
    255f:	00 00 00 
    2562:	83 c4 04             	add    $0x4,%esp
    2565:	ff b6 74 02 00 00    	pushl  0x274(%esi)
    256b:	e8 fc ff ff ff       	call   256c <do_exit+0xf9>
    2570:	c7 86 74 02 00 00 00 	movl   $0x0,0x274(%esi)
    2577:	00 00 00 
    257a:	83 c4 04             	add    $0x4,%esp
    257d:	ff b6 78 02 00 00    	pushl  0x278(%esi)
    2583:	e8 fc ff ff ff       	call   2584 <do_exit+0x111>
    2588:	c7 86 78 02 00 00 00 	movl   $0x0,0x278(%esi)
    258f:	00 00 00 
    2592:	83 c4 10             	add    $0x10,%esp
    2595:	83 be 3c 02 00 00 00 	cmpl   $0x0,0x23c(%esi)
    259c:	0f 84 d2 00 00 00    	je     2674 <do_exit+0x201>
    25a2:	8b 86 68 02 00 00    	mov    0x268(%esi),%eax
    25a8:	85 c0                	test   %eax,%eax
    25aa:	0f 88 b3 00 00 00    	js     2663 <do_exit+0x1f0>
    25b0:	69 c0 60 0c 00 00    	imul   $0xc60,%eax,%eax
    25b6:	c7 80 24 00 00 00 00 	movl   $0x0,0x24(%eax)
    25bd:	00 00 00 
    25c0:	3b 35 00 00 00 00    	cmp    0x0,%esi
    25c6:	75 0a                	jne    25d2 <do_exit+0x15f>
    25c8:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
    25cf:	00 00 00 
    25d2:	83 be 3c 02 00 00 00 	cmpl   $0x0,0x23c(%esi)
    25d9:	74 05                	je     25e0 <do_exit+0x16d>
    25db:	e8 fc ff ff ff       	call   25dc <do_exit+0x169>
    25e0:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
    25e6:	8b 44 24 10          	mov    0x10(%esp),%eax
    25ea:	89 86 14 02 00 00    	mov    %eax,0x214(%esi)
    25f0:	83 ec 0c             	sub    $0xc,%esp
    25f3:	ff b6 30 02 00 00    	pushl  0x230(%esi)
    25f9:	e8 fc ff ff ff       	call   25fa <do_exit+0x187>
    25fe:	e8 fc ff ff ff       	call   25ff <do_exit+0x18c>
    2603:	83 c4 10             	add    $0x10,%esp
    2606:	3b 05 04 00 00 00    	cmp    0x4,%eax
    260c:	75 07                	jne    2615 <do_exit+0x1a2>
    260e:	e8 fc ff ff ff       	call   260f <do_exit+0x19c>
    2613:	eb 70                	jmp    2685 <do_exit+0x212>
    2615:	e8 fc ff ff ff       	call   2616 <do_exit+0x1a3>
    261a:	89 c3                	mov    %eax,%ebx
    261c:	83 ec 04             	sub    $0x4,%esp
    261f:	50                   	push   %eax
    2620:	ff b6 c0 03 00 00    	pushl  0x3c0(%esi)
    2626:	68 24 02 00 00       	push   $0x224
    262b:	e8 fc ff ff ff       	call   262c <do_exit+0x1b9>
    2630:	89 1c 24             	mov    %ebx,(%esp)
    2633:	e8 fc ff ff ff       	call   2634 <do_exit+0x1c1>
    2638:	89 c3                	mov    %eax,%ebx
    263a:	e8 fc ff ff ff       	call   263b <do_exit+0x1c8>
    263f:	c7 04 24 50 00 00 00 	movl   $0x50,(%esp)
    2646:	e8 fc ff ff ff       	call   2647 <do_exit+0x1d4>
    264b:	e8 fc ff ff ff       	call   264c <do_exit+0x1d9>
    2650:	83 c4 08             	add    $0x8,%esp
    2653:	68 00 00 00 00       	push   $0x0
    2658:	53                   	push   %ebx
    2659:	e8 fc ff ff ff       	call   265a <do_exit+0x1e7>
    265e:	83 c4 10             	add    $0x10,%esp
    2661:	eb 22                	jmp    2685 <do_exit+0x212>
    2663:	3b 35 00 00 00 00    	cmp    0x0,%esi
    2669:	0f 85 6c ff ff ff    	jne    25db <do_exit+0x168>
    266f:	e9 54 ff ff ff       	jmp    25c8 <do_exit+0x155>
    2674:	3b 35 00 00 00 00    	cmp    0x0,%esi
    267a:	0f 85 60 ff ff ff    	jne    25e0 <do_exit+0x16d>
    2680:	e9 43 ff ff ff       	jmp    25c8 <do_exit+0x155>
    2685:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    268a:	5b                   	pop    %ebx
    268b:	5e                   	pop    %esi
    268c:	5f                   	pop    %edi
    268d:	c3                   	ret    

0000268e <sys_exit>:
    268e:	83 ec 18             	sub    $0x18,%esp
    2691:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    2695:	c1 e0 08             	shl    $0x8,%eax
    2698:	0f b7 c0             	movzwl %ax,%eax
    269b:	50                   	push   %eax
    269c:	e8 fc ff ff ff       	call   269d <sys_exit+0xf>
    26a1:	83 c4 1c             	add    $0x1c,%esp
    26a4:	c3                   	ret    

000026a5 <sys_waitpid>:
    26a5:	55                   	push   %ebp
    26a6:	57                   	push   %edi
    26a7:	56                   	push   %esi
    26a8:	53                   	push   %ebx
    26a9:	83 ec 1c             	sub    $0x1c,%esp
    26ac:	8b 74 24 30          	mov    0x30(%esp),%esi
    26b0:	e8 fc ff ff ff       	call   26b1 <sys_waitpid+0xc>
    26b5:	89 c3                	mov    %eax,%ebx
    26b7:	83 ec 08             	sub    $0x8,%esp
    26ba:	6a 04                	push   $0x4
    26bc:	ff 74 24 40          	pushl  0x40(%esp)
    26c0:	e8 fc ff ff ff       	call   26c1 <sys_waitpid+0x1c>
    26c5:	83 c4 10             	add    $0x10,%esp
    26c8:	8b 7c 24 38          	mov    0x38(%esp),%edi
    26cc:	83 e7 02             	and    $0x2,%edi
    26cf:	89 f5                	mov    %esi,%ebp
    26d1:	f7 dd                	neg    %ebp
    26d3:	b8 fc 00 00 00       	mov    $0xfc,%eax
    26d8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    26df:	00 
    26e0:	8b 10                	mov    (%eax),%edx
    26e2:	39 d3                	cmp    %edx,%ebx
    26e4:	0f 84 bb 00 00 00    	je     27a5 <sys_waitpid+0x100>
    26ea:	85 d2                	test   %edx,%edx
    26ec:	0f 84 b3 00 00 00    	je     27a5 <sys_waitpid+0x100>
    26f2:	8b 8b 2c 02 00 00    	mov    0x22c(%ebx),%ecx
    26f8:	39 8a 30 02 00 00    	cmp    %ecx,0x230(%edx)
    26fe:	0f 85 a1 00 00 00    	jne    27a5 <sys_waitpid+0x100>
    2704:	85 f6                	test   %esi,%esi
    2706:	7e 0e                	jle    2716 <sys_waitpid+0x71>
    2708:	3b b2 2c 02 00 00    	cmp    0x22c(%edx),%esi
    270e:	0f 85 91 00 00 00    	jne    27a5 <sys_waitpid+0x100>
    2714:	eb 21                	jmp    2737 <sys_waitpid+0x92>
    2716:	85 f6                	test   %esi,%esi
    2718:	75 10                	jne    272a <sys_waitpid+0x85>
    271a:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
    2720:	39 8a 34 02 00 00    	cmp    %ecx,0x234(%edx)
    2726:	75 7d                	jne    27a5 <sys_waitpid+0x100>
    2728:	eb 0d                	jmp    2737 <sys_waitpid+0x92>
    272a:	83 fe ff             	cmp    $0xffffffff,%esi
    272d:	74 08                	je     2737 <sys_waitpid+0x92>
    272f:	39 aa 34 02 00 00    	cmp    %ebp,0x234(%edx)
    2735:	75 6e                	jne    27a5 <sys_waitpid+0x100>
    2737:	8b 0a                	mov    (%edx),%ecx
    2739:	83 f9 03             	cmp    $0x3,%ecx
    273c:	74 20                	je     275e <sys_waitpid+0xb9>
    273e:	83 f9 04             	cmp    $0x4,%ecx
    2741:	75 5a                	jne    279d <sys_waitpid+0xf8>
    2743:	85 ff                	test   %edi,%edi
    2745:	74 5e                	je     27a5 <sys_waitpid+0x100>
    2747:	b8 7f 00 00 00       	mov    $0x7f,%eax
    274c:	8b 7c 24 34          	mov    0x34(%esp),%edi
    2750:	64 89 07             	mov    %eax,%fs:(%edi)
    2753:	8b 82 2c 02 00 00    	mov    0x22c(%edx),%eax
    2759:	e9 94 00 00 00       	jmp    27f2 <sys_waitpid+0x14d>
    275e:	8b 92 50 02 00 00    	mov    0x250(%edx),%edx
    2764:	01 93 58 02 00 00    	add    %edx,0x258(%ebx)
    276a:	8b 10                	mov    (%eax),%edx
    276c:	8b 92 54 02 00 00    	mov    0x254(%edx),%edx
    2772:	01 93 5c 02 00 00    	add    %edx,0x25c(%ebx)
    2778:	8b 00                	mov    (%eax),%eax
    277a:	8b 98 2c 02 00 00    	mov    0x22c(%eax),%ebx
    2780:	8b b0 14 02 00 00    	mov    0x214(%eax),%esi
    2786:	83 ec 0c             	sub    $0xc,%esp
    2789:	50                   	push   %eax
    278a:	e8 fc ff ff ff       	call   278b <sys_waitpid+0xe6>
    278f:	8b 44 24 44          	mov    0x44(%esp),%eax
    2793:	64 89 30             	mov    %esi,%fs:(%eax)
    2796:	83 c4 10             	add    $0x10,%esp
    2799:	89 d8                	mov    %ebx,%eax
    279b:	eb 55                	jmp    27f2 <sys_waitpid+0x14d>
    279d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    27a4:	00 
    27a5:	83 e8 04             	sub    $0x4,%eax
    27a8:	3d 00 00 00 00       	cmp    $0x0,%eax
    27ad:	0f 85 2d ff ff ff    	jne    26e0 <sys_waitpid+0x3b>
    27b3:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
    27b8:	74 2c                	je     27e6 <sys_waitpid+0x141>
    27ba:	f6 44 24 38 01       	testb  $0x1,0x38(%esp)
    27bf:	75 2c                	jne    27ed <sys_waitpid+0x148>
    27c1:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
    27c7:	e8 fc ff ff ff       	call   27c8 <sys_waitpid+0x123>
    27cc:	8b 43 0c             	mov    0xc(%ebx),%eax
    27cf:	25 ff ff fe ff       	and    $0xfffeffff,%eax
    27d4:	89 43 0c             	mov    %eax,0xc(%ebx)
    27d7:	85 c0                	test   %eax,%eax
    27d9:	0f 84 f4 fe ff ff    	je     26d3 <sys_waitpid+0x2e>
    27df:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
    27e4:	eb 0c                	jmp    27f2 <sys_waitpid+0x14d>
    27e6:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
    27eb:	eb 05                	jmp    27f2 <sys_waitpid+0x14d>
    27ed:	b8 00 00 00 00       	mov    $0x0,%eax
    27f2:	83 c4 1c             	add    $0x1c,%esp
    27f5:	5b                   	pop    %ebx
    27f6:	5e                   	pop    %esi
    27f7:	5f                   	pop    %edi
    27f8:	5d                   	pop    %ebp
    27f9:	c3                   	ret    

000027fa <sys_sgetmask>:
    27fa:	83 ec 0c             	sub    $0xc,%esp
    27fd:	e8 fc ff ff ff       	call   27fe <sys_sgetmask+0x4>
    2802:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
    2808:	83 c4 0c             	add    $0xc,%esp
    280b:	c3                   	ret    

0000280c <sys_ssetmask>:
    280c:	83 ec 0c             	sub    $0xc,%esp
    280f:	e8 fc ff ff ff       	call   2810 <sys_ssetmask+0x4>
    2814:	89 c1                	mov    %eax,%ecx
    2816:	8b 80 10 02 00 00    	mov    0x210(%eax),%eax
    281c:	8b 54 24 10          	mov    0x10(%esp),%edx
    2820:	80 e6 fe             	and    $0xfe,%dh
    2823:	89 91 10 02 00 00    	mov    %edx,0x210(%ecx)
    2829:	83 c4 0c             	add    $0xc,%esp
    282c:	c3                   	ret    

0000282d <sys_signal>:
    282d:	53                   	push   %ebx
    282e:	83 ec 08             	sub    $0x8,%esp
    2831:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    2835:	e8 fc ff ff ff       	call   2836 <sys_signal+0x9>
    283a:	8d 4b ff             	lea    -0x1(%ebx),%ecx
    283d:	83 f9 1f             	cmp    $0x1f,%ecx
    2840:	77 2a                	ja     286c <sys_signal+0x3f>
    2842:	83 fb 09             	cmp    $0x9,%ebx
    2845:	74 25                	je     286c <sys_signal+0x3f>
    2847:	c1 e3 04             	shl    $0x4,%ebx
    284a:	8d 14 18             	lea    (%eax,%ebx,1),%edx
    284d:	8b 02                	mov    (%edx),%eax
    284f:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    2853:	89 0a                	mov    %ecx,(%edx)
    2855:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
    285c:	c7 42 08 00 00 00 c0 	movl   $0xc0000000,0x8(%edx)
    2863:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    2867:	89 4a 0c             	mov    %ecx,0xc(%edx)
    286a:	eb 05                	jmp    2871 <sys_signal+0x44>
    286c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2871:	83 c4 08             	add    $0x8,%esp
    2874:	5b                   	pop    %ebx
    2875:	c3                   	ret    

00002876 <sys_sigaction>:
    2876:	55                   	push   %ebp
    2877:	57                   	push   %edi
    2878:	56                   	push   %esi
    2879:	53                   	push   %ebx
    287a:	83 ec 2c             	sub    $0x2c,%esp
    287d:	8b 7c 24 40          	mov    0x40(%esp),%edi
    2881:	8b 5c 24 44          	mov    0x44(%esp),%ebx
    2885:	8b 74 24 48          	mov    0x48(%esp),%esi
    2889:	e8 fc ff ff ff       	call   288a <sys_sigaction+0x14>
    288e:	89 c5                	mov    %eax,%ebp
    2890:	8d 47 ff             	lea    -0x1(%edi),%eax
    2893:	83 f8 1f             	cmp    $0x1f,%eax
    2896:	0f 87 8e 00 00 00    	ja     292a <sys_sigaction+0xb4>
    289c:	83 ff 09             	cmp    $0x9,%edi
    289f:	0f 84 85 00 00 00    	je     292a <sys_sigaction+0xb4>
    28a5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    28a9:	89 f8                	mov    %edi,%eax
    28ab:	c1 e0 04             	shl    $0x4,%eax
    28ae:	01 e8                	add    %ebp,%eax
    28b0:	8b 10                	mov    (%eax),%edx
    28b2:	89 54 24 10          	mov    %edx,0x10(%esp)
    28b6:	8b 50 04             	mov    0x4(%eax),%edx
    28b9:	89 54 24 14          	mov    %edx,0x14(%esp)
    28bd:	8b 50 08             	mov    0x8(%eax),%edx
    28c0:	89 54 24 18          	mov    %edx,0x18(%esp)
    28c4:	8b 40 0c             	mov    0xc(%eax),%eax
    28c7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    28cb:	89 f8                	mov    %edi,%eax
    28cd:	c1 e0 04             	shl    $0x4,%eax
    28d0:	8d 04 28             	lea    (%eax,%ebp,1),%eax
    28d3:	8d 48 10             	lea    0x10(%eax),%ecx
    28d6:	83 c0 01             	add    $0x1,%eax
    28d9:	64 8a 13             	mov    %fs:(%ebx),%dl
    28dc:	88 50 ff             	mov    %dl,-0x1(%eax)
    28df:	8d 5b 01             	lea    0x1(%ebx),%ebx
    28e2:	39 c8                	cmp    %ecx,%eax
    28e4:	75 f0                	jne    28d6 <sys_sigaction+0x60>
    28e6:	eb 5d                	jmp    2945 <sys_sigaction+0xcf>
    28e8:	0f b6 10             	movzbl (%eax),%edx
    28eb:	64 88 16             	mov    %dl,%fs:(%esi)
    28ee:	83 c0 01             	add    $0x1,%eax
    28f1:	83 c6 01             	add    $0x1,%esi
    28f4:	8d 4c 24 20          	lea    0x20(%esp),%ecx
    28f8:	39 c8                	cmp    %ecx,%eax
    28fa:	75 ec                	jne    28e8 <sys_sigaction+0x72>
    28fc:	c1 e7 04             	shl    $0x4,%edi
    28ff:	01 fd                	add    %edi,%ebp
    2901:	8b 45 08             	mov    0x8(%ebp),%eax
    2904:	25 00 00 00 40       	and    $0x40000000,%eax
    2909:	74 0e                	je     2919 <sys_sigaction+0xa3>
    290b:	c7 45 04 00 00 00 00 	movl   $0x0,0x4(%ebp)
    2912:	b8 00 00 00 00       	mov    $0x0,%eax
    2917:	eb 32                	jmp    294b <sys_sigaction+0xd5>
    2919:	ba 01 00 00 00       	mov    $0x1,%edx
    291e:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
    2923:	d3 e2                	shl    %cl,%edx
    2925:	09 55 04             	or     %edx,0x4(%ebp)
    2928:	eb 21                	jmp    294b <sys_sigaction+0xd5>
    292a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    292f:	eb 1a                	jmp    294b <sys_sigaction+0xd5>
    2931:	83 ec 08             	sub    $0x8,%esp
    2934:	6a 10                	push   $0x10
    2936:	56                   	push   %esi
    2937:	e8 fc ff ff ff       	call   2938 <sys_sigaction+0xc2>
    293c:	83 c4 10             	add    $0x10,%esp
    293f:	8d 44 24 10          	lea    0x10(%esp),%eax
    2943:	eb a3                	jmp    28e8 <sys_sigaction+0x72>
    2945:	85 f6                	test   %esi,%esi
    2947:	75 e8                	jne    2931 <sys_sigaction+0xbb>
    2949:	eb b1                	jmp    28fc <sys_sigaction+0x86>
    294b:	83 c4 2c             	add    $0x2c,%esp
    294e:	5b                   	pop    %ebx
    294f:	5e                   	pop    %esi
    2950:	5f                   	pop    %edi
    2951:	5d                   	pop    %ebp
    2952:	c3                   	ret    

00002953 <do_signal>:
    2953:	55                   	push   %ebp
    2954:	57                   	push   %edi
    2955:	56                   	push   %esi
    2956:	53                   	push   %ebx
    2957:	83 ec 0c             	sub    $0xc,%esp
    295a:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    295e:	e8 fc ff ff ff       	call   295f <do_signal+0xc>
    2963:	89 c7                	mov    %eax,%edi
    2965:	89 e8                	mov    %ebp,%eax
    2967:	c1 e0 04             	shl    $0x4,%eax
    296a:	8d 34 38             	lea    (%eax,%edi,1),%esi
    296d:	8b 06                	mov    (%esi),%eax
    296f:	83 f8 01             	cmp    $0x1,%eax
    2972:	0f 84 a6 00 00 00    	je     2a1e <do_signal+0xcb>
    2978:	85 c0                	test   %eax,%eax
    297a:	75 1f                	jne    299b <do_signal+0x48>
    297c:	83 fd 11             	cmp    $0x11,%ebp
    297f:	0f 84 99 00 00 00    	je     2a1e <do_signal+0xcb>
    2985:	83 ec 0c             	sub    $0xc,%esp
    2988:	8d 4d ff             	lea    -0x1(%ebp),%ecx
    298b:	b8 01 00 00 00       	mov    $0x1,%eax
    2990:	d3 e0                	shl    %cl,%eax
    2992:	50                   	push   %eax
    2993:	e8 fc ff ff ff       	call   2994 <do_signal+0x41>
    2998:	83 c4 10             	add    $0x10,%esp
    299b:	8b 46 08             	mov    0x8(%esi),%eax
    299e:	85 c0                	test   %eax,%eax
    29a0:	79 06                	jns    29a8 <do_signal+0x55>
    29a2:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
    29a8:	25 00 00 00 40       	and    $0x40000000,%eax
    29ad:	83 f8 01             	cmp    $0x1,%eax
    29b0:	19 c0                	sbb    %eax,%eax
    29b2:	f7 d0                	not    %eax
    29b4:	8d 04 85 20 00 00 00 	lea    0x20(,%eax,4),%eax
    29bb:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
    29bf:	29 c3                	sub    %eax,%ebx
    29c1:	83 ec 08             	sub    $0x8,%esp
    29c4:	50                   	push   %eax
    29c5:	53                   	push   %ebx
    29c6:	e8 fc ff ff ff       	call   29c7 <do_signal+0x74>
    29cb:	8b 46 0c             	mov    0xc(%esi),%eax
    29ce:	64 89 03             	mov    %eax,%fs:(%ebx)
    29d1:	8d 43 08             	lea    0x8(%ebx),%eax
    29d4:	64 89 6b 04          	mov    %ebp,%fs:0x4(%ebx)
    29d8:	83 c4 10             	add    $0x10,%esp
    29db:	f6 46 0b 40          	testb  $0x40,0xb(%esi)
    29df:	75 0d                	jne    29ee <do_signal+0x9b>
    29e1:	8d 43 0c             	lea    0xc(%ebx),%eax
    29e4:	8b 97 10 02 00 00    	mov    0x210(%edi),%edx
    29ea:	64 89 53 08          	mov    %edx,%fs:0x8(%ebx)
    29ee:	8b 54 24 24          	mov    0x24(%esp),%edx
    29f2:	64 89 10             	mov    %edx,%fs:(%eax)
    29f5:	8b 54 24 2c          	mov    0x2c(%esp),%edx
    29f9:	64 89 50 04          	mov    %edx,%fs:0x4(%eax)
    29fd:	8b 54 24 30          	mov    0x30(%esp),%edx
    2a01:	64 89 50 08          	mov    %edx,%fs:0x8(%eax)
    2a05:	8b 54 24 48          	mov    0x48(%esp),%edx
    2a09:	64 89 50 0c          	mov    %edx,%fs:0xc(%eax)
    2a0d:	8b 54 24 40          	mov    0x40(%esp),%edx
    2a11:	64 89 50 10          	mov    %edx,%fs:0x10(%eax)
    2a15:	8b 46 04             	mov    0x4(%esi),%eax
    2a18:	09 87 10 02 00 00    	or     %eax,0x210(%edi)
    2a1e:	83 c4 0c             	add    $0xc,%esp
    2a21:	5b                   	pop    %ebx
    2a22:	5e                   	pop    %esi
    2a23:	5f                   	pop    %edi
    2a24:	5d                   	pop    %ebp
    2a25:	c3                   	ret    

00002a26 <kernel_mktime>:
    2a26:	53                   	push   %ebx
    2a27:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    2a2b:	8b 51 14             	mov    0x14(%ecx),%edx
    2a2e:	8d 42 be             	lea    -0x42(%edx),%eax
    2a31:	89 d3                	mov    %edx,%ebx
    2a33:	83 eb 45             	sub    $0x45,%ebx
    2a36:	0f 48 d8             	cmovs  %eax,%ebx
    2a39:	c1 fb 02             	sar    $0x2,%ebx
    2a3c:	69 db 80 51 01 00    	imul   $0x15180,%ebx,%ebx
    2a42:	8d 42 ba             	lea    -0x46(%edx),%eax
    2a45:	69 c0 80 33 e1 01    	imul   $0x1e13380,%eax,%eax
    2a4b:	01 d8                	add    %ebx,%eax
    2a4d:	8b 59 10             	mov    0x10(%ecx),%ebx
    2a50:	03 04 9d e0 00 00 00 	add    0xe0(,%ebx,4),%eax
    2a57:	83 fb 01             	cmp    $0x1,%ebx
    2a5a:	7e 0e                	jle    2a6a <kernel_mktime+0x44>
    2a5c:	83 e2 03             	and    $0x3,%edx
    2a5f:	8d 98 80 ae fe ff    	lea    -0x15180(%eax),%ebx
    2a65:	85 d2                	test   %edx,%edx
    2a67:	0f 45 c3             	cmovne %ebx,%eax
    2a6a:	8b 51 0c             	mov    0xc(%ecx),%edx
    2a6d:	83 ea 01             	sub    $0x1,%edx
    2a70:	69 d2 80 51 01 00    	imul   $0x15180,%edx,%edx
    2a76:	01 d0                	add    %edx,%eax
    2a78:	69 51 08 10 0e 00 00 	imul   $0xe10,0x8(%ecx),%edx
    2a7f:	01 d0                	add    %edx,%eax
    2a81:	6b 51 04 3c          	imul   $0x3c,0x4(%ecx),%edx
    2a85:	01 d0                	add    %edx,%eax
    2a87:	03 01                	add    (%ecx),%eax
    2a89:	5b                   	pop    %ebx
    2a8a:	c3                   	ret    
