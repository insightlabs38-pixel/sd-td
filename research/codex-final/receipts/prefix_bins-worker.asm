
work/bin/prefix_bins_dbg:     file format elf64-x86-64


Disassembly of section .init:

Disassembly of section .plt:

Disassembly of section .text:

000000000040abc0 <_ZZ4mainENKUljE_clEj>:
  40abc0:	push   %r15
  40abc2:	push   %r14
  40abc4:	push   %r13
  40abc6:	push   %r12
  40abc8:	push   %rbp
  40abc9:	push   %rbx
  40abca:	sub    $0x4418,%rsp
  40abd1:	mov    (%rdi),%rax
  40abd4:	mov    %rdi,0x70(%rsp)
  40abd9:	mov    (%rax),%rax
  40abdc:	mov    (%rax),%r12d
  40abdf:	mov    %rax,0xb0(%rsp)
  40abe7:	mov    %r12d,%r14d
  40abea:	shr    $0x7,%r14d
  40abee:	lea    0x1(%r14),%ebx
  40abf2:	lea    0x0(,%rbx,8),%rbp
  40abfa:	mov    %rbp,%rdi
  40abfd:	call   40e080 <_Znwm>
  40ac02:	add    %rax,%rbp
  40ac05:	mov    %rax,0xb8(%rsp)
  40ac0d:	mov    %rax,%rdx
  40ac10:	mov    %rbp,0xc8(%rsp)
  40ac18:	test   %r14d,%r14d
  40ac1b:	je     40d313 <_ZZ4mainENKUljE_clEj+0x2753>
  40ac21:	mov    %rbx,%rsi
  40ac24:	lea    0xf0(%rsp),%rax
  40ac2c:	mov    %rbx,%r13
  40ac2f:	shr    $1,%rsi
  40ac32:	movq   %rax,%xmm0
  40ac37:	mov    %rax,0x18(%rsp)
  40ac3c:	mov    %rdx,%rax
  40ac3f:	shl    $0x4,%rsi
  40ac43:	punpcklqdq %xmm0,%xmm0
  40ac47:	lea    (%rdx,%rsi,1),%rcx
  40ac4b:	and    $0x10,%esi
  40ac4e:	je     40ac5c <_ZZ4mainENKUljE_clEj+0x9c>
  40ac50:	lea    0x10(%rdx),%rax
  40ac54:	movups %xmm0,(%rdx)
  40ac57:	cmp    %rax,%rcx
  40ac5a:	je     40ac6c <_ZZ4mainENKUljE_clEj+0xac>
  40ac5c:	movups %xmm0,(%rax)
  40ac5f:	add    $0x20,%rax
  40ac63:	movups %xmm0,-0x10(%rax)
  40ac67:	cmp    %rax,%rcx
  40ac6a:	jne    40ac5c <_ZZ4mainENKUljE_clEj+0x9c>
  40ac6c:	and    $0x1,%r13d
  40ac70:	je     40ac82 <_ZZ4mainENKUljE_clEj+0xc2>
  40ac72:	and    $0xfffffffffffffffe,%rbx
  40ac76:	lea    (%rdx,%rbx,8),%rdx
  40ac7a:	mov    0x18(%rsp),%rax
  40ac7f:	mov    %rax,(%rdx)
  40ac82:	pxor   %xmm1,%xmm1
  40ac86:	mov    $0x4022,%ecx
  40ac8b:	xor    %r9d,%r9d
  40ac8e:	xor    %edi,%edi
  40ac90:	lea    0x80(%r12),%eax
  40ac98:	mov    $0xffffffff,%r8d
  40ac9e:	mov    %rbp,0xc0(%rsp)
  40aca6:	mov    $0x3,%edx
  40acab:	lea    0x40(%rax,%rax,1),%rbp
  40acb0:	movaps %xmm1,0xd0(%rsp)
  40acb8:	movq   $0x0,0xe0(%rsp)
  40acc4:	mov    %rbp,%rsi
  40acc7:	call   455dd0 <__mmap64>
  40accc:	mov    %rbp,%rsi
  40accf:	mov    $0xf,%edx
  40acd4:	mov    %rax,%rdi
  40acd7:	mov    %rax,%rbx
  40acda:	call   455da0 <__madvise>
  40acdf:	pcmpeqd %xmm0,%xmm0
  40ace3:	xor    %eax,%eax
  40ace5:	mov    $0x400,%ecx
  40acea:	lea    0x1f0(%rsp),%rdi
  40acf2:	movaps %xmm0,0x100(%rsp)
  40acfa:	pxor   %xmm1,%xmm1
  40acfe:	movaps %xmm0,0x110(%rsp)
  40ad06:	movaps %xmm0,0x120(%rsp)
  40ad0e:	movaps %xmm0,0x130(%rsp)
  40ad16:	movaps %xmm0,0x140(%rsp)
  40ad1e:	movaps %xmm0,0x150(%rsp)
  40ad26:	movaps %xmm0,0x160(%rsp)
  40ad2e:	movaps %xmm0,0x170(%rsp)
  40ad36:	movaps %xmm0,0x180(%rsp)
  40ad3e:	movaps %xmm0,0x190(%rsp)
  40ad46:	movaps %xmm0,0x1a0(%rsp)
  40ad4e:	movaps %xmm0,0x1b0(%rsp)
  40ad56:	movaps %xmm0,0x1c0(%rsp)
  40ad5e:	movaps %xmm0,0x1d0(%rsp)
  40ad66:	movaps %xmm0,0x1e0(%rsp)
  40ad6e:	rep stos %rax,%es:(%rdi)
  40ad71:	mov    0x70(%rsp),%rax
  40ad76:	movaps %xmm0,0xf0(%rsp)
  40ad7e:	pxor   %xmm0,%xmm0
  40ad82:	mov    %rbx,0xe8(%rsp)
  40ad8a:	mov    0x8(%rax),%rax
  40ad8e:	movaps %xmm0,0x21f0(%rsp)
  40ad96:	movq   $0x0,0x2250(%rsp)
  40ada2:	mov    (%rax),%rax
  40ada5:	movaps %xmm0,0x2200(%rsp)
  40adad:	movaps %xmm0,0x2210(%rsp)
  40adb5:	mov    (%rax),%r12d
  40adb8:	mov    %rax,0x2260(%rsp)
  40adc0:	movaps %xmm0,0x2220(%rsp)
  40adc8:	mov    %r12d,%r14d
  40adcb:	movaps %xmm1,0x2230(%rsp)
  40add3:	shr    $0x7,%r14d
  40add7:	movaps %xmm1,0x2240(%rsp)
  40addf:	lea    0x1(%r14),%ebx
  40ade3:	lea    0x0(,%rbx,8),%rbp
  40adeb:	mov    %rbx,%r13
  40adee:	mov    %rbp,%rdi
  40adf1:	call   40e080 <_Znwm>
  40adf6:	add    %rax,%rbp
  40adf9:	mov    %rax,0x2268(%rsp)
  40ae01:	mov    %rax,%rdx
  40ae04:	lea    0x22a0(%rsp),%rax
  40ae0c:	mov    %rbp,0x2278(%rsp)
  40ae14:	mov    %rax,0x20(%rsp)
  40ae19:	test   %r14d,%r14d
  40ae1c:	je     40ae67 <_ZZ4mainENKUljE_clEj+0x2a7>
  40ae1e:	mov    %rbx,%rsi
  40ae21:	movq   %rax,%xmm0
  40ae26:	mov    %rdx,%rax
  40ae29:	shr    $1,%rsi
  40ae2c:	punpcklqdq %xmm0,%xmm0
  40ae30:	shl    $0x4,%rsi
  40ae34:	lea    (%rdx,%rsi,1),%rcx
  40ae38:	and    $0x10,%esi
  40ae3b:	je     40ae49 <_ZZ4mainENKUljE_clEj+0x289>
  40ae3d:	lea    0x10(%rdx),%rax
  40ae41:	movups %xmm0,(%rdx)
  40ae44:	cmp    %rax,%rcx
  40ae47:	je     40ae59 <_ZZ4mainENKUljE_clEj+0x299>
  40ae49:	movups %xmm0,(%rax)
  40ae4c:	add    $0x20,%rax
  40ae50:	movups %xmm0,-0x10(%rax)
  40ae54:	cmp    %rax,%rcx
  40ae57:	jne    40ae49 <_ZZ4mainENKUljE_clEj+0x289>
  40ae59:	and    $0x1,%r13d
  40ae5d:	je     40ae6f <_ZZ4mainENKUljE_clEj+0x2af>
  40ae5f:	and    $0xfffffffffffffffe,%rbx
  40ae63:	lea    (%rdx,%rbx,8),%rdx
  40ae67:	mov    0x20(%rsp),%rax
  40ae6c:	mov    %rax,(%rdx)
  40ae6f:	lea    0x80(%r12),%eax
  40ae77:	xor    %r9d,%r9d
  40ae7a:	xor    %edi,%edi
  40ae7c:	xor    %r13d,%r13d
  40ae7f:	pxor   %xmm2,%xmm2
  40ae83:	mov    $0x4022,%ecx
  40ae88:	mov    $0x3,%edx
  40ae8d:	mov    %rbp,0x2270(%rsp)
  40ae95:	lea    0x40(%rax,%rax,1),%rbp
  40ae9a:	mov    $0xffffffff,%r8d
  40aea0:	movaps %xmm2,0x2280(%rsp)
  40aea8:	movq   $0x0,0x2290(%rsp)
  40aeb4:	mov    %rbp,%rsi
  40aeb7:	call   455dd0 <__mmap64>
  40aebc:	mov    $0xf,%edx
  40aec1:	mov    %rbp,%rsi
  40aec4:	mov    %rax,%rdi
  40aec7:	mov    %rax,%rbx
  40aeca:	call   455da0 <__madvise>
  40aecf:	pcmpeqd %xmm0,%xmm0
  40aed3:	mov    $0x400,%ecx
  40aed8:	xor    %eax,%eax
  40aeda:	movaps %xmm0,0x22b0(%rsp)
  40aee2:	pxor   %xmm1,%xmm1
  40aee6:	pxor   %xmm2,%xmm2
  40aeea:	lea    0x23a0(%rsp),%rdi
  40aef2:	movaps %xmm0,0x22c0(%rsp)
  40aefa:	movaps %xmm0,0x22d0(%rsp)
  40af02:	movaps %xmm0,0x22e0(%rsp)
  40af0a:	movaps %xmm0,0x22f0(%rsp)
  40af12:	movaps %xmm0,0x2300(%rsp)
  40af1a:	movaps %xmm0,0x2310(%rsp)
  40af22:	movaps %xmm0,0x2320(%rsp)
  40af2a:	movaps %xmm0,0x2330(%rsp)
  40af32:	movaps %xmm0,0x2340(%rsp)
  40af3a:	movaps %xmm0,0x2350(%rsp)
  40af42:	movaps %xmm0,0x2360(%rsp)
  40af4a:	movaps %xmm0,0x2370(%rsp)
  40af52:	movaps %xmm0,0x2380(%rsp)
  40af5a:	movaps %xmm0,0x2390(%rsp)
  40af62:	rep stos %rax,%es:(%rdi)
  40af65:	mov    %rbx,0x2298(%rsp)
  40af6d:	movq   $0x0,0x4400(%rsp)
  40af79:	movaps %xmm0,0x22a0(%rsp)
  40af81:	movaps %xmm1,0x43a0(%rsp)
  40af89:	movaps %xmm1,0x43b0(%rsp)
  40af91:	movaps %xmm1,0x43c0(%rsp)
  40af99:	movaps %xmm1,0x43d0(%rsp)
  40afa1:	movaps %xmm2,0x43e0(%rsp)
  40afa9:	movaps %xmm2,0x43f0(%rsp)
  40afb1:	mov    0x70(%rsp),%rsi
  40afb6:	mov    $0x1,%edx
  40afbb:	mov    0x10(%rsi),%rax
  40afbf:	lock xadd %rdx,(%rax)
  40afc4:	mov    0x18(%rsi),%rax
  40afc8:	cmp    (%rax),%rdx
  40afcb:	jae    40cee3 <_ZZ4mainENKUljE_clEj+0x2323>
  40afd1:	mov    0x70(%rsp),%rsi
  40afd6:	mov    0x20(%rsi),%rax
  40afda:	mov    (%rax),%rax
  40afdd:	mov    (%rax,%rdx,4),%eax
  40afe0:	lea    (%rax,%rax,1),%ecx
  40afe3:	mov    %eax,0x7c(%rsp)
  40afe7:	mov    0x28(%rsi),%rax
  40afeb:	mov    %rcx,%rdx
  40afee:	mov    (%rax),%rax
  40aff1:	add    $0x1,%edx
  40aff4:	mov    (%rax,%rcx,4),%esi
  40aff7:	mov    (%rax,%rdx,4),%ebx
  40affa:	mov    %esi,0x78(%rsp)
  40affe:	mov    %ebx,0x6c(%rsp)
  40b002:	cmp    %ebx,%esi
  40b004:	je     40ca2c <_ZZ4mainENKUljE_clEj+0x1e6c>
  40b00a:	mov    0xb0(%rsp),%rax
  40b012:	mov    %esi,%edi
  40b014:	add    $0x1,%esi
  40b017:	mov    %rsi,0x88(%rsp)
  40b01f:	mov    0x8(%rax),%rax
  40b023:	mov    %rdi,0x80(%rsp)
  40b02b:	mov    (%rax,%rsi,4),%esi
  40b02e:	cmp    %esi,(%rax,%rdi,4)
  40b031:	je     40becc <_ZZ4mainENKUljE_clEj+0x130c>
  40b037:	mov    0x2260(%rsp),%rax
  40b03f:	lea    0x1(%rbx),%ecx
  40b042:	mov    0x8(%rax),%rdx
  40b046:	mov    %ebx,%eax
  40b048:	mov    (%rdx,%rcx,4),%esi
  40b04b:	cmp    %esi,(%rdx,%rax,4)
  40b04e:	je     40becc <_ZZ4mainENKUljE_clEj+0x130c>
  40b054:	mov    0xd0(%rsp),%rdi
  40b05c:	mov    0xd8(%rsp),%rcx
  40b064:	cmp    %rcx,%rdi
  40b067:	je     40b097 <_ZZ4mainENKUljE_clEj+0x4d7>
  40b069:	mov    0xb8(%rsp),%rsi
  40b071:	mov    0x18(%rsp),%r8
  40b076:	mov    %rdi,%rax
  40b079:	nopl   0x0(%rax)
  40b080:	mov    (%rax),%edx
  40b082:	add    $0x4,%rax
  40b086:	mov    %r8,(%rsi,%rdx,8)
  40b08a:	cmp    %rax,%rcx
  40b08d:	jne    40b080 <_ZZ4mainENKUljE_clEj+0x4c0>
  40b08f:	mov    %rdi,0xd8(%rsp)
  40b097:	lea    0xb0(%rsp),%rax
  40b09f:	lea    0x21f0(%rsp),%rsi
  40b0a7:	xor    %ecx,%ecx
  40b0a9:	mov    %rax,0x60(%rsp)
  40b0ae:	lea    0x2230(%rsp),%rdi
  40b0b6:	cs nopw 0x0(%rax,%rax,1)
  40b0c0:	mov    (%rsi),%rax
  40b0c3:	test   %rax,%rax
  40b0c6:	je     40b123 <_ZZ4mainENKUljE_clEj+0x563>
  40b0c8:	data16 cs nopw 0x0(%rax,%rax,1)
  40b0d3:	data16 cs nopw 0x0(%rax,%rax,1)
  40b0de:	data16 cs nopw 0x0(%rax,%rax,1)
  40b0e9:	data16 cs nopw 0x0(%rax,%rax,1)
  40b0f4:	data16 cs nopw 0x0(%rax,%rax,1)
  40b0ff:	nop
  40b100:	xor    %edx,%edx
  40b102:	tzcnt  %rax,%rdx
  40b107:	add    %ecx,%edx
  40b109:	mov    %edx,%edx
  40b10b:	shl    $0x4,%rdx
  40b10f:	movl   $0x0,0x1f8(%rsp,%rdx,1)
  40b11a:	lea    -0x1(%rax),%rdx
  40b11e:	and    %rdx,%rax
  40b121:	jne    40b100 <_ZZ4mainENKUljE_clEj+0x540>
  40b123:	movq   $0x0,(%rsi)
  40b12a:	add    $0x8,%rsi
  40b12e:	add    $0x40,%ecx
  40b131:	cmp    %rdi,%rsi
  40b134:	jne    40b0c0 <_ZZ4mainENKUljE_clEj+0x500>
  40b136:	mov    0x2240(%rsp),%rdi
  40b13e:	pxor   %xmm1,%xmm1
  40b142:	mov    0x2250(%rsp),%rsi
  40b14a:	movq   $0x0,0x2250(%rsp)
  40b156:	movaps %xmm1,0x2240(%rsp)
  40b15e:	test   %rdi,%rdi
  40b161:	je     40b16f <_ZZ4mainENKUljE_clEj+0x5af>
  40b163:	sub    %rdi,%rsi
  40b166:	call   40dfb0 <_ZdlPvm>
  40b16b:	pcmpeqd %xmm0,%xmm0
  40b16f:	mov    0x78(%rsp),%edx
  40b173:	mov    0xb8(%rsp),%rax
  40b17b:	pxor   %xmm1,%xmm1
  40b17f:	movaps %xmm1,0x2230(%rsp)
  40b187:	shr    $0x7,%edx
  40b18a:	mov    %edx,%ebx
  40b18c:	lea    (%rax,%rbx,8),%rcx
  40b190:	mov    (%rcx),%rax
  40b193:	cmp    0x18(%rsp),%rax
  40b198:	je     40ca33 <_ZZ4mainENKUljE_clEj+0x1e73>
  40b19e:	mov    0x78(%rsp),%edx
  40b1a2:	xor    %esi,%esi
  40b1a4:	mov    0x1f0(%rsp),%rdi
  40b1ac:	and    $0x7f,%edx
  40b1af:	mov    %si,(%rax,%rdx,2)
  40b1b3:	mov    0x1f8(%rsp),%eax
  40b1ba:	cmp    0x1fc(%rsp),%eax
  40b1c1:	je     40cfa3 <_ZZ4mainENKUljE_clEj+0x23e3>
  40b1c7:	mov    0x78(%rsp),%esi
  40b1cb:	mov    0x2288(%rsp),%rcx
  40b1d3:	mov    %esi,(%rdi,%rax,4)
  40b1d6:	mov    0x2280(%rsp),%rdi
  40b1de:	addl   $0x1,0x1f8(%rsp)
  40b1e6:	addq   $0x1,0x2238(%rsp)
  40b1ef:	orq    $0x1,0x21f0(%rsp)
  40b1f8:	cmp    %rcx,%rdi
  40b1fb:	je     40b227 <_ZZ4mainENKUljE_clEj+0x667>
  40b1fd:	mov    0x2268(%rsp),%rsi
  40b205:	mov    0x20(%rsp),%r8
  40b20a:	mov    %rdi,%rax
  40b20d:	nopl   (%rax)
  40b210:	mov    (%rax),%edx
  40b212:	add    $0x4,%rax
  40b216:	mov    %r8,(%rsi,%rdx,8)
  40b21a:	cmp    %rax,%rcx
  40b21d:	jne    40b210 <_ZZ4mainENKUljE_clEj+0x650>
  40b21f:	mov    %rdi,0x2288(%rsp)
  40b227:	mov    0x60(%rsp),%rax
  40b22c:	xor    %ecx,%ecx
  40b22e:	lea    0x42f0(%rax),%rsi
  40b235:	lea    0x4330(%rax),%rdi
  40b23c:	nopl   0x0(%rax)
  40b240:	mov    (%rsi),%rax
  40b243:	test   %rax,%rax
  40b246:	je     40b2a3 <_ZZ4mainENKUljE_clEj+0x6e3>
  40b248:	data16 cs nopw 0x0(%rax,%rax,1)
  40b253:	data16 cs nopw 0x0(%rax,%rax,1)
  40b25e:	data16 cs nopw 0x0(%rax,%rax,1)
  40b269:	data16 cs nopw 0x0(%rax,%rax,1)
  40b274:	data16 cs nopw 0x0(%rax,%rax,1)
  40b27f:	nop
  40b280:	xor    %edx,%edx
  40b282:	tzcnt  %rax,%rdx
  40b287:	add    %ecx,%edx
  40b289:	mov    %edx,%edx
  40b28b:	shl    $0x4,%rdx
  40b28f:	movl   $0x0,0x23a8(%rsp,%rdx,1)
  40b29a:	lea    -0x1(%rax),%rdx
  40b29e:	and    %rdx,%rax
  40b2a1:	jne    40b280 <_ZZ4mainENKUljE_clEj+0x6c0>
  40b2a3:	movq   $0x0,(%rsi)
  40b2aa:	add    $0x8,%rsi
  40b2ae:	add    $0x40,%ecx
  40b2b1:	cmp    %rdi,%rsi
  40b2b4:	jne    40b240 <_ZZ4mainENKUljE_clEj+0x680>
  40b2b6:	mov    0x43f0(%rsp),%rdi
  40b2be:	pxor   %xmm1,%xmm1
  40b2c2:	mov    0x4400(%rsp),%rsi
  40b2ca:	movq   $0x0,0x4400(%rsp)
  40b2d6:	movaps %xmm1,0x43f0(%rsp)
  40b2de:	test   %rdi,%rdi
  40b2e1:	je     40b2ef <_ZZ4mainENKUljE_clEj+0x72f>
  40b2e3:	sub    %rdi,%rsi
  40b2e6:	call   40dfb0 <_ZdlPvm>
  40b2eb:	pcmpeqd %xmm0,%xmm0
  40b2ef:	mov    0x6c(%rsp),%edx
  40b2f3:	mov    0x2268(%rsp),%rax
  40b2fb:	pxor   %xmm1,%xmm1
  40b2ff:	movaps %xmm1,0x43e0(%rsp)
  40b307:	shr    $0x7,%edx
  40b30a:	mov    %edx,%ebx
  40b30c:	lea    (%rax,%rbx,8),%rcx
  40b310:	mov    (%rcx),%rax
  40b313:	cmp    0x20(%rsp),%rax
  40b318:	je     40cada <_ZZ4mainENKUljE_clEj+0x1f1a>
  40b31e:	mov    0x6c(%rsp),%edx
  40b322:	xor    %ecx,%ecx
  40b324:	mov    0x23a0(%rsp),%rdi
  40b32c:	and    $0x7f,%edx
  40b32f:	mov    %cx,(%rax,%rdx,2)
  40b333:	mov    0x23a8(%rsp),%eax
  40b33a:	cmp    0x23ac(%rsp),%eax
  40b341:	je     40cfdd <_ZZ4mainENKUljE_clEj+0x241d>
  40b347:	mov    0x6c(%rsp),%esi
  40b34b:	mov    0x2238(%rsp),%rdx
  40b353:	movabs $0x4000000000000000,%r10
  40b35d:	mov    %esi,(%rdi,%rax,4)
  40b360:	mov    0x43e8(%rsp),%rax
  40b368:	addl   $0x1,0x23a8(%rsp)
  40b370:	orq    $0x1,0x43a0(%rsp)
  40b379:	add    $0x1,%rax
  40b37d:	mov    %rax,0x43e8(%rsp)
  40b385:	data16 cs nopw 0x0(%rax,%rax,1)
  40b390:	movabs $0x4000000000000000,%rdi
  40b39a:	test   %rdx,%rdx
  40b39d:	je     40b485 <_ZZ4mainENKUljE_clEj+0x8c5>
  40b3a3:	mov    0x2230(%rsp),%rcx
  40b3ab:	mov    $0xffffffffffffffff,%rsi
  40b3b2:	mov    %ecx,%r8d
  40b3b5:	shl    %cl,%rsi
  40b3b8:	shr    $0x6,%r8d
  40b3bc:	mov    %rsi,%rcx
  40b3bf:	mov    %r8d,%edi
  40b3c2:	and    $0x7,%r8d
  40b3c6:	and    $0x7,%edi
  40b3c9:	and    0x21f0(%rsp,%r8,8),%rcx
  40b3d1:	jne    40bec5 <_ZZ4mainENKUljE_clEj+0x1305>
  40b3d7:	lea    0x1(%rdi),%ecx
  40b3da:	mov    %rcx,%rsi
  40b3dd:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b3e5:	test   %rcx,%rcx
  40b3e8:	jne    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40b3ee:	lea    0x2(%rdi),%ecx
  40b3f1:	mov    %rcx,%rsi
  40b3f4:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b3fc:	test   %rcx,%rcx
  40b3ff:	jne    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40b401:	lea    0x3(%rdi),%ecx
  40b404:	mov    %rcx,%rsi
  40b407:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b40f:	test   %rcx,%rcx
  40b412:	jne    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40b414:	lea    0x4(%rdi),%ecx
  40b417:	mov    %rcx,%rsi
  40b41a:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b422:	test   %rcx,%rcx
  40b425:	jne    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40b427:	lea    0x5(%rdi),%ecx
  40b42a:	mov    %rcx,%rsi
  40b42d:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b435:	test   %rcx,%rcx
  40b438:	jne    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40b43a:	lea    0x6(%rdi),%ecx
  40b43d:	mov    %rcx,%rsi
  40b440:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b448:	test   %rcx,%rcx
  40b44b:	jne    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40b44d:	lea    0x7(%rdi),%ecx
  40b450:	mov    %rcx,%rsi
  40b453:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b45b:	test   %rcx,%rcx
  40b45e:	jne    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40b460:	lea    0x8(%rdi),%ecx
  40b463:	mov    %rcx,%rsi
  40b466:	mov    0x21f0(%rsp,%rcx,8),%rcx
  40b46e:	tzcnt  %rcx,%rcx
  40b473:	shl    $0x6,%esi
  40b476:	lea    (%rsi,%rcx,1),%edi
  40b479:	mov    %rdi,0x2230(%rsp)
  40b481:	shl    $0x7,%rdi
  40b485:	test   %rax,%rax
  40b488:	je     40be98 <_ZZ4mainENKUljE_clEj+0x12d8>
  40b48e:	mov    0x43e0(%rsp),%rcx
  40b496:	mov    $0xffffffffffffffff,%rsi
  40b49d:	mov    %ecx,%r9d
  40b4a0:	shl    %cl,%rsi
  40b4a3:	shr    $0x6,%r9d
  40b4a7:	mov    %rsi,%rcx
  40b4aa:	mov    %r9d,%r8d
  40b4ad:	and    $0x7,%r9d
  40b4b1:	and    $0x7,%r8d
  40b4b5:	and    0x43a0(%rsp,%r9,8),%rcx
  40b4bd:	jne    40bebd <_ZZ4mainENKUljE_clEj+0x12fd>
  40b4c3:	lea    0x1(%r8),%ecx
  40b4c7:	mov    %rcx,%rsi
  40b4ca:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b4d2:	test   %rcx,%rcx
  40b4d5:	jne    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40b4db:	lea    0x2(%r8),%ecx
  40b4df:	mov    %rcx,%rsi
  40b4e2:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b4ea:	test   %rcx,%rcx
  40b4ed:	jne    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40b4ef:	lea    0x3(%r8),%ecx
  40b4f3:	mov    %rcx,%rsi
  40b4f6:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b4fe:	test   %rcx,%rcx
  40b501:	jne    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40b503:	lea    0x4(%r8),%ecx
  40b507:	mov    %rcx,%rsi
  40b50a:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b512:	test   %rcx,%rcx
  40b515:	jne    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40b517:	lea    0x5(%r8),%ecx
  40b51b:	mov    %rcx,%rsi
  40b51e:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b526:	test   %rcx,%rcx
  40b529:	jne    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40b52b:	lea    0x6(%r8),%ecx
  40b52f:	mov    %rcx,%rsi
  40b532:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b53a:	test   %rcx,%rcx
  40b53d:	jne    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40b53f:	lea    0x7(%r8),%ecx
  40b543:	mov    %rcx,%rsi
  40b546:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b54e:	test   %rcx,%rcx
  40b551:	jne    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40b553:	lea    0x8(%r8),%ecx
  40b557:	mov    %rcx,%rsi
  40b55a:	mov    0x43a0(%rsp,%rcx,8),%rcx
  40b562:	tzcnt  %rcx,%rcx
  40b567:	shl    $0x6,%esi
  40b56a:	lea    (%rcx,%rsi,1),%r8d
  40b56e:	movabs $0x4000000000000000,%rsi
  40b578:	mov    %r8,0x43e0(%rsp)
  40b580:	mov    %r8,%rcx
  40b583:	cmp    %rsi,%rdi
  40b586:	je     40be98 <_ZZ4mainENKUljE_clEj+0x12d8>
  40b58c:	mov    %r8,%rsi
  40b58f:	shl    $0x7,%rsi
  40b593:	add    %rdi,%rsi
  40b596:	cmp    %r10,%rsi
  40b599:	jae    40be98 <_ZZ4mainENKUljE_clEj+0x12d8>
  40b59f:	cmp    %rdx,%rax
  40b5a2:	jb     40ba28 <_ZZ4mainENKUljE_clEj+0xe68>
  40b5a8:	mov    0x2230(%rsp),%rcx
  40b5b0:	mov    %rcx,%rsi
  40b5b3:	and    $0x1ff,%esi
  40b5b9:	add    $0x14,%rsi
  40b5bd:	mov    %rsi,0x58(%rsp)
  40b5c2:	shl    $0x4,%rsi
  40b5c6:	mov    0xb8(%rsp,%rsi,1),%r9d
  40b5ce:	lea    0x4410(%rsp,%rsi,1),%rbx
  40b5d6:	mov    %rbx,0x28(%rsp)
  40b5db:	test   %r9d,%r9d
  40b5de:	je     40b9e6 <_ZZ4mainENKUljE_clEj+0xe26>
  40b5e4:	mov    0xb0(%rsp),%rsi
  40b5ec:	movq   $0x0,(%rsp)
  40b5f4:	mov    0x8(%rsi),%rdx
  40b5f8:	jmp    40b60f <_ZZ4mainENKUljE_clEj+0xa4f>
  40b5fa:	nopw   0x0(%rax,%rax,1)
  40b600:	addq   $0x1,(%rsp)
  40b605:	cmp    %r9d,(%rsp)
  40b609:	jae    40b9d3 <_ZZ4mainENKUljE_clEj+0xe13>
  40b60f:	mov    (%rsp),%r15
  40b613:	mov    0x28(%rsp),%rax
  40b618:	lea    -0x1(%r9),%r11d
  40b61c:	mov    %rcx,%rbp
  40b61f:	mov    -0x4360(%rax),%rbx
  40b626:	lea    0x8(%r15),%eax
  40b62a:	cmp    %r11d,%eax
  40b62d:	cmova  %r11d,%eax
  40b631:	mov    (%rbx,%rax,4),%eax
  40b634:	mov    %eax,%edi
  40b636:	mov    %rax,%r8
  40b639:	and    $0x7f,%eax
  40b63c:	and    $0x1ffffff,%edi
  40b642:	shl    $0x27,%r8
  40b646:	prefetcht0 (%rdx,%rdi,4)
  40b64a:	mov    0xb8(%rsp),%rdi
  40b652:	shr    $0x2e,%r8
  40b656:	mov    (%rdi,%r8,8),%r8
  40b65a:	prefetcht0 (%r8,%rax,2)
  40b65f:	lea    0x4(%r15),%r8d
  40b663:	mov    0x10(%rsi),%rax
  40b667:	cmp    %r11d,%r8d
  40b66a:	cmova  %r11d,%r8d
  40b66e:	shl    $0x7,%rbp
  40b672:	mov    (%rbx,%r8,4),%r8d
  40b676:	and    $0x1ffffff,%r8d
  40b67d:	mov    (%rdx,%r8,4),%r8d
  40b681:	prefetcht0 (%rax,%r8,4)
  40b686:	mov    (%rbx,%r15,4),%r8d
  40b68a:	mov    %rbp,%r15
  40b68d:	mov    %r8d,%r11d
  40b690:	mov    %r8d,%ebx
  40b693:	and    $0x7f,%r8d
  40b697:	shr    $0x19,%ebx
  40b69a:	and    $0x1ffffff,%r11d
  40b6a1:	or     %rbx,%r15
  40b6a4:	mov    %r11d,%ebx
  40b6a7:	shr    $0x7,%ebx
  40b6aa:	mov    %r15,0x8(%rsp)
  40b6af:	mov    (%rdi,%rbx,8),%rbx
  40b6b3:	movzwl (%rbx,%r8,2),%r8d
  40b6b8:	cmp    %r8,%r15
  40b6bb:	jne    40b600 <_ZZ4mainENKUljE_clEj+0xa40>
  40b6c1:	mov    %r11d,%r8d
  40b6c4:	mov    (%rdx,%r8,4),%ebp
  40b6c8:	lea    0x1(%r11),%r8d
  40b6cc:	lea    0x0(,%r8,4),%rbx
  40b6d4:	mov    %rbx,0x10(%rsp)
  40b6d9:	cmp    (%rdx,%r8,4),%ebp
  40b6dd:	jb     40b7c4 <_ZZ4mainENKUljE_clEj+0xc04>
  40b6e3:	jmp    40b600 <_ZZ4mainENKUljE_clEj+0xa40>
  40b6e8:	nopl   0x0(%rax,%rax,1)
  40b6f0:	movzwl (%r11),%eax
  40b6f4:	add    0x8(%rsp),%rbx
  40b6f9:	mov    %rbx,%r14
  40b6fc:	cmp    %rax,%rbx
  40b6ff:	mov    %rax,%rcx
  40b702:	cmovbe %rbx,%rcx
  40b706:	setb   %r12b
  40b70a:	shr    $0x7,%r14
  40b70e:	mov    %r14,%r15
  40b711:	and    $0x1ff,%r15d
  40b718:	mov    %cx,(%r11)
  40b71c:	mov    %r14d,%ecx
  40b71f:	mov    %r15,%r11
  40b722:	and    $0x1ff,%ecx
  40b728:	shl    $0x4,%r11
  40b72c:	mov    0x1f8(%rsp,%r11,1),%eax
  40b734:	mov    0x1f0(%rsp,%r11,1),%rdi
  40b73c:	cmp    0x1fc(%rsp,%r11,1),%eax
  40b744:	je     40b930 <_ZZ4mainENKUljE_clEj+0xd70>
  40b74a:	mov    %ebx,%r11d
  40b74d:	shl    $0x4,%r15
  40b751:	shl    $0x19,%r11d
  40b755:	or     %edx,%r11d
  40b758:	mov    0x8(%rsi),%rdx
  40b75c:	mov    %r11d,(%rdi,%rax,4)
  40b760:	movzbl %r12b,%eax
  40b764:	movzbl %r12b,%r12d
  40b768:	add    %eax,0x1f8(%rsp,%r15,1)
  40b770:	mov    %ecx,%eax
  40b772:	mov    %r14d,%ecx
  40b775:	shr    $0x6,%eax
  40b778:	add    %r12,0x2238(%rsp)
  40b780:	shl    %cl,%r12
  40b783:	or     %r12,0x21f0(%rsp,%rax,8)
  40b78b:	mov    0x2268(%rsp),%rax
  40b793:	mov    (%rax,%r8,8),%rax
  40b797:	movzwl (%rax,%r9,2),%eax
  40b79c:	add    %rbx,%rax
  40b79f:	cmp    %rax,%r10
  40b7a2:	cmova  %rax,%r10
  40b7a6:	mov    0x10(%rsp),%rax
  40b7ab:	add    $0x1,%rbp
  40b7af:	cmp    (%rdx,%rax,1),%ebp
  40b7b2:	jae    40b9b0 <_ZZ4mainENKUljE_clEj+0xdf0>
  40b7b8:	mov    0x10(%rsi),%rax
  40b7bc:	mov    0xb8(%rsp),%rdi
  40b7c4:	mov    (%rax,%rbp,4),%r12d
  40b7c8:	lea    0x0(,%rbp,4),%rbx
  40b7d0:	mov    %r12d,%edx
  40b7d3:	shr    $0x12,%edx
  40b7d6:	mov    %edx,%r8d
  40b7d9:	mov    (%rdi,%r8,8),%rcx
  40b7dd:	cmp    0x18(%rsp),%rcx
  40b7e2:	je     40b860 <_ZZ4mainENKUljE_clEj+0xca0>
  40b7e4:	mov    %r12d,%edx
  40b7e7:	mov    (%rax,%rbx,1),%ebx
  40b7ea:	shr    $0xb,%edx
  40b7ed:	mov    %edx,%r9d
  40b7f0:	and    $0x7ff,%ebx
  40b7f6:	and    $0x7f,%r9d
  40b7fa:	lea    (%rcx,%r9,2),%r11
  40b7fe:	cmp    $0x7ff,%ebx
  40b804:	jne    40b6f0 <_ZZ4mainENKUljE_clEj+0xb30>
  40b80a:	mov    0x18(%rsi),%rbx
  40b80e:	mov    0x20(%rsi),%rax
  40b812:	sub    %rbx,%rax
  40b815:	sar    $0x4,%rax
  40b819:	nopl   0x0(%rax)
  40b820:	test   %rax,%rax
  40b823:	jle    40b84a <_ZZ4mainENKUljE_clEj+0xc8a>
  40b825:	mov    %rax,%rdi
  40b828:	sar    $1,%rdi
  40b82b:	mov    %rdi,%rcx
  40b82e:	shl    $0x4,%rcx
  40b832:	add    %rbx,%rcx
  40b835:	cmp    %rbp,(%rcx)
  40b838:	jae    40b858 <_ZZ4mainENKUljE_clEj+0xc98>
  40b83a:	sub    %rdi,%rax
  40b83d:	lea    0x10(%rcx),%rbx
  40b841:	sub    $0x1,%rax
  40b845:	test   %rax,%rax
  40b848:	jg     40b825 <_ZZ4mainENKUljE_clEj+0xc65>
  40b84a:	mov    0x8(%rbx),%rbx
  40b84e:	jmp    40b6f0 <_ZZ4mainENKUljE_clEj+0xb30>
  40b853:	nopl   0x0(%rax,%rax,1)
  40b858:	mov    %rdi,%rax
  40b85b:	jmp    40b820 <_ZZ4mainENKUljE_clEj+0xc60>
  40b85d:	nopl   (%rax)
  40b860:	mov    0xd8(%rsp),%rax
  40b868:	sub    0xd0(%rsp),%rax
  40b870:	mov    %r8,0x38(%rsp)
  40b875:	lea    0x9c(%rsp),%rsi
  40b87d:	shl    $0x6,%rax
  40b881:	add    0xe8(%rsp),%rax
  40b889:	mov    %r10,0x30(%rsp)
  40b88e:	movups %xmm0,(%rax)
  40b891:	movups %xmm0,0x10(%rax)
  40b895:	movups %xmm0,0x20(%rax)
  40b899:	movups %xmm0,0x30(%rax)
  40b89d:	movups %xmm0,0x40(%rax)
  40b8a1:	movups %xmm0,0x50(%rax)
  40b8a5:	movups %xmm0,0x60(%rax)
  40b8a9:	movups %xmm0,0x70(%rax)
  40b8ad:	movups %xmm0,0x80(%rax)
  40b8b4:	movups %xmm0,0x90(%rax)
  40b8bb:	movups %xmm0,0xa0(%rax)
  40b8c2:	movups %xmm0,0xb0(%rax)
  40b8c9:	movups %xmm0,0xc0(%rax)
  40b8d0:	movups %xmm0,0xd0(%rax)
  40b8d7:	movups %xmm0,0xe0(%rax)
  40b8de:	movups %xmm0,0xf0(%rax)
  40b8e5:	mov    %rax,(%rdi,%r8,8)
  40b8e9:	lea    0xd0(%rsp),%rdi
  40b8f1:	mov    %edx,0x9c(%rsp)
  40b8f8:	call   4080f0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40b8fd:	mov    0x38(%rsp),%r8
  40b902:	mov    0x30(%rsp),%r10
  40b907:	pcmpeqd %xmm0,%xmm0
  40b90b:	mov    0xb0(%rsp),%rsi
  40b913:	mov    0xb8(%rsp),%rdx
  40b91b:	mov    0x10(%rsi),%rax
  40b91f:	mov    (%rdx,%r8,8),%rcx
  40b923:	jmp    40b7e4 <_ZZ4mainENKUljE_clEj+0xc24>
  40b928:	nopl   0x0(%rax,%rax,1)
  40b930:	mov    $0x10,%esi
  40b935:	add    %eax,%eax
  40b937:	mov    %r9,0x50(%rsp)
  40b93c:	cmp    %esi,%eax
  40b93e:	mov    %r8,0x48(%rsp)
  40b943:	cmovb  %esi,%eax
  40b946:	mov    %r10,0x40(%rsp)
  40b94b:	mov    %ecx,0x68(%rsp)
  40b94f:	lea    0x0(,%rax,4),%esi
  40b956:	mov    %edx,0x38(%rsp)
  40b95a:	mov    %eax,0x1fc(%rsp,%r11,1)
  40b962:	mov    %r11,0x30(%rsp)
  40b967:	call   442b00 <__libc_realloc>
  40b96c:	mov    0x30(%rsp),%r11
  40b971:	mov    0x50(%rsp),%r9
  40b976:	pcmpeqd %xmm0,%xmm0
  40b97a:	mov    %rax,%rdi
  40b97d:	mov    0x48(%rsp),%r8
  40b982:	mov    0x40(%rsp),%r10
  40b987:	mov    0x68(%rsp),%ecx
  40b98b:	mov    0x38(%rsp),%edx
  40b98f:	mov    %rax,0x1f0(%rsp,%r11,1)
  40b997:	mov    0xb0(%rsp),%rsi
  40b99f:	mov    0x1f8(%rsp,%r11,1),%eax
  40b9a7:	jmp    40b74a <_ZZ4mainENKUljE_clEj+0xb8a>
  40b9ac:	nopl   0x0(%rax)
  40b9b0:	mov    0x28(%rsp),%rax
  40b9b5:	addq   $0x1,(%rsp)
  40b9ba:	mov    0x2230(%rsp),%rcx
  40b9c2:	mov    -0x4358(%rax),%r9d
  40b9c9:	cmp    %r9d,(%rsp)
  40b9cd:	jb     40b60f <_ZZ4mainENKUljE_clEj+0xa4f>
  40b9d3:	mov    0x2238(%rsp),%rdx
  40b9db:	mov    0x43e8(%rsp),%rax
  40b9e3:	sub    %r9,%rdx
  40b9e6:	mov    0x58(%rsp),%rsi
  40b9eb:	mov    $0xfffffffffffffffe,%rdi
  40b9f2:	mov    %rdx,0x2238(%rsp)
  40b9fa:	rol    %cl,%rdi
  40b9fd:	shl    $0x4,%rsi
  40ba01:	movl   $0x0,0xb8(%rsp,%rsi,1)
  40ba0c:	mov    %rcx,%rsi
  40ba0f:	shr    $0x6,%rsi
  40ba13:	and    $0x7,%esi
  40ba16:	and    %rdi,0x21f0(%rsp,%rsi,8)
  40ba1e:	jmp    40b390 <_ZZ4mainENKUljE_clEj+0x7d0>
  40ba23:	nopl   0x0(%rax,%rax,1)
  40ba28:	mov    %r8d,%esi
  40ba2b:	and    $0x1ff,%esi
  40ba31:	add    $0x14,%rsi
  40ba35:	mov    %rsi,0x58(%rsp)
  40ba3a:	shl    $0x4,%rsi
  40ba3e:	mov    0x2268(%rsp,%rsi,1),%r9d
  40ba46:	lea    0x4410(%rsp,%rsi,1),%rbx
  40ba4e:	mov    %rbx,0x28(%rsp)
  40ba53:	test   %r9d,%r9d
  40ba56:	je     40be59 <_ZZ4mainENKUljE_clEj+0x1299>
  40ba5c:	mov    0x2260(%rsp),%rsi
  40ba64:	movq   $0x0,(%rsp)
  40ba6c:	mov    0x8(%rsi),%rdx
  40ba70:	jmp    40ba87 <_ZZ4mainENKUljE_clEj+0xec7>
  40ba72:	nopw   0x0(%rax,%rax,1)
  40ba78:	addq   $0x1,(%rsp)
  40ba7d:	cmp    %r9d,(%rsp)
  40ba81:	jae    40be43 <_ZZ4mainENKUljE_clEj+0x1283>
  40ba87:	mov    (%rsp),%r14
  40ba8b:	mov    0x28(%rsp),%rax
  40ba90:	lea    -0x1(%r9),%r11d
  40ba94:	mov    %r8,%rbp
  40ba97:	mov    -0x21b0(%rax),%rbx
  40ba9e:	lea    0x8(%r14),%eax
  40baa2:	cmp    %r11d,%eax
  40baa5:	cmova  %r11d,%eax
  40baa9:	mov    (%rbx,%rax,4),%eax
  40baac:	mov    %eax,%ecx
  40baae:	mov    %rax,%rdi
  40bab1:	and    $0x7f,%eax
  40bab4:	and    $0x1ffffff,%ecx
  40baba:	shl    $0x27,%rdi
  40babe:	prefetcht0 (%rdx,%rcx,4)
  40bac2:	mov    0x2268(%rsp),%rcx
  40baca:	shr    $0x2e,%rdi
  40bace:	mov    (%rcx,%rdi,8),%rdi
  40bad2:	prefetcht0 (%rdi,%rax,2)
  40bad6:	lea    0x4(%r14),%edi
  40bada:	mov    0x10(%rsi),%rax
  40bade:	cmp    %r11d,%edi
  40bae1:	cmova  %r11d,%edi
  40bae5:	shl    $0x7,%rbp
  40bae9:	mov    %rbp,%r15
  40baec:	mov    (%rbx,%rdi,4),%edi
  40baef:	and    $0x1ffffff,%edi
  40baf5:	mov    (%rdx,%rdi,4),%edi
  40baf8:	prefetcht0 (%rax,%rdi,4)
  40bafc:	mov    (%rbx,%r14,4),%edi
  40bb00:	mov    %edi,%r11d
  40bb03:	mov    %edi,%ebx
  40bb05:	and    $0x7f,%edi
  40bb08:	shr    $0x19,%ebx
  40bb0b:	and    $0x1ffffff,%r11d
  40bb12:	or     %rbx,%r15
  40bb15:	mov    %r11d,%ebx
  40bb18:	shr    $0x7,%ebx
  40bb1b:	mov    %r15,0x8(%rsp)
  40bb20:	mov    (%rcx,%rbx,8),%rbx
  40bb24:	movzwl (%rbx,%rdi,2),%edi
  40bb28:	cmp    %rdi,%r15
  40bb2b:	jne    40ba78 <_ZZ4mainENKUljE_clEj+0xeb8>
  40bb31:	mov    %r11d,%edi
  40bb34:	mov    (%rdx,%rdi,4),%ebp
  40bb37:	lea    0x1(%r11),%edi
  40bb3b:	lea    0x0(,%rdi,4),%rbx
  40bb43:	mov    %rbx,0x10(%rsp)
  40bb48:	cmp    (%rdx,%rdi,4),%ebp
  40bb4b:	jb     40bc34 <_ZZ4mainENKUljE_clEj+0x1074>
  40bb51:	jmp    40ba78 <_ZZ4mainENKUljE_clEj+0xeb8>
  40bb56:	cs nopw 0x0(%rax,%rax,1)
  40bb60:	movzwl (%r11),%eax
  40bb64:	add    0x8(%rsp),%rbx
  40bb69:	mov    %rbx,%r14
  40bb6c:	cmp    %rax,%rbx
  40bb6f:	mov    %rax,%rcx
  40bb72:	cmovbe %rbx,%rcx
  40bb76:	setb   %r12b
  40bb7a:	shr    $0x7,%r14
  40bb7e:	mov    %r14,%r15
  40bb81:	and    $0x1ff,%r15d
  40bb88:	mov    %cx,(%r11)
  40bb8c:	mov    %r14d,%ecx
  40bb8f:	mov    %r15,%r11
  40bb92:	and    $0x1ff,%ecx
  40bb98:	shl    $0x4,%r11
  40bb9c:	mov    0x23a8(%rsp,%r11,1),%eax
  40bba4:	mov    0x23a0(%rsp,%r11,1),%rdi
  40bbac:	cmp    0x23ac(%rsp,%r11,1),%eax
  40bbb4:	je     40bda0 <_ZZ4mainENKUljE_clEj+0x11e0>
  40bbba:	mov    %ebx,%r11d
  40bbbd:	shl    $0x4,%r15
  40bbc1:	shl    $0x19,%r11d
  40bbc5:	or     %edx,%r11d
  40bbc8:	mov    0x8(%rsi),%rdx
  40bbcc:	mov    %r11d,(%rdi,%rax,4)
  40bbd0:	movzbl %r12b,%eax
  40bbd4:	movzbl %r12b,%r12d
  40bbd8:	add    %eax,0x23a8(%rsp,%r15,1)
  40bbe0:	mov    %ecx,%eax
  40bbe2:	mov    %r14d,%ecx
  40bbe5:	shr    $0x6,%eax
  40bbe8:	add    %r12,0x43e8(%rsp)
  40bbf0:	shl    %cl,%r12
  40bbf3:	or     %r12,0x43a0(%rsp,%rax,8)
  40bbfb:	mov    0xb8(%rsp),%rax
  40bc03:	mov    (%rax,%r8,8),%rax
  40bc07:	movzwl (%rax,%r9,2),%eax
  40bc0c:	add    %rbx,%rax
  40bc0f:	cmp    %rax,%r10
  40bc12:	cmova  %rax,%r10
  40bc16:	mov    0x10(%rsp),%rax
  40bc1b:	add    $0x1,%rbp
  40bc1f:	cmp    (%rdx,%rax,1),%ebp
  40bc22:	jae    40be20 <_ZZ4mainENKUljE_clEj+0x1260>
  40bc28:	mov    0x10(%rsi),%rax
  40bc2c:	mov    0x2268(%rsp),%rcx
  40bc34:	mov    (%rax,%rbp,4),%r12d
  40bc38:	lea    0x0(,%rbp,4),%rbx
  40bc40:	mov    %r12d,%edx
  40bc43:	shr    $0x12,%edx
  40bc46:	mov    %edx,%r8d
  40bc49:	lea    (%rcx,%r8,8),%rdi
  40bc4d:	mov    (%rdi),%rcx
  40bc50:	cmp    0x20(%rsp),%rcx
  40bc55:	je     40bcd0 <_ZZ4mainENKUljE_clEj+0x1110>
  40bc57:	mov    %r12d,%edx
  40bc5a:	mov    (%rax,%rbx,1),%ebx
  40bc5d:	shr    $0xb,%edx
  40bc60:	mov    %edx,%r9d
  40bc63:	and    $0x7ff,%ebx
  40bc69:	and    $0x7f,%r9d
  40bc6d:	lea    (%rcx,%r9,2),%r11
  40bc71:	cmp    $0x7ff,%ebx
  40bc77:	jne    40bb60 <_ZZ4mainENKUljE_clEj+0xfa0>
  40bc7d:	mov    0x18(%rsi),%rbx
  40bc81:	mov    0x20(%rsi),%rax
  40bc85:	sub    %rbx,%rax
  40bc88:	sar    $0x4,%rax
  40bc8c:	nopl   0x0(%rax)
  40bc90:	test   %rax,%rax
  40bc93:	jle    40bcba <_ZZ4mainENKUljE_clEj+0x10fa>
  40bc95:	mov    %rax,%rdi
  40bc98:	sar    $1,%rdi
  40bc9b:	mov    %rdi,%rcx
  40bc9e:	shl    $0x4,%rcx
  40bca2:	add    %rbx,%rcx
  40bca5:	cmp    %rbp,(%rcx)
  40bca8:	jae    40bcc8 <_ZZ4mainENKUljE_clEj+0x1108>
  40bcaa:	sub    %rdi,%rax
  40bcad:	lea    0x10(%rcx),%rbx
  40bcb1:	sub    $0x1,%rax
  40bcb5:	test   %rax,%rax
  40bcb8:	jg     40bc95 <_ZZ4mainENKUljE_clEj+0x10d5>
  40bcba:	mov    0x8(%rbx),%rbx
  40bcbe:	jmp    40bb60 <_ZZ4mainENKUljE_clEj+0xfa0>
  40bcc3:	nopl   0x0(%rax,%rax,1)
  40bcc8:	mov    %rdi,%rax
  40bccb:	jmp    40bc90 <_ZZ4mainENKUljE_clEj+0x10d0>
  40bccd:	nopl   (%rax)
  40bcd0:	mov    0x2288(%rsp),%rax
  40bcd8:	sub    0x2280(%rsp),%rax
  40bce0:	mov    %r8,0x38(%rsp)
  40bce5:	lea    0xa0(%rsp),%rsi
  40bced:	shl    $0x6,%rax
  40bcf1:	add    0x2298(%rsp),%rax
  40bcf9:	mov    %r10,0x30(%rsp)
  40bcfe:	movups %xmm0,(%rax)
  40bd01:	movups %xmm0,0x10(%rax)
  40bd05:	movups %xmm0,0x20(%rax)
  40bd09:	movups %xmm0,0x30(%rax)
  40bd0d:	movups %xmm0,0x40(%rax)
  40bd11:	movups %xmm0,0x50(%rax)
  40bd15:	movups %xmm0,0x60(%rax)
  40bd19:	movups %xmm0,0x70(%rax)
  40bd1d:	movups %xmm0,0x80(%rax)
  40bd24:	movups %xmm0,0x90(%rax)
  40bd2b:	movups %xmm0,0xa0(%rax)
  40bd32:	movups %xmm0,0xb0(%rax)
  40bd39:	movups %xmm0,0xc0(%rax)
  40bd40:	movups %xmm0,0xd0(%rax)
  40bd47:	movups %xmm0,0xe0(%rax)
  40bd4e:	movups %xmm0,0xf0(%rax)
  40bd55:	mov    %rax,(%rdi)
  40bd58:	lea    0x2280(%rsp),%rdi
  40bd60:	mov    %edx,0xa0(%rsp)
  40bd67:	call   4080f0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40bd6c:	mov    0x38(%rsp),%r8
  40bd71:	mov    0x30(%rsp),%r10
  40bd76:	pcmpeqd %xmm0,%xmm0
  40bd7a:	mov    0x2260(%rsp),%rsi
  40bd82:	mov    0x2268(%rsp),%rdx
  40bd8a:	mov    0x10(%rsi),%rax
  40bd8e:	mov    (%rdx,%r8,8),%rcx
  40bd92:	jmp    40bc57 <_ZZ4mainENKUljE_clEj+0x1097>
  40bd97:	nopw   0x0(%rax,%rax,1)
  40bda0:	mov    $0x10,%esi
  40bda5:	add    %eax,%eax
  40bda7:	mov    %r9,0x50(%rsp)
  40bdac:	cmp    %esi,%eax
  40bdae:	mov    %r8,0x48(%rsp)
  40bdb3:	cmovb  %esi,%eax
  40bdb6:	mov    %r10,0x40(%rsp)
  40bdbb:	mov    %ecx,0x68(%rsp)
  40bdbf:	lea    0x0(,%rax,4),%esi
  40bdc6:	mov    %edx,0x38(%rsp)
  40bdca:	mov    %eax,0x23ac(%rsp,%r11,1)
  40bdd2:	mov    %r11,0x30(%rsp)
  40bdd7:	call   442b00 <__libc_realloc>
  40bddc:	mov    0x30(%rsp),%r11
  40bde1:	mov    0x50(%rsp),%r9
  40bde6:	pcmpeqd %xmm0,%xmm0
  40bdea:	mov    %rax,%rdi
  40bded:	mov    0x48(%rsp),%r8
  40bdf2:	mov    0x40(%rsp),%r10
  40bdf7:	mov    0x68(%rsp),%ecx
  40bdfb:	mov    0x38(%rsp),%edx
  40bdff:	mov    %rax,0x23a0(%rsp,%r11,1)
  40be07:	mov    0x2260(%rsp),%rsi
  40be0f:	mov    0x23a8(%rsp,%r11,1),%eax
  40be17:	jmp    40bbba <_ZZ4mainENKUljE_clEj+0xffa>
  40be1c:	nopl   0x0(%rax)
  40be20:	mov    0x28(%rsp),%rax
  40be25:	addq   $0x1,(%rsp)
  40be2a:	mov    0x43e0(%rsp),%r8
  40be32:	mov    -0x21a8(%rax),%r9d
  40be39:	cmp    %r9d,(%rsp)
  40be3d:	jb     40ba87 <_ZZ4mainENKUljE_clEj+0xec7>
  40be43:	mov    0x43e8(%rsp),%rax
  40be4b:	mov    0x2238(%rsp),%rdx
  40be53:	mov    %r8d,%ecx
  40be56:	sub    %r9,%rax
  40be59:	mov    0x58(%rsp),%rsi
  40be5e:	shr    $0x6,%r8
  40be62:	mov    %rax,0x43e8(%rsp)
  40be6a:	and    $0x7,%r8d
  40be6e:	shl    $0x4,%rsi
  40be72:	movl   $0x0,0x2268(%rsp,%rsi,1)
  40be7d:	mov    $0xfffffffffffffffe,%rsi
  40be84:	rol    %cl,%rsi
  40be87:	and    %rsi,0x43a0(%rsp,%r8,8)
  40be8f:	jmp    40b390 <_ZZ4mainENKUljE_clEj+0x7d0>
  40be94:	nopl   0x0(%rax)
  40be98:	mov    %r10,%rbx
  40be9b:	cmp    $0xfffe,%r10
  40bea2:	ja     40becc <_ZZ4mainENKUljE_clEj+0x130c>
  40bea4:	mov    0x70(%rsp),%rax
  40bea9:	mov    0x7c(%rsp),%edx
  40bead:	mov    0x30(%rax),%rax
  40beb1:	mov    (%rax),%rax
  40beb4:	mov    %rbx,(%rax,%rdx,8)
  40beb8:	jmp    40afb1 <_ZZ4mainENKUljE_clEj+0x3f1>
  40bebd:	mov    %r8d,%esi
  40bec0:	jmp    40b562 <_ZZ4mainENKUljE_clEj+0x9a2>
  40bec5:	mov    %edi,%esi
  40bec7:	jmp    40b46e <_ZZ4mainENKUljE_clEj+0x8ae>
  40becc:	test   %r13,%r13
  40becf:	je     40cb81 <_ZZ4mainENKUljE_clEj+0x1fc1>
  40bed5:	mov    0x0(%r13),%rax
  40bed9:	mov    0x88(%rsp),%rbx
  40bee1:	mov    0x80(%rsp),%rsi
  40bee9:	mov    0x8(%rax),%rax
  40beed:	mov    (%rax,%rbx,4),%ebx
  40bef0:	cmp    %ebx,(%rax,%rsi,4)
  40bef3:	je     40ca20 <_ZZ4mainENKUljE_clEj+0x1e60>
  40bef9:	mov    0x8570(%r13),%rax
  40bf00:	mov    0x8(%rax),%rdx
  40bf04:	mov    0x6c(%rsp),%eax
  40bf08:	lea    0x1(%rax),%ecx
  40bf0b:	mov    (%rdx,%rcx,4),%esi
  40bf0e:	cmp    %esi,(%rdx,%rax,4)
  40bf11:	je     40ca20 <_ZZ4mainENKUljE_clEj+0x1e60>
  40bf17:	mov    0x20(%r13),%rdi
  40bf1b:	mov    0x28(%r13),%rcx
  40bf1f:	lea    0x40(%r13),%rbx
  40bf23:	cmp    %rcx,%rdi
  40bf26:	je     40bf53 <_ZZ4mainENKUljE_clEj+0x1393>
  40bf28:	mov    0x8(%r13),%rsi
  40bf2c:	mov    %rdi,%rax
  40bf2f:	lea    0x40(%r13),%rbx
  40bf33:	data16 cs nopw 0x0(%rax,%rax,1)
  40bf3e:	xchg   %ax,%ax
  40bf40:	mov    (%rax),%edx
  40bf42:	add    $0x4,%rax
  40bf46:	mov    %rbx,(%rsi,%rdx,8)
  40bf4a:	cmp    %rax,%rcx
  40bf4d:	jne    40bf40 <_ZZ4mainENKUljE_clEj+0x1380>
  40bf4f:	mov    %rdi,0x28(%r13)
  40bf53:	xor    %esi,%esi
  40bf55:	data16 cs nopw 0x0(%rax,%rax,1)
  40bf60:	mov    0x8440(%r13,%rsi,8),%rax
  40bf68:	mov    %esi,%ecx
  40bf6a:	shl    $0x6,%ecx
  40bf6d:	test   %rax,%rax
  40bf70:	je     40bfa4 <_ZZ4mainENKUljE_clEj+0x13e4>
  40bf72:	data16 cs nopw 0x0(%rax,%rax,1)
  40bf7d:	nopl   (%rax)
  40bf80:	xor    %edx,%edx
  40bf82:	tzcnt  %rax,%rdx
  40bf87:	add    %ecx,%edx
  40bf89:	mov    %edx,%edx
  40bf8b:	shl    $0x4,%rdx
  40bf8f:	movl   $0x0,0x448(%r13,%rdx,1)
  40bf9b:	lea    -0x1(%rax),%rdx
  40bf9f:	and    %rdx,%rax
  40bfa2:	jne    40bf80 <_ZZ4mainENKUljE_clEj+0x13c0>
  40bfa4:	movq   $0x0,0x8440(%r13,%rsi,8)
  40bfb0:	add    $0x1,%rsi
  40bfb4:	cmp    $0x20,%rsi
  40bfb8:	jne    40bf60 <_ZZ4mainENKUljE_clEj+0x13a0>
  40bfba:	mov    0x8550(%r13),%rdi
  40bfc1:	pxor   %xmm1,%xmm1
  40bfc5:	mov    0x8560(%r13),%rax
  40bfcc:	movq   $0x0,0x8560(%r13)
  40bfd7:	movups %xmm1,0x8550(%r13)
  40bfdf:	test   %rdi,%rdi
  40bfe2:	je     40bff3 <_ZZ4mainENKUljE_clEj+0x1433>
  40bfe4:	sub    %rdi,%rax
  40bfe7:	mov    %rax,%rsi
  40bfea:	call   40dfb0 <_ZdlPvm>
  40bfef:	pcmpeqd %xmm0,%xmm0
  40bff3:	mov    0x78(%rsp),%ecx
  40bff7:	mov    0x8(%r13),%rax
  40bffb:	pxor   %xmm1,%xmm1
  40bfff:	movups %xmm1,0x8540(%r13)
  40c007:	shr    $0x7,%ecx
  40c00a:	mov    %ecx,%ebp
  40c00c:	lea    (%rax,%rbp,8),%rsi
  40c010:	mov    (%rsi),%rax
  40c013:	cmp    %rbx,%rax
  40c016:	je     40d210 <_ZZ4mainENKUljE_clEj+0x2650>
  40c01c:	mov    0x78(%rsp),%edx
  40c020:	and    $0x7f,%edx
  40c023:	movq   $0x0,(%rax,%rdx,8)
  40c02b:	mov    0x8540(%r13),%rax
  40c032:	neg    %rax
  40c035:	cmp    $0x7ff,%rax
  40c03b:	ja     40d0d9 <_ZZ4mainENKUljE_clEj+0x2519>
  40c041:	mov    0x448(%r13),%eax
  40c048:	mov    0x440(%r13),%rdi
  40c04f:	cmp    0x44c(%r13),%eax
  40c056:	je     40d2da <_ZZ4mainENKUljE_clEj+0x271a>
  40c05c:	mov    0x78(%rsp),%esi
  40c060:	mov    %esi,(%rdi,%rax,4)
  40c063:	addq   $0x1,0x8548(%r13)
  40c06b:	addl   $0x1,0x448(%r13)
  40c073:	orq    $0x1,0x8440(%r13)
  40c07b:	mov    0x8590(%r13),%rdi
  40c082:	mov    0x8598(%r13),%rcx
  40c089:	lea    0x85b0(%r13),%rbx
  40c090:	cmp    %rcx,%rdi
  40c093:	je     40c0c6 <_ZZ4mainENKUljE_clEj+0x1506>
  40c095:	mov    0x8578(%r13),%rsi
  40c09c:	mov    %rdi,%rax
  40c09f:	lea    0x85b0(%r13),%rbx
  40c0a6:	cs nopw 0x0(%rax,%rax,1)
  40c0b0:	mov    (%rax),%edx
  40c0b2:	add    $0x4,%rax
  40c0b6:	mov    %rbx,(%rsi,%rdx,8)
  40c0ba:	cmp    %rcx,%rax
  40c0bd:	jne    40c0b0 <_ZZ4mainENKUljE_clEj+0x14f0>
  40c0bf:	mov    %rdi,0x8598(%r13)
  40c0c6:	xor    %esi,%esi
  40c0c8:	nopl   0x0(%rax,%rax,1)
  40c0d0:	mov    0x109b0(%r13,%rsi,8),%rax
  40c0d8:	mov    %esi,%ecx
  40c0da:	shl    $0x6,%ecx
  40c0dd:	test   %rax,%rax
  40c0e0:	je     40c124 <_ZZ4mainENKUljE_clEj+0x1564>
  40c0e2:	data16 cs nopw 0x0(%rax,%rax,1)
  40c0ed:	data16 cs nopw 0x0(%rax,%rax,1)
  40c0f8:	nopl   0x0(%rax,%rax,1)
  40c100:	xor    %edx,%edx
  40c102:	tzcnt  %rax,%rdx
  40c107:	add    %ecx,%edx
  40c109:	mov    %edx,%edx
  40c10b:	shl    $0x4,%rdx
  40c10f:	movl   $0x0,0x89b8(%r13,%rdx,1)
  40c11b:	lea    -0x1(%rax),%rdx
  40c11f:	and    %rdx,%rax
  40c122:	jne    40c100 <_ZZ4mainENKUljE_clEj+0x1540>
  40c124:	movq   $0x0,0x109b0(%r13,%rsi,8)
  40c130:	add    $0x1,%rsi
  40c134:	cmp    $0x20,%rsi
  40c138:	jne    40c0d0 <_ZZ4mainENKUljE_clEj+0x1510>
  40c13a:	mov    0x10ac0(%r13),%rdi
  40c141:	pxor   %xmm1,%xmm1
  40c145:	mov    0x10ad0(%r13),%rax
  40c14c:	movq   $0x0,0x10ad0(%r13)
  40c157:	movups %xmm1,0x10ac0(%r13)
  40c15f:	test   %rdi,%rdi
  40c162:	je     40c173 <_ZZ4mainENKUljE_clEj+0x15b3>
  40c164:	sub    %rdi,%rax
  40c167:	mov    %rax,%rsi
  40c16a:	call   40dfb0 <_ZdlPvm>
  40c16f:	pcmpeqd %xmm0,%xmm0
  40c173:	mov    0x6c(%rsp),%ecx
  40c177:	mov    0x8578(%r13),%rax
  40c17e:	pxor   %xmm1,%xmm1
  40c182:	movups %xmm1,0x10ab0(%r13)
  40c18a:	shr    $0x7,%ecx
  40c18d:	mov    %ecx,%ebp
  40c18f:	lea    (%rax,%rbp,8),%rsi
  40c193:	mov    (%rsi),%rax
  40c196:	cmp    %rbx,%rax
  40c199:	je     40d196 <_ZZ4mainENKUljE_clEj+0x25d6>
  40c19f:	mov    0x6c(%rsp),%edx
  40c1a3:	and    $0x7f,%edx
  40c1a6:	movq   $0x0,(%rax,%rdx,8)
  40c1ae:	mov    0x10ab0(%r13),%rax
  40c1b5:	neg    %rax
  40c1b8:	cmp    $0x7ff,%rax
  40c1be:	ja     40d017 <_ZZ4mainENKUljE_clEj+0x2457>
  40c1c4:	mov    0x89b8(%r13),%eax
  40c1cb:	mov    0x89b0(%r13),%rdi
  40c1d2:	cmp    0x89bc(%r13),%eax
  40c1d9:	je     40d2a1 <_ZZ4mainENKUljE_clEj+0x26e1>
  40c1df:	mov    0x6c(%rsp),%esi
  40c1e3:	mov    %esi,(%rdi,%rax,4)
  40c1e6:	addq   $0x1,0x10ab8(%r13)
  40c1ee:	addl   $0x1,0x89b8(%r13)
  40c1f6:	orq    $0x1,0x109b0(%r13)
  40c1fe:	mov    0x8548(%r13),%r14
  40c205:	lea    0x8570(%r13),%rbp
  40c20c:	movabs $0x4000000000000000,%rax
  40c216:	mov    $0x1,%r15d
  40c21c:	mov    %rax,0xa8(%rsp)
  40c224:	mov    %rax,%rbx
  40c227:	test   %r14,%r14
  40c22a:	je     40c903 <_ZZ4mainENKUljE_clEj+0x1d43>
  40c230:	mov    0x8540(%r13),%rdx
  40c237:	mov    $0xffffffffffffffff,%rdi
  40c23e:	mov    %edx,%esi
  40c240:	mov    %edx,%ecx
  40c242:	and    $0x7ff,%esi
  40c248:	shl    %cl,%rdi
  40c24b:	mov    %esi,%eax
  40c24d:	mov    %rdi,%rcx
  40c250:	shr    $0x6,%eax
  40c253:	mov    %eax,%edi
  40c255:	and    0x8440(%r13,%rdi,8),%rcx
  40c25d:	jne    40c278 <_ZZ4mainENKUljE_clEj+0x16b8>
  40c25f:	nop
  40c260:	lea    0x1(%rax),%ecx
  40c263:	mov    %ecx,%eax
  40c265:	and    $0x1f,%ecx
  40c268:	mov    0x8440(%r13,%rcx,8),%rcx
  40c270:	and    $0x1f,%eax
  40c273:	test   %rcx,%rcx
  40c276:	je     40c260 <_ZZ4mainENKUljE_clEj+0x16a0>
  40c278:	tzcnt  %rcx,%rcx
  40c27d:	shl    $0x6,%eax
  40c280:	mov    0x8558(%r13),%r8
  40c287:	add    %ecx,%eax
  40c289:	sub    %esi,%eax
  40c28b:	mov    0x8550(%r13),%rsi
  40c292:	and    $0x7ff,%eax
  40c297:	add    %rdx,%rax
  40c29a:	mov    %rax,0x8540(%r13)
  40c2a1:	cmp    %rsi,%r8
  40c2a4:	je     40c542 <_ZZ4mainENKUljE_clEj+0x1982>
  40c2aa:	mov    %rbp,0x28(%rsp)
  40c2af:	mov    %rbx,0x30(%rsp)
  40c2b4:	jmp    40c2d7 <_ZZ4mainENKUljE_clEj+0x1717>
  40c2b6:	cs nopw 0x0(%rax,%rax,1)
  40c2c0:	mov    %r8,0x8558(%r13)
  40c2c7:	mov    0x8540(%r13),%rax
  40c2ce:	cmp    %r8,%rsi
  40c2d1:	je     40c538 <_ZZ4mainENKUljE_clEj+0x1978>
  40c2d7:	mov    (%rsi),%rdx
  40c2da:	mov    %rdx,%r12
  40c2dd:	shr    $0x7,%r12
  40c2e1:	mov    %r12,%rcx
  40c2e4:	sub    %rax,%rcx
  40c2e7:	cmp    $0x7ff,%rcx
  40c2ee:	ja     40c538 <_ZZ4mainENKUljE_clEj+0x1978>
  40c2f4:	mov    %r12,%rbp
  40c2f7:	mov    %r12d,%ebx
  40c2fa:	mov    0x8(%rsi),%r9d
  40c2fe:	mov    %r8,%rax
  40c301:	and    $0x7ff,%ebp
  40c307:	and    $0x7ff,%ebx
  40c30d:	shl    $0x4,%rbp
  40c311:	add    %r13,%rbp
  40c314:	mov    0x448(%rbp),%r10d
  40c31b:	mov    0x440(%rbp),%rdi
  40c322:	cmp    0x44c(%rbp),%r10d
  40c329:	je     40c4d0 <_ZZ4mainENKUljE_clEj+0x1910>
  40c32f:	shl    $0x19,%edx
  40c332:	mov    %r10d,%r8d
  40c335:	add    $0x1,%r14
  40c339:	mov    %r12d,%ecx
  40c33c:	or     %r9d,%edx
  40c33f:	mov    %edx,(%rdi,%r8,4)
  40c343:	mov    %ebx,%edx
  40c345:	mov    %r15,%rbx
  40c348:	lea    -0x10(%rax),%r8
  40c34c:	shr    $0x6,%edx
  40c34f:	addl   $0x1,0x448(%rbp)
  40c356:	shl    %cl,%rbx
  40c359:	mov    %r14,0x8548(%r13)
  40c360:	or     %rbx,0x8440(%r13,%rdx,8)
  40c368:	mov    %rax,%rdx
  40c36b:	sub    %rsi,%rdx
  40c36e:	cmp    $0x10,%rdx
  40c372:	jle    40c2c0 <_ZZ4mainENKUljE_clEj+0x1700>
  40c378:	mov    (%rsi),%rdx
  40c37b:	mov    %r8,%r9
  40c37e:	mov    -0x10(%rax),%r11
  40c382:	sub    %rsi,%r9
  40c385:	mov    -0x8(%rax),%r12d
  40c389:	mov    %rdx,-0x10(%rax)
  40c38d:	mov    0x8(%rsi),%edx
  40c390:	mov    %r9,%r10
  40c393:	sar    $0x4,%r10
  40c397:	mov    %edx,-0x8(%rax)
  40c39a:	cmp    $0x20,%r9
  40c39e:	jle    40c9be <_ZZ4mainENKUljE_clEj+0x1dfe>
  40c3a4:	lea    -0x1(%r10),%rbp
  40c3a8:	mov    %r13,(%rsp)
  40c3ac:	xor    %eax,%eax
  40c3ae:	mov    %r8,0x8(%rsp)
  40c3b3:	sar    $1,%rbp
  40c3b6:	mov    %r14,0x10(%rsp)
  40c3bb:	jmp    40c3d9 <_ZZ4mainENKUljE_clEj+0x1819>
  40c3bd:	nopl   (%rax)
  40c3c0:	mov    0x8(%rdx),%r14d
  40c3c4:	shl    $0x4,%rax
  40c3c8:	mov    %r8,(%rsi,%rax,1)
  40c3cc:	mov    %r14d,0x8(%rsi,%rax,1)
  40c3d1:	cmp    %rcx,%rbp
  40c3d4:	jle    40c430 <_ZZ4mainENKUljE_clEj+0x1870>
  40c3d6:	mov    %rcx,%rax
  40c3d9:	lea    0x1(%rax),%rbx
  40c3dd:	lea    -0x1(%rbx,%rbx,1),%rcx
  40c3e2:	mov    %rbx,%rdi
  40c3e5:	mov    %rcx,%rdx
  40c3e8:	shl    $0x5,%rdi
  40c3ec:	shl    $0x4,%rdx
  40c3f0:	add    %rsi,%rdi
  40c3f3:	add    %rsi,%rdx
  40c3f6:	mov    (%rdi),%r13
  40c3f9:	mov    (%rdx),%r8
  40c3fc:	cmp    %r13,%r8
  40c3ff:	jb     40c3c0 <_ZZ4mainENKUljE_clEj+0x1800>
  40c401:	mov    0x8(%rdi),%r14d
  40c405:	cmp    %r8,%r13
  40c408:	jne    40c420 <_ZZ4mainENKUljE_clEj+0x1860>
  40c40a:	mov    0x8(%rdx),%r13d
  40c40e:	cmp    %r14d,%r13d
  40c411:	jae    40c423 <_ZZ4mainENKUljE_clEj+0x1863>
  40c413:	mov    %r13d,%r14d
  40c416:	jmp    40c3c4 <_ZZ4mainENKUljE_clEj+0x1804>
  40c418:	nopl   0x0(%rax,%rax,1)
  40c420:	mov    %r13,%r8
  40c423:	mov    %rdi,%rdx
  40c426:	lea    (%rbx,%rbx,1),%rcx
  40c42a:	jmp    40c3c4 <_ZZ4mainENKUljE_clEj+0x1804>
  40c42c:	nopl   0x0(%rax)
  40c430:	and    $0x1,%r10d
  40c434:	mov    (%rsp),%r13
  40c438:	mov    0x8(%rsp),%r8
  40c43d:	mov    0x10(%rsp),%r14
  40c442:	jne    40c455 <_ZZ4mainENKUljE_clEj+0x1895>
  40c444:	sar    $0x5,%r9
  40c448:	sub    $0x1,%r9
  40c44c:	cmp    %rcx,%r9
  40c44f:	je     40c9d7 <_ZZ4mainENKUljE_clEj+0x1e17>
  40c455:	lea    -0x1(%rcx),%rax
  40c459:	shr    $0x3f,%rax
  40c45d:	lea    -0x1(%rax,%rcx,1),%rax
  40c462:	sar    $1,%rax
  40c465:	test   %rcx,%rcx
  40c468:	je     40c492 <_ZZ4mainENKUljE_clEj+0x18d2>
  40c46a:	mov    %rax,%rdx
  40c46d:	shl    $0x4,%rdx
  40c471:	add    %rsi,%rdx
  40c474:	mov    (%rdx),%rdi
  40c477:	cmp    %rdi,%r11
  40c47a:	jb     40c4a0 <_ZZ4mainENKUljE_clEj+0x18e0>
  40c47c:	cmp    %r11,%rdi
  40c47f:	jne    40c48a <_ZZ4mainENKUljE_clEj+0x18ca>
  40c481:	mov    0x8(%rdx),%r9d
  40c485:	cmp    %r9d,%r12d
  40c488:	jb     40c4a4 <_ZZ4mainENKUljE_clEj+0x18e4>
  40c48a:	shl    $0x4,%rcx
  40c48e:	lea    (%rsi,%rcx,1),%rdx
  40c492:	mov    %r11,(%rdx)
  40c495:	mov    %r12d,0x8(%rdx)
  40c499:	jmp    40c2c0 <_ZZ4mainENKUljE_clEj+0x1700>
  40c49e:	xchg   %ax,%ax
  40c4a0:	mov    0x8(%rdx),%r9d
  40c4a4:	shl    $0x4,%rcx
  40c4a8:	mov    %rdi,(%rsi,%rcx,1)
  40c4ac:	mov    %r9d,0x8(%rsi,%rcx,1)
  40c4b1:	lea    -0x1(%rax),%rcx
  40c4b5:	shr    $0x3f,%rcx
  40c4b9:	lea    -0x1(%rax,%rcx,1),%rdi
  40c4be:	mov    %rax,%rcx
  40c4c1:	test   %rax,%rax
  40c4c4:	je     40c492 <_ZZ4mainENKUljE_clEj+0x18d2>
  40c4c6:	mov    %rdi,%rax
  40c4c9:	sar    $1,%rax
  40c4cc:	jmp    40c46a <_ZZ4mainENKUljE_clEj+0x18aa>
  40c4ce:	xchg   %ax,%ax
  40c4d0:	lea    (%r10,%r10,1),%r8d
  40c4d4:	mov    $0x10,%eax
  40c4d9:	mov    %r9d,0x8(%rsp)
  40c4de:	cmp    %eax,%r8d
  40c4e1:	mov    %rdx,(%rsp)
  40c4e5:	cmovb  %eax,%r8d
  40c4e9:	mov    %r8d,0x44c(%rbp)
  40c4f0:	lea    0x0(,%r8,4),%esi
  40c4f8:	call   442b00 <__libc_realloc>
  40c4fd:	mov    0x448(%rbp),%r10d
  40c504:	mov    0x8(%rsp),%r9d
  40c509:	pcmpeqd %xmm0,%xmm0
  40c50d:	mov    %rax,0x440(%rbp)
  40c514:	mov    %rax,%rdi
  40c517:	mov    (%rsp),%rdx
  40c51b:	mov    0x8548(%r13),%r14
  40c522:	mov    0x8558(%r13),%rax
  40c529:	mov    0x8550(%r13),%rsi
  40c530:	jmp    40c32f <_ZZ4mainENKUljE_clEj+0x176f>
  40c535:	nopl   (%rax)
  40c538:	mov    0x28(%rsp),%rbp
  40c53d:	mov    0x30(%rsp),%rbx
  40c542:	shl    $0x7,%rax
  40c546:	mov    %rax,%r12
  40c549:	mov    0x10ab8(%r13),%r14
  40c550:	test   %r14,%r14
  40c553:	je     40c937 <_ZZ4mainENKUljE_clEj+0x1d77>
  40c559:	mov    0x10ab0(%r13),%rdx
  40c560:	mov    $0xffffffffffffffff,%rdi
  40c567:	mov    %edx,%esi
  40c569:	mov    %edx,%ecx
  40c56b:	and    $0x7ff,%esi
  40c571:	shl    %cl,%rdi
  40c574:	mov    %esi,%eax
  40c576:	mov    %rdi,%rcx
  40c579:	shr    $0x6,%eax
  40c57c:	mov    %eax,%edi
  40c57e:	and    0x109b0(%r13,%rdi,8),%rcx
  40c586:	jne    40c5b8 <_ZZ4mainENKUljE_clEj+0x19f8>
  40c588:	data16 cs nopw 0x0(%rax,%rax,1)
  40c593:	data16 cs nopw 0x0(%rax,%rax,1)
  40c59e:	xchg   %ax,%ax
  40c5a0:	lea    0x1(%rax),%ecx
  40c5a3:	mov    %ecx,%eax
  40c5a5:	and    $0x1f,%ecx
  40c5a8:	mov    0x109b0(%r13,%rcx,8),%rcx
  40c5b0:	and    $0x1f,%eax
  40c5b3:	test   %rcx,%rcx
  40c5b6:	je     40c5a0 <_ZZ4mainENKUljE_clEj+0x19e0>
  40c5b8:	tzcnt  %rcx,%rcx
  40c5bd:	shl    $0x6,%eax
  40c5c0:	mov    0x10ac8(%r13),%r8
  40c5c7:	add    %ecx,%eax
  40c5c9:	sub    %esi,%eax
  40c5cb:	mov    0x10ac0(%r13),%rsi
  40c5d2:	and    $0x7ff,%eax
  40c5d7:	add    %rdx,%rax
  40c5da:	mov    %rax,0x10ab0(%r13)
  40c5e1:	cmp    %rsi,%r8
  40c5e4:	je     40c887 <_ZZ4mainENKUljE_clEj+0x1cc7>
  40c5ea:	mov    %rbp,0x28(%rsp)
  40c5ef:	mov    %r12,0x30(%rsp)
  40c5f4:	mov    %rbx,0x38(%rsp)
  40c5f9:	jmp    40c617 <_ZZ4mainENKUljE_clEj+0x1a57>
  40c5fb:	nopl   0x0(%rax,%rax,1)
  40c600:	mov    %r8,0x10ac8(%r13)
  40c607:	mov    0x10ab0(%r13),%rax
  40c60e:	cmp    %r8,%rsi
  40c611:	je     40c878 <_ZZ4mainENKUljE_clEj+0x1cb8>
  40c617:	mov    (%rsi),%rdx
  40c61a:	mov    %rdx,%r12
  40c61d:	shr    $0x7,%r12
  40c621:	mov    %r12,%rcx
  40c624:	sub    %rax,%rcx
  40c627:	cmp    $0x7ff,%rcx
  40c62e:	ja     40c878 <_ZZ4mainENKUljE_clEj+0x1cb8>
  40c634:	mov    %r12,%rbp
  40c637:	mov    %r12d,%ebx
  40c63a:	mov    0x8(%rsi),%r9d
  40c63e:	mov    %r8,%rax
  40c641:	and    $0x7ff,%ebp
  40c647:	and    $0x7ff,%ebx
  40c64d:	shl    $0x4,%rbp
  40c651:	add    %r13,%rbp
  40c654:	mov    0x89b8(%rbp),%r10d
  40c65b:	mov    0x89b0(%rbp),%rdi
  40c662:	cmp    0x89bc(%rbp),%r10d
  40c669:	je     40c810 <_ZZ4mainENKUljE_clEj+0x1c50>
  40c66f:	shl    $0x19,%edx
  40c672:	add    $0x1,%r14
  40c676:	lea    -0x10(%rax),%r8
  40c67a:	mov    %r12d,%ecx
  40c67d:	or     %r9d,%edx
  40c680:	mov    %edx,(%rdi,%r10,4)
  40c684:	mov    %ebx,%edx
  40c686:	mov    %r15,%rbx
  40c689:	shr    $0x6,%edx
  40c68c:	addl   $0x1,0x89b8(%rbp)
  40c693:	shl    %cl,%rbx
  40c696:	mov    %r14,0x10ab8(%r13)
  40c69d:	or     %rbx,0x109b0(%r13,%rdx,8)
  40c6a5:	mov    %rax,%rdx
  40c6a8:	sub    %rsi,%rdx
  40c6ab:	cmp    $0x10,%rdx
  40c6af:	jle    40c600 <_ZZ4mainENKUljE_clEj+0x1a40>
  40c6b5:	mov    (%rsi),%rdx
  40c6b8:	mov    %r8,%r10
  40c6bb:	mov    -0x10(%rax),%r11
  40c6bf:	sub    %rsi,%r10
  40c6c2:	mov    -0x8(%rax),%r12d
  40c6c6:	mov    %rdx,-0x10(%rax)
  40c6ca:	mov    0x8(%rsi),%edx
  40c6cd:	mov    %r10,%r9
  40c6d0:	sar    $0x4,%r9
  40c6d4:	mov    %edx,-0x8(%rax)
  40c6d7:	cmp    $0x20,%r10
  40c6db:	jle    40c980 <_ZZ4mainENKUljE_clEj+0x1dc0>
  40c6e1:	lea    -0x1(%r9),%rbp
  40c6e5:	mov    %r13,(%rsp)
  40c6e9:	xor    %eax,%eax
  40c6eb:	mov    %r11,0x8(%rsp)
  40c6f0:	sar    $1,%rbp
  40c6f3:	mov    %r14,0x10(%rsp)
  40c6f8:	jmp    40c719 <_ZZ4mainENKUljE_clEj+0x1b59>
  40c6fa:	nopw   0x0(%rax,%rax,1)
  40c700:	mov    0x8(%rdx),%r14d
  40c704:	shl    $0x4,%rax
  40c708:	mov    %r11,(%rsi,%rax,1)
  40c70c:	mov    %r14d,0x8(%rsi,%rax,1)
  40c711:	cmp    %rcx,%rbp
  40c714:	jle    40c770 <_ZZ4mainENKUljE_clEj+0x1bb0>
  40c716:	mov    %rcx,%rax
  40c719:	lea    0x1(%rax),%rbx
  40c71d:	lea    -0x1(%rbx,%rbx,1),%rcx
  40c722:	mov    %rbx,%rdi
  40c725:	mov    %rcx,%rdx
  40c728:	shl    $0x5,%rdi
  40c72c:	shl    $0x4,%rdx
  40c730:	add    %rsi,%rdi
  40c733:	add    %rsi,%rdx
  40c736:	mov    (%rdi),%r13
  40c739:	mov    (%rdx),%r11
  40c73c:	cmp    %r13,%r11
  40c73f:	jb     40c700 <_ZZ4mainENKUljE_clEj+0x1b40>
  40c741:	mov    0x8(%rdi),%r14d
  40c745:	cmp    %r11,%r13
  40c748:	jne    40c760 <_ZZ4mainENKUljE_clEj+0x1ba0>
  40c74a:	mov    0x8(%rdx),%r13d
  40c74e:	cmp    %r14d,%r13d
  40c751:	jae    40c763 <_ZZ4mainENKUljE_clEj+0x1ba3>
  40c753:	mov    %r13d,%r14d
  40c756:	jmp    40c704 <_ZZ4mainENKUljE_clEj+0x1b44>
  40c758:	nopl   0x0(%rax,%rax,1)
  40c760:	mov    %r13,%r11
  40c763:	mov    %rdi,%rdx
  40c766:	lea    (%rbx,%rbx,1),%rcx
  40c76a:	jmp    40c704 <_ZZ4mainENKUljE_clEj+0x1b44>
  40c76c:	nopl   0x0(%rax)
  40c770:	and    $0x1,%r9d
  40c774:	mov    (%rsp),%r13
  40c778:	mov    0x8(%rsp),%r11
  40c77d:	mov    0x10(%rsp),%r14
  40c782:	jne    40c795 <_ZZ4mainENKUljE_clEj+0x1bd5>
  40c784:	sar    $0x5,%r10
  40c788:	sub    $0x1,%r10
  40c78c:	cmp    %rcx,%r10
  40c78f:	je     40c999 <_ZZ4mainENKUljE_clEj+0x1dd9>
  40c795:	lea    -0x1(%rcx),%rax
  40c799:	shr    $0x3f,%rax
  40c79d:	lea    -0x1(%rax,%rcx,1),%rax
  40c7a2:	sar    $1,%rax
  40c7a5:	test   %rcx,%rcx
  40c7a8:	je     40c7cf <_ZZ4mainENKUljE_clEj+0x1c0f>
  40c7aa:	mov    %rax,%rdx
  40c7ad:	shl    $0x4,%rdx
  40c7b1:	add    %rsi,%rdx
  40c7b4:	mov    (%rdx),%rdi
  40c7b7:	cmp    %rdi,%r11
  40c7ba:	jb     40c7e0 <_ZZ4mainENKUljE_clEj+0x1c20>
  40c7bc:	jne    40c7c7 <_ZZ4mainENKUljE_clEj+0x1c07>
  40c7be:	mov    0x8(%rdx),%r9d
  40c7c2:	cmp    %r9d,%r12d
  40c7c5:	jb     40c7e4 <_ZZ4mainENKUljE_clEj+0x1c24>
  40c7c7:	shl    $0x4,%rcx
  40c7cb:	lea    (%rsi,%rcx,1),%rdx
  40c7cf:	mov    %r11,(%rdx)
  40c7d2:	mov    %r12d,0x8(%rdx)
  40c7d6:	jmp    40c600 <_ZZ4mainENKUljE_clEj+0x1a40>
  40c7db:	nopl   0x0(%rax,%rax,1)
  40c7e0:	mov    0x8(%rdx),%r9d
  40c7e4:	shl    $0x4,%rcx
  40c7e8:	mov    %rdi,(%rsi,%rcx,1)
  40c7ec:	mov    %r9d,0x8(%rsi,%rcx,1)
  40c7f1:	lea    -0x1(%rax),%rcx
  40c7f5:	shr    $0x3f,%rcx
  40c7f9:	lea    -0x1(%rax,%rcx,1),%rdi
  40c7fe:	mov    %rax,%rcx
  40c801:	test   %rax,%rax
  40c804:	je     40c7cf <_ZZ4mainENKUljE_clEj+0x1c0f>
  40c806:	mov    %rdi,%rax
  40c809:	sar    $1,%rax
  40c80c:	jmp    40c7aa <_ZZ4mainENKUljE_clEj+0x1bea>
  40c80e:	xchg   %ax,%ax
  40c810:	mov    $0x10,%eax
  40c815:	add    %r10d,%r10d
  40c818:	mov    %r9d,0x8(%rsp)
  40c81d:	cmp    %eax,%r10d
  40c820:	mov    %rdx,(%rsp)
  40c824:	cmovb  %eax,%r10d
  40c828:	mov    %r10d,0x89bc(%rbp)
  40c82f:	lea    0x0(,%r10,4),%esi
  40c837:	call   442b00 <__libc_realloc>
  40c83c:	mov    0x89b8(%rbp),%r10d
  40c843:	mov    0x8(%rsp),%r9d
  40c848:	pcmpeqd %xmm0,%xmm0
  40c84c:	mov    %rax,0x89b0(%rbp)
  40c853:	mov    %rax,%rdi
  40c856:	mov    (%rsp),%rdx
  40c85a:	mov    0x10ab8(%r13),%r14
  40c861:	mov    0x10ac8(%r13),%rax
  40c868:	mov    0x10ac0(%r13),%rsi
  40c86f:	jmp    40c66f <_ZZ4mainENKUljE_clEj+0x1aaf>
  40c874:	nopl   0x0(%rax)
  40c878:	mov    0x28(%rsp),%rbp
  40c87d:	mov    0x30(%rsp),%r12
  40c882:	mov    0x38(%rsp),%rbx
  40c887:	movabs $0x4000000000000000,%rsi
  40c891:	shl    $0x7,%rax
  40c895:	cmp    %rsi,%r12
  40c898:	je     40c9fc <_ZZ4mainENKUljE_clEj+0x1e3c>
  40c89e:	cmp    %rsi,%rax
  40c8a1:	je     40c9fc <_ZZ4mainENKUljE_clEj+0x1e3c>
  40c8a7:	add    %rax,%r12
  40c8aa:	cmp    %rbx,%r12
  40c8ad:	jae    40ca0d <_ZZ4mainENKUljE_clEj+0x1e4d>
  40c8b3:	mov    0x8548(%r13),%rax
  40c8ba:	cmp    %rax,0x10ab8(%r13)
  40c8c1:	lea    0xb0(%rsp),%rax
  40c8c9:	lea    0xa8(%rsp),%rdx
  40c8d1:	mov    %rax,0x60(%rsp)
  40c8d6:	jb     40c970 <_ZZ4mainENKUljE_clEj+0x1db0>
  40c8dc:	mov    %rbp,%rsi
  40c8df:	mov    %r13,%rdi
  40c8e2:	call   40a580 <_ZN4SideImE10drain_bitsILj11EEEvRKS0_Rm>
  40c8e7:	mov    0x8548(%r13),%r14
  40c8ee:	mov    0xa8(%rsp),%rbx
  40c8f6:	pcmpeqd %xmm0,%xmm0
  40c8fa:	test   %r14,%r14
  40c8fd:	jne    40c230 <_ZZ4mainENKUljE_clEj+0x1670>
  40c903:	mov    0x8558(%r13),%r8
  40c90a:	mov    0x8550(%r13),%rsi
  40c911:	cmp    %rsi,%r8
  40c914:	je     40ced4 <_ZZ4mainENKUljE_clEj+0x2314>
  40c91a:	mov    (%rsi),%rax
  40c91d:	mov    %rbp,0x28(%rsp)
  40c922:	mov    %rbx,0x30(%rsp)
  40c927:	shr    $0x7,%rax
  40c92b:	mov    %rax,0x8540(%r13)
  40c932:	jmp    40c2d7 <_ZZ4mainENKUljE_clEj+0x1717>
  40c937:	mov    0x10ac8(%r13),%r8
  40c93e:	mov    0x10ac0(%r13),%rsi
  40c945:	cmp    %rsi,%r8
  40c948:	je     40c9fc <_ZZ4mainENKUljE_clEj+0x1e3c>
  40c94e:	mov    (%rsi),%rax
  40c951:	mov    %rbp,0x28(%rsp)
  40c956:	mov    %r12,0x30(%rsp)
  40c95b:	shr    $0x7,%rax
  40c95f:	mov    %rbx,0x38(%rsp)
  40c964:	mov    %rax,0x10ab0(%r13)
  40c96b:	jmp    40c617 <_ZZ4mainENKUljE_clEj+0x1a57>
  40c970:	mov    %r13,%rsi
  40c973:	mov    %rbp,%rdi
  40c976:	call   40a580 <_ZN4SideImE10drain_bitsILj11EEEvRKS0_Rm>
  40c97b:	jmp    40c8e7 <_ZZ4mainENKUljE_clEj+0x1d27>
  40c980:	and    $0x1,%r9d
  40c984:	mov    %rsi,%rdx
  40c987:	jne    40c7cf <_ZZ4mainENKUljE_clEj+0x1c0f>
  40c98d:	cmp    $0x20,%r10
  40c991:	jne    40c7cf <_ZZ4mainENKUljE_clEj+0x1c0f>
  40c997:	xor    %ecx,%ecx
  40c999:	lea    0x1(%rcx,%rcx,1),%rax
  40c99e:	shl    $0x4,%rax
  40c9a2:	add    %rsi,%rax
  40c9a5:	mov    (%rax),%r9
  40c9a8:	mov    0x8(%rax),%eax
  40c9ab:	mov    %r9,(%rdx)
  40c9ae:	mov    %eax,0x8(%rdx)
  40c9b1:	mov    %rcx,%rax
  40c9b4:	lea    0x1(%rcx,%rcx,1),%rcx
  40c9b9:	jmp    40c7aa <_ZZ4mainENKUljE_clEj+0x1bea>
  40c9be:	and    $0x1,%r10d
  40c9c2:	mov    %rsi,%rdx
  40c9c5:	jne    40c492 <_ZZ4mainENKUljE_clEj+0x18d2>
  40c9cb:	cmp    $0x20,%r9
  40c9cf:	jne    40c492 <_ZZ4mainENKUljE_clEj+0x18d2>
  40c9d5:	xor    %ecx,%ecx
  40c9d7:	lea    0x1(%rcx,%rcx,1),%rax
  40c9dc:	shl    $0x4,%rax
  40c9e0:	add    %rsi,%rax
  40c9e3:	mov    (%rax),%r9
  40c9e6:	mov    0x8(%rax),%eax
  40c9e9:	mov    %r9,(%rdx)
  40c9ec:	mov    %eax,0x8(%rdx)
  40c9ef:	mov    %rcx,%rax
  40c9f2:	lea    0x1(%rcx,%rcx,1),%rcx
  40c9f7:	jmp    40c46a <_ZZ4mainENKUljE_clEj+0x18aa>
  40c9fc:	movabs $0x4000000000000000,%rax
  40ca06:	cmp    %rax,%rbx
  40ca09:	cmova  %rax,%rbx
  40ca0d:	movabs $0x3fffffffffffffff,%rax
  40ca17:	cmp    %rbx,%rax
  40ca1a:	jae    40bea4 <_ZZ4mainENKUljE_clEj+0x12e4>
  40ca20:	mov    $0xffffffffffffffff,%rbx
  40ca27:	jmp    40bea4 <_ZZ4mainENKUljE_clEj+0x12e4>
  40ca2c:	xor    %ebx,%ebx
  40ca2e:	jmp    40bea4 <_ZZ4mainENKUljE_clEj+0x12e4>
  40ca33:	mov    0xd8(%rsp),%rax
  40ca3b:	sub    0xd0(%rsp),%rax
  40ca43:	lea    0x94(%rsp),%rsi
  40ca4b:	lea    0xd0(%rsp),%rdi
  40ca53:	shl    $0x6,%rax
  40ca57:	add    0xe8(%rsp),%rax
  40ca5f:	mov    %edx,0x94(%rsp)
  40ca66:	movups %xmm0,(%rax)
  40ca69:	movups %xmm0,0x10(%rax)
  40ca6d:	movups %xmm0,0x20(%rax)
  40ca71:	movups %xmm0,0x30(%rax)
  40ca75:	movups %xmm0,0x40(%rax)
  40ca79:	movups %xmm0,0x50(%rax)
  40ca7d:	movups %xmm0,0x60(%rax)
  40ca81:	movups %xmm0,0x70(%rax)
  40ca85:	movups %xmm0,0x80(%rax)
  40ca8c:	movups %xmm0,0x90(%rax)
  40ca93:	movups %xmm0,0xa0(%rax)
  40ca9a:	movups %xmm0,0xb0(%rax)
  40caa1:	movups %xmm0,0xc0(%rax)
  40caa8:	movups %xmm0,0xd0(%rax)
  40caaf:	movups %xmm0,0xe0(%rax)
  40cab6:	movups %xmm0,0xf0(%rax)
  40cabd:	mov    %rax,(%rcx)
  40cac0:	call   4080f0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40cac5:	mov    0xb8(%rsp),%rax
  40cacd:	pcmpeqd %xmm0,%xmm0
  40cad1:	mov    (%rax,%rbx,8),%rax
  40cad5:	jmp    40b19e <_ZZ4mainENKUljE_clEj+0x5de>
  40cada:	mov    0x2288(%rsp),%rax
  40cae2:	sub    0x2280(%rsp),%rax
  40caea:	lea    0x98(%rsp),%rsi
  40caf2:	lea    0x2280(%rsp),%rdi
  40cafa:	shl    $0x6,%rax
  40cafe:	add    0x2298(%rsp),%rax
  40cb06:	mov    %edx,0x98(%rsp)
  40cb0d:	movups %xmm0,(%rax)
  40cb10:	movups %xmm0,0x10(%rax)
  40cb14:	movups %xmm0,0x20(%rax)
  40cb18:	movups %xmm0,0x30(%rax)
  40cb1c:	movups %xmm0,0x40(%rax)
  40cb20:	movups %xmm0,0x50(%rax)
  40cb24:	movups %xmm0,0x60(%rax)
  40cb28:	movups %xmm0,0x70(%rax)
  40cb2c:	movups %xmm0,0x80(%rax)
  40cb33:	movups %xmm0,0x90(%rax)
  40cb3a:	movups %xmm0,0xa0(%rax)
  40cb41:	movups %xmm0,0xb0(%rax)
  40cb48:	movups %xmm0,0xc0(%rax)
  40cb4f:	movups %xmm0,0xd0(%rax)
  40cb56:	movups %xmm0,0xe0(%rax)
  40cb5d:	movups %xmm0,0xf0(%rax)
  40cb64:	mov    %rax,(%rcx)
  40cb67:	call   4080f0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40cb6c:	mov    0x2268(%rsp),%rax
  40cb74:	pcmpeqd %xmm0,%xmm0
  40cb78:	mov    (%rax,%rbx,8),%rax
  40cb7c:	jmp    40b31e <_ZZ4mainENKUljE_clEj+0x75e>
  40cb81:	lea    0xb0(%rsp),%rax
  40cb89:	mov    $0x10ae0,%edi
  40cb8e:	mov    %rax,0x60(%rsp)
  40cb93:	call   40e080 <_Znwm>
  40cb98:	mov    %rax,%r13
  40cb9b:	mov    0x70(%rsp),%rax
  40cba0:	lea    0x40(%r13),%rbx
  40cba4:	mov    (%rax),%rax
  40cba7:	mov    (%rax),%rax
  40cbaa:	mov    (%rax),%r12d
  40cbad:	mov    %rax,0x0(%r13)
  40cbb1:	movq   $0x0,0x8(%r13)
  40cbb9:	mov    %r12d,%r15d
  40cbbc:	movq   $0x0,0x10(%r13)
  40cbc4:	shr    $0x7,%r15d
  40cbc8:	movq   $0x0,0x18(%r13)
  40cbd0:	lea    0x1(%r15),%ebp
  40cbd4:	lea    0x0(,%rbp,8),%rsi
  40cbdc:	mov    %rbp,%r14
  40cbdf:	mov    %rsi,%rdi
  40cbe2:	mov    %rsi,(%rsp)
  40cbe6:	call   40e080 <_Znwm>
  40cbeb:	mov    (%rsp),%rsi
  40cbef:	mov    %rax,0x8(%r13)
  40cbf3:	mov    %rax,%rdx
  40cbf6:	add    %rax,%rsi
  40cbf9:	mov    %rsi,0x18(%r13)
  40cbfd:	test   %r15d,%r15d
  40cc00:	je     40cc48 <_ZZ4mainENKUljE_clEj+0x2088>
  40cc02:	mov    %rbp,%rdi
  40cc05:	movq   %rbx,%xmm1
  40cc0a:	shr    $1,%rdi
  40cc0d:	punpcklqdq %xmm1,%xmm1
  40cc11:	shl    $0x4,%rdi
  40cc15:	lea    (%rax,%rdi,1),%rcx
  40cc19:	and    $0x10,%edi
  40cc1c:	je     40cc2a <_ZZ4mainENKUljE_clEj+0x206a>
  40cc1e:	movups %xmm1,(%rax)
  40cc21:	lea    0x10(%rax),%rax
  40cc25:	cmp    %rax,%rcx
  40cc28:	je     40cc3a <_ZZ4mainENKUljE_clEj+0x207a>
  40cc2a:	movups %xmm1,(%rax)
  40cc2d:	add    $0x20,%rax
  40cc31:	movups %xmm1,-0x10(%rax)
  40cc35:	cmp    %rax,%rcx
  40cc38:	jne    40cc2a <_ZZ4mainENKUljE_clEj+0x206a>
  40cc3a:	and    $0x1,%r14d
  40cc3e:	je     40cc4b <_ZZ4mainENKUljE_clEj+0x208b>
  40cc40:	and    $0xfffffffffffffffe,%rbp
  40cc44:	lea    (%rdx,%rbp,8),%rdx
  40cc48:	mov    %rbx,(%rdx)
  40cc4b:	mov    %rsi,0x10(%r13)
  40cc4f:	pxor   %xmm1,%xmm1
  40cc53:	xor    %r9d,%r9d
  40cc56:	mov    $0x4022,%ecx
  40cc5b:	lea    0x80(%r12),%eax
  40cc63:	movq   $0x0,0x30(%r13)
  40cc6b:	mov    $0x3,%edx
  40cc70:	xor    %edi,%edi
  40cc72:	lea    0x40(,%rax,8),%r12
  40cc7a:	movups %xmm1,0x20(%r13)
  40cc7f:	mov    $0xffffffff,%r8d
  40cc85:	mov    %r12,%rsi
  40cc88:	call   455dd0 <__mmap64>
  40cc8d:	mov    $0xf,%edx
  40cc92:	mov    %r12,%rsi
  40cc95:	mov    %rax,%rdi
  40cc98:	mov    %rax,%rbp
  40cc9b:	call   455da0 <__madvise>
  40cca0:	lea    0x440(%r13),%rdi
  40cca7:	mov    %rbp,0x38(%r13)
  40ccab:	mov    %rbx,%rax
  40ccae:	cmp    %rdi,%rbx
  40ccb1:	je     40cce6 <_ZZ4mainENKUljE_clEj+0x2126>
  40ccb3:	movq   0xaf715(%rip),%xmm1        # 4bc3d0 <max.0+0x30>
  40ccbb:	mov    %rdi,%rdx
  40ccbe:	sub    %rbx,%rdx
  40ccc1:	and    $0x10,%edx
  40ccc4:	punpcklqdq %xmm1,%xmm1
  40ccc8:	je     40ccd6 <_ZZ4mainENKUljE_clEj+0x2116>
  40ccca:	add    $0x10,%rax
  40ccce:	movups %xmm1,(%rbx)
  40ccd1:	cmp    %rax,%rdi
  40ccd4:	je     40cce6 <_ZZ4mainENKUljE_clEj+0x2126>
  40ccd6:	movups %xmm1,(%rax)
  40ccd9:	add    $0x20,%rax
  40ccdd:	movups %xmm1,-0x10(%rax)
  40cce1:	cmp    %rax,%rdi
  40cce4:	jne    40ccd6 <_ZZ4mainENKUljE_clEj+0x2116>
  40cce6:	xor    %esi,%esi
  40cce8:	mov    $0x8000,%edx
  40cced:	lea    0x85b0(%r13),%rbx
  40ccf4:	call   401098 <_init+0x98>
  40ccf9:	xor    %eax,%eax
  40ccfb:	mov    $0x20,%ecx
  40cd00:	pxor   %xmm1,%xmm1
  40cd04:	lea    0x8440(%r13),%rdi
  40cd0b:	rep stos %rax,%es:(%rdi)
  40cd0e:	mov    0x70(%rsp),%rax
  40cd13:	movq   $0x0,0x8560(%r13)
  40cd1e:	movups %xmm1,0x8540(%r13)
  40cd26:	mov    0x8(%rax),%rax
  40cd2a:	movups %xmm1,0x8550(%r13)
  40cd32:	mov    (%rax),%rax
  40cd35:	mov    (%rax),%r12d
  40cd38:	mov    %rax,0x8570(%r13)
  40cd3f:	movq   $0x0,0x8578(%r13)
  40cd4a:	movq   $0x0,0x8580(%r13)
  40cd55:	mov    %r12d,%r15d
  40cd58:	movq   $0x0,0x8588(%r13)
  40cd63:	shr    $0x7,%r15d
  40cd67:	lea    0x1(%r15),%ebp
  40cd6b:	lea    0x0(,%rbp,8),%rsi
  40cd73:	mov    %rbp,%r14
  40cd76:	mov    %rsi,%rdi
  40cd79:	mov    %rsi,(%rsp)
  40cd7d:	call   40e080 <_Znwm>
  40cd82:	mov    (%rsp),%rsi
  40cd86:	mov    %rax,0x8578(%r13)
  40cd8d:	mov    %rax,%rdx
  40cd90:	add    %rax,%rsi
  40cd93:	mov    %rsi,0x8588(%r13)
  40cd9a:	test   %r15d,%r15d
  40cd9d:	je     40cde5 <_ZZ4mainENKUljE_clEj+0x2225>
  40cd9f:	mov    %rbp,%rdi
  40cda2:	movq   %rbx,%xmm1
  40cda7:	shr    $1,%rdi
  40cdaa:	punpcklqdq %xmm1,%xmm1
  40cdae:	shl    $0x4,%rdi
  40cdb2:	lea    (%rax,%rdi,1),%rcx
  40cdb6:	and    $0x10,%edi
  40cdb9:	je     40cdc7 <_ZZ4mainENKUljE_clEj+0x2207>
  40cdbb:	movups %xmm1,(%rax)
  40cdbe:	lea    0x10(%rax),%rax
  40cdc2:	cmp    %rax,%rcx
  40cdc5:	je     40cdd7 <_ZZ4mainENKUljE_clEj+0x2217>
  40cdc7:	movups %xmm1,(%rax)
  40cdca:	add    $0x20,%rax
  40cdce:	movups %xmm1,-0x10(%rax)
  40cdd2:	cmp    %rax,%rcx
  40cdd5:	jne    40cdc7 <_ZZ4mainENKUljE_clEj+0x2207>
  40cdd7:	and    $0x1,%r14d
  40cddb:	je     40cde8 <_ZZ4mainENKUljE_clEj+0x2228>
  40cddd:	and    $0xfffffffffffffffe,%rbp
  40cde1:	lea    (%rdx,%rbp,8),%rdx
  40cde5:	mov    %rbx,(%rdx)
  40cde8:	mov    %rsi,0x8580(%r13)
  40cdef:	pxor   %xmm1,%xmm1
  40cdf3:	xor    %r9d,%r9d
  40cdf6:	xor    %edi,%edi
  40cdf8:	mov    $0xffffffff,%r8d
  40cdfe:	mov    $0x4022,%ecx
  40ce03:	mov    $0x3,%edx
  40ce08:	movq   $0x0,0x85a0(%r13)
  40ce13:	lea    0x80(%r12),%eax
  40ce1b:	movups %xmm1,0x8590(%r13)
  40ce23:	lea    0x40(,%rax,8),%r12
  40ce2b:	mov    %r12,%rsi
  40ce2e:	call   455dd0 <__mmap64>
  40ce33:	mov    $0xf,%edx
  40ce38:	mov    %r12,%rsi
  40ce3b:	mov    %rax,%rdi
  40ce3e:	mov    %rax,%rbp
  40ce41:	call   455da0 <__madvise>
  40ce46:	lea    0x89b0(%r13),%rdi
  40ce4d:	mov    %rbp,0x85a8(%r13)
  40ce54:	mov    %rbx,%rax
  40ce57:	cmp    %rdi,%rbx
  40ce5a:	je     40ce8f <_ZZ4mainENKUljE_clEj+0x22cf>
  40ce5c:	movq   0xaf56c(%rip),%xmm1        # 4bc3d0 <max.0+0x30>
  40ce64:	mov    %rdi,%rdx
  40ce67:	sub    %rbx,%rdx
  40ce6a:	and    $0x10,%edx
  40ce6d:	punpcklqdq %xmm1,%xmm1
  40ce71:	je     40ce7f <_ZZ4mainENKUljE_clEj+0x22bf>
  40ce73:	add    $0x10,%rax
  40ce77:	movups %xmm1,(%rbx)
  40ce7a:	cmp    %rax,%rdi
  40ce7d:	je     40ce8f <_ZZ4mainENKUljE_clEj+0x22cf>
  40ce7f:	movups %xmm1,(%rax)
  40ce82:	add    $0x20,%rax
  40ce86:	movups %xmm1,-0x10(%rax)
  40ce8a:	cmp    %rax,%rdi
  40ce8d:	jne    40ce7f <_ZZ4mainENKUljE_clEj+0x22bf>
  40ce8f:	mov    $0x8000,%edx
  40ce94:	xor    %esi,%esi
  40ce96:	call   401098 <_init+0x98>
  40ce9b:	pxor   %xmm1,%xmm1
  40ce9f:	mov    $0x20,%ecx
  40cea4:	xor    %eax,%eax
  40cea6:	lea    0x109b0(%r13),%rdi
  40cead:	pcmpeqd %xmm0,%xmm0
  40ceb1:	rep stos %rax,%es:(%rdi)
  40ceb4:	movups %xmm1,0x10ab0(%r13)
  40cebc:	movq   $0x0,0x10ad0(%r13)
  40cec7:	movups %xmm1,0x10ac0(%r13)
  40cecf:	jmp    40bed5 <_ZZ4mainENKUljE_clEj+0x1315>
  40ced4:	movabs $0x4000000000000000,%r12
  40cede:	jmp    40c549 <_ZZ4mainENKUljE_clEj+0x1989>
  40cee3:	mov    0x43f0(%rsp),%rdi
  40ceeb:	test   %rdi,%rdi
  40ceee:	je     40cf00 <_ZZ4mainENKUljE_clEj+0x2340>
  40cef0:	mov    0x4400(%rsp),%rsi
  40cef8:	sub    %rdi,%rsi
  40cefb:	call   40dfb0 <_ZdlPvm>
  40cf00:	mov    0x2280(%rsp),%rdi
  40cf08:	test   %rdi,%rdi
  40cf0b:	je     40cf1d <_ZZ4mainENKUljE_clEj+0x235d>
  40cf0d:	mov    0x2290(%rsp),%rsi
  40cf15:	sub    %rdi,%rsi
  40cf18:	call   40dfb0 <_ZdlPvm>
  40cf1d:	mov    0x2268(%rsp),%rdi
  40cf25:	test   %rdi,%rdi
  40cf28:	je     40cf3a <_ZZ4mainENKUljE_clEj+0x237a>
  40cf2a:	mov    0x2278(%rsp),%rsi
  40cf32:	sub    %rdi,%rsi
  40cf35:	call   40dfb0 <_ZdlPvm>
  40cf3a:	mov    0x2240(%rsp),%rdi
  40cf42:	test   %rdi,%rdi
  40cf45:	je     40cf57 <_ZZ4mainENKUljE_clEj+0x2397>
  40cf47:	mov    0x2250(%rsp),%rsi
  40cf4f:	sub    %rdi,%rsi
  40cf52:	call   40dfb0 <_ZdlPvm>
  40cf57:	mov    0xd0(%rsp),%rdi
  40cf5f:	test   %rdi,%rdi
  40cf62:	je     40cf74 <_ZZ4mainENKUljE_clEj+0x23b4>
  40cf64:	mov    0xe0(%rsp),%rsi
  40cf6c:	sub    %rdi,%rsi
  40cf6f:	call   40dfb0 <_ZdlPvm>
  40cf74:	mov    0xb8(%rsp),%rdi
  40cf7c:	test   %rdi,%rdi
  40cf7f:	je     40cf91 <_ZZ4mainENKUljE_clEj+0x23d1>
  40cf81:	mov    0xc8(%rsp),%rsi
  40cf89:	sub    %rdi,%rsi
  40cf8c:	call   40dfb0 <_ZdlPvm>
  40cf91:	add    $0x4418,%rsp
  40cf98:	pop    %rbx
  40cf99:	pop    %rbp
  40cf9a:	pop    %r12
  40cf9c:	pop    %r13
  40cf9e:	pop    %r14
  40cfa0:	pop    %r15
  40cfa2:	ret
  40cfa3:	mov    $0x10,%edx
  40cfa8:	add    %eax,%eax
  40cfaa:	cmp    %edx,%eax
  40cfac:	cmovb  %edx,%eax
  40cfaf:	lea    0x0(,%rax,4),%esi
  40cfb6:	mov    %eax,0x1fc(%rsp)
  40cfbd:	call   442b00 <__libc_realloc>
  40cfc2:	pcmpeqd %xmm0,%xmm0
  40cfc6:	mov    %rax,0x1f0(%rsp)
  40cfce:	mov    %rax,%rdi
  40cfd1:	mov    0x1f8(%rsp),%eax
  40cfd8:	jmp    40b1c7 <_ZZ4mainENKUljE_clEj+0x607>
  40cfdd:	mov    $0x10,%edx
  40cfe2:	add    %eax,%eax
  40cfe4:	cmp    %edx,%eax
  40cfe6:	cmovb  %edx,%eax
  40cfe9:	lea    0x0(,%rax,4),%esi
  40cff0:	mov    %eax,0x23ac(%rsp)
  40cff7:	call   442b00 <__libc_realloc>
  40cffc:	pcmpeqd %xmm0,%xmm0
  40d000:	mov    %rax,0x23a0(%rsp)
  40d008:	mov    %rax,%rdi
  40d00b:	mov    0x23a8(%rsp),%eax
  40d012:	jmp    40b347 <_ZZ4mainENKUljE_clEj+0x787>
  40d017:	mov    0x10ac8(%r13),%r12
  40d01e:	mov    0x10ad0(%r13),%r14
  40d025:	mov    0x10ac0(%r13),%rbp
  40d02c:	cmp    %r14,%r12
  40d02f:	je     40d40b <_ZZ4mainENKUljE_clEj+0x284b>
  40d035:	mov    0x6c(%rsp),%eax
  40d039:	lea    0x10(%r12),%r15
  40d03e:	movq   $0x0,(%r12)
  40d046:	xor    %esi,%esi
  40d048:	mov    %eax,0x8(%r12)
  40d04d:	mov    %r15,0x10ac8(%r13)
  40d054:	mov    %r15,%rdx
  40d057:	sub    %rbp,%rdx
  40d05a:	mov    %rdx,%rcx
  40d05d:	lea    -0x10(%rbp,%rdx,1),%rax
  40d062:	sar    $0x4,%rcx
  40d066:	lea    -0x1(%rcx),%rdi
  40d06a:	sub    $0x2,%rcx
  40d06e:	sar    $1,%rcx
  40d071:	test   %rdi,%rdi
  40d074:	jle    40d09b <_ZZ4mainENKUljE_clEj+0x24db>
  40d076:	mov    %rcx,%rax
  40d079:	shl    $0x4,%rax
  40d07d:	add    %rbp,%rax
  40d080:	mov    (%rax),%r9
  40d083:	cmp    %r9,%rsi
  40d086:	jb     40d0aa <_ZZ4mainENKUljE_clEj+0x24ea>
  40d088:	cmp    %rsi,%r9
  40d08b:	je     40d28d <_ZZ4mainENKUljE_clEj+0x26cd>
  40d091:	mov    %rdi,%rax
  40d094:	shl    $0x4,%rax
  40d098:	add    %rbp,%rax
  40d09b:	mov    %rsi,(%rax)
  40d09e:	mov    0x6c(%rsp),%esi
  40d0a2:	mov    %esi,0x8(%rax)
  40d0a5:	jmp    40c1fe <_ZZ4mainENKUljE_clEj+0x163e>
  40d0aa:	mov    0x8(%rax),%r8d
  40d0ae:	lea    -0x1(%rcx),%rdx
  40d0b2:	shl    $0x4,%rdi
  40d0b6:	shr    $0x3f,%rdx
  40d0ba:	mov    %r9,0x0(%rbp,%rdi,1)
  40d0bf:	mov    %r8d,0x8(%rbp,%rdi,1)
  40d0c4:	lea    -0x1(%rdx,%rcx,1),%rdx
  40d0c9:	mov    %rcx,%rdi
  40d0cc:	test   %rcx,%rcx
  40d0cf:	je     40d09b <_ZZ4mainENKUljE_clEj+0x24db>
  40d0d1:	sar    $1,%rdx
  40d0d4:	mov    %rdx,%rcx
  40d0d7:	jmp    40d076 <_ZZ4mainENKUljE_clEj+0x24b6>
  40d0d9:	mov    0x8558(%r13),%rbp
  40d0e0:	mov    0x8560(%r13),%r14
  40d0e7:	mov    0x8550(%r13),%r12
  40d0ee:	cmp    %r14,%rbp
  40d0f1:	je     40d325 <_ZZ4mainENKUljE_clEj+0x2765>
  40d0f7:	mov    0x78(%rsp),%eax
  40d0fb:	lea    0x10(%rbp),%r15
  40d0ff:	movq   $0x0,0x0(%rbp)
  40d107:	xor    %esi,%esi
  40d109:	mov    %eax,0x8(%rbp)
  40d10c:	mov    %r15,0x8558(%r13)
  40d113:	mov    %r15,%rax
  40d116:	sub    %r12,%rax
  40d119:	mov    %rax,%rcx
  40d11c:	lea    -0x10(%r12,%rax,1),%rax
  40d121:	sar    $0x4,%rcx
  40d125:	lea    -0x1(%rcx),%rdx
  40d129:	sub    $0x2,%rcx
  40d12d:	sar    $1,%rcx
  40d130:	test   %rdx,%rdx
  40d133:	jle    40d15a <_ZZ4mainENKUljE_clEj+0x259a>
  40d135:	mov    %rcx,%rax
  40d138:	shl    $0x4,%rax
  40d13c:	add    %r12,%rax
  40d13f:	mov    (%rax),%r8
  40d142:	cmp    %r8,%rsi
  40d145:	jb     40d169 <_ZZ4mainENKUljE_clEj+0x25a9>
  40d147:	cmp    %rsi,%r8
  40d14a:	je     40d27b <_ZZ4mainENKUljE_clEj+0x26bb>
  40d150:	mov    %rdx,%rax
  40d153:	shl    $0x4,%rax
  40d157:	add    %r12,%rax
  40d15a:	mov    %rsi,(%rax)
  40d15d:	mov    0x78(%rsp),%esi
  40d161:	mov    %esi,0x8(%rax)
  40d164:	jmp    40c07b <_ZZ4mainENKUljE_clEj+0x14bb>
  40d169:	mov    0x8(%rax),%edi
  40d16c:	shl    $0x4,%rdx
  40d170:	mov    %edi,0x8(%r12,%rdx,1)
  40d175:	lea    -0x1(%rcx),%rdi
  40d179:	shr    $0x3f,%rdi
  40d17d:	mov    %r8,(%r12,%rdx,1)
  40d181:	mov    %rcx,%rdx
  40d184:	lea    -0x1(%rcx,%rdi,1),%rdi
  40d189:	test   %rcx,%rcx
  40d18c:	je     40d15a <_ZZ4mainENKUljE_clEj+0x259a>
  40d18e:	sar    $1,%rdi
  40d191:	mov    %rdi,%rcx
  40d194:	jmp    40d135 <_ZZ4mainENKUljE_clEj+0x2575>
  40d196:	mov    0x8598(%r13),%rdx
  40d19d:	sub    0x8590(%r13),%rdx
  40d1a4:	shl    $0x8,%rdx
  40d1a8:	movdqa 0xaf220(%rip),%xmm1        # 4bc3d0 <max.0+0x30>
  40d1b0:	add    0x85a8(%r13),%rdx
  40d1b7:	mov    %rdx,%rax
  40d1ba:	lea    0x400(%rdx),%rdi
  40d1c1:	movups %xmm1,(%rax)
  40d1c4:	add    $0x20,%rax
  40d1c8:	movups %xmm1,-0x10(%rax)
  40d1cc:	cmp    %rdi,%rax
  40d1cf:	jne    40d1c1 <_ZZ4mainENKUljE_clEj+0x2601>
  40d1d1:	mov    %rdx,(%rsi)
  40d1d4:	lea    0xb0(%rsp),%rax
  40d1dc:	lea    0xa8(%rsp),%rsi
  40d1e4:	lea    0x8590(%r13),%rdi
  40d1eb:	mov    %ecx,0xa8(%rsp)
  40d1f2:	mov    %rax,0x60(%rsp)
  40d1f7:	call   4080f0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40d1fc:	mov    0x8578(%r13),%rax
  40d203:	pcmpeqd %xmm0,%xmm0
  40d207:	mov    (%rax,%rbp,8),%rax
  40d20b:	jmp    40c19f <_ZZ4mainENKUljE_clEj+0x15df>
  40d210:	mov    0x28(%r13),%rdx
  40d214:	sub    0x20(%r13),%rdx
  40d218:	shl    $0x8,%rdx
  40d21c:	movdqa 0xaf1ac(%rip),%xmm1        # 4bc3d0 <max.0+0x30>
  40d224:	add    0x38(%r13),%rdx
  40d228:	mov    %rdx,%rax
  40d22b:	lea    0x400(%rdx),%rdi
  40d232:	movups %xmm1,(%rax)
  40d235:	add    $0x20,%rax
  40d239:	movups %xmm1,-0x10(%rax)
  40d23d:	cmp    %rax,%rdi
  40d240:	jne    40d232 <_ZZ4mainENKUljE_clEj+0x2672>
  40d242:	mov    %rdx,(%rsi)
  40d245:	lea    0xb0(%rsp),%rax
  40d24d:	lea    0xa4(%rsp),%rsi
  40d255:	lea    0x20(%r13),%rdi
  40d259:	mov    %ecx,0xa4(%rsp)
  40d260:	mov    %rax,0x60(%rsp)
  40d265:	call   4080f0 <_ZNSt6vectorIjSaIjEE12emplace_backIJjEEERjDpOT_.isra.0>
  40d26a:	mov    0x8(%r13),%rax
  40d26e:	pcmpeqd %xmm0,%xmm0
  40d272:	mov    (%rax,%rbp,8),%rax
  40d276:	jmp    40c01c <_ZZ4mainENKUljE_clEj+0x145c>
  40d27b:	mov    0x8(%rax),%edi
  40d27e:	cmp    %edi,0x78(%rsp)
  40d282:	jb     40d16c <_ZZ4mainENKUljE_clEj+0x25ac>
  40d288:	jmp    40d150 <_ZZ4mainENKUljE_clEj+0x2590>
  40d28d:	mov    0x8(%rax),%r8d
  40d291:	cmp    %r8d,0x6c(%rsp)
  40d296:	jb     40d0ae <_ZZ4mainENKUljE_clEj+0x24ee>
  40d29c:	jmp    40d091 <_ZZ4mainENKUljE_clEj+0x24d1>
  40d2a1:	mov    $0x10,%edx
  40d2a6:	add    %eax,%eax
  40d2a8:	cmp    %edx,%eax
  40d2aa:	cmovb  %edx,%eax
  40d2ad:	mov    %eax,0x89bc(%r13)
  40d2b4:	lea    0x0(,%rax,4),%esi
  40d2bb:	call   442b00 <__libc_realloc>
  40d2c0:	pcmpeqd %xmm0,%xmm0
  40d2c4:	mov    %rax,0x89b0(%r13)
  40d2cb:	mov    %rax,%rdi
  40d2ce:	mov    0x89b8(%r13),%eax
  40d2d5:	jmp    40c1df <_ZZ4mainENKUljE_clEj+0x161f>
  40d2da:	mov    $0x10,%edx
  40d2df:	add    %eax,%eax
  40d2e1:	cmp    %edx,%eax
  40d2e3:	cmovb  %edx,%eax
  40d2e6:	mov    %eax,0x44c(%r13)
  40d2ed:	lea    0x0(,%rax,4),%esi
  40d2f4:	call   442b00 <__libc_realloc>
  40d2f9:	pcmpeqd %xmm0,%xmm0
  40d2fd:	mov    %rax,0x440(%r13)
  40d304:	mov    %rax,%rdi
  40d307:	mov    0x448(%r13),%eax
  40d30e:	jmp    40c05c <_ZZ4mainENKUljE_clEj+0x149c>
  40d313:	lea    0xf0(%rsp),%rax
  40d31b:	mov    %rax,0x18(%rsp)
  40d320:	jmp    40ac7a <_ZZ4mainENKUljE_clEj+0xba>
  40d325:	movabs $0x7ffffffffffffff,%rdx
  40d32f:	mov    %rbp,%r15
  40d332:	sub    %r12,%r15
  40d335:	mov    %r15,%rax
  40d338:	sar    $0x4,%rax
  40d33c:	cmp    %rdx,%rax
  40d33f:	je     401220 <_ZZ4mainENKUljE_clEj.cold+0x78>
  40d345:	test   %rax,%rax
  40d348:	mov    $0x1,%ebx
  40d34d:	cmovne %rax,%rbx
  40d351:	add    %rax,%rbx
  40d354:	movabs $0x7ffffffffffffff,%rax
  40d35e:	cmp    %rax,%rbx
  40d361:	cmova  %rax,%rbx
  40d365:	lea    0xb0(%rsp),%rax
  40d36d:	mov    %rax,0x60(%rsp)
  40d372:	shl    $0x4,%rbx
  40d376:	mov    %rbx,%rdi
  40d379:	call   40e080 <_Znwm>
  40d37e:	mov    0x78(%rsp),%esi
  40d382:	cmp    %r12,%rbp
  40d385:	movq   $0x0,(%rax,%r15,1)
  40d38d:	pcmpeqd %xmm0,%xmm0
  40d391:	mov    %esi,0x8(%rax,%r15,1)
  40d396:	je     40d4f7 <_ZZ4mainENKUljE_clEj+0x2937>
  40d39c:	mov    %rax,%rcx
  40d39f:	mov    %r12,%rdx
  40d3a2:	movdqu (%rdx),%xmm1
  40d3a6:	add    $0x10,%rdx
  40d3aa:	add    $0x10,%rcx
  40d3ae:	movups %xmm1,-0x10(%rcx)
  40d3b2:	cmp    %rdx,%rbp
  40d3b5:	jne    40d3a2 <_ZZ4mainENKUljE_clEj+0x27e2>
  40d3b7:	sub    %r12,%rbp
  40d3ba:	add    %rax,%rbp
  40d3bd:	lea    0x10(%rbp),%r15
  40d3c1:	test   %r12,%r12
  40d3c4:	je     40d3e0 <_ZZ4mainENKUljE_clEj+0x2820>
  40d3c6:	mov    %r14,%rsi
  40d3c9:	mov    %r12,%rdi
  40d3cc:	mov    %rax,(%rsp)
  40d3d0:	sub    %r12,%rsi
  40d3d3:	call   40dfb0 <_ZdlPvm>
  40d3d8:	mov    (%rsp),%rax
  40d3dc:	pcmpeqd %xmm0,%xmm0
  40d3e0:	mov    0x8(%rbp),%esi
  40d3e3:	add    %rax,%rbx
  40d3e6:	mov    %rax,0x8550(%r13)
  40d3ed:	mov    %rax,%r12
  40d3f0:	mov    %r15,0x8558(%r13)
  40d3f7:	mov    %esi,0x78(%rsp)
  40d3fb:	mov    0x0(%rbp),%rsi
  40d3ff:	mov    %rbx,0x8560(%r13)
  40d406:	jmp    40d113 <_ZZ4mainENKUljE_clEj+0x2553>
  40d40b:	movabs $0x7ffffffffffffff,%rdx
  40d415:	mov    %r12,%r15
  40d418:	sub    %rbp,%r15
  40d41b:	mov    %r15,%rax
  40d41e:	sar    $0x4,%rax
  40d422:	cmp    %rdx,%rax
  40d425:	je     401237 <_ZZ4mainENKUljE_clEj.cold+0x8f>
  40d42b:	test   %rax,%rax
  40d42e:	mov    $0x1,%ebx
  40d433:	cmovne %rax,%rbx
  40d437:	add    %rax,%rbx
  40d43a:	movabs $0x7ffffffffffffff,%rax
  40d444:	cmp    %rax,%rbx
  40d447:	cmova  %rax,%rbx
  40d44b:	lea    0xb0(%rsp),%rax
  40d453:	mov    %rax,0x60(%rsp)
  40d458:	shl    $0x4,%rbx
  40d45c:	mov    %rbx,%rdi
  40d45f:	call   40e080 <_Znwm>
  40d464:	movq   $0x0,(%rax,%r15,1)
  40d46c:	mov    %rax,%rcx
  40d46f:	mov    0x6c(%rsp),%eax
  40d473:	cmp    %rbp,%r12
  40d476:	pcmpeqd %xmm0,%xmm0
  40d47a:	mov    %eax,0x8(%rcx,%r15,1)
  40d47f:	je     40d4ff <_ZZ4mainENKUljE_clEj+0x293f>
  40d481:	mov    %rcx,%rdx
  40d484:	mov    %rbp,%rax
  40d487:	movdqu (%rax),%xmm1
  40d48b:	add    $0x10,%rax
  40d48f:	add    $0x10,%rdx
  40d493:	movups %xmm1,-0x10(%rdx)
  40d497:	cmp    %rax,%r12
  40d49a:	jne    40d487 <_ZZ4mainENKUljE_clEj+0x28c7>
  40d49c:	mov    %r12,%rax
  40d49f:	sub    %rbp,%rax
  40d4a2:	lea    (%rcx,%rax,1),%r12
  40d4a6:	lea    0x10(%r12),%r15
  40d4ab:	test   %rbp,%rbp
  40d4ae:	je     40d4ca <_ZZ4mainENKUljE_clEj+0x290a>
  40d4b0:	mov    %r14,%rsi
  40d4b3:	mov    %rbp,%rdi
  40d4b6:	mov    %rcx,(%rsp)
  40d4ba:	sub    %rbp,%rsi
  40d4bd:	call   40dfb0 <_ZdlPvm>
  40d4c2:	mov    (%rsp),%rcx
  40d4c6:	pcmpeqd %xmm0,%xmm0
  40d4ca:	mov    0x8(%r12),%eax
  40d4cf:	add    %rcx,%rbx
  40d4d2:	mov    (%r12),%rsi
  40d4d6:	mov    %rcx,%rbp
  40d4d9:	mov    %rcx,0x10ac0(%r13)
  40d4e0:	mov    %r15,0x10ac8(%r13)
  40d4e7:	mov    %rbx,0x10ad0(%r13)
  40d4ee:	mov    %eax,0x6c(%rsp)
  40d4f2:	jmp    40d054 <_ZZ4mainENKUljE_clEj+0x2494>
  40d4f7:	mov    %rax,%rbp
  40d4fa:	jmp    40d3bd <_ZZ4mainENKUljE_clEj+0x27fd>
  40d4ff:	mov    %rcx,%r12
  40d502:	jmp    40d4a6 <_ZZ4mainENKUljE_clEj+0x28e6>
  40d504:	mov    %rax,%rbx
  40d507:	jmp    4011a8 <_ZZ4mainENKUljE_clEj.cold>
  40d50c:	mov    %rax,%rbx
  40d50f:	jmp    40120b <_ZZ4mainENKUljE_clEj.cold+0x63>
  40d514:	jmp    40124e <_ZZ4mainENKUljE_clEj.cold+0xa6>
  40d519:	mov    %rax,%rbx
  40d51c:	jmp    4011d2 <_ZZ4mainENKUljE_clEj.cold+0x2a>

Disassembly of section .fini:
