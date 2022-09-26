#!/bin/bash

cd /tmp/

#read Credentials for login data
file="/mnt/d/TechMeSkills/github-files/tms22/Credentials/instr-by"
USERNAME=$(head -1 "$file")
USERPWD=$(tail -1 "$file")

echo
echo "================ login on site github.com =================="
echo

# also save cookie to file ccc.txt
cmd="curl --cookie-jar ccc.txt 'https://github.com/session'   -H 'authority: github.com'   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'accept-language: ru-BY,ru;q=0.9'   -H 'cache-control: max-age=0'   -H 'content-type: application/x-www-form-urlencoded'   -H 'cookie: _octo=GH1.1.1254133433.1663955555; logged_in=no; _device_id=e5cb514d1ddd13c58768d856abf65caa; _gh_sess=W607hJxlOUgULvWUimbbN9OX%2BijF%2BH3eCawgsR0PWmK9X8NE1rc1K2skkq%2F4qU4kJdk1hmlC%2BaM953CL65XyyLqVwwLiJiPUeOwQ0T4QfGWStB9VP9NaQMhQZHDNnENQOdTKsQ%2FkYEHZS5jIXN%2FEwxidB%2FZckgka2bujJDs%2Bk8fvXRnMNMAaNztmm%2B%2BV8etE%2BGeSe%2BbH4YaSgYouAwbfNUxBc%2Bn%2FOx334Lp34yllHSZ%2B8%2FsAYOtwu%2FJZN4uyKfMo%2FGVFTpYYGFT2UOr9wZJ5YoG%2F%2B3OuKupi4tjydaJedhCHqp1W--S6pK%2BeWQhGPBc%2BDE--iNJv3AbNAWmflNwwux8ghg%3D%3D; preferred_color_mode=dark; tz=Europe%2FMinsk'   -H 'origin: https://github.com'   -H 'referer: https://github.com/login'   -H 'sec-ch-ua-mobile: ?0'   -H 'sec-fetch-dest: document'   -H 'sec-fetch-mode: navigate'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-user: ?1'   -H 'upgrade-insecure-requests: 1'   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36'   --data-raw 'commit=Sign+in&authenticity_token=w3KZslBjO5cor4NSJP7BqlRYadXujGjhcMqHnRkEaLhEKpJKKvNaRzCSNMD7L1K1CdRh32p9T_1REY_k5SZ4bA&login=$USERNAME&password=$USERPWD&trusted_device=&webauthn-support=supported&webauthn-iuvpaa-support=unsupported&return_to=https%3A%2F%2Fgithub.com%2Flogin&allow_signup=&client_id=&integration=&required_field_9960=&timestamp=1663955556083&timestamp_secret=8e9dabd900da2adb7a5ab378f90723d49ca8e1b258b83354625ad99c6b2136f6'   --compressed"

eval "$cmd"

echo
echo "============= get data after login =============="
echo

# use cookie file to make next curl
curl --cookie ccc.txt 'https://github.com/pulls' >my-pulls.html

echo
echo "================== parse data ==================="
echo

# parce name of curent open pull requests
sed -En 's/\/ec49ce\/tms22\/pull\/[0-9]+">([ \.a-zA-Z0-9\-]+)/\n\n====\1\n\n/gp' my-pulls.html | sed -En 's/====([ \.a-zA-Z0-9\-]+)/\1/gp'

echo
echo "===================== end ======================="
echo

#remove cookie file
rm ccc.txt

rm my-pulls.html
