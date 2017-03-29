
#!/bin/sh
pagesNotFound=0
pagesOK=0

while read DOCSITE; do
    response=$(curl -sL -w "%{http_code} %{url_effective}\\n" -I "$DOCSITE" -o /dev/null --cookie cookies.txt | tee -a autotoc.txt)
    echo $response
    if [[ $response = \2* ]]; then
        pagesOK=$(($pagesOK + 1))
    else
        if [[ $response = \4* ]]; then
            pagesNotFound=$(($pagesNotFound + 1))
        fi
    fi
done < azuretoc.txt

echo Pages that are OK: $pagesOK\\n
echo Pages that are missing: $pagesNotFound\\n

echo Scan completed!