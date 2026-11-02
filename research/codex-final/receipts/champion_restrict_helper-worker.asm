
work/bin/champion_restrict_helper_dbg:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

000000000040a520 <_ZZ4mainENKUljE_clEj>:
  40a520:	push   %r15
  40a522:	push   %r14
  40a524:	push   %r13
  40a526:	push   %r12
  40a528:	push   %rbp
  40a529:	push   %rbx
  40a52a:	sub    $0x4628,%rsp
  40a531:	mov    (%rdi),%rax
  40a534:	mov    %rdi,0x80(%rsp)
  40a53c:	mov    (%rax),%rax
  40a53f:	mov    (%rax),%r12d
  40a542:	mov    %rax,0xc0(%rsp)
  40a54a:	mov    %r12d,%r14d
  40a54d:	shr    $0x8,%r14d
  40a551:	lea    0x1(%r14),%ebx
  40a555:	lea    0x0(,%rbx,8),%rbp
  40a55d:	mov    %rbp,%rdi
  40a560:	call   40e2a0 <_Znwm>
  40a565:	add    %rax,%rbp
  40a568:	mov    %rax,0xc8(%rsp)
  40a570:	mov    %rax,%rdx
  40a573:	mov    %rbp,0xd8(%rsp)
  40a57b:	test   %r14d,%r14d
  40a57e:	je     40cab3 <_ZZ4mainENKUljE_clEj+0x2593>
  40a584:	mov    %rbx,%rsi
  40a587:	lea    0x100(%rsp),%rax
  40a58f:	mov    %rbx,%r13
  40a592:	shr    $1,%rsi
  40a595:	movq   %rax,%xmm0
  40a59a:	mov    %rax,0x28(%rsp)
  40a59f:	mov    %rdx,%rax
  40a5a2:	shl    $0x4,%rsi
  40a5a6:	punpcklqdq %xmm0,%xmm0
  40a5aa:	lea    (%rdx,%rsi,1),%rcx
  40a5ae:	and    $0x10,%esi
  40a5b1:	je     40a5bf <_ZZ4mainENKUljE_clEj+0x9f>
  40a5b3:	lea    0x10(%rdx),%rax
  40a5b7:	movups %xmm0,(%rdx)
  40a5ba:	cmp    %rax,%rcx
  40a5bd:	je     40a5cf <_ZZ4mainENKUljE_clEj+0xaf>
  40a5bf:	movups %xmm0,(%rax)
  40a5c2:	add    $0x20,%rax
  40a5c6:	movups %xmm0,-0x10(%rax)
  40a5ca:	cmp    %rax,%rcx
  40a5cd:	jne    40a5bf <_ZZ4mainENKUljE_clEj+0x9f>
  40a5cf:	and    $0x1,%r13d
  40a5d3:	je     40a5e5 <_ZZ4mainENKUljE_clEj+0xc5>
  40a5d5:	and    $0xfffffffffffffffe,%rbx
  40a5d9:	lea    (%rdx,%rbx,8),%rdx
  40a5dd:	mov    0x28(%rsp),%rax
  40a5e2:	mov    %rax,(%rdx)
  40a5e5:	pxor   %xmm1,%xmm1
  40a5e9:	mov    $0x4022,%ecx
  40a5ee:	xor    %r9d,%r9d
  40a5f1:	xor    %edi,%edi
  40a5f3:	lea    0x100(%r12),%eax
  40a5fb:	mov    $0xffffffff,%r8d
  40a601:	mov    %rbp,0xd0(%rsp)
  40a609:	mov    $0x3,%edx
  40a60e:	lea    0x40(%rax,%rax,1),%rbp
  40a613:	movaps %xmm1,0xe0(%rsp)
  40a61b:	movq   $0x0,0xf0(%rsp)
  40a627:	mov    %rbp,%rsi
  40a62a:	call   455fd0 <__mmap64>
  40a62f:	mov    %rbp,%rsi
  40a632:	mov    $0xf,%edx
  40a637:	mov    %rax,%rdi
  40a63a:	mov    %rax,%rbx
  40a63d:	call   455fa0 <__madvise>
  40a642:	mov    0x28(%rsp),%rdi
  40a647:	mov    $0xffffffffffffffff,%rax
  40a64e:	mov    $0x40,%ecx
  40a653:	mov    %rbx,0xf8(%rsp)
  40a65b:	pxor   %xmm0,%xmm0
  40a65f:	pxor   %xmm1,%xmm1
  40a663:	rep stos %rax,%es:(%rdi)
  40a666:	lea    0x300(%rsp),%rdi
  40a66e:	movq   $0x0,0x2360(%rsp)
  40a67a:	movaps %xmm0,0x2300(%rsp)
  40a682:	movaps %xmm0,0x2310(%rsp)
  40a68a:	movaps %xmm0,0x2320(%rsp)
  40a692:	movaps %xmm0,0x2330(%rsp)
  40a69a:	movaps %xmm1,0x2340(%rsp)
  40a6a2:	mov    %rcx,%rax
  40a6a5:	mov    $0x400,%ecx
  40a6aa:	movaps %xmm1,0x2350(%rsp)
  40a6b2:	rep stos %rax,%es:(%rdi)
  40a6b5:	mov    0x80(%rsp),%rax
  40a6bd:	mov    0x8(%rax),%rax
  40a6c1:	mov    (%rax),%rax
  40a6c4:	mov    (%rax),%r12d
  40a6c7:	mov    %rax,0x2370(%rsp)
  40a6cf:	mov    %r12d,%r14d
  40a6d2:	shr    $0x8,%r14d
  40a6d6:	lea    0x1(%r14),%ebx
  40a6da:	lea    0x0(,%rbx,8),%rbp
  40a6e2:	mov    %rbx,%r13
  40a6e5:	mov    %rbp,%rdi
  40a6e8:	call   40e2a0 <_Znwm>
  40a6ed:	add    %rax,%rbp
  40a6f0:	mov    %rax,0x2378(%rsp)
  40a6f8:	mov    %rax,%rdx
  40a6fb:	lea    0x23b0(%rsp),%rax
  40a703:	mov    %rbp,0x2388(%rsp)
  40a70b:	mov    %rax,0x20(%rsp)
  40a710:	test   %r14d,%r14d
  40a713:	je     40a75e <_ZZ4mainENKUljE_clEj+0x23e>
  40a715:	mov    %rbx,%rsi
  40a718:	movq   %rax,%xmm0
  40a71d:	mov    %rdx,%rax
  40a720:	shr    $1,%rsi
  40a723:	punpcklqdq %xmm0,%xmm0
  40a727:	shl    $0x4,%rsi
  40a72b:	lea    (%rdx,%rsi,1),%rcx
  40a72f:	and    $0x10,%esi
  40a732:	je     40a740 <_ZZ4mainENKUljE_clEj+0x220>
  40a734:	lea    0x10(%rdx),%rax
  40a738:	movups %xmm0,(%rdx)
  40a73b:	cmp    %rax,%rcx
  40a73e:	je     40a750 <_ZZ4mainENKUljE_clEj+0x230>
  40a740:	movups %xmm0,(%rax)
  40a743:	add    $0x20,%rax
  40a747:	movups %xmm0,-0x10(%rax)
  40a74b:	cmp    %rax,%rcx
  40a74e:	jne    40a740 <_ZZ4mainENKUljE_clEj+0x220>
  40a750:	and    $0x1,%r13d
  40a754:	je     40a766 <_ZZ4mainENKUljE_clEj+0x246>
  40a756:	and    $0xfffffffffffffffe,%rbx
  40a75a:	lea    (%rdx,%rbx,8),%rdx
  40a75e:	mov    0x20(%rsp),%rax
  40a763:	mov    %rax,(%rdx)
  40a766:	lea    0x100(%r12),%eax
  40a76e:	xor    %r9d,%r9d
  40a771:	xor    %edi,%edi
  40a773:	xor    %r14d,%r14d
  40a776:	pxor   %xmm1,%xmm1
  40a77a:	mov    $0x4022,%ecx
  40a77f:	mov    $0x3,%edx
  40a784:	mov    %rbp,0x2380(%rsp)
  40a78c:	lea    0x40(%rax,%rax,1),%rbp
  40a791:	mov    $0xffffffff,%r8d
  40a797:	movaps %xmm1,0x2390(%rsp)
  40a79f:	movq   $0x0,0x23a0(%rsp)
  40a7ab:	mov    %rbp,%rsi
  40a7ae:	call   455fd0 <__mmap64>
  40a7b3:	mov    $0xf,%edx
  40a7b8:	mov    %rbp,%rsi
  40a7bb:	mov    %rax,%rdi
  40a7be:	mov    %rax,%rbx
  40a7c1:	call   455fa0 <__madvise>
  40a7c6:	mov    0x20(%rsp),%rdi
  40a7cb:	mov    $0xffffffffffffffff,%rax
  40a7d2:	mov    $0x40,%ecx
  40a7d7:	mov    %rbx,0x23a8(%rsp)
  40a7df:	pxor   %xmm0,%xmm0
  40a7e3:	pxor   %xmm1,%xmm1
  40a7e7:	rep stos %rax,%es:(%rdi)
  40a7ea:	lea    0x25b0(%rsp),%rdi
  40a7f2:	movq   $0x0,0x4610(%rsp)
  40a7fe:	movaps %xmm0,0x45b0(%rsp)
  40a806:	movaps %xmm0,0x45c0(%rsp)
  40a80e:	movaps %xmm0,0x45d0(%rsp)
  40a816:	movaps %xmm0,0x45e0(%rsp)
  40a81e:	movaps %xmm1,0x45f0(%rsp)
  40a826:	mov    %rcx,%rax
  40a829:	mov    $0x400,%ecx
  40a82e:	movaps %xmm1,0x4600(%rsp)
  40a836:	rep stos %rax,%es:(%rdi)
  40a839:	mov    0x80(%rsp),%rdi
  40a841:	data16 cs nopw 0x0(%rax,%rax,1)
  40a84c:	nopl   0x0(%rax)
  40a850:	mov    0x10(%rdi),%rax
  40a854:	mov    $0x1,%edx
  40a859:	lock xadd %rdx,(%rax)
  40a85e:	mov    0x18(%rdi),%rax
  40a862:	cmp    (%rax),%rdx
  40a865:	jae    40c692 <_ZZ4mainENKUljE_clEj+0x2172>
  40a86b:	mov    0x80(%rsp),%rdi
  40a873:	mov    0x20(%rdi),%rax
  40a877:	mov    (%rax),%rax
  40a87a:	mov    (%rax,%rdx,4),%eax
  40a87d:	lea    (%rax,%rax,1),%ecx
  40a880:	mov    %eax,0x8c(%rsp)
  40a887:	mov    0x28(%rdi),%rax
  40a88b:	mov    %rcx,%rdx
  40a88e:	mov    (%rax),%rax
  40a891:	add    $0x1,%edx
  40a894:	mov    (%rax,%rcx,4),%edi
  40a897:	mov    (%rax,%rdx,4),%ebx
  40a89a:	mov    %edi,0x88(%rsp)
  40a8a1:	mov    %ebx,0x7c(%rsp)
  40a8a5:	cmp    %ebx,%edi
  40a8a7:	je     40c228 <_ZZ4mainENKUljE_clEj+0x1d08>
  40a8ad:	mov    0xc0(%rsp),%rax
  40a8b5:	mov    %edi,%esi
  40a8b7:	add    $0x1,%edi
  40a8ba:	mov    %rdi,0x98(%rsp)
  40a8c2:	mov    0x8(%rax),%rax
  40a8c6:	mov    %rsi,0x90(%rsp)
  40a8ce:	mov    (%rax,%rdi,4),%edi
  40a8d1:	cmp    %edi,(%rax,%rsi,4)
  40a8d4:	je     40b6d0 <_ZZ4mainENKUljE_clEj+0x11b0>
  40a8da:	mov    0x2370(%rsp),%rax
  40a8e2:	lea    0x1(%rbx),%ecx
  40a8e5:	mov    0x8(%rax),%rdx
  40a8e9:	mov    %ebx,%eax
  40a8eb:	mov    (%rdx,%rcx,4),%edi
  40a8ee:	cmp    %edi,(%rdx,%rax,4)
  40a8f1:	je     40b6d0 <_ZZ4mainENKUljE_clEj+0x11b0>
  40a8f7:	mov    0xe0(%rsp),%rdi
  40a8ff:	mov    0xe8(%rsp),%rcx
  40a907:	cmp    %rcx,%rdi
  40a90a:	je     40a937 <_ZZ4mainENKUljE_clEj+0x417>
  40a90c:	mov    0xc8(%rsp),%rsi
  40a914:	mov    0x28(%rsp),%r8
  40a919:	mov    %rdi,%rax
  40a91c:	nopl   0x0(%rax)
  40a920:	mov    (%rax),%edx
  40a922:	add    $0x4,%rax
  40a926:	mov    %r8,(%rsi,%rdx,8)
  40a92a:	cmp    %rax,%rcx
  40a92d:	jne    40a920 <_ZZ4mainENKUljE_clEj+0x400>
  40a92f:	mov    %rdi,0xe8(%rsp)
  40a937:	lea    0xc0(%rsp),%rax
  40a93f:	lea    0x2300(%rsp),%rsi
  40a947:	xor    %ecx,%ecx
  40a949:	mov    %rax,0x70(%rsp)
  40a94e:	lea    0x2340(%rsp),%rdi
  40a956:	cs nopw 0x0(%rax,%rax,1)
  40a960:	mov    (%rsi),%rax
  40a963:	test   %rax,%rax
  40a966:	je     40a9a3 <_ZZ4mainENKUljE_clEj+0x483>
  40a968:	data16 cs nopw 0x0(%rax,%rax,1)
  40a973:	data16 cs nopw 0x0(%rax,%rax,1)
  40a97e:	xchg   %ax,%ax
  40a980:	xor    %edx,%edx
  40a982:	tzcnt  %rax,%rdx
  40a987:	add    %ecx,%edx
  40a989:	mov    %edx,%edx
  40a98b:	shl    $0x4,%rdx
  40a98f:	movl   $0x0,0x308(%rsp,%rdx,1)
  40a99a:	lea    -0x1(%rax),%rdx
  40a99e:	and    %rdx,%rax
  40a9a1:	jne    40a980 <_ZZ4mainENKUljE_clEj+0x460>
  40a9a3:	movq   $0x0,(%rsi)
  40a9aa:	add    $0x8,%rsi
  40a9ae:	add    $0x40,%ecx
  40a9b1:	cmp    %rdi,%rsi
  40a9b4:	jne    40a960 <_ZZ4mainENKUljE_clEj+0x440>
  40a9b6:	mov    0x2350(%rsp),%rdi
  40a9be:	pxor   %xmm0,%xmm0
  40a9c2:	mov    0x2360(%rsp),%rsi
  40a9ca:	movq   $0x0,0x2360(%rsp)
  40a9d6:	movaps %xmm0,0x2350(%rsp)
  40a9de:	test   %rdi,%rdi
  40a9e1:	je     40a9eb <_ZZ4mainENKUljE_clEj+0x4cb>
  40a9e3:	sub    %rdi,%rsi
  40a9e6:	call   40e1d0 <_ZdlPvm>
  40a9eb:	mov    0x88(%rsp),%esi
  40a9f2:	mov    0xc8(%rsp),%rax
  40a9fa:	pxor   %xmm0,%xmm0
  40a9fe:	movaps %xmm0,0x2340(%rsp)
  40aa06:	shr    $0x8,%esi
  40aa09:	mov    %esi,%ebx
  40aa0b:	lea    (%rax,%rbx,8),%r8
  40aa0f:	mov    (%r8),%rax
  40aa12:	cmp    0x28(%rsp),%rax
  40aa17:	je     40c22f <_ZZ4mainENKUljE_clEj+0x1d0f>
  40aa1d:	movzbl 0x88(%rsp),%edx
  40aa25:	xor    %esi,%esi
  40aa27:	mov    0x300(%rsp),%rdi
  40aa2f:	mov    %si,(%rax,%rdx,2)
  40aa33:	mov    0x308(%rsp),%eax
  40aa3a:	cmp    0x30c(%rsp),%eax
  40aa41:	je     40c752 <_ZZ4mainENKUljE_clEj+0x2232>
  40aa47:	mov    0x88(%rsp),%ebx
  40aa4e:	mov    0x2398(%rsp),%rcx
  40aa56:	mov    %ebx,(%rdi,%rax,4)
  40aa59:	mov    0x2390(%rsp),%rdi
  40aa61:	addl   $0x1,0x308(%rsp)
  40aa69:	addq   $0x1,0x2348(%rsp)
  40aa72:	orq    $0x1,0x2300(%rsp)
  40aa7b:	cmp    %rcx,%rdi
  40aa7e:	je     40aaa7 <_ZZ4mainENKUljE_clEj+0x587>
  40aa80:	mov    0x2378(%rsp),%rsi
  40aa88:	mov    0x20(%rsp),%r8
  40aa8d:	mov    %rdi,%rax
  40aa90:	mov    (%rax),%edx
  40aa92:	add    $0x4,%rax
  40aa96:	mov    %r8,(%rsi,%rdx,8)
  40aa9a:	cmp    %rax,%rcx
  40aa9d:	jne    40aa90 <_ZZ4mainENKUljE_clEj+0x570>
  40aa9f:	mov    %rdi,0x2398(%rsp)
  40aaa7:	mov    0x70(%rsp),%rax
  40aaac:	xor    %ecx,%ecx
  40aaae:	lea    0x44f0(%rax),%rsi
  40aab5:	lea    0x4530(%rax),%rdi
  40aabc:	nopl   0x0(%rax)
  40aac0:	mov    (%rsi),%rax
  40aac3:	test   %rax,%rax
  40aac6:	je     40ab23 <_ZZ4mainENKUljE_clEj+0x603>
  40aac8:	data16 cs nopw 0x0(%rax,%rax,1)
  40aad3:	data16 cs nopw 0x0(%rax,%rax,1)
  40aade:	data16 cs nopw 0x0(%rax,%rax,1)
  40aae9:	data16 cs nopw 0x0(%rax,%rax,1)
  40aaf4:	data16 cs nopw 0x0(%rax,%rax,1)
  40aaff:	nop
  40ab00:	xor    %edx,%edx
  40ab02:	tzcnt  %rax,%rdx
  40ab07:	add    %ecx,%edx
  40ab09:	mov    %edx,%edx
  40ab0b:	shl    $0x4,%rdx
  40ab0f:	movl   $0x0,0x25b8(%rsp,%rdx,1)
  40ab1a:	lea    -0x1(%rax),%rdx
  40ab1e:	and    %rdx,%rax
  40ab21:	jne    40ab00 <_ZZ4mainENKUljE_clEj+0x5e0>
  40ab23:	movq   $0x0,(%rsi)
  40ab2a:	add    $0x8,%rsi
  40ab2e:	add    $0x40,%ecx
  40ab31:	cmp    %rdi,%rsi
  40ab34:	jne    40aac0 <_ZZ4mainENKUljE_clEj+0x5a0>
  40ab36:	mov    0x4600(%rsp),%rdi
  40ab3e:	pxor   %xmm0,%xmm0
  40ab42:	mov    0x4610(%rsp),%rsi
  40ab4a:	movq   $0x0,0x4610(%rsp)
  40ab56:	movaps %xmm0,0x4600(%rsp)
  40ab5e:	test   %rdi,%rdi
  40ab61:	je     40ab6b <_ZZ4mainENKUljE_clEj+0x64b>
  40ab63:	sub    %rdi,%rsi
  40ab66:	call   40e1d0 <_ZdlPvm>
  40ab6b:	mov    0x7c(%rsp),%esi
  40ab6f:	mov    0x2378(%rsp),%rax
  40ab77:	pxor   %xmm0,%xmm0
  40ab7b:	movaps %xmm0,0x45f0(%rsp)
  40ab83:	shr    $0x8,%esi
  40ab86:	mov    %esi,%ebx
  40ab88:	lea    (%rax,%rbx,8),%r8
  40ab8c:	mov    (%r8),%rax
  40ab8f:	cmp    0x20(%rsp),%rax
  40ab94:	je     40c2ae <_ZZ4mainENKUljE_clEj+0x1d8e>
  40ab9a:	movzbl 0x7c(%rsp),%edx
  40ab9f:	xor    %ecx,%ecx
  40aba1:	mov    0x25b0(%rsp),%rdi
  40aba9:	mov    %cx,(%rax,%rdx,2)
  40abad:	mov    0x25b8(%rsp),%eax
  40abb4:	cmp    0x25bc(%rsp),%eax
  40abbb:	je     40c788 <_ZZ4mainENKUljE_clEj+0x2268>
  40abc1:	mov    0x7c(%rsp),%ebx
  40abc5:	mov    0x2348(%rsp),%rdx
  40abcd:	movabs $0x4000000000000000,%r10
  40abd7:	mov    %ebx,(%rdi,%rax,4)
  40abda:	mov    0x45f8(%rsp),%rax
  40abe2:	addl   $0x1,0x25b8(%rsp)
  40abea:	orq    $0x1,0x45b0(%rsp)
  40abf3:	add    $0x1,%rax
  40abf7:	mov    %rax,0x45f8(%rsp)
  40abff:	nop
  40ac00:	movabs $0x4000000000000000,%r8
  40ac0a:	test   %rdx,%rdx
  40ac0d:	je     40acf2 <_ZZ4mainENKUljE_clEj+0x7d2>
  40ac13:	mov    0x2340(%rsp),%rcx
  40ac1b:	mov    $0xffffffffffffffff,%rbx
  40ac22:	mov    %ecx,%esi
  40ac24:	shl    %cl,%rbx
  40ac27:	shr    $0x6,%esi
  40ac2a:	mov    %rbx,%rcx
  40ac2d:	mov    %esi,%edi
  40ac2f:	and    $0x7,%esi
  40ac32:	and    $0x7,%edi
  40ac35:	and    0x2300(%rsp,%rsi,8),%rcx
  40ac3d:	jne    40b6c2 <_ZZ4mainENKUljE_clEj+0x11a2>
  40ac43:	lea    0x1(%rdi),%ecx
  40ac46:	mov    %rcx,%rsi
  40ac49:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac51:	test   %rcx,%rcx
  40ac54:	jne    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40ac5a:	lea    0x2(%rdi),%ecx
  40ac5d:	mov    %rcx,%rsi
  40ac60:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac68:	test   %rcx,%rcx
  40ac6b:	jne    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40ac6d:	lea    0x3(%rdi),%ecx
  40ac70:	mov    %rcx,%rsi
  40ac73:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac7b:	test   %rcx,%rcx
  40ac7e:	jne    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40ac80:	lea    0x4(%rdi),%ecx
  40ac83:	mov    %rcx,%rsi
  40ac86:	mov    0x2300(%rsp,%rcx,8),%rcx
  40ac8e:	test   %rcx,%rcx
  40ac91:	jne    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40ac93:	lea    0x5(%rdi),%ecx
  40ac96:	mov    %rcx,%rsi
  40ac99:	mov    0x2300(%rsp,%rcx,8),%rcx
  40aca1:	test   %rcx,%rcx
  40aca4:	jne    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40aca6:	lea    0x6(%rdi),%ecx
  40aca9:	mov    %rcx,%rsi
  40acac:	mov    0x2300(%rsp,%rcx,8),%rcx
  40acb4:	test   %rcx,%rcx
  40acb7:	jne    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40acb9:	lea    0x7(%rdi),%ecx
  40acbc:	mov    %rcx,%rsi
  40acbf:	mov    0x2300(%rsp,%rcx,8),%rcx
  40acc7:	test   %rcx,%rcx
  40acca:	jne    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40accc:	lea    0x8(%rdi),%ecx
  40accf:	mov    %rcx,%rsi
  40acd2:	mov    0x2300(%rsp,%rcx,8),%rcx
  40acda:	tzcnt  %rcx,%rcx
  40acdf:	shl    $0x6,%esi
  40ace2:	lea    (%rsi,%rcx,1),%r8d
  40ace6:	mov    %r8,0x2340(%rsp)
  40acee:	shl    $0x7,%r8
  40acf2:	test   %rax,%rax
  40acf5:	je     40b690 <_ZZ4mainENKUljE_clEj+0x1170>
  40acfb:	mov    0x45f0(%rsp),%rcx
  40ad03:	mov    $0xffffffffffffffff,%rbx
  40ad0a:	mov    %ecx,%esi
  40ad0c:	shl    %cl,%rbx
  40ad0f:	shr    $0x6,%esi
  40ad12:	mov    %rbx,%rcx
  40ad15:	mov    %esi,%edi
  40ad17:	and    $0x7,%esi
  40ad1a:	and    $0x7,%edi
  40ad1d:	and    0x45b0(%rsp,%rsi,8),%rcx
  40ad25:	jne    40b6bb <_ZZ4mainENKUljE_clEj+0x119b>
  40ad2b:	lea    0x1(%rdi),%ecx
  40ad2e:	mov    %rcx,%rsi
  40ad31:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad39:	test   %rcx,%rcx
  40ad3c:	jne    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40ad42:	lea    0x2(%rdi),%ecx
  40ad45:	mov    %rcx,%rsi
  40ad48:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad50:	test   %rcx,%rcx
  40ad53:	jne    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40ad55:	lea    0x3(%rdi),%ecx
  40ad58:	mov    %rcx,%rsi
  40ad5b:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad63:	test   %rcx,%rcx
  40ad66:	jne    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40ad68:	lea    0x4(%rdi),%ecx
  40ad6b:	mov    %rcx,%rsi
  40ad6e:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad76:	test   %rcx,%rcx
  40ad79:	jne    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40ad7b:	lea    0x5(%rdi),%ecx
  40ad7e:	mov    %rcx,%rsi
  40ad81:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad89:	test   %rcx,%rcx
  40ad8c:	jne    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40ad8e:	lea    0x6(%rdi),%ecx
  40ad91:	mov    %rcx,%rsi
  40ad94:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40ad9c:	test   %rcx,%rcx
  40ad9f:	jne    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40ada1:	lea    0x7(%rdi),%ecx
  40ada4:	mov    %rcx,%rsi
  40ada7:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40adaf:	test   %rcx,%rcx
  40adb2:	jne    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40adb4:	lea    0x8(%rdi),%ecx
  40adb7:	mov    %rcx,%rsi
  40adba:	mov    0x45b0(%rsp,%rcx,8),%rcx
  40adc2:	tzcnt  %rcx,%rcx
  40adc7:	shl    $0x6,%esi
  40adca:	lea    (%rcx,%rsi,1),%edi
  40adcd:	movabs $0x4000000000000000,%rsi
  40add7:	mov    %rdi,0x45f0(%rsp)
  40addf:	mov    %rdi,%rcx
  40ade2:	cmp    %rsi,%r8
  40ade5:	je     40b690 <_ZZ4mainENKUljE_clEj+0x1170>
  40adeb:	mov    %rdi,%rsi
  40adee:	shl    $0x7,%rsi
  40adf2:	add    %r8,%rsi
  40adf5:	cmp    %r10,%rsi
  40adf8:	jae    40b690 <_ZZ4mainENKUljE_clEj+0x1170>
  40adfe:	cmp    %rdx,%rax
  40ae01:	jb     40b250 <_ZZ4mainENKUljE_clEj+0xd30>
  40ae07:	mov    0x2340(%rsp),%rcx
  40ae0f:	mov    %rcx,%rsi
  40ae12:	and    $0x1ff,%esi
  40ae18:	lea    0x24(%rsi),%rdi
  40ae1c:	mov    %rdi,%rsi
  40ae1f:	mov    %rdi,0x68(%rsp)
  40ae24:	shl    $0x4,%rsi
  40ae28:	mov    0xc8(%rsp,%rsi,1),%r8d
  40ae30:	lea    0x4620(%rsp,%rsi,1),%rdi
  40ae38:	mov    %rdi,0x30(%rsp)
  40ae3d:	test   %r8d,%r8d
  40ae40:	je     40b206 <_ZZ4mainENKUljE_clEj+0xce6>
  40ae46:	movq   $0x0,(%rsp)
  40ae4e:	jmp    40ae5f <_ZZ4mainENKUljE_clEj+0x93f>
  40ae50:	addq   $0x1,(%rsp)
  40ae55:	cmp    %r8d,(%rsp)
  40ae59:	jae    40b1f3 <_ZZ4mainENKUljE_clEj+0xcd3>
  40ae5f:	mov    (%rsp),%r15
  40ae63:	mov    0x30(%rsp),%rax
  40ae68:	lea    -0x1(%r8),%esi
  40ae6c:	mov    0xc0(%rsp),%rbx
  40ae74:	mov    -0x4560(%rax),%rdi
  40ae7b:	lea    0x8(%r15),%eax
  40ae7f:	cmp    %esi,%eax
  40ae81:	mov    0x8(%rbx),%r9
  40ae85:	mov    0x10(%rbx),%rbx
  40ae89:	cmova  %esi,%eax
  40ae8c:	mov    (%rdi,%rax,4),%edx
  40ae8f:	mov    %edx,%eax
  40ae91:	mov    %rdx,%r11
  40ae94:	movzbl %dl,%edx
  40ae97:	and    $0x1ffffff,%eax
  40ae9c:	shl    $0x27,%r11
  40aea0:	prefetcht0 (%r9,%rax,4)
  40aea5:	mov    0xc8(%rsp),%rax
  40aead:	shr    $0x2f,%r11
  40aeb1:	mov    (%rax,%r11,8),%r11
  40aeb5:	prefetcht0 (%r11,%rdx,2)
  40aeba:	lea    0x4(%r15),%edx
  40aebe:	mov    %rbx,0x8(%rsp)
  40aec3:	cmp    %esi,%edx
  40aec5:	cmova  %esi,%edx
  40aec8:	mov    (%rdi,%rdx,4),%edx
  40aecb:	and    $0x1ffffff,%edx
  40aed1:	mov    (%r9,%rdx,4),%edx
  40aed5:	prefetcht0 (%rbx,%rdx,4)
  40aed9:	mov    (%rdi,%r15,4),%edx
  40aedd:	mov    %rcx,%rbx
  40aee0:	shl    $0x7,%rbx
  40aee4:	mov    %edx,%esi
  40aee6:	mov    %edx,%edi
  40aee8:	movzbl %dl,%edx
  40aeeb:	shr    $0x19,%edi
  40aeee:	and    $0x1ffffff,%esi
  40aef4:	or     %rdi,%rbx
  40aef7:	mov    %esi,%edi
  40aef9:	shr    $0x8,%edi
  40aefc:	mov    %rbx,0x10(%rsp)
  40af01:	mov    (%rax,%rdi,8),%rdi
  40af05:	movzwl (%rdi,%rdx,2),%edx
  40af09:	cmp    %rdx,%rbx
  40af0c:	jne    40ae50 <_ZZ4mainENKUljE_clEj+0x930>
  40af12:	mov    %esi,%edx
  40af14:	mov    (%r9,%rdx,4),%r13d
  40af18:	lea    0x1(%rsi),%edx
  40af1b:	lea    (%r9,%rdx,4),%rdi
  40af1f:	mov    %rdi,0x18(%rsp)
  40af24:	cmp    (%rdi),%r13d
  40af27:	jb     40affb <_ZZ4mainENKUljE_clEj+0xadb>
  40af2d:	jmp    40ae50 <_ZZ4mainENKUljE_clEj+0x930>
  40af32:	nopw   0x0(%rax,%rax,1)
  40af38:	movzwl (%rcx),%eax
  40af3b:	add    0x10(%rsp),%rbx
  40af40:	mov    %rbx,%r11
  40af43:	cmp    %rax,%rbx
  40af46:	mov    %rax,%rdx
  40af49:	cmovbe %rbx,%rdx
  40af4d:	setb   %bpl
  40af51:	shr    $0x7,%r11
  40af55:	mov    %r11,%r15
  40af58:	and    $0x1ff,%r15d
  40af5f:	mov    %dx,(%rcx)
  40af62:	mov    %r11d,%edx
  40af65:	mov    %r15,%rcx
  40af68:	and    $0x1ff,%edx
  40af6e:	shl    $0x4,%rcx
  40af72:	mov    0x308(%rsp,%rcx,1),%eax
  40af79:	mov    0x300(%rsp,%rcx,1),%rdi
  40af81:	cmp    0x30c(%rsp,%rcx,1),%eax
  40af88:	je     40b160 <_ZZ4mainENKUljE_clEj+0xc40>
  40af8e:	shl    $0x4,%r15
  40af92:	mov    %ebx,%ecx
  40af94:	shr    $0x6,%edx
  40af97:	shl    $0x19,%ecx
  40af9a:	or     %r12d,%ecx
  40af9d:	mov    %ecx,(%rdi,%rax,4)
  40afa0:	movzbl %bpl,%eax
  40afa4:	mov    %r11d,%ecx
  40afa7:	movzbl %bpl,%ebp
  40afab:	add    %eax,0x308(%rsp,%r15,1)
  40afb3:	mov    0x2378(%rsp),%rax
  40afbb:	add    %rbp,0x2348(%rsp)
  40afc3:	shl    %cl,%rbp
  40afc6:	mov    (%rax,%r8,8),%rax
  40afca:	or     %rbp,0x2300(%rsp,%rdx,8)
  40afd2:	movzwl (%rax,%r9,2),%eax
  40afd7:	add    %rbx,%rax
  40afda:	cmp    %rax,%r10
  40afdd:	cmova  %rax,%r10
  40afe1:	mov    0x18(%rsp),%rax
  40afe6:	add    $0x1,%r13
  40afea:	cmp    (%rax),%r13d
  40afed:	jae    40b1d0 <_ZZ4mainENKUljE_clEj+0xcb0>
  40aff3:	mov    0xc8(%rsp),%rax
  40affb:	mov    0x8(%rsp),%rbx
  40b000:	mov    (%rbx,%r13,4),%r12d
  40b004:	mov    %r12d,%esi
  40b007:	mov    %r12d,%ebx
  40b00a:	shr    $0x13,%esi
  40b00d:	mov    %esi,%r8d
  40b010:	lea    (%rax,%r8,8),%r9
  40b014:	mov    (%r9),%rax
  40b017:	cmp    0x28(%rsp),%rax
  40b01c:	je     40b0c0 <_ZZ4mainENKUljE_clEj+0xba0>
  40b022:	shr    $0xb,%r12d
  40b026:	and    $0x7ff,%ebx
  40b02c:	movzbl %r12b,%r9d
  40b030:	lea    (%rax,%r9,2),%rcx
  40b034:	cmp    $0x7ff,%ebx
  40b03a:	jne    40af38 <_ZZ4mainENKUljE_clEj+0xa18>
  40b040:	mov    0xc0(%rsp),%rax
  40b048:	mov    0x10(%rax),%rdx
  40b04c:	mov    (%rdx,%r13,4),%ebx
  40b050:	and    $0x7ff,%ebx
  40b056:	cmp    $0x7ff,%ebx
  40b05c:	jne    40af38 <_ZZ4mainENKUljE_clEj+0xa18>
  40b062:	mov    0x18(%rax),%rdi
  40b066:	mov    0x20(%rax),%rax
  40b06a:	sub    %rdi,%rax
  40b06d:	sar    $0x4,%rax
  40b071:	data16 cs nopw 0x0(%rax,%rax,1)
  40b07c:	nopl   0x0(%rax)
  40b080:	test   %rax,%rax
  40b083:	jle    40b0aa <_ZZ4mainENKUljE_clEj+0xb8a>
  40b085:	mov    %rax,%rsi
  40b088:	sar    $1,%rsi
  40b08b:	mov    %rsi,%rdx
  40b08e:	shl    $0x4,%rdx
  40b092:	add    %rdi,%rdx
  40b095:	cmp    %r13,(%rdx)
  40b098:	jae    40b0b8 <_ZZ4mainENKUljE_clEj+0xb98>
  40b09a:	sub    %rsi,%rax
  40b09d:	lea    0x10(%rdx),%rdi
  40b0a1:	sub    $0x1,%rax
  40b0a5:	test   %rax,%rax
  40b0a8:	jg     40b085 <_ZZ4mainENKUljE_clEj+0xb65>
  40b0aa:	mov    0x8(%rdi),%rbx
  40b0ae:	jmp    40af38 <_ZZ4mainENKUljE_clEj+0xa18>
  40b0b3:	nopl   0x0(%rax,%rax,1)
  40b0b8:	mov    %rsi,%rax
  40b0bb:	jmp    40b080 <_ZZ4mainENKUljE_clEj+0xb60>
  40b0bd:	nopl   (%rax)
  40b0c0:	mov    0xe8(%rsp),%rdx
  40b0c8:	sub    0xe0(%rsp),%rdx
  40b0d0:	mov    %r8,0x40(%rsp)
  40b0d5:	mov    $0xffffffffffffffff,%rax
  40b0dc:	shl    $0x7,%rdx
  40b0e0:	add    0xf8(%rsp),%rdx
  40b0e8:	mov    %r10,0x38(%rsp)
  40b0ed:	lea    0x8(%rdx),%rdi
  40b0f1:	mov    %rdx,%rcx
  40b0f4:	movq   $0xffffffffffffffff,(%rdx)
  40b0fb:	movq   $0xffffffffffffffff,0x1f8(%rdx)
  40b106:	and    $0xfffffffffffffff8,%rdi
  40b10a:	sub    %rdi,%rcx
  40b10d:	add    $0x200,%ecx
  40b113:	shr    $0x3,%ecx
  40b116:	rep stos %rax,%es:(%rdi)
  40b119:	mov    %rdx,(%r9)
  40b11c:	lea    0xe0(%rsp),%rdi
  40b124:	mov    %esi,0xac(%rsp)
  40b12b:	lea    0xac(%rsp),%rsi
  40b133:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40b138:	mov    0x8(%rsp),%rax
  40b13d:	mov    0x40(%rsp),%r8
  40b142:	mov    0x38(%rsp),%r10
  40b147:	mov    (%rax,%r13,4),%ebx
  40b14b:	mov    0xc8(%rsp),%rax
  40b153:	mov    (%rax,%r8,8),%rax
  40b157:	jmp    40b022 <_ZZ4mainENKUljE_clEj+0xb02>
  40b15c:	nopl   0x0(%rax)
  40b160:	mov    $0x10,%esi
  40b165:	add    %eax,%eax
  40b167:	mov    %r11,0x60(%rsp)
  40b16c:	cmp    %esi,%eax
  40b16e:	mov    %r9,0x58(%rsp)
  40b173:	cmovb  %esi,%eax
  40b176:	mov    %r8,0x50(%rsp)
  40b17b:	mov    %r10,0x48(%rsp)
  40b180:	lea    0x0(,%rax,4),%esi
  40b187:	mov    %edx,0x40(%rsp)
  40b18b:	mov    %eax,0x30c(%rsp,%rcx,1)
  40b192:	mov    %rcx,0x38(%rsp)
  40b197:	call   442d00 <__libc_realloc>
  40b19c:	mov    0x38(%rsp),%rcx
  40b1a1:	mov    0x60(%rsp),%r11
  40b1a6:	mov    %rax,%rdi
  40b1a9:	mov    0x58(%rsp),%r9
  40b1ae:	mov    0x50(%rsp),%r8
  40b1b3:	mov    %rax,0x300(%rsp,%rcx,1)
  40b1bb:	mov    0x48(%rsp),%r10
  40b1c0:	mov    0x308(%rsp,%rcx,1),%eax
  40b1c7:	mov    0x40(%rsp),%edx
  40b1cb:	jmp    40af8e <_ZZ4mainENKUljE_clEj+0xa6e>
  40b1d0:	mov    0x30(%rsp),%rax
  40b1d5:	addq   $0x1,(%rsp)
  40b1da:	mov    0x2340(%rsp),%rcx
  40b1e2:	mov    -0x4558(%rax),%r8d
  40b1e9:	cmp    %r8d,(%rsp)
  40b1ed:	jb     40ae5f <_ZZ4mainENKUljE_clEj+0x93f>
  40b1f3:	mov    0x2348(%rsp),%rdx
  40b1fb:	mov    0x45f8(%rsp),%rax
  40b203:	sub    %r8,%rdx
  40b206:	mov    0x68(%rsp),%rsi
  40b20b:	mov    $0x1,%edi
  40b210:	mov    %rdx,0x2348(%rsp)
  40b218:	shl    %cl,%rdi
  40b21b:	shl    $0x4,%rsi
  40b21f:	movl   $0x0,0xc8(%rsp,%rsi,1)
  40b22a:	mov    %rcx,%rsi
  40b22d:	mov    %rdi,%rcx
  40b230:	shr    $0x6,%rsi
  40b234:	not    %rcx
  40b237:	and    $0x7,%esi
  40b23a:	and    %rcx,0x2300(%rsp,%rsi,8)
  40b242:	jmp    40ac00 <_ZZ4mainENKUljE_clEj+0x6e0>
  40b247:	nopw   0x0(%rax,%rax,1)
  40b250:	mov    %edi,%esi
  40b252:	and    $0x1ff,%esi
  40b258:	lea    0x24(%rsi),%rbx
  40b25c:	mov    %rbx,%rsi
  40b25f:	mov    %rbx,0x68(%rsp)
  40b264:	shl    $0x4,%rsi
  40b268:	mov    0x2378(%rsp,%rsi,1),%r8d
  40b270:	lea    0x4620(%rsp,%rsi,1),%rbx
  40b278:	mov    %rbx,0x30(%rsp)
  40b27d:	test   %r8d,%r8d
  40b280:	je     40b648 <_ZZ4mainENKUljE_clEj+0x1128>
  40b286:	movq   $0x0,(%rsp)
  40b28e:	jmp    40b29f <_ZZ4mainENKUljE_clEj+0xd7f>
  40b290:	addq   $0x1,(%rsp)
  40b295:	cmp    %r8d,(%rsp)
  40b299:	jae    40b633 <_ZZ4mainENKUljE_clEj+0x1113>
  40b29f:	mov    (%rsp),%r15
  40b2a3:	mov    0x30(%rsp),%rax
  40b2a8:	lea    -0x1(%r8),%ecx
  40b2ac:	mov    0x2370(%rsp),%rbx
  40b2b4:	mov    -0x22b0(%rax),%rsi
  40b2bb:	lea    0x8(%r15),%eax
  40b2bf:	cmp    %ecx,%eax
  40b2c1:	mov    0x8(%rbx),%r9
  40b2c5:	mov    0x10(%rbx),%rbx
  40b2c9:	cmova  %ecx,%eax
  40b2cc:	mov    (%rsi,%rax,4),%edx
  40b2cf:	mov    %edx,%eax
  40b2d1:	mov    %rdx,%r11
  40b2d4:	movzbl %dl,%edx
  40b2d7:	and    $0x1ffffff,%eax
  40b2dc:	shl    $0x27,%r11
  40b2e0:	prefetcht0 (%r9,%rax,4)
  40b2e5:	mov    0x2378(%rsp),%rax
  40b2ed:	shr    $0x2f,%r11
  40b2f1:	mov    (%rax,%r11,8),%r11
  40b2f5:	prefetcht0 (%r11,%rdx,2)
  40b2fa:	lea    0x4(%r15),%edx
  40b2fe:	mov    %rbx,0x8(%rsp)
  40b303:	cmp    %ecx,%edx
  40b305:	cmova  %ecx,%edx
  40b308:	mov    (%rsi,%rdx,4),%edx
  40b30b:	and    $0x1ffffff,%edx
  40b311:	mov    (%r9,%rdx,4),%edx
  40b315:	prefetcht0 (%rbx,%rdx,4)
  40b319:	mov    (%rsi,%r15,4),%edx
  40b31d:	mov    %rdi,%rbx
  40b320:	shl    $0x7,%rbx
  40b324:	mov    %edx,%ecx
  40b326:	mov    %edx,%esi
  40b328:	movzbl %dl,%edx
  40b32b:	shr    $0x19,%esi
  40b32e:	and    $0x1ffffff,%ecx
  40b334:	or     %rsi,%rbx
  40b337:	mov    %ecx,%esi
  40b339:	shr    $0x8,%esi
  40b33c:	mov    %rbx,0x10(%rsp)
  40b341:	mov    (%rax,%rsi,8),%rsi
  40b345:	movzwl (%rsi,%rdx,2),%edx
  40b349:	cmp    %rdx,%rbx
  40b34c:	jne    40b290 <_ZZ4mainENKUljE_clEj+0xd70>
  40b352:	mov    %ecx,%edx
  40b354:	mov    (%r9,%rdx,4),%r13d
  40b358:	lea    0x1(%rcx),%edx
  40b35b:	lea    (%r9,%rdx,4),%rbx
  40b35f:	mov    %rbx,0x18(%rsp)
  40b364:	cmp    (%rbx),%r13d
  40b367:	jb     40b43b <_ZZ4mainENKUljE_clEj+0xf1b>
  40b36d:	jmp    40b290 <_ZZ4mainENKUljE_clEj+0xd70>
  40b372:	nopw   0x0(%rax,%rax,1)
  40b378:	movzwl (%rcx),%eax
  40b37b:	add    0x10(%rsp),%rbx
  40b380:	mov    %rbx,%r11
  40b383:	cmp    %rax,%rbx
  40b386:	mov    %rax,%rdx
  40b389:	cmovbe %rbx,%rdx
  40b38d:	setb   %bpl
  40b391:	shr    $0x7,%r11
  40b395:	mov    %r11,%r15
  40b398:	and    $0x1ff,%r15d
  40b39f:	mov    %dx,(%rcx)
  40b3a2:	mov    %r11d,%edx
  40b3a5:	mov    %r15,%rcx
  40b3a8:	and    $0x1ff,%edx
  40b3ae:	shl    $0x4,%rcx
  40b3b2:	mov    0x25b8(%rsp,%rcx,1),%eax
  40b3b9:	mov    0x25b0(%rsp,%rcx,1),%rdi
  40b3c1:	cmp    0x25bc(%rsp,%rcx,1),%eax
  40b3c8:	je     40b5a0 <_ZZ4mainENKUljE_clEj+0x1080>
  40b3ce:	shl    $0x4,%r15
  40b3d2:	mov    %ebx,%ecx
  40b3d4:	shr    $0x6,%edx
  40b3d7:	shl    $0x19,%ecx
  40b3da:	or     %r12d,%ecx
  40b3dd:	mov    %ecx,(%rdi,%rax,4)
  40b3e0:	movzbl %bpl,%eax
  40b3e4:	mov    %r11d,%ecx
  40b3e7:	movzbl %bpl,%ebp
  40b3eb:	add    %eax,0x25b8(%rsp,%r15,1)
  40b3f3:	mov    0xc8(%rsp),%rax
  40b3fb:	add    %rbp,0x45f8(%rsp)
  40b403:	shl    %cl,%rbp
  40b406:	mov    (%rax,%r8,8),%rax
  40b40a:	or     %rbp,0x45b0(%rsp,%rdx,8)
  40b412:	movzwl (%rax,%r9,2),%eax
  40b417:	add    %rbx,%rax
  40b41a:	cmp    %rax,%r10
  40b41d:	cmova  %rax,%r10
  40b421:	mov    0x18(%rsp),%rax
  40b426:	add    $0x1,%r13
  40b42a:	cmp    (%rax),%r13d
  40b42d:	jae    40b610 <_ZZ4mainENKUljE_clEj+0x10f0>
  40b433:	mov    0x2378(%rsp),%rax
  40b43b:	mov    0x8(%rsp),%rbx
  40b440:	mov    (%rbx,%r13,4),%r12d
  40b444:	mov    %r12d,%esi
  40b447:	mov    %r12d,%ebx
  40b44a:	shr    $0x13,%esi
  40b44d:	mov    %esi,%r8d
  40b450:	lea    (%rax,%r8,8),%r9
  40b454:	mov    (%r9),%rax
  40b457:	cmp    0x20(%rsp),%rax
  40b45c:	je     40b500 <_ZZ4mainENKUljE_clEj+0xfe0>
  40b462:	shr    $0xb,%r12d
  40b466:	and    $0x7ff,%ebx
  40b46c:	movzbl %r12b,%r9d
  40b470:	lea    (%rax,%r9,2),%rcx
  40b474:	cmp    $0x7ff,%ebx
  40b47a:	jne    40b378 <_ZZ4mainENKUljE_clEj+0xe58>
  40b480:	mov    0x2370(%rsp),%rax
  40b488:	mov    0x10(%rax),%rdx
  40b48c:	mov    (%rdx,%r13,4),%ebx
  40b490:	and    $0x7ff,%ebx
  40b496:	cmp    $0x7ff,%ebx
  40b49c:	jne    40b378 <_ZZ4mainENKUljE_clEj+0xe58>
  40b4a2:	mov    0x18(%rax),%rdi
  40b4a6:	mov    0x20(%rax),%rax
  40b4aa:	sub    %rdi,%rax
  40b4ad:	sar    $0x4,%rax
  40b4b1:	data16 cs nopw 0x0(%rax,%rax,1)
  40b4bc:	nopl   0x0(%rax)
  40b4c0:	test   %rax,%rax
  40b4c3:	jle    40b4ea <_ZZ4mainENKUljE_clEj+0xfca>
  40b4c5:	mov    %rax,%rsi
  40b4c8:	sar    $1,%rsi
  40b4cb:	mov    %rsi,%rdx
  40b4ce:	shl    $0x4,%rdx
  40b4d2:	add    %rdi,%rdx
  40b4d5:	cmp    %r13,(%rdx)
  40b4d8:	jae    40b4f8 <_ZZ4mainENKUljE_clEj+0xfd8>
  40b4da:	sub    %rsi,%rax
  40b4dd:	lea    0x10(%rdx),%rdi
  40b4e1:	sub    $0x1,%rax
  40b4e5:	test   %rax,%rax
  40b4e8:	jg     40b4c5 <_ZZ4mainENKUljE_clEj+0xfa5>
  40b4ea:	mov    0x8(%rdi),%rbx
  40b4ee:	jmp    40b378 <_ZZ4mainENKUljE_clEj+0xe58>
  40b4f3:	nopl   0x0(%rax,%rax,1)
  40b4f8:	mov    %rsi,%rax
  40b4fb:	jmp    40b4c0 <_ZZ4mainENKUljE_clEj+0xfa0>
  40b4fd:	nopl   (%rax)
  40b500:	mov    0x2398(%rsp),%rdx
  40b508:	sub    0x2390(%rsp),%rdx
  40b510:	mov    %r8,0x40(%rsp)
  40b515:	mov    $0xffffffffffffffff,%rax
  40b51c:	shl    $0x7,%rdx
  40b520:	add    0x23a8(%rsp),%rdx
  40b528:	mov    %r10,0x38(%rsp)
  40b52d:	lea    0x8(%rdx),%rdi
  40b531:	mov    %rdx,%rcx
  40b534:	movq   $0xffffffffffffffff,(%rdx)
  40b53b:	movq   $0xffffffffffffffff,0x1f8(%rdx)
  40b546:	and    $0xfffffffffffffff8,%rdi
  40b54a:	sub    %rdi,%rcx
  40b54d:	add    $0x200,%ecx
  40b553:	shr    $0x3,%ecx
  40b556:	rep stos %rax,%es:(%rdi)
  40b559:	mov    %rdx,(%r9)
  40b55c:	lea    0x2390(%rsp),%rdi
  40b564:	mov    %esi,0xb0(%rsp)
  40b56b:	lea    0xb0(%rsp),%rsi
  40b573:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40b578:	mov    0x8(%rsp),%rax
  40b57d:	mov    0x40(%rsp),%r8
  40b582:	mov    0x38(%rsp),%r10
  40b587:	mov    (%rax,%r13,4),%ebx
  40b58b:	mov    0x2378(%rsp),%rax
  40b593:	mov    (%rax,%r8,8),%rax
  40b597:	jmp    40b462 <_ZZ4mainENKUljE_clEj+0xf42>
  40b59c:	nopl   0x0(%rax)
  40b5a0:	mov    $0x10,%esi
  40b5a5:	add    %eax,%eax
  40b5a7:	mov    %r11,0x60(%rsp)
  40b5ac:	cmp    %esi,%eax
  40b5ae:	mov    %r9,0x58(%rsp)
  40b5b3:	cmovb  %esi,%eax
  40b5b6:	mov    %r8,0x50(%rsp)
  40b5bb:	mov    %r10,0x48(%rsp)
  40b5c0:	lea    0x0(,%rax,4),%esi
  40b5c7:	mov    %edx,0x40(%rsp)
  40b5cb:	mov    %eax,0x25bc(%rsp,%rcx,1)
  40b5d2:	mov    %rcx,0x38(%rsp)
  40b5d7:	call   442d00 <__libc_realloc>
  40b5dc:	mov    0x38(%rsp),%rcx
  40b5e1:	mov    0x60(%rsp),%r11
  40b5e6:	mov    %rax,%rdi
  40b5e9:	mov    0x58(%rsp),%r9
  40b5ee:	mov    0x50(%rsp),%r8
  40b5f3:	mov    %rax,0x25b0(%rsp,%rcx,1)
  40b5fb:	mov    0x48(%rsp),%r10
  40b600:	mov    0x25b8(%rsp,%rcx,1),%eax
  40b607:	mov    0x40(%rsp),%edx
  40b60b:	jmp    40b3ce <_ZZ4mainENKUljE_clEj+0xeae>
  40b610:	mov    0x30(%rsp),%rax
  40b615:	addq   $0x1,(%rsp)
  40b61a:	mov    0x45f0(%rsp),%rdi
  40b622:	mov    -0x22a8(%rax),%r8d
  40b629:	cmp    %r8d,(%rsp)
  40b62d:	jb     40b29f <_ZZ4mainENKUljE_clEj+0xd7f>
  40b633:	mov    0x45f8(%rsp),%rax
  40b63b:	mov    0x2348(%rsp),%rdx
  40b643:	mov    %edi,%ecx
  40b645:	sub    %r8,%rax
  40b648:	mov    0x68(%rsp),%rsi
  40b64d:	mov    $0x1,%ebx
  40b652:	shr    $0x6,%rdi
  40b656:	mov    %rax,0x45f8(%rsp)
  40b65e:	shl    %cl,%rbx
  40b661:	and    $0x7,%edi
  40b664:	shl    $0x4,%rsi
  40b668:	mov    %rbx,%rcx
  40b66b:	movl   $0x0,0x2378(%rsp,%rsi,1)
  40b676:	not    %rcx
  40b679:	and    %rcx,0x45b0(%rsp,%rdi,8)
  40b681:	jmp    40ac00 <_ZZ4mainENKUljE_clEj+0x6e0>
  40b686:	cs nopw 0x0(%rax,%rax,1)
  40b690:	mov    %r10,%rax
  40b693:	cmp    $0xfffe,%r10
  40b69a:	ja     40b6d0 <_ZZ4mainENKUljE_clEj+0x11b0>
  40b69c:	mov    0x80(%rsp),%rdi
  40b6a4:	mov    0x8c(%rsp),%ecx
  40b6ab:	mov    0x30(%rdi),%rdx
  40b6af:	mov    (%rdx),%rdx
  40b6b2:	mov    %rax,(%rdx,%rcx,8)
  40b6b6:	jmp    40a850 <_ZZ4mainENKUljE_clEj+0x330>
  40b6bb:	mov    %edi,%esi
  40b6bd:	jmp    40adc2 <_ZZ4mainENKUljE_clEj+0x8a2>
  40b6c2:	mov    %edi,%esi
  40b6c4:	jmp    40acda <_ZZ4mainENKUljE_clEj+0x7ba>
  40b6c9:	nopl   0x0(%rax)
  40b6d0:	test   %r14,%r14
  40b6d3:	je     40c32d <_ZZ4mainENKUljE_clEj+0x1e0d>
  40b6d9:	mov    (%r14),%rax
  40b6dc:	mov    0x98(%rsp),%rbx
  40b6e4:	mov    0x90(%rsp),%rdi
  40b6ec:	mov    0x8(%rax),%rax
  40b6f0:	mov    (%rax,%rbx,4),%ebx
  40b6f3:	cmp    %ebx,(%rax,%rdi,4)
  40b6f6:	je     40c21c <_ZZ4mainENKUljE_clEj+0x1cfc>
  40b6fc:	mov    0x8970(%r14),%rax
  40b703:	mov    0x8(%rax),%rdx
  40b707:	mov    0x7c(%rsp),%eax
  40b70b:	lea    0x1(%rax),%ecx
  40b70e:	mov    (%rdx,%rcx,4),%edi
  40b711:	cmp    %edi,(%rdx,%rax,4)
  40b714:	je     40c21c <_ZZ4mainENKUljE_clEj+0x1cfc>
  40b71a:	mov    0x20(%r14),%rdi
  40b71e:	mov    0x28(%r14),%rcx
  40b722:	lea    0x40(%r14),%rbx
  40b726:	cmp    %rcx,%rdi
  40b729:	je     40b753 <_ZZ4mainENKUljE_clEj+0x1233>
  40b72b:	mov    0x8(%r14),%rsi
  40b72f:	mov    %rdi,%rax
  40b732:	lea    0x40(%r14),%rbx
  40b736:	cs nopw 0x0(%rax,%rax,1)
  40b740:	mov    (%rax),%edx
  40b742:	add    $0x4,%rax
  40b746:	mov    %rbx,(%rsi,%rdx,8)
  40b74a:	cmp    %rax,%rcx
  40b74d:	jne    40b740 <_ZZ4mainENKUljE_clEj+0x1220>
  40b74f:	mov    %rdi,0x28(%r14)
  40b753:	xor    %esi,%esi
  40b755:	data16 cs nopw 0x0(%rax,%rax,1)
  40b760:	mov    0x8840(%r14,%rsi,8),%rax
  40b768:	mov    %esi,%ecx
  40b76a:	shl    $0x6,%ecx
  40b76d:	test   %rax,%rax
  40b770:	je     40b7a4 <_ZZ4mainENKUljE_clEj+0x1284>
  40b772:	data16 cs nopw 0x0(%rax,%rax,1)
  40b77d:	nopl   (%rax)
  40b780:	xor    %edx,%edx
  40b782:	tzcnt  %rax,%rdx
  40b787:	add    %ecx,%edx
  40b789:	mov    %edx,%edx
  40b78b:	shl    $0x4,%rdx
  40b78f:	movl   $0x0,0x848(%r14,%rdx,1)
  40b79b:	lea    -0x1(%rax),%rdx
  40b79f:	and    %rdx,%rax
  40b7a2:	jne    40b780 <_ZZ4mainENKUljE_clEj+0x1260>
  40b7a4:	movq   $0x0,0x8840(%r14,%rsi,8)
  40b7b0:	add    $0x1,%rsi
  40b7b4:	cmp    $0x20,%rsi
  40b7b8:	jne    40b760 <_ZZ4mainENKUljE_clEj+0x1240>
  40b7ba:	mov    0x8950(%r14),%rdi
  40b7c1:	pxor   %xmm0,%xmm0
  40b7c5:	mov    0x8960(%r14),%rsi
  40b7cc:	movq   $0x0,0x8960(%r14)
  40b7d7:	movups %xmm0,0x8950(%r14)
  40b7df:	test   %rdi,%rdi
  40b7e2:	je     40b7ec <_ZZ4mainENKUljE_clEj+0x12cc>
  40b7e4:	sub    %rdi,%rsi
  40b7e7:	call   40e1d0 <_ZdlPvm>
  40b7ec:	mov    0x88(%rsp),%ecx
  40b7f3:	mov    0x8(%r14),%rax
  40b7f7:	pxor   %xmm0,%xmm0
  40b7fb:	movups %xmm0,0x8940(%r14)
  40b803:	shr    $0x8,%ecx
  40b806:	mov    %ecx,%ebp
  40b808:	lea    (%rax,%rbp,8),%rsi
  40b80c:	mov    (%rsi),%rax
  40b80f:	cmp    %rbx,%rax
  40b812:	je     40c9b7 <_ZZ4mainENKUljE_clEj+0x2497>
  40b818:	movzbl 0x88(%rsp),%edx
  40b820:	movq   $0x0,(%rax,%rdx,8)
  40b828:	mov    0x8940(%r14),%rax
  40b82f:	neg    %rax
  40b832:	cmp    $0x7ff,%rax
  40b838:	ja     40c880 <_ZZ4mainENKUljE_clEj+0x2360>
  40b83e:	mov    0x848(%r14),%eax
  40b845:	mov    0x840(%r14),%rdi
  40b84c:	cmp    0x84c(%r14),%eax
  40b853:	je     40ca7e <_ZZ4mainENKUljE_clEj+0x255e>
  40b859:	mov    0x88(%rsp),%ebx
  40b860:	mov    %ebx,(%rdi,%rax,4)
  40b863:	addq   $0x1,0x8948(%r14)
  40b86b:	addl   $0x1,0x848(%r14)
  40b873:	orq    $0x1,0x8840(%r14)
  40b87b:	mov    0x8990(%r14),%rdi
  40b882:	mov    0x8998(%r14),%rcx
  40b889:	lea    0x89b0(%r14),%rbx
  40b890:	cmp    %rcx,%rdi
  40b893:	je     40b8c6 <_ZZ4mainENKUljE_clEj+0x13a6>
  40b895:	mov    0x8978(%r14),%rsi
  40b89c:	mov    %rdi,%rax
  40b89f:	lea    0x89b0(%r14),%rbx
  40b8a6:	cs nopw 0x0(%rax,%rax,1)
  40b8b0:	mov    (%rax),%edx
  40b8b2:	add    $0x4,%rax
  40b8b6:	mov    %rbx,(%rsi,%rdx,8)
  40b8ba:	cmp    %rcx,%rax
  40b8bd:	jne    40b8b0 <_ZZ4mainENKUljE_clEj+0x1390>
  40b8bf:	mov    %rdi,0x8998(%r14)
  40b8c6:	xor    %esi,%esi
  40b8c8:	nopl   0x0(%rax,%rax,1)
  40b8d0:	mov    0x111b0(%r14,%rsi,8),%rax
  40b8d8:	mov    %esi,%ecx
  40b8da:	shl    $0x6,%ecx
  40b8dd:	test   %rax,%rax
  40b8e0:	je     40b924 <_ZZ4mainENKUljE_clEj+0x1404>
  40b8e2:	data16 cs nopw 0x0(%rax,%rax,1)
  40b8ed:	data16 cs nopw 0x0(%rax,%rax,1)
  40b8f8:	nopl   0x0(%rax,%rax,1)
  40b900:	xor    %edx,%edx
  40b902:	tzcnt  %rax,%rdx
  40b907:	add    %ecx,%edx
  40b909:	mov    %edx,%edx
  40b90b:	shl    $0x4,%rdx
  40b90f:	movl   $0x0,0x91b8(%r14,%rdx,1)
  40b91b:	lea    -0x1(%rax),%rdx
  40b91f:	and    %rdx,%rax
  40b922:	jne    40b900 <_ZZ4mainENKUljE_clEj+0x13e0>
  40b924:	movq   $0x0,0x111b0(%r14,%rsi,8)
  40b930:	add    $0x1,%rsi
  40b934:	cmp    $0x20,%rsi
  40b938:	jne    40b8d0 <_ZZ4mainENKUljE_clEj+0x13b0>
  40b93a:	mov    0x112c0(%r14),%rdi
  40b941:	pxor   %xmm0,%xmm0
  40b945:	mov    0x112d0(%r14),%rsi
  40b94c:	movq   $0x0,0x112d0(%r14)
  40b957:	movups %xmm0,0x112c0(%r14)
  40b95f:	test   %rdi,%rdi
  40b962:	je     40b96c <_ZZ4mainENKUljE_clEj+0x144c>
  40b964:	sub    %rdi,%rsi
  40b967:	call   40e1d0 <_ZdlPvm>
  40b96c:	mov    0x7c(%rsp),%ecx
  40b970:	mov    0x8978(%r14),%rax
  40b977:	pxor   %xmm0,%xmm0
  40b97b:	movups %xmm0,0x112b0(%r14)
  40b983:	shr    $0x8,%ecx
  40b986:	mov    %ecx,%ebp
  40b988:	lea    (%rax,%rbp,8),%rsi
  40b98c:	mov    (%rsi),%rax
  40b98f:	cmp    %rbx,%rax
  40b992:	je     40c941 <_ZZ4mainENKUljE_clEj+0x2421>
  40b998:	movzbl 0x7c(%rsp),%edx
  40b99d:	movq   $0x0,(%rax,%rdx,8)
  40b9a5:	mov    0x112b0(%r14),%rax
  40b9ac:	neg    %rax
  40b9af:	cmp    $0x7ff,%rax
  40b9b5:	ja     40c7be <_ZZ4mainENKUljE_clEj+0x229e>
  40b9bb:	mov    0x91b8(%r14),%eax
  40b9c2:	mov    0x91b0(%r14),%rdi
  40b9c9:	cmp    0x91bc(%r14),%eax
  40b9d0:	je     40ca49 <_ZZ4mainENKUljE_clEj+0x2529>
  40b9d6:	mov    0x7c(%rsp),%ebx
  40b9da:	mov    %ebx,(%rdi,%rax,4)
  40b9dd:	addq   $0x1,0x112b8(%r14)
  40b9e5:	addl   $0x1,0x91b8(%r14)
  40b9ed:	orq    $0x1,0x111b0(%r14)
  40b9f5:	mov    0x8948(%r14),%r13
  40b9fc:	lea    0x8970(%r14),%rbx
  40ba03:	movabs $0x4000000000000000,%rax
  40ba0d:	mov    %rax,0xb8(%rsp)
  40ba15:	mov    %rax,%rbp
  40ba18:	test   %r13,%r13
  40ba1b:	je     40c0d7 <_ZZ4mainENKUljE_clEj+0x1bb7>
  40ba21:	data16 cs nopw 0x0(%rax,%rax,1)
  40ba2c:	nopl   0x0(%rax)
  40ba30:	mov    0x8940(%r14),%rsi
  40ba37:	mov    $0xffffffffffffffff,%rdx
  40ba3e:	mov    %esi,%edi
  40ba40:	mov    %esi,%ecx
  40ba42:	and    $0x7ff,%edi
  40ba48:	shl    %cl,%rdx
  40ba4b:	mov    %edi,%eax
  40ba4d:	shr    $0x6,%eax
  40ba50:	mov    %eax,%ecx
  40ba52:	and    0x8840(%r14,%rcx,8),%rdx
  40ba5a:	jne    40ba78 <_ZZ4mainENKUljE_clEj+0x1558>
  40ba5c:	nopl   0x0(%rax)
  40ba60:	lea    0x1(%rax),%edx
  40ba63:	mov    %edx,%eax
  40ba65:	and    $0x1f,%edx
  40ba68:	mov    0x8840(%r14,%rdx,8),%rdx
  40ba70:	and    $0x1f,%eax
  40ba73:	test   %rdx,%rdx
  40ba76:	je     40ba60 <_ZZ4mainENKUljE_clEj+0x1540>
  40ba78:	tzcnt  %rdx,%rdx
  40ba7d:	shl    $0x6,%eax
  40ba80:	mov    0x8958(%r14),%r8
  40ba87:	add    %edx,%eax
  40ba89:	sub    %edi,%eax
  40ba8b:	and    $0x7ff,%eax
  40ba90:	add    %rsi,%rax
  40ba93:	mov    0x8950(%r14),%rsi
  40ba9a:	mov    %rax,0x8940(%r14)
  40baa1:	cmp    %rsi,%r8
  40baa4:	je     40bd3a <_ZZ4mainENKUljE_clEj+0x181a>
  40baaa:	mov    %rbx,0x10(%rsp)
  40baaf:	mov    %rbp,0x18(%rsp)
  40bab4:	jmp    40bad7 <_ZZ4mainENKUljE_clEj+0x15b7>
  40bab6:	cs nopw 0x0(%rax,%rax,1)
  40bac0:	mov    %r8,0x8958(%r14)
  40bac7:	mov    0x8940(%r14),%rax
  40bace:	cmp    %r8,%rsi
  40bad1:	je     40bd30 <_ZZ4mainENKUljE_clEj+0x1810>
  40bad7:	mov    (%rsi),%rdx
  40bada:	mov    %rdx,%r12
  40badd:	shr    $0x7,%r12
  40bae1:	mov    %r12,%rcx
  40bae4:	sub    %rax,%rcx
  40bae7:	cmp    $0x7ff,%rcx
  40baee:	ja     40bd30 <_ZZ4mainENKUljE_clEj+0x1810>
  40baf4:	mov    %r12,%rbp
  40baf7:	mov    %r12d,%ebx
  40bafa:	mov    0x8(%rsi),%r15d
  40bafe:	mov    %r8,%rax
  40bb01:	and    $0x7ff,%ebp
  40bb07:	and    $0x7ff,%ebx
  40bb0d:	shl    $0x4,%rbp
  40bb11:	add    %r14,%rbp
  40bb14:	mov    0x848(%rbp),%r10d
  40bb1b:	mov    0x840(%rbp),%rdi
  40bb22:	cmp    0x84c(%rbp),%r10d
  40bb29:	je     40bcd0 <_ZZ4mainENKUljE_clEj+0x17b0>
  40bb2f:	shl    $0x19,%edx
  40bb32:	add    $0x1,%r13
  40bb36:	lea    -0x10(%rax),%r8
  40bb3a:	mov    %r12d,%ecx
  40bb3d:	or     %r15d,%edx
  40bb40:	mov    %edx,(%rdi,%r10,4)
  40bb44:	mov    %ebx,%edx
  40bb46:	mov    $0x1,%ebx
  40bb4b:	shr    $0x6,%edx
  40bb4e:	addl   $0x1,0x848(%rbp)
  40bb55:	shl    %cl,%rbx
  40bb58:	mov    %r13,0x8948(%r14)
  40bb5f:	or     %rbx,0x8840(%r14,%rdx,8)
  40bb67:	mov    %rax,%rdx
  40bb6a:	sub    %rsi,%rdx
  40bb6d:	cmp    $0x10,%rdx
  40bb71:	jle    40bac0 <_ZZ4mainENKUljE_clEj+0x15a0>
  40bb77:	mov    (%rsi),%rdx
  40bb7a:	mov    %r8,%r9
  40bb7d:	mov    -0x10(%rax),%r11
  40bb81:	sub    %rsi,%r9
  40bb84:	mov    -0x8(%rax),%r12d
  40bb88:	mov    %rdx,-0x10(%rax)
  40bb8c:	mov    0x8(%rsi),%edx
  40bb8f:	mov    %r9,%r10
  40bb92:	sar    $0x4,%r10
  40bb96:	mov    %edx,-0x8(%rax)
  40bb99:	cmp    $0x20,%r9
  40bb9d:	jle    40c1a8 <_ZZ4mainENKUljE_clEj+0x1c88>
  40bba3:	lea    -0x1(%r10),%rbp
  40bba7:	mov    %r14,(%rsp)
  40bbab:	xor    %eax,%eax
  40bbad:	mov    %r8,0x8(%rsp)
  40bbb2:	sar    $1,%rbp
  40bbb5:	jmp    40bbd9 <_ZZ4mainENKUljE_clEj+0x16b9>
  40bbb7:	nopw   0x0(%rax,%rax,1)
  40bbc0:	mov    0x8(%rdx),%r15d
  40bbc4:	shl    $0x4,%rax
  40bbc8:	mov    %r8,(%rsi,%rax,1)
  40bbcc:	mov    %r15d,0x8(%rsi,%rax,1)
  40bbd1:	cmp    %rcx,%rbp
  40bbd4:	jle    40bc30 <_ZZ4mainENKUljE_clEj+0x1710>
  40bbd6:	mov    %rcx,%rax
  40bbd9:	lea    0x1(%rax),%rbx
  40bbdd:	lea    -0x1(%rbx,%rbx,1),%rcx
  40bbe2:	mov    %rbx,%rdi
  40bbe5:	mov    %rcx,%rdx
  40bbe8:	shl    $0x5,%rdi
  40bbec:	shl    $0x4,%rdx
  40bbf0:	add    %rsi,%rdi
  40bbf3:	add    %rsi,%rdx
  40bbf6:	mov    (%rdi),%r14
  40bbf9:	mov    (%rdx),%r8
  40bbfc:	cmp    %r14,%r8
  40bbff:	jb     40bbc0 <_ZZ4mainENKUljE_clEj+0x16a0>
  40bc01:	mov    0x8(%rdi),%r15d
  40bc05:	cmp    %r8,%r14
  40bc08:	jne    40bc20 <_ZZ4mainENKUljE_clEj+0x1700>
  40bc0a:	mov    0x8(%rdx),%r14d
  40bc0e:	cmp    %r15d,%r14d
  40bc11:	jae    40bc23 <_ZZ4mainENKUljE_clEj+0x1703>
  40bc13:	mov    %r14d,%r15d
  40bc16:	jmp    40bbc4 <_ZZ4mainENKUljE_clEj+0x16a4>
  40bc18:	nopl   0x0(%rax,%rax,1)
  40bc20:	mov    %r14,%r8
  40bc23:	mov    %rdi,%rdx
  40bc26:	lea    (%rbx,%rbx,1),%rcx
  40bc2a:	jmp    40bbc4 <_ZZ4mainENKUljE_clEj+0x16a4>
  40bc2c:	nopl   0x0(%rax)
  40bc30:	and    $0x1,%r10d
  40bc34:	mov    (%rsp),%r14
  40bc38:	mov    0x8(%rsp),%r8
  40bc3d:	jne    40bc50 <_ZZ4mainENKUljE_clEj+0x1730>
  40bc3f:	sar    $0x5,%r9
  40bc43:	sub    $0x1,%r9
  40bc47:	cmp    %rcx,%r9
  40bc4a:	je     40c1d0 <_ZZ4mainENKUljE_clEj+0x1cb0>
  40bc50:	lea    -0x1(%rcx),%rax
  40bc54:	shr    $0x3f,%rax
  40bc58:	lea    -0x1(%rax,%rcx,1),%rax
  40bc5d:	sar    $1,%rax
  40bc60:	test   %rcx,%rcx
  40bc63:	je     40bc8d <_ZZ4mainENKUljE_clEj+0x176d>
  40bc65:	mov    %rax,%rdx
  40bc68:	shl    $0x4,%rdx
  40bc6c:	add    %rsi,%rdx
  40bc6f:	mov    (%rdx),%rdi
  40bc72:	cmp    %rdi,%r11
  40bc75:	jb     40bca0 <_ZZ4mainENKUljE_clEj+0x1780>
  40bc77:	cmp    %r11,%rdi
  40bc7a:	jne    40bc85 <_ZZ4mainENKUljE_clEj+0x1765>
  40bc7c:	mov    0x8(%rdx),%r9d
  40bc80:	cmp    %r9d,%r12d
  40bc83:	jb     40bca4 <_ZZ4mainENKUljE_clEj+0x1784>
  40bc85:	shl    $0x4,%rcx
  40bc89:	lea    (%rsi,%rcx,1),%rdx
  40bc8d:	mov    %r11,(%rdx)
  40bc90:	mov    %r12d,0x8(%rdx)
  40bc94:	jmp    40bac0 <_ZZ4mainENKUljE_clEj+0x15a0>
  40bc99:	nopl   0x0(%rax)
  40bca0:	mov    0x8(%rdx),%r9d
  40bca4:	shl    $0x4,%rcx
  40bca8:	mov    %rdi,(%rsi,%rcx,1)
  40bcac:	mov    %r9d,0x8(%rsi,%rcx,1)
  40bcb1:	lea    -0x1(%rax),%rcx
  40bcb5:	shr    $0x3f,%rcx
  40bcb9:	lea    -0x1(%rax,%rcx,1),%rdi
  40bcbe:	mov    %rax,%rcx
  40bcc1:	test   %rax,%rax
  40bcc4:	je     40bc8d <_ZZ4mainENKUljE_clEj+0x176d>
  40bcc6:	mov    %rdi,%rax
  40bcc9:	sar    $1,%rax
  40bccc:	jmp    40bc65 <_ZZ4mainENKUljE_clEj+0x1745>
  40bcce:	xchg   %ax,%ax
  40bcd0:	mov    $0x10,%eax
  40bcd5:	add    %r10d,%r10d
  40bcd8:	mov    %rdx,(%rsp)
  40bcdc:	cmp    %eax,%r10d
  40bcdf:	cmovb  %eax,%r10d
  40bce3:	mov    %r10d,0x84c(%rbp)
  40bcea:	lea    0x0(,%r10,4),%esi
  40bcf2:	call   442d00 <__libc_realloc>
  40bcf7:	mov    0x848(%rbp),%r10d
  40bcfe:	mov    0x8948(%r14),%r13
  40bd05:	mov    %rax,0x840(%rbp)
  40bd0c:	mov    %rax,%rdi
  40bd0f:	mov    0x8950(%r14),%rsi
  40bd16:	mov    0x8958(%r14),%rax
  40bd1d:	mov    (%rsp),%rdx
  40bd21:	jmp    40bb2f <_ZZ4mainENKUljE_clEj+0x160f>
  40bd26:	cs nopw 0x0(%rax,%rax,1)
  40bd30:	mov    0x10(%rsp),%rbx
  40bd35:	mov    0x18(%rsp),%rbp
  40bd3a:	shl    $0x7,%rax
  40bd3e:	mov    %rax,%r15
  40bd41:	mov    0x112b8(%r14),%r13
  40bd48:	test   %r13,%r13
  40bd4b:	je     40c110 <_ZZ4mainENKUljE_clEj+0x1bf0>
  40bd51:	mov    0x112b0(%r14),%rdx
  40bd58:	mov    $0xffffffffffffffff,%rdi
  40bd5f:	mov    %edx,%esi
  40bd61:	mov    %edx,%ecx
  40bd63:	and    $0x7ff,%esi
  40bd69:	shl    %cl,%rdi
  40bd6c:	mov    %esi,%eax
  40bd6e:	mov    %rdi,%rcx
  40bd71:	shr    $0x6,%eax
  40bd74:	mov    %eax,%edi
  40bd76:	and    0x111b0(%r14,%rdi,8),%rcx
  40bd7e:	jne    40bd98 <_ZZ4mainENKUljE_clEj+0x1878>
  40bd80:	lea    0x1(%rax),%ecx
  40bd83:	mov    %ecx,%eax
  40bd85:	and    $0x1f,%ecx
  40bd88:	mov    0x111b0(%r14,%rcx,8),%rcx
  40bd90:	and    $0x1f,%eax
  40bd93:	test   %rcx,%rcx
  40bd96:	je     40bd80 <_ZZ4mainENKUljE_clEj+0x1860>
  40bd98:	tzcnt  %rcx,%rcx
  40bd9d:	shl    $0x6,%eax
  40bda0:	mov    0x112c8(%r14),%r8
  40bda7:	add    %ecx,%eax
  40bda9:	sub    %esi,%eax
  40bdab:	mov    0x112c0(%r14),%rsi
  40bdb2:	and    $0x7ff,%eax
  40bdb7:	add    %rdx,%rax
  40bdba:	mov    %rax,0x112b0(%r14)
  40bdc1:	cmp    %rsi,%r8
  40bdc4:	je     40c05f <_ZZ4mainENKUljE_clEj+0x1b3f>
  40bdca:	mov    %rbx,0x10(%rsp)
  40bdcf:	mov    %r15,0x18(%rsp)
  40bdd4:	mov    %rbp,0x30(%rsp)
  40bdd9:	jmp    40bdf7 <_ZZ4mainENKUljE_clEj+0x18d7>
  40bddb:	nopl   0x0(%rax,%rax,1)
  40bde0:	mov    %r8,0x112c8(%r14)
  40bde7:	mov    0x112b0(%r14),%rax
  40bdee:	cmp    %r8,%rsi
  40bdf1:	je     40c050 <_ZZ4mainENKUljE_clEj+0x1b30>
  40bdf7:	mov    (%rsi),%rdx
  40bdfa:	mov    %rdx,%r12
  40bdfd:	shr    $0x7,%r12
  40be01:	mov    %r12,%rcx
  40be04:	sub    %rax,%rcx
  40be07:	cmp    $0x7ff,%rcx
  40be0e:	ja     40c050 <_ZZ4mainENKUljE_clEj+0x1b30>
  40be14:	mov    %r12,%rbp
  40be17:	mov    %r12d,%ebx
  40be1a:	mov    0x8(%rsi),%r15d
  40be1e:	mov    %r8,%rax
  40be21:	and    $0x7ff,%ebp
  40be27:	and    $0x7ff,%ebx
  40be2d:	shl    $0x4,%rbp
  40be31:	add    %r14,%rbp
  40be34:	mov    0x91b8(%rbp),%r10d
  40be3b:	mov    0x91b0(%rbp),%rdi
  40be42:	cmp    0x91bc(%rbp),%r10d
  40be49:	je     40bff0 <_ZZ4mainENKUljE_clEj+0x1ad0>
  40be4f:	shl    $0x19,%edx
  40be52:	mov    %r10d,%r8d
  40be55:	add    $0x1,%r13
  40be59:	mov    %r12d,%ecx
  40be5c:	or     %r15d,%edx
  40be5f:	mov    %edx,(%rdi,%r8,4)
  40be63:	mov    %ebx,%edx
  40be65:	mov    $0x1,%edi
  40be6a:	lea    -0x10(%rax),%r8
  40be6e:	shr    $0x6,%edx
  40be71:	addl   $0x1,0x91b8(%rbp)
  40be78:	shl    %cl,%rdi
  40be7b:	mov    %r13,0x112b8(%r14)
  40be82:	or     %rdi,0x111b0(%r14,%rdx,8)
  40be8a:	mov    %rax,%rdx
  40be8d:	sub    %rsi,%rdx
  40be90:	cmp    $0x10,%rdx
  40be94:	jle    40bde0 <_ZZ4mainENKUljE_clEj+0x18c0>
  40be9a:	mov    (%rsi),%rdx
  40be9d:	mov    %r8,%r9
  40bea0:	mov    -0x10(%rax),%r11
  40bea4:	sub    %rsi,%r9
  40bea7:	mov    -0x8(%rax),%r12d
  40beab:	mov    %rdx,-0x10(%rax)
  40beaf:	mov    0x8(%rsi),%edx
  40beb2:	mov    %r9,%r10
  40beb5:	sar    $0x4,%r10
  40beb9:	mov    %edx,-0x8(%rax)
  40bebc:	cmp    $0x20,%r9
  40bec0:	jle    40c160 <_ZZ4mainENKUljE_clEj+0x1c40>
  40bec6:	lea    -0x1(%r10),%rbp
  40beca:	mov    %r14,(%rsp)
  40bece:	xor    %eax,%eax
  40bed0:	mov    %r11,0x8(%rsp)
  40bed5:	sar    $1,%rbp
  40bed8:	jmp    40bef9 <_ZZ4mainENKUljE_clEj+0x19d9>
  40beda:	nopw   0x0(%rax,%rax,1)
  40bee0:	mov    0x8(%rdx),%r15d
  40bee4:	shl    $0x4,%rax
  40bee8:	mov    %r11,(%rsi,%rax,1)
  40beec:	mov    %r15d,0x8(%rsi,%rax,1)
  40bef1:	cmp    %rbp,%rcx
  40bef4:	jge    40bf50 <_ZZ4mainENKUljE_clEj+0x1a30>
  40bef6:	mov    %rcx,%rax
  40bef9:	lea    0x1(%rax),%rbx
  40befd:	lea    -0x1(%rbx,%rbx,1),%rcx
  40bf02:	mov    %rbx,%rdi
  40bf05:	mov    %rcx,%rdx
  40bf08:	shl    $0x5,%rdi
  40bf0c:	shl    $0x4,%rdx
  40bf10:	add    %rsi,%rdi
  40bf13:	add    %rsi,%rdx
  40bf16:	mov    (%rdi),%r14
  40bf19:	mov    (%rdx),%r11
  40bf1c:	cmp    %r14,%r11
  40bf1f:	jb     40bee0 <_ZZ4mainENKUljE_clEj+0x19c0>
  40bf21:	mov    0x8(%rdi),%r15d
  40bf25:	cmp    %r11,%r14
  40bf28:	jne    40bf40 <_ZZ4mainENKUljE_clEj+0x1a20>
  40bf2a:	mov    0x8(%rdx),%r14d
  40bf2e:	cmp    %r15d,%r14d
  40bf31:	jae    40bf43 <_ZZ4mainENKUljE_clEj+0x1a23>
  40bf33:	mov    %r14d,%r15d
  40bf36:	jmp    40bee4 <_ZZ4mainENKUljE_clEj+0x19c4>
  40bf38:	nopl   0x0(%rax,%rax,1)
  40bf40:	mov    %r14,%r11
  40bf43:	mov    %rdi,%rdx
  40bf46:	lea    (%rbx,%rbx,1),%rcx
  40bf4a:	jmp    40bee4 <_ZZ4mainENKUljE_clEj+0x19c4>
  40bf4c:	nopl   0x0(%rax)
  40bf50:	and    $0x1,%r10d
  40bf54:	mov    (%rsp),%r14
  40bf58:	mov    0x8(%rsp),%r11
  40bf5d:	jne    40bf70 <_ZZ4mainENKUljE_clEj+0x1a50>
  40bf5f:	sar    $0x5,%r9
  40bf63:	sub    $0x1,%r9
  40bf67:	cmp    %r9,%rcx
  40bf6a:	je     40c180 <_ZZ4mainENKUljE_clEj+0x1c60>
  40bf70:	lea    -0x1(%rcx),%rax
  40bf74:	shr    $0x3f,%rax
  40bf78:	lea    -0x1(%rax,%rcx,1),%rax
  40bf7d:	sar    $1,%rax
  40bf80:	test   %rcx,%rcx
  40bf83:	je     40bfaa <_ZZ4mainENKUljE_clEj+0x1a8a>
  40bf85:	mov    %rax,%rdx
  40bf88:	shl    $0x4,%rdx
  40bf8c:	add    %rsi,%rdx
  40bf8f:	mov    (%rdx),%rdi
  40bf92:	cmp    %rdi,%r11
  40bf95:	jb     40bfc0 <_ZZ4mainENKUljE_clEj+0x1aa0>
  40bf97:	jne    40bfa2 <_ZZ4mainENKUljE_clEj+0x1a82>
  40bf99:	mov    0x8(%rdx),%r9d
  40bf9d:	cmp    %r9d,%r12d
  40bfa0:	jb     40bfc4 <_ZZ4mainENKUljE_clEj+0x1aa4>
  40bfa2:	shl    $0x4,%rcx
  40bfa6:	lea    (%rsi,%rcx,1),%rdx
  40bfaa:	mov    %r11,(%rdx)
  40bfad:	mov    %r12d,0x8(%rdx)
  40bfb1:	jmp    40bde0 <_ZZ4mainENKUljE_clEj+0x18c0>
  40bfb6:	cs nopw 0x0(%rax,%rax,1)
  40bfc0:	mov    0x8(%rdx),%r9d
  40bfc4:	shl    $0x4,%rcx
  40bfc8:	mov    %rdi,(%rsi,%rcx,1)
  40bfcc:	mov    %r9d,0x8(%rsi,%rcx,1)
  40bfd1:	lea    -0x1(%rax),%rcx
  40bfd5:	shr    $0x3f,%rcx
  40bfd9:	lea    -0x1(%rax,%rcx,1),%rdi
  40bfde:	mov    %rax,%rcx
  40bfe1:	test   %rax,%rax
  40bfe4:	je     40bfaa <_ZZ4mainENKUljE_clEj+0x1a8a>
  40bfe6:	mov    %rdi,%rax
  40bfe9:	sar    $1,%rax
  40bfec:	jmp    40bf85 <_ZZ4mainENKUljE_clEj+0x1a65>
  40bfee:	xchg   %ax,%ax
  40bff0:	lea    (%r10,%r10,1),%r8d
  40bff4:	mov    $0x10,%eax
  40bff9:	mov    %rdx,(%rsp)
  40bffd:	cmp    %eax,%r8d
  40c000:	cmovb  %eax,%r8d
  40c004:	mov    %r8d,0x91bc(%rbp)
  40c00b:	lea    0x0(,%r8,4),%esi
  40c013:	call   442d00 <__libc_realloc>
  40c018:	mov    0x91b8(%rbp),%r10d
  40c01f:	mov    0x112b8(%r14),%r13
  40c026:	mov    %rax,0x91b0(%rbp)
  40c02d:	mov    %rax,%rdi
  40c030:	mov    0x112c0(%r14),%rsi
  40c037:	mov    0x112c8(%r14),%rax
  40c03e:	mov    (%rsp),%rdx
  40c042:	jmp    40be4f <_ZZ4mainENKUljE_clEj+0x192f>
  40c047:	nopw   0x0(%rax,%rax,1)
  40c050:	mov    0x10(%rsp),%rbx
  40c055:	mov    0x18(%rsp),%r15
  40c05a:	mov    0x30(%rsp),%rbp
  40c05f:	movabs $0x4000000000000000,%rdi
  40c069:	shl    $0x7,%rax
  40c06d:	cmp    %rdi,%r15
  40c070:	je     40c1f5 <_ZZ4mainENKUljE_clEj+0x1cd5>
  40c076:	cmp    %rdi,%rax
  40c079:	je     40c1f5 <_ZZ4mainENKUljE_clEj+0x1cd5>
  40c07f:	add    %rax,%r15
  40c082:	cmp    %rbp,%r15
  40c085:	jae    40c206 <_ZZ4mainENKUljE_clEj+0x1ce6>
  40c08b:	mov    0x8948(%r14),%rax
  40c092:	cmp    %rax,0x112b8(%r14)
  40c099:	lea    0xc0(%rsp),%rax
  40c0a1:	lea    0xb8(%rsp),%rdx
  40c0a9:	mov    %rax,0x70(%rsp)
  40c0ae:	jb     40c150 <_ZZ4mainENKUljE_clEj+0x1c30>
  40c0b4:	mov    %rbx,%rsi
  40c0b7:	mov    %r14,%rdi
  40c0ba:	call   409ec0 <_ZN4SideImE10drain_bitsILj11EEEvRKS0_Rm>
  40c0bf:	mov    0x8948(%r14),%r13
  40c0c6:	mov    0xb8(%rsp),%rbp
  40c0ce:	test   %r13,%r13
  40c0d1:	jne    40ba30 <_ZZ4mainENKUljE_clEj+0x1510>
  40c0d7:	mov    0x8958(%r14),%r8
  40c0de:	mov    0x8950(%r14),%rsi
  40c0e5:	cmp    %rsi,%r8
  40c0e8:	je     40c683 <_ZZ4mainENKUljE_clEj+0x2163>
  40c0ee:	mov    (%rsi),%rax
  40c0f1:	mov    %rbx,0x10(%rsp)
  40c0f6:	mov    %rbp,0x18(%rsp)
  40c0fb:	shr    $0x7,%rax
  40c0ff:	mov    %rax,0x8940(%r14)
  40c106:	jmp    40bad7 <_ZZ4mainENKUljE_clEj+0x15b7>
  40c10b:	nopl   0x0(%rax,%rax,1)
  40c110:	mov    0x112c8(%r14),%r8
  40c117:	mov    0x112c0(%r14),%rsi
  40c11e:	cmp    %rsi,%r8
  40c121:	je     40c1f5 <_ZZ4mainENKUljE_clEj+0x1cd5>
  40c127:	mov    (%rsi),%rax
  40c12a:	mov    %rbx,0x10(%rsp)
  40c12f:	mov    %r15,0x18(%rsp)
  40c134:	shr    $0x7,%rax
  40c138:	mov    %rbp,0x30(%rsp)
  40c13d:	mov    %rax,0x112b0(%r14)
  40c144:	jmp    40bdf7 <_ZZ4mainENKUljE_clEj+0x18d7>
  40c149:	nopl   0x0(%rax)
  40c150:	mov    %r14,%rsi
  40c153:	mov    %rbx,%rdi
  40c156:	call   409ec0 <_ZN4SideImE10drain_bitsILj11EEEvRKS0_Rm>
  40c15b:	jmp    40c0bf <_ZZ4mainENKUljE_clEj+0x1b9f>
  40c160:	and    $0x1,%r10d
  40c164:	mov    %rsi,%rdx
  40c167:	jne    40bfaa <_ZZ4mainENKUljE_clEj+0x1a8a>
  40c16d:	cmp    $0x20,%r9
  40c171:	jne    40bfaa <_ZZ4mainENKUljE_clEj+0x1a8a>
  40c177:	xor    %ecx,%ecx
  40c179:	nopl   0x0(%rax)
  40c180:	lea    0x1(%rcx,%rcx,1),%rax
  40c185:	shl    $0x4,%rax
  40c189:	add    %rsi,%rax
  40c18c:	mov    (%rax),%r9
  40c18f:	mov    0x8(%rax),%eax
  40c192:	mov    %r9,(%rdx)
  40c195:	mov    %eax,0x8(%rdx)
  40c198:	mov    %rcx,%rax
  40c19b:	lea    0x1(%rcx,%rcx,1),%rcx
  40c1a0:	jmp    40bf85 <_ZZ4mainENKUljE_clEj+0x1a65>
  40c1a5:	nopl   (%rax)
  40c1a8:	and    $0x1,%r10d
  40c1ac:	mov    %rsi,%rdx
  40c1af:	jne    40bc8d <_ZZ4mainENKUljE_clEj+0x176d>
  40c1b5:	cmp    $0x20,%r9
  40c1b9:	jne    40bc8d <_ZZ4mainENKUljE_clEj+0x176d>
  40c1bf:	xor    %ecx,%ecx
  40c1c1:	data16 cs nopw 0x0(%rax,%rax,1)
  40c1cc:	nopl   0x0(%rax)
  40c1d0:	lea    0x1(%rcx,%rcx,1),%rax
  40c1d5:	shl    $0x4,%rax
  40c1d9:	add    %rsi,%rax
  40c1dc:	mov    (%rax),%r9
  40c1df:	mov    0x8(%rax),%eax
  40c1e2:	mov    %r9,(%rdx)
  40c1e5:	mov    %eax,0x8(%rdx)
  40c1e8:	mov    %rcx,%rax
  40c1eb:	lea    0x1(%rcx,%rcx,1),%rcx
  40c1f0:	jmp    40bc65 <_ZZ4mainENKUljE_clEj+0x1745>
  40c1f5:	movabs $0x4000000000000000,%rax
  40c1ff:	cmp    %rax,%rbp
  40c202:	cmova  %rax,%rbp
  40c206:	movabs $0x3fffffffffffffff,%rdi
  40c210:	mov    %rbp,%rax
  40c213:	cmp    %rbp,%rdi
  40c216:	jae    40b69c <_ZZ4mainENKUljE_clEj+0x117c>
  40c21c:	mov    $0xffffffffffffffff,%rax
  40c223:	jmp    40b69c <_ZZ4mainENKUljE_clEj+0x117c>
  40c228:	xor    %eax,%eax
  40c22a:	jmp    40b69c <_ZZ4mainENKUljE_clEj+0x117c>
  40c22f:	mov    0xe8(%rsp),%rdx
  40c237:	sub    0xe0(%rsp),%rdx
  40c23f:	mov    $0xffffffffffffffff,%rax
  40c246:	shl    $0x7,%rdx
  40c24a:	add    0xf8(%rsp),%rdx
  40c252:	lea    0x8(%rdx),%rdi
  40c256:	mov    %rdx,%rcx
  40c259:	movq   $0xffffffffffffffff,(%rdx)
  40c260:	movq   $0xffffffffffffffff,0x1f8(%rdx)
  40c26b:	and    $0xfffffffffffffff8,%rdi
  40c26f:	sub    %rdi,%rcx
  40c272:	add    $0x200,%ecx
  40c278:	shr    $0x3,%ecx
  40c27b:	rep stos %rax,%es:(%rdi)
  40c27e:	mov    %rdx,(%r8)
  40c281:	lea    0xe0(%rsp),%rdi
  40c289:	mov    %esi,0xa4(%rsp)
  40c290:	lea    0xa4(%rsp),%rsi
  40c298:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c29d:	mov    0xc8(%rsp),%rax
  40c2a5:	mov    (%rax,%rbx,8),%rax
  40c2a9:	jmp    40aa1d <_ZZ4mainENKUljE_clEj+0x4fd>
  40c2ae:	mov    0x2398(%rsp),%rdx
  40c2b6:	sub    0x2390(%rsp),%rdx
  40c2be:	mov    $0xffffffffffffffff,%rax
  40c2c5:	shl    $0x7,%rdx
  40c2c9:	add    0x23a8(%rsp),%rdx
  40c2d1:	lea    0x8(%rdx),%rdi
  40c2d5:	mov    %rdx,%rcx
  40c2d8:	movq   $0xffffffffffffffff,(%rdx)
  40c2df:	movq   $0xffffffffffffffff,0x1f8(%rdx)
  40c2ea:	and    $0xfffffffffffffff8,%rdi
  40c2ee:	sub    %rdi,%rcx
  40c2f1:	add    $0x200,%ecx
  40c2f7:	shr    $0x3,%ecx
  40c2fa:	rep stos %rax,%es:(%rdi)
  40c2fd:	mov    %rdx,(%r8)
  40c300:	lea    0x2390(%rsp),%rdi
  40c308:	mov    %esi,0xa8(%rsp)
  40c30f:	lea    0xa8(%rsp),%rsi
  40c317:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c31c:	mov    0x2378(%rsp),%rax
  40c324:	mov    (%rax,%rbx,8),%rax
  40c328:	jmp    40ab9a <_ZZ4mainENKUljE_clEj+0x67a>
  40c32d:	lea    0xc0(%rsp),%rax
  40c335:	mov    $0x112e0,%edi
  40c33a:	mov    %rax,0x70(%rsp)
  40c33f:	call   40e2a0 <_Znwm>
  40c344:	mov    %rax,%r14
  40c347:	mov    0x80(%rsp),%rax
  40c34f:	lea    0x40(%r14),%rbx
  40c353:	mov    (%rax),%rax
  40c356:	mov    (%rax),%rax
  40c359:	mov    (%rax),%r12d
  40c35c:	mov    %rax,(%r14)
  40c35f:	movq   $0x0,0x8(%r14)
  40c367:	mov    %r12d,%r15d
  40c36a:	movq   $0x0,0x10(%r14)
  40c372:	shr    $0x8,%r15d
  40c376:	movq   $0x0,0x18(%r14)
  40c37e:	lea    0x1(%r15),%ebp
  40c382:	lea    0x0(,%rbp,8),%rcx
  40c38a:	mov    %rbp,%r13
  40c38d:	mov    %rcx,%rdi
  40c390:	mov    %rcx,(%rsp)
  40c394:	call   40e2a0 <_Znwm>
  40c399:	mov    (%rsp),%rcx
  40c39d:	mov    %rax,0x8(%r14)
  40c3a1:	mov    %rax,%rdx
  40c3a4:	lea    (%rax,%rcx,1),%rdi
  40c3a8:	mov    %rdi,0x18(%r14)
  40c3ac:	test   %r15d,%r15d
  40c3af:	je     40c3f7 <_ZZ4mainENKUljE_clEj+0x1ed7>
  40c3b1:	mov    %rbp,%rsi
  40c3b4:	movq   %rbx,%xmm0
  40c3b9:	shr    $1,%rsi
  40c3bc:	punpcklqdq %xmm0,%xmm0
  40c3c0:	shl    $0x4,%rsi
  40c3c4:	lea    (%rax,%rsi,1),%rcx
  40c3c8:	and    $0x10,%esi
  40c3cb:	je     40c3d9 <_ZZ4mainENKUljE_clEj+0x1eb9>
  40c3cd:	movups %xmm0,(%rax)
  40c3d0:	lea    0x10(%rax),%rax
  40c3d4:	cmp    %rax,%rcx
  40c3d7:	je     40c3e9 <_ZZ4mainENKUljE_clEj+0x1ec9>
  40c3d9:	movups %xmm0,(%rax)
  40c3dc:	add    $0x20,%rax
  40c3e0:	movups %xmm0,-0x10(%rax)
  40c3e4:	cmp    %rax,%rcx
  40c3e7:	jne    40c3d9 <_ZZ4mainENKUljE_clEj+0x1eb9>
  40c3e9:	and    $0x1,%r13d
  40c3ed:	je     40c3fa <_ZZ4mainENKUljE_clEj+0x1eda>
  40c3ef:	and    $0xfffffffffffffffe,%rbp
  40c3f3:	lea    (%rdx,%rbp,8),%rdx
  40c3f7:	mov    %rbx,(%rdx)
  40c3fa:	mov    %rdi,0x10(%r14)
  40c3fe:	pxor   %xmm0,%xmm0
  40c402:	xor    %r9d,%r9d
  40c405:	mov    $0x4022,%ecx
  40c40a:	lea    0x100(%r12),%eax
  40c412:	movq   $0x0,0x30(%r14)
  40c41a:	mov    $0x3,%edx
  40c41f:	xor    %edi,%edi
  40c421:	lea    0x40(,%rax,8),%r12
  40c429:	movups %xmm0,0x20(%r14)
  40c42e:	mov    $0xffffffff,%r8d
  40c434:	mov    %r12,%rsi
  40c437:	call   455fd0 <__mmap64>
  40c43c:	mov    $0xf,%edx
  40c441:	mov    %r12,%rsi
  40c444:	mov    %rax,%rdi
  40c447:	mov    %rax,%rbp
  40c44a:	call   455fa0 <__madvise>
  40c44f:	lea    0x840(%r14),%rdi
  40c456:	mov    %rbp,0x38(%r14)
  40c45a:	mov    %rbx,%rax
  40c45d:	cmp    %rdi,%rbx
  40c460:	je     40c495 <_ZZ4mainENKUljE_clEj+0x1f75>
  40c462:	movq   0xaff56(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c46a:	mov    %rdi,%rdx
  40c46d:	sub    %rbx,%rdx
  40c470:	and    $0x10,%edx
  40c473:	punpcklqdq %xmm0,%xmm0
  40c477:	je     40c485 <_ZZ4mainENKUljE_clEj+0x1f65>
  40c479:	add    $0x10,%rax
  40c47d:	movups %xmm0,(%rbx)
  40c480:	cmp    %rax,%rdi
  40c483:	je     40c495 <_ZZ4mainENKUljE_clEj+0x1f75>
  40c485:	movups %xmm0,(%rax)
  40c488:	add    $0x20,%rax
  40c48c:	movups %xmm0,-0x10(%rax)
  40c490:	cmp    %rax,%rdi
  40c493:	jne    40c485 <_ZZ4mainENKUljE_clEj+0x1f65>
  40c495:	mov    $0x8000,%edx
  40c49a:	xor    %esi,%esi
  40c49c:	lea    0x89b0(%r14),%rbx
  40c4a3:	call   401098 <_init+0x98>
  40c4a8:	xor    %eax,%eax
  40c4aa:	mov    $0x20,%ecx
  40c4af:	pxor   %xmm0,%xmm0
  40c4b3:	lea    0x8840(%r14),%rdi
  40c4ba:	rep stos %rax,%es:(%rdi)
  40c4bd:	mov    0x80(%rsp),%rax
  40c4c5:	movq   $0x0,0x8960(%r14)
  40c4d0:	movups %xmm0,0x8940(%r14)
  40c4d8:	mov    0x8(%rax),%rax
  40c4dc:	movups %xmm0,0x8950(%r14)
  40c4e4:	mov    (%rax),%rax
  40c4e7:	mov    (%rax),%r12d
  40c4ea:	mov    %rax,0x8970(%r14)
  40c4f1:	movq   $0x0,0x8978(%r14)
  40c4fc:	movq   $0x0,0x8980(%r14)
  40c507:	mov    %r12d,%r15d
  40c50a:	movq   $0x0,0x8988(%r14)
  40c515:	shr    $0x8,%r15d
  40c519:	lea    0x1(%r15),%ebp
  40c51d:	lea    0x0(,%rbp,8),%rcx
  40c525:	mov    %rbp,%r13
  40c528:	mov    %rcx,%rdi
  40c52b:	mov    %rcx,(%rsp)
  40c52f:	call   40e2a0 <_Znwm>
  40c534:	mov    (%rsp),%rcx
  40c538:	mov    %rax,0x8978(%r14)
  40c53f:	mov    %rax,%rdx
  40c542:	lea    (%rax,%rcx,1),%rdi
  40c546:	mov    %rdi,0x8988(%r14)
  40c54d:	test   %r15d,%r15d
  40c550:	je     40c598 <_ZZ4mainENKUljE_clEj+0x2078>
  40c552:	mov    %rbp,%rsi
  40c555:	movq   %rbx,%xmm0
  40c55a:	shr    $1,%rsi
  40c55d:	punpcklqdq %xmm0,%xmm0
  40c561:	shl    $0x4,%rsi
  40c565:	lea    (%rax,%rsi,1),%rcx
  40c569:	and    $0x10,%esi
  40c56c:	je     40c57a <_ZZ4mainENKUljE_clEj+0x205a>
  40c56e:	movups %xmm0,(%rax)
  40c571:	lea    0x10(%rax),%rax
  40c575:	cmp    %rax,%rcx
  40c578:	je     40c58a <_ZZ4mainENKUljE_clEj+0x206a>
  40c57a:	movups %xmm0,(%rax)
  40c57d:	add    $0x20,%rax
  40c581:	movups %xmm0,-0x10(%rax)
  40c585:	cmp    %rax,%rcx
  40c588:	jne    40c57a <_ZZ4mainENKUljE_clEj+0x205a>
  40c58a:	and    $0x1,%r13d
  40c58e:	je     40c59b <_ZZ4mainENKUljE_clEj+0x207b>
  40c590:	and    $0xfffffffffffffffe,%rbp
  40c594:	lea    (%rdx,%rbp,8),%rdx
  40c598:	mov    %rbx,(%rdx)
  40c59b:	mov    %rdi,0x8980(%r14)
  40c5a2:	pxor   %xmm0,%xmm0
  40c5a6:	xor    %r9d,%r9d
  40c5a9:	mov    $0x4022,%ecx
  40c5ae:	lea    0x100(%r12),%eax
  40c5b6:	movups %xmm0,0x8990(%r14)
  40c5be:	mov    $0xffffffff,%r8d
  40c5c4:	xor    %edi,%edi
  40c5c6:	movq   $0x0,0x89a0(%r14)
  40c5d1:	lea    0x40(,%rax,8),%r12
  40c5d9:	mov    $0x3,%edx
  40c5de:	mov    %r12,%rsi
  40c5e1:	call   455fd0 <__mmap64>
  40c5e6:	mov    $0xf,%edx
  40c5eb:	mov    %r12,%rsi
  40c5ee:	mov    %rax,%rdi
  40c5f1:	mov    %rax,%rbp
  40c5f4:	call   455fa0 <__madvise>
  40c5f9:	lea    0x91b0(%r14),%rdi
  40c600:	mov    %rbp,0x89a8(%r14)
  40c607:	mov    %rbx,%rax
  40c60a:	cmp    %rdi,%rbx
  40c60d:	je     40c642 <_ZZ4mainENKUljE_clEj+0x2122>
  40c60f:	movq   0xafda9(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c617:	mov    %rdi,%rdx
  40c61a:	sub    %rbx,%rdx
  40c61d:	and    $0x10,%edx
  40c620:	punpcklqdq %xmm0,%xmm0
  40c624:	je     40c632 <_ZZ4mainENKUljE_clEj+0x2112>
  40c626:	add    $0x10,%rax
  40c62a:	movups %xmm0,(%rbx)
  40c62d:	cmp    %rax,%rdi
  40c630:	je     40c642 <_ZZ4mainENKUljE_clEj+0x2122>
  40c632:	movups %xmm0,(%rax)
  40c635:	add    $0x20,%rax
  40c639:	movups %xmm0,-0x10(%rax)
  40c63d:	cmp    %rax,%rdi
  40c640:	jne    40c632 <_ZZ4mainENKUljE_clEj+0x2112>
  40c642:	mov    $0x8000,%edx
  40c647:	xor    %esi,%esi
  40c649:	call   401098 <_init+0x98>
  40c64e:	pxor   %xmm0,%xmm0
  40c652:	mov    $0x20,%ecx
  40c657:	xor    %eax,%eax
  40c659:	lea    0x111b0(%r14),%rdi
  40c660:	rep stos %rax,%es:(%rdi)
  40c663:	movups %xmm0,0x112b0(%r14)
  40c66b:	movq   $0x0,0x112d0(%r14)
  40c676:	movups %xmm0,0x112c0(%r14)
  40c67e:	jmp    40b6d9 <_ZZ4mainENKUljE_clEj+0x11b9>
  40c683:	movabs $0x4000000000000000,%r15
  40c68d:	jmp    40bd41 <_ZZ4mainENKUljE_clEj+0x1821>
  40c692:	mov    0x4600(%rsp),%rdi
  40c69a:	test   %rdi,%rdi
  40c69d:	je     40c6af <_ZZ4mainENKUljE_clEj+0x218f>
  40c69f:	mov    0x4610(%rsp),%rsi
  40c6a7:	sub    %rdi,%rsi
  40c6aa:	call   40e1d0 <_ZdlPvm>
  40c6af:	mov    0x2390(%rsp),%rdi
  40c6b7:	test   %rdi,%rdi
  40c6ba:	je     40c6cc <_ZZ4mainENKUljE_clEj+0x21ac>
  40c6bc:	mov    0x23a0(%rsp),%rsi
  40c6c4:	sub    %rdi,%rsi
  40c6c7:	call   40e1d0 <_ZdlPvm>
  40c6cc:	mov    0x2378(%rsp),%rdi
  40c6d4:	test   %rdi,%rdi
  40c6d7:	je     40c6e9 <_ZZ4mainENKUljE_clEj+0x21c9>
  40c6d9:	mov    0x2388(%rsp),%rsi
  40c6e1:	sub    %rdi,%rsi
  40c6e4:	call   40e1d0 <_ZdlPvm>
  40c6e9:	mov    0x2350(%rsp),%rdi
  40c6f1:	test   %rdi,%rdi
  40c6f4:	je     40c706 <_ZZ4mainENKUljE_clEj+0x21e6>
  40c6f6:	mov    0x2360(%rsp),%rsi
  40c6fe:	sub    %rdi,%rsi
  40c701:	call   40e1d0 <_ZdlPvm>
  40c706:	mov    0xe0(%rsp),%rdi
  40c70e:	test   %rdi,%rdi
  40c711:	je     40c723 <_ZZ4mainENKUljE_clEj+0x2203>
  40c713:	mov    0xf0(%rsp),%rsi
  40c71b:	sub    %rdi,%rsi
  40c71e:	call   40e1d0 <_ZdlPvm>
  40c723:	mov    0xc8(%rsp),%rdi
  40c72b:	test   %rdi,%rdi
  40c72e:	je     40c740 <_ZZ4mainENKUljE_clEj+0x2220>
  40c730:	mov    0xd8(%rsp),%rsi
  40c738:	sub    %rdi,%rsi
  40c73b:	call   40e1d0 <_ZdlPvm>
  40c740:	add    $0x4628,%rsp
  40c747:	pop    %rbx
  40c748:	pop    %rbp
  40c749:	pop    %r12
  40c74b:	pop    %r13
  40c74d:	pop    %r14
  40c74f:	pop    %r15
  40c751:	ret
  40c752:	mov    $0x10,%edx
  40c757:	add    %eax,%eax
  40c759:	cmp    %edx,%eax
  40c75b:	cmovb  %edx,%eax
  40c75e:	lea    0x0(,%rax,4),%esi
  40c765:	mov    %eax,0x30c(%rsp)
  40c76c:	call   442d00 <__libc_realloc>
  40c771:	mov    %rax,0x300(%rsp)
  40c779:	mov    %rax,%rdi
  40c77c:	mov    0x308(%rsp),%eax
  40c783:	jmp    40aa47 <_ZZ4mainENKUljE_clEj+0x527>
  40c788:	mov    $0x10,%edx
  40c78d:	add    %eax,%eax
  40c78f:	cmp    %edx,%eax
  40c791:	cmovb  %edx,%eax
  40c794:	lea    0x0(,%rax,4),%esi
  40c79b:	mov    %eax,0x25bc(%rsp)
  40c7a2:	call   442d00 <__libc_realloc>
  40c7a7:	mov    %rax,0x25b0(%rsp)
  40c7af:	mov    %rax,%rdi
  40c7b2:	mov    0x25b8(%rsp),%eax
  40c7b9:	jmp    40abc1 <_ZZ4mainENKUljE_clEj+0x6a1>
  40c7be:	mov    0x112c8(%r14),%r12
  40c7c5:	mov    0x112d0(%r14),%r13
  40c7cc:	mov    0x112c0(%r14),%rbp
  40c7d3:	cmp    %r13,%r12
  40c7d6:	je     40cbb6 <_ZZ4mainENKUljE_clEj+0x2696>
  40c7dc:	mov    0x7c(%rsp),%eax
  40c7e0:	lea    0x10(%r12),%r15
  40c7e5:	movq   $0x0,(%r12)
  40c7ed:	xor    %esi,%esi
  40c7ef:	mov    %eax,0x8(%r12)
  40c7f4:	mov    %r15,0x112c8(%r14)
  40c7fb:	mov    %r15,%rax
  40c7fe:	sub    %rbp,%rax
  40c801:	mov    %rax,%rcx
  40c804:	lea    -0x10(%rbp,%rax,1),%rax
  40c809:	sar    $0x4,%rcx
  40c80d:	lea    -0x1(%rcx),%rdx
  40c811:	sub    $0x2,%rcx
  40c815:	sar    $1,%rcx
  40c818:	test   %rdx,%rdx
  40c81b:	jle    40c842 <_ZZ4mainENKUljE_clEj+0x2322>
  40c81d:	mov    %rcx,%rax
  40c820:	shl    $0x4,%rax
  40c824:	add    %rbp,%rax
  40c827:	mov    (%rax),%rdi
  40c82a:	cmp    %rdi,%rsi
  40c82d:	jb     40c851 <_ZZ4mainENKUljE_clEj+0x2331>
  40c82f:	cmp    %rsi,%rdi
  40c832:	je     40ca35 <_ZZ4mainENKUljE_clEj+0x2515>
  40c838:	mov    %rdx,%rax
  40c83b:	shl    $0x4,%rax
  40c83f:	add    %rbp,%rax
  40c842:	mov    0x7c(%rsp),%edi
  40c846:	mov    %rsi,(%rax)
  40c849:	mov    %edi,0x8(%rax)
  40c84c:	jmp    40b9f5 <_ZZ4mainENKUljE_clEj+0x14d5>
  40c851:	mov    0x8(%rax),%r8d
  40c855:	shl    $0x4,%rdx
  40c859:	mov    %rdi,0x0(%rbp,%rdx,1)
  40c85e:	mov    %r8d,0x8(%rbp,%rdx,1)
  40c863:	lea    -0x1(%rcx),%rdx
  40c867:	shr    $0x3f,%rdx
  40c86b:	lea    -0x1(%rdx,%rcx,1),%rdi
  40c870:	mov    %rcx,%rdx
  40c873:	test   %rcx,%rcx
  40c876:	je     40c842 <_ZZ4mainENKUljE_clEj+0x2322>
  40c878:	sar    $1,%rdi
  40c87b:	mov    %rdi,%rcx
  40c87e:	jmp    40c81d <_ZZ4mainENKUljE_clEj+0x22fd>
  40c880:	mov    0x8958(%r14),%rbp
  40c887:	mov    0x8960(%r14),%r13
  40c88e:	mov    0x8950(%r14),%r12
  40c895:	cmp    %r13,%rbp
  40c898:	je     40cac5 <_ZZ4mainENKUljE_clEj+0x25a5>
  40c89e:	mov    0x88(%rsp),%eax
  40c8a5:	movq   $0x0,0x0(%rbp)
  40c8ad:	xor    %esi,%esi
  40c8af:	mov    %eax,0x8(%rbp)
  40c8b2:	lea    0x10(%rbp),%rax
  40c8b6:	mov    %rax,0x8958(%r14)
  40c8bd:	sub    %r12,%rax
  40c8c0:	mov    %rax,%rcx
  40c8c3:	lea    -0x10(%r12,%rax,1),%rax
  40c8c8:	sar    $0x4,%rcx
  40c8cc:	lea    -0x1(%rcx),%rdx
  40c8d0:	sub    $0x2,%rcx
  40c8d4:	sar    $1,%rcx
  40c8d7:	test   %rdx,%rdx
  40c8da:	jle    40c901 <_ZZ4mainENKUljE_clEj+0x23e1>
  40c8dc:	mov    %rcx,%rax
  40c8df:	shl    $0x4,%rax
  40c8e3:	add    %r12,%rax
  40c8e6:	mov    (%rax),%rdi
  40c8e9:	cmp    %rdi,%rsi
  40c8ec:	jb     40c913 <_ZZ4mainENKUljE_clEj+0x23f3>
  40c8ee:	cmp    %rsi,%rdi
  40c8f1:	je     40ca1e <_ZZ4mainENKUljE_clEj+0x24fe>
  40c8f7:	mov    %rdx,%rax
  40c8fa:	shl    $0x4,%rax
  40c8fe:	add    %r12,%rax
  40c901:	mov    0x88(%rsp),%edi
  40c908:	mov    %rsi,(%rax)
  40c90b:	mov    %edi,0x8(%rax)
  40c90e:	jmp    40b87b <_ZZ4mainENKUljE_clEj+0x135b>
  40c913:	mov    0x8(%rax),%r8d
  40c917:	shl    $0x4,%rdx
  40c91b:	mov    %rdi,(%r12,%rdx,1)
  40c91f:	mov    %r8d,0x8(%r12,%rdx,1)
  40c924:	lea    -0x1(%rcx),%rdx
  40c928:	shr    $0x3f,%rdx
  40c92c:	lea    -0x1(%rdx,%rcx,1),%rdi
  40c931:	mov    %rcx,%rdx
  40c934:	test   %rcx,%rcx
  40c937:	je     40c901 <_ZZ4mainENKUljE_clEj+0x23e1>
  40c939:	sar    $1,%rdi
  40c93c:	mov    %rdi,%rcx
  40c93f:	jmp    40c8dc <_ZZ4mainENKUljE_clEj+0x23bc>
  40c941:	mov    0x8998(%r14),%rdx
  40c948:	sub    0x8990(%r14),%rdx
  40c94f:	shl    $0x9,%rdx
  40c953:	movdqa 0xafa65(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c95b:	add    0x89a8(%r14),%rdx
  40c962:	mov    %rdx,%rax
  40c965:	lea    0x800(%rdx),%rdi
  40c96c:	movups %xmm0,(%rax)
  40c96f:	add    $0x20,%rax
  40c973:	movups %xmm0,-0x10(%rax)
  40c977:	cmp    %rdi,%rax
  40c97a:	jne    40c96c <_ZZ4mainENKUljE_clEj+0x244c>
  40c97c:	mov    %rdx,(%rsi)
  40c97f:	lea    0xc0(%rsp),%rax
  40c987:	lea    0xb8(%rsp),%rsi
  40c98f:	lea    0x8990(%r14),%rdi
  40c996:	mov    %ecx,0xb8(%rsp)
  40c99d:	mov    %rax,0x70(%rsp)
  40c9a2:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c9a7:	mov    0x8978(%r14),%rax
  40c9ae:	mov    (%rax,%rbp,8),%rax
  40c9b2:	jmp    40b998 <_ZZ4mainENKUljE_clEj+0x1478>
  40c9b7:	mov    0x28(%r14),%rdx
  40c9bb:	sub    0x20(%r14),%rdx
  40c9bf:	shl    $0x9,%rdx
  40c9c3:	movdqa 0xaf9f5(%rip),%xmm0        # 4bc3c0 <max.0+0x20>
  40c9cb:	add    0x38(%r14),%rdx
  40c9cf:	mov    %rdx,%rax
  40c9d2:	lea    0x800(%rdx),%rdi
  40c9d9:	movups %xmm0,(%rax)
  40c9dc:	add    $0x20,%rax
  40c9e0:	movups %xmm0,-0x10(%rax)
  40c9e4:	cmp    %rdi,%rax
  40c9e7:	jne    40c9d9 <_ZZ4mainENKUljE_clEj+0x24b9>
  40c9e9:	mov    %rdx,(%rsi)
  40c9ec:	lea    0xc0(%rsp),%rax
  40c9f4:	lea    0xb4(%rsp),%rsi
  40c9fc:	lea    0x20(%r14),%rdi
  40ca00:	mov    %ecx,0xb4(%rsp)
  40ca07:	mov    %rax,0x70(%rsp)
  40ca0c:	call   409d80 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40ca11:	mov    0x8(%r14),%rax
  40ca15:	mov    (%rax,%rbp,8),%rax
  40ca19:	jmp    40b818 <_ZZ4mainENKUljE_clEj+0x12f8>
  40ca1e:	mov    0x8(%rax),%r8d
  40ca22:	cmp    %r8d,0x88(%rsp)
  40ca2a:	jb     40c917 <_ZZ4mainENKUljE_clEj+0x23f7>
  40ca30:	jmp    40c8f7 <_ZZ4mainENKUljE_clEj+0x23d7>
  40ca35:	mov    0x8(%rax),%r8d
  40ca39:	cmp    %r8d,0x7c(%rsp)
  40ca3e:	jb     40c855 <_ZZ4mainENKUljE_clEj+0x2335>
  40ca44:	jmp    40c838 <_ZZ4mainENKUljE_clEj+0x2318>
  40ca49:	mov    $0x10,%edx
  40ca4e:	add    %eax,%eax
  40ca50:	cmp    %edx,%eax
  40ca52:	cmovb  %edx,%eax
  40ca55:	mov    %eax,0x91bc(%r14)
  40ca5c:	lea    0x0(,%rax,4),%esi
  40ca63:	call   442d00 <__libc_realloc>
  40ca68:	mov    %rax,0x91b0(%r14)
  40ca6f:	mov    %rax,%rdi
  40ca72:	mov    0x91b8(%r14),%eax
  40ca79:	jmp    40b9d6 <_ZZ4mainENKUljE_clEj+0x14b6>
  40ca7e:	mov    $0x10,%edx
  40ca83:	add    %eax,%eax
  40ca85:	cmp    %edx,%eax
  40ca87:	cmovb  %edx,%eax
  40ca8a:	mov    %eax,0x84c(%r14)
  40ca91:	lea    0x0(,%rax,4),%esi
  40ca98:	call   442d00 <__libc_realloc>
  40ca9d:	mov    %rax,0x840(%r14)
  40caa4:	mov    %rax,%rdi
  40caa7:	mov    0x848(%r14),%eax
  40caae:	jmp    40b859 <_ZZ4mainENKUljE_clEj+0x1339>
  40cab3:	lea    0x100(%rsp),%rax
  40cabb:	mov    %rax,0x28(%rsp)
  40cac0:	jmp    40a5dd <_ZZ4mainENKUljE_clEj+0xbd>
  40cac5:	movabs $0x7ffffffffffffff,%rax
  40cacf:	mov    %rbp,%rcx
  40cad2:	sub    %r12,%rcx
  40cad5:	mov    %rcx,%rdx
  40cad8:	sar    $0x4,%rdx
  40cadc:	cmp    %rax,%rdx
  40cadf:	je     401216 <_ZZ4mainENKUljE_clEj.cold+0x78>
  40cae5:	test   %rdx,%rdx
  40cae8:	mov    $0x1,%eax
  40caed:	mov    %rcx,(%rsp)
  40caf1:	cmovne %rdx,%rax
  40caf5:	add    %rdx,%rax
  40caf8:	movabs $0x7ffffffffffffff,%rdx
  40cb02:	cmp    %rdx,%rax
  40cb05:	cmova  %rdx,%rax
  40cb09:	shl    $0x4,%rax
  40cb0d:	mov    %rax,%rbx
  40cb10:	lea    0xc0(%rsp),%rax
  40cb18:	mov    %rbx,%rdi
  40cb1b:	mov    %rax,0x70(%rsp)
  40cb20:	call   40e2a0 <_Znwm>
  40cb25:	mov    (%rsp),%rcx
  40cb29:	mov    0x88(%rsp),%edi
  40cb30:	mov    %rax,%r15
  40cb33:	movq   $0x0,(%rax,%rcx,1)
  40cb3b:	mov    %edi,0x8(%rax,%rcx,1)
  40cb3f:	cmp    %r12,%rbp
  40cb42:	je     40cc9a <_ZZ4mainENKUljE_clEj+0x277a>
  40cb48:	mov    %rax,%rdx
  40cb4b:	mov    %r12,%rax
  40cb4e:	movdqu (%rax),%xmm0
  40cb52:	add    $0x10,%rax
  40cb56:	add    $0x10,%rdx
  40cb5a:	movups %xmm0,-0x10(%rdx)
  40cb5e:	cmp    %rax,%rbp
  40cb61:	jne    40cb4e <_ZZ4mainENKUljE_clEj+0x262e>
  40cb63:	sub    %r12,%rbp
  40cb66:	add    %r15,%rbp
  40cb69:	lea    0x10(%rbp),%rax
  40cb6d:	test   %r12,%r12
  40cb70:	je     40cb88 <_ZZ4mainENKUljE_clEj+0x2668>
  40cb72:	mov    %r13,%rsi
  40cb75:	mov    %r12,%rdi
  40cb78:	mov    %rax,(%rsp)
  40cb7c:	sub    %r12,%rsi
  40cb7f:	call   40e1d0 <_ZdlPvm>
  40cb84:	mov    (%rsp),%rax
  40cb88:	mov    0x8(%rbp),%edi
  40cb8b:	add    %r15,%rbx
  40cb8e:	mov    %r15,0x8950(%r14)
  40cb95:	mov    %r15,%r12
  40cb98:	mov    %rax,0x8958(%r14)
  40cb9f:	mov    0x0(%rbp),%rsi
  40cba3:	mov    %rbx,0x8960(%r14)
  40cbaa:	mov    %edi,0x88(%rsp)
  40cbb1:	jmp    40c8bd <_ZZ4mainENKUljE_clEj+0x239d>
  40cbb6:	movabs $0x7ffffffffffffff,%rdx
  40cbc0:	mov    %r12,%r15
  40cbc3:	sub    %rbp,%r15
  40cbc6:	mov    %r15,%rax
  40cbc9:	sar    $0x4,%rax
  40cbcd:	cmp    %rdx,%rax
  40cbd0:	je     40122d <_ZZ4mainENKUljE_clEj.cold+0x8f>
  40cbd6:	test   %rax,%rax
  40cbd9:	mov    $0x1,%ebx
  40cbde:	cmovne %rax,%rbx
  40cbe2:	add    %rax,%rbx
  40cbe5:	movabs $0x7ffffffffffffff,%rax
  40cbef:	cmp    %rax,%rbx
  40cbf2:	cmova  %rax,%rbx
  40cbf6:	lea    0xc0(%rsp),%rax
  40cbfe:	mov    %rax,0x70(%rsp)
  40cc03:	shl    $0x4,%rbx
  40cc07:	mov    %rbx,%rdi
  40cc0a:	call   40e2a0 <_Znwm>
  40cc0f:	movq   $0x0,(%rax,%r15,1)
  40cc17:	mov    %rax,%rcx
  40cc1a:	mov    0x7c(%rsp),%eax
  40cc1e:	mov    %eax,0x8(%rcx,%r15,1)
  40cc23:	cmp    %rbp,%r12
  40cc26:	je     40cca2 <_ZZ4mainENKUljE_clEj+0x2782>
  40cc28:	mov    %rcx,%rdx
  40cc2b:	mov    %rbp,%rax
  40cc2e:	movdqu (%rax),%xmm0
  40cc32:	add    $0x10,%rax
  40cc36:	add    $0x10,%rdx
  40cc3a:	movups %xmm0,-0x10(%rdx)
  40cc3e:	cmp    %rax,%r12
  40cc41:	jne    40cc2e <_ZZ4mainENKUljE_clEj+0x270e>
  40cc43:	mov    %r12,%rax
  40cc46:	sub    %rbp,%rax
  40cc49:	lea    (%rcx,%rax,1),%r12
  40cc4d:	lea    0x10(%r12),%r15
  40cc52:	test   %rbp,%rbp
  40cc55:	je     40cc6d <_ZZ4mainENKUljE_clEj+0x274d>
  40cc57:	mov    %r13,%rsi
  40cc5a:	mov    %rbp,%rdi
  40cc5d:	mov    %rcx,(%rsp)
  40cc61:	sub    %rbp,%rsi
  40cc64:	call   40e1d0 <_ZdlPvm>
  40cc69:	mov    (%rsp),%rcx
  40cc6d:	mov    0x8(%r12),%eax
  40cc72:	add    %rcx,%rbx
  40cc75:	mov    (%r12),%rsi
  40cc79:	mov    %rcx,%rbp
  40cc7c:	mov    %rcx,0x112c0(%r14)
  40cc83:	mov    %r15,0x112c8(%r14)
  40cc8a:	mov    %rbx,0x112d0(%r14)
  40cc91:	mov    %eax,0x7c(%rsp)
  40cc95:	jmp    40c7fb <_ZZ4mainENKUljE_clEj+0x22db>
  40cc9a:	mov    %rax,%rbp
  40cc9d:	jmp    40cb69 <_ZZ4mainENKUljE_clEj+0x2649>
  40cca2:	mov    %rcx,%r12
  40cca5:	jmp    40cc4d <_ZZ4mainENKUljE_clEj+0x272d>
  40cca7:	mov    %rax,%rbx
  40ccaa:	jmp    40119e <_ZZ4mainENKUljE_clEj.cold>
  40ccaf:	mov    %rax,%rbx
  40ccb2:	jmp    401201 <_ZZ4mainENKUljE_clEj.cold+0x63>
  40ccb7:	jmp    401244 <_ZZ4mainENKUljE_clEj.cold+0xa6>
  40ccbc:	mov    %rax,%rbx
  40ccbf:	jmp    4011c8 <_ZZ4mainENKUljE_clEj.cold+0x2a>

Disassembly of section .fini:
