#Requires AutoHotkey v2.0

/* Useful Symbols
Reminder from the docs:

Hotstrings Options
*               An ending character (e.g. Space, ., or Enter) is not required to trigger the hotstring.

?               The hotstring will be triggered even when it is inside another word.
?0 (default)    Reverts to the default behavior: the hotstring must be separate from other text.

B  (default)    Automatic backspacing is done to erase the abbreviation you type.
B0              Turn automatic backspacing off.

C               The hotstring will be case sensitive. That is, it will only be triggered when you type the abbreviation exactly as it appears in the script.
C0 (default)    Use case-conforming hotstrings. That is, the case of the letters in the expansion will be the same as the case of the letters in the abbreviation.
C1              Do not conform to typed case and use case insensitive matching. The expansion will retain the case of the letters in the script

Kn              Set the delay between keystrokes produced by auto-backspacing or auto-replacement. Use n to specify the number of milliseconds. Specify K-1 to have no delay at all.

O               Omit the ending character of auto-replace hotstrings when the replacement is produced. For example, typying a space to trigger the hotstring will not result in an extra space at the end of the replacement.

Pn              The priority of the hotstring (e.g. P1). This rarely-used option has no effect on auto-replace hotstrings.

R               Send the replacement text raw; that is, without translating {Enter} to Enter, ^c to Ctrl+C, etc.
R0 (default)    Translate the keys in the replacement text to keystrokes.

S               Make the hotstring exempt from Suspend.
S0 (default)    Allows the hotspring to be suspended.

SI              Sets the method by which auto-replace hotstrings send their keystrokes to SendInput.
SP              Sets the method by which auto-replace hotstrings send their keystrokes to SendPlay.
SE              Sets the method by which auto-replace hotstrings send their keystrokes to SendEvent.

T               Send the replacement text using Text mode.
T0 (default)    Turn off Text mode.

X               Execute. Instead of replacement text, the hotstring accepts a function call or expression to execute.

Z               Resets the hotstring recognizer after each triggering of the hotstring.
*/

; Math
>!NumpadMult::×
>!NumpadDiv::÷
>!,::≤
:*:(<=)::≤
:*:(=<)::≤
>!.::≥
:*:(>=)::≥
:*:(=>)::≥
>!=::≠
:*:(!=)::≠
>!~::≈
:*:(~=)::≈
>!i::∞
:*:(inf)::∞
>!-::—
>!+=::±
:*:(+-)::±
:*:(sqrt)::√
:*:(1/2)::½
:*:(0/3)::↉
:*:(1/3)::⅓
:*:(2/3)::⅔
:*:(1/4)::¼
:*:(3/4)::¾
:*:(1/5)::⅕
:*:(2/5)::⅖
:*:(3/5)::⅗
:*:(4/5)::⅘
:*:(1/6)::⅙
:*:(5/6)::⅚
:*:(1/7)::⅐
:*:(1/8)::⅛
:*:(3/8)::⅜
:*:(5/8)::⅝
:*:(7/8)::⅞
:*:(1/9)::⅑
:*:(1/10)::⅒
:*:(1/)::⅟


; Greek letters
:*C:(Alpha)::Α
:*C:(alpha)::α
:*C:(Beta)::Β
:*C:(beta)::β
:*C:(Gamma)::Γ
:*C:(gamma)::γ
:*C:(Delta)::Δ
:*C:(delta)::δ
:*C:(Epsilon)::Ε
:*C:(epsilon)::ε
:*C:(Zeta)::Ζ
:*C:(zeta)::ζ
:*C:(Eta)::Η
:*C:(eta)::η
:*C:(Theta)::Θ
:*C:(theta)::θ
:*C:(Iota)::Ι
:*C:(iota)::ι
:*C:(Kappa)::Κ
:*C:(kappa)::κ
:*C:(Lambda)::Λ
:*C:(lambda)::λ
:*C:(Mu)::Μ
:*C:(mu)::μ
>!u::µ
:*C:(Nu)::Ν
:*C:(nu)::ν
:*C:(Xi)::Ξ
:*C:(xi)::ξ
:*C:(Omicron)::Ο
:*C:(omicron)::ο
:*C:(Pi)::Π
:*C:(pi)::π
:*C:(Rho)::Ρ
:*C:(rho)::ρ
:*C:(Sigma)::Σ
:*C:(sigma)::σ
:*C:(Tau)::Τ
:*C:(tau)::τ
:*C:(Upsilon)::Υ
:*C:(upsilon)::υ
:*C:(Phi)::Φ
:*C:(phi)::φ
:*C:(Chi)::Χ
:*C:(chi)::χ
:*C:(Psi)::Ψ
:*C:(psi)::ψ
:*C:(Omega)::Ω
:*C:(omega)::ω


; Arrows
>!Left::←
>!Right::→
>!Up::↑
>!Down::↓


; Gender
:*:(male)::♂
:*:(female)::♀
:*:(trans)::⚦
:*:(hetero)::⚤
:*:(gay)::⚣
:*:(lesbian)::⚢
:*:(bisexual)::⚥


; Intellectual property
:*:(c)::©
:*:(r)::®
:*:(p)::℗
:*:(tm)::™
:*:(sm)::℠


; Punctuation
:*:(***)::⁂ ; Asterism
:*:(?!)::‽ ; Interrobang
:*:(??)::¿ ; Inverted question mark
:*:(!!)::¡ ; Inverted exclamation mark
:*:(?)::⸮ ; Irony mark
:*:(...)::… ; Ellipsis


; Currency symbols
:*:(baht)::฿
:*:(btc)::₿
:*:(cent)::¢
:*:(dollar)::$
:*:(euro)::€
:*:(guarani)::₲
:*:(pound)::£
:*:(ruble)::₽
:*:(rupee)::₹
:*:(won)::₩
:*:(yen)::¥


; Others
:*:(numero)::№
:*:(_a)::ª
:*:(_o)::º
:*:(o)::°
:*:(deg)::°
:*:(%%)::‰ ; Per mille
:*:(%%%)::‱ ; Per ten thousand
:*:(/o)::ø
:O:<<::«
:O:>>::»

:*B0:¨Y::{Backspace}{Backspace}Ÿ

:*:(heart)::♥
:*:(heart2)::❤

:*:(note)::♪
:*:(note)::♫
