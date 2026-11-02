
work/bin/prefix_csr24index_load_dbg:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

000000000040b650 <_ZZ4mainENKUljE_clEj>:
  40b650:	push   %r15
  40b652:	push   %r14
  40b654:	push   %r13
  40b656:	push   %r12
  40b658:	push   %rbp
  40b659:	push   %rbx
  40b65a:	sub    $0x4438,%rsp
  40b661:	mov    (%rdi),%rax
  40b664:	mov    %rdi,0x90(%rsp)
  40b66c:	mov    (%rax),%rax
  40b66f:	mov    (%rax),%r12d
  40b672:	mov    %rax,0xd0(%rsp)
  40b67a:	mov    %r12d,%r14d
  40b67d:	shr    $0x7,%r14d
  40b681:	lea    0x1(%r14),%ebx
  40b685:	lea    0x0(,%rbx,8),%rbp
  40b68d:	mov    %rbp,%rdi
  40b690:	call   40ea40 <_Znwm>
  40b695:	add    %rax,%rbp
  40b698:	mov    %rax,0xd8(%rsp)
  40b6a0:	mov    %rax,%rdx
  40b6a3:	mov    %rbp,0xe8(%rsp)
  40b6ab:	test   %r14d,%r14d
  40b6ae:	je     40dda3 <_ZZ4mainENKUljE_clEj+0x2753>
  40b6b4:	mov    %rbx,%rsi
  40b6b7:	lea    0x110(%rsp),%rax
  40b6bf:	mov    %rbx,%r13
  40b6c2:	shr    $1,%rsi
  40b6c5:	movq   %rax,%xmm0
  40b6ca:	mov    %rax,0x38(%rsp)
  40b6cf:	mov    %rdx,%rax
  40b6d2:	shl    $0x4,%rsi
  40b6d6:	punpcklqdq %xmm0,%xmm0
  40b6da:	lea    (%rdx,%rsi,1),%rcx
  40b6de:	and    $0x10,%esi
  40b6e1:	je     40b6ef <_ZZ4mainENKUljE_clEj+0x9f>
  40b6e3:	lea    0x10(%rdx),%rax
  40b6e7:	movups %xmm0,(%rdx)
  40b6ea:	cmp    %rax,%rcx
  40b6ed:	je     40b6ff <_ZZ4mainENKUljE_clEj+0xaf>
  40b6ef:	movups %xmm0,(%rax)
  40b6f2:	add    $0x20,%rax
  40b6f6:	movups %xmm0,-0x10(%rax)
  40b6fa:	cmp    %rax,%rcx
  40b6fd:	jne    40b6ef <_ZZ4mainENKUljE_clEj+0x9f>
  40b6ff:	and    $0x1,%r13d
  40b703:	je     40b715 <_ZZ4mainENKUljE_clEj+0xc5>
  40b705:	and    $0xfffffffffffffffe,%rbx
  40b709:	lea    (%rdx,%rbx,8),%rdx
  40b70d:	mov    0x38(%rsp),%rax
  40b712:	mov    %rax,(%rdx)
  40b715:	pxor   %xmm1,%xmm1
  40b719:	mov    $0x4022,%ecx
  40b71e:	xor    %r9d,%r9d
  40b721:	xor    %edi,%edi
  40b723:	lea    0x80(%r12),%eax
  40b72b:	mov    $0xffffffff,%r8d
  40b731:	mov    %rbp,0xe0(%rsp)
  40b739:	mov    $0x3,%edx
  40b73e:	lea    0x40(%rax,%rax,1),%rbp
  40b743:	movaps %xmm1,0xf0(%rsp)
  40b74b:	movq   $0x0,0x100(%rsp)
  40b757:	mov    %rbp,%rsi
  40b75a:	call   456790 <__mmap64>
  40b75f:	mov    %rbp,%rsi
  40b762:	mov    $0xf,%edx
  40b767:	mov    %rax,%rdi
  40b76a:	mov    %rax,%rbx
  40b76d:	call   456760 <__madvise>
  40b772:	pcmpeqd %xmm0,%xmm0
  40b776:	xor    %eax,%eax
  40b778:	mov    $0x400,%ecx
  40b77d:	lea    0x210(%rsp),%rdi
  40b785:	movaps %xmm0,0x120(%rsp)
  40b78d:	pxor   %xmm1,%xmm1
  40b791:	movaps %xmm0,0x130(%rsp)
  40b799:	movaps %xmm0,0x140(%rsp)
  40b7a1:	movaps %xmm0,0x150(%rsp)
  40b7a9:	movaps %xmm0,0x160(%rsp)
  40b7b1:	movaps %xmm0,0x170(%rsp)
  40b7b9:	movaps %xmm0,0x180(%rsp)
  40b7c1:	movaps %xmm0,0x190(%rsp)
  40b7c9:	movaps %xmm0,0x1a0(%rsp)
  40b7d1:	movaps %xmm0,0x1b0(%rsp)
  40b7d9:	movaps %xmm0,0x1c0(%rsp)
  40b7e1:	movaps %xmm0,0x1d0(%rsp)
  40b7e9:	movaps %xmm0,0x1e0(%rsp)
  40b7f1:	movaps %xmm0,0x1f0(%rsp)
  40b7f9:	movaps %xmm0,0x200(%rsp)
  40b801:	rep stos %rax,%es:(%rdi)
  40b804:	mov    0x90(%rsp),%rax
  40b80c:	movaps %xmm0,0x110(%rsp)
  40b814:	pxor   %xmm0,%xmm0
  40b818:	mov    %rbx,0x108(%rsp)
  40b820:	mov    0x8(%rax),%rax
  40b824:	movaps %xmm0,0x2210(%rsp)
  40b82c:	movq   $0x0,0x2270(%rsp)
  40b838:	mov    (%rax),%rax
  40b83b:	movaps %xmm0,0x2220(%rsp)
  40b843:	movaps %xmm0,0x2230(%rsp)
  40b84b:	mov    (%rax),%r12d
  40b84e:	mov    %rax,0x2280(%rsp)
  40b856:	movaps %xmm0,0x2240(%rsp)
  40b85e:	mov    %r12d,%r14d
  40b861:	movaps %xmm1,0x2250(%rsp)
  40b869:	shr    $0x7,%r14d
  40b86d:	movaps %xmm1,0x2260(%rsp)
  40b875:	lea    0x1(%r14),%ebx
  40b879:	lea    0x0(,%rbx,8),%rbp
  40b881:	mov    %rbx,%r13
  40b884:	mov    %rbp,%rdi
  40b887:	call   40ea40 <_Znwm>
  40b88c:	add    %rax,%rbp
  40b88f:	mov    %rax,0x2288(%rsp)
  40b897:	mov    %rax,%rdx
  40b89a:	lea    0x22c0(%rsp),%rax
  40b8a2:	mov    %rbp,0x2298(%rsp)
  40b8aa:	mov    %rax,0x30(%rsp)
  40b8af:	test   %r14d,%r14d
  40b8b2:	je     40b8fd <_ZZ4mainENKUljE_clEj+0x2ad>
  40b8b4:	mov    %rbx,%rsi
  40b8b7:	movq   %rax,%xmm0
  40b8bc:	mov    %rdx,%rax
  40b8bf:	shr    $1,%rsi
  40b8c2:	punpcklqdq %xmm0,%xmm0
  40b8c6:	shl    $0x4,%rsi
  40b8ca:	lea    (%rdx,%rsi,1),%rcx
  40b8ce:	and    $0x10,%esi
  40b8d1:	je     40b8df <_ZZ4mainENKUljE_clEj+0x28f>
  40b8d3:	lea    0x10(%rdx),%rax
  40b8d7:	movups %xmm0,(%rdx)
  40b8da:	cmp    %rax,%rcx
  40b8dd:	je     40b8ef <_ZZ4mainENKUljE_clEj+0x29f>
  40b8df:	movups %xmm0,(%rax)
  40b8e2:	add    $0x20,%rax
  40b8e6:	movups %xmm0,-0x10(%rax)
  40b8ea:	cmp    %rax,%rcx
  40b8ed:	jne    40b8df <_ZZ4mainENKUljE_clEj+0x28f>
  40b8ef:	and    $0x1,%r13d
  40b8f3:	je     40b905 <_ZZ4mainENKUljE_clEj+0x2b5>
  40b8f5:	and    $0xfffffffffffffffe,%rbx
  40b8f9:	lea    (%rdx,%rbx,8),%rdx
  40b8fd:	mov    0x30(%rsp),%rax
  40b902:	mov    %rax,(%rdx)
  40b905:	lea    0x80(%r12),%eax
  40b90d:	xor    %r9d,%r9d
  40b910:	xor    %edi,%edi
  40b912:	xor    %r13d,%r13d
  40b915:	pxor   %xmm1,%xmm1
  40b919:	mov    $0x4022,%ecx
  40b91e:	mov    $0x3,%edx
  40b923:	mov    %rbp,0x2290(%rsp)
  40b92b:	lea    0x40(%rax,%rax,1),%rbp
  40b930:	mov    $0xffffffff,%r8d
  40b936:	movaps %xmm1,0x22a0(%rsp)
  40b93e:	movq   $0x0,0x22b0(%rsp)
  40b94a:	mov    %rbp,%rsi
  40b94d:	call   456790 <__mmap64>
  40b952:	mov    $0xf,%edx
  40b957:	mov    %rbp,%rsi
  40b95a:	mov    %rax,%rdi
  40b95d:	mov    %rax,%rbx
  40b960:	call   456760 <__madvise>
  40b965:	pcmpeqd %xmm0,%xmm0
  40b969:	mov    $0x400,%ecx
  40b96e:	xor    %eax,%eax
  40b970:	lea    0x23c0(%rsp),%rdi
  40b978:	movaps %xmm0,0x22d0(%rsp)
  40b980:	pxor   %xmm1,%xmm1
  40b984:	movaps %xmm0,0x22e0(%rsp)
  40b98c:	movaps %xmm0,0x22f0(%rsp)
  40b994:	movaps %xmm0,0x2300(%rsp)
  40b99c:	movaps %xmm0,0x2310(%rsp)
  40b9a4:	movaps %xmm0,0x2320(%rsp)
  40b9ac:	movaps %xmm0,0x2330(%rsp)
  40b9b4:	movaps %xmm0,0x2340(%rsp)
  40b9bc:	movaps %xmm0,0x2350(%rsp)
  40b9c4:	movaps %xmm0,0x2360(%rsp)
  40b9cc:	movaps %xmm0,0x2370(%rsp)
  40b9d4:	movaps %xmm0,0x2380(%rsp)
  40b9dc:	movaps %xmm0,0x2390(%rsp)
  40b9e4:	movaps %xmm0,0x23a0(%rsp)
  40b9ec:	movaps %xmm0,0x23b0(%rsp)
  40b9f4:	rep stos %rax,%es:(%rdi)
  40b9f7:	mov    %rbx,0x22b8(%rsp)
  40b9ff:	movq   $0x0,0x4420(%rsp)
  40ba0b:	movaps %xmm0,0x22c0(%rsp)
  40ba13:	pxor   %xmm0,%xmm0
  40ba17:	movaps %xmm0,0x43c0(%rsp)
  40ba1f:	movaps %xmm0,0x43d0(%rsp)
  40ba27:	movaps %xmm0,0x43e0(%rsp)
  40ba2f:	movaps %xmm0,0x43f0(%rsp)
  40ba37:	movaps %xmm1,0x4400(%rsp)
  40ba3f:	movaps %xmm1,0x4410(%rsp)
  40ba47:	nopw   0x0(%rax,%rax,1)
  40ba50:	mov    0x90(%rsp),%rdi
  40ba58:	mov    $0x1,%edx
  40ba5d:	mov    0x10(%rdi),%rax
  40ba61:	lock xadd %rdx,(%rax)
  40ba66:	mov    0x18(%rdi),%rax
  40ba6a:	cmp    (%rax),%rdx
  40ba6d:	jae    40d974 <_ZZ4mainENKUljE_clEj+0x2324>
  40ba73:	mov    0x90(%rsp),%rdi
  40ba7b:	mov    0x20(%rdi),%rax
  40ba7f:	mov    (%rax),%rax
  40ba82:	mov    (%rax,%rdx,4),%eax
  40ba85:	lea    (%rax,%rax,1),%ecx
  40ba88:	mov    %eax,0x9c(%rsp)
  40ba8f:	mov    0x28(%rdi),%rax
  40ba93:	mov    %rcx,%rdx
  40ba96:	mov    (%rax),%rax
  40ba99:	add    $0x1,%edx
  40ba9c:	mov    (%rax,%rcx,4),%edi
  40ba9f:	mov    (%rax,%rdx,4),%esi
  40baa2:	mov    %edi,0x98(%rsp)
  40baa9:	mov    %esi,0x8c(%rsp)
  40bab0:	cmp    %esi,%edi
  40bab2:	je     40d4bf <_ZZ4mainENKUljE_clEj+0x1e6f>
  40bab8:	mov    0xd0(%rsp),%rax
  40bac0:	mov    %edi,%ebx
  40bac2:	add    $0x1,%edi
  40bac5:	mov    %rdi,0xa8(%rsp)
  40bacd:	mov    0x8(%rax),%rax
  40bad1:	mov    %rbx,0xa0(%rsp)
  40bad9:	mov    (%rax,%rdi,4),%edi
  40badc:	cmp    %edi,(%rax,%rbx,4)
  40badf:	je     40c950 <_ZZ4mainENKUljE_clEj+0x1300>
  40bae5:	mov    0x2280(%rsp),%rax
  40baed:	lea    0x1(%rsi),%ecx
  40baf0:	mov    0x8(%rax),%rdx
  40baf4:	mov    %esi,%eax
  40baf6:	mov    (%rdx,%rcx,4),%edi
  40baf9:	cmp    %edi,(%rdx,%rax,4)
  40bafc:	je     40c950 <_ZZ4mainENKUljE_clEj+0x1300>
  40bb02:	mov    0xf0(%rsp),%rdi
  40bb0a:	mov    0xf8(%rsp),%rcx
  40bb12:	cmp    %rcx,%rdi
  40bb15:	je     40bb47 <_ZZ4mainENKUljE_clEj+0x4f7>
  40bb17:	mov    0xd8(%rsp),%rsi
  40bb1f:	mov    0x38(%rsp),%r8
  40bb24:	mov    %rdi,%rax
  40bb27:	nopw   0x0(%rax,%rax,1)
  40bb30:	mov    (%rax),%edx
  40bb32:	add    $0x4,%rax
  40bb36:	mov    %r8,(%rsi,%rdx,8)
  40bb3a:	cmp    %rax,%rcx
  40bb3d:	jne    40bb30 <_ZZ4mainENKUljE_clEj+0x4e0>
  40bb3f:	mov    %rdi,0xf8(%rsp)
  40bb47:	lea    0xd0(%rsp),%rax
  40bb4f:	lea    0x2210(%rsp),%rsi
  40bb57:	xor    %ecx,%ecx
  40bb59:	mov    %rax,0x80(%rsp)
  40bb61:	lea    0x2250(%rsp),%rdi
  40bb69:	nopl   0x0(%rax)
  40bb70:	mov    (%rsi),%rax
  40bb73:	test   %rax,%rax
  40bb76:	je     40bba3 <_ZZ4mainENKUljE_clEj+0x553>
  40bb78:	nopl   0x0(%rax,%rax,1)
  40bb80:	xor    %edx,%edx
  40bb82:	tzcnt  %rax,%rdx
  40bb87:	add    %ecx,%edx
  40bb89:	mov    %edx,%edx
  40bb8b:	shl    $0x4,%rdx
  40bb8f:	movl   $0x0,0x218(%rsp,%rdx,1)
  40bb9a:	lea    -0x1(%rax),%rdx
  40bb9e:	and    %rdx,%rax
  40bba1:	jne    40bb80 <_ZZ4mainENKUljE_clEj+0x530>
  40bba3:	movq   $0x0,(%rsi)
  40bbaa:	add    $0x8,%rsi
  40bbae:	add    $0x40,%ecx
  40bbb1:	cmp    %rdi,%rsi
  40bbb4:	jne    40bb70 <_ZZ4mainENKUljE_clEj+0x520>
  40bbb6:	mov    0x2260(%rsp),%rdi
  40bbbe:	pxor   %xmm0,%xmm0
  40bbc2:	mov    0x2270(%rsp),%rsi
  40bbca:	movq   $0x0,0x2270(%rsp)
  40bbd6:	movaps %xmm0,0x2260(%rsp)
  40bbde:	test   %rdi,%rdi
  40bbe1:	je     40bbeb <_ZZ4mainENKUljE_clEj+0x59b>
  40bbe3:	sub    %rdi,%rsi
  40bbe6:	call   40e970 <_ZdlPvm>
  40bbeb:	mov    0x98(%rsp),%edx
  40bbf2:	mov    0xd8(%rsp),%rax
  40bbfa:	pxor   %xmm0,%xmm0
  40bbfe:	movaps %xmm0,0x2250(%rsp)
  40bc06:	shr    $0x7,%edx
  40bc09:	mov    %edx,%ebx
  40bc0b:	lea    (%rax,%rbx,8),%rcx
  40bc0f:	mov    (%rcx),%rax
  40bc12:	cmp    0x38(%rsp),%rax
  40bc17:	je     40d4c7 <_ZZ4mainENKUljE_clEj+0x1e77>
  40bc1d:	mov    0x98(%rsp),%edx
  40bc24:	xor    %esi,%esi
  40bc26:	mov    0x210(%rsp),%rdi
  40bc2e:	and    $0x7f,%edx
  40bc31:	mov    %si,(%rax,%rdx,2)
  40bc35:	mov    0x218(%rsp),%eax
  40bc3c:	cmp    0x21c(%rsp),%eax
  40bc43:	je     40da34 <_ZZ4mainENKUljE_clEj+0x23e4>
  40bc49:	mov    0x98(%rsp),%esi
  40bc50:	mov    0x22a8(%rsp),%rcx
  40bc58:	mov    %esi,(%rdi,%rax,4)
  40bc5b:	mov    0x22a0(%rsp),%rdi
  40bc63:	addl   $0x1,0x218(%rsp)
  40bc6b:	addq   $0x1,0x2258(%rsp)
  40bc74:	orq    $0x1,0x2210(%rsp)
  40bc7d:	cmp    %rcx,%rdi
  40bc80:	je     40bcb7 <_ZZ4mainENKUljE_clEj+0x667>
  40bc82:	mov    0x2288(%rsp),%rsi
  40bc8a:	mov    0x30(%rsp),%r8
  40bc8f:	mov    %rdi,%rax
  40bc92:	data16 cs nopw 0x0(%rax,%rax,1)
  40bc9d:	nopl   (%rax)
  40bca0:	mov    (%rax),%edx
  40bca2:	add    $0x4,%rax
  40bca6:	mov    %r8,(%rsi,%rdx,8)
  40bcaa:	cmp    %rax,%rcx
  40bcad:	jne    40bca0 <_ZZ4mainENKUljE_clEj+0x650>
  40bcaf:	mov    %rdi,0x22a8(%rsp)
  40bcb7:	mov    0x80(%rsp),%rax
  40bcbf:	xor    %ecx,%ecx
  40bcc1:	lea    0x42f0(%rax),%rsi
  40bcc8:	lea    0x4330(%rax),%rdi
  40bccf:	nop
  40bcd0:	mov    (%rsi),%rax
  40bcd3:	test   %rax,%rax
  40bcd6:	je     40bd23 <_ZZ4mainENKUljE_clEj+0x6d3>
  40bcd8:	data16 cs nopw 0x0(%rax,%rax,1)
  40bce3:	data16 cs nopw 0x0(%rax,%rax,1)
  40bcee:	data16 cs nopw 0x0(%rax,%rax,1)
  40bcf9:	nopl   0x0(%rax)
  40bd00:	xor    %edx,%edx
  40bd02:	tzcnt  %rax,%rdx
  40bd07:	add    %ecx,%edx
  40bd09:	mov    %edx,%edx
  40bd0b:	shl    $0x4,%rdx
  40bd0f:	movl   $0x0,0x23c8(%rsp,%rdx,1)
  40bd1a:	lea    -0x1(%rax),%rdx
  40bd1e:	and    %rdx,%rax
  40bd21:	jne    40bd00 <_ZZ4mainENKUljE_clEj+0x6b0>
  40bd23:	movq   $0x0,(%rsi)
  40bd2a:	add    $0x8,%rsi
  40bd2e:	add    $0x40,%ecx
  40bd31:	cmp    %rdi,%rsi
  40bd34:	jne    40bcd0 <_ZZ4mainENKUljE_clEj+0x680>
  40bd36:	mov    0x4410(%rsp),%rdi
  40bd3e:	pxor   %xmm0,%xmm0
  40bd42:	mov    0x4420(%rsp),%rsi
  40bd4a:	movq   $0x0,0x4420(%rsp)
  40bd56:	movaps %xmm0,0x4410(%rsp)
  40bd5e:	test   %rdi,%rdi
  40bd61:	je     40bd6b <_ZZ4mainENKUljE_clEj+0x71b>
  40bd63:	sub    %rdi,%rsi
  40bd66:	call   40e970 <_ZdlPvm>
  40bd6b:	mov    0x8c(%rsp),%edx
  40bd72:	mov    0x2288(%rsp),%rax
  40bd7a:	pxor   %xmm0,%xmm0
  40bd7e:	movaps %xmm0,0x4400(%rsp)
  40bd86:	shr    $0x7,%edx
  40bd89:	mov    %edx,%ebx
  40bd8b:	lea    (%rax,%rbx,8),%rcx
  40bd8f:	mov    (%rcx),%rax
  40bd92:	cmp    0x30(%rsp),%rax
  40bd97:	je     40d56e <_ZZ4mainENKUljE_clEj+0x1f1e>
  40bd9d:	mov    0x8c(%rsp),%edx
  40bda4:	xor    %ecx,%ecx
  40bda6:	mov    0x23c0(%rsp),%rdi
  40bdae:	and    $0x7f,%edx
  40bdb1:	mov    %cx,(%rax,%rdx,2)
  40bdb5:	mov    0x23c8(%rsp),%eax
  40bdbc:	cmp    0x23cc(%rsp),%eax
  40bdc3:	je     40da6a <_ZZ4mainENKUljE_clEj+0x241a>
  40bdc9:	mov    0x8c(%rsp),%esi
  40bdd0:	mov    0x2258(%rsp),%rdx
  40bdd8:	pcmpeqd %xmm0,%xmm0
  40bddc:	movabs $0x4000000000000000,%r11
  40bde6:	mov    %esi,(%rdi,%rax,4)
  40bde9:	mov    0x4408(%rsp),%rax
  40bdf1:	addl   $0x1,0x23c8(%rsp)
  40bdf9:	orq    $0x1,0x43c0(%rsp)
  40be02:	add    $0x1,%rax
  40be06:	mov    %rax,0x4408(%rsp)
  40be0e:	xchg   %ax,%ax
  40be10:	movabs $0x4000000000000000,%rdi
  40be1a:	test   %rdx,%rdx
  40be1d:	je     40bf05 <_ZZ4mainENKUljE_clEj+0x8b5>
  40be23:	mov    0x2250(%rsp),%rcx
  40be2b:	mov    $0xffffffffffffffff,%rsi
  40be32:	mov    %ecx,%r8d
  40be35:	shl    %cl,%rsi
  40be38:	shr    $0x6,%r8d
  40be3c:	mov    %rsi,%rcx
  40be3f:	mov    %r8d,%edi
  40be42:	and    $0x7,%r8d
  40be46:	and    $0x7,%edi
  40be49:	and    0x2210(%rsp,%r8,8),%rcx
  40be51:	jne    40c943 <_ZZ4mainENKUljE_clEj+0x12f3>
  40be57:	lea    0x1(%rdi),%ecx
  40be5a:	mov    %rcx,%rsi
  40be5d:	mov    0x2210(%rsp,%rcx,8),%rcx
  40be65:	test   %rcx,%rcx
  40be68:	jne    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40be6e:	lea    0x2(%rdi),%ecx
  40be71:	mov    %rcx,%rsi
  40be74:	mov    0x2210(%rsp,%rcx,8),%rcx
  40be7c:	test   %rcx,%rcx
  40be7f:	jne    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40be81:	lea    0x3(%rdi),%ecx
  40be84:	mov    %rcx,%rsi
  40be87:	mov    0x2210(%rsp,%rcx,8),%rcx
  40be8f:	test   %rcx,%rcx
  40be92:	jne    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40be94:	lea    0x4(%rdi),%ecx
  40be97:	mov    %rcx,%rsi
  40be9a:	mov    0x2210(%rsp,%rcx,8),%rcx
  40bea2:	test   %rcx,%rcx
  40bea5:	jne    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40bea7:	lea    0x5(%rdi),%ecx
  40beaa:	mov    %rcx,%rsi
  40bead:	mov    0x2210(%rsp,%rcx,8),%rcx
  40beb5:	test   %rcx,%rcx
  40beb8:	jne    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40beba:	lea    0x6(%rdi),%ecx
  40bebd:	mov    %rcx,%rsi
  40bec0:	mov    0x2210(%rsp,%rcx,8),%rcx
  40bec8:	test   %rcx,%rcx
  40becb:	jne    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40becd:	lea    0x7(%rdi),%ecx
  40bed0:	mov    %rcx,%rsi
  40bed3:	mov    0x2210(%rsp,%rcx,8),%rcx
  40bedb:	test   %rcx,%rcx
  40bede:	jne    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40bee0:	lea    0x8(%rdi),%ecx
  40bee3:	mov    %rcx,%rsi
  40bee6:	mov    0x2210(%rsp,%rcx,8),%rcx
  40beee:	tzcnt  %rcx,%rcx
  40bef3:	shl    $0x6,%esi
  40bef6:	lea    (%rsi,%rcx,1),%edi
  40bef9:	mov    %rdi,0x2250(%rsp)
  40bf01:	shl    $0x7,%rdi
  40bf05:	test   %rax,%rax
  40bf08:	je     40c910 <_ZZ4mainENKUljE_clEj+0x12c0>
  40bf0e:	mov    0x4400(%rsp),%rcx
  40bf16:	mov    $0xffffffffffffffff,%rsi
  40bf1d:	mov    %ecx,%r9d
  40bf20:	shl    %cl,%rsi
  40bf23:	shr    $0x6,%r9d
  40bf27:	mov    %rsi,%rcx
  40bf2a:	mov    %r9d,%r8d
  40bf2d:	and    $0x7,%r9d
  40bf31:	and    $0x7,%r8d
  40bf35:	and    0x43c0(%rsp,%r9,8),%rcx
  40bf3d:	jne    40c93b <_ZZ4mainENKUljE_clEj+0x12eb>
  40bf43:	lea    0x1(%r8),%ecx
  40bf47:	mov    %rcx,%rsi
  40bf4a:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bf52:	test   %rcx,%rcx
  40bf55:	jne    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40bf5b:	lea    0x2(%r8),%ecx
  40bf5f:	mov    %rcx,%rsi
  40bf62:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bf6a:	test   %rcx,%rcx
  40bf6d:	jne    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40bf6f:	lea    0x3(%r8),%ecx
  40bf73:	mov    %rcx,%rsi
  40bf76:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bf7e:	test   %rcx,%rcx
  40bf81:	jne    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40bf83:	lea    0x4(%r8),%ecx
  40bf87:	mov    %rcx,%rsi
  40bf8a:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bf92:	test   %rcx,%rcx
  40bf95:	jne    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40bf97:	lea    0x5(%r8),%ecx
  40bf9b:	mov    %rcx,%rsi
  40bf9e:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bfa6:	test   %rcx,%rcx
  40bfa9:	jne    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40bfab:	lea    0x6(%r8),%ecx
  40bfaf:	mov    %rcx,%rsi
  40bfb2:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bfba:	test   %rcx,%rcx
  40bfbd:	jne    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40bfbf:	lea    0x7(%r8),%ecx
  40bfc3:	mov    %rcx,%rsi
  40bfc6:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bfce:	test   %rcx,%rcx
  40bfd1:	jne    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40bfd3:	lea    0x8(%r8),%ecx
  40bfd7:	mov    %rcx,%rsi
  40bfda:	mov    0x43c0(%rsp,%rcx,8),%rcx
  40bfe2:	tzcnt  %rcx,%rcx
  40bfe7:	shl    $0x6,%esi
  40bfea:	lea    (%rcx,%rsi,1),%r8d
  40bfee:	movabs $0x4000000000000000,%rsi
  40bff8:	mov    %r8,0x4400(%rsp)
  40c000:	mov    %r8,%rcx
  40c003:	cmp    %rsi,%rdi
  40c006:	je     40c910 <_ZZ4mainENKUljE_clEj+0x12c0>
  40c00c:	mov    %r8,%rsi
  40c00f:	shl    $0x7,%rsi
  40c013:	add    %rdi,%rsi
  40c016:	cmp    %r11,%rsi
  40c019:	jae    40c910 <_ZZ4mainENKUljE_clEj+0x12c0>
  40c01f:	cmp    %rdx,%rax
  40c022:	jb     40c498 <_ZZ4mainENKUljE_clEj+0xe48>
  40c028:	mov    0x2250(%rsp),%rcx
  40c030:	mov    %rcx,%rsi
  40c033:	and    $0x1ff,%esi
  40c039:	lea    0x14(%rsi),%rdi
  40c03d:	mov    %rdi,%rsi
  40c040:	mov    %rdi,0x78(%rsp)
  40c045:	shl    $0x4,%rsi
  40c049:	mov    0xd8(%rsp,%rsi,1),%r9d
  40c051:	lea    0x4430(%rsp,%rsi,1),%rdi
  40c059:	mov    %rdi,0x40(%rsp)
  40c05e:	test   %r9d,%r9d
  40c061:	je     40c458 <_ZZ4mainENKUljE_clEj+0xe08>
  40c067:	mov    0xd0(%rsp),%rax
  40c06f:	movq   $0x0,0x10(%rsp)
  40c078:	mov    0x8(%rax),%rdi
  40c07c:	jmp    40c091 <_ZZ4mainENKUljE_clEj+0xa41>
  40c07e:	xchg   %ax,%ax
  40c080:	addq   $0x1,0x10(%rsp)
  40c086:	cmp    %r9d,0x10(%rsp)
  40c08b:	jae    40c445 <_ZZ4mainENKUljE_clEj+0xdf5>
  40c091:	mov    0x10(%rsp),%r14
  40c096:	lea    -0x1(%r9),%r10d
  40c09a:	mov    0x40(%rsp),%rsi
  40c09f:	lea    0x8(%r14),%edx
  40c0a3:	mov    -0x4360(%rsi),%rbx
  40c0aa:	cmp    %r10d,%edx
  40c0ad:	cmova  %r10d,%edx
  40c0b1:	mov    (%rbx,%rdx,4),%edx
  40c0b4:	mov    %edx,%esi
  40c0b6:	mov    %rdx,%r8
  40c0b9:	and    $0x7f,%edx
  40c0bc:	and    $0x1ffffff,%esi
  40c0c2:	shl    $0x27,%r8
  40c0c6:	prefetcht0 (%rdi,%rsi,4)
  40c0ca:	mov    0xd8(%rsp),%rsi
  40c0d2:	shr    $0x2e,%r8
  40c0d6:	mov    (%rsi,%r8,8),%r8
  40c0da:	prefetcht0 (%r8,%rdx,2)
  40c0df:	lea    0x4(%r14),%edx
  40c0e3:	mov    0x10(%rax),%r8
  40c0e7:	cmp    %r10d,%edx
  40c0ea:	cmova  %r10d,%edx
  40c0ee:	mov    (%rbx,%rdx,4),%edx
  40c0f1:	and    $0x1ffffff,%edx
  40c0f7:	mov    (%rdi,%rdx,4),%edx
  40c0fa:	lea    (%rdx,%rdx,2),%rdx
  40c0fe:	prefetcht0 (%r8,%rdx,1)
  40c103:	mov    (%rbx,%r14,4),%edx
  40c107:	mov    %rcx,%rbx
  40c10a:	shl    $0x7,%rbx
  40c10e:	mov    %edx,%r14d
  40c111:	mov    %edx,%r10d
  40c114:	and    $0x7f,%edx
  40c117:	and    $0x1ffffff,%r14d
  40c11e:	shr    $0x19,%r10d
  40c122:	or     %r10,%rbx
  40c125:	mov    %r14d,%r10d
  40c128:	mov    %r14d,0x20(%rsp)
  40c12d:	shr    $0x7,%r10d
  40c131:	mov    %rbx,0x18(%rsp)
  40c136:	mov    (%rsi,%r10,8),%r10
  40c13a:	movzwl (%r10,%rdx,2),%edx
  40c13f:	cmp    %rdx,%rbx
  40c142:	jne    40c080 <_ZZ4mainENKUljE_clEj+0xa30>
  40c148:	lea    0x1(%r14),%r10d
  40c14c:	mov    %r14d,%edx
  40c14f:	lea    0x0(,%r10,4),%rbx
  40c157:	mov    (%rdi,%rdx,4),%edx
  40c15a:	mov    %rbx,0x28(%rsp)
  40c15f:	cmp    (%rdi,%r10,4),%edx
  40c163:	jae    40c080 <_ZZ4mainENKUljE_clEj+0xa30>
  40c169:	mov    %edx,%ecx
  40c16b:	lea    (%rcx,%rcx,2),%rdi
  40c16f:	mov    %rdi,0x8(%rsp)
  40c174:	jmp    40c285 <_ZZ4mainENKUljE_clEj+0xc35>
  40c179:	nopl   0x0(%rax)
  40c180:	shl    $0x8,%ebp
  40c183:	sar    $0x12,%ebp
  40c186:	add    0x20(%rsp),%ebp
  40c18a:	mov    %ebp,%ecx
  40c18c:	shr    $0x7,%ecx
  40c18f:	mov    %ecx,%r8d
  40c192:	mov    (%rsi,%r8,8),%rax
  40c196:	cmp    0x38(%rsp),%rax
  40c19b:	je     40c2e0 <_ZZ4mainENKUljE_clEj+0xc90>
  40c1a1:	mov    %ebp,%r9d
  40c1a4:	add    0x18(%rsp),%rbx
  40c1a9:	and    $0x7f,%r9d
  40c1ad:	mov    %rbx,%r10
  40c1b0:	lea    (%rax,%r9,2),%rcx
  40c1b4:	movzwl (%rcx),%eax
  40c1b7:	cmp    %rax,%rbx
  40c1ba:	mov    %rax,%rsi
  40c1bd:	cmovbe %rbx,%rsi
  40c1c1:	setb   %r12b
  40c1c5:	shr    $0x7,%r10
  40c1c9:	mov    %r10,%r14
  40c1cc:	mov    %r10d,%r15d
  40c1cf:	and    $0x1ff,%r14d
  40c1d6:	mov    %si,(%rcx)
  40c1d9:	and    $0x1ff,%r15d
  40c1e0:	mov    %r14,%rcx
  40c1e3:	shl    $0x4,%rcx
  40c1e7:	mov    0x218(%rsp,%rcx,1),%eax
  40c1ee:	mov    0x210(%rsp,%rcx,1),%rdi
  40c1f6:	cmp    0x21c(%rsp,%rcx,1),%eax
  40c1fd:	je     40c3a8 <_ZZ4mainENKUljE_clEj+0xd58>
  40c203:	shl    $0x4,%r14
  40c207:	mov    %ebx,%ecx
  40c209:	shr    $0x6,%r15d
  40c20d:	mov    0x28(%rsp),%rsi
  40c212:	shl    $0x19,%ecx
  40c215:	or     %ebp,%ecx
  40c217:	mov    %ecx,(%rdi,%rax,4)
  40c21a:	movzbl %r12b,%eax
  40c21e:	mov    %r10d,%ecx
  40c221:	movzbl %r12b,%r12d
  40c225:	add    %eax,0x218(%rsp,%r14,1)
  40c22d:	mov    0x2288(%rsp),%rax
  40c235:	add    %r12,0x2258(%rsp)
  40c23d:	shl    %cl,%r12
  40c240:	mov    (%rax,%r8,8),%rax
  40c244:	or     %r12,0x2210(%rsp,%r15,8)
  40c24c:	movzwl (%rax,%r9,2),%eax
  40c251:	add    %rbx,%rax
  40c254:	cmp    %rax,%r11
  40c257:	cmova  %rax,%r11
  40c25b:	mov    0xd0(%rsp),%rax
  40c263:	add    $0x1,%edx
  40c266:	mov    0x8(%rax),%rdi
  40c26a:	cmp    (%rdi,%rsi,1),%edx
  40c26d:	jae    40c420 <_ZZ4mainENKUljE_clEj+0xdd0>
  40c273:	addq   $0x3,0x8(%rsp)
  40c279:	mov    0xd8(%rsp),%rsi
  40c281:	mov    0x10(%rax),%r8
  40c285:	mov    0x8(%rsp),%rdi
  40c28a:	mov    (%r8,%rdi,1),%ebx
  40c28e:	mov    %ebx,%ebp
  40c290:	and    $0x3ff,%ebx
  40c296:	and    $0xffffff,%ebp
  40c29c:	cmp    $0x3ff,%ebx
  40c2a2:	jne    40c180 <_ZZ4mainENKUljE_clEj+0xb30>
  40c2a8:	mov    0x18(%rax),%rdi
  40c2ac:	mov    %edx,%ecx
  40c2ae:	mov    0x30(%rax),%rax
  40c2b2:	shr    $0xa,%ebp
  40c2b5:	shr    $0xe,%ecx
  40c2b8:	add    (%rdi,%rcx,4),%ebp
  40c2bb:	mov    (%rax,%rbp,8),%rbx
  40c2bf:	mov    %rbx,%rax
  40c2c2:	shr    $0x2b,%rax
  40c2c6:	mov    %rax,%rbp
  40c2c9:	movabs $0x7ffffffffff,%rax
  40c2d3:	and    %rax,%rbx
  40c2d6:	jmp    40c18a <_ZZ4mainENKUljE_clEj+0xb3a>
  40c2db:	nopl   0x0(%rax,%rax,1)
  40c2e0:	mov    0xf8(%rsp),%rax
  40c2e8:	sub    0xf0(%rsp),%rax
  40c2f0:	mov    %r8,0x58(%rsp)
  40c2f5:	lea    0xf0(%rsp),%rdi
  40c2fd:	shl    $0x6,%rax
  40c301:	add    0x108(%rsp),%rax
  40c309:	mov    %r11,0x50(%rsp)
  40c30e:	movups %xmm0,(%rax)
  40c311:	movups %xmm0,0x10(%rax)
  40c315:	movups %xmm0,0x20(%rax)
  40c319:	movups %xmm0,0x30(%rax)
  40c31d:	movups %xmm0,0x40(%rax)
  40c321:	movups %xmm0,0x50(%rax)
  40c325:	movups %xmm0,0x60(%rax)
  40c329:	movups %xmm0,0x70(%rax)
  40c32d:	movups %xmm0,0x80(%rax)
  40c334:	movups %xmm0,0x90(%rax)
  40c33b:	movups %xmm0,0xa0(%rax)
  40c342:	movups %xmm0,0xb0(%rax)
  40c349:	movups %xmm0,0xc0(%rax)
  40c350:	movups %xmm0,0xd0(%rax)
  40c357:	movups %xmm0,0xe0(%rax)
  40c35e:	movups %xmm0,0xf0(%rax)
  40c365:	mov    %rax,(%rsi,%r8,8)
  40c369:	lea    0xbc(%rsp),%rsi
  40c371:	mov    %edx,0x48(%rsp)
  40c375:	mov    %ecx,0xbc(%rsp)
  40c37c:	call   407aa0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c381:	mov    0xd8(%rsp),%rax
  40c389:	mov    0x58(%rsp),%r8
  40c38e:	pcmpeqd %xmm0,%xmm0
  40c392:	mov    0x50(%rsp),%r11
  40c397:	mov    0x48(%rsp),%edx
  40c39b:	mov    (%rax,%r8,8),%rax
  40c39f:	jmp    40c1a1 <_ZZ4mainENKUljE_clEj+0xb51>
  40c3a4:	nopl   0x0(%rax)
  40c3a8:	mov    $0x10,%esi
  40c3ad:	add    %eax,%eax
  40c3af:	mov    %r10,0x70(%rsp)
  40c3b4:	cmp    %esi,%eax
  40c3b6:	mov    %r9,0x68(%rsp)
  40c3bb:	cmovb  %esi,%eax
  40c3be:	mov    %r8,0x60(%rsp)
  40c3c3:	mov    %r11,0x58(%rsp)
  40c3c8:	lea    0x0(,%rax,4),%esi
  40c3cf:	mov    %edx,0x50(%rsp)
  40c3d3:	mov    %eax,0x21c(%rsp,%rcx,1)
  40c3da:	mov    %rcx,0x48(%rsp)
  40c3df:	call   4434c0 <__libc_realloc>
  40c3e4:	mov    0x48(%rsp),%rcx
  40c3e9:	mov    0x70(%rsp),%r10
  40c3ee:	pcmpeqd %xmm0,%xmm0
  40c3f2:	mov    %rax,%rdi
  40c3f5:	mov    0x68(%rsp),%r9
  40c3fa:	mov    0x60(%rsp),%r8
  40c3ff:	mov    %rax,0x210(%rsp,%rcx,1)
  40c407:	mov    0x58(%rsp),%r11
  40c40c:	mov    0x218(%rsp,%rcx,1),%eax
  40c413:	mov    0x50(%rsp),%edx
  40c417:	jmp    40c203 <_ZZ4mainENKUljE_clEj+0xbb3>
  40c41c:	nopl   0x0(%rax)
  40c420:	mov    0x40(%rsp),%rsi
  40c425:	addq   $0x1,0x10(%rsp)
  40c42b:	mov    0x2250(%rsp),%rcx
  40c433:	mov    -0x4358(%rsi),%r9d
  40c43a:	cmp    %r9d,0x10(%rsp)
  40c43f:	jb     40c091 <_ZZ4mainENKUljE_clEj+0xa41>
  40c445:	mov    0x2258(%rsp),%rdx
  40c44d:	mov    0x4408(%rsp),%rax
  40c455:	sub    %r9,%rdx
  40c458:	mov    0x78(%rsp),%rsi
  40c45d:	mov    $0xfffffffffffffffe,%rdi
  40c464:	mov    %rdx,0x2258(%rsp)
  40c46c:	rol    %cl,%rdi
  40c46f:	shl    $0x4,%rsi
  40c473:	movl   $0x0,0xd8(%rsp,%rsi,1)
  40c47e:	mov    %rcx,%rsi
  40c481:	shr    $0x6,%rsi
  40c485:	and    $0x7,%esi
  40c488:	and    %rdi,0x2210(%rsp,%rsi,8)
  40c490:	jmp    40be10 <_ZZ4mainENKUljE_clEj+0x7c0>
  40c495:	nopl   (%rax)
  40c498:	mov    %r8d,%esi
  40c49b:	and    $0x1ff,%esi
  40c4a1:	lea    0x14(%rsi),%rdi
  40c4a5:	mov    %rdi,%rsi
  40c4a8:	mov    %rdi,0x78(%rsp)
  40c4ad:	shl    $0x4,%rsi
  40c4b1:	mov    0x2288(%rsp,%rsi,1),%r9d
  40c4b9:	lea    0x4430(%rsp,%rsi,1),%rdi
  40c4c1:	mov    %rdi,0x40(%rsp)
  40c4c6:	test   %r9d,%r9d
  40c4c9:	je     40c8cb <_ZZ4mainENKUljE_clEj+0x127b>
  40c4cf:	mov    0x2280(%rsp),%rax
  40c4d7:	movq   $0x0,0x10(%rsp)
  40c4e0:	mov    0x8(%rax),%rcx
  40c4e4:	jmp    40c501 <_ZZ4mainENKUljE_clEj+0xeb1>
  40c4e6:	cs nopw 0x0(%rax,%rax,1)
  40c4f0:	addq   $0x1,0x10(%rsp)
  40c4f6:	cmp    %r9d,0x10(%rsp)
  40c4fb:	jae    40c8b5 <_ZZ4mainENKUljE_clEj+0x1265>
  40c501:	mov    0x10(%rsp),%r14
  40c506:	lea    -0x1(%r9),%r10d
  40c50a:	mov    0x40(%rsp),%rsi
  40c50f:	lea    0x8(%r14),%edx
  40c513:	mov    -0x21b0(%rsi),%rbx
  40c51a:	cmp    %r10d,%edx
  40c51d:	cmova  %r10d,%edx
  40c521:	mov    (%rbx,%rdx,4),%edx
  40c524:	mov    %edx,%esi
  40c526:	mov    %rdx,%rdi
  40c529:	and    $0x7f,%edx
  40c52c:	and    $0x1ffffff,%esi
  40c532:	shl    $0x27,%rdi
  40c536:	prefetcht0 (%rcx,%rsi,4)
  40c53a:	mov    0x2288(%rsp),%rsi
  40c542:	shr    $0x2e,%rdi
  40c546:	mov    (%rsi,%rdi,8),%rdi
  40c54a:	prefetcht0 (%rdi,%rdx,2)
  40c54e:	lea    0x4(%r14),%edx
  40c552:	mov    0x10(%rax),%rdi
  40c556:	cmp    %r10d,%edx
  40c559:	cmova  %r10d,%edx
  40c55d:	mov    (%rbx,%rdx,4),%edx
  40c560:	and    $0x1ffffff,%edx
  40c566:	mov    (%rcx,%rdx,4),%edx
  40c569:	lea    (%rdx,%rdx,2),%rdx
  40c56d:	prefetcht0 (%rdi,%rdx,1)
  40c571:	mov    (%rbx,%r14,4),%edx
  40c575:	mov    %r8,%rbx
  40c578:	shl    $0x7,%rbx
  40c57c:	mov    %edx,%r15d
  40c57f:	mov    %edx,%r10d
  40c582:	and    $0x7f,%edx
  40c585:	and    $0x1ffffff,%r15d
  40c58c:	shr    $0x19,%r10d
  40c590:	or     %r10,%rbx
  40c593:	mov    %r15d,%r10d
  40c596:	mov    %r15d,0x20(%rsp)
  40c59b:	shr    $0x7,%r10d
  40c59f:	mov    %rbx,0x18(%rsp)
  40c5a4:	mov    (%rsi,%r10,8),%r10
  40c5a8:	movzwl (%r10,%rdx,2),%edx
  40c5ad:	cmp    %rdx,%rbx
  40c5b0:	jne    40c4f0 <_ZZ4mainENKUljE_clEj+0xea0>
  40c5b6:	lea    0x1(%r15),%r10d
  40c5ba:	mov    %r15d,%edx
  40c5bd:	lea    0x0(,%r10,4),%rbx
  40c5c5:	mov    (%rcx,%rdx,4),%edx
  40c5c8:	mov    %rbx,0x28(%rsp)
  40c5cd:	cmp    (%rcx,%r10,4),%edx
  40c5d1:	jae    40c4f0 <_ZZ4mainENKUljE_clEj+0xea0>
  40c5d7:	mov    %edx,%ecx
  40c5d9:	lea    (%rcx,%rcx,2),%rbx
  40c5dd:	mov    %rbx,0x8(%rsp)
  40c5e2:	jmp    40c6f5 <_ZZ4mainENKUljE_clEj+0x10a5>
  40c5e7:	nopw   0x0(%rax,%rax,1)
  40c5f0:	shl    $0x8,%ebp
  40c5f3:	sar    $0x12,%ebp
  40c5f6:	add    0x20(%rsp),%ebp
  40c5fa:	mov    %ebp,%ecx
  40c5fc:	shr    $0x7,%ecx
  40c5ff:	mov    %ecx,%r8d
  40c602:	mov    (%rsi,%r8,8),%rax
  40c606:	cmp    0x30(%rsp),%rax
  40c60b:	je     40c750 <_ZZ4mainENKUljE_clEj+0x1100>
  40c611:	mov    %ebp,%r9d
  40c614:	add    0x18(%rsp),%rbx
  40c619:	and    $0x7f,%r9d
  40c61d:	mov    %rbx,%r10
  40c620:	lea    (%rax,%r9,2),%rcx
  40c624:	movzwl (%rcx),%eax
  40c627:	cmp    %rax,%rbx
  40c62a:	mov    %rax,%rsi
  40c62d:	cmovbe %rbx,%rsi
  40c631:	setb   %r12b
  40c635:	shr    $0x7,%r10
  40c639:	mov    %r10,%r14
  40c63c:	mov    %r10d,%r15d
  40c63f:	and    $0x1ff,%r14d
  40c646:	mov    %si,(%rcx)
  40c649:	and    $0x1ff,%r15d
  40c650:	mov    %r14,%rcx
  40c653:	shl    $0x4,%rcx
  40c657:	mov    0x23c8(%rsp,%rcx,1),%eax
  40c65e:	mov    0x23c0(%rsp,%rcx,1),%rdi
  40c666:	cmp    0x23cc(%rsp,%rcx,1),%eax
  40c66d:	je     40c818 <_ZZ4mainENKUljE_clEj+0x11c8>
  40c673:	shl    $0x4,%r14
  40c677:	mov    %ebx,%ecx
  40c679:	shr    $0x6,%r15d
  40c67d:	mov    0x28(%rsp),%rsi
  40c682:	shl    $0x19,%ecx
  40c685:	or     %ebp,%ecx
  40c687:	mov    %ecx,(%rdi,%rax,4)
  40c68a:	movzbl %r12b,%eax
  40c68e:	mov    %r10d,%ecx
  40c691:	movzbl %r12b,%r12d
  40c695:	add    %eax,0x23c8(%rsp,%r14,1)
  40c69d:	mov    0xd8(%rsp),%rax
  40c6a5:	add    %r12,0x4408(%rsp)
  40c6ad:	shl    %cl,%r12
  40c6b0:	mov    (%rax,%r8,8),%rax
  40c6b4:	or     %r12,0x43c0(%rsp,%r15,8)
  40c6bc:	movzwl (%rax,%r9,2),%eax
  40c6c1:	add    %rbx,%rax
  40c6c4:	cmp    %rax,%r11
  40c6c7:	cmova  %rax,%r11
  40c6cb:	mov    0x2280(%rsp),%rax
  40c6d3:	add    $0x1,%edx
  40c6d6:	mov    0x8(%rax),%rcx
  40c6da:	cmp    (%rcx,%rsi,1),%edx
  40c6dd:	jae    40c890 <_ZZ4mainENKUljE_clEj+0x1240>
  40c6e3:	addq   $0x3,0x8(%rsp)
  40c6e9:	mov    0x2288(%rsp),%rsi
  40c6f1:	mov    0x10(%rax),%rdi
  40c6f5:	mov    0x8(%rsp),%rbx
  40c6fa:	mov    (%rdi,%rbx,1),%ebx
  40c6fd:	mov    %ebx,%ebp
  40c6ff:	and    $0x3ff,%ebx
  40c705:	and    $0xffffff,%ebp
  40c70b:	cmp    $0x3ff,%ebx
  40c711:	jne    40c5f0 <_ZZ4mainENKUljE_clEj+0xfa0>
  40c717:	mov    0x18(%rax),%rdi
  40c71b:	mov    %edx,%ecx
  40c71d:	mov    0x30(%rax),%rax
  40c721:	shr    $0xa,%ebp
  40c724:	shr    $0xe,%ecx
  40c727:	add    (%rdi,%rcx,4),%ebp
  40c72a:	mov    (%rax,%rbp,8),%rbx
  40c72e:	mov    %rbx,%rax
  40c731:	shr    $0x2b,%rax
  40c735:	mov    %rax,%rbp
  40c738:	movabs $0x7ffffffffff,%rax
  40c742:	and    %rax,%rbx
  40c745:	jmp    40c5fa <_ZZ4mainENKUljE_clEj+0xfaa>
  40c74a:	nopw   0x0(%rax,%rax,1)
  40c750:	mov    0x22a8(%rsp),%rax
  40c758:	sub    0x22a0(%rsp),%rax
  40c760:	mov    %r8,0x58(%rsp)
  40c765:	lea    0x22a0(%rsp),%rdi
  40c76d:	shl    $0x6,%rax
  40c771:	add    0x22b8(%rsp),%rax
  40c779:	mov    %r11,0x50(%rsp)
  40c77e:	movups %xmm0,(%rax)
  40c781:	movups %xmm0,0x10(%rax)
  40c785:	movups %xmm0,0x20(%rax)
  40c789:	movups %xmm0,0x30(%rax)
  40c78d:	movups %xmm0,0x40(%rax)
  40c791:	movups %xmm0,0x50(%rax)
  40c795:	movups %xmm0,0x60(%rax)
  40c799:	movups %xmm0,0x70(%rax)
  40c79d:	movups %xmm0,0x80(%rax)
  40c7a4:	movups %xmm0,0x90(%rax)
  40c7ab:	movups %xmm0,0xa0(%rax)
  40c7b2:	movups %xmm0,0xb0(%rax)
  40c7b9:	movups %xmm0,0xc0(%rax)
  40c7c0:	movups %xmm0,0xd0(%rax)
  40c7c7:	movups %xmm0,0xe0(%rax)
  40c7ce:	movups %xmm0,0xf0(%rax)
  40c7d5:	mov    %rax,(%rsi,%r8,8)
  40c7d9:	lea    0xc0(%rsp),%rsi
  40c7e1:	mov    %edx,0x48(%rsp)
  40c7e5:	mov    %ecx,0xc0(%rsp)
  40c7ec:	call   407aa0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40c7f1:	mov    0x2288(%rsp),%rax
  40c7f9:	mov    0x58(%rsp),%r8
  40c7fe:	pcmpeqd %xmm0,%xmm0
  40c802:	mov    0x50(%rsp),%r11
  40c807:	mov    0x48(%rsp),%edx
  40c80b:	mov    (%rax,%r8,8),%rax
  40c80f:	jmp    40c611 <_ZZ4mainENKUljE_clEj+0xfc1>
  40c814:	nopl   0x0(%rax)
  40c818:	mov    $0x10,%esi
  40c81d:	add    %eax,%eax
  40c81f:	mov    %r10,0x70(%rsp)
  40c824:	cmp    %esi,%eax
  40c826:	mov    %r9,0x68(%rsp)
  40c82b:	cmovb  %esi,%eax
  40c82e:	mov    %r8,0x60(%rsp)
  40c833:	mov    %r11,0x58(%rsp)
  40c838:	lea    0x0(,%rax,4),%esi
  40c83f:	mov    %edx,0x50(%rsp)
  40c843:	mov    %eax,0x23cc(%rsp,%rcx,1)
  40c84a:	mov    %rcx,0x48(%rsp)
  40c84f:	call   4434c0 <__libc_realloc>
  40c854:	mov    0x48(%rsp),%rcx
  40c859:	mov    0x70(%rsp),%r10
  40c85e:	pcmpeqd %xmm0,%xmm0
  40c862:	mov    %rax,%rdi
  40c865:	mov    0x68(%rsp),%r9
  40c86a:	mov    0x60(%rsp),%r8
  40c86f:	mov    %rax,0x23c0(%rsp,%rcx,1)
  40c877:	mov    0x58(%rsp),%r11
  40c87c:	mov    0x23c8(%rsp,%rcx,1),%eax
  40c883:	mov    0x50(%rsp),%edx
  40c887:	jmp    40c673 <_ZZ4mainENKUljE_clEj+0x1023>
  40c88c:	nopl   0x0(%rax)
  40c890:	mov    0x40(%rsp),%rdi
  40c895:	addq   $0x1,0x10(%rsp)
  40c89b:	mov    0x4400(%rsp),%r8
  40c8a3:	mov    -0x21a8(%rdi),%r9d
  40c8aa:	cmp    %r9d,0x10(%rsp)
  40c8af:	jb     40c501 <_ZZ4mainENKUljE_clEj+0xeb1>
  40c8b5:	mov    0x4408(%rsp),%rax
  40c8bd:	mov    0x2258(%rsp),%rdx
  40c8c5:	mov    %r8d,%ecx
  40c8c8:	sub    %r9,%rax
  40c8cb:	mov    0x78(%rsp),%rsi
  40c8d0:	shr    $0x6,%r8
  40c8d4:	mov    %rax,0x4408(%rsp)
  40c8dc:	and    $0x7,%r8d
  40c8e0:	shl    $0x4,%rsi
  40c8e4:	movl   $0x0,0x2288(%rsp,%rsi,1)
  40c8ef:	mov    $0xfffffffffffffffe,%rsi
  40c8f6:	rol    %cl,%rsi
  40c8f9:	and    %rsi,0x43c0(%rsp,%r8,8)
  40c901:	jmp    40be10 <_ZZ4mainENKUljE_clEj+0x7c0>
  40c906:	cs nopw 0x0(%rax,%rax,1)
  40c910:	mov    %r11,%r12
  40c913:	cmp    $0xfffe,%r11
  40c91a:	ja     40c950 <_ZZ4mainENKUljE_clEj+0x1300>
  40c91c:	mov    0x90(%rsp),%rax
  40c924:	mov    0x9c(%rsp),%edx
  40c92b:	mov    0x30(%rax),%rax
  40c92f:	mov    (%rax),%rax
  40c932:	mov    %r12,(%rax,%rdx,8)
  40c936:	jmp    40ba50 <_ZZ4mainENKUljE_clEj+0x400>
  40c93b:	mov    %r8d,%esi
  40c93e:	jmp    40bfe2 <_ZZ4mainENKUljE_clEj+0x992>
  40c943:	mov    %edi,%esi
  40c945:	jmp    40beee <_ZZ4mainENKUljE_clEj+0x89e>
  40c94a:	nopw   0x0(%rax,%rax,1)
  40c950:	test   %r13,%r13
  40c953:	je     40d615 <_ZZ4mainENKUljE_clEj+0x1fc5>
  40c959:	mov    0x0(%r13),%rax
  40c95d:	mov    0xa8(%rsp),%rsi
  40c965:	mov    0xa0(%rsp),%rdi
  40c96d:	mov    0x8(%rax),%rax
  40c971:	mov    (%rax,%rsi,4),%esi
  40c974:	cmp    %esi,(%rax,%rdi,4)
  40c977:	je     40d4b3 <_ZZ4mainENKUljE_clEj+0x1e63>
  40c97d:	mov    0x8570(%r13),%rax
  40c984:	mov    0x8(%rax),%rdx
  40c988:	mov    0x8c(%rsp),%eax
  40c98f:	lea    0x1(%rax),%ecx
  40c992:	mov    (%rdx,%rcx,4),%edi
  40c995:	cmp    %edi,(%rdx,%rax,4)
  40c998:	je     40d4b3 <_ZZ4mainENKUljE_clEj+0x1e63>
  40c99e:	mov    0x20(%r13),%rdi
  40c9a2:	mov    0x28(%r13),%rcx
  40c9a6:	lea    0x40(%r13),%rbx
  40c9aa:	cmp    %rcx,%rdi
  40c9ad:	je     40c9d3 <_ZZ4mainENKUljE_clEj+0x1383>
  40c9af:	mov    0x8(%r13),%rsi
  40c9b3:	mov    %rdi,%rax
  40c9b6:	lea    0x40(%r13),%rbx
  40c9ba:	nopw   0x0(%rax,%rax,1)
  40c9c0:	mov    (%rax),%edx
  40c9c2:	add    $0x4,%rax
  40c9c6:	mov    %rbx,(%rsi,%rdx,8)
  40c9ca:	cmp    %rcx,%rax
  40c9cd:	jne    40c9c0 <_ZZ4mainENKUljE_clEj+0x1370>
  40c9cf:	mov    %rdi,0x28(%r13)
  40c9d3:	xor    %esi,%esi
  40c9d5:	data16 cs nopw 0x0(%rax,%rax,1)
  40c9e0:	mov    0x8440(%r13,%rsi,8),%rax
  40c9e8:	mov    %esi,%ecx
  40c9ea:	shl    $0x6,%ecx
  40c9ed:	test   %rax,%rax
  40c9f0:	je     40ca24 <_ZZ4mainENKUljE_clEj+0x13d4>
  40c9f2:	data16 cs nopw 0x0(%rax,%rax,1)
  40c9fd:	nopl   (%rax)
  40ca00:	xor    %edx,%edx
  40ca02:	tzcnt  %rax,%rdx
  40ca07:	add    %ecx,%edx
  40ca09:	mov    %edx,%edx
  40ca0b:	shl    $0x4,%rdx
  40ca0f:	movl   $0x0,0x448(%r13,%rdx,1)
  40ca1b:	lea    -0x1(%rax),%rdx
  40ca1f:	and    %rdx,%rax
  40ca22:	jne    40ca00 <_ZZ4mainENKUljE_clEj+0x13b0>
  40ca24:	movq   $0x0,0x8440(%r13,%rsi,8)
  40ca30:	add    $0x1,%rsi
  40ca34:	cmp    $0x20,%rsi
  40ca38:	jne    40c9e0 <_ZZ4mainENKUljE_clEj+0x1390>
  40ca3a:	mov    0x8550(%r13),%rdi
  40ca41:	pxor   %xmm0,%xmm0
  40ca45:	mov    0x8560(%r13),%rsi
  40ca4c:	movq   $0x0,0x8560(%r13)
  40ca57:	movups %xmm0,0x8550(%r13)
  40ca5f:	test   %rdi,%rdi
  40ca62:	je     40ca6c <_ZZ4mainENKUljE_clEj+0x141c>
  40ca64:	sub    %rdi,%rsi
  40ca67:	call   40e970 <_ZdlPvm>
  40ca6c:	mov    0x98(%rsp),%ecx
  40ca73:	mov    0x8(%r13),%rax
  40ca77:	pxor   %xmm0,%xmm0
  40ca7b:	movups %xmm0,0x8540(%r13)
  40ca83:	shr    $0x7,%ecx
  40ca86:	mov    %ecx,%ebp
  40ca88:	lea    (%rax,%rbp,8),%rsi
  40ca8c:	mov    (%rsi),%rax
  40ca8f:	cmp    %rbx,%rax
  40ca92:	je     40dca1 <_ZZ4mainENKUljE_clEj+0x2651>
  40ca98:	mov    0x98(%rsp),%edx
  40ca9f:	and    $0x7f,%edx
  40caa2:	movq   $0x0,(%rax,%rdx,8)
  40caaa:	mov    0x8540(%r13),%rax
  40cab1:	neg    %rax
  40cab4:	cmp    $0x7ff,%rax
  40caba:	ja     40db64 <_ZZ4mainENKUljE_clEj+0x2514>
  40cac0:	mov    0x448(%r13),%eax
  40cac7:	mov    0x440(%r13),%rdi
  40cace:	cmp    0x44c(%r13),%eax
  40cad5:	je     40dd6e <_ZZ4mainENKUljE_clEj+0x271e>
  40cadb:	mov    0x98(%rsp),%esi
  40cae2:	mov    %esi,(%rdi,%rax,4)
  40cae5:	addq   $0x1,0x8548(%r13)
  40caed:	addl   $0x1,0x448(%r13)
  40caf5:	orq    $0x1,0x8440(%r13)
  40cafd:	mov    0x8590(%r13),%rdi
  40cb04:	mov    0x8598(%r13),%rcx
  40cb0b:	lea    0x85b0(%r13),%rbx
  40cb12:	cmp    %rcx,%rdi
  40cb15:	je     40cb46 <_ZZ4mainENKUljE_clEj+0x14f6>
  40cb17:	mov    0x8578(%r13),%rsi
  40cb1e:	mov    %rdi,%rax
  40cb21:	lea    0x85b0(%r13),%rbx
  40cb28:	nopl   0x0(%rax,%rax,1)
  40cb30:	mov    (%rax),%edx
  40cb32:	add    $0x4,%rax
  40cb36:	mov    %rbx,(%rsi,%rdx,8)
  40cb3a:	cmp    %rcx,%rax
  40cb3d:	jne    40cb30 <_ZZ4mainENKUljE_clEj+0x14e0>
  40cb3f:	mov    %rdi,0x8598(%r13)
  40cb46:	xor    %esi,%esi
  40cb48:	nopl   0x0(%rax,%rax,1)
  40cb50:	mov    0x109b0(%r13,%rsi,8),%rax
  40cb58:	mov    %esi,%ecx
  40cb5a:	shl    $0x6,%ecx
  40cb5d:	test   %rax,%rax
  40cb60:	je     40cba4 <_ZZ4mainENKUljE_clEj+0x1554>
  40cb62:	data16 cs nopw 0x0(%rax,%rax,1)
  40cb6d:	data16 cs nopw 0x0(%rax,%rax,1)
  40cb78:	nopl   0x0(%rax,%rax,1)
  40cb80:	xor    %edx,%edx
  40cb82:	tzcnt  %rax,%rdx
  40cb87:	add    %ecx,%edx
  40cb89:	mov    %edx,%edx
  40cb8b:	shl    $0x4,%rdx
  40cb8f:	movl   $0x0,0x89b8(%r13,%rdx,1)
  40cb9b:	lea    -0x1(%rax),%rdx
  40cb9f:	and    %rdx,%rax
  40cba2:	jne    40cb80 <_ZZ4mainENKUljE_clEj+0x1530>
  40cba4:	movq   $0x0,0x109b0(%r13,%rsi,8)
  40cbb0:	add    $0x1,%rsi
  40cbb4:	cmp    $0x20,%rsi
  40cbb8:	jne    40cb50 <_ZZ4mainENKUljE_clEj+0x1500>
  40cbba:	mov    0x10ac0(%r13),%rdi
  40cbc1:	pxor   %xmm0,%xmm0
  40cbc5:	mov    0x10ad0(%r13),%rsi
  40cbcc:	movq   $0x0,0x10ad0(%r13)
  40cbd7:	movups %xmm0,0x10ac0(%r13)
  40cbdf:	test   %rdi,%rdi
  40cbe2:	je     40cbec <_ZZ4mainENKUljE_clEj+0x159c>
  40cbe4:	sub    %rdi,%rsi
  40cbe7:	call   40e970 <_ZdlPvm>
  40cbec:	mov    0x8c(%rsp),%ecx
  40cbf3:	mov    0x8578(%r13),%rax
  40cbfa:	pxor   %xmm0,%xmm0
  40cbfe:	movups %xmm0,0x10ab0(%r13)
  40cc06:	shr    $0x7,%ecx
  40cc09:	mov    %ecx,%ebp
  40cc0b:	lea    (%rax,%rbp,8),%rsi
  40cc0f:	mov    (%rsi),%rax
  40cc12:	cmp    %rbx,%rax
  40cc15:	je     40dc28 <_ZZ4mainENKUljE_clEj+0x25d8>
  40cc1b:	mov    0x8c(%rsp),%edx
  40cc22:	and    $0x7f,%edx
  40cc25:	movq   $0x0,(%rax,%rdx,8)
  40cc2d:	mov    0x10ab0(%r13),%rax
  40cc34:	neg    %rax
  40cc37:	cmp    $0x7ff,%rax
  40cc3d:	ja     40daa0 <_ZZ4mainENKUljE_clEj+0x2450>
  40cc43:	mov    0x89b8(%r13),%eax
  40cc4a:	mov    0x89b0(%r13),%rdi
  40cc51:	cmp    0x89bc(%r13),%eax
  40cc58:	je     40dd39 <_ZZ4mainENKUljE_clEj+0x26e9>
  40cc5e:	mov    0x8c(%rsp),%esi
  40cc65:	mov    %esi,(%rdi,%rax,4)
  40cc68:	addq   $0x1,0x10ab8(%r13)
  40cc70:	addl   $0x1,0x89b8(%r13)
  40cc78:	orq    $0x1,0x109b0(%r13)
  40cc80:	mov    0x8548(%r13),%r11
  40cc87:	lea    0x8570(%r13),%rbx
  40cc8e:	movabs $0x4000000000000000,%rax
  40cc98:	mov    $0x1,%r14d
  40cc9e:	mov    %rax,0xc8(%rsp)
  40cca6:	mov    %rax,%r12
  40cca9:	test   %r11,%r11
  40ccac:	je     40d37c <_ZZ4mainENKUljE_clEj+0x1d2c>
  40ccb2:	data16 cs nopw 0x0(%rax,%rax,1)
  40ccbd:	nopl   (%rax)
  40ccc0:	mov    0x8540(%r13),%rdx
  40ccc7:	mov    $0xffffffffffffffff,%rdi
  40ccce:	mov    %edx,%esi
  40ccd0:	mov    %edx,%ecx
  40ccd2:	and    $0x7ff,%esi
  40ccd8:	shl    %cl,%rdi
  40ccdb:	mov    %esi,%eax
  40ccdd:	mov    %rdi,%rcx
  40cce0:	shr    $0x6,%eax
  40cce3:	mov    %eax,%edi
  40cce5:	and    0x8440(%r13,%rdi,8),%rcx
  40cced:	jne    40cd18 <_ZZ4mainENKUljE_clEj+0x16c8>
  40ccef:	data16 cs nopw 0x0(%rax,%rax,1)
  40ccfa:	nopw   0x0(%rax,%rax,1)
  40cd00:	lea    0x1(%rax),%ecx
  40cd03:	mov    %ecx,%eax
  40cd05:	and    $0x1f,%ecx
  40cd08:	mov    0x8440(%r13,%rcx,8),%rcx
  40cd10:	and    $0x1f,%eax
  40cd13:	test   %rcx,%rcx
  40cd16:	je     40cd00 <_ZZ4mainENKUljE_clEj+0x16b0>
  40cd18:	tzcnt  %rcx,%rcx
  40cd1d:	shl    $0x6,%eax
  40cd20:	mov    0x8558(%r13),%r8
  40cd27:	add    %ecx,%eax
  40cd29:	sub    %esi,%eax
  40cd2b:	mov    0x8550(%r13),%rsi
  40cd32:	and    $0x7ff,%eax
  40cd37:	add    %rdx,%rax
  40cd3a:	mov    %rax,0x8540(%r13)
  40cd41:	cmp    %rsi,%r8
  40cd44:	je     40cfda <_ZZ4mainENKUljE_clEj+0x198a>
  40cd4a:	mov    %rbx,0x20(%rsp)
  40cd4f:	mov    %r12,0x28(%rsp)
  40cd54:	jmp    40cd77 <_ZZ4mainENKUljE_clEj+0x1727>
  40cd56:	cs nopw 0x0(%rax,%rax,1)
  40cd60:	mov    %r8,0x8558(%r13)
  40cd67:	mov    0x8540(%r13),%rax
  40cd6e:	cmp    %r8,%rsi
  40cd71:	je     40cfd0 <_ZZ4mainENKUljE_clEj+0x1980>
  40cd77:	mov    (%rsi),%r15
  40cd7a:	mov    %r15,%r12
  40cd7d:	shr    $0x7,%r12
  40cd81:	mov    %r12,%rdx
  40cd84:	sub    %rax,%rdx
  40cd87:	cmp    $0x7ff,%rdx
  40cd8e:	ja     40cfd0 <_ZZ4mainENKUljE_clEj+0x1980>
  40cd94:	mov    %r12,%rbx
  40cd97:	mov    %r12d,%edx
  40cd9a:	mov    0x8(%rsi),%ebp
  40cd9d:	mov    %r8,%rax
  40cda0:	and    $0x7ff,%ebx
  40cda6:	and    $0x7ff,%edx
  40cdac:	shl    $0x4,%rbx
  40cdb0:	add    %r13,%rbx
  40cdb3:	mov    0x448(%rbx),%r9d
  40cdba:	mov    0x440(%rbx),%rdi
  40cdc1:	cmp    0x44c(%rbx),%r9d
  40cdc8:	je     40cf70 <_ZZ4mainENKUljE_clEj+0x1920>
  40cdce:	shl    $0x19,%r15d
  40cdd2:	mov    %r9d,%r8d
  40cdd5:	shr    $0x6,%edx
  40cdd8:	add    $0x1,%r11
  40cddc:	or     %ebp,%r15d
  40cddf:	mov    %r12d,%ecx
  40cde2:	mov    %r15d,(%rdi,%r8,4)
  40cde6:	mov    %r14,%rdi
  40cde9:	lea    -0x10(%rax),%r8
  40cded:	addl   $0x1,0x448(%rbx)
  40cdf4:	shl    %cl,%rdi
  40cdf7:	mov    %r11,0x8548(%r13)
  40cdfe:	or     %rdi,0x8440(%r13,%rdx,8)
  40ce06:	mov    %rax,%rdx
  40ce09:	sub    %rsi,%rdx
  40ce0c:	cmp    $0x10,%rdx
  40ce10:	jle    40cd60 <_ZZ4mainENKUljE_clEj+0x1710>
  40ce16:	mov    (%rsi),%rdx
  40ce19:	mov    %r8,%r9
  40ce1c:	mov    -0x10(%rax),%rbx
  40ce20:	sub    %rsi,%r9
  40ce23:	mov    -0x8(%rax),%r15d
  40ce27:	mov    %rdx,-0x10(%rax)
  40ce2b:	mov    0x8(%rsi),%edx
  40ce2e:	mov    %r9,%r10
  40ce31:	sar    $0x4,%r10
  40ce35:	mov    %edx,-0x8(%rax)
  40ce38:	cmp    $0x20,%r9
  40ce3c:	jle    40d448 <_ZZ4mainENKUljE_clEj+0x1df8>
  40ce42:	lea    -0x1(%r10),%r12
  40ce46:	mov    %r13,0x8(%rsp)
  40ce4b:	xor    %eax,%eax
  40ce4d:	mov    %r8,0x10(%rsp)
  40ce52:	sar    $1,%r12
  40ce55:	mov    %r11,0x18(%rsp)
  40ce5a:	jmp    40ce79 <_ZZ4mainENKUljE_clEj+0x1829>
  40ce5c:	nopl   0x0(%rax)
  40ce60:	mov    0x8(%rdx),%r13d
  40ce64:	shl    $0x4,%rax
  40ce68:	mov    %r8,(%rsi,%rax,1)
  40ce6c:	mov    %r13d,0x8(%rsi,%rax,1)
  40ce71:	cmp    %rcx,%r12
  40ce74:	jle    40ced0 <_ZZ4mainENKUljE_clEj+0x1880>
  40ce76:	mov    %rcx,%rax
  40ce79:	lea    0x1(%rax),%r11
  40ce7d:	lea    -0x1(%r11,%r11,1),%rcx
  40ce82:	mov    %r11,%rdi
  40ce85:	mov    %rcx,%rdx
  40ce88:	shl    $0x5,%rdi
  40ce8c:	shl    $0x4,%rdx
  40ce90:	add    %rsi,%rdi
  40ce93:	add    %rsi,%rdx
  40ce96:	mov    (%rdi),%rbp
  40ce99:	mov    (%rdx),%r8
  40ce9c:	cmp    %rbp,%r8
  40ce9f:	jb     40ce60 <_ZZ4mainENKUljE_clEj+0x1810>
  40cea1:	mov    0x8(%rdi),%r13d
  40cea5:	cmp    %r8,%rbp
  40cea8:	jne    40cec0 <_ZZ4mainENKUljE_clEj+0x1870>
  40ceaa:	mov    0x8(%rdx),%ebp
  40cead:	cmp    %r13d,%ebp
  40ceb0:	jae    40cec3 <_ZZ4mainENKUljE_clEj+0x1873>
  40ceb2:	mov    %ebp,%r13d
  40ceb5:	jmp    40ce64 <_ZZ4mainENKUljE_clEj+0x1814>
  40ceb7:	nopw   0x0(%rax,%rax,1)
  40cec0:	mov    %rbp,%r8
  40cec3:	mov    %rdi,%rdx
  40cec6:	lea    (%r11,%r11,1),%rcx
  40ceca:	jmp    40ce64 <_ZZ4mainENKUljE_clEj+0x1814>
  40cecc:	nopl   0x0(%rax)
  40ced0:	and    $0x1,%r10d
  40ced4:	mov    0x8(%rsp),%r13
  40ced9:	mov    0x10(%rsp),%r8
  40cede:	mov    0x18(%rsp),%r11
  40cee3:	jne    40cef6 <_ZZ4mainENKUljE_clEj+0x18a6>
  40cee5:	sar    $0x5,%r9
  40cee9:	sub    $0x1,%r9
  40ceed:	cmp    %rcx,%r9
  40cef0:	je     40d470 <_ZZ4mainENKUljE_clEj+0x1e20>
  40cef6:	lea    -0x1(%rcx),%rax
  40cefa:	shr    $0x3f,%rax
  40cefe:	lea    -0x1(%rax,%rcx,1),%rax
  40cf03:	sar    $1,%rax
  40cf06:	test   %rcx,%rcx
  40cf09:	je     40cf33 <_ZZ4mainENKUljE_clEj+0x18e3>
  40cf0b:	mov    %rax,%rdx
  40cf0e:	shl    $0x4,%rdx
  40cf12:	add    %rsi,%rdx
  40cf15:	mov    (%rdx),%rdi
  40cf18:	cmp    %rdi,%rbx
  40cf1b:	jb     40cf40 <_ZZ4mainENKUljE_clEj+0x18f0>
  40cf1d:	cmp    %rbx,%rdi
  40cf20:	jne    40cf2b <_ZZ4mainENKUljE_clEj+0x18db>
  40cf22:	mov    0x8(%rdx),%r9d
  40cf26:	cmp    %r9d,%r15d
  40cf29:	jb     40cf44 <_ZZ4mainENKUljE_clEj+0x18f4>
  40cf2b:	shl    $0x4,%rcx
  40cf2f:	lea    (%rsi,%rcx,1),%rdx
  40cf33:	mov    %rbx,(%rdx)
  40cf36:	mov    %r15d,0x8(%rdx)
  40cf3a:	jmp    40cd60 <_ZZ4mainENKUljE_clEj+0x1710>
  40cf3f:	nop
  40cf40:	mov    0x8(%rdx),%r9d
  40cf44:	shl    $0x4,%rcx
  40cf48:	mov    %rdi,(%rsi,%rcx,1)
  40cf4c:	mov    %r9d,0x8(%rsi,%rcx,1)
  40cf51:	lea    -0x1(%rax),%rcx
  40cf55:	shr    $0x3f,%rcx
  40cf59:	lea    -0x1(%rax,%rcx,1),%rdi
  40cf5e:	mov    %rax,%rcx
  40cf61:	test   %rax,%rax
  40cf64:	je     40cf33 <_ZZ4mainENKUljE_clEj+0x18e3>
  40cf66:	mov    %rdi,%rax
  40cf69:	sar    $1,%rax
  40cf6c:	jmp    40cf0b <_ZZ4mainENKUljE_clEj+0x18bb>
  40cf6e:	xchg   %ax,%ax
  40cf70:	lea    (%r9,%r9,1),%r8d
  40cf74:	mov    $0x10,%eax
  40cf79:	mov    %edx,0x8(%rsp)
  40cf7d:	cmp    %eax,%r8d
  40cf80:	cmovb  %eax,%r8d
  40cf84:	mov    %r8d,0x44c(%rbx)
  40cf8b:	lea    0x0(,%r8,4),%esi
  40cf93:	call   4434c0 <__libc_realloc>
  40cf98:	mov    0x448(%rbx),%r9d
  40cf9f:	mov    0x8548(%r13),%r11
  40cfa6:	mov    %rax,0x440(%rbx)
  40cfad:	mov    %rax,%rdi
  40cfb0:	mov    0x8550(%r13),%rsi
  40cfb7:	mov    0x8558(%r13),%rax
  40cfbe:	mov    0x8(%rsp),%edx
  40cfc2:	jmp    40cdce <_ZZ4mainENKUljE_clEj+0x177e>
  40cfc7:	nopw   0x0(%rax,%rax,1)
  40cfd0:	mov    0x20(%rsp),%rbx
  40cfd5:	mov    0x28(%rsp),%r12
  40cfda:	shl    $0x7,%rax
  40cfde:	mov    %rax,%rbp
  40cfe1:	mov    0x10ab8(%r13),%r11
  40cfe8:	test   %r11,%r11
  40cfeb:	je     40d3b0 <_ZZ4mainENKUljE_clEj+0x1d60>
  40cff1:	mov    0x10ab0(%r13),%rdx
  40cff8:	mov    $0xffffffffffffffff,%rdi
  40cfff:	mov    %edx,%esi
  40d001:	mov    %edx,%ecx
  40d003:	and    $0x7ff,%esi
  40d009:	shl    %cl,%rdi
  40d00c:	mov    %esi,%eax
  40d00e:	mov    %rdi,%rcx
  40d011:	shr    $0x6,%eax
  40d014:	mov    %eax,%edi
  40d016:	and    0x109b0(%r13,%rdi,8),%rcx
  40d01e:	jne    40d038 <_ZZ4mainENKUljE_clEj+0x19e8>
  40d020:	lea    0x1(%rax),%ecx
  40d023:	mov    %ecx,%eax
  40d025:	and    $0x1f,%ecx
  40d028:	mov    0x109b0(%r13,%rcx,8),%rcx
  40d030:	and    $0x1f,%eax
  40d033:	test   %rcx,%rcx
  40d036:	je     40d020 <_ZZ4mainENKUljE_clEj+0x19d0>
  40d038:	tzcnt  %rcx,%rcx
  40d03d:	shl    $0x6,%eax
  40d040:	mov    0x10ac8(%r13),%r8
  40d047:	add    %ecx,%eax
  40d049:	sub    %esi,%eax
  40d04b:	mov    0x10ac0(%r13),%rsi
  40d052:	and    $0x7ff,%eax
  40d057:	add    %rdx,%rax
  40d05a:	mov    %rax,0x10ab0(%r13)
  40d061:	cmp    %rsi,%r8
  40d064:	je     40d2ff <_ZZ4mainENKUljE_clEj+0x1caf>
  40d06a:	mov    %rbx,0x20(%rsp)
  40d06f:	mov    %rbp,0x28(%rsp)
  40d074:	mov    %r12,0x40(%rsp)
  40d079:	jmp    40d097 <_ZZ4mainENKUljE_clEj+0x1a47>
  40d07b:	nopl   0x0(%rax,%rax,1)
  40d080:	mov    %r8,0x10ac8(%r13)
  40d087:	mov    0x10ab0(%r13),%rax
  40d08e:	cmp    %r8,%rsi
  40d091:	je     40d2f0 <_ZZ4mainENKUljE_clEj+0x1ca0>
  40d097:	mov    (%rsi),%r15
  40d09a:	mov    %r15,%r12
  40d09d:	shr    $0x7,%r12
  40d0a1:	mov    %r12,%rdx
  40d0a4:	sub    %rax,%rdx
  40d0a7:	cmp    $0x7ff,%rdx
  40d0ae:	ja     40d2f0 <_ZZ4mainENKUljE_clEj+0x1ca0>
  40d0b4:	mov    %r12,%rbx
  40d0b7:	mov    %r12d,%edx
  40d0ba:	mov    0x8(%rsi),%ebp
  40d0bd:	mov    %r8,%rax
  40d0c0:	and    $0x7ff,%ebx
  40d0c6:	and    $0x7ff,%edx
  40d0cc:	shl    $0x4,%rbx
  40d0d0:	add    %r13,%rbx
  40d0d3:	mov    0x89b8(%rbx),%r9d
  40d0da:	mov    0x89b0(%rbx),%rdi
  40d0e1:	cmp    0x89bc(%rbx),%r9d
  40d0e8:	je     40d290 <_ZZ4mainENKUljE_clEj+0x1c40>
  40d0ee:	shl    $0x19,%r15d
  40d0f2:	shr    $0x6,%edx
  40d0f5:	add    $0x1,%r11
  40d0f9:	mov    %r12d,%ecx
  40d0fc:	or     %ebp,%r15d
  40d0ff:	lea    -0x10(%rax),%r8
  40d103:	mov    %r15d,(%rdi,%r9,4)
  40d107:	mov    %r14,%rdi
  40d10a:	addl   $0x1,0x89b8(%rbx)
  40d111:	shl    %cl,%rdi
  40d114:	mov    %r11,0x10ab8(%r13)
  40d11b:	or     %rdi,0x109b0(%r13,%rdx,8)
  40d123:	mov    %rax,%rdx
  40d126:	sub    %rsi,%rdx
  40d129:	cmp    $0x10,%rdx
  40d12d:	jle    40d080 <_ZZ4mainENKUljE_clEj+0x1a30>
  40d133:	mov    (%rsi),%rdx
  40d136:	mov    %r8,%r9
  40d139:	mov    -0x10(%rax),%rbx
  40d13d:	sub    %rsi,%r9
  40d140:	mov    -0x8(%rax),%r15d
  40d144:	mov    %rdx,-0x10(%rax)
  40d148:	mov    0x8(%rsi),%edx
  40d14b:	mov    %r9,%r10
  40d14e:	sar    $0x4,%r10
  40d152:	mov    %edx,-0x8(%rax)
  40d155:	cmp    $0x20,%r9
  40d159:	jle    40d400 <_ZZ4mainENKUljE_clEj+0x1db0>
  40d15f:	lea    -0x1(%r10),%r12
  40d163:	mov    %r13,0x8(%rsp)
  40d168:	xor    %eax,%eax
  40d16a:	mov    %rbx,0x10(%rsp)
  40d16f:	sar    $1,%r12
  40d172:	mov    %r11,0x18(%rsp)
  40d177:	jmp    40d199 <_ZZ4mainENKUljE_clEj+0x1b49>
  40d179:	nopl   0x0(%rax)
  40d180:	mov    0x8(%rdx),%r13d
  40d184:	shl    $0x4,%rax
  40d188:	mov    %r11,(%rsi,%rax,1)
  40d18c:	mov    %r13d,0x8(%rsi,%rax,1)
  40d191:	cmp    %rcx,%r12
  40d194:	jle    40d1f0 <_ZZ4mainENKUljE_clEj+0x1ba0>
  40d196:	mov    %rcx,%rax
  40d199:	lea    0x1(%rax),%rbx
  40d19d:	lea    -0x1(%rbx,%rbx,1),%rcx
  40d1a2:	mov    %rbx,%rdi
  40d1a5:	mov    %rcx,%rdx
  40d1a8:	shl    $0x5,%rdi
  40d1ac:	shl    $0x4,%rdx
  40d1b0:	add    %rsi,%rdi
  40d1b3:	add    %rsi,%rdx
  40d1b6:	mov    (%rdi),%rbp
  40d1b9:	mov    (%rdx),%r11
  40d1bc:	cmp    %rbp,%r11
  40d1bf:	jb     40d180 <_ZZ4mainENKUljE_clEj+0x1b30>
  40d1c1:	mov    0x8(%rdi),%r13d
  40d1c5:	cmp    %r11,%rbp
  40d1c8:	jne    40d1e0 <_ZZ4mainENKUljE_clEj+0x1b90>
  40d1ca:	mov    0x8(%rdx),%ebp
  40d1cd:	cmp    %r13d,%ebp
  40d1d0:	jae    40d1e3 <_ZZ4mainENKUljE_clEj+0x1b93>
  40d1d2:	mov    %ebp,%r13d
  40d1d5:	jmp    40d184 <_ZZ4mainENKUljE_clEj+0x1b34>
  40d1d7:	nopw   0x0(%rax,%rax,1)
  40d1e0:	mov    %rbp,%r11
  40d1e3:	mov    %rdi,%rdx
  40d1e6:	lea    (%rbx,%rbx,1),%rcx
  40d1ea:	jmp    40d184 <_ZZ4mainENKUljE_clEj+0x1b34>
  40d1ec:	nopl   0x0(%rax)
  40d1f0:	and    $0x1,%r10d
  40d1f4:	mov    0x8(%rsp),%r13
  40d1f9:	mov    0x10(%rsp),%rbx
  40d1fe:	mov    0x18(%rsp),%r11
  40d203:	jne    40d216 <_ZZ4mainENKUljE_clEj+0x1bc6>
  40d205:	sar    $0x5,%r9
  40d209:	sub    $0x1,%r9
  40d20d:	cmp    %rcx,%r9
  40d210:	je     40d420 <_ZZ4mainENKUljE_clEj+0x1dd0>
  40d216:	lea    -0x1(%rcx),%rax
  40d21a:	shr    $0x3f,%rax
  40d21e:	lea    -0x1(%rax,%rcx,1),%rax
  40d223:	sar    $1,%rax
  40d226:	test   %rcx,%rcx
  40d229:	je     40d250 <_ZZ4mainENKUljE_clEj+0x1c00>
  40d22b:	mov    %rax,%rdx
  40d22e:	shl    $0x4,%rdx
  40d232:	add    %rsi,%rdx
  40d235:	mov    (%rdx),%rdi
  40d238:	cmp    %rdi,%rbx
  40d23b:	jb     40d260 <_ZZ4mainENKUljE_clEj+0x1c10>
  40d23d:	jne    40d248 <_ZZ4mainENKUljE_clEj+0x1bf8>
  40d23f:	mov    0x8(%rdx),%r9d
  40d243:	cmp    %r9d,%r15d
  40d246:	jb     40d264 <_ZZ4mainENKUljE_clEj+0x1c14>
  40d248:	shl    $0x4,%rcx
  40d24c:	lea    (%rsi,%rcx,1),%rdx
  40d250:	mov    %rbx,(%rdx)
  40d253:	mov    %r15d,0x8(%rdx)
  40d257:	jmp    40d080 <_ZZ4mainENKUljE_clEj+0x1a30>
  40d25c:	nopl   0x0(%rax)
  40d260:	mov    0x8(%rdx),%r9d
  40d264:	shl    $0x4,%rcx
  40d268:	mov    %rdi,(%rsi,%rcx,1)
  40d26c:	mov    %r9d,0x8(%rsi,%rcx,1)
  40d271:	lea    -0x1(%rax),%rcx
  40d275:	shr    $0x3f,%rcx
  40d279:	lea    -0x1(%rax,%rcx,1),%rdi
  40d27e:	mov    %rax,%rcx
  40d281:	test   %rax,%rax
  40d284:	je     40d250 <_ZZ4mainENKUljE_clEj+0x1c00>
  40d286:	mov    %rdi,%rax
  40d289:	sar    $1,%rax
  40d28c:	jmp    40d22b <_ZZ4mainENKUljE_clEj+0x1bdb>
  40d28e:	xchg   %ax,%ax
  40d290:	mov    $0x10,%eax
  40d295:	add    %r9d,%r9d
  40d298:	mov    %edx,0x8(%rsp)
  40d29c:	cmp    %eax,%r9d
  40d29f:	cmovb  %eax,%r9d
  40d2a3:	mov    %r9d,0x89bc(%rbx)
  40d2aa:	lea    0x0(,%r9,4),%esi
  40d2b2:	call   4434c0 <__libc_realloc>
  40d2b7:	mov    0x89b8(%rbx),%r9d
  40d2be:	mov    0x10ab8(%r13),%r11
  40d2c5:	mov    %rax,0x89b0(%rbx)
  40d2cc:	mov    %rax,%rdi
  40d2cf:	mov    0x10ac0(%r13),%rsi
  40d2d6:	mov    0x10ac8(%r13),%rax
  40d2dd:	mov    0x8(%rsp),%edx
  40d2e1:	jmp    40d0ee <_ZZ4mainENKUljE_clEj+0x1a9e>
  40d2e6:	cs nopw 0x0(%rax,%rax,1)
  40d2f0:	mov    0x20(%rsp),%rbx
  40d2f5:	mov    0x28(%rsp),%rbp
  40d2fa:	mov    0x40(%rsp),%r12
  40d2ff:	movabs $0x4000000000000000,%rdi
  40d309:	shl    $0x7,%rax
  40d30d:	cmp    %rdi,%rbp
  40d310:	je     40d495 <_ZZ4mainENKUljE_clEj+0x1e45>
  40d316:	cmp    %rdi,%rax
  40d319:	je     40d495 <_ZZ4mainENKUljE_clEj+0x1e45>
  40d31f:	lea    0x0(%rbp,%rax,1),%r10
  40d324:	cmp    %r12,%r10
  40d327:	jae    40d4a6 <_ZZ4mainENKUljE_clEj+0x1e56>
  40d32d:	mov    0x8548(%r13),%rax
  40d334:	cmp    %rax,0x10ab8(%r13)
  40d33b:	lea    0xd0(%rsp),%rax
  40d343:	lea    0xc8(%rsp),%rdx
  40d34b:	mov    %rax,0x80(%rsp)
  40d353:	jb     40d3f0 <_ZZ4mainENKUljE_clEj+0x1da0>
  40d359:	mov    %rbx,%rsi
  40d35c:	mov    %r13,%rdi
  40d35f:	call   40afe0 <_ZN4SideImE10drain_bitsILj0EEEvRKS0_Rm>
  40d364:	mov    0x8548(%r13),%r11
  40d36b:	mov    0xc8(%rsp),%r12
  40d373:	test   %r11,%r11
  40d376:	jne    40ccc0 <_ZZ4mainENKUljE_clEj+0x1670>
  40d37c:	mov    0x8558(%r13),%r8
  40d383:	mov    0x8550(%r13),%rsi
  40d38a:	cmp    %rsi,%r8
  40d38d:	je     40d965 <_ZZ4mainENKUljE_clEj+0x2315>
  40d393:	mov    (%rsi),%rax
  40d396:	mov    %rbx,0x20(%rsp)
  40d39b:	mov    %r12,0x28(%rsp)
  40d3a0:	shr    $0x7,%rax
  40d3a4:	mov    %rax,0x8540(%r13)
  40d3ab:	jmp    40cd77 <_ZZ4mainENKUljE_clEj+0x1727>
  40d3b0:	mov    0x10ac8(%r13),%r8
  40d3b7:	mov    0x10ac0(%r13),%rsi
  40d3be:	cmp    %rsi,%r8
  40d3c1:	je     40d495 <_ZZ4mainENKUljE_clEj+0x1e45>
  40d3c7:	mov    (%rsi),%rax
  40d3ca:	mov    %rbx,0x20(%rsp)
  40d3cf:	mov    %rbp,0x28(%rsp)
  40d3d4:	shr    $0x7,%rax
  40d3d8:	mov    %r12,0x40(%rsp)
  40d3dd:	mov    %rax,0x10ab0(%r13)
  40d3e4:	jmp    40d097 <_ZZ4mainENKUljE_clEj+0x1a47>
  40d3e9:	nopl   0x0(%rax)
  40d3f0:	mov    %r13,%rsi
  40d3f3:	mov    %rbx,%rdi
  40d3f6:	call   40afe0 <_ZN4SideImE10drain_bitsILj0EEEvRKS0_Rm>
  40d3fb:	jmp    40d364 <_ZZ4mainENKUljE_clEj+0x1d14>
  40d400:	and    $0x1,%r10d
  40d404:	mov    %rsi,%rdx
  40d407:	jne    40d250 <_ZZ4mainENKUljE_clEj+0x1c00>
  40d40d:	cmp    $0x20,%r9
  40d411:	jne    40d250 <_ZZ4mainENKUljE_clEj+0x1c00>
  40d417:	xor    %ecx,%ecx
  40d419:	nopl   0x0(%rax)
  40d420:	lea    0x1(%rcx,%rcx,1),%rax
  40d425:	shl    $0x4,%rax
  40d429:	add    %rsi,%rax
  40d42c:	mov    (%rax),%r9
  40d42f:	mov    0x8(%rax),%eax
  40d432:	mov    %r9,(%rdx)
  40d435:	mov    %eax,0x8(%rdx)
  40d438:	mov    %rcx,%rax
  40d43b:	lea    0x1(%rcx,%rcx,1),%rcx
  40d440:	jmp    40d22b <_ZZ4mainENKUljE_clEj+0x1bdb>
  40d445:	nopl   (%rax)
  40d448:	and    $0x1,%r10d
  40d44c:	mov    %rsi,%rdx
  40d44f:	jne    40cf33 <_ZZ4mainENKUljE_clEj+0x18e3>
  40d455:	cmp    $0x20,%r9
  40d459:	jne    40cf33 <_ZZ4mainENKUljE_clEj+0x18e3>
  40d45f:	xor    %ecx,%ecx
  40d461:	data16 cs nopw 0x0(%rax,%rax,1)
  40d46c:	nopl   0x0(%rax)
  40d470:	lea    0x1(%rcx,%rcx,1),%rax
  40d475:	shl    $0x4,%rax
  40d479:	add    %rsi,%rax
  40d47c:	mov    (%rax),%r9
  40d47f:	mov    0x8(%rax),%eax
  40d482:	mov    %r9,(%rdx)
  40d485:	mov    %eax,0x8(%rdx)
  40d488:	mov    %rcx,%rax
  40d48b:	lea    0x1(%rcx,%rcx,1),%rcx
  40d490:	jmp    40cf0b <_ZZ4mainENKUljE_clEj+0x18bb>
  40d495:	movabs $0x4000000000000000,%rax
  40d49f:	cmp    %rax,%r12
  40d4a2:	cmova  %rax,%r12
  40d4a6:	mov    %r12,%rax
  40d4a9:	shr    $0x3e,%rax
  40d4ad:	je     40c91c <_ZZ4mainENKUljE_clEj+0x12cc>
  40d4b3:	mov    $0xffffffffffffffff,%r12
  40d4ba:	jmp    40c91c <_ZZ4mainENKUljE_clEj+0x12cc>
  40d4bf:	xor    %r12d,%r12d
  40d4c2:	jmp    40c91c <_ZZ4mainENKUljE_clEj+0x12cc>
  40d4c7:	mov    0xf8(%rsp),%rax
  40d4cf:	sub    0xf0(%rsp),%rax
  40d4d7:	pcmpeqd %xmm0,%xmm0
  40d4db:	lea    0xb4(%rsp),%rsi
  40d4e3:	shl    $0x6,%rax
  40d4e7:	add    0x108(%rsp),%rax
  40d4ef:	lea    0xf0(%rsp),%rdi
  40d4f7:	mov    %edx,0xb4(%rsp)
  40d4fe:	movups %xmm0,(%rax)
  40d501:	movups %xmm0,0x10(%rax)
  40d505:	movups %xmm0,0x20(%rax)
  40d509:	movups %xmm0,0x30(%rax)
  40d50d:	movups %xmm0,0x40(%rax)
  40d511:	movups %xmm0,0x50(%rax)
  40d515:	movups %xmm0,0x60(%rax)
  40d519:	movups %xmm0,0x70(%rax)
  40d51d:	movups %xmm0,0x80(%rax)
  40d524:	movups %xmm0,0x90(%rax)
  40d52b:	movups %xmm0,0xa0(%rax)
  40d532:	movups %xmm0,0xb0(%rax)
  40d539:	movups %xmm0,0xc0(%rax)
  40d540:	movups %xmm0,0xd0(%rax)
  40d547:	movups %xmm0,0xe0(%rax)
  40d54e:	movups %xmm0,0xf0(%rax)
  40d555:	mov    %rax,(%rcx)
  40d558:	call   407aa0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40d55d:	mov    0xd8(%rsp),%rax
  40d565:	mov    (%rax,%rbx,8),%rax
  40d569:	jmp    40bc1d <_ZZ4mainENKUljE_clEj+0x5cd>
  40d56e:	mov    0x22a8(%rsp),%rax
  40d576:	sub    0x22a0(%rsp),%rax
  40d57e:	pcmpeqd %xmm0,%xmm0
  40d582:	lea    0xb8(%rsp),%rsi
  40d58a:	shl    $0x6,%rax
  40d58e:	add    0x22b8(%rsp),%rax
  40d596:	lea    0x22a0(%rsp),%rdi
  40d59e:	mov    %edx,0xb8(%rsp)
  40d5a5:	movups %xmm0,(%rax)
  40d5a8:	movups %xmm0,0x10(%rax)
  40d5ac:	movups %xmm0,0x20(%rax)
  40d5b0:	movups %xmm0,0x30(%rax)
  40d5b4:	movups %xmm0,0x40(%rax)
  40d5b8:	movups %xmm0,0x50(%rax)
  40d5bc:	movups %xmm0,0x60(%rax)
  40d5c0:	movups %xmm0,0x70(%rax)
  40d5c4:	movups %xmm0,0x80(%rax)
  40d5cb:	movups %xmm0,0x90(%rax)
  40d5d2:	movups %xmm0,0xa0(%rax)
  40d5d9:	movups %xmm0,0xb0(%rax)
  40d5e0:	movups %xmm0,0xc0(%rax)
  40d5e7:	movups %xmm0,0xd0(%rax)
  40d5ee:	movups %xmm0,0xe0(%rax)
  40d5f5:	movups %xmm0,0xf0(%rax)
  40d5fc:	mov    %rax,(%rcx)
  40d5ff:	call   407aa0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40d604:	mov    0x2288(%rsp),%rax
  40d60c:	mov    (%rax,%rbx,8),%rax
  40d610:	jmp    40bd9d <_ZZ4mainENKUljE_clEj+0x74d>
  40d615:	lea    0xd0(%rsp),%rax
  40d61d:	mov    $0x10ae0,%edi
  40d622:	mov    %rax,0x80(%rsp)
  40d62a:	call   40ea40 <_Znwm>
  40d62f:	mov    %rax,%r13
  40d632:	mov    0x90(%rsp),%rax
  40d63a:	lea    0x40(%r13),%rbx
  40d63e:	mov    (%rax),%rax
  40d641:	mov    (%rax),%rax
  40d644:	mov    (%rax),%r12d
  40d647:	mov    %rax,0x0(%r13)
  40d64b:	movq   $0x0,0x8(%r13)
  40d653:	mov    %r12d,%r15d
  40d656:	movq   $0x0,0x10(%r13)
  40d65e:	shr    $0x7,%r15d
  40d662:	movq   $0x0,0x18(%r13)
  40d66a:	lea    0x1(%r15),%ebp
  40d66e:	lea    0x0(,%rbp,8),%rdi
  40d676:	mov    %ebp,0x8(%rsp)
  40d67a:	call   40ea40 <_Znwm>
  40d67f:	lea    (%rax,%rbp,8),%r14
  40d683:	mov    %rax,0x8(%r13)
  40d687:	mov    %rax,%rdx
  40d68a:	mov    %r14,0x18(%r13)
  40d68e:	test   %r15d,%r15d
  40d691:	je     40d6de <_ZZ4mainENKUljE_clEj+0x208e>
  40d693:	mov    %rbp,%rsi
  40d696:	movq   %rbx,%xmm0
  40d69b:	mov    0x8(%rsp),%r8d
  40d6a0:	shr    $1,%rsi
  40d6a3:	punpcklqdq %xmm0,%xmm0
  40d6a7:	shl    $0x4,%rsi
  40d6ab:	lea    (%rax,%rsi,1),%rcx
  40d6af:	and    $0x10,%esi
  40d6b2:	je     40d6c0 <_ZZ4mainENKUljE_clEj+0x2070>
  40d6b4:	movups %xmm0,(%rax)
  40d6b7:	lea    0x10(%rax),%rax
  40d6bb:	cmp    %rax,%rcx
  40d6be:	je     40d6d0 <_ZZ4mainENKUljE_clEj+0x2080>
  40d6c0:	movups %xmm0,(%rax)
  40d6c3:	add    $0x20,%rax
  40d6c7:	movups %xmm0,-0x10(%rax)
  40d6cb:	cmp    %rax,%rcx
  40d6ce:	jne    40d6c0 <_ZZ4mainENKUljE_clEj+0x2070>
  40d6d0:	and    $0x1,%r8d
  40d6d4:	je     40d6e1 <_ZZ4mainENKUljE_clEj+0x2091>
  40d6d6:	and    $0xfffffffffffffffe,%rbp
  40d6da:	lea    (%rdx,%rbp,8),%rdx
  40d6de:	mov    %rbx,(%rdx)
  40d6e1:	mov    %r14,0x10(%r13)
  40d6e5:	pxor   %xmm0,%xmm0
  40d6e9:	xor    %r9d,%r9d
  40d6ec:	mov    $0x4022,%ecx
  40d6f1:	lea    0x80(%r12),%eax
  40d6f9:	movq   $0x0,0x30(%r13)
  40d701:	mov    $0x3,%edx
  40d706:	xor    %edi,%edi
  40d708:	lea    0x40(,%rax,8),%r12
  40d710:	movups %xmm0,0x20(%r13)
  40d715:	mov    $0xffffffff,%r8d
  40d71b:	mov    %r12,%rsi
  40d71e:	call   456790 <__mmap64>
  40d723:	mov    $0xf,%edx
  40d728:	mov    %r12,%rsi
  40d72b:	mov    %rax,%rdi
  40d72e:	mov    %rax,%rbp
  40d731:	call   456760 <__madvise>
  40d736:	lea    0x440(%r13),%rdi
  40d73d:	mov    %rbp,0x38(%r13)
  40d741:	mov    %rbx,%rax
  40d744:	cmp    %rdi,%rbx
  40d747:	je     40d77c <_ZZ4mainENKUljE_clEj+0x212c>
  40d749:	movq   0xaec7f(%rip),%xmm0        # 4bc3d0 <max.0+0x30>
  40d751:	mov    %rdi,%rdx
  40d754:	sub    %rbx,%rdx
  40d757:	and    $0x10,%edx
  40d75a:	punpcklqdq %xmm0,%xmm0
  40d75e:	je     40d76c <_ZZ4mainENKUljE_clEj+0x211c>
  40d760:	add    $0x10,%rax
  40d764:	movups %xmm0,(%rbx)
  40d767:	cmp    %rax,%rdi
  40d76a:	je     40d77c <_ZZ4mainENKUljE_clEj+0x212c>
  40d76c:	movups %xmm0,(%rax)
  40d76f:	add    $0x20,%rax
  40d773:	movups %xmm0,-0x10(%rax)
  40d777:	cmp    %rax,%rdi
  40d77a:	jne    40d76c <_ZZ4mainENKUljE_clEj+0x211c>
  40d77c:	mov    $0x8000,%edx
  40d781:	xor    %esi,%esi
  40d783:	lea    0x85b0(%r13),%rbx
  40d78a:	call   401098 <_init+0x98>
  40d78f:	xor    %eax,%eax
  40d791:	mov    $0x20,%ecx
  40d796:	pxor   %xmm0,%xmm0
  40d79a:	lea    0x8440(%r13),%rdi
  40d7a1:	rep stos %rax,%es:(%rdi)
  40d7a4:	mov    0x90(%rsp),%rax
  40d7ac:	movq   $0x0,0x8560(%r13)
  40d7b7:	movups %xmm0,0x8540(%r13)
  40d7bf:	mov    0x8(%rax),%rax
  40d7c3:	movups %xmm0,0x8550(%r13)
  40d7cb:	mov    (%rax),%rax
  40d7ce:	mov    (%rax),%r12d
  40d7d1:	mov    %rax,0x8570(%r13)
  40d7d8:	movq   $0x0,0x8578(%r13)
  40d7e3:	movq   $0x0,0x8580(%r13)
  40d7ee:	mov    %r12d,%r15d
  40d7f1:	movq   $0x0,0x8588(%r13)
  40d7fc:	shr    $0x7,%r15d
  40d800:	lea    0x1(%r15),%ebp
  40d804:	lea    0x0(,%rbp,8),%rdi
  40d80c:	mov    %ebp,0x8(%rsp)
  40d810:	call   40ea40 <_Znwm>
  40d815:	lea    (%rax,%rbp,8),%r14
  40d819:	test   %r15d,%r15d
  40d81c:	mov    0x8(%rsp),%r8d
  40d821:	mov    %rax,%rdx
  40d824:	mov    %rax,0x8578(%r13)
  40d82b:	mov    %r14,0x8588(%r13)
  40d832:	je     40d87a <_ZZ4mainENKUljE_clEj+0x222a>
  40d834:	mov    %rbp,%rsi
  40d837:	movq   %rbx,%xmm0
  40d83c:	shr    $1,%rsi
  40d83f:	punpcklqdq %xmm0,%xmm0
  40d843:	shl    $0x4,%rsi
  40d847:	lea    (%rax,%rsi,1),%rcx
  40d84b:	and    $0x10,%esi
  40d84e:	je     40d85c <_ZZ4mainENKUljE_clEj+0x220c>
  40d850:	movups %xmm0,(%rax)
  40d853:	lea    0x10(%rax),%rax
  40d857:	cmp    %rax,%rcx
  40d85a:	je     40d86c <_ZZ4mainENKUljE_clEj+0x221c>
  40d85c:	movups %xmm0,(%rax)
  40d85f:	add    $0x20,%rax
  40d863:	movups %xmm0,-0x10(%rax)
  40d867:	cmp    %rax,%rcx
  40d86a:	jne    40d85c <_ZZ4mainENKUljE_clEj+0x220c>
  40d86c:	and    $0x1,%r8d
  40d870:	je     40d87d <_ZZ4mainENKUljE_clEj+0x222d>
  40d872:	and    $0xfffffffffffffffe,%rbp
  40d876:	lea    (%rdx,%rbp,8),%rdx
  40d87a:	mov    %rbx,(%rdx)
  40d87d:	mov    %r14,0x8580(%r13)
  40d884:	pxor   %xmm0,%xmm0
  40d888:	xor    %r9d,%r9d
  40d88b:	xor    %edi,%edi
  40d88d:	mov    $0xffffffff,%r8d
  40d893:	mov    $0x4022,%ecx
  40d898:	mov    $0x3,%edx
  40d89d:	movq   $0x0,0x85a0(%r13)
  40d8a8:	lea    0x80(%r12),%eax
  40d8b0:	movups %xmm0,0x8590(%r13)
  40d8b8:	lea    0x40(,%rax,8),%r12
  40d8c0:	mov    %r12,%rsi
  40d8c3:	call   456790 <__mmap64>
  40d8c8:	mov    $0xf,%edx
  40d8cd:	mov    %r12,%rsi
  40d8d0:	mov    %rax,%rdi
  40d8d3:	mov    %rax,%rbp
  40d8d6:	call   456760 <__madvise>
  40d8db:	lea    0x89b0(%r13),%rdi
  40d8e2:	mov    %rbp,0x85a8(%r13)
  40d8e9:	mov    %rbx,%rax
  40d8ec:	cmp    %rdi,%rbx
  40d8ef:	je     40d924 <_ZZ4mainENKUljE_clEj+0x22d4>
  40d8f1:	movq   0xaead7(%rip),%xmm0        # 4bc3d0 <max.0+0x30>
  40d8f9:	mov    %rdi,%rdx
  40d8fc:	sub    %rbx,%rdx
  40d8ff:	and    $0x10,%edx
  40d902:	punpcklqdq %xmm0,%xmm0
  40d906:	je     40d914 <_ZZ4mainENKUljE_clEj+0x22c4>
  40d908:	add    $0x10,%rax
  40d90c:	movups %xmm0,(%rbx)
  40d90f:	cmp    %rax,%rdi
  40d912:	je     40d924 <_ZZ4mainENKUljE_clEj+0x22d4>
  40d914:	movups %xmm0,(%rax)
  40d917:	add    $0x20,%rax
  40d91b:	movups %xmm0,-0x10(%rax)
  40d91f:	cmp    %rax,%rdi
  40d922:	jne    40d914 <_ZZ4mainENKUljE_clEj+0x22c4>
  40d924:	mov    $0x8000,%edx
  40d929:	xor    %esi,%esi
  40d92b:	call   401098 <_init+0x98>
  40d930:	pxor   %xmm0,%xmm0
  40d934:	mov    $0x20,%ecx
  40d939:	xor    %eax,%eax
  40d93b:	lea    0x109b0(%r13),%rdi
  40d942:	rep stos %rax,%es:(%rdi)
  40d945:	movups %xmm0,0x10ab0(%r13)
  40d94d:	movq   $0x0,0x10ad0(%r13)
  40d958:	movups %xmm0,0x10ac0(%r13)
  40d960:	jmp    40c959 <_ZZ4mainENKUljE_clEj+0x1309>
  40d965:	movabs $0x4000000000000000,%rbp
  40d96f:	jmp    40cfe1 <_ZZ4mainENKUljE_clEj+0x1991>
  40d974:	mov    0x4410(%rsp),%rdi
  40d97c:	test   %rdi,%rdi
  40d97f:	je     40d991 <_ZZ4mainENKUljE_clEj+0x2341>
  40d981:	mov    0x4420(%rsp),%rsi
  40d989:	sub    %rdi,%rsi
  40d98c:	call   40e970 <_ZdlPvm>
  40d991:	mov    0x22a0(%rsp),%rdi
  40d999:	test   %rdi,%rdi
  40d99c:	je     40d9ae <_ZZ4mainENKUljE_clEj+0x235e>
  40d99e:	mov    0x22b0(%rsp),%rsi
  40d9a6:	sub    %rdi,%rsi
  40d9a9:	call   40e970 <_ZdlPvm>
  40d9ae:	mov    0x2288(%rsp),%rdi
  40d9b6:	test   %rdi,%rdi
  40d9b9:	je     40d9cb <_ZZ4mainENKUljE_clEj+0x237b>
  40d9bb:	mov    0x2298(%rsp),%rsi
  40d9c3:	sub    %rdi,%rsi
  40d9c6:	call   40e970 <_ZdlPvm>
  40d9cb:	mov    0x2260(%rsp),%rdi
  40d9d3:	test   %rdi,%rdi
  40d9d6:	je     40d9e8 <_ZZ4mainENKUljE_clEj+0x2398>
  40d9d8:	mov    0x2270(%rsp),%rsi
  40d9e0:	sub    %rdi,%rsi
  40d9e3:	call   40e970 <_ZdlPvm>
  40d9e8:	mov    0xf0(%rsp),%rdi
  40d9f0:	test   %rdi,%rdi
  40d9f3:	je     40da05 <_ZZ4mainENKUljE_clEj+0x23b5>
  40d9f5:	mov    0x100(%rsp),%rsi
  40d9fd:	sub    %rdi,%rsi
  40da00:	call   40e970 <_ZdlPvm>
  40da05:	mov    0xd8(%rsp),%rdi
  40da0d:	test   %rdi,%rdi
  40da10:	je     40da22 <_ZZ4mainENKUljE_clEj+0x23d2>
  40da12:	mov    0xe8(%rsp),%rsi
  40da1a:	sub    %rdi,%rsi
  40da1d:	call   40e970 <_ZdlPvm>
  40da22:	add    $0x4438,%rsp
  40da29:	pop    %rbx
  40da2a:	pop    %rbp
  40da2b:	pop    %r12
  40da2d:	pop    %r13
  40da2f:	pop    %r14
  40da31:	pop    %r15
  40da33:	ret
  40da34:	mov    $0x10,%edx
  40da39:	add    %eax,%eax
  40da3b:	cmp    %edx,%eax
  40da3d:	cmovb  %edx,%eax
  40da40:	lea    0x0(,%rax,4),%esi
  40da47:	mov    %eax,0x21c(%rsp)
  40da4e:	call   4434c0 <__libc_realloc>
  40da53:	mov    %rax,0x210(%rsp)
  40da5b:	mov    %rax,%rdi
  40da5e:	mov    0x218(%rsp),%eax
  40da65:	jmp    40bc49 <_ZZ4mainENKUljE_clEj+0x5f9>
  40da6a:	mov    $0x10,%edx
  40da6f:	add    %eax,%eax
  40da71:	cmp    %edx,%eax
  40da73:	cmovb  %edx,%eax
  40da76:	lea    0x0(,%rax,4),%esi
  40da7d:	mov    %eax,0x23cc(%rsp)
  40da84:	call   4434c0 <__libc_realloc>
  40da89:	mov    %rax,0x23c0(%rsp)
  40da91:	mov    %rax,%rdi
  40da94:	mov    0x23c8(%rsp),%eax
  40da9b:	jmp    40bdc9 <_ZZ4mainENKUljE_clEj+0x779>
  40daa0:	mov    0x10ac8(%r13),%rbp
  40daa7:	mov    0x10ad0(%r13),%rcx
  40daae:	mov    0x10ac0(%r13),%r12
  40dab5:	cmp    %rcx,%rbp
  40dab8:	je     40dea1 <_ZZ4mainENKUljE_clEj+0x2851>
  40dabe:	mov    0x8c(%rsp),%eax
  40dac5:	lea    0x10(%rbp),%r14
  40dac9:	movq   $0x0,0x0(%rbp)
  40dad1:	xor    %esi,%esi
  40dad3:	mov    %eax,0x8(%rbp)
  40dad6:	mov    %r14,0x10ac8(%r13)
  40dadd:	mov    %r14,%rax
  40dae0:	sub    %r12,%rax
  40dae3:	mov    %rax,%rcx
  40dae6:	lea    -0x10(%r12,%rax,1),%rax
  40daeb:	sar    $0x4,%rcx
  40daef:	lea    -0x1(%rcx),%rdx
  40daf3:	sub    $0x2,%rcx
  40daf7:	sar    $1,%rcx
  40dafa:	test   %rdx,%rdx
  40dafd:	jle    40db24 <_ZZ4mainENKUljE_clEj+0x24d4>
  40daff:	mov    %rcx,%rax
  40db02:	shl    $0x4,%rax
  40db06:	add    %r12,%rax
  40db09:	mov    (%rax),%rdi
  40db0c:	cmp    %rdi,%rsi
  40db0f:	jb     40db36 <_ZZ4mainENKUljE_clEj+0x24e6>
  40db11:	cmp    %rsi,%rdi
  40db14:	je     40dd22 <_ZZ4mainENKUljE_clEj+0x26d2>
  40db1a:	mov    %rdx,%rax
  40db1d:	shl    $0x4,%rax
  40db21:	add    %r12,%rax
  40db24:	mov    0x8c(%rsp),%edi
  40db2b:	mov    %rsi,(%rax)
  40db2e:	mov    %edi,0x8(%rax)
  40db31:	jmp    40cc80 <_ZZ4mainENKUljE_clEj+0x1630>
  40db36:	mov    0x8(%rax),%r8d
  40db3a:	shl    $0x4,%rdx
  40db3e:	mov    %rdi,(%r12,%rdx,1)
  40db42:	mov    %r8d,0x8(%r12,%rdx,1)
  40db47:	lea    -0x1(%rcx),%rdx
  40db4b:	shr    $0x3f,%rdx
  40db4f:	lea    -0x1(%rdx,%rcx,1),%rdi
  40db54:	mov    %rcx,%rdx
  40db57:	test   %rcx,%rcx
  40db5a:	je     40db24 <_ZZ4mainENKUljE_clEj+0x24d4>
  40db5c:	sar    $1,%rdi
  40db5f:	mov    %rdi,%rcx
  40db62:	jmp    40daff <_ZZ4mainENKUljE_clEj+0x24af>
  40db64:	mov    0x8558(%r13),%rbp
  40db6b:	mov    0x8560(%r13),%rcx
  40db72:	mov    0x8550(%r13),%r12
  40db79:	cmp    %rcx,%rbp
  40db7c:	je     40ddb5 <_ZZ4mainENKUljE_clEj+0x2765>
  40db82:	mov    0x98(%rsp),%eax
  40db89:	lea    0x10(%rbp),%r14
  40db8d:	movq   $0x0,0x0(%rbp)
  40db95:	xor    %esi,%esi
  40db97:	mov    %eax,0x8(%rbp)
  40db9a:	mov    %r14,0x8558(%r13)
  40dba1:	mov    %r14,%rax
  40dba4:	sub    %r12,%rax
  40dba7:	mov    %rax,%rcx
  40dbaa:	lea    -0x10(%r12,%rax,1),%rax
  40dbaf:	sar    $0x4,%rcx
  40dbb3:	lea    -0x1(%rcx),%rdx
  40dbb7:	sub    $0x2,%rcx
  40dbbb:	sar    $1,%rcx
  40dbbe:	test   %rdx,%rdx
  40dbc1:	jle    40dbe8 <_ZZ4mainENKUljE_clEj+0x2598>
  40dbc3:	mov    %rcx,%rax
  40dbc6:	shl    $0x4,%rax
  40dbca:	add    %r12,%rax
  40dbcd:	mov    (%rax),%rdi
  40dbd0:	cmp    %rdi,%rsi
  40dbd3:	jb     40dbfa <_ZZ4mainENKUljE_clEj+0x25aa>
  40dbd5:	cmp    %rsi,%rdi
  40dbd8:	je     40dd0b <_ZZ4mainENKUljE_clEj+0x26bb>
  40dbde:	mov    %rdx,%rax
  40dbe1:	shl    $0x4,%rax
  40dbe5:	add    %r12,%rax
  40dbe8:	mov    0x98(%rsp),%edi
  40dbef:	mov    %rsi,(%rax)
  40dbf2:	mov    %edi,0x8(%rax)
  40dbf5:	jmp    40cafd <_ZZ4mainENKUljE_clEj+0x14ad>
  40dbfa:	mov    0x8(%rax),%r8d
  40dbfe:	shl    $0x4,%rdx
  40dc02:	mov    %rdi,(%r12,%rdx,1)
  40dc06:	mov    %r8d,0x8(%r12,%rdx,1)
  40dc0b:	lea    -0x1(%rcx),%rdx
  40dc0f:	shr    $0x3f,%rdx
  40dc13:	lea    -0x1(%rdx,%rcx,1),%rdi
  40dc18:	mov    %rcx,%rdx
  40dc1b:	test   %rcx,%rcx
  40dc1e:	je     40dbe8 <_ZZ4mainENKUljE_clEj+0x2598>
  40dc20:	sar    $1,%rdi
  40dc23:	mov    %rdi,%rcx
  40dc26:	jmp    40dbc3 <_ZZ4mainENKUljE_clEj+0x2573>
  40dc28:	mov    0x8598(%r13),%rdx
  40dc2f:	sub    0x8590(%r13),%rdx
  40dc36:	shl    $0x8,%rdx
  40dc3a:	movdqa 0xae78e(%rip),%xmm0        # 4bc3d0 <max.0+0x30>
  40dc42:	add    0x85a8(%r13),%rdx
  40dc49:	mov    %rdx,%rax
  40dc4c:	lea    0x400(%rdx),%rdi
  40dc53:	movups %xmm0,(%rax)
  40dc56:	add    $0x20,%rax
  40dc5a:	movups %xmm0,-0x10(%rax)
  40dc5e:	cmp    %rdi,%rax
  40dc61:	jne    40dc53 <_ZZ4mainENKUljE_clEj+0x2603>
  40dc63:	mov    %rdx,(%rsi)
  40dc66:	lea    0xd0(%rsp),%rax
  40dc6e:	lea    0xc8(%rsp),%rsi
  40dc76:	lea    0x8590(%r13),%rdi
  40dc7d:	mov    %ecx,0xc8(%rsp)
  40dc84:	mov    %rax,0x80(%rsp)
  40dc8c:	call   407aa0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40dc91:	mov    0x8578(%r13),%rax
  40dc98:	mov    (%rax,%rbp,8),%rax
  40dc9c:	jmp    40cc1b <_ZZ4mainENKUljE_clEj+0x15cb>
  40dca1:	mov    0x28(%r13),%rdx
  40dca5:	sub    0x20(%r13),%rdx
  40dca9:	shl    $0x8,%rdx
  40dcad:	movdqa 0xae71b(%rip),%xmm0        # 4bc3d0 <max.0+0x30>
  40dcb5:	add    0x38(%r13),%rdx
  40dcb9:	mov    %rdx,%rax
  40dcbc:	lea    0x400(%rdx),%rdi
  40dcc3:	movups %xmm0,(%rax)
  40dcc6:	add    $0x20,%rax
  40dcca:	movups %xmm0,-0x10(%rax)
  40dcce:	cmp    %rax,%rdi
  40dcd1:	jne    40dcc3 <_ZZ4mainENKUljE_clEj+0x2673>
  40dcd3:	mov    %rdx,(%rsi)
  40dcd6:	lea    0xd0(%rsp),%rax
  40dcde:	lea    0xc4(%rsp),%rsi
  40dce6:	lea    0x20(%r13),%rdi
  40dcea:	mov    %ecx,0xc4(%rsp)
  40dcf1:	mov    %rax,0x80(%rsp)
  40dcf9:	call   407aa0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40dcfe:	mov    0x8(%r13),%rax
  40dd02:	mov    (%rax,%rbp,8),%rax
  40dd06:	jmp    40ca98 <_ZZ4mainENKUljE_clEj+0x1448>
  40dd0b:	mov    0x8(%rax),%r8d
  40dd0f:	cmp    %r8d,0x98(%rsp)
  40dd17:	jb     40dbfe <_ZZ4mainENKUljE_clEj+0x25ae>
  40dd1d:	jmp    40dbde <_ZZ4mainENKUljE_clEj+0x258e>
  40dd22:	mov    0x8(%rax),%r8d
  40dd26:	cmp    %r8d,0x8c(%rsp)
  40dd2e:	jb     40db3a <_ZZ4mainENKUljE_clEj+0x24ea>
  40dd34:	jmp    40db1a <_ZZ4mainENKUljE_clEj+0x24ca>
  40dd39:	mov    $0x10,%edx
  40dd3e:	add    %eax,%eax
  40dd40:	cmp    %edx,%eax
  40dd42:	cmovb  %edx,%eax
  40dd45:	mov    %eax,0x89bc(%r13)
  40dd4c:	lea    0x0(,%rax,4),%esi
  40dd53:	call   4434c0 <__libc_realloc>
  40dd58:	mov    %rax,0x89b0(%r13)
  40dd5f:	mov    %rax,%rdi
  40dd62:	mov    0x89b8(%r13),%eax
  40dd69:	jmp    40cc5e <_ZZ4mainENKUljE_clEj+0x160e>
  40dd6e:	mov    $0x10,%edx
  40dd73:	add    %eax,%eax
  40dd75:	cmp    %edx,%eax
  40dd77:	cmovb  %edx,%eax
  40dd7a:	mov    %eax,0x44c(%r13)
  40dd81:	lea    0x0(,%rax,4),%esi
  40dd88:	call   4434c0 <__libc_realloc>
  40dd8d:	mov    %rax,0x440(%r13)
  40dd94:	mov    %rax,%rdi
  40dd97:	mov    0x448(%r13),%eax
  40dd9e:	jmp    40cadb <_ZZ4mainENKUljE_clEj+0x148b>
  40dda3:	lea    0x110(%rsp),%rax
  40ddab:	mov    %rax,0x38(%rsp)
  40ddb0:	jmp    40b70d <_ZZ4mainENKUljE_clEj+0xbd>
  40ddb5:	movabs $0x7ffffffffffffff,%rdx
  40ddbf:	mov    %rbp,%r14
  40ddc2:	sub    %r12,%r14
  40ddc5:	mov    %r14,%rax
  40ddc8:	sar    $0x4,%rax
  40ddcc:	cmp    %rdx,%rax
  40ddcf:	je     401264 <_ZZ4mainENKUljE_clEj.cold+0x7e>
  40ddd5:	test   %rax,%rax
  40ddd8:	mov    $0x1,%ebx
  40dddd:	mov    %rcx,0x8(%rsp)
  40dde2:	cmovne %rax,%rbx
  40dde6:	add    %rax,%rbx
  40dde9:	movabs $0x7ffffffffffffff,%rax
  40ddf3:	cmp    %rax,%rbx
  40ddf6:	cmova  %rax,%rbx
  40ddfa:	lea    0xd0(%rsp),%rax
  40de02:	mov    %rax,0x80(%rsp)
  40de0a:	shl    $0x4,%rbx
  40de0e:	mov    %rbx,%rdi
  40de11:	call   40ea40 <_Znwm>
  40de16:	movq   $0x0,(%rax,%r14,1)
  40de1e:	mov    %rax,%r15
  40de21:	cmp    %r12,%rbp
  40de24:	mov    0x8(%rsp),%rcx
  40de29:	mov    0x98(%rsp),%eax
  40de30:	mov    %eax,0x8(%r15,%r14,1)
  40de35:	je     40df89 <_ZZ4mainENKUljE_clEj+0x2939>
  40de3b:	mov    %r15,%rdx
  40de3e:	mov    %r12,%rax
  40de41:	movdqu (%rax),%xmm0
  40de45:	add    $0x10,%rax
  40de49:	add    $0x10,%rdx
  40de4d:	movups %xmm0,-0x10(%rdx)
  40de51:	cmp    %rax,%rbp
  40de54:	jne    40de41 <_ZZ4mainENKUljE_clEj+0x27f1>
  40de56:	sub    %r12,%rbp
  40de59:	add    %r15,%rbp
  40de5c:	lea    0x10(%rbp),%r14
  40de60:	test   %r12,%r12
  40de63:	je     40de73 <_ZZ4mainENKUljE_clEj+0x2823>
  40de65:	mov    %rcx,%rsi
  40de68:	mov    %r12,%rdi
  40de6b:	sub    %r12,%rsi
  40de6e:	call   40e970 <_ZdlPvm>
  40de73:	mov    0x8(%rbp),%eax
  40de76:	add    %r15,%rbx
  40de79:	mov    %r15,0x8550(%r13)
  40de80:	mov    %r15,%r12
  40de83:	mov    %r14,0x8558(%r13)
  40de8a:	mov    0x0(%rbp),%rsi
  40de8e:	mov    %rbx,0x8560(%r13)
  40de95:	mov    %eax,0x98(%rsp)
  40de9c:	jmp    40dba1 <_ZZ4mainENKUljE_clEj+0x2551>
  40dea1:	movabs $0x7ffffffffffffff,%rdx
  40deab:	mov    %rbp,%r14
  40deae:	sub    %r12,%r14
  40deb1:	mov    %r14,%rax
  40deb4:	sar    $0x4,%rax
  40deb8:	cmp    %rdx,%rax
  40debb:	je     40127e <_ZZ4mainENKUljE_clEj.cold+0x98>
  40dec1:	test   %rax,%rax
  40dec4:	mov    $0x1,%ebx
  40dec9:	mov    %rcx,0x8(%rsp)
  40dece:	cmovne %rax,%rbx
  40ded2:	add    %rax,%rbx
  40ded5:	movabs $0x7ffffffffffffff,%rax
  40dedf:	cmp    %rax,%rbx
  40dee2:	cmova  %rax,%rbx
  40dee6:	lea    0xd0(%rsp),%rax
  40deee:	mov    %rax,0x80(%rsp)
  40def6:	shl    $0x4,%rbx
  40defa:	mov    %rbx,%rdi
  40defd:	call   40ea40 <_Znwm>
  40df02:	movq   $0x0,(%rax,%r14,1)
  40df0a:	mov    %rax,%r15
  40df0d:	cmp    %r12,%rbp
  40df10:	mov    0x8(%rsp),%rcx
  40df15:	mov    0x8c(%rsp),%eax
  40df1c:	mov    %eax,0x8(%r15,%r14,1)
  40df21:	je     40df91 <_ZZ4mainENKUljE_clEj+0x2941>
  40df23:	mov    %r15,%rdx
  40df26:	mov    %r12,%rax
  40df29:	movdqu (%rax),%xmm0
  40df2d:	add    $0x10,%rax
  40df31:	add    $0x10,%rdx
  40df35:	movups %xmm0,-0x10(%rdx)
  40df39:	cmp    %rax,%rbp
  40df3c:	jne    40df29 <_ZZ4mainENKUljE_clEj+0x28d9>
  40df3e:	sub    %r12,%rbp
  40df41:	add    %r15,%rbp
  40df44:	lea    0x10(%rbp),%r14
  40df48:	test   %r12,%r12
  40df4b:	je     40df5b <_ZZ4mainENKUljE_clEj+0x290b>
  40df4d:	mov    %rcx,%rsi
  40df50:	mov    %r12,%rdi
  40df53:	sub    %r12,%rsi
  40df56:	call   40e970 <_ZdlPvm>
  40df5b:	mov    0x8(%rbp),%eax
  40df5e:	add    %r15,%rbx
  40df61:	mov    %r15,0x10ac0(%r13)
  40df68:	mov    %r15,%r12
  40df6b:	mov    %r14,0x10ac8(%r13)
  40df72:	mov    0x0(%rbp),%rsi
  40df76:	mov    %rbx,0x10ad0(%r13)
  40df7d:	mov    %eax,0x8c(%rsp)
  40df84:	jmp    40dadd <_ZZ4mainENKUljE_clEj+0x248d>
  40df89:	mov    %r15,%rbp
  40df8c:	jmp    40de5c <_ZZ4mainENKUljE_clEj+0x280c>
  40df91:	mov    %r15,%rbp
  40df94:	jmp    40df44 <_ZZ4mainENKUljE_clEj+0x28f4>
  40df96:	mov    %rax,%rbx
  40df99:	jmp    4011e6 <_ZZ4mainENKUljE_clEj.cold>
  40df9e:	mov    %rax,%rbx
  40dfa1:	jmp    40124f <_ZZ4mainENKUljE_clEj.cold+0x69>
  40dfa6:	jmp    401298 <_ZZ4mainENKUljE_clEj.cold+0xb2>
  40dfab:	mov    %rax,%rbx
  40dfae:	jmp    401210 <_ZZ4mainENKUljE_clEj.cold+0x2a>

Disassembly of section .fini:
