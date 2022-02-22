import hashlib


def search_subs(s: str) -> int:
    assert len(s) > 0, 'Строка не может быть пустой'

    res = []
    start = 0
    for j in range(len(s)):
        end = len(s)
        while start < end:
            subs = s[start:end]
            len_sub = len(subs)
            h_subs = hashlib.sha1(subs.encode('utf-8')).hexdigest()

            for i in range(len(s) - len_sub + 1):
                if h_subs == hashlib.sha1(s[i:i + len_sub].encode('utf-8')).hexdigest():
                    if h_subs not in res and subs != s:
                        res.append(h_subs)

            end -= 1
        start += 1

    return len(res)


text = input("Введите строку состоящую только из строчных латинских букв: ")
number = search_subs(text)

print(f'{number} подстрок в вашей строке')
