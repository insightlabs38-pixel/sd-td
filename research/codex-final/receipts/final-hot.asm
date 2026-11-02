000000000040121c <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&) [clone .cold]>:
  40121c:	bf 00 82 4b 00       	mov    $0x4b8200,%edi
  401221:	e8 73 04 00 00       	call   401699 <std::__throw_length_error(char const*)>

0000000000401226 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&) [clone .cold]>:
  401226:	bf 00 82 4b 00       	mov    $0x4b8200,%edi
  40122b:	e8 69 04 00 00       	call   401699 <std::__throw_length_error(char const*)>

000000000040a440 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)>:
  40a440:	41 57                	push   %r15
  40a442:	41 56                	push   %r14
  40a444:	49 89 fe             	mov    %rdi,%r14
  40a447:	41 55                	push   %r13
  40a449:	41 54                	push   %r12
  40a44b:	55                   	push   %rbp
  40a44c:	53                   	push   %rbx
  40a44d:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  40a454:	48 8b 8f 40 82 00 00 	mov    0x8240(%rdi),%rcx
  40a45b:	4c 8b 1f             	mov    (%rdi),%r11
  40a45e:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  40a463:	48 89 c8             	mov    %rcx,%rax
  40a466:	25 ff 07 00 00       	and    $0x7ff,%eax
  40a46b:	48 c1 e0 04          	shl    $0x4,%rax
  40a46f:	4c 8d 2c 07          	lea    (%rdi,%rax,1),%r13
  40a473:	41 8b bd 48 01 00 00 	mov    0x148(%r13),%edi
  40a47a:	41 83 7b 08 0b       	cmpl   $0xb,0x8(%r11)
  40a47f:	0f 84 2d 05 00 00    	je     40a9b2 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x572>
  40a485:	85 ff                	test   %edi,%edi
  40a487:	0f 84 83 0c 00 00    	je     40b110 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xcd0>
  40a48d:	4d 89 ec             	mov    %r13,%r12
  40a490:	49 8b 73 10          	mov    0x10(%r11),%rsi
  40a494:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40a498:	45 31 ff             	xor    %r15d,%r15d
  40a49b:	45 31 ed             	xor    %r13d,%r13d
  40a49e:	49 89 d2             	mov    %rdx,%r10
  40a4a1:	eb 12                	jmp    40a4b5 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x75>
  40a4a3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40a4a8:	49 83 c5 01          	add    $0x1,%r13
  40a4ac:	41 39 fd             	cmp    %edi,%r13d
  40a4af:	0f 83 76 04 00 00    	jae    40a92b <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x4eb>
  40a4b5:	8d 5f ff             	lea    -0x1(%rdi),%ebx
  40a4b8:	41 8d 45 08          	lea    0x8(%r13),%eax
  40a4bc:	4d 8b 8c 24 40 01 00 	mov    0x140(%r12),%r9
  40a4c3:	00 
  40a4c4:	48 89 cd             	mov    %rcx,%rbp
  40a4c7:	39 d8                	cmp    %ebx,%eax
  40a4c9:	0f 47 c3             	cmova  %ebx,%eax
  40a4cc:	41 8b 14 81          	mov    (%r9,%rax,4),%edx
  40a4d0:	89 d0                	mov    %edx,%eax
  40a4d2:	49 89 d0             	mov    %rdx,%r8
  40a4d5:	83 e2 7f             	and    $0x7f,%edx
  40a4d8:	25 ff ff ff 01       	and    $0x1ffffff,%eax
  40a4dd:	49 c1 e0 27          	shl    $0x27,%r8
  40a4e1:	0f 18 0c 86          	prefetcht0 (%rsi,%rax,4)
  40a4e5:	49 8b 46 08          	mov    0x8(%r14),%rax
  40a4e9:	49 c1 e8 2e          	shr    $0x2e,%r8
  40a4ed:	4e 8b 04 c0          	mov    (%rax,%r8,8),%r8
  40a4f1:	41 0f 18 0c 50       	prefetcht0 (%r8,%rdx,2)
  40a4f6:	45 8d 45 04          	lea    0x4(%r13),%r8d
  40a4fa:	49 8b 53 18          	mov    0x18(%r11),%rdx
  40a4fe:	41 39 d8             	cmp    %ebx,%r8d
  40a501:	44 0f 47 c3          	cmova  %ebx,%r8d
  40a505:	48 c1 e5 07          	shl    $0x7,%rbp
  40a509:	47 8b 04 81          	mov    (%r9,%r8,4),%r8d
  40a50d:	41 81 e0 ff ff ff 01 	and    $0x1ffffff,%r8d
  40a514:	46 8b 04 86          	mov    (%rsi,%r8,4),%r8d
  40a518:	42 0f 18 0c 82       	prefetcht0 (%rdx,%r8,4)
  40a51d:	47 8b 04 a9          	mov    (%r9,%r13,4),%r8d
  40a521:	45 89 c1             	mov    %r8d,%r9d
  40a524:	44 89 c3             	mov    %r8d,%ebx
  40a527:	41 83 e0 7f          	and    $0x7f,%r8d
  40a52b:	c1 eb 19             	shr    $0x19,%ebx
  40a52e:	41 81 e1 ff ff ff 01 	and    $0x1ffffff,%r9d
  40a535:	48 09 dd             	or     %rbx,%rbp
  40a538:	44 89 cb             	mov    %r9d,%ebx
  40a53b:	c1 eb 07             	shr    $0x7,%ebx
  40a53e:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
  40a543:	48 8b 1c d8          	mov    (%rax,%rbx,8),%rbx
  40a547:	46 0f b7 04 43       	movzwl (%rbx,%r8,2),%r8d
  40a54c:	4c 39 c5             	cmp    %r8,%rbp
  40a54f:	0f 85 53 ff ff ff    	jne    40a4a8 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x68>
  40a555:	45 89 c8             	mov    %r9d,%r8d
  40a558:	41 83 c7 01          	add    $0x1,%r15d
  40a55c:	42 8b 2c 86          	mov    (%rsi,%r8,4),%ebp
  40a560:	45 8d 41 01          	lea    0x1(%r9),%r8d
  40a564:	4a 8d 1c 85 00 00 00 	lea    0x0(,%r8,4),%rbx
  40a56b:	00 
  40a56c:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
  40a571:	42 3b 2c 86          	cmp    (%rsi,%r8,4),%ebp
  40a575:	0f 83 2d ff ff ff    	jae    40a4a8 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x68>
  40a57b:	49 8d 7e 40          	lea    0x40(%r14),%rdi
  40a57f:	44 89 7c 24 54       	mov    %r15d,0x54(%rsp)
  40a584:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
  40a589:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
  40a58e:	4c 89 64 24 60       	mov    %r12,0x60(%rsp)
  40a593:	e9 ec 00 00 00       	jmp    40a684 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x244>
  40a598:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40a59f:	00 
  40a5a0:	0f b7 06             	movzwl (%rsi),%eax
  40a5a3:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
  40a5a8:	49 89 df             	mov    %rbx,%r15
  40a5ab:	48 39 c3             	cmp    %rax,%rbx
  40a5ae:	48 89 c2             	mov    %rax,%rdx
  40a5b1:	48 0f 46 d3          	cmovbe %rbx,%rdx
  40a5b5:	49 c1 ef 07          	shr    $0x7,%r15
  40a5b9:	66 89 16             	mov    %dx,(%rsi)
  40a5bc:	4c 89 fa             	mov    %r15,%rdx
  40a5bf:	49 2b 96 40 82 00 00 	sub    0x8240(%r14),%rdx
  40a5c6:	48 81 fa ff 07 00 00 	cmp    $0x7ff,%rdx
  40a5cd:	0f 87 4d 01 00 00    	ja     40a720 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x2e0>
  40a5d3:	48 39 c3             	cmp    %rax,%rbx
  40a5d6:	4d 89 fc             	mov    %r15,%r12
  40a5d9:	44 89 f9             	mov    %r15d,%ecx
  40a5dc:	0f 92 c2             	setb   %dl
  40a5df:	41 81 e4 ff 07 00 00 	and    $0x7ff,%r12d
  40a5e6:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
  40a5ec:	49 c1 e4 04          	shl    $0x4,%r12
  40a5f0:	4d 01 f4             	add    %r14,%r12
  40a5f3:	41 8b 84 24 48 01 00 	mov    0x148(%r12),%eax
  40a5fa:	00 
  40a5fb:	49 8b bc 24 40 01 00 	mov    0x140(%r12),%rdi
  40a602:	00 
  40a603:	41 3b 84 24 4c 01 00 	cmp    0x14c(%r12),%eax
  40a60a:	00 
  40a60b:	0f 84 77 02 00 00    	je     40a888 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x448>
  40a611:	89 de                	mov    %ebx,%esi
  40a613:	c1 e6 19             	shl    $0x19,%esi
  40a616:	44 09 ee             	or     %r13d,%esi
  40a619:	89 34 87             	mov    %esi,(%rdi,%rax,4)
  40a61c:	0f b6 c2             	movzbl %dl,%eax
  40a61f:	0f b6 d2             	movzbl %dl,%edx
  40a622:	41 01 84 24 48 01 00 	add    %eax,0x148(%r12)
  40a629:	00 
  40a62a:	89 c8                	mov    %ecx,%eax
  40a62c:	44 89 f9             	mov    %r15d,%ecx
  40a62f:	c1 e8 06             	shr    $0x6,%eax
  40a632:	49 01 96 48 82 00 00 	add    %rdx,0x8248(%r14)
  40a639:	48 d3 e2             	shl    %cl,%rdx
  40a63c:	49 09 94 c6 40 81 00 	or     %rdx,0x8140(%r14,%rax,8)
  40a643:	00 
  40a644:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40a649:	49 8b 12             	mov    (%r10),%rdx
  40a64c:	49 8b 73 10          	mov    0x10(%r11),%rsi
  40a650:	48 8b 40 08          	mov    0x8(%rax),%rax
  40a654:	4a 8b 04 c0          	mov    (%rax,%r8,8),%rax
  40a658:	42 0f b7 04 48       	movzwl (%rax,%r9,2),%eax
  40a65d:	48 01 d8             	add    %rbx,%rax
  40a660:	48 39 d0             	cmp    %rdx,%rax
  40a663:	48 0f 47 c2          	cmova  %rdx,%rax
  40a667:	48 83 c5 01          	add    $0x1,%rbp
  40a66b:	49 89 02             	mov    %rax,(%r10)
  40a66e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40a673:	3b 2c 06             	cmp    (%rsi,%rax,1),%ebp
  40a676:	0f 83 84 02 00 00    	jae    40a900 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x4c0>
  40a67c:	49 8b 53 18          	mov    0x18(%r11),%rdx
  40a680:	49 8b 46 08          	mov    0x8(%r14),%rax
  40a684:	41 8b 4b 08          	mov    0x8(%r11),%ecx
  40a688:	44 8b 2c aa          	mov    (%rdx,%rbp,4),%r13d
  40a68c:	48 8d 1c ad 00 00 00 	lea    0x0(,%rbp,4),%rbx
  40a693:	00 
  40a694:	41 d3 ed             	shr    %cl,%r13d
  40a697:	44 89 e9             	mov    %r13d,%ecx
  40a69a:	c1 e9 07             	shr    $0x7,%ecx
  40a69d:	41 89 c8             	mov    %ecx,%r8d
  40a6a0:	4a 8d 34 c0          	lea    (%rax,%r8,8),%rsi
  40a6a4:	48 8b 06             	mov    (%rsi),%rax
  40a6a7:	48 3b 44 24 20       	cmp    0x20(%rsp),%rax
  40a6ac:	0f 84 36 01 00 00    	je     40a7e8 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x3a8>
  40a6b2:	45 89 e9             	mov    %r13d,%r9d
  40a6b5:	8b 3c 1a             	mov    (%rdx,%rbx,1),%edi
  40a6b8:	41 83 e1 7f          	and    $0x7f,%r9d
  40a6bc:	4a 8d 34 48          	lea    (%rax,%r9,2),%rsi
  40a6c0:	41 8b 43 0c          	mov    0xc(%r11),%eax
  40a6c4:	21 c7                	and    %eax,%edi
  40a6c6:	89 fb                	mov    %edi,%ebx
  40a6c8:	39 f8                	cmp    %edi,%eax
  40a6ca:	0f 85 d0 fe ff ff    	jne    40a5a0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x160>
  40a6d0:	49 8b 7b 20          	mov    0x20(%r11),%rdi
  40a6d4:	49 8b 43 28          	mov    0x28(%r11),%rax
  40a6d8:	48 29 f8             	sub    %rdi,%rax
  40a6db:	48 c1 f8 04          	sar    $0x4,%rax
  40a6df:	90                   	nop
  40a6e0:	48 85 c0             	test   %rax,%rax
  40a6e3:	7e 25                	jle    40a70a <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x2ca>
  40a6e5:	48 89 c1             	mov    %rax,%rcx
  40a6e8:	48 d1 f9             	sar    $1,%rcx
  40a6eb:	48 89 ca             	mov    %rcx,%rdx
  40a6ee:	48 c1 e2 04          	shl    $0x4,%rdx
  40a6f2:	48 01 fa             	add    %rdi,%rdx
  40a6f5:	48 39 2a             	cmp    %rbp,(%rdx)
  40a6f8:	73 1e                	jae    40a718 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x2d8>
  40a6fa:	48 29 c8             	sub    %rcx,%rax
  40a6fd:	48 8d 7a 10          	lea    0x10(%rdx),%rdi
  40a701:	48 83 e8 01          	sub    $0x1,%rax
  40a705:	48 85 c0             	test   %rax,%rax
  40a708:	7f db                	jg     40a6e5 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x2a5>
  40a70a:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  40a70e:	e9 8d fe ff ff       	jmp    40a5a0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x160>
  40a713:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40a718:	48 89 c8             	mov    %rcx,%rax
  40a71b:	eb c3                	jmp    40a6e0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x2a0>
  40a71d:	0f 1f 00             	nopl   (%rax)
  40a720:	48 39 c3             	cmp    %rax,%rbx
  40a723:	0f 83 1b ff ff ff    	jae    40a644 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x204>
  40a729:	4d 8b be 58 82 00 00 	mov    0x8258(%r14),%r15
  40a730:	49 8b b6 60 82 00 00 	mov    0x8260(%r14),%rsi
  40a737:	4d 8b a6 50 82 00 00 	mov    0x8250(%r14),%r12
  40a73e:	49 39 f7             	cmp    %rsi,%r15
  40a741:	0f 84 5b 07 00 00    	je     40aea2 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xa62>
  40a747:	49 89 1f             	mov    %rbx,(%r15)
  40a74a:	49 83 c7 10          	add    $0x10,%r15
  40a74e:	48 89 df             	mov    %rbx,%rdi
  40a751:	45 89 6f f8          	mov    %r13d,-0x8(%r15)
  40a755:	4d 89 be 58 82 00 00 	mov    %r15,0x8258(%r14)
  40a75c:	4d 29 e7             	sub    %r12,%r15
  40a75f:	4c 89 f9             	mov    %r15,%rcx
  40a762:	4b 8d 44 3c f0       	lea    -0x10(%r12,%r15,1),%rax
  40a767:	48 c1 f9 04          	sar    $0x4,%rcx
  40a76b:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40a76f:	48 83 e9 02          	sub    $0x2,%rcx
  40a773:	48 d1 f9             	sar    $1,%rcx
  40a776:	48 85 d2             	test   %rdx,%rdx
  40a779:	7e 5d                	jle    40a7d8 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x398>
  40a77b:	48 89 c8             	mov    %rcx,%rax
  40a77e:	48 c1 e0 04          	shl    $0x4,%rax
  40a782:	4c 01 e0             	add    %r12,%rax
  40a785:	48 8b 30             	mov    (%rax),%rsi
  40a788:	48 39 f7             	cmp    %rsi,%rdi
  40a78b:	0f 82 e7 00 00 00    	jb     40a878 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x438>
  40a791:	48 39 fe             	cmp    %rdi,%rsi
  40a794:	75 3a                	jne    40a7d0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x390>
  40a796:	44 8b 78 08          	mov    0x8(%rax),%r15d
  40a79a:	45 39 fd             	cmp    %r15d,%r13d
  40a79d:	73 31                	jae    40a7d0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x390>
  40a79f:	48 c1 e2 04          	shl    $0x4,%rdx
  40a7a3:	49 89 34 14          	mov    %rsi,(%r12,%rdx,1)
  40a7a7:	45 89 7c 14 08       	mov    %r15d,0x8(%r12,%rdx,1)
  40a7ac:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40a7b0:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40a7b4:	48 8d 74 0a ff       	lea    -0x1(%rdx,%rcx,1),%rsi
  40a7b9:	48 89 ca             	mov    %rcx,%rdx
  40a7bc:	48 85 c9             	test   %rcx,%rcx
  40a7bf:	74 17                	je     40a7d8 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x398>
  40a7c1:	48 89 f1             	mov    %rsi,%rcx
  40a7c4:	48 d1 f9             	sar    $1,%rcx
  40a7c7:	eb b2                	jmp    40a77b <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x33b>
  40a7c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40a7d0:	48 c1 e2 04          	shl    $0x4,%rdx
  40a7d4:	49 8d 04 14          	lea    (%r12,%rdx,1),%rax
  40a7d8:	48 89 38             	mov    %rdi,(%rax)
  40a7db:	44 89 68 08          	mov    %r13d,0x8(%rax)
  40a7df:	e9 60 fe ff ff       	jmp    40a644 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x204>
  40a7e4:	0f 1f 40 00          	nopl   0x0(%rax)
  40a7e8:	49 8b 7e 28          	mov    0x28(%r14),%rdi
  40a7ec:	89 4c 24 7c          	mov    %ecx,0x7c(%rsp)
  40a7f0:	48 89 f8             	mov    %rdi,%rax
  40a7f3:	49 2b 46 20          	sub    0x20(%r14),%rax
  40a7f7:	48 c1 e0 06          	shl    $0x6,%rax
  40a7fb:	49 03 46 38          	add    0x38(%r14),%rax
  40a7ff:	0f 11 00             	movups %xmm0,(%rax)
  40a802:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  40a806:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  40a80a:	0f 11 40 30          	movups %xmm0,0x30(%rax)
  40a80e:	0f 11 40 40          	movups %xmm0,0x40(%rax)
  40a812:	0f 11 40 50          	movups %xmm0,0x50(%rax)
  40a816:	0f 11 40 60          	movups %xmm0,0x60(%rax)
  40a81a:	0f 11 40 70          	movups %xmm0,0x70(%rax)
  40a81e:	0f 11 80 80 00 00 00 	movups %xmm0,0x80(%rax)
  40a825:	0f 11 80 90 00 00 00 	movups %xmm0,0x90(%rax)
  40a82c:	0f 11 80 a0 00 00 00 	movups %xmm0,0xa0(%rax)
  40a833:	0f 11 80 b0 00 00 00 	movups %xmm0,0xb0(%rax)
  40a83a:	0f 11 80 c0 00 00 00 	movups %xmm0,0xc0(%rax)
  40a841:	0f 11 80 d0 00 00 00 	movups %xmm0,0xd0(%rax)
  40a848:	0f 11 80 e0 00 00 00 	movups %xmm0,0xe0(%rax)
  40a84f:	0f 11 80 f0 00 00 00 	movups %xmm0,0xf0(%rax)
  40a856:	48 89 06             	mov    %rax,(%rsi)
  40a859:	49 3b 7e 30          	cmp    0x30(%r14),%rdi
  40a85d:	0f 84 15 01 00 00    	je     40a978 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x538>
  40a863:	89 0f                	mov    %ecx,(%rdi)
  40a865:	48 83 c7 04          	add    $0x4,%rdi
  40a869:	49 89 7e 28          	mov    %rdi,0x28(%r14)
  40a86d:	e9 40 fe ff ff       	jmp    40a6b2 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x272>
  40a872:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  40a878:	44 8b 78 08          	mov    0x8(%rax),%r15d
  40a87c:	e9 1e ff ff ff       	jmp    40a79f <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x35f>
  40a881:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40a888:	be 10 00 00 00       	mov    $0x10,%esi
  40a88d:	01 c0                	add    %eax,%eax
  40a88f:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40a894:	39 f0                	cmp    %esi,%eax
  40a896:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40a89b:	0f 42 c6             	cmovb  %esi,%eax
  40a89e:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  40a8a3:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
  40a8a7:	41 89 84 24 4c 01 00 	mov    %eax,0x14c(%r12)
  40a8ae:	00 
  40a8af:	8d 34 85 00 00 00 00 	lea    0x0(,%rax,4),%esi
  40a8b6:	88 54 24 28          	mov    %dl,0x28(%rsp)
  40a8ba:	e8 81 94 03 00       	call   443d40 <__libc_realloc>
  40a8bf:	4d 8b 1e             	mov    (%r14),%r11
  40a8c2:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
  40a8c6:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40a8ca:	49 89 84 24 40 01 00 	mov    %rax,0x140(%r12)
  40a8d1:	00 
  40a8d2:	48 89 c7             	mov    %rax,%rdi
  40a8d5:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40a8da:	41 8b 84 24 48 01 00 	mov    0x148(%r12),%eax
  40a8e1:	00 
  40a8e2:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40a8e7:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  40a8ec:	0f b6 54 24 28       	movzbl 0x28(%rsp),%edx
  40a8f1:	e9 1b fd ff ff       	jmp    40a611 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x1d1>
  40a8f6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40a8fd:	00 00 00 
  40a900:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
  40a905:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
  40a90a:	44 8b 7c 24 54       	mov    0x54(%rsp),%r15d
  40a90f:	49 8b 8e 40 82 00 00 	mov    0x8240(%r14),%rcx
  40a916:	41 8b bc 24 48 01 00 	mov    0x148(%r12),%edi
  40a91d:	00 
  40a91e:	49 83 c5 01          	add    $0x1,%r13
  40a922:	41 39 fd             	cmp    %edi,%r13d
  40a925:	0f 82 8a fb ff ff    	jb     40a4b5 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x75>
  40a92b:	4d 89 e5             	mov    %r12,%r13
  40a92e:	44 89 f8             	mov    %r15d,%eax
  40a931:	48 89 ca             	mov    %rcx,%rdx
  40a934:	48 c7 c6 fe ff ff ff 	mov    $0xfffffffffffffffe,%rsi
  40a93b:	49 29 be 48 82 00 00 	sub    %rdi,0x8248(%r14)
  40a942:	48 c1 ea 06          	shr    $0x6,%rdx
  40a946:	48 d3 c6             	rol    %cl,%rsi
  40a949:	41 c7 85 48 01 00 00 	movl   $0x0,0x148(%r13)
  40a950:	00 00 00 00 
  40a954:	83 e2 1f             	and    $0x1f,%edx
  40a957:	49 21 b4 d6 40 81 00 	and    %rsi,0x8140(%r14,%rdx,8)
  40a95e:	00 
  40a95f:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  40a966:	5b                   	pop    %rbx
  40a967:	5d                   	pop    %rbp
  40a968:	41 5c                	pop    %r12
  40a96a:	41 5d                	pop    %r13
  40a96c:	41 5e                	pop    %r14
  40a96e:	41 5f                	pop    %r15
  40a970:	c3                   	ret
  40a971:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40a978:	48 8d 74 24 7c       	lea    0x7c(%rsp),%rsi
  40a97d:	49 8d 7e 20          	lea    0x20(%r14),%rdi
  40a981:	4c 89 54 24 30       	mov    %r10,0x30(%rsp)
  40a986:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
  40a98b:	e8 d0 d9 ff ff       	call   408360 <void std::vector<unsigned int, std::allocator<unsigned int> >::_M_realloc_append<unsigned int const&>(unsigned int const&)>
  40a990:	49 8b 46 08          	mov    0x8(%r14),%rax
  40a994:	4d 8b 1e             	mov    (%r14),%r11
  40a997:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40a99b:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
  40a9a0:	4c 8b 54 24 30       	mov    0x30(%rsp),%r10
  40a9a5:	49 8b 53 18          	mov    0x18(%r11),%rdx
  40a9a9:	4a 8b 04 c0          	mov    (%rax,%r8,8),%rax
  40a9ad:	e9 00 fd ff ff       	jmp    40a6b2 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x272>
  40a9b2:	85 ff                	test   %edi,%edi
  40a9b4:	0f 84 56 07 00 00    	je     40b110 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xcd0>
  40a9ba:	c7 44 24 54 00 00 00 	movl   $0x0,0x54(%rsp)
  40a9c1:	00 
  40a9c2:	31 ed                	xor    %ebp,%ebp
  40a9c4:	4d 89 ef             	mov    %r13,%r15
  40a9c7:	49 89 d2             	mov    %rdx,%r10
  40a9ca:	4d 8b 4b 10          	mov    0x10(%r11),%r9
  40a9ce:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40a9d2:	eb 10                	jmp    40a9e4 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x5a4>
  40a9d4:	0f 1f 40 00          	nopl   0x0(%rax)
  40a9d8:	48 83 c5 01          	add    $0x1,%rbp
  40a9dc:	39 fd                	cmp    %edi,%ebp
  40a9de:	0f 83 70 04 00 00    	jae    40ae54 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xa14>
  40a9e4:	44 8d 47 ff          	lea    -0x1(%rdi),%r8d
  40a9e8:	8d 45 08             	lea    0x8(%rbp),%eax
  40a9eb:	49 8b b7 40 01 00 00 	mov    0x140(%r15),%rsi
  40a9f2:	4d 8b 6b 18          	mov    0x18(%r11),%r13
  40a9f6:	44 39 c0             	cmp    %r8d,%eax
  40a9f9:	41 0f 47 c0          	cmova  %r8d,%eax
  40a9fd:	8b 14 86             	mov    (%rsi,%rax,4),%edx
  40aa00:	89 d0                	mov    %edx,%eax
  40aa02:	48 89 d3             	mov    %rdx,%rbx
  40aa05:	83 e2 7f             	and    $0x7f,%edx
  40aa08:	25 ff ff ff 01       	and    $0x1ffffff,%eax
  40aa0d:	48 c1 e3 27          	shl    $0x27,%rbx
  40aa11:	41 0f 18 0c 81       	prefetcht0 (%r9,%rax,4)
  40aa16:	49 8b 46 08          	mov    0x8(%r14),%rax
  40aa1a:	48 c1 eb 2e          	shr    $0x2e,%rbx
  40aa1e:	48 8b 1c d8          	mov    (%rax,%rbx,8),%rbx
  40aa22:	0f 18 0c 53          	prefetcht0 (%rbx,%rdx,2)
  40aa26:	8d 55 04             	lea    0x4(%rbp),%edx
  40aa29:	48 89 cb             	mov    %rcx,%rbx
  40aa2c:	44 39 c2             	cmp    %r8d,%edx
  40aa2f:	41 0f 47 d0          	cmova  %r8d,%edx
  40aa33:	48 c1 e3 07          	shl    $0x7,%rbx
  40aa37:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  40aa3a:	81 e2 ff ff ff 01    	and    $0x1ffffff,%edx
  40aa40:	41 8b 14 91          	mov    (%r9,%rdx,4),%edx
  40aa44:	41 0f 18 4c 95 00    	prefetcht0 0x0(%r13,%rdx,4)
  40aa4a:	8b 14 ae             	mov    (%rsi,%rbp,4),%edx
  40aa4d:	89 d6                	mov    %edx,%esi
  40aa4f:	41 89 d0             	mov    %edx,%r8d
  40aa52:	83 e2 7f             	and    $0x7f,%edx
  40aa55:	41 c1 e8 19          	shr    $0x19,%r8d
  40aa59:	81 e6 ff ff ff 01    	and    $0x1ffffff,%esi
  40aa5f:	4c 09 c3             	or     %r8,%rbx
  40aa62:	41 89 f0             	mov    %esi,%r8d
  40aa65:	41 c1 e8 07          	shr    $0x7,%r8d
  40aa69:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
  40aa6e:	4e 8b 04 c0          	mov    (%rax,%r8,8),%r8
  40aa72:	41 0f b7 14 50       	movzwl (%r8,%rdx,2),%edx
  40aa77:	48 39 d3             	cmp    %rdx,%rbx
  40aa7a:	0f 85 58 ff ff ff    	jne    40a9d8 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x598>
  40aa80:	89 f2                	mov    %esi,%edx
  40aa82:	83 44 24 54 01       	addl   $0x1,0x54(%rsp)
  40aa87:	45 8b 24 91          	mov    (%r9,%rdx,4),%r12d
  40aa8b:	8d 56 01             	lea    0x1(%rsi),%edx
  40aa8e:	48 8d 34 95 00 00 00 	lea    0x0(,%rdx,4),%rsi
  40aa95:	00 
  40aa96:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
  40aa9b:	45 3b 24 91          	cmp    (%r9,%rdx,4),%r12d
  40aa9f:	0f 83 33 ff ff ff    	jae    40a9d8 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x598>
  40aaa5:	49 8d 7e 40          	lea    0x40(%r14),%rdi
  40aaa9:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
  40aaae:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
  40aab3:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
  40aab8:	e9 e4 00 00 00       	jmp    40aba1 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x761>
  40aabd:	0f 1f 00             	nopl   (%rax)
  40aac0:	41 0f b7 01          	movzwl (%r9),%eax
  40aac4:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
  40aac9:	49 89 dd             	mov    %rbx,%r13
  40aacc:	48 39 c3             	cmp    %rax,%rbx
  40aacf:	48 89 c6             	mov    %rax,%rsi
  40aad2:	48 0f 46 f3          	cmovbe %rbx,%rsi
  40aad6:	49 c1 ed 07          	shr    $0x7,%r13
  40aada:	66 41 89 31          	mov    %si,(%r9)
  40aade:	4c 89 ee             	mov    %r13,%rsi
  40aae1:	49 2b b6 40 82 00 00 	sub    0x8240(%r14),%rsi
  40aae8:	48 81 fe ff 07 00 00 	cmp    $0x7ff,%rsi
  40aaef:	0f 87 5b 01 00 00    	ja     40ac50 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x810>
  40aaf5:	48 39 c3             	cmp    %rax,%rbx
  40aaf8:	4c 89 ed             	mov    %r13,%rbp
  40aafb:	45 89 e9             	mov    %r13d,%r9d
  40aafe:	41 0f 92 c7          	setb   %r15b
  40ab02:	81 e5 ff 07 00 00    	and    $0x7ff,%ebp
  40ab08:	41 81 e1 ff 07 00 00 	and    $0x7ff,%r9d
  40ab0f:	48 c1 e5 04          	shl    $0x4,%rbp
  40ab13:	4c 01 f5             	add    %r14,%rbp
  40ab16:	8b 85 48 01 00 00    	mov    0x148(%rbp),%eax
  40ab1c:	48 8b bd 40 01 00 00 	mov    0x140(%rbp),%rdi
  40ab23:	3b 85 4c 01 00 00    	cmp    0x14c(%rbp),%eax
  40ab29:	0f 84 91 02 00 00    	je     40adc0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x980>
  40ab2f:	89 de                	mov    %ebx,%esi
  40ab31:	41 c1 e9 06          	shr    $0x6,%r9d
  40ab35:	c1 e6 19             	shl    $0x19,%esi
  40ab38:	09 ce                	or     %ecx,%esi
  40ab3a:	44 89 e9             	mov    %r13d,%ecx
  40ab3d:	89 34 87             	mov    %esi,(%rdi,%rax,4)
  40ab40:	41 0f b6 c7          	movzbl %r15b,%eax
  40ab44:	45 0f b6 ff          	movzbl %r15b,%r15d
  40ab48:	01 85 48 01 00 00    	add    %eax,0x148(%rbp)
  40ab4e:	4d 01 be 48 82 00 00 	add    %r15,0x8248(%r14)
  40ab55:	49 d3 e7             	shl    %cl,%r15
  40ab58:	4f 09 bc ce 40 81 00 	or     %r15,0x8140(%r14,%r9,8)
  40ab5f:	00 
  40ab60:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40ab65:	4d 8b 4b 10          	mov    0x10(%r11),%r9
  40ab69:	48 8b 40 08          	mov    0x8(%rax),%rax
  40ab6d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  40ab71:	49 8b 12             	mov    (%r10),%rdx
  40ab74:	42 0f b7 04 40       	movzwl (%rax,%r8,2),%eax
  40ab79:	48 01 d8             	add    %rbx,%rax
  40ab7c:	48 39 d0             	cmp    %rdx,%rax
  40ab7f:	48 0f 47 c2          	cmova  %rdx,%rax
  40ab83:	49 83 c4 01          	add    $0x1,%r12
  40ab87:	49 89 02             	mov    %rax,(%r10)
  40ab8a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40ab8f:	45 3b 24 01          	cmp    (%r9,%rax,1),%r12d
  40ab93:	0f 83 97 02 00 00    	jae    40ae30 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x9f0>
  40ab99:	4d 8b 6b 18          	mov    0x18(%r11),%r13
  40ab9d:	49 8b 46 08          	mov    0x8(%r14),%rax
  40aba1:	43 8b 74 a5 00       	mov    0x0(%r13,%r12,4),%esi
  40aba6:	4a 8d 1c a5 00 00 00 	lea    0x0(,%r12,4),%rbx
  40abad:	00 
  40abae:	89 f1                	mov    %esi,%ecx
  40abb0:	c1 ee 12             	shr    $0x12,%esi
  40abb3:	89 f2                	mov    %esi,%edx
  40abb5:	c1 e9 0b             	shr    $0xb,%ecx
  40abb8:	48 8d 3c d0          	lea    (%rax,%rdx,8),%rdi
  40abbc:	48 8b 07             	mov    (%rdi),%rax
  40abbf:	48 3b 44 24 20       	cmp    0x20(%rsp),%rax
  40abc4:	0f 84 26 01 00 00    	je     40acf0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x8b0>
  40abca:	41 89 c8             	mov    %ecx,%r8d
  40abcd:	41 83 e0 7f          	and    $0x7f,%r8d
  40abd1:	4e 8d 0c 40          	lea    (%rax,%r8,2),%r9
  40abd5:	41 8b 44 1d 00       	mov    0x0(%r13,%rbx,1),%eax
  40abda:	89 c3                	mov    %eax,%ebx
  40abdc:	81 e3 ff 07 00 00    	and    $0x7ff,%ebx
  40abe2:	81 fb ff 07 00 00    	cmp    $0x7ff,%ebx
  40abe8:	0f 85 d2 fe ff ff    	jne    40aac0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x680>
  40abee:	41 8b 73 0c          	mov    0xc(%r11),%esi
  40abf2:	21 f0                	and    %esi,%eax
  40abf4:	89 c3                	mov    %eax,%ebx
  40abf6:	39 c6                	cmp    %eax,%esi
  40abf8:	0f 85 c2 fe ff ff    	jne    40aac0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x680>
  40abfe:	49 8b 5b 20          	mov    0x20(%r11),%rbx
  40ac02:	49 8b 43 28          	mov    0x28(%r11),%rax
  40ac06:	48 29 d8             	sub    %rbx,%rax
  40ac09:	48 c1 f8 04          	sar    $0x4,%rax
  40ac0d:	0f 1f 00             	nopl   (%rax)
  40ac10:	48 85 c0             	test   %rax,%rax
  40ac13:	7e 25                	jle    40ac3a <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x7fa>
  40ac15:	48 89 c7             	mov    %rax,%rdi
  40ac18:	48 d1 ff             	sar    $1,%rdi
  40ac1b:	48 89 fe             	mov    %rdi,%rsi
  40ac1e:	48 c1 e6 04          	shl    $0x4,%rsi
  40ac22:	48 01 de             	add    %rbx,%rsi
  40ac25:	4c 39 26             	cmp    %r12,(%rsi)
  40ac28:	73 1e                	jae    40ac48 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x808>
  40ac2a:	48 29 f8             	sub    %rdi,%rax
  40ac2d:	48 8d 5e 10          	lea    0x10(%rsi),%rbx
  40ac31:	48 83 e8 01          	sub    $0x1,%rax
  40ac35:	48 85 c0             	test   %rax,%rax
  40ac38:	7f db                	jg     40ac15 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x7d5>
  40ac3a:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  40ac3e:	e9 7d fe ff ff       	jmp    40aac0 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x680>
  40ac43:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40ac48:	48 89 f8             	mov    %rdi,%rax
  40ac4b:	eb c3                	jmp    40ac10 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x7d0>
  40ac4d:	0f 1f 00             	nopl   (%rax)
  40ac50:	48 39 c3             	cmp    %rax,%rbx
  40ac53:	0f 83 07 ff ff ff    	jae    40ab60 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x720>
  40ac59:	4d 8b be 58 82 00 00 	mov    0x8258(%r14),%r15
  40ac60:	4d 8b ae 60 82 00 00 	mov    0x8260(%r14),%r13
  40ac67:	49 8b ae 50 82 00 00 	mov    0x8250(%r14),%rbp
  40ac6e:	4d 39 ef             	cmp    %r13,%r15
  40ac71:	0f 84 5e 03 00 00    	je     40afd5 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xb95>
  40ac77:	49 89 1f             	mov    %rbx,(%r15)
  40ac7a:	49 83 c7 10          	add    $0x10,%r15
  40ac7e:	49 89 dd             	mov    %rbx,%r13
  40ac81:	41 89 4f f8          	mov    %ecx,-0x8(%r15)
  40ac85:	4d 89 be 58 82 00 00 	mov    %r15,0x8258(%r14)
  40ac8c:	49 29 ef             	sub    %rbp,%r15
  40ac8f:	4c 89 ff             	mov    %r15,%rdi
  40ac92:	4a 8d 44 3d f0       	lea    -0x10(%rbp,%r15,1),%rax
  40ac97:	48 c1 ff 04          	sar    $0x4,%rdi
  40ac9b:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
  40ac9f:	48 83 ef 02          	sub    $0x2,%rdi
  40aca3:	48 d1 ff             	sar    $1,%rdi
  40aca6:	48 85 f6             	test   %rsi,%rsi
  40aca9:	7e 31                	jle    40acdc <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x89c>
  40acab:	48 89 f8             	mov    %rdi,%rax
  40acae:	48 c1 e0 04          	shl    $0x4,%rax
  40acb2:	48 01 e8             	add    %rbp,%rax
  40acb5:	4c 8b 08             	mov    (%rax),%r9
  40acb8:	4d 39 cd             	cmp    %r9,%r13
  40acbb:	0f 82 bf 00 00 00    	jb     40ad80 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x940>
  40acc1:	4d 39 e9             	cmp    %r13,%r9
  40acc4:	75 0d                	jne    40acd3 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x893>
  40acc6:	44 8b 78 08          	mov    0x8(%rax),%r15d
  40acca:	44 39 f9             	cmp    %r15d,%ecx
  40accd:	0f 82 b1 00 00 00    	jb     40ad84 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x944>
  40acd3:	48 c1 e6 04          	shl    $0x4,%rsi
  40acd7:	48 8d 44 35 00       	lea    0x0(%rbp,%rsi,1),%rax
  40acdc:	4c 89 28             	mov    %r13,(%rax)
  40acdf:	89 48 08             	mov    %ecx,0x8(%rax)
  40ace2:	e9 79 fe ff ff       	jmp    40ab60 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x720>
  40ace7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40acee:	00 00 
  40acf0:	4d 8b 46 28          	mov    0x28(%r14),%r8
  40acf4:	89 74 24 7c          	mov    %esi,0x7c(%rsp)
  40acf8:	4c 89 c0             	mov    %r8,%rax
  40acfb:	49 2b 46 20          	sub    0x20(%r14),%rax
  40acff:	48 c1 e0 06          	shl    $0x6,%rax
  40ad03:	49 03 46 38          	add    0x38(%r14),%rax
  40ad07:	0f 11 00             	movups %xmm0,(%rax)
  40ad0a:	0f 11 40 10          	movups %xmm0,0x10(%rax)
  40ad0e:	0f 11 40 20          	movups %xmm0,0x20(%rax)
  40ad12:	0f 11 40 30          	movups %xmm0,0x30(%rax)
  40ad16:	0f 11 40 40          	movups %xmm0,0x40(%rax)
  40ad1a:	0f 11 40 50          	movups %xmm0,0x50(%rax)
  40ad1e:	0f 11 40 60          	movups %xmm0,0x60(%rax)
  40ad22:	0f 11 40 70          	movups %xmm0,0x70(%rax)
  40ad26:	0f 11 80 80 00 00 00 	movups %xmm0,0x80(%rax)
  40ad2d:	0f 11 80 90 00 00 00 	movups %xmm0,0x90(%rax)
  40ad34:	0f 11 80 a0 00 00 00 	movups %xmm0,0xa0(%rax)
  40ad3b:	0f 11 80 b0 00 00 00 	movups %xmm0,0xb0(%rax)
  40ad42:	0f 11 80 c0 00 00 00 	movups %xmm0,0xc0(%rax)
  40ad49:	0f 11 80 d0 00 00 00 	movups %xmm0,0xd0(%rax)
  40ad50:	0f 11 80 e0 00 00 00 	movups %xmm0,0xe0(%rax)
  40ad57:	0f 11 80 f0 00 00 00 	movups %xmm0,0xf0(%rax)
  40ad5e:	48 89 07             	mov    %rax,(%rdi)
  40ad61:	4d 3b 46 30          	cmp    0x30(%r14),%r8
  40ad65:	0f 84 f5 00 00 00    	je     40ae60 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xa20>
  40ad6b:	41 89 30             	mov    %esi,(%r8)
  40ad6e:	49 83 c0 04          	add    $0x4,%r8
  40ad72:	4d 89 46 28          	mov    %r8,0x28(%r14)
  40ad76:	e9 4f fe ff ff       	jmp    40abca <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x78a>
  40ad7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40ad80:	44 8b 78 08          	mov    0x8(%rax),%r15d
  40ad84:	48 c1 e6 04          	shl    $0x4,%rsi
  40ad88:	4c 89 4c 35 00       	mov    %r9,0x0(%rbp,%rsi,1)
  40ad8d:	44 89 7c 35 08       	mov    %r15d,0x8(%rbp,%rsi,1)
  40ad92:	48 8d 77 ff          	lea    -0x1(%rdi),%rsi
  40ad96:	48 c1 ee 3f          	shr    $0x3f,%rsi
  40ad9a:	4c 8d 4c 3e ff       	lea    -0x1(%rsi,%rdi,1),%r9
  40ad9f:	48 89 fe             	mov    %rdi,%rsi
  40ada2:	48 85 ff             	test   %rdi,%rdi
  40ada5:	0f 84 31 ff ff ff    	je     40acdc <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x89c>
  40adab:	4c 89 cf             	mov    %r9,%rdi
  40adae:	48 d1 ff             	sar    $1,%rdi
  40adb1:	e9 f5 fe ff ff       	jmp    40acab <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x86b>
  40adb6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40adbd:	00 00 00 
  40adc0:	be 10 00 00 00       	mov    $0x10,%esi
  40adc5:	01 c0                	add    %eax,%eax
  40adc7:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40adcc:	39 f0                	cmp    %esi,%eax
  40adce:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  40add3:	0f 42 c6             	cmovb  %esi,%eax
  40add6:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
  40addb:	44 89 4c 24 30       	mov    %r9d,0x30(%rsp)
  40ade0:	89 85 4c 01 00 00    	mov    %eax,0x14c(%rbp)
  40ade6:	8d 34 85 00 00 00 00 	lea    0x0(,%rax,4),%esi
  40aded:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
  40adf1:	e8 4a 8f 03 00       	call   443d40 <__libc_realloc>
  40adf6:	4d 8b 1e             	mov    (%r14),%r11
  40adf9:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40adfe:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40ae02:	48 89 85 40 01 00 00 	mov    %rax,0x140(%rbp)
  40ae09:	48 89 c7             	mov    %rax,%rdi
  40ae0c:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
  40ae11:	8b 85 48 01 00 00    	mov    0x148(%rbp),%eax
  40ae17:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
  40ae1c:	44 8b 4c 24 30       	mov    0x30(%rsp),%r9d
  40ae21:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
  40ae25:	e9 05 fd ff ff       	jmp    40ab2f <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x6ef>
  40ae2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  40ae30:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
  40ae35:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
  40ae3a:	49 8b 8e 40 82 00 00 	mov    0x8240(%r14),%rcx
  40ae41:	41 8b bf 48 01 00 00 	mov    0x148(%r15),%edi
  40ae48:	48 83 c5 01          	add    $0x1,%rbp
  40ae4c:	39 fd                	cmp    %edi,%ebp
  40ae4e:	0f 82 90 fb ff ff    	jb     40a9e4 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x5a4>
  40ae54:	8b 44 24 54          	mov    0x54(%rsp),%eax
  40ae58:	4d 89 fd             	mov    %r15,%r13
  40ae5b:	e9 d1 fa ff ff       	jmp    40a931 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x4f1>
  40ae60:	48 8d 74 24 7c       	lea    0x7c(%rsp),%rsi
  40ae65:	49 8d 7e 20          	lea    0x20(%r14),%rdi
  40ae69:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
  40ae6e:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
  40ae73:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
  40ae77:	e8 e4 d4 ff ff       	call   408360 <void std::vector<unsigned int, std::allocator<unsigned int> >::_M_realloc_append<unsigned int const&>(unsigned int const&)>
  40ae7c:	49 8b 46 08          	mov    0x8(%r14),%rax
  40ae80:	4d 8b 1e             	mov    (%r14),%r11
  40ae83:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40ae87:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
  40ae8c:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
  40ae91:	4d 8b 6b 18          	mov    0x18(%r11),%r13
  40ae95:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
  40ae99:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  40ae9d:	e9 28 fd ff ff       	jmp    40abca <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x78a>
  40aea2:	48 b8 ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rax
  40aea9:	ff ff 07 
  40aeac:	4d 89 fb             	mov    %r15,%r11
  40aeaf:	4d 29 e3             	sub    %r12,%r11
  40aeb2:	4c 89 da             	mov    %r11,%rdx
  40aeb5:	48 c1 fa 04          	sar    $0x4,%rdx
  40aeb9:	48 39 c2             	cmp    %rax,%rdx
  40aebc:	0f 84 5a 63 ff ff    	je     40121c <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&) [clone .cold]>
  40aec2:	48 85 d2             	test   %rdx,%rdx
  40aec5:	b8 01 00 00 00       	mov    $0x1,%eax
  40aeca:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
  40aecf:	48 0f 45 c2          	cmovne %rdx,%rax
  40aed3:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
  40aed8:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  40aedd:	48 01 d0             	add    %rdx,%rax
  40aee0:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  40aee5:	48 ba ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rdx
  40aeec:	ff ff 07 
  40aeef:	48 39 d0             	cmp    %rdx,%rax
  40aef2:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
  40aef7:	48 0f 47 c2          	cmova  %rdx,%rax
  40aefb:	48 c1 e0 04          	shl    $0x4,%rax
  40aeff:	48 89 c7             	mov    %rax,%rdi
  40af02:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40af07:	e8 d4 43 00 00       	call   40f2e0 <operator new(unsigned long)>
  40af0c:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
  40af11:	4d 39 e7             	cmp    %r12,%r15
  40af14:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  40af19:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
  40af1e:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
  40af23:	48 89 c1             	mov    %rax,%rcx
  40af26:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40af2a:	4a 89 1c 18          	mov    %rbx,(%rax,%r11,1)
  40af2e:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
  40af33:	46 89 6c 18 08       	mov    %r13d,0x8(%rax,%r11,1)
  40af38:	74 22                	je     40af5c <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xb1c>
  40af3a:	48 89 c2             	mov    %rax,%rdx
  40af3d:	4c 89 e0             	mov    %r12,%rax
  40af40:	f3 0f 6f 08          	movdqu (%rax),%xmm1
  40af44:	48 83 c0 10          	add    $0x10,%rax
  40af48:	48 83 c2 10          	add    $0x10,%rdx
  40af4c:	0f 11 4a f0          	movups %xmm1,-0x10(%rdx)
  40af50:	49 39 c7             	cmp    %rax,%r15
  40af53:	75 eb                	jne    40af40 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xb00>
  40af55:	4d 29 e7             	sub    %r12,%r15
  40af58:	4a 8d 04 39          	lea    (%rcx,%r15,1),%rax
  40af5c:	4c 8d 78 10          	lea    0x10(%rax),%r15
  40af60:	4d 85 e4             	test   %r12,%r12
  40af63:	74 41                	je     40afa6 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xb66>
  40af65:	4c 29 e6             	sub    %r12,%rsi
  40af68:	4c 89 e7             	mov    %r12,%rdi
  40af6b:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
  40af70:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
  40af75:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40af7a:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  40af7f:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  40af84:	e8 87 42 00 00       	call   40f210 <operator delete(void*, unsigned long)>
  40af89:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
  40af8e:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
  40af93:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40af97:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40af9c:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  40afa1:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  40afa6:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  40afab:	49 89 8e 50 82 00 00 	mov    %rcx,0x8250(%r14)
  40afb2:	49 89 cc             	mov    %rcx,%r12
  40afb5:	44 8b 68 08          	mov    0x8(%rax),%r13d
  40afb9:	48 8b 38             	mov    (%rax),%rdi
  40afbc:	4d 89 be 58 82 00 00 	mov    %r15,0x8258(%r14)
  40afc3:	48 01 ca             	add    %rcx,%rdx
  40afc6:	4d 8b 1e             	mov    (%r14),%r11
  40afc9:	49 89 96 60 82 00 00 	mov    %rdx,0x8260(%r14)
  40afd0:	e9 87 f7 ff ff       	jmp    40a75c <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x31c>
  40afd5:	48 b8 ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rax
  40afdc:	ff ff 07 
  40afdf:	4d 89 ef             	mov    %r13,%r15
  40afe2:	49 29 ef             	sub    %rbp,%r15
  40afe5:	4c 89 fe             	mov    %r15,%rsi
  40afe8:	48 c1 fe 04          	sar    $0x4,%rsi
  40afec:	48 39 c6             	cmp    %rax,%rsi
  40afef:	0f 84 27 62 ff ff    	je     40121c <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&) [clone .cold]>
  40aff5:	48 85 f6             	test   %rsi,%rsi
  40aff8:	b8 01 00 00 00       	mov    $0x1,%eax
  40affd:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40b002:	48 0f 45 c6          	cmovne %rsi,%rax
  40b006:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  40b00b:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
  40b010:	48 01 f0             	add    %rsi,%rax
  40b013:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
  40b017:	48 be ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rsi
  40b01e:	ff ff 07 
  40b021:	48 39 f0             	cmp    %rsi,%rax
  40b024:	48 0f 47 c6          	cmova  %rsi,%rax
  40b028:	48 c1 e0 04          	shl    $0x4,%rax
  40b02c:	48 89 c7             	mov    %rax,%rdi
  40b02f:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40b034:	e8 a7 42 00 00       	call   40f2e0 <operator new(unsigned long)>
  40b039:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
  40b03d:	49 39 ed             	cmp    %rbp,%r13
  40b040:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40b044:	4a 8d 34 38          	lea    (%rax,%r15,1),%rsi
  40b048:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
  40b04d:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
  40b052:	49 89 c1             	mov    %rax,%r9
  40b055:	48 89 1e             	mov    %rbx,(%rsi)
  40b058:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40b05d:	89 4e 08             	mov    %ecx,0x8(%rsi)
  40b060:	74 33                	je     40b095 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xc55>
  40b062:	48 89 e9             	mov    %rbp,%rcx
  40b065:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40b06c:	00 00 00 00 
  40b070:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40b077:	00 00 00 00 
  40b07b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b080:	f3 0f 6f 09          	movdqu (%rcx),%xmm1
  40b084:	48 83 c0 10          	add    $0x10,%rax
  40b088:	48 83 c1 10          	add    $0x10,%rcx
  40b08c:	0f 11 48 f0          	movups %xmm1,-0x10(%rax)
  40b090:	48 39 f0             	cmp    %rsi,%rax
  40b093:	75 eb                	jne    40b080 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xc40>
  40b095:	4c 8d 78 10          	lea    0x10(%rax),%r15
  40b099:	48 85 ed             	test   %rbp,%rbp
  40b09c:	74 44                	je     40b0e2 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0xca2>
  40b09e:	4c 89 ee             	mov    %r13,%rsi
  40b0a1:	48 89 ef             	mov    %rbp,%rdi
  40b0a4:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
  40b0a9:	48 29 ee             	sub    %rbp,%rsi
  40b0ac:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  40b0b1:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  40b0b6:	48 89 54 24 38       	mov    %rdx,0x38(%rsp)
  40b0bb:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  40b0c0:	e8 4b 41 00 00       	call   40f210 <operator delete(void*, unsigned long)>
  40b0c5:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
  40b0ca:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
  40b0cf:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40b0d3:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
  40b0d8:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
  40b0dd:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  40b0e2:	4c 8b 28             	mov    (%rax),%r13
  40b0e5:	4d 8b 1e             	mov    (%r14),%r11
  40b0e8:	4d 89 8e 50 82 00 00 	mov    %r9,0x8250(%r14)
  40b0ef:	4c 89 cd             	mov    %r9,%rbp
  40b0f2:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
  40b0f7:	4d 89 be 58 82 00 00 	mov    %r15,0x8258(%r14)
  40b0fe:	4c 01 c9             	add    %r9,%rcx
  40b101:	49 89 8e 60 82 00 00 	mov    %rcx,0x8260(%r14)
  40b108:	8b 48 08             	mov    0x8(%rax),%ecx
  40b10b:	e9 7c fb ff ff       	jmp    40ac8c <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x84c>
  40b110:	31 c0                	xor    %eax,%eax
  40b112:	31 ff                	xor    %edi,%edi
  40b114:	e9 18 f8 ff ff       	jmp    40a931 <Side<unsigned short>::drain(Side<unsigned short> const&, unsigned long&)+0x4f1>
  40b119:	90                   	nop
  40b11a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

000000000040b120 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)>:
  40b120:	41 57                	push   %r15
  40b122:	41 56                	push   %r14
  40b124:	49 89 fe             	mov    %rdi,%r14
  40b127:	48 89 d7             	mov    %rdx,%rdi
  40b12a:	41 55                	push   %r13
  40b12c:	41 54                	push   %r12
  40b12e:	55                   	push   %rbp
  40b12f:	53                   	push   %rbx
  40b130:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  40b137:	49 8b 8e 40 85 00 00 	mov    0x8540(%r14),%rcx
  40b13e:	4d 8b 1e             	mov    (%r14),%r11
  40b141:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  40b146:	48 89 c8             	mov    %rcx,%rax
  40b149:	25 ff 07 00 00       	and    $0x7ff,%eax
  40b14e:	48 c1 e0 04          	shl    $0x4,%rax
  40b152:	4d 8d 2c 06          	lea    (%r14,%rax,1),%r13
  40b156:	45 8b 8d 48 04 00 00 	mov    0x448(%r13),%r9d
  40b15d:	41 83 7b 08 0b       	cmpl   $0xb,0x8(%r11)
  40b162:	0f 84 ee 04 00 00    	je     40b656 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x536>
  40b168:	45 85 c9             	test   %r9d,%r9d
  40b16b:	0f 84 db 0b 00 00    	je     40bd4c <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xc2c>
  40b171:	4d 89 ec             	mov    %r13,%r12
  40b174:	49 8b 53 10          	mov    0x10(%r11),%rdx
  40b178:	45 31 ff             	xor    %r15d,%r15d
  40b17b:	45 31 ed             	xor    %r13d,%r13d
  40b17e:	49 89 fa             	mov    %rdi,%r10
  40b181:	eb 12                	jmp    40b195 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x75>
  40b183:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b188:	49 83 c5 01          	add    $0x1,%r13
  40b18c:	45 39 cd             	cmp    %r9d,%r13d
  40b18f:	0f 83 3e 04 00 00    	jae    40b5d3 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x4b3>
  40b195:	41 8d 59 ff          	lea    -0x1(%r9),%ebx
  40b199:	41 8d 45 08          	lea    0x8(%r13),%eax
  40b19d:	4d 8b 84 24 40 04 00 	mov    0x440(%r12),%r8
  40b1a4:	00 
  40b1a5:	48 89 cd             	mov    %rcx,%rbp
  40b1a8:	39 d8                	cmp    %ebx,%eax
  40b1aa:	0f 47 c3             	cmova  %ebx,%eax
  40b1ad:	41 8b 34 80          	mov    (%r8,%rax,4),%esi
  40b1b1:	89 f0                	mov    %esi,%eax
  40b1b3:	48 89 f7             	mov    %rsi,%rdi
  40b1b6:	83 e6 7f             	and    $0x7f,%esi
  40b1b9:	25 ff ff ff 01       	and    $0x1ffffff,%eax
  40b1be:	48 c1 e7 27          	shl    $0x27,%rdi
  40b1c2:	0f 18 0c 82          	prefetcht0 (%rdx,%rax,4)
  40b1c6:	49 8b 46 08          	mov    0x8(%r14),%rax
  40b1ca:	48 c1 ef 2e          	shr    $0x2e,%rdi
  40b1ce:	48 8b 3c f8          	mov    (%rax,%rdi,8),%rdi
  40b1d2:	0f 18 0c f7          	prefetcht0 (%rdi,%rsi,8)
  40b1d6:	41 8d 7d 04          	lea    0x4(%r13),%edi
  40b1da:	49 8b 73 18          	mov    0x18(%r11),%rsi
  40b1de:	39 df                	cmp    %ebx,%edi
  40b1e0:	0f 47 fb             	cmova  %ebx,%edi
  40b1e3:	48 c1 e5 07          	shl    $0x7,%rbp
  40b1e7:	41 8b 3c b8          	mov    (%r8,%rdi,4),%edi
  40b1eb:	81 e7 ff ff ff 01    	and    $0x1ffffff,%edi
  40b1f1:	8b 3c ba             	mov    (%rdx,%rdi,4),%edi
  40b1f4:	0f 18 0c be          	prefetcht0 (%rsi,%rdi,4)
  40b1f8:	43 8b 3c a8          	mov    (%r8,%r13,4),%edi
  40b1fc:	41 89 f8             	mov    %edi,%r8d
  40b1ff:	89 fb                	mov    %edi,%ebx
  40b201:	83 e7 7f             	and    $0x7f,%edi
  40b204:	c1 eb 19             	shr    $0x19,%ebx
  40b207:	41 81 e0 ff ff ff 01 	and    $0x1ffffff,%r8d
  40b20e:	48 09 dd             	or     %rbx,%rbp
  40b211:	44 89 c3             	mov    %r8d,%ebx
  40b214:	c1 eb 07             	shr    $0x7,%ebx
  40b217:	48 89 6c 24 10       	mov    %rbp,0x10(%rsp)
  40b21c:	48 8b 1c d8          	mov    (%rax,%rbx,8),%rbx
  40b220:	48 3b 2c fb          	cmp    (%rbx,%rdi,8),%rbp
  40b224:	0f 85 5e ff ff ff    	jne    40b188 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x68>
  40b22a:	44 89 c7             	mov    %r8d,%edi
  40b22d:	41 83 c7 01          	add    $0x1,%r15d
  40b231:	8b 2c ba             	mov    (%rdx,%rdi,4),%ebp
  40b234:	41 8d 78 01          	lea    0x1(%r8),%edi
  40b238:	48 8d 1c bd 00 00 00 	lea    0x0(,%rdi,4),%rbx
  40b23f:	00 
  40b240:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
  40b245:	3b 2c ba             	cmp    (%rdx,%rdi,4),%ebp
  40b248:	0f 83 3a ff ff ff    	jae    40b188 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x68>
  40b24e:	49 8d 7e 40          	lea    0x40(%r14),%rdi
  40b252:	44 89 7c 24 54       	mov    %r15d,0x54(%rsp)
  40b257:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
  40b25c:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
  40b261:	4c 89 64 24 60       	mov    %r12,0x60(%rsp)
  40b266:	e9 e5 00 00 00       	jmp    40b350 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x230>
  40b26b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b270:	48 8b 02             	mov    (%rdx),%rax
  40b273:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
  40b278:	49 89 df             	mov    %rbx,%r15
  40b27b:	48 39 c3             	cmp    %rax,%rbx
  40b27e:	48 89 c1             	mov    %rax,%rcx
  40b281:	48 0f 46 cb          	cmovbe %rbx,%rcx
  40b285:	49 c1 ef 07          	shr    $0x7,%r15
  40b289:	48 89 0a             	mov    %rcx,(%rdx)
  40b28c:	4c 89 fa             	mov    %r15,%rdx
  40b28f:	49 2b 96 40 85 00 00 	sub    0x8540(%r14),%rdx
  40b296:	48 81 fa ff 07 00 00 	cmp    $0x7ff,%rdx
  40b29d:	0f 87 4d 01 00 00    	ja     40b3f0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x2d0>
  40b2a3:	48 39 c3             	cmp    %rax,%rbx
  40b2a6:	4d 89 fc             	mov    %r15,%r12
  40b2a9:	44 89 f9             	mov    %r15d,%ecx
  40b2ac:	0f 92 c2             	setb   %dl
  40b2af:	41 81 e4 ff 07 00 00 	and    $0x7ff,%r12d
  40b2b6:	81 e1 ff 07 00 00    	and    $0x7ff,%ecx
  40b2bc:	49 c1 e4 04          	shl    $0x4,%r12
  40b2c0:	4d 01 f4             	add    %r14,%r12
  40b2c3:	41 8b 84 24 48 04 00 	mov    0x448(%r12),%eax
  40b2ca:	00 
  40b2cb:	49 8b bc 24 40 04 00 	mov    0x440(%r12),%rdi
  40b2d2:	00 
  40b2d3:	41 3b 84 24 4c 04 00 	cmp    0x44c(%r12),%eax
  40b2da:	00 
  40b2db:	0f 84 57 02 00 00    	je     40b538 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x418>
  40b2e1:	89 de                	mov    %ebx,%esi
  40b2e3:	c1 e6 19             	shl    $0x19,%esi
  40b2e6:	44 09 ee             	or     %r13d,%esi
  40b2e9:	89 34 87             	mov    %esi,(%rdi,%rax,4)
  40b2ec:	0f b6 c2             	movzbl %dl,%eax
  40b2ef:	0f b6 d2             	movzbl %dl,%edx
  40b2f2:	41 01 84 24 48 04 00 	add    %eax,0x448(%r12)
  40b2f9:	00 
  40b2fa:	89 c8                	mov    %ecx,%eax
  40b2fc:	44 89 f9             	mov    %r15d,%ecx
  40b2ff:	c1 e8 06             	shr    $0x6,%eax
  40b302:	49 01 96 48 85 00 00 	add    %rdx,0x8548(%r14)
  40b309:	48 d3 e2             	shl    %cl,%rdx
  40b30c:	49 09 94 c6 40 84 00 	or     %rdx,0x8440(%r14,%rax,8)
  40b313:	00 
  40b314:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40b319:	49 8b 53 10          	mov    0x10(%r11),%rdx
  40b31d:	48 8b 40 08          	mov    0x8(%rax),%rax
  40b321:	4a 8b 04 c0          	mov    (%rax,%r8,8),%rax
  40b325:	4a 03 1c c8          	add    (%rax,%r9,8),%rbx
  40b329:	49 8b 02             	mov    (%r10),%rax
  40b32c:	48 39 c3             	cmp    %rax,%rbx
  40b32f:	48 0f 47 d8          	cmova  %rax,%rbx
  40b333:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40b338:	48 83 c5 01          	add    $0x1,%rbp
  40b33c:	49 89 1a             	mov    %rbx,(%r10)
  40b33f:	3b 2c 02             	cmp    (%rdx,%rax,1),%ebp
  40b342:	0f 83 60 02 00 00    	jae    40b5a8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x488>
  40b348:	49 8b 73 18          	mov    0x18(%r11),%rsi
  40b34c:	49 8b 46 08          	mov    0x8(%r14),%rax
  40b350:	41 8b 4b 08          	mov    0x8(%r11),%ecx
  40b354:	44 8b 2c ae          	mov    (%rsi,%rbp,4),%r13d
  40b358:	48 8d 1c ad 00 00 00 	lea    0x0(,%rbp,4),%rbx
  40b35f:	00 
  40b360:	41 d3 ed             	shr    %cl,%r13d
  40b363:	44 89 ef             	mov    %r13d,%edi
  40b366:	c1 ef 07             	shr    $0x7,%edi
  40b369:	41 89 f8             	mov    %edi,%r8d
  40b36c:	4e 8d 0c c0          	lea    (%rax,%r8,8),%r9
  40b370:	49 8b 11             	mov    (%r9),%rdx
  40b373:	48 3b 54 24 20       	cmp    0x20(%rsp),%rdx
  40b378:	0f 84 3a 01 00 00    	je     40b4b8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x398>
  40b37e:	8b 3c 1e             	mov    (%rsi,%rbx,1),%edi
  40b381:	41 8b 43 0c          	mov    0xc(%r11),%eax
  40b385:	45 89 e9             	mov    %r13d,%r9d
  40b388:	41 83 e1 7f          	and    $0x7f,%r9d
  40b38c:	21 c7                	and    %eax,%edi
  40b38e:	4a 8d 14 ca          	lea    (%rdx,%r9,8),%rdx
  40b392:	89 fb                	mov    %edi,%ebx
  40b394:	39 f8                	cmp    %edi,%eax
  40b396:	0f 85 d4 fe ff ff    	jne    40b270 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x150>
  40b39c:	49 8b 7b 20          	mov    0x20(%r11),%rdi
  40b3a0:	49 8b 43 28          	mov    0x28(%r11),%rax
  40b3a4:	48 29 f8             	sub    %rdi,%rax
  40b3a7:	48 c1 f8 04          	sar    $0x4,%rax
  40b3ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b3b0:	48 85 c0             	test   %rax,%rax
  40b3b3:	7e 25                	jle    40b3da <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x2ba>
  40b3b5:	48 89 c6             	mov    %rax,%rsi
  40b3b8:	48 d1 fe             	sar    $1,%rsi
  40b3bb:	48 89 f1             	mov    %rsi,%rcx
  40b3be:	48 c1 e1 04          	shl    $0x4,%rcx
  40b3c2:	48 01 f9             	add    %rdi,%rcx
  40b3c5:	48 39 29             	cmp    %rbp,(%rcx)
  40b3c8:	73 1e                	jae    40b3e8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x2c8>
  40b3ca:	48 29 f0             	sub    %rsi,%rax
  40b3cd:	48 8d 79 10          	lea    0x10(%rcx),%rdi
  40b3d1:	48 83 e8 01          	sub    $0x1,%rax
  40b3d5:	48 85 c0             	test   %rax,%rax
  40b3d8:	7f db                	jg     40b3b5 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x295>
  40b3da:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  40b3de:	e9 8d fe ff ff       	jmp    40b270 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x150>
  40b3e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b3e8:	48 89 f0             	mov    %rsi,%rax
  40b3eb:	eb c3                	jmp    40b3b0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x290>
  40b3ed:	0f 1f 00             	nopl   (%rax)
  40b3f0:	48 39 c3             	cmp    %rax,%rbx
  40b3f3:	0f 83 1b ff ff ff    	jae    40b314 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x1f4>
  40b3f9:	4d 8b be 58 85 00 00 	mov    0x8558(%r14),%r15
  40b400:	49 8b b6 60 85 00 00 	mov    0x8560(%r14),%rsi
  40b407:	4d 8b a6 50 85 00 00 	mov    0x8550(%r14),%r12
  40b40e:	49 39 f7             	cmp    %rsi,%r15
  40b411:	0f 84 e4 06 00 00    	je     40bafb <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x9db>
  40b417:	49 89 1f             	mov    %rbx,(%r15)
  40b41a:	49 83 c7 10          	add    $0x10,%r15
  40b41e:	48 89 df             	mov    %rbx,%rdi
  40b421:	45 89 6f f8          	mov    %r13d,-0x8(%r15)
  40b425:	4d 89 be 58 85 00 00 	mov    %r15,0x8558(%r14)
  40b42c:	4d 29 e7             	sub    %r12,%r15
  40b42f:	4c 89 f9             	mov    %r15,%rcx
  40b432:	4b 8d 44 3c f0       	lea    -0x10(%r12,%r15,1),%rax
  40b437:	48 c1 f9 04          	sar    $0x4,%rcx
  40b43b:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40b43f:	48 83 e9 02          	sub    $0x2,%rcx
  40b443:	48 d1 f9             	sar    $1,%rcx
  40b446:	48 85 d2             	test   %rdx,%rdx
  40b449:	7e 5d                	jle    40b4a8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x388>
  40b44b:	48 89 c8             	mov    %rcx,%rax
  40b44e:	48 c1 e0 04          	shl    $0x4,%rax
  40b452:	4c 01 e0             	add    %r12,%rax
  40b455:	48 8b 30             	mov    (%rax),%rsi
  40b458:	48 39 f7             	cmp    %rsi,%rdi
  40b45b:	0f 82 c7 00 00 00    	jb     40b528 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x408>
  40b461:	48 39 fe             	cmp    %rdi,%rsi
  40b464:	75 3a                	jne    40b4a0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x380>
  40b466:	44 8b 78 08          	mov    0x8(%rax),%r15d
  40b46a:	45 39 fd             	cmp    %r15d,%r13d
  40b46d:	73 31                	jae    40b4a0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x380>
  40b46f:	48 c1 e2 04          	shl    $0x4,%rdx
  40b473:	49 89 34 14          	mov    %rsi,(%r12,%rdx,1)
  40b477:	45 89 7c 14 08       	mov    %r15d,0x8(%r12,%rdx,1)
  40b47c:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40b480:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40b484:	48 8d 74 0a ff       	lea    -0x1(%rdx,%rcx,1),%rsi
  40b489:	48 89 ca             	mov    %rcx,%rdx
  40b48c:	48 85 c9             	test   %rcx,%rcx
  40b48f:	74 17                	je     40b4a8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x388>
  40b491:	48 89 f1             	mov    %rsi,%rcx
  40b494:	48 d1 f9             	sar    $1,%rcx
  40b497:	eb b2                	jmp    40b44b <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x32b>
  40b499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40b4a0:	48 c1 e2 04          	shl    $0x4,%rdx
  40b4a4:	49 8d 04 14          	lea    (%r12,%rdx,1),%rax
  40b4a8:	48 89 38             	mov    %rdi,(%rax)
  40b4ab:	44 89 68 08          	mov    %r13d,0x8(%rax)
  40b4af:	e9 60 fe ff ff       	jmp    40b314 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x1f4>
  40b4b4:	0f 1f 40 00          	nopl   0x0(%rax)
  40b4b8:	f3 0f 7e 05 00 1f 0b 	movq   0xb1f00(%rip),%xmm0        # 4bd3c0 <max.0+0x20>
  40b4bf:	00 
  40b4c0:	4d 8b 66 28          	mov    0x28(%r14),%r12
  40b4c4:	4c 89 e2             	mov    %r12,%rdx
  40b4c7:	49 2b 56 20          	sub    0x20(%r14),%rdx
  40b4cb:	66 0f 6c c0          	punpcklqdq %xmm0,%xmm0
  40b4cf:	48 c1 e2 08          	shl    $0x8,%rdx
  40b4d3:	49 03 56 38          	add    0x38(%r14),%rdx
  40b4d7:	48 89 d0             	mov    %rdx,%rax
  40b4da:	48 8d 8a 00 04 00 00 	lea    0x400(%rdx),%rcx
  40b4e1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40b4e8:	00 00 00 00 
  40b4ec:	0f 1f 40 00          	nopl   0x0(%rax)
  40b4f0:	0f 11 00             	movups %xmm0,(%rax)
  40b4f3:	48 83 c0 20          	add    $0x20,%rax
  40b4f7:	0f 11 40 f0          	movups %xmm0,-0x10(%rax)
  40b4fb:	48 39 c8             	cmp    %rcx,%rax
  40b4fe:	75 f0                	jne    40b4f0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x3d0>
  40b500:	49 89 11             	mov    %rdx,(%r9)
  40b503:	89 7c 24 7c          	mov    %edi,0x7c(%rsp)
  40b507:	4d 3b 66 30          	cmp    0x30(%r14),%r12
  40b50b:	0f 84 0f 01 00 00    	je     40b620 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x500>
  40b511:	41 89 3c 24          	mov    %edi,(%r12)
  40b515:	49 83 c4 04          	add    $0x4,%r12
  40b519:	4d 89 66 28          	mov    %r12,0x28(%r14)
  40b51d:	e9 5c fe ff ff       	jmp    40b37e <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x25e>
  40b522:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  40b528:	44 8b 78 08          	mov    0x8(%rax),%r15d
  40b52c:	e9 3e ff ff ff       	jmp    40b46f <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x34f>
  40b531:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40b538:	be 10 00 00 00       	mov    $0x10,%esi
  40b53d:	01 c0                	add    %eax,%eax
  40b53f:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40b544:	39 f0                	cmp    %esi,%eax
  40b546:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40b54b:	0f 42 c6             	cmovb  %esi,%eax
  40b54e:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  40b553:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
  40b557:	41 89 84 24 4c 04 00 	mov    %eax,0x44c(%r12)
  40b55e:	00 
  40b55f:	8d 34 85 00 00 00 00 	lea    0x0(,%rax,4),%esi
  40b566:	88 54 24 28          	mov    %dl,0x28(%rsp)
  40b56a:	e8 d1 87 03 00       	call   443d40 <__libc_realloc>
  40b56f:	4d 8b 1e             	mov    (%r14),%r11
  40b572:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40b577:	49 89 84 24 40 04 00 	mov    %rax,0x440(%r12)
  40b57e:	00 
  40b57f:	48 89 c7             	mov    %rax,%rdi
  40b582:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40b587:	41 8b 84 24 48 04 00 	mov    0x448(%r12),%eax
  40b58e:	00 
  40b58f:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  40b594:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
  40b598:	0f b6 54 24 28       	movzbl 0x28(%rsp),%edx
  40b59d:	e9 3f fd ff ff       	jmp    40b2e1 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x1c1>
  40b5a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  40b5a8:	4c 8b 64 24 60       	mov    0x60(%rsp),%r12
  40b5ad:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
  40b5b2:	44 8b 7c 24 54       	mov    0x54(%rsp),%r15d
  40b5b7:	49 8b 8e 40 85 00 00 	mov    0x8540(%r14),%rcx
  40b5be:	45 8b 8c 24 48 04 00 	mov    0x448(%r12),%r9d
  40b5c5:	00 
  40b5c6:	49 83 c5 01          	add    $0x1,%r13
  40b5ca:	45 39 cd             	cmp    %r9d,%r13d
  40b5cd:	0f 82 c2 fb ff ff    	jb     40b195 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x75>
  40b5d3:	4d 89 e5             	mov    %r12,%r13
  40b5d6:	44 89 f8             	mov    %r15d,%eax
  40b5d9:	48 89 ca             	mov    %rcx,%rdx
  40b5dc:	48 c7 c6 fe ff ff ff 	mov    $0xfffffffffffffffe,%rsi
  40b5e3:	4d 29 8e 48 85 00 00 	sub    %r9,0x8548(%r14)
  40b5ea:	48 c1 ea 06          	shr    $0x6,%rdx
  40b5ee:	48 d3 c6             	rol    %cl,%rsi
  40b5f1:	41 c7 85 48 04 00 00 	movl   $0x0,0x448(%r13)
  40b5f8:	00 00 00 00 
  40b5fc:	83 e2 1f             	and    $0x1f,%edx
  40b5ff:	49 21 b4 d6 40 84 00 	and    %rsi,0x8440(%r14,%rdx,8)
  40b606:	00 
  40b607:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  40b60e:	5b                   	pop    %rbx
  40b60f:	5d                   	pop    %rbp
  40b610:	41 5c                	pop    %r12
  40b612:	41 5d                	pop    %r13
  40b614:	41 5e                	pop    %r14
  40b616:	41 5f                	pop    %r15
  40b618:	c3                   	ret
  40b619:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40b620:	48 8d 74 24 7c       	lea    0x7c(%rsp),%rsi
  40b625:	49 8d 7e 20          	lea    0x20(%r14),%rdi
  40b629:	4c 89 54 24 30       	mov    %r10,0x30(%rsp)
  40b62e:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
  40b633:	e8 28 cd ff ff       	call   408360 <void std::vector<unsigned int, std::allocator<unsigned int> >::_M_realloc_append<unsigned int const&>(unsigned int const&)>
  40b638:	49 8b 46 08          	mov    0x8(%r14),%rax
  40b63c:	4c 8b 44 24 28       	mov    0x28(%rsp),%r8
  40b641:	4d 8b 1e             	mov    (%r14),%r11
  40b644:	4c 8b 54 24 30       	mov    0x30(%rsp),%r10
  40b649:	4a 8b 14 c0          	mov    (%rax,%r8,8),%rdx
  40b64d:	49 8b 73 18          	mov    0x18(%r11),%rsi
  40b651:	e9 28 fd ff ff       	jmp    40b37e <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x25e>
  40b656:	45 85 c9             	test   %r9d,%r9d
  40b659:	0f 84 ed 06 00 00    	je     40bd4c <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xc2c>
  40b65f:	4d 89 ef             	mov    %r13,%r15
  40b662:	49 8b 73 10          	mov    0x10(%r11),%rsi
  40b666:	31 ed                	xor    %ebp,%ebp
  40b668:	45 31 ed             	xor    %r13d,%r13d
  40b66b:	49 89 d2             	mov    %rdx,%r10
  40b66e:	eb 0d                	jmp    40b67d <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x55d>
  40b670:	48 83 c5 01          	add    $0x1,%rbp
  40b674:	44 39 cd             	cmp    %r9d,%ebp
  40b677:	0f 83 35 04 00 00    	jae    40bab2 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x992>
  40b67d:	45 8d 41 ff          	lea    -0x1(%r9),%r8d
  40b681:	8d 45 08             	lea    0x8(%rbp),%eax
  40b684:	49 8b bf 40 04 00 00 	mov    0x440(%r15),%rdi
  40b68b:	49 89 cc             	mov    %rcx,%r12
  40b68e:	44 39 c0             	cmp    %r8d,%eax
  40b691:	41 0f 47 c0          	cmova  %r8d,%eax
  40b695:	8b 14 87             	mov    (%rdi,%rax,4),%edx
  40b698:	89 d0                	mov    %edx,%eax
  40b69a:	48 89 d3             	mov    %rdx,%rbx
  40b69d:	83 e2 7f             	and    $0x7f,%edx
  40b6a0:	25 ff ff ff 01       	and    $0x1ffffff,%eax
  40b6a5:	48 c1 e3 27          	shl    $0x27,%rbx
  40b6a9:	0f 18 0c 86          	prefetcht0 (%rsi,%rax,4)
  40b6ad:	49 8b 46 08          	mov    0x8(%r14),%rax
  40b6b1:	48 c1 eb 2e          	shr    $0x2e,%rbx
  40b6b5:	48 8b 1c d8          	mov    (%rax,%rbx,8),%rbx
  40b6b9:	0f 18 0c d3          	prefetcht0 (%rbx,%rdx,8)
  40b6bd:	8d 55 04             	lea    0x4(%rbp),%edx
  40b6c0:	49 8b 5b 18          	mov    0x18(%r11),%rbx
  40b6c4:	44 39 c2             	cmp    %r8d,%edx
  40b6c7:	41 0f 47 d0          	cmova  %r8d,%edx
  40b6cb:	49 c1 e4 07          	shl    $0x7,%r12
  40b6cf:	8b 14 97             	mov    (%rdi,%rdx,4),%edx
  40b6d2:	81 e2 ff ff ff 01    	and    $0x1ffffff,%edx
  40b6d8:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  40b6db:	0f 18 0c 93          	prefetcht0 (%rbx,%rdx,4)
  40b6df:	8b 14 af             	mov    (%rdi,%rbp,4),%edx
  40b6e2:	89 d7                	mov    %edx,%edi
  40b6e4:	41 89 d0             	mov    %edx,%r8d
  40b6e7:	83 e2 7f             	and    $0x7f,%edx
  40b6ea:	41 c1 e8 19          	shr    $0x19,%r8d
  40b6ee:	81 e7 ff ff ff 01    	and    $0x1ffffff,%edi
  40b6f4:	4d 09 c4             	or     %r8,%r12
  40b6f7:	41 89 f8             	mov    %edi,%r8d
  40b6fa:	41 c1 e8 07          	shr    $0x7,%r8d
  40b6fe:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
  40b703:	4e 8b 04 c0          	mov    (%rax,%r8,8),%r8
  40b707:	4d 3b 24 d0          	cmp    (%r8,%rdx,8),%r12
  40b70b:	0f 85 5f ff ff ff    	jne    40b670 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x550>
  40b711:	89 fa                	mov    %edi,%edx
  40b713:	41 83 c5 01          	add    $0x1,%r13d
  40b717:	44 8b 24 96          	mov    (%rsi,%rdx,4),%r12d
  40b71b:	8d 57 01             	lea    0x1(%rdi),%edx
  40b71e:	48 8d 3c 95 00 00 00 	lea    0x0(,%rdx,4),%rdi
  40b725:	00 
  40b726:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
  40b72b:	44 3b 24 96          	cmp    (%rsi,%rdx,4),%r12d
  40b72f:	0f 83 3b ff ff ff    	jae    40b670 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x550>
  40b735:	49 8d 7e 40          	lea    0x40(%r14),%rdi
  40b739:	44 89 6c 24 54       	mov    %r13d,0x54(%rsp)
  40b73e:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
  40b743:	48 89 6c 24 58       	mov    %rbp,0x58(%rsp)
  40b748:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
  40b74d:	e9 df 00 00 00       	jmp    40b831 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x711>
  40b752:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  40b758:	48 8b 02             	mov    (%rdx),%rax
  40b75b:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
  40b760:	49 89 dd             	mov    %rbx,%r13
  40b763:	48 39 c3             	cmp    %rax,%rbx
  40b766:	48 89 c6             	mov    %rax,%rsi
  40b769:	48 0f 46 f3          	cmovbe %rbx,%rsi
  40b76d:	49 c1 ed 07          	shr    $0x7,%r13
  40b771:	48 89 32             	mov    %rsi,(%rdx)
  40b774:	4c 89 ea             	mov    %r13,%rdx
  40b777:	49 2b 96 40 85 00 00 	sub    0x8540(%r14),%rdx
  40b77e:	48 81 fa ff 07 00 00 	cmp    $0x7ff,%rdx
  40b785:	0f 87 55 01 00 00    	ja     40b8e0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x7c0>
  40b78b:	48 39 c3             	cmp    %rax,%rbx
  40b78e:	4c 89 ed             	mov    %r13,%rbp
  40b791:	44 89 ea             	mov    %r13d,%edx
  40b794:	41 0f 92 c7          	setb   %r15b
  40b798:	81 e5 ff 07 00 00    	and    $0x7ff,%ebp
  40b79e:	81 e2 ff 07 00 00    	and    $0x7ff,%edx
  40b7a4:	48 c1 e5 04          	shl    $0x4,%rbp
  40b7a8:	4c 01 f5             	add    %r14,%rbp
  40b7ab:	8b 85 48 04 00 00    	mov    0x448(%rbp),%eax
  40b7b1:	48 8b bd 40 04 00 00 	mov    0x440(%rbp),%rdi
  40b7b8:	3b 85 4c 04 00 00    	cmp    0x44c(%rbp),%eax
  40b7be:	0f 84 5c 02 00 00    	je     40ba20 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x900>
  40b7c4:	89 de                	mov    %ebx,%esi
  40b7c6:	c1 ea 06             	shr    $0x6,%edx
  40b7c9:	c1 e6 19             	shl    $0x19,%esi
  40b7cc:	09 ce                	or     %ecx,%esi
  40b7ce:	44 89 e9             	mov    %r13d,%ecx
  40b7d1:	89 34 87             	mov    %esi,(%rdi,%rax,4)
  40b7d4:	41 0f b6 c7          	movzbl %r15b,%eax
  40b7d8:	45 0f b6 ff          	movzbl %r15b,%r15d
  40b7dc:	01 85 48 04 00 00    	add    %eax,0x448(%rbp)
  40b7e2:	4d 01 be 48 85 00 00 	add    %r15,0x8548(%r14)
  40b7e9:	49 d3 e7             	shl    %cl,%r15
  40b7ec:	4d 09 bc d6 40 84 00 	or     %r15,0x8440(%r14,%rdx,8)
  40b7f3:	00 
  40b7f4:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40b7f9:	49 8b 73 10          	mov    0x10(%r11),%rsi
  40b7fd:	48 8b 40 08          	mov    0x8(%rax),%rax
  40b801:	4a 8b 04 c0          	mov    (%rax,%r8,8),%rax
  40b805:	4a 03 1c c8          	add    (%rax,%r9,8),%rbx
  40b809:	49 8b 02             	mov    (%r10),%rax
  40b80c:	48 39 c3             	cmp    %rax,%rbx
  40b80f:	48 0f 47 d8          	cmova  %rax,%rbx
  40b813:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40b818:	49 83 c4 01          	add    $0x1,%r12
  40b81c:	49 89 1a             	mov    %rbx,(%r10)
  40b81f:	44 3b 24 06          	cmp    (%rsi,%rax,1),%r12d
  40b823:	0f 83 5f 02 00 00    	jae    40ba88 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x968>
  40b829:	49 8b 5b 18          	mov    0x18(%r11),%rbx
  40b82d:	49 8b 46 08          	mov    0x8(%r14),%rax
  40b831:	42 8b 14 a3          	mov    (%rbx,%r12,4),%edx
  40b835:	4a 8d 2c a5 00 00 00 	lea    0x0(,%r12,4),%rbp
  40b83c:	00 
  40b83d:	89 d1                	mov    %edx,%ecx
  40b83f:	c1 ea 12             	shr    $0x12,%edx
  40b842:	41 89 d0             	mov    %edx,%r8d
  40b845:	c1 e9 0b             	shr    $0xb,%ecx
  40b848:	4e 8d 0c c0          	lea    (%rax,%r8,8),%r9
  40b84c:	49 8b 31             	mov    (%r9),%rsi
  40b84f:	48 3b 74 24 20       	cmp    0x20(%rsp),%rsi
  40b854:	0f 84 26 01 00 00    	je     40b980 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x860>
  40b85a:	8b 04 2b             	mov    (%rbx,%rbp,1),%eax
  40b85d:	41 89 c9             	mov    %ecx,%r9d
  40b860:	41 83 e1 7f          	and    $0x7f,%r9d
  40b864:	89 c3                	mov    %eax,%ebx
  40b866:	4a 8d 14 ce          	lea    (%rsi,%r9,8),%rdx
  40b86a:	81 e3 ff 07 00 00    	and    $0x7ff,%ebx
  40b870:	81 fb ff 07 00 00    	cmp    $0x7ff,%ebx
  40b876:	0f 85 dc fe ff ff    	jne    40b758 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x638>
  40b87c:	41 8b 73 0c          	mov    0xc(%r11),%esi
  40b880:	21 f0                	and    %esi,%eax
  40b882:	89 c3                	mov    %eax,%ebx
  40b884:	39 c6                	cmp    %eax,%esi
  40b886:	0f 85 cc fe ff ff    	jne    40b758 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x638>
  40b88c:	49 8b 5b 20          	mov    0x20(%r11),%rbx
  40b890:	49 8b 43 28          	mov    0x28(%r11),%rax
  40b894:	48 29 d8             	sub    %rbx,%rax
  40b897:	48 c1 f8 04          	sar    $0x4,%rax
  40b89b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b8a0:	48 85 c0             	test   %rax,%rax
  40b8a3:	7e 25                	jle    40b8ca <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x7aa>
  40b8a5:	48 89 c7             	mov    %rax,%rdi
  40b8a8:	48 d1 ff             	sar    $1,%rdi
  40b8ab:	48 89 fe             	mov    %rdi,%rsi
  40b8ae:	48 c1 e6 04          	shl    $0x4,%rsi
  40b8b2:	48 01 de             	add    %rbx,%rsi
  40b8b5:	4c 39 26             	cmp    %r12,(%rsi)
  40b8b8:	73 1e                	jae    40b8d8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x7b8>
  40b8ba:	48 29 f8             	sub    %rdi,%rax
  40b8bd:	48 8d 5e 10          	lea    0x10(%rsi),%rbx
  40b8c1:	48 83 e8 01          	sub    $0x1,%rax
  40b8c5:	48 85 c0             	test   %rax,%rax
  40b8c8:	7f db                	jg     40b8a5 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x785>
  40b8ca:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  40b8ce:	e9 85 fe ff ff       	jmp    40b758 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x638>
  40b8d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b8d8:	48 89 f8             	mov    %rdi,%rax
  40b8db:	eb c3                	jmp    40b8a0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x780>
  40b8dd:	0f 1f 00             	nopl   (%rax)
  40b8e0:	48 39 c3             	cmp    %rax,%rbx
  40b8e3:	0f 83 0b ff ff ff    	jae    40b7f4 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x6d4>
  40b8e9:	4d 8b ae 58 85 00 00 	mov    0x8558(%r14),%r13
  40b8f0:	49 8b ae 60 85 00 00 	mov    0x8560(%r14),%rbp
  40b8f7:	4d 8b be 50 85 00 00 	mov    0x8550(%r14),%r15
  40b8fe:	49 39 ed             	cmp    %rbp,%r13
  40b901:	0f 84 2a 03 00 00    	je     40bc31 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xb11>
  40b907:	49 89 5d 00          	mov    %rbx,0x0(%r13)
  40b90b:	49 83 c5 10          	add    $0x10,%r13
  40b90f:	48 89 dd             	mov    %rbx,%rbp
  40b912:	41 89 4d f8          	mov    %ecx,-0x8(%r13)
  40b916:	4d 89 ae 58 85 00 00 	mov    %r13,0x8558(%r14)
  40b91d:	4d 29 fd             	sub    %r15,%r13
  40b920:	4c 89 ee             	mov    %r13,%rsi
  40b923:	4b 8d 44 2f f0       	lea    -0x10(%r15,%r13,1),%rax
  40b928:	48 c1 fe 04          	sar    $0x4,%rsi
  40b92c:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
  40b930:	48 83 ee 02          	sub    $0x2,%rsi
  40b934:	48 d1 fe             	sar    $1,%rsi
  40b937:	48 85 d2             	test   %rdx,%rdx
  40b93a:	7e 30                	jle    40b96c <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x84c>
  40b93c:	48 89 f0             	mov    %rsi,%rax
  40b93f:	48 c1 e0 04          	shl    $0x4,%rax
  40b943:	4c 01 f8             	add    %r15,%rax
  40b946:	48 8b 38             	mov    (%rax),%rdi
  40b949:	48 39 fd             	cmp    %rdi,%rbp
  40b94c:	0f 82 96 00 00 00    	jb     40b9e8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x8c8>
  40b952:	48 39 ef             	cmp    %rbp,%rdi
  40b955:	75 0d                	jne    40b964 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x844>
  40b957:	44 8b 68 08          	mov    0x8(%rax),%r13d
  40b95b:	44 39 e9             	cmp    %r13d,%ecx
  40b95e:	0f 82 88 00 00 00    	jb     40b9ec <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x8cc>
  40b964:	48 c1 e2 04          	shl    $0x4,%rdx
  40b968:	49 8d 04 17          	lea    (%r15,%rdx,1),%rax
  40b96c:	48 89 28             	mov    %rbp,(%rax)
  40b96f:	89 48 08             	mov    %ecx,0x8(%rax)
  40b972:	e9 7d fe ff ff       	jmp    40b7f4 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x6d4>
  40b977:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40b97e:	00 00 
  40b980:	f3 0f 7e 05 38 1a 0b 	movq   0xb1a38(%rip),%xmm0        # 4bd3c0 <max.0+0x20>
  40b987:	00 
  40b988:	4d 8b 6e 28          	mov    0x28(%r14),%r13
  40b98c:	4c 89 ee             	mov    %r13,%rsi
  40b98f:	49 2b 76 20          	sub    0x20(%r14),%rsi
  40b993:	66 0f 6c c0          	punpcklqdq %xmm0,%xmm0
  40b997:	48 c1 e6 08          	shl    $0x8,%rsi
  40b99b:	49 03 76 38          	add    0x38(%r14),%rsi
  40b99f:	48 89 f0             	mov    %rsi,%rax
  40b9a2:	48 8d be 00 04 00 00 	lea    0x400(%rsi),%rdi
  40b9a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40b9b0:	0f 11 00             	movups %xmm0,(%rax)
  40b9b3:	48 83 c0 20          	add    $0x20,%rax
  40b9b7:	0f 11 40 f0          	movups %xmm0,-0x10(%rax)
  40b9bb:	48 39 f8             	cmp    %rdi,%rax
  40b9be:	75 f0                	jne    40b9b0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x890>
  40b9c0:	49 89 31             	mov    %rsi,(%r9)
  40b9c3:	89 54 24 7c          	mov    %edx,0x7c(%rsp)
  40b9c7:	4d 3b 6e 30          	cmp    0x30(%r14),%r13
  40b9cb:	0f 84 ec 00 00 00    	je     40babd <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x99d>
  40b9d1:	41 89 55 00          	mov    %edx,0x0(%r13)
  40b9d5:	49 83 c5 04          	add    $0x4,%r13
  40b9d9:	4d 89 6e 28          	mov    %r13,0x28(%r14)
  40b9dd:	e9 78 fe ff ff       	jmp    40b85a <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x73a>
  40b9e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  40b9e8:	44 8b 68 08          	mov    0x8(%rax),%r13d
  40b9ec:	48 c1 e2 04          	shl    $0x4,%rdx
  40b9f0:	49 89 3c 17          	mov    %rdi,(%r15,%rdx,1)
  40b9f4:	45 89 6c 17 08       	mov    %r13d,0x8(%r15,%rdx,1)
  40b9f9:	48 8d 56 ff          	lea    -0x1(%rsi),%rdx
  40b9fd:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40ba01:	48 8d 7c 32 ff       	lea    -0x1(%rdx,%rsi,1),%rdi
  40ba06:	48 89 f2             	mov    %rsi,%rdx
  40ba09:	48 85 f6             	test   %rsi,%rsi
  40ba0c:	0f 84 5a ff ff ff    	je     40b96c <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x84c>
  40ba12:	48 d1 ff             	sar    $1,%rdi
  40ba15:	48 89 fe             	mov    %rdi,%rsi
  40ba18:	e9 1f ff ff ff       	jmp    40b93c <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x81c>
  40ba1d:	0f 1f 00             	nopl   (%rax)
  40ba20:	be 10 00 00 00       	mov    $0x10,%esi
  40ba25:	01 c0                	add    %eax,%eax
  40ba27:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40ba2c:	39 f0                	cmp    %esi,%eax
  40ba2e:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40ba33:	0f 42 c6             	cmovb  %esi,%eax
  40ba36:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  40ba3b:	89 54 24 30          	mov    %edx,0x30(%rsp)
  40ba3f:	89 85 4c 04 00 00    	mov    %eax,0x44c(%rbp)
  40ba45:	8d 34 85 00 00 00 00 	lea    0x0(,%rax,4),%esi
  40ba4c:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
  40ba50:	e8 eb 82 03 00       	call   443d40 <__libc_realloc>
  40ba55:	4d 8b 1e             	mov    (%r14),%r11
  40ba58:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40ba5d:	48 89 85 40 04 00 00 	mov    %rax,0x440(%rbp)
  40ba64:	48 89 c7             	mov    %rax,%rdi
  40ba67:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40ba6c:	8b 85 48 04 00 00    	mov    0x448(%rbp),%eax
  40ba72:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  40ba77:	8b 54 24 30          	mov    0x30(%rsp),%edx
  40ba7b:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
  40ba7f:	e9 40 fd ff ff       	jmp    40b7c4 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x6a4>
  40ba84:	0f 1f 40 00          	nopl   0x0(%rax)
  40ba88:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
  40ba8d:	48 8b 6c 24 58       	mov    0x58(%rsp),%rbp
  40ba92:	44 8b 6c 24 54       	mov    0x54(%rsp),%r13d
  40ba97:	49 8b 8e 40 85 00 00 	mov    0x8540(%r14),%rcx
  40ba9e:	45 8b 8f 48 04 00 00 	mov    0x448(%r15),%r9d
  40baa5:	48 83 c5 01          	add    $0x1,%rbp
  40baa9:	44 39 cd             	cmp    %r9d,%ebp
  40baac:	0f 82 cb fb ff ff    	jb     40b67d <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x55d>
  40bab2:	44 89 e8             	mov    %r13d,%eax
  40bab5:	4d 89 fd             	mov    %r15,%r13
  40bab8:	e9 1c fb ff ff       	jmp    40b5d9 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x4b9>
  40babd:	48 8d 74 24 7c       	lea    0x7c(%rsp),%rsi
  40bac2:	49 8d 7e 20          	lea    0x20(%r14),%rdi
  40bac6:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
  40bacb:	4c 89 44 24 30       	mov    %r8,0x30(%rsp)
  40bad0:	89 4c 24 28          	mov    %ecx,0x28(%rsp)
  40bad4:	e8 87 c8 ff ff       	call   408360 <void std::vector<unsigned int, std::allocator<unsigned int> >::_M_realloc_append<unsigned int const&>(unsigned int const&)>
  40bad9:	49 8b 46 08          	mov    0x8(%r14),%rax
  40badd:	4c 8b 44 24 30       	mov    0x30(%rsp),%r8
  40bae2:	4d 8b 1e             	mov    (%r14),%r11
  40bae5:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
  40baea:	4a 8b 34 c0          	mov    (%rax,%r8,8),%rsi
  40baee:	8b 4c 24 28          	mov    0x28(%rsp),%ecx
  40baf2:	49 8b 5b 18          	mov    0x18(%r11),%rbx
  40baf6:	e9 5f fd ff ff       	jmp    40b85a <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x73a>
  40bafb:	48 b8 ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rax
  40bb02:	ff ff 07 
  40bb05:	4d 89 fb             	mov    %r15,%r11
  40bb08:	4d 29 e3             	sub    %r12,%r11
  40bb0b:	4c 89 da             	mov    %r11,%rdx
  40bb0e:	48 c1 fa 04          	sar    $0x4,%rdx
  40bb12:	48 39 c2             	cmp    %rax,%rdx
  40bb15:	0f 84 0b 57 ff ff    	je     401226 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&) [clone .cold]>
  40bb1b:	48 85 d2             	test   %rdx,%rdx
  40bb1e:	b8 01 00 00 00       	mov    $0x1,%eax
  40bb23:	4c 89 5c 24 30       	mov    %r11,0x30(%rsp)
  40bb28:	48 0f 45 c2          	cmovne %rdx,%rax
  40bb2c:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
  40bb31:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
  40bb36:	48 01 d0             	add    %rdx,%rax
  40bb39:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  40bb3e:	48 ba ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rdx
  40bb45:	ff ff 07 
  40bb48:	48 39 d0             	cmp    %rdx,%rax
  40bb4b:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
  40bb50:	48 0f 47 c2          	cmova  %rdx,%rax
  40bb54:	48 c1 e0 04          	shl    $0x4,%rax
  40bb58:	48 89 c7             	mov    %rax,%rdi
  40bb5b:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40bb60:	e8 7b 37 00 00       	call   40f2e0 <operator new(unsigned long)>
  40bb65:	4c 8b 5c 24 30       	mov    0x30(%rsp),%r11
  40bb6a:	4d 39 e7             	cmp    %r12,%r15
  40bb6d:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  40bb72:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
  40bb77:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
  40bb7c:	48 89 c1             	mov    %rax,%rcx
  40bb7f:	4a 89 1c 18          	mov    %rbx,(%rax,%r11,1)
  40bb83:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
  40bb88:	46 89 6c 18 08       	mov    %r13d,0x8(%rax,%r11,1)
  40bb8d:	74 2d                	je     40bbbc <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xa9c>
  40bb8f:	48 89 c2             	mov    %rax,%rdx
  40bb92:	4c 89 e0             	mov    %r12,%rax
  40bb95:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40bb9c:	00 00 00 00 
  40bba0:	f3 0f 6f 00          	movdqu (%rax),%xmm0
  40bba4:	48 83 c0 10          	add    $0x10,%rax
  40bba8:	48 83 c2 10          	add    $0x10,%rdx
  40bbac:	0f 11 42 f0          	movups %xmm0,-0x10(%rdx)
  40bbb0:	49 39 c7             	cmp    %rax,%r15
  40bbb3:	75 eb                	jne    40bba0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xa80>
  40bbb5:	4d 29 e7             	sub    %r12,%r15
  40bbb8:	4a 8d 04 39          	lea    (%rcx,%r15,1),%rax
  40bbbc:	4c 8d 78 10          	lea    0x10(%rax),%r15
  40bbc0:	4d 85 e4             	test   %r12,%r12
  40bbc3:	74 3d                	je     40bc02 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xae2>
  40bbc5:	4c 29 e6             	sub    %r12,%rsi
  40bbc8:	4c 89 e7             	mov    %r12,%rdi
  40bbcb:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
  40bbd0:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
  40bbd5:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40bbda:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  40bbdf:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  40bbe4:	e8 27 36 00 00       	call   40f210 <operator delete(void*, unsigned long)>
  40bbe9:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
  40bbee:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
  40bbf3:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40bbf8:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  40bbfd:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  40bc02:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  40bc07:	49 89 8e 50 85 00 00 	mov    %rcx,0x8550(%r14)
  40bc0e:	49 89 cc             	mov    %rcx,%r12
  40bc11:	44 8b 68 08          	mov    0x8(%rax),%r13d
  40bc15:	48 8b 38             	mov    (%rax),%rdi
  40bc18:	4d 89 be 58 85 00 00 	mov    %r15,0x8558(%r14)
  40bc1f:	48 01 ca             	add    %rcx,%rdx
  40bc22:	4d 8b 1e             	mov    (%r14),%r11
  40bc25:	49 89 96 60 85 00 00 	mov    %rdx,0x8560(%r14)
  40bc2c:	e9 fb f7 ff ff       	jmp    40b42c <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x30c>
  40bc31:	48 b8 ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rax
  40bc38:	ff ff 07 
  40bc3b:	49 89 ed             	mov    %rbp,%r13
  40bc3e:	4d 29 fd             	sub    %r15,%r13
  40bc41:	4c 89 ea             	mov    %r13,%rdx
  40bc44:	48 c1 fa 04          	sar    $0x4,%rdx
  40bc48:	48 39 c2             	cmp    %rax,%rdx
  40bc4b:	0f 84 d5 55 ff ff    	je     401226 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&) [clone .cold]>
  40bc51:	48 85 d2             	test   %rdx,%rdx
  40bc54:	b8 01 00 00 00       	mov    $0x1,%eax
  40bc59:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40bc5e:	48 0f 45 c2          	cmovne %rdx,%rax
  40bc62:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40bc67:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  40bc6c:	48 01 d0             	add    %rdx,%rax
  40bc6f:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
  40bc73:	48 ba ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rdx
  40bc7a:	ff ff 07 
  40bc7d:	48 39 d0             	cmp    %rdx,%rax
  40bc80:	48 0f 47 c2          	cmova  %rdx,%rax
  40bc84:	48 c1 e0 04          	shl    $0x4,%rax
  40bc88:	48 89 c7             	mov    %rax,%rdi
  40bc8b:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40bc90:	e8 4b 36 00 00       	call   40f2e0 <operator new(unsigned long)>
  40bc95:	8b 4c 24 30          	mov    0x30(%rsp),%ecx
  40bc99:	4c 39 fd             	cmp    %r15,%rbp
  40bc9c:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  40bca1:	4a 8d 14 28          	lea    (%rax,%r13,1),%rdx
  40bca5:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40bcaa:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40bcaf:	49 89 c3             	mov    %rax,%r11
  40bcb2:	48 89 1a             	mov    %rbx,(%rdx)
  40bcb5:	89 4a 08             	mov    %ecx,0x8(%rdx)
  40bcb8:	74 1b                	je     40bcd5 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xbb5>
  40bcba:	4c 89 f9             	mov    %r15,%rcx
  40bcbd:	0f 1f 00             	nopl   (%rax)
  40bcc0:	f3 0f 6f 01          	movdqu (%rcx),%xmm0
  40bcc4:	48 83 c0 10          	add    $0x10,%rax
  40bcc8:	48 83 c1 10          	add    $0x10,%rcx
  40bccc:	0f 11 40 f0          	movups %xmm0,-0x10(%rax)
  40bcd0:	48 39 d0             	cmp    %rdx,%rax
  40bcd3:	75 eb                	jne    40bcc0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xba0>
  40bcd5:	4c 8d 68 10          	lea    0x10(%rax),%r13
  40bcd9:	4d 85 ff             	test   %r15,%r15
  40bcdc:	74 40                	je     40bd1e <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0xbfe>
  40bcde:	48 89 ee             	mov    %rbp,%rsi
  40bce1:	4c 89 ff             	mov    %r15,%rdi
  40bce4:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
  40bce9:	4c 29 fe             	sub    %r15,%rsi
  40bcec:	4c 89 5c 24 48       	mov    %r11,0x48(%rsp)
  40bcf1:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40bcf6:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
  40bcfb:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  40bd00:	e8 0b 35 00 00       	call   40f210 <operator delete(void*, unsigned long)>
  40bd05:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
  40bd0a:	4c 8b 5c 24 48       	mov    0x48(%rsp),%r11
  40bd0f:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40bd14:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  40bd19:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  40bd1e:	4d 89 df             	mov    %r11,%r15
  40bd21:	8b 48 08             	mov    0x8(%rax),%ecx
  40bd24:	48 8b 28             	mov    (%rax),%rbp
  40bd27:	4d 89 9e 50 85 00 00 	mov    %r11,0x8550(%r14)
  40bd2e:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  40bd33:	4d 89 ae 58 85 00 00 	mov    %r13,0x8558(%r14)
  40bd3a:	4c 01 da             	add    %r11,%rdx
  40bd3d:	4d 8b 1e             	mov    (%r14),%r11
  40bd40:	49 89 96 60 85 00 00 	mov    %rdx,0x8560(%r14)
  40bd47:	e9 d1 fb ff ff       	jmp    40b91d <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x7fd>
  40bd4c:	31 c0                	xor    %eax,%eax
  40bd4e:	45 31 c9             	xor    %r9d,%r9d
  40bd51:	e9 83 f8 ff ff       	jmp    40b5d9 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x4b9>
  40bd56:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40bd5d:	00 00 00 

