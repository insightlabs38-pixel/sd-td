000000000040121c <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&) [clone .cold]>:
  40121c:	bf 00 82 4b 00       	mov    $0x4b8200,%edi
  401221:	e8 8d 04 00 00       	call   4016b3 <std::__throw_length_error(char const*)>

0000000000401226 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&) [clone .cold]>:
  401226:	bf 00 82 4b 00       	mov    $0x4b8200,%edi
  40122b:	e8 83 04 00 00       	call   4016b3 <std::__throw_length_error(char const*)>

000000000040a4b0 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)>:
  40a4b0:	41 57                	push   %r15
  40a4b2:	49 89 fa             	mov    %rdi,%r10
  40a4b5:	41 56                	push   %r14
  40a4b7:	41 55                	push   %r13
  40a4b9:	41 54                	push   %r12
  40a4bb:	55                   	push   %rbp
  40a4bc:	53                   	push   %rbx
  40a4bd:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  40a4c4:	48 8b 9f 40 83 00 00 	mov    0x8340(%rdi),%rbx
  40a4cb:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
  40a4d0:	48 89 d8             	mov    %rbx,%rax
  40a4d3:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  40a4d8:	25 ff 07 00 00       	and    $0x7ff,%eax
  40a4dd:	48 c1 e0 04          	shl    $0x4,%rax
  40a4e1:	4c 8d 34 07          	lea    (%rdi,%rax,1),%r14
  40a4e5:	45 8b 8e 48 02 00 00 	mov    0x248(%r14),%r9d
  40a4ec:	45 85 c9             	test   %r9d,%r9d
  40a4ef:	0f 84 70 06 00 00    	je     40ab65 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x6b5>
  40a4f5:	8b af 54 83 00 00    	mov    0x8354(%rdi),%ebp
  40a4fb:	4c 8b 1f             	mov    (%rdi),%r11
  40a4fe:	4d 89 f7             	mov    %r14,%r15
  40a501:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40a505:	b8 01 00 00 00       	mov    $0x1,%eax
  40a50a:	c6 44 24 17 00       	movb   $0x0,0x17(%rsp)
  40a50f:	45 31 f6             	xor    %r14d,%r14d
  40a512:	49 89 fc             	mov    %rdi,%r12
  40a515:	89 e9                	mov    %ebp,%ecx
  40a517:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
  40a51e:	00 
  40a51f:	49 8b 73 10          	mov    0x10(%r11),%rsi
  40a523:	d3 e0                	shl    %cl,%eax
  40a525:	44 8d 68 ff          	lea    -0x1(%rax),%r13d
  40a529:	48 8d 47 40          	lea    0x40(%rdi),%rax
  40a52d:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  40a532:	eb 19                	jmp    40a54d <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x9d>
  40a534:	0f 1f 40 00          	nopl   0x0(%rax)
  40a538:	49 83 c6 01          	add    $0x1,%r14
  40a53c:	45 39 ce             	cmp    %r9d,%r14d
  40a53f:	0f 83 66 04 00 00    	jae    40a9ab <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x4fb>
  40a545:	41 8b ac 24 54 83 00 	mov    0x8354(%r12),%ebp
  40a54c:	00 
  40a54d:	41 8d 79 ff          	lea    -0x1(%r9),%edi
  40a551:	41 8d 46 08          	lea    0x8(%r14),%eax
  40a555:	44 89 ea             	mov    %r13d,%edx
  40a558:	49 89 da             	mov    %rbx,%r10
  40a55b:	39 f8                	cmp    %edi,%eax
  40a55d:	4d 8b 87 40 02 00 00 	mov    0x240(%r15),%r8
  40a564:	0f 47 c7             	cmova  %edi,%eax
  40a567:	41 23 14 80          	and    (%r8,%rax,4),%edx
  40a56b:	89 d0                	mov    %edx,%eax
  40a56d:	0f 18 0c 96          	prefetcht0 (%rsi,%rdx,4)
  40a571:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
  40a576:	89 c1                	mov    %eax,%ecx
  40a578:	83 e0 7f             	and    $0x7f,%eax
  40a57b:	c1 e9 07             	shr    $0x7,%ecx
  40a57e:	48 8b 0c ca          	mov    (%rdx,%rcx,8),%rcx
  40a582:	0f 18 0c 81          	prefetcht0 (%rcx,%rax,4)
  40a586:	41 8d 4e 04          	lea    0x4(%r14),%ecx
  40a58a:	49 8b 43 18          	mov    0x18(%r11),%rax
  40a58e:	39 f9                	cmp    %edi,%ecx
  40a590:	0f 47 cf             	cmova  %edi,%ecx
  40a593:	44 89 ef             	mov    %r13d,%edi
  40a596:	41 23 3c 88          	and    (%r8,%rcx,4),%edi
  40a59a:	8b 0c be             	mov    (%rsi,%rdi,4),%ecx
  40a59d:	43 8b 3c b0          	mov    (%r8,%r14,4),%edi
  40a5a1:	0f 18 0c 88          	prefetcht0 (%rax,%rcx,4)
  40a5a5:	41 8b 8c 24 50 83 00 	mov    0x8350(%r12),%ecx
  40a5ac:	00 
  40a5ad:	41 89 f8             	mov    %edi,%r8d
  40a5b0:	45 21 e8             	and    %r13d,%r8d
  40a5b3:	49 d3 e2             	shl    %cl,%r10
  40a5b6:	89 e9                	mov    %ebp,%ecx
  40a5b8:	d3 ef                	shr    %cl,%edi
  40a5ba:	44 89 c1             	mov    %r8d,%ecx
  40a5bd:	c1 e9 07             	shr    $0x7,%ecx
  40a5c0:	49 09 fa             	or     %rdi,%r10
  40a5c3:	44 89 c7             	mov    %r8d,%edi
  40a5c6:	48 8b 0c ca          	mov    (%rdx,%rcx,8),%rcx
  40a5ca:	83 e7 7f             	and    $0x7f,%edi
  40a5cd:	4c 89 14 24          	mov    %r10,(%rsp)
  40a5d1:	8b 0c b9             	mov    (%rcx,%rdi,4),%ecx
  40a5d4:	49 39 ca             	cmp    %rcx,%r10
  40a5d7:	0f 85 5b ff ff ff    	jne    40a538 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x88>
  40a5dd:	44 89 c1             	mov    %r8d,%ecx
  40a5e0:	83 44 24 64 01       	addl   $0x1,0x64(%rsp)
  40a5e5:	8b 2c 8e             	mov    (%rsi,%rcx,4),%ebp
  40a5e8:	41 8d 48 01          	lea    0x1(%r8),%ecx
  40a5ec:	48 8d 3c 8d 00 00 00 	lea    0x0(,%rcx,4),%rdi
  40a5f3:	00 
  40a5f4:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  40a5f9:	3b 2c 8e             	cmp    (%rsi,%rcx,4),%ebp
  40a5fc:	0f 83 36 ff ff ff    	jae    40a538 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x88>
  40a602:	44 89 6c 24 60       	mov    %r13d,0x60(%rsp)
  40a607:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
  40a60c:	4c 89 7c 24 58       	mov    %r15,0x58(%rsp)
  40a611:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40a618:	00 00 00 00 
  40a61c:	0f 1f 40 00          	nopl   0x0(%rax)
  40a620:	41 8b 4b 08          	mov    0x8(%r11),%ecx
  40a624:	44 8b 34 a8          	mov    (%rax,%rbp,4),%r14d
  40a628:	48 8d 1c ad 00 00 00 	lea    0x0(,%rbp,4),%rbx
  40a62f:	00 
  40a630:	41 d3 ee             	shr    %cl,%r14d
  40a633:	44 89 f6             	mov    %r14d,%esi
  40a636:	c1 ee 07             	shr    $0x7,%esi
  40a639:	41 89 f2             	mov    %esi,%r10d
  40a63c:	4e 8d 2c d5 00 00 00 	lea    0x0(,%r10,8),%r13
  40a643:	00 
  40a644:	4c 01 ea             	add    %r13,%rdx
  40a647:	48 8b 0a             	mov    (%rdx),%rcx
  40a64a:	48 3b 4c 24 28       	cmp    0x28(%rsp),%rcx
  40a64f:	0f 84 1b 02 00 00    	je     40a870 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x3c0>
  40a655:	45 89 f1             	mov    %r14d,%r9d
  40a658:	8b 3c 18             	mov    (%rax,%rbx,1),%edi
  40a65b:	41 83 e1 7f          	and    $0x7f,%r9d
  40a65f:	4a 8d 14 89          	lea    (%rcx,%r9,4),%rdx
  40a663:	41 8b 4b 0c          	mov    0xc(%r11),%ecx
  40a667:	21 cf                	and    %ecx,%edi
  40a669:	89 fb                	mov    %edi,%ebx
  40a66b:	39 f9                	cmp    %edi,%ecx
  40a66d:	75 43                	jne    40a6b2 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x202>
  40a66f:	49 8b 7b 20          	mov    0x20(%r11),%rdi
  40a673:	49 8b 43 28          	mov    0x28(%r11),%rax
  40a677:	48 29 f8             	sub    %rdi,%rax
  40a67a:	48 c1 f8 04          	sar    $0x4,%rax
  40a67e:	66 90                	xchg   %ax,%ax
  40a680:	48 85 c0             	test   %rax,%rax
  40a683:	7e 29                	jle    40a6ae <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x1fe>
  40a685:	48 89 c6             	mov    %rax,%rsi
  40a688:	48 d1 fe             	sar    $1,%rsi
  40a68b:	48 89 f1             	mov    %rsi,%rcx
  40a68e:	48 c1 e1 04          	shl    $0x4,%rcx
  40a692:	48 01 f9             	add    %rdi,%rcx
  40a695:	48 39 29             	cmp    %rbp,(%rcx)
  40a698:	0f 83 2a 01 00 00    	jae    40a7c8 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x318>
  40a69e:	48 29 f0             	sub    %rsi,%rax
  40a6a1:	48 8d 79 10          	lea    0x10(%rcx),%rdi
  40a6a5:	48 83 e8 01          	sub    $0x1,%rax
  40a6a9:	48 85 c0             	test   %rax,%rax
  40a6ac:	7f d7                	jg     40a685 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x1d5>
  40a6ae:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  40a6b2:	8b 02                	mov    (%rdx),%eax
  40a6b4:	48 03 1c 24          	add    (%rsp),%rbx
  40a6b8:	49 89 df             	mov    %rbx,%r15
  40a6bb:	48 39 c3             	cmp    %rax,%rbx
  40a6be:	48 89 c1             	mov    %rax,%rcx
  40a6c1:	48 0f 46 cb          	cmovbe %rbx,%rcx
  40a6c5:	89 0a                	mov    %ecx,(%rdx)
  40a6c7:	41 8b 8c 24 50 83 00 	mov    0x8350(%r12),%ecx
  40a6ce:	00 
  40a6cf:	49 d3 ef             	shr    %cl,%r15
  40a6d2:	4c 89 fa             	mov    %r15,%rdx
  40a6d5:	49 2b 94 24 40 83 00 	sub    0x8340(%r12),%rdx
  40a6dc:	00 
  40a6dd:	48 81 fa ff 07 00 00 	cmp    $0x7ff,%rdx
  40a6e4:	0f 87 e6 00 00 00    	ja     40a7d0 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x320>
  40a6ea:	48 39 c3             	cmp    %rax,%rbx
  40a6ed:	4d 89 fd             	mov    %r15,%r13
  40a6f0:	45 89 f8             	mov    %r15d,%r8d
  40a6f3:	0f 92 c2             	setb   %dl
  40a6f6:	41 81 e5 ff 07 00 00 	and    $0x7ff,%r13d
  40a6fd:	41 81 e0 ff 07 00 00 	and    $0x7ff,%r8d
  40a704:	49 c1 e5 04          	shl    $0x4,%r13
  40a708:	4d 01 e5             	add    %r12,%r13
  40a70b:	41 8b b5 48 02 00 00 	mov    0x248(%r13),%esi
  40a712:	49 8b bd 40 02 00 00 	mov    0x240(%r13),%rdi
  40a719:	41 3b b5 4c 02 00 00 	cmp    0x24c(%r13),%esi
  40a720:	0f 84 ea 01 00 00    	je     40a910 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x460>
  40a726:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40a72b:	41 c1 e8 06          	shr    $0x6,%r8d
  40a72f:	d3 e0                	shl    %cl,%eax
  40a731:	41 8b 8c 24 54 83 00 	mov    0x8354(%r12),%ecx
  40a738:	00 
  40a739:	f7 d0                	not    %eax
  40a73b:	21 d8                	and    %ebx,%eax
  40a73d:	d3 e0                	shl    %cl,%eax
  40a73f:	44 89 f9             	mov    %r15d,%ecx
  40a742:	44 09 f0             	or     %r14d,%eax
  40a745:	89 04 b7             	mov    %eax,(%rdi,%rsi,4)
  40a748:	0f b6 c2             	movzbl %dl,%eax
  40a74b:	0f b6 d2             	movzbl %dl,%edx
  40a74e:	41 01 85 48 02 00 00 	add    %eax,0x248(%r13)
  40a755:	49 01 94 24 48 83 00 	add    %rdx,0x8348(%r12)
  40a75c:	00 
  40a75d:	48 d3 e2             	shl    %cl,%rdx
  40a760:	4b 09 94 c4 40 82 00 	or     %rdx,0x8240(%r12,%r8,8)
  40a767:	00 
  40a768:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  40a76d:	49 8b 73 10          	mov    0x10(%r11),%rsi
  40a771:	48 39 d8             	cmp    %rbx,%rax
  40a774:	0f 92 c0             	setb   %al
  40a777:	08 44 24 17          	or     %al,0x17(%rsp)
  40a77b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40a780:	48 8b 40 08          	mov    0x8(%rax),%rax
  40a784:	4a 8b 04 d0          	mov    (%rax,%r10,8),%rax
  40a788:	42 8b 04 88          	mov    (%rax,%r9,4),%eax
  40a78c:	48 01 d8             	add    %rbx,%rax
  40a78f:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  40a794:	48 8b 13             	mov    (%rbx),%rdx
  40a797:	48 39 d0             	cmp    %rdx,%rax
  40a79a:	48 0f 47 c2          	cmova  %rdx,%rax
  40a79e:	48 83 c5 01          	add    $0x1,%rbp
  40a7a2:	48 89 03             	mov    %rax,(%rbx)
  40a7a5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40a7aa:	3b 2c 06             	cmp    (%rsi,%rax,1),%ebp
  40a7ad:	0f 83 cd 01 00 00    	jae    40a980 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x4d0>
  40a7b3:	49 8b 43 18          	mov    0x18(%r11),%rax
  40a7b7:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
  40a7bc:	e9 5f fe ff ff       	jmp    40a620 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x170>
  40a7c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  40a7c8:	48 89 f0             	mov    %rsi,%rax
  40a7cb:	e9 b0 fe ff ff       	jmp    40a680 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x1d0>
  40a7d0:	48 39 c3             	cmp    %rax,%rbx
  40a7d3:	73 93                	jae    40a768 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x2b8>
  40a7d5:	4d 8b bc 24 60 83 00 	mov    0x8360(%r12),%r15
  40a7dc:	00 
  40a7dd:	49 8b b4 24 68 83 00 	mov    0x8368(%r12),%rsi
  40a7e4:	00 
  40a7e5:	4d 8b ac 24 58 83 00 	mov    0x8358(%r12),%r13
  40a7ec:	00 
  40a7ed:	49 39 f7             	cmp    %rsi,%r15
  40a7f0:	0f 84 40 02 00 00    	je     40aa36 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x586>
  40a7f6:	49 89 1f             	mov    %rbx,(%r15)
  40a7f9:	49 83 c7 10          	add    $0x10,%r15
  40a7fd:	48 89 df             	mov    %rbx,%rdi
  40a800:	45 89 77 f8          	mov    %r14d,-0x8(%r15)
  40a804:	4d 89 bc 24 60 83 00 	mov    %r15,0x8360(%r12)
  40a80b:	00 
  40a80c:	4d 29 ef             	sub    %r13,%r15
  40a80f:	4c 89 f9             	mov    %r15,%rcx
  40a812:	4b 8d 44 3d f0       	lea    -0x10(%r13,%r15,1),%rax
  40a817:	48 c1 f9 04          	sar    $0x4,%rcx
  40a81b:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40a81f:	48 83 e9 02          	sub    $0x2,%rcx
  40a823:	48 d1 f9             	sar    $1,%rcx
  40a826:	48 85 d2             	test   %rdx,%rdx
  40a829:	7e 31                	jle    40a85c <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x3ac>
  40a82b:	48 89 c8             	mov    %rcx,%rax
  40a82e:	48 c1 e0 04          	shl    $0x4,%rax
  40a832:	4c 01 e8             	add    %r13,%rax
  40a835:	48 8b 30             	mov    (%rax),%rsi
  40a838:	48 39 f7             	cmp    %rsi,%rdi
  40a83b:	0f 82 8f 00 00 00    	jb     40a8d0 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x420>
  40a841:	48 39 fe             	cmp    %rdi,%rsi
  40a844:	75 0d                	jne    40a853 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x3a3>
  40a846:	44 8b 40 08          	mov    0x8(%rax),%r8d
  40a84a:	45 39 c6             	cmp    %r8d,%r14d
  40a84d:	0f 82 81 00 00 00    	jb     40a8d4 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x424>
  40a853:	48 c1 e2 04          	shl    $0x4,%rdx
  40a857:	49 8d 44 15 00       	lea    0x0(%r13,%rdx,1),%rax
  40a85c:	48 89 38             	mov    %rdi,(%rax)
  40a85f:	44 89 70 08          	mov    %r14d,0x8(%rax)
  40a863:	e9 00 ff ff ff       	jmp    40a768 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x2b8>
  40a868:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40a86f:	00 
  40a870:	49 8b 4c 24 28       	mov    0x28(%r12),%rcx
  40a875:	49 2b 4c 24 20       	sub    0x20(%r12),%rcx
  40a87a:	48 c1 e1 07          	shl    $0x7,%rcx
  40a87e:	49 03 4c 24 38       	add    0x38(%r12),%rcx
  40a883:	48 89 c8             	mov    %rcx,%rax
  40a886:	48 8d b9 00 02 00 00 	lea    0x200(%rcx),%rdi
  40a88d:	0f 1f 00             	nopl   (%rax)
  40a890:	0f 11 00             	movups %xmm0,(%rax)
  40a893:	48 83 c0 20          	add    $0x20,%rax
  40a897:	0f 11 40 f0          	movups %xmm0,-0x10(%rax)
  40a89b:	48 39 f8             	cmp    %rdi,%rax
  40a89e:	75 f0                	jne    40a890 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x3e0>
  40a8a0:	48 89 0a             	mov    %rcx,(%rdx)
  40a8a3:	49 8b 44 24 28       	mov    0x28(%r12),%rax
  40a8a8:	89 74 24 7c          	mov    %esi,0x7c(%rsp)
  40a8ac:	49 3b 44 24 30       	cmp    0x30(%r12),%rax
  40a8b1:	0f 84 51 01 00 00    	je     40aa08 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x558>
  40a8b7:	89 30                	mov    %esi,(%rax)
  40a8b9:	48 83 c0 04          	add    $0x4,%rax
  40a8bd:	49 89 44 24 28       	mov    %rax,0x28(%r12)
  40a8c2:	49 8b 43 18          	mov    0x18(%r11),%rax
  40a8c6:	48 8b 0a             	mov    (%rdx),%rcx
  40a8c9:	e9 87 fd ff ff       	jmp    40a655 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x1a5>
  40a8ce:	66 90                	xchg   %ax,%ax
  40a8d0:	44 8b 40 08          	mov    0x8(%rax),%r8d
  40a8d4:	48 c1 e2 04          	shl    $0x4,%rdx
  40a8d8:	49 89 74 15 00       	mov    %rsi,0x0(%r13,%rdx,1)
  40a8dd:	45 89 44 15 08       	mov    %r8d,0x8(%r13,%rdx,1)
  40a8e2:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40a8e6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40a8ea:	48 8d 74 0a ff       	lea    -0x1(%rdx,%rcx,1),%rsi
  40a8ef:	48 89 ca             	mov    %rcx,%rdx
  40a8f2:	48 85 c9             	test   %rcx,%rcx
  40a8f5:	0f 84 61 ff ff ff    	je     40a85c <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x3ac>
  40a8fb:	48 d1 fe             	sar    $1,%rsi
  40a8fe:	48 89 f1             	mov    %rsi,%rcx
  40a901:	e9 25 ff ff ff       	jmp    40a82b <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x37b>
  40a906:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40a90d:	00 00 00 
  40a910:	b8 10 00 00 00       	mov    $0x10,%eax
  40a915:	01 f6                	add    %esi,%esi
  40a917:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  40a91c:	39 c6                	cmp    %eax,%esi
  40a91e:	4c 89 54 24 40       	mov    %r10,0x40(%rsp)
  40a923:	0f 42 f0             	cmovb  %eax,%esi
  40a926:	44 89 44 24 38       	mov    %r8d,0x38(%rsp)
  40a92b:	88 54 24 30          	mov    %dl,0x30(%rsp)
  40a92f:	41 89 b5 4c 02 00 00 	mov    %esi,0x24c(%r13)
  40a936:	8d 34 b5 00 00 00 00 	lea    0x0(,%rsi,4),%esi
  40a93d:	e8 be 91 03 00       	call   443b00 <__libc_realloc>
  40a942:	41 8b b5 48 02 00 00 	mov    0x248(%r13),%esi
  40a949:	4d 8b 1c 24          	mov    (%r12),%r11
  40a94d:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40a951:	49 89 85 40 02 00 00 	mov    %rax,0x240(%r13)
  40a958:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
  40a95d:	48 89 c7             	mov    %rax,%rdi
  40a960:	41 8b 8c 24 50 83 00 	mov    0x8350(%r12),%ecx
  40a967:	00 
  40a968:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
  40a96d:	44 8b 44 24 38       	mov    0x38(%rsp),%r8d
  40a972:	0f b6 54 24 30       	movzbl 0x30(%rsp),%edx
  40a977:	e9 aa fd ff ff       	jmp    40a726 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x276>
  40a97c:	0f 1f 40 00          	nopl   0x0(%rax)
  40a980:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
  40a985:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
  40a98a:	44 8b 6c 24 60       	mov    0x60(%rsp),%r13d
  40a98f:	49 8b 9c 24 40 83 00 	mov    0x8340(%r12),%rbx
  40a996:	00 
  40a997:	45 8b 8f 48 02 00 00 	mov    0x248(%r15),%r9d
  40a99e:	49 83 c6 01          	add    $0x1,%r14
  40a9a2:	45 39 ce             	cmp    %r9d,%r14d
  40a9a5:	0f 82 9a fb ff ff    	jb     40a545 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x95>
  40a9ab:	8b 44 24 64          	mov    0x64(%rsp),%eax
  40a9af:	4d 89 fe             	mov    %r15,%r14
  40a9b2:	4d 89 e2             	mov    %r12,%r10
  40a9b5:	48 89 da             	mov    %rbx,%rdx
  40a9b8:	89 d9                	mov    %ebx,%ecx
  40a9ba:	48 c7 c6 fe ff ff ff 	mov    $0xfffffffffffffffe,%rsi
  40a9c1:	4d 29 8a 48 83 00 00 	sub    %r9,0x8348(%r10)
  40a9c8:	48 c1 ea 06          	shr    $0x6,%rdx
  40a9cc:	0f b6 5c 24 17       	movzbl 0x17(%rsp),%ebx
  40a9d1:	41 c7 86 48 02 00 00 	movl   $0x0,0x248(%r14)
  40a9d8:	00 00 00 00 
  40a9dc:	48 d3 c6             	rol    %cl,%rsi
  40a9df:	83 e2 1f             	and    $0x1f,%edx
  40a9e2:	49 21 b4 d2 40 82 00 	and    %rsi,0x8240(%r10,%rdx,8)
  40a9e9:	00 
  40a9ea:	41 08 9a 78 83 00 00 	or     %bl,0x8378(%r10)
  40a9f1:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  40a9f8:	5b                   	pop    %rbx
  40a9f9:	5d                   	pop    %rbp
  40a9fa:	41 5c                	pop    %r12
  40a9fc:	41 5d                	pop    %r13
  40a9fe:	41 5e                	pop    %r14
  40aa00:	41 5f                	pop    %r15
  40aa02:	c3                   	ret
  40aa03:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40aa08:	48 8d 74 24 7c       	lea    0x7c(%rsp),%rsi
  40aa0d:	49 8d 7c 24 20       	lea    0x20(%r12),%rdi
  40aa12:	4c 89 54 24 30       	mov    %r10,0x30(%rsp)
  40aa17:	e8 84 d9 ff ff       	call   4083a0 <void std::vector<unsigned int, std::allocator<unsigned int> >::_M_realloc_append<unsigned int const&>(unsigned int const&)>
  40aa1c:	49 8b 54 24 08       	mov    0x8(%r12),%rdx
  40aa21:	4d 8b 1c 24          	mov    (%r12),%r11
  40aa25:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40aa29:	4c 8b 54 24 30       	mov    0x30(%rsp),%r10
  40aa2e:	4c 01 ea             	add    %r13,%rdx
  40aa31:	e9 8c fe ff ff       	jmp    40a8c2 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x412>
  40aa36:	48 b8 ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rax
  40aa3d:	ff ff 07 
  40aa40:	4c 89 f9             	mov    %r15,%rcx
  40aa43:	4c 29 e9             	sub    %r13,%rcx
  40aa46:	48 89 ca             	mov    %rcx,%rdx
  40aa49:	48 c1 fa 04          	sar    $0x4,%rdx
  40aa4d:	48 39 c2             	cmp    %rax,%rdx
  40aa50:	0f 84 c6 67 ff ff    	je     40121c <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&) [clone .cold]>
  40aa56:	48 85 d2             	test   %rdx,%rdx
  40aa59:	b8 01 00 00 00       	mov    $0x1,%eax
  40aa5e:	4c 89 4c 24 68       	mov    %r9,0x68(%rsp)
  40aa63:	48 0f 45 c2          	cmovne %rdx,%rax
  40aa67:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40aa6c:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
  40aa71:	48 01 d0             	add    %rdx,%rax
  40aa74:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
  40aa79:	48 ba ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rdx
  40aa80:	ff ff 07 
  40aa83:	48 39 d0             	cmp    %rdx,%rax
  40aa86:	48 0f 47 c2          	cmova  %rdx,%rax
  40aa8a:	48 c1 e0 04          	shl    $0x4,%rax
  40aa8e:	48 89 c7             	mov    %rax,%rdi
  40aa91:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  40aa96:	e8 05 46 00 00       	call   40f0a0 <operator new(unsigned long)>
  40aa9b:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
  40aaa0:	4d 39 ef             	cmp    %r13,%r15
  40aaa3:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  40aaa8:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40aaad:	4c 8b 4c 24 68       	mov    0x68(%rsp),%r9
  40aab2:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40aab6:	48 89 1c 08          	mov    %rbx,(%rax,%rcx,1)
  40aaba:	44 89 74 08 08       	mov    %r14d,0x8(%rax,%rcx,1)
  40aabf:	0f 84 af 00 00 00    	je     40ab74 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x6c4>
  40aac5:	48 89 c1             	mov    %rax,%rcx
  40aac8:	4c 89 ea             	mov    %r13,%rdx
  40aacb:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40aad2:	00 00 00 00 
  40aad6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40aadd:	00 00 00 
  40aae0:	f3 0f 6f 0a          	movdqu (%rdx),%xmm1
  40aae4:	48 83 c2 10          	add    $0x10,%rdx
  40aae8:	48 83 c1 10          	add    $0x10,%rcx
  40aaec:	0f 11 49 f0          	movups %xmm1,-0x10(%rcx)
  40aaf0:	49 39 d7             	cmp    %rdx,%r15
  40aaf3:	75 eb                	jne    40aae0 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x630>
  40aaf5:	4d 29 ef             	sub    %r13,%r15
  40aaf8:	4e 8d 34 38          	lea    (%rax,%r15,1),%r14
  40aafc:	4d 8d 7e 10          	lea    0x10(%r14),%r15
  40ab00:	4d 85 ed             	test   %r13,%r13
  40ab03:	74 2d                	je     40ab32 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x682>
  40ab05:	4c 29 ee             	sub    %r13,%rsi
  40ab08:	4c 89 ef             	mov    %r13,%rdi
  40ab0b:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  40ab10:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40ab15:	4c 89 54 24 38       	mov    %r10,0x38(%rsp)
  40ab1a:	e8 b1 44 00 00       	call   40efd0 <operator delete(void*, unsigned long)>
  40ab1f:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  40ab24:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40ab29:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  40ab2d:	4c 8b 54 24 38       	mov    0x38(%rsp),%r10
  40ab32:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
  40ab37:	49 8b 3e             	mov    (%r14),%rdi
  40ab3a:	49 89 c5             	mov    %rax,%r13
  40ab3d:	49 89 84 24 58 83 00 	mov    %rax,0x8358(%r12)
  40ab44:	00 
  40ab45:	45 8b 76 08          	mov    0x8(%r14),%r14d
  40ab49:	4d 8b 1c 24          	mov    (%r12),%r11
  40ab4d:	4d 89 bc 24 60 83 00 	mov    %r15,0x8360(%r12)
  40ab54:	00 
  40ab55:	48 01 c2             	add    %rax,%rdx
  40ab58:	49 89 94 24 68 83 00 	mov    %rdx,0x8368(%r12)
  40ab5f:	00 
  40ab60:	e9 a7 fc ff ff       	jmp    40a80c <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x35c>
  40ab65:	c6 44 24 17 00       	movb   $0x0,0x17(%rsp)
  40ab6a:	31 c0                	xor    %eax,%eax
  40ab6c:	45 31 c9             	xor    %r9d,%r9d
  40ab6f:	e9 41 fe ff ff       	jmp    40a9b5 <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x505>
  40ab74:	49 89 c6             	mov    %rax,%r14
  40ab77:	eb 83                	jmp    40aafc <Side<unsigned int>::drain(Side<unsigned int> const&, unsigned long&)+0x64c>
  40ab79:	90                   	nop
  40ab7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

000000000040ab80 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)>:
  40ab80:	41 57                	push   %r15
  40ab82:	49 89 fa             	mov    %rdi,%r10
  40ab85:	41 56                	push   %r14
  40ab87:	41 55                	push   %r13
  40ab89:	41 54                	push   %r12
  40ab8b:	55                   	push   %rbp
  40ab8c:	53                   	push   %rbx
  40ab8d:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  40ab94:	48 8b 9f 40 85 00 00 	mov    0x8540(%rdi),%rbx
  40ab9b:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
  40aba0:	48 89 d8             	mov    %rbx,%rax
  40aba3:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  40aba8:	25 ff 07 00 00       	and    $0x7ff,%eax
  40abad:	48 c1 e0 04          	shl    $0x4,%rax
  40abb1:	4c 8d 34 07          	lea    (%rdi,%rax,1),%r14
  40abb5:	45 8b 8e 48 04 00 00 	mov    0x448(%r14),%r9d
  40abbc:	45 85 c9             	test   %r9d,%r9d
  40abbf:	0f 84 64 06 00 00    	je     40b229 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x6a9>
  40abc5:	8b af 54 85 00 00    	mov    0x8554(%rdi),%ebp
  40abcb:	4c 8b 1f             	mov    (%rdi),%r11
  40abce:	4d 89 f7             	mov    %r14,%r15
  40abd1:	49 89 fc             	mov    %rdi,%r12
  40abd4:	b8 01 00 00 00       	mov    $0x1,%eax
  40abd9:	c6 44 24 1f 00       	movb   $0x0,0x1f(%rsp)
  40abde:	45 31 f6             	xor    %r14d,%r14d
  40abe1:	66 0f 6f 05 d7 27 0b 	movdqa 0xb27d7(%rip),%xmm0        # 4bd3c0 <max.0+0x20>
  40abe8:	00 
  40abe9:	89 e9                	mov    %ebp,%ecx
  40abeb:	c7 44 24 64 00 00 00 	movl   $0x0,0x64(%rsp)
  40abf2:	00 
  40abf3:	49 8b 53 10          	mov    0x10(%r11),%rdx
  40abf7:	d3 e0                	shl    %cl,%eax
  40abf9:	44 8d 68 ff          	lea    -0x1(%rax),%r13d
  40abfd:	eb 16                	jmp    40ac15 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x95>
  40abff:	90                   	nop
  40ac00:	49 83 c6 01          	add    $0x1,%r14
  40ac04:	45 39 ce             	cmp    %r9d,%r14d
  40ac07:	0f 83 4e 04 00 00    	jae    40b05b <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x4db>
  40ac0d:	41 8b ac 24 54 85 00 	mov    0x8554(%r12),%ebp
  40ac14:	00 
  40ac15:	41 8d 79 ff          	lea    -0x1(%r9),%edi
  40ac19:	41 8d 46 08          	lea    0x8(%r14),%eax
  40ac1d:	4d 8b 87 40 04 00 00 	mov    0x440(%r15),%r8
  40ac24:	49 89 da             	mov    %rbx,%r10
  40ac27:	39 f8                	cmp    %edi,%eax
  40ac29:	0f 47 c7             	cmova  %edi,%eax
  40ac2c:	41 8b 0c 80          	mov    (%r8,%rax,4),%ecx
  40ac30:	44 21 e9             	and    %r13d,%ecx
  40ac33:	89 c8                	mov    %ecx,%eax
  40ac35:	89 ce                	mov    %ecx,%esi
  40ac37:	83 e1 7f             	and    $0x7f,%ecx
  40ac3a:	0f 18 0c 82          	prefetcht0 (%rdx,%rax,4)
  40ac3e:	49 8b 44 24 08       	mov    0x8(%r12),%rax
  40ac43:	c1 ee 07             	shr    $0x7,%esi
  40ac46:	48 8b 34 f0          	mov    (%rax,%rsi,8),%rsi
  40ac4a:	0f 18 0c ce          	prefetcht0 (%rsi,%rcx,8)
  40ac4e:	41 8d 4e 04          	lea    0x4(%r14),%ecx
  40ac52:	49 8b 73 18          	mov    0x18(%r11),%rsi
  40ac56:	39 f9                	cmp    %edi,%ecx
  40ac58:	0f 47 cf             	cmova  %edi,%ecx
  40ac5b:	44 89 ef             	mov    %r13d,%edi
  40ac5e:	41 23 3c 88          	and    (%r8,%rcx,4),%edi
  40ac62:	8b 0c ba             	mov    (%rdx,%rdi,4),%ecx
  40ac65:	43 8b 3c b0          	mov    (%r8,%r14,4),%edi
  40ac69:	0f 18 0c 8e          	prefetcht0 (%rsi,%rcx,4)
  40ac6d:	41 8b 8c 24 50 85 00 	mov    0x8550(%r12),%ecx
  40ac74:	00 
  40ac75:	41 89 f8             	mov    %edi,%r8d
  40ac78:	45 21 e8             	and    %r13d,%r8d
  40ac7b:	49 d3 e2             	shl    %cl,%r10
  40ac7e:	89 e9                	mov    %ebp,%ecx
  40ac80:	d3 ef                	shr    %cl,%edi
  40ac82:	44 89 c1             	mov    %r8d,%ecx
  40ac85:	c1 e9 07             	shr    $0x7,%ecx
  40ac88:	49 09 fa             	or     %rdi,%r10
  40ac8b:	44 89 c7             	mov    %r8d,%edi
  40ac8e:	48 8b 0c c8          	mov    (%rax,%rcx,8),%rcx
  40ac92:	83 e7 7f             	and    $0x7f,%edi
  40ac95:	4c 89 14 24          	mov    %r10,(%rsp)
  40ac99:	4c 3b 14 f9          	cmp    (%rcx,%rdi,8),%r10
  40ac9d:	0f 85 5d ff ff ff    	jne    40ac00 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x80>
  40aca3:	44 89 c1             	mov    %r8d,%ecx
  40aca6:	83 44 24 64 01       	addl   $0x1,0x64(%rsp)
  40acab:	8b 2c 8a             	mov    (%rdx,%rcx,4),%ebp
  40acae:	41 8d 48 01          	lea    0x1(%r8),%ecx
  40acb2:	48 8d 3c 8d 00 00 00 	lea    0x0(,%rcx,4),%rdi
  40acb9:	00 
  40acba:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  40acbf:	3b 2c 8a             	cmp    (%rdx,%rcx,4),%ebp
  40acc2:	0f 83 38 ff ff ff    	jae    40ac00 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x80>
  40acc8:	49 8d 5c 24 40       	lea    0x40(%r12),%rbx
  40accd:	44 89 6c 24 60       	mov    %r13d,0x60(%rsp)
  40acd2:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
  40acd7:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
  40acdc:	4c 89 7c 24 58       	mov    %r15,0x58(%rsp)
  40ace1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40ace8:	00 00 00 00 
  40acec:	0f 1f 40 00          	nopl   0x0(%rax)
  40acf0:	41 8b 4b 08          	mov    0x8(%r11),%ecx
  40acf4:	44 8b 34 ae          	mov    (%rsi,%rbp,4),%r14d
  40acf8:	48 8d 1c ad 00 00 00 	lea    0x0(,%rbp,4),%rbx
  40acff:	00 
  40ad00:	41 d3 ee             	shr    %cl,%r14d
  40ad03:	44 89 f7             	mov    %r14d,%edi
  40ad06:	c1 ef 07             	shr    $0x7,%edi
  40ad09:	41 89 f9             	mov    %edi,%r9d
  40ad0c:	4e 8d 04 c8          	lea    (%rax,%r9,8),%r8
  40ad10:	49 8b 10             	mov    (%r8),%rdx
  40ad13:	48 3b 54 24 10       	cmp    0x10(%rsp),%rdx
  40ad18:	0f 84 12 02 00 00    	je     40af30 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x3b0>
  40ad1e:	8b 3c 1e             	mov    (%rsi,%rbx,1),%edi
  40ad21:	41 8b 43 0c          	mov    0xc(%r11),%eax
  40ad25:	45 89 f2             	mov    %r14d,%r10d
  40ad28:	41 83 e2 7f          	and    $0x7f,%r10d
  40ad2c:	21 c7                	and    %eax,%edi
  40ad2e:	4a 8d 14 d2          	lea    (%rdx,%r10,8),%rdx
  40ad32:	89 fb                	mov    %edi,%ebx
  40ad34:	39 f8                	cmp    %edi,%eax
  40ad36:	75 4a                	jne    40ad82 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x202>
  40ad38:	49 8b 7b 20          	mov    0x20(%r11),%rdi
  40ad3c:	49 8b 43 28          	mov    0x28(%r11),%rax
  40ad40:	48 29 f8             	sub    %rdi,%rax
  40ad43:	48 c1 f8 04          	sar    $0x4,%rax
  40ad47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40ad4e:	00 00 
  40ad50:	48 85 c0             	test   %rax,%rax
  40ad53:	7e 29                	jle    40ad7e <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x1fe>
  40ad55:	48 89 c6             	mov    %rax,%rsi
  40ad58:	48 d1 fe             	sar    $1,%rsi
  40ad5b:	48 89 f1             	mov    %rsi,%rcx
  40ad5e:	48 c1 e1 04          	shl    $0x4,%rcx
  40ad62:	48 01 f9             	add    %rdi,%rcx
  40ad65:	48 39 29             	cmp    %rbp,(%rcx)
  40ad68:	0f 83 2a 01 00 00    	jae    40ae98 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x318>
  40ad6e:	48 29 f0             	sub    %rsi,%rax
  40ad71:	48 8d 79 10          	lea    0x10(%rcx),%rdi
  40ad75:	48 83 e8 01          	sub    $0x1,%rax
  40ad79:	48 85 c0             	test   %rax,%rax
  40ad7c:	7f d7                	jg     40ad55 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x1d5>
  40ad7e:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  40ad82:	48 8b 02             	mov    (%rdx),%rax
  40ad85:	48 03 1c 24          	add    (%rsp),%rbx
  40ad89:	49 89 df             	mov    %rbx,%r15
  40ad8c:	48 39 c3             	cmp    %rax,%rbx
  40ad8f:	48 89 c1             	mov    %rax,%rcx
  40ad92:	48 0f 46 cb          	cmovbe %rbx,%rcx
  40ad96:	48 89 0a             	mov    %rcx,(%rdx)
  40ad99:	41 8b 8c 24 50 85 00 	mov    0x8550(%r12),%ecx
  40ada0:	00 
  40ada1:	49 d3 ef             	shr    %cl,%r15
  40ada4:	4c 89 fa             	mov    %r15,%rdx
  40ada7:	49 2b 94 24 40 85 00 	sub    0x8540(%r12),%rdx
  40adae:	00 
  40adaf:	48 81 fa ff 07 00 00 	cmp    $0x7ff,%rdx
  40adb6:	0f 87 e4 00 00 00    	ja     40aea0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x320>
  40adbc:	48 39 c3             	cmp    %rax,%rbx
  40adbf:	4d 89 fd             	mov    %r15,%r13
  40adc2:	45 89 f8             	mov    %r15d,%r8d
  40adc5:	0f 92 c2             	setb   %dl
  40adc8:	41 81 e5 ff 07 00 00 	and    $0x7ff,%r13d
  40adcf:	41 81 e0 ff 07 00 00 	and    $0x7ff,%r8d
  40add6:	49 c1 e5 04          	shl    $0x4,%r13
  40adda:	4d 01 e5             	add    %r12,%r13
  40addd:	41 8b b5 48 04 00 00 	mov    0x448(%r13),%esi
  40ade4:	49 8b bd 40 04 00 00 	mov    0x440(%r13),%rdi
  40adeb:	41 3b b5 4c 04 00 00 	cmp    0x44c(%r13),%esi
  40adf2:	0f 84 c8 01 00 00    	je     40afc0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x440>
  40adf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40adfd:	41 c1 e8 06          	shr    $0x6,%r8d
  40ae01:	d3 e0                	shl    %cl,%eax
  40ae03:	41 8b 8c 24 54 85 00 	mov    0x8554(%r12),%ecx
  40ae0a:	00 
  40ae0b:	f7 d0                	not    %eax
  40ae0d:	21 d8                	and    %ebx,%eax
  40ae0f:	d3 e0                	shl    %cl,%eax
  40ae11:	44 89 f9             	mov    %r15d,%ecx
  40ae14:	44 09 f0             	or     %r14d,%eax
  40ae17:	89 04 b7             	mov    %eax,(%rdi,%rsi,4)
  40ae1a:	0f b6 c2             	movzbl %dl,%eax
  40ae1d:	0f b6 d2             	movzbl %dl,%edx
  40ae20:	41 01 85 48 04 00 00 	add    %eax,0x448(%r13)
  40ae27:	49 01 94 24 48 85 00 	add    %rdx,0x8548(%r12)
  40ae2e:	00 
  40ae2f:	48 d3 e2             	shl    %cl,%rdx
  40ae32:	4b 09 94 c4 40 84 00 	or     %rdx,0x8440(%r12,%r8,8)
  40ae39:	00 
  40ae3a:	48 b8 ff ff ff ff ff 	movabs $0x3fffffffffffffff,%rax
  40ae41:	ff ff 3f 
  40ae44:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
  40ae49:	48 39 d8             	cmp    %rbx,%rax
  40ae4c:	0f 92 c0             	setb   %al
  40ae4f:	08 44 24 1f          	or     %al,0x1f(%rsp)
  40ae53:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  40ae58:	48 8b 40 08          	mov    0x8(%rax),%rax
  40ae5c:	4a 8b 04 c8          	mov    (%rax,%r9,8),%rax
  40ae60:	4a 03 1c d0          	add    (%rax,%r10,8),%rbx
  40ae64:	48 8b 02             	mov    (%rdx),%rax
  40ae67:	48 39 c3             	cmp    %rax,%rbx
  40ae6a:	48 0f 47 d8          	cmova  %rax,%rbx
  40ae6e:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40ae73:	48 83 c5 01          	add    $0x1,%rbp
  40ae77:	48 89 1a             	mov    %rbx,(%rdx)
  40ae7a:	49 8b 53 10          	mov    0x10(%r11),%rdx
  40ae7e:	3b 2c 02             	cmp    (%rdx,%rax,1),%ebp
  40ae81:	0f 83 a9 01 00 00    	jae    40b030 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x4b0>
  40ae87:	49 8b 73 18          	mov    0x18(%r11),%rsi
  40ae8b:	49 8b 44 24 08       	mov    0x8(%r12),%rax
  40ae90:	e9 5b fe ff ff       	jmp    40acf0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x170>
  40ae95:	0f 1f 00             	nopl   (%rax)
  40ae98:	48 89 f0             	mov    %rsi,%rax
  40ae9b:	e9 b0 fe ff ff       	jmp    40ad50 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x1d0>
  40aea0:	48 39 c3             	cmp    %rax,%rbx
  40aea3:	73 95                	jae    40ae3a <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x2ba>
  40aea5:	4d 8b bc 24 60 85 00 	mov    0x8560(%r12),%r15
  40aeac:	00 
  40aead:	49 8b b4 24 68 85 00 	mov    0x8568(%r12),%rsi
  40aeb4:	00 
  40aeb5:	4d 8b ac 24 58 85 00 	mov    0x8558(%r12),%r13
  40aebc:	00 
  40aebd:	49 39 f7             	cmp    %rsi,%r15
  40aec0:	0f 84 31 02 00 00    	je     40b0f7 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x577>
  40aec6:	49 89 1f             	mov    %rbx,(%r15)
  40aec9:	49 83 c7 10          	add    $0x10,%r15
  40aecd:	48 89 df             	mov    %rbx,%rdi
  40aed0:	45 89 77 f8          	mov    %r14d,-0x8(%r15)
  40aed4:	4d 89 bc 24 60 85 00 	mov    %r15,0x8560(%r12)
  40aedb:	00 
  40aedc:	4d 29 ef             	sub    %r13,%r15
  40aedf:	4c 89 f9             	mov    %r15,%rcx
  40aee2:	4b 8d 44 3d f0       	lea    -0x10(%r13,%r15,1),%rax
  40aee7:	48 c1 f9 04          	sar    $0x4,%rcx
  40aeeb:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40aeef:	48 83 e9 02          	sub    $0x2,%rcx
  40aef3:	48 d1 f9             	sar    $1,%rcx
  40aef6:	48 85 d2             	test   %rdx,%rdx
  40aef9:	7e 29                	jle    40af24 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x3a4>
  40aefb:	48 89 c8             	mov    %rcx,%rax
  40aefe:	48 c1 e0 04          	shl    $0x4,%rax
  40af02:	4c 01 e8             	add    %r13,%rax
  40af05:	48 8b 30             	mov    (%rax),%rsi
  40af08:	48 39 f7             	cmp    %rsi,%rdi
  40af0b:	72 7b                	jb     40af88 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x408>
  40af0d:	48 39 fe             	cmp    %rdi,%rsi
  40af10:	75 09                	jne    40af1b <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x39b>
  40af12:	44 8b 40 08          	mov    0x8(%rax),%r8d
  40af16:	45 39 c6             	cmp    %r8d,%r14d
  40af19:	72 71                	jb     40af8c <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x40c>
  40af1b:	48 c1 e2 04          	shl    $0x4,%rdx
  40af1f:	49 8d 44 15 00       	lea    0x0(%r13,%rdx,1),%rax
  40af24:	48 89 38             	mov    %rdi,(%rax)
  40af27:	44 89 70 08          	mov    %r14d,0x8(%rax)
  40af2b:	e9 0a ff ff ff       	jmp    40ae3a <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x2ba>
  40af30:	4d 8b 54 24 28       	mov    0x28(%r12),%r10
  40af35:	4c 89 d2             	mov    %r10,%rdx
  40af38:	49 2b 54 24 20       	sub    0x20(%r12),%rdx
  40af3d:	48 c1 e2 08          	shl    $0x8,%rdx
  40af41:	49 03 54 24 38       	add    0x38(%r12),%rdx
  40af46:	48 89 d0             	mov    %rdx,%rax
  40af49:	48 8d 8a 00 04 00 00 	lea    0x400(%rdx),%rcx
  40af50:	0f 11 00             	movups %xmm0,(%rax)
  40af53:	48 83 c0 20          	add    $0x20,%rax
  40af57:	0f 11 40 f0          	movups %xmm0,-0x10(%rax)
  40af5b:	48 39 c8             	cmp    %rcx,%rax
  40af5e:	75 f0                	jne    40af50 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x3d0>
  40af60:	49 89 10             	mov    %rdx,(%r8)
  40af63:	89 7c 24 7c          	mov    %edi,0x7c(%rsp)
  40af67:	4d 3b 54 24 30       	cmp    0x30(%r12),%r10
  40af6c:	0f 84 4e 01 00 00    	je     40b0c0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x540>
  40af72:	41 89 3a             	mov    %edi,(%r10)
  40af75:	49 83 c2 04          	add    $0x4,%r10
  40af79:	4d 89 54 24 28       	mov    %r10,0x28(%r12)
  40af7e:	e9 9b fd ff ff       	jmp    40ad1e <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x19e>
  40af83:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40af88:	44 8b 40 08          	mov    0x8(%rax),%r8d
  40af8c:	48 c1 e2 04          	shl    $0x4,%rdx
  40af90:	49 89 74 15 00       	mov    %rsi,0x0(%r13,%rdx,1)
  40af95:	45 89 44 15 08       	mov    %r8d,0x8(%r13,%rdx,1)
  40af9a:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40af9e:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40afa2:	48 8d 74 0a ff       	lea    -0x1(%rdx,%rcx,1),%rsi
  40afa7:	48 89 ca             	mov    %rcx,%rdx
  40afaa:	48 85 c9             	test   %rcx,%rcx
  40afad:	0f 84 71 ff ff ff    	je     40af24 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x3a4>
  40afb3:	48 d1 fe             	sar    $1,%rsi
  40afb6:	48 89 f1             	mov    %rsi,%rcx
  40afb9:	e9 3d ff ff ff       	jmp    40aefb <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x37b>
  40afbe:	66 90                	xchg   %ax,%ax
  40afc0:	b8 10 00 00 00       	mov    $0x10,%eax
  40afc5:	01 f6                	add    %esi,%esi
  40afc7:	4c 89 54 24 48       	mov    %r10,0x48(%rsp)
  40afcc:	39 c6                	cmp    %eax,%esi
  40afce:	4c 89 4c 24 40       	mov    %r9,0x40(%rsp)
  40afd3:	0f 42 f0             	cmovb  %eax,%esi
  40afd6:	44 89 44 24 38       	mov    %r8d,0x38(%rsp)
  40afdb:	88 54 24 30          	mov    %dl,0x30(%rsp)
  40afdf:	41 89 b5 4c 04 00 00 	mov    %esi,0x44c(%r13)
  40afe6:	8d 34 b5 00 00 00 00 	lea    0x0(,%rsi,4),%esi
  40afed:	e8 0e 8b 03 00       	call   443b00 <__libc_realloc>
  40aff2:	41 8b b5 48 04 00 00 	mov    0x448(%r13),%esi
  40aff9:	4d 8b 1c 24          	mov    (%r12),%r11
  40affd:	49 89 85 40 04 00 00 	mov    %rax,0x440(%r13)
  40b004:	66 0f 6f 05 b4 23 0b 	movdqa 0xb23b4(%rip),%xmm0        # 4bd3c0 <max.0+0x20>
  40b00b:	00 
  40b00c:	48 89 c7             	mov    %rax,%rdi
  40b00f:	41 8b 8c 24 50 85 00 	mov    0x8550(%r12),%ecx
  40b016:	00 
  40b017:	4c 8b 54 24 48       	mov    0x48(%rsp),%r10
  40b01c:	4c 8b 4c 24 40       	mov    0x40(%rsp),%r9
  40b021:	44 8b 44 24 38       	mov    0x38(%rsp),%r8d
  40b026:	0f b6 54 24 30       	movzbl 0x30(%rsp),%edx
  40b02b:	e9 c8 fd ff ff       	jmp    40adf8 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x278>
  40b030:	4c 8b 7c 24 58       	mov    0x58(%rsp),%r15
  40b035:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
  40b03a:	44 8b 6c 24 60       	mov    0x60(%rsp),%r13d
  40b03f:	49 8b 9c 24 40 85 00 	mov    0x8540(%r12),%rbx
  40b046:	00 
  40b047:	45 8b 8f 48 04 00 00 	mov    0x448(%r15),%r9d
  40b04e:	49 83 c6 01          	add    $0x1,%r14
  40b052:	45 39 ce             	cmp    %r9d,%r14d
  40b055:	0f 82 b2 fb ff ff    	jb     40ac0d <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x8d>
  40b05b:	8b 44 24 64          	mov    0x64(%rsp),%eax
  40b05f:	4d 89 fe             	mov    %r15,%r14
  40b062:	4d 89 e2             	mov    %r12,%r10
  40b065:	45 89 cb             	mov    %r9d,%r11d
  40b068:	48 89 da             	mov    %rbx,%rdx
  40b06b:	89 d9                	mov    %ebx,%ecx
  40b06d:	48 c7 c6 fe ff ff ff 	mov    $0xfffffffffffffffe,%rsi
  40b074:	4d 29 9a 48 85 00 00 	sub    %r11,0x8548(%r10)
  40b07b:	48 c1 ea 06          	shr    $0x6,%rdx
  40b07f:	0f b6 5c 24 1f       	movzbl 0x1f(%rsp),%ebx
  40b084:	41 c7 86 48 04 00 00 	movl   $0x0,0x448(%r14)
  40b08b:	00 00 00 00 
  40b08f:	48 d3 c6             	rol    %cl,%rsi
  40b092:	83 e2 1f             	and    $0x1f,%edx
  40b095:	49 21 b4 d2 40 84 00 	and    %rsi,0x8440(%r10,%rdx,8)
  40b09c:	00 
  40b09d:	41 08 9a 78 85 00 00 	or     %bl,0x8578(%r10)
  40b0a4:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  40b0ab:	5b                   	pop    %rbx
  40b0ac:	5d                   	pop    %rbp
  40b0ad:	41 5c                	pop    %r12
  40b0af:	41 5d                	pop    %r13
  40b0b1:	41 5e                	pop    %r14
  40b0b3:	41 5f                	pop    %r15
  40b0b5:	c3                   	ret
  40b0b6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40b0bd:	00 00 00 
  40b0c0:	48 8d 74 24 7c       	lea    0x7c(%rsp),%rsi
  40b0c5:	49 8d 7c 24 20       	lea    0x20(%r12),%rdi
  40b0ca:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
  40b0cf:	e8 cc d2 ff ff       	call   4083a0 <void std::vector<unsigned int, std::allocator<unsigned int> >::_M_realloc_append<unsigned int const&>(unsigned int const&)>
  40b0d4:	49 8b 44 24 08       	mov    0x8(%r12),%rax
  40b0d9:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  40b0de:	4d 8b 1c 24          	mov    (%r12),%r11
  40b0e2:	66 0f 6f 05 d6 22 0b 	movdqa 0xb22d6(%rip),%xmm0        # 4bd3c0 <max.0+0x20>
  40b0e9:	00 
  40b0ea:	4a 8b 14 c8          	mov    (%rax,%r9,8),%rdx
  40b0ee:	49 8b 73 18          	mov    0x18(%r11),%rsi
  40b0f2:	e9 27 fc ff ff       	jmp    40ad1e <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x19e>
  40b0f7:	48 b8 ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rax
  40b0fe:	ff ff 07 
  40b101:	4c 89 f9             	mov    %r15,%rcx
  40b104:	4c 29 e9             	sub    %r13,%rcx
  40b107:	48 89 ca             	mov    %rcx,%rdx
  40b10a:	48 c1 fa 04          	sar    $0x4,%rdx
  40b10e:	48 39 c2             	cmp    %rax,%rdx
  40b111:	0f 84 0f 61 ff ff    	je     401226 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&) [clone .cold]>
  40b117:	48 85 d2             	test   %rdx,%rdx
  40b11a:	b8 01 00 00 00       	mov    $0x1,%eax
  40b11f:	4c 89 54 24 68       	mov    %r10,0x68(%rsp)
  40b124:	48 0f 45 c2          	cmovne %rdx,%rax
  40b128:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
  40b12d:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
  40b132:	48 01 d0             	add    %rdx,%rax
  40b135:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
  40b13a:	48 ba ff ff ff ff ff 	movabs $0x7ffffffffffffff,%rdx
  40b141:	ff ff 07 
  40b144:	48 39 d0             	cmp    %rdx,%rax
  40b147:	48 0f 47 c2          	cmova  %rdx,%rax
  40b14b:	48 c1 e0 04          	shl    $0x4,%rax
  40b14f:	48 89 c7             	mov    %rax,%rdi
  40b152:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  40b157:	e8 44 3f 00 00       	call   40f0a0 <operator new(unsigned long)>
  40b15c:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
  40b161:	4d 39 ef             	cmp    %r13,%r15
  40b164:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
  40b169:	4c 8b 4c 24 48       	mov    0x48(%rsp),%r9
  40b16e:	4c 8b 54 24 68       	mov    0x68(%rsp),%r10
  40b173:	48 89 1c 08          	mov    %rbx,(%rax,%rcx,1)
  40b177:	66 0f 6f 05 41 22 0b 	movdqa 0xb2241(%rip),%xmm0        # 4bd3c0 <max.0+0x20>
  40b17e:	00 
  40b17f:	44 89 74 08 08       	mov    %r14d,0x8(%rax,%rcx,1)
  40b184:	0f 84 ae 00 00 00    	je     40b238 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x6b8>
  40b18a:	48 89 c1             	mov    %rax,%rcx
  40b18d:	4c 89 ea             	mov    %r13,%rdx
  40b190:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40b197:	00 00 00 00 
  40b19b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  40b1a0:	f3 0f 6f 0a          	movdqu (%rdx),%xmm1
  40b1a4:	48 83 c2 10          	add    $0x10,%rdx
  40b1a8:	48 83 c1 10          	add    $0x10,%rcx
  40b1ac:	0f 11 49 f0          	movups %xmm1,-0x10(%rcx)
  40b1b0:	49 39 d7             	cmp    %rdx,%r15
  40b1b3:	75 eb                	jne    40b1a0 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x620>
  40b1b5:	4d 29 ef             	sub    %r13,%r15
  40b1b8:	4e 8d 34 38          	lea    (%rax,%r15,1),%r14
  40b1bc:	4d 8d 7e 10          	lea    0x10(%r14),%r15
  40b1c0:	4d 85 ed             	test   %r13,%r13
  40b1c3:	74 31                	je     40b1f6 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x676>
  40b1c5:	4c 29 ee             	sub    %r13,%rsi
  40b1c8:	4c 89 ef             	mov    %r13,%rdi
  40b1cb:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  40b1d0:	4c 89 54 24 40       	mov    %r10,0x40(%rsp)
  40b1d5:	4c 89 4c 24 38       	mov    %r9,0x38(%rsp)
  40b1da:	e8 f1 3d 00 00       	call   40efd0 <operator delete(void*, unsigned long)>
  40b1df:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
  40b1e4:	4c 8b 54 24 40       	mov    0x40(%rsp),%r10
  40b1e9:	66 0f 6f 05 cf 21 0b 	movdqa 0xb21cf(%rip),%xmm0        # 4bd3c0 <max.0+0x20>
  40b1f0:	00 
  40b1f1:	4c 8b 4c 24 38       	mov    0x38(%rsp),%r9
  40b1f6:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
  40b1fb:	49 8b 3e             	mov    (%r14),%rdi
  40b1fe:	49 89 c5             	mov    %rax,%r13
  40b201:	49 89 84 24 58 85 00 	mov    %rax,0x8558(%r12)
  40b208:	00 
  40b209:	45 8b 76 08          	mov    0x8(%r14),%r14d
  40b20d:	4d 8b 1c 24          	mov    (%r12),%r11
  40b211:	4d 89 bc 24 60 85 00 	mov    %r15,0x8560(%r12)
  40b218:	00 
  40b219:	48 01 c2             	add    %rax,%rdx
  40b21c:	49 89 94 24 68 85 00 	mov    %rdx,0x8568(%r12)
  40b223:	00 
  40b224:	e9 b3 fc ff ff       	jmp    40aedc <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x35c>
  40b229:	c6 44 24 1f 00       	movb   $0x0,0x1f(%rsp)
  40b22e:	31 c0                	xor    %eax,%eax
  40b230:	45 31 db             	xor    %r11d,%r11d
  40b233:	e9 30 fe ff ff       	jmp    40b068 <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x4e8>
  40b238:	49 89 c6             	mov    %rax,%r14
  40b23b:	e9 7c ff ff ff       	jmp    40b1bc <Side<unsigned long>::drain(Side<unsigned long> const&, unsigned long&)+0x63c>

