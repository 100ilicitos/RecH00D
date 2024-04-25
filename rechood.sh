#!/bin/bash
#
# RECH00D.SH

DOMAIN=$1

if [ $# -eq 0 ]
  then
    echo "#### RECHOOD.SH ####"
    echo "------ by: H00D"
    echo "Usage: ./rechood.sh domain.com"
    echo ""
else
    echo "## RECH00D.SH STARTING ##"
    echo "You can go for lunch or dinner, it will take a while! :P"
    assetfinder -subs-only $DOMAIN  > domains_asset
    amass enum -d $DOMAIN -passive  > domains_amass_passive
    amass enum -d $DOMAIN -active -brute -w /usr/share/seclists/Discovery/DNS/deepmagic.com-prefixes-top50000.txt  > domains_amass_active
    subfinder -d $DOMAIN  > domains_sub
    findomain -t $DOMAIN  > domains_find
    echo "$DOMAIN"  haktrails subdomains  > domains_hak
    cat domains*  > dominioTotal.txt
    amass enum -nf dominioTotal.txt -passive  > domains_amass_passive2
    amass enum -nf dominioTotal.txt -active -brute -w /usr/share/seclists/Discovery/DNS/deepmagic.com-prefixes-top50000.txt > domains_amass_active_2
    cat domains_amass_passive2 domains_amass_active_2  > domainsTotal2
    cat domainsTotal2  haktrails subdomains  > domains_hak2
    cat dominioTotal.txt domainsTotal2 domains_hak2  > webTotal
fi
