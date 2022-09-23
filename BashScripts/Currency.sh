#!/bin/bash
clear

echo "Получение данных о курсах с сайта myfin.by"
wget -qO- https://myfin.by/currency/minsk | sed -e 's/<[^>]*>/ /g' > /tmp/currency_file.txt
echo "Данные получены."
echo 
echo "Выберите валюту для получения текущего курса:"

select Curr in 'Доллар США' 'Евро' 'Российский рубль' 'Польский злотый' 'Гривна' '== Выход =='
do

    if [[ "$Curr" == "== Выход ==" ]]
        then
            break
    elif [[ -z "$Curr" ]]
        then
        echo -e "\nПовторите выбор вылюты\n"
        continue
    fi

    cmd="sed -En 's/(($Curr)\s+([0-9]+)?(\s+[0-9]+(\.[0-9]+)?\s+){3,4})/\n===\1 \4\n/gp' /tmp/currency_file.txt | grep === | sed -En 's/===([а-яА-Я]+(\s[а-яА-Я]+)?)(\s{3}?)(([0-9]+)?).+\s+([0-9]+(\.[0-9]+)?)/\4;\6/gp'"
    
    res=`eval "$cmd"`

    #put result into array(2)
    # 0 - factor 
    # 1 - current exchange rate
    IFS=';' read -ra ResultCurrency <<< "$res"

    factor=${ResultCurrency[0]}
    
    if [[ $factor -gt 0 ]]
        then
        
        #make div "current exchange rate" with round  
        cmd="echo \"${ResultCurrency[1]}/$factor\" | bc -l | xargs printf ""%0.6f"""
        value=`eval "$cmd"`

        else 
        cmd="echo \"${ResultCurrency[1]}\" | bc -l | xargs printf ""%0.6f"""
        #value=${ResultCurrency[1]}
        value=`eval "$cmd"`
    fi


    echo -e "\n$Curr=$value руб. по курсу НБ РБ\n"
    
done


rm /tmp/currency_file.txt