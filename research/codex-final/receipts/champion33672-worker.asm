
work/bin/champion33672_dbg:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

000000000040a500 <_ZZ4mainENKUljE_clEj>:
  40a500:	push   %r15
  40a502:	push   %r14
  40a504:	push   %r13
  40a506:	push   %r12
  40a508:	push   %rbp
  40a509:	push   %rbx
  40a50a:	sub    $0x4628,%rsp
  40a511:	mov    (%rdi),%rax
  40a514:	mov    %rdi,0x80(%rsp)
  40a51c:	mov    (%rax),%rax
  40a51f:	mov    (%rax),%r12d
  40a522:	mov    %rax,0xc0(%rsp)
  40a52a:	mov    %r12d,%r14d
  40a52d:	shr    $0x8,%r14d
  40a531:	lea    0x1(%r14),%ebx
  40a535:	lea    0x0(,%rbx,8),%rbp
  40a53d:	mov    %rbp,%rdi
  40a540:	call   40e260 <_Znwm>
  40a545:	add    %rax,%rbp
  40a548:	mov    %rax,0xc8(%rsp)
  40a550:	mov    %rax,%rdx
  40a553:	mov    %rbp,0xd8(%rsp)
  40a55b:	test   %r14d,%r14d
  40a55e:	je     40ca7d <_ZZ4mainENKUljE_clEj+0x257d>
  40a564:	mov    %rbx,%rsi
  40a567:	lea    0x100(%rsp),%rax
  40a56f:	mov    %rbx,%r13
  40a572:	shr    $1,%rsi
  40a575:	movq   %rax,%xmm0
  40a57a:	mov    %rax,0x28(%rsp)
  40a57f:	mov    %rdx,%rax
  40a582:	shl    $0x4,%rsi
  40a586:	punpcklqdq %xmm0,%xmm0
  40a58a:	lea    (%rdx,%rsi,1),%rcx
  40a58e:	and    $0x10,%esi
  40a591:	je     40a59f <_ZZ4mainENKUljE_clEj+0x9f>
  40a593:	lea    0x10(%rdx),%rax
  40a597:	movups %xmm0,(%rdx)
  40a59a:	cmp    %rax,%rcx
  40a59d:	je     40a5af <_ZZ4mainENKUljE_clEj+0xaf>
  40a59f:	movups %xmm0,(%rax)
  40a5a2:	add    $0x20,%rax
  40a5a6:	movups %xmm0,-0x10(%rax)
  40a5aa:	cmp    %rax,%rcx
  40a5ad:	jne    40a59f <_ZZ4mainENKUljE_clEj+0x9f>
  40a5af:	and    $0x1,%r13d
  40a5b3:	je     40a5c5 <_ZZ4mainENKUljE_clEj+0xc5>
  40a5b5:	and    $0xfffffffffffffffe,%rbx
  40a5b9:	lea    (%rdx,%rbx,8),%rdx
  40a5bd:	mov    0x28(%rsp),%rax
  40a5c2:	mov    %rax,(%rdx)
  40a5c5:	pxor   %xmm1,%xmm1
  40a5c9:	mov    $0x4022,%ecx
  40a5ce:	xor    %r9d,%r9d
  40a5d1:	xor    %edi,%edi
  40a5d3:	lea    0x100(%r12),%eax
  40a5db:	mov    $0xffffffff,%r8d
  40a5e1:	mov    %rbp,0xd0(%rsp)
  40a5e9:	mov    $0x3,%edx
  40a5ee:	lea    0x40(%rax,%rax,1),%rbp
  40a5f3:	movaps %xmm1,0xe0(%rsp)
  40a5fb:	movq   $0x0,0xf0(%rsp)
  40a607:	mov    %rbp,%rsi
  40a60a:	call   455f90 <__mmap64>
  40a60f:	mov    %rbp,%rsi
  40a612:	mov    $0xf,%edx
  40a617:	mov    %rax,%rdi
  40a61a:	mov    %rax,%rbx
  40a61d:	call   455f60 <__madvise>
  40a622:	mov    0x28(%rsp),%rdi
  40a627:	mov    $0xffffffffffffffff,%rax
  40a62e:	mov    $0x40,%ecx
  40a633:	mov    %rbx,0xf8(%rsp)
  40a63b:	pxor   %xmm0,%xmm0
  40a63f:	pxor   %xmm1,%xmm1
  40a643:	rep stos %rax,%es:(%rdi)
  40a646:	lea    0x300(%rsp),%rdi
  40a64e:	movq   $0x0,0x2360(%rsp)
  40a65a:	movaps %xmm0,0x2300(%rsp)
  40a662:	movaps %xmm0,0x2310(%rsp)
  40a66a:	movaps %xmm0,0x2320(%rsp)
  40a672:	movaps %xmm0,0x2330(%rsp)
  40a67a:	movaps %xmm1,0x2340(%rsp)
  40a682:	mov    %rcx,%rax
  40a685:	mov    $0x400,%ecx
  40a68a:	movaps %xmm1,0x2350(%rsp)
  40a692:	rep stos %rax,%es:(%rdi)
  40a695:	mov    0x80(%rsp),%rax
  40a69d:	mov    0x8(%rax),%rax
  40a6a1:	mov    (%rax),%rax
  40a6a4:	mov    (%rax),%r12d
  40a6a7:	mov    %rax,0x2370(%rsp)
  40a6af:	mov    %r12d,%r14d
  40a6b2:	shr    $0x8,%r14d
  40a6b6:	lea    0x1(%r14),%ebx
  40a6ba:	lea    0x0(,%rbx,8),%rbp
  40a6c2:	mov    %rbx,%r13
  40a6c5:	mov    %rbp,%rdi
  40a6c8:	call   40e260 <_Znwm>
  40a6cd:	add    %rax,%rbp
  40a6d0:	mov    %rax,0x2378(%rsp)
  40a6d8:	mov    %rax,%rdx
  40a6db:	lea    0x23b0(%rsp),%rax
  40a6e3:	mov    %rbp,0x2388(%rsp)
  40a6eb:	mov    %rax,0x20(%rsp)
  40a6f0:	test   %r14d,%r14d
  40a6f3:	je     40a73e <_ZZ4mainENKUljE_clEj+0x23e>
  40a6f5:	mov    %rbx,%rsi
  40a6f8:	movq   %rax,%xmm0
  40a6fd:	mov    %rdx,%rax
  40a700:	shr    $1,%rsi
  40a703:	punpcklqdq %xmm0,%xmm0
  40a707:	shl    $0x4,%rsi
  40a70b:	lea    (%rdx,%rsi,1),%rcx
  40a70f:	and    $0x10,%esi
  40a712:	je     40a720 <_ZZ4mainENKUljE_clEj+0x220>
  40a714:	lea    0x10(%rdx),%rax
  40a718:	movups %xmm0,(%rdx)
  40a71b:	cmp    %rax,%rcx
  40a71e:	je     40a730 <_ZZ4mainENKUljE_clEj+0x230>
  40a720:	movups %xmm0,(%rax)
  40a723:	add    $0x20,%rax
  40a727:	movups %xmm0,-0x10(%rax)
  40a72b:	cmp    %rax,%rcx
  40a72e:	jne    40a720 <_ZZ4mainENKUljE_clEj+0x220>
  40a730:	and    $0x1,%r13d
  40a734:	je     40a746 <_ZZ4mainENKUljE_clEj+0x246>
  40a736:	and    $0xfffffffffffffffe,%rbx
  40a73a:	lea    (%rdx,%rbx,8),%rdx
  40a73e:	mov    0x20(%rsp),%rax
  40a743:	mov    %rax,(%rdx)
  40a746:	lea    0x100(%r12),%eax
  40a74e:	xor    %r9d,%r9d
  40a751:	xor    %edi,%edi
  40a753:	xor    %r13d,%r13d
  40a756:	pxor   %xmm1,%xmm1
  40a75a:	mov    $0x4022,%ecx
  40a75f:	mov    $0x3,%edx
  40a764:	mov    %rbp,0x2380(%rsp)
  40a76c:	lea    0x40(%rax,%rax,1),%rbp
  40a771:	mov    $0xffffffff,%r8d
  40a777:	movaps %xmm1,0x2390(%rsp)
  40a77f:	movq   $0x0,0x23a0(%rsp)
  40a78b:	mov    %rbp,%rsi
  40a78e:	call   455f90 <__mmap64>
  40a793:	mov    $0xf,%edx
  40a798:	mov    %rbp,%rsi
  40a79b:	mov    %rax,%rdi
  40a79e:	mov    %rax,%rbx
  40a7a1:	call   455f60 <__madvise>
  40a7a6:	mov    0x20(%rsp),%rdi
  40a7ab:	mov    $0xffffffffffffffff,%rax
  40a7b2:	mov    $0x40,%ecx
  40a7b7:	mov    %rbx,0x23a8(%rsp)
  40a7bf:	pxor   %xmm0,%xmm0
  40a7c3:	pxor   %xmm1,%xmm1
  40a7c7:	rep stos %rax,%es:(%rdi)
  40a7ca:	lea    0x25b0(%rsp),%rdi
  40a7d2:	movq   $0x0,0x4610(%rsp)
  40a7de:	movaps %xmm0,0x45b0(%rsp)
  40a7e6:	movaps %xmm0,0x45c0(%rsp)
  40a7ee:	movaps %xmm0,0x45d0(%rsp)
  40a7f6:	movaps %xmm0,0x45e0(%rsp)
  40a7fe:	movaps %xmm1,0x45f0(%rsp)
  40a806:	mov    %rcx,%rax
  40a809:	mov    $0x400,%ecx
  40a80e:	movaps %xmm1,0x4600(%rsp)
  40a816:	rep stos %rax,%es:(%rdi)
  40a819:	mov    0x80(%rsp),%rsi
  40a821:	mov    $0x1,%edx
  40a826:	mov    0x10(%rsi),%rax
  40a82a:	lock xadd %rdx,(%rax)
  40a82f:	mov    0x18(%rsi),%rax
  40a833:	cmp    (%rax),%rdx
  40a836:	jae    40c65f <_ZZ4mainENKUljE_clEj+0x215f>
  40a83c:	mov    0x80(%rsp),%rsi
  40a844:	mov    0x20(%rsi),%rax
  40a848:	mov    (%rax),%rax
  40a84b:	mov    (%rax,%rdx,4),%eax
  40a84e:	lea    (%rax,%rax,1),%ecx
  40a851:	mov    %eax,0x8c(%rsp)
  40a858:	mov    0x28(%rsi),%rax
  40a85c:	mov    %rcx,%rdx
  40a85f:	mov    (%rax),%rax
  40a862:	add    $0x1,%edx
  40a865:	mov    (%rax,%rcx,4),%esi
  40a868:	mov    (%rax,%rdx,4),%ebx
  40a86b:	mov    %esi,0x88(%rsp)
  40a872:	mov    %ebx,0x7c(%rsp)
  40a876:	cmp    %ebx,%esi
  40a878:	je     40c1fd <_ZZ4mainENKUljE_clEj+0x1cfd>
  40a87e:	mov    0xc0(%rsp),%rax
  40a886:	mov    %esi,%ecx
  40a888:	add    $0x1,%esi
  40a88b:	mov    %rsi,0x98(%rsp)
  40a893:	mov    0x8(%rax),%rax
  40a897:	mov    %rcx,0x90(%rsp)
  40a89f:	mov    (%rax,%rsi,4),%esi
  40a8a2:	cmp    %esi,(%rax,%rcx,4)
  40a8a5:	je     40b69a <_ZZ4mainENKUljE_clEj+0x119a>
  40a8ab:	mov    0x2370(%rsp),%rax
  40a8b3:	lea    0x1(%rbx),%ecx
  40a8b6:	mov    0x8(%rax),%rdx
  40a8ba:	mov    %ebx,%eax
  40a8bc:	mov    (%rdx,%rcx,4),%esi
  40a8bf:	cmp    %esi,(%rdx,%rax,4)
  40a8c2:	je     40b69a <_ZZ4mainENKUljE_clEj+0x119a>
  40a8c8:	mov    0xe0(%rsp),%rdi
  40a8d0:	mov    0xe8(%rsp),%rcx
  40a8d8:	cmp    %rcx,%rdi
  40a8db:	je     40a907 <_ZZ4mainENKUljE_clEj+0x407>
  40a8dd:	mov    0xc8(%rsp),%rsi
  40a8e5:	mov    0x28(%rsp),%r8
  40a8ea:	mov    %rdi,%rax
  40a8ed:	nopl   (%rax)
  40a8f0:	mov    (%rax),%edx
  40a8f2:	add    $0x4,%rax
  40a8f6:	mov    %r8,(%rsi,%rdx,8)
  40a8fa:	cmp    %rax,%rcx
  40a8fd:	jne    40a8f0 <_ZZ4mainENKUljE_clEj+0x3f0>
  40a8ff:	mov    %rdi,0xe8(%rsp)
  40a907:	lea    0xc0(%rsp),%rax
  40a90f:	lea    0x2300(%rsp),%rsi
  40a917:	xor    %ecx,%ecx
  40a919:	mov    %rax,0x70(%rsp)
  40a91e:	lea    0x2340(%rsp),%rdi
  40a926:	cs nopw 0x0(%rax,%rax,1)
  40a930:	mov    (%rsi),%rax
  40a933:	test   %rax,%rax
  40a936:	je     40a963 <_ZZ4mainENKUljE_clEj+0x463>
  40a938:	nopl   0x0(%rax,%rax,1)
  40a940:	xor    %edx,%edx
  40a942:	tzcnt  %rax,%rdx
  40a947:	add    %ecx,%edx
  40a949:	mov    %edx,%edx
  40a94b:	shl    $0x4,%rdx
  40a94f:	movl   $0x0,0x308(%rsp,%rdx,1)
  40a95a:	lea    -0x1(%rax),%rdx
  40a95e:	and    %rdx,%rax
  40a961:	jne    40a940 <_ZZ4mainENKUljE_clEj+0x440>
  40a963:	movq   $0x0,(%rsi)
  40a96a:	add    $0x8,%rsi
  40a96e:	add    $0x40,%ecx
  40a971:	cmp    %rdi,%rsi
  40a974:	jne    40a930 <_ZZ4mainENKUljE_clEj+0x430>
  40a976:	mov    0x2350(%rsp),%rdi
  40a97e:	pxor   %xmm0,%xmm0
  40a982:	mov    0x2360(%rsp),%rsi
  40a98a:	movq   $0x0,0x2360(%rsp)
  40a996:	movaps %xmm0,0x2350(%rsp)
  40a99e:	test   %rdi,%rdi
  40a9a1:	je     40a9ab <_ZZ4mainENKUljE_clEj+0x4ab>
  40a9a3:	sub    %rdi,%rsi
  40a9a6:	call   40e190 <_ZdlPvm>
  40a9ab:	mov    0x88(%rsp),%esi
  40a9b2:	mov    0xc8(%rsp),%rax
  40a9ba:	pxor   %xmm0,%xmm0
  40a9be:	movaps %xmm0,0x2340(%rsp)
  40a9c6:	shr    $0x8,%esi
  40a9c9:	mov    %esi,%ebx
  40a9cb:	lea    (%rax,%rbx,8),%r8
  40a9cf:	mov    (%r8),%rax
  40a9d2:	cmp    0x28(%rsp),%rax
  40a9d7:	je     40c205 <_ZZ4mainENKUljE_clEj+0x1d05>
  40a9dd:	movzbl 0x88(%rsp),%edx
  40a9e5:	xor    %esi,%esi
  40a9e7:	mov    0x300(%rsp),%rdi
  40a9ef:	mov    %si,(%rax,%rdx,2)
  40a9f3:	mov    0x308(%rsp),%eax
  40a9fa:	cmp    0x30c(%rsp),%eax
  40aa01:	je     40c71f <_ZZ4mainENKUljE_clEj+0x221f>
  40aa07:	mov    0x88(%rsp),%esi
  40aa0e:	mov    0x2398(%rsp),%rcx
  40aa16:	mov    %esi,(%rdi,%rax,4)
  40aa19:	mov    0x2390(%rsp),%rdi
  40aa21:	addl   $0x1,0x308(%rsp)
  40aa29:	addq   $0x1,0x2348(%rsp)
  40aa32:	orq    $0x1,0x2300(%rsp)
  40aa3b:	cmp    %rcx,%rdi
  40aa3e:	je     40aa67 <_ZZ4mainENKUljE_clEj+0x567>
  40aa40:	mov    0x2378(%rsp),%rsi
  40aa48:	mov    0x20(%rsp),%r8
  40aa4d:	mov    %rdi,%rax
  40aa50:	mov    (%rax),%edx
  40aa52:	add    $0x4,%rax
  40aa56:	mov    %r8,(%rsi,%rdx,8)
  40aa5a:	cmp    %rax,%rcx
  40aa5d:	jne    40aa50 <_ZZ4mainENKUljE_clEj+0x550>
  40aa5f:	mov    %rdi,0x2398(%rsp)
  40aa67:	mov    0x70(%rsp),%rax
  40aa6c:	xor    %ecx,%ecx
  40aa6e:	lea    0x44f0(%rax),%rsi
  40aa75:	lea    0x4530(%rax),%rdi
  40aa7c:	nopl   0x0(%rax)
  40aa80:	mov    (%rsi),%rax
  40aa83:	test   %rax,%rax
  40aa86:	je     40aae3 <_ZZ4mainENKUljE_clEj+0x5e3>
  40aa88:	data16 cs nopw 0x0(%rax,%rax,1)
  40aa93:	data16 cs nopw 0x0(%rax,%rax,1)
  40aa9e:	data16 cs nopw 0x0(%rax,%rax,1)
  40aaa9:	data16 cs nopw 0x0(%rax,%rax,1)
  40aab4:	data16 cs nopw 0x0(%rax,%rax,1)
  40aabf:	nop
  40aac0:	xor    %edx,%edx
  40aac2:	tzcnt  %rax,%rdx
  40aac7:	add    %ecx,%edx
  40aac9:	mov    %edx,%edx
  40aacb:	shl    $0x4,%rdx
  40aacf:	movl   $0x0,0x25b8(%rsp,%rdx,1)
  40aada:	lea    -0x1(%rax),%rdx
  40aade:	and    %rdx,%rax
  40aae1:	jne    40aac0 <_ZZ4mainENKUljE_clEj+0x5c0>
  40aae3:	movq   $0x0,(%rsi)
  40aaea:	add    $0x8,%rsi
  40aaee:	add    $0x40,%ecx
  40aaf1:	cmp    %rdi,%rsi
  40aaf4:	jne    40aa80 <_ZZ4mainENKUljE_clEj+0x580>
  40aaf6:	mov    0x4600(%rsp),%rdi
  40aafe:	pxor   %xmm0,%xmm0
  40ab02:	mov    0x4610(%rsp),%rsi
  40ab0a:	movq   $0x0,0x4610(%rsp)
  40ab16:	movaps %xmm0,0x4600(%rsp)
  40ab1e:	test   %rdi,%rdi
  40ab21:	je     40ab2b <_ZZ4mainENKUljE_clEj+0x62b>
  40ab23:	sub    %rdi,%rsi
  40ab26:	call   40e190 <_ZdlPvm>
  40ab2b:	mov    0x7c(%rsp),%esi
  40ab2f:	mov    0x2378(%rsp),%rax
  40ab37:	pxor   %xmm0,%xmm0
  40ab3b:	movaps %xmm0,0x45f0(%rsp)
  40ab43:	shr    $0x8,%esi
  40ab46:	mov    %esi,%ebx
  40ab48:	lea    (%rax,%rbx,8),%r8
  40ab4c:	mov    (%r8),%rax
  40ab4f:	cmp    0x20(%rsp),%rax
  40ab54:	je     40c284 <_ZZ4mainENKUljE_clEj+0x1d84>
  40ab5a:	movzbl 0x7c(%rsp),%edx
  40ab5f:	xor    %ecx,%ecx
  40ab61:	mov    0x25b0(%rsp),%rdi
  40ab69:	mov    %cx,(%rax,%rdx,2)
  40ab6d:	mov    0x25b8(%rsp),%eax
  40ab74:	cmp    0x25bc(%rsp),%eax
  40ab7b:	je     40c755 <_ZZ4mainENKUljE_clEj+0x2255>
  40ab81:	mov    0x7c(%rsp),%esi
  40ab85:	mov    0x2348(%rsp),%rdx
  40ab8d:	movabs $0x4000000000000000,%r10
  40ab97:	mov    %esi,(%rdi,%rax,4)
  40ab9a:	mov    0x45f8(%rsp),%rax
  40aba2:	addl   $0x1,0x25b8(%rsp)
  40abaa:	orq    $0x1,0x45b0(%rsp)
  40abb3:	add    $0x1,%rax
  40abb7:	mov    %rax,0x45f8(%rsp)
  40abbf:	nop
  40abc0:	movabs $0x4000000000000000,%rsi
  40abca:	test   %rdx,%rdx
  40abcd:	je     40acb2 <_ZZ4mainENKUljE_clEj+0x7b2>
  40abd3:	mov    0x2340(%rsp),%rcx
  40abdb:	mov    $0xffffffffffffffff,%rbx
  40abe2:	mov    %ecx,%esi
  40abe4:	shl    %cl,%rbx
  40abe7:	shr    $0x6,%esi
  40abea:	mov    %rbx,%rcx
  40abed:	mov    %esi,%edi
  40abef:	and    $0x7,%esi
  40abf2:	and    $0x7,%edi
  40abf5:	and    0x2300(%rsp,%rsi,8),%rcx
  40abfd:	jne    40b693 <_ZZ4mainENKUljE_clEj+0x1193>
  40ac03:	lea    0x1(%rdi),%ecx
  40ac06:	mov    %rcx,%rsi
  40ac09:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac11:	test   %rcx,%rcx
  40ac14:	jne    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40ac1a:	lea    0x2(%rdi),%ecx
  40ac1d:	mov    %rcx,%rsi
  40ac20:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac28:	test   %rcx,%rcx
  40ac2b:	jne    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40ac2d:	lea    0x3(%rdi),%ecx
  40ac30:	mov    %rcx,%rsi
  40ac33:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac3b:	test   %rcx,%rcx
  40ac3e:	jne    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40ac40:	lea    0x4(%rdi),%ecx
  40ac43:	mov    %rcx,%rsi
  40ac46:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac4e:	test   %rcx,%rcx
  40ac51:	jne    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40ac53:	lea    0x5(%rdi),%ecx
  40ac56:	mov    %rcx,%rsi
  40ac59:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac61:	test   %rcx,%rcx
  40ac64:	jne    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40ac66:	lea    0x6(%rdi),%ecx
  40ac69:	mov    %rcx,%rsi
  40ac6c:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac74:	test   %rcx,%rcx
  40ac77:	jne    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40ac79:	lea    0x7(%rdi),%ecx
  40ac7c:	mov    %rcx,%rsi
  40ac7f:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac87:	test   %rcx,%rcx
  40ac8a:	jne    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40ac8c:	lea    0x8(%rdi),%ecx
  40ac8f:	mov    %rcx,%rsi
  40ac92:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac9a:	tzcnt  %rcx,%rcx
  40ac9f:	shl    $0x6,%esi
  40aca2:	add    %ecx,%esi
  40aca4:	mov    %esi,%esi
  40aca6:	mov    %rsi,0x2340(%rsp)
  40acae:	shl    $0x7,%rsi
  40acb2:	test   %rax,%rax
  40acb5:	je     40b660 <_ZZ4mainENKUljE_clEj+0x1160>
  40acbb:	mov    0x45f0(%rsp),%rcx
  40acc3:	mov    $0xffffffffffffffff,%rbx
  40acca:	mov    %ecx,%edi
  40accc:	shl    %cl,%rbx
  40accf:	shr    $0x6,%edi
  40acd2:	mov    %rbx,%rcx
  40acd5:	mov    %edi,%r8d
  40acd8:	and    $0x7,%edi
  40acdb:	and    $0x7,%r8d
  40acdf:	and    0x45b0(%rsp,%rdi,8),%rcx
  40ace7:	jne    40b68b <_ZZ4mainENKUljE_clEj+0x118b>
  40aced:	lea    0x1(%r8),%ecx
  40acf1:	mov    %rcx,%rdi
  40acf4:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40acfc:	test   %rcx,%rcx
  40acff:	jne    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40ad05:	lea    0x2(%r8),%ecx
  40ad09:	mov    %rcx,%rdi
  40ad0c:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad14:	test   %rcx,%rcx
  40ad17:	jne    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40ad19:	lea    0x3(%r8),%ecx
  40ad1d:	mov    %rcx,%rdi
  40ad20:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad28:	test   %rcx,%rcx
  40ad2b:	jne    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40ad2d:	lea    0x4(%r8),%ecx
  40ad31:	mov    %rcx,%rdi
  40ad34:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad3c:	test   %rcx,%rcx
  40ad3f:	jne    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40ad41:	lea    0x5(%r8),%ecx
  40ad45:	mov    %rcx,%rdi
  40ad48:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad50:	test   %rcx,%rcx
  40ad53:	jne    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40ad55:	lea    0x6(%r8),%ecx
  40ad59:	mov    %rcx,%rdi
  40ad5c:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad64:	test   %rcx,%rcx
  40ad67:	jne    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40ad69:	lea    0x7(%r8),%ecx
  40ad6d:	mov    %rcx,%rdi
  40ad70:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad78:	test   %rcx,%rcx
  40ad7b:	jne    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40ad7d:	lea    0x8(%r8),%ecx
  40ad81:	mov    %rcx,%rdi
  40ad84:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad8c:	tzcnt  %rcx,%rcx
  40ad91:	shl    $0x6,%edi
  40ad94:	movabs $0x4000000000000000,%rbx
  40ad9e:	lea    (%rcx,%rdi,1),%r8d
  40ada2:	mov    %r8,0x45f0(%rsp)
  40adaa:	mov    %r8,%rcx
  40adad:	cmp    %rbx,%rsi
  40adb0:	je     40b660 <_ZZ4mainENKUljE_clEj+0x1160>
  40adb6:	mov    %r8,%rdi
  40adb9:	shl    $0x7,%rdi
  40adbd:	add    %rdi,%rsi
  40adc0:	cmp    %r10,%rsi
  40adc3:	jae    40b660 <_ZZ4mainENKUljE_clEj+0x1160>
  40adc9:	cmp    %rdx,%rax
  40adcc:	jb     40b220 <_ZZ4mainENKUljE_clEj+0xd20>
  40add2:	mov    0x2340(%rsp),%rcx
  40adda:	mov    %rcx,%rsi
  40addd:	and    $0x1ff,%esi
  40ade3:	add    $0x24,%rsi
  40ade7:	mov    %rsi,0x68(%rsp)
  40adec:	shl    $0x4,%rsi
  40adf0:	mov    0xc8(%rsp,%rsi,1),%r11d
  40adf8:	lea    0x4620(%rsp,%rsi,1),%rbx
  40ae00:	mov    %rbx,0x30(%rsp)
  40ae05:	test   %r11d,%r11d
  40ae08:	je     40b1d8 <_ZZ4mainENKUljE_clEj+0xcd8>
  40ae0e:	mov    0xc0(%rsp),%rsi
  40ae16:	movq   $0x0,0x8(%rsp)
  40ae1f:	mov    0x8(%rsi),%rdx
  40ae23:	jmp    40ae39 <_ZZ4mainENKUljE_clEj+0x939>
  40ae25:	nopl   (%rax)
  40ae28:	addq   $0x1,0x8(%rsp)
  40ae2e:	cmp    %r11d,0x8(%rsp)
  40ae33:	jae    40b1c5 <_ZZ4mainENKUljE_clEj+0xcc5>
  40ae39:	mov    0x8(%rsp),%r15
  40ae3e:	mov    0x30(%rsp),%rax
  40ae43:	lea    -0x1(%r11),%r9d
  40ae47:	mov    -0x4560(%rax),%rbx
  40ae4e:	lea    0x8(%r15),%eax
  40ae52:	cmp    %r9d,%eax
  40ae55:	cmova  %r9d,%eax
  40ae59:	mov    (%rbx,%rax,4),%eax
  40ae5c:	mov    %eax,%edi
  40ae5e:	mov    %rax,%r8
  40ae61:	movzbl %al,%eax
  40ae64:	and    $0x1ffffff,%edi
  40ae6a:	shl    $0x27,%r8
  40ae6e:	prefetcht0 (%rdx,%rdi,4)
  40ae72:	mov    0xc8(%rsp),%rdi
  40ae7a:	shr    $0x2f,%r8
  40ae7e:	mov    (%rdi,%r8,8),%r8
  40ae82:	prefetcht0 (%r8,%rax,2)
  40ae87:	lea    0x4(%r15),%r8d
  40ae8b:	mov    0x10(%rsi),%rax
  40ae8f:	cmp    %r9d,%r8d
  40ae92:	cmova  %r9d,%r8d
  40ae96:	mov    %rcx,%r9
  40ae99:	shl    $0x7,%r9
  40ae9d:	mov    (%rbx,%r8,4),%r8d
  40aea1:	and    $0x1ffffff,%r8d
  40aea8:	mov    (%rdx,%r8,4),%r8d
  40aeac:	prefetcht0 (%rax,%r8,4)
  40aeb1:	mov    (%rbx,%r15,4),%r8d
  40aeb5:	mov    %r9,%r15
  40aeb8:	mov    %r8d,%ebx
  40aebb:	mov    %r8d,%ebp
  40aebe:	movzbl %r8b,%r8d
  40aec2:	shr    $0x19,%ebp
  40aec5:	and    $0x1ffffff,%ebx
  40aecb:	or     %rbp,%r15
  40aece:	mov    %ebx,%ebp
  40aed0:	shr    $0x8,%ebp
  40aed3:	mov    %r15,0x10(%rsp)
  40aed8:	mov    (%rdi,%rbp,8),%rbp
  40aedc:	movzwl 0x0(%rbp,%r8,2),%r8d
  40aee2:	cmp    %r8,%r15
  40aee5:	jne    40ae28 <_ZZ4mainENKUljE_clEj+0x928>
  40aeeb:	mov    %ebx,%r8d
  40aeee:	mov    (%rdx,%r8,4),%ebp
  40aef2:	lea    0x1(%rbx),%r8d
  40aef6:	lea    0x0(,%r8,4),%rbx
  40aefe:	mov    %rbx,0x18(%rsp)
  40af03:	cmp    (%rdx,%r8,4),%ebp
  40af07:	jb     40afea <_ZZ4mainENKUljE_clEj+0xaea>
  40af0d:	jmp    40ae28 <_ZZ4mainENKUljE_clEj+0x928>
  40af12:	nopw   0x0(%rax,%rax,1)
  40af18:	movzwl (%rcx),%eax
  40af1b:	add    0x10(%rsp),%rbx
  40af20:	mov    %rbx,%r9
  40af23:	cmp    %rax,%rbx
  40af26:	mov    %rax,%rdi
  40af29:	cmovbe %rbx,%rdi
  40af2d:	setb   %r12b
  40af31:	shr    $0x7,%r9
  40af35:	mov    %r9,%r14
  40af38:	and    $0x1ff,%r14d
  40af3f:	mov    %di,(%rcx)
  40af42:	mov    %r9d,%ecx
  40af45:	mov    %r14,%r11
  40af48:	and    $0x1ff,%ecx
  40af4e:	shl    $0x4,%r11
  40af52:	mov    0x308(%rsp,%r11,1),%eax
  40af5a:	mov    0x300(%rsp,%r11,1),%rdi
  40af62:	cmp    0x30c(%rsp,%r11,1),%eax
  40af6a:	je     40b120 <_ZZ4mainENKUljE_clEj+0xc20>
  40af70:	mov    %ebx,%r11d
  40af73:	shl    $0x4,%r14
  40af77:	shl    $0x19,%r11d
  40af7b:	or     %r15d,%r11d
  40af7e:	mov    %r11d,(%rdi,%rax,4)
  40af82:	movzbl %r12b,%eax
  40af86:	movzbl %r12b,%r12d
  40af8a:	add    %eax,0x308(%rsp,%r14,1)
  40af92:	mov    %ecx,%eax
  40af94:	mov    %r9d,%ecx
  40af97:	shr    $0x6,%eax
  40af9a:	add    %r12,0x2348(%rsp)
  40afa2:	shl    %cl,%r12
  40afa5:	or     %r12,0x2300(%rsp,%rax,8)
  40afad:	mov    0x2378(%rsp),%rax
  40afb5:	mov    (%rax,%rdx,8),%rax
  40afb9:	mov    0x8(%rsi),%rdx
  40afbd:	movzwl (%rax,%r8,2),%eax
  40afc2:	add    %rbx,%rax
  40afc5:	cmp    %rax,%r10
  40afc8:	cmova  %rax,%r10
  40afcc:	mov    0x18(%rsp),%rax
  40afd1:	add    $0x1,%rbp
  40afd5:	cmp    (%rdx,%rax,1),%ebp
  40afd8:	jae    40b1a0 <_ZZ4mainENKUljE_clEj+0xca0>
  40afde:	mov    0x10(%rsi),%rax
  40afe2:	mov    0xc8(%rsp),%rdi
  40afea:	mov    (%rax,%rbp,4),%r15d
  40afee:	lea    0x0(,%rbp,4),%rbx
  40aff6:	mov    %r15d,%r8d
  40aff9:	shr    $0x13,%r8d
  40affd:	mov    %r8d,%edx
  40b000:	lea    (%rdi,%rdx,8),%r11
  40b004:	mov    (%r11),%rcx
  40b007:	cmp    0x28(%rsp),%rcx
  40b00c:	je     40b080 <_ZZ4mainENKUljE_clEj+0xb80>
  40b00e:	mov    (%rax,%rbx,1),%ebx
  40b011:	shr    $0xb,%r15d
  40b015:	movzbl %r15b,%r8d
  40b019:	and    $0x7ff,%ebx
  40b01f:	lea    (%rcx,%r8,2),%rcx
  40b023:	cmp    $0x7ff,%ebx
  40b029:	jne    40af18 <_ZZ4mainENKUljE_clEj+0xa18>
  40b02f:	mov    0x18(%rsi),%rbx
  40b033:	mov    0x20(%rsi),%rax
  40b037:	sub    %rbx,%rax
  40b03a:	sar    $0x4,%rax
  40b03e:	xchg   %ax,%ax
  40b040:	test   %rax,%rax
  40b043:	jle    40b06a <_ZZ4mainENKUljE_clEj+0xb6a>
  40b045:	mov    %rax,%r9
  40b048:	sar    $1,%r9
  40b04b:	mov    %r9,%rdi
  40b04e:	shl    $0x4,%rdi
  40b052:	add    %rbx,%rdi
  40b055:	cmp    %rbp,(%rdi)
  40b058:	jae    40b078 <_ZZ4mainENKUljE_clEj+0xb78>
  40b05a:	sub    %r9,%rax
  40b05d:	lea    0x10(%rdi),%rbx
  40b061:	sub    $0x1,%rax
  40b065:	test   %rax,%rax
  40b068:	jg     40b045 <_ZZ4mainENKUljE_clEj+0xb45>
  40b06a:	mov    0x8(%rbx),%rbx
  40b06e:	jmp    40af18 <_ZZ4mainENKUljE_clEj+0xa18>
  40b073:	nopl   0x0(%rax,%rax,1)
  40b078:	mov    %r9,%rax
  40b07b:	jmp    40b040 <_ZZ4mainENKUljE_clEj+0xb40>
  40b07d:	nopl   (%rax)
  40b080:	mov    0xe8(%rsp),%rsi
  40b088:	sub    0xe0(%rsp),%rsi
  40b090:	mov    %rdx,0x40(%rsp)
  40b095:	mov    $0xffffffffffffffff,%rax
  40b09c:	shl    $0x7,%rsi
  40b0a0:	add    0xf8(%rsp),%rsi
  40b0a8:	mov    %r10,0x38(%rsp)
  40b0ad:	lea    0x8(%rsi),%rdi
  40b0b1:	mov    %rsi,%rcx
  40b0b4:	movq   $0xffffffffffffffff,(%rsi)
  40b0bb:	movq   $0xffffffffffffffff,0x1f8(%rsi)
  40b0c6:	and    $0xfffffffffffffff8,%rdi
  40b0ca:	sub    %rdi,%rcx
  40b0cd:	add    $0x200,%ecx
  40b0d3:	shr    $0x3,%ecx
  40b0d6:	rep stos %rax,%es:(%rdi)
  40b0d9:	mov    %rsi,(%r11)
  40b0dc:	lea    0xe0(%rsp),%rdi
  40b0e4:	lea    0xac(%rsp),%rsi
  40b0ec:	mov    %r8d,0xac(%rsp)
  40b0f4:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40b0f9:	mov    0xc0(%rsp),%rsi
  40b101:	mov    0xc8(%rsp),%rcx
  40b109:	mov    0x40(%rsp),%rdx
  40b10e:	mov    0x38(%rsp),%r10
  40b113:	mov    0x10(%rsi),%rax
  40b117:	mov    (%rcx,%rdx,8),%rcx
  40b11b:	jmp    40b00e <_ZZ4mainENKUljE_clEj+0xb0e>
  40b120:	mov    $0x10,%esi
  40b125:	add    %eax,%eax
  40b127:	mov    %r9,0x60(%rsp)
  40b12c:	cmp    %esi,%eax
  40b12e:	mov    %r8,0x58(%rsp)
  40b133:	cmovb  %esi,%eax
  40b136:	mov    %rdx,0x50(%rsp)
  40b13b:	mov    %r10,0x48(%rsp)
  40b140:	lea    0x0(,%rax,4),%esi
  40b147:	mov    %ecx,0x40(%rsp)
  40b14b:	mov    %eax,0x30c(%rsp,%r11,1)
  40b153:	mov    %r11,0x38(%rsp)
  40b158:	call   442cc0 <__libc_realloc>
  40b15d:	mov    0x38(%rsp),%r11
  40b162:	mov    0x60(%rsp),%r9
  40b167:	mov    %rax,%rdi
  40b16a:	mov    0x58(%rsp),%r8
  40b16f:	mov    0x50(%rsp),%rdx
  40b174:	mov    %rax,0x300(%rsp,%r11,1)
  40b17c:	mov    0xc0(%rsp),%rsi
  40b184:	mov    0x308(%rsp,%r11,1),%eax
  40b18c:	mov    0x48(%rsp),%r10
  40b191:	mov    0x40(%rsp),%ecx
  40b195:	jmp    40af70 <_ZZ4mainENKUljE_clEj+0xa70>
  40b19a:	nopw   0x0(%rax,%rax,1)
  40b1a0:	mov    0x30(%rsp),%rax
  40b1a5:	addq   $0x1,0x8(%rsp)
  40b1ab:	mov    0x2340(%rsp),%rcx
  40b1b3:	mov    -0x4558(%rax),%r11d
  40b1ba:	cmp    %r11d,0x8(%rsp)
  40b1bf:	jb     40ae39 <_ZZ4mainENKUljE_clEj+0x939>
  40b1c5:	mov    0x2348(%rsp),%rdx
  40b1cd:	mov    0x45f8(%rsp),%rax
  40b1d5:	sub    %r11,%rdx
  40b1d8:	mov    0x68(%rsp),%rsi
  40b1dd:	mov    $0x1,%ebx
  40b1e2:	mov    %rdx,0x2348(%rsp)
  40b1ea:	shl    %cl,%rbx
  40b1ed:	shl    $0x4,%rsi
  40b1f1:	movl   $0x0,0xc8(%rsp,%rsi,1)
  40b1fc:	mov    %rcx,%rsi
  40b1ff:	mov    %rbx,%rcx
  40b202:	shr    $0x6,%rsi
  40b206:	not    %rcx
  40b209:	and    $0x7,%esi
  40b20c:	and    %rcx,0x2300(%rsp,%rsi,8)
  40b214:	jmp    40abc0 <_ZZ4mainENKUljE_clEj+0x6c0>
  40b219:	nopl   0x0(%rax)
  40b220:	mov    %r8d,%esi
  40b223:	and    $0x1ff,%esi
  40b229:	add    $0x24,%rsi
  40b22d:	mov    %rsi,0x68(%rsp)
  40b232:	shl    $0x4,%rsi
  40b236:	mov    0x2378(%rsp,%rsi,1),%r11d
  40b23e:	lea    0x4620(%rsp,%rsi,1),%rbx
  40b246:	mov    %rbx,0x30(%rsp)
  40b24b:	test   %r11d,%r11d
  40b24e:	je     40b61b <_ZZ4mainENKUljE_clEj+0x111b>
  40b254:	mov    0x2370(%rsp),%rsi
  40b25c:	movq   $0x0,0x8(%rsp)
  40b265:	mov    0x8(%rsi),%rdx
  40b269:	jmp    40b281 <_ZZ4mainENKUljE_clEj+0xd81>
  40b26b:	nopl   0x0(%rax,%rax,1)
  40b270:	addq   $0x1,0x8(%rsp)
  40b276:	cmp    %r11d,0x8(%rsp)
  40b27b:	jae    40b605 <_ZZ4mainENKUljE_clEj+0x1105>
  40b281:	mov    0x8(%rsp),%r15
  40b286:	mov    0x30(%rsp),%rax
  40b28b:	lea    -0x1(%r11),%r9d
  40b28f:	mov    -0x22b0(%rax),%rbx
  40b296:	lea    0x8(%r15),%eax
  40b29a:	cmp    %r9d,%eax
  40b29d:	cmova  %r9d,%eax
  40b2a1:	mov    (%rbx,%rax,4),%eax
  40b2a4:	mov    %eax,%ecx
  40b2a6:	mov    %rax,%rdi
  40b2a9:	movzbl %al,%eax
  40b2ac:	and    $0x1ffffff,%ecx
  40b2b2:	shl    $0x27,%rdi
  40b2b6:	prefetcht0 (%rdx,%rcx,4)
  40b2ba:	mov    0x2378(%rsp),%rcx
  40b2c2:	shr    $0x2f,%rdi
  40b2c6:	mov    (%rcx,%rdi,8),%rdi
  40b2ca:	prefetcht0 (%rdi,%rax,2)
  40b2ce:	lea    0x4(%r15),%edi
  40b2d2:	mov    0x10(%rsi),%rax
  40b2d6:	cmp    %r9d,%edi
  40b2d9:	cmova  %r9d,%edi
  40b2dd:	mov    %r8,%r9
  40b2e0:	shl    $0x7,%r9
  40b2e4:	mov    (%rbx,%rdi,4),%edi
  40b2e7:	mov    %r9,%r14
  40b2ea:	and    $0x1ffffff,%edi
  40b2f0:	mov    (%rdx,%rdi,4),%edi
  40b2f3:	prefetcht0 (%rax,%rdi,4)
  40b2f7:	mov    (%rbx,%r15,4),%edi
  40b2fb:	mov    %edi,%ebx
  40b2fd:	mov    %edi,%ebp
  40b2ff:	movzbl %dil,%edi
  40b303:	shr    $0x19,%ebp
  40b306:	and    $0x1ffffff,%ebx
  40b30c:	or     %rbp,%r14
  40b30f:	mov    %ebx,%ebp
  40b311:	shr    $0x8,%ebp
  40b314:	mov    %r14,0x10(%rsp)
  40b319:	mov    (%rcx,%rbp,8),%rbp
  40b31d:	movzwl 0x0(%rbp,%rdi,2),%edi
  40b322:	cmp    %rdi,%r14
  40b325:	jne    40b270 <_ZZ4mainENKUljE_clEj+0xd70>
  40b32b:	mov    %ebx,%edi
  40b32d:	mov    (%rdx,%rdi,4),%ebp
  40b330:	lea    0x1(%rbx),%edi
  40b333:	lea    0x0(,%rdi,4),%rbx
  40b33b:	mov    %rbx,0x18(%rsp)
  40b340:	cmp    (%rdx,%rdi,4),%ebp
  40b343:	jb     40b422 <_ZZ4mainENKUljE_clEj+0xf22>
  40b349:	jmp    40b270 <_ZZ4mainENKUljE_clEj+0xd70>
  40b34e:	xchg   %ax,%ax
  40b350:	movzwl (%rcx),%eax
  40b353:	add    0x10(%rsp),%rbx
  40b358:	mov    %rbx,%r9
  40b35b:	cmp    %rax,%rbx
  40b35e:	mov    %rax,%rdi
  40b361:	cmovbe %rbx,%rdi
  40b365:	setb   %r12b
  40b369:	shr    $0x7,%r9
  40b36d:	mov    %r9,%r14
  40b370:	and    $0x1ff,%r14d
  40b377:	mov    %di,(%rcx)
  40b37a:	mov    %r9d,%ecx
  40b37d:	mov    %r14,%r11
  40b380:	and    $0x1ff,%ecx
  40b386:	shl    $0x4,%r11
  40b38a:	mov    0x25b8(%rsp,%r11,1),%eax
  40b392:	mov    0x25b0(%rsp,%r11,1),%rdi
  40b39a:	cmp    0x25bc(%rsp,%r11,1),%eax
  40b3a2:	je     40b560 <_ZZ4mainENKUljE_clEj+0x1060>
  40b3a8:	mov    %ebx,%r11d
  40b3ab:	shl    $0x4,%r14
  40b3af:	shl    $0x19,%r11d
  40b3b3:	or     %r15d,%r11d
  40b3b6:	mov    %r11d,(%rdi,%rax,4)
  40b3ba:	movzbl %r12b,%eax
  40b3be:	movzbl %r12b,%r12d
  40b3c2:	add    %eax,0x25b8(%rsp,%r14,1)
  40b3ca:	mov    %ecx,%eax
  40b3cc:	mov    %r9d,%ecx
  40b3cf:	shr    $0x6,%eax
  40b3d2:	add    %r12,0x45f8(%rsp)
  40b3da:	shl    %cl,%r12
  40b3dd:	or     %r12,0x45b0(%rsp,%rax,8)
  40b3e5:	mov    0xc8(%rsp),%rax
  40b3ed:	mov    (%rax,%rdx,8),%rax
  40b3f1:	mov    0x8(%rsi),%rdx
  40b3f5:	movzwl (%rax,%r8,2),%eax
  40b3fa:	add    %rbx,%rax
  40b3fd:	cmp    %rax,%r10
  40b400:	cmova  %rax,%r10
  40b404:	mov    0x18(%rsp),%rax
  40b409:	add    $0x1,%rbp
  40b40d:	cmp    (%rdx,%rax,1),%ebp
  40b410:	jae    40b5e0 <_ZZ4mainENKUljE_clEj+0x10e0>
  40b416:	mov    0x10(%rsi),%rax
  40b41a:	mov    0x2378(%rsp),%rcx
  40b422:	mov    (%rax,%rbp,4),%r15d
  40b426:	lea    0x0(,%rbp,4),%rbx
  40b42e:	mov    %r15d,%r8d
  40b431:	shr    $0x13,%r8d
  40b435:	mov    %r8d,%edx
  40b438:	lea    (%rcx,%rdx,8),%r11
  40b43c:	mov    (%r11),%rcx
  40b43f:	cmp    0x20(%rsp),%rcx
  40b444:	je     40b4c0 <_ZZ4mainENKUljE_clEj+0xfc0>
  40b446:	mov    (%rax,%rbx,1),%ebx
  40b449:	shr    $0xb,%r15d
  40b44d:	movzbl %r15b,%r8d
  40b451:	and    $0x7ff,%ebx
  40b457:	lea    (%rcx,%r8,2),%rcx
  40b45b:	cmp    $0x7ff,%ebx
  40b461:	jne    40b350 <_ZZ4mainENKUljE_clEj+0xe50>
  40b467:	mov    0x18(%rsi),%rbx
  40b46b:	mov    0x20(%rsi),%rax
  40b46f:	sub    %rbx,%rax
  40b472:	sar    $0x4,%rax
  40b476:	cs nopw 0x0(%rax,%rax,1)
  40b480:	test   %rax,%rax
  40b483:	jle    40b4aa <_ZZ4mainENKUljE_clEj+0xfaa>
  40b485:	mov    %rax,%r9
  40b488:	sar    $1,%r9
  40b48b:	mov    %r9,%rdi
  40b48e:	shl    $0x4,%rdi
  40b492:	add    %rbx,%rdi
  40b495:	cmp    %rbp,(%rdi)
  40b498:	jae    40b4b8 <_ZZ4mainENKUljE_clEj+0xfb8>
  40b49a:	sub    %r9,%rax
  40b49d:	lea    0x10(%rdi),%rbx
  40b4a1:	sub    $0x1,%rax
  40b4a5:	test   %rax,%rax
  40b4a8:	jg     40b485 <_ZZ4mainENKUljE_clEj+0xf85>
  40b4aa:	mov    0x8(%rbx),%rbx
  40b4ae:	jmp    40b350 <_ZZ4mainENKUljE_clEj+0xe50>
  40b4b3:	nopl   0x0(%rax,%rax,1)
  40b4b8:	mov    %r9,%rax
  40b4bb:	jmp    40b480 <_ZZ4mainENKUljE_clEj+0xf80>
  40b4bd:	nopl   (%rax)
  40b4c0:	mov    0x2398(%rsp),%rsi
  40b4c8:	sub    0x2390(%rsp),%rsi
  40b4d0:	mov    %rdx,0x40(%rsp)
  40b4d5:	mov    $0xffffffffffffffff,%rax
  40b4dc:	shl    $0x7,%rsi
  40b4e0:	add    0x23a8(%rsp),%rsi
  40b4e8:	mov    %r10,0x38(%rsp)
  40b4ed:	lea    0x8(%rsi),%rdi
  40b4f1:	mov    %rsi,%rcx
  40b4f4:	movq   $0xffffffffffffffff,(%rsi)
  40b4fb:	movq   $0xffffffffffffffff,0x1f8(%rsi)
  40b506:	and    $0xfffffffffffffff8,%rdi
  40b50a:	sub    %rdi,%rcx
  40b50d:	add    $0x200,%ecx
  40b513:	shr    $0x3,%ecx
  40b516:	rep stos %rax,%es:(%rdi)
  40b519:	mov    %rsi,(%r11)
  40b51c:	lea    0x2390(%rsp),%rdi
  40b524:	lea    0xb0(%rsp),%rsi
  40b52c:	mov    %r8d,0xb0(%rsp)
  40b534:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40b539:	mov    0x2370(%rsp),%rsi
  40b541:	mov    0x2378(%rsp),%rcx
  40b549:	mov    0x40(%rsp),%rdx
  40b54e:	mov    0x38(%rsp),%r10
  40b553:	mov    0x10(%rsi),%rax
  40b557:	mov    (%rcx,%rdx,8),%rcx
  40b55b:	jmp    40b446 <_ZZ4mainENKUljE_clEj+0xf46>
  40b560:	mov    $0x10,%esi
  40b565:	add    %eax,%eax
  40b567:	mov    %r9,0x60(%rsp)
  40b56c:	cmp    %esi,%eax
  40b56e:	mov    %r8,0x58(%rsp)
  40b573:	cmovb  %esi,%eax
  40b576:	mov    %rdx,0x50(%rsp)
  40b57b:	mov    %r10,0x48(%rsp)
  40b580:	lea    0x0(,%rax,4),%esi
  40b587:	mov    %ecx,0x40(%rsp)
  40b58b:	mov    %eax,0x25bc(%rsp,%r11,1)
  40b593:	mov    %r11,0x38(%rsp)
  40b598:	call   442cc0 <__libc_realloc>
  40b59d:	mov    0x38(%rsp),%r11
  40b5a2:	mov    0x60(%rsp),%r9
  40b5a7:	mov    %rax,%rdi
  40b5aa:	mov    0x58(%rsp),%r8
  40b5af:	mov    0x50(%rsp),%rdx
  40b5b4:	mov    %rax,0x25b0(%rsp,%r11,1)
  40b5bc:	mov    0x2370(%rsp),%rsi
  40b5c4:	mov    0x25b8(%rsp,%r11,1),%eax
  40b5cc:	mov    0x48(%rsp),%r10
  40b5d1:	mov    0x40(%rsp),%ecx
  40b5d5:	jmp    40b3a8 <_ZZ4mainENKUljE_clEj+0xea8>
  40b5da:	nopw   0x0(%rax,%rax,1)
  40b5e0:	mov    0x30(%rsp),%rax
  40b5e5:	addq   $0x1,0x8(%rsp)
  40b5eb:	mov    0x45f0(%rsp),%r8
  40b5f3:	mov    -0x22a8(%rax),%r11d
  40b5fa:	cmp    %r11d,0x8(%rsp)
  40b5ff:	jb     40b281 <_ZZ4mainENKUljE_clEj+0xd81>
  40b605:	mov    0x45f8(%rsp),%rax
  40b60d:	mov    0x2348(%rsp),%rdx
  40b615:	mov    %r8d,%ecx
  40b618:	sub    %r11,%rax
  40b61b:	mov    0x68(%rsp),%rsi
  40b620:	shr    $0x6,%r8
  40b624:	mov    %rax,0x45f8(%rsp)
  40b62c:	and    $0x7,%r8d
  40b630:	shl    $0x4,%rsi
  40b634:	movl   $0x0,0x2378(%rsp,%rsi,1)
  40b63f:	mov    $0x1,%esi
  40b644:	shl    %cl,%rsi
  40b647:	mov    %rsi,%rcx
  40b64a:	not    %rcx
  40b64d:	and    %rcx,0x45b0(%rsp,%r8,8)
  40b655:	jmp    40abc0 <_ZZ4mainENKUljE_clEj+0x6c0>
  40b65a:	nopw   0x0(%rax,%rax,1)
  40b660:	mov    %r10,%r15
  40b663:	cmp    $0xfffe,%r10
  40b66a:	ja     40b69a <_ZZ4mainENKUljE_clEj+0x119a>
  40b66c:	mov    0x80(%rsp),%rax
  40b674:	mov    0x8c(%rsp),%edx
  40b67b:	mov    0x30(%rax),%rax
  40b67f:	mov    (%rax),%rax
  40b682:	mov    %r15,(%rax,%rdx,8)
  40b686:	jmp    40a819 <_ZZ4mainENKUljE_clEj+0x319>
  40b68b:	mov    %r8d,%edi
  40b68e:	jmp    40ad8c <_ZZ4mainENKUljE_clEj+0x88c>
  40b693:	mov    %edi,%esi
  40b695:	jmp    40ac9a <_ZZ4mainENKUljE_clEj+0x79a>
  40b69a:	test   %r13,%r13
  40b69d:	je     40c303 <_ZZ4mainENKUljE_clEj+0x1e03>
  40b6a3:	mov    0x0(%r13),%rax
  40b6a7:	mov    0x98(%rsp),%rbx
  40b6af:	mov    0x90(%rsp),%rsi
  40b6b7:	mov    0x8(%rax),%rax
  40b6bb:	mov    (%rax,%rbx,4),%ebx
  40b6be:	cmp    %ebx,(%rax,%rsi,4)
  40b6c1:	je     40c1f1 <_ZZ4mainENKUljE_clEj+0x1cf1>
  40b6c7:	mov    0x8970(%r13),%rax
  40b6ce:	mov    0x8(%rax),%rdx
  40b6d2:	mov    0x7c(%rsp),%eax
  40b6d6:	lea    0x1(%rax),%ecx
  40b6d9:	mov    (%rdx,%rcx,4),%esi
  40b6dc:	cmp    %esi,(%rdx,%rax,4)
  40b6df:	je     40c1f1 <_ZZ4mainENKUljE_clEj+0x1cf1>
  40b6e5:	mov    0x20(%r13),%rdi
  40b6e9:	mov    0x28(%r13),%rcx
  40b6ed:	lea    0x40(%r13),%rbx
  40b6f1:	cmp    %rcx,%rdi
  40b6f4:	je     40b723 <_ZZ4mainENKUljE_clEj+0x1223>
  40b6f6:	mov    0x8(%r13),%rsi
  40b6fa:	mov    %rdi,%rax
  40b6fd:	lea    0x40(%r13),%rbx
  40b701:	data16 cs nopw 0x0(%rax,%rax,1)
  40b70c:	nopl   0x0(%rax)
  40b710:	mov    (%rax),%edx
  40b712:	add    $0x4,%rax
  40b716:	mov    %rbx,(%rsi,%rdx,8)
  40b71a:	cmp    %rax,%rcx
  40b71d:	jne    40b710 <_ZZ4mainENKUljE_clEj+0x1210>
  40b71f:	mov    %rdi,0x28(%r13)
  40b723:	xor    %esi,%esi
  40b725:	data16 cs nopw 0x0(%rax,%rax,1)
  40b730:	mov    0x8840(%r13,%rsi,8),%rax
  40b738:	mov    %esi,%ecx
  40b73a:	shl    $0x6,%ecx
  40b73d:	test   %rax,%rax
  40b740:	je     40b7a4 <_ZZ4mainENKUljE_clEj+0x12a4>
  40b742:	data16 cs nopw 0x0(%rax,%rax,1)
  40b74d:	data16 cs nopw 0x0(%rax,%rax,1)
  40b758:	data16 cs nopw 0x0(%rax,%rax,1)
  40b763:	data16 cs nopw 0x0(%rax,%rax,1)
  40b76e:	data16 cs nopw 0x0(%rax,%rax,1)
  40b779:	nopl   0x0(%rax)
  40b780:	xor    %edx,%edx
  40b782:	tzcnt  %rax,%rdx
  40b787:	add    %ecx,%edx
  40b789:	mov    %edx,%edx
  40b78b:	shl    $0x4,%rdx
  40b78f:	movl   $0x0,0x848(%r13,%rdx,1)
  40b79b:	lea    -0x1(%rax),%rdx
  40b79f:	and    %rdx,%rax
  40b7a2:	jne    40b780 <_ZZ4mainENKUljE_clEj+0x1280>
  40b7a4:	movq   $0x0,0x8840(%r13,%rsi,8)
  40b7b0:	add    $0x1,%rsi
  40b7b4:	cmp    $0x20,%rsi
  40b7b8:	jne    40b730 <_ZZ4mainENKUljE_clEj+0x1230>
  40b7be:	mov    0x8950(%r13),%rdi
  40b7c5:	pxor   %xmm0,%xmm0
  40b7c9:	mov    0x8960(%r13),%rax
  40b7d0:	movq   $0x0,0x8960(%r13)
  40b7db:	movups %xmm0,0x8950(%r13)
  40b7e3:	test   %rdi,%rdi
  40b7e6:	je     40b7f3 <_ZZ4mainENKUljE_clEj+0x12f3>
  40b7e8:	sub    %rdi,%rax
  40b7eb:	mov    %rax,%rsi
  40b7ee:	call   40e190 <_ZdlPvm>
  40b7f3:	mov    0x88(%rsp),%ecx
  40b7fa:	mov    0x8(%r13),%rax
  40b7fe:	pxor   %xmm0,%xmm0
  40b802:	movups %xmm0,0x8940(%r13)
  40b80a:	shr    $0x8,%ecx
  40b80d:	mov    %ecx,%ebp
  40b80f:	lea    (%rax,%rbp,8),%rsi
  40b813:	mov    (%rsi),%rax
  40b816:	cmp    %rbx,%rax
  40b819:	je     40c983 <_ZZ4mainENKUljE_clEj+0x2483>
  40b81f:	movzbl 0x88(%rsp),%edx
  40b827:	movq   $0x0,(%rax,%rdx,8)
  40b82f:	mov    0x8940(%r13),%rax
  40b836:	neg    %rax
  40b839:	cmp    $0x7ff,%rax
  40b83f:	ja     40c84d <_ZZ4mainENKUljE_clEj+0x234d>
  40b845:	mov    0x848(%r13),%eax
  40b84c:	mov    0x840(%r13),%rdi
  40b853:	cmp    0x84c(%r13),%eax
  40b85a:	je     40ca48 <_ZZ4mainENKUljE_clEj+0x2548>
  40b860:	mov    0x88(%rsp),%esi
  40b867:	mov    %esi,(%rdi,%rax,4)
  40b86a:	addq   $0x1,0x8948(%r13)
  40b872:	addl   $0x1,0x848(%r13)
  40b87a:	orq    $0x1,0x8840(%r13)
  40b882:	mov    0x8990(%r13),%rdi
  40b889:	mov    0x8998(%r13),%rcx
  40b890:	lea    0x89b0(%r13),%rbx
  40b897:	cmp    %rcx,%rdi
  40b89a:	je     40b8c6 <_ZZ4mainENKUljE_clEj+0x13c6>
  40b89c:	mov    0x8978(%r13),%rsi
  40b8a3:	mov    %rdi,%rax
  40b8a6:	lea    0x89b0(%r13),%rbx
  40b8ad:	nopl   (%rax)
  40b8b0:	mov    (%rax),%edx
  40b8b2:	add    $0x4,%rax
  40b8b6:	mov    %rbx,(%rsi,%rdx,8)
  40b8ba:	cmp    %rcx,%rax
  40b8bd:	jne    40b8b0 <_ZZ4mainENKUljE_clEj+0x13b0>
  40b8bf:	mov    %rdi,0x8998(%r13)
  40b8c6:	xor    %esi,%esi
  40b8c8:	nopl   0x0(%rax,%rax,1)
  40b8d0:	mov    0x111b0(%r13,%rsi,8),%rax
  40b8d8:	mov    %esi,%ecx
  40b8da:	shl    $0x6,%ecx
  40b8dd:	test   %rax,%rax
  40b8e0:	je     40b924 <_ZZ4mainENKUljE_clEj+0x1424>
  40b8e2:	data16 cs nopw 0x0(%rax,%rax,1)
  40b8ed:	data16 cs nopw 0x0(%rax,%rax,1)
  40b8f8:	nopl   0x0(%rax,%rax,1)
  40b900:	xor    %edx,%edx
  40b902:	tzcnt  %rax,%rdx
  40b907:	add    %ecx,%edx
  40b909:	mov    %edx,%edx
  40b90b:	shl    $0x4,%rdx
  40b90f:	movl   $0x0,0x91b8(%r13,%rdx,1)
  40b91b:	lea    -0x1(%rax),%rdx
  40b91f:	and    %rdx,%rax
  40b922:	jne    40b900 <_ZZ4mainENKUljE_clEj+0x1400>
  40b924:	movq   $0x0,0x111b0(%r13,%rsi,8)
  40b930:	add    $0x1,%rsi
  40b934:	cmp    $0x20,%rsi
  40b938:	jne    40b8d0 <_ZZ4mainENKUljE_clEj+0x13d0>
  40b93a:	mov    0x112c0(%r13),%rdi
  40b941:	pxor   %xmm0,%xmm0
  40b945:	mov    0x112d0(%r13),%rax
  40b94c:	movq   $0x0,0x112d0(%r13)
  40b957:	movups %xmm0,0x112c0(%r13)
  40b95f:	test   %rdi,%rdi
  40b962:	je     40b96f <_ZZ4mainENKUljE_clEj+0x146f>
  40b964:	sub    %rdi,%rax
  40b967:	mov    %rax,%rsi
  40b96a:	call   40e190 <_ZdlPvm>
  40b96f:	mov    0x7c(%rsp),%ecx
  40b973:	mov    0x8978(%r13),%rax
  40b97a:	pxor   %xmm0,%xmm0
  40b97e:	movups %xmm0,0x112b0(%r13)
  40b986:	shr    $0x8,%ecx
  40b989:	mov    %ecx,%ebp
  40b98b:	lea    (%rax,%rbp,8),%rsi
  40b98f:	mov    (%rsi),%rax
  40b992:	cmp    %rbx,%rax
  40b995:	je     40c90d <_ZZ4mainENKUljE_clEj+0x240d>
  40b99b:	movzbl 0x7c(%rsp),%edx
  40b9a0:	movq   $0x0,(%rax,%rdx,8)
  40b9a8:	mov    0x112b0(%r13),%rax
  40b9af:	neg    %rax
  40b9b2:	cmp    $0x7ff,%rax
  40b9b8:	ja     40c78b <_ZZ4mainENKUljE_clEj+0x228b>
  40b9be:	mov    0x91b8(%r13),%eax
  40b9c5:	mov    0x91b0(%r13),%rdi
  40b9cc:	cmp    0x91bc(%r13),%eax
  40b9d3:	je     40ca13 <_ZZ4mainENKUljE_clEj+0x2513>
  40b9d9:	mov    0x7c(%rsp),%esi
  40b9dd:	mov    %esi,(%rdi,%rax,4)
  40b9e0:	addq   $0x1,0x112b8(%r13)
  40b9e8:	addl   $0x1,0x91b8(%r13)
  40b9f0:	orq    $0x1,0x111b0(%r13)
  40b9f8:	mov    0x8948(%r13),%r11
  40b9ff:	lea    0x8970(%r13),%rbx
  40ba06:	movabs $0x4000000000000000,%rax
  40ba10:	mov    %rax,0xb8(%rsp)
  40ba18:	mov    %rax,%rbp
  40ba1b:	test   %r11,%r11
  40ba1e:	je     40c0d5 <_ZZ4mainENKUljE_clEj+0x1bd5>
  40ba24:	mov    0x8940(%r13),%rsi
  40ba2b:	mov    $0xffffffffffffffff,%rdx
  40ba32:	mov    %esi,%edi
  40ba34:	mov    %esi,%ecx
  40ba36:	and    $0x7ff,%edi
  40ba3c:	shl    %cl,%rdx
  40ba3f:	mov    %edi,%eax
  40ba41:	shr    $0x6,%eax
  40ba44:	mov    %eax,%ecx
  40ba46:	and    0x8840(%r13,%rcx,8),%rdx
  40ba4e:	jne    40ba78 <_ZZ4mainENKUljE_clEj+0x1578>
  40ba50:	data16 cs nopw 0x0(%rax,%rax,1)
  40ba5b:	nopl   0x0(%rax,%rax,1)
  40ba60:	lea    0x1(%rax),%edx
  40ba63:	mov    %edx,%eax
  40ba65:	and    $0x1f,%edx
  40ba68:	mov    0x8840(%r13,%rdx,8),%rdx
  40ba70:	and    $0x1f,%eax
  40ba73:	test   %rdx,%rdx
  40ba76:	je     40ba60 <_ZZ4mainENKUljE_clEj+0x1560>
  40ba78:	tzcnt  %rdx,%rdx
  40ba7d:	shl    $0x6,%eax
  40ba80:	mov    0x8958(%r13),%r8
  40ba87:	add    %edx,%eax
  40ba89:	sub    %edi,%eax
  40ba8b:	and    $0x7ff,%eax
  40ba90:	add    %rsi,%rax
  40ba93:	mov    0x8950(%r13),%rsi
  40ba9a:	mov    %rax,0x8940(%r13)
  40baa1:	cmp    %rsi,%r8
  40baa4:	je     40bd28 <_ZZ4mainENKUljE_clEj+0x1828>
  40baaa:	mov    %rbx,0x30(%rsp)
  40baaf:	mov    %rbp,%r15
  40bab2:	jmp    40bacf <_ZZ4mainENKUljE_clEj+0x15cf>
  40bab4:	nopl   0x0(%rax)
  40bab8:	mov    %r8,0x8958(%r13)
  40babf:	mov    0x8940(%r13),%rax
  40bac6:	cmp    %r8,%rsi
  40bac9:	je     40bd20 <_ZZ4mainENKUljE_clEj+0x1820>
  40bacf:	mov    (%rsi),%r14
  40bad2:	mov    %r14,%r12
  40bad5:	shr    $0x7,%r12
  40bad9:	mov    %r12,%rdx
  40badc:	sub    %rax,%rdx
  40badf:	cmp    $0x7ff,%rdx
  40bae6:	ja     40bd20 <_ZZ4mainENKUljE_clEj+0x1820>
  40baec:	mov    %r12,%rbx
  40baef:	mov    %r12d,%edx
  40baf2:	mov    0x8(%rsi),%ebp
  40baf5:	mov    %r8,%rax
  40baf8:	and    $0x7ff,%ebx
  40bafe:	and    $0x7ff,%edx
  40bb04:	shl    $0x4,%rbx
  40bb08:	add    %r13,%rbx
  40bb0b:	mov    0x848(%rbx),%r9d
  40bb12:	mov    0x840(%rbx),%rdi
  40bb19:	cmp    0x84c(%rbx),%r9d
  40bb20:	je     40bcc0 <_ZZ4mainENKUljE_clEj+0x17c0>
  40bb26:	shl    $0x19,%r14d
  40bb2a:	shr    $0x6,%edx
  40bb2d:	add    $0x1,%r11
  40bb31:	mov    %r12d,%ecx
  40bb34:	or     %ebp,%r14d
  40bb37:	lea    -0x10(%rax),%r8
  40bb3b:	mov    %r14d,(%rdi,%r9,4)
  40bb3f:	addl   $0x1,0x848(%rbx)
  40bb46:	mov    $0x1,%ebx
  40bb4b:	mov    %r11,0x8948(%r13)
  40bb52:	shl    %cl,%rbx
  40bb55:	or     %rbx,0x8840(%r13,%rdx,8)
  40bb5d:	mov    %rax,%rdx
  40bb60:	sub    %rsi,%rdx
  40bb63:	cmp    $0x10,%rdx
  40bb67:	jle    40bab8 <_ZZ4mainENKUljE_clEj+0x15b8>
  40bb6d:	mov    (%rsi),%rdx
  40bb70:	mov    %r8,%r9
  40bb73:	mov    -0x10(%rax),%rbx
  40bb77:	sub    %rsi,%r9
  40bb7a:	mov    -0x8(%rax),%r14d
  40bb7e:	mov    %rdx,-0x10(%rax)
  40bb82:	mov    0x8(%rsi),%edx
  40bb85:	mov    %r9,%r10
  40bb88:	sar    $0x4,%r10
  40bb8c:	mov    %edx,-0x8(%rax)
  40bb8f:	cmp    $0x20,%r9
  40bb93:	jle    40c18c <_ZZ4mainENKUljE_clEj+0x1c8c>
  40bb99:	lea    -0x1(%r10),%r12
  40bb9d:	mov    %r13,0x8(%rsp)
  40bba2:	xor    %eax,%eax
  40bba4:	mov    %r8,0x10(%rsp)
  40bba9:	sar    $1,%r12
  40bbac:	mov    %r11,0x18(%rsp)
  40bbb1:	jmp    40bbd1 <_ZZ4mainENKUljE_clEj+0x16d1>
  40bbb3:	nopl   0x0(%rax,%rax,1)
  40bbb8:	mov    0x8(%rdx),%r13d
  40bbbc:	shl    $0x4,%rax
  40bbc0:	mov    %r8,(%rsi,%rax,1)
  40bbc4:	mov    %r13d,0x8(%rsi,%rax,1)
  40bbc9:	cmp    %rcx,%r12
  40bbcc:	jle    40bc20 <_ZZ4mainENKUljE_clEj+0x1720>
  40bbce:	mov    %rcx,%rax
  40bbd1:	lea    0x1(%rax),%r11
  40bbd5:	lea    -0x1(%r11,%r11,1),%rcx
  40bbda:	mov    %r11,%rdi
  40bbdd:	mov    %rcx,%rdx
  40bbe0:	shl    $0x5,%rdi
  40bbe4:	shl    $0x4,%rdx
  40bbe8:	add    %rsi,%rdi
  40bbeb:	add    %rsi,%rdx
  40bbee:	mov    (%rdi),%rbp
  40bbf1:	mov    (%rdx),%r8
  40bbf4:	cmp    %rbp,%r8
  40bbf7:	jb     40bbb8 <_ZZ4mainENKUljE_clEj+0x16b8>
  40bbf9:	mov    0x8(%rdi),%r13d
  40bbfd:	cmp    %r8,%rbp
  40bc00:	jne    40bc10 <_ZZ4mainENKUljE_clEj+0x1710>
  40bc02:	mov    0x8(%rdx),%ebp
  40bc05:	cmp    %r13d,%ebp
  40bc08:	jae    40bc13 <_ZZ4mainENKUljE_clEj+0x1713>
  40bc0a:	mov    %ebp,%r13d
  40bc0d:	jmp    40bbbc <_ZZ4mainENKUljE_clEj+0x16bc>
  40bc0f:	nop
  40bc10:	mov    %rbp,%r8
  40bc13:	mov    %rdi,%rdx
  40bc16:	lea    (%r11,%r11,1),%rcx
  40bc1a:	jmp    40bbbc <_ZZ4mainENKUljE_clEj+0x16bc>
  40bc1c:	nopl   0x0(%rax)
  40bc20:	and    $0x1,%r10d
  40bc24:	mov    0x8(%rsp),%r13
  40bc29:	mov    0x10(%rsp),%r8
  40bc2e:	mov    0x18(%rsp),%r11
  40bc33:	jne    40bc46 <_ZZ4mainENKUljE_clEj+0x1746>
  40bc35:	sar    $0x5,%r9
  40bc39:	sub    $0x1,%r9
  40bc3d:	cmp    %rcx,%r9
  40bc40:	je     40c1a5 <_ZZ4mainENKUljE_clEj+0x1ca5>
  40bc46:	lea    -0x1(%rcx),%rax
  40bc4a:	shr    $0x3f,%rax
  40bc4e:	lea    -0x1(%rax,%rcx,1),%rax
  40bc53:	sar    $1,%rax
  40bc56:	test   %rcx,%rcx
  40bc59:	je     40bc83 <_ZZ4mainENKUljE_clEj+0x1783>
  40bc5b:	mov    %rax,%rdx
  40bc5e:	shl    $0x4,%rdx
  40bc62:	add    %rsi,%rdx
  40bc65:	mov    (%rdx),%rdi
  40bc68:	cmp    %rdi,%rbx
  40bc6b:	jb     40bc90 <_ZZ4mainENKUljE_clEj+0x1790>
  40bc6d:	cmp    %rbx,%rdi
  40bc70:	jne    40bc7b <_ZZ4mainENKUljE_clEj+0x177b>
  40bc72:	mov    0x8(%rdx),%r9d
  40bc76:	cmp    %r9d,%r14d
  40bc79:	jb     40bc94 <_ZZ4mainENKUljE_clEj+0x1794>
  40bc7b:	shl    $0x4,%rcx
  40bc7f:	lea    (%rsi,%rcx,1),%rdx
  40bc83:	mov    %rbx,(%rdx)
  40bc86:	mov    %r14d,0x8(%rdx)
  40bc8a:	jmp    40bab8 <_ZZ4mainENKUljE_clEj+0x15b8>
  40bc8f:	nop
  40bc90:	mov    0x8(%rdx),%r9d
  40bc94:	shl    $0x4,%rcx
  40bc98:	mov    %rdi,(%rsi,%rcx,1)
  40bc9c:	mov    %r9d,0x8(%rsi,%rcx,1)
  40bca1:	lea    -0x1(%rax),%rcx
  40bca5:	shr    $0x3f,%rcx
  40bca9:	lea    -0x1(%rax,%rcx,1),%rdi
  40bcae:	mov    %rax,%rcx
  40bcb1:	test   %rax,%rax
  40bcb4:	je     40bc83 <_ZZ4mainENKUljE_clEj+0x1783>
  40bcb6:	mov    %rdi,%rax
  40bcb9:	sar    $1,%rax
  40bcbc:	jmp    40bc5b <_ZZ4mainENKUljE_clEj+0x175b>
  40bcbe:	xchg   %ax,%ax
  40bcc0:	mov    $0x10,%eax
  40bcc5:	add    %r9d,%r9d
  40bcc8:	mov    %edx,0x8(%rsp)
  40bccc:	cmp    %eax,%r9d
  40bccf:	cmovb  %eax,%r9d
  40bcd3:	mov    %r9d,0x84c(%rbx)
  40bcda:	lea    0x0(,%r9,4),%esi
  40bce2:	call   442cc0 <__libc_realloc>
  40bce7:	mov    0x848(%rbx),%r9d
  40bcee:	mov    0x8948(%r13),%r11
  40bcf5:	mov    %rax,0x840(%rbx)
  40bcfc:	mov    %rax,%rdi
  40bcff:	mov    0x8950(%r13),%rsi
  40bd06:	mov    0x8958(%r13),%rax
  40bd0d:	mov    0x8(%rsp),%edx
  40bd11:	jmp    40bb26 <_ZZ4mainENKUljE_clEj+0x1626>
  40bd16:	cs nopw 0x0(%rax,%rax,1)
  40bd20:	mov    0x30(%rsp),%rbx
  40bd25:	mov    %r15,%rbp
  40bd28:	shl    $0x7,%rax
  40bd2c:	mov    %rax,%r12
  40bd2f:	mov    0x112b8(%r13),%r11
  40bd36:	test   %r11,%r11
  40bd39:	je     40c107 <_ZZ4mainENKUljE_clEj+0x1c07>
  40bd3f:	mov    0x112b0(%r13),%rdx
  40bd46:	mov    $0xffffffffffffffff,%rdi
  40bd4d:	mov    %edx,%esi
  40bd4f:	mov    %edx,%ecx
  40bd51:	and    $0x7ff,%esi
  40bd57:	shl    %cl,%rdi
  40bd5a:	mov    %esi,%eax
  40bd5c:	mov    %rdi,%rcx
  40bd5f:	shr    $0x6,%eax
  40bd62:	mov    %eax,%edi
  40bd64:	and    0x111b0(%r13,%rdi,8),%rcx
  40bd6c:	jne    40bd98 <_ZZ4mainENKUljE_clEj+0x1898>
  40bd6e:	data16 cs nopw 0x0(%rax,%rax,1)
  40bd79:	nopl   0x0(%rax)
  40bd80:	lea    0x1(%rax),%ecx
  40bd83:	mov    %ecx,%eax
  40bd85:	and    $0x1f,%ecx
  40bd88:	mov    0x111b0(%r13,%rcx,8),%rcx
  40bd90:	and    $0x1f,%eax
  40bd93:	test   %rcx,%rcx
  40bd96:	je     40bd80 <_ZZ4mainENKUljE_clEj+0x1880>
  40bd98:	tzcnt  %rcx,%rcx
  40bd9d:	shl    $0x6,%eax
  40bda0:	mov    0x112c8(%r13),%r8
  40bda7:	add    %ecx,%eax
  40bda9:	sub    %esi,%eax
  40bdab:	mov    0x112c0(%r13),%rsi
  40bdb2:	and    $0x7ff,%eax
  40bdb7:	add    %rdx,%rax
  40bdba:	mov    %rax,0x112b0(%r13)
  40bdc1:	cmp    %rsi,%r8
  40bdc4:	je     40c05d <_ZZ4mainENKUljE_clEj+0x1b5d>
  40bdca:	mov    %rbx,0x30(%rsp)
  40bdcf:	mov    %rbp,%r15
  40bdd2:	mov    %r12,0x38(%rsp)
  40bdd7:	jmp    40bdf7 <_ZZ4mainENKUljE_clEj+0x18f7>
  40bdd9:	nopl   0x0(%rax)
  40bde0:	mov    %r8,0x112c8(%r13)
  40bde7:	mov    0x112b0(%r13),%rax
  40bdee:	cmp    %r8,%rsi
  40bdf1:	je     40c050 <_ZZ4mainENKUljE_clEj+0x1b50>
  40bdf7:	mov    (%rsi),%r14
  40bdfa:	mov    %r14,%r12
  40bdfd:	shr    $0x7,%r12
  40be01:	mov    %r12,%rdx
  40be04:	sub    %rax,%rdx
  40be07:	cmp    $0x7ff,%rdx
  40be0e:	ja     40c050 <_ZZ4mainENKUljE_clEj+0x1b50>
  40be14:	mov    %r12,%rbx
  40be17:	mov    %r12d,%edx
  40be1a:	mov    0x8(%rsi),%ebp
  40be1d:	mov    %r8,%rax
  40be20:	and    $0x7ff,%ebx
  40be26:	and    $0x7ff,%edx
  40be2c:	shl    $0x4,%rbx
  40be30:	add    %r13,%rbx
  40be33:	mov    0x91b8(%rbx),%r9d
  40be3a:	mov    0x91b0(%rbx),%rdi
  40be41:	cmp    0x91bc(%rbx),%r9d
  40be48:	je     40bff0 <_ZZ4mainENKUljE_clEj+0x1af0>
  40be4e:	shl    $0x19,%r14d
  40be52:	mov    %r9d,%r8d
  40be55:	shr    $0x6,%edx
  40be58:	add    $0x1,%r11
  40be5c:	or     %ebp,%r14d
  40be5f:	mov    %r12d,%ecx
  40be62:	mov    %r14d,(%rdi,%r8,4)
  40be66:	lea    -0x10(%rax),%r8
  40be6a:	addl   $0x1,0x91b8(%rbx)
  40be71:	mov    $0x1,%ebx
  40be76:	mov    %r11,0x112b8(%r13)
  40be7d:	shl    %cl,%rbx
  40be80:	or     %rbx,0x111b0(%r13,%rdx,8)
  40be88:	mov    %rax,%rdx
  40be8b:	sub    %rsi,%rdx
  40be8e:	cmp    $0x10,%rdx
  40be92:	jle    40bde0 <_ZZ4mainENKUljE_clEj+0x18e0>
  40be98:	mov    (%rsi),%rdx
  40be9b:	mov    %r8,%r9
  40be9e:	mov    -0x10(%rax),%rbx
  40bea2:	sub    %rsi,%r9
  40bea5:	mov    -0x8(%rax),%r14d
  40bea9:	mov    %rdx,-0x10(%rax)
  40bead:	mov    0x8(%rsi),%edx
  40beb0:	mov    %r9,%r10
  40beb3:	sar    $0x4,%r10
  40beb7:	mov    %edx,-0x8(%rax)
  40beba:	cmp    $0x20,%r9
  40bebe:	jle    40c14e <_ZZ4mainENKUljE_clEj+0x1c4e>
  40bec4:	lea    -0x1(%r10),%r12
  40bec8:	mov    %r13,0x8(%rsp)
  40becd:	xor    %eax,%eax
  40becf:	mov    %rbx,0x10(%rsp)
  40bed4:	sar    $1,%r12
  40bed7:	mov    %r11,0x18(%rsp)
  40bedc:	jmp    40bef9 <_ZZ4mainENKUljE_clEj+0x19f9>
  40bede:	xchg   %ax,%ax
  40bee0:	mov    0x8(%rdx),%r13d
  40bee4:	shl    $0x4,%rax
  40bee8:	mov    %r11,(%rsi,%rax,1)
  40beec:	mov    %r13d,0x8(%rsi,%rax,1)
  40bef1:	cmp    %rcx,%r12
  40bef4:	jle    40bf50 <_ZZ4mainENKUljE_clEj+0x1a50>
  40bef6:	mov    %rcx,%rax
  40bef9:	lea    0x1(%rax),%rbx
  40befd:	lea    -0x1(%rbx,%rbx,1),%rcx
  40bf02:	mov    %rbx,%rdi
  40bf05:	mov    %rcx,%rdx
  40bf08:	shl    $0x5,%rdi
  40bf0c:	shl    $0x4,%rdx
  40bf10:	add    %rsi,%rdi
  40bf13:	add    %rsi,%rdx
  40bf16:	mov    (%rdi),%rbp
  40bf19:	mov    (%rdx),%r11
  40bf1c:	cmp    %rbp,%r11
  40bf1f:	jb     40bee0 <_ZZ4mainENKUljE_clEj+0x19e0>
  40bf21:	mov    0x8(%rdi),%r13d
  40bf25:	cmp    %r11,%rbp
  40bf28:	jne    40bf40 <_ZZ4mainENKUljE_clEj+0x1a40>
  40bf2a:	mov    0x8(%rdx),%ebp
  40bf2d:	cmp    %r13d,%ebp
  40bf30:	jae    40bf43 <_ZZ4mainENKUljE_clEj+0x1a43>
  40bf32:	mov    %ebp,%r13d
  40bf35:	jmp    40bee4 <_ZZ4mainENKUljE_clEj+0x19e4>
  40bf37:	nopw   0x0(%rax,%rax,1)
  40bf40:	mov    %rbp,%r11
  40bf43:	mov    %rdi,%rdx
  40bf46:	lea    (%rbx,%rbx,1),%rcx
  40bf4a:	jmp    40bee4 <_ZZ4mainENKUljE_clEj+0x19e4>
  40bf4c:	nopl   0x0(%rax)
  40bf50:	and    $0x1,%r10d
  40bf54:	mov    0x8(%rsp),%r13
  40bf59:	mov    0x10(%rsp),%rbx
  40bf5e:	mov    0x18(%rsp),%r11
  40bf63:	jne    40bf76 <_ZZ4mainENKUljE_clEj+0x1a76>
  40bf65:	sar    $0x5,%r9
  40bf69:	sub    $0x1,%r9
  40bf6d:	cmp    %rcx,%r9
  40bf70:	je     40c167 <_ZZ4mainENKUljE_clEj+0x1c67>
  40bf76:	lea    -0x1(%rcx),%rax
  40bf7a:	shr    $0x3f,%rax
  40bf7e:	lea    -0x1(%rax,%rcx,1),%rax
  40bf83:	sar    $1,%rax
  40bf86:	test   %rcx,%rcx
  40bf89:	je     40bfb0 <_ZZ4mainENKUljE_clEj+0x1ab0>
  40bf8b:	mov    %rax,%rdx
  40bf8e:	shl    $0x4,%rdx
  40bf92:	add    %rsi,%rdx
  40bf95:	mov    (%rdx),%rdi
  40bf98:	cmp    %rdi,%rbx
  40bf9b:	jb     40bfc0 <_ZZ4mainENKUljE_clEj+0x1ac0>
  40bf9d:	jne    40bfa8 <_ZZ4mainENKUljE_clEj+0x1aa8>
  40bf9f:	mov    0x8(%rdx),%r9d
  40bfa3:	cmp    %r9d,%r14d
  40bfa6:	jb     40bfc4 <_ZZ4mainENKUljE_clEj+0x1ac4>
  40bfa8:	shl    $0x4,%rcx
  40bfac:	lea    (%rsi,%rcx,1),%rdx
  40bfb0:	mov    %rbx,(%rdx)
  40bfb3:	mov    %r14d,0x8(%rdx)
  40bfb7:	jmp    40bde0 <_ZZ4mainENKUljE_clEj+0x18e0>
  40bfbc:	nopl   0x0(%rax)
  40bfc0:	mov    0x8(%rdx),%r9d
  40bfc4:	shl    $0x4,%rcx
  40bfc8:	mov    %rdi,(%rsi,%rcx,1)
  40bfcc:	mov    %r9d,0x8(%rsi,%rcx,1)
  40bfd1:	lea    -0x1(%rax),%rcx
  40bfd5:	shr    $0x3f,%rcx
  40bfd9:	lea    -0x1(%rax,%rcx,1),%rdi
  40bfde:	mov    %rax,%rcx
  40bfe1:	test   %rax,%rax
  40bfe4:	je     40bfb0 <_ZZ4mainENKUljE_clEj+0x1ab0>
  40bfe6:	mov    %rdi,%rax
  40bfe9:	sar    $1,%rax
  40bfec:	jmp    40bf8b <_ZZ4mainENKUljE_clEj+0x1a8b>
  40bfee:	xchg   %ax,%ax
  40bff0:	lea    (%r9,%r9,1),%r8d
  40bff4:	mov    $0x10,%eax
  40bff9:	mov    %edx,0x8(%rsp)
  40bffd:	cmp    %eax,%r8d
  40c000:	cmovb  %eax,%r8d
  40c004:	mov    %r8d,0x91bc(%rbx)
  40c00b:	lea    0x0(,%r8,4),%esi
  40c013:	call   442cc0 <__libc_realloc>
  40c018:	mov    0x91b8(%rbx),%r9d
  40c01f:	mov    0x112b8(%r13),%r11
  40c026:	mov    %rax,0x91b0(%rbx)
  40c02d:	mov    %rax,%rdi
  40c030:	mov    0x112c0(%r13),%rsi
  40c037:	mov    0x112c8(%r13),%rax
  40c03e:	mov    0x8(%rsp),%edx
  40c042:	jmp    40be4e <_ZZ4mainENKUljE_clEj+0x194e>
  40c047:	nopw   0x0(%rax,%rax,1)
  40c050:	mov    0x30(%rsp),%rbx
  40c055:	mov    0x38(%rsp),%r12
  40c05a:	mov    %r15,%rbp
  40c05d:	movabs $0x4000000000000000,%rsi
  40c067:	shl    $0x7,%rax
  40c06b:	cmp    %rsi,%r12
  40c06e:	je     40c1ca <_ZZ4mainENKUljE_clEj+0x1cca>
  40c074:	cmp    %rsi,%rax
  40c077:	je     40c1ca <_ZZ4mainENKUljE_clEj+0x1cca>
  40c07d:	add    %rax,%r12
  40c080:	cmp    %rbp,%r12
  40c083:	jae    40c1db <_ZZ4mainENKUljE_clEj+0x1cdb>
  40c089:	mov    0x8948(%r13),%rax
  40c090:	cmp    %rax,0x112b8(%r13)
  40c097:	lea    0xc0(%rsp),%rax
  40c09f:	lea    0xb8(%rsp),%rdx
  40c0a7:	mov    %rax,0x70(%rsp)
  40c0ac:	jb     40c13e <_ZZ4mainENKUljE_clEj+0x1c3e>
  40c0b2:	mov    %rbx,%rsi
  40c0b5:	mov    %r13,%rdi
  40c0b8:	call   409ec0 <_ZN4SideImE10drain_bitsILj11EEEvRKS0_Rm>
  40c0bd:	mov    0x8948(%r13),%r11
  40c0c4:	mov    0xb8(%rsp),%rbp
  40c0cc:	test   %r11,%r11
  40c0cf:	jne    40ba24 <_ZZ4mainENKUljE_clEj+0x1524>
  40c0d5:	mov    0x8958(%r13),%r8
  40c0dc:	mov    0x8950(%r13),%rsi
  40c0e3:	cmp    %rsi,%r8
  40c0e6:	je     40c650 <_ZZ4mainENKUljE_clEj+0x2150>
  40c0ec:	mov    (%rsi),%rax
  40c0ef:	mov    %rbx,0x30(%rsp)
  40c0f4:	mov    %rbp,%r15
  40c0f7:	shr    $0x7,%rax
  40c0fb:	mov    %rax,0x8940(%r13)
  40c102:	jmp    40bacf <_ZZ4mainENKUljE_clEj+0x15cf>
  40c107:	mov    0x112c8(%r13),%r8
  40c10e:	mov    0x112c0(%r13),%rsi
  40c115:	cmp    %rsi,%r8
  40c118:	je     40c1ca <_ZZ4mainENKUljE_clEj+0x1cca>
  40c11e:	mov    (%rsi),%rax
  40c121:	mov    %rbx,0x30(%rsp)
  40c126:	mov    %rbp,%r15
  40c129:	mov    %r12,0x38(%rsp)
  40c12e:	shr    $0x7,%rax
  40c132:	mov    %rax,0x112b0(%r13)
  40c139:	jmp    40bdf7 <_ZZ4mainENKUljE_clEj+0x18f7>
  40c13e:	mov    %r13,%rsi
  40c141:	mov    %rbx,%rdi
  40c144:	call   409ec0 <_ZN4SideImE10drain_bitsILj11EEEvRKS0_Rm>
  40c149:	jmp    40c0bd <_ZZ4mainENKUljE_clEj+0x1bbd>
  40c14e:	and    $0x1,%r10d
  40c152:	mov    %rsi,%rdx
  40c155:	jne    40bfb0 <_ZZ4mainENKUljE_clEj+0x1ab0>
  40c15b:	cmp    $0x20,%r9
  40c15f:	jne    40bfb0 <_ZZ4mainENKUljE_clEj+0x1ab0>
  40c165:	xor    %ecx,%ecx
  40c167:	lea    0x1(%rcx,%rcx,1),%rax
  40c16c:	shl    $0x4,%rax
  40c170:	add    %rsi,%rax
  40c173:	mov    (%rax),%r9
  40c176:	mov    0x8(%rax),%eax
  40c179:	mov    %r9,(%rdx)
  40c17c:	mov    %eax,0x8(%rdx)
  40c17f:	mov    %rcx,%rax
  40c182:	lea    0x1(%rcx,%rcx,1),%rcx
  40c187:	jmp    40bf8b <_ZZ4mainENKUljE_clEj+0x1a8b>
  40c18c:	and    $0x1,%r10d
  40c190:	mov    %rsi,%rdx
  40c193:	jne    40bc83 <_ZZ4mainENKUljE_clEj+0x1783>
  40c199:	cmp    $0x20,%r9
  40c19d:	jne    40bc83 <_ZZ4mainENKUljE_clEj+0x1783>
  40c1a3:	xor    %ecx,%ecx
  40c1a5:	lea    0x1(%rcx,%rcx,1),%rax
  40c1aa:	shl    $0x4,%rax
  40c1ae:	add    %rsi,%rax
  40c1b1:	mov    (%rax),%r9
  40c1b4:	mov    0x8(%rax),%eax
  40c1b7:	mov    %r9,(%rdx)
  40c1ba:	mov    %eax,0x8(%rdx)
  40c1bd:	mov    %rcx,%rax
  40c1c0:	lea    0x1(%rcx,%rcx,1),%rcx
  40c1c5:	jmp    40bc5b <_ZZ4mainENKUljE_clEj+0x175b>
  40c1ca:	movabs $0x4000000000000000,%rax
  40c1d4:	cmp    %rax,%rbp
  40c1d7:	cmova  %rax,%rbp
  40c1db:	movabs $0x3fffffffffffffff,%rax
  40c1e5:	mov    %rbp,%r15
  40c1e8:	cmp    %rbp,%rax
  40c1eb:	jae    40b66c <_ZZ4mainENKUljE_clEj+0x116c>
  40c1f1:	mov    $0xffffffffffffffff,%r15
  40c1f8:	jmp    40b66c <_ZZ4mainENKUljE_clEj+0x116c>
  40c1fd:	xor    %r15d,%r15d
  40c200:	jmp    40b66c <_ZZ4mainENKUljE_clEj+0x116c>
  40c205:	mov    0xe8(%rsp),%rdx
  40c20d:	sub    0xe0(%rsp),%rdx
  40c215:	mov    $0xffffffffffffffff,%rax
  40c21c:	shl    $0x7,%rdx
  40c220:	add    0xf8(%rsp),%rdx
  40c228:	lea    0x8(%rdx),%rdi
  40c22c:	mov    %rdx,%rcx
  40c22f:	movq   $0xffffffffffffffff,(%rdx)
  40c236:	movq   $0xffffffffffffffff,0x1f8(%rdx)
  40c241:	and    $0xfffffffffffffff8,%rdi
  40c245:	sub    %rdi,%rcx
  40c248:	add    $0x200,%ecx
  40c24e:	shr    $0x3,%ecx
  40c251:	rep stos %rax,%es:(%rdi)
  40c254:	mov    %rdx,(%r8)
  40c257:	lea    0xe0(%rsp),%rdi
  40c25f:	mov    %esi,0xa4(%rsp)
  40c266:	lea    0xa4(%rsp),%rsi
  40c26e:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c273:	mov    0xc8(%rsp),%rax
  40c27b:	mov    (%rax,%rbx,8),%rax
  40c27f:	jmp    40a9dd <_ZZ4mainENKUljE_clEj+0x4dd>
  40c284:	mov    0x2398(%rsp),%rdx
  40c28c:	sub    0x2390(%rsp),%rdx
  40c294:	mov    $0xffffffffffffffff,%rax
  40c29b:	shl    $0x7,%rdx
  40c29f:	add    0x23a8(%rsp),%rdx
  40c2a7:	lea    0x8(%rdx),%rdi
  40c2ab:	mov    %rdx,%rcx
  40c2ae:	movq   $0xffffffffffffffff,(%rdx)
  40c2b5:	movq   $0xffffffffffffffff,0x1f8(%rdx)
  40c2c0:	and    $0xfffffffffffffff8,%rdi
  40c2c4:	sub    %rdi,%rcx
  40c2c7:	add    $0x200,%ecx
  40c2cd:	shr    $0x3,%ecx
  40c2d0:	rep stos %rax,%es:(%rdi)
  40c2d3:	mov    %rdx,(%r8)
  40c2d6:	lea    0x2390(%rsp),%rdi
  40c2de:	mov    %esi,0xa8(%rsp)
  40c2e5:	lea    0xa8(%rsp),%rsi
  40c2ed:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c2f2:	mov    0x2378(%rsp),%rax
  40c2fa:	mov    (%rax,%rbx,8),%rax
  40c2fe:	jmp    40ab5a <_ZZ4mainENKUljE_clEj+0x65a>
  40c303:	lea    0xc0(%rsp),%rax
  40c30b:	mov    $0x112e0,%edi
  40c310:	mov    %rax,0x70(%rsp)
  40c315:	call   40e260 <_Znwm>
  40c31a:	mov    %rax,%r13
  40c31d:	mov    0x80(%rsp),%rax
  40c325:	lea    0x40(%r13),%rbx
  40c329:	mov    (%rax),%rax
  40c32c:	mov    (%rax),%rax
  40c32f:	mov    (%rax),%r12d
  40c332:	mov    %rax,0x0(%r13)
  40c336:	movq   $0x0,0x8(%r13)
  40c33e:	mov    %r12d,%r14d
  40c341:	movq   $0x0,0x10(%r13)
  40c349:	shr    $0x8,%r14d
  40c34d:	movq   $0x0,0x18(%r13)
  40c355:	lea    0x1(%r14),%ebp
  40c359:	lea    0x0(,%rbp,8),%rdi
  40c361:	mov    %ebp,0x8(%rsp)
  40c365:	call   40e260 <_Znwm>
  40c36a:	lea    (%rax,%rbp,8),%rsi
  40c36e:	mov    %rax,0x8(%r13)
  40c372:	mov    %rax,%rdx
  40c375:	mov    %rsi,0x18(%r13)
  40c379:	test   %r14d,%r14d
  40c37c:	je     40c3c9 <_ZZ4mainENKUljE_clEj+0x1ec9>
  40c37e:	mov    %rbp,%rdi
  40c381:	movq   %rbx,%xmm0
  40c386:	mov    0x8(%rsp),%r8d
  40c38b:	shr    $1,%rdi
  40c38e:	punpcklqdq %xmm0,%xmm0
  40c392:	shl    $0x4,%rdi
  40c396:	lea    (%rax,%rdi,1),%rcx
  40c39a:	and    $0x10,%edi
  40c39d:	je     40c3ab <_ZZ4mainENKUljE_clEj+0x1eab>
  40c39f:	movups %xmm0,(%rax)
  40c3a2:	lea    0x10(%rax),%rax
  40c3a6:	cmp    %rax,%rcx
  40c3a9:	je     40c3bb <_ZZ4mainENKUljE_clEj+0x1ebb>
  40c3ab:	movups %xmm0,(%rax)
  40c3ae:	add    $0x20,%rax
  40c3b2:	movups %xmm0,-0x10(%rax)
  40c3b6:	cmp    %rax,%rcx
  40c3b9:	jne    40c3ab <_ZZ4mainENKUljE_clEj+0x1eab>
  40c3bb:	and    $0x1,%r8d
  40c3bf:	je     40c3cc <_ZZ4mainENKUljE_clEj+0x1ecc>
  40c3c1:	and    $0xfffffffffffffffe,%rbp
  40c3c5:	lea    (%rdx,%rbp,8),%rdx
  40c3c9:	mov    %rbx,(%rdx)
  40c3cc:	mov    %rsi,0x10(%r13)
  40c3d0:	pxor   %xmm0,%xmm0
  40c3d4:	xor    %r9d,%r9d
  40c3d7:	mov    $0x4022,%ecx
  40c3dc:	lea    0x100(%r12),%eax
  40c3e4:	movq   $0x0,0x30(%r13)
  40c3ec:	mov    $0x3,%edx
  40c3f1:	xor    %edi,%edi
  40c3f3:	lea    0x40(,%rax,8),%r12
  40c3fb:	movups %xmm0,0x20(%r13)
  40c400:	mov    $0xffffffff,%r8d
  40c406:	mov    %r12,%rsi
  40c409:	call   455f90 <__mmap64>
  40c40e:	mov    $0xf,%edx
  40c413:	mov    %r12,%rsi
  40c416:	mov    %rax,%rdi
  40c419:	mov    %rax,%rbp
  40c41c:	call   455f60 <__madvise>
  40c421:	lea    0x840(%r13),%rdi
  40c428:	mov    %rbp,0x38(%r13)
  40c42c:	mov    %rbx,%rax
  40c42f:	cmp    %rdi,%rbx
  40c432:	je     40c467 <_ZZ4mainENKUljE_clEj+0x1f67>
  40c434:	movq   0xaff84(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c43c:	mov    %rdi,%rdx
  40c43f:	sub    %rbx,%rdx
  40c442:	and    $0x10,%edx
  40c445:	punpcklqdq %xmm0,%xmm0
  40c449:	je     40c457 <_ZZ4mainENKUljE_clEj+0x1f57>
  40c44b:	add    $0x10,%rax
  40c44f:	movups %xmm0,(%rbx)
  40c452:	cmp    %rax,%rdi
  40c455:	je     40c467 <_ZZ4mainENKUljE_clEj+0x1f67>
  40c457:	movups %xmm0,(%rax)
  40c45a:	add    $0x20,%rax
  40c45e:	movups %xmm0,-0x10(%rax)
  40c462:	cmp    %rax,%rdi
  40c465:	jne    40c457 <_ZZ4mainENKUljE_clEj+0x1f57>
  40c467:	mov    $0x8000,%edx
  40c46c:	xor    %esi,%esi
  40c46e:	lea    0x89b0(%r13),%rbx
  40c475:	call   401098 <_init+0x98>
  40c47a:	xor    %eax,%eax
  40c47c:	mov    $0x20,%ecx
  40c481:	pxor   %xmm0,%xmm0
  40c485:	lea    0x8840(%r13),%rdi
  40c48c:	rep stos %rax,%es:(%rdi)
  40c48f:	mov    0x80(%rsp),%rax
  40c497:	movq   $0x0,0x8960(%r13)
  40c4a2:	movups %xmm0,0x8940(%r13)
  40c4aa:	mov    0x8(%rax),%rax
  40c4ae:	movups %xmm0,0x8950(%r13)
  40c4b6:	mov    (%rax),%rax
  40c4b9:	mov    (%rax),%r12d
  40c4bc:	mov    %rax,0x8970(%r13)
  40c4c3:	movq   $0x0,0x8978(%r13)
  40c4ce:	movq   $0x0,0x8980(%r13)
  40c4d9:	mov    %r12d,%r14d
  40c4dc:	movq   $0x0,0x8988(%r13)
  40c4e7:	shr    $0x8,%r14d
  40c4eb:	lea    0x1(%r14),%ebp
  40c4ef:	lea    0x0(,%rbp,8),%rdi
  40c4f7:	mov    %ebp,0x8(%rsp)
  40c4fb:	call   40e260 <_Znwm>
  40c500:	lea    (%rax,%rbp,8),%rsi
  40c504:	test   %r14d,%r14d
  40c507:	mov    0x8(%rsp),%r8d
  40c50c:	mov    %rax,%rdx
  40c50f:	mov    %rax,0x8978(%r13)
  40c516:	mov    %rsi,0x8988(%r13)
  40c51d:	je     40c565 <_ZZ4mainENKUljE_clEj+0x2065>
  40c51f:	mov    %rbp,%rdi
  40c522:	movq   %rbx,%xmm0
  40c527:	shr    $1,%rdi
  40c52a:	punpcklqdq %xmm0,%xmm0
  40c52e:	shl    $0x4,%rdi
  40c532:	lea    (%rax,%rdi,1),%rcx
  40c536:	and    $0x10,%edi
  40c539:	je     40c547 <_ZZ4mainENKUljE_clEj+0x2047>
  40c53b:	movups %xmm0,(%rax)
  40c53e:	lea    0x10(%rax),%rax
  40c542:	cmp    %rax,%rcx
  40c545:	je     40c557 <_ZZ4mainENKUljE_clEj+0x2057>
  40c547:	movups %xmm0,(%rax)
  40c54a:	add    $0x20,%rax
  40c54e:	movups %xmm0,-0x10(%rax)
  40c552:	cmp    %rax,%rcx
  40c555:	jne    40c547 <_ZZ4mainENKUljE_clEj+0x2047>
  40c557:	and    $0x1,%r8d
  40c55b:	je     40c568 <_ZZ4mainENKUljE_clEj+0x2068>
  40c55d:	and    $0xfffffffffffffffe,%rbp
  40c561:	lea    (%rdx,%rbp,8),%rdx
  40c565:	mov    %rbx,(%rdx)
  40c568:	mov    %rsi,0x8980(%r13)
  40c56f:	pxor   %xmm0,%xmm0
  40c573:	xor    %r9d,%r9d
  40c576:	xor    %edi,%edi
  40c578:	mov    $0xffffffff,%r8d
  40c57e:	mov    $0x4022,%ecx
  40c583:	mov    $0x3,%edx
  40c588:	movq   $0x0,0x89a0(%r13)
  40c593:	lea    0x100(%r12),%eax
  40c59b:	movups %xmm0,0x8990(%r13)
  40c5a3:	lea    0x40(,%rax,8),%r12
  40c5ab:	mov    %r12,%rsi
  40c5ae:	call   455f90 <__mmap64>
  40c5b3:	mov    $0xf,%edx
  40c5b8:	mov    %r12,%rsi
  40c5bb:	mov    %rax,%rdi
  40c5be:	mov    %rax,%rbp
  40c5c1:	call   455f60 <__madvise>
  40c5c6:	lea    0x91b0(%r13),%rdi
  40c5cd:	mov    %rbp,0x89a8(%r13)
  40c5d4:	mov    %rbx,%rax
  40c5d7:	cmp    %rdi,%rbx
  40c5da:	je     40c60f <_ZZ4mainENKUljE_clEj+0x210f>
  40c5dc:	movq   0xafddc(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c5e4:	mov    %rdi,%rdx
  40c5e7:	sub    %rbx,%rdx
  40c5ea:	and    $0x10,%edx
  40c5ed:	punpcklqdq %xmm0,%xmm0
  40c5f1:	je     40c5ff <_ZZ4mainENKUljE_clEj+0x20ff>
  40c5f3:	add    $0x10,%rax
  40c5f7:	movups %xmm0,(%rbx)
  40c5fa:	cmp    %rax,%rdi
  40c5fd:	je     40c60f <_ZZ4mainENKUljE_clEj+0x210f>
  40c5ff:	movups %xmm0,(%rax)
  40c602:	add    $0x20,%rax
  40c606:	movups %xmm0,-0x10(%rax)
  40c60a:	cmp    %rax,%rdi
  40c60d:	jne    40c5ff <_ZZ4mainENKUljE_clEj+0x20ff>
  40c60f:	mov    $0x8000,%edx
  40c614:	xor    %esi,%esi
  40c616:	call   401098 <_init+0x98>
  40c61b:	pxor   %xmm0,%xmm0
  40c61f:	mov    $0x20,%ecx
  40c624:	xor    %eax,%eax
  40c626:	lea    0x111b0(%r13),%rdi
  40c62d:	rep stos %rax,%es:(%rdi)
  40c630:	movups %xmm0,0x112b0(%r13)
  40c638:	movq   $0x0,0x112d0(%r13)
  40c643:	movups %xmm0,0x112c0(%r13)
  40c64b:	jmp    40b6a3 <_ZZ4mainENKUljE_clEj+0x11a3>
  40c650:	movabs $0x4000000000000000,%r12
  40c65a:	jmp    40bd2f <_ZZ4mainENKUljE_clEj+0x182f>
  40c65f:	mov    0x4600(%rsp),%rdi
  40c667:	test   %rdi,%rdi
  40c66a:	je     40c67c <_ZZ4mainENKUljE_clEj+0x217c>
  40c66c:	mov    0x4610(%rsp),%rsi
  40c674:	sub    %rdi,%rsi
  40c677:	call   40e190 <_ZdlPvm>
  40c67c:	mov    0x2390(%rsp),%rdi
  40c684:	test   %rdi,%rdi
  40c687:	je     40c699 <_ZZ4mainENKUljE_clEj+0x2199>
  40c689:	mov    0x23a0(%rsp),%rsi
  40c691:	sub    %rdi,%rsi
  40c694:	call   40e190 <_ZdlPvm>
  40c699:	mov    0x2378(%rsp),%rdi
  40c6a1:	test   %rdi,%rdi
  40c6a4:	je     40c6b6 <_ZZ4mainENKUljE_clEj+0x21b6>
  40c6a6:	mov    0x2388(%rsp),%rsi
  40c6ae:	sub    %rdi,%rsi
  40c6b1:	call   40e190 <_ZdlPvm>
  40c6b6:	mov    0x2350(%rsp),%rdi
  40c6be:	test   %rdi,%rdi
  40c6c1:	je     40c6d3 <_ZZ4mainENKUljE_clEj+0x21d3>
  40c6c3:	mov    0x2360(%rsp),%rsi
  40c6cb:	sub    %rdi,%rsi
  40c6ce:	call   40e190 <_ZdlPvm>
  40c6d3:	mov    0xe0(%rsp),%rdi
  40c6db:	test   %rdi,%rdi
  40c6de:	je     40c6f0 <_ZZ4mainENKUljE_clEj+0x21f0>
  40c6e0:	mov    0xf0(%rsp),%rsi
  40c6e8:	sub    %rdi,%rsi
  40c6eb:	call   40e190 <_ZdlPvm>
  40c6f0:	mov    0xc8(%rsp),%rdi
  40c6f8:	test   %rdi,%rdi
  40c6fb:	je     40c70d <_ZZ4mainENKUljE_clEj+0x220d>
  40c6fd:	mov    0xd8(%rsp),%rsi
  40c705:	sub    %rdi,%rsi
  40c708:	call   40e190 <_ZdlPvm>
  40c70d:	add    $0x4628,%rsp
  40c714:	pop    %rbx
  40c715:	pop    %rbp
  40c716:	pop    %r12
  40c718:	pop    %r13
  40c71a:	pop    %r14
  40c71c:	pop    %r15
  40c71e:	ret
  40c71f:	mov    $0x10,%edx
  40c724:	add    %eax,%eax
  40c726:	cmp    %edx,%eax
  40c728:	cmovb  %edx,%eax
  40c72b:	lea    0x0(,%rax,4),%esi
  40c732:	mov    %eax,0x30c(%rsp)
  40c739:	call   442cc0 <__libc_realloc>
  40c73e:	mov    %rax,0x300(%rsp)
  40c746:	mov    %rax,%rdi
  40c749:	mov    0x308(%rsp),%eax
  40c750:	jmp    40aa07 <_ZZ4mainENKUljE_clEj+0x507>
  40c755:	mov    $0x10,%edx
  40c75a:	add    %eax,%eax
  40c75c:	cmp    %edx,%eax
  40c75e:	cmovb  %edx,%eax
  40c761:	lea    0x0(,%rax,4),%esi
  40c768:	mov    %eax,0x25bc(%rsp)
  40c76f:	call   442cc0 <__libc_realloc>
  40c774:	mov    %rax,0x25b0(%rsp)
  40c77c:	mov    %rax,%rdi
  40c77f:	mov    0x25b8(%rsp),%eax
  40c786:	jmp    40ab81 <_ZZ4mainENKUljE_clEj+0x681>
  40c78b:	mov    0x112c8(%r13),%r12
  40c792:	mov    0x112d0(%r13),%rcx
  40c799:	mov    0x112c0(%r13),%rbp
  40c7a0:	cmp    %rcx,%r12
  40c7a3:	je     40cb7b <_ZZ4mainENKUljE_clEj+0x267b>
  40c7a9:	mov    0x7c(%rsp),%eax
  40c7ad:	lea    0x10(%r12),%r14
  40c7b2:	movq   $0x0,(%r12)
  40c7ba:	xor    %esi,%esi
  40c7bc:	mov    %eax,0x8(%r12)
  40c7c1:	mov    %r14,0x112c8(%r13)
  40c7c8:	mov    %r14,%rdx
  40c7cb:	sub    %rbp,%rdx
  40c7ce:	mov    %rdx,%rcx
  40c7d1:	lea    -0x10(%rbp,%rdx,1),%rax
  40c7d6:	sar    $0x4,%rcx
  40c7da:	lea    -0x1(%rcx),%rdi
  40c7de:	sub    $0x2,%rcx
  40c7e2:	sar    $1,%rcx
  40c7e5:	test   %rdi,%rdi
  40c7e8:	jle    40c80f <_ZZ4mainENKUljE_clEj+0x230f>
  40c7ea:	mov    %rcx,%rax
  40c7ed:	shl    $0x4,%rax
  40c7f1:	add    %rbp,%rax
  40c7f4:	mov    (%rax),%r9
  40c7f7:	cmp    %r9,%rsi
  40c7fa:	jb     40c81e <_ZZ4mainENKUljE_clEj+0x231e>
  40c7fc:	cmp    %rsi,%r9
  40c7ff:	je     40c9ff <_ZZ4mainENKUljE_clEj+0x24ff>
  40c805:	mov    %rdi,%rax
  40c808:	shl    $0x4,%rax
  40c80c:	add    %rbp,%rax
  40c80f:	mov    %rsi,(%rax)
  40c812:	mov    0x7c(%rsp),%esi
  40c816:	mov    %esi,0x8(%rax)
  40c819:	jmp    40b9f8 <_ZZ4mainENKUljE_clEj+0x14f8>
  40c81e:	mov    0x8(%rax),%r8d
  40c822:	mov    %rdi,%rdx
  40c825:	mov    %rcx,%rdi
  40c828:	shl    $0x4,%rdx
  40c82c:	mov    %r9,0x0(%rbp,%rdx,1)
  40c831:	mov    %r8d,0x8(%rbp,%rdx,1)
  40c836:	lea    -0x1(%rcx),%rdx
  40c83a:	shr    $0x3f,%rdx
  40c83e:	test   %rcx,%rcx
  40c841:	je     40c80f <_ZZ4mainENKUljE_clEj+0x230f>
  40c843:	lea    -0x1(%rdx,%rcx,1),%rcx
  40c848:	sar    $1,%rcx
  40c84b:	jmp    40c7ea <_ZZ4mainENKUljE_clEj+0x22ea>
  40c84d:	mov    0x8958(%r13),%rbp
  40c854:	mov    0x8960(%r13),%rcx
  40c85b:	mov    0x8950(%r13),%r12
  40c862:	cmp    %rcx,%rbp
  40c865:	je     40ca8f <_ZZ4mainENKUljE_clEj+0x258f>
  40c86b:	mov    0x88(%rsp),%eax
  40c872:	lea    0x10(%rbp),%r14
  40c876:	movq   $0x0,0x0(%rbp)
  40c87e:	xor    %esi,%esi
  40c880:	mov    %eax,0x8(%rbp)
  40c883:	mov    %r14,0x8958(%r13)
  40c88a:	mov    %r14,%rax
  40c88d:	sub    %r12,%rax
  40c890:	mov    %rax,%rcx
  40c893:	lea    -0x10(%r12,%rax,1),%rax
  40c898:	sar    $0x4,%rcx
  40c89c:	lea    -0x1(%rcx),%rdx
  40c8a0:	sub    $0x2,%rcx
  40c8a4:	sar    $1,%rcx
  40c8a7:	test   %rdx,%rdx
  40c8aa:	jle    40c8d1 <_ZZ4mainENKUljE_clEj+0x23d1>
  40c8ac:	mov    %rcx,%rax
  40c8af:	shl    $0x4,%rax
  40c8b3:	add    %r12,%rax
  40c8b6:	mov    (%rax),%r8
  40c8b9:	cmp    %r8,%rsi
  40c8bc:	jb     40c8e3 <_ZZ4mainENKUljE_clEj+0x23e3>
  40c8be:	cmp    %rsi,%r8
  40c8c1:	je     40c9ea <_ZZ4mainENKUljE_clEj+0x24ea>
  40c8c7:	mov    %rdx,%rax
  40c8ca:	shl    $0x4,%rax
  40c8ce:	add    %r12,%rax
  40c8d1:	mov    %rsi,(%rax)
  40c8d4:	mov    0x88(%rsp),%esi
  40c8db:	mov    %esi,0x8(%rax)
  40c8de:	jmp    40b882 <_ZZ4mainENKUljE_clEj+0x1382>
  40c8e3:	mov    0x8(%rax),%edi
  40c8e6:	shl    $0x4,%rdx
  40c8ea:	mov    %edi,0x8(%r12,%rdx,1)
  40c8ef:	lea    -0x1(%rcx),%rdi
  40c8f3:	mov    %r8,(%r12,%rdx,1)
  40c8f7:	shr    $0x3f,%rdi
  40c8fb:	mov    %rcx,%rdx
  40c8fe:	test   %rcx,%rcx
  40c901:	je     40c8d1 <_ZZ4mainENKUljE_clEj+0x23d1>
  40c903:	lea    -0x1(%rcx,%rdi,1),%rcx
  40c908:	sar    $1,%rcx
  40c90b:	jmp    40c8ac <_ZZ4mainENKUljE_clEj+0x23ac>
  40c90d:	mov    0x8998(%r13),%rdx
  40c914:	sub    0x8990(%r13),%rdx
  40c91b:	shl    $0x9,%rdx
  40c91f:	movdqa 0xafa99(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c927:	add    0x89a8(%r13),%rdx
  40c92e:	mov    %rdx,%rax
  40c931:	lea    0x800(%rdx),%rdi
  40c938:	movups %xmm0,(%rax)
  40c93b:	add    $0x20,%rax
  40c93f:	movups %xmm0,-0x10(%rax)
  40c943:	cmp    %rdi,%rax
  40c946:	jne    40c938 <_ZZ4mainENKUljE_clEj+0x2438>
  40c948:	mov    %rdx,(%rsi)
  40c94b:	lea    0xc0(%rsp),%rax
  40c953:	lea    0xb8(%rsp),%rsi
  40c95b:	lea    0x8990(%r13),%rdi
  40c962:	mov    %ecx,0xb8(%rsp)
  40c969:	mov    %rax,0x70(%rsp)
  40c96e:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c973:	mov    0x8978(%r13),%rax
  40c97a:	mov    (%rax,%rbp,8),%rax
  40c97e:	jmp    40b99b <_ZZ4mainENKUljE_clEj+0x149b>
  40c983:	mov    0x28(%r13),%rdx
  40c987:	sub    0x20(%r13),%rdx
  40c98b:	shl    $0x9,%rdx
  40c98f:	movdqa 0xafa29(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c997:	add    0x38(%r13),%rdx
  40c99b:	mov    %rdx,%rax
  40c99e:	lea    0x800(%rdx),%rdi
  40c9a5:	movups %xmm0,(%rax)
  40c9a8:	add    $0x20,%rax
  40c9ac:	movups %xmm0,-0x10(%rax)
  40c9b0:	cmp    %rax,%rdi
  40c9b3:	jne    40c9a5 <_ZZ4mainENKUljE_clEj+0x24a5>
  40c9b5:	mov    %rdx,(%rsi)
  40c9b8:	lea    0xc0(%rsp),%rax
  40c9c0:	lea    0xb4(%rsp),%rsi
  40c9c8:	lea    0x20(%r13),%rdi
  40c9cc:	mov    %ecx,0xb4(%rsp)
  40c9d3:	mov    %rax,0x70(%rsp)
  40c9d8:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c9dd:	mov    0x8(%r13),%rax
  40c9e1:	mov    (%rax,%rbp,8),%rax
  40c9e5:	jmp    40b81f <_ZZ4mainENKUljE_clEj+0x131f>
  40c9ea:	mov    0x8(%rax),%edi
  40c9ed:	cmp    %edi,0x88(%rsp)
  40c9f4:	jb     40c8e6 <_ZZ4mainENKUljE_clEj+0x23e6>
  40c9fa:	jmp    40c8c7 <_ZZ4mainENKUljE_clEj+0x23c7>
  40c9ff:	mov    0x8(%rax),%r8d
  40ca03:	cmp    %r8d,0x7c(%rsp)
  40ca08:	jb     40c822 <_ZZ4mainENKUljE_clEj+0x2322>
  40ca0e:	jmp    40c805 <_ZZ4mainENKUljE_clEj+0x2305>
  40ca13:	mov    $0x10,%edx
  40ca18:	add    %eax,%eax
  40ca1a:	cmp    %edx,%eax
  40ca1c:	cmovb  %edx,%eax
  40ca1f:	mov    %eax,0x91bc(%r13)
  40ca26:	lea    0x0(,%rax,4),%esi
  40ca2d:	call   442cc0 <__libc_realloc>
  40ca32:	mov    %rax,0x91b0(%r13)
  40ca39:	mov    %rax,%rdi
  40ca3c:	mov    0x91b8(%r13),%eax
  40ca43:	jmp    40b9d9 <_ZZ4mainENKUljE_clEj+0x14d9>
  40ca48:	mov    $0x10,%edx
  40ca4d:	add    %eax,%eax
  40ca4f:	cmp    %edx,%eax
  40ca51:	cmovb  %edx,%eax
  40ca54:	mov    %eax,0x84c(%r13)
  40ca5b:	lea    0x0(,%rax,4),%esi
  40ca62:	call   442cc0 <__libc_realloc>
  40ca67:	mov    %rax,0x840(%r13)
  40ca6e:	mov    %rax,%rdi
  40ca71:	mov    0x848(%r13),%eax
  40ca78:	jmp    40b860 <_ZZ4mainENKUljE_clEj+0x1360>
  40ca7d:	lea    0x100(%rsp),%rax
  40ca85:	mov    %rax,0x28(%rsp)
  40ca8a:	jmp    40a5bd <_ZZ4mainENKUljE_clEj+0xbd>
  40ca8f:	movabs $0x7ffffffffffffff,%rax
  40ca99:	mov    %rbp,%r14
  40ca9c:	sub    %r12,%r14
  40ca9f:	mov    %r14,%rdx
  40caa2:	sar    $0x4,%rdx
  40caa6:	cmp    %rax,%rdx
  40caa9:	je     401216 <_ZZ4mainENKUljE_clEj.cold+0x78>
  40caaf:	test   %rdx,%rdx
  40cab2:	mov    $0x1,%eax
  40cab7:	mov    %rcx,0x8(%rsp)
  40cabc:	cmovne %rdx,%rax
  40cac0:	add    %rdx,%rax
  40cac3:	movabs $0x7ffffffffffffff,%rdx
  40cacd:	cmp    %rdx,%rax
  40cad0:	cmova  %rdx,%rax
  40cad4:	shl    $0x4,%rax
  40cad8:	mov    %rax,%rbx
  40cadb:	lea    0xc0(%rsp),%rax
  40cae3:	mov    %rbx,%rdi
  40cae6:	mov    %rax,0x70(%rsp)
  40caeb:	call   40e260 <_Znwm>
  40caf0:	movq   $0x0,(%rax,%r14,1)
  40caf8:	mov    %rax,%r15
  40cafb:	cmp    %r12,%rbp
  40cafe:	mov    0x8(%rsp),%rcx
  40cb03:	mov    0x88(%rsp),%eax
  40cb0a:	mov    %eax,0x8(%r15,%r14,1)
  40cb0f:	je     40cc61 <_ZZ4mainENKUljE_clEj+0x2761>
  40cb15:	mov    %r15,%rdx
  40cb18:	mov    %r12,%rax
  40cb1b:	movdqu (%rax),%xmm0
  40cb1f:	add    $0x10,%rax
  40cb23:	add    $0x10,%rdx
  40cb27:	movups %xmm0,-0x10(%rdx)
  40cb2b:	cmp    %rax,%rbp
  40cb2e:	jne    40cb1b <_ZZ4mainENKUljE_clEj+0x261b>
  40cb30:	sub    %r12,%rbp
  40cb33:	add    %r15,%rbp
  40cb36:	lea    0x10(%rbp),%r14
  40cb3a:	test   %r12,%r12
  40cb3d:	je     40cb4d <_ZZ4mainENKUljE_clEj+0x264d>
  40cb3f:	mov    %rcx,%rsi
  40cb42:	mov    %r12,%rdi
  40cb45:	sub    %r12,%rsi
  40cb48:	call   40e190 <_ZdlPvm>
  40cb4d:	mov    0x8(%rbp),%eax
  40cb50:	add    %r15,%rbx
  40cb53:	mov    %r15,0x8950(%r13)
  40cb5a:	mov    %r15,%r12
  40cb5d:	mov    %r14,0x8958(%r13)
  40cb64:	mov    0x0(%rbp),%rsi
  40cb68:	mov    %rbx,0x8960(%r13)
  40cb6f:	mov    %eax,0x88(%rsp)
  40cb76:	jmp    40c88a <_ZZ4mainENKUljE_clEj+0x238a>
  40cb7b:	movabs $0x7ffffffffffffff,%rdx
  40cb85:	mov    %r12,%r14
  40cb88:	sub    %rbp,%r14
  40cb8b:	mov    %r14,%rax
  40cb8e:	sar    $0x4,%rax
  40cb92:	cmp    %rdx,%rax
  40cb95:	je     40122d <_ZZ4mainENKUljE_clEj.cold+0x8f>
  40cb9b:	test   %rax,%rax
  40cb9e:	mov    $0x1,%ebx
  40cba3:	mov    %rcx,0x8(%rsp)
  40cba8:	cmovne %rax,%rbx
  40cbac:	add    %rax,%rbx
  40cbaf:	movabs $0x7ffffffffffffff,%rax
  40cbb9:	cmp    %rax,%rbx
  40cbbc:	cmova  %rax,%rbx
  40cbc0:	lea    0xc0(%rsp),%rax
  40cbc8:	mov    %rax,0x70(%rsp)
  40cbcd:	shl    $0x4,%rbx
  40cbd1:	mov    %rbx,%rdi
  40cbd4:	call   40e260 <_Znwm>
  40cbd9:	movq   $0x0,(%rax,%r14,1)
  40cbe1:	mov    %rax,%r15
  40cbe4:	mov    0x7c(%rsp),%eax
  40cbe8:	cmp    %rbp,%r12
  40cbeb:	mov    0x8(%rsp),%rcx
  40cbf0:	mov    %eax,0x8(%r15,%r14,1)
  40cbf5:	je     40cc69 <_ZZ4mainENKUljE_clEj+0x2769>
  40cbf7:	mov    %r15,%rdx
  40cbfa:	mov    %rbp,%rax
  40cbfd:	movdqu (%rax),%xmm0
  40cc01:	add    $0x10,%rax
  40cc05:	add    $0x10,%rdx
  40cc09:	movups %xmm0,-0x10(%rdx)
  40cc0d:	cmp    %rax,%r12
  40cc10:	jne    40cbfd <_ZZ4mainENKUljE_clEj+0x26fd>
  40cc12:	mov    %r12,%rax
  40cc15:	sub    %rbp,%rax
  40cc18:	lea    (%r15,%rax,1),%r12
  40cc1c:	lea    0x10(%r12),%r14
  40cc21:	test   %rbp,%rbp
  40cc24:	je     40cc34 <_ZZ4mainENKUljE_clEj+0x2734>
  40cc26:	mov    %rcx,%rsi
  40cc29:	mov    %rbp,%rdi
  40cc2c:	sub    %rbp,%rsi
  40cc2f:	call   40e190 <_ZdlPvm>
  40cc34:	mov    0x8(%r12),%eax
  40cc39:	add    %r15,%rbx
  40cc3c:	mov    (%r12),%rsi
  40cc40:	mov    %r15,%rbp
  40cc43:	mov    %r15,0x112c0(%r13)
  40cc4a:	mov    %r14,0x112c8(%r13)
  40cc51:	mov    %rbx,0x112d0(%r13)
  40cc58:	mov    %eax,0x7c(%rsp)
  40cc5c:	jmp    40c7c8 <_ZZ4mainENKUljE_clEj+0x22c8>
  40cc61:	mov    %r15,%rbp
  40cc64:	jmp    40cb36 <_ZZ4mainENKUljE_clEj+0x2636>
  40cc69:	mov    %r15,%r12
  40cc6c:	jmp    40cc1c <_ZZ4mainENKUljE_clEj+0x271c>
  40cc6e:	mov    %rax,%rbx
  40cc71:	jmp    40119e <_ZZ4mainENKUljE_clEj.cold>
  40cc76:	mov    %rax,%rbx
  40cc79:	jmp    401201 <_ZZ4mainENKUljE_clEj.cold+0x63>
  40cc7e:	jmp    401244 <_ZZ4mainENKUljE_clEj.cold+0xa6>
  40cc83:	mov    %rax,%rbx
  40cc86:	jmp    4011c8 <_ZZ4mainENKUljE_clEj.cold+0x2a>

Disassembly of section .fini:
