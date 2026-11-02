
work/bin/fix_atomic_dbg:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

000000000040b060 <_ZN4SideItE5drainERKS0_Rm>:
  40b060:	push   %r15
  40b062:	push   %r14
  40b064:	mov    %rdi,%r14
  40b067:	push   %r13
  40b069:	push   %r12
  40b06b:	push   %rbp
  40b06c:	push   %rbx
  40b06d:	sub    $0x88,%rsp
  40b074:	mov    0x8240(%rdi),%rcx
  40b07b:	mov    (%rdi),%r11
  40b07e:	mov    %rsi,0x8(%rsp)
  40b083:	mov    %rcx,%rax
  40b086:	and    $0x7ff,%eax
  40b08b:	shl    $0x4,%rax
  40b08f:	lea    (%rdi,%rax,1),%r13
  40b093:	mov    0x148(%r13),%edi
  40b09a:	cmpl   $0xb,0x8(%r11)
  40b09f:	je     40b5d2 <_ZN4SideItE5drainERKS0_Rm+0x572>
  40b0a5:	test   %edi,%edi
  40b0a7:	je     40bd30 <_ZN4SideItE5drainERKS0_Rm+0xcd0>
  40b0ad:	mov    %r13,%r12
  40b0b0:	mov    0x10(%r11),%rsi
  40b0b4:	pcmpeqd %xmm0,%xmm0
  40b0b8:	xor    %r15d,%r15d
  40b0bb:	xor    %r13d,%r13d
  40b0be:	mov    %rdx,%r10
  40b0c1:	jmp    40b0d5 <_ZN4SideItE5drainERKS0_Rm+0x75>
  40b0c3:	nopl   0x0(%rax,%rax,1)
  40b0c8:	add    $0x1,%r13
  40b0cc:	cmp    %edi,%r13d
  40b0cf:	jae    40b54b <_ZN4SideItE5drainERKS0_Rm+0x4eb>
  40b0d5:	lea    -0x1(%rdi),%ebx
  40b0d8:	lea    0x8(%r13),%eax
  40b0dc:	mov    0x140(%r12),%r9
  40b0e4:	mov    %rcx,%rbp
  40b0e7:	cmp    %ebx,%eax
  40b0e9:	cmova  %ebx,%eax
  40b0ec:	mov    (%r9,%rax,4),%edx
  40b0f0:	mov    %edx,%eax
  40b0f2:	mov    %rdx,%r8
  40b0f5:	and    $0x7f,%edx
  40b0f8:	and    $0x1ffffff,%eax
  40b0fd:	shl    $0x27,%r8
  40b101:	prefetcht0 (%rsi,%rax,4)
  40b105:	mov    0x8(%r14),%rax
  40b109:	shr    $0x2e,%r8
  40b10d:	mov    (%rax,%r8,8),%r8
  40b111:	prefetcht0 (%r8,%rdx,2)
  40b116:	lea    0x4(%r13),%r8d
  40b11a:	mov    0x18(%r11),%rdx
  40b11e:	cmp    %ebx,%r8d
  40b121:	cmova  %ebx,%r8d
  40b125:	shl    $0x7,%rbp
  40b129:	mov    (%r9,%r8,4),%r8d
  40b12d:	and    $0x1ffffff,%r8d
  40b134:	mov    (%rsi,%r8,4),%r8d
  40b138:	prefetcht0 (%rdx,%r8,4)
  40b13d:	mov    (%r9,%r13,4),%r8d
  40b141:	mov    %r8d,%r9d
  40b144:	mov    %r8d,%ebx
  40b147:	and    $0x7f,%r8d
  40b14b:	shr    $0x19,%ebx
  40b14e:	and    $0x1ffffff,%r9d
  40b155:	or     %rbx,%rbp
  40b158:	mov    %r9d,%ebx
  40b15b:	shr    $0x7,%ebx
  40b15e:	mov    %rbp,0x10(%rsp)
  40b163:	mov    (%rax,%rbx,8),%rbx
  40b167:	movzwl (%rbx,%r8,2),%r8d
  40b16c:	cmp    %r8,%rbp
  40b16f:	jne    40b0c8 <_ZN4SideItE5drainERKS0_Rm+0x68>
  40b175:	mov    %r9d,%r8d
  40b178:	add    $0x1,%r15d
  40b17c:	mov    (%rsi,%r8,4),%ebp
  40b180:	lea    0x1(%r9),%r8d
  40b184:	lea    0x0(,%r8,4),%rbx
  40b18c:	mov    %rbx,0x18(%rsp)
  40b191:	cmp    (%rsi,%r8,4),%ebp
  40b195:	jae    40b0c8 <_ZN4SideItE5drainERKS0_Rm+0x68>
  40b19b:	lea    0x40(%r14),%rdi
  40b19f:	mov    %r15d,0x54(%rsp)
  40b1a4:	mov    %rdi,0x20(%rsp)
  40b1a9:	mov    %r13,0x58(%rsp)
  40b1ae:	mov    %r12,0x60(%rsp)
  40b1b3:	jmp    40b2a4 <_ZN4SideItE5drainERKS0_Rm+0x244>
  40b1b8:	nopl   0x0(%rax,%rax,1)
  40b1c0:	movzwl (%rsi),%eax
  40b1c3:	add    0x10(%rsp),%rbx
  40b1c8:	mov    %rbx,%r15
  40b1cb:	cmp    %rax,%rbx
  40b1ce:	mov    %rax,%rdx
  40b1d1:	cmovbe %rbx,%rdx
  40b1d5:	shr    $0x7,%r15
  40b1d9:	mov    %dx,(%rsi)
  40b1dc:	mov    %r15,%rdx
  40b1df:	sub    0x8240(%r14),%rdx
  40b1e6:	cmp    $0x7ff,%rdx
  40b1ed:	ja     40b340 <_ZN4SideItE5drainERKS0_Rm+0x2e0>
  40b1f3:	cmp    %rax,%rbx
  40b1f6:	mov    %r15,%r12
  40b1f9:	mov    %r15d,%ecx
  40b1fc:	setb   %dl
  40b1ff:	and    $0x7ff,%r12d
  40b206:	and    $0x7ff,%ecx
  40b20c:	shl    $0x4,%r12
  40b210:	add    %r14,%r12
  40b213:	mov    0x148(%r12),%eax
  40b21b:	mov    0x140(%r12),%rdi
  40b223:	cmp    0x14c(%r12),%eax
  40b22b:	je     40b4a8 <_ZN4SideItE5drainERKS0_Rm+0x448>
  40b231:	mov    %ebx,%esi
  40b233:	shl    $0x19,%esi
  40b236:	or     %r13d,%esi
  40b239:	mov    %esi,(%rdi,%rax,4)
  40b23c:	movzbl %dl,%eax
  40b23f:	movzbl %dl,%edx
  40b242:	add    %eax,0x148(%r12)
  40b24a:	mov    %ecx,%eax
  40b24c:	mov    %r15d,%ecx
  40b24f:	shr    $0x6,%eax
  40b252:	add    %rdx,0x8248(%r14)
  40b259:	shl    %cl,%rdx
  40b25c:	or     %rdx,0x8140(%r14,%rax,8)
  40b264:	mov    0x8(%rsp),%rax
  40b269:	mov    (%r10),%rdx
  40b26c:	mov    0x10(%r11),%rsi
  40b270:	mov    0x8(%rax),%rax
  40b274:	mov    (%rax,%r8,8),%rax
  40b278:	movzwl (%rax,%r9,2),%eax
  40b27d:	add    %rbx,%rax
  40b280:	cmp    %rdx,%rax
  40b283:	cmova  %rdx,%rax
  40b287:	add    $0x1,%rbp
  40b28b:	mov    %rax,(%r10)
  40b28e:	mov    0x18(%rsp),%rax
  40b293:	cmp    (%rsi,%rax,1),%ebp
  40b296:	jae    40b520 <_ZN4SideItE5drainERKS0_Rm+0x4c0>
  40b29c:	mov    0x18(%r11),%rdx
  40b2a0:	mov    0x8(%r14),%rax
  40b2a4:	mov    0x8(%r11),%ecx
  40b2a8:	mov    (%rdx,%rbp,4),%r13d
  40b2ac:	lea    0x0(,%rbp,4),%rbx
  40b2b4:	shr    %cl,%r13d
  40b2b7:	mov    %r13d,%ecx
  40b2ba:	shr    $0x7,%ecx
  40b2bd:	mov    %ecx,%r8d
  40b2c0:	lea    (%rax,%r8,8),%rsi
  40b2c4:	mov    (%rsi),%rax
  40b2c7:	cmp    0x20(%rsp),%rax
  40b2cc:	je     40b408 <_ZN4SideItE5drainERKS0_Rm+0x3a8>
  40b2d2:	mov    %r13d,%r9d
  40b2d5:	mov    (%rdx,%rbx,1),%edi
  40b2d8:	and    $0x7f,%r9d
  40b2dc:	lea    (%rax,%r9,2),%rsi
  40b2e0:	mov    0xc(%r11),%eax
  40b2e4:	and    %eax,%edi
  40b2e6:	mov    %edi,%ebx
  40b2e8:	cmp    %edi,%eax
  40b2ea:	jne    40b1c0 <_ZN4SideItE5drainERKS0_Rm+0x160>
  40b2f0:	mov    0x20(%r11),%rdi
  40b2f4:	mov    0x28(%r11),%rax
  40b2f8:	sub    %rdi,%rax
  40b2fb:	sar    $0x4,%rax
  40b2ff:	nop
  40b300:	test   %rax,%rax
  40b303:	jle    40b32a <_ZN4SideItE5drainERKS0_Rm+0x2ca>
  40b305:	mov    %rax,%rcx
  40b308:	sar    $1,%rcx
  40b30b:	mov    %rcx,%rdx
  40b30e:	shl    $0x4,%rdx
  40b312:	add    %rdi,%rdx
  40b315:	cmp    %rbp,(%rdx)
  40b318:	jae    40b338 <_ZN4SideItE5drainERKS0_Rm+0x2d8>
  40b31a:	sub    %rcx,%rax
  40b31d:	lea    0x10(%rdx),%rdi
  40b321:	sub    $0x1,%rax
  40b325:	test   %rax,%rax
  40b328:	jg     40b305 <_ZN4SideItE5drainERKS0_Rm+0x2a5>
  40b32a:	mov    0x8(%rdi),%rbx
  40b32e:	jmp    40b1c0 <_ZN4SideItE5drainERKS0_Rm+0x160>
  40b333:	nopl   0x0(%rax,%rax,1)
  40b338:	mov    %rcx,%rax
  40b33b:	jmp    40b300 <_ZN4SideItE5drainERKS0_Rm+0x2a0>
  40b33d:	nopl   (%rax)
  40b340:	cmp    %rax,%rbx
  40b343:	jae    40b264 <_ZN4SideItE5drainERKS0_Rm+0x204>
  40b349:	mov    0x8258(%r14),%r15
  40b350:	mov    0x8260(%r14),%rsi
  40b357:	mov    0x8250(%r14),%r12
  40b35e:	cmp    %rsi,%r15
  40b361:	je     40bac2 <_ZN4SideItE5drainERKS0_Rm+0xa62>
  40b367:	mov    %rbx,(%r15)
  40b36a:	add    $0x10,%r15
  40b36e:	mov    %rbx,%rdi
  40b371:	mov    %r13d,-0x8(%r15)
  40b375:	mov    %r15,0x8258(%r14)
  40b37c:	sub    %r12,%r15
  40b37f:	mov    %r15,%rcx
  40b382:	lea    -0x10(%r12,%r15,1),%rax
  40b387:	sar    $0x4,%rcx
  40b38b:	lea    -0x1(%rcx),%rdx
  40b38f:	sub    $0x2,%rcx
  40b393:	sar    $1,%rcx
  40b396:	test   %rdx,%rdx
  40b399:	jle    40b3f8 <_ZN4SideItE5drainERKS0_Rm+0x398>
  40b39b:	mov    %rcx,%rax
  40b39e:	shl    $0x4,%rax
  40b3a2:	add    %r12,%rax
  40b3a5:	mov    (%rax),%rsi
  40b3a8:	cmp    %rsi,%rdi
  40b3ab:	jb     40b498 <_ZN4SideItE5drainERKS0_Rm+0x438>
  40b3b1:	cmp    %rdi,%rsi
  40b3b4:	jne    40b3f0 <_ZN4SideItE5drainERKS0_Rm+0x390>
  40b3b6:	mov    0x8(%rax),%r15d
  40b3ba:	cmp    %r15d,%r13d
  40b3bd:	jae    40b3f0 <_ZN4SideItE5drainERKS0_Rm+0x390>
  40b3bf:	shl    $0x4,%rdx
  40b3c3:	mov    %rsi,(%r12,%rdx,1)
  40b3c7:	mov    %r15d,0x8(%r12,%rdx,1)
  40b3cc:	lea    -0x1(%rcx),%rdx
  40b3d0:	shr    $0x3f,%rdx
  40b3d4:	lea    -0x1(%rdx,%rcx,1),%rsi
  40b3d9:	mov    %rcx,%rdx
  40b3dc:	test   %rcx,%rcx
  40b3df:	je     40b3f8 <_ZN4SideItE5drainERKS0_Rm+0x398>
  40b3e1:	mov    %rsi,%rcx
  40b3e4:	sar    $1,%rcx
  40b3e7:	jmp    40b39b <_ZN4SideItE5drainERKS0_Rm+0x33b>
  40b3e9:	nopl   0x0(%rax)
  40b3f0:	shl    $0x4,%rdx
  40b3f4:	lea    (%r12,%rdx,1),%rax
  40b3f8:	mov    %rdi,(%rax)
  40b3fb:	mov    %r13d,0x8(%rax)
  40b3ff:	jmp    40b264 <_ZN4SideItE5drainERKS0_Rm+0x204>
  40b404:	nopl   0x0(%rax)
  40b408:	mov    0x28(%r14),%rdi
  40b40c:	mov    %ecx,0x7c(%rsp)
  40b410:	mov    %rdi,%rax
  40b413:	sub    0x20(%r14),%rax
  40b417:	shl    $0x6,%rax
  40b41b:	add    0x38(%r14),%rax
  40b41f:	movups %xmm0,(%rax)
  40b422:	movups %xmm0,0x10(%rax)
  40b426:	movups %xmm0,0x20(%rax)
  40b42a:	movups %xmm0,0x30(%rax)
  40b42e:	movups %xmm0,0x40(%rax)
  40b432:	movups %xmm0,0x50(%rax)
  40b436:	movups %xmm0,0x60(%rax)
  40b43a:	movups %xmm0,0x70(%rax)
  40b43e:	movups %xmm0,0x80(%rax)
  40b445:	movups %xmm0,0x90(%rax)
  40b44c:	movups %xmm0,0xa0(%rax)
  40b453:	movups %xmm0,0xb0(%rax)
  40b45a:	movups %xmm0,0xc0(%rax)
  40b461:	movups %xmm0,0xd0(%rax)
  40b468:	movups %xmm0,0xe0(%rax)
  40b46f:	movups %xmm0,0xf0(%rax)
  40b476:	mov    %rax,(%rsi)
  40b479:	cmp    0x30(%r14),%rdi
  40b47d:	je     40b598 <_ZN4SideItE5drainERKS0_Rm+0x538>
  40b483:	mov    %ecx,(%rdi)
  40b485:	add    $0x4,%rdi
  40b489:	mov    %rdi,0x28(%r14)
  40b48d:	jmp    40b2d2 <_ZN4SideItE5drainERKS0_Rm+0x272>
  40b492:	nopw   0x0(%rax,%rax,1)
  40b498:	mov    0x8(%rax),%r15d
  40b49c:	jmp    40b3bf <_ZN4SideItE5drainERKS0_Rm+0x35f>
  40b4a1:	nopl   0x0(%rax)
  40b4a8:	mov    $0x10,%esi
  40b4ad:	add    %eax,%eax
  40b4af:	mov    %r10,0x48(%rsp)
  40b4b4:	cmp    %esi,%eax
  40b4b6:	mov    %r9,0x40(%rsp)
  40b4bb:	cmovb  %esi,%eax
  40b4be:	mov    %r8,0x38(%rsp)
  40b4c3:	mov    %ecx,0x30(%rsp)
  40b4c7:	mov    %eax,0x14c(%r12)
  40b4cf:	lea    0x0(,%rax,4),%esi
  40b4d6:	mov    %dl,0x28(%rsp)
  40b4da:	call   444700 <__libc_realloc>
  40b4df:	mov    (%r14),%r11
  40b4e2:	mov    0x30(%rsp),%ecx
  40b4e6:	pcmpeqd %xmm0,%xmm0
  40b4ea:	mov    %rax,0x140(%r12)
  40b4f2:	mov    %rax,%rdi
  40b4f5:	mov    0x48(%rsp),%r10
  40b4fa:	mov    0x148(%r12),%eax
  40b502:	mov    0x40(%rsp),%r9
  40b507:	mov    0x38(%rsp),%r8
  40b50c:	movzbl 0x28(%rsp),%edx
  40b511:	jmp    40b231 <_ZN4SideItE5drainERKS0_Rm+0x1d1>
  40b516:	cs nopw 0x0(%rax,%rax,1)
  40b520:	mov    0x60(%rsp),%r12
  40b525:	mov    0x58(%rsp),%r13
  40b52a:	mov    0x54(%rsp),%r15d
  40b52f:	mov    0x8240(%r14),%rcx
  40b536:	mov    0x148(%r12),%edi
  40b53e:	add    $0x1,%r13
  40b542:	cmp    %edi,%r13d
  40b545:	jb     40b0d5 <_ZN4SideItE5drainERKS0_Rm+0x75>
  40b54b:	mov    %r12,%r13
  40b54e:	mov    %r15d,%eax
  40b551:	mov    %rcx,%rdx
  40b554:	mov    $0xfffffffffffffffe,%rsi
  40b55b:	sub    %rdi,0x8248(%r14)
  40b562:	shr    $0x6,%rdx
  40b566:	rol    %cl,%rsi
  40b569:	movl   $0x0,0x148(%r13)
  40b574:	and    $0x1f,%edx
  40b577:	and    %rsi,0x8140(%r14,%rdx,8)
  40b57f:	add    $0x88,%rsp
  40b586:	pop    %rbx
  40b587:	pop    %rbp
  40b588:	pop    %r12
  40b58a:	pop    %r13
  40b58c:	pop    %r14
  40b58e:	pop    %r15
  40b590:	ret
  40b591:	nopl   0x0(%rax)
  40b598:	lea    0x7c(%rsp),%rsi
  40b59d:	lea    0x20(%r14),%rdi
  40b5a1:	mov    %r10,0x30(%rsp)
  40b5a6:	mov    %r8,0x28(%rsp)
  40b5ab:	call   408a20 <_ZNSt6vectorIjSaIjEE17_M_realloc_appendIJRKjEEEvDpOT_>
  40b5b0:	mov    0x8(%r14),%rax
  40b5b4:	mov    (%r14),%r11
  40b5b7:	pcmpeqd %xmm0,%xmm0
  40b5bb:	mov    0x28(%rsp),%r8
  40b5c0:	mov    0x30(%rsp),%r10
  40b5c5:	mov    0x18(%r11),%rdx
  40b5c9:	mov    (%rax,%r8,8),%rax
  40b5cd:	jmp    40b2d2 <_ZN4SideItE5drainERKS0_Rm+0x272>
  40b5d2:	test   %edi,%edi
  40b5d4:	je     40bd30 <_ZN4SideItE5drainERKS0_Rm+0xcd0>
  40b5da:	movl   $0x0,0x54(%rsp)
  40b5e2:	xor    %ebp,%ebp
  40b5e4:	mov    %r13,%r15
  40b5e7:	mov    %rdx,%r10
  40b5ea:	mov    0x10(%r11),%r9
  40b5ee:	pcmpeqd %xmm0,%xmm0
  40b5f2:	jmp    40b604 <_ZN4SideItE5drainERKS0_Rm+0x5a4>
  40b5f4:	nopl   0x0(%rax)
  40b5f8:	add    $0x1,%rbp
  40b5fc:	cmp    %edi,%ebp
  40b5fe:	jae    40ba74 <_ZN4SideItE5drainERKS0_Rm+0xa14>
  40b604:	lea    -0x1(%rdi),%r8d
  40b608:	lea    0x8(%rbp),%eax
  40b60b:	mov    0x140(%r15),%rsi
  40b612:	mov    0x18(%r11),%r13
  40b616:	cmp    %r8d,%eax
  40b619:	cmova  %r8d,%eax
  40b61d:	mov    (%rsi,%rax,4),%edx
  40b620:	mov    %edx,%eax
  40b622:	mov    %rdx,%rbx
  40b625:	and    $0x7f,%edx
  40b628:	and    $0x1ffffff,%eax
  40b62d:	shl    $0x27,%rbx
  40b631:	prefetcht0 (%r9,%rax,4)
  40b636:	mov    0x8(%r14),%rax
  40b63a:	shr    $0x2e,%rbx
  40b63e:	mov    (%rax,%rbx,8),%rbx
  40b642:	prefetcht0 (%rbx,%rdx,2)
  40b646:	lea    0x4(%rbp),%edx
  40b649:	mov    %rcx,%rbx
  40b64c:	cmp    %r8d,%edx
  40b64f:	cmova  %r8d,%edx
  40b653:	shl    $0x7,%rbx
  40b657:	mov    (%rsi,%rdx,4),%edx
  40b65a:	and    $0x1ffffff,%edx
  40b660:	mov    (%r9,%rdx,4),%edx
  40b664:	prefetcht0 0x0(%r13,%rdx,4)
  40b66a:	mov    (%rsi,%rbp,4),%edx
  40b66d:	mov    %edx,%esi
  40b66f:	mov    %edx,%r8d
  40b672:	and    $0x7f,%edx
  40b675:	shr    $0x19,%r8d
  40b679:	and    $0x1ffffff,%esi
  40b67f:	or     %r8,%rbx
  40b682:	mov    %esi,%r8d
  40b685:	shr    $0x7,%r8d
  40b689:	mov    %rbx,0x10(%rsp)
  40b68e:	mov    (%rax,%r8,8),%r8
  40b692:	movzwl (%r8,%rdx,2),%edx
  40b697:	cmp    %rdx,%rbx
  40b69a:	jne    40b5f8 <_ZN4SideItE5drainERKS0_Rm+0x598>
  40b6a0:	mov    %esi,%edx
  40b6a2:	addl   $0x1,0x54(%rsp)
  40b6a7:	mov    (%r9,%rdx,4),%r12d
  40b6ab:	lea    0x1(%rsi),%edx
  40b6ae:	lea    0x0(,%rdx,4),%rsi
  40b6b6:	mov    %rsi,0x18(%rsp)
  40b6bb:	cmp    (%r9,%rdx,4),%r12d
  40b6bf:	jae    40b5f8 <_ZN4SideItE5drainERKS0_Rm+0x598>
  40b6c5:	lea    0x40(%r14),%rdi
  40b6c9:	mov    %rbp,0x58(%rsp)
  40b6ce:	mov    %rdi,0x20(%rsp)
  40b6d3:	mov    %r15,0x60(%rsp)
  40b6d8:	jmp    40b7c1 <_ZN4SideItE5drainERKS0_Rm+0x761>
  40b6dd:	nopl   (%rax)
  40b6e0:	movzwl (%r9),%eax
  40b6e4:	add    0x10(%rsp),%rbx
  40b6e9:	mov    %rbx,%r13
  40b6ec:	cmp    %rax,%rbx
  40b6ef:	mov    %rax,%rsi
  40b6f2:	cmovbe %rbx,%rsi
  40b6f6:	shr    $0x7,%r13
  40b6fa:	mov    %si,(%r9)
  40b6fe:	mov    %r13,%rsi
  40b701:	sub    0x8240(%r14),%rsi
  40b708:	cmp    $0x7ff,%rsi
  40b70f:	ja     40b870 <_ZN4SideItE5drainERKS0_Rm+0x810>
  40b715:	cmp    %rax,%rbx
  40b718:	mov    %r13,%rbp
  40b71b:	mov    %r13d,%r9d
  40b71e:	setb   %r15b
  40b722:	and    $0x7ff,%ebp
  40b728:	and    $0x7ff,%r9d
  40b72f:	shl    $0x4,%rbp
  40b733:	add    %r14,%rbp
  40b736:	mov    0x148(%rbp),%eax
  40b73c:	mov    0x140(%rbp),%rdi
  40b743:	cmp    0x14c(%rbp),%eax
  40b749:	je     40b9e0 <_ZN4SideItE5drainERKS0_Rm+0x980>
  40b74f:	mov    %ebx,%esi
  40b751:	shr    $0x6,%r9d
  40b755:	shl    $0x19,%esi
  40b758:	or     %ecx,%esi
  40b75a:	mov    %r13d,%ecx
  40b75d:	mov    %esi,(%rdi,%rax,4)
  40b760:	movzbl %r15b,%eax
  40b764:	movzbl %r15b,%r15d
  40b768:	add    %eax,0x148(%rbp)
  40b76e:	add    %r15,0x8248(%r14)
  40b775:	shl    %cl,%r15
  40b778:	or     %r15,0x8140(%r14,%r9,8)
  40b780:	mov    0x8(%rsp),%rax
  40b785:	mov    0x10(%r11),%r9
  40b789:	mov    0x8(%rax),%rax
  40b78d:	mov    (%rax,%rdx,8),%rax
  40b791:	mov    (%r10),%rdx
  40b794:	movzwl (%rax,%r8,2),%eax
  40b799:	add    %rbx,%rax
  40b79c:	cmp    %rdx,%rax
  40b79f:	cmova  %rdx,%rax
  40b7a3:	add    $0x1,%r12
  40b7a7:	mov    %rax,(%r10)
  40b7aa:	mov    0x18(%rsp),%rax
  40b7af:	cmp    (%r9,%rax,1),%r12d
  40b7b3:	jae    40ba50 <_ZN4SideItE5drainERKS0_Rm+0x9f0>
  40b7b9:	mov    0x18(%r11),%r13
  40b7bd:	mov    0x8(%r14),%rax
  40b7c1:	mov    0x0(%r13,%r12,4),%esi
  40b7c6:	lea    0x0(,%r12,4),%rbx
  40b7ce:	mov    %esi,%ecx
  40b7d0:	shr    $0x12,%esi
  40b7d3:	mov    %esi,%edx
  40b7d5:	shr    $0xb,%ecx
  40b7d8:	lea    (%rax,%rdx,8),%rdi
  40b7dc:	mov    (%rdi),%rax
  40b7df:	cmp    0x20(%rsp),%rax
  40b7e4:	je     40b910 <_ZN4SideItE5drainERKS0_Rm+0x8b0>
  40b7ea:	mov    %ecx,%r8d
  40b7ed:	and    $0x7f,%r8d
  40b7f1:	lea    (%rax,%r8,2),%r9
  40b7f5:	mov    0x0(%r13,%rbx,1),%eax
  40b7fa:	mov    %eax,%ebx
  40b7fc:	and    $0x7ff,%ebx
  40b802:	cmp    $0x7ff,%ebx
  40b808:	jne    40b6e0 <_ZN4SideItE5drainERKS0_Rm+0x680>
  40b80e:	mov    0xc(%r11),%esi
  40b812:	and    %esi,%eax
  40b814:	mov    %eax,%ebx
  40b816:	cmp    %eax,%esi
  40b818:	jne    40b6e0 <_ZN4SideItE5drainERKS0_Rm+0x680>
  40b81e:	mov    0x20(%r11),%rbx
  40b822:	mov    0x28(%r11),%rax
  40b826:	sub    %rbx,%rax
  40b829:	sar    $0x4,%rax
  40b82d:	nopl   (%rax)
  40b830:	test   %rax,%rax
  40b833:	jle    40b85a <_ZN4SideItE5drainERKS0_Rm+0x7fa>
  40b835:	mov    %rax,%rdi
  40b838:	sar    $1,%rdi
  40b83b:	mov    %rdi,%rsi
  40b83e:	shl    $0x4,%rsi
  40b842:	add    %rbx,%rsi
  40b845:	cmp    %r12,(%rsi)
  40b848:	jae    40b868 <_ZN4SideItE5drainERKS0_Rm+0x808>
  40b84a:	sub    %rdi,%rax
  40b84d:	lea    0x10(%rsi),%rbx
  40b851:	sub    $0x1,%rax
  40b855:	test   %rax,%rax
  40b858:	jg     40b835 <_ZN4SideItE5drainERKS0_Rm+0x7d5>
  40b85a:	mov    0x8(%rbx),%rbx
  40b85e:	jmp    40b6e0 <_ZN4SideItE5drainERKS0_Rm+0x680>
  40b863:	nopl   0x0(%rax,%rax,1)
  40b868:	mov    %rdi,%rax
  40b86b:	jmp    40b830 <_ZN4SideItE5drainERKS0_Rm+0x7d0>
  40b86d:	nopl   (%rax)
  40b870:	cmp    %rax,%rbx
  40b873:	jae    40b780 <_ZN4SideItE5drainERKS0_Rm+0x720>
  40b879:	mov    0x8258(%r14),%r15
  40b880:	mov    0x8260(%r14),%r13
  40b887:	mov    0x8250(%r14),%rbp
  40b88e:	cmp    %r13,%r15
  40b891:	je     40bbf5 <_ZN4SideItE5drainERKS0_Rm+0xb95>
  40b897:	mov    %rbx,(%r15)
  40b89a:	add    $0x10,%r15
  40b89e:	mov    %rbx,%r13
  40b8a1:	mov    %ecx,-0x8(%r15)
  40b8a5:	mov    %r15,0x8258(%r14)
  40b8ac:	sub    %rbp,%r15
  40b8af:	mov    %r15,%rdi
  40b8b2:	lea    -0x10(%rbp,%r15,1),%rax
  40b8b7:	sar    $0x4,%rdi
  40b8bb:	lea    -0x1(%rdi),%rsi
  40b8bf:	sub    $0x2,%rdi
  40b8c3:	sar    $1,%rdi
  40b8c6:	test   %rsi,%rsi
  40b8c9:	jle    40b8fc <_ZN4SideItE5drainERKS0_Rm+0x89c>
  40b8cb:	mov    %rdi,%rax
  40b8ce:	shl    $0x4,%rax
  40b8d2:	add    %rbp,%rax
  40b8d5:	mov    (%rax),%r9
  40b8d8:	cmp    %r9,%r13
  40b8db:	jb     40b9a0 <_ZN4SideItE5drainERKS0_Rm+0x940>
  40b8e1:	cmp    %r13,%r9
  40b8e4:	jne    40b8f3 <_ZN4SideItE5drainERKS0_Rm+0x893>
  40b8e6:	mov    0x8(%rax),%r15d
  40b8ea:	cmp    %r15d,%ecx
  40b8ed:	jb     40b9a4 <_ZN4SideItE5drainERKS0_Rm+0x944>
  40b8f3:	shl    $0x4,%rsi
  40b8f7:	lea    0x0(%rbp,%rsi,1),%rax
  40b8fc:	mov    %r13,(%rax)
  40b8ff:	mov    %ecx,0x8(%rax)
  40b902:	jmp    40b780 <_ZN4SideItE5drainERKS0_Rm+0x720>
  40b907:	nopw   0x0(%rax,%rax,1)
  40b910:	mov    0x28(%r14),%r8
  40b914:	mov    %esi,0x7c(%rsp)
  40b918:	mov    %r8,%rax
  40b91b:	sub    0x20(%r14),%rax
  40b91f:	shl    $0x6,%rax
  40b923:	add    0x38(%r14),%rax
  40b927:	movups %xmm0,(%rax)
  40b92a:	movups %xmm0,0x10(%rax)
  40b92e:	movups %xmm0,0x20(%rax)
  40b932:	movups %xmm0,0x30(%rax)
  40b936:	movups %xmm0,0x40(%rax)
  40b93a:	movups %xmm0,0x50(%rax)
  40b93e:	movups %xmm0,0x60(%rax)
  40b942:	movups %xmm0,0x70(%rax)
  40b946:	movups %xmm0,0x80(%rax)
  40b94d:	movups %xmm0,0x90(%rax)
  40b954:	movups %xmm0,0xa0(%rax)
  40b95b:	movups %xmm0,0xb0(%rax)
  40b962:	movups %xmm0,0xc0(%rax)
  40b969:	movups %xmm0,0xd0(%rax)
  40b970:	movups %xmm0,0xe0(%rax)
  40b977:	movups %xmm0,0xf0(%rax)
  40b97e:	mov    %rax,(%rdi)
  40b981:	cmp    0x30(%r14),%r8
  40b985:	je     40ba80 <_ZN4SideItE5drainERKS0_Rm+0xa20>
  40b98b:	mov    %esi,(%r8)
  40b98e:	add    $0x4,%r8
  40b992:	mov    %r8,0x28(%r14)
  40b996:	jmp    40b7ea <_ZN4SideItE5drainERKS0_Rm+0x78a>
  40b99b:	nopl   0x0(%rax,%rax,1)
  40b9a0:	mov    0x8(%rax),%r15d
  40b9a4:	shl    $0x4,%rsi
  40b9a8:	mov    %r9,0x0(%rbp,%rsi,1)
  40b9ad:	mov    %r15d,0x8(%rbp,%rsi,1)
  40b9b2:	lea    -0x1(%rdi),%rsi
  40b9b6:	shr    $0x3f,%rsi
  40b9ba:	lea    -0x1(%rsi,%rdi,1),%r9
  40b9bf:	mov    %rdi,%rsi
  40b9c2:	test   %rdi,%rdi
  40b9c5:	je     40b8fc <_ZN4SideItE5drainERKS0_Rm+0x89c>
  40b9cb:	mov    %r9,%rdi
  40b9ce:	sar    $1,%rdi
  40b9d1:	jmp    40b8cb <_ZN4SideItE5drainERKS0_Rm+0x86b>
  40b9d6:	cs nopw 0x0(%rax,%rax,1)
  40b9e0:	mov    $0x10,%esi
  40b9e5:	add    %eax,%eax
  40b9e7:	mov    %r10,0x48(%rsp)
  40b9ec:	cmp    %esi,%eax
  40b9ee:	mov    %r8,0x40(%rsp)
  40b9f3:	cmovb  %esi,%eax
  40b9f6:	mov    %rdx,0x38(%rsp)
  40b9fb:	mov    %r9d,0x30(%rsp)
  40ba00:	mov    %eax,0x14c(%rbp)
  40ba06:	lea    0x0(,%rax,4),%esi
  40ba0d:	mov    %ecx,0x28(%rsp)
  40ba11:	call   444700 <__libc_realloc>
  40ba16:	mov    (%r14),%r11
  40ba19:	mov    0x48(%rsp),%r10
  40ba1e:	pcmpeqd %xmm0,%xmm0
  40ba22:	mov    %rax,0x140(%rbp)
  40ba29:	mov    %rax,%rdi
  40ba2c:	mov    0x40(%rsp),%r8
  40ba31:	mov    0x148(%rbp),%eax
  40ba37:	mov    0x38(%rsp),%rdx
  40ba3c:	mov    0x30(%rsp),%r9d
  40ba41:	mov    0x28(%rsp),%ecx
  40ba45:	jmp    40b74f <_ZN4SideItE5drainERKS0_Rm+0x6ef>
  40ba4a:	nopw   0x0(%rax,%rax,1)
  40ba50:	mov    0x60(%rsp),%r15
  40ba55:	mov    0x58(%rsp),%rbp
  40ba5a:	mov    0x8240(%r14),%rcx
  40ba61:	mov    0x148(%r15),%edi
  40ba68:	add    $0x1,%rbp
  40ba6c:	cmp    %edi,%ebp
  40ba6e:	jb     40b604 <_ZN4SideItE5drainERKS0_Rm+0x5a4>
  40ba74:	mov    0x54(%rsp),%eax
  40ba78:	mov    %r15,%r13
  40ba7b:	jmp    40b551 <_ZN4SideItE5drainERKS0_Rm+0x4f1>
  40ba80:	lea    0x7c(%rsp),%rsi
  40ba85:	lea    0x20(%r14),%rdi
  40ba89:	mov    %r10,0x38(%rsp)
  40ba8e:	mov    %rdx,0x30(%rsp)
  40ba93:	mov    %ecx,0x28(%rsp)
  40ba97:	call   408a20 <_ZNSt6vectorIjSaIjEE17_M_realloc_appendIJRKjEEEvDpOT_>
  40ba9c:	mov    0x8(%r14),%rax
  40baa0:	mov    (%r14),%r11
  40baa3:	pcmpeqd %xmm0,%xmm0
  40baa7:	mov    0x30(%rsp),%rdx
  40baac:	mov    0x38(%rsp),%r10
  40bab1:	mov    0x18(%r11),%r13
  40bab5:	mov    0x28(%rsp),%ecx
  40bab9:	mov    (%rax,%rdx,8),%rax
  40babd:	jmp    40b7ea <_ZN4SideItE5drainERKS0_Rm+0x78a>
  40bac2:	movabs $0x7ffffffffffffff,%rax
  40bacc:	mov    %r15,%r11
  40bacf:	sub    %r12,%r11
  40bad2:	mov    %r11,%rdx
  40bad5:	sar    $0x4,%rdx
  40bad9:	cmp    %rax,%rdx
  40badc:	je     401210 <_ZN4SideItE5drainERKS0_Rm.cold>
  40bae2:	test   %rdx,%rdx
  40bae5:	mov    $0x1,%eax
  40baea:	mov    %r11,0x30(%rsp)
  40baef:	cmovne %rdx,%rax
  40baf3:	mov    %rsi,0x38(%rsp)
  40baf8:	mov    %r8,0x40(%rsp)
  40bafd:	add    %rdx,%rax
  40bb00:	mov    %r9,0x48(%rsp)
  40bb05:	movabs $0x7ffffffffffffff,%rdx
  40bb0f:	cmp    %rdx,%rax
  40bb12:	mov    %r10,0x68(%rsp)
  40bb17:	cmova  %rdx,%rax
  40bb1b:	shl    $0x4,%rax
  40bb1f:	mov    %rax,%rdi
  40bb22:	mov    %rax,0x28(%rsp)
  40bb27:	call   40fc80 <_Znwm>
  40bb2c:	mov    0x30(%rsp),%r11
  40bb31:	cmp    %r12,%r15
  40bb34:	mov    0x38(%rsp),%rsi
  40bb39:	mov    0x40(%rsp),%r8
  40bb3e:	mov    0x48(%rsp),%r9
  40bb43:	mov    %rax,%rcx
  40bb46:	pcmpeqd %xmm0,%xmm0
  40bb4a:	mov    %rbx,(%rax,%r11,1)
  40bb4e:	mov    0x68(%rsp),%r10
  40bb53:	mov    %r13d,0x8(%rax,%r11,1)
  40bb58:	je     40bb7c <_ZN4SideItE5drainERKS0_Rm+0xb1c>
  40bb5a:	mov    %rax,%rdx
  40bb5d:	mov    %r12,%rax
  40bb60:	movdqu (%rax),%xmm1
  40bb64:	add    $0x10,%rax
  40bb68:	add    $0x10,%rdx
  40bb6c:	movups %xmm1,-0x10(%rdx)
  40bb70:	cmp    %rax,%r15
  40bb73:	jne    40bb60 <_ZN4SideItE5drainERKS0_Rm+0xb00>
  40bb75:	sub    %r12,%r15
  40bb78:	lea    (%rcx,%r15,1),%rax
  40bb7c:	lea    0x10(%rax),%r15
  40bb80:	test   %r12,%r12
  40bb83:	je     40bbc6 <_ZN4SideItE5drainERKS0_Rm+0xb66>
  40bb85:	sub    %r12,%rsi
  40bb88:	mov    %r12,%rdi
  40bb8b:	mov    %r10,0x68(%rsp)
  40bb90:	mov    %rcx,0x48(%rsp)
  40bb95:	mov    %r9,0x40(%rsp)
  40bb9a:	mov    %r8,0x38(%rsp)
  40bb9f:	mov    %rax,0x30(%rsp)
  40bba4:	call   40fbb0 <_ZdlPvm>
  40bba9:	mov    0x68(%rsp),%r10
  40bbae:	mov    0x48(%rsp),%rcx
  40bbb3:	pcmpeqd %xmm0,%xmm0
  40bbb7:	mov    0x40(%rsp),%r9
  40bbbc:	mov    0x38(%rsp),%r8
  40bbc1:	mov    0x30(%rsp),%rax
  40bbc6:	mov    0x28(%rsp),%rdx
  40bbcb:	mov    %rcx,0x8250(%r14)
  40bbd2:	mov    %rcx,%r12
  40bbd5:	mov    0x8(%rax),%r13d
  40bbd9:	mov    (%rax),%rdi
  40bbdc:	mov    %r15,0x8258(%r14)
  40bbe3:	add    %rcx,%rdx
  40bbe6:	mov    (%r14),%r11
  40bbe9:	mov    %rdx,0x8260(%r14)
  40bbf0:	jmp    40b37c <_ZN4SideItE5drainERKS0_Rm+0x31c>
  40bbf5:	movabs $0x7ffffffffffffff,%rax
  40bbff:	mov    %r13,%r15
  40bc02:	sub    %rbp,%r15
  40bc05:	mov    %r15,%rsi
  40bc08:	sar    $0x4,%rsi
  40bc0c:	cmp    %rax,%rsi
  40bc0f:	je     401210 <_ZN4SideItE5drainERKS0_Rm.cold>
  40bc15:	test   %rsi,%rsi
  40bc18:	mov    $0x1,%eax
  40bc1d:	mov    %r10,0x48(%rsp)
  40bc22:	cmovne %rsi,%rax
  40bc26:	mov    %r8,0x40(%rsp)
  40bc2b:	mov    %rdx,0x38(%rsp)
  40bc30:	add    %rsi,%rax
  40bc33:	mov    %ecx,0x30(%rsp)
  40bc37:	movabs $0x7ffffffffffffff,%rsi
  40bc41:	cmp    %rsi,%rax
  40bc44:	cmova  %rsi,%rax
  40bc48:	shl    $0x4,%rax
  40bc4c:	mov    %rax,%rdi
  40bc4f:	mov    %rax,0x28(%rsp)
  40bc54:	call   40fc80 <_Znwm>
  40bc59:	mov    0x30(%rsp),%ecx
  40bc5d:	cmp    %rbp,%r13
  40bc60:	pcmpeqd %xmm0,%xmm0
  40bc64:	lea    (%rax,%r15,1),%rsi
  40bc68:	mov    0x38(%rsp),%rdx
  40bc6d:	mov    0x40(%rsp),%r8
  40bc72:	mov    %rax,%r9
  40bc75:	mov    %rbx,(%rsi)
  40bc78:	mov    0x48(%rsp),%r10
  40bc7d:	mov    %ecx,0x8(%rsi)
  40bc80:	je     40bcb5 <_ZN4SideItE5drainERKS0_Rm+0xc55>
  40bc82:	mov    %rbp,%rcx
  40bc85:	data16 cs nopw 0x0(%rax,%rax,1)
  40bc90:	data16 cs nopw 0x0(%rax,%rax,1)
  40bc9b:	nopl   0x0(%rax,%rax,1)
  40bca0:	movdqu (%rcx),%xmm1
  40bca4:	add    $0x10,%rax
  40bca8:	add    $0x10,%rcx
  40bcac:	movups %xmm1,-0x10(%rax)
  40bcb0:	cmp    %rsi,%rax
  40bcb3:	jne    40bca0 <_ZN4SideItE5drainERKS0_Rm+0xc40>
  40bcb5:	lea    0x10(%rax),%r15
  40bcb9:	test   %rbp,%rbp
  40bcbc:	je     40bd02 <_ZN4SideItE5drainERKS0_Rm+0xca2>
  40bcbe:	mov    %r13,%rsi
  40bcc1:	mov    %rbp,%rdi
  40bcc4:	mov    %r10,0x68(%rsp)
  40bcc9:	sub    %rbp,%rsi
  40bccc:	mov    %r9,0x48(%rsp)
  40bcd1:	mov    %r8,0x40(%rsp)
  40bcd6:	mov    %rdx,0x38(%rsp)
  40bcdb:	mov    %rax,0x30(%rsp)
  40bce0:	call   40fbb0 <_ZdlPvm>
  40bce5:	mov    0x68(%rsp),%r10
  40bcea:	mov    0x48(%rsp),%r9
  40bcef:	pcmpeqd %xmm0,%xmm0
  40bcf3:	mov    0x40(%rsp),%r8
  40bcf8:	mov    0x38(%rsp),%rdx
  40bcfd:	mov    0x30(%rsp),%rax
  40bd02:	mov    (%rax),%r13
  40bd05:	mov    (%r14),%r11
  40bd08:	mov    %r9,0x8250(%r14)
  40bd0f:	mov    %r9,%rbp
  40bd12:	mov    0x28(%rsp),%rcx
  40bd17:	mov    %r15,0x8258(%r14)
  40bd1e:	add    %r9,%rcx
  40bd21:	mov    %rcx,0x8260(%r14)
  40bd28:	mov    0x8(%rax),%ecx
  40bd2b:	jmp    40b8ac <_ZN4SideItE5drainERKS0_Rm+0x84c>
  40bd30:	xor    %eax,%eax
  40bd32:	xor    %edi,%edi
  40bd34:	jmp    40b551 <_ZN4SideItE5drainERKS0_Rm+0x4f1>

Disassembly of section .fini:

work/bin/fix_atomic_dbg:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

0000000000401210 <_ZN4SideItE5drainERKS0_Rm.cold>:
  401210:	mov    $0x4b8200,%edi
  401215:	call   401679 <_ZSt20__throw_length_errorPKc>

Disassembly of section .fini:
