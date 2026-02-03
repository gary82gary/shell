#!/bin/sh
#TWGCB檢測腳本
# ==============================================================================
# [Copyright Statement / Privacy & Disclaimer]
# ------------------------------------------------------------------------------
# Copyright © 2026 Individual Work. All rights reserved.
# This script is an original work developed for security auditing purposes.
# Unauthorized commercial distribution or modification for resale is prohibited.
# 1. Privacy: This tool performs local analysis only. No system data, 
#    configurations, or logs are transmitted to any external servers.
# 2. Disclaimer: This script is provided "as-is" without warranty of any kind. 
#    The author is not responsible for any system instability, service 
#    disruption, or data loss resulting from the use of this tool.
# 3. Caution: Auto-fix features modify system files; use at your own risk.
# ==============================================================================
# [著作權聲明 / 隱私與免責聲明]
# ------------------------------------------------------------------------------
# 著作權所有 © 2026 個人開發作品。保留所有權利。
# 本腳本為出於資安稽核目的開發之原創作品。
# 未經授權禁止將本腳本用於商業轉售、修改後牟利或未經許可的散布。
# 1. 隱私承諾：本工具僅執行在地化分析。任何系統資訊、組態或紀錄皆不會傳送至
#    任何外部伺服器。
# 2. 免責聲明：本腳本按「現狀」提供，不附帶任何形式的保證。作者不對因使用
#    本工具而導致的系統不穩定、服務中斷或資料損失負任何賠償責任。
# 3. 注意事項：自動修復功能會更動系統檔案，執行風險由使用者自行承擔。
# ==============================================================================
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
ULG='\e[4;1;32m'
WHITE='\e[1;37m'
NC='\e[0m'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"


tput clear
trap ctrl_c INT

function ctrl_c() {
        echo "**You pressed Ctrl+C...Exiting"
        exit 0;
}
show_menu(){

normal=`echo "\033[m"`
menu=`echo "\033[36m"` #Blue
number=`echo "\033[33m"` #yellow
bgred=`echo "\033[41m"`
fgred=`echo "\033[31m"`
	
echo "########################################################################"
echo "########################################################################"
echo "                                                                      ## ";
echo "        _____ _               _       _____   _____  ____             ## ";
echo "       / ____| |             | |     / ____| / ____||  _ \            ## ";
echo "      | |    | |__   ___  ___| | __ | |  __|| |     | |_) |           ## ";
echo "      | |    | '_ \ / _ \/ __| |/ / | | |_ || |     |  _ <            ## ";
echo "      | |____| | | |  __/ (__|   <  | |__| || |____ | |_) |           ## ";
echo "       \_____|_| |_|\___|\___|_|\_\  \_____| \_____||____/  ...       ## ";
echo "                                                                      ## ";
echo "                                                                      ## ";
echo "########################################################################"
echo "GCB Security Compliance Auditor & Hardening Tool"
echo "############################################################################"
echo -e "${LIGHTGRAY}[Note] This script aims to automate the analysis of whether the system environment conforms to the Government Configuration Baseline (GCB)."
echo -e "${LIGHTGRAY}[Function] Supports automated missing detection, configuration hardening suggestions, and automatic repair of critical configuration files."
echo -e "${YELLOW}[NOTICE] Please ensure a backup exists before using auto-fix features.${NC}"
echo -e "${YELLOW}[Privileges] Some checks require root access. Please run as root or with sudo.${NC}"
echo -e "${CYAN}----------------------------------------------------------------${NC}"
echo "TW-GCB for RedHat Enterprise Linux"
printf "${menu}**${number} 7)  ${menu}TWGCB-04-007 Apache HTTP Server 2.4 GCB v1.2           (update:2025/05/21)\n"
printf "${menu}**${number} 7A) ${menu}TWGCB-04-007 Apache HTTP Server 2.4 GCB v1.2 AutoSetup (update:2025/05/21)(Testing Phase)\n"
printf "${menu}**${number} 8)  ${menu}TWGCB-01-008 RedHat Enterprise Linux 8 V1.3            (update:2025/12/23)\n"
printf "${menu}**${number} 8A) ${menu}TWGCB-01-008 RedHat Enterprise Linux 8 V1.3  AutoSetup (buliding)\n"
printf "${menu}**${number} 12) ${menu}TWGCB-01-012 RedHat Enterprise Linux 9 V1.2            (update:2025/12/23)\n"
printf "${menu}**${number} 12A)${menu}TWGCB-01-012 RedHat Enterprise Linux 9 V1.2  AutoSetup (update:2026/01/20)\n"


echo "############################################################################"
echo
printf "Please enter a menu option and enter or ${fgred}x to exit.? ${normal}"

    read opt
}

option_picked(){
    msgcolor=`echo "\033[01;31m"` # bold red
    normal=`echo "\033[00;00m"` # normal white
    message=${@:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

clear
show_menu
while [ $opt != '' ]
    do
    if [ $opt = '' ]; then
      exit;
    else
      case $opt in
        7) clear;
            option_picked "Option 1 Picked";
######################################################################################################
echo
echo "#########################################################################"
echo -e "\e[0;33m 7.TWGCB-04-007 Apache HTTP Server 2.4 GCB v1.2 (2025/04/28)/////// \e[0m"
echo "#########################################################################"
START=$(date +%s)
echo
echo "#########################################################################"
echo


#TWGCB-04-007-0001
 audit01=`httpd -M 2>/dev/null | grep log_config_module | grep -q "(shared)" && echo 0 || echo 1`
     if [ "$audit01" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0001 enabled log_config_module"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0001 need to be enabled log_config_module"
    fi
 #grep -r "mod_log_config.so" /etc/httpd/
 

 #TWGCB-04-007-0002
 audit01=`httpd -M 2>/dev/null | grep dav_module | grep -q "(shared)" && echo 0 || echo 1`
 audit02=`httpd -M 2>/dev/null | grep dav_fs_module | grep -q "(shared)" && echo 0 || echo 1`
     if [ "$audit01" == "1" ] && [ "$audit02" == "1" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0002 disabled dav_module and dav_fs_module"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0002 need to be disabled dav_module and dav_fs_module"
    fi
 

#grep -r "LoadModule.*dav" /etc/httpd/
# vi /etc/httpd/conf.modules.d/00-dav.conf
##LoadModule dav_module modules/mod_dav.so
##LoadModule dav_fs_module modules/mod_dav_fs.so
##LoadModule dav_lock_module modules/mod_dav_lock.so


#TWGCB-04-007-0003
 audit01=`httpd -M 2>/dev/null | grep status_module | grep -q "(shared)" && echo 0 || echo 1`
     if [ "$audit01" == "1" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0003 disabled mod_status"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0003 need to be disabled mod_status"
    fi
 #grep -r "mod_status.so" /etc/httpd/
#vi /etc/httpd/conf.modules.d/00-base.conf
 #LoadModule status_module modules/mod_status.so
 
 
 #TWGCB-04-007-0004
  audit01=`httpd -M 2>/dev/null | grep autoindex_module | grep -q "(shared)" && echo 0 || echo 1`
     if [ "$audit01" == "1" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0004 disabled mod_autoindex.so"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0004 need to be disabled mod_autoindex.so"
    fi

  #grep -r "mod_autoindex.so" /etc/httpd/
 
 
 #TWGCB-04-007-0005
 audit01=`httpd -M 2>/dev/null | grep -E 'proxy_|proxy_module' | grep -q "(shared)" && echo 0 || echo 1`
  if [ "$audit01" == "1" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0005 disabled proxy_module"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0005 need to be disabled all proxy_module"
    fi
 
 #grep -r "LoadModule.*proxy_" /etc/httpd/
 #vi /etc/httpd/conf.modules.d/10-proxy_h2.conf
 #LoadModule proxy_http2_module modules/mod_proxy_http2.so
 
 #vi /etc/httpd/conf.modules.d/00-proxy.conf
 ##LoadModule proxy_module modules/mod_proxy.so
 #LoadModule proxy_module modules/mod_proxy.so
#LoadModule proxy_ajp_module modules/mod_proxy_ajp.so
#LoadModule proxy_balancer_module modules/mod_proxy_balancer.so
#LoadModule proxy_connect_module modules/mod_proxy_connect.so
#LoadModule proxy_express_module modules/mod_proxy_express.so
#LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so
#LoadModule proxy_fdpass_module modules/mod_proxy_fdpass.so
#LoadModule proxy_ftp_module modules/mod_proxy_ftp.so
#LoadModule proxy_http_module modules/mod_proxy_http.so
##LoadModule proxy_hcheck_module modules/mod_proxy_hcheck.so
#LoadModule proxy_scgi_module modules/mod_proxy_scgi.so
##LoadModule proxy_uwsgi_module modules/mod_proxy_uwsgi.so
#LoadModule proxy_wstunnel_module modules/mod_proxy_wstunnel.so


 #TWGCB-04-007-0006
   audit01=`httpd -M 2>/dev/null | grep userdir_module | grep -q "(shared)" && echo 0 || echo 1`
   if [ "$audit01" == "1" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0006 disabled userdir_module"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0006 need to be disabled userdir_module"
    fi
 #grep -r "userdir_module" /etc/httpd/	
 #vi /etc/httpd/conf.modules.d/00-base.conf
 #LoadModule userdir_module modules/mod_userdir.so
 
 
 #TWGCB-04-007-0007
    audit01=`httpd -M 2>/dev/null | grep info_module | grep -q "(shared)" && echo 0 || echo 1`
    if [ "$audit01" == "1" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0007 disabled info_module"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0007 need to be disabled info_module"
    fi
 
  #grep -r "info_module" /etc/httpd/
 #vi /etc/httpd/conf.modules.d/00-base.conf
 #LoadModule info_module modules/mod_info.so
 
 
 #TWGCB-04-007-0008
 audit01=`id apache &>/dev/null && echo 0 || echo 1`
 audit02=`getent group apache &>/dev/null && echo 0 || echo 1`
 if [ "$audit01" == "0" ] && [ "$audit02" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0008 ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0008 fail"
    fi


#TWGCB-04-007-0009
audit01=`passwd -S apache | grep -q "LK" && echo 0 || echo 1`

  if [ "$audit01" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0009 ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0009 fail"
    fi
 
  #chsh -s /sbin/nologin apache

 
 #TWGCB-04-007-0010
 audit01=`getent passwd apache | cut -d: -f7 | grep -q "/sbin/nologin" && echo 0 || echo 1`
   if [ "$audit01" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0010 ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0010 fail"
    fi
 
 #passwd -l apache 
 
 
 #TWGCB-04-007-0011
 # 從設定檔取得路徑
SERVER_ROOT=$(grep ^ServerRoot /etc/httpd/conf/httpd.conf | awk '{print $2}' | tr -d '"')

# 若未設定則使用預設值
[ -z "$SERVER_ROOT" ] && SERVER_ROOT="/etc/httpd"
 
  if [ "$(stat -c %U "$SERVER_ROOT")" == "root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0011 ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0011 chown -R root $SERVER_ROOT"
    fi
 
#chown -R root /etc/httpd


#TWGCB-04-007-0012 
# 從主設定檔取得路徑 (RHEL/CentOS)
SERVER_ROOT=$(grep ^ServerRoot /etc/httpd/conf/httpd.conf | awk '{print $2}' | tr -d '"')
# 若未明確設定則使用預設值
[ -z "$SERVER_ROOT" ] && SERVER_ROOT="/etc/httpd"
 
 if [ "$(stat -c %G "$SERVER_ROOT")" == "root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0012 ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0012 chgrp -R root $SERVER_ROOT"
    fi
	
#chgrp -R  root /etc/httpd
 
 
 #TWGCB-04-007-0013
 # 從主設定檔取得路徑 (RHEL/CentOS)
SERVER_ROOT=$(grep ^ServerRoot /etc/httpd/conf/httpd.conf | awk '{print $2}' | tr -d '"')
# 若未明確設定則使用預設值
[ -z "$SERVER_ROOT" ] && SERVER_ROOT="/etc/httpd"
audit01=$(find "$SERVER_ROOT" -perm -o=w ! -type l 2>/dev/null | grep -q .; echo $?)
if [ "$audit01" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0013 ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0013 fail"
fi
 
 #chmod -R o-w /etc/httpd
 
 
 #TWGCB-04-007-0014
 SERVER_ROOT=$(grep ^ServerRoot /etc/httpd/conf/httpd.conf | awk '{print $2}' | tr -d '"')
[ -z "$SERVER_ROOT" ] && SERVER_ROOT="/etc/httpd"
audit01=$(find "$SERVER_ROOT" -perm -g=w ! -type l ! -path "*logs*" 2>/dev/null | wc -l)

if [ "$audit01" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0014 ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0014 fail"
fi
 
 #chmod -R g-w /etc/httpd
 
 
 #TWGCB-04-007-0015
 DOCUMENT_ROOT=$(grep ^DocumentRoot /etc/httpd/conf/httpd.conf | awk '{print $2}' | tr -d '"')
APACHE_GROUP=$(grep ^Group /etc/httpd/conf/httpd.conf | awk '{print $2}' | tr -d '"')
[ -z "$APACHE_GROUP" ] && APACHE_GROUP="apache"
 
 audit01=$(find -L "$DOCUMENT_ROOT" -group "$APACHE_GROUP" -perm /g=w 2>/dev/null | wc -l)
 if [ "$audit01" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0015 ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0015 fail"
fi
 
 #find -L "$DOCUMENT_ROOT" -group "$APACHE_GROUP" -perm /g=w -exec chmod g-w {} \;
 #find -L /var/www/html -group apache -perm /g=w -print | xargs chmod g-w
 
 
 #TWGCB-04-007-0016
  audit01=`grep -r "CoreDumpDirectory" /etc/httpd/ && echo 0 || echo 1`
     if [ "$audit01" == "1" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0016 ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0016 fail"
    fi
 
 #grep -r "CoreDumpDirectory" /etc/httpd/
 
 
 #TWGCB-04-007-0017
 # 檢查 Mutex 設定
MUTEX_DIR=$(grep -r "Mutex file:" /etc/httpd/ 2>/dev/null | awk -F: '{print $3}' | cut -d'/' -f2- | xargs dirname 2>/dev/null | sort -u)

if [ -z "$MUTEX_DIR" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0017 ok"
else
    # (1) 不在 DocumentRoot 下
    DOCUMENT_ROOT=$(grep ^DocumentRoot /etc/httpd/conf/httpd.conf | awk '{print $2}' | tr -d '"')
    if [[ "$MUTEX_DIR" == "$DOCUMENT_ROOT"* ]]; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0017 fail (鎖定目錄位於 DocumentRoot 下)"
    else
        # (2) 擁有者檢查
        if [ "$(stat -c '%U:%G' "$MUTEX_DIR")" != "root:root" ]; then
            echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0017 fail (目錄擁有者不正確)"
        else
            # (3) 權限檢查 (需 750 或更嚴格)
            if [ "$(stat -c '%a' "$MUTEX_DIR")" -gt 750 ]; then
                echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-00017 fail (目錄權限過大)"
            else
                # (4) 檢查是否為本機檔案系統
                if df -P "$MUTEX_DIR" | grep -q ":"; then
                    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0017 fail (目錄位於網路掛載點)"
                else
                    echo -e "[\e[1;32mOK\e[0m] TWGCB-04-007-0017 ok (全部檢查通過)"
                fi
            fi
        fi
    fi
fi

#chown root:root $MUTEX_DIR"
#chmod 750 $MUTEX_DIR" 
 
 
 #TWGCB-04-007-0018
 # 取得 PID 檔案路徑
PID_FILE=$(grep -r "^PidFile" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"')
[ -z "$PID_FILE" ] && PID_FILE="/run/httpd/httpd.pid"  # 預設路徑
PID_DIR=$(dirname "$PID_FILE")

# 取得 DocumentRoot
DOCUMENT_ROOT=$(grep -r "^DocumentRoot" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"' | head -1)
[ -z "$DOCUMENT_ROOT" ] && DOCUMENT_ROOT="/var/www/html"
 
if [[ "$PID_DIR" == "$DOCUMENT_ROOT"* ]]; then
	echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0018 PID 目錄不可位於 DocumentRoot 下"
else
	OWNER=$(stat -c '%U:%G' "$PID_DIR")
	if [ "$OWNER" != "root:root" ]; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0018 目錄擁有者應為 root:root (當前: $OWNER)"
	else
		PERM=$(stat -c '%a' "$PID_DIR")
		if [ "$PERM" -gt 750 ]; then
			echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0018 目錄權限應為 750 或更嚴格 (當前: $PERM)"
		else
			echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0018 ok (全部檢查通過)"
		fi
	fi
 fi
 
 
#chown root:root /run/httpd
#chmod 750 /run/httpd
 #chcon -t httpd_var_run_t /run/httpd
 #restorecon -Rv /run/httpd
 
 
#TWGCB-04-007-0019
 # 檢查 ScoreBoardFile 設定
SCOREBOARD_FILE=$(grep -r "^ScoreBoardFile" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"')
 if [ -z "$SCOREBOARD_FILE" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0019 ok 未設定 ScoreBoardFile (符合安全要求)"
 else
	# (1) 檢查是否在 DocumentRoot 下
    SCOREBOARD_DIR=$(dirname "$SCOREBOARD_FILE")
    DOCUMENT_ROOT=$(grep -r "^DocumentRoot" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"' | head -1)
    [ -z "$DOCUMENT_ROOT" ] && DOCUMENT_ROOT="/var/www/html"
		if [[ "$SCOREBOARD_DIR" == "$DOCUMENT_ROOT"* ]]; then
			echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0019 ScoreBoard 目錄不可位於 DocumentRoot 下"
		else
		# (2) 檢查擁有者
		OWNER=$(stat -c '%U:%G' "$SCOREBOARD_DIR" 2>/dev/null)
			if [ "$OWNER" != "root:root" ]; then
				echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0019 目錄擁有者應為 root:root (當前: ${OWNER:-未取得})"
			else
			# (4) 檢查是否為本機檔案系統
			if ! df -P "$SCOREBOARD_DIR" 2>/dev/null | awk 'NR==2 {print $1}' | grep -q "^/dev/"; then
				echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0019 目錄必須位於本機硬碟 (當前可能是 NFS)"
			else
				echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0019 ok (全部檢查通過)"
			fi
		fi
	fi
 fi
 
 
 #TWGCB-04-007-0020
# 檢查 Apache <Directory /> 區段設定
DIRECTORY_BLOCK=$(grep -r -A 10 -i "<Directory />" /etc/httpd/conf* 2>/dev/null)

if [ -z "$DIRECTORY_BLOCK" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0020 找不到 <Directory /> 區段，請手動新增並加入安全設定"
else
    # 檢查是否包含 Require all denied
    echo "$DIRECTORY_BLOCK" | grep -qi "Require all denied"
    REQUIRE_OK=$?

    # 檢查是否有舊語法 Allow / Deny / Order
    echo "$DIRECTORY_BLOCK" | grep -qiE "Allow from|Deny from|Order allow,deny|Order deny,allow"
    OLD_DIRECTIVE_FOUND=$?

    if [ $REQUIRE_OK -eq 0 ] && [ $OLD_DIRECTIVE_FOUND -ne 0 ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0020 ok (<Directory /> 區段設定正確)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0020 設定不符"
        [ $REQUIRE_OK -ne 0 ] && echo -e "   → 缺少 'Require all denied'"
        [ $OLD_DIRECTIVE_FOUND -eq 0 ] && echo -e "   → 含有已棄用的 Allow/Deny/Order 指令"
    fi
fi


# TWGCB-04-007-0021 檢查 <Directory /> 區塊中的 AllowOverride 與 AllowOverrideList
CONF_FILE="/etc/httpd/conf/httpd.conf"
DIR_BLOCK=$(awk '/<Directory \/>/,/<\/Directory>/' "$CONF_FILE")

ALLOW_OVERRIDE_OK=false
ALLOWOVERRIDELIST_NOT_FOUND=true

# 是否包含 AllowOverride None（不區分大小寫）
if echo "$DIR_BLOCK" | grep -iq "^[[:space:]]*AllowOverride[[:space:]]\+None"; then
    ALLOW_OVERRIDE_OK=true
fi

# 是否含有 AllowOverrideList 指令（不分大小寫）
if echo "$DIR_BLOCK" | grep -iq "^^[[:space:]]*AllowOverrideList"; then
    ALLOWOVERRIDELIST_NOT_FOUND=false
fi

if $ALLOW_OVERRIDE_OK && $ALLOWOVERRIDELIST_NOT_FOUND; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0021 <Directory /> 設定正確：AllowOverride None，未使用 AllowOverrideList"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0021 <Directory /> 設定不符"
    if ! $ALLOW_OVERRIDE_OK; then
        echo "   - 缺少 AllowOverride None"
    fi
    if ! $ALLOWOVERRIDELIST_NOT_FOUND; then
        echo "   - 存在 AllowOverrideList 指令"
    fi
fi


# TWGCB-04-007-0022
FILES=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
AO_LIST_BAD=0
AO_NOT_NONE=0

for file in $FILES; do
    if grep -qi "^AllowOverrideList" "$file"; then
        echo -e " [\e[1;31mKO\e[0m] $file 含有 AllowOverrideList 指令"
        AO_LIST_BAD=1
    fi
    if grep -i "^AllowOverride" "$file" | grep -viq "^AllowOverride[[:space:]]\+None"; then
        echo -e " [\e[1;31mKO\e[0m] $file 含有非 None 的 AllowOverride 指令"
        AO_NOT_NONE=1
    fi
done

if [ $AO_LIST_BAD -eq 0 ] && [ $AO_NOT_NONE -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0022 所有 AllowOverrideList 已移除，AllowOverride 皆為 None"
fi

 
 #TWGCB-04-007-0023
# TWGCB-04-007-0023 檢查 <Directory /> 區塊中的 Options None

FILES=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
OK=1

for file in $FILES; do
    # 只處理含 <Directory /> 的檔案
    if awk '/<Directory \/>/,/<\/Directory>/' "$file" | grep -qi '^<Directory \/>'; then
        BLOCK=$(awk '/<Directory \/>/,/<\/Directory>/' "$file")
        # 檢查是否有 Options None（不分大小寫）
        if ! echo "$BLOCK" | grep -iq '^[[:space:]]*Options[[:space:]]*None'; then
            echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0023 $file：<Directory /> 缺少或未設為 Options None"
            OK=0
        fi
    fi
done

if [ $OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0023 <Directory /> 已正確設為 Options None"
fi


#TWGCB-04-007-0024
# TWGCB-04-007-0024 檢查 <Directory "/var/www/html"> 中是否設為 Options None
FILES=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
OK=1
for file in $FILES; do
    # 只處理含 <Directory "/var/www/html"> 的區塊
    if awk '/<Directory\s+"\/var\/www\/html">/,/<\/Directory>/' "$file" | grep -qi '^<Directory\s\+"/var/www/html"'; then
        BLOCK=$(awk '/<Directory\s+"\/var\/www\/html">/,/<\/Directory>/' "$file")
        if ! echo "$BLOCK" | grep -iq '^[[:space:]]*Options[[:space:]]*None'; then
            echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0024 $file：<Directory \"/var/www/html\"> 缺少或未設為 Options None"
            OK=0
        fi
    fi
done

if [ $OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0024 <Directory \"/var/www/html\"> 已正確設為 Options None"
fi
 

#TWGCB-04-007-0025
# 檢查所有 <Directory> 區塊中的 Options 設定
DIRECTORY_FILES=$(grep -rl "<Directory" /etc/httpd/conf* 2>/dev/null)

if [ -n "$DIRECTORY_FILES" ]; then
    # 檢查需要修正的設定
    NEED_FIX=$(grep -rA5 "<Directory" $DIRECTORY_FILES | grep -B5 "</Directory>" | grep "Options" | grep "Includes" | wc -l)
    
    if [ "$NEED_FIX" -gt 0 ]; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0025 發現需要修正的設定 (包含 Includes 參數)"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0025 ok (未發現包含 Includes 的 Options 設定)"
    fi
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0025 ok (未找到任何 <Directory> 設定)"
fi


#TWGCB-04-007-0026
# 初始化檢測結果
COMPLIANT=true
# 步驟1: 檢查預設測試網頁
DOCUMENT_ROOT=$(grep -r "^DocumentRoot" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"' | head -1)
[ -z "$DOCUMENT_ROOT" ] && DOCUMENT_ROOT="/var/www/html"

DEFAULT_PAGES=("index.html" "welcome.html" "testpage.html")
for page in "${DEFAULT_PAGES[@]}"; do
    if [ -f "$DOCUMENT_ROOT/$page" ]; then
        echo -e "  [\e[1;31mKO\e[0m]] 存在預設網頁: $DOCUMENT_ROOT/$page"
        COMPLIANT=false
    fi
done
# 步驟2: 檢查敏感設定
CONF_FILES=(
    "/etc/httpd/conf.d/welcome.conf"
    "/etc/httpd/conf.d/status.conf"
    "/etc/httpd/conf.d/info.conf"
    "/etc/httpd/conf.d/perl-status.conf"
)
PATTERNS=(
    "LocationMatch.*^/+$"
    "Location.*server-status"
    "Location.*server-info"
    "Location.*perl-status"
)

for file in "${CONF_FILES[@]}"; do
    if [ -f "$file" ]; then
        for pattern in "${PATTERNS[@]}"; do
            if grep -q "^[^#]*$pattern" "$file"; then
                echo -e "  [\e[1;31mKO\e[0m] 未註解的敏感設定: $file 中的 '$pattern'"
                COMPLIANT=false
            fi
        done
    fi
done

# 步驟3: 檢查 Apache 使用手冊
if rpm -q httpd-manual &>/dev/null; then
    echo -e "  [\e[1;31mKO\e[0m]] 已安裝 httpd-manual 套件"
    COMPLIANT=false
fi
# 最終結果
if $COMPLIANT; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0026 ok "
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0026 fail"
fi

 #TWGCB-04-007-0027
# 步驟1: 檢查 CGI 目錄設定
CGI_DIRS=$(grep -r -E "Script|ScriptAlias|ScriptAliasMatch" /etc/httpd/conf* 2>/dev/null | 
           awk '{print $NF}' | tr -d '"' | sort -u)

if [ -z "$CGI_DIRS" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0027 未配置任何 CGI 目錄"
fi
# 步驟2: 檢查 printenv 腳本
VIOLATION=false
for dir in $CGI_DIRS; do
    # 解析可能包含的變數路徑 (如 ${VAR})
    resolved_dir=$(echo $dir | envsubst)
    
    if [ -f "$resolved_dir/printenv" ]; then
        echo -e "  [\e[1;31mKO\e[0m] TWGCB-04-007-0027 存在風險腳本: $resolved_dir/printenv"
        VIOLATION=true
    fi
done

# 結果輸出
if $VIOLATION; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0027 發現 printenv 風險腳本"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0027 未發現 printenv 風險腳本"
fi
 

 # TWGCB-04-007-0028
# 步驟1: 檢查 CGI 目錄設定
CGI_DIRS=$(grep -r -E "Script|ScriptAlias|ScriptAliasMatch" /etc/httpd/conf* 2>/dev/null | 
           awk '{print $NF}' | tr -d '"' | sort -u)

if [ -z "$CGI_DIRS" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0028 未配置任何 CGI 目錄"
fi

# 步驟2: 檢查 test-cgi 腳本
VIOLATION=false
for dir in $CGI_DIRS; do
    # 解析可能包含的變數路徑 (如 ${VAR})
    resolved_dir=$(echo $dir | envsubst)
    
    if [ -f "$resolved_dir/test-cgi" ]; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0028 存在風險腳本: $resolved_dir/test-cgi"
        VIOLATION=true
    fi
done

# 結果輸出
if $VIOLATION; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0028 發現 test-cgi 風險腳本"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0028 未發現 test-cgi 風險腳本"
fi
 
 
# TWGCB-04-007-0029 HTTP 方法限制檢測
CONF_FILE="/etc/httpd/conf/httpd.conf"
NG_DIRS=()

check_directory_block() {
    local dir="$1"
    awk -v d="$dir" '
    $0 ~ "<Directory \"" d "\">" { inblock=1 }
    inblock {
        content = content $0 "\n"
        if ($0 ~ /<\/Directory>/) {
            if (content !~ /Require all denied/) {
                print d
            }
            inblock=0
            content=""
        }
    }
    ' "$CONF_FILE"
}

for d in "/var/www" "/var/www/html" "/var/www/cgi-bin"; do
    result=$(check_directory_block "$d")
    if [ -n "$result" ]; then
        NG_DIRS+=("$result")
    fi
done

# 輸出結果
if [ ${#NG_DIRS[@]} -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0029 所有目錄已正確配置"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0029 檢測到未配置的目錄：${NG_DIRS[*]}"
fi


 #TWGCB-04-007-0030
# 檢查 TraceEnable 設定
TRACE_ENABLED=$(grep -r "^TraceEnable" /etc/httpd/conf* 2>/dev/null | head -1)

if [ -z "$TRACE_ENABLED" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0030 TraceEnable 指令未設定"
elif [[ "$TRACE_ENABLED" =~ TraceEnable\ +off ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0030 TraceEnable 已正確設定為 off"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0030 TraceEnable 設定不正確 (當前設定: $TRACE_ENABLED)"
fi
 
 

 #TWGCB-04-007-0031
 # 檢查 mod_rewrite 是否載入
MOD_REWRITE_LOADED=$(httpd -M 2>/dev/null | grep -c "rewrite_module")
if [ "$MOD_REWRITE_LOADED" -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0031 mod_rewrite 未載入"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0031 mod_rewrite 已載入"
fi

# 檢查 RewriteEngine 設定
REWRITE_ENGINE_SET=$(grep -r "^RewriteEngine On" /etc/httpd/conf* 2>/dev/null | wc -l)
if [ "$REWRITE_ENGINE_SET" -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0031 RewriteEngine On 未設定"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0031 RewriteEngine On 已設定"
fi


# 檢查 HTTP/1.1 強制規則
REWRITE_COND1_SET=$(grep -ir "^[[:space:]]*RewriteEngine[[:space:]]*On" /etc/httpd/conf/httpd.conf 2>/dev/null | wc -l)
REWRITE_COND2_SET=$(grep -ir "^[[:space:]]*RewriteCond" /etc/httpd/conf/httpd.conf 2>/dev/null | wc -l)
REWRITE_COND3_SET=$(grep -ir "^[[:space:]]*RewriteRule" /etc/httpd/conf/httpd.conf 2>/dev/null | wc -l)
if [ "$REWRITE_COND1_SET" -gt 0 ] && [ "$REWRITE_COND2_SET" -gt 0 ] && [ "$REWRITE_COND3_SET" -gt 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0031 HTTP/1.1 強制規則已完整設定"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0031 HTTP/1.1 強制規則未正確設定"
fi

# 檢查 VirtualHost 是否繼承 RewriteOptions Inherit
VHOST_CONF_FILES=$(grep -rl "<VirtualHost" /etc/httpd/conf /etc/httpd/conf.d 2>/dev/null)
LOG_FILE="/tmp/vhost_inherit_check.log"

# 清空暫存 log
> "$LOG_FILE"

for file in $VHOST_CONF_FILES; do
    awk '
    BEGIN { in_vhost=0; has_inherit=0; }
/<VirtualHost[[:space:]]+/ {
        in_vhost=1;
        has_inherit=0;
    }
/<\/VirtualHost>/ {
        if (in_vhost && has_inherit==0) {
            printf(" [\033[1;31mKO\033[0m] %s 中的 VirtualHost 缺少 RewriteOptions Inherit\n", FILENAME);
        }
        in_vhost=0;
        has_inherit=0;
    }
    {
        if (in_vhost && /RewriteOptions[[:space:]]+Inherit/) {
            has_inherit=1;
        }
    }
    ' "$file" >> "$LOG_FILE"
done

# 顯示結果
cat "$LOG_FILE"

# 檢查是否有 [KO]
if grep -q "\[KO\]" "$LOG_FILE"; then
    echo -e " [\e[1;31mNG\e[0m] TWGCB-04-007-0031 有 VirtualHost 未設定 RewriteOptions Inherit"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0031 所有 VirtualHost 已設定 RewriteOptions Inherit"
fi

# 清除暫存檔
rm -f "$LOG_FILE"
 
 
# TWGCB-04-007-0032
CONF_PATH="/etc/httpd/conf"
# 找出所有含有 <FilesMatch "^\.ht"> 的檔案
FILES=$(grep -rl '<FilesMatch "\^\\.ht">' "$CONF_PATH" 2>/dev/null)

OK=0

for file in $FILES; do
    # 檢查該 FilesMatch 區塊是否同時包含 Require all denied
    if awk '
    /<FilesMatch "\^\\.ht">/ { in_block=1 }
    in_block && /<\/FilesMatch>/ { in_block=0 }
    in_block && /Require all denied/ { found=1 }
    END { exit !(found) }
    ' "$file"; then
        OK=1
        break
    fi
done

if [ "$OK" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0032 已正確設定 .ht 檔案保護"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0032 未正確設定 .ht 檔案保護"
fi

# 手動檢查設定
#grep -A3 "FilesMatch \"^\.ht\"" /etc/httpd/conf/httpd.conf

# 測試保護是否生效 (應返回 403 Forbidden)
#curl -I http://localhost/.htaccess
 
 
 #TWGCB-04-007-0033
 # 取得 DocumentRoot 目錄
DOCUMENT_ROOT=$(grep -r "^DocumentRoot" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"' | grep -E '^/' | head -1)
[ -z "$DOCUMENT_ROOT" ] && DOCUMENT_ROOT="/var/www/html"

# 掃描目前實際存在的副檔名
EXT_LIST=$(find "$DOCUMENT_ROOT" -type f -name '*.*' 2>/dev/null | awk -F. 'NF>1 {print tolower($NF)}' | sort -u | tr '\n' '|' | sed 's/|$//')

# 從 Apache 設定檔找出有設定 Require all granted 的 FilesMatch 規則
WHITELIST_BLOCKS=$(grep -rE "<FilesMatch \"\^.\*\\.\([a-zA-Z0-9|]+\)\$\">" /etc/httpd/conf* 2>/dev/null)
MATCH_LINE=$(grep -r '<FilesMatch "\^.\*' /etc/httpd/conf* 2>/dev/null)
EXT_PATTERN=$(echo "$MATCH_LINE" | sed -n 's/.*<FilesMatch ".*(\(.*\))\$">.*/\1/p')


if [ -n "$MATCH_LINE" ]; then
    # 萃取目前設定的副檔名 pattern
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0033 已設定副檔名白名單: $EXT_PATTERN"
    echo -e " [\e[1;34mINFO\e[0m] 建議應包含副檔名: $EXT_LIST"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0033 未設定副檔名白名單"
    echo -e " [\e[1;33m建議\e[0m] 建議允許副檔名: $EXT_LIST"
fi

# 檢查預設拒絕設定
DENY_ALL_SET=$(grep -r -A3 "<FilesMatch \"^.*\$\">" /etc/httpd/conf* 2>/dev/null | grep -c "Require all denied")

if [ "$DENY_ALL_SET" -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0033 未設定預設拒絕所有檔案"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0033 已設定預設拒絕所有檔案"
fi
 
 
 # TWGCB-04-007-0034
 # 檢查 mod_rewrite 是否載入
MOD_REWRITE_LOADED=$(httpd -M 2>/dev/null | grep -c "rewrite_module")
if [ "$MOD_REWRITE_LOADED" -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0034 mod_rewrite 未載入"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0034 mod_rewrite 已載入"
fi

# 檢查 RewriteEngine 是否啟用
REWRITE_ENGINE_SET=$(grep -r "^RewriteEngine On" /etc/httpd/conf* 2>/dev/null | wc -l)
if [ "$REWRITE_ENGINE_SET" -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0034 RewriteEngine On 未設定"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0034 RewriteEngine On 已設定"
fi

# 檢查 IP 位址拒絕規則
IP_DENY_RULE=$(grep -r "RewriteCond %{HTTP_HOST}" /etc/httpd/conf* 2>/dev/null | wc -l)
if [ "$IP_DENY_RULE" -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0034 未設定 IP 位址拒絕規則"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0034 已設定 IP 位址拒絕規則"
fi
 
 
 #TWGCB-04-007-0035
 # 檢查不安全的 Listen 指令 (未指定IP或監聽所有IP)
UNSAFE_LISTEN=$(grep -r "^Listen" /etc/httpd/conf* 2>/dev/null | grep -E "Listen [0-9]+$|Listen 0\.0\.0\.0|Listen \[::ffff:0\.0\.0\.0\]")

if [ -n "$UNSAFE_LISTEN" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0035 發現不安全的 Listen 指令:"
    echo "$UNSAFE_LISTEN" | while read -r line; do
        echo "  - $line"
    done
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0035 所有 Listen 指令均已指定具體IP"
fi
 

 # 檢查修改後的 Listen 指令
#grep -r "^Listen" /etc/httpd/conf*

# 檢查 Apache 監聽狀態
#sudo netstat -tulnp | grep httpd
 
 

 
  #TWGCB-04-007-0036
TWGCB1=0
TWGCB2=0
# 檢查 X-Frame-Options 設置
if grep -q "Header always append X-Frame-Options SAMEORIGIN" /etc/httpd/conf/httpd.conf; then
    TWGCB1=1
fi

if grep -q "Header always append X-Frame-Options DENY" /etc/httpd/conf/httpd.conf; then
    TWGCB1=1
fi

# 檢查 Content-Security-Policy 設置（注意引號的轉義）
if grep -q "Header always append Content-Security-Policy \"frame-ancestors 'self';\"" /etc/httpd/conf/httpd.conf; then
    TWGCB2=1
fi

if grep -q "Header always append Content-Security-Policy \"frame-ancestors 'none';\"" /etc/httpd/conf/httpd.conf; then
    TWGCB2=1
fi

# 條件判斷語法修正
if [ $TWGCB1 -eq 1 ] && [ $TWGCB2 -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0036 已設定限制網站被嵌入到 frame"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0036 未設定限制網站被嵌入到 frame"
fi
 
 
 # TWGCB-04-007-0037 檢測
CONF_FILE="/etc/httpd/conf/httpd.conf"
ERROR_LOG_SET=0
LOG_LEVEL_SET=0

# 檢測 ErrorLog 設定
if grep -q '^ErrorLog' $CONF_FILE || grep -q '<VirtualHost.*>.*ErrorLog' $CONF_FILE; then
    ERROR_LOG_SET=1
fi

# 檢測 LogLevel 設定
if grep -q '^LogLevel notice core:info' $CONF_FILE; then
    LOG_LEVEL_SET=1
fi

if [ $ERROR_LOG_SET -eq 1 ] && [ $LOG_LEVEL_SET -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0037 日誌設定正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0037 日誌設定未符合要求"
    echo " [未設定項目]"
    [ $ERROR_LOG_SET -eq 0 ] && echo " - ErrorLog 指令"
    [ $LOG_LEVEL_SET -eq 0 ] && echo " - LogLevel notice core:info"
fi
 
 
# TWGCB-04-007-0038 - 檢查 Apache 是否設為 combined 日誌格式
CONF_DIR="/etc/httpd"
CONF_FILES_HTTPD="/etc/httpd/conf/httpd.conf"
CONF_FILES_SSL="/etc/httpd/conf.d/ssl.conf"

LOGFORMAT_LINE='LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined'
CUSTOMLOG_LINE='CustomLog logs/access_log combined'

CHECK_FAIL=0

# 全域設定檔檢查
if grep -Fq "$LOGFORMAT_LINE" "$CONF_FILES_HTTPD"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0038 $CONF_FILES_HTTPD 已設定 LogFormat"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0038 $CONF_FILES_HTTPD 缺少 LogFormat 設定"
fi
if grep -Fq "$LOGFORMAT_LINE" "$CONF_FILES_SSL"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0038 $CONF_FILES_SSL 已設定 LogFormat"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0038 $CONF_FILES_SSL 缺少 LogFormat 設定"
fi

if grep -Fq "$CUSTOMLOG_LINE" "$CONF_FILES_HTTPD"; then
	echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0038 $CONF_FILES_HTTPD 已設定 CustomLog"  
else
	echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0038 $CONF_FILES_HTTPD 缺少 CustomLog 設定"
fi
if grep -Fq "$CUSTOMLOG_LINE" "$CONF_FILES_SSL"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0038 $CONF_FILES_SSL 已設定 CustomLog"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0038 $CONF_FILES_SSL 缺少 CustomLog 設定"
fi

# VirtualHost 檢查
for file in $(grep -rl "<VirtualHost" "$CONF_DIR/conf" "$CONF_DIR/conf.d"); do
    if ! awk '/<VirtualHost/,/<\/VirtualHost>/ { if ($0 ~ /CustomLog logs\/access_log combined/) found=1 } END { if (!found) exit 1 }' "$file"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0038 $file 中的 VirtualHost 缺少 CustomLog"
        CHECK_FAIL=1
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0038 $file 中 VirtualHost 已設定 CustomLog"
    fi
done


# TWGCB-04-007-0039 檢測
LOGROTATE_FILE="/etc/logrotate.d/httpd"
CONFIG_CORRECT=1


if ! grep -q "missingok" $LOGROTATE_FILE || \
   ! grep -q "notifempty" $LOGROTATE_FILE || \
   ! grep -q "sharedscripts" $LOGROTATE_FILE; then
    CONFIG_CORRECT=0
    echo " [未配置] 基础日誌輪替参数缺失"
fi

if ! grep -q "postrotate" $LOGROTATE_FILE || \
   ! grep -q "systemctl reload httpd" $LOGROTATE_FILE; then
    CONFIG_CORRECT=0
    echo " [未配置] 重載配置缺失"
fi

# 檢測保留周期配置
if ! grep -q "^weekly" $LOGROTATE_FILE; then
    CONFIG_CORRECT=0
    echo " [未配置] 每周輪替設置缺失"
fi

if ! grep -q "^rotate 13" $LOGROTATE_FILE; then
    CONFIG_CORRECT=0
    echo " [未配置] 13周保留設置缺失"
fi

if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0039 日誌輪替設置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0039 日誌輪替設置不完整"
fi

# TWGCB-04-007-0040 檢測
if rpm -qa | grep -q mod_ssl; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0040 mod_ssl模組已安裝"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0040 mod_ssl模組未安裝"
fi

# TWGCB-04-007-0041 檢測
SSL_CONF="/etc/httpd/conf.d/ssl.conf"
ISSUE_FOUND=0

# 检查是否啟用HTTPS
if [ -f "$SSL_CONF" ] && grep -q "SSLCertificateKeyFile" "$SSL_CONF"; then
    # 获取所有.key文件路径
    grep "^[[:space:]]*SSLCertificateKeyFile" "$SSL_CONF" | awk '{print $2}' | while read -r key_file; do
        # 检查文件是否存在
        if [ ! -f "$key_file" ]; then
            echo -e " [\e[1;31mKO\e[0m] 私鑰文件不存在: $key_file"
            ISSUE_FOUND=1
        else
            # 检查權限
            if [ $(stat -c %a "$key_file") -ne 400 ] || \
               [ $(stat -c %U "$key_file") != "root" ] || \
               [ $(stat -c %G "$key_file") != "root" ]; then
                echo -e " [\e[1;31mKO\e[0m] 私鑰權限不正確: $key_file"
                ISSUE_FOUND=1
            fi
        fi
    done
    
    if [ $ISSUE_FOUND -eq 0 ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0041 所有私鑰配置正確"
    fi
else
    echo -e " [\e[1;33mINFO\e[0m] TWGCB-04-007-0041 未啟用HTTPS"
fi


# TWGCB-04-007-0042 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
SSL_ENABLED=0
PROTOCOL_CORRECT=0

# 检查是否啟用SSL
if grep -rq "SSLProtocol" $CONF_FILES; then
    SSL_ENABLED=1
    # 检查協議配置是否正確
    if grep -r "SSLProtocol" $CONF_FILES | grep -q -E "\+TLSv1.2(\s+\+TLSv1.3)?"; then
        PROTOCOL_CORRECT=1
    fi
fi

if [ $SSL_ENABLED -eq 0 ]; then
    echo -e " [\e[1;33mINFO\e[0m] TWGCB-04-007-0042 未啟用SSL"
elif [ $PROTOCOL_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0042 SSL協議配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0042 SSL協議配置不安全"
fi

# TWGCB-04-007-0043 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
CONFIG_CORRECT=0

# 检查是否配置了安全加密套件
if grep -rq "SSLHonorCipherOrder On" $CONF_FILES && \
   grep -rq "SSLCipherSuite ECDHE:DHE:!NULL:!LOW:!SSLv2:!MD5:!RC4:!aNULL" $CONF_FILES; then
    CONFIG_CORRECT=1
fi
if grep -rq "SSLHonorCipherOrder On" $CONF_FILES && \
   grep -rq "SSLCipherSuite ALL:!EXP:!NULL:!LOW:!SSLv2:!MD5:!RC4:! aNULL" $CONF_FILES; then
    CONFIG_CORRECT=1
fi


if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0043 加密套件配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0043 加密套件配置不安全"
fi

# TWGCB-04-007-0044 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
SSL_ENABLED=0
CONFIG_CORRECT=0

# 检查是否啟用SSL
if grep -rq "SSLInsecureRenegotiation" $CONF_FILES; then
    SSL_ENABLED=1
    # 检查配置是否正確
    if grep -r "SSLInsecureRenegotiation" $CONF_FILES | grep -q "off"; then
        CONFIG_CORRECT=1
    fi
fi

if [ $SSL_ENABLED -eq 0 ]; then
    echo -e " [\e[1;33mINFO\e[0m] TWGCB-04-007-0044 未啟用SSL重協商"
elif [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0044 SSL重協商配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0044 SSL重協商配置不安全"
fi



# TWGCB-04-007-0045 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
SSL_ENABLED=0
CONFIG_CORRECT=0

# 检查是否啟用SSL
if grep -rq "SSLCompression" $CONF_FILES; then
    SSL_ENABLED=1
    # 检查配置是否正確
    if grep -r "SSLCompression" $CONF_FILES | grep -q "off"; then
        CONFIG_CORRECT=1
    fi
fi

if [ $SSL_ENABLED -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0045 未啟用SSL壓縮"
elif [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0045 SSL壓縮配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0045 SSL壓縮配置不安全"
fi



# TWGCB-04-007-0046 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
SSL_ENABLED=0
CONFIG_CORRECT=0

# 检查SSL状态
if grep -rq "SSLUseStapling" $CONF_FILES; then
    SSL_ENABLED=1
    # 检查OCSP裝訂配置
    if grep -r "SSLUseStapling" $CONF_FILES | grep -q "On" && \
       grep -rq "SSLStaplingCache" $CONF_FILES; then
        CONFIG_CORRECT=1
    fi
fi

if [ $SSL_ENABLED -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0046 未啟用OCSP裝訂"
elif [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0046 OCSP裝訂配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0046 OCSP裝訂配置不完整"
fi



# TWGCB-04-007-0047 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
HSTS_ENABLED=0
CONFIG_CORRECT=0

# 检查HSTS配置
if grep -rq "Strict-Transport-Security" $CONF_FILES; then
    HSTS_ENABLED=1
    # 检查max-age值是否>=480
    if grep -r "Strict-Transport-Security" $CONF_FILES | grep -q "max-age=[4-9][0-9][0-9]"; then
        CONFIG_CORRECT=1
    fi
fi

if [ $HSTS_ENABLED -eq 0 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0047 未啟用HSTS"
elif [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0047 HSTS 配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0047 HSTS max-age值不足480秒"
fi


# TWGCB-04-007-0048 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_CORRECT=0

# 检查ServerTokens配置
if grep -rq "ServerTokens Prod" $CONF_FILES; then
    CONFIG_CORRECT=1
elif ! grep -rq "ServerTokens" $CONF_FILES; then
    # 如果完全没設置，默認值不安全
    CONFIG_CORRECT=0
else
    # 設置了但不是Prod
    CONFIG_CORRECT=0
fi

if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0048 ServerTokens 配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0048 ServerTokens 配置不安全"
fi



# TWGCB-04-007-0049 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_CORRECT=0

# 检查ServerSignature配置
if grep -rq "ServerSignature Off" $CONF_FILES; then
    CONFIG_CORRECT=1
elif ! grep -rq "ServerSignature" $CONF_FILES; then
    # 如果完全没設置，默認值不安全
    CONFIG_CORRECT=0
else
    # 設置了但不是Off
    CONFIG_CORRECT=0
fi

if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0049 ServerSignature 配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0049 ServerSignature 配置不安全"
fi




# TWGCB-04-007-0050 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
AUTOINDEX_FOUND=0
ICONS_FOUND=0

# 檢測自動索引配置
if grep -rq "^[^#]*Include.*httpd-autoindex\.conf" $CONF_FILES; then
    AUTOINDEX_FOUND=1
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0050 發現未註解的自動索引配置"
fi

# 檢測/icons/别名配置
if grep -rq "^[^#]*Alias /icons/" $CONF_FILES; then
    ICONS_FOUND=1
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0050 發現未註解的/icons/别名配置"
fi

if [ $AUTOINDEX_FOUND -eq 0 ] && [ $ICONS_FOUND -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0050 目錄列表配置已安全"
fi

# 验证配置是否已註解
#grep -r "^[^#]*Include.*httpd-autoindex\.conf" /etc/httpd/conf/
#grep -r "^[^#]*Alias /icons/" /etc/httpd/conf/

# 测试目錄列表功能是否禁用
# 应返回403 Forbidden
#curl -I http://localhost/icons/



# TWGCB-04-007-0051 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_CORRECT=0

# 检查FileETag配置
if grep -rq "FileETag None" $CONF_FILES; then
    CONFIG_CORRECT=1
elif ! grep -rq "FileETag" $CONF_FILES; then
    # 如果完全没設置，默認值不安全
    CONFIG_CORRECT=0
else
    # 設置了但不是None
    CONFIG_CORRECT=0
fi

if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0051 FileETag 配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0051 FileETag 配置不安全"
fi

# 验证配置
#grep -r "FileETag None" /etc/httpd/conf/

# 测试效果（响应头中不应包含ETag）
#curl -I http://localhost | grep -i ETag
 
 
 # TWGCB-04-007-0052 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
TIMEOUT_OK=0
TIMEOUT_VALUE=0

# 检查Timeout配置
if grep -rq "^Timeout" $CONF_FILES; then
    TIMEOUT_VALUE=$(grep -r "^Timeout" $CONF_FILES | awk '{print $2}' | head -1)
    if [ "$TIMEOUT_VALUE" -gt 0 ] && [ "$TIMEOUT_VALUE" -le 60 ]; then
        TIMEOUT_OK=1
    fi
fi

if [ $TIMEOUT_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0052 Timeout 配置正確(當前值: $TIMEOUT_VALUE)"
elif [ $TIMEOUT_VALUE -gt 60 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0052 Timeout 值過大(當前值: $TIMEOUT_VALUE)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0052 未配置 Timeout 或值無效"
fi


 # TWGCB-04-007-0053 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
KEEPALIVE_OK=0

# 检查KeepAlive配置
if grep -rq "^KeepAlive On" $CONF_FILES; then
    KEEPALIVE_OK=1
elif ! grep -rq "^KeepAlive" $CONF_FILES; then
    # 如果完全没設置，默認值可能不安全
    KEEPALIVE_OK=0
fi

if [ $KEEPALIVE_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0053 KeepAlive 配置正確"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0053 KeepAlive 未啟用或配置不正確"
fi
 
 
 
 
 # 验证配置
#grep -r "^KeepAlive" /etc/httpd/conf/
#grep -r "^KeepAliveTimeout" /etc/httpd/conf/
#grep -r "^MaxKeepAliveRequests" /etc/httpd/conf/

# 检查當前生效值
#apachectl -t -D DUMP_RUN_CFG 2>/dev/null | grep -E "KEEPALIVE|KEEPALIVE_TIMEOUT|MAXKEEPALIVEREQUESTS"
 
 
 
 
 
# TWGCB-04-007-0054 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_OK=0
CURRENT_VALUE=0

# 检查MaxKeepAliveRequests配置
if grep -rq "^MaxKeepAliveRequests" $CONF_FILES; then
    CURRENT_VALUE=$(grep -r "^MaxKeepAliveRequests" $CONF_FILES | awk '{print $2}' | head -1)
    if [ "$CURRENT_VALUE" -ge 100 ]; then
        CONFIG_OK=1
    fi
fi

if [ $CONFIG_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0054 MaxKeepAliveRequests 配置正確(當前值: $CURRENT_VALUE)"
elif [ "$CURRENT_VALUE" -gt 0 ] && [ "$CURRENT_VALUE" -lt 100 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0054 MaxKeepAliveRequests 值不足(當前值: $CURRENT_VALUE)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0054 未配置 MaxKeepAliveRequests"
fi
 
 
 # 验证配置
#grep -r "^MaxKeepAliveRequests" /etc/httpd/conf/

# 检查當前生效值
#apachectl -t -D DUMP_RUN_CFG 2>/dev/null | grep "MAXKEEPALIVEREQUESTS"
 
 
 # TWGCB-04-007-0055 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_OK=0
CURRENT_VALUE=0

# 检查KeepAliveTimeout配置
if grep -rq "^KeepAliveTimeout" $CONF_FILES; then
    CURRENT_VALUE=$(grep -r "^KeepAliveTimeout" $CONF_FILES | awk '{print $2}' | head -1)
    if [ "$CURRENT_VALUE" -gt 0 ] && [ "$CURRENT_VALUE" -le 15 ]; then
        CONFIG_OK=1
    fi
fi

if [ $CONFIG_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0055 KeepAliveTimeout 配置正確(當前值: $CURRENT_VALUE)"
elif [ "$CURRENT_VALUE" -gt 15 ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0055 KeepAliveTimeout 值過大(當前值: $CURRENT_VALUE)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0055 未配置 KeepAliveTimeout 或值無效"
fi
 
 
 # TWGCB-04-007-0056 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
MODULE_OK=0
TIMEOUT_OK=0

# 检查模組是否加載
if httpd -M 2>/dev/null | grep -q reqtimeout_module; then
    MODULE_OK=1
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0056 未加載 mod_reqtimeout 模組"
fi

# 检查超時配置
if grep -rq "^RequestReadTimeout header=[0-9]\+-40," $CONF_FILES; then
    TIMEOUT_OK=1
else
    CURRENT_SETTING=$(grep -r "^RequestReadTimeout" $CONF_FILES 2>/dev/null || echo "未配置")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0056 請求超時配置不正確 (當前: $CURRENT_SETTING)"
fi

if [ $MODULE_OK -eq 1 ] && [ $TIMEOUT_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0056 RequestReadTimeout header=40以下 配置正確"
fi
 
 # TWGCB-04-007-0057 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
MODULE_LOADED=0
CONFIG_CORRECT=0

# 步骤1：检查模組是否加載
if httpd -M 2>/dev/null | grep -q reqtimeout_module; then
    MODULE_LOADED=1
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0057 未加載 mod_reqtimeout 模組"
fi

# 步骤2：检查請求主體超時設置
if grep -rq "^RequestReadTimeout.*body=[0-9]\+," $CONF_FILES; then
    BODY_TIMEOUT=$(grep -r "^RequestReadTimeout" $CONF_FILES | grep -oP "body=\K[0-9]+")
    if [ "$BODY_TIMEOUT" -le 20 ]; then
        CONFIG_CORRECT=1
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0057 請求主體超時時間過長 (當前: $BODY_TIMEOUT 秒)"
    fi
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0057 未配置請求主體超時"
fi

if [ $MODULE_LOADED -eq 1 ] && [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0057 RequestReadTimeout body=20以下 配置正確"
fi
 
 

#TWGCB-04-007-0058 
conf_files=$(find /etc/httpd/conf /etc/httpd/conf.d -name "*.conf")
config_ok=0
current_value=""

# 檢查 LimitRequestline 設定是否存在且在範圍內
if grep -r "^LimitRequestline" $conf_files >/dev/null 2>&1; then
    current_value=$(grep -r "^LimitRequestline" $conf_files | awk '{print $2}' | head -1)
    if [[ "$current_value" =~ ^[0-9]+$ ]] && [ "$current_value" -gt 0 ] && [ "$current_value" -le 512 ]; then
        config_ok=1
    fi
fi

if [ "$config_ok" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0058 LimitRequestline 配置正確 (當前值: $current_value)"
else
	echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0058 LimitRequestline 未配置或值不正確(當前值: $current_value)"
fi

 
 
 #TWGCB-04-007-0059
conf_files=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
config_ok=0
current_value=""

# 檢查 LimitRequestFields 是否已正確設置
if grep -r "^LimitRequestFields" $conf_files >/dev/null 2>&1; then
    current_value=$(grep -r "^LimitRequestFields" $conf_files | awk '{print $2}' | head -1)
    if [[ "$current_value" =~ ^[0-9]+$ ]] && [ "$current_value" -gt 0 ] && [ "$current_value" -le 100 ]; then
        config_ok=1
    fi
fi

if [ "$config_ok" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0059 LimitRequestFields 設定正確 (目前值: $current_value)"
else
	echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0059 LimitRequestFields 未配置或值不正確 (目前值: $current_value)"
fi
 
  #TWGCB-04-007-0060
  conf_files=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
config_ok=0
current_value=""

# 檢查 LimitRequestFieldSize 是否已正確設置
if grep -r "^LimitRequestFieldSize" $conf_files >/dev/null 2>&1; then
    current_value=$(grep -r "^LimitRequestFieldSize" $conf_files | awk '{print $2}' | head -1)
    if [[ "$current_value" =~ ^[0-9]+$ ]] && [ "$current_value" -gt 0 ] && [ "$current_value" -le 1024 ]; then
        config_ok=1
    fi
fi

if [ "$config_ok" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0060 LimitRequestFieldSize 設定正確 (目前值: $current_value)"
else
	echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0060 LimitRequestFieldsize 未配置或值不正確 (目前值: $current_value)"
fi
  
 
 
#TWGCB-04-007-0061
conf_files=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
config_ok=0
current_value=""

# 檢查 LimitRequestBody 是否已正確設置
if grep -r "^LimitRequestBody" $conf_files >/dev/null 2>&1; then
    current_value=$(grep -r "^LimitRequestBody" $conf_files | awk '{print $2}' | head -1)
    if [[ "$current_value" =~ ^[0-9]+$ ]] && [ "$current_value" -gt 0 ] && [ "$current_value" -le 102400 ]; then
        config_ok=1
    fi
fi

if [ "$config_ok" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0061 LimitRequestBody 設定正確 (目前值: $current_value)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0061 LimitRequestBody 未配置或值過大值不正確 (目前值: $current_value)"
fi

 # TWGCB-04-007-0062 檢測
CONFIG_FILE="/etc/selinux/config"
CURRENT_MODE=$(getenforce 2>/dev/null)

# 检查配置文件
if grep -q "^SELINUX=enforcing" "$CONFIG_FILE"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0062 SELinux 配置文件已設置為enforcing"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0062 SELinux 配置文件未設置為enforcing"
fi

 
 # TWGCB-04-007-0063 檢測

# 可執行檔清單
APACHE_BINARIES=(/usr/sbin/httpd /usr/sbin/apachectl)
for f in /usr/sbin/httpd.*; do
    [ -e "$f" ] && APACHE_BINARIES+=("$f")
done

# 期望對應的 SELinux type
declare -A EXPECTED_CONTEXT
EXPECTED_CONTEXT["/usr/sbin/httpd"]="httpd_exec_t"
EXPECTED_CONTEXT["/usr/sbin/apachectl"]="initrc_exec_t"

for bin in "${APACHE_BINARIES[@]}"; do
    if [ -z "$bin" ] || [ ! -f "$bin" ]; then
        echo -e " [\e[1;33mSKIP\e[0m] TWGCB-04-007-0063 路徑無效或檔案不存在: '$bin'"
        continue
    fi

    # 正確取得 SELinux context 類型
    actual_context=$(ls -Z "$bin" 2>/dev/null | awk '{print $(NF-1)}')
    actual_type=$(echo "$actual_context" | cut -d':' -f3)
    expected_type="${EXPECTED_CONTEXT["$bin"]:-httpd_exec_t}"

    if [ "$actual_type" = "$expected_type" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0063 $bin SELinux type 正確 ($actual_type)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0063 $bin SELinux type 錯誤 (目前為 $actual_type，應為 $expected_type)"
    fi
done
 
 
 
 #TWGCB-04-007-0064
 # 檢測httpd_t是否处于宽容模式
if semodule -l | grep -q permissive_httpd_t; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0064 檢測到httpd_t运行在宽容模式(permissive)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0064 httpd_t未使用寬容模式"
fi
 
 
 
  #TWGCB-04-007-0065
 # 檢測Basic/Digest認證模組是否啟用
if grep -q "^LoadModule.*mod_auth_basic" /etc/httpd/conf/httpd.conf || \
   grep -q "^LoadModule.*mod_auth_digest" /etc/httpd/conf/httpd.conf; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0065 檢測到啟用不安全的認證模組"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0065 未啟用Basic/Digest認證模組"
fi
 
 
 #TWGCB-04-007-0066
 # 檢測HTTP重定向配置
if grep -rq "^[[:space:]]*Redirect permanent / https://" /etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0066 已配置HTTPS强制重定向"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0066 未配置HTTPS强制重定向"
fi
 

 ####################################################################################################################################

#sleep 1
echo "#########################################################################"
echo
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Script completed in" $DIFF "seconds"
echo
echo "Executed on :"
echo
echo "Check GCB hostname is" $HOSTNAME
date
echo
echo "#########################################################################"
echo
######################################################################################################
 
 
 
 
 
 
             show_menu;
        ;;
        7A) clear;
            option_picked "Option 701 Picked";
######################################################################################################
echo
echo "#########################################################################"
echo -e "\e[0;33m 7A.Apache HTTP Server 2.4 GCB v1.2 autosetup (2025/05/21)/////// \e[0m"
echo "#########################################################################"
START=$(date +%s)


################################TWGCB-04-007 Apache HTTP Server FIX ####################################### 


#TWGCB-04-007-0002
# 禁用WebDAV模組
CONF_FILES="/etc/httpd/conf.modules.d/*.conf"

for conf in $CONF_FILES; do
    # 註解mod_dav和mod_dav_fs加載指令
    sed -i '/mod_dav/s/^/#/' "$conf"
    sed -i '/mod_dav_fs/s/^/#/' "$conf"
done
echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0002 已禁用WebDAV模組"
 
 
#TWGCB-04-007-0003
# 合併檢測與修正
if httpd -M 2>/dev/null | grep -q "status_module"; then
    CONF_FILES="/etc/httpd/conf.modules.d/*.conf"
    for conf in $CONF_FILES; do
        sed -i '/mod_status/s/^/#/' "$conf"
    done
    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0003 已自動禁用Status模組"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0003 Status模組已禁用"
fi
 
#TWGCB-04-007-0004
# 合併檢測與修正
if httpd -M 2>/dev/null | grep -q "autoindex_module"; then
    CONF_FILES="/etc/httpd/conf.modules.d/*.conf"
    for conf in $CONF_FILES; do
        sed -i '/mod_autoindex/s/^/#/' "$conf"
    done
mv /etc/httpd/conf.d/autoindex.conf /etc/httpd/conf.d/autoindex.conf.bak
    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0004 已自動禁用Autoindex模組"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0004 Autoindex模組已禁用"
fi
 

#TWGCB-04-007-0005
 # 合併檢測與修正
if httpd -M 2>/dev/null | grep -qE "proxy_module|proxy_http_module"; then
mv /etc/httpd/conf.modules.d/00-proxy.conf /etc/httpd/conf.modules.d/00-proxy.conf.bak
mv /etc/httpd/conf.modules.d/10-proxy_h2.conf /etc/httpd/conf.modules.d/10-proxy_h2.conf.bak
    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0005 已自動禁用Proxy模組"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0005 Proxy模組已禁用"
fi


#TWGCB-04-007-0006
# 合併檢測與修正
if httpd -M 2>/dev/null | grep -q "userdir_module"; then
    CONF_FILES="/etc/httpd/conf.modules.d/*.conf"
    for conf in $CONF_FILES; do
        sed -i '/mod_userdir/s/^/#/' "$conf"
    done
    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0006 已自動禁用User Directories模組"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0006 User Directories模組已禁用"
fi
 

#TWGCB-04-007-0007
 # 合併檢測與修正
if httpd -M 2>/dev/null | grep -q "info_module"; then
    CONF_FILES="/etc/httpd/conf.modules.d/*.conf"
    for conf in $CONF_FILES; do
        sed -i '/mod_info/s/^/#/' "$conf"
    done

    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0007 已自動禁用Info模組"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0007 Info模組已禁用"
fi

 
 #TWGCB-04-007-0018
 # 取得 PID 檔案路徑
PID_FILE=$(grep -r "^PidFile" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"')
[ -z "$PID_FILE" ] && PID_FILE="/run/httpd/httpd.pid"  # 預設路徑
PID_DIR=$(dirname "$PID_FILE")

# 取得 DocumentRoot
DOCUMENT_ROOT=$(grep -r "^DocumentRoot" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"' | head -1)
[ -z "$DOCUMENT_ROOT" ] && DOCUMENT_ROOT="/var/www/html"
 
if [[ "$PID_DIR" == "$DOCUMENT_ROOT"* ]]; then
	echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0018 PID 目錄不可位於 DocumentRoot 下"
else
	OWNER=$(stat -c '%U:%G' "$PID_DIR")
	if [ "$OWNER" != "root:root" ]; then
	chown root:root "$PID_DIR"
		echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0018 $PID_DIR 目錄修改擁有者為 root:root "
	else
		PERM=$(stat -c '%a' "$PID_DIR")
		if [ "$PERM" -gt 750 ]; then
			echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0018 目錄權限應為 750 或更嚴格 (當前: $PERM)"
		else
			echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0018 ok (全部檢查通過)"
		fi
	fi
 fi
 

#TWGCB-04-007-0023
# TWGCB-04-007-0023 檢查 <Directory /> 區塊中的 Options None

FILES=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
OK=1

for file in $FILES; do
    # 只處理含 <Directory /> 的檔案
    if awk '/<Directory \/>/,/<\/Directory>/' "$file" | grep -qi '^<Directory \/>'; then
        BLOCK=$(awk '/<Directory \/>/,/<\/Directory>/' "$file")
        # 檢查是否有 Options None（不分大小寫）
        if ! echo "$BLOCK" | grep -iq '^[[:space:]]*Options[[:space:]]*None'; then
		# 插入 AllowOverride None
sed -i '/<Directory \/>/,/<\/Directory>/ { /<\/Directory>/i\
    Options None
}' "$file"
            echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0023 $file：<Directory /> 已新增 Options None"
            OK=0
        fi
    fi
done

if [ $OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0023 <Directory /> 已正確設為 Options None"
fi
 

#TWGCB-04-007-0024
# TWGCB-04-007-0024 檢查 <Directory "/var/www/html"> 中是否設為 Options None
FILES=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
OK=1

for file in $FILES; do
    # 只處理含 <Directory "/var/www/html"> 的區塊
    if awk '/<Directory\s+"\/var\/www\/html">/,/<\/Directory>/' "$file" | grep -qi '^<Directory\s\+"/var/www/html"'; then
        BLOCK=$(awk '/<Directory\s+"\/var\/www\/html">/,/<\/Directory>/' "$file")
        if ! echo "$BLOCK" | grep -iq '^[[:space:]]*Options[[:space:]]*None'; then
		# 移除 Options 指令並插入 Options None 至 </Directory> 前一行
sed -i '/<Directory\s\+"\/var\/www\/html">/,/<\/Directory>/ {
    /Options[[:space:]]/Id
}' $FILES

sed -i '/<Directory\s\+"\/var\/www\/html">/,/<\/Directory>/ {
    /<\/Directory>/i\
    Options None
}' $FILES
            echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0024 $file：<Directory \"/var/www/html\"> 新增 Options None"
            OK=0
        fi
    fi
done

if [ $OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0024 <Directory \"/var/www/html\"> 已正確設為 Options None"
fi

 
 #TWGCB-04-007-0025
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
NEED_FIX=0

# 檢測不安全的Options配置
for conf in $CONF_FILES; do
    if [ -f "$conf" ] && \
       grep -q "<Directory" "$conf" && \
       grep -A 5 "<Directory" "$conf" | grep "Options" | grep -q -E "Includes|IncludesNoExec"; then
        NEED_FIX=1
    fi
done

if [ $NEED_FIX -eq 1 ]; then
    # 执行修正
    for conf in $CONF_FILES; do
        if [ -f "$conf" ]; then
            # 备份配置文件
            # 修正Includes和IncludesNoExec参数
            sed -i '/<Directory/,/<\/Directory>/ {
                /Options/s/IncludesNoExec//g
                /Options/s/Includes//g
                /Options/s/,\{2,\}/,/g
                /Options/s/ \+/ /g
                /Options/s/ $//g
                /Options/s/^ *$//g
            }' "$conf"
            
            echo -e " [\e[1;33mFIX\e[0m] 已修正 $conf 中存在不安全的Options配置 "
        fi
    done
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0025 已移除所有SSI相关配置"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0025 未檢測到不安全的Options配置"
fi
 
 
# TWGCB-04-007-0029 HTTP 方法限制檢查與修正腳本
CONF_FILE="/etc/httpd/conf/httpd.conf"
TMP_FILE="/tmp/httpd.conf.new"
cp "$CONF_FILE" "$TMP_FILE"  # 先複製一份原始內容作業

fix_directory_block() {
    local dir="$1"
    local escaped_dir=$(echo "$dir" | sed 's/\//\\\//g')

    if ! awk -v d="$dir" '
        $0 ~ "<Directory \"" d "\">" { inblk=1 }
        inblk {
            content = content $0 "\n"
            if ($0 ~ /<\/Directory>/) {
                if (content ~ /Require all denied/) {
                    found=1
                }
                exit
            }
        }
        END { exit !found }
    ' "$TMP_FILE"; then

        # 插入限制設定
        awk -v d="$escaped_dir" '
            BEGIN { blk=0 }
            $0 ~ "<Directory \"" d "\">" { blk=1 }
            blk && /<\/Directory>/ {
        print "    <LimitExcept GET POST OPTIONS>"
        print "        Require all denied"
        print "    </LimitExcept>"
                blk=0
            }
            { print }
        ' "$TMP_FILE" > "${TMP_FILE}.tmp" && mv "${TMP_FILE}.tmp" "$TMP_FILE"

        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0029 目錄$d已正確配置"
    fi
}

fix_directory_block "/var/www"
fix_directory_block "/var/www/html"
fix_directory_block "/var/www/cgi-bin"

# 覆蓋原始設定檔
mv "$TMP_FILE" "$CONF_FILE"


 
# TWGCB-04-007-0030
# 檢查並修正 TraceEnable 設定為 off（伺服器層級）

MAIN_CONF="/etc/httpd/conf/httpd.conf"

if grep -qE '^\s*TraceEnable\s+off' "$MAIN_CONF"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0030 TraceEnable 已正確設定為 off"
elif grep -qE '^\s*TraceEnable' "$MAIN_CONF"; then
    # 存在但不是 off，執行修改
    sed -i 's/^\s*TraceEnable.*/TraceEnable off/' "$MAIN_CONF"
    echo -e " [\e[1;33m修正\e[0m] TWGCB-04-007-0030 已更新 TraceEnable 設定為 off $MAIN_CONF"
else
    # 完全沒有設定，於檔案結尾加入
    echo -e "\n# TWGCB-04-007-0030: 禁用 HTTP TRACE 方法\nTraceEnable off" >> "$MAIN_CONF "
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0030 已新增 TraceEnable off 設定 $MAIN_CONF"
fi
 
 
 
 
 # TWGCB-04-007-0031 禁用 HTTP/1.0 以下請求

HTTPD_CONF="/etc/httpd/conf/httpd.conf"
MODULES_CONF="/etc/httpd/conf.modules.d/00-base.conf"

# Step 1: 啟用 mod_rewrite 模組
if ! httpd -M 2>/dev/null | grep -q "rewrite_module"; then
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0031 載入 mod_rewrite 模組"
    sudo sed -i '/^#LoadModule rewrite_module/s/^#//' "$MODULES_CONF"
fi

# Step 2: 主設定檔中加入 RewriteEngine 規則（若尚未存在）
# 檢查 HTTP/1.1 強制規則
REWRITE_COND1_SET=$(grep -ir "^[[:space:]]*RewriteEngine[[:space:]]*On" /etc/httpd/conf/httpd.conf 2>/dev/null | wc -l)
REWRITE_COND2_SET=$(grep -ir "^[[:space:]]*RewriteCond" /etc/httpd/conf/httpd.conf 2>/dev/null | wc -l)
REWRITE_COND3_SET=$(grep -ir "^[[:space:]]*RewriteRule" /etc/httpd/conf/httpd.conf 2>/dev/null | wc -l)
if [ "$REWRITE_COND1_SET" -eq 0 ] && [ "$REWRITE_COND2_SET" -eq 0 ] && [ "$REWRITE_COND3_SET" -eq 0 ]; then
    echo -e " [\e[1;33mFIX\e[0m] 新增 RewriteEngine On 與 HTTP/1.1 強制規則到 $HTTPD_CONF"
    cat <<EOF | sudo tee -a "$HTTPD_CONF" > /dev/null

# TWGCB-04-007-0031 強制限制 HTTP/1.1
RewriteEngine On
RewriteCond %{THE_REQUEST} !HTTP/1\.1$
RewriteRule .* - [F]
EOF

else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0031 HTTP/1.1 強制規則完整設定"
fi

# Step 3: 虛擬主機新增 RewriteOptions Inherit

VHOST_FILES=$(grep -rl "^[^#]*<VirtualHost" /etc/httpd/conf /etc/httpd/conf.d/*.conf 2>/dev/null)

for vhost in $VHOST_FILES; do
    if ! grep -q "RewriteOptions Inherit" "$vhost"; then
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0031 在 $vhost 新增 RewriteOptions Inherit"
        sudo sed -i '/<\/VirtualHost>/i \    RewriteOptions Inherit' "$vhost"
    fi
done
 
 
 # TWGCB-04-007-0032
CONF_PATH="/etc/httpd/conf"

# 找出所有含有 <FilesMatch "^\.ht"> 的檔案
FILES=$(grep -rl '<FilesMatch "\^\\.ht">' "$CONF_PATH" 2>/dev/null)

OK=0

for file in $FILES; do
    # 檢查該 FilesMatch 區塊是否同時包含 Require all denied
    if awk '
    /<FilesMatch "\^\\.ht">/ { in_block=1 }
    in_block && /<\/FilesMatch>/ { in_block=0 }
    in_block && /Require all denied/ { found=1 }
    END { exit !(found) }
    ' "$file"; then
        OK=1
        break
    fi
done

if [ "$OK" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0032 已正確設定 .ht 檔案保護"
else
    # 新增設定到檔案結尾
    echo -e "\n# 保護 .htaccess 和 .htpasswd 等檔案 (TWGCB-04-007-0032)\n<FilesMatch \"^\\.ht\">\n    Require all denied\n</FilesMatch>" | sudo tee -a "$MAIN_CONF" > /dev/null
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0032 已新增 .ht 檔案保護設定"

fi
 
 
# TWGCB-04-007-0033

# 取得 DocumentRoot 目錄
DOCUMENT_ROOT=$(grep -r "^DocumentRoot" /etc/httpd/conf* 2>/dev/null | awk '{print $2}' | tr -d '"' | head -1)
[ -z "$DOCUMENT_ROOT" ] && DOCUMENT_ROOT="/var/www/html"

# 動態蒐集副檔名白名單
EXT_LIST=$(find "$DOCUMENT_ROOT" -type f -name '*.*' 2>/dev/null | awk -F. 'NF>1 {print tolower($NF)}' | sort -u | tr '\n' '|' | sed 's/|$//')
[ -z "$EXT_LIST" ] && EXT_LIST="html|css|js|jpg|png|ico|pdf|txt"

# 找到設定檔位置
CONF_FILE=$(grep -rl "<Directory \"$DOCUMENT_ROOT\">" /etc/httpd/conf* 2>/dev/null | head -1)
[ -z "$CONF_FILE" ] && CONF_FILE="/etc/httpd/conf/httpd.conf"

# 檢查是否已存在 FilesMatch 拒絕區塊
if grep -q '<FilesMatch "\^.\*\$">' "$CONF_FILE"; then
    echo -e " [\e[1;34mINFO\e[0m] TWGCB-04-007-0033 已有預設拒絕設定，跳過新增"
else

sed -i "/<Directory[[:space:]]\\+\"\\/var\\/www\\/html\"[[:space:]]*>/,/<\\/Directory>/ {
    /<\/Directory>/ i\\
# TWGCB-04-007-0033\\
<FilesMatch \"^.*$\">\\
    Require all denied\\
</FilesMatch>\\
<FilesMatch \"^.*\\.(${EXT_LIST})$\">\\
    Require all granted\\
</FilesMatch>
}" "$CONF_FILE"
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0033 已根據現有副檔名新增 FilesMatch 存取控制"
fi
 
 
 

 
  # TWGCB-04-007-0035 檢查不安全的 Listen 指令 (未指定IP或監聽所有IP)
# 取得伺服器實際IP (IPv4和IPv6)
IPV4_ADDR=$(ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v "127.0.0.1" | head -1)
IPV6_ADDR=$(ip -6 addr show | grep -oP '(?<=inet6\s)[\da-f:]+' | grep -v "::1" | head -1)
UNSAFE_LISTEN=$(grep -r "^Listen" /etc/httpd/conf* 2>/dev/null | grep -E "Listen [0-9]+$|Listen 0\.0\.0\.0|Listen \[::ffff:0\.0\.0\.0\]")


# 檢查是否有找到IP
if [ -z "$IPV4_ADDR" ] && [ -z "$IPV6_ADDR" ]; then
    echo -e " [\e[1;31mFAIL\e[0m] 無法取得伺服器IP位址，請手動設定"
else 
	if [ -n "$UNSAFE_LISTEN" ]; then
	# 處理 Listen 指令
	CONF_FILES=$(grep -rl "^Listen" /etc/httpd/conf* 2>/dev/null)
	for file in $CONF_FILES; do
    # 修改不安全的 Listen 指令
		if [ -n "$IPV4_ADDR" ]; then
        sudo sed -i -E "s/^Listen ([0-9]+)$/Listen $IPV4_ADDR:\1/g" "$file"
        sudo sed -i -E "s/^Listen 0\.0\.0\.0:([0-9]+)$/Listen $IPV4_ADDR:\1/g" "$file"
		fi
		if [ -n "$IPV6_ADDR" ]; then
        sudo sed -i -E "s/^Listen \[::ffff:0\.0\.0\.0\]:([0-9]+)$/Listen [$IPV6_ADDR]:\1/g" "$file"
		fi
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0035 已更新 $file 中的 Listen 指令"
done
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0035 所有 Listen 指令均已指定具體IP"
	fi
fi


   #TWGCB-04-007-0036
TWGCB1=0
TWGCB2=0
# 檢查 X-Frame-Options 設置
if grep -q "Header always append X-Frame-Options SAMEORIGIN" /etc/httpd/conf/httpd.conf; then
    TWGCB1=1
fi

if grep -q "Header always append X-Frame-Options DENY" /etc/httpd/conf/httpd.conf; then
    TWGCB1=1
fi

# 檢查 Content-Security-Policy 設置（注意引號的轉義）
if grep -q "Header always append Content-Security-Policy \"frame-ancestors 'self';\"" /etc/httpd/conf/httpd.conf; then
    TWGCB2=1
fi

if grep -q "Header always append Content-Security-Policy \"frame-ancestors 'none';\"" /etc/httpd/conf/httpd.conf; then
    TWGCB2=1
fi

# 條件判斷語法修正
if [ $TWGCB1 -eq 1 ] && [ $TWGCB2 -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0036 已設定限制網站被嵌入到 frame"
else
        {
			echo "#TWGCB-04-007-0036"
            echo "Header always append X-Frame-Options SAMEORIGIN"
            echo "Header always append Content-Security-Policy \"frame-ancestors 'self';\""
        } >> "$CONF_FILE"
		
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0036 已設定限制網站被嵌入到 frame $CONF_FILE"
fi
 
 # TWGCB-04-007-0037 修正
CONF_FILE="/etc/httpd/conf/httpd.conf"
# 修正 LogLevel
if ! grep -q '^LogLevel notice core:info' $CONF_FILE; then
    sed -i '/^LogLevel/d' $CONF_FILE  # 移除既有設定
	{
	echo "#TWGCB-04-007-0037"
    echo "LogLevel notice core:info" 
	} >> $CONF_FILE
fi

# 修正 ErrorLog (僅在全局設定不存在時添加)
if ! grep -q '^ErrorLog' $CONF_FILE; then
	{
	echo "#TWGCB-04-007-0037"
    echo 'ErrorLog "logs/error_log"'
	} >> $CONF_FILE
fi
 
 
  # TWGCB-04-007-0038 修正
CONF_FILES_HTTPD="/etc/httpd/conf/httpd.conf"
CONF_FILES_SSL="/etc/httpd/conf.d/ssl.conf"
LOGFORMAT_LINE='LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined'
CUSTOMLOG_LINE='CustomLog logs/access_log combined'

# 加入 LogFormat（若尚未存在）
if ! grep -qF "$LOGFORMAT_LINE" "$CONF_FILES_HTTPD"; then
    echo "# TWGCB-04-007-0038" >> "$CONF_FILES_HTTPD"
	echo "$LOGFORMAT_LINE" >> "$CONF_FILES_HTTPD"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0038 已新增 LogFormat 到 $CONF_FILES_HTTPD"
fi
if ! grep -qF "$LOGFORMAT_LINE" "$CONF_FILES_SSL"; then
    echo "# TWGCB-04-007-0038" >> "$CONF_FILES_SSL"
	echo "$LOGFORMAT_LINE" >> "$CONF_FILES_SSL"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0038 已新增 LogFormat 到 $CONF_FILES_SSL"
fi

# 加入 CustomLog（若尚未存在）
if ! grep -qF "$CUSTOMLOG_LINE" "$CONF_FILES_HTTPD"; then
	echo "# TWGCB-04-007-0038" >> "$CONF_FILES_HTTPD"
    echo "$CUSTOMLOG_LINE" >> "$CONF_FILES_HTTPD"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0038 已新增 CustomLog 到 $CONF_FILES_HTTPD"
fi
if ! grep -qF "$CUSTOMLOG_LINE" "$CONF_FILES_SSL"; then
	echo "# TWGCB-04-007-0038" >> "$CONF_FILES_SSL"
    echo "$CUSTOMLOG_LINE" >> "$CONF_FILES_SSL"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0038 已新增 CustomLog 到 $CONF_FILES_SSL"
fi

# VirtualHost 自動寫入 CustomLog（每區段一次）
for file in $(grep -rl "<VirtualHost" /etc/httpd/conf /etc/httpd/conf.d); do
    awk -v cline="    $CUSTOMLOG_LINE" '
    BEGIN { in_vhost=0; found=0; modified=0 }
    /<VirtualHost[[:space:]]+/ { in_vhost=1; found=0 }
    /<\/VirtualHost>/ {
        if (in_vhost && !found) {
            print cline
            modified=1
        }
        in_vhost=0
    }
    {
        if (in_vhost && $0 ~ /^[ \t]*CustomLog[ \t]+logs\/access_log[ \t]+combined[ \t]*$/) {
            found=1
        }
        print
    }
    END {
        if (modified) {
            print "[FIX] CustomLog 已新增至 " FILENAME > "/dev/stderr"
        }
    }
    ' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
done
 
 
 #TWGCB-04-007-0039
 LOGROTATE_CONF="/etc/logrotate.d/httpd"
VHOST_LOG_PATTERN="/var/log/httpd/*log"

# 建立設定檔如果不存在
if [ ! -f "$LOGROTATE_CONF" ]; then
    echo " [INFO] 未找到 $LOGROTATE_CONF，建立新設定檔"
    cat > "$LOGROTATE_CONF" <<EOF
$VHOST_LOG_PATTERN {
    weekly
    rotate 13
    missingok
    notifempty
    sharedscripts
    postrotate
        /bin/systemctl reload httpd.service > /dev/null 2>/dev/null || true
    endscript
}
EOF
    echo -e " [\e[1;32mOK\e[0m] 已建立日誌輪替設定 $LOGROTATE_CONF"
    exit 0
fi

# 判斷各項設定是否存在
FIXED=0

# 檢查並補齊 weekly
if ! grep -qE '^\s*weekly' "$LOGROTATE_CONF"; then
    echo "weekly" >> "$LOGROTATE_CONF"
    echo -e " [\e[1;33mFIXED\e[0m] 加入 weekly"
    FIXED=1
fi

# 檢查並補齊 rotate 13
if ! grep -qE '^\s*rotate\s+13' "$LOGROTATE_CONF"; then
    echo "rotate 13" >> "$LOGROTATE_CONF"
    echo -e " [\e[1;33mFIXED\e[0m] 加入 rotate 13"
    FIXED=1
fi

# 檢查並補齊 missingok
if ! grep -qE '^\s*missingok' "$LOGROTATE_CONF"; then
    echo "missingok" >> "$LOGROTATE_CONF"
    echo -e " [\e[1;33mFIXED\e[0m] 加入 missingok"
    FIXED=1
fi

# 檢查並補齊 notifempty
if ! grep -qE '^\s*notifempty' "$LOGROTATE_CONF"; then
    echo "notifempty" >> "$LOGROTATE_CONF"
    echo -e " [\e[1;33mFIXED\e[0m] 加入 notifempty"
    FIXED=1
fi

# 檢查並補齊 sharedscripts
if ! grep -qE '^\s*sharedscripts' "$LOGROTATE_CONF"; then
    echo "sharedscripts" >> "$LOGROTATE_CONF"
    echo -e " [\e[1;33mFIXED\e[0m] 加入 sharedscripts"
    FIXED=1
fi

# 檢查 postrotate 區段
if ! grep -q 'postrotate' "$LOGROTATE_CONF"; then
    cat >> "$LOGROTATE_CONF" <<EOF
postrotate
    /bin/systemctl reload httpd.service > /dev/null 2>/dev/null || true
endscript
EOF
    echo -e " [\e[1;33mFIX\e[0m] 加入 postrotate 區塊"
    FIXED=1
else
    # 如果已有 postrotate，檢查內部 reload 指令
    if ! awk '/postrotate/,/endscript/' "$LOGROTATE_CONF" | grep -q 'reload httpd'; then
        awk '/postrotate/{print;print "    /bin/systemctl reload httpd.service > /dev/null 2>/dev/null || true";next}1' "$LOGROTATE_CONF" > "${LOGROTATE_CONF}.tmp" && mv "${LOGROTATE_CONF}.tmp" "$LOGROTATE_CONF"
        echo -e " [\e[1;33mFIX\e[0m] postrotate 區塊內補上 reload 指令"
        FIXED=1
    fi
fi

if [ "$FIXED" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0039 日誌輪替設定符合規範"
else
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0039 已自動修正設定"
fi
 
 
 # TWGCB-04-007-0041 修正
SSL_CONF="/etc/httpd/conf.d/ssl.conf"
ISSUE_FOUND=0

# 检查是否啟用HTTPS
if [ -f "$SSL_CONF" ] && grep -q "SSLCertificateKeyFile" "$SSL_CONF"; then
    # 获取所有.key文件路径
    grep "SSLCertificateKeyFile" "$SSL_CONF" | awk '{print $2}' | while read -r key_file; do
        # 检查文件是否存在
        if [ ! -f "$key_file" ]; then
            echo -e " [\e[1;31mKO\e[0m] TWGCB-04-007-0041 私鑰文件不存在: $key_file"
            ISSUE_FOUND=1
        else
            # 检查權限
            if [ $(stat -c %a "$key_file") -ne 400 ] || \
               [ $(stat -c %U "$key_file") != "root" ] || \
               [ $(stat -c %G "$key_file") != "root" ]; then
			    chown root:root "$key_file"
				chmod 0400 "$key_file"
			    echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0041 已修正權限: $key_file"
                ISSUE_FOUND=1
            fi
        fi
    done
    
    if [ $ISSUE_FOUND -eq 0 ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0041 所有私鑰配置正確"
    fi
else
    echo -e " [\e[1;33mINFO\e[0m] TWGCB-04-007-0041 未啟用HTTPS"
fi
 

 # TWGCB-04-007-0042 修正
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
SSL_ENABLED=0
PROTOCOL_CORRECT=0

# 检查是否啟用SSL
if grep -rq "SSLProtocol" $CONF_FILES; then
    SSL_ENABLED=1
    # 检查協議配置是否正確
    if grep -r "SSLProtocol" $CONF_FILES | grep -q -E "\+TLSv1.2(\s+\+TLSv1.3)?"; then
        PROTOCOL_CORRECT=1
    fi
fi

if [ $SSL_ENABLED -eq 0 ]; then
    echo -e " [\e[1;33mINFO\e[0m] TWGCB-04-007-0042 未啟用SSL"
elif [ $PROTOCOL_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0042 SSL協議配置正確"
else
    # 修正SSL协议配置
for conf in $CONF_FILES; do
    if grep -q "SSLProtocol" "$conf"; then
        # 移除旧配置
        sed -i '/SSLProtocol/d' "$conf"
        # 添加新配置（默认启用TLSv1.2和TLSv1.3）
		echo "#TWGCB-04-007-0042" >> "$conf"
        echo "SSLProtocol +TLSv1.2 +TLSv1.3" >> "$conf"
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0042 $conf 已新增配置"
		
		
    fi
done
fi
 
 
 

# 写入安全加密配置
for conf in $CONF_FILES; do
    if grep -qE '^[^#]*<VirtualHost' "$conf"; then
		if ! grep -q "^SSLHonorCipherOrder On" "$conf" && \
			! grep -q "^SSLCipherSuite ECDHE:DHE:!NULL:!LOW:!SSLv2:!MD5:!RC4:!aNULL" "$conf"; then		
        # 虚拟主机配置
        sed -i '/<VirtualHost/,/<\/VirtualHost/ {
            /SSLHonorCipherOrder/d
            /SSLCipherSuite/d
            /<\/VirtualHost/i #TWGCB-04-007-0043\nSSLHonorCipherOrder On\nSSLCipherSuite ECDHE:DHE:!NULL:!LOW:!SSLv2:!MD5:!RC4:!aNULL
        }' "$conf"
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0043 $conf VirtualHost已新增配置"
		fi
	else
		if ! grep -q "^SSLHonorCipherOrder On" "$conf" && \
			! grep -q "^SSLCipherSuite ECDHE:DHE:!NULL:!LOW:!SSLv2:!MD5:!RC4:!aNULL" "$conf"; then
		# 全局配置
        sed -i '/SSLHonorCipherOrder/d' "$conf"
        sed -i '/SSLCipherSuite/d' "$conf"
        sed -i -e '$a\' "$conf"
		{
		echo "#TWGCB-04-007-0043"
        echo "SSLHonorCipherOrder On"
        echo "SSLCipherSuite ECDHE:DHE:!NULL:!LOW:!SSLv2:!MD5:!RC4:!aNULL"
		}  >> "$conf"
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0043 $conf 已新增配置"
		fi
    fi
done
echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0043 安全加密套件已配置"
 
 
 
 # TWGCB-04-007-0044
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
SSL_ENABLED=0
CONFIG_CORRECT=0

# 检查是否啟用SSL
if grep -rq "SSLInsecureRenegotiation" $CONF_FILES; then
    SSL_ENABLED=1
    # 检查配置是否正確
    if grep -r "SSLInsecureRenegotiation" $CONF_FILES | grep -q "off"; then
        CONFIG_CORRECT=1
    fi
fi

if [ $SSL_ENABLED -eq 0 ]; then

# 修正SSL重协商配置
for conf in $CONF_FILES; do
    if grep -q "<VirtualHost" "$conf"; then
        # 虚拟主机配置
        sed -i '/<VirtualHost/,/<\/VirtualHost/ {
            /SSLInsecureRenegotiation/d
            /<\/VirtualHost/i #TWGCB-04-007-0044\nSSLInsecureRenegotiation off
        }' "$conf"
		echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0044 SSL重協商配置已修正 $conf"
    else
        # 全局配置
        sed -i '/SSLInsecureRenegotiation/d' "$conf"
		echo "#TWGCB-04-007-0044" >> "$conf"
        echo "SSLInsecureRenegotiation off" >> "$conf"
		echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0044 SSL重協商配置已修正 $conf"
    fi
done

elif [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0044 SSL重協商配置正確"
else
# 修正SSL重协商配置
for conf in $CONF_FILES; do
    if grep -q "<VirtualHost" "$conf"; then
        # 虚拟主机配置
        sed -i '/<VirtualHost/,/<\/VirtualHost/ {
            /SSLInsecureRenegotiation/d
            /<\/VirtualHost/i #TWGCB-04-007-0044\nSSLInsecureRenegotiation off
        }' "$conf"
		echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0044 SSL重協商配置已修正 $conf"
    else
        # 全局配置
        sed -i '/SSLInsecureRenegotiation/d' "$conf"
		echo "#TWGCB-04-007-0044" >> "$conf"
        echo "SSLInsecureRenegotiation off" >> "$conf"
		echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0044 SSL重協商配置已修正 $conf"
    fi
done
    
fi
 
 # TWGCB-04-007-0045 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
SSL_ENABLED=0
CONFIG_CORRECT=0

# 检查是否啟用SSL
if grep -rq "SSLCompression" $CONF_FILES; then
    SSL_ENABLED=1
    # 检查配置是否正確
    if grep -r "SSLCompression" $CONF_FILES | grep -q "off"; then
        CONFIG_CORRECT=1
    fi
fi

if [ $SSL_ENABLED -eq 0 ]; then
  	{
	echo "#TWGCB-04-007-0045"
    echo "SSLCompression off" 
	} >> $CONF_FILE
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0045 已新增SSL壓縮配置"
elif [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0045 SSL壓縮配置正確"
else
  sed -i '/^LogLevel/d' $CONF_FILE  # 移除既有設定
  	{
	echo "#TWGCB-04-007-0045"
    echo "SSLCompression off" 
	} >> $CONF_FILE
  
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0045 已修改SSL壓縮配置"
	
	
fi
 
 # TWGCB-04-007-0046 自動修正
CONF_DIR="/etc/httpd"
MAIN_CONF="$CONF_DIR/conf/httpd.conf"
SSL_CONF_FILES=$(find "$CONF_DIR/conf.d" "$CONF_DIR/conf.modules.d" -type f -name "*.conf" 2>/dev/null)
ALL_CONF_FILES="$MAIN_CONF $SSL_CONF_FILES"

STAPLING_CACHE_OK=0
SSLUSESTAPLING_OK=0
FIXED=0
# 1. 檢查 SSLStaplingCache 設定
if grep -qE '^\s*SSLStaplingCache\s+"?(shmcb|dbm|dc):.*"?$' $ALL_CONF_FILES; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0046 SSLStaplingCache 已設定"
    STAPLING_CACHE_OK=1
else
    echo 'SSLStaplingCache "shmcb:logs/ssl_staple_cache(512000)"' >> "$MAIN_CONF"
	echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0046 SSLStaplingCache 已修正"
    STAPLING_CACHE_OK=1
    FIXED=1
fi

# 2. 檢查是否有啟用 SSL 的 VirtualHost 並含 SSLUseStapling On
SSL_VHOST_FILES=$(grep -rl '<VirtualHost.*443' $ALL_CONF_FILES 2>/dev/null)

if [ -z "$SSL_VHOST_FILES" ]; then
    echo -e " [\e[1;33mINFO\e[0m] TWGCB-04-007-0046 未找到啟用 SSL 的 VirtualHost"
else
    for file in $SSL_VHOST_FILES; do
        if awk '/<VirtualHost.*443/,/<\/VirtualHost>/' "$file" | grep -q 'SSLUseStapling\s\+On'; then
            echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0046 SSL VirtualHost 已設 SSLUseStapling On $file"
        else
            awk '
            /<VirtualHost.*443>/ {print; inblock=1; next}
            /<\/VirtualHost>/ {
                if (inblock) {
                    print "    SSLUseStapling On"
                    inblock=0
                }
                print; next
            }
            {print}
            ' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
            FIXED=1
        fi
    done
fi

# 3. 檢查 Server 層級是否已有 SSLUseStapling On
if grep -qE '^\s*SSLUseStapling\s+On' "$MAIN_CONF"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0046 伺服器層級已設 SSLUseStapling On $MAIN_CONF"
    SSLUSESTAPLING_OK=1
else
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-04-007-0046 伺服器層級補上 SSLUseStapling On $MAIN_CONF"
    echo "SSLUseStapling On" >> "$MAIN_CONF"
    SSLUSESTAPLING_OK=1
    FIXED=1
fi

if [ "$FIXED" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0046 所有設定已符合規範"
else
    echo -e " [\e[1;34mOK\e[0m] TWGCB-04-007-0046 設定已自動修正"
fi

 
# TWGCB-04-007-0047 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/ssl.conf"
HSTS_ENABLED=0
CONFIG_CORRECT=0
HSTS_CONFIG='Header always set Strict-Transport-Security "max-age=63072000; includeSubDomains; preload"'


# 检查HSTS配置
if grep -rq "Strict-Transport-Security" $CONF_FILES; then
    HSTS_ENABLED=1
    # 检查max-age值是否>=480
    if grep -r "Strict-Transport-Security" $CONF_FILES | grep -q "max-age=[4-9][0-9][0-9]"; then
        CONFIG_CORRECT=1
    fi
fi

if [ $HSTS_ENABLED -eq 0 ]; then
# 全局配置
for conf in $CONF_FILES; do
    # 清理旧配置
    sed -i '/Strict-Transport-Security/d' "$conf"
    
    # 添加全局配置（非虚拟主机部分）
    if ! grep -q "<VirtualHost" "$conf"; then
        echo -e "\n#TWGCB-04-007-0047 HSTS 配置" >> "$conf"
        echo "$HSTS_CONFIG" >> "$conf"
		echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0047 HSTS已配置（max-age=2年） $conf"
    fi
    
    # 虚拟主机配置（仅限443端口）
    if grep -q "<VirtualHost.*:443>" "$conf"; then
        sed -i '/<VirtualHost.*:443>/a \
    #TWGCB-04-007-0047 HSTS 配置\
    '"$HSTS_CONFIG" "$conf"
	echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0047 HSTS已配置（max-age=2年）虛擬主機配置(443) $conf"
    fi
done


	
elif [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0047 HSTS配置正確"
else
# 全局配置
for conf in $CONF_FILES; do
    # 清理旧配置
    sed -i '/Strict-Transport-Security/d' "$conf"
    
    # 添加全局配置（非虚拟主机部分）
    if ! grep -q "<VirtualHost" "$conf"; then
        echo -e "\n#TWGCB-04-007-0047 HSTS 配置" >> "$conf"
        echo "$HSTS_CONFIG" >> "$conf"
		echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0047 HSTS已配置（max-age=2年） $conf"
    fi
    
    # 虚拟主机配置（仅限443端口）
    if grep -q "<VirtualHost.*:443>" "$conf"; then
        sed -i '/<VirtualHost.*:443>/a \
    #TWGCB-04-007-0047 HSTS 配置\
    '"$HSTS_CONFIG" "$conf"
	echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0047 HSTS已配置（max-age=2年）虛擬主機配置(443) $conf"
    fi
done
fi

# TWGCB-04-007-0048 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_CORRECT=0

# 检查ServerTokens配置
if grep -rq "ServerTokens Prod" $CONF_FILES; then
    CONFIG_CORRECT=1
elif ! grep -rq "ServerTokens" $CONF_FILES; then
    # 如果完全没設置，默認值不安全
    CONFIG_CORRECT=0
else
    # 設置了但不是Prod
    CONFIG_CORRECT=0
fi

if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0048 ServerTokens配置正確"
else

	# 修正配置
for conf in $CONF_FILES; do
    # 移除旧配置
    sed -i '/ServerTokens/d' "$conf"
    # 添加新配置
	echo "#TWGCB-04-007-0048" >> "$conf"
    echo "ServerTokens Prod" >> "$conf"
	echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0048 已配置ServerTokens Prod $conf"
done
fi

# TWGCB-04-007-0049 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_CORRECT=0

# 检查ServerSignature配置
if grep -rq "ServerSignature Off" $CONF_FILES; then
    CONFIG_CORRECT=1
elif ! grep -rq "ServerSignature" $CONF_FILES; then
    # 如果完全没設置，默認值不安全
    CONFIG_CORRECT=0
else
    # 設置了但不是Off
    CONFIG_CORRECT=0
fi

if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0049 ServerSignature配置正確"
else
# 修正配置
for conf in $CONF_FILES; do
    # 移除旧配置
    sed -i '/ServerSignature/d' "$conf"
    # 添加新配置
	echo "#TWGCB-04-007-0049" >> "$conf"
    echo "ServerSignature Off" >> "$conf"
	echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0049 已配置ServerSignature=Off $conf"
done
fi

# TWGCB-04-007-0051 
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_CORRECT=0

# 检查FileETag配置
if grep -rq "FileETag None" $CONF_FILES; then
    CONFIG_CORRECT=1
elif ! grep -rq "FileETag" $CONF_FILES; then
    # 如果完全没設置，默認值不安全
    CONFIG_CORRECT=0
else
    # 設置了但不是None
    CONFIG_CORRECT=0
fi

if [ $CONFIG_CORRECT -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0051 FileETag配置正確"
else

# 修正配置
for conf in $CONF_FILES; do
    # 移除旧配置
    sed -i '/FileETag/d' "$conf"
    
    # 全局配置（非虚拟主机部分）
    if ! grep -q "<VirtualHost" "$conf"; then
        echo -e "\n#TWGCB-04-007-0051 禁用ETag" >> "$conf"
        echo "FileETag None" >> "$conf"
		echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0051 FileETag已配置 $conf"
	fi
    
    # 虚拟主机配置
    if grep -q "^[^#]*<VirtualHost" "$conf"; then
        sed -i '/<VirtualHost/a \
    #TWGCB-04-007-0051 禁用ETag\
    FileETag None' "$conf"
	echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0051 FileETag已配置 虛擬主機配置 $conf"
    fi
done
fi


 # TWGCB-04-007-0052 檢測
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
TIMEOUT_OK=0
TIMEOUT_VALUE=0
NEW_TIMEOUT=60

# 检查Timeout配置
if grep -rq "^Timeout" $CONF_FILES; then
    TIMEOUT_VALUE=$(grep -r "^Timeout" $CONF_FILES | awk '{print $2}' | head -1)
    if [ "$TIMEOUT_VALUE" -gt 0 ] && [ "$TIMEOUT_VALUE" -le 60 ]; then
        TIMEOUT_OK=1
    fi
fi

if [ $TIMEOUT_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0052 Timeout配置正確(當前值: $TIMEOUT_VALUE)"
else
    # 修正配置
for conf in $CONF_FILES; do
    # 移除旧配置
    sed -i '/^Timeout/d' "$conf"
    # 添加新配置
	echo "#TWGCB-04-007-0052" >> "$conf"
    echo "Timeout $NEW_TIMEOUT" >> "$conf"
	echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0052 已設置Timeout=$NEW_TIMEOUT $conf"
done
fi


 # TWGCB-04-007-0053
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
KEEPALIVE_OK=0

# 检查KeepAlive配置
if grep -rq "^KeepAlive On" $CONF_FILES; then
    KEEPALIVE_OK=1
elif ! grep -rq "^KeepAlive" $CONF_FILES; then
    # 如果完全没設置，默認值可能不安全
    KEEPALIVE_OK=0
fi

if [ $KEEPALIVE_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0053 KeepAlive配置正確"
else
    # 修正配置
for conf in $CONF_FILES; do
    # 移除旧配置
    sed -i '/^KeepAlive/d' "$conf"
    # 添加新配置
	echo "#TWGCB-04-007-0053" >> "$conf"
    echo "KeepAlive On" >> "$conf"
	echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0053 已啟用KeepAlive $conf"
	
done
fi


# TWGCB-04-007-0054
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_OK=0
CURRENT_VALUE=0
RECOMMENDED_VALUE=100


# 检查MaxKeepAliveRequests配置
if grep -rq "^MaxKeepAliveRequests" $CONF_FILES; then
    CURRENT_VALUE=$(grep -r "^MaxKeepAliveRequests" $CONF_FILES | awk '{print $2}' | head -1)
    if [ "$CURRENT_VALUE" -ge 100 ]; then
        CONFIG_OK=1
    fi
fi

if [ $CONFIG_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0054 MaxKeepAliveRequests配置正確(當前值: $CURRENT_VALUE)"
else
# 修正配置
for conf in $CONF_FILES; do
    # 移除旧配置
    sed -i '/^MaxKeepAliveRequests/d' "$conf"
    # 添加新配置
	echo "#TWGCB-04-007-0054" >> "$conf"
    echo "MaxKeepAliveRequests $RECOMMENDED_VALUE" >> "$conf"
	echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0054 已设置MaxKeepAliveRequests=$RECOMMENDED_VALUE $conf"
done
fi

# TWGCB-04-007-0055
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
CONFIG_OK=0
CURRENT_VALUE=0
RECOMMENDED_VALUE=15

# 检查KeepAliveTimeout配置
if grep -rq "^KeepAliveTimeout" $CONF_FILES; then
    CURRENT_VALUE=$(grep -r "^KeepAliveTimeout" $CONF_FILES | awk '{print $2}' | head -1)
    if [ "$CURRENT_VALUE" -gt 0 ] && [ "$CURRENT_VALUE" -le 15 ]; then
        CONFIG_OK=1
    fi
fi

if [ $CONFIG_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0055 KeepAliveTimeout配置正確(當前值: $CURRENT_VALUE)"
else
# 修正配置
for conf in $CONF_FILES; do
    # 移除旧配置
    sed -i '/^KeepAliveTimeout/d' "$conf"
    # 添加新配置
	echo "#TWGCB-04-007-0055" >> "$conf"
    echo "KeepAliveTimeout $RECOMMENDED_VALUE" >> "$conf"
	echo -e " [\e[1;32mFIX\e[0m] TWGCB-04-007-0055 已设置KeepAliveTimeout=$RECOMMENDED_VALUE $conf"
done
fi



# TWGCB-04-007-0056
CONF_FILES="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
MODULE_OK=0
TIMEOUT_OK=0
MODULE_LINE="LoadModule reqtimeout_module modules/mod_reqtimeout.so"
TIMEOUT_LINE="RequestReadTimeout header=20-40,MinRate=500 body=20,MinRate=500"

# 检查模組是否加載
if httpd -M 2>/dev/null | grep -q reqtimeout_module; then
    MODULE_OK=1
else

    # 加載模組
	if ! grep -q "^LoadModule reqtimeout_module" "$CONF_FILE"; then
    # 在其它LoadModule指令附近插入
    sed -i '/^LoadModule/ a\'"$MODULE_LINE" "$CONF_FILE"
    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0056 已添加mod_reqtimeout模組加載"
	fi
fi

# 检查超時配置
if grep -rq "^RequestReadTimeout header=[0-9]\+-40," $CONF_FILES; then
    TIMEOUT_OK=1
else

# 配置超時
if ! grep -q "^RequestReadTimeout" "$CONF_FILE"; then
    # 在文件末尾添加
    echo -e "\n#TWGCB-04-007-0056 防止慢速HTTP攻击" >> "$CONF_FILE"
    echo "$TIMEOUT_LINE" >> "$CONF_FILE"
    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0056 57已添加請求超時配置 $CONF_FILE"
else
    # 替换现有配置
    sed -i "/^RequestReadTimeout/c\\
	#TWGCB-04-007-0056\n$TIMEOUT_LINE
	" "$CONF_FILE"
    echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0056 57已更新請求超時配置 $CONF_FILE"
fi
	
fi

if [ $MODULE_OK -eq 1 ] && [ $TIMEOUT_OK -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0056 57 RequestReadTimeout配置正確"
fi




#TWGCB-04-007-0058 
# 檢測函数
 conf_files="/etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf"
 current_value=0
  config_ok=0

    # 检查LimitRequestline配置
    if grep -rq "^LimitRequestline" $conf_files; then
        current_value=$(grep -r "^LimitRequestline" $conf_files | awk '{print $2}' | head -1)
        if [ "$current_value" -gt 0 ] && [ "$current_value" -le 512 ]; then
            config_ok=1
        fi
    fi

    if [ $config_ok -eq 1 ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0058 LimitRequestline配置正確(當前值: $current_value)"
		else
		for conf in $conf_files; do
        # 移除舊的設定
        sed -i '/^LimitRequestline/d' "$conf"

        # 附加新設定
        echo -e "#TWGCB-04-007-0058\nLimitRequestline 512" >> "$conf"
        echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0058 已修正 LimitRequestline=512 至 $conf"
    done
    fi


# TWGCB-04-007-0059 檢查與修正 LimitRequestFields 設定

conf_files=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
config_ok=0
current_value=""

# 檢查 LimitRequestFields 是否已正確設置
if grep -r "^LimitRequestFields" $conf_files >/dev/null 2>&1; then
    current_value=$(grep -r "^LimitRequestFields" $conf_files | awk '{print $2}' | head -1)
    if [[ "$current_value" =~ ^[0-9]+$ ]] && [ "$current_value" -gt 0 ] && [ "$current_value" -le 100 ]; then
        config_ok=1
    fi
fi

if [ "$config_ok" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0059 LimitRequestFields 設定正確 (目前值: $current_value)"
else
    for conf in $conf_files; do
        # 移除現有設定
        sed -i '/^LimitRequestFields/d' "$conf"

        # 新增安全設定
        echo -e "#TWGCB-04-007-0059\nLimitRequestFields 100" >> "$conf"
        echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0059 已修正 LimitRequestFields=100 至 $conf"
    done
fi

# TWGCB-04-007-0060 檢查與修正 LimitRequestFieldSize 設定

conf_files=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
config_ok=0
current_value=""

# 檢查 LimitRequestFieldSize 是否已正確設置
if grep -r "^LimitRequestFieldSize" $conf_files >/dev/null 2>&1; then
    current_value=$(grep -r "^LimitRequestFieldSize" $conf_files | awk '{print $2}' | head -1)
    if [[ "$current_value" =~ ^[0-9]+$ ]] && [ "$current_value" -gt 0 ] && [ "$current_value" -le 1024 ]; then
        config_ok=1
    fi
fi

if [ "$config_ok" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0060 LimitRequestFieldSize 設定正確 (目前值: $current_value)"
else
    for conf in $conf_files; do
        # 移除現有設定
        sed -i '/^LimitRequestFieldSize/d' "$conf"

        # 新增安全設定
        echo -e "#TWGCB-04-007-0060\nLimitRequestFieldSize 1024" >> "$conf"
        echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0060 已修正 LimitRequestFieldSize=1024 至 $conf"
    done
fi
 
 
# TWGCB-04-007-0061 檢查與修正 LimitRequestBody 設定

conf_files=$(find /etc/httpd/conf /etc/httpd/conf.d -type f -name "*.conf")
config_ok=0
current_value=""

# 檢查 LimitRequestBody 是否已正確設置
if grep -r "^LimitRequestBody" $conf_files >/dev/null 2>&1; then
    current_value=$(grep -r "^LimitRequestBody" $conf_files | awk '{print $2}' | head -1)
    if [[ "$current_value" =~ ^[0-9]+$ ]] && [ "$current_value" -gt 0 ] && [ "$current_value" -le 102400 ]; then
        config_ok=1
    fi
fi

if [ "$config_ok" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0061 LimitRequestBody 設定正確 (目前值: $current_value)"
else
    for conf in $conf_files; do
        # 移除現有設定
        sed -i '/^LimitRequestBody/d' "$conf"

        # 新增安全設定
        echo -e "#TWGCB-04-007-0061\nLimitRequestBody 102400" >> "$conf"
        echo -e " [\e[1;32m+\e[0m] TWGCB-04-007-0061 已修正 LimitRequestBody=102400 至 $conf"
    done
fi
 
 # TWGCB-04-007-0062 檢測
CONFIG_FILE="/etc/selinux/config"
CURRENT_MODE=$(getenforce 2>/dev/null)

# 检查配置文件
if grep -q "^SELINUX=enforcing" "$CONFIG_FILE"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0062 SELinux配置文件已設置為enforcing"
else
    # 修改配置文件
	sed -i '/^SELINUX=/d' /etc/selinux/config
	echo "SELINUX=enforcing" >> /etc/selinux/config
	# 立即设置為Enforcing模式(無需重启)
	setenforce 1 >/dev/null 2>&1
	echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0062 已设置SELinux為enforcing模式"
fi

 

 # TWGCB-04-007-0063 修正

# 可執行檔清單
APACHE_BINARIES=(/usr/sbin/httpd /usr/sbin/apachectl)
for f in /usr/sbin/httpd.*; do
    [ -e "$f" ] && APACHE_BINARIES+=("$f")
done

# 期望對應的 SELinux type
declare -A EXPECTED_CONTEXT
EXPECTED_CONTEXT["/usr/sbin/httpd"]="httpd_exec_t"
EXPECTED_CONTEXT["/usr/sbin/apachectl"]="initrc_exec_t"

for bin in "${APACHE_BINARIES[@]}"; do
    if [ -z "$bin" ] || [ ! -f "$bin" ]; then
        echo -e " [\e[1;33mSKIP\e[0m] TWGCB-04-007-0063 路徑無效或檔案不存在: '$bin'"
        continue
    fi

    # 正確取得 SELinux context 類型
    actual_context=$(ls -Z "$bin" 2>/dev/null | awk '{print $(NF-1)}')
    actual_type=$(echo "$actual_context" | cut -d':' -f3)
    expected_type="${EXPECTED_CONTEXT["$bin"]:-httpd_exec_t}"

    if [ "$actual_type" = "$expected_type" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0063 $bin SELinux type 正確 ($actual_type)"
    else
        # 修正 httpd 主執行檔與其變體
		for bin in /usr/sbin/httpd /usr/sbin/httpd.*; do
		if [ -f "$bin" ]; then
        chcon -t httpd_exec_t "$bin"
        semanage fcontext -a -t httpd_exec_t "$bin"
        echo -e " [\e[1;33mFIX\e[0m] 設定 $bin 為 SELinux 類型 httpd_exec_t"
		fi
		done
		# 修正 apachectl
		if [ -f /usr/sbin/apachectl ]; then
		chcon -t initrc_exec_t /usr/sbin/apachectl
		semanage fcontext -a -t initrc_exec_t /usr/sbin/apachectl
		echo -e " [\e[1;33mFIX\e[0m] 設定 /usr/sbin/apachectl 為 SELinux 類型 initrc_exec_t"
		fi
		# 套用 restorecon
		restorecon -v /usr/sbin/httpd /usr/sbin/httpd.* /usr/sbin/apachectl 2>/dev/null
    fi
done













  # TWGCB-04-007-0034
CONF_FILE="/etc/httpd/conf/httpd.conf"

read -p "請輸入網站主機名稱（例如 www.example.com，若不輸入則略過設定）: " EXPECTED_HOST

# 若未輸入則略過，僅提示，不 exit
if [ -z "$EXPECTED_HOST" ]; then
    echo -e " [\e[1;33mSKIP\e[0m] TWGCB-04-007-0034 使用者未輸入主機名稱， 規則略過設定"
	else
HOST_REGEX=$(echo "$EXPECTED_HOST" | sed 's/\./\\./g')
HOST_LINE="RewriteCond %{HTTP_HOST} !^${HOST_REGEX} [NC]"
HOST_REGEX_ESCAPED=$(echo "$EXPECTED_HOST" | sed 's/\./\\\\./g')

	if grep -Fq "RewriteCond %{HTTP_HOST} !^${HOST_REGEX} [NC]" "$CONF_FILE"; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0034 已存在主機名稱限制條件，略過新增"
	else
	
		if ! grep -q "^[[:space:]]*ServerName[[:space:]]\+$EXPECTED_HOST" "$CONF_FILE"; then
        {
			echo "<VirtualHost *:80>"
			echo "ServerName $EXPECTED_HOST"
			echo "#TWGCB-04-007-0034"
            echo "RewriteCond %{HTTP_HOST} !^${HOST_REGEX} [NC]"
            echo "RewriteCond %{REQUEST_URI} !^/error [NC]"
            echo "RewriteRule ^.*\$ - [L,F]"
			echo "</VirtualHost>"
        } >> "$CONF_FILE"
		echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0034 已新增拒絕 IP 存取規則 $CONF_FILE"
			else
			# 插入在 ServerName 下一行
sed -i "/<VirtualHost \*:80>/,/<\/VirtualHost>/ {
/ServerName[[:space:]]\+$EXPECTED_HOST/ a\\
# TWGCB-04-007-0034\\
RewriteCond %{HTTP_HOST} !^${HOST_REGEX_ESCAPED} [NC]\\
RewriteCond %{REQUEST_URI} !^/error [NC]\\
RewriteRule ^.*\$ - [L,F]
}" "$CONF_FILE"
			echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0034 已新增拒絕 IP 存取規則 $CONF_FILE"
		fi
		
        if ! grep -q "^RewriteEngine On" "$CONF_FILE"; then
			echo "#TWGCB-04-007-0034"
            echo "RewriteEngine On" >> "$CONF_FILE"
            echo -e " [\e[1;33mFIX\e[0m] 已新增 RewriteEngine On $CONF_FILE"
        fi
    fi
fi








 #TWGCB-04-007-0066
 # 檢測HTTP重定向配置
 CONFIG_FILE="/etc/httpd/conf/httpd.conf"
    read -p "配置HTTPS强制重定向，請輸入網站主機名稱（例如 www.example.com，若不輸入則略過設定）: " EXPECTED_HOST
	# 若未輸入則略過
if [ -z "$EXPECTED_HOST" ]; then
    echo -e " [\e[1;33mSKIP\e[0m] TWGCB-04-007-0066 使用者未輸入主機名稱，略過設定"
	else
	
	if grep -Fq "Redirect permanent / https://$EXPECTED_HOST/" "$CONF_FILE"; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0066 已配置HTTPS强制重定向，略過新增"
	else
		
		if ! grep -q "^[[:space:]]*ServerName[[:space:]]\+$EXPECTED_HOST" "$CONF_FILE"; then
		{	
			echo "<VirtualHost *:80>"
			echo "ServerName $EXPECTED_HOST"
			echo "#TWGCB-04-007-0066"
			echo "Redirect permanent / https://$EXPECTED_HOST/"
			echo "#TWGCB-04-007-0031"
			echo "RewriteEngine On"
			echo "RewriteOptions Inherit"
			echo "#TWGCB-04-007-0037"
			echo 'logs/${EXPECTED_HOST}_error.log'
			echo "LogLevel notice core:info"
			echo "#TWGCB-04-007-0038"
			echo "CustomLog logs/access_log combined"
			echo "</VirtualHost>"
		} >> "$CONF_FILE"
		echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0066 已设置重定向配置 $CONFIG_FILE"
			else
			# 插入在 ServerName 下一行
sed -i "/<VirtualHost \*:80>/,/<\/VirtualHost>/ {
/ServerName[[:space:]]\+$EXPECTED_HOST/ a\\
# TWGCB-04-007-0066\\
Redirect permanent / https://${EXPECTED_HOST}/\\
# TWGCB-04-007-0031\\
RewriteEngine On\\
RewriteOptions Inherit\\
# TWGCB-04-007-0037\\
ErrorLog logs/${EXPECTED_HOST}_error.log\\
LogLevel notice core:info\\
# TWGCB-04-007-0038\\
CustomLog logs/access_log combined
}" "$CONF_FILE"
		echo -e " [\e[1;32mOK\e[0m] TWGCB-04-007-0066 已设置重定向配置 $CONFIG_FILE"
		fi
	fi
fi

 echo -e " [\e[1;33mINFO\e[0m] 需自行重啟服務 systemctl restart httpd"









		
######################################################################################################

echo "#########################################################################"
echo
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Script completed in" $DIFF "seconds"
echo
echo "Executed on :"
echo
echo "Check GCB hostname is" $HOSTNAME
date
echo
echo "#########################################################################"
echo
###################################################################################################### 
 
 
######################################################################################################


### 可以再新增選項區域 2024/11/24
#            show_menu;
#        ;;
#        5) clear;
#            option_picked "Option 4 Picked";
######################################################################################################
#echo
#echo "#########################################################################"
#echo -e "\e[0;33m 1. Red Hat Enterprise Linux 9 Server GCB Check/////// \e[0m"
#echo "#########################################################################"
#echo
#echo "Starting in 3 seconds"
##sleep 1
#echo "2"
##sleep 1
#echo "1"
##sleep 1
#START=$(date +%s)
#echo
#echo "#########################################################################"
#echo
#####輸入地方
##sleep 1
#echo "#########################################################################"
#echo
#END=$(date +%s)
#DIFF=$(( $END - $START ))
#echo "Script completed in" $DIFF "seconds"
#echo
#echo "Executed on :"
#echo
#echo "Check GCB hostname is" $HOSTNAME
#date
#echo
#echo "#########################################################################"
#echo
##############################END########################################################################


           show_menu;
        ;;
        8) clear;
            option_picked "Option 8 Picked";

######################################################################################################
echo
echo "#########################################################################"
echo -e "\e[0;33m 8. TWGCB-01-008 Red Hat Enterprise Linux 8 Server GCB Check V1.3/////// \e[0m"
echo "#########################################################################"
echo
echo "Starting in 3 seconds"
START=$(date +%s)
echo
echo "#########################################################################"
echo
##################TWGCB-01-008 RHEL8 SECURITY CHECK ##########

# 清除日誌檔案
rm -f "$SCRIPT_DIR"/TWGCB-01-008-*.log 2>/dev/null




if grep -q "install cramfs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist cramfs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0001 cramfs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0001 cramfs module is not disabled"
fi 

if grep -q "install squashfs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist squashfs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0002 squashfs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0002 squashfs module is not disabled"
fi 


if grep -q "install udf /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist udf" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0003 udf module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0003 udf module is not disabled"
fi 

# TWGCB-01-008-0004：檢查 /tmp 是否為獨立分區 (或 tmpfs)
if findmnt /tmp >/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0004 /tmp is a separate partition."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0004 /tmp is NOT a separate partition."
fi

# TWGCB-01-008-0005：檢查 /tmp 的 nodev 選項
if findmnt -n -o OPTIONS /tmp 2>/dev/null | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0005 /tmp mount option 'nodev' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0005 /tmp mount option 'nodev' is missing."
fi

# TWGCB-01-008-0006：檢查 /tmp 的 nosuid 選項
if findmnt -n -o OPTIONS /tmp 2>/dev/null | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0006 /tmp mount option 'nosuid' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0006 /tmp mount option 'nosuid' is missing."
fi

# TWGCB-01-008-0007：檢查 /tmp 的 noexec 選項
if findmnt -n -o OPTIONS /tmp 2>/dev/null | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0007 /tmp mount option 'noexec' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0007 /tmp mount option 'noexec' is missing."
fi
	
# TWGCB-01-008-0008 檢測修改建議
# 1. 取得根目錄的設備名稱 (ROOT_DEV)
ROOT_DEV=$(findmnt -n -o SOURCE / 2>/dev/null)
# 2. 取得 /var 目錄的設備名稱 (VAR_DEV)
VAR_DEV=$(findmnt -n -o SOURCE /var 2>/dev/null)

# 3. 判斷是否為獨立掛載
# 獨立掛載條件：
# a. /var 必須有設備名稱 (即已掛載)
# b. /var 的設備名稱不能與根目錄相同
if [ -n "$VAR_DEV" ] && [ "$VAR_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0008 /var is a separate mounted filesystem: $VAR_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0008 /var is NOT a separate mounted filesystem (Current device: $VAR_DEV)"
fi


# TWGCB-01-008-0009 檢測修改建議
# 1. 取得根目錄的設備名稱 (ROOT_DEV)
ROOT_DEV=$(findmnt -n -o SOURCE / 2>/dev/null)
# 2. 取得 /var/tmp 目錄的設備名稱 (VARTMP_DEV)
VARTMP_DEV=$(findmnt -n -o SOURCE /var/tmp 2>/dev/null)

# 3. 判斷是否為獨立掛載 (與上述相同邏輯)
if [ -n "$VARTMP_DEV" ] && [ "$VARTMP_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0009 /var/tmp is a separate mounted filesystem: $VARTMP_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0009 /var/tmp is NOT a separate mounted filesystem (Current device: $VARTMP_DEV)"
fi

# TWGCB-01-008-0010：檢查 /var/tmp 的 nodev 選項
if findmnt -n -o OPTIONS /var/tmp 2>/dev/null | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0010 /var/tmp mount option 'nodev' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0010 /var/tmp mount option 'nodev' is missing."
fi

# TWGCB-01-008-0011：檢查 /var/tmp 的 nosuid 選項
if findmnt -n -o OPTIONS /var/tmp 2>/dev/null | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0011 /var/tmp mount option 'nosuid' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0011 /var/tmp mount option 'nosuid' is missing."
fi

# TWGCB-01-008-0012：檢查 /var/tmp 的 noexec 選項
if findmnt -n -o OPTIONS /var/tmp 2>/dev/null | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0012 /var/tmp mount option 'noexec' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0012 /var/tmp mount option 'noexec' is missing."
fi


### TWGCB-01-008-0013 ####
VARLOG_DEV=$(findmnt -n -o SOURCE /var/log 2>/dev/null)
if [ -n "$VARLOG_DEV" ] && [ "$VARLOG_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0013 /var/log is a separate mounted filesystem: $VARLOG_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0013 /var/log is NOT a separate mounted filesystem (Current device: $VARLOG_DEV)"
fi

### TWGCB-01-008-0014 ####
VARLOGAUDIT_DEV=$(findmnt -n -o SOURCE /var/log/audit 2>/dev/null)
if [ -n "$VARLOGAUDIT_DEV" ] && [ "$VARLOGAUDIT_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0014 /var/log/audit is a separate mounted filesystem: $VARLOGAUDIT_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0014 /var/log/audit is NOT a separate mounted filesystem (Current device: $VARLOGAUDIT_DEV)"
fi

### TWGCB-01-008-0015 ####
HOME_DEV=$(findmnt -n -o SOURCE /home 2>/dev/null)
if [ -n "$HOME_DEV" ] && [ "$HOME_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0015 /home is a separate mounted filesystem: $HOME_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0015 /home is NOT a separate mounted filesystem (Current device: $HOME_DEV)"
fi


# TWGCB-01-008-0016 檢查 /home 的 nodev 選項
if findmnt -n -o OPTIONS /home 2>/dev/null | grep -qw "nodev"; then
    # 檢查實際掛載選項是否包含 nodev
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0016 /home mount option 'nodev' is enabled."
else
    # 實際掛載選項不包含 nodev，判定不符合
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0016 /home mount option 'nodev' is missing."
fi

# TWGCB-01-008-0017：檢查 /dev/shm 是否設定 nodev
if findmnt -n -o OPTIONS /dev/shm 2>/dev/null | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0017 /dev/shm mount option 'nodev' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0017 /dev/shm mount option 'nodev' is missing."
fi
	
# TWGCB-01-008-0018：檢查 /dev/shm 是否設定 nosuid
if findmnt -n -o OPTIONS /dev/shm 2>/dev/null | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0018 /dev/shm mount option 'nosuid' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0018 /dev/shm mount option 'nosuid' is missing."
fi
	
# TWGCB-01-008-0019：檢查 /dev/shm 是否設定 noexec
if findmnt -n -o OPTIONS /dev/shm 2>/dev/null | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0019 /dev/shm mount option 'noexec' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0019 /dev/shm mount option 'noexec' is missing."
fi
	
# TWGCB-01-008-0020：檢查抽取式媒體的 nodev 選項
# 邏輯：若無掛載媒體則 OK；若有掛載則檢查是否具備 nodev
MOUNT_PATH=$(findmnt -RA | grep -E '/run/media/|/mnt/' | awk '{print $1}' | head -n 1)

if [ -z "$MOUNT_PATH" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0020 No removable media mounted (compliant)."
elif findmnt -n -o OPTIONS "$MOUNT_PATH" | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0020 Removable media '$MOUNT_PATH' has 'nodev'."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0020 Removable media '$MOUNT_PATH' is missing 'nodev'."
fi

# TWGCB-01-008-0021：檢查抽取式媒體的 nosuid 選項
if [ -z "$MOUNT_PATH" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0021 No removable media mounted (compliant)."
elif findmnt -n -o OPTIONS "$MOUNT_PATH" | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0021 Removable media '$MOUNT_PATH' has 'nosuid'."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0021 Removable media '$MOUNT_PATH' is missing 'nosuid'."
fi

# TWGCB-01-008-0022：檢查抽取式媒體的 noexec 選項
if [ -z "$MOUNT_PATH" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0022 No removable media mounted (compliant)."
elif findmnt -n -o OPTIONS "$MOUNT_PATH" | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0022 Removable media '$MOUNT_PATH' has 'noexec'."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0022 Removable media '$MOUNT_PATH' is missing 'noexec'."
fi
	
# TWGCB-01-008-0023：檢查使用者家目錄之 nodev 選項
BAD_HOMES_23=""
# 找出 UID >= 1000 且排除 nobody 的家目錄路徑
for dir in $(awk -F: '($3>=1000)&&($1!="nobody"){print $6}' /etc/passwd | sort -u); do
    [ ! -d "$dir" ] && continue
    
    # 修正：使用 -M 檢查該目錄「本身」是否為獨立掛載點
    if findmnt -n -M "$dir" >/dev/null 2>&1; then
        if ! findmnt -n -o OPTIONS -M "$dir" | grep -qw "nodev"; then
            BAD_HOMES_23+="$dir "
        fi
    fi
done

if [ -z "$BAD_HOMES_23" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0023 All separate home partitions have 'nodev' set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0023 nodev missing on: $BAD_HOMES_23"
fi

# -----------------------------------------------------------------------------

# TWGCB-01-008-0024：檢查使用者家目錄之 nosuid 選項
BAD_HOMES_24=""
for dir in $(awk -F: '($3>=1000)&&($1!="nobody"){print $6}' /etc/passwd | sort -u); do
    [ ! -d "$dir" ] && continue
    
    # 修正：使用 -M 檢查該目錄「本身」是否為獨立掛載點
    if findmnt -n -M "$dir" >/dev/null 2>&1; then
        if ! findmnt -n -o OPTIONS -M "$dir" | grep -qw "nosuid"; then
            BAD_HOMES_24+="$dir "
        fi
    fi
done

if [ -z "$BAD_HOMES_24" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0024 All separate home partitions have 'nosuid' set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0024 nosuid missing on: $BAD_HOMES_24"
fi

# -----------------------------------------------------------------------------

# TWGCB-01-008-0025：檢查使用者家目錄之 noexec 選項
BAD_HOMES_25=""
for dir in $(awk -F: '($3>=1000)&&($1!="nobody"){print $6}' /etc/passwd | sort -u); do
    [ ! -d "$dir" ] && continue
    
    # 修正：使用 -M 檢查該目錄「本身」是否為獨立掛載點
    if findmnt -n -M "$dir" >/dev/null 2>&1; then
        if ! findmnt -n -o OPTIONS -M "$dir" | grep -qw "noexec"; then
            BAD_HOMES_25+="$dir "
        fi
    fi
done

if [ -z "$BAD_HOMES_25" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0025 All separate home partitions have 'noexec' set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0025 noexec missing on: $BAD_HOMES_25"
fi
	
####	TWGCB-01-008-0026
# 取得所有 NFS 掛載列（排除註解）
nfs_entries=$(grep -E '^[^#].*\s+nfs[4]?\s' /etc/fstab)

if [[ -z "$nfs_entries" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0026 no NFS entries found (not applicable)"
else
    if echo "$nfs_entries" | awk '{print $4}' | grep -vq "nodev"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0026 NFS nodev configuration is incorrect"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0026 NFS nodev configuration is correct"
    fi
fi

####	TWGCB-01-008-0027
# 取得所有 NFS 掛載列（排除註解）
nfs_entries=$(grep -E '^[^#].*\s+nfs[4]?\s' /etc/fstab)

if [[ -z "$nfs_entries" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0027 no NFS entries found (not applicable)"
else
    if echo "$nfs_entries" | awk '{print $4}' | grep -vq "nosuid"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0027 NFS nosuid configuration is incorrect"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0027 NFS nosuid configuration is correct"
    fi
fi


####	TWGCB-01-008-0028
# 取得所有 NFS 掛載列（排除註解）
nfs_entries=$(grep -E '^[^#].*\s+nfs[4]?\s' /etc/fstab)

if [[ -z "$nfs_entries" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0028 no NFS entries found (not applicable)"
else
    if echo "$nfs_entries" | awk '{print $4}' | grep -vq "noexec"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0028 NFS noexec configuration is incorrect"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0028 NFS noexec configuration is correct"
    fi
fi


# TWGCB-01-008-0029：檢查全域寫入目錄是否設定粘滯位 (Sticky Bit)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0029.log"
# 使用 -print0 處理空格，搜尋未設 sticky bit 的 world-writable 目錄
df --local -P | awk 'NR>1 {print $6}' | xargs -I '{}' find '{}' -xdev -type d -perm -0002 ! -perm -1000 -print0 2>/dev/null | xargs -0 -I '{}' echo "{}" >> "$LOGFILE"

if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0029 World-writable directories without sticky bit found (see $LOGFILE)"
    # 在 Log 最後一行提供萬用修復指令
    echo -e "\n[Fix Command]:\ndf --local -P | awk 'NR>1 {print \$6}' | xargs -I '{}' find '{}' -xdev -type d -perm -0002 ! -perm -1000 2>/dev/null | xargs -I '{}' chmod o+t '{}'" >> "$LOGFILE"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0029 all world-writable directories have sticky bit set"   
fi

autofs01=`systemctl is-active autofs`
    if [ "$autofs01" == "inactive" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0030 should be different to autofs Disable"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0030 should be different to autofs start for autofs.service"
    fi


if grep -q "install usb-storage /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist usb-storage" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0031 usb-storage module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0031 usb-storage module is not disabled"
fi 


###	TWGCB-01-008-0032 #### 檢查 GPG 簽章驗證是否啟用
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0032.log"

CHECK_MAIN_FILE() {
    local file="$1"
    local name="$2"

    if [ ! -f "$file" ]; then
        echo "Missing $file" >> "$LOGFILE"
        return
    fi

    # 只檢查 gpgcheck=1
    if ! grep -qE '^\s*gpgcheck\s*=\s*1' "$file"; then
        echo "$name: gpgcheck!=1 ($file)" >> "$LOGFILE"
    fi
}

CHECK_REPO_FILES() {
    for repo in /etc/yum.repos.d/*.repo; do
        # 排除 redhat.repo（由 subscription-manager 管理）
        [[ "$repo" == "/etc/yum.repos.d/redhat.repo" ]] && continue

        # 檢查 gpgcheck=1
        if ! grep -qE '^\s*gpgcheck\s*=\s*1' "$repo"; then
            echo "Repo gpgcheck!=1 ($repo)" >> "$LOGFILE"
        fi

        # 檢查 localpkg_gpgcheck=1
        if ! grep -qE '^\s*localpkg_gpgcheck\s*=\s*1' "$repo"; then
            echo "Repo localpkg_gpgcheck!=1 ($repo)" >> "$LOGFILE"
        fi
    done
}

### --- 執行檢查 --- ###
CHECK_MAIN_FILE "/etc/yum.conf" "yum.conf"
CHECK_MAIN_FILE "/etc/dnf/dnf.conf" "dnf.conf"
CHECK_REPO_FILES

### --- 結果輸出 --- ###
if [ -s "$LOGFILE" ]; then
    COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0032 Found $COUNT GPG check issues. (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0032 All gpgcheck settings comply."
fi

### TWGCB-01-008-0033 ####
	if rpm -q sudo &>/dev/null; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0033 sudo package is installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0033 sudo package is not installed"
	fi	
	

### TWGCB-01-008-0034 ####
grep -E '^[^#]*Defaults\s+use_pty' /etc/sudoers /etc/sudoers.d/* 2>/dev/null | grep -q "use_pty"
if [ $? -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0034 Defaults use_pty is set"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0034 Defaults use_pty missing"
fi
	
### TWGCB-01-008-0035 ####
grep -E '^[^#]*Defaults\s+logfile\s*=\s*"?/var/log/sudo\.log"?' /etc/sudoers /etc/sudoers.d/* 2>/dev/null | grep -q "/var/log/sudo.log"
if [ $? -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0035 Defaults logfile=\"/var/log/sudo.log\" is set"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0035 Defaults logfile=\"/var/log/sudo.log\" missing"
fi


### TWGCB-01-008-0036 ####
if rpm -q aide &>/dev/null; then
    if [ -f /var/lib/aide/aide.db.gz ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0036 AIDE installed and initialized"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0036 AIDE installed but not initialized"
    fi
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0036 AIDE not installed"
fi
	
# TWGCB-01-008-0037：設定 AIDE 定期檢查排程,定義要檢查的關鍵字與排程指令 (每天凌晨 05:00 執行)
CRON_KEYWORD="/usr/sbin/aide --check"

# 1. 檢查目前排程中是否已存在該指令
# 使用 2>/dev/null 隱藏 "no crontab for root" 訊息
if crontab -l 2>/dev/null | grep -q "$CRON_KEYWORD"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0037 AIDE schedule check already exists."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0037 AIDE schedule not exists.(0 5 * * * /usr/sbin/aide --check)"
fi

###	TWGCB-01-008-0038 ####
if [ -d /sys/firmware/efi ]; then
    # UEFI
	grep -E '^[^#].*\s+/boot/efi\s' /etc/fstab | grep -q 'uid=0' && \
	grep -E '^[^#].*\s+/boot/efi\s' /etc/fstab | grep -q 'gid=0'
	if [ $? -eq 0 ]; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0038 UEFI /boot/efi uid=0,gid=0 set"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0038 UEFI /boot/efi uid=0,gid=0 missing"
	fi
else
    # BIOS
	files=("/boot/grub2/grub.cfg" "/boot/grub2/grubenv" "/boot/grub2/user.cfg")
	result="OK"
	for f in "${files[@]}"; do
		[ -f "$f" ] || continue
		owner=$(stat -c %U:%G "$f")
		if [ "$owner" != "root:root" ]; then
			result="KO"
			break
		fi
	done
	if [ "$result" = "OK" ]; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0038 BIOS GRUB files owner:group = root:root"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0038 BIOS GRUB files owner/group incorrect"
	fi
fi
	
###	TWGCB-01-008-0039 ####
if [ -d /sys/firmware/efi ]; then
    # UEFI
    grep -E '^[^#].*\s+/boot/efi\s' /etc/fstab | grep -q 'fmask=0177'
    if [ $? -eq 0 ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0039 UEFI /boot/efi fmask=0177 set"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0039 UEFI /boot/efi fmask=0177 missing"
    fi
else
    # BIOS
    files=("/boot/grub2/grub.cfg" "/boot/grub2/grubenv" "/boot/grub2/user.cfg")
    result="OK"
    for f in "${files[@]}"; do
        [ -f "$f" ] || continue
        perm=$(stat -c %a "$f")
        if [ "$perm" -gt 600 ]; then
            result="KO"
            break
        fi
    done
    if [ "$result" = "OK" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0039 BIOS GRUB files permission ≤600"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0039 BIOS GRUB files permission >600"
    fi
fi


# TWGCB-01-008-0040 檢查 GRUB 密碼保護
#https://bhanuwriter.com/how-to-set-grub2-password/
    if [ -f "/boot/grub2/user.cfg" ] || [ -f "/boot/efi/EFI/redhat/user.cfg" ] ; then
          echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0040 GRUB password protection configuration file found." ; 
    else    
          echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0040 no grub2-setpassword(grub2-setpassword)"; 
    fi


SSHTEST01=$(grep -i '^[[:space:]]*ExecStart[[:space:]]*=' /usr/lib/systemd/system/rescue.service | awk -F= '{gsub(/[    ]/, "", $2); print $2}')
SSHTEST02=$(grep -i '^[[:space:]]*ExecStart[[:space:]]*=' /usr/lib/systemd/system/emergency.service | awk -F= '{gsub(/[    ]/, "", $2); print $2}')
    if [ "$SSHTEST01" == "-/usr/lib/systemd/systemd-sulogin-shellrescue" ] && [ "$SSHTEST02" == "-/usr/lib/systemd/systemd-sulogin-shellemergency" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0041 check ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0041 error"
    fi
	
# TWGCB-01-008-0042：檢查核心傾印功能是否停用
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0042.log"
FIX_LOG=""

# 1. 檢查 limits.conf (預期硬限制為 0)
grep -REq '^\s*\*\s+hard\s+core\s+0' /etc/security/limits.conf /etc/security/limits.d/ || \
    FIX_LOG+=" (Add '* hard core 0' to /etc/security/limits.conf)"

# 2. 檢查 sysctl 參數 (fs.suid_dumpable=0, kernel.core_pattern=|/bin/false)
[[ "$(sysctl -n fs.suid_dumpable 2>/dev/null)" != "0" ]] && FIX_LOG+=" (sysctl -w fs.suid_dumpable=0)"
[[ "$(sysctl -n kernel.core_pattern 2>/dev/null)" != "|/bin/false" ]] && FIX_LOG+=" (sysctl -w kernel.core_pattern=|/bin/false)"

# 3. 檢查 coredump.conf (Storage=none, ProcessSizeMax=0)
if [ -f /etc/systemd/coredump.conf ]; then
    grep -iq '^\s*Storage=none' /etc/systemd/coredump.conf || FIX_LOG+=" (Set Storage=none in coredump.conf)"
    grep -iq '^\s*ProcessSizeMax=0' /etc/systemd/coredump.conf || FIX_LOG+=" (Set ProcessSizeMax=0 in coredump.conf)"
fi

# 4. 檢查服務遮蔽狀態
[[ "$(systemctl is-enabled systemd-coredump.socket 2>/dev/null)" != "masked" ]] && \
    FIX_LOG+=" (systemctl mask systemd-coredump.socket)"

# --- 輸出結果 ---
if [ -z "$FIX_LOG" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0042 Core dump is disabled."
else
	echo "Core dump configuration issues found:" > "$LOGFILE"
    echo "$FIX_LOG" >> "$LOGFILE"
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0042 Core dump not fully disabled.$FIX_LOG(see $LOGFILE)"
fi
	
# TWGCB-01-008-0043 檢查記憶體位址空間配置隨機載入 (ASLR)，kernel.randomize_va_space 必須設為 2。
# GCB 設定值要求為 2
REQUIRED_VALUE="2" 
# 修復指令：建議檢查 sysctl.conf/sysctl.d 檔案，並執行 sysctl -w 立即生效
FIX_COMMAND="請檢查 /etc/sysctl.conf 或 /etc/sysctl.d/ 檔案，設定 kernel.randomize_va_space = 2，並執行 #sysctl -w kernel.randomize_va_space=2 使其生效" 

# --- 核心檢查邏輯：檢查核心運行時的實際數值 ---
CURRENT_VALUE=$(sysctl -n kernel.randomize_va_space 2>/dev/null)

if [ "$CURRENT_VALUE" == "$REQUIRED_VALUE" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0043 kernel.randomize_va_space is set to $REQUIRED_VALUE."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0043 ASLR setting error: current value is '$CURRENT_VALUE' (Expected: $REQUIRED_VALUE).($FIX_COMMAND)"
fi
		
# TWGCB-01-008-0044 檢查全系統加密原則
# 使用 --show 獲取當前作用中的策略名稱
ACTIVE_POLICY=$(update-crypto-policies --show 2>/dev/null)
if [[ "$ACTIVE_POLICY" == "FUTURE" || "$ACTIVE_POLICY" == "FIPS" ]]; then
    # 如果策略是 FUTURE 或 FIPS
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0044 Crypto policy is set to: $ACTIVE_POLICY"
else
	echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0044 Crypto policy is set to: $ACTIVE_POLICY, NOT FUTURE/FIPS(update-crypto-policies --set FUTURE && update-crypto-policies)"
fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/passwd)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0045 /etc/passwd Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0045 /etc/passwd should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/passwd)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0046 /etc/passwd Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0046 /etc/passwd should be set to 644 或 以下'"
    fi

SSHTEST=$(stat -c '%U':'%G' /etc/shadow)
SHADOW=$(stat -c '%U':'%G' /etc/shadow)
    if [ "$SSHTEST" == "root:root" -o "$SHADOW" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0047 /etc/shadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0047 /etc/shadow should be set to root:root or root:shadow'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/shadow)
    if [ $SSHTEST == "0" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0048 /etc/shadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0048 /etc/shadow should be set to 000'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/group)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0049 /etc/group Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0049 /etc/group should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/group)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0050 /etc/group Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0050 /etc/group should be set to 644 或 以下'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/gshadow)
SHADOW=$(stat -c '%U':'%G' /etc/gshadow)
    if [ "$SSHTEST" == "root:root" -o "$SHADOW" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0051 /etc/gshadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0051 /etc/gshadow should be set to root:root or root:shadow'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/gshadow)
    if [ $SSHTEST == "0" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0052 /etc/gshadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0052 /etc/gshadow should be set to 000'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/passwd-)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0053 /etc/passwd- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0053 /etc/passwd- should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/passwd-)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0054 /etc/passwd- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0054 /etc/passwd- should be set to 644 或 以下'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/shadow-)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0055 /etc/shadow- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0055 /etc/shadow- should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/shadow-)
    if [ $SSHTEST == "0" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0056 /etc/shadow- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0056 /etc/shadow- should be set to 000'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/group-)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0057 /etc/group- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0057 /etc/group- should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/group-)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0058 /etc/group- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0058 /etc/group- should be set to 644 或 以下'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/gshadow-)
SHADOW=$(stat -c '%U':'%G' /etc/gshadow-)
    if [ "$SSHTEST" == "root:root" -o "$SHADOW" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0059 /etc/gshadow- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0059 /etc/gshadow- should be set to root:root or root:shadow'"
    fi
	
cramfs01=$(stat -c %a /etc/gshadow-)
    if [ $cramfs01 -le "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0060 Check /etc/gshadow- is 0 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0060 no 0"
    fi
	
# TWGCB-01-008-0061 檢查其他使用者寫入全域檔案（World-writable files）
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0061.log"

# 遍歷所有本地掛載點，查找世界可寫入的常規文件，並寫入 LOGFILE
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    find "$FS_MOUNT" -xdev -type f -perm -0002 2>/dev/null >> "$LOGFILE"
done

if [ -s "$LOGFILE" ]; then
	FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0061 Found $FILE_COUNT file(s) with world-writable permission (o+w).(see $LOGFILE)(xargs < "$LOGFILE" -L 1 chmod o-w)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0061 No world-writable regular files found."
fi

	
# TWGCB-01-008-0062 檢查所有檔案與目錄的合法擁有者，所有檔案與目錄的擁有者 (UID) 必須在 /etc/passwd 中有對應的帳號。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0062.log"
FIX_COMMAND="請檢查 $LOGFILE 檔案列表，手動執行 chown 或 rm" 

# 遍歷所有本地掛載點，查找沒有合法擁有者的檔案或目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    # -nouser: 查找擁有者 (UID) 不在 /etc/passwd 中的檔案/目錄
    find "$FS_MOUNT" -xdev -nouser 2>/dev/null >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
	FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0062 Found $FILE_COUNT items with unknown owner UID.(see $LOGFILE)($FIX_COMMAND)"
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0062 All files/directories are owned by valid users."  
fi

# TWGCB-01-008-0063 檢查所有檔案與目錄的合法擁有群組，所有檔案與目錄的擁有群組 (GID) 必須在 /etc/group 中有對應的群組。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0063.log"
FIX_COMMAND="請檢查 $LOGFILE 檔案列表，手動執行 chgrp 或 rm" 

# 遍歷所有本地掛載點，查找沒有合法擁有群組的檔案或目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    # -nogroup: 查找擁有群組 (GID) 不在 /etc/group 中的檔案/目錄
    find "$FS_MOUNT" -xdev -nogroup 2>/dev/null >> "$LOGFILE"
done

# 檢查是否有找到違規項目
if [ -s "$LOGFILE" ]; then
    RESULT="KO"
fi

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0063 Found $FILE_COUNT items with unknown group GID.(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0063 All files/directories are owned by valid groups."
fi

# TWGCB-01-008-0064 檢查世界可寫入目錄的擁有者，World-writable 目录的擁有者必須是系統帳號 (UID <= 999)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0064.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chown root" 

# 遍歷所有本地掛載點，查找不符合要求的目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    find "$FS_MOUNT" -xdev -type d -perm -0002 -uid +999 2>/dev/null >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0064 Found $FILE_COUNT directories with non-system owner (UID > 999).(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0064 All world-writable directories are owned by system accounts."
fi

# TWGCB-01-008-0065 檢查世界可寫入目錄的擁有群組，World-writable 目录的擁有群組必須是系統群組 (GID <= 999)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0065.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chgrp root" 

# 遍歷所有本地掛載點，查找不符合要求的目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    # -type d: 查找目錄
    # -perm -0002: 權限包含 o+w (World-writable)
    # -gid +999: 且擁有群組是非系統群組 (GID >= 1000)
    find "$FS_MOUNT" -xdev -type d -perm -0002 -gid +999 2>/dev/null >> "$LOGFILE"
done

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0065 Found $FILE_COUNT directories with non-system group owner (GID > 999).(see $LOGFILE)($FIX_COMMAND)"
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0065 All world-writable directories are owned by system groups."
fi
	
# TWGCB-01-008-0066 檢查系統命令檔案權限，權限不得高於 755 (即排除 o+w, g+w) 
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0066.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chmod 755" 
SYSTEM_CMD_DIRS="/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin"

# 查找所有權限包含 /0022 (g+w 或 o+w) 的檔案，並寫入 LOGFILE
find -L $SYSTEM_CMD_DIRS -type f -perm /0022 2>/dev/null >> "$LOGFILE"
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0066 Found $FILE_COUNT command file(s) with permission > 755.(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0066 All system command files are set to 755 or less."
fi

# TWGCB-01-008-0067 檢查系統命令檔案擁有者
# 基準要求：擁有者必須是 root。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0067.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chown root" 
SYSTEM_CMD_DIRS="/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin"

# 查找所有擁有者不是 root 的檔案
# -L 遵循符號連結
find -L $SYSTEM_CMD_DIRS -type f ! -user root 2>/dev/null >> "$LOGFILE"
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0067 Found $FILE_COUNT command file(s) not owned by root.(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0067 All system command files are owned by root."
fi
	
# TWGCB-01-008-0068：系統指令檔案群組應為 root / tty / slocate / lock(apache自行決定)
BAD_FILES=$(find -L /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin ! -group root ! -group tty ! -group slocate ! -group lock -print)

if [ -z "$BAD_FILES" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0068 all system command files have correct group ownership"
else
    BAD_LIST=$(echo $BAD_FILES)
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0068 wrong group detected: $BAD_LIST (chgrp root)"
fi
	
# TWGCB-01-008-0069 找出權限高於 755 的程式庫檔案 (group/other 有 write 權限)
BAD_FILES=$(find -L /lib /lib64 /usr/lib /usr/lib64 -perm /0022 -type f 2>/dev/null)
	if [ -z "$BAD_FILES" ]; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0069 all library file permissions are 755 or more restrictive"
	else
		BAD_LIST=$(echo $BAD_FILES)
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0069 wrong permission detected: $BAD_LIST (請執行 chmod 755 <file>)"
	fi
	
# TWGCB-01-008-0070 找出擁有者不是 root 的程式庫檔案
BAD_FILES=$(find -L /lib /lib64 /usr/lib /usr/lib64 ! -user root 2>/dev/null)
	if [ -z "$BAD_FILES" ]; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0070 all library files owner is root"
	else
		BAD_LIST=$(echo $BAD_FILES)
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0070 wrong owner detected: $BAD_LIST (請執行 chown root <file>)"
	fi
	
# TWGCB-01-008-0071 檢查程式庫檔案擁有群組，程式庫檔案擁有群組必須是 root。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0071.log"
# 檢查的核心程式庫目錄
LIB_DIRS="/lib /lib64 /usr/lib /usr/lib64"
# 修復指令：建議使用 chgrp 設定為 root 群組
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chgrp root" 

# --- 核心檢查邏輯：查找擁有群組非 root 的程式庫檔案 ---
# 1. find -L [目錄列表] : 查找程式庫目錄
# 2. ! -group root : 排除擁有群組為 root 的檔案
# 3. -type f : 只針對一般檔案 (程式庫檔案)
find -L $LIB_DIRS ! -group root -type f 2>/dev/null >> "$LOGFILE"

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")  
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0071 Found $FILE_COUNT library file(s) with non-root group ownership. (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0071 All library files are owned by the root group."
fi



	
# TWGCB-01-008-0072 檢查帳號是否使用空白通行碼
NO_PASSWORD_ACCOUNTS=$(awk -F: '($2 == "" ) { print $1 }' /etc/shadow)
ACCOUNT_COUNT=$(echo "$NO_PASSWORD_ACCOUNTS" | wc -l)
if [ -z "$NO_PASSWORD_ACCOUNTS" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0072 All accounts have a password set or are locked."
else
    FIX_COMMAND="請對列出的帳號執行 #passwd <帳號名稱> 或 #passwd -l <帳號名稱>"
	NO_PASSWORD_ACCOUNTS_LIST=$(echo $NO_PASSWORD_ACCOUNTS)
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0072 Found empty password accounts:($NO_PASSWORD_ACCOUNTS_LIST) (#passwd <帳號名稱> 或 #passwd -l <帳號名稱>)"
fi
	
SSHTEST01=$(echo $PATH | tr ':' ' ' | awk '/^\.$|^\.\.$|^[^\/]/ && length($0) > 0 {print; exit}')
    if [ -z "$SSHTEST01" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0073 pass "
		
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0073 should be set to /etc/profile"
    fi
	
# TWGCB-01-008-0074 檢查 root 帳號的 PATH 變數安全性
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0074.log"
IFS=':' read -r -a PATH_DIRS <<< "$PATH"
for dir in "${PATH_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        continue
    fi
    perms=$(stat -c "%A" "$dir")
    grp_write=${perms:5:1}
    oth_write=${perms:8:1}

    if [[ "$grp_write" == "w" || "$oth_write" == "w" ]]; then
        echo "$dir ($perms)" >> "$LOGFILE"
    fi
done


if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")  
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0074 Found $FILE_COUNT unsafe PATH directories.(see $LOGFILE)(chmod g-w/o-w <dir>)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0074 Root PATH does not contain unsafe directories."
    rm -f "$LOGFILE" 2>/dev/null
fi
	
SSHTEST=$(grep -m 1 '^\+:' /etc/passwd)
    if [ -z "$SSHTEST" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0075 grep -m 1 '^\+:' /etc/passwd is ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0075 grep -m 1 '^\+:' /etc/passwd del + "$SSHTEST
    fi
	
SSHTEST=$(grep -m 1 '^\+:' /etc/shadow)
    if [ -z "$SSHTEST" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0076 grep -m 1 '^\+:' /etc/shadow is ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0076 grep -m 1 '^\+:' /etc/shadow del + "$SSHTEST
    fi
	
SSHTEST=$(grep -m 1 '^\+:' /etc/group)
    if [ -z "$SSHTEST" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0077 grep -m 1 '^\+:' /etc/group is ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0077 grep -m 1 '^\+:' /etc/group del + "$SSHTEST
    fi
	
SSHTEST=$(awk -F: '($3 == 0) { print $1 }' /etc/passwd)
    if [ "$SSHTEST" == "root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0078 Check ok"
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0078 error"
    fi
	
######TWGCB-01-008-0079######
# 排除系統帳號
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0079.log"
result=0
# 清空舊紀錄
grep -E -v '^(halt|sync|shutdown)' /etc/passwd \
    | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' \
    | while IFS=" " read -r user dir; do

    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue

    if [ -d "$dir" ]; then
        perm=$(stat -c "%A" "$dir")
        if [[ ${perm:4:1} == "w" || ${perm:7:3} != "---" ]]; then
            echo "User $user home ($dir) has insecure permission: $perm" >> "$LOGFILE"
            result=1
        fi
    fi
done

if [ "$result" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0079 home directory permissions are secure"
    rm -f "$LOGFILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0079 insecure home directory permissions found (see $LOGFILE)"
fi
###### TWGCB-01-008-0080 ######
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0080.log"
result=0

# 排除系統帳號
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"

while IFS=":" read -r user _ _ _ _ dir shell; do
	# 只檢查 /home 目錄 排除系統帳號
    [[ "$dir" != /home/* ]] && continue
    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue
    if [ ! -d "$dir" ]; then
        echo "The home directory ($dir) of user $user does not exist." >> "$LOGFILE"
        result=1
    else
        owner=$(stat -L -c "%U" "$dir")
        if [ "$owner" != "$user" ]; then
            echo "The home directory ($dir) of user $user is owned by $owner." >> "$LOGFILE"
            result=1
        fi
    fi
done < /etc/passwd

if [ "$result" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0080 all home directories owned by correct user"
    rm -f "$LOGFILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0080 home directory ownership issues found (see $LOGFILE)"
fi



	
###### TWGCB-01-008-0081 ######
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0081.log"
result=0
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"
while IFS=":" read -r user _ gid _ _ dir shell; do
	# 只檢查 /home 目錄 排除系統帳號
    [[ "$dir" != /home/* ]] && continue
    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue

    if [ -d "$dir" ]; then
        group_owner=$(stat -L -c "%G" "$dir")           # 實際群組名稱
        expected_gid_name=$(getent group "$gid" | cut -d: -f1)   # 預期群組名稱
        if [ "$group_owner" != "$expected_gid_name" ]; then
            echo "The home directory ($dir) of user $user should be group $expected_gid_name but is $group_owner.(chgrp $user $dir)" >> "$LOGFILE"
            result=1
        fi
    else
        echo "The home directory ($dir) of user $user does not exist." >> "$LOGFILE"
        result=1
    fi
done < /etc/passwd
if [ "$result" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0081 all home directories have correct group ownership"
    rm -f "$LOGFILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0081 home directory group ownership issues found (see $LOGFILE)"
fi

# TWGCB-01-008-0082 檢查使用者家目錄內 dotfiles (.xxx) 是否具有 group/other 可寫入權限
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0082.log"

# 只檢查 root + UID >= 1000 的一般使用者（排除系統帳號）
awk -F: '($3 == 0 || $3 >= 1000) { print $1 " " $6 }' /etc/passwd \
| while read -r USER HOMEDIR; do
    
    # 家目錄不存在 → 不檢查，也不列為異常
    [ ! -d "$HOMEDIR" ] && continue

    # dotfiles
    for FILE in "$HOMEDIR"/.[A-Za-z0-9]*; do
        [ ! -e "$FILE" ] && continue
        [ -h "$FILE" ] && continue
        [ ! -f "$FILE" ] && continue

        PERM=$(stat -c "%A" "$FILE")

        if [ "${PERM:5:1}" != "-" ]; then
            echo "Group-writable: $FILE ($PERM)" >> "$LOGFILE"
        fi
        if [ "${PERM:8:1}" != "-" ]; then
            echo "Other-writable: $FILE ($PERM)" >> "$LOGFILE"
        fi
    done
done

# 判斷
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0082 Found $FILE_COUNT insecure dotfile(s) under user home directories. (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0082 No insecure dotfile permissions detected."
fi

# TWGCB-01-008-0083 Check for .forward files in user home directories
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0083.log"

# 只檢查 root 以及 UID >= 1000 的一般使用者（排除系統帳號）
awk -F: '($3 == 0 || $3 >= 1000) { print $1 " " $6 }' /etc/passwd \
| while read -r USER HOMEDIR; do

    # 跳過不存在的家目錄（例如 nfsnobody、某些 service user）
    [ ! -d "$HOMEDIR" ] && continue

    FILE="$HOMEDIR/.forward"

    # 若 .forward 存在且不是 symlink 就記錄
    if [ -f "$FILE" ] && [ ! -h "$FILE" ]; then
        echo "$FILE exists" >> "$LOGFILE"
    fi
done

# 判斷
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0083 Found $FILE_COUNT .forward file(s). (see $LOGFILE) (rm <file>)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0083 No .forward files detected."
fi
	

# TWGCB-01-008-0084 檢查使用者家目錄之「.netrc」檔案
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0084.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 rm" 

# --- 核心檢查邏輯：查找 .netrc 檔案 ---
# 只檢查 root + UID >= 1000 的一般使用者（排除系統帳號和非互動式帳號）
grep -E -v '^(root|halt|sync|shutdown)' /etc/passwd | \
awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | \
while read -r USER HOMEDIR; do
    
    # 家目錄不存在 → 跳過
    [ ! -d "$HOMEDIR" ] && continue

    NETRC_FILE="$HOMEDIR/.netrc"
    
    # 檢查 .netrc 檔案是否存在且不是符號連結 (GBC 檢查方法)
    # 這是因為 .netrc 檔案包含帳號和明文通行碼 
    if [ ! -h "$NETRC_FILE" ] && [ -f "$NETRC_FILE" ]; then
        echo "$NETRC_FILE" >> "$LOGFILE"
    fi
done

# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0084 Found $FILE_COUNT .netrc file(s). (see $LOGFILE)($FIX_COMMAND)" 
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0084 No .netrc files found in user home directories."
fi

###### TWGCB-01-008-0085 ######
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0085.log"
# 排除系統帳號
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"
while IFS=":" read -r user _ _ _ _ dir shell; do
    [[ "$dir" != /home/* ]] && continue
    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue
    if [ -d "$dir" ]; then
        if [ -f "$dir/.rhosts" ] && [ ! -h "$dir/.rhosts" ]; then
            echo ".rhosts file exists: $dir/.rhosts" >> "$LOGFILE"
        fi
    else
        echo "The home directory ($dir) of user $user does not exist." >> "$LOGFILE"
    fi
done < /etc/passwd

if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0085 .rhosts files exist (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0085 no .rhosts files found"
fi
	
# TWGCB-01-008-0086 檢查 /etc/passwd 檔案設定之群組是否皆存在於 /etc/group
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0086.log"
FIX_COMMAND="請手動檢查 $LOGFILE 帳號，並使用 usermod -g/groupmod 調整 GID"
# --- 核心檢查邏輯：查找孤兒 GID ---
# 1. 取得 /etc/passwd 中所有唯一的 GID (第 4 欄)
# 2. 遍歷每個 GID (變數 $i)
# 3. 在 /etc/group 中查找該 GID (grep -q -P "^.*?:[^:]*:$i:")
for GID_ID in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
    # 檢查 /etc/group 中是否存在該 GID
    if ! grep -q -P "^.*?:[^:]*:$GID_ID:" /etc/group; then
        
        # 找到違規的 GID，尋找哪些使用者使用了這個 GID
        ORPHAN_USERS=$(awk -F: -v target_gid="$GID_ID" '($4 == target_gid) { print $1 }' /etc/passwd | xargs)
        
        echo "Orphan GID $GID_ID is referenced by users: $ORPHAN_USERS (Primary Group Missing)" >> "$LOGFILE"
    fi
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0086 Found $FILE_COUNT orphaned GID references. (see $LOGFILE)($FIX_COMMAND)"    
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0086 All primary GIDs in /etc/passwd exist in /etc/group."
fi


# TWGCB-01-008-0087 檢查所有使用者帳號是否具備唯一 UID
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0087.log"
# 修復指令：建議使用 usermod 調整 UID
FIX_COMMAND="請手動檢查 $LOGFILE 帳號，並使用 #usermod -u <新UID> <帳號名稱> 調整 UID" 

# --- 核心檢查邏輯：查找重複的 UID ---
# GCB 文件中的腳本邏輯如下：
# 1. cut -f3 -d":" /etc/passwd : 提取所有 UID (第 3 欄)
# 2. sort -n : 數字排序
# 3. uniq -c : 統計每個 UID 出現的次數
# 4. while read x ... if [ $1 -gt 1 ] : 找出重複次數 > 1 的 UID
# 5. awk -F: ... : 找出使用該重複 UID 的所有帳號
cut -f3 -d":" /etc/passwd | sort -n | uniq -c | while read x ; do    
    # 腳本中用於處理空行和格式的邊界條件
    [ -z "$x" ] && continue    
    # $1 是計數，$2 是重複的 UID
    set - $x
    COUNT=$1
    DUPLICATE_UID=$2   
    if [ "$COUNT" -gt 1 ]; then
        # 找到重複的 UID，列出所有使用該 UID 的帳號
        ORPHAN_USERS=$(awk -F: -v target_uid="$DUPLICATE_UID" '($3 == target_uid) { print $1 }' /etc/passwd | xargs)        
        echo "Duplicate UID $DUPLICATE_UID found, shared by: $ORPHAN_USERS" >> "$LOGFILE"
    fi
done

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")  
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0087 Found $FILE_COUNT unique UIDs shared by multiple accounts. (see $LOGFILE)($FIX_COMMAND)"    
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0087 All user accounts have unique UIDs."
fi
# TWGCB-01-008-0088 檢查所有群組是否具備唯一 GID
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0088.log"
# 修復指令：建議使用 groupmod 調整 GID
FIX_COMMAND="請手動檢查 $LOGFILE 群組，並使用 #groupmod -g <新GID> <群組名稱> 調整 GID" 

# --- 核心檢查邏輯：查找重複的 GID ---
# 1. cut -d: -f3 /etc/group : 提取所有 GID (第 3 欄)
# 2. sort : 排序
# 3. uniq -d : 僅顯示重複的行 (即重複的 GID)
# 4. while read GID : 對每個重複的 GID 進行處理
cut -d: -f3 /etc/group | sort | uniq -d | while read -r DUPLICATE_GID; do
    # 找到重複的 GID，尋找哪些群組使用了這個 GID
    # 在 /etc/group 中查找該 GID 的群組名稱
    DUPLICATE_GROUPS=$(awk -F: -v target_gid="$DUPLICATE_GID" '($3 == target_gid) { print $1 }' /etc/group | xargs)   
    echo "Duplicate GID $DUPLICATE_GID found, shared by groups: $DUPLICATE_GROUPS" >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE") 
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0088 Found $FILE_COUNT unique GIDs shared by multiple groups. (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0088 All groups have unique GIDs."
fi



# TWGCB-01-008-0089 檢查所有使用者帳號名稱是否唯一，確保 /etc/passwd 檔案中的所有使用者帳號名稱皆不重複。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0089.log"
# 修復指令：建議手動編輯 /etc/passwd 檔案或移除重複帳號
FIX_COMMAND="請手動檢查 $LOGFILE 帳號，並編輯 /etc/passwd 檔案或移除重複帳號" 

# --- 核心檢查邏輯：查找重複的帳號名稱 ---
# 1. cut -d: -f1 /etc/passwd : 提取所有帳號名稱 (第 1 欄)
# 2. sort : 排序
# 3. uniq -d : 僅顯示重複的帳號名稱
# 4. while read x : 對每個重複的帳號名稱進行處理
cut -d: -f1 /etc/passwd | sort | uniq -d | while read -r DUPLICATE_NAME; do
    # 將重複的帳號名稱寫入日誌
    echo "Duplicate login name found: $DUPLICATE_NAME" >> "$LOGFILE"
done
# --- 輸出結果：使用 -s 判斷 ---
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0089 Found $FILE_COUNT duplicate login name(s). (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0089 All user accounts have unique login names."
fi




# TWGCB-01-008-0090 檢查所有群組名稱是否唯一， 確保 /etc/group 檔案中的所有群組名稱皆不重複。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0090.log"
# 修復指令：建議手動編輯 /etc/group 檔案或移除重複群組
FIX_COMMAND="請手動檢查 $LOGFILE 群組，並編輯 /etc/group 檔案或移除重複群組" 

# --- 核心檢查邏輯：查找重複的群組名稱 ---
# 1. cut -d: -f1 /etc/group : 提取所有群組名稱 (第 1 欄)
# 2. sort : 排序
# 3. uniq -d : 僅顯示重複的群組名稱
# 4. while read x : 對每個重複的群組名稱進行處理
cut -d: -f1 /etc/group | sort | uniq -d | while read -r DUPLICATE_NAME; do
    echo "Duplicate group name found: $DUPLICATE_NAME" >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0090 Found $FILE_COUNT duplicate group name(s). (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0090 All group names are unique."
fi

	
cramfs01=`awk -F: '($1=="shadow") {print $NF}' /etc/group && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0091 Check ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0091 /etc/group is users"
    fi
	
	if rpm -q xinetd &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0092 xinetd package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0092 xinetd package is not installed"
	fi
	
	if grep -E '^\s*(server|pool)\s+' /etc/chrony.conf &>/dev/null; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0093 chrony has NTP server configured"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0093 chrony has no NTP server configured"
	fi

	
# TWGCB-01-008-0094：檢查 rsyncd 服務是否已遮蔽 (Masked)
SERVICE_NAME="rsyncd"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"

# 檢查該服務是否已經被 mask
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0094 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0094 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0095 檢查 avahi-daemon 服務狀態 (應停用)，avahi-daemon.service 和 avahi-daemon.socket 應同時被 mask 以減少攻擊面。
# 修復指令：建議遮蔽服務和 socket
FIX_COMMAND="請執行指令 #systemctl --now mask avahi-daemon.service avahi-daemon.socket"
# 檢查服務是否被 mask
svc_status=$(systemctl is-enabled avahi-daemon.service 2>/dev/null)
sock_status=$(systemctl is-enabled avahi-daemon.socket 2>/dev/null)

if [[ "$svc_status" != "masked" || "$sock_status" != "masked" ]]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0095 avahi-daemon is NOT properly disabled/masked.($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0095 avahi-daemon is disabled/masked"
fi

	
# TWGCB-01-008-0096：檢查是否停用 SNMP 服務
SERVICE_NAME="snmpd"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0096 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0096 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0097：檢查是否停用 Squid 服務
SERVICE_NAME="squid"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0097 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0097 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0098：檢查是否停用 Samba 服務
SERVICE_NAME="smb"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0098 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0098 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0099：檢查是否停用 FTP 服務 (vsftpd)
SERVICE_NAME="vsftpd"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0099 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0099 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0100：檢查是否停用 NIS 伺服器服務
SERVICE_NAME="ypserv"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0100 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0100 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0101：檢查是否啟用 kdump 服務 
# 說明：kdump 用於系統當機時傾印記憶體資訊，以供後續除錯修復。
SERVICE_NAME="kdump.service"
FIX_COMMAND="systemctl --now enable $SERVICE_NAME"
if systemctl is-enabled $SERVICE_NAME &>/dev/null && systemctl is-active $SERVICE_NAME &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0101 $SERVICE_NAME is active."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0101 $SERVICE_NAME service issue. ($FIX_COMMAND)"
fi
	
	if rpm -q ypbind &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0102 ypbind package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0102 ypbind package is not installed"
	fi

	if rpm -q telnet &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0103 telnet package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0103 telnet package is not installed"
	fi	

	if rpm -q telnet-server &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0104 telnet-server package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0104 telnet-server package is not installed"
	fi	

	if rpm -q rsh-server &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0105 rsh-server package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0105 rsh-server package is not installed"
	fi	

	if rpm -q tftp-server &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0106 tftp-server package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0106 tftp-server package is not installed"
	fi

	
# 檢查 yum.conf
YUM_CHECK=$(grep -i '^clean_requirements_on_remove' /etc/yum.conf | awk -F= '{print $2}' | tr -d ' ')
# 檢查 dnf.conf
DNF_CHECK=$(grep -i '^clean_requirements_on_remove' /etc/dnf/dnf.conf | awk -F= '{print $2}' | tr -d ' ')

if [[ "$YUM_CHECK" == "True" || "$YUM_CHECK" == "true" ]] && [[ "$DNF_CHECK" == "True" || "$DNF_CHECK" == "true" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0107 clean_requirements_on_remove is enabled in yum/dnf"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0107 clean_requirements_on_remove is not enabled"
fi

# IPv4 與 IPv6 Forwarding 狀態
IPV4_FORWARD=$(sysctl -n net.ipv4.ip_forward)
IPV6_FORWARD=$(sysctl -n net.ipv6.conf.all.forwarding)

if [ "$IPV4_FORWARD" -eq 0 ] && [ "$IPV6_FORWARD" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0108 IP forwarding is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0108 IP forwarding is enabled"
fi

	
# 所有網路介面傳送ICMP重新導向封包
IPV4_redirects=$(sysctl -n net.ipv4.conf.all.send_redirects)

if [ "$IPV4_redirects" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0109 IP redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0109 IP redirects are enabled(sysctl -w net.ipv4.conf.all.send_redirects=0)"
fi


# 檢查 IPv4 default ICMP redirects 狀態
DEFAULT_redirects=$(sysctl -n net.ipv4.conf.default.send_redirects)

if [ "$DEFAULT_redirects" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0110 default IP redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0110 default IP redirects are enabled(sysctl -w net.ipv4.conf.default.send_redirects=0)"
fi

# 檢查 IPv4 與 IPv6 accept_source_route 狀態
IPV4_SR=$(sysctl -n net.ipv4.conf.all.accept_source_route)
IPV6_SR=$(sysctl -n net.ipv6.conf.all.accept_source_route)
if [ "$IPV4_SR" -eq 0 ] && [ "$IPV6_SR" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0111 IPv4 IPv6 source routing is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0111 IPv4 IPv6source routing is enabled"
fi

# 檢查 IPv4 與 IPv6 預設介面 accept_source_route 狀態
IPV4_SR=$(sysctl -n net.ipv4.conf.default.accept_source_route)
IPV6_SR=$(sysctl -n net.ipv6.conf.default.accept_source_route)
if [ "$IPV4_SR" -eq 0 ] && [ "$IPV6_SR" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0112 IPv4 IPv6 default interface source routing is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0112 IPv4 IPv6 default interface source routing is enabled"
fi

# 檢查 IPv4 與 IPv6 all interface accept_redirects 狀態
IPV4_RED=$(sysctl -n net.ipv4.conf.all.accept_redirects)
IPV6_RED=$(sysctl -n net.ipv6.conf.all.accept_redirects)
if [ "$IPV4_RED" -eq 0 ] && [ "$IPV6_RED" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0113 IPv4 IPv6 all interfaces ICMP redirects are blocked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0113 IPv4 IPv6 all interfaces ICMP redirects are enabled"
fi

#TWGCB-01-008-0114
IPV4_DEFAULT_ACCEPT=$(sysctl -n net.ipv4.conf.default.accept_redirects)
IPV6_DEFAULT_ACCEPT=$(sysctl -n net.ipv6.conf.default.accept_redirects)

if [ "$IPV4_DEFAULT_ACCEPT" -eq 0 ] && [ "$IPV6_DEFAULT_ACCEPT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0114 default interfaces accept redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0114 default interfaces accept redirects are enabled"
fi

#TWGCB-01-008-0115
SECURE_REDIRECTS=$(sysctl -n net.ipv4.conf.all.secure_redirects)

if [ "$SECURE_REDIRECTS" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0115 IPv4 all interfaces secure redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0115 IPv4 all interfaces secure redirects are enabled"
fi


#TWGCB-01-008-0116
IPV4_DEFAULT_SECURE=$(sysctl -n net.ipv4.conf.default.secure_redirects)

if [ "$IPV4_DEFAULT_SECURE" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0116 default interfaces secure redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0116 default interfaces secure redirects are enabled"
fi

#TWGCB-01-008-0117
LOG_MARTIANS=$(sysctl -n net.ipv4.conf.all.log_martians)

if [ "$LOG_MARTIANS" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0117 log martians is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0117 log martians is disabled"
fi

#TWGCB-01-008-0118
LOG_MARTIANS_DEFAULT=$(sysctl -n net.ipv4.conf.default.log_martians)

if [ "$LOG_MARTIANS_DEFAULT" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0118 default interface log martians is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0118 default interface log martians is disabled"
fi

#TWGCB-01-008-0119
ICMP_BROADCAST=$(sysctl -n net.ipv4.icmp_echo_ignore_broadcasts)

if [ "$ICMP_BROADCAST" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0119 ICMP echo broadcasts are ignored"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0119 ICMP echo broadcasts are NOT ignored"
fi

#TWGCB-01-008-0120
ICMP_BOGUS=$(sysctl -n net.ipv4.icmp_ignore_bogus_error_responses)

if [ "$ICMP_BOGUS" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0120 ICMP bogus error responses are ignored"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0120 ICMP bogus error responses are NOT ignored"
fi

#TWGCB-01-008-0121
RP_FILTER=$(sysctl -n net.ipv4.conf.all.rp_filter)
if [ "$RP_FILTER" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0121 Reverse path filtering (rp_filter) is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0121 Reverse path filtering (rp_filter) is NOT enabled"
fi

#TWGCB-01-008-0122
RP_FILTER_DEFAULT=$(sysctl -n net.ipv4.conf.default.rp_filter)
if [ "$RP_FILTER_DEFAULT" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0122 Default interface reverse path filtering (rp_filter) is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0122 Default interface reverse path filtering (rp_filter) is NOT enabled"
fi

#TWGCB-01-008-0123
TCP_SYNC=$(sysctl -n net.ipv4.tcp_syncookies)
if [ "$TCP_SYNC" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0123 TCP SYN cookies is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0123 TCP SYN cookies is NOT enabled"
fi

#TWGCB-01-008-0124
ACCEPT_RA=$(sysctl -n net.ipv6.conf.all.accept_ra)

if [ "$ACCEPT_RA" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0124 IPv6 router advertisement is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0124 IPv6 router advertisement is ENABLED"
fi

#TWGCB-01-008-0125
# 檢查 /etc/modprobe.d/ 下是否有 dccp.conf 或其他禁止 dccp 的設定
if grep -Eiq '^\s*(install\s+dccp\s+/bin/true|blacklist\s+dccp)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0126 dccp module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0126 dccp module is NOT disabled/blacklisted"
fi

###	TWGCB-01-008-0127 ####
# 檢查 /etc/modprobe.d/ 下是否有 sctp.conf 或其他禁止 sctp 的設定
if grep -Eiq '^\s*(install\s+sctp\s+/bin/true|blacklist\s+sctp)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0127 sctp module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0127 sctp module is NOT disabled/blacklisted"
fi

###	TWGCB-01-008-0128 ####
# 檢查 /etc/modprobe.d/ 下是否有 rds.conf 或其他禁止 rds 的設定
if grep -Eiq '^\s*(install\s+rds\s+/bin/true|blacklist\s+rds)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0128 rds module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0128 rds module is NOT disabled/blacklisted"
fi

###	TWGCB-01-008-0129 ####
# 檢查 /etc/modprobe.d/ 下是否有 tipc.conf 或其他禁止 tipc 的設定
if grep -Eiq '^\s*(install\s+tipc\s+/bin/true|blacklist\s+tipc)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0129 tipc module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0129 tipc module is NOT disabled/blacklisted"
fi

###	TWGCB-01-008-0130 ####
# 檢查 nmcli 是否存在
if command -v nmcli >/dev/null 2>&1; then
    wifi_status=$(nmcli radio wifi)
    if [ "$wifi_status" == "disabled" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0130 wireless interfaces are disabled"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0130 wireless interfaces are still enabled(nmcli radio all off)"
    fi
	else
    echo -e " [\e[1;33mWARN\e[0m] nmcli not installed, cannot check wireless status"
	fi


# TWGCB-01-008-0131 檢查網路介面混雜模式是否已停用，網路介面不得處於混雜模式 (promiscuous mode)。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0131.log"
# 修復指令：建議使用 ip link set dev <介面名稱> promisc off 關閉
FIX_COMMAND="請針對日誌中的介面執行 #ip link set dev <介面名稱> multicast off promisc off" 

# --- 核心檢查邏輯：查找處於 promisc 狀態的介面 ---
# 使用 ip link 檢查所有網路介面狀態，並過濾包含 'promisc' 字樣的行
# 這些行通常顯示在介面的狀態資訊中
ip link | grep -i promisc 2>/dev/null | while read -r LINE; do
    
    # 提取介面名稱 (通常在每行的第二個欄位，格式通常是 <index>: <name>: )
    # 這裡假設介面名稱在第二個欄位且不包含冒號
    INTERFACE_NAME=$(echo "$LINE" | awk '{print $2}' | tr -d ':')
    
    # 將違規的介面名稱和其狀態寫入日誌
    if [ -n "$INTERFACE_NAME" ]; then
        echo "$INTERFACE_NAME is in promiscuous mode. Full status: $LINE" >> "$LOGFILE"
    fi
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0131 Found $FILE_COUNT network interface(s) in promiscuous mode. (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0131 No network interfaces detected in promiscuous mode."
fi
	
# TWGCB-01-008-0132 檢查 auditd 套件是否已安裝	
	if rpm -q audit >/dev/null 2>&1 && rpm -q audit-libs >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0132 auditd and audit-libs are installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0132 auditd and/or audit-libs not installed"
	fi
	
# TWGCB-01-008-0133：檢查 auditd 服務是否啟用且正在執行
SERVICE_NAME="auditd"
FIX_COMMAND="systemctl --now enable $SERVICE_NAME"
if systemctl is-enabled $SERVICE_NAME &>/dev/null && systemctl is-active $SERVICE_NAME &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0133 $SERVICE_NAME service is active."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0133 $SERVICE_NAME service issue. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0134：檢查 GRUB 是否設定 audit=1
	if grep -qE '^\s*GRUB_CMDLINE_LINUX=.*audit=1' /etc/default/grub; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0134 audit=1 is set in GRUB_CMDLINE_LINUX"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0134 audit=1 is not set in GRUB_CMDLINE_LINUX"
	fi
	
# TWGCB-01-008-0135：檢查 GRUB 是否設定 audit_backlog_limit=8192
	if grep -qE '^\s*GRUB_CMDLINE_LINUX=.*audit_backlog_limit=8192' /etc/default/grub; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0135 audit_backlog_limit=8192 is set in GRUB_CMDLINE_LINUX"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0135 audit_backlog_limit=8192 is not set in GRUB_CMDLINE_LINUX"
	fi
	
# TWGCB-01-008-0136：檢查 /etc/aliases 是否設定 postmaster 通知 root
	if grep -qE '^\s*postmaster:\s*root' /etc/aliases; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0136 postmaster alias is set to root"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0136 postmaster alias is not set to root"
	fi
	
# TWGCB-01-008-0137：檢查稽核日誌檔案所有權是否為 root:root

# 取得設定檔中 log_file 參數
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若設定檔未指定則預設為 /var/log/audit/audit.log
	[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

	if [[ -f "$log_file" ]]; then
	owner=$(stat -c "%U:%G" "$log_file")
		if [[ "$owner" == "root:root" ]]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0137 $log_file owner is root:root"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0137 $log_file owner is $owner (expected root:root)"
		fi
	else
		echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-008-0137 $log_file not found"
	fi
	
# TWGCB-01-008-0138：檢查稽核日誌檔案權限是否為600或更低

# 讀取 auditd 設定檔中指定的 log_file 路徑
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若設定中未指定，預設為 /var/log/audit/audit.log
[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

# 檢查檔案是否存在
if [[ -f "$log_file" ]]; then
    perm=$(stat -c "%a" "$log_file")
    if [[ "$perm" -le 600 ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0138 $log_file permission is $perm (<=600)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0138 $log_file permission is $perm (should be <=600)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-008-0138 $log_file not found"
fi

# TWGCB-01-008-0139：檢查稽核日誌目錄所有權
# 讀取 auditd 設定檔中 log_file 的路徑
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若未指定，預設為 /var/log/audit/audit.log
[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

# 取得稽核日誌目錄
log_dir=$(dirname "$log_file")

# 檢查目錄是否存在
if [[ -d "$log_dir" ]]; then
    owner=$(stat -c "%U:%G" "$log_dir")
    if [[ "$owner" == "root:root" ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0139 $log_dir owner is root:root"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0139 $log_dir owner is $owner (should be root:root)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-008-0139 $log_dir not found"
fi
	
# TWGCB-01-008-0140：檢查稽核日誌目錄權限

# 讀取 auditd 設定檔中 log_file 的路徑
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若未指定，預設為 /var/log/audit/audit.log
[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

# 取得稽核日誌目錄
log_dir=$(dirname "$log_file")

# 檢查目錄是否存在
if [[ -d "$log_dir" ]]; then
    perms=$(stat -c "%a" "$log_dir")
    if [[ "$perms" -le 700 ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0140 $log_dir permissions are $perms (<=700)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0140 $log_dir permissions are $perms (should be <=700)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-008-0140 $log_dir not found"
fi


# TWGCB-01-008-0141：檢查稽核規則檔案權限
audit_rules_file="/etc/audit/rules.d/audit.rules"

if [[ -f "$audit_rules_file" ]]; then
    perms=$(stat -c "%a" "$audit_rules_file")
    if [[ "$perms" -le 600 ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0141 $audit_rules_file permissions are $perms (<=600)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0141 $audit_rules_file permissions are $perms (should be <=600)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-008-0141 $audit_rules_file not found"
fi


# TWGCB-01-008-0142：檢查稽核設定檔案權限
audit_conf_file="/etc/audit/auditd.conf"

if [[ -f "$audit_conf_file" ]]; then
    perms=$(stat -c "%a" "$audit_conf_file")
    if [[ "$perms" -le 640 ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0142 $audit_conf_file permissions are $perms (<=640)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0142 $audit_conf_file permissions are $perms (should be <=640)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-008-0142 $audit_conf_file not found"
fi


### TWGCB-01-008-0143 ####
# 稽核工具權限應為 750 或更低
TOOLS="/sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/audisp-remote /sbin/audisp-syslog /sbin/augenrules /sbin/rsyslogd"
RESULT="OK"

for TOOL in $TOOLS; do
    if [ -f "$TOOL" ]; then
        PERM=$(stat -c %a "$TOOL")
        if [ "$PERM" -gt 750 ]; then
            RESULT="KO"
            echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0143 $TOOL permission $PERM > 750"
        fi
    fi
done

if [ "$RESULT" = "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0143 all existing tools permission ≤ 750"
fi

### TWGCB-01-008-0144 ####
# 稽核工具擁有者與群組應為 root:root
TOOLS="/sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/audisp-remote /sbin/audisp-syslog /sbin/augenrules /sbin/rsyslogd"

RESULT="OK"

for TOOL in $TOOLS; do
    if [ -f "$TOOL" ]; then
        OWNER_GROUP=$(ls -l "$TOOL" | awk '{print $3 ":" $4}')
        if [ "$OWNER_GROUP" != "root:root" ]; then
            RESULT="KO"
		    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0144 no root:root"	
        fi
    fi
done

if [ "$RESULT" = "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0144 all owner:group = root:root"
fi


# TWGCB-01-008-0145：檢查稽核工具保護設定
aide_conf="/etc/aide.conf"
tools=(
"/usr/sbin/auditctl"
"/usr/sbin/auditd"
"/usr/sbin/ausearch"
"/usr/sbin/aureport"
"/usr/sbin/autrace"
"/usr/sbin/audisp-remote"
"/usr/sbin/audisp-syslog"
"/usr/sbin/augenrules"
)
missing=0


if [[ ! -f "$aide_conf" ]]; then
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-008-0145 $aide_conf not found"
fi

for tool in "${tools[@]}"; do
    if ! grep -q "^$tool p+i+n+u+g+s+b+acl+xattrs+sha512" "$aide_conf"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0145 $tool not protected in aide.conf"
        missing=1
    fi
done

if [[ "$missing" -eq 0 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0145 all audit tools are protected in aide.conf"
fi



MAX_LOG=$(grep -E '^\s*max_log_file\s*=' /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')
if [ "$MAX_LOG" = "32" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0146 max_log_file is set to 32MB"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0146 max_log_file is not 32MB"
fi

audit01=`grep -i '^[[:space:]]*max_log_file_action[[:space:]]*=' /etc/audit/auditd.conf | awk -F= '{gsub(/[ 	]/, "", $2); print $2}' | paste -sd ";"`
    if [ "$audit01" == "keep_logs" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0147 max_log_file_action = keep_logs"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0147 should be different to max_log_file_action = keep_logs"
    fi
	
cramfs01=`grep -q '^[-]'"w /etc/sudoers -p wa -k scope" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"w /etc/sudoers.d/ -p wa -k scope" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0148 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0148 should be different to add audit rules"
    fi
	
cramfs01=`grep -q '^[-]'"w /var/run/faillock/ -p wa -k logins" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"w /var/log/lastlog -p wa -k logins" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0149 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0149 should be different to add audit rules"
    fi
	
cramfs01=`grep -q '^[-]'"w /var/run/utmp -p wa -k session" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"w /var/log/wtmp -p wa -k logins" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs03=`grep -q '^[-]'"w /var/log/btmp -p wa -k logins" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] && [ "$cramfs03" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0150 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0150 should be different to add audit rules"
    fi
	
cramfs01=`grep -q '^[-]'"a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs03=`grep -q '^[-]'"a always,exit -F arch=b64 -S clock_settime -k time-change" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs04=`grep -q '^[-]'"a always,exit -F arch=b32 -S clock_settime -k time-change" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs05=`grep -q '^[-]'"w /etc/localtime -p wa -k time-change" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] && [ "$cramfs03" == "0" ] && [ "$cramfs04" == "0" ] && [ "$cramfs05" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0151 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0151 should be different to add audit rules"
    fi
	
cramfs01=`grep -q '^[-]'"w /etc/selinux/ -p wa -k MAC-policy" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"w /usr/share/selinux/ -p wa -k MAC-policy" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0152 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0152 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale" /etc/audit/rules.d/audit.rules`
cramfs02=`grep '^[-]'"a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale" /etc/audit/rules.d/audit.rules`
cramfs03=`grep '^[-]'"w /etc/issue -p wa -k system-locale" /etc/audit/rules.d/audit.rules`
cramfs04=`grep '^[-]'"w /etc/issue.net -p wa -k system-locale" /etc/audit/rules.d/audit.rules`
cramfs05=`grep '^[-]'"w /etc/sysconfig/network-scripts/ -p wa -k system-locale" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale" ] && [ "$cramfs02" == "-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale" ] && [ "$cramfs03" == "-w /etc/issue -p wa -k system-locale" ] && [ "$cramfs04" == "-w /etc/issue.net -p wa -k system-locale" ] && [ "$cramfs05" == "-w /etc/sysconfig/network-scripts/ -p wa -k system-locale" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0153 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0153 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/rules.d/audit.rules`
cramfs02=`grep '^[-]'"a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/rules.d/audit.rules`
cramfs03=`grep '^[-]'"a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/rules.d/audit.rules`
cramfs04=`grep '^[-]'"a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/rules.d/audit.rules`
cramfs05=`grep '^[-]'"a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/rules.d/audit.rules`
cramfs06=`grep '^[-]'"a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" ] && [ "$cramfs02" == "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod" ] && [ "$cramfs03" == "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" ] && [ "$cramfs04" == "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod" ] && [ "$cramfs05" == "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" ] && [ "$cramfs06" == "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0154 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0154 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/rules.d/audit.rules`
cramfs02=`grep '^[-]'"a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/rules.d/audit.rules`
cramfs03=`grep '^[-]'"a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/rules.d/audit.rules`
cramfs04=`grep '^[-]'"a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" ] && [ "$cramfs02" == "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access" ] && [ "$cramfs03" == "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" ] && [ "$cramfs04" == "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0155 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0155 should be different to add audit rules"
    fi
	
cramfs01=`grep -q '^[-]'"w /etc/group -p wa -k identity" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"w /etc/passwd -p wa -k identity" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs03=`grep -q '^[-]'"w /etc/gshadow -p wa -k identity" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs04=`grep -q '^[-]'"w /etc/shadow -p wa -k identity" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs05=`grep -q '^[-]'"w /etc/security/opasswd -p wa -k identity" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] && [ "$cramfs03" == "0" ] && [ "$cramfs04" == "0" ] && [ "$cramfs05" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0156 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0156 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" /etc/audit/rules.d/audit.rules`
cramfs02=`grep '^[-]'"a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" ] && [ "$cramfs02" == "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0157 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0157 should be different to add audit rules"
    fi
	

# TWGCB-01-008-0158 檢查是否已設定特權指令使用稽核規則
# 基準要求: 建立 Audit 規則，監控具有 setuid/setgid 權限的程式執行。
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0158.log"
AUDIT_RULES_FILE="/etc/audit/rules.d/privileged.rules"
# 修復指令：建議查找所有特權程式，並使用 find 建立規則檔案
FIX_COMMAND="請依循 GCB 文件指示，執行 find 查找特權程式，並將 Audit 規則寫入 $AUDIT_RULES_FILE" 

# --- 核心檢查邏輯：檢查規則檔案是否存在且包含正確的關鍵規則 ---
# 1. 檢查規則檔案是否存在且不為空
if [ ! -s "$AUDIT_RULES_FILE" ]; then
    echo "Audit rule file for privileged commands ($AUDIT_RULES_FILE) is missing or empty." >> "$LOGFILE"
    FINAL_RESULT="KO"
else
    # 2. 檢查檔案內容是否包含關鍵的稽核規則
    # 邏輯：檢查是否存在任何一條包含 '-F perm=x' 和 '-k privileged' 的規則
    if grep -qE '\-F\s+perm=x.*-k\s+privileged' "$AUDIT_RULES_FILE" 2>/dev/null; then
        FINAL_RESULT="OK"
    else
        echo "The file $AUDIT_RULES_FILE exists but does not appear to contain correct 'privileged' audit rules." >> "$LOGFILE"
        FINAL_RESULT="KO"
    fi
fi

# --- 輸出結果：使用 -s 判斷 ---
if [ "$FINAL_RESULT" == "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0158 Audit rules for privileged commands are enabled."
else
    # 將具體修復指令寫入 LOGFILE
	echo "將下列項目加入 $AUDIT_RULES_FILE ------------------------------------------------" >> "$LOGFILE"
	echo "# TWGCB-01-008-0158 " >> "$LOGFILE"
	find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }' >> "$LOGFILE"
    echo "--------------------------------------------------------" >> "$LOGFILE"
	echo "輸入以下指令自動新增 (請確保您在執行前已備份原檔案內容):" >> "$LOGFILE"
    echo 'echo "#TWGCB-01-008-0158" >> "$AUDIT_RULES_FILE"' >> "$LOGFILE"
	echo 'find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '\''{print "-a always,exit -F path=" $1 " -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged" }'\'' >> '"$AUDIT_RULES_FILE" >> "$LOGFILE"
    echo "augenrules --load" >> "$LOGFILE"
    echo "--------------------------------------------------------" >> "$LOGFILE"
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0158 Audit rules for privileged commands are missing or incorrect. (see $LOGFILE)($FIX_COMMAND)"
fi

cramfs01=`grep -q '^[-]'"a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -S rmdir -F auid>=1000 -F auid!=4294967295 -k delete" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -S rmdir -F auid>=1000 -F auid!=4294967295 -k delete" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0159 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0159 should be different to add audit rules"
    fi
	
cramfs01=`grep -q '^[-]'"w /sbin/insmod -p x -k modules" /etc/audit/rules.d/audit.rules > /dev/null 2>&1 && echo 0 || echo 1`
cramfs02=`grep -q '^[-]'"w /sbin/rmmod -p x -k modules" /etc/audit/rules.d/audit.rules > /dev/null 2>&1 && echo 0 || echo 1`
cramfs03=`grep -q '^[-]'"w /sbin/modprobe -p x -k modules" /etc/audit/rules.d/audit.rules > /dev/null 2>&1 && echo 0 || echo 1`
cramfs04=`grep -q '^[-]'"a always,exit -F arch=b64 -S init_module -S delete_module -k modules" /etc/audit/rules.d/audit.rules > /dev/null 2>&1 && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] && [ "$cramfs02" == "0" ] && [ "$cramfs03" == "0" ] && [ "$cramfs04" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0160 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0160 should be different to add audit rules"
    fi

# TWGCB-01-008-0161 ###
# 檢查是否已針對 sudo.log 建立稽核規則
# 取得 sudo 日誌路徑（若未設定則預設為 /var/log/sudo.log）
SUDO_LOG=$(grep -r logfile /etc/sudoers* 2>/dev/null | sed -e 's/.*logfile=//; s/,.*//; s/^["'\'']//; s/["'\'']$//' | head -n 1)
if [ -z "$SUDO_LOG" ]; then
    SUDO_LOG=/var/log/sudo.log
fi
# 定義要檢查的規則字串
RULE="-w $SUDO_LOG -p wa -k actions"
# 使用 printf 和 grep -f - 來安全地讀取包含空格的模式
if printf "%s" "$RULE" | grep -Fxq -f - /etc/audit/rules.d/actions.rules 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0161 audit rule for sudo.log ($SUDO_LOG) exists"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0161 missing audit rule for sudo.log ($SUDO_LOG)"
fi
	
cramfs01=`grep '^[-]'"a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0162 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0162 should be different to add audit rules"
    fi
	
cramfs01=`grep -q '^[-]'"a always,exit -F path=/usr/bin/ssh-agent -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-ssh" /etc/audit/rules.d/audit.rules && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0163 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0163 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F path=/sbin/unix_update -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-unix-update" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F path=/sbin/unix_update -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-unix-update" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0164 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0164 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0165 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0165 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F arch=b32 -S finit_module -F auid>=1000 -F auid!=4294967295 -k module_chng" /etc/audit/rules.d/audit.rules`
cramfs02=`grep '^[-]'"a always,exit -F arch=b64 -S finit_module -F auid>=1000 -F auid!=4294967295 -k module_chng" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F arch=b32 -S finit_module -F auid>=1000 -F auid!=4294967295 -k module_chng" ] && [ "$cramfs02" == "-a always,exit -F arch=b64 -S finit_module -F auid>=1000 -F auid!=4294967295 -k module_chng" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0166 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0166 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access" /etc/audit/rules.d/audit.rules`
cramfs02=`grep '^[-]'"a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access" /etc/audit/rules.d/audit.rules`
cramfs03=`grep '^[-]'"a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access" /etc/audit/rules.d/audit.rules`
cramfs04=`grep '^[-]'"a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access" ] && [ "$cramfs02" == "-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access" ] && [ "$cramfs03" == "-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access" ] && [ "$cramfs04" == "-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0167 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0167 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-usermod" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-usermod" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0168 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0168 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0169 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0169 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"w /bin/kmod -p x -k modules" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-w /bin/kmod -p x -k modules" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0170 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0170 should be different to add audit rules"
    fi
	
cramfs01=`grep '^[-]'"w /var/log/faillock -p wa -k logins" /etc/audit/rules.d/audit.rules`
    if [ "$cramfs01" == "-w /var/log/faillock -p wa -k logins" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0171 add audit rules ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0171 should be different to add audit rules"
    fi


# TWGCB-01-008-0172 ###	
# 檢查 execve 系統呼叫稽核規則
RULE_FILES=$(find /etc/audit/rules.d/ -type f -name "*.rules" 2>/dev/null)
execve_ok=0

for file in $RULE_FILES; do
    content=$(grep -v '^\s*#' "$file")  # 忽略註解行

    # 檢查是否有符合官方要求的規則
    echo "$content" | grep -Eq 'arch=b32.*auid!=unset.*-S execve.*-C uid!=euid' && execve_ok_32_uid=1 || execve_ok_32_uid=0
    echo "$content" | grep -Eq 'arch=b64.*auid!=unset.*-S execve.*-C uid!=euid' && execve_ok_64_uid=1 || execve_ok_64_uid=0
    echo "$content" | grep -Eq 'arch=b32.*auid!=unset.*-S execve.*-C gid!=egid' && execve_ok_32_gid=1 || execve_ok_32_gid=0
    echo "$content" | grep -Eq 'arch=b64.*auid!=unset.*-S execve.*-C gid!=egid' && execve_ok_64_gid=1 || execve_ok_64_gid=0

    # 若四條規則都有，標記 OK
    if [[ $execve_ok_32_uid -eq 1 && $execve_ok_64_uid -eq 1 && $execve_ok_32_gid -eq 1 && $execve_ok_64_gid -eq 1 ]]; then
        execve_ok=1
        break
    fi
done

if [[ $execve_ok -eq 1 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0172 execve audit rules are correctly set"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0172 missing or incorrect execve audit rules"
fi
	
# TWGCB-01-008-0173 ###
MATCHES=$(grep -h "^\s*[^#]" /etc/audit/rules.d/*.rules 2>/dev/null | egrep "(-e 2)|(--loginuid-immutable)")

# 判斷是否同時包含 -e 2 和 --loginuid-immutable
if echo "$MATCHES" | grep -q -- "-e 2" && echo "$MATCHES" | grep -q -- "--loginuid-immutable"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0173 audit rules include -e 2 and --loginuid-immutable"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0173 audit rules missing required settings"
fi

	
    if [ $(rpm -qa|grep -c rsyslog) -gt 0 ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0174 install rsyslog "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0174 rsyslog should be different to dnf install rsyslog"
    fi
	
# TWGCB-01-008-0175：檢查 rsyslog 服務是否啟用且正在執行
SERVICE_NAME="rsyslog"
FIX_COMMAND="systemctl --now enable $SERVICE_NAME"
if systemctl is-enabled $SERVICE_NAME &>/dev/null && systemctl is-active $SERVICE_NAME &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0175 $SERVICE_NAME service is active."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0175 $SERVICE_NAME service issue. ($FIX_COMMAND)"
fi


### TWGCB-01-008-0176 檢查 rsyslog $FileCreateMode 是否 <= 0640
conf_files=$(find /etc/rsyslog.conf /etc/rsyslog.d/ -type f -name "*.conf" 2>/dev/null)

found_mode=""
for file in $conf_files; do
    mode=$(grep -E '^\$FileCreateMode' "$file" 2>/dev/null | awk '{print $2}' | tail -n 1)
    if [[ -n "$mode" ]]; then
        found_mode=$mode
        break
    fi
done

if [[ -z "$found_mode" ]]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0176 Missing \$FileCreateMode setting"
elif [[ "$found_mode" =~ ^0[0-6][0-4][0-0]$ || "$found_mode" =~ ^0640$ || "$found_mode" =~ ^0600$ || "$found_mode" =~ ^0440$ ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0176 \$FileCreateMode=$found_mode (Secure)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0176 \$FileCreateMode=$found_mode (Too permissive)"
fi

# TWGCB-01-008-0177 檢查 rsyslog 是否記錄認證與服務資訊至 /var/log/secure
# 基準要求: 編輯 /etc/rsyslog.conf 或 /etc/rsyslog.d/*.conf 包含 auth.*, authpriv.*, daemon.* /var/log/secure 
# --- 變數定義 ---
# 修復指令：建議編輯 rsyslog 設定檔並重啟服務 
FIX_COMMAND="請於 /etc/rsyslog.conf 加入 'auth.*,authpriv.*,daemon.* /var/log/secure' 並執行 #systemctl restart rsyslog.service" 

# --- 核心檢查邏輯：驗證 rsyslog 配置是否包含指定規則 ---
# 1. 檢查 /etc/rsyslog.conf 與 /etc/rsyslog.d/*.conf 
# 2. 確保 auth.*, authpriv.*, daemon.* 皆指向 /var/log/secure 

CHECK_FILES=$(ls /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null)
AUTH_CHK=$(grep -rE '^\s*auth\.\*\s+/var/log/secure' $CHECK_FILES 2>/dev/null)
AUTHPRIV_CHK=$(grep -rE '^\s*authpriv\.\*\s+/var/log/secure' $CHECK_FILES 2>/dev/null)
DAEMON_CHK=$(grep -rE '^\s*daemon\.\*\s+/var/log/secure' $CHECK_FILES 2>/dev/null)

# 或者是綜合型寫法: auth.*,authpriv.*,daemon.* /var/log/secure 
COMBO_CHK=$(grep -rE '^\s*(auth|authpriv|daemon)\.\*.*(auth|authpriv|daemon)\.\*.*(auth|authpriv|daemon)\.\*.*\/var\/log\/secure' $CHECK_FILES 2>/dev/null)
if [[ -n "$COMBO_CHK" ]] || [[ -n "$AUTH_CHK" && -n "$AUTHPRIV_CHK" && -n "$DAEMON_CHK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0177 rsyslog rules (auth, authpriv, daemon) are correctly set to /var/log/secure."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0177 missing or incorrect rsyslog logging rules.($FIX_COMMAND)"
fi


# TWGCB-01-008-0178 檢查 /var/log/messages 檔案所有權，設定 /var/log/messages 檔案擁有者與群組為 root:root。 
# 修復指令：設定擁有者與群組為 root:root 
FIX_COMMAND="chown root:root /var/log/messages"
# --- 核心檢查邏輯：驗證擁有者與群組是否為 root ---
CURRENT_OWNER=$(stat -c "%U:%G" /var/log/messages 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0178 /var/log/messages ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0178 ownership error: '$CURRENT_OWNER' (Expected: root:root). ($FIX_COMMAND)"
fi

	
# TWGCB-01-008-0179 檢查 /var/log 目錄所有權，設定 /var/log 目錄擁有者與群組為 root:root。 
# 修復指令：設定目錄擁有者與群組為 root:root 
FIX_COMMAND="chown root:root /var/log"
# --- 核心檢查邏輯：驗證目錄擁有者與群組是否為 root ---
CURRENT_OWNER=$(stat -c "%U:%G" /var/log 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0179 /var/log directory ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0179 directory ownership error: '$CURRENT_OWNER' (Expected: root:root). ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0180：檢查 journald 是否轉發日誌至 rsyslog
CONF_FILE="/etc/systemd/journald.conf"
FIX_COMMAND="sed -i 's/^[# ]*ForwardToSyslog=.*/ForwardToSyslog=yes/' $CONF_FILE && systemctl restart systemd-journald"

# 使用 grep 檢查是否設定為 yes (排除註解行)
if grep -qE "^\s*ForwardToSyslog=yes" "$CONF_FILE"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0180 ForwardToSyslog is enabled (yes)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0180 ForwardToSyslog is not enabled. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0181：檢查 Compress 是否設定為 yes
if grep -iq '^\s*Compress=yes' /etc/systemd/journald.conf; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0181 Compress=yes"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0181 should be set Compress=yes in /etc/systemd/journald.conf"
    fi
	
# TWGCB-01-008-0182：檢查 Storage 是否設定為 persistent
if grep -iq '^\s*Storage=persistent' /etc/systemd/journald.conf; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0182 Storage = persistent"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0182 should be set Storage=persistent in /etc/systemd/journald.conf"
    fi
	
# TWGCB-01-008-0185 檢查 libselinux 套件是否已安裝	
	if rpm -q libselinux >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0185 libselinux are installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0185 libselinux not installed"
	fi

### TWGCB-01-008-0186 ####
# 檢查開機參數中是否有禁用 SELinux 的設定
if grep -Eq 'selinux=0|enforcing=0' /etc/default/grub; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0186 Found selinux=0 or enforcing=0 in grub"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0186 SELinux not disabled in bootloader"
fi
	
# TWGCB-01-008-0187：檢查 SELinux 類型是否為 targeted
CONF_FILE="/etc/selinux/config"
FIX_COMMAND="sed -i 's/^\s*SELINUXTYPE=.*/SELINUXTYPE=targeted/' $CONF_FILE"

# 檢查檔案中是否明確設定 SELINUXTYPE=targeted (排除註解行)
if grep -qE "^\s*SELINUXTYPE=targeted" "$CONF_FILE"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0187 SELINUXTYPE is correctly set to targeted."
else
    # 取得目前的設定值 (用於 Log 或提示)
    CURRENT_VAL=$(grep -E "^\s*SELINUXTYPE=" "$CONF_FILE" | awk -F= '{print $2}' | xargs)
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0187 SELINUXTYPE is '$CURRENT_VAL'. ($FIX_COMMAND)"
fi	
	
# TWGCB-01-008-0188 檢查 SELinux 是否為強制模式 (enforcing)，SELINUX 必須設為 enforcing。 
# 修復指令：編輯設定檔並執行 setenforce
FIX_COMMAND="請於 /etc/selinux/config 設定 SELINUX=enforcing 並執行 #setenforce 1" 
# --- 核心檢查邏輯：檢查核心運行狀態與設定檔 ---
# 1. getenforce : 取得目前核心運行模式
# 2. grep : 確認設定檔 /etc/selinux/config 的預設值
CURRENT_MODE=$(getenforce 2>/dev/null)
CONFIG_SETTING=$(grep -E '^\s*SELINUX=enforcing' /etc/selinux/config 2>/dev/null)
if [[ "$CURRENT_MODE" == "Enforcing" ]] && [[ -n "$CONFIG_SETTING" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0188 SELinux is active and set to enforcing."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0188 SELinux mode error: current is '$CURRENT_MODE'. ($FIX_COMMAND)"
fi
	
# TWGCB-01-008-0189 檢查是否存在未受限程序 (unconfined_service_t)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0189.log"
# 查找目前執行中的 unconfined_service_t 程序
ps -eZf | awk '$1 ~ /unconfined_service_t/ {print $0}' >> "$LOGFILE"
# 輸出結果
if [ -s "$LOGFILE" ]; then
    COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0189 Found $COUNT unconfined service process(es). (see $LOGFILE)(restorecon -Rv <binary_path>)"
	echo "use command : ps -eZf | awk '$1 ~ /unconfined_service_t/' to find path and Run command: restorecon -Rv <binary_path>" >> "$LOGFILE"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0189 No unconfined service processes found."
fi
	
# TWGCB-01-008-0190 檢查 setroubleshoot 套件是否已安裝	
	if rpm -q setroubleshoot >/dev/null 2>&1; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0190 setroubleshoot are installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0190 setroubleshoot not installed"
	fi

# TWGCB-01-008-0191 檢查 mcstrans 套件是否已安裝	
	if rpm -q mcstrans >/dev/null 2>&1; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0191 mcstrans are installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0191 mcstrans not installed"
	fi

	if systemctl is-active --quiet crond; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0192 crond service is active"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0192 crond service is NOT active"
	fi
	
cramfs01=$(ls -l /etc/crontab | awk '{print $3 ":" $4}')
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0193 Check /etc/crontab is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0193 /etc/crontab no root:root"
    fi
	
cramfs01=$(stat -c %a /etc/crontab)
    if [ $cramfs01 -le "644" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0194 Check /etc/crontab is 644 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0194 no 644"
    fi
	
cramfs01=$(stat -c %U:%G /etc/cron.hourly)
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0195 Check /etc/cron.hourly is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0195 no root:root"
    fi
	
cramfs01=$(stat -c %a /etc/cron.hourly)
    if [ $cramfs01 -le "700" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0196 Check /etc/cron.hourly is 700 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0196 no 700"
    fi
	
cramfs01=$(stat -c %U:%G /etc/cron.daily)
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0197 Check /etc/cron.daily is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0197 no root:root"
    fi
	
cramfs01=$(stat -c %a /etc/cron.daily)
    if [ $cramfs01 -le "700" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0198 Check /etc/cron.daily is 700 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0198 no 700"
    fi
	
cramfs01=$(stat -c %U:%G /etc/cron.weekly)
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0199 Check /etc/cron.weekly is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0199 no root:root"
    fi
	
cramfs01=$(stat -c %a /etc/cron.weekly)
    if [ $cramfs01 -le "700" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0200 Check /etc/cron.weekly is 700 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0200 no 700"
    fi
	
cramfs01=$(stat -c %U:%G /etc/cron.monthly)
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0201 Check /etc/cron.monthly is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0201 no root:root"
    fi
	
cramfs01=$(stat -c %a /etc/cron.monthly)
    if [ $cramfs01 -le "700" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0202 Check /etc/cron.monthly is 700 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0202 no 700"
    fi
	
cramfs01=$(stat -c %U:%G /etc/cron.d)
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0203 Check /etc/cron.d is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0203 no root:root"
    fi
	
cramfs01=$(stat -c %a /etc/cron.d)
    if [ $cramfs01 -le "700" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0204 Check /etc/cron.d is 700 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0204 no 700"
    fi

# TWGCB-01-008-0205 檢查 Cron 與 At
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0203.log"
FILES_DENY=("/etc/cron.deny" "/etc/at.deny")
FILES_ALLOW=("/etc/cron.allow" "/etc/at.allow")
ERROR_COUNT=0
for f in "${FILES_DENY[@]}"; do
    if [ -f "$f" ]; then
        ((ERROR_COUNT++))
        echo "rm -f $f" >> "$LOGFILE"
    fi
done

for f in "${FILES_ALLOW[@]}"; do
    if [ ! -f "$f" ]; then
        ((ERROR_COUNT++))
        echo "touch $f && chown root:root $f && chmod 600 $f" >> "$LOGFILE"
    else
        OWNER=$(stat -c "%U:%G" "$f")
        if [ "$OWNER" != "root:root" ]; then
            ((ERROR_COUNT++))
            echo "chown root:root $f" >> "$LOGFILE"
        fi
    fi
done

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0205 Cron/At access control is correct."
else
    # 畫面上只印出發現幾個錯誤與 LOG 路徑
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0205 Found $ERROR_COUNT issues. Fix commands written to $LOGFILE"
fi

# TWGCB-01-008-0206 檢查 /etc/cron.allow 與 /etc/at.allow 權限 (應為 600)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0204.log"
FILES=("/etc/cron.allow" "/etc/at.allow")
ERROR_COUNT=0
for FILE in "${FILES[@]}"; do
    if [ ! -f "$FILE" ]; then
        continue
    fi

    # 取得檔案權限數值
    PERM=$(stat -c "%a" "$FILE")
    
    # 判斷權限是否大於 600
    if [ "$PERM" -gt 600 ]; then
        ((ERROR_COUNT++))
        # 依照您的要求，在日誌中加入 (chmod 600 $FILE) 方便快速修復
        echo "File: $FILE, Current Permission: $PERM, Expected: 600 (chmod 600 $FILE)" >> "$LOGFILE"
    fi
done

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0206 Cron/At allow files permission is 600 or lower"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0206 Found $ERROR_COUNT file(s) with incorrect permission. (see $LOGFILE)"
fi

# TWGCB-01-008-0207檢查 rsyslog 是否記錄 cron 日誌至 /var/log/cron
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0205.log"
# 搜尋所有 rsyslog 設定檔
CONF_FILES=$(find /etc/rsyslog.conf /etc/rsyslog.d/ -type f -name "*.conf" 2>/dev/null)
FOUND_CRON_RULE=0

# 核心檢查邏輯：查找包含 cron.* 並指向 /var/log/cron 的行 (排除註解)
for file in $CONF_FILES; do
    if grep -E '^[[:space:]]*cron\.' "$file" 2>/dev/null | grep -q '/var/log/cron'; then
        FOUND_CRON_RULE=1
        MATCH_FILE=$file
        break
    fi
done

if [ "$FOUND_CRON_RULE" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0207 Cron logging is enabled in $MATCH_FILE"
else
    # 若缺失，則將檢查結果寫入日誌
    > "$LOGFILE"
    echo "Check failed: No active rsyslog rule found for cron logging." >> "$LOGFILE"
    echo "Expected rule: cron.* /var/log/cron" >> "$LOGFILE"
    echo "Files searched: $CONF_FILES" >> "$LOGFILE"
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0207 Missing 'cron.* /var/log/cron' rule. (see $LOGFILE)"
fi

# TWGCB-01-008-0208：密碼重試次數 (Retry) 檢查
PAM_FILE="/etc/pam.d/system-auth"
CONF_FILE="/etc/security/pwquality.conf"
# 1. 抓取 PAM 檔案中的參數 (優先權最高)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "retry=\K\d+" | head -n1)
# 2. 抓取設定檔中的數值 (優先權次之)
VAL_CONF=$(awk -F= '/^[[:space:]]*retry[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
# 3. 確定最終生效值 (FINAL_VAL)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
# 4. 根據 GCB 規範判斷 (假設規範為 1-3)
if [[ "$FINAL_VAL" =~ ^[1-3]$ ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0208 Effective Retry=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0208 Effective Retry is ${FINAL_VAL:-"Not set"} (should be 1-3)"
fi


# TWGCB-01-008-0209：檢查 pam_pwquality 是否對 root 強制執行密碼規則
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0209.log"
authselect apply-changes &>/dev/null
CHECK_SYS=$(grep -E '^\s*password\s+requisite\s+pam_pwquality\.so\s+.*enforce_for_root' /etc/pam.d/system-auth)
CHECK_PWD=$(grep -E '^\s*password\s+requisite\s+pam_pwquality\.so\s+.*enforce_for_root' /etc/pam.d/password-auth)

if [ -n "$CHECK_SYS" ] && [ -n "$CHECK_PWD" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0209 Root password complexity enforcement is enabled."
else
    # 2. 只有在不合規時，才判斷環境並產出修復指令
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')

    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        # 情況 A：沒 Custom
        cat << 'EOF1' > "$LOGFILE"
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
for f in system-auth password-auth; do
    sed -i '/pam_pwquality.so/ s/$/ enforce_for_root/' "/etc/authselect/custom/twgcb/$f"
done
authselect apply-changes
EOF1
    else
        # 情況 B：有 Custom
        cat << 'EOF1' > "$LOGFILE"
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
for f in system-auth password-auth; do
    PTF="/etc/authselect/$CP/$f"
    if ! grep -q "enforce_for_root" "$PTF"; then
        sed -i '/pam_pwquality.so/ s/$/ enforce_for_root/' "$PTF"
    fi
done
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0209 'enforce_for_root' missing (See $LOGFILE for fix steps)"
fi

# TWGCB-01-008-0210 檢查最小密碼長度設定
LOGIN_DEFS="/etc/login.defs"
PWQ_CONF="/etc/security/pwquality.conf"
RESULT="KO"
# 檢查 /etc/login.defs
PASS_MIN_LEN=$(grep -E '^[[:space:]]*PASS_MIN_LEN' "$LOGIN_DEFS" 2>/dev/null | awk '{print $2}')
if [[ -n "$PASS_MIN_LEN" ]] && [[ "$PASS_MIN_LEN" -ge 12 ]]; then
    RESULT="OK"
fi
# 檢查 /etc/security/pwquality.conf
if [ "$RESULT" != "OK" ]; then
    MINLEN=$(grep -i '^minlen' "$PWQ_CONF" 2>/dev/null | awk -F '=' '{gsub(/ /,"",$2); print $2}')
    if [[ -n "$MINLEN" ]] && [[ "$MINLEN" -ge 12 ]]; then
        RESULT="OK"
    fi
fi
# 顯示結果
if [ "$RESULT" = "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0210 minimum password length ≥ 12"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0210 minimum password length < 12"
fi
	

PAM_FILE="/etc/pam.d/system-auth"
CONF_FILE="/etc/security/pwquality.conf"

# TWGCB-01-008-0211：minclass (密碼包含的字元類別數量)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "minclass=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*minclass[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "4" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0211 Effective minclass=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0211 Effective minclass is ${FINAL_VAL:-NotSet} (should be 4)"
fi

# TWGCB-01-008-0212：dcredit (至少包含數字個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "dcredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*dcredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0212 Effective dcredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0212 Effective dcredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-008-0213：ucredit (至少包含大寫字母個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "ucredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*ucredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0213 Effective ucredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0213 Effective ucredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-008-0214：lcredit (至少包含小寫字母個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "lcredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*lcredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0214 Effective lcredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0214 Effective lcredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-008-0215：ocredit (至少包含特殊字元個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "ocredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*ocredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0215 Effective ocredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0215 Effective ocredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-008-0216：difok (新舊密碼不可相同字元數)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "difok=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*difok[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "3" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0216 Effective difok=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0216 Effective difok is ${FINAL_VAL:-NotSet} (should be 3)"
fi

# TWGCB-01-008-0217：maxclassrepeat (同一類別字元連續出現上限)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "maxclassrepeat=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*maxclassrepeat[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "4" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0217 Effective maxclassrepeat=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0217 Effective maxclassrepeat is ${FINAL_VAL:-NotSet} (should be 4)"
fi

# TWGCB-01-008-0218：maxrepeat (同一字元連續出現上限)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "maxrepeat=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*maxrepeat[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "3" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0218 Effective maxrepeat=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0218 Effective maxrepeat is ${FINAL_VAL:-NotSet} (should be 3)"
fi

# TWGCB-01-008-0219：dictcheck (是否檢查字典檔)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "dictcheck=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*dictcheck[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0219 Effective dictcheck=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0219 Effective dictcheck is ${FINAL_VAL:-NotSet} (should be 1)"
fi	

# TWGCB-01-008-0220 檢查使用者登入失敗鎖定次數
CFG="/etc/security/faillock.conf"
VAL=$(grep -iE "^[[:space:]]*deny[[:space:]]*=[[:space:]]*[0-9]+" "$CFG" | awk -F= '{gsub(/ /,"",$2); print $2}' | tail -n1)

if [[ "$VAL" =~ ^[1-5]$ ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0220 deny=$VAL (1–5)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0220 deny should be between 1 and 5"
fi

# TWGCB-01-008-0221 檢查帳號解鎖時間
CFG="/etc/security/faillock.conf"
VAL=$(grep -iE "^[[:space:]]*unlock_time[[:space:]]*=[[:space:]]*[0-9]+" "$CFG" | awk -F= '{gsub(/ /,"",$2); print $2}' | tail -n1)

if [[ "$VAL" =~ ^[0-9]+$ ]] && [ "$VAL" -ge 900 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0221 unlock_time=$VAL (≥900)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0221 unlock_time should be ≥ 900 seconds"
fi

# TWGCB-01-008-0222：檢查通行碼重複使用限制 (remember)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0222.log"
EXPECTED=3
authselect apply-changes &>/dev/null
REM_VAL=$(grep -E '^\s*password' /etc/pam.d/system-auth 2>/dev/null | grep 'pam_unix.so' | grep -oP 'remember=\K[0-9]+' | head -1)

if [[ -n "$REM_VAL" && "$REM_VAL" -ge $EXPECTED ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0222 password remember is set to $REM_VAL"
else
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')
    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        cat << 'EOF1' > "$LOGFILE"
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
PTF="/etc/authselect/custom/twgcb/system-auth"
if grep -Eq 'pam_unix\.so.*remember=' "$PTF"; then
    sed -ri 's/(pam_unix\.so.*)remember=[0-9]+/\1remember=3/' "$PTF"
else
    sed -ri 's/(pam_unix\.so.*)/\1 remember=3/' "$PTF"
fi
authselect apply-changes
EOF1
    else
        cat << 'EOF1' > "$LOGFILE"
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
PTF="/etc/authselect/$CP/system-auth"
if grep -Eq 'pam_unix\.so.*remember=' "$PTF"; then
    sed -ri 's/(pam_unix\.so.*)remember=[0-9]+/\1remember=3/' "$PTF"
else
    sed -ri 's/(pam_unix\.so.*)/\1 remember=3/' "$PTF"
fi
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0222 password remember issue (See $LOGFILE)"
fi


# TWGCB-01-008-0223：檢查登入失敗次數顯示設定
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0223.log"
authselect apply-changes &>/dev/null
if grep -Eq '^\s*session\s+.*pam_lastlog\.so\s+.*showfailed' /etc/pam.d/postlogin 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0223 pam_lastlog.so showfailed is set."
else
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')
    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        cat << 'EOF1' > "$LOGFILE"
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
PTF="/etc/authselect/custom/twgcb/postlogin"
if ! grep -q "pam_lastlog.so" "$PTF"; then
    echo "session     required      pam_lastlog.so showfailed" >> "$PTF"
elif ! grep -q "showfailed" "$PTF"; then
    sed -i '/pam_lastlog.so/s/$/ showfailed/' "$PTF"
fi
authselect apply-changes
EOF1
    else
        cat << 'EOF1' > "$LOGFILE"
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
PTF="/etc/authselect/$CP/postlogin"
if ! grep -q "pam_lastlog.so" "$PTF"; then
    echo "session     required      pam_lastlog.so showfailed" >> "$PTF"
elif ! grep -q "showfailed" "$PTF"; then
    sed -i '/pam_lastlog.so/s/$/ showfailed/' "$PTF"
fi
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0223 pam_lastlog.so showfailed missing (See $LOGFILE)"
fi


# TWGCB-01-008-0224：檢查通行碼雜湊演算法是否為 SHA512
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0224.log"
authselect apply-changes &>/dev/null
CHECK_PAM=$(grep -E '^\s*password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth 2>/dev/null | grep -q 'sha512'; echo $?)
CHECK_LIB=$(grep -qE "^\s*crypt_style\s*=\s*sha512" /etc/libuser.conf 2>/dev/null; echo $?)
CHECK_LOG=$(grep -qE "^\s*ENCRYPT_METHOD\s+SHA512" /etc/login.defs 2>/dev/null; echo $?)

if [ $CHECK_PAM -eq 0 ] && [ $CHECK_LIB -eq 0 ] && [ $CHECK_LOG -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0224 Password hashing is SHA512."
else
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')
    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        cat << 'EOF1' > "$LOGFILE"
sed -i 's/^\s*crypt_style.*/crypt_style = sha512/' /etc/libuser.conf
sed -i 's/^\s*ENCRYPT_METHOD.*/ENCRYPT_METHOD SHA512/' /etc/login.defs
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
for f in system-auth password-auth; do
    PTF="/etc/authselect/custom/twgcb/$f"
    if ! grep -q "sha512" "$PTF"; then
        sed -i '/pam_unix.so/ s/$/ sha512/' "$PTF"
    fi
done
authselect apply-changes
EOF1
    else
        cat << 'EOF1' > "$LOGFILE"
sed -i 's/^\s*crypt_style.*/crypt_style = sha512/' /etc/libuser.conf
sed -i 's/^\s*ENCRYPT_METHOD.*/ENCRYPT_METHOD SHA512/' /etc/login.defs
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
for f in system-auth password-auth; do
    PTF="/etc/authselect/$CP/$f"
    if ! grep -q "sha512" "$PTF"; then
        sed -i '/pam_unix.so/ s/$/ sha512/' "$PTF"
    fi
done
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0224 SHA512 configuration issue (See $LOGFILE)"
fi


# TWGCB-01-008-0225 密碼最短使用期限 (僅檢查全域設定)
VAL=$(grep -E "^\s*PASS_MIN_DAYS" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 1 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0225 /etc/login.defs PASS_MIN_DAYS is $VAL (chage --mindays 1)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0225 /etc/login.defs PASS_MIN_DAYS is ${VAL:-"Not set"} (should be >= 1)"
fi

# TWGCB-01-008-0226 密碼到期提醒天數 (PASS_WARN_AGE)
VAL=$(grep -E "^\s*PASS_WARN_AGE" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 14 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0226 /etc/login.defs PASS_WARN_AGE is $VAL (chage --warndays 14)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0226 /etc/login.defs PASS_WARN_AGE is ${VAL:-"Not set"} (should be >= 14)"
fi
	
# TWGCB-01-008-0227 密碼最長使用期限 (PASS_MAX_DAYS)
VAL=$(grep -E "^\s*PASS_MAX_DAYS" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -le 90 ] && [ "$VAL" -gt 0 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0227 /etc/login.defs PASS_MAX_DAYS is $VAL (chage --maxdays 90)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0227 /etc/login.defs PASS_MAX_DAYS is ${VAL:-"Not set"} (should be 1-90)"
fi
	
# TWGCB-01-008-0228 帳號停用天數 (INACTIVE)
VAL=$(awk -F= '/^[[:space:]]*INACTIVE/ {gsub(/[[:space:]]/,"",$2); print $2}' /etc/default/useradd | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -gt 0 ] && [ "$VAL" -le 30 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0228 useradd INACTIVE is $VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0228 useradd INACTIVE is ${VAL:-"Not set"} (useradd -D -f 30)"
fi
	
# TWGCB-01-008-0229 登入失敗延遲時間 (FAIL_DELAY)
VAL=$(grep -E "^\s*FAIL_DELAY" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 4 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0229 /etc/login.defs FAIL_DELAY is $VAL (>= 4)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0229 /etc/login.defs FAIL_DELAY is ${VAL:-"Not set"} (should be >= 4)"
fi
	
# TWGCB-01-008-0230 建立使用者家目錄 (CREATE_HOME)
VAL=$(grep -E "^\s*CREATE_HOME" "/etc/login.defs" | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -n1)
if [ "$VAL" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0230 /etc/login.defs CREATE_HOME is $VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0230 /etc/login.defs CREATE_HOME is ${VAL:-"Not set"} (should be yes)"
fi

# TWGCB-01-008-0231：檢查 sudoers 是否限制 NOPASSWD
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0229.log"
# 使用 grep -E 檢查非註解行是否包含免密碼設定
# 注意：這裡也檢查 /etc/sudoers.d/ 下的檔案，這更符合 RHEL 9 實務
BAD_SUDO=$(grep -rEi '^[[:space:]]*[^#].*(nopasswd|!authenticate)' /etc/sudoers /etc/sudoers.d/ 2>/dev/null)

if [ -n "$BAD_SUDO" ]; then
    echo "[Issue] Insecure sudoers configuration found:" >> "$LOGFILE"
    echo "$BAD_SUDO" >> "$LOGFILE"
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0231 sudoers NOPASSWD issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0231 All sudo actions require authentication."
fi
	
# TWGCB-01-008-0232 限制帳號同時登入數量檢查
# 檢查是否設定 * hard maxlogins N (0 < N <= 10)
FILES=("/etc/security/limits.conf" /etc/security/limits.d/*.conf)
RESULT="KO"
FOUND_FILE=""
VALUE=""

for FILE in "${FILES[@]}"; do
    [ -f "$FILE" ] || continue
    LINE=$(grep -E "^\s*\*\s+hard\s+maxlogins\s+[0-9]+" "$FILE" 2>/dev/null)
    if [[ -n "$LINE" ]]; then
        VALUE=$(echo "$LINE" | awk '{print $4}')
        if [[ "$VALUE" =~ ^[0-9]+$ && "$VALUE" -gt 0 && "$VALUE" -le 10 ]]; then
            RESULT="OK"
            FOUND_FILE="$FILE"
            break
        fi
    fi
done

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0232 maxlogins 設定為 $VALUE (0 < N ≤ 10) 於 $FOUND_FILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0232 未設定或設定值不符 (應為 * hard maxlogins N，0 < N ≤ 10)"
fi

# TWGCB-01-008-0233 檢查 kbd.x86_64 套件是否已安裝	
	if rpm -q kbd.x86_64 >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0233 kbd.x86_64 are installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0233 kbd.x86_64 not installed(dnf install kbd.x86_64)"
	fi

# TWGCB-01-008-0234 檢查 GNOME 螢幕保護鎖定設定
# 判斷是否為桌面環境
	if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
		# GNOME 桌面環境存在，檢查螢幕鎖定設定
		LOCK_ENABLED=$(dconf read /org/gnome/desktop/screensaver/lock-enabled 2>/dev/null)
		if [[ "$LOCK_ENABLED" == "true" ]]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0234 screensaver lock is enabled"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0234 screensaver lock is not enabled"
		fi
	else
		echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-008-0234: No GNOME desktop environment detected, skipping screensaver check."
	fi

# TWGCB-01-008-0235 检查 GNOME 使用者會談逾時設定
# 判斷是否為桌面環境
	if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
		# GNOME 桌面環境存在，檢查 idle-delay 設定
		SCREENSAVER_CONF="/etc/dconf/db/local.d/00-screensaver"
		IDLE_DELAY=$(grep -i '^idle-delay' "$SCREENSAVER_CONF" 2>/dev/null | awk -F ' ' '{print $2}')
		if [[ -n "$IDLE_DELAY" && "$IDLE_DELAY" -ge 900 ]]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0235: idle-delay is set to $IDLE_DELAY seconds"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0235: idle-delay not set or less than 900 seconds"
		fi
	else
		echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-008-0235: No GNOME desktop environment detected, skipping session idle-delay check."
	fi
	
# TWGCB-01-008-0236 檢查 GNOME 自動登入設定
GDM_CONF="/etc/gdm/custom.conf"
if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
    if [ -f "$GDM_CONF" ]; then
        AUTOLOGIN=$(grep -E '^\s*AutomaticLoginEnable' "$GDM_CONF" 2>/dev/null | awk -F= '{gsub(/ /,"",$2); print tolower($2)}')
        if [[ "$AUTOLOGIN" == "false" ]]; then
            echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0236 AutomaticLoginEnable is set to false in $GDM_CONF"
        else
            echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0236 AutomaticLoginEnable is not set to false (or missing) in $GDM_CONF"
        fi
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0236 $GDM_CONF not found"
    fi
else
    echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-008-0236: No GNOME desktop environment detected, skipping auto-login check."
fi


# TWGCB-01-008-0237 檢查系統帳號是否設為 nologin 並鎖定 (不含 root, sync, shutdown, halt)
UID_MIN=$(awk '/^\s*UID_MIN/ {print $2; exit}' /etc/login.defs)
# fallback
[ -z "$UID_MIN" ] && UID_MIN=1000

NOLOGIN_PATH="$(which nologin 2>/dev/null || echo /sbin/nologin)"
# some systems use /usr/sbin/nologin or /sbin/nologin; which will give correct path

EXCLUDE='^(root|sync|shutdown|halt)$'

bad_shell_users=()
unlocked_users=()

while IFS=: read -r user x uid gid gecos home shell; do
    # skip plus entries and exclude list
    [[ "$user" =~ ^\+ ]] && continue
    [[ "$user" =~ $EXCLUDE ]] && continue
    # uid numeric check
    if [[ "$uid" -lt "$UID_MIN" ]]; then
        # only consider accounts that are not using nologin/false
        if [[ "$shell" != "$NOLOGIN_PATH" && "$shell" != "/bin/false" && "$shell" != "/sbin/nologin" ]]; then
            bad_shell_users+=("$user:$shell")
        fi
        # check lock state via passwd -S
        POUT=$(passwd -S "$user" 2>/dev/null)
        if [[ -z "$POUT" ]]; then
            # if passwd -S not available or user special, consider unlocked
            unlocked_users+=("$user:unknown")
        else
            state=$(echo "$POUT" | awk '{print $2}')
            # Accept L or LK as locked
            if [[ "$state" != "L" && "$state" != "LK" ]]; then
                unlocked_users+=("$user:$state")
            fi
        fi
    fi
done < /etc/passwd

if [ ${#bad_shell_users[@]} -eq 0 ] && [ ${#unlocked_users[@]} -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0237 system accounts use nologin/false and are locked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0237 issues found:"
    if [ ${#bad_shell_users[@]} -gt 0 ]; then
        echo "  - Accounts with non-nologin shells:"
        for i in "${bad_shell_users[@]}"; do echo "      $i"; done
    fi
    if [ ${#unlocked_users[@]} -gt 0 ]; then
        echo "  - Accounts not locked (passwd -S state):"
        for i in "${unlocked_users[@]}"; do echo "      $i"; done
    fi
fi


# TWGCB-01-008-0238 檢查 Bash shell 閒置自動登出設定 (TMOUT >= 900)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0236.log"
FILES=("/etc/bashrc" "/etc/profile" /etc/profile.d/*.sh)
TMOUT_FOUND=0
TMOUT_VAL=""

for FILE in "${FILES[@]}"; do
    [ ! -f "$FILE" ] && continue
    
    # 1. 抓取是否有 readonly TMOUT=數字 (不限行首，相容 if 縮排)
    # 2. 抓取是否有 export TMOUT
    LINE=$(grep -E 'readonly\s+TMOUT=[0-9]+' "$FILE")
    EXPORT_CHK=$(grep -E 'export\s+TMOUT' "$FILE")
    
    if [[ -n "$LINE" && -n "$EXPORT_CHK" ]]; then
        # 提取數字
        TMOUT_VAL=$(echo "$LINE" | grep -oE '[0-9]+')
        
        # 判斷是否符合 900 秒以下 (GCB 規範)
        if [[ "$TMOUT_VAL" -le 900 && "$TMOUT_VAL" -gt 0 ]]; then
            TMOUT_FOUND=1
            FOUND_FILE="$FILE"
            break
        fi
    fi
done

if [ "$TMOUT_FOUND" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0238 Found TMOUT=$TMOUT_VAL in $FOUND_FILE"
else

cat << 'EOF1' > "$LOGFILE"
# 使用以下指令修復 TMOUT 設定：
cat << 'EOF' > /etc/profile.d/TWGCB.sh
#!/bin/bash
# TWGCB-01-008-0236: Set Bash shell timeout to 900 seconds
if [ -n "$PS1" ]; then
    readonly TMOUT=900 ; export TMOUT
fi
EOF
chmod 644 /etc/profile.d/TWGCB.sh
EOF1
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0238 TMOUT not found or > 900s.(see $LOGFILE)"
fi


# TWGCB-01-008-0239 檢查防止修改 GUI 設定 (dconf locks)
LOCK_FILE="/etc/dconf/db/local.d/locks/session"
REQUIRED_KEYS=(
    "/org/gnome/desktop/session/idle-delay"
    "/org/gnome/desktop/screensaver/lock-enabled"
    "/org/gnome/desktop/screensaver/lock-delay"
    "/org/gnome/desktop/lockdown/disable-lock-screen"
)

# 判斷是否為 GNOME 桌面環境
if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
	if [ ! -f "$LOCK_FILE" ]; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0237: Lock file not found ($LOCK_FILE)"
	else
		missing_keys=()
		for key in "${REQUIRED_KEYS[@]}"; do
			if ! grep -qx "$key" "$LOCK_FILE" 2>/dev/null; then
				missing_keys+=("$key")
			fi
		done
		if [ ${#missing_keys[@]} -eq 0 ]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0239: All GUI settings are locked as required"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0239: Missing lock entries in $LOCK_FILE:"
		for key in "${missing_keys[@]}"; do
			echo "   - $key"
		done
		fi
	fi
	else
	echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-008-0239: No GNOME desktop environment detected, skipping GUI lock check."
fi

# TWGCB-01-008-0240 檢查 root 帳號之主要群組 GID，root 帳號所屬群組必須為 GID 0。 
# 修復指令：將 root 的主要群組設回 GID 0 
FIX_COMMAND="usermod -g 0 root"
# --- 核心檢查邏輯 ---
# 1. id -g root : 取得 root 帳號的 Primary Group GID
CURRENT_GID=$(id -g root 2>/dev/null)
if [ "$CURRENT_GID" == "0" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0240 root primary group is GID 0."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0240 root GID error: '$CURRENT_GID' (Expected: 0). ($FIX_COMMAND)"
fi

# TWGCB-01-008-0241 檢查預設 umask 設定
TARGET_FILES=("/etc/profile" "/etc/bashrc" /etc/profile.d/*.sh)
RESULT="KO"
FOUND_FILE=""

for FILE in "${TARGET_FILES[@]}"; do
    if grep -Eq '^\s*umask\s+0*27' "$FILE" 2>/dev/null; then
        RESULT="OK"
        FOUND_FILE="$FILE"
        break
    fi
done

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0241 umask 027 found in $FOUND_FILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0241 umask 027 not properly set in /etc/profile, /etc/bashrc, or /etc/profile.d/*.sh"
fi

# TWGCB-01-008-0242 檢查 /etc/login.defs 的預設 UMASK，UMASK 應設為 027 或更嚴格 (如 077) 。
# --- 變數定義 ---
FILE="/etc/login.defs"
REQUIRED_UMASK="027"
# 修復指令：直接修改檔案中的 UMASK 設定 
FIX_COMMAND="sed -i 's/^\s*UMASK\s\+[0-9]\+/UMASK 027/' $FILE"

# --- 核心檢查邏輯 ---
# 1. 抓取 UMASK 行且排除註解
# 2. 提取數值並檢查是否符合 027 
CURRENT_UMASK=$(grep -iE '^\s*UMASK' "$FILE" 2>/dev/null | awk '{print $2}')

if [[ "$CURRENT_UMASK" == "027" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0242 UMASK in $FILE is correctly set to $CURRENT_UMASK."
else
    # 針對權限數值，我們通常要求精確匹配規範的 027
    VALUE="${CURRENT_UMASK:-Not Set}"
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0242 UMASK error: current is '$VALUE' (Expected: 027). ($FIX_COMMAND)"
fi


	
	
# TWGCB-01-008-0243 檢查是否限制 su 指令僅允許 wheel 群組成員使用
PAM_FILE="/etc/pam.d/su"
GROUP_FILE="/etc/group"
RESULT="OK"
ISSUES=()

# 檢查 pam_wheel.so 是否啟用
if grep -Eq '^\s*auth\s+required\s+pam_wheel\.so\s+use_uid' "$PAM_FILE"; then
    PAM_STATUS="OK"
else
    PAM_STATUS="KO"
    ISSUES+=("pam_wheel.so use_uid not enabled in $PAM_FILE")
fi

# 檢查 wheel 群組是否存在
if grep -q '^wheel:' "$GROUP_FILE"; then
    WHEEL_LINE=$(grep '^wheel:' "$GROUP_FILE")
    # 取出群組成員
    MEMBERS=$(echo "$WHEEL_LINE" | awk -F: '{print $4}')
    if [[ -z "$MEMBERS" ]]; then
        ISSUES+=("wheel group exists but has no members")
    else
        # 確認 root 在裡面
        if echo "$MEMBERS" | grep -qw "root"; then
            GROUP_STATUS="OK"
        else
            GROUP_STATUS="KO"
            ISSUES+=("root not in wheel group members")
        fi
    fi
else
    GROUP_STATUS="KO"
    ISSUES+=("wheel group not found in $GROUP_FILE")
fi

# 輸出結果
if [ ${#ISSUES[@]} -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0243 su restricted to wheel group (pam_wheel.so use_uid enabled, wheel group: $MEMBERS)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0243 misconfiguration detected:"
    for issue in "${ISSUES[@]}"; do
        echo "   - $issue"
    done
fi	

# TWGCB-01-008-0244 檢查 firewalld 套件是否已安裝	
	if rpm -q firewalld >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0244 firewalld is installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0244 firewalld is NOT installed(dnf install firewalld)"
	fi

# TWGCB-01-008-0245 是否啟用firewalld服務	 
	if systemctl is-active --quiet firewalld; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0245 firewalld service is active"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0245 firewalld service is NOT active(systemctl --now enable firewalld)"
    fi


# TWGCB-01-008-0246 檢查 iptables 與 ip6tables 是否已 mask
SERVICES=("iptables" "ip6tables")
RESULT="OK"
BAD_LIST=()

for svc in "${SERVICES[@]}"; do
    if ! systemctl is-enabled --quiet "$svc" 2>/dev/null; then
        # 如果不是 masked，用文字讀取實際狀態
        state=$(systemctl is-enabled "$svc" 2>/dev/null)
        if [[ "$state" != "masked" ]]; then
            RESULT="KO"
            BAD_LIST+=("$svc")
        fi
    fi
done

# 輸出結果
if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0246 iptables & ip6tables are masked"
else
    bad=$(printf "%s " "${BAD_LIST[@]}")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0246 These services are NOT masked(systemctl --now mask $bad)"
fi
	
# TWGCB-01-008-0247 檢查 nftables 服務是否停用並遮蔽
SERVICE="nftables"
state=$(systemctl is-enabled "$SERVICE" 2>&1)

# 正確狀態必須是 masked
if [[ "$state" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0247 $SERVICE service is masked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0247 $SERVICE service is NOT masked(systemctl --now mask $SERVICE)"
fi


	
# TWGCB-01-008-0248 檢查 firewalld 預設區域設定
RESULT="KO"
# 確認 firewalld 是否存在
if systemctl list-unit-files | grep -q "^firewalld\.service"; then
    if systemctl is-active firewalld >/dev/null 2>&1; then
        DEFAULT_ZONE=$(firewall-cmd --get-default-zone 2>/dev/null)
        if [[ "$DEFAULT_ZONE" == "public" ]]; then
            RESULT="OK"
        fi
    else
        echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-008-0246 firewalld 未啟用，無法檢查預設區域"
        exit 0
    fi
else
    echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-008-0246 firewalld 未安裝"
    exit 0
fi

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0248 firewalld 預設區域已設定為 public"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0248 firewalld 預設區域未設定為 public，請執行： firewall-cmd --set-default-zone=public"
fi


# TWGCB-01-008-0249：檢查 nftables 服務狀態與 firewalld 衝突
NFT_ACT=$(systemctl is-active --quiet nftables && echo "active" || echo "inactive")
FWD_ACT=$(systemctl is-active --quiet firewalld && echo "active" || echo "inactive")

if [ "$NFT_ACT" == "active" ]; then
    if [ "$FWD_ACT" == "active" ]; then
        # 狀況：兩者都啟用 (衝突)
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0249 nftables service is active but need to mask firewalld (systemctl --now mask firewalld)"
    else
        # 狀況：只有 nftables 啟用 (合規)
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0249 nftables service is active"
    fi
else
    if [ "$FWD_ACT" == "active" ]; then
        # 狀況：nftables 未啟動但 firewalld 啟動
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0249 nftables service is NOT active(but firewalld is active)"
    else
        # 狀況：兩者都沒啟動
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0249 nftables service is NOT active(systemctl --now enable nftables)"
    fi
fi

# TWGCB-01-008-0250 檢查 firewalld 服務是否停用並遮蔽
SERVICE="firewalld"
state=$(systemctl is-enabled "$SERVICE" 2>&1)

# 正確狀態必須是 masked
if [[ "$state" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0250 $SERVICE service is masked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0250 $SERVICE service is NOT masked(systemctl --now mask $SERVICE)"
fi


# TWGCB-01-008-0251：檢查是否已建立 nftables 表
# 邏輯：檢查 nft list tables 的輸出是否為空
NFT_TABLES=$(nft list tables 2>/dev/null)
if [ -z "$NFT_TABLES" ]; then
    # 若輸出為空，代表未建立任何表
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0251 No nftables tables found. Nftables is not configured."
else
    # 若有輸出，代表已建立表 (符合基準)
    # 將找到的表列名稍微整理，顯示在後方供參考
    TABLE_NAMES=$(echo "$NFT_TABLES" | awk '{print $2}' | xargs | tr ' ' ',')
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0251 nftables tables detected ($TABLE_NAMES)."
fi
	
# TWGCB-01-008-0252：檢查是否已建立 nftables 鏈
# 邏輯：檢查 nft list chains 的輸出是否為空
NFT_CHAINS=$(nft list chains 2>/dev/null)
if [ -z "$NFT_CHAINS" ]; then
    # 若輸出為空，代表未定義任何鏈
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0252 No nftables chains found."
else
    # 若有輸出，代表已建立鏈
    # 統計鏈的數量並列出，方便參考
    CHAIN_COUNT=$(echo "$NFT_CHAINS" | grep -c "chain")
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0252 nftables chains detected (Total: $CHAIN_COUNT)."
fi

# TWGCB-01-008-0253：檢查 nftables 迴路介面規則
NFT_RULES=$(nft list ruleset 2>/dev/null)
# 1. 檢查是否接受 lo 介面流量
CHECK_LO=$(echo "$NFT_RULES" | grep -q "iif \"lo\" accept" && echo "OK")
# 2. 檢查是否阻擋 127.0.0.0/8 偽冒 (不論是否有 counter)
CHECK_V4=$(echo "$NFT_RULES" | grep "ip saddr 127.0.0.0/8" | grep -q "drop" && echo "OK")
# 3. 檢查是否阻擋 ::1 偽冒 (不論是否有 counter)
CHECK_V6=$(echo "$NFT_RULES" | grep "ip6 saddr ::1" | grep -q "drop" && echo "OK")
if [ -z "$NFT_RULES" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0253 Nftables ruleset is empty."
elif [ "$CHECK_LO" == "OK" ] && [ "$CHECK_V4" == "OK" ] && [ "$CHECK_V6" == "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0253 Loopback traffic rules are correctly set."
else
    # 簡潔地列出缺失項目
    MISSING=""
    [ "$CHECK_LO" != "OK" ] && MISSING+="lo_accept "
    [ "$CHECK_V4" != "OK" ] && MISSING+="v4_drop "
    [ "$CHECK_V6" != "OK" ] && MISSING+="v6_drop "
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0253 Loopback rules missing: [ $MISSING]"
fi
	

# TWGCB-01-008-0254：檢查 nftables 預設政策是否為 drop (input/forward/output)
# 邏輯：檢查 inet filter 表下的三個基本鏈是否都具備 policy drop
NFT_RULES=$(nft list ruleset 2>/dev/null)
# 分別檢查 input, forward, output 的政策
CHECK_INPUT=$(echo "$NFT_RULES" | grep -A 5 "chain input" | grep "policy drop")
CHECK_FORWARD=$(echo "$NFT_RULES" | grep -A 5 "chain forward" | grep "policy drop")
CHECK_OUTPUT=$(echo "$NFT_RULES" | grep -A 5 "chain output" | grep "policy drop")
if [ -z "$NFT_RULES" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0254 Nftables ruleset is empty."
elif [ -n "$CHECK_INPUT" ] && [ -n "$CHECK_FORWARD" ] && [ -n "$CHECK_OUTPUT" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0254 All base chains (input/forward/output) policy set to drop."
else
    # 找出具體是哪一個鏈沒設好，顯示在畫面上
    MISSING=""
    [ -z "$CHECK_INPUT" ] && MISSING+="input "
    [ -z "$CHECK_FORWARD" ] && MISSING+="forward "
    [ -z "$CHECK_OUTPUT" ] && MISSING+="output "
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0254 Missing 'policy drop' on: $MISSING"
fi

# TWGCB-01-008-0255：檢查 nftables.conf 是否取消 include 註解
# 邏輯：檢查 /etc/sysconfig/nftables.conf 中是否存在未被註解的 include 語句
NFT_CONF="/etc/sysconfig/nftables.conf"
if [ ! -f "$NFT_CONF" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0255 $NFT_CONF does not exist."
elif grep -qE '^include' "$NFT_CONF"; then
    # 找到以 include 開頭的行（代表已取消註解）
    INCLUDE_PATH=$(grep -E '^include' "$NFT_CONF" | awk '{print $2}' | tr -d '"')
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0255 nftables is set to include ruleset: $INCLUDE_PATH"
else
    # 沒找到 include 或被註解了 (#include)
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0255 nftables ruleset include is commented out or missing."
fi

# TWGCB-01-008-0256：檢查 iptables 服務是否已啟用且正在執行
# 邏輯：檢查 systemd 服務狀態是否為 enabled 且 active
SERVICE_STATUS=$(systemctl is-active iptables 2>/dev/null)
SERVICE_ENABLED=$(systemctl is-enabled iptables 2>/dev/null)

if [ "$SERVICE_STATUS" = "active" ] && [ "$SERVICE_ENABLED" = "enabled" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0256 iptables service is enabled and active."
else
    # 輸出具體狀態供參考
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0256 iptables service is NOT correctly set. (Status: $SERVICE_STATUS, Enabled: $SERVICE_ENABLED)"
fi

# TWGCB-01-008-0257 檢查 firewalld 服務是否停用並遮蔽
SERVICE="firewalld"
state=$(systemctl is-enabled "$SERVICE" 2>&1)

# 正確狀態必須是 masked
if [[ "$state" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0257 $SERVICE service is masked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0257 $SERVICE service is NOT masked(systemctl --now mask $SERVICE)"
fi

# TWGCB-01-008-0258：檢查 iptables 預設政策是否為 DROP
# 邏輯：使用 iptables -L 檢查 INPUT, FORWARD, OUTPUT 鏈的 policy 是否為 DROP
IPT_INPUT=$(iptables -L INPUT -n | grep "policy DROP")
IPT_FORWARD=$(iptables -L FORWARD -n | grep "policy DROP")
IPT_OUTPUT=$(iptables -L OUTPUT -n | grep "policy DROP")

# 先確認 iptables 是否有規則正在運作
if ! iptables -L -n >/dev/null 2>&1; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0258 iptables command failed or kernel module not loaded."
elif [ -n "$IPT_INPUT" ] && [ -n "$IPT_FORWARD" ] && [ -n "$IPT_OUTPUT" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0258 All iptables base chains (INPUT/FORWARD/OUTPUT) policy set to DROP."
else
    # 找出具體是哪一個鏈沒設好
    MISSING=""
    [ -z "$IPT_INPUT" ]   && MISSING+="INPUT "
    [ -z "$IPT_FORWARD" ] && MISSING+="FORWARD "
    [ -z "$IPT_OUTPUT" ]  && MISSING+="OUTPUT "
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0258 Missing 'policy DROP' on: $MISSING"
fi

# TWGCB-01-008-0259：檢查 iptables 迴路介面規則
# 邏輯：檢查是否存在允許 lo 介面以及拒絕 127.0.0.0/8 偽冒來源的規則
IPT_RULES=$(iptables -S 2>/dev/null)

# 1. 檢查 INPUT 是否接受來自 lo 的流量
CHECK_IN_LO=$(echo "$IPT_RULES" | grep "\-A INPUT -i lo -j ACCEPT")

# 2. 檢查 OUTPUT 是否接受往 lo 的流量
CHECK_OUT_LO=$(echo "$IPT_RULES" | grep "\-A OUTPUT -o lo -j ACCEPT")

# 3. 檢查是否拒絕來自 127.0.0.0/8 但非 lo 介面的偽冒流量
# 基準要求是執行 iptables -A INPUT -s 127.0.0.0/8 -j DROP
CHECK_SADDR_DROP=$(echo "$IPT_RULES" | grep "\-A INPUT -s 127.0.0.0/8 -j DROP")

if [ -z "$IPT_RULES" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0259 iptables has no rules loaded."
elif [ -n "$CHECK_IN_LO" ] && [ -n "$CHECK_OUT_LO" ] && [ -n "$CHECK_SADDR_DROP" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0259 iptables loopback rules are correctly set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0259 iptables loopback rules are missing or incomplete."
fi

# TWGCB-01-008-0260：檢查 ip6tables 預設政策是否為 DROP
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0260.log"
# 取得目前 ip6tables 的政策狀態
IP6_INPUT=$(ip6tables -L INPUT -n 2>/dev/null | grep "policy DROP")
IP6_FORWARD=$(ip6tables -L FORWARD -n 2>/dev/null | grep "policy DROP")
IP6_OUTPUT=$(ip6tables -L OUTPUT -n 2>/dev/null | grep "policy DROP")

# 判斷邏輯
if ! ip6tables -L -n >/dev/null 2>&1; then
    # 若指令執行失敗（可能未安裝或核心不支援 IPv6）
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0260 ip6tables command failed (Service might not be installed)."
elif [ -n "$IP6_INPUT" ] && [ -n "$IP6_FORWARD" ] && [ -n "$IP6_OUTPUT" ]; then
    # 全部符合
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0260 All ip6tables base chains policy set to DROP."
else
    # 只要有一項不符合，就寫入 LOG 並在畫面提示
    [ -z "$IP6_INPUT" ]   && echo "Missing 'ip6tables -P INPUT DROP'" >> "$LOGFILE"
    [ -z "$IP6_FORWARD" ] && echo "Missing 'ip6tables -P FORWARD DROP'" >> "$LOGFILE"
    [ -z "$IP6_OUTPUT" ]  && echo "Missing 'ip6tables -P OUTPUT DROP'" >> "$LOGFILE"
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0260 ip6tables policy is not secure. (see $LOGFILE)"
fi


# TWGCB-01-008-0261：檢查 ip6tables 迴路介面規則
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0261.log"

# 預期必須存在的規則字串
EXPECT_V6_IN_LO="-A INPUT -i lo -j ACCEPT"
EXPECT_V6_OUT_LO="-A OUTPUT -o lo -j ACCEPT"
EXPECT_V6_DROP_SADDR="-A INPUT -s ::1/128 -j DROP"

# 取得目前 ip6tables 生效規則
IP6_RULES=$(ip6tables -S 2>/dev/null)

# 執行檢查
if [ -z "$IP6_RULES" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0261 ip6tables has no rules loaded."
else
    # 逐一檢查缺失規則並寫入 LOG
    MISSING_COUNT=0
    
    if ! echo "$IP6_RULES" | grep -qF -- "$EXPECT_V6_IN_LO"; then
        echo "Missing: ip6tables $EXPECT_V6_IN_LO" >> "$LOGFILE"
        ((MISSING_COUNT++))
    fi
    
    if ! echo "$IP6_RULES" | grep -qF -- "$EXPECT_V6_OUT_LO"; then
        echo "Missing: ip6tables $EXPECT_V6_OUT_LO" >> "$LOGFILE"
        ((MISSING_COUNT++))
    fi

    # 註：::1 在 ip6tables -S 顯示時可能會加上 /128 或保持 ::1，視版本而定
    if ! echo "$IP6_RULES" | grep -qE -- "-A INPUT -s ::1(/128)? -j DROP"; then
        echo "Missing: ip6tables -A INPUT -s ::1 -j DROP" >> "$LOGFILE"
        ((MISSING_COUNT++))
    fi

    if [ "$MISSING_COUNT" -eq 0 ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0261 ip6tables loopback rules are correctly set."
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0261 ip6tables loopback rules are incomplete. (see $LOGFILE)"
    fi
fi



# TWGCB-01-008-0262 檢查 sshd 服務是否啟用並執行中
if systemctl list-unit-files | grep -q "^sshd\.service"; then
    ACTIVE_STATE=$(systemctl is-active sshd 2>/dev/null)
    ENABLED_STATE=$(systemctl is-enabled sshd 2>/dev/null)

    if [[ "$ACTIVE_STATE" == "active" && "$ENABLED_STATE" == "enabled" ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0262 sshd 服務已啟用並正在執行"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0262 sshd 服務未正確啟用或未執行，建議執行： systemctl --now enable sshd.service"
    fi
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0262 系統未安裝 openssh-server 套件，請執行： dnf install -y openssh-server"
fi	
	
	

# TWGCB-01-008-0263：檢查 SSH 服務使用協定版本
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0263.log"

# 1. 檢查主設定檔或子設定檔是否明確寫入 Protocol 2
# 考慮到 RHEL 9 建議寫法，我們檢查是否存在這行 (不論有無空格)
if ! grep -riq "^\s*Protocol\s*2" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/ 2>/dev/null; then
    echo "[Issue] /etc/ssh/sshd_config: Missing 'Protocol 2' as required by GCB document." >> "$LOGFILE"
    echo "Fix Suggestion: echo 'Protocol 2' >> /etc/ssh/sshd_config && systemctl restart sshd" >> "$LOGFILE"
fi

# 2. 同時確保沒有人寫 Protocol 1 (安全加固)
if grep -riq "^\s*Protocol\s*1" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/ 2>/dev/null; then
    echo "[Issue] Insecure 'Protocol 1' detected!" >> "$LOGFILE"
fi

# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0263 SSH Protocol 2 check failed (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0263 SSH Protocol 2 is correctly configured."
fi

cramfs01=$(ls -l /etc/ssh/sshd_config | awk '{print $3 ":" $4}')
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0264 Check /etc/ssh/sshd_config is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0264 no root:root"
    fi


# TWGCB-01-008-0265 檢查 /etc/ssh/sshd_config 權限設定
SSHD_CONF="/etc/ssh/sshd_config"
if [ ! -f "$SSHD_CONF" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0265 找不到 $SSHD_CONF"
    exit 1
fi
PERM=$(stat -c "%a" "$SSHD_CONF")
# 600 或更嚴格 (如 400)
if [ "$PERM" -le 600 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0265 $SSHD_CONF permission is $PERM"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0265 $SSHD_CONF permission is $PERM, should be 600 or lower"
fi


# TWGCB-01-008-0266 檢查 SSH 存取限制設定
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0266.log"
SSHD_CONF="/etc/ssh/sshd_config"

# 查找是否有啟用的限制指令 (AllowUsers, AllowGroups, DenyUsers, DenyGroups)
MATCHES=$(grep -Ei '^\s*(AllowUsers|AllowGroups|DenyUsers|DenyGroups)\s+' "$SSHD_CONF" 2>/dev/null)

if [ -n "$MATCHES" ]; then
    # 擷取關鍵字與數值並過濾多餘空白
    RESULT_VAL=$(echo "$MATCHES" | head -n 1 | xargs)
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0266 SSH access restriction is active: $RESULT_VAL"
else
    # 若缺失，則將檢查結果寫入日誌
    > "$LOGFILE"
    echo "Check failed: No active SSH access control keywords found in $SSHD_CONF." >> "$LOGFILE"
    echo "Required at least one of: AllowUsers, AllowGroups, DenyUsers, or DenyGroups." >> "$LOGFILE"
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0266 Missing SSH access restrictions. (see $LOGFILE)"
fi


# TWGCB-01-008-0267：檢查 SSH 主機私鑰檔案擁有者與群組
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0267.log"
# 1. 搜尋所有私鑰檔案並檢查其擁有者與群組 (應為 root:root)
# 使用 find 找出所有私鑰檔案，排除 .pub 公鑰
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' | while read -r KEY_FILE; do
    OWNER_GROUP=$(stat -c "%U:%G" "$KEY_FILE")
    if [ "$OWNER_GROUP" != "root:root" ]; then
        echo "[Issue] $KEY_FILE: current owner:group is $OWNER_GROUP (Expected: root:root)" >> "$LOGFILE"
        echo "Fix: chown root:root $KEY_FILE" >> "$LOGFILE"
    fi
done
# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0267 SSH private key ownership issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0267 All SSH host private keys owned by root:root."
fi

# TWGCB-01-008-0268：檢查 SSH 主機私鑰檔案權限 (應為 640)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0268.log"
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' | while read -r KEY_FILE; do
    PERM=$(stat -c "%a" "$KEY_FILE")
    if [ "$PERM" != "600" ]; then
        echo "[Issue] $KEY_FILE: current permission is $PERM (Expected: 600)" >> "$LOGFILE"
		echo "Fix: chmod 600 $KEY_FILE" >> "$LOGFILE"
    fi
done

if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0268 SSH private key permission issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0268 All SSH host private keys permissions are 600."
fi

# TWGCB-01-008-0269 SSH 公鑰擁有者
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0270.log"
PUB_KEYS=$(find /etc/ssh -maxdepth 1 -type f -name "ssh_host_*_key.pub")
ERROR_COUNT=0
for key in $PUB_KEYS; do
    OWNER=$(stat -c "%U:%G" "$key")
    if [ "$OWNER" != "root:root" ]; then
        ((ERROR_COUNT++))
        echo "chown root:root $key" >> "$LOGFILE"
    fi
done
if [ "$ERROR_COUNT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0269 SSH public keys ownership is correct."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0269 $ERROR_COUNT keys have wrong ownership. See $LOGFILE"
fi

# TWGCB-01-008-0270：檢查 SSH 主機公鑰檔案權限
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0270.log"

# 1. 搜尋所有公鑰檔案並檢查權限
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' | while read -r PUB_FILE; do
    PERM=$(stat -c "%a" "$PUB_FILE")
    
    # 只要權限數字大於 644 (例如 664, 666, 755)，就視為不合規
    if [ "$PERM" -gt 644 ]; then
        echo "[Issue] $PUB_FILE: permission is $PERM (Expected: 644 or less)" >> "$LOGFILE"
        echo "Fix: chmod 644 $PUB_FILE" >> "$LOGFILE"
    fi
done
# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0270 SSH public key permission issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0270 All SSH host public keys permissions are 644 or less."
fi

# TWGCB-01-008-0271 檢查 (RHEL 8 專用)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0271.log"
CONFIG_FILE="/etc/crypto-policies/back-ends/opensshserver.config"

# 官方要求內容
REQ_CIPHER="aes128-ctr,aes192-ctr,aes256-ctr"
REQ_MACS="hmac-sha2-512,hmac-sha2-256"
REQ_KEX="ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512"

if [ ! -f "$CONFIG_FILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0271 Configuration file missing."
else
    # 檢查各項參數是否存在於檔案中
    MISSING=""
    grep -qF -- "$REQ_CIPHER" "$CONFIG_FILE" || MISSING+="Ciphers "
    grep -qF -- "$REQ_MACS" "$CONFIG_FILE" || MISSING+="MACS "
    grep -qF -- "$REQ_KEX" "$CONFIG_FILE" || MISSING+="KexAlgorithms "

    if [ -z "$MISSING" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0271 SSH Crypto Policies satisfy GCB requirements."
    else
        # 將正確的設定範例寫入 LOG，讓管理者直接複製
        echo "Missing settings in $CONFIG_FILE: $MISSING" > "$LOGFILE"
        echo -e "\nExpected content:" >> "$LOGFILE"
        echo "-oCiphers=$REQ_CIPHER" >> "$LOGFILE"
        echo "-oMACS=$REQ_MACS" >> "$LOGFILE"
        echo "-oKexAlgorithms=$REQ_KEX" >> "$LOGFILE"
        
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0271 Incorrect SSH crypto settings. (see $LOGFILE)"
    fi
fi
 
	
# TWGCB-01-008-0272 檢查 SSH LogLevel (使用系統運行參數)
# 使用 sshd -T 取得實際生效的 LogLevel，並轉為大寫
CURRENT_VAL=$(sshd -T 2>/dev/null | grep -i '^loglevel ' | awk '{print $2}' | tr '[:lower:]' '[:upper:]')

if [[ "$CURRENT_VAL" == "VERBOSE" || "$CURRENT_VAL" == "INFO" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0272 LogLevel is $CURRENT_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0272 LogLevel is incorrect. (need LogLevel VERBOSE or LogLevel INFO)"
fi
	
# TWGCB-01-008-0273 X11Forwarding (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^x11forwarding ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0273 X11Forwarding is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0273 X11Forwarding should be set to 'no'.(need X11Forwarding no)"
fi
	
# TWGCB-01-008-0274 MaxAuthTries (應為 4)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^maxauthtries ' | awk '{print $2}')
if [ "$CURRENT" == "4" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0274 MaxAuthTries is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0274 MaxAuthTries should be set to '4'.(need MaxAuthTries 4)"
fi
	
# TWGCB-01-008-0275 IgnoreRhosts (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^ignorerhosts ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0275 IgnoreRhosts is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0275 IgnoreRhosts should be set to 'yes'.(need IgnoreRhosts yes)"
fi
	
# TWGCB-01-008-0276 HostbasedAuthentication (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^hostbasedauthentication ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0276 HostbasedAuthentication is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0276 HostbasedAuthentication should be set to 'no'.(need HostbasedAuthentication no)"
fi
	
# TWGCB-01-008-0277 PermitRootLogin (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^permitrootlogin ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0277 PermitRootLogin is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0277 PermitRootLogin should be set to 'no'.(need PermitRootLogin no)"
fi
	
# TWGCB-01-008-0278 PermitEmptyPasswords (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^permitemptypasswords ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0278 PermitEmptyPasswords is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0278 PermitEmptyPasswords should be set to 'no'.(need PermitEmptyPasswords no)"
fi
	
# TWGCB-01-008-0279 PermitUserEnvironment (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^permituserenvironment ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0279 PermitUserEnvironment is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0279 PermitUserEnvironment should be set to 'no'.(need PermitUserEnvironment no)"
fi


# TWGCB-01-008-0280 檢查 SSH 閒置逾時 (0 < Interval <= 600, CountMax = 1)
LOGFILE="$SCRIPT_DIR/TWGCB-01-008-0280.log"

# 使用 sshd -T 取得實際生效值
INTERVAL=$(sshd -T 2>/dev/null | grep -i '^clientaliveinterval ' | awk '{print $2}')
COUNTMAX=$(sshd -T 2>/dev/null | grep -i '^clientalivecountmax ' | awk '{print $2}')

# 判斷邏輯：Interval 必須 > 0 且 <= 600，同時 CountMax 必須為 1
if [[ "$INTERVAL" -gt 0 && "$INTERVAL" -le 600 && "$COUNTMAX" == "1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0280 SSH Timeout is secure: Interval=$INTERVAL, CountMax=$COUNTMAX"
else
    # 不符合時才寫入日誌
    > "$LOGFILE"
    echo "SSH Idle Timeout Configuration Issue" >> "$LOGFILE"
    echo "Current settings: ClientAliveInterval=$INTERVAL, ClientAliveCountMax=$COUNTMAX" >> "$LOGFILE"
    echo "Requirement: 0 < ClientAliveInterval <= 600 AND ClientAliveCountMax = 1" >> "$LOGFILE"
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0280 SSH Timeout error (Current: ${INTERVAL}/${COUNTMAX}). (see $LOGFILE)"
fi

# TWGCB-01-008-0281 LoginGraceTime (應為 60)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^logingracetime ' | awk '{print $2}')
if [ "$CURRENT" == "60" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0281 LoginGraceTime is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0281 LoginGraceTime should be set to '60'.(need LoginGraceTime 60)"
fi

# TWGCB-01-008-0282 UsePAM (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^usepam ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0282 UsePAM is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0282 UsePAM should be set to 'yes'.(need UsePAM yes)"
fi

# TWGCB-01-008-0283 AllowTcpForwarding (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^allowtcpforwarding ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0283 AllowTcpForwarding is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0283 AllowTcpForwarding should be set to 'no'.(need AllowTcpForwarding no)"
fi

# TWGCB-01-008-0284 MaxStartups (應為 10:30:60)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^maxstartups ' | awk '{print $2}')
if [ "$CURRENT" == "10:30:60" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0284 MaxStartups is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0284 MaxStartups should be set to '10:30:60'.(need MaxStartups 10:30:60)"
fi

# TWGCB-01-008-0285 MaxSessions (應為 4)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^maxsessions ' | awk '{print $2}')
if [ "$CURRENT" == "4" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0285 MaxSessions is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0285 MaxSessions should be set to '4'.(need MaxSessions 4)"
fi

# TWGCB-01-008-0286 StrictModes (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^strictmodes ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0286 StrictModes is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0286 StrictModes should be set to 'yes'.(need StrictModes yes)"
fi

# TWGCB-01-008-0287 Compression (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^compression ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0287 Compression is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0287 Compression should be set to 'no'.(need Compression no)"
fi

# TWGCB-01-008-0288 IgnoreUserKnownHosts (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^ignoreuserknownhosts ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0288 IgnoreUserKnownHosts is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0288 IgnoreUserKnownHosts should be set to 'yes'.(need IgnoreUserKnownHosts yes)"
fi

# TWGCB-01-008-0289 PrintLastLog (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^printlastlog ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0289 PrintLastLog is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0289 PrintLastLog should be set to 'yes'.(need PrintLastLog yes)"
fi
 


####TWGCB-01-008-0290	
FILES=$(find / -name "shosts.equiv" 2>/dev/null)

if [ -z "$FILES" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0290 no shosts.equiv files found"
else
    while IFS= read -r FILE; do
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0290 shosts.equiv exists: $FILE(find / -name 'shosts.equiv')"
    done <<< "$FILES"
fi


####TWGCB-01-008-0291	
FILES=$(find / -name "*.shosts" 2>/dev/null)

if [ -z "$FILES" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0291 no .shosts files found"
else
    while IFS= read -r FILE; do
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0291 .shosts file exists: $FILE(find / -name '*.shosts')"
    done <<< "$FILES"
fi


####TWGCB-01-008-0292
CFG="/etc/sysconfig/sshd"
if [ ! -f "$CFG" ]; then
    # 如果檔案不存在，視為 OK（沒有覆寫）
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0292 $CFG not found (no override)"
else
    # 檢查是否有未註解的 CRYPTO_POLICY
    if grep -qE '^\s*CRYPTO_POLICY\s*=' "$CFG"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0292 CRYPTO_POLICY override is enabled"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0292 CRYPTO_POLICY override is disabled"
    fi
fi

# 清除所有 0 byte 的 TWGCB log 檔案
find "$SCRIPT_DIR" -maxdepth 1 -type f -name "TWGCB-*.log" -size 0 -delete 2>/dev/null



######################################################################################################


echo "#########################################################################"
echo
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Script completed in" $DIFF "seconds"
echo
echo "Executed on :"
echo
echo "Check GCB hostname is" $HOSTNAME
date
echo
echo "#########################################################################"
echo
###################################################################################################### 






######################################################################################################
            show_menu;
		;;	
	    12) clear;
            option_picked "Option 12 Picked";
######################################################################################################
echo
echo "#########################################################################"
echo -e "\e[0;33m 1. Red Hat Enterprise Linux 9 Server GCB Check V1.2/////// \e[0m"
echo "#########################################################################"
START=$(date +%s)
echo
echo "#########################################################################"
echo
####################################### Red Hat 9 SYSTEM AND SECURITY CHECK #######################################



# 清除日誌檔案
rm -f "$SCRIPT_DIR"/TWGCB-01-012-*.log 2>/dev/null



if grep -q "install cramfs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist cramfs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0001 cramfs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0001 cramfs module is not disabled"
fi 

if grep -q "install squashfs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist squashfs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0002 squashfs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0002 squashfs module is not disabled"
fi 


if grep -q "install udf /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist udf" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0003 udf module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0003 udf module is not disabled"
fi 

# TWGCB-01-012-0004：檢查 /tmp 是否為獨立分區 (或 tmpfs)
if findmnt /tmp >/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0004 /tmp is a separate partition."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0004 /tmp is NOT a separate partition."
fi

# TWGCB-01-012-0005：檢查 /tmp 的 nodev 選項
if findmnt -n -o OPTIONS /tmp 2>/dev/null | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0005 /tmp mount option 'nodev' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0005 /tmp mount option 'nodev' is missing."
fi

# TWGCB-01-012-0006：檢查 /tmp 的 nosuid 選項
if findmnt -n -o OPTIONS /tmp 2>/dev/null | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0006 /tmp mount option 'nosuid' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0006 /tmp mount option 'nosuid' is missing."
fi

# TWGCB-01-012-0007：檢查 /tmp 的 noexec 選項
if findmnt -n -o OPTIONS /tmp 2>/dev/null | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0007 /tmp mount option 'noexec' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0007 /tmp mount option 'noexec' is missing."
fi
	
# TWGCB-01-012-0008 檢測修改建議
# 1. 取得根目錄的設備名稱 (ROOT_DEV)
ROOT_DEV=$(findmnt -n -o SOURCE / 2>/dev/null)
# 2. 取得 /var 目錄的設備名稱 (VAR_DEV)
VAR_DEV=$(findmnt -n -o SOURCE /var 2>/dev/null)

# 3. 判斷是否為獨立掛載
# 獨立掛載條件：
# a. /var 必須有設備名稱 (即已掛載)
# b. /var 的設備名稱不能與根目錄相同
if [ -n "$VAR_DEV" ] && [ "$VAR_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0008 /var is a separate mounted filesystem: $VAR_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0008 /var is NOT a separate mounted filesystem (Current device: $VAR_DEV)"
fi


# TWGCB-01-012-0009 檢測修改建議
# 1. 取得根目錄的設備名稱 (ROOT_DEV)
ROOT_DEV=$(findmnt -n -o SOURCE / 2>/dev/null)
# 2. 取得 /var/tmp 目錄的設備名稱 (VARTMP_DEV)
VARTMP_DEV=$(findmnt -n -o SOURCE /var/tmp 2>/dev/null)

# 3. 判斷是否為獨立掛載 (與上述相同邏輯)
if [ -n "$VARTMP_DEV" ] && [ "$VARTMP_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0009 /var/tmp is a separate mounted filesystem: $VARTMP_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0009 /var/tmp is NOT a separate mounted filesystem (Current device: $VARTMP_DEV)"
fi

# TWGCB-01-012-0010：檢查 /var/tmp 的 nodev 選項
if findmnt -n -o OPTIONS /var/tmp 2>/dev/null | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0010 /var/tmp mount option 'nodev' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0010 /var/tmp mount option 'nodev' is missing."
fi

# TWGCB-01-012-0011：檢查 /var/tmp 的 nosuid 選項
if findmnt -n -o OPTIONS /var/tmp 2>/dev/null | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0011 /var/tmp mount option 'nosuid' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0011 /var/tmp mount option 'nosuid' is missing."
fi

# TWGCB-01-012-0012：檢查 /var/tmp 的 noexec 選項
if findmnt -n -o OPTIONS /var/tmp 2>/dev/null | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0012 /var/tmp mount option 'noexec' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0012 /var/tmp mount option 'noexec' is missing."
fi


### TWGCB-01-012-0013 ####
VARLOG_DEV=$(findmnt -n -o SOURCE /var/log 2>/dev/null)
if [ -n "$VARLOG_DEV" ] && [ "$VARLOG_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0013 /var/log is a separate mounted filesystem: $VARLOG_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0013 /var/log is NOT a separate mounted filesystem (Current device: $VARLOG_DEV)"
fi

### TWGCB-01-012-0014 ####
VARLOGAUDIT_DEV=$(findmnt -n -o SOURCE /var/log/audit 2>/dev/null)
if [ -n "$VARLOGAUDIT_DEV" ] && [ "$VARLOGAUDIT_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0014 /var/log/audit is a separate mounted filesystem: $VARLOGAUDIT_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0014 /var/log/audit is NOT a separate mounted filesystem (Current device: $VARLOGAUDIT_DEV)"
fi

### TWGCB-01-012-0015 ####
HOME_DEV=$(findmnt -n -o SOURCE /home 2>/dev/null)
if [ -n "$HOME_DEV" ] && [ "$HOME_DEV" != "$ROOT_DEV" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0015 /home is a separate mounted filesystem: $HOME_DEV"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0015 /home is NOT a separate mounted filesystem (Current device: $HOME_DEV)"
fi


# TWGCB-01-012-0016 檢查 /home 的 nodev 選項
if findmnt -n -o OPTIONS /home 2>/dev/null | grep -qw "nodev"; then
    # 檢查實際掛載選項是否包含 nodev
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0016 /home mount option 'nodev' is enabled."
else
    # 實際掛載選項不包含 nodev，判定不符合
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0016 /home mount option 'nodev' is missing."
fi

# TWGCB-01-012-0017：檢查 /dev/shm 是否設定 nodev
if findmnt -n -o OPTIONS /dev/shm 2>/dev/null | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0017 /dev/shm mount option 'nodev' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0017 /dev/shm mount option 'nodev' is missing."
fi
	
# TWGCB-01-012-0018：檢查 /dev/shm 是否設定 nosuid
if findmnt -n -o OPTIONS /dev/shm 2>/dev/null | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0018 /dev/shm mount option 'nosuid' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0018 /dev/shm mount option 'nosuid' is missing."
fi
	
# TWGCB-01-012-0019：檢查 /dev/shm 是否設定 noexec
if findmnt -n -o OPTIONS /dev/shm 2>/dev/null | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0019 /dev/shm mount option 'noexec' is enabled."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0019 /dev/shm mount option 'noexec' is missing."
fi
	
# TWGCB-01-012-0020：檢查抽取式媒體的 nodev 選項
# 邏輯：若無掛載媒體則 OK；若有掛載則檢查是否具備 nodev
MOUNT_PATH=$(findmnt -RA | grep -E '/run/media/|/mnt/' | awk '{print $1}' | head -n 1)

if [ -z "$MOUNT_PATH" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0020 No removable media mounted (compliant)."
elif findmnt -n -o OPTIONS "$MOUNT_PATH" | grep -qw "nodev"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0020 Removable media '$MOUNT_PATH' has 'nodev'."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0020 Removable media '$MOUNT_PATH' is missing 'nodev'."
fi

# TWGCB-01-012-0021：檢查抽取式媒體的 nosuid 選項
if [ -z "$MOUNT_PATH" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0021 No removable media mounted (compliant)."
elif findmnt -n -o OPTIONS "$MOUNT_PATH" | grep -qw "nosuid"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0021 Removable media '$MOUNT_PATH' has 'nosuid'."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0021 Removable media '$MOUNT_PATH' is missing 'nosuid'."
fi

# TWGCB-01-012-0022：檢查抽取式媒體的 noexec 選項
if [ -z "$MOUNT_PATH" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0022 No removable media mounted (compliant)."
elif findmnt -n -o OPTIONS "$MOUNT_PATH" | grep -qw "noexec"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0022 Removable media '$MOUNT_PATH' has 'noexec'."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0022 Removable media '$MOUNT_PATH' is missing 'noexec'."
fi
	
# TWGCB-01-012-0023：檢查使用者家目錄之 nodev 選項
BAD_HOMES_23=""
# 找出 UID >= 1000 且排除 nobody 的家目錄路徑
for dir in $(awk -F: '($3>=1000)&&($1!="nobody"){print $6}' /etc/passwd | sort -u); do
    [ ! -d "$dir" ] && continue
    
    # 修正：使用 -M 檢查該目錄「本身」是否為獨立掛載點
    if findmnt -n -M "$dir" >/dev/null 2>&1; then
        if ! findmnt -n -o OPTIONS -M "$dir" | grep -qw "nodev"; then
            BAD_HOMES_23+="$dir "
        fi
    fi
done

if [ -z "$BAD_HOMES_23" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0023 All separate home partitions have 'nodev' set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0023 nodev missing on: $BAD_HOMES_23"
fi

# TWGCB-01-012-0024：檢查使用者家目錄之 nosuid 選項
BAD_HOMES_24=""
for dir in $(awk -F: '($3>=1000)&&($1!="nobody"){print $6}' /etc/passwd | sort -u); do
    [ ! -d "$dir" ] && continue
    
    # 修正：使用 -M 檢查該目錄「本身」是否為獨立掛載點
    if findmnt -n -M "$dir" >/dev/null 2>&1; then
        if ! findmnt -n -o OPTIONS -M "$dir" | grep -qw "nosuid"; then
            BAD_HOMES_24+="$dir "
        fi
    fi
done

if [ -z "$BAD_HOMES_24" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0024 All separate home partitions have 'nosuid' set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0024 nosuid missing on: $BAD_HOMES_24"
fi

# TWGCB-01-012-0025：檢查使用者家目錄之 noexec 選項
BAD_HOMES_25=""
for dir in $(awk -F: '($3>=1000)&&($1!="nobody"){print $6}' /etc/passwd | sort -u); do
    [ ! -d "$dir" ] && continue
    
    # 修正：使用 -M 檢查該目錄「本身」是否為獨立掛載點
    if findmnt -n -M "$dir" >/dev/null 2>&1; then
        if ! findmnt -n -o OPTIONS -M "$dir" | grep -qw "noexec"; then
            BAD_HOMES_25+="$dir "
        fi
    fi
done

if [ -z "$BAD_HOMES_25" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0025 All separate home partitions have 'noexec' set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0025 noexec missing on: $BAD_HOMES_25"
fi
	
####	TWGCB-01-012-0026
# 取得所有 NFS 掛載列（排除註解）
nfs_entries=$(grep -E '^[^#].*\s+nfs[4]?\s' /etc/fstab)

if [[ -z "$nfs_entries" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0026 no NFS entries found (not applicable)"
else
    if echo "$nfs_entries" | awk '{print $4}' | grep -vq "nodev"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0026 NFS nodev configuration is incorrect"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0026 NFS nodev configuration is correct"
    fi
fi

####	TWGCB-01-012-0027
# 取得所有 NFS 掛載列（排除註解）
nfs_entries=$(grep -E '^[^#].*\s+nfs[4]?\s' /etc/fstab)

if [[ -z "$nfs_entries" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0027 no NFS entries found (not applicable)"
else
    if echo "$nfs_entries" | awk '{print $4}' | grep -vq "nosuid"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0027 NFS nosuid configuration is incorrect"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0027 NFS nosuid configuration is correct"
    fi
fi


####	TWGCB-01-012-0028
# 取得所有 NFS 掛載列（排除註解）
nfs_entries=$(grep -E '^[^#].*\s+nfs[4]?\s' /etc/fstab)

if [[ -z "$nfs_entries" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0028 no NFS entries found (not applicable)"
else
    if echo "$nfs_entries" | awk '{print $4}' | grep -vq "noexec"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0028 NFS noexec configuration is incorrect"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0028 NFS noexec configuration is correct"
    fi
fi

# TWGCB-01-012-0029：檢查全域寫入目錄是否設定粘滯位 (Sticky Bit)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0029.log"

# 使用 -print0 處理空格，搜尋未設 sticky bit 的 world-writable 目錄
df --local -P | awk 'NR>1 {print $6}' | xargs -I '{}' find '{}' -xdev -type d -perm -0002 ! -perm -1000 -print0 2>/dev/null | xargs -0 -I '{}' echo "{}" >> "$LOGFILE"

if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0029 World-writable directories without sticky bit found (see $LOGFILE)"
    # 在 Log 最後一行提供萬用修復指令
    echo -e "\n[Fix Command]:\ndf --local -P | awk 'NR>1 {print \$6}' | xargs -I '{}' find '{}' -xdev -type d -perm -0002 ! -perm -1000 2>/dev/null | xargs -I '{}' chmod o+t '{}'" >> "$LOGFILE"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0029 all world-writable directories have sticky bit set"   
fi

	
autofs01=`systemctl is-active autofs`
    if [ "$autofs01" == "inactive" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0030 should be different to autofs Disable"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0030 should be different to autofs start for autofs.service"
    fi


if grep -q "install usb-storage /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist usb-storage" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0031 usb-storage module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0031 usb-storage module is not disabled"
fi 

	

###	TWGCB-01-012-0032 #### 檢查 GPG 簽章驗證是否啟用
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0032.log"

CHECK_MAIN_FILE() {
    local file="$1"
    local name="$2"

    if [ ! -f "$file" ]; then
        echo "Missing $file" >> "$LOGFILE"
        return
    fi

    # 只檢查 gpgcheck=1
    if ! grep -qE '^\s*gpgcheck\s*=\s*1' "$file"; then
        echo "$name: gpgcheck!=1 ($file)" >> "$LOGFILE"
    fi
}

CHECK_REPO_FILES() {
    for repo in /etc/yum.repos.d/*.repo; do
        # 排除 redhat.repo（由 subscription-manager 管理）
        [[ "$repo" == "/etc/yum.repos.d/redhat.repo" ]] && continue

        # 檢查 gpgcheck=1
        if ! grep -qE '^\s*gpgcheck\s*=\s*1' "$repo"; then
            echo "Repo gpgcheck!=1 ($repo)" >> "$LOGFILE"
        fi

        # 檢查 localpkg_gpgcheck=1
        if ! grep -qE '^\s*localpkg_gpgcheck\s*=\s*1' "$repo"; then
            echo "Repo localpkg_gpgcheck!=1 ($repo)" >> "$LOGFILE"
        fi
    done
}

### --- 執行檢查 --- ###
CHECK_MAIN_FILE "/etc/yum.conf" "yum.conf"
CHECK_MAIN_FILE "/etc/dnf/dnf.conf" "dnf.conf"
CHECK_REPO_FILES

### --- 結果輸出 --- ###
if [ -s "$LOGFILE" ]; then
    COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0032 Found $COUNT GPG check issues. (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0032 All gpgcheck settings comply."
fi




### TWGCB-01-012-0033 ####
	if rpm -q sudo &>/dev/null; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0033 sudo package is installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0033 sudo package is not installed"
	fi	
	

### TWGCB-01-012-0034 ####
grep -E '^[^#]*Defaults\s+use_pty' /etc/sudoers /etc/sudoers.d/* 2>/dev/null | grep -q "use_pty"
if [ $? -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0034 Defaults use_pty is set"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0034 Defaults use_pty missing"
fi
	
### TWGCB-01-012-0035 ####
grep -E '^[^#]*Defaults\s+logfile\s*=\s*"?/var/log/sudo\.log"?' /etc/sudoers /etc/sudoers.d/* 2>/dev/null | grep -q "/var/log/sudo.log"
if [ $? -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0035 Defaults logfile=\"/var/log/sudo.log\" is set"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0035 Defaults logfile=\"/var/log/sudo.log\" missing"
fi


### TWGCB-01-012-0036 ####
if rpm -q aide &>/dev/null; then
    if [ -f /var/lib/aide/aide.db.gz ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0036 AIDE installed and initialized"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0036 AIDE installed but not initialized"
    fi
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0036 AIDE not installed"
fi

# TWGCB-01-012-0037：設定 AIDE 定期檢查排程,定義要檢查的關鍵字與排程指令 (每天凌晨 05:00 執行)
CRON_KEYWORD="/usr/sbin/aide --check"

# 1. 檢查目前排程中是否已存在該指令
# 使用 2>/dev/null 隱藏 "no crontab for root" 訊息
if crontab -l 2>/dev/null | grep -q "$CRON_KEYWORD"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0037 AIDE schedule check already exists."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0037 AIDE schedule not exists.(0 5 * * * /usr/sbin/aide --check)"
fi
 




	
cramfs01=$(crontab -l | awk '{print $1 $2 $3 $4 $5 $6 $7}' | grep -q '[0-9].*'***/usr/sbin/aide--check && echo 0 || echo 1)
    if [ "$cramfs01" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0037 Check 05***/usr/sbin/aide--check ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0037 no 05***/usr/sbin/aide--check"
    fi

### TWGCB-01-012-0038：GRUB 設定檔權限與擁有者 ####
CONF="/etc/fstab"
if [ -d /sys/firmware/efi ]; then
    # --- UEFI 系統 ---
    EFI_OPTS=$(grep -E '^[^#].*[[:space:]]/boot/efi[[:space:]]' "$CONF" | awk '{print $4}')
    if echo "$EFI_OPTS" | grep -q "uid=0" && echo "$EFI_OPTS" | grep -q "gid=0"; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0038 UEFI /boot/efi uid=0,gid=0 set"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0038 UEFI /boot/efi uid=0,gid=0 missing (Fix: Edit $CONF)"
    fi
else
    # --- BIOS 系統 ---
    files=("/boot/grub2/grub.cfg" "/boot/grub2/grubenv" "/boot/grub2/user.cfg")
    KO_FILES=""
    
    for f in "${files[@]}"; do
        if [ -f "$f" ]; then
            owner=$(stat -c %U:%G "$f")
            if [ "$owner" != "root:root" ]; then
                KO_FILES+="$f "
            fi
        fi
    done
    
    if [ -z "$KO_FILES" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0038 BIOS GRUB files owner:group = root:root"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0038 Incorrect owner on: $KO_FILES (chown root:root $KO_FILES)"
    fi
fi
	
### TWGCB-01-012-0039：GRUB 設定檔權限檢查 ####
CONF="/etc/fstab"
if [ -d /sys/firmware/efi ]; then
    # --- UEFI 系統 ---
    EFI_OPTS=$(grep -E '^[^#].*[[:space:]]/boot/efi[[:space:]]' "$CONF" | awk '{print $4}')
    if echo "$EFI_OPTS" | grep -q "fmask=0177"; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0039 UEFI /boot/efi fmask=0177 set"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0039 UEFI /boot/efi fmask=0177 missing"
    fi
else
    # --- BIOS 系統 ---
    files=("/boot/grub2/grub.cfg" "/boot/grub2/grubenv" "/boot/grub2/user.cfg")
    KO_PERM=""

    for f in "${files[@]}"; do
        if [ -f "$f" ]; then
            # 取得後三位權限數字
            perm=$(stat -c "%a" "$f" | sed 's/.*\(...\)/\1/')
            group_other=$(echo "$perm" | cut -c 2-3)
            if [ "$group_other" != "00" ]; then
                KO_PERM+="$f($perm) "
            fi
        fi
    done

    if [ -z "$KO_PERM" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0039 BIOS GRUB files permission is secure (<= 600)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0039 BIOS GRUB files insecure: $KO_PERM (chmod 600 $KO_PERM)"
    fi
fi


# TWGCB-01-012-0040 檢查 GRUB 密碼保護
#https://bhanuwriter.com/how-to-set-grub2-password/
    if [ -f "/boot/grub2/user.cfg" ] || [ -f "/boot/efi/EFI/redhat/user.cfg" ] ; then
          echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0040 GRUB password protection configuration file found." ; 
    else    
          echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0040 no grub2-setpassword(grub2-setpassword)"; 
    fi



SSHTEST01=$(grep -i '^[[:space:]]*ExecStart[[:space:]]*=' /usr/lib/systemd/system/rescue.service | awk -F= '{gsub(/[    ]/, "", $2); print $2}')
SSHTEST02=$(grep -i '^[[:space:]]*ExecStart[[:space:]]*=' /usr/lib/systemd/system/emergency.service | awk -F= '{gsub(/[    ]/, "", $2); print $2}')
    if [ "$SSHTEST01" == "-/usr/lib/systemd/systemd-sulogin-shellrescue" ] && [ "$SSHTEST02" == "-/usr/lib/systemd/systemd-sulogin-shellemergency" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0041 check ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0041 error"
    fi
	
# TWGCB-01-012-0042：檢查核心傾印功能是否停用
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0042.log"
FIX_LOG=""

# 1. 檢查 limits.conf (預期硬限制為 0)
grep -REq '^\s*\*\s+hard\s+core\s+0' /etc/security/limits.conf /etc/security/limits.d/ || \
    FIX_LOG+=" (Add '* hard core 0' to /etc/security/limits.conf)"

# 2. 檢查 sysctl 參數 (fs.suid_dumpable=0, kernel.core_pattern=|/bin/false)
[[ "$(sysctl -n fs.suid_dumpable 2>/dev/null)" != "0" ]] && FIX_LOG+=" (sysctl -w fs.suid_dumpable=0)"
[[ "$(sysctl -n kernel.core_pattern 2>/dev/null)" != "|/bin/false" ]] && FIX_LOG+=" (sysctl -w kernel.core_pattern=|/bin/false)"

# 3. 檢查 coredump.conf (Storage=none, ProcessSizeMax=0)
if [ -f /etc/systemd/coredump.conf ]; then
    grep -iq '^\s*Storage=none' /etc/systemd/coredump.conf || FIX_LOG+=" (Set Storage=none in coredump.conf)"
    grep -iq '^\s*ProcessSizeMax=0' /etc/systemd/coredump.conf || FIX_LOG+=" (Set ProcessSizeMax=0 in coredump.conf)"
fi

# 4. 檢查服務遮蔽狀態
[[ "$(systemctl is-enabled systemd-coredump.socket 2>/dev/null)" != "masked" ]] && \
    FIX_LOG+=" (systemctl mask systemd-coredump.socket)"

# --- 輸出結果 ---
if [ -z "$FIX_LOG" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0042 Core dump is disabled."
else
	echo "Core dump configuration issues found:" > "$LOGFILE"
    echo "$FIX_LOG" >> "$LOGFILE"
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0042 Core dump not fully disabled.$FIX_LOG(see $LOGFILE)"
fi
	
# TWGCB-01-012-0043 檢查記憶體位址空間配置隨機載入 (ASLR)，kernel.randomize_va_space 必須設為 2。
# GCB 設定值要求為 2
REQUIRED_VALUE="2" 
# 修復指令：建議檢查 sysctl.conf/sysctl.d 檔案，並執行 sysctl -w 立即生效
FIX_COMMAND="請檢查 /etc/sysctl.conf 或 /etc/sysctl.d/ 檔案，設定 kernel.randomize_va_space = 2，並執行 #sysctl -w kernel.randomize_va_space=2 使其生效" 

# --- 核心檢查邏輯：檢查核心運行時的實際數值 ---
CURRENT_VALUE=$(sysctl -n kernel.randomize_va_space 2>/dev/null)

if [ "$CURRENT_VALUE" == "$REQUIRED_VALUE" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0043 kernel.randomize_va_space is set to $REQUIRED_VALUE."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0043 ASLR setting error: current value is '$CURRENT_VALUE' (Expected: $REQUIRED_VALUE).($FIX_COMMAND)"
fi
		
# TWGCB-01-012-0044 檢查全系統加密原則
# 使用 --show 獲取當前作用中的策略名稱
ACTIVE_POLICY=$(update-crypto-policies --show 2>/dev/null)
if [[ "$ACTIVE_POLICY" == "FUTURE" || "$ACTIVE_POLICY" == "FIPS" ]]; then
    # 如果策略是 FUTURE 或 FIPS
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0044 Crypto policy is set to: $ACTIVE_POLICY"
else
	echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0044 Crypto policy is set to: $ACTIVE_POLICY, NOT FUTURE/FIPS(update-crypto-policies --set FUTURE && update-crypto-policies)"
fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/passwd)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0045 /etc/passwd Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0045 /etc/passwd should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/passwd)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0046 /etc/passwd Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0046 /etc/passwd should be set to 644 或 以下'"
    fi

SSHTEST=$(stat -c '%U':'%G' /etc/shadow)
SHADOW=$(stat -c '%U':'%G' /etc/shadow)
    if [ "$SSHTEST" == "root:root" -o "$SHADOW" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0047 /etc/shadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0047 /etc/shadow should be set to root:root or root:shadow'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/shadow)
    if [ $SSHTEST == "0" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0048 /etc/shadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0048 /etc/shadow should be set to 000'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/group)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0049 /etc/group Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0049 /etc/group should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/group)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0050 /etc/group Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0050 /etc/group should be set to 644 或 以下'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/gshadow)
SHADOW=$(stat -c '%U':'%G' /etc/gshadow)
    if [ "$SSHTEST" == "root:root" -o "$SHADOW" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0051 /etc/gshadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0051 /etc/gshadow should be set to root:root or root:shadow'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/gshadow)
    if [ $SSHTEST == "0" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0052 /etc/gshadow Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0052 /etc/gshadow should be set to 000'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/passwd-)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0053 /etc/passwd- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0053 /etc/passwd- should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/passwd-)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0054 /etc/passwd- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0054 /etc/passwd- should be set to 644 或 以下'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/shadow-)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0055 /etc/shadow- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0055 /etc/shadow- should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/shadow-)
    if [ $SSHTEST == "0" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0056 /etc/shadow- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0056 /etc/shadow- should be set to 000'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/group-)
    if [ "$SSHTEST" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0057 /etc/group- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0057 /etc/group- should be set to root:root'"
    fi
	
SSHTEST=$(stat -c '%a' /etc/group-)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0058 /etc/group- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0058 /etc/group- should be set to 644 或 以下'"
    fi
	
SSHTEST=$(stat -c '%U':'%G' /etc/gshadow-)
SHADOW=$(stat -c '%U':'%G' /etc/gshadow-)
    if [ "$SSHTEST" == "root:root" -o "$SHADOW" == "root:root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0059 /etc/gshadow- Check is "$SSHTEST
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0059 /etc/gshadow- should be set to root:root or root:shadow'"
    fi
	
cramfs01=$(stat -c %a /etc/gshadow-)
    if [ $cramfs01 -le "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0060 Check /etc/gshadow- is 0 ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0060 no 0"
    fi
	
# TWGCB-01-012-0061 檢查其他使用者寫入全域檔案（World-writable files）
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0061.log"

# 遍歷所有本地掛載點，查找世界可寫入的常規文件，並寫入 LOGFILE
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    find "$FS_MOUNT" -xdev -type f -perm -0002 2>/dev/null >> "$LOGFILE"
done

if [ -s "$LOGFILE" ]; then
	FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0061 Found $FILE_COUNT file(s) with world-writable permission (o+w).(see $LOGFILE)(xargs < "$LOGFILE" -L 1 chmod o-w)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0061 No world-writable regular files found."
fi

	
# TWGCB-01-012-0062 檢查所有檔案與目錄的合法擁有者，所有檔案與目錄的擁有者 (UID) 必須在 /etc/passwd 中有對應的帳號。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0062.log"
FIX_COMMAND="請檢查 $LOGFILE 檔案列表，手動執行 chown 或 rm" 

# 遍歷所有本地掛載點，查找沒有合法擁有者的檔案或目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    # -nouser: 查找擁有者 (UID) 不在 /etc/passwd 中的檔案/目錄
    find "$FS_MOUNT" -xdev -nouser 2>/dev/null >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
	FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0062 Found $FILE_COUNT items with unknown owner UID.(see $LOGFILE)($FIX_COMMAND)"
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0062 All files/directories are owned by valid users."  
fi

# TWGCB-01-012-0063 檢查所有檔案與目錄的合法擁有群組，所有檔案與目錄的擁有群組 (GID) 必須在 /etc/group 中有對應的群組。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0063.log"
FIX_COMMAND="請檢查 $LOGFILE 檔案列表，手動執行 chgrp 或 rm" 

# 遍歷所有本地掛載點，查找沒有合法擁有群組的檔案或目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    # -nogroup: 查找擁有群組 (GID) 不在 /etc/group 中的檔案/目錄
    find "$FS_MOUNT" -xdev -nogroup 2>/dev/null >> "$LOGFILE"
done

# 檢查是否有找到違規項目
if [ -s "$LOGFILE" ]; then
    RESULT="KO"
fi

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0063 Found $FILE_COUNT items with unknown group GID.(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0063 All files/directories are owned by valid groups."
fi

# TWGCB-01-012-0064 檢查世界可寫入目錄的擁有者，World-writable 目录的擁有者必須是系統帳號 (UID <= 999)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0064.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chown root" 

# 遍歷所有本地掛載點，查找不符合要求的目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    find "$FS_MOUNT" -xdev -type d -perm -0002 -uid +999 2>/dev/null >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0064 Found $FILE_COUNT directories with non-system owner (UID > 999).(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0064 All world-writable directories are owned by system accounts."
fi

# TWGCB-01-012-0065 檢查世界可寫入目錄的擁有群組，World-writable 目录的擁有群組必須是系統群組 (GID <= 999)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0065.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chgrp root" 

# 遍歷所有本地掛載點，查找不符合要求的目錄
df --local -P | awk 'NR>1 {print $6}' | while read -r FS_MOUNT; do
    # -type d: 查找目錄
    # -perm -0002: 權限包含 o+w (World-writable)
    # -gid +999: 且擁有群組是非系統群組 (GID >= 1000)
    find "$FS_MOUNT" -xdev -type d -perm -0002 -gid +999 2>/dev/null >> "$LOGFILE"
done

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0065 Found $FILE_COUNT directories with non-system group owner (GID > 999).(see $LOGFILE)($FIX_COMMAND)"
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0065 All world-writable directories are owned by system groups."
fi
	
# TWGCB-01-012-0066 檢查系統命令檔案權限，權限不得高於 755 (即排除 o+w, g+w) 
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0066.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chmod 755" 
SYSTEM_CMD_DIRS="/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin"

# 查找所有權限包含 /0022 (g+w 或 o+w) 的檔案，並寫入 LOGFILE
find -L $SYSTEM_CMD_DIRS -type f -perm /0022 2>/dev/null >> "$LOGFILE"
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0066 Found $FILE_COUNT command file(s) with permission > 755.(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0066 All system command files are set to 755 or less."
fi


# TWGCB-01-012-0067 檢查系統命令檔案擁有者
# 基準要求：擁有者必須是 root。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0067.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chown root" 
SYSTEM_CMD_DIRS="/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin"

# 查找所有擁有者不是 root 的檔案
# -L 遵循符號連結
find -L $SYSTEM_CMD_DIRS -type f ! -user root 2>/dev/null >> "$LOGFILE"
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0067 Found $FILE_COUNT command file(s) not owned by root.(see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0067 All system command files are owned by root."
fi
	
# TWGCB-01-012-0068：系統指令檔案群組應為 root / tty / slocate / lock(apache自行決定)
BAD_FILES=$(find -L /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin ! -group root ! -group tty ! -group slocate ! -group lock -print)

if [ -z "$BAD_FILES" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0068 all system command files have correct group ownership"
else
    BAD_LIST=$(echo $BAD_FILES)
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0068 wrong group detected: $BAD_LIST (chgrp root)"
fi
	
# TWGCB-01-012-0069 找出權限高於 755 的程式庫檔案 (group/other 有 write 權限)
BAD_FILES=$(find -L /lib /lib64 /usr/lib /usr/lib64 -perm /0022 -type f 2>/dev/null)
	if [ -z "$BAD_FILES" ]; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0069 all library file permissions are 755 or more restrictive"
	else
		BAD_LIST=$(echo $BAD_FILES)
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0069 wrong permission detected: $BAD_LIST (請執行 chmod 755 <file>)"
	fi
	
# TWGCB-01-012-0070 找出擁有者不是 root 的程式庫檔案
BAD_FILES=$(find -L /lib /lib64 /usr/lib /usr/lib64 ! -user root 2>/dev/null)
	if [ -z "$BAD_FILES" ]; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0070 all library files owner is root"
	else
		BAD_LIST=$(echo $BAD_FILES)
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0070 wrong owner detected: $BAD_LIST (請執行 chown root <file>)"
	fi
	
# TWGCB-01-012-0071 檢查程式庫檔案擁有群組，程式庫檔案擁有群組必須是 root。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0071.log"
# 檢查的核心程式庫目錄
LIB_DIRS="/lib /lib64 /usr/lib /usr/lib64"
# 修復指令：建議使用 chgrp 設定為 root 群組
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 chgrp root" 

# --- 核心檢查邏輯：查找擁有群組非 root 的程式庫檔案 ---
# 1. find -L [目錄列表] : 查找程式庫目錄
# 2. ! -group root : 排除擁有群組為 root 的檔案
# 3. -type f : 只針對一般檔案 (程式庫檔案)
find -L $LIB_DIRS ! -group root -type f 2>/dev/null >> "$LOGFILE"

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")  
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0071 Found $FILE_COUNT library file(s) with non-root group ownership. (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0071 All library files are owned by the root group."
fi
	
# TWGCB-01-012-0072 檢查帳號是否使用空白通行碼
NO_PASSWORD_ACCOUNTS=$(awk -F: '($2 == "" ) { print $1 }' /etc/shadow)
ACCOUNT_COUNT=$(echo "$NO_PASSWORD_ACCOUNTS" | wc -l)
if [ -z "$NO_PASSWORD_ACCOUNTS" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0072 All accounts have a password set or are locked."
else
    FIX_COMMAND="請對列出的帳號執行 #passwd <帳號名稱> 或 #passwd -l <帳號名稱>"
	NO_PASSWORD_ACCOUNTS_LIST=$(echo $NO_PASSWORD_ACCOUNTS)
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0072 Found empty password accounts:($NO_PASSWORD_ACCOUNTS_LIST) (#passwd <帳號名稱> 或 #passwd -l <帳號名稱>)"
fi
	
SSHTEST01=$(echo $PATH | tr ':' ' ' | awk '/^\.$|^\.\.$|^[^\/]/ && length($0) > 0 {print; exit}')
    if [ -z "$SSHTEST01" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0073 pass "
		
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0073 should be set to /etc/profile"
    fi
	
# TWGCB-01-012-0074 檢查 root 帳號的 PATH 變數安全性
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0074.log"
IFS=':' read -r -a PATH_DIRS <<< "$PATH"
for dir in "${PATH_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        continue
    fi
    perms=$(stat -c "%A" "$dir")
    grp_write=${perms:5:1}
    oth_write=${perms:8:1}

    if [[ "$grp_write" == "w" || "$oth_write" == "w" ]]; then
        echo "$dir ($perms)" >> "$LOGFILE"
    fi
done


if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")  
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0074 Found $FILE_COUNT unsafe PATH directories.(see $LOGFILE)(chmod g-w/o-w <dir>)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0074 Root PATH does not contain unsafe directories."
    rm -f "$LOGFILE" 2>/dev/null
fi
	
SSHTEST=$(grep -m 1 '^\+:' /etc/passwd)
    if [ -z "$SSHTEST" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0075 grep -m 1 '^\+:' /etc/passwd is ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0075 grep -m 1 '^\+:' /etc/passwd del + "$SSHTEST
    fi
	
SSHTEST=$(grep -m 1 '^\+:' /etc/shadow)
    if [ -z "$SSHTEST" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0076 grep -m 1 '^\+:' /etc/shadow is ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0076 grep -m 1 '^\+:' /etc/shadow del + "$SSHTEST
    fi
	
SSHTEST=$(grep -m 1 '^\+:' /etc/group)
    if [ -z "$SSHTEST" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0077 grep -m 1 '^\+:' /etc/group is ok"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0077 grep -m 1 '^\+:' /etc/group del + "$SSHTEST
    fi
	
SSHTEST=$(awk -F: '($3 == 0) { print $1 }' /etc/passwd)
    if [ "$SSHTEST" == "root" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0078 Check ok"
    else
	    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0078 error"
    fi

	
######TWGCB-01-012-0079######
# 排除系統帳號
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0079.log"
result=0
grep -E -v '^(halt|sync|shutdown)' /etc/passwd \
    | awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' \
    | while IFS=" " read -r user dir; do

    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue

    if [ -d "$dir" ]; then
        perm=$(stat -c "%A" "$dir")
        if [[ ${perm:4:1} == "w" || ${perm:7:3} != "---" ]]; then
            echo "User $user home ($dir) has insecure permission: $perm" >> "$LOGFILE"
            result=1
        fi
    fi
done

if [ "$result" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0079 home directory permissions are secure"
    rm -f "$LOGFILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0079 insecure home directory permissions found (see $LOGFILE)"
fi


###### TWGCB-01-012-0080 ######
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0080.log"
result=0
# 排除系統帳號
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"

while IFS=":" read -r user _ _ _ _ dir shell; do
	# 只檢查 /home 目錄 排除系統帳號
    [[ "$dir" != /home/* ]] && continue
    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue
    if [ ! -d "$dir" ]; then
        echo "The home directory ($dir) of user $user does not exist." >> "$LOGFILE"
        result=1
    else
        owner=$(stat -L -c "%U" "$dir")
        if [ "$owner" != "$user" ]; then
            echo "The home directory ($dir) of user $user is owned by $owner." >> "$LOGFILE"
            result=1
        fi
    fi
done < /etc/passwd
if [ "$result" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0080 all home directories owned by correct user"
    rm -f "$LOGFILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0080 home directory ownership issues found (see $LOGFILE)"
fi


###### TWGCB-01-012-0081 ######
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0081.log"
result=0
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"
while IFS=":" read -r user _ gid _ _ dir shell; do
	# 只檢查 /home 目錄 排除系統帳號
    [[ "$dir" != /home/* ]] && continue
    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue

    if [ -d "$dir" ]; then
        group_owner=$(stat -L -c "%G" "$dir")           # 實際群組名稱
        expected_gid_name=$(getent group "$gid" | cut -d: -f1)   # 預期群組名稱
        if [ "$group_owner" != "$expected_gid_name" ]; then
            echo "The home directory ($dir) of user $user should be group $expected_gid_name but is $group_owner.(chgrp $user $dir)" >> "$LOGFILE"
            result=1
        fi
    else
        echo "The home directory ($dir) of user $user does not exist." >> "$LOGFILE"
        result=1
    fi
done < /etc/passwd
if [ "$result" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0081 all home directories have correct group ownership"
    rm -f "$LOGFILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0081 home directory group ownership issues found (see $LOGFILE)"
fi

# TWGCB-01-012-0082 檢查使用者家目錄內 dotfiles (.xxx) 是否具有 group/other 可寫入權限
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0082.log"

# 只檢查 root + UID >= 1000 的一般使用者（排除系統帳號）
awk -F: '($3 == 0 || $3 >= 1000) { print $1 " " $6 }' /etc/passwd \
| while read -r USER HOMEDIR; do
    
    # 家目錄不存在 → 不檢查，也不列為異常
    [ ! -d "$HOMEDIR" ] && continue

    # dotfiles
    for FILE in "$HOMEDIR"/.[A-Za-z0-9]*; do
        [ ! -e "$FILE" ] && continue
        [ -h "$FILE" ] && continue
        [ ! -f "$FILE" ] && continue

        PERM=$(stat -c "%A" "$FILE")

        if [ "${PERM:5:1}" != "-" ]; then
            echo "Group-writable: $FILE ($PERM)" >> "$LOGFILE"
        fi
        if [ "${PERM:8:1}" != "-" ]; then
            echo "Other-writable: $FILE ($PERM)" >> "$LOGFILE"
        fi
    done
done

# 判斷
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0082 Found $FILE_COUNT insecure dotfile(s) under user home directories. (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0082 No insecure dotfile permissions detected."
fi

# TWGCB-01-012-0083 Check for .forward files in user home directories
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0083.log"

# 只檢查 root 以及 UID >= 1000 的一般使用者（排除系統帳號）
awk -F: '($3 == 0 || $3 >= 1000) { print $1 " " $6 }' /etc/passwd \
| while read -r USER HOMEDIR; do

    # 跳過不存在的家目錄（例如 nfsnobody、某些 service user）
    [ ! -d "$HOMEDIR" ] && continue

    FILE="$HOMEDIR/.forward"

    # 若 .forward 存在且不是 symlink 就記錄
    if [ -f "$FILE" ] && [ ! -h "$FILE" ]; then
        echo "$FILE exists" >> "$LOGFILE"
    fi
done

# 判斷
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0083 Found $FILE_COUNT .forward file(s). (see $LOGFILE) (rm <file>)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0083 No .forward files detected."
fi

# TWGCB-01-012-0084 檢查使用者家目錄之「.netrc」檔案
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0084.log"
FIX_COMMAND="xargs < \"$LOGFILE\" -L 1 rm" 

# --- 核心檢查邏輯：查找 .netrc 檔案 ---
# 只檢查 root + UID >= 1000 的一般使用者（排除系統帳號和非互動式帳號）
grep -E -v '^(root|halt|sync|shutdown)' /etc/passwd | \
awk -F: '($7 != "/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | \
while read -r USER HOMEDIR; do
    
    # 家目錄不存在 → 跳過
    [ ! -d "$HOMEDIR" ] && continue

    NETRC_FILE="$HOMEDIR/.netrc"
    
    # 檢查 .netrc 檔案是否存在且不是符號連結 (GBC 檢查方法)
    # 這是因為 .netrc 檔案包含帳號和明文通行碼 
    if [ ! -h "$NETRC_FILE" ] && [ -f "$NETRC_FILE" ]; then
        echo "$NETRC_FILE" >> "$LOGFILE"
    fi
done

# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0084 Found $FILE_COUNT .netrc file(s). (see $LOGFILE)($FIX_COMMAND)" 
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0084 No .netrc files found in user home directories."
fi

###### TWGCB-01-012-0085 ######
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0085.log"
# 排除系統帳號
SYS_USERS="root|nobody|halt|sync|shutdown|libstoragemgmt|sshd|dnsmasq|daemon|bin|adm|lp|mail|games|ftp|tss|systemd-coredump|dbus|polkitd|rtkit|sssd|flatpak|cockpit-ws|gnome-initial-setup|operator|tcpdump"
while IFS=":" read -r user _ _ _ _ dir shell; do
    [[ "$dir" != /home/* ]] && continue
    [[ "$user" =~ ^($SYS_USERS)$ ]] && continue
    if [ -d "$dir" ]; then
        if [ -f "$dir/.rhosts" ] && [ ! -h "$dir/.rhosts" ]; then
            echo ".rhosts file exists: $dir/.rhosts" >> "$LOGFILE"
        fi
    else
        echo "The home directory ($dir) of user $user does not exist." >> "$LOGFILE"
    fi
done < /etc/passwd

if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0085 .rhosts files exist (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0085 no .rhosts files found"
fi

# TWGCB-01-012-0086 檢查 /etc/passwd 檔案設定之群組是否皆存在於 /etc/group
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0086.log"
FIX_COMMAND="請手動檢查 $LOGFILE 帳號，並使用 usermod -g/groupmod 調整 GID"
# --- 核心檢查邏輯：查找孤兒 GID ---
# 1. 取得 /etc/passwd 中所有唯一的 GID (第 4 欄)
# 2. 遍歷每個 GID (變數 $i)
# 3. 在 /etc/group 中查找該 GID (grep -q -P "^.*?:[^:]*:$i:")
for GID_ID in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
    # 檢查 /etc/group 中是否存在該 GID
    if ! grep -q -P "^.*?:[^:]*:$GID_ID:" /etc/group; then
        
        # 找到違規的 GID，尋找哪些使用者使用了這個 GID
        ORPHAN_USERS=$(awk -F: -v target_gid="$GID_ID" '($4 == target_gid) { print $1 }' /etc/passwd | xargs)
        
        echo "Orphan GID $GID_ID is referenced by users: $ORPHAN_USERS (Primary Group Missing)" >> "$LOGFILE"
    fi
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0086 Found $FILE_COUNT orphaned GID references. (see $LOGFILE)($FIX_COMMAND)"    
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0086 All primary GIDs in /etc/passwd exist in /etc/group."
fi


# TWGCB-01-012-0087 檢查所有使用者帳號是否具備唯一 UID
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0087.log"
# 修復指令：建議使用 usermod 調整 UID
FIX_COMMAND="請手動檢查 $LOGFILE 帳號，並使用 #usermod -u <新UID> <帳號名稱> 調整 UID" 

# --- 核心檢查邏輯：查找重複的 UID ---
# GCB 文件中的腳本邏輯如下：
# 1. cut -f3 -d":" /etc/passwd : 提取所有 UID (第 3 欄)
# 2. sort -n : 數字排序
# 3. uniq -c : 統計每個 UID 出現的次數
# 4. while read x ... if [ $1 -gt 1 ] : 找出重複次數 > 1 的 UID
# 5. awk -F: ... : 找出使用該重複 UID 的所有帳號
cut -f3 -d":" /etc/passwd | sort -n | uniq -c | while read x ; do    
    # 腳本中用於處理空行和格式的邊界條件
    [ -z "$x" ] && continue    
    # $1 是計數，$2 是重複的 UID
    set - $x
    COUNT=$1
    DUPLICATE_UID=$2   
    if [ "$COUNT" -gt 1 ]; then
        # 找到重複的 UID，列出所有使用該 UID 的帳號
        ORPHAN_USERS=$(awk -F: -v target_uid="$DUPLICATE_UID" '($3 == target_uid) { print $1 }' /etc/passwd | xargs)        
        echo "Duplicate UID $DUPLICATE_UID found, shared by: $ORPHAN_USERS" >> "$LOGFILE"
    fi
done

if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")  
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0087 Found $FILE_COUNT unique UIDs shared by multiple accounts. (see $LOGFILE)($FIX_COMMAND)"    
else
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0087 All user accounts have unique UIDs."
fi

# TWGCB-01-012-0088 檢查所有群組是否具備唯一 GID
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0088.log"
# 修復指令：建議使用 groupmod 調整 GID
FIX_COMMAND="請手動檢查 $LOGFILE 群組，並使用 #groupmod -g <新GID> <群組名稱> 調整 GID" 

# --- 核心檢查邏輯：查找重複的 GID ---
# 1. cut -d: -f3 /etc/group : 提取所有 GID (第 3 欄)
# 2. sort : 排序
# 3. uniq -d : 僅顯示重複的行 (即重複的 GID)
# 4. while read GID : 對每個重複的 GID 進行處理
cut -d: -f3 /etc/group | sort | uniq -d | while read -r DUPLICATE_GID; do
    # 找到重複的 GID，尋找哪些群組使用了這個 GID
    # 在 /etc/group 中查找該 GID 的群組名稱
    DUPLICATE_GROUPS=$(awk -F: -v target_gid="$DUPLICATE_GID" '($3 == target_gid) { print $1 }' /etc/group | xargs)   
    echo "Duplicate GID $DUPLICATE_GID found, shared by groups: $DUPLICATE_GROUPS" >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE") 
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0088 Found $FILE_COUNT unique GIDs shared by multiple groups. (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0088 All groups have unique GIDs."
fi

# TWGCB-01-012-0089 檢查所有使用者帳號名稱是否唯一，確保 /etc/passwd 檔案中的所有使用者帳號名稱皆不重複。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0089.log"
# 修復指令：建議手動編輯 /etc/passwd 檔案或移除重複帳號
FIX_COMMAND="請手動檢查 $LOGFILE 帳號，並編輯 /etc/passwd 檔案或移除重複帳號" 

# --- 核心檢查邏輯：查找重複的帳號名稱 ---
# 1. cut -d: -f1 /etc/passwd : 提取所有帳號名稱 (第 1 欄)
# 2. sort : 排序
# 3. uniq -d : 僅顯示重複的帳號名稱
# 4. while read x : 對每個重複的帳號名稱進行處理
cut -d: -f1 /etc/passwd | sort | uniq -d | while read -r DUPLICATE_NAME; do
    # 將重複的帳號名稱寫入日誌
    echo "Duplicate login name found: $DUPLICATE_NAME" >> "$LOGFILE"
done
# --- 輸出結果：使用 -s 判斷 ---
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0089 Found $FILE_COUNT duplicate login name(s). (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0089 All user accounts have unique login names."
fi

# TWGCB-01-012-0090 檢查所有群組名稱是否唯一， 確保 /etc/group 檔案中的所有群組名稱皆不重複。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0090.log"
# 修復指令：建議手動編輯 /etc/group 檔案或移除重複群組
FIX_COMMAND="請手動檢查 $LOGFILE 群組，並編輯 /etc/group 檔案或移除重複群組" 

# --- 核心檢查邏輯：查找重複的群組名稱 ---
# 1. cut -d: -f1 /etc/group : 提取所有群組名稱 (第 1 欄)
# 2. sort : 排序
# 3. uniq -d : 僅顯示重複的群組名稱
# 4. while read x : 對每個重複的群組名稱進行處理
cut -d: -f1 /etc/group | sort | uniq -d | while read -r DUPLICATE_NAME; do
    echo "Duplicate group name found: $DUPLICATE_NAME" >> "$LOGFILE"
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0090 Found $FILE_COUNT duplicate group name(s). (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0090 All group names are unique."
fi

cramfs01=`awk -F: '($1=="shadow") {print $NF}' /etc/group && echo 0 || echo 1`
    if [ "$cramfs01" == "0" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0091 Check ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0091 /etc/group is users"
    fi
	
	if rpm -q xinetd &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0092 xinetd package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0092 xinetd package is not installed"
	fi
	
	if grep -E '^\s*(server|pool)\s+' /etc/chrony.conf &>/dev/null; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0093 chrony has NTP server configured"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0093 chrony has no NTP server configured"
	fi

	
# TWGCB-01-012-0094：檢查 rsyncd 服務是否已遮蔽 (Masked)
SERVICE_NAME="rsyncd"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"

# 檢查該服務是否已經被 mask
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0094 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0094 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0095 檢查 avahi-daemon 服務狀態 (應停用)，avahi-daemon.service 和 avahi-daemon.socket 應同時被 mask 以減少攻擊面。
# 修復指令：建議遮蔽服務和 socket
FIX_COMMAND="請執行指令 #systemctl --now mask avahi-daemon.service avahi-daemon.socket"
# 檢查服務是否被 mask
svc_status=$(systemctl is-enabled avahi-daemon.service 2>/dev/null)
sock_status=$(systemctl is-enabled avahi-daemon.socket 2>/dev/null)

if [[ "$svc_status" != "masked" || "$sock_status" != "masked" ]]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0095 avahi-daemon is NOT properly disabled/masked.($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0095 avahi-daemon is disabled/masked"
fi

	
# TWGCB-01-012-0096：檢查是否停用 SNMP 服務
SERVICE_NAME="snmpd"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0096 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0096 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0097：檢查是否停用 Squid 服務
SERVICE_NAME="squid"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0097 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0097 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0098：檢查是否停用 Samba 服務
SERVICE_NAME="smb"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0098 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0098 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0099：檢查是否停用 FTP 服務 (vsftpd)
SERVICE_NAME="vsftpd"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0099 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0099 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0100：檢查是否停用 NIS 伺服器服務
SERVICE_NAME="ypserv"
FIX_COMMAND="systemctl --now mask $SERVICE_NAME"
if [ "$(systemctl is-enabled $SERVICE_NAME 2>/dev/null)" == "masked" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0100 $SERVICE_NAME is masked."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0100 $SERVICE_NAME is not masked. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0101：檢查是否啟用 kdump 服務 
# 說明：kdump 用於系統當機時傾印記憶體資訊，以供後續除錯修復。
SERVICE_NAME="kdump.service"
FIX_COMMAND="systemctl --now enable $SERVICE_NAME"
if systemctl is-enabled $SERVICE_NAME &>/dev/null && systemctl is-active $SERVICE_NAME &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0101 $SERVICE_NAME is active."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0101 $SERVICE_NAME service issue. ($FIX_COMMAND)"
fi
	
	
	if rpm -q ypbind &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0102 ypbind package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0102 ypbind package is not installed"
	fi

	if rpm -q telnet &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0103 telnet package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0103 telnet package is not installed"
	fi	

	if rpm -q telnet-server &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0104 telnet-server package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0104 telnet-server package is not installed"
	fi	

	if rpm -q rsh-server &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0105 rsh-server package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0105 rsh-server package is not installed"
	fi	

	if rpm -q tftp-server &>/dev/null; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0106 tftp-server package is installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0106 tftp-server package is not installed"
	fi

	
# 檢查 yum.conf
YUM_CHECK=$(grep -i '^clean_requirements_on_remove' /etc/yum.conf | awk -F= '{print $2}' | tr -d ' ')
# 檢查 dnf.conf
DNF_CHECK=$(grep -i '^clean_requirements_on_remove' /etc/dnf/dnf.conf | awk -F= '{print $2}' | tr -d ' ')

if [[ "$YUM_CHECK" == "True" || "$YUM_CHECK" == "true" ]] && [[ "$DNF_CHECK" == "True" || "$DNF_CHECK" == "true" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0107 clean_requirements_on_remove is enabled in yum/dnf"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0107 clean_requirements_on_remove is not enabled"
fi

	

# IPv4 與 IPv6 Forwarding 狀態
IPV4_FORWARD=$(sysctl -n net.ipv4.ip_forward)
IPV6_FORWARD=$(sysctl -n net.ipv6.conf.all.forwarding)

if [ "$IPV4_FORWARD" -eq 0 ] && [ "$IPV6_FORWARD" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0108 IP forwarding is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0108 IP forwarding is enabled"
fi

	
# 所有網路介面傳送ICMP重新導向封包
IPV4_redirects=$(sysctl -n net.ipv4.conf.all.send_redirects)
if [ "$IPV4_redirects" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0109 IP redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0109 IP redirects are enabled(sysctl -w net.ipv4.conf.all.send_redirects=0)"
fi


# 檢查 IPv4 default ICMP redirects 狀態
DEFAULT_redirects=$(sysctl -n net.ipv4.conf.default.send_redirects)
if [ "$DEFAULT_redirects" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0110 default IP redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0110 default IP redirects are enabled(sysctl -w net.ipv4.conf.default.send_redirects=0)"
fi


	
# 檢查 IPv4 與 IPv6 accept_source_route 狀態
IPV4_SR=$(sysctl -n net.ipv4.conf.all.accept_source_route)
IPV6_SR=$(sysctl -n net.ipv6.conf.all.accept_source_route)
if [ "$IPV4_SR" -eq 0 ] && [ "$IPV6_SR" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0111 IPv4 IPv6 source routing is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0111 IPv4 IPv6source routing is enabled"
fi


# 檢查 IPv4 與 IPv6 預設介面 accept_source_route 狀態
IPV4_SR=$(sysctl -n net.ipv4.conf.default.accept_source_route)
IPV6_SR=$(sysctl -n net.ipv6.conf.default.accept_source_route)
if [ "$IPV4_SR" -eq 0 ] && [ "$IPV6_SR" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0112 IPv4 IPv6 default interface source routing is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0112 IPv4 IPv6 default interface source routing is enabled"
fi


# 檢查 IPv4 與 IPv6 all interface accept_redirects 狀態
IPV4_RED=$(sysctl -n net.ipv4.conf.all.accept_redirects)
IPV6_RED=$(sysctl -n net.ipv6.conf.all.accept_redirects)
if [ "$IPV4_RED" -eq 0 ] && [ "$IPV6_RED" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0113 IPv4 IPv6 all interfaces ICMP redirects are blocked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0113 IPv4 IPv6 all interfaces ICMP redirects are enabled"
fi


#
#TWGCB-01-012-0114
IPV4_DEFAULT_ACCEPT=$(sysctl -n net.ipv4.conf.default.accept_redirects)
IPV6_DEFAULT_ACCEPT=$(sysctl -n net.ipv6.conf.default.accept_redirects)

if [ "$IPV4_DEFAULT_ACCEPT" -eq 0 ] && [ "$IPV6_DEFAULT_ACCEPT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0114 default interfaces accept redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0114 default interfaces accept redirects are enabled"
fi

#TWGCB-01-012-0115
SECURE_REDIRECTS=$(sysctl -n net.ipv4.conf.all.secure_redirects)

if [ "$SECURE_REDIRECTS" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0115 IPv4 all interfaces secure redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0115 IPv4 all interfaces secure redirects are enabled"
fi


#TWGCB-01-012-0116
IPV4_DEFAULT_SECURE=$(sysctl -n net.ipv4.conf.default.secure_redirects)

if [ "$IPV4_DEFAULT_SECURE" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0116 default interfaces secure redirects are disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0116 default interfaces secure redirects are enabled"
fi

#TWGCB-01-012-0117
LOG_MARTIANS=$(sysctl -n net.ipv4.conf.all.log_martians)

if [ "$LOG_MARTIANS" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0117 log martians is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0117 log martians is disabled"
fi

#TWGCB-01-012-0118
LOG_MARTIANS_DEFAULT=$(sysctl -n net.ipv4.conf.default.log_martians)

if [ "$LOG_MARTIANS_DEFAULT" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0118 default interface log martians is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0118 default interface log martians is disabled"
fi


#TWGCB-01-012-0119
ICMP_BROADCAST=$(sysctl -n net.ipv4.icmp_echo_ignore_broadcasts)

if [ "$ICMP_BROADCAST" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0119 ICMP echo broadcasts are ignored"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0119 ICMP echo broadcasts are NOT ignored"
fi


#TWGCB-01-012-0120
ICMP_BOGUS=$(sysctl -n net.ipv4.icmp_ignore_bogus_error_responses)

if [ "$ICMP_BOGUS" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0120 ICMP bogus error responses are ignored"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0120 ICMP bogus error responses are NOT ignored"
fi


#TWGCB-01-012-0121
RP_FILTER=$(sysctl -n net.ipv4.conf.all.rp_filter)

if [ "$RP_FILTER" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0121 Reverse path filtering (rp_filter) is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0121 Reverse path filtering (rp_filter) is NOT enabled"
fi


#TWGCB-01-012-0122
RP_FILTER_DEFAULT=$(sysctl -n net.ipv4.conf.default.rp_filter)
if [ "$RP_FILTER_DEFAULT" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0122 Default interface reverse path filtering (rp_filter) is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0122 Default interface reverse path filtering (rp_filter) is NOT enabled"
fi


#TWGCB-01-012-0123
TCP_SYNC=$(sysctl -n net.ipv4.tcp_syncookies)
if [ "$TCP_SYNC" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0123 TCP SYN cookies is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0123 TCP SYN cookies is NOT enabled"
fi


#TWGCB-01-012-0124
ACCEPT_RA=$(sysctl -n net.ipv6.conf.all.accept_ra)

if [ "$ACCEPT_RA" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0124 IPv6 router advertisement is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0124 IPv6 router advertisement is ENABLED"
fi



#TWGCB-01-012-0125
# 檢查 /etc/modprobe.d/ 下是否有 dccp.conf 或其他禁止 dccp 的設定
if grep -Eiq '^\s*(install\s+dccp\s+/bin/true|blacklist\s+dccp)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0126 dccp module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0126 dccp module is NOT disabled/blacklisted"
fi


###	TWGCB-01-012-0127 ####
# 檢查 /etc/modprobe.d/ 下是否有 sctp.conf 或其他禁止 sctp 的設定
if grep -Eiq '^\s*(install\s+sctp\s+/bin/true|blacklist\s+sctp)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0127 sctp module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0127 sctp module is NOT disabled/blacklisted"
fi


###	TWGCB-01-012-0128 ####
# 檢查 /etc/modprobe.d/ 下是否有 rds.conf 或其他禁止 rds 的設定
if grep -Eiq '^\s*(install\s+rds\s+/bin/true|blacklist\s+rds)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0128 rds module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0128 rds module is NOT disabled/blacklisted"
fi


###	TWGCB-01-012-0129 ####
# 檢查 /etc/modprobe.d/ 下是否有 tipc.conf 或其他禁止 tipc 的設定
if grep -Eiq '^\s*(install\s+tipc\s+/bin/true|blacklist\s+tipc)' /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0129 tipc module is disabled/blacklisted"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0129 tipc module is NOT disabled/blacklisted"
fi


###	TWGCB-01-012-0130 ####
# 檢查 nmcli 是否存在
if command -v nmcli >/dev/null 2>&1; then
    wifi_status=$(nmcli radio wifi)
    if [ "$wifi_status" == "disabled" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0130 wireless interfaces are disabled"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0130 wireless interfaces are still enabled(nmcli radio all off)"
    fi
	else
    echo -e " [\e[1;33mWARN\e[0m] nmcli not installed, cannot check wireless status"
	fi

	
# TWGCB-01-012-0131 檢查網路介面混雜模式是否已停用，網路介面不得處於混雜模式 (promiscuous mode)。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0131.log"
# 修復指令：建議使用 ip link set dev <介面名稱> promisc off 關閉
FIX_COMMAND="請針對日誌中的介面執行 #ip link set dev <介面名稱> multicast off promisc off" 

# --- 核心檢查邏輯：查找處於 promisc 狀態的介面 ---
# 使用 ip link 檢查所有網路介面狀態，並過濾包含 'promisc' 字樣的行
# 這些行通常顯示在介面的狀態資訊中
ip link | grep -i promisc 2>/dev/null | while read -r LINE; do
    
    # 提取介面名稱 (通常在每行的第二個欄位，格式通常是 <index>: <name>: )
    # 這裡假設介面名稱在第二個欄位且不包含冒號
    INTERFACE_NAME=$(echo "$LINE" | awk '{print $2}' | tr -d ':')
    
    # 將違規的介面名稱和其狀態寫入日誌
    if [ -n "$INTERFACE_NAME" ]; then
        echo "$INTERFACE_NAME is in promiscuous mode. Full status: $LINE" >> "$LOGFILE"
    fi
done
if [ -s "$LOGFILE" ]; then
    FILE_COUNT=$(wc -l < "$LOGFILE")
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0131 Found $FILE_COUNT network interface(s) in promiscuous mode. (see $LOGFILE)($FIX_COMMAND)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0131 No network interfaces detected in promiscuous mode."
fi

	
# TWGCB-01-012-0132 檢查 auditd 套件是否已安裝	
	if rpm -q audit >/dev/null 2>&1 && rpm -q audit-libs >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0132 auditd and audit-libs are installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0132 auditd and/or audit-libs not installed"
	fi
	
# TWGCB-01-012-0133：檢查 auditd 服務是否啟用且正在執行
SERVICE_NAME="auditd"
FIX_COMMAND="systemctl --now enable $SERVICE_NAME"
if systemctl is-enabled $SERVICE_NAME &>/dev/null && systemctl is-active $SERVICE_NAME &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0133 $SERVICE_NAME service is active."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0133 $SERVICE_NAME service issue. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0134：檢查 GRUB 是否設定 audit=1
	if grep -qE '^\s*GRUB_CMDLINE_LINUX=.*audit=1' /etc/default/grub; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0134 audit=1 is set in GRUB_CMDLINE_LINUX"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0134 audit=1 is not set in GRUB_CMDLINE_LINUX"
	fi
	
# TWGCB-01-012-0135：檢查 GRUB 是否設定 audit_backlog_limit >= 8192
CURRENT_BACKLOG=$(grep -oP 'audit_backlog_limit=\K[0-9]+' /etc/default/grub)
if [[ -n "$CURRENT_BACKLOG" ]] && [ "$CURRENT_BACKLOG" -ge 8192 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0135 audit_backlog_limit is $CURRENT_BACKLOG (>= 8192)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0135 audit_backlog_limit is missing or less than 8192."
fi
	
# TWGCB-01-012-0136：檢查 /etc/aliases 是否設定 postmaster 通知 root
	if grep -qE '^\s*postmaster:\s*root' /etc/aliases; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0136 postmaster alias is set to root"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0136 postmaster alias is not set to root"
	fi
	
# TWGCB-01-012-0137：檢查稽核日誌檔案所有權是否為 root:root

# 取得設定檔中 log_file 參數
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若設定檔未指定則預設為 /var/log/audit/audit.log
	[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

	if [[ -f "$log_file" ]]; then
	owner=$(stat -c "%U:%G" "$log_file")
		if [[ "$owner" == "root:root" ]]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0137 $log_file owner is root:root"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0137 $log_file owner is $owner (expected root:root)"
		fi
	else
		echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-012-0137 $log_file not found"
	fi
	
# TWGCB-01-012-0138：檢查稽核日誌檔案權限是否為600或更低

# 讀取 auditd 設定檔中指定的 log_file 路徑
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若設定中未指定，預設為 /var/log/audit/audit.log
[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

# 檢查檔案是否存在
if [[ -f "$log_file" ]]; then
    perm=$(stat -c "%a" "$log_file")
    if [[ "$perm" -le 600 ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0138 $log_file permission is $perm (<=600)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0138 $log_file permission is $perm (should be <=600)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-012-0138 $log_file not found"
fi

# TWGCB-01-012-0139：檢查稽核日誌目錄所有權
# 讀取 auditd 設定檔中 log_file 的路徑
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若未指定，預設為 /var/log/audit/audit.log
[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

# 取得稽核日誌目錄
log_dir=$(dirname "$log_file")

# 檢查目錄是否存在
if [[ -d "$log_dir" ]]; then
    owner=$(stat -c "%U:%G" "$log_dir")
    if [[ "$owner" == "root:root" ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0139 $log_dir owner is root:root"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0139 $log_dir owner is $owner (should be root:root)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-012-0139 $log_dir not found"
fi
	
# TWGCB-01-012-0140：檢查稽核日誌目錄權限

# 讀取 auditd 設定檔中 log_file 的路徑
log_file=$(grep -iw log_file /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')

# 若未指定，預設為 /var/log/audit/audit.log
[[ -z "$log_file" ]] && log_file="/var/log/audit/audit.log"

# 取得稽核日誌目錄
log_dir=$(dirname "$log_file")

# 檢查目錄是否存在
if [[ -d "$log_dir" ]]; then
    perms=$(stat -c "%a" "$log_dir")
    if [[ "$perms" -le 700 ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0140 $log_dir permissions are $perms (<=700)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0140 $log_dir permissions are $perms (should be <=700)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-012-0140 $log_dir not found"
fi


# TWGCB-01-012-0141：檢查稽核規則檔案權限
rules_path="/etc/audit/rules.d"
# 1. 檢查目錄下是否有任何 .rules 檔案
if ls $rules_path/*.rules >/dev/null 2>&1; then
    # 2. 找出權限大於 600 的檔案 (用 find 直接過濾)
    # /bin/ -perm /077 代表只要 group 或 others 有任何讀、寫、執行權限就算
    bad_files=$(find $rules_path -name "*.rules" -type f -perm /077)

    if [[ -z "$bad_files" ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0141 All audit rules permissions are compliant (<=600)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0141 Following files have excessive permissions: $bad_files(chmod 600 $bad_files)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-012-0141 No audit rules found in $rules_path"
fi


# TWGCB-01-012-0142：檢查稽核設定檔案權限
audit_conf_file="/etc/audit/auditd.conf"

if [[ -f "$audit_conf_file" ]]; then
    perms=$(stat -c "%a" "$audit_conf_file")
    if [[ "$perms" -le 640 ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0142 $audit_conf_file permissions are $perms (<=640)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0142 $audit_conf_file permissions are $perms (should be <=640)"
    fi
else
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-012-0142 $audit_conf_file not found"
fi


### TWGCB-01-012-0143 ####
# 稽核工具權限應為 750 或更低
TOOLS="/sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/audisp-remote /sbin/audisp-syslog /sbin/augenrules /sbin/rsyslogd"
RESULT="OK"

for TOOL in $TOOLS; do
    if [ -f "$TOOL" ]; then
        PERM=$(stat -c %a "$TOOL")
        if [ "$PERM" -gt 750 ]; then
            RESULT="KO"
            echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0143 $TOOL permission $PERM > 750"
        fi
    fi
done

if [ "$RESULT" = "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0143 all existing tools permission ≤ 750"
fi

### TWGCB-01-012-0144 ####
# 稽核工具擁有者與群組應為 root:root
TOOLS="/sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/audisp-remote /sbin/audisp-syslog /sbin/augenrules /sbin/rsyslogd"

RESULT="OK"

for TOOL in $TOOLS; do
    if [ -f "$TOOL" ]; then
        OWNER_GROUP=$(ls -l "$TOOL" | awk '{print $3 ":" $4}')
        if [ "$OWNER_GROUP" != "root:root" ]; then
            RESULT="KO"
		    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0144 no root:root"	
        fi
    fi
done

if [ "$RESULT" = "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0144 all owner:group = root:root"
fi


# TWGCB-01-012-0145：檢查稽核工具保護設定
aide_conf="/etc/aide.conf"
tools=(
"/usr/sbin/auditctl"
"/usr/sbin/auditd"
"/usr/sbin/ausearch"
"/usr/sbin/aureport"
"/usr/sbin/autrace"
"/usr/sbin/audisp-remote"
"/usr/sbin/audisp-syslog"
"/usr/sbin/augenrules"
)
missing=0


if [[ ! -f "$aide_conf" ]]; then
    echo -e " [\e[1;33mWARN\e[0m] TWGCB-01-012-0145 $aide_conf not found"
fi

for tool in "${tools[@]}"; do
    if ! grep -q "^$tool p+i+n+u+g+s+b+acl+xattrs+sha512" "$aide_conf"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0145 $tool not protected in aide.conf"
        missing=1
    fi
done

if [[ "$missing" -eq 0 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0145 all audit tools are protected in aide.conf"
fi



MAX_LOG=$(grep -E '^\s*max_log_file\s*=' /etc/audit/auditd.conf | awk -F= '{gsub(/ /,"",$2); print $2}')
if [ "$MAX_LOG" = "32" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0146 max_log_file is set to 32MB"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0146 max_log_file is not 32MB"
fi

audit01=`grep -i '^[[:space:]]*max_log_file_action[[:space:]]*=' /etc/audit/auditd.conf | awk -F= '{gsub(/[ 	]/, "", $2); print $2}' | paste -sd ";"`
    if [ "$audit01" == "keep_logs" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0147 max_log_file_action = keep_logs"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0147 should be different to max_log_file_action = keep_logs"
    fi
	
CURRENT_RULES=$(auditctl -l 2>/dev/null)
# --- TWGCB-01-012-0148 (sudoers) ---
if echo "$CURRENT_RULES" | grep -Eq "/etc/sudoers(/|$|[[:space:]])" && \
   echo "$CURRENT_RULES" | grep -Eq "/etc/sudoers\.d(/|$|[[:space:]])"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0148 sudoers audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0148 missing sudoers audit rules"
fi

# --- TWGCB-01-012-0149 (logins) ---
if echo "$CURRENT_RULES" | grep -q "/var/run/faillock" && echo "$CURRENT_RULES" | grep -q "/var/log/lastlog"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0149 login audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0149 missing login audit rules"
fi

# --- TWGCB-01-012-0150 (session) ---
if echo "$CURRENT_RULES" | grep -q "/var/run/utmp" && echo "$CURRENT_RULES" | grep -q "/var/log/wtmp" && echo "$CURRENT_RULES" | grep -q "/var/log/btmp"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0150 session audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0150 missing session audit rules"
fi

# --- TWGCB-01-012-0151 (time-change) ---
if echo "$CURRENT_RULES" | grep -q "time-change"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0151 time-change audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0151 missing time-change audit rules"
fi

# --- TWGCB-01-012-0152 (MAC-policy) ---
if echo "$CURRENT_RULES" | grep -q "/etc/selinux" && echo "$CURRENT_RULES" | grep -q "/usr/share/selinux"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0152 MAC-policy audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0152 missing MAC-policy audit rules"
fi

# --- TWGCB-01-012-0153 (system-locale) ---
if echo "$CURRENT_RULES" | grep -q "system-locale"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0153 system-locale audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0153 missing system-locale audit rules"
fi

# --- TWGCB-01-012-0154 (perm_mod) ---
if echo "$CURRENT_RULES" | grep -q "perm_mod"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0154 perm_mod audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0154 missing perm_mod audit rules"
fi

# --- TWGCB-01-012-0155 (access) ---
if echo "$CURRENT_RULES" | grep -q "access" && echo "$CURRENT_RULES" | grep -q "EACCES"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0155 access audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0155 missing access audit rules"
fi

# --- TWGCB-01-012-0156 (identity) ---
if echo "$CURRENT_RULES" | grep -q "identity" && echo "$CURRENT_RULES" | grep -q "/etc/shadow"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0156 identity audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0156 missing identity audit rules"
fi

# --- TWGCB-01-012-0157 (mounts) ---
if echo "$CURRENT_RULES" | grep -q "mounts"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0157 mounts audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0157 missing mounts audit rules"
fi
	
# TWGCB-01-012-0158 檢查是否已設定特權指令使用稽核規則，基準要求: 建立 Audit 規則，監控具有 setuid/setgid 權限的程式執行。
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0158.log"
AUDIT_RULES_FILE="/etc/audit/rules.d/GCB.rules"
FIX_COMMAND="請參考 $LOGFILE 指引將規則寫入 $AUDIT_RULES_FILE"

# 核心檢查邏輯：
# 只要目前核心載入的規則中，有任何一條符合 '-F perm=x' 且含有 'privileged' 關鍵字，即視為通過
if echo "$CURRENT_RULES" | grep -qE '\-F\s+perm=x.*privileged' 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0158 Audit rules for privileged commands ok"
else
    # 清空並寫入 Log
    > "$LOGFILE"
    echo "==========================================================" >> "$LOGFILE"
    echo "TWGCB-01-012-0158 修復指引" >> "$LOGFILE"
    echo "原因：核心規則中未偵測到任何關於特權程式 (privileged) 的稽核規則。" >> "$LOGFILE"
    echo "----------------------------------------------------------" >> "$LOGFILE"
    echo "請執行下列指令產出規則至 $AUDIT_RULES_FILE：" >> "$LOGFILE"
    echo "" >> "$LOGFILE"
    echo "echo '# TWGCB-01-012-0158' > $AUDIT_RULES_FILE" >> "$LOGFILE"
    echo "find / -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print \"-a always,exit -F path=\" \$1 \" -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged\" }' >> $AUDIT_RULES_FILE" >> "$LOGFILE"
    echo "" >> "$LOGFILE"
    echo "最後執行載入指令：augenrules --load" >> "$LOGFILE"
    echo "==========================================================" >> "$LOGFILE"

    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0158 Privileged audit rules missing. (See $LOGFILE)"
fi

# --- TWGCB-01-012-0159 (delete) ---
if echo "$CURRENT_RULES" | grep -q "delete" && echo "$CURRENT_RULES" | grep -q "rename"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0159 delete audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0159 missing delete audit rules"
fi

# --- TWGCB-01-012-0160 (modules) ---
if echo "$CURRENT_RULES" | grep -q "modules" && echo "$CURRENT_RULES" | grep -q "insmod"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0160 kernel module audit rules ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0160 missing kernel module audit rules"
fi

# --- TWGCB-01-012-0161 (sudo.log 稽核) ---
# 1. 動態取得 sudoers 設定的 logfile 路徑
SUDO_LOG=$(grep -r logfile /etc/sudoers* 2>/dev/null | sed -e 's/.*logfile=//; s/,.*//; s/^["'\'']//; s/["'\'']$//' | head -n 1)
# 2. 若沒設定則使用系統預設值
[ -z "$SUDO_LOG" ] && SUDO_LOG="/var/log/sudo.log"
# 3. 在核心規則中查找該路徑 (不需精確匹配，有包含即可)
if echo "$CURRENT_RULES" | grep -q "$SUDO_LOG"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0161 audit rule for sudo.log ($SUDO_LOG) ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0161 missing audit rule for sudo.log ($SUDO_LOG)"
fi
	
# --- TWGCB-01-012-0162 (chcon) ---
if echo "$CURRENT_RULES" | grep -q "key=perm_chng" || grep -rq "path=/usr/bin/chcon" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0162 audit rule for chcon ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0162 missing audit rule for chcon"
fi

# --- TWGCB-01-012-0163 (ssh-agent) ---
if echo "$CURRENT_RULES" | grep -q "key=privileged-ssh" || grep -rq "path=/usr/bin/ssh-agent" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0163 audit rule for ssh-agent ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0163 missing audit rule for ssh-agent"
fi

# --- TWGCB-01-012-0164 (unix_update) ---
if echo "$CURRENT_RULES" | grep -q "key=privileged-unix-update" || grep -rq "path=/sbin/unix_update" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0164 audit rule for unix_update ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0164 missing audit rule for unix_update"
fi

# --- TWGCB-01-012-0165 (setfacl) ---
if echo "$CURRENT_RULES" | grep -q "key=perm_chng" || grep -rq "path=/usr/bin/setfacl" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0165 audit rule for setfacl ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0165 missing audit rule for setfacl"
fi

# --- TWGCB-01-012-0166 (finit_module) ---
if echo "$CURRENT_RULES" | grep -q "key=module_chng" || grep -rq "S finit_module" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0166 audit rule for finit_module ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0166 missing audit rule for finit_module"
fi

# --- TWGCB-01-012-0167 (open_by_handle_at) ---
if echo "$CURRENT_RULES" | grep -q "key=perm_access" || grep -rq "S open_by_handle_at" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0167 audit rule for open_by_handle_at ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0167 missing audit rule for open_by_handle_at"
fi

# --- TWGCB-01-012-0168 (usermod) ---
if echo "$CURRENT_RULES" | grep -q "key=privileged-usermod" || grep -rq "path=/usr/sbin/usermod" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0168 audit rule for usermod ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0168 missing audit rule for usermod"
fi

# --- TWGCB-01-012-0169 (chacl) ---
if echo "$CURRENT_RULES" | grep -q "key=perm_chng" || grep -rq "path=/usr/bin/chacl" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0169 audit rule for chacl ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0169 missing audit rule for chacl"
fi

# --- TWGCB-01-012-0170 (kmod) ---
if echo "$CURRENT_RULES" | grep -q "key=modules" || grep -rq "/bin/kmod" "$RULES_DIR" 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0170 audit rule for kmod ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0170 missing audit rule for kmod"
fi

# --- TWGCB-01-012-0171 (faillock log) ---
if echo "$CURRENT_RULES" | grep -q "faillock" && echo "$CURRENT_RULES" | grep -q "logins"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0171 audit rule for faillock log ok"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0171 missing audit rule for faillock log"
fi
	
	
	
# TWGCB-01-012-0172 ###	
# 檢查 execve 系統呼叫稽核規則
RULE_FILES=$(find /etc/audit/rules.d/ -type f -name "*.rules" 2>/dev/null)
execve_ok=0

for file in $RULE_FILES; do
    content=$(grep -v '^\s*#' "$file")  # 忽略註解行

    # 檢查是否有符合官方要求的規則
    echo "$content" | grep -Eq 'arch=b32.*auid!=unset.*-S execve.*-C uid!=euid' && execve_ok_32_uid=1 || execve_ok_32_uid=0
    echo "$content" | grep -Eq 'arch=b64.*auid!=unset.*-S execve.*-C uid!=euid' && execve_ok_64_uid=1 || execve_ok_64_uid=0
    echo "$content" | grep -Eq 'arch=b32.*auid!=unset.*-S execve.*-C gid!=egid' && execve_ok_32_gid=1 || execve_ok_32_gid=0
    echo "$content" | grep -Eq 'arch=b64.*auid!=unset.*-S execve.*-C gid!=egid' && execve_ok_64_gid=1 || execve_ok_64_gid=0

    # 若四條規則都有，標記 OK
    if [[ $execve_ok_32_uid -eq 1 && $execve_ok_64_uid -eq 1 && $execve_ok_32_gid -eq 1 && $execve_ok_64_gid -eq 1 ]]; then
        execve_ok=1
        break
    fi
done

if [[ $execve_ok -eq 1 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0172 execve audit rules are correctly set"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0172 missing or incorrect execve audit rules"
fi
	


# TWGCB-01-012-0173 ###
MATCHES=$(grep -h "^\s*[^#]" /etc/audit/rules.d/*.rules 2>/dev/null | egrep "(-e 2)|(--loginuid-immutable)")

# 判斷是否同時包含 -e 2 和 --loginuid-immutable
if echo "$MATCHES" | grep -q -- "-e 2" && echo "$MATCHES" | grep -q -- "--loginuid-immutable"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0173 audit rules include -e 2 and --loginuid-immutable"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0173 audit rules missing required settings"
fi


# TWGCB-01-012-0174
	if rpm -q rsyslog &>/dev/null; then	
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0174 rsyslog package is installed"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0174 rsyslog package is not installed.(dnf install rsyslog)"
    fi


# TWGCB-01-012-0175：檢查 rsyslog 服務是否啟用且正在執行
SERVICE_NAME="rsyslog"
FIX_COMMAND="systemctl --now enable $SERVICE_NAME"
if systemctl is-enabled $SERVICE_NAME &>/dev/null && systemctl is-active $SERVICE_NAME &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0175 $SERVICE_NAME service is active."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0175 $SERVICE_NAME service issue. ($FIX_COMMAND)"
fi



# --- TWGCB-01-012-0176：檢查 rsyslog $FileCreateMode (純檢查版) ---
# 1. 抓取所有 .conf 檔案中「未被註解」的 $FileCreateMode
# 使用 grep -r 遍歷目錄，awk 確保抓取參數值
all_modes=$(grep -rE '^[[:space:]]*\$FileCreateMode' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null | awk '{print $NF}')

if [[ -z "$all_modes" ]]; then
    # 官方規範若沒設，預設通常是 0644，這是不合規的
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0176 Missing \$FileCreateMode setting (Default is unsafe)"
else
    # 取得最後一個生效的設定 (rsyslog 後讀取的會覆蓋前面的)
    found_mode=$(echo "$all_modes" | tail -n 1)
    if [[ "$found_mode" =~ ^0[0-6][0-4]0$ ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0176 \$FileCreateMode=$found_mode (Compliant)"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0176 \$FileCreateMode=$found_mode (Too permissive, must be 0640 or lower)"
    fi
fi

# --- TWGCB-01-012-0177 變數定義 ---
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0177.log"
CHECK_FILES="/etc/rsyslog.conf /etc/rsyslog.d/*.conf"

# 1. 執行檢查
SECURE_RULES=$(grep -rE '^[[:space:]]*[^#].*/var/log/secure' $CHECK_FILES 2>/dev/null)
HAS_AUTH=$(echo "$SECURE_RULES" | grep -qE "auth\.\*" && echo 1 || echo 0)
HAS_AUTHPRIV=$(echo "$SECURE_RULES" | grep -qE "authpriv\.\*" && echo 1 || echo 0)
HAS_DAEMON=$(echo "$SECURE_RULES" | grep -qE "daemon\.\*" && echo 1 || echo 0)

if [[ $HAS_AUTH -eq 1 && $HAS_AUTHPRIV -eq 1 && $HAS_DAEMON -eq 1 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0177 rsyslog secure logging rules are correctly set."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0177 missing logging rules (see $LOGFILE)"
    
    # 2. 寫入修復方法到 Logfile (覆蓋寫入)
    cat << EOF > "$LOGFILE"
[TWGCB-01-012-0177 修復方法]
原因：未偵測到 auth.*, authpriv.*, daemon.* 記錄至 /var/log/secure。

建議修復步驟：
1. 建立或編輯 GCB 專用設定檔：
   指令：echo "auth.*,authpriv.*,daemon.* /var/log/secure" > /etc/rsyslog.d/GCB.conf

2. 重新啟動 rsyslog 服務使設定生效：
   指令：systemctl restart rsyslog

3. 驗證設定：
   指令：grep -r "/var/log/secure" /etc/rsyslog.conf /etc/rsyslog.d/*.conf
EOF
fi




# TWGCB-01-012-0178 檢查 /var/log/messages 檔案所有權，設定 /var/log/messages 檔案擁有者與群組為 root:root。 
# 修復指令：設定擁有者與群組為 root:root 
FIX_COMMAND="chown root:root /var/log/messages"
# --- 核心檢查邏輯：驗證擁有者與群組是否為 root ---
CURRENT_OWNER=$(stat -c "%U:%G" /var/log/messages 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0178 /var/log/messages ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0178 ownership error: '$CURRENT_OWNER' (Expected: root:root). ($FIX_COMMAND)"
fi

	
# TWGCB-01-012-0179 檢查 /var/log 目錄所有權，設定 /var/log 目錄擁有者與群組為 root:root。 
# 修復指令：設定目錄擁有者與群組為 root:root 
FIX_COMMAND="chown root:root /var/log"
# --- 核心檢查邏輯：驗證目錄擁有者與群組是否為 root ---
CURRENT_OWNER=$(stat -c "%U:%G" /var/log 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0179 /var/log directory ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0179 directory ownership error: '$CURRENT_OWNER' (Expected: root:root). ($FIX_COMMAND)"
fi

#114/03/11 V1.1 DEL TWGCB-01-012-0180

#audit01=`grep -i '^[[:space:]]*ForwardToSyslog[[:space:]]*=' /etc/systemd/journald.conf | awk -F= '{gsub(/[ 	]/, "", $2); print $2}' | paste -sd ";"`
#    if [ "$audit01" == "yes" ] ; then
#        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0180 ForwardToSyslog=yes"
#    else
#        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0180 should be different to ForwardToSyslog=yes"
#    fi
	
# TWGCB-01-012-0181：檢查 Compress 是否設定為 yes
if grep -iq '^\s*Compress=yes' /etc/systemd/journald.conf; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0181 Compress=yes"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0181 should be set Compress=yes in /etc/systemd/journald.conf"
    fi
	
# TWGCB-01-012-0182：檢查 Storage 是否設定為 persistent
if grep -iq '^\s*Storage=persistent' /etc/systemd/journald.conf; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0182 Storage = persistent"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0182 should be set Storage=persistent in /etc/systemd/journald.conf"
    fi
	
# TWGCB-01-012-0183 檢查 libselinux 套件是否已安裝	
	if rpm -q libselinux >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0183 libselinux are installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0183 libselinux not installed"
	fi

### TWGCB-01-012-0184 檢查開機參數中是否有禁用 SELinux 的設定
if grep -Eq 'selinux=0|enforcing=0' /etc/default/grub; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0184 Found selinux=0 or enforcing=0 in grub"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0184 SELinux not disabled in bootloader"
fi
	
# TWGCB-01-012-0185：檢查 SELINUXTYPE 是否設定為 targeted
# 修復指令：sed -i 's/^SELINUXTYPE=.*/SELINUXTYPE=targeted/' /etc/selinux/config
# --- 核心檢查邏輯：驗證非註解行之設定值 ---
CURRENT_TYPE=$(grep -i '^\s*SELINUXTYPE\s*=' /etc/selinux/config | awk -F= '{gsub(/[ \t]/, "", $2); print $2}' | tail -n 1)

if [ "$CURRENT_TYPE" == "targeted" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0185 SELINUXTYPE is correctly set to 'targeted'."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0185 SELINUXTYPE error: '$CURRENT_TYPE' (Expected: targeted). (sed -i 's/^SELINUXTYPE=.*/SELINUXTYPE=targeted/' /etc/selinux/config)"
fi
	
# TWGCB-01-012-0186 檢查 SELinux 是否為強制模式 (enforcing)，SELINUX 必須設為 enforcing。 
# 修復指令：編輯設定檔並執行 setenforce
FIX_COMMAND="請於 /etc/selinux/config 設定 SELINUX=enforcing 並執行 #setenforce 1" 
# --- 核心檢查邏輯：檢查核心運行狀態與設定檔 ---
# 1. getenforce : 取得目前核心運行模式
# 2. grep : 確認設定檔 /etc/selinux/config 的預設值
CURRENT_MODE=$(getenforce 2>/dev/null)
CONFIG_SETTING=$(grep -E '^\s*SELINUX=enforcing' /etc/selinux/config 2>/dev/null)
if [[ "$CURRENT_MODE" == "Enforcing" ]] && [[ -n "$CONFIG_SETTING" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0186 SELinux is active and set to enforcing."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0186 SELinux mode error: current is '$CURRENT_MODE'. ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0187 檢查是否存在未受限程序 (unconfined_service_t)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0187.log"
# 查找目前執行中的 unconfined_service_t 程序
ps -eZf | awk '$1 ~ /unconfined_service_t/ {print $0}' >> "$LOGFILE"
# 輸出結果
if [ -s "$LOGFILE" ]; then
    COUNT=$(wc -l < "$LOGFILE")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0187 Found $COUNT unconfined service process(es). (see $LOGFILE)(restorecon -Rv <binary_path>)"
	echo "use command : ps -eZf | awk '$1 ~ /unconfined_service_t/' to find path and Run command: restorecon -Rv <binary_path>" >> "$LOGFILE"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0187 No unconfined service processes found."
fi


# TWGCB-01-012-0188 檢查 setroubleshoot 套件是否已安裝	
	if rpm -q setroubleshoot >/dev/null 2>&1; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0188 setroubleshoot are installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0188 setroubleshoot not installed"
	fi

# TWGCB-01-012-0189 檢查 mcstrans 套件是否已安裝	
	if rpm -q mcstrans >/dev/null 2>&1; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0189 mcstrans are installed"
	else
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0189 mcstrans not installed"
	fi

	if systemctl is-active --quiet crond; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0190 crond service is active"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0190 crond service is NOT active"
	fi
	
# TWGCB-01-012-0191：檢查 /etc/crontab 所有權
# 修復指令：chown root:root /etc/crontab
CURRENT_OWNER=$(stat -c "%U:%G" /etc/crontab 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0191 /etc/crontab ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0191 /etc/crontab ownership error: '$CURRENT_OWNER'. (chown root:root /etc/crontab)"
fi

# TWGCB-01-012-0192：檢查 /etc/crontab 權限設定 (需為 644 以下)
# 修復指令：chmod 644 /etc/crontab
CURRENT_PERM=$(stat -c "%a" /etc/crontab 2>/dev/null)
if [ "$CURRENT_PERM" -le 644 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0192 /etc/crontab permission is $CURRENT_PERM (<= 644)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0192 /etc/crontab permission error: $CURRENT_PERM. (chmod 644 /etc/crontab)"
fi

# TWGCB-01-012-0193：檢查 /etc/cron.hourly 所有權
# 修復指令：chown root:root /etc/cron.hourly
CURRENT_OWNER=$(stat -c "%U:%G" /etc/cron.hourly 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0193 /etc/cron.hourly ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0193 /etc/cron.hourly ownership error: '$CURRENT_OWNER'. (chown root:root /etc/cron.hourly)"
fi

# TWGCB-01-012-0194：檢查 /etc/cron.hourly 權限設定 (需為 700 以下)
# 修復指令：chmod 700 /etc/cron.hourly
CURRENT_PERM=$(stat -c "%a" /etc/cron.hourly 2>/dev/null)
if [ "$CURRENT_PERM" -le 700 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0194 /etc/cron.hourly permission is $CURRENT_PERM (<= 700)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0194 /etc/cron.hourly permission error: $CURRENT_PERM. (chmod 700 /etc/cron.hourly)"
fi

# TWGCB-01-012-0195：檢查 /etc/cron.daily 所有權
# 修復指令：chown root:root /etc/cron.daily
CURRENT_OWNER=$(stat -c "%U:%G" /etc/cron.daily 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0195 /etc/cron.daily ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0195 /etc/cron.daily ownership error: '$CURRENT_OWNER'. (chown root:root /etc/cron.daily)"
fi

# TWGCB-01-012-0196：檢查 /etc/cron.daily 權限設定 (需為 700 以下)
# 修復指令：chmod 700 /etc/cron.daily
CURRENT_PERM=$(stat -c "%a" /etc/cron.daily 2>/dev/null)
if [ "$CURRENT_PERM" -le 700 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0196 /etc/cron.daily permission is $CURRENT_PERM (<= 700)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0196 /etc/cron.daily permission error: $CURRENT_PERM. (chmod 700 /etc/cron.daily)"
fi

# TWGCB-01-012-0197：檢查 /etc/cron.weekly 所有權
# 修復指令：chown root:root /etc/cron.weekly
CURRENT_OWNER=$(stat -c "%U:%G" /etc/cron.weekly 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0197 /etc/cron.weekly ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0197 /etc/cron.weekly ownership error: '$CURRENT_OWNER'. (chown root:root /etc/cron.weekly)"
fi

# TWGCB-01-012-0198：檢查 /etc/cron.weekly 權限設定 (需為 700 以下)
# 修復指令：chmod 700 /etc/cron.weekly
CURRENT_PERM=$(stat -c "%a" /etc/cron.weekly 2>/dev/null)
if [ "$CURRENT_PERM" -le 700 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0198 /etc/cron.weekly permission is $CURRENT_PERM (<= 700)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0198 /etc/cron.weekly permission error: $CURRENT_PERM. (chmod 700 /etc/cron.weekly)"
fi

# TWGCB-01-012-0199：檢查 /etc/cron.monthly 所有權
# 修復指令：chown root:root /etc/cron.monthly
CURRENT_OWNER=$(stat -c "%U:%G" /etc/cron.monthly 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0199 /etc/cron.monthly ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0199 /etc/cron.monthly ownership error: '$CURRENT_OWNER'. (chown root:root /etc/cron.monthly)"
fi

# TWGCB-01-012-0200：檢查 /etc/cron.monthly 權限設定 (需為 700 以下)
# 修復指令：chmod 700 /etc/cron.monthly
CURRENT_PERM=$(stat -c "%a" /etc/cron.monthly 2>/dev/null)
if [ "$CURRENT_PERM" -le 700 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0200 /etc/cron.monthly permission is $CURRENT_PERM (<= 700)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0200 /etc/cron.monthly permission error: $CURRENT_PERM. (chmod 700 /etc/cron.monthly)"
fi

# TWGCB-01-012-0201：檢查 /etc/cron.d 所有權
# 修復指令：chown root:root /etc/cron.d
CURRENT_OWNER=$(stat -c "%U:%G" /etc/cron.d 2>/dev/null)
if [ "$CURRENT_OWNER" == "root:root" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0201 /etc/cron.d ownership is root:root."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0201 /etc/cron.d ownership error: '$CURRENT_OWNER'. (chown root:root /etc/cron.d)"
fi

# TWGCB-01-012-0202：檢查 /etc/cron.d 權限設定 (需為 700 以下)
# 修復指令：chmod 700 /etc/cron.d
CURRENT_PERM=$(stat -c "%a" /etc/cron.d 2>/dev/null)
if [ "$CURRENT_PERM" -le 700 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0202 /etc/cron.d permission is $CURRENT_PERM (<= 700)."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0202 /etc/cron.d permission error: $CURRENT_PERM. (chmod 700 /etc/cron.d)"
fi
	
# TWGCB-01-012-0203 檢查 Cron 與 At
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0203.log"
FILES_DENY=("/etc/cron.deny" "/etc/at.deny")
FILES_ALLOW=("/etc/cron.allow" "/etc/at.allow")
ERROR_COUNT=0

# 清空舊日誌並寫入修復標頭
for f in "${FILES_DENY[@]}"; do
    if [ -f "$f" ]; then
        ((ERROR_COUNT++))
        echo "rm -f $f" >> "$LOGFILE"
    fi
done

for f in "${FILES_ALLOW[@]}"; do
    if [ ! -f "$f" ]; then
        ((ERROR_COUNT++))
        echo "touch $f && chown root:root $f && chmod 600 $f" >> "$LOGFILE"
    else
        OWNER=$(stat -c "%U:%G" "$f")
        if [ "$OWNER" != "root:root" ]; then
            ((ERROR_COUNT++))
            echo "chown root:root $f" >> "$LOGFILE"
        fi
    fi
done

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0203 Cron/At access control is correct."
else
    # 畫面上只印出發現幾個錯誤與 LOG 路徑
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0203 Found $ERROR_COUNT issues. Fix commands written to $LOGFILE"
fi

# TWGCB-01-012-0204 檢查 /etc/cron.allow 與 /etc/at.allow 權限 (應為 600)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0204.log"
FILES=("/etc/cron.allow" "/etc/at.allow")
ERROR_COUNT=0
for FILE in "${FILES[@]}"; do
    if [ ! -f "$FILE" ]; then
        continue
    fi

    # 取得檔案權限數值
    PERM=$(stat -c "%a" "$FILE")
    
    # 判斷權限是否大於 600
    if [ "$PERM" -gt 600 ]; then
        ((ERROR_COUNT++))
        # 依照您的要求，在日誌中加入 (chmod 600 $FILE) 方便快速修復
        echo "File: $FILE, Current Permission: $PERM, Expected: 600 (chmod 600 $FILE)" >> "$LOGFILE"
    fi
done

if [ "$ERROR_COUNT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0204 Cron/At allow files permission is 600 or lower"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0204 Found $ERROR_COUNT file(s) with incorrect permission. (see $LOGFILE)"
fi

# TWGCB-01-012-0205 檢查 rsyslog 是否記錄 cron 日誌至 /var/log/cron
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0205.log"
# 搜尋所有 rsyslog 設定檔
CONF_FILES=$(find /etc/rsyslog.conf /etc/rsyslog.d/ -type f -name "*.conf" 2>/dev/null)
FOUND_CRON_RULE=0

# 核心檢查邏輯：查找包含 cron.* 並指向 /var/log/cron 的行 (排除註解)
for file in $CONF_FILES; do
    if grep -E '^[[:space:]]*cron\.' "$file" 2>/dev/null | grep -q '/var/log/cron'; then
        FOUND_CRON_RULE=1
        MATCH_FILE=$file
        break
    fi
done

if [ "$FOUND_CRON_RULE" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0205 Cron logging is enabled in $MATCH_FILE"
else
    # 若缺失，則將檢查結果寫入日誌
    > "$LOGFILE"
    echo "Check failed: No active rsyslog rule found for cron logging." >> "$LOGFILE"
    echo "Expected rule: cron.* /var/log/cron" >> "$LOGFILE"
    echo "Files searched: $CONF_FILES" >> "$LOGFILE"
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0205 Missing 'cron.* /var/log/cron' rule. (see $LOGFILE)"
fi

	
# TWGCB-01-012-0206：密碼重試次數 (Retry) 檢查
PAM_FILE="/etc/pam.d/system-auth"
CONF_FILE="/etc/security/pwquality.conf"
# 1. 抓取 PAM 檔案中的參數 (優先權最高)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "retry=\K\d+" | head -n1)
# 2. 抓取設定檔中的數值 (優先權次之)
VAL_CONF=$(awk -F= '/^[[:space:]]*retry[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
# 3. 確定最終生效值 (FINAL_VAL)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
# 4. 根據 GCB 規範判斷 (假設規範為 1-3)
if [[ "$FINAL_VAL" =~ ^[1-3]$ ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0206 Effective Retry=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0206 Effective Retry is ${FINAL_VAL:-"Not set"} (should be 1-3)"
fi
	

# TWGCB-01-012-0207：檢查 pam_pwquality 是否對 root 強制執行密碼規則
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0207.log"
authselect apply-changes &>/dev/null
CHECK_SYS=$(grep -E '^\s*password\s+requisite\s+pam_pwquality\.so\s+.*enforce_for_root' /etc/pam.d/system-auth)
CHECK_PWD=$(grep -E '^\s*password\s+requisite\s+pam_pwquality\.so\s+.*enforce_for_root' /etc/pam.d/password-auth)

if [ -n "$CHECK_SYS" ] && [ -n "$CHECK_PWD" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0207 Root password complexity enforcement is enabled."
else
    # 2. 只有在不合規時，才判斷環境並產出修復指令
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')

    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        # 情況 A：沒 Custom
        cat << 'EOF1' > "$LOGFILE"
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
for f in system-auth password-auth; do
    sed -i '/pam_pwquality.so/ s/$/ enforce_for_root/' "/etc/authselect/custom/twgcb/$f"
done
authselect apply-changes
EOF1
    else
        # 情況 B：有 Custom
        cat << 'EOF1' > "$LOGFILE"
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
for f in system-auth password-auth; do
    PTF="/etc/authselect/$CP/$f"
    if ! grep -q "enforce_for_root" "$PTF"; then
        sed -i '/pam_pwquality.so/ s/$/ enforce_for_root/' "$PTF"
    fi
done
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0207 'enforce_for_root' missing (See $LOGFILE for fix steps)"
fi


# TWGCB-01-012-0208 檢查最小密碼長度設定
LOGIN_DEFS="/etc/login.defs"
PWQ_CONF="/etc/security/pwquality.conf"
RESULT="KO"
# 檢查 /etc/login.defs
PASS_MIN_LEN=$(grep -E '^[[:space:]]*PASS_MIN_LEN' "$LOGIN_DEFS" 2>/dev/null | awk '{print $2}')
if [[ -n "$PASS_MIN_LEN" ]] && [[ "$PASS_MIN_LEN" -ge 12 ]]; then
    RESULT="OK"
fi
# 檢查 /etc/security/pwquality.conf
if [ "$RESULT" != "OK" ]; then
    MINLEN=$(grep -i '^minlen' "$PWQ_CONF" 2>/dev/null | awk -F '=' '{gsub(/ /,"",$2); print $2}')
    if [[ -n "$MINLEN" ]] && [[ "$MINLEN" -ge 12 ]]; then
        RESULT="OK"
    fi
fi
# 顯示結果
if [ "$RESULT" = "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0208 minimum password length ≥ 12"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0208 minimum password length < 12"
fi


PAM_FILE="/etc/pam.d/system-auth"
CONF_FILE="/etc/security/pwquality.conf"

# TWGCB-01-012-0209：minclass (密碼包含的字元類別數量)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "minclass=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*minclass[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "4" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0209 Effective minclass=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0209 Effective minclass is ${FINAL_VAL:-NotSet} (should be 4)"
fi

# TWGCB-01-012-0210：dcredit (至少包含數字個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "dcredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*dcredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0210 Effective dcredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0210 Effective dcredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-012-0211：ucredit (至少包含大寫字母個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "ucredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*ucredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0211 Effective ucredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0211 Effective ucredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-012-0212：lcredit (至少包含小寫字母個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "lcredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*lcredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0212 Effective lcredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0212 Effective lcredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-012-0213：ocredit (至少包含特殊字元個數，-1表示最少1個)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "ocredit=\K-?\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*ocredit[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "-1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0213 Effective ocredit=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0213 Effective ocredit is ${FINAL_VAL:-NotSet} (should be -1)"
fi

# TWGCB-01-012-0214：difok (新舊密碼不可相同字元數)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "difok=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*difok[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "3" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0214 Effective difok=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0214 Effective difok is ${FINAL_VAL:-NotSet} (should be 3)"
fi

# TWGCB-01-012-0215：maxclassrepeat (同一類別字元連續出現上限)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "maxclassrepeat=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*maxclassrepeat[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "4" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0215 Effective maxclassrepeat=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0215 Effective maxclassrepeat is ${FINAL_VAL:-NotSet} (should be 4)"
fi

# TWGCB-01-012-0216：maxrepeat (同一字元連續出現上限)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "maxrepeat=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*maxrepeat[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "3" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0216 Effective maxrepeat=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0216 Effective maxrepeat is ${FINAL_VAL:-NotSet} (should be 3)"
fi

# TWGCB-01-012-0217：dictcheck (是否檢查字典檔)
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "dictcheck=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*dictcheck[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$CONF_FILE" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" == "1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0217 Effective dictcheck=$FINAL_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0217 Effective dictcheck is ${FINAL_VAL:-NotSet} (should be 1)"
fi


# TWGCB-01-012-0218 檢查使用者登入失敗鎖定次數
CFG="/etc/security/faillock.conf"
VAL=$(grep -iE "^[[:space:]]*deny[[:space:]]*=[[:space:]]*[0-9]+" "$CFG" | awk -F= '{gsub(/ /,"",$2); print $2}' | tail -n1)
if [[ "$VAL" =~ ^[1-5]$ ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0218 deny=$VAL (1–5)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0218 deny should be between 1 and 5"
fi


# TWGCB-01-012-0219 檢查帳號解鎖時間
CFG="/etc/security/faillock.conf"
VAL=$(grep -iE "^[[:space:]]*unlock_time[[:space:]]*=[[:space:]]*[0-9]+" "$CFG" | awk -F= '{gsub(/ /,"",$2); print $2}' | tail -n1)
if [[ "$VAL" =~ ^[0-9]+$ ]] && [ "$VAL" -ge 900 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0219 unlock_time=$VAL (≥900)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0219 unlock_time should be ≥ 900 seconds"
fi


# TWGCB-01-012-0220：檢查通行碼重複使用限制 (remember)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0220.log"
EXPECTED=3
authselect apply-changes &>/dev/null
REM_VAL=$(grep -E '^\s*password' /etc/pam.d/system-auth 2>/dev/null | grep 'pam_unix.so' | grep -oP 'remember=\K[0-9]+' | head -1)

if [[ -n "$REM_VAL" && "$REM_VAL" -ge $EXPECTED ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0220 password remember is set to $REM_VAL"
else
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')
    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        cat << 'EOF1' > "$LOGFILE"
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
PTF="/etc/authselect/custom/twgcb/system-auth"
if grep -Eq 'pam_unix\.so.*remember=' "$PTF"; then
    sed -ri 's/(pam_unix\.so.*)remember=[0-9]+/\1remember=3/' "$PTF"
else
    sed -ri 's/(pam_unix\.so.*)/\1 remember=3/' "$PTF"
fi
authselect apply-changes
EOF1
    else
        cat << 'EOF1' > "$LOGFILE"
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
PTF="/etc/authselect/$CP/system-auth"
if grep -Eq 'pam_unix\.so.*remember=' "$PTF"; then
    sed -ri 's/(pam_unix\.so.*)remember=[0-9]+/\1remember=3/' "$PTF"
else
    sed -ri 's/(pam_unix\.so.*)/\1 remember=3/' "$PTF"
fi
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0220 password remember issue (See $LOGFILE)"
fi


# TWGCB-01-012-0221：檢查登入失敗次數顯示設定
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0221.log"
authselect apply-changes &>/dev/null
if grep -Eq '^\s*session\s+.*pam_lastlog\.so\s+.*showfailed' /etc/pam.d/postlogin 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0221 pam_lastlog.so showfailed is set."
else
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')
    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        cat << 'EOF1' > "$LOGFILE"
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
PTF="/etc/authselect/custom/twgcb/postlogin"
if ! grep -q "pam_lastlog.so" "$PTF"; then
    echo "session     required      pam_lastlog.so showfailed" >> "$PTF"
elif ! grep -q "showfailed" "$PTF"; then
    sed -i '/pam_lastlog.so/s/$/ showfailed/' "$PTF"
fi
authselect apply-changes
EOF1
    else
        cat << 'EOF1' > "$LOGFILE"
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
PTF="/etc/authselect/$CP/postlogin"
if ! grep -q "pam_lastlog.so" "$PTF"; then
    echo "session     required      pam_lastlog.so showfailed" >> "$PTF"
elif ! grep -q "showfailed" "$PTF"; then
    sed -i '/pam_lastlog.so/s/$/ showfailed/' "$PTF"
fi
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0221 pam_lastlog.so showfailed missing (See $LOGFILE)"
fi

# TWGCB-01-012-0222：檢查通行碼雜湊演算法是否為 SHA512
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0222.log"
authselect apply-changes &>/dev/null
CHECK_PAM=$(grep -E '^\s*password\s+sufficient\s+pam_unix.so' /etc/pam.d/system-auth 2>/dev/null | grep -q 'sha512'; echo $?)
CHECK_LIB=$(grep -qE "^\s*crypt_style\s*=\s*sha512" /etc/libuser.conf 2>/dev/null; echo $?)
CHECK_LOG=$(grep -qE "^\s*ENCRYPT_METHOD\s+SHA512" /etc/login.defs 2>/dev/null; echo $?)

if [ $CHECK_PAM -eq 0 ] && [ $CHECK_LIB -eq 0 ] && [ $CHECK_LOG -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0222 Password hashing is SHA512."
else
    CURRENT_PROFILE=$(authselect current | awk 'NR == 1 {print $3}')
    if [[ "$CURRENT_PROFILE" != custom/* ]]; then
        cat << 'EOF1' > "$LOGFILE"
sed -i 's/^\s*crypt_style.*/crypt_style = sha512/' /etc/libuser.conf
sed -i 's/^\s*ENCRYPT_METHOD.*/ENCRYPT_METHOD SHA512/' /etc/login.defs
authselect create-profile twgcb -b sssd --symlink-meta
authselect select custom/twgcb with-sudo with-faillock without-nullok --force
for f in system-auth password-auth; do
    PTF="/etc/authselect/custom/twgcb/$f"
    if ! grep -q "sha512" "$PTF"; then
        sed -i '/pam_unix.so/ s/$/ sha512/' "$PTF"
    fi
done
authselect apply-changes
EOF1
    else
        cat << 'EOF1' > "$LOGFILE"
sed -i 's/^\s*crypt_style.*/crypt_style = sha512/' /etc/libuser.conf
sed -i 's/^\s*ENCRYPT_METHOD.*/ENCRYPT_METHOD SHA512/' /etc/login.defs
CP=$(authselect current | awk 'NR == 1 {print $3}' | grep "^custom/")
for f in system-auth password-auth; do
    PTF="/etc/authselect/$CP/$f"
    if ! grep -q "sha512" "$PTF"; then
        sed -i '/pam_unix.so/ s/$/ sha512/' "$PTF"
    fi
done
authselect apply-changes
EOF1
    fi
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0222 SHA512 configuration issue (See $LOGFILE)"
fi


# TWGCB-01-012-0223 密碼最短使用期限 (僅檢查全域設定)
VAL=$(grep -E "^\s*PASS_MIN_DAYS" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 1 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0223 /etc/login.defs PASS_MIN_DAYS is $VAL (chage --mindays 1)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0223 /etc/login.defs PASS_MIN_DAYS is ${VAL:-"Not set"} (should be >= 1)"
fi

# TWGCB-01-012-0224 密碼到期提醒天數 (PASS_WARN_AGE)
VAL=$(grep -E "^\s*PASS_WARN_AGE" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 14 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0224 /etc/login.defs PASS_WARN_AGE is $VAL (chage --warndays 14)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0224 /etc/login.defs PASS_WARN_AGE is ${VAL:-"Not set"} (should be >= 14)"
fi
	
# TWGCB-01-012-0225 密碼最長使用期限 (PASS_MAX_DAYS)
VAL=$(grep -E "^\s*PASS_MAX_DAYS" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -le 90 ] && [ "$VAL" -gt 0 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0225 /etc/login.defs PASS_MAX_DAYS is $VAL (chage --maxdays 90)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0225 /etc/login.defs PASS_MAX_DAYS is ${VAL:-"Not set"} (should be 1-90)"
fi
	
# TWGCB-01-012-0226 帳號停用天數 (INACTIVE)
VAL=$(awk -F= '/^[[:space:]]*INACTIVE/ {gsub(/[[:space:]]/,"",$2); print $2}' /etc/default/useradd | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -gt 0 ] && [ "$VAL" -le 30 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0226 useradd INACTIVE is $VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0226 useradd INACTIVE is ${VAL:-"Not set"} (useradd -D -f 30)"
fi
	
# TWGCB-01-012-0227 登入失敗延遲時間 (FAIL_DELAY)
VAL=$(grep -E "^\s*FAIL_DELAY" "/etc/login.defs" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 4 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0227 /etc/login.defs FAIL_DELAY is $VAL (>= 4)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0227 /etc/login.defs FAIL_DELAY is ${VAL:-"Not set"} (should be >= 4)"
fi
	
# TWGCB-01-012-0228 建立使用者家目錄 (CREATE_HOME)
VAL=$(grep -E "^\s*CREATE_HOME" "/etc/login.defs" | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -n1)
if [ "$VAL" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0228 /etc/login.defs CREATE_HOME is $VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0228 /etc/login.defs CREATE_HOME is ${VAL:-"Not set"} (should be yes)"
fi


# TWGCB-01-012-0229：檢查 sudoers 是否限制 NOPASSWD
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0229.log"
# 使用 grep -E 檢查非註解行是否包含免密碼設定
# 注意：這裡也檢查 /etc/sudoers.d/ 下的檔案，這更符合 RHEL 9 實務
BAD_SUDO=$(grep -rEi '^[[:space:]]*[^#].*(nopasswd|!authenticate)' /etc/sudoers /etc/sudoers.d/ 2>/dev/null)

if [ -n "$BAD_SUDO" ]; then
    echo "[Issue] Insecure sudoers configuration found:" >> "$LOGFILE"
    echo "$BAD_SUDO" >> "$LOGFILE"
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0229 sudoers NOPASSWD issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0229 All sudo actions require authentication."
fi

	
# TWGCB-01-012-0230 限制帳號同時登入數量檢查
# 檢查是否設定 * hard maxlogins N (0 < N <= 10)
FILES=("/etc/security/limits.conf" /etc/security/limits.d/*.conf)
RESULT="KO"
FOUND_FILE=""
VALUE=""

for FILE in "${FILES[@]}"; do
    [ -f "$FILE" ] || continue
    LINE=$(grep -E "^\s*\*\s+hard\s+maxlogins\s+[0-9]+" "$FILE" 2>/dev/null)
    if [[ -n "$LINE" ]]; then
        VALUE=$(echo "$LINE" | awk '{print $4}')
        if [[ "$VALUE" =~ ^[0-9]+$ && "$VALUE" -gt 0 && "$VALUE" -le 10 ]]; then
            RESULT="OK"
            FOUND_FILE="$FILE"
            break
        fi
    fi
done

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0230 maxlogins 設定為 $VALUE (0 < N ≤ 10) 於 $FOUND_FILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0230 未設定或設定值不符 (應為 * hard maxlogins N，0 < N ≤ 10)"
fi

# TWGCB-01-012-0231 檢查 kbd.x86_64 套件是否已安裝	
	if rpm -q kbd.x86_64 >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0231 kbd.x86_64 are installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0231 kbd.x86_64 not installed"
	fi

# TWGCB-01-012-0232 檢查 GNOME 螢幕保護鎖定設定
# 判斷是否為桌面環境
	if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
		# GNOME 桌面環境存在，檢查螢幕鎖定設定
		LOCK_ENABLED=$(dconf read /org/gnome/desktop/screensaver/lock-enabled 2>/dev/null)
		if [[ "$LOCK_ENABLED" == "true" ]]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0232 screensaver lock is enabled"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0232 screensaver lock is not enabled"
		fi
	else
		echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-012-0232: No GNOME desktop environment detected, skipping screensaver check."
	fi


# TWGCB-01-012-0233 检查 GNOME 使用者會談逾時設定
# 判斷是否為桌面環境
	if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
		# GNOME 桌面環境存在，檢查 idle-delay 設定
		SCREENSAVER_CONF="/etc/dconf/db/local.d/00-screensaver"
		IDLE_DELAY=$(grep -i '^idle-delay' "$SCREENSAVER_CONF" 2>/dev/null | awk -F ' ' '{print $2}')
		if [[ -n "$IDLE_DELAY" && "$IDLE_DELAY" -ge 900 ]]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0233 idle-delay is set to $IDLE_DELAY seconds"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0233 idle-delay not set or less than 900 seconds"
		fi
	else
		echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-012-0233 No GNOME desktop environment detected, skipping session idle-delay check."
	fi


# TWGCB-01-012-0234 檢查 GNOME 自動登入設定
GDM_CONF="/etc/gdm/custom.conf"
if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
    if [ -f "$GDM_CONF" ]; then
        AUTOLOGIN=$(grep -E '^\s*AutomaticLoginEnable' "$GDM_CONF" 2>/dev/null | awk -F= '{gsub(/ /,"",$2); print tolower($2)}')
        if [[ "$AUTOLOGIN" == "false" ]]; then
            echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0234 AutomaticLoginEnable is set to false in $GDM_CONF"
        else
            echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0234 AutomaticLoginEnable is not set to false (or missing) in $GDM_CONF"
        fi
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0234 $GDM_CONF not found"
    fi
else
    echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-012-0234: No GNOME desktop environment detected, skipping auto-login check."
fi


# TWGCB-01-012-0235 檢查系統帳號是否設為 nologin 並鎖定 (不含 root, sync, shutdown, halt)
UID_MIN=$(awk '/^\s*UID_MIN/ {print $2; exit}' /etc/login.defs)
# fallback
[ -z "$UID_MIN" ] && UID_MIN=1000

NOLOGIN_PATH="$(which nologin 2>/dev/null || echo /sbin/nologin)"
# some systems use /usr/sbin/nologin or /sbin/nologin; which will give correct path

EXCLUDE='^(root|sync|shutdown|halt)$'

bad_shell_users=()
unlocked_users=()

while IFS=: read -r user x uid gid gecos home shell; do
    # skip plus entries and exclude list
    [[ "$user" =~ ^\+ ]] && continue
    [[ "$user" =~ $EXCLUDE ]] && continue
    # uid numeric check
    if [[ "$uid" -lt "$UID_MIN" ]]; then
        # only consider accounts that are not using nologin/false
        if [[ "$shell" != "$NOLOGIN_PATH" && "$shell" != "/bin/false" && "$shell" != "/sbin/nologin" ]]; then
            bad_shell_users+=("$user:$shell")
        fi
        # check lock state via passwd -S
        POUT=$(passwd -S "$user" 2>/dev/null)
        if [[ -z "$POUT" ]]; then
            # if passwd -S not available or user special, consider unlocked
            unlocked_users+=("$user:unknown")
        else
            state=$(echo "$POUT" | awk '{print $2}')
            # Accept L or LK as locked
            if [[ "$state" != "L" && "$state" != "LK" ]]; then
                unlocked_users+=("$user:$state")
            fi
        fi
    fi
done < /etc/passwd

if [ ${#bad_shell_users[@]} -eq 0 ] && [ ${#unlocked_users[@]} -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0235 system accounts use nologin/false and are locked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0235 issues found:"
    if [ ${#bad_shell_users[@]} -gt 0 ]; then
        echo "  - Accounts with non-nologin shells:"
        for i in "${bad_shell_users[@]}"; do echo "      $i"; done
    fi
    if [ ${#unlocked_users[@]} -gt 0 ]; then
        echo "  - Accounts not locked (passwd -S state):"
        for i in "${unlocked_users[@]}"; do echo "      $i"; done
    fi
fi


# TWGCB-01-012-0236 檢查 Bash shell 閒置自動登出設定 (TMOUT >= 900)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0236.log"
FILES=("/etc/bashrc" "/etc/profile" /etc/profile.d/*.sh)
TMOUT_FOUND=0
TMOUT_VAL=""

for FILE in "${FILES[@]}"; do
    [ ! -f "$FILE" ] && continue
    
    # 1. 抓取是否有 readonly TMOUT=數字 (不限行首，相容 if 縮排)
    # 2. 抓取是否有 export TMOUT
    LINE=$(grep -E 'readonly\s+TMOUT=[0-9]+' "$FILE")
    EXPORT_CHK=$(grep -E 'export\s+TMOUT' "$FILE")
    
    if [[ -n "$LINE" && -n "$EXPORT_CHK" ]]; then
        # 提取數字
        TMOUT_VAL=$(echo "$LINE" | grep -oE '[0-9]+')
        
        # 判斷是否符合 900 秒以下 (GCB 規範)
        if [[ "$TMOUT_VAL" -le 900 && "$TMOUT_VAL" -gt 0 ]]; then
            TMOUT_FOUND=1
            FOUND_FILE="$FILE"
            break
        fi
    fi
done

if [ "$TMOUT_FOUND" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0236 Found TMOUT=$TMOUT_VAL in $FOUND_FILE"
else

cat << 'EOF1' > "$LOGFILE"
# 使用以下指令修復 TMOUT 設定：
cat << 'EOF' > /etc/profile.d/TWGCB.sh
#!/bin/bash
# TWGCB-01-012-0236: Set Bash shell timeout to 900 seconds
if [ -n "$PS1" ]; then
    readonly TMOUT=900 ; export TMOUT
fi
EOF
chmod 644 /etc/profile.d/TWGCB.sh
EOF1
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0236 TMOUT not found or > 900s.(see $LOGFILE)"
fi


	
# TWGCB-01-012-0237 檢查防止修改 GUI 設定 (dconf locks)
LOCK_FILE="/etc/dconf/db/local.d/locks/session"
REQUIRED_KEYS=(
    "/org/gnome/desktop/session/idle-delay"
    "/org/gnome/desktop/screensaver/lock-enabled"
    "/org/gnome/desktop/screensaver/lock-delay"
    "/org/gnome/desktop/lockdown/disable-lock-screen"
)

# 判斷是否為 GNOME 桌面環境
if command -v gnome-shell >/dev/null 2>&1 || [ -d /usr/share/gnome-shell ]; then
	if [ ! -f "$LOCK_FILE" ]; then
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0237 Lock file not found ($LOCK_FILE)"
	else
		missing_keys=()
		for key in "${REQUIRED_KEYS[@]}"; do
			if ! grep -qx "$key" "$LOCK_FILE" 2>/dev/null; then
				missing_keys+=("$key")
			fi
		done
		if [ ${#missing_keys[@]} -eq 0 ]; then
			echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0237 All GUI settings are locked as required"
		else
			echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0237 Missing lock entries in $LOCK_FILE:"
		for key in "${missing_keys[@]}"; do
			echo "   - $key"
		done
		fi
	fi
	else
	echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-012-0237 No GNOME desktop environment detected, skipping GUI lock check."
fi

# TWGCB-01-012-0238 檢查 root 帳號之主要群組 GID，root 帳號所屬群組必須為 GID 0。 
# 修復指令：將 root 的主要群組設回 GID 0 
FIX_COMMAND="usermod -g 0 root"
# --- 核心檢查邏輯 ---
# 1. id -g root : 取得 root 帳號的 Primary Group GID
CURRENT_GID=$(id -g root 2>/dev/null)
if [ "$CURRENT_GID" == "0" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0238 root primary group is GID 0."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0238 root GID error: '$CURRENT_GID' (Expected: 0). ($FIX_COMMAND)"
fi

# TWGCB-01-012-0239 檢查預設 umask 設定
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0239.log"
TARGET_FILES=("/etc/profile" "/etc/bashrc" /etc/profile.d/*.sh)
RESULT="KO"
FOUND_FILE=""
for FILE in "${TARGET_FILES[@]}"; do
    if grep -Eq '^\s*umask\s+0*27' "$FILE" 2>/dev/null; then
        RESULT="OK"
        FOUND_FILE="$FILE"
        break
    fi
done

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0239 umask 027 found in $FOUND_FILE"
else
cat << 'EOF1' > "$LOGFILE"
# 使用以下指令修復 umask 設定：
# TWGCB-01-012-0239: Set global default umask for Login Shells
# Setting umask to 027 (Owner: rwx, Group: r-x, Others: ---)
if [[ $(id -g) -gt 999 ]] ; then
    umask 027
else
    # 對於 UID/GID 小於 1000 的系統帳號，保留更嚴格的 077
    umask 077
fi
EOF
chmod 644 /etc/profile.d/TWGCB.sh
EOF1
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0239 umask 027 not properly set in /etc/profile, /etc/bashrc, or /etc/profile.d/*.sh"
fi
	
# TWGCB-01-012-0240 檢查 /etc/login.defs 的預設 UMASK，UMASK 應設為 027 或更嚴格 (如 077) 。
# --- 變數定義 ---
FILE="/etc/login.defs"
REQUIRED_UMASK="027"
# 修復指令：直接修改檔案中的 UMASK 設定 
FIX_COMMAND="sed -i 's/^\s*UMASK\s\+[0-9]\+/UMASK 027/' $FILE"

# --- 核心檢查邏輯 ---
# 1. 抓取 UMASK 行且排除註解
# 2. 提取數值並檢查是否符合 027 
CURRENT_UMASK=$(grep -iE '^\s*UMASK' "$FILE" 2>/dev/null | awk '{print $2}')

if [[ "$CURRENT_UMASK" == "027" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0240 UMASK in $FILE is correctly set to $CURRENT_UMASK."
else
    # 針對權限數值，我們通常要求精確匹配規範的 027
    VALUE="${CURRENT_UMASK:-Not Set}"
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0240 UMASK error: current is '$VALUE' (Expected: 027). ($FIX_COMMAND)"
fi
	
# TWGCB-01-012-0241 檢查是否限制 su 指令僅允許 wheel 群組成員使用
PAM_FILE="/etc/pam.d/su"
GROUP_FILE="/etc/group"
RESULT="OK"
ISSUES=()

# 檢查 pam_wheel.so 是否啟用
if grep -Eq '^\s*auth\s+required\s+pam_wheel\.so\s+use_uid' "$PAM_FILE"; then
    PAM_STATUS="OK"
else
    PAM_STATUS="KO"
    ISSUES+=("pam_wheel.so use_uid not enabled in $PAM_FILE")
fi

# 檢查 wheel 群組是否存在
if grep -q '^wheel:' "$GROUP_FILE"; then
    WHEEL_LINE=$(grep '^wheel:' "$GROUP_FILE")
    # 取出群組成員
    MEMBERS=$(echo "$WHEEL_LINE" | awk -F: '{print $4}')
    if [[ -z "$MEMBERS" ]]; then
        ISSUES+=("wheel group exists but has no members")
    else
        # 確認 root 在裡面
        if echo "$MEMBERS" | grep -qw "root"; then
            GROUP_STATUS="OK"
        else
            GROUP_STATUS="KO"
            ISSUES+=("root not in wheel group members")
        fi
    fi
else
    GROUP_STATUS="KO"
    ISSUES+=("wheel group not found in $GROUP_FILE")
fi

# 輸出結果
if [ ${#ISSUES[@]} -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0241 su restricted to wheel group (pam_wheel.so use_uid enabled, wheel group: $MEMBERS)"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0241 misconfiguration detected:"
    for issue in "${ISSUES[@]}"; do
        echo "   - $issue"
    done
fi	

# TWGCB-01-012-0242 檢查 firewalld 套件是否已安裝	
	if rpm -q firewalld >/dev/null 2>&1; then
		echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0242 firewalld is installed"
	else
		echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0242 firewalld is NOT installed"
	fi

	
	if systemctl is-active --quiet firewalld; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0243 firewalld service is active"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0243 firewalld service is NOT active"
    fi
	

# TWGCB-01-012-0244 檢查 iptables 與 ip6tables 是否已 mask
SERVICES=("iptables" "ip6tables")
RESULT="OK"
BAD_LIST=()

for svc in "${SERVICES[@]}"; do
    if ! systemctl is-enabled --quiet "$svc" 2>/dev/null; then
        # 如果不是 masked，用文字讀取實際狀態
        state=$(systemctl is-enabled "$svc" 2>/dev/null)
        if [[ "$state" != "masked" ]]; then
            RESULT="KO"
            BAD_LIST+=("$svc")
        fi
    fi
done

# 輸出結果
if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0244 iptables & ip6tables are masked"
else
    bad=$(printf "%s " "${BAD_LIST[@]}")
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0244 These services are NOT masked(systemctl --now mask $bad)"
fi


# TWGCB-01-012-0245 檢查 nftables 服務是否停用並遮蔽
SERVICE="nftables"
state=$(systemctl is-enabled "$SERVICE" 2>&1)

# 正確狀態必須是 masked
if [[ "$state" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0245 $SERVICE service is masked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0245 $SERVICE service is NOT masked(systemctl --now mask $SERVICE)"
fi
	
	
# TWGCB-01-012-0246 檢查 firewalld 預設區域設定
RESULT="KO"
# 確認 firewalld 是否存在
if systemctl list-unit-files | grep -q "^firewalld\.service"; then
    if systemctl is-active firewalld >/dev/null 2>&1; then
        DEFAULT_ZONE=$(firewall-cmd --get-default-zone 2>/dev/null)
        if [[ "$DEFAULT_ZONE" == "public" ]]; then
            RESULT="OK"
        fi
    else
        echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-012-0246 firewalld 未啟用，無法檢查預設區域"
        exit 0
    fi
else
    echo -e " [\e[1;33mN/A\e[0m] TWGCB-01-012-0246 firewalld 未安裝"
    exit 0
fi

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0246 firewalld 預設區域已設定為 public"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0246 firewalld 預設區域未設定為 public，請執行： firewall-cmd --set-default-zone=public"
fi
	

# TWGCB-01-012-0247：檢查 nftables 服務狀態與 firewalld 衝突
NFT_ACT=$(systemctl is-active --quiet nftables && echo "active" || echo "inactive")
FWD_ACT=$(systemctl is-active --quiet firewalld && echo "active" || echo "inactive")

if [ "$NFT_ACT" == "active" ]; then
    if [ "$FWD_ACT" == "active" ]; then
        # 狀況：兩者都啟用 (衝突)
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-008-0249 nftables service is active but need to mask firewalld (systemctl --now mask firewalld)"
    else
        # 狀況：只有 nftables 啟用 (合規)
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0249 nftables service is active"
    fi
else
    if [ "$FWD_ACT" == "active" ]; then
        # 狀況：nftables 未啟動但 firewalld 啟動
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0247 nftables service is NOT active(but firewalld is active)"
    else
        # 狀況：兩者都沒啟動
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0247 nftables service is NOT active(systemctl --now enable nftables)"
    fi
fi	
	
# TWGCB-01-012-0248 檢查 firewalld 服務是否停用並遮蔽
SERVICE="firewalld"
state=$(systemctl is-enabled "$SERVICE" 2>&1)

# 正確狀態必須是 masked
if [[ "$state" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0248 $SERVICE service is masked"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0248 $SERVICE service is NOT masked(systemctl --now mask $SERVICE)"
fi


# TWGCB-01-012-0249：檢查是否已建立 nftables 表
# 邏輯：檢查 nft list tables 的輸出是否為空
NFT_TABLES=$(nft list tables 2>/dev/null)
if [ -z "$NFT_TABLES" ]; then
    # 若輸出為空，代表未建立任何表
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0249 No nftables tables found. Nftables is not configured."
else
    # 若有輸出，代表已建立表 (符合基準)
    # 將找到的表列名稍微整理，顯示在後方供參考
    TABLE_NAMES=$(echo "$NFT_TABLES" | awk '{print $2}' | xargs | tr ' ' ',')
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0249 nftables tables detected ($TABLE_NAMES)."
fi
	
# TWGCB-01-012-0250：檢查是否已建立 nftables 鏈
# 邏輯：檢查 nft list chains 的輸出是否為空
NFT_CHAINS=$(nft list chains 2>/dev/null)
if [ -z "$NFT_CHAINS" ]; then
    # 若輸出為空，代表未定義任何鏈
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0250 No nftables chains found."
else
    # 若有輸出，代表已建立鏈
    # 統計鏈的數量並列出，方便參考
    CHAIN_COUNT=$(echo "$NFT_CHAINS" | grep -c "chain")
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0250 nftables chains detected (Total: $CHAIN_COUNT)."
fi

# TWGCB-01-012-0251：檢查 nftables 迴路介面規則
NFT_RULES=$(nft list ruleset 2>/dev/null)
# 1. 檢查是否接受 lo 介面流量
CHECK_LO=$(echo "$NFT_RULES" | grep -q "iif \"lo\" accept" && echo "OK")
# 2. 檢查是否阻擋 127.0.0.0/8 偽冒 (不論是否有 counter)
CHECK_V4=$(echo "$NFT_RULES" | grep "ip saddr 127.0.0.0/8" | grep -q "drop" && echo "OK")
# 3. 檢查是否阻擋 ::1 偽冒 (不論是否有 counter)
CHECK_V6=$(echo "$NFT_RULES" | grep "ip6 saddr ::1" | grep -q "drop" && echo "OK")

if [ -z "$NFT_RULES" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0251 Nftables ruleset is empty."
elif [ "$CHECK_LO" == "OK" ] && [ "$CHECK_V4" == "OK" ] && [ "$CHECK_V6" == "OK" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0251 Loopback traffic rules are correctly set."
else
    # 簡潔地列出缺失項目
    MISSING=""
    [ "$CHECK_LO" != "OK" ] && MISSING+="lo_accept "
    [ "$CHECK_V4" != "OK" ] && MISSING+="v4_drop "
    [ "$CHECK_V6" != "OK" ] && MISSING+="v6_drop "
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0251 Loopback rules missing: [ $MISSING]"
fi


# TWGCB-01-012-0252：檢查 nftables 預設政策是否為 drop (input/forward/output)
# 邏輯：檢查 inet filter 表下的三個基本鏈是否都具備 policy drop
NFT_RULES=$(nft list ruleset 2>/dev/null)
# 分別檢查 input, forward, output 的政策
CHECK_INPUT=$(echo "$NFT_RULES" | grep -A 5 "chain input" | grep "policy drop")
CHECK_FORWARD=$(echo "$NFT_RULES" | grep -A 5 "chain forward" | grep "policy drop")
CHECK_OUTPUT=$(echo "$NFT_RULES" | grep -A 5 "chain output" | grep "policy drop")
if [ -z "$NFT_RULES" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0252 Nftables ruleset is empty."
elif [ -n "$CHECK_INPUT" ] && [ -n "$CHECK_FORWARD" ] && [ -n "$CHECK_OUTPUT" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0252 All base chains (input/forward/output) policy set to drop."
else
    # 找出具體是哪一個鏈沒設好，顯示在畫面上
    MISSING=""
    [ -z "$CHECK_INPUT" ] && MISSING+="input "
    [ -z "$CHECK_FORWARD" ] && MISSING+="forward "
    [ -z "$CHECK_OUTPUT" ] && MISSING+="output "
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0252 Missing 'policy drop' on: $MISSING"
fi
		
	
# TWGCB-01-012-0253：檢查 nftables.conf 是否取消 include 註解
# 邏輯：檢查 /etc/sysconfig/nftables.conf 中是否存在未被註解的 include 語句
NFT_CONF="/etc/sysconfig/nftables.conf"
if [ ! -f "$NFT_CONF" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0253 $NFT_CONF does not exist."
elif grep -qE '^include' "$NFT_CONF"; then
    # 找到以 include 開頭的行（代表已取消註解）
    INCLUDE_PATH=$(grep -E '^include' "$NFT_CONF" | awk '{print $2}' | tr -d '"')
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0253 nftables is set to include ruleset: $INCLUDE_PATH"
else
    # 沒找到 include 或被註解了 (#include)
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0253 nftables ruleset include is commented out or missing."
fi


	
# TWGCB-01-012-0254 檢查 sshd 服務是否啟用並執行中
if systemctl list-unit-files | grep -q "^sshd\.service"; then
    ACTIVE_STATE=$(systemctl is-active sshd 2>/dev/null)
    ENABLED_STATE=$(systemctl is-enabled sshd 2>/dev/null)

    if [[ "$ACTIVE_STATE" == "active" && "$ENABLED_STATE" == "enabled" ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0254 sshd 服務已啟用並正在執行"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0254 sshd 服務未正確啟用或未執行，建議執行： systemctl --now enable sshd.service"
    fi
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0254 系統未安裝 openssh-server 套件，請執行： dnf install -y openssh-server"
fi
	
# TWGCB-01-012-0255：檢查 SSH 服務使用協定版本
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0255.log"
# 1. 檢查主設定檔或子設定檔是否明確寫入 Protocol 2
# 考慮到 RHEL 9 建議寫法，我們檢查是否存在這行 (不論有無空格)
if ! grep -riq "^\s*Protocol\s*2" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/ 2>/dev/null; then
    echo "[Issue] /etc/ssh/sshd_config: Missing 'Protocol 2' as required by GCB document." >> "$LOGFILE"
    echo "Fix Suggestion: echo 'Protocol 2' >> /etc/ssh/sshd_config && systemctl restart sshd" >> "$LOGFILE"
fi

# 2. 同時確保沒有人寫 Protocol 1 (安全加固)
if grep -riq "^\s*Protocol\s*1" /etc/ssh/sshd_config /etc/ssh/sshd_config.d/ 2>/dev/null; then
    echo "[Issue] Insecure 'Protocol 1' detected!" >> "$LOGFILE"
fi

# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0255 SSH Protocol 2 check failed (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0255 SSH Protocol 2 is correctly configured."
fi

cramfs01=$(ls -l /etc/ssh/sshd_config | awk '{print $3 ":" $4}')
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0256 Check /etc/ssh/sshd_config is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0256 no root:root"
    fi

	
# TWGCB-01-012-0257 檢查 /etc/ssh/sshd_config 權限設定
SSHD_CONF="/etc/ssh/sshd_config"

if [ ! -f "$SSHD_CONF" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0257 找不到 $SSHD_CONF"
    exit 1
fi

PERM=$(stat -c "%a" "$SSHD_CONF")
# 600 或更嚴格 (如 400)
if [ "$PERM" -le 600 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0257 $SSHD_CONF permission is $PERM"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0257 $SSHD_CONF permission is $PERM, should be 600 or lower"
fi


# TWGCB-01-012-0258 檢查 SSH 存取限制設定 (AllowUsers/AllowGroups/DenyUsers/DenyGroups)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0258.log"
# 1. 使用 sshd -T 取得目前系統真正生效的存取控制參數
# 我們檢查這四個關鍵字，並確保後方有跟隨具體的數值
MATCHES=$(sshd -T 2>/dev/null | grep -Ei '^(allowusers|allowgroups|denyusers|denygroups)\s+.+')
if [ -n "$MATCHES" ]; then
    # 將所有找到的限制指令合併成一行顯示，方便維運人員確認
    # 例如：allowgroups wheel, allowusers admin
    RESULT_VAL=$(echo "$MATCHES" | xargs | sed 's/ /, /g')
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0258 SSH access restriction is active: $RESULT_VAL"
else
    # 2. 若完全沒有限制設定，則寫入 Log 並顯示 KO
    {
        echo "Check failed on $(date)"
        echo "Reason: No active SSH access control keywords found."
        echo "Requirement: At least one of the following must be set:"
        echo "  - AllowUsers"
        echo "  - AllowGroups"
        echo "  - DenyUsers"
        echo "  - DenyGroups"
    } > "$LOGFILE"
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0258 Missing SSH access restrictions. (See $LOGFILE)"
fi
	
# TWGCB-01-012-0259：檢查 SSH 主機私鑰檔案擁有者與群組
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0259.log"

# 1. 搜尋所有私鑰檔案並檢查其擁有者與群組 (應為 root:root)
# 使用 find 找出所有私鑰檔案，排除 .pub 公鑰
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' | while read -r KEY_FILE; do
    OWNER_GROUP=$(stat -c "%U:%G" "$KEY_FILE")
    if [ "$OWNER_GROUP" != "root:ssh_keys" ]; then
        echo "[Issue] $KEY_FILE: current owner:group is $OWNER_GROUP (Expected: root:ssh_keys)" >> "$LOGFILE"
        echo "Fix: chown root:ssh_keys $KEY_FILE" >> "$LOGFILE"
    fi
done

# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0259 SSH private key ownership issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0259 All SSH host private keys owned by root:ssh_keys."
fi
	
# TWGCB-01-012-0260：檢查 SSH 主機私鑰檔案權限 (應為 600)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0260.log"
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' | while read -r KEY_FILE; do
    PERM=$(stat -c "%a" "$KEY_FILE")
    if [ "$PERM" != "600" ]; then
        echo "[Issue] $KEY_FILE: current permission is $PERM (Expected: 600)" >> "$LOGFILE"
		echo "Fix: chmod 600 $KEY_FILE" >> "$LOGFILE"
    fi
done

if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0260 SSH private key permission issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0260 All SSH host private keys permissions are 600."
fi
	
# TWGCB-01-012-0261 SSH 公鑰擁有者
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0261.log"
PUB_KEYS=$(find /etc/ssh -maxdepth 1 -type f -name "ssh_host_*_key.pub")
ERROR_COUNT=0
for key in $PUB_KEYS; do
    OWNER=$(stat -c "%U:%G" "$key")
    if [ "$OWNER" != "root:root" ]; then
        ((ERROR_COUNT++))
        echo "chown root:root $key" >> "$LOGFILE"
    fi
done
if [ "$ERROR_COUNT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0261 SSH public keys ownership is correct."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0261 $ERROR_COUNT keys have wrong ownership. See $LOGFILE"
fi
	
# TWGCB-01-012-0262：檢查 SSH 主機公鑰檔案權限
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0262.log"

# 1. 搜尋所有公鑰檔案並檢查權限
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' | while read -r PUB_FILE; do
    PERM=$(stat -c "%a" "$PUB_FILE")
    
    # 只要權限數字大於 644 (例如 664, 666, 755)，就視為不合規
    if [ "$PERM" -gt 644 ]; then
        echo "[Issue] $PUB_FILE: permission is $PERM (Expected: 644 or less)" >> "$LOGFILE"
        echo "Fix: chmod 644 $PUB_FILE" >> "$LOGFILE"
    fi
done
# --- 輸出結果 ---
if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0262 SSH public key permission issue (see $LOGFILE)"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0262 All SSH host public keys permissions are 644 or less."
fi

# TWGCB-01-012-0263 檢查 SSH 加密演算法設定
RESULT="KO"
# 官方建議設定
RECOMMENDED_CIPHERS="aes128-ctr,aes192-ctr,aes256-ctr"
RECOMMENDED_MACS="hmac-sha2-512,hmac-sha2-256"
RECOMMENDED_KEX="ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512"

# 使用 sshd -T 擷取最終生效值
CIPHERS=$(sshd -T 2>/dev/null | grep '^ciphers ' | awk '{$1=""; print $0}' | tr -d '[:space:]')
MACS=$(sshd -T 2>/dev/null | grep '^macs ' | awk '{$1=""; print $0}' | tr -d '[:space:]')
KEX=$(sshd -T 2>/dev/null | grep '^kexalgorithms ' | awk '{$1=""; print $0}' | tr -d '[:space:]')

# 比對是否完全符合建議
if [[ "$CIPHERS" == "$RECOMMENDED_CIPHERS" ]] && \
   [[ "$MACS" == "$RECOMMENDED_MACS" ]] && \
   [[ "$KEX" == "$RECOMMENDED_KEX" ]]; then
    RESULT="OK"
fi

# 輸出結果
if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0263 SSH encryption algorithms are correctly configured"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0263 SSH encryption algorithms are missing or misconfigured"
fi

	
# TWGCB-01-012-0264 檢查 SSH LogLevel (使用系統運行參數)
# 使用 sshd -T 取得實際生效的 LogLevel，並轉為大寫
CURRENT_VAL=$(sshd -T 2>/dev/null | grep -i '^loglevel ' | awk '{print $2}' | tr '[:lower:]' '[:upper:]')

if [[ "$CURRENT_VAL" == "VERBOSE" || "$CURRENT_VAL" == "INFO" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0264 LogLevel is $CURRENT_VAL"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0264 LogLevel is incorrect. (need LogLevel VERBOSE or LogLevel INFO)"
fi
	
# TWGCB-01-012-0265 X11Forwarding (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^x11forwarding ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0265 X11Forwarding is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0265 X11Forwarding should be set to 'no'.(need X11Forwarding no)"
fi
	
# TWGCB-01-012-0266 MaxAuthTries (應為 4)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^maxauthtries ' | awk '{print $2}')
if [ "$CURRENT" == "4" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0266 MaxAuthTries is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0266 MaxAuthTries should be set to '4'.(need MaxAuthTries 4)"
fi
	
# TWGCB-01-012-0267 IgnoreRhosts (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^ignorerhosts ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0267 IgnoreRhosts is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0267 IgnoreRhosts should be set to 'yes'.(need IgnoreRhosts yes)"
fi
	
# TWGCB-01-012-0268 HostbasedAuthentication (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^hostbasedauthentication ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0268 HostbasedAuthentication is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0268 HostbasedAuthentication should be set to 'no'.(need HostbasedAuthentication no)"
fi
	
# TWGCB-01-012-0269 PermitRootLogin (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^permitrootlogin ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0269 PermitRootLogin is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0269 PermitRootLogin should be set to 'no'.(need PermitRootLogin no)"
fi
	
# TWGCB-01-012-0270 PermitEmptyPasswords (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^permitemptypasswords ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0270 PermitEmptyPasswords is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0270 PermitEmptyPasswords should be set to 'no'.(need PermitEmptyPasswords no)"
fi
	
# TWGCB-01-012-0271 PermitUserEnvironment (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^permituserenvironment ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0271 PermitUserEnvironment is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0271 PermitUserEnvironment should be set to 'no'.(need PermitUserEnvironment no)"
fi


# TWGCB-01-012-0272 檢查 SSH 閒置逾時 (0 < Interval <= 600, CountMax = 1)
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0272.log"
# 使用 sshd -T 取得實際生效值
INTERVAL=$(sshd -T 2>/dev/null | grep -i '^clientaliveinterval ' | awk '{print $2}')
COUNTMAX=$(sshd -T 2>/dev/null | grep -i '^clientalivecountmax ' | awk '{print $2}')

# 判斷邏輯：Interval 必須 > 0 且 <= 600，同時 CountMax 必須為 1
if [[ "$INTERVAL" -gt 0 && "$INTERVAL" -le 600 && "$COUNTMAX" == "1" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0272 SSH Timeout is secure: Interval=$INTERVAL, CountMax=$COUNTMAX"
else
    # 不符合時才寫入日誌
    > "$LOGFILE"
    echo "SSH Idle Timeout Configuration Issue" >> "$LOGFILE"
    echo "Current settings: ClientAliveInterval=$INTERVAL, ClientAliveCountMax=$COUNTMAX" >> "$LOGFILE"
    echo "Requirement: 0 < ClientAliveInterval <= 600 AND ClientAliveCountMax = 1" >> "$LOGFILE"
    
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0272 SSH Timeout error (Current: ${INTERVAL}/${COUNTMAX}). (see $LOGFILE)"
fi

# TWGCB-01-012-0273 LoginGraceTime (應為 60)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^logingracetime ' | awk '{print $2}')
if [ "$CURRENT" == "60" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0273 LoginGraceTime is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0273 LoginGraceTime should be set to '60'.(need LoginGraceTime 60)"
fi

# TWGCB-01-012-0274 UsePAM (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^usepam ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0274 UsePAM is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0274 UsePAM should be set to 'yes'.(need UsePAM yes)"
fi

# TWGCB-01-012-0275 AllowTcpForwarding (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^allowtcpforwarding ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0275 AllowTcpForwarding is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0275 AllowTcpForwarding should be set to 'no'.(need AllowTcpForwarding no)"
fi

# TWGCB-01-012-0276 MaxStartups (應為 10:30:60)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^maxstartups ' | awk '{print $2}')
if [ "$CURRENT" == "10:30:60" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0276 MaxStartups is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0276 MaxStartups should be set to '10:30:60'.(need MaxStartups 10:30:60)"
fi

# TWGCB-01-012-0277 MaxSessions (應為 4)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^maxsessions ' | awk '{print $2}')
if [ "$CURRENT" == "4" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0277 MaxSessions is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0277 MaxSessions should be set to '4'.(need MaxSessions 4)"
fi

# TWGCB-01-012-0278 StrictModes (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^strictmodes ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0278 StrictModes is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0278 StrictModes should be set to 'yes'.(need StrictModes yes)"
fi

# TWGCB-01-012-0279 Compression (應為 no)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^compression ' | awk '{print $2}')
if [ "$CURRENT" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0279 Compression is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0279 Compression should be set to 'no'.(need Compression no)"
fi

# TWGCB-01-012-0280 IgnoreUserKnownHosts (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^ignoreuserknownhosts ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0280 IgnoreUserKnownHosts is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0280 IgnoreUserKnownHosts should be set to 'yes'.(need IgnoreUserKnownHosts yes)"
fi

# TWGCB-01-012-0281 PrintLastLog (應為 yes)
CURRENT=$(sshd -T 2>/dev/null | grep -i '^printlastlog ' | awk '{print $2}')
if [ "$CURRENT" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0281 PrintLastLog is $CURRENT"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0281 PrintLastLog should be set to 'yes'.(need PrintLastLog yes)"
fi


####TWGCB-01-012-0282	
FILES=$(find / -name "shosts.equiv" 2>/dev/null)

if [ -z "$FILES" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0282 no shosts.equiv files found"
else
    while IFS= read -r FILE; do
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0282 shosts.equiv exists: $FILE(find / -name 'shosts.equiv')"
    done <<< "$FILES"
fi

####TWGCB-01-012-0283
FILES=$(find / -name "*.shosts" 2>/dev/null)

if [ -z "$FILES" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0283 no .shosts files found"
else
    while IFS= read -r FILE; do
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0283 .shosts file exists: $FILE(find / -name '*.shosts')"
    done <<< "$FILES"
fi


####TWGCB-01-012-0284
CFG="/etc/sysconfig/sshd"
if [ ! -f "$CFG" ]; then
    # 如果檔案不存在，視為 OK（沒有覆寫）
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0284 $CFG not found (no override)"
else
    # 檢查是否有未註解的 CRYPTO_POLICY
    if grep -qE '^\s*CRYPTO_POLICY\s*=' "$CFG"; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0284 CRYPTO_POLICY override is enabled"
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0284 CRYPTO_POLICY override is disabled"
    fi
fi	
	
	

#20250426 ADD 30 Option###########################################################################################################################################

if grep -q "install freevxfs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist freevxfs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0285 freevxfs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0285 freevxfs module is not disabled"
fi 

if grep -q "install hfs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist hfs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0286 hfs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0286 hfs module is not disabled"
fi 

if grep -q "install hfsplus /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist hfsplus" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0287 hfsplus module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0287 hfsplus module is not disabled"
fi 

if grep -q "install jffs2 /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist jffs2" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0288 jffs2 module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0288 jffs2 module is not disabled"
fi 

if grep -q "install afs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist afs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0289 afs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0289 afs module is not disabled"
fi 

if grep -q "install ceph /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist ceph" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0290 ceph module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0290 ceph module is not disabled"
fi 

if grep -q "install cifs /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist cifs" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0291 cifs module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0291 cifs module is not disabled"
fi 

if grep -q "install exfat /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist exfat" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0292 exfat module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0292 exfat module is not disabled"
fi 

if grep -q "install ext /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist ext" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0293 ext module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0293 ext module is not disabled"
fi 

if grep -q "install fat /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist fat" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0294 fat module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0294 fat module is not disabled"
fi 

if grep -q "install fscache /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist fscache" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0295 fscache module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0295 fscache module is not disabled"
fi 

if grep -q "install fuse /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist fuse" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0296 fuse module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0296 fuse module is not disabled"
fi 

if grep -q "install gfs2 /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist gfs2" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0297 gfs2 module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0297 gfs2 module is not disabled"
fi 

if grep -q "install nfs_common /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist nfs_common" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0298 nfs_common module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0298 nfs_common module is not disabled"
fi 

if grep -q "install nfsd /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist nfsd" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0299 nfsd module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0299 nfsd module is not disabled"
fi 

if grep -q "install smbfs_common /bin/true" /etc/modprobe.d/*.conf && grep -q "blacklist smbfs_common" /etc/modprobe.d/*.conf; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0300 smbfs_common module is disabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0300 smbfs_common module is not disabled"
fi 


cramfs01=$(ls -l /etc/shells | awk '{print $3 ":" $4}')
    if [ "$cramfs01" == "root:root" ] ; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0301 Check /etc/shells is root:root ok "
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0301 no root:root"
    fi


SSHTEST=$(stat -c '%a' /etc/shells)
    if [ $SSHTEST -le "644" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0302 /etc/shells Check is "$SSHTEST
    else
	echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0302 /etc/shells should be set to 644 或 以下'"
    fi

# TWGCB-01-012-0303 檢測 /etc/security/opasswd 與 opasswd.old 權限設定

files=("/etc/security/opasswd" "/etc/security/opasswd.old")
status_ok=true

for f in "${files[@]}"; do
    if [[ -e "$f" ]]; then
        owner=$(stat -c "%U" "$f")
        group=$(stat -c "%G" "$f")
        if [[ "$owner" != "root" || "$group" != "root" ]]; then
            status_ok=false
            break
        fi
    fi
done

if $status_ok; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0303 ownership configuration is correct"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0303 ownership configuration is incorrect"
fi

    
# TWGCB-01-012-0304 檢測 /etc/security/opasswd 與 opasswd.old 權限設定
files=("/etc/security/opasswd" "/etc/security/opasswd.old")
status_ok=true

for f in "${files[@]}"; do
    if [[ -e "$f" ]]; then
        perm=$(stat -c "%a" "$f")
        # 檢查是否 ≤ 644
        if (( perm > 644 )); then
            status_ok=false
            break
        fi
    fi
done

if $status_ok; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0304 permission configuration is correct"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0304 permission configuration is incorrect"
fi

 
# TWGCB-01-012-0305 檢查 /etc/shells 是否包含 nologin
# 規範要求：/etc/shells 內不應出現 nologin 路徑
# 查找 /etc/shells 中包含 nologin 的行（排除註解）
INVALID_SHELL=$(grep -E '^[^#].*nologin' /etc/shells)

if [ -z "$INVALID_SHELL" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0305 No nologin found in /etc/shells"
else
    # 格式化輸出錯誤的原因
    BAD_PATHS=$(echo "$INVALID_SHELL" | xargs | tr ' ' ',')
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0305 nologin should not be in /etc/shells. (Found: $BAD_PATHS)"
fi  
    
# TWGCB-01-012-0306 檢查 chronyd 是否禁止 root 執行
CONFIG_FILE="/etc/sysconfig/chronyd"
RESULT="KO"

if [ -f "$CONFIG_FILE" ]; then
    OPTIONS_LINE=$(grep -E '^\s*OPTIONS=' "$CONFIG_FILE")
    if [[ -n "$OPTIONS_LINE" && "$OPTIONS_LINE" != *"-u root"* ]]; then
        RESULT="OK"
    fi
fi

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0306 chronyd is not running as root"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0306 chronyd may run as root (-u root found or OPTIONS not set)"
fi     
    

# --- TWGCB-01-012-0307：ptrace 限制檢查 (兼顧生效與永久化) ---
PARAM="kernel.yama.ptrace_scope"
VAL=$(sysctl -n $PARAM 2>/dev/null)

# 1. 檢查當前值是否為 1
# 2. 檢查設定檔是否也有寫入 (確保重啟不失效)
if [[ "$VAL" == "1" ]] && grep -rE "^[[:space:]]*$PARAM[[:space:]]*=[[:space:]]*1" /etc/sysctl.conf /etc/sysctl.d/*.conf &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0307 $PARAM is active and persistent."
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0307 $PARAM is not properly set (Current: $VAL)."
fi


# TWGCB-01-012-0308 檢查 rsyslog logrotate 設定
LOG_DIR="/var/log/rsyslog"
LOG_ROTATE_FILE="/etc/logrotate.d/rsyslog"
RESULT="KO"

# 檢查目錄存在與權限
if [ -d "$LOG_DIR" ]; then
    PERM=$(stat -c "%a" "$LOG_DIR")
    if [[ "$PERM" -eq 750 ]]; then
        DIR_OK=true
    else
        DIR_OK=false
    fi
else
    DIR_OK=false
fi

# 檢查 logrotate 設定檔存在
if [ -f "$LOG_ROTATE_FILE" ]; then
    FILE_OK=true
else
    FILE_OK=false
fi

# 結果判斷
if [[ "$DIR_OK" == true && "$FILE_OK" == true ]]; then
    RESULT="OK"
fi

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0308 rsyslog logrotate is configured correctly"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0308 rsyslog logrotate is missing or misconfigured"
fi


# TWGCB-01-012-0309 檢查 root 預設 umask 設定
FILES=("/root/.bash_profile" "/root/.bashrc")
RESULT="KO"
FOUND_FILE=""

for FILE in "${FILES[@]}"; do
    [ ! -f "$FILE" ] && continue
    
    # 優化後的 grep：
    # 1. 確保行首非 # (非註解)
    # 2. 支援 027 或 27 (因為效果相同)
    # 3. 確保其後沒有跟隨其他數字
    if grep -qE '^[[:space:]]*umask[[:space:]]+0*27([[:space:]]*$|[[:space:]]+#)' "$FILE"; then
        RESULT="OK"
        FOUND_FILE="$FILE"
        break
    fi
done

if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0309 root umask is set to 027 in $FOUND_FILE"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0309 root umask 027 not found in /root/.bash_profile or /root/.bashrc"
fi

# TWGCB-01-012-0310 檢測 root unlock time
LOGFILE="$SCRIPT_DIR/TWGCB-01-012-0310.log"
conf="/etc/security/faillock.conf"
# 檢查 even_deny_root 是否啟用 (非註解且存在)
even_deny_root_set=$(grep -E '^[[:space:]]*even_deny_root' "$conf")
# 取得 root_unlock_time 值
unlock_time=$(grep -E '^[[:space:]]*root_unlock_time' "$conf" | awk -F'=' '{gsub(/[[:space:]]/, "", $2); print $2}')
if [[ -n "$even_deny_root_set" && "$unlock_time" =~ ^[0-9]+$ && "$unlock_time" -ge 60 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0310 root_unlock_time=$unlock_time (>=60) and even_deny_root enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0310 root unlock time is not properly configured.(see $LOGFILE)"
    echo "    檢測結果：even_deny_root=${even_deny_root_set:+已設定}，root_unlock_time=${unlock_time:-未設定}" >> "$LOGFILE"
fi

# TWGCB-01-012-0311 檢測密碼連續字元限制 maxsequence
conf="/etc/security/pwquality.conf"
# 取得 maxsequence 值（排除註解與空白）
maxseq=$(grep -E '^[[:space:]]*maxsequence' "$conf" | awk -F'=' '{gsub(/[[:space:]]/, "", $2); print $2}')

# 判斷條件：存在且為數字，且 0 < 值 <= 3
if [[ "$maxseq" =~ ^[0-9]+$ && "$maxseq" -gt 0 && "$maxseq" -le 3 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0311 maxsequence=$maxseq (1~3)"
else
    if [[ -z "$maxseq" ]]; then
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0311 maxsequence 未設定"
    else
        echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0311 maxsequence=$maxseq (應為 1~3)"
    fi
fi

# TWGCB-01-012-0312 檢測是否啟用 without-nullok
# 檢查 authselect 是否已啟用 without-nullok
if authselect current | grep -q "without-nullok"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0312 without-nullok feature is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0312 without-nullok feature is NOT enabled (輸入指令修正 authselect enable-feature without-nullok && authselect apply-changes)"
fi

# TWGCB-01-012-0313 檢查是否啟用 pam_pwquality.so 模組
# 規範要求：在 system-auth 與 password-auth 中必須包含此模組以強化密碼複雜度。
RESULT_313=$(grep -E '^\s*password\s+requisite\s+pam_pwquality\.so' /etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null)
if [ -n "$RESULT_313" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0313 pam_pwquality.so module is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0313 pam_pwquality.so missing in PAM files"
fi

# TWGCB-01-012-0314 檢查是否啟用 pam_unix.so 模組
# 規範要求：此為標準認證模組，必須正確配置於認證堆疊中。
RESULT_314=$(grep -E '^\s*password\s+sufficient\s+pam_unix\.so' /etc/pam.d/system-auth /etc/pam.d/password-auth 2>/dev/null)
if [ -n "$RESULT_314" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0314 pam_unix.so module is enabled"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0314 pam_unix.so missing in PAM files"
fi

# TWGCB-01-012-0315 檢查 SSH 是否停用 GSSAPIAuthentication
# 規範要求：GSSAPI 常與 Kerberos 相關，若無特定需求應停用以減少漏洞與連線延遲。
CURRENT_315=$(sshd -T 2>/dev/null | grep -i '^gssapiauthentication ' | awk '{print $2}')
if [ "$CURRENT_315" == "no" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0315 GSSAPIAuthentication is $CURRENT_315"
else
    echo -e " [\e[1;31mKO\e[0m] TWGCB-01-012-0315 GSSAPIAuthentication should be 'no'.(need GSSAPIAuthentication no)"
fi


# 清除所有 0 byte 的 TWGCB log 檔案
find "$SCRIPT_DIR" -maxdepth 1 -type f -name "TWGCB-01-012*.log" -size 0 -delete 2>/dev/null


echo "#########################################################################"
echo
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Script completed in" $DIFF "seconds"
echo
echo "Executed on :"
echo
echo "Check GCB hostname is" $HOSTNAME
date
echo
echo "#########################################################################"
echo

####################################################################################################

            show_menu;
        ;;
        12A) clear;
            option_picked "Option 12A Picked";
####################################################################################################
echo
echo "#########################################################################"
echo -e "\e[0;33m 1. Red Hat Enterprise Linux 9 Server GCB AUTOSETUP /////// \e[0m"
echo "#########################################################################"
START=$(date +%s)
####################################################################################################




# 清除日誌檔案
rm -f "$SCRIPT_DIR"/TWGCB-01-012-*.log 2>/dev/null
AUTOFIX0120004=0
NEED_FIX=0


# --- 自動修復子選單函式 ---
show_fix_menu() {
    while true; do
	
        echo -e "${YELLOW}"
        echo "============================================================"
        echo "      12A) TWGCB-01-012 RedHat 9 GCB 自動修復子選單"
        echo "============================================================"
        echo -e "${NC}"
        echo -e "${menu}  1)${normal} [基礎]   系統磁碟與檔案權限修復             (0004-0039)(高風險建議手動修改)"
        echo -e "${menu}  2)${normal} [網路]   核心參數與服務限制                 (0001-0130, 0300)"
        echo -e "${menu}  3)${normal} [帳號]   密碼原則與 PAM 認證                (0206-0230, 0236, 0239, 0309)"
        echo -e "${menu}  4)${normal} [稽核]   日誌管理與 Auditd 規則             (0134-0308)"
        echo -e "${menu}  5)${normal} [連線]   SSH 安全性與加密演算法             (0255-0281)"
		echo -e "${menu}  6)${normal} [防火牆] 防火牆服務與衝突過濾(使用firewalld)(0244-0249)"
        echo "------------------------------------------------------------"
        echo -e "${menu}  ALL)${normal} 執行上述所有修復項目 (全自動一鍵完成)"
        echo -e "${menu}  EXIT)${normal} 返回主選單"
        echo "------------------------------------------------------------"
		echo -e "${YELLOW}不支援項目(依需求自行手動設定):${NC}"
		echo -e "${YELLOW}grubpassword(0040),
桌面板設定項(0323,0233,0234,0237),
限制 su 指令(0241),
默認系統使用firewalld(0247,0248,0251,0252,0253),
ssh 白名單設定(0258),
ssh root登入限制(0269),
fat格式禁用(0294)${NC}"
		
		
        read -p "請選擇修復模組: " fix_choice

        case $fix_choice in
			1)

                clear
                echo "執行：系統磁碟與檔案權限修復..."
                fix_storage_permissions
                ;;
            2)
                clear
                echo "執行：核心參數與服務限制..."
                fix_kernel_services
                ;;
            3)
                clear
                echo "執行：帳號原則與 PAM 認證..."
                fix_account_pam
                ;;
            4)
                clear
                echo "執行：日誌管理與 Auditd 規則..."
                fix_logging_audit
                ;;
            5)
                clear
                echo "執行：SSH 安全性與加密演算法..."
                fix_ssh_hardening
                ;;
            6)
                clear
                echo "Firewalld配置"
                fix_firewalld
                ;;				
            [Aa][Ll][Ll])
                clear
                echo "開始執行全自動一鍵修復..."
                fix_storage_permissions
                fix_kernel_services
                fix_account_pam
                fix_logging_audit
                fix_ssh_hardening
				fix_firewalld
                echo -e "所有 GCB 修復項目已執行完畢。${NC}"
                ;;
            [Ee][Xx][Ii][Tt])
                clear
                return 0  # 返回上一層選單
                ;;
            *)
                echo -e "${RED}無效的選擇，請重新輸入。${NC}"
                sleep 1
                ;;
        esac
    done
}

# ==========================================
# --- 工具函數 ---
# ==========================================

# 備份函式
smart_backup() {
    local target_file="$1"
    
    # 檢查目標檔案是否存在，避免 cp 報錯
    if [ ! -f "$target_file" ]; then
        echo "Warning: $target_file not found, skip backup."
        return 1
    fi

    # 動態定義當天的備份路徑
    local B_DIR="$SCRIPT_DIR/backups/$(date +%Y%m%d)"
    local filename=$(basename "$target_file")
    local timestamp=$(date +%H%M%S_%3N)

    # 確保資料夾存在 (加入 -p 參數，若已存在就不會報錯)
    mkdir -p "$B_DIR"
    
    # 執行備份
    cp -p "$target_file" "${B_DIR}/${filename}_${timestamp}.bak"
    echo "Backup: $target_file -> ${B_DIR}/${filename}_${timestamp}.bak"
}


# ==========================================
#  特定項次的小函式 
# ==========================================

AUTOFIXSHELL0120004() {
    # [Fix Instructions for TWGCB-01-012-0004~0007]
    systemctl unmask tmp.mount &>/dev/null
    systemctl enable tmp.mount &>/dev/null
    
    mkdir -p /etc/systemd/system/tmp.mount.d/
    cat << EOF > /etc/systemd/system/tmp.mount.d/options.conf
[Mount]
Options=mode=1777,strictatime,noexec,nodev,nosuid,rootcontext=system_u:object_r:tmp_t:s0
EOF

    systemctl daemon-reload
    systemctl restart tmp.mount
}

AUTOFIXSHELL0120135() {
	# [Fix Instructions for TWGCB-01-012-0135]
    smart_backup "/etc/default/grub"
    local CONF="/etc/default/grub"
    
    # 判斷是「完全沒設定」還是「數值不足」
    if ! grep -q "audit_backlog_limit=" "$CONF"; then
        # 沒設定，直接加在 GRUB_CMDLINE_LINUX 的末尾（雙引號內）
        sed -i '/^GRUB_CMDLINE_LINUX=/ s/"$/ audit_backlog_limit=8192"/' "$CONF"
    else
        # 已有設定但數值不足，直接取代為 8192
        sed -i 's/audit_backlog_limit=[0-9]*/audit_backlog_limit=8192/' "$CONF"
    fi

    # 執行官方提供的更新指令 (更新 grub.cfg)
    # 這個指令會尋找正確的 grub.cfg 路徑（BIOS 或 UEFI 不同）
    GRUB_CFG_PATH=$(dirname "$(find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) -exec grep -Pl '^\h*(kernelopts=|linux|kernel)' {} \;)")/grub.cfg
    grub2-mkconfig -o "$GRUB_CFG_PATH" &>/dev/null
}


# 設定檔路徑
PWQ_CONF="/etc/security/pwquality.conf"
LOGIN_DEFS="/etc/login.defs"
PAM_FILE="/etc/pam.d/system-auth"

# 快速修復函式 (用於 pwquality.conf)
set_pwq() {
    local key=$1
    local val=$2
    if grep -q "^#\?\s*$key" "$PWQ_CONF"; then
        sed -i "s/^#\?\s*$key.*/$key = $val/" "$PWQ_CONF"
    else
        echo "$key = $val" >> "$PWQ_CONF"
    fi
}

# 修復 0207, 0220, 0221, 0222 的通用邏輯
FIX_PAM_POLICIES() {
    local CP=$(authselect current | awk 'NR == 1 {print $3}')
    
    # 如果不是 custom profile，先建立並切換
    if [[ "$CP" != custom/* ]]; then
        authselect create-profile twgcb -b sssd --symlink-meta
        authselect select custom/twgcb with-sudo with-faillock without-nullok --force
        CP="custom/twgcb"
    fi

    local CONF_DIR="/etc/authselect/$CP"

    # 0207: enforce_for_root
    for f in system-auth password-auth; do
        if ! grep -q "enforce_for_root" "$CONF_DIR/$f"; then
            sed -i '/pam_pwquality.so/ s/$/ enforce_for_root/' "$CONF_DIR/$f"
        fi
    done

    # 0220: remember=3
    if grep -Eq 'pam_unix\.so.*remember=' "$CONF_DIR/system-auth"; then
        sed -ri 's/(pam_unix\.so.*)remember=[0-9]+/\1remember=3/' "$CONF_DIR/system-auth"
    else
        sed -ri 's/(pam_unix\.so.*)/\1 remember=3/' "$CONF_DIR/system-auth"
    fi

    # 0221: showfailed
    if ! grep -q "pam_lastlog.so" "$CONF_DIR/postlogin"; then
        echo "session     required      pam_lastlog.so showfailed" >> "$CONF_DIR/postlogin"
    elif ! grep -q "showfailed" "$CONF_DIR/postlogin"; then
        sed -i '/pam_lastlog.so/s/$/ showfailed/' "$CONF_DIR/postlogin"
    fi

    # 0222: sha512 (PAM 部分)
    for f in system-auth password-auth; do
        if ! grep -q "sha512" "$CONF_DIR/$f"; then
            sed -i '/pam_unix.so/ s/$/ sha512/' "$CONF_DIR/$f"
        fi
    done

    # 0222: sha512 (系統設定部分)
    sed -i 's/^\s*crypt_style.*/crypt_style = sha512/' /etc/libuser.conf 2>/dev/null
    sed -i 's/^\s*ENCRYPT_METHOD.*/ENCRYPT_METHOD SHA512/' /etc/login.defs 2>/dev/null

    # 套用變更
    authselect apply-changes
}

# TWGCB-01-012-0145 補充：確保 AIDE 監測審計相關執行檔
fix_aide_audit_configs() {
    local AIDE_CONF="/etc/aide.conf"
    local CHANGED=0

    # 檢查檔案是否存在
    if [ ! -f "$AIDE_CONF" ]; then
        echo -e " [\e[1;31mERR\e[0m] $AIDE_CONF 不存在，跳過此項。"
        return 1
    fi

    # 執行備份
    smart_backup "$AIDE_CONF"

    # 定義需要存在的 AIDE 規則
    local AIDE_RULES=(
        "/usr/sbin/auditctl p+i+n+u+g+s+b+acl+xattrs+sha512"
        "/usr/sbin/auditd p+i+n+u+g+s+b+acl+xattrs+sha512"
        "/usr/sbin/ausearch p+i+n+u+g+s+b+acl+xattrs+sha512"
        "/usr/sbin/aureport p+i+n+u+g+s+b+acl+xattrs+sha512"
        "/usr/sbin/autrace p+i+n+u+g+s+b+acl+xattrs+sha512"
        "/usr/sbin/audisp-remote p+i+n+u+g+s+b+acl+xattrs+sha512"
        "/usr/sbin/audisp-syslog p+i+n+u+g+s+b+acl+xattrs+sha512"
        "/usr/sbin/augenrules p+i+n+u+g+s+b+acl+xattrs+sha512"
    )

    echo "正在檢查 AIDE 審計監測規則..."

    for rule in "${AIDE_RULES[@]}"; do
        # 使用 grep -Fxq -- 處理包含特殊字元的路徑與參數
        if ! grep -Fxq -- "$rule" "$AIDE_CONF"; then
            echo "Adding AIDE rule: $rule"
            echo "$rule" >> "$AIDE_CONF"
            CHANGED=1
        fi
    done

    if [ "$CHANGED" -eq 1 ]; then
        echo -e " [\e[1;33mFIX\e[0m] AIDE configuration updated."
        # 注意：更動 AIDE 設定後，建議重新初始化資料庫，但這會花很多時間
        # 因此我們只提示使用者，或者你可以選擇在此自動執行 aide --init
        echo -e "       \e[1;34mTip:\e[0m 建議稍後執行 'aide --init' 以更新資料庫。"
    else
        echo -e " [\e[1;32mOK\e[0m] All AIDE audit rules are already present."
    fi
}

# TWGCB-01-008-0146 & 0147 整合：Audit 日誌大小與飽和動作
fix_auditd_conf_limits() {
    local CONF="/etc/audit/auditd.conf"
    local CHANGED=0

    if [ ! -f "$CONF" ]; then
        echo -e " [\e[1;31mERR\e[0m] $CONF 不存在，跳過此項。"
        return 1
    fi

    # 執行備份
    smart_backup "$CONF"

    # --- 1. 處理 max_log_file (0146) ---
    local CURRENT_MAX_LOG=$(grep -E '^\s*max_log_file\s*=' "$CONF" | awk -F= '{gsub(/[[:space:]]/,"",$2); print $2}')
    if [ "$CURRENT_MAX_LOG" = "32" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0146 max_log_file is already 32."
    else
        # 修正：如果存在就取代，不存在就追加
        if grep -qE '^\s*max_log_file\s*=' "$CONF"; then
            sed -i 's/^\s*max_log_file\s*=.*/max_log_file = 32/' "$CONF"
        else
            echo "max_log_file = 32" >> "$CONF"
        fi
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-008-0146 max_log_file set to 32."
        CHANGED=1
    fi

    # --- 2. 處理 max_log_file_action (0147) ---
    local CURRENT_ACTION=$(grep -E '^\s*max_log_file_action\s*=' "$CONF" | awk -F= '{gsub(/[[:space:]]/,"",$2); print $2}')
    if [ "$CURRENT_ACTION" = "keep_logs" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-008-0147 max_log_file_action is already keep_logs."
    else
        # 修正
        if grep -qE '^\s*max_log_file_action\s*=' "$CONF"; then
            sed -i 's/^\s*max_log_file_action\s*=.*/max_log_file_action = keep_logs/' "$CONF"
        else
            echo "max_log_file_action = keep_logs" >> "$CONF"
        fi
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-008-0147 max_log_file_action set to keep_logs."
        CHANGED=1
    fi

    # 如果有更動，重啟服務生效
    if [ "$CHANGED" -eq 1 ]; then
        service auditd restart &>/dev/null
        echo -e " [\e[1;34mINFO\e[0m] auditd 服務已重啟以套用新設定。"
    fi
}




#148~157  159 160
fix_audit_rules() {
    local AUDIT_FILE="/etc/audit/rules.d/GCB.rules"
    local CHANGED=0

    # 確保目錄與檔案存在
    mkdir -p /etc/audit/rules.d/
    [ ! -f "$AUDIT_FILE" ] && touch "$AUDIT_FILE"
	chmod 600 "$AUDIT_FILE"
    # 備份原始檔案
    smart_backup "$AUDIT_FILE"

    # 定義所有必須存在的 GCB 規則
    local REQUIRED_RULES=(
        "-w /etc/sudoers -p wa -k scope"
        "-w /etc/sudoers.d/ -p wa -k scope"
        "-w /var/run/faillock/ -p wa -k logins"
        "-w /var/log/lastlog -p wa -k logins"
        "-w /var/run/utmp -p wa -k session"
        "-w /var/log/wtmp -p wa -k logins"
        "-w /var/log/btmp -p wa -k logins"
        "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change"
        "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change"
        "-a always,exit -F arch=b64 -S clock_settime -k time-change"
        "-a always,exit -F arch=b32 -S clock_settime -k time-change"
        "-w /etc/localtime -p wa -k time-change"
        "-w /etc/selinux/ -p wa -k MAC-policy"
        "-w /usr/share/selinux/ -p wa -k MAC-policy"
        "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale"
        "-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale"
        "-w /etc/issue -p wa -k system-locale"
        "-w /etc/issue.net -p wa -k system-locale"
        "-w /etc/hosts -p wa -k system-locale"
        "-w /etc/sysconfig/network-scripts -p wa -k system-locale"
        "-w /etc/NetworkManager -p wa -k system-locale"
        "-w /etc/sysconfig/network -p wa -k system-locale"
        "-w /etc/hostname -p wa -k system-locale"
        "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod"
        "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod"
        "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod"
        "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod"
        "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod"
        "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod"
        "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access"
        "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access"
        "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access"
        "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access"
        "-w /etc/group -p wa -k identity"
        "-w /etc/passwd -p wa -k identity"
        "-w /etc/gshadow -p wa -k identity"
        "-w /etc/shadow -p wa -k identity"
        "-w /etc/security/opasswd -p wa -k identity"
        "-w /etc/nsswitch.conf -p wa -k identity"
        "-w /etc/pam.conf -p wa -k identity"
        "-w /etc/pam.d -p wa -k identity"
        "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts"
        "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts"
        "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -S rmdir -F auid>=1000 -F auid!=4294967295 -k delete"
        "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -S rmdir -F auid>=1000 -F auid!=4294967295 -k delete"
        "-w /sbin/insmod -p x -k modules"
        "-w /sbin/rmmod -p x -k modules"
        "-w /sbin/modprobe -p x -k modules"
        "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules"
        "-a always,exit -F arch=b32 -S init_module -S delete_module -k modules"
        "-a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng"
        "-a always,exit -F path=/usr/bin/ssh-agent -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-ssh"
        "-a always,exit -F path=/sbin/unix_update -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-unix-update"
        "-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng"
        "-a always,exit -F arch=b32 -S finit_module -F auid>=1000 -F auid!=4294967295 -k module_chng"
        "-a always,exit -F arch=b64 -S finit_module -F auid>=1000 -F auid!=4294967295 -k module_chng"
        "-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access"
        "-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k perm_access"
        "-a always,exit -F arch=b32 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access"
        "-a always,exit -F arch=b64 -S open_by_handle_at -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k perm_access"
        "-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged-usermod"
        "-a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=1000 -F auid!=4294967295 -k perm_chng"
        "-w /bin/kmod -p x -k modules"
        "-w /var/log/faillock -p wa -k logins"
        "-a always,exit -F arch=b32 -F auid!=unset -S execve -C uid!=euid -F key=execpriv"
        "-a always,exit -F arch=b64 -F auid!=unset -S execve -C uid!=euid -F key=execpriv"
        "-a always,exit -F arch=b32 -F auid!=unset -S execve -C gid!=egid -F key=execpriv"
        "-a always,exit -F arch=b64 -F auid!=unset -S execve -C gid!=egid -F key=execpriv"
		"-w /var/log/sudo.log -p wa -k actions"
        "-e 2"
		"--loginuid-immutable"
    )

    # 逐條比對
    for rule in "${REQUIRED_RULES[@]}"; do
        # 使用 fgrep -x 進行精確匹配，避免正規表示法特殊字元誤判
        if ! fgrep -qx -- "$rule" "$AUDIT_FILE"; then
            echo "Adding missing rule: $rule"
            echo "$rule" >> "$AUDIT_FILE"
            CHANGED=1
        fi
    done

    # 如果有更動，重新載入規則
    if [ "$CHANGED" -eq 1 ]; then
        echo -e " [\e[1;33mFIX\e[0m] Audit rules updated. Reloading auditd service..."
        # 注意：auditd 最好使用 augenrules 重新生成或重啟
        augenrules --load &>/dev/null
        # 部分系統不允許 systemctl restart auditd，建議用以下方式
        service auditd restart &>/dev/null
    else
        echo -e " [\e[1;32mOK\e[0m] All Audit rules are already present."
    fi
}









# ==========================================
# --- 項目修復 ---
# ==========================================


#系統基礎與磁碟安全 (System & Partitioning)
#4 5 6 7 10 11 12 13 16 17 18 19 24 25 29 34 35 38 39
fix_storage_permissions() {
    echo -e "${GREEN}開始執行1.[系統基礎與磁碟安全 (System & Partitioning)]修復"
	echo -e "${RED}！！！ 高風險操作警告 ！！！${NC}"
    echo -e "${YELLOW}此模組將會更動 /etc/fstab、掛載參數 (/tmp, /home, /dev/shm) 及系統權限。${NC}"
    echo -e "${YELLOW}若設定錯誤可能導致系統無法開機或服務異常。${NC}"
	echo -e "${YELLOW}建議依環境手動設定。${NC}"
    echo ""
    read -p "您確定要繼續執行嗎？輸入 'yes' 確認，按其他鍵跳過此模組: " confirm

    if [[ "$confirm" != "yes" ]]; then
        echo -e "${CYAN}使用者取消，跳過 [系統基礎與磁碟安全] 模組。${NC}"
        return 1
    fi
    echo -e "${GREEN}============================================================"
    echo -e "${GREEN}-----------開始執行：系統磁碟與檔案權限修復..."
    echo -e "${GREEN}============================================================"
    local start_sec=$(date +%s)

# TWGCB-01-012-0004 ~ 0007 自動修復
TMP_MOUNTED=$(findmnt /tmp >/dev/null; echo $?)
TMP_OPTS=$(findmnt -n -o OPTIONS /tmp 2>/dev/null)

CHECK_PARTITION=$TMP_MOUNTED
CHECK_NODEV=$(echo "$TMP_OPTS" | grep -qw "nodev"; echo $?)
CHECK_NOSUID=$(echo "$TMP_OPTS" | grep -qw "nosuid"; echo $?)
CHECK_NOEXEC=$(echo "$TMP_OPTS" | grep -qw "noexec"; echo $?)

# 3. 判斷是否全部合規 (0 代表成功)
if [ $CHECK_PARTITION -eq 0 ] && [ $CHECK_NODEV -eq 0 ] && [ $CHECK_NOSUID -eq 0 ] && [ $CHECK_NOEXEC -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0004~0007 /tmp mount configurations are compliant."
else
    AUTOFIX0120004=1
	AUTOFIXSHELL0120004
    if findmnt /tmp | grep -qE "nodev.*nosuid.*noexec|nosuid.*nodev.*noexec"; then
        echo -e " [\e[1;32mFIXED\e[0m] TWGCB-01-012-0004~0007 /tmp fixed successfully."
    else
        echo -e " [\e[1;31mERROR\e[0m] TWGCB-01-012-0004~0007 fix failed, please check manually."
    fi
fi

# TWGCB-01-012-0010 ~ 0013：/var/tmp 安全掛載參數修復
CONF="/etc/fstab"
# 1. 抓出非註解且包含 /var/tmp 的那一整行
FSTAB_LINE=$(grep -E "^[^#].*[[:space:]]/var/tmp[[:space:]]" "$CONF")
if [ -n "$FSTAB_LINE" ]; then
    # 2. 抓出目前的參數 (第4欄)
    OLD_OPTS=$(echo "$FSTAB_LINE" | awk '{print $4}')
    NEW_OPTS="$OLD_OPTS"

    # 3. 檢查並補上缺失參數
    [[ "$NEW_OPTS" != *"nodev"* ]] && NEW_OPTS="${NEW_OPTS},nodev"
    [[ "$NEW_OPTS" != *"nosuid"* ]] && NEW_OPTS="${NEW_OPTS},nosuid"
    [[ "$NEW_OPTS" != *"noexec"* ]] && NEW_OPTS="${NEW_OPTS},noexec"

    if [ "$OLD_OPTS" != "$NEW_OPTS" ]; then
        echo "Found target: /var/tmp"
        echo "Updating options: $OLD_OPTS -> $NEW_OPTS"

        # 使用最穩健的替換方式：
        # 找尋包含 /var/tmp 的那一行，將舊參數字串替換為新參數字串
        # 這裡我們針對 $OLD_OPTS 做精確字串替換
        sed -i "/[[:space:]]\/var\/tmp[[:space:]]/s/$OLD_OPTS/$NEW_OPTS/" "$CONF"

		mount -o remount /var/tmp
        systemctl daemon-reload
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0010~13 /var/tmp updated successfully."
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0010~13 /var/tmp already has all options."
    fi
else
    echo -e " [\e[1;33mSKIP\e[0m] /var/tmp not found as a separate mount in $CONF."
fi

# TWGCB-01-012-0016, 0024, 0025：/home 安全掛載自動修復
CONF="/etc/fstab"
ROOT_DEV=$(findmnt -n -o SOURCE /)
HOME_DEV=$(findmnt -n -o SOURCE /home 2>/dev/null)
if [ -n "$HOME_DEV" ] && [ "$HOME_DEV" != "$ROOT_DEV" ]; then
    # 抓取非註解且精確匹配 /home 的那一行
    FSTAB_LINE=$(grep -E "^[^#].*[[:space:]]/home[[:space:]]" "$CONF")
    
    if [ -n "$FSTAB_LINE" ]; then
        OLD_OPTS=$(echo "$FSTAB_LINE" | awk '{print $4}')
        NEW_OPTS="$OLD_OPTS"

        # 檢查並補上缺失參數
        [[ "$NEW_OPTS" != *"nodev"* ]] && NEW_OPTS="${NEW_OPTS},nodev"
        [[ "$NEW_OPTS" != *"nosuid"* ]] && NEW_OPTS="${NEW_OPTS},nosuid"
        [[ "$NEW_OPTS" != *"noexec"* ]] && NEW_OPTS="${NEW_OPTS},noexec"

        if [ "$OLD_OPTS" != "$NEW_OPTS" ]; then
            echo "正在修正 /home 掛載參數: $OLD_OPTS -> $NEW_OPTS"
            
            # --- 關鍵修正處 ---
            # 使用 /[[:space:]]\/home[[:space:]]/ 作為地址定位，確保 sed 只改動該行
            sed -i "/[[:space:]]\/home[[:space:]]/s/$OLD_OPTS/$NEW_OPTS/" "$CONF"
            systemctl daemon-reload
			mount -o remount /home
            echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0016/24/25 /home options updated."
			
        else
            echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0016/24/25 /home already compliant."
        fi
    fi
else
    echo -e " [\e[1;32mSKIP\e[0m] /home is not a separate partition, noexec not required."
fi

# TWGCB-01-012-0017 ~ 0019 自動修復 (/dev/shm)
CONF="/etc/fstab"
# 1. 檢查 /dev/shm 是否符合所有 GCB 安全掛載規範 (nodev, nosuid, noexec)
OPTS_SHM=$(findmnt -n -o OPTIONS /dev/shm 2>/dev/null)
# /dev/shm 預設就是獨立掛載點，重點檢查參數是否包含 nodev, nosuid, noexec
CHECK_NODEV_SHM=$(echo "$OPTS_SHM" | grep -qw "nodev"; echo $?)
CHECK_NOSUID_SHM=$(echo "$OPTS_SHM" | grep -qw "nosuid"; echo $?)
CHECK_NOEXEC_SHM=$(echo "$OPTS_SHM" | grep -qw "noexec"; echo $?)

# 2. 如果其中一項檢查不通過 (回傳值非 0)
if [ "$CHECK_NODEV_SHM" -ne 0 ] || [ "$CHECK_NOSUID_SHM" -ne 0 ] || [ "$CHECK_NOEXEC_SHM" -ne 0 ]; then
    echo "偵測到 /dev/shm 不符合規範，開始修復..."
    if ! grep -E "^[^#].*[[:space:]]/dev/shm[[:space:]]" "$CONF" >/dev/null; then
        echo "正在將 /dev/shm 安全設定寫入 $CONF..."
        # 注意：/dev/shm 是記憶體掛載，Type 為 tmpfs
        echo "tmpfs /dev/shm tmpfs defaults,nodev,nosuid,noexec 0 0" >> "$CONF"
    else
        echo "修正 $CONF 中現有的 /dev/shm 參數..."
        # 覆蓋現有行，確保參數包含 nodev,nosuid,noexec
        sed -i 's|^.*[[:space:]]/dev/shm[[:space:]].*|tmpfs /dev/shm tmpfs defaults,nodev,nosuid,noexec 0 0|' "$CONF"
    fi
    systemctl daemon-reload
	mount -o remount /dev/shm
    FINAL_OPTS_SHM=$(findmnt -n -o OPTIONS /dev/shm)
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0017~19 /dev/shm 修復完成。目前參數: $FINAL_OPTS_SHM"
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0017~19 /dev/shm 已符合規範。"
fi

# TWGCB-01-012-0029：檢查全域寫入目錄是否設定粘滯位 (Sticky Bit)
LOGFILE="$SCRIPT_DIR/FIXTWGCB-01-012-0029.log"
# 使用 -print0 處理空格，搜尋未設 sticky bit 的 world-writable 目錄
df --local -P | awk 'NR>1 {print $6}' | xargs -I '{}' find '{}' -xdev -type d -perm -0002 ! -perm -1000 -print0 2>/dev/null | xargs -0 -I '{}' echo "{}" >> "$LOGFILE"
if [ -s "$LOGFILE" ]; then
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0029 World-writable directories without sticky bit FIX"
	df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs -I '{}' chmod o+t '{}'
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0029 all world-writable directories have sticky bit set"   
fi

# TWGCB-01-012-0034 ~ 0035：設定 sudo 使用獨立終端機與日誌
SUDO_CONF="/etc/sudoers.d/GCB"
# 1. 執行檢查
# 檢查 0034 (use_pty)
CHECK_34=$(grep -rE '^[^#]*Defaults[[:space:]]+use_pty' /etc/sudoers /etc/sudoers.d/ 2>/dev/null)
# 檢查 0035 (logfile)
CHECK_35=$(grep -rE '^[^#]*Defaults[[:space:]]+logfile[[:space:]]*=[[:space:]]*"?/var/log/sudo\.log"?' /etc/sudoers /etc/sudoers.d/ 2>/dev/null)

# 2. 判斷是否需要修復
if [ -z "$CHECK_34" ] || [ -z "$CHECK_35" ]; then
    echo "偵測到 sudo 設定不符合 GCB 規範，正在執行修復..."

    # 建立設定檔
    cat <<EOF > "$SUDO_CONF"
# TWGCB-01-012-0034 & 0035
Defaults use_pty
Defaults logfile="/var/log/sudo.log"
EOF
    # 設定正確權限 (0440 是 sudoers.d 的強制要求)
    chmod 0440 "$SUDO_CONF"
    chown root:root "$SUDO_CONF"

    # 驗證語法是否正確
    if visudo -cf "$SUDO_CONF" >/dev/null 2>&1; then
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0034/0035 sudo configurations applied to $SUDO_CONF"
    else
        echo -e " [\e[1;31mERR\e[0m] sudo configuration syntax error, removing invalid config."
        rm -f "$SUDO_CONF"
    fi
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0034/0035 sudo settings already compliant."
fi

# TWGCB-01-012-0038 & 0039：GRUB 安全性自動修復
CONF="/etc/fstab"
if [ -d /sys/firmware/efi ]; then
    # --- UEFI 系統：修改 /etc/fstab ---
    echo "偵測為 UEFI 系統，檢查 /boot/efi 掛載參數..."
    
    # 取得現有的第 4 欄參數
    EFI_LINE=$(grep -E '^[[:space:]]*[^#].*[[:space:]]/boot/efi[[:space:]]' "$CONF")
    
    if [ -n "$EFI_LINE" ]; then
        OPTS=$(echo "$EFI_LINE" | awk '{print $4}')
        NEW_OPTS="$OPTS"

        # 檢查並補上缺失的參數
        [[ "$OPTS" != *"uid=0"* ]] && NEW_OPTS="$NEW_OPTS,uid=0"
        [[ "$OPTS" != *"gid=0"* ]] && NEW_OPTS="$NEW_OPTS,gid=0"
        [[ "$OPTS" != *"fmask=0177"* ]] && NEW_OPTS="$NEW_OPTS,fmask=0177"

        if [ "$OPTS" != "$NEW_OPTS" ]; then
            echo "正在修正 $CONF 中的 /boot/efi 參數為: $NEW_OPTS"
            # 使用 sed 替換該行的舊參數為新參數
            sed -i "s|$OPTS|$NEW_OPTS|" "$CONF"
            
            # 立即重新掛載以套用設定
            mount -o remount /boot/efi 2>/dev/null
            echo -e " [\e[1;33mFIX\e[0m] UEFI /boot/efi parameters updated."
        else
            echo -e " [\e[1;32mOK\e[0m] UEFI /boot/efi parameters already compliant."
        fi
    fi

else
    # --- BIOS 系統：直接執行權限修復 ---
    echo "偵測為 BIOS 系統，執行檔案權限修復..."    
    # 直接執行，不論目前狀態為何，確保最終狀態正確
    TARGET_FILES="/boot/grub2/grub.cfg /boot/grub2/grubenv /boot/grub2/user.cfg"    
    # 執行 chown (0038)
    chown root:root $TARGET_FILES 2>/dev/null
    # 執行 chmod (0039)
    chmod 600 $TARGET_FILES 2>/dev/null    
    echo -e " [\e[1;32mOK\e[0m] BIOS GRUB files ownership and permissions enforced (root:root, 600)."
fi

LOGFILE="$SCRIPT_DIR/TWGCB-012-AUTOFIX.log"
if [ "$AUTOFIX0120004" -eq 1 ]; then
    {
        local CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")      
        echo "===================================================="
        echo "Timestamp: [$CURRENT_TIME]"
        echo "Action   : Automated Fix for TWGCB-01-012-0004~0007"
        echo "Status   : Successfully Executed"
        echo "----------------------------------------------------"
        echo "Function Details:"
        declare -f AUTOFIXSHELL0120004
        echo "----------------------------------------------------"
        echo "End of Action - [$CURRENT_TIME]"
        echo "===================================================="
        echo ""
    } >> "$LOGFILE"
    AUTOFIX0120004=0
fi

}



#服務管理與核心加固 (Services & Kernel Hardening)
#1 2 3 31 94 95 96 97 98 99 100 126 127 128 129 285 286 287 288 289 290 291 292 293 294 295 296 297 298 299 300 
fix_kernel_services() {
    echo -e "${GREEN}============================================================"
    echo -e "${GREEN}-----------開始執行2.[服務管理與核心加固 (Services & Kernel Hardening)]修復"
	echo -e "${GREEN}============================================================"
# 定義服務與對應的項次清單 (項次:服務名)
SERVICES=(
    "0094:rsyncd"
    "00951:avahi-daemon.service"
	"00952:avahi-daemon.socket"
    "0096:snmpd"
    "0097:squid"
    "0098:smb"
    "0099:vsftpd"
    "0100:ypserv"
)

for item in "${SERVICES[@]}"; do
    ID=${item%%:*}    # 取得項次號碼 (如 0094)
    SVC=${item#*:}    # 取得服務名稱 (如 rsyncd)
    if [[ "$(systemctl is-enabled "$SVC" 2>/dev/null)" != "masked" ]]; then
        echo "Fix: Masking $SVC service (TWGCB-01-012-$ID)..."
        systemctl --now mask "$SVC" &>/dev/null
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-$ID $SVC has been masked."
    else
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-$ID $SVC is already masked."
    fi
done


CONF_FILE="/etc/modprobe.d/GCB.conf"
if [ ! -f "$CONF_FILE" ]; then
	echo -e "$CONF_FILE 不存在，開始建立停用模組設定"
	echo -e "TWGCB-04-012-0001 2 3 31 126 127 128 129 285~300"
	mkdir -p /etc/modprobe.d/

	cat << 'EOF' > /etc/modprobe.d/GCB.conf
#1
install cramfs /bin/true
blacklist cramfs

#2
install squashfs /bin/true
blacklist squashfs

#3
install udf /bin/true
blacklist udf

#31
install usb-storage /bin/true
blacklist usb-storage

#126
install dccp /bin/true
blacklist dccp

#127
install sctp /bin/true
blacklist sctp

#128
install rds /bin/true
blacklist rds

#129
install tipc /bin/true
blacklist tipc

#285
install freevxfs /bin/true
blacklist freevxfs

#286
install hfs /bin/true
blacklist hfs

#287
install hfsplus /bin/true
blacklist hfsplus

#288
install jffs2 /bin/true
blacklist jffs2

#289
install afs /bin/true
blacklist afs

#290
install ceph /bin/true
blacklist ceph

#291
install cifs /bin/true
blacklist cifs

#292
install exfat /bin/true
blacklist exfat

#293
install ext /bin/true
blacklist ext

#295
install fscache /bin/true
blacklist fscache

#296
install fuse /bin/true
blacklist fuse

#297
install gfs2 /bin/true
blacklist gfs2

#298
install nfs_common /bin/true
blacklist nfs_common

#299
install nfsd /bin/true
blacklist nfsd

#300
install smbfs_common /bin/true
blacklist smbfs_common
##
EOF

chmod 644 "$CONF_FILE"

rmmod cramfs
rmmod squashfs
rmmod udf
rmmod usb-storage
modprobe -r freevxfs
rmmod freevxfs
modprobe -r hfs
rmmod hfs
modprobe -r hfsplus
rmmod hfsplus
modprobe -r jffs2
rmmod jffs2
modprobe -r afs
rmmod afs
modprobe -r ceph
rmmod ceph
modprobe -r cifs
rmmod cifs
modprobe -r exfat
rmmod exfat
modprobe -r ext
rmmod ext
modprobe -r fscache
rmmod fscache
modprobe -r fuse
rmmod fuse
modprobe -r gfs2
rmmod gfs2
modprobe -r nfs_common
rmmod nfs_common
modprobe -r nfsd
rmmod nfsd
modprobe -r smbfs_common
rmmod smbfs_common

echo -e " [\e[1;33mFIX\e[0m] $CONF_FILE 模組停用完成"
else
    echo -e " [\e[1;32mSKIP\e[0m] 模組停用設定 $CONF_FILE 已經存在，如需重新設定請先手動刪除。"
fi

# TWGCB-01-012-0042：禁止 Core Dump (核心轉儲)
# TWGCB-01-012-0043 檢查記憶體位址空間配置隨機載入 (ASLR)，kernel.randomize_va_space 必須設為 2。
# TWGCB-01-012-0307 檢查 ptrace 限制模式設定
LIMITS_CONF="/etc/security/limits.d/99-GCB.conf"
SYSCTL_CONF="/etc/sysctl.d/99-GCB.conf"
SYSTEMD_COREDUMP="/etc/systemd/coredump.conf"
# 1. 修復 limits (User Limits)
# 檢查所有 limits 設定檔中是否已經有 hard core 0
if ! grep -REq '^\s*\*\s+hard\s+core\s+0' /etc/security/limits.conf /etc/security/limits.d/ 2>/dev/null; then
    echo "* hard core 0" > "$LIMITS_CONF"
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0042 Writing '* hard core 0' to $LIMITS_CONF"
fi

# 2. 修復 sysctl (Kernel Parameters)
# 檢查 fs.suid_dumpable 與 kernel.core_pattern
NEED_SYSCTL_FIX=0
if [[ "$(sysctl -n fs.suid_dumpable 2>/dev/null)" != "0" ]]; then NEED_SYSCTL_FIX=1; fi
if [[ "$(sysctl -n kernel.core_pattern 2>/dev/null)" != "|/bin/false" ]]; then NEED_SYSCTL_FIX=1; fi
if [[ "$(sysctl -n kernel.randomize_va_space 2>/dev/null)" != "2" ]]; then NEED_SYSCTL_FIX=1; fi
if [[ "$(sysctl -n kernel.yama.ptrace_scope 2>/dev/null)" != "1" ]]; then NEED_SYSCTL_FIX=1; fi
if [ "$NEED_SYSCTL_FIX" -eq 1 ]; then
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0042 Updating kernel settings in $SYSCTL_CONF"
    cat <<EOF > "$SYSCTL_CONF"
#42
fs.suid_dumpable = 0
kernel.core_pattern = |/bin/false
#43
kernel.randomize_va_space=2
#307
kernel.yama.ptrace_scope=1
EOF
    # 立即生效
    sysctl -p "$SYSCTL_CONF" &>/dev/null
fi

# 3. 修復 systemd coredump.conf
if [ -f "$SYSTEMD_COREDUMP" ]; then
    # 檢查是否缺少 Storage=none 或 ProcessSizeMax=0
    if ! grep -iq '^\s*Storage=none' "$SYSTEMD_COREDUMP" || ! grep -iq '^\s*ProcessSizeMax=0' "$SYSTEMD_COREDUMP"; then
        # 這裡使用 sed 直接修改原檔，確保 Storage 與 ProcessSizeMax 正確
        sed -i 's/^[# ]*Storage=.*/Storage=none/' "$SYSTEMD_COREDUMP"
        sed -i 's/^[# ]*ProcessSizeMax=.*/ProcessSizeMax=0/' "$SYSTEMD_COREDUMP"
        
        # 如果檔案裡本來沒有這些關鍵字，則補在末尾
        grep -q "^Storage=none" "$SYSTEMD_COREDUMP" || echo "Storage=none" >> "$SYSTEMD_COREDUMP"
        grep -q "^ProcessSizeMax=0" "$SYSTEMD_COREDUMP" || echo "ProcessSizeMax=0" >> "$SYSTEMD_COREDUMP"
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0042 $SYSTEMD_COREDUMP configuration applied"
    fi
fi

# 4. 修復服務遮蔽 (Mask Service)
if [[ "$(systemctl is-enabled systemd-coredump.socket 2>/dev/null)" != "masked" ]]; then
    echo "修正：遮蔽 systemd-coredump.socket"
    systemctl stop systemd-coredump.socket &>/dev/null
    systemctl mask systemd-coredump.socket &>/dev/null
fi
echo -e " [\e[1;32mDONE\e[0m] TWGCB-01-012-0042 Core dump configurations enforced."

# TWGCB-01-012-0044 檢查全系統加密原則
ACTIVE_POLICY=$(update-crypto-policies --show 2>/dev/null)
if [[ "$ACTIVE_POLICY" == "FUTURE" || "$ACTIVE_POLICY" == "FIPS" ]]; then
    # 如果策略是 FUTURE 或 FIPS
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0044 Crypto policy is set to: $ACTIVE_POLICY"
else
	update-crypto-policies --set FUTURE && update-crypto-policies
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0044 Crypto policy is set to FUTURE"
fi

# TWGCB-01-012-0071 檢查程式庫檔案擁有群組，程式庫檔案擁有群組必須是 root。
LOGFILE="$SCRIPT_DIR/FIXTWGCB-01-012-0071.log"
LIB_DIRS="/lib /lib64 /usr/lib /usr/lib64"
find -L $LIB_DIRS ! -group root -type f 2>/dev/null >> "$LOGFILE"
if [ -s "$LOGFILE" ]; then
	xargs < "$LOGFILE" -L 1 chgrp root 
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0071 All library files fixed to owned by the root group."
else
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0071 All library files are owned by the root group."
fi

# 定義設定檔路徑
SYSCTL_CONF="/etc/sysctl.d/99-GCB.conf"
# 所有網路介面傳送ICMP重新導向封包
IPV4_redirects=$(sysctl -n net.ipv4.conf.all.send_redirects)
if [ "$IPV4_redirects" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0109 IP redirects are disabled"
else
    echo "net.ipv4.conf.all.send_redirects = 0" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.all.send_redirects=0
fi

# 檢查 IPv4 default ICMP redirects 狀態
DEFAULT_redirects=$(sysctl -n net.ipv4.conf.default.send_redirects)
if [ "$DEFAULT_redirects" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0110 default IP redirects are disabled"
else
    echo "net.ipv4.conf.default.send_redirects = 0" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.default.send_redirects=0
fi

# 檢查 IPv4 與 IPv6 all interface accept_redirects 狀態
IPV4_RED=$(sysctl -n net.ipv4.conf.all.accept_redirects)
IPV6_RED=$(sysctl -n net.ipv6.conf.all.accept_redirects)
if [ "$IPV4_RED" -eq 0 ] && [ "$IPV6_RED" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0113 IPv4 IPv6 all interfaces ICMP redirects are blocked"
else
	echo "net.ipv4.conf.all.accept_redirects = 0" >> "$SYSCTL_CONF"
	echo "net.ipv6.conf.all.accept_redirects = 0" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.all.accept_redirects=0 
	sysctl -w net.ipv6.conf.all.accept_redirects=0
fi

#TWGCB-01-012-0114
IPV4_DEFAULT_ACCEPT=$(sysctl -n net.ipv4.conf.default.accept_redirects)
IPV6_DEFAULT_ACCEPT=$(sysctl -n net.ipv6.conf.default.accept_redirects)
if [ "$IPV4_DEFAULT_ACCEPT" -eq 0 ] && [ "$IPV6_DEFAULT_ACCEPT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0114 default interfaces accept redirects are disabled"
else
	echo "net.ipv4.conf.default.accept_redirects = 0" >> "$SYSCTL_CONF"
	echo "net.ipv6.conf.default.accept_redirects = 0" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.default.accept_redirects=0
	sysctl -w net.ipv6.conf.default.accept_redirects=0
fi

#TWGCB-01-012-0115
SECURE_REDIRECTS=$(sysctl -n net.ipv4.conf.all.secure_redirects)
if [ "$SECURE_REDIRECTS" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0115 IPv4 all interfaces secure redirects are disabled"
else
	echo "net.ipv4.conf.all.secure_redirects = 0" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.all.secure_redirects=0
fi

#TWGCB-01-012-0116
IPV4_DEFAULT_SECURE=$(sysctl -n net.ipv4.conf.default.secure_redirects)
if [ "$IPV4_DEFAULT_SECURE" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0116 default interfaces secure redirects are disabled"
else
	echo "net.ipv4.conf.default.secure_redirects = 0" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.default.secure_redirects=0
fi

#TWGCB-01-012-0117
LOG_MARTIANS=$(sysctl -n net.ipv4.conf.all.log_martians)

if [ "$LOG_MARTIANS" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0117 log martians is enabled"
else
	echo "net.ipv4.conf.all.log_martians = 1" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.all.log_martians=1
fi

#TWGCB-01-012-0118
LOG_MARTIANS_DEFAULT=$(sysctl -n net.ipv4.conf.default.log_martians)

if [ "$LOG_MARTIANS_DEFAULT" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0118 default interface log martians is enabled"
else
	echo "net.ipv4.conf.default.log_martians = 1" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.default.log_martians=1
fi

#TWGCB-01-012-0121
RP_FILTER=$(sysctl -n net.ipv4.conf.all.rp_filter)

if [ "$RP_FILTER" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0121 Reverse path filtering (rp_filter) is enabled"
else
	echo "net.ipv4.conf.all.rp_filter = 1" >> "$SYSCTL_CONF"
	sysctl -w net.ipv4.conf.all.rp_filter=1
fi

#TWGCB-01-012-0124
ACCEPT_RA=$(sysctl -n net.ipv6.conf.all.accept_ra)

if [ "$ACCEPT_RA" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0124 IPv6 router advertisement is disabled"
else
	echo "net.ipv6.conf.all.accept_ra = 0" >> "$SYSCTL_CONF"
	sysctl -w net.ipv6.conf.all.accept_ra=0
fi

sysctl -w net.ipv4.route.flush=1
sysctl -w net.ipv6.route.flush=1

###	TWGCB-01-012-0130 ####
# 檢查 nmcli 是否存在
if command -v nmcli >/dev/null 2>&1; then
    wifi_status=$(nmcli radio wifi)
    if [ "$wifi_status" == "disabled" ]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0130 wireless interfaces are disabled"
    else
		nmcli radio all off
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0130 wireless interfaces are disabled"
    fi
	else
    echo -e " [\e[1;33mWARN\e[0m] nmcli not installed, cannot check wireless status"
	fi   
}


#帳號原則與身份驗證 (Account & PAM Policy)
# 0206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 230 236 239 309 311
fix_account_pam() {
    echo -e "${GREEN}============================================================"
    echo -e "${GREEN}-----------開始執行3.[帳號原則與身份驗證 (Account & PAM Policy)]修復"
    echo -e "${GREEN}============================================================"


# --- TWGCB-01-012-0206: retry (1-3) ---
VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "retry=\K\d+" | head -n1)
VAL_CONF=$(awk -F= '/^[[:space:]]*retry[[:space:]]*=/{gsub(/[[:space:]]/,"",$2); print $2}' "$PWQ_CONF" | tail -n1)
FINAL_VAL=${VAL_PAM:-$VAL_CONF}
if [[ "$FINAL_VAL" =~ ^[1-3]$ ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0206 Effective Retry=$FINAL_VAL"
else
    set_pwq "retry" "3"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0206 Retry set to 3"
fi

#207 #220 #221 #222
LOGFILE="$SCRIPT_DIR/TWGCB-PAM-FIX.log"
# 預先同步
authselect apply-changes &>/dev/null
# 執行標記
NEED_FIX=0

# [0207 檢查]
CHECK_0207=$(grep -E 'pam_pwquality\.so.*enforce_for_root' /etc/pam.d/system-auth /etc/pam.d/password-auth | wc -l)
# [0220 檢查]
REM_VAL=$(grep -E '^\s*password.*pam_unix\.so' /etc/pam.d/system-auth | grep -oP 'remember=\K[0-9]+')
# [0221 檢查]
CHECK_0221=$(grep -Eq '^\s*session.*pam_lastlog\.so.*showfailed' /etc/pam.d/postlogin; echo $?)
# [0222 檢查]
CHECK_0222_PAM=$(grep -q 'sha512' /etc/pam.d/system-auth; echo $?)

# 綜合判斷：只要有一項不合格，就執行整包修復
if [ "$CHECK_0207" -lt 2 ] || [ -z "$REM_VAL" ] || [ "$REM_VAL" -lt 3 ] || [ "$CHECK_0221" -ne 0 ] || [ "$CHECK_0222_PAM" -ne 0 ]; then
    FIX_PAM_POLICIES
    NEED_FIX=1  
    echo -e " [\e[1;32mFIXED\e[0m] PAM policies (0207, 0220, 0221, 0222) have been updated and applied."
else
    echo -e " [\e[1;32mOK\e[0m] PAM policies (0207, 0220, 0221, 0222) are all compliant."
fi



# --- TWGCB-01-012-0208: minlen (>= 12) ---
PASS_MIN_LEN=$(grep -E '^[[:space:]]*PASS_MIN_LEN' "$LOGIN_DEFS" 2>/dev/null | awk '{print $2}')
MINLEN=$(grep -i '^\s*minlen' "$PWQ_CONF" 2>/dev/null | awk -F '=' '{gsub(/ /,"",$2); print $2}')
if [[ "$PASS_MIN_LEN" -ge 12 ]] 2>/dev/null || [[ "$MINLEN" -ge 12 ]] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0208 minimum password length is compliant"
else
    set_pwq "minlen" "12"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0208 minlen set to 12"
fi

# --- TWGCB-01-012-0209 ~ 0217 311密碼品質檢查 ---
declare -A PW_CHECKS=(
    ["0209"]="minclass 4"
    ["0210"]="dcredit -1"
    ["0211"]="ucredit -1"
    ["0212"]="lcredit -1"
    ["0213"]="ocredit -1"
    ["0214"]="difok 3"
    ["0215"]="maxclassrepeat 4"
    ["0216"]="maxrepeat 3"
    ["0217"]="dictcheck 1"
	["0311"]="maxsequence 3"
)

for item in "${!PW_CHECKS[@]}"; do
    key=$(echo ${PW_CHECKS[$item]} | cut -d' ' -f1)
    expected=$(echo ${PW_CHECKS[$item]} | cut -d' ' -f2)
    
    VAL_PAM=$(grep "pam_pwquality.so" "$PAM_FILE" | grep -oP "$key=\K-?\d+" | head -n1)
    VAL_CONF=$(awk -F= "/^[[:space:]]*$key[[:space:]]*=/{gsub(/[[:space:]]/,\"\",\$2); print \$2}" "$PWQ_CONF" | tail -n1)
    FINAL_VAL=${VAL_PAM:-$VAL_CONF}

    if [[ "$FINAL_VAL" == "$expected" ]]; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-$item Effective $key=$FINAL_VAL"
    else
        set_pwq "$key" "$expected"
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-$item $key set to $expected"
    fi
done

# TWGCB-01-012-0218 檢查使用者登入失敗鎖定次數
CFG="/etc/security/faillock.conf"
VAL=$(grep -iE "^[[:space:]]*deny[[:space:]]*=[[:space:]]*[0-9]+" "$CFG" | awk -F= '{gsub(/ /,"",$2); print $2}' | tail -n1)
if [[ "$VAL" =~ ^[1-5]$ ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0218 deny=$VAL (1–5)"
else
    grep -q "^\s*deny\s*=" "$CFG" && sed -i 's/^\s*deny\s*=.*/deny = 5/' "$CFG" || echo "deny = 5" >> "$CFG"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0218 deny set to 5"
fi

# TWGCB-01-012-0219 檢查帳號解鎖時間
CFG="/etc/security/faillock.conf"
VAL=$(grep -iE "^[[:space:]]*unlock_time[[:space:]]*=[[:space:]]*[0-9]+" "$CFG" | awk -F= '{gsub(/ /,"",$2); print $2}' | tail -n1)
if [[ "$VAL" =~ ^[0-9]+$ ]] && [ "$VAL" -ge 900 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0219 unlock_time=$VAL (≥900)"
else
    grep -q "^\s*unlock_time\s*=" "$CFG" && sed -i 's/^\s*unlock_time\s*=.*/unlock_time = 900/' "$CFG" || echo "unlock_time = 900" >> "$CFG"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0219 unlock_time set to 900"
fi

# TWGCB-01-012-0223 密碼最短使用期限 (PASS_MIN_DAYS)
CFG="/etc/login.defs"
VAL=$(grep -E "^\s*PASS_MIN_DAYS" "$CFG" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 1 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0223 PASS_MIN_DAYS is $VAL"
else
    # 修復指令：存在則取代，不存在則追加
    grep -q "^\s*PASS_MIN_DAYS" "$CFG" && sed -i 's/^\s*PASS_MIN_DAYS.*/PASS_MIN_DAYS   1/' "$CFG" || echo "PASS_MIN_DAYS   1" >> "$CFG"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0223 PASS_MIN_DAYS set to 1"
fi

# TWGCB-01-012-0224 密碼到期提醒天數 (PASS_WARN_AGE)
VAL=$(grep -E "^\s*PASS_WARN_AGE" "$CFG" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 14 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0224 PASS_WARN_AGE is $VAL"
else
    # 修復指令
    grep -q "^\s*PASS_WARN_AGE" "$CFG" && sed -i 's/^\s*PASS_WARN_AGE.*/PASS_WARN_AGE   14/' "$CFG" || echo "PASS_WARN_AGE   14" >> "$CFG"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0224 PASS_WARN_AGE set to 14"
fi

# TWGCB-01-012-0225 密碼最長使用期限 (PASS_MAX_DAYS)
VAL=$(grep -E "^\s*PASS_MAX_DAYS" "$CFG" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -le 90 ] && [ "$VAL" -gt 0 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0225 PASS_MAX_DAYS is $VAL"
else
    # 修復指令
    grep -q "^\s*PASS_MAX_DAYS" "$CFG" && sed -i 's/^\s*PASS_MAX_DAYS.*/PASS_MAX_DAYS   90/' "$CFG" || echo "PASS_MAX_DAYS   90" >> "$CFG"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0225 PASS_MAX_DAYS set to 90"
fi

# TWGCB-01-012-0226 帳號停用天數 (INACTIVE)
VAL=$(awk -F= '/^[[:space:]]*INACTIVE/ {gsub(/[[:space:]]/,"",$2); print $2}' /etc/default/useradd | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -gt 0 ] && [ "$VAL" -le 30 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0226 useradd INACTIVE is $VAL"
else
	useradd -D -f 30
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0226 useradd INACTIVE set to 30"
fi

# TWGCB-01-012-0227 登入失敗延遲時間 (FAIL_DELAY)
CFG="/etc/login.defs"
VAL=$(grep -E "^\s*FAIL_DELAY" "$CFG" | awk '{print $2}' | tail -n1)
if [ -n "$VAL" ] && [ "$VAL" -ge 4 ] 2>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0227 FAIL_DELAY is $VAL (>= 4)"
else
    # 修復指令：設定延遲時間為 4 秒 (增加暴力破解難度)
    grep -q "^\s*FAIL_DELAY" "$CFG" && sed -i 's/^\s*FAIL_DELAY.*/FAIL_DELAY   4/' "$CFG" || echo "FAIL_DELAY   4" >> "$CFG"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0227 FAIL_DELAY set to 4"
fi

# TWGCB-01-012-0228 建立使用者家目錄 (CREATE_HOME)
VAL=$(grep -E "^\s*CREATE_HOME" "$CFG" | awk '{print $2}' | tr '[:upper:]' '[:lower:]' | tail -n1)
if [ "$VAL" == "yes" ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0228 CREATE_HOME is $VAL"
else
    # 修復指令：確保建立新使用者時會自動建立家目錄
    grep -q "^\s*CREATE_HOME" "$CFG" && sed -i 's/^\s*CREATE_HOME.*/CREATE_HOME   yes/' "$CFG" || echo "CREATE_HOME   yes" >> "$CFG"
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0228 CREATE_HOME set to yes"
fi

# TWGCB-01-012-0230 限制帳號同時登入數量檢查
FILES=("/etc/security/limits.conf" /etc/security/limits.d/*.conf)
RESULT="KO"
FOUND_FILE=""
VALUE=""
GCB_LIMIT_CONF="/etc/security/limits.d/99-GCB.conf"

# 1. 遍歷檢查現有設定
for FILE in "${FILES[@]}"; do
    [ -f "$FILE" ] || continue
    LINE=$(grep -v '^\s*#' "$FILE" | grep -E "^\s*\*\s+hard\s+maxlogins\s+[0-9]+")
    if [[ -n "$LINE" ]]; then
        VALUE=$(echo "$LINE" | awk '{print $4}')
        if [[ "$VALUE" =~ ^[0-9]+$ && "$VALUE" -gt 0 && "$VALUE" -le 10 ]]; then
            RESULT="OK"
            FOUND_FILE="$FILE"
            break
        fi
    fi
done

# 2. 判斷與修復
if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0230 maxlogins=$VALUE 於 $FOUND_FILE"
else
    # 修復指令：在 99-GCB.conf 新增設定
    # 如果檔案不存在則建立，存在則先刪除舊的 maxlogins 設定再新增 (避免重複)
    mkdir -p /etc/security/limits.d/
    if [ -f "$GCB_LIMIT_CONF" ]; then
        sed -i '/\*\s*hard\s*maxlogins/d' "$GCB_LIMIT_CONF"
    fi
    echo "* hard maxlogins 10" >> "$GCB_LIMIT_CONF"
    
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0230 maxlogins set to 10 in $GCB_LIMIT_CONF"
fi	

# ---------------------------------------------------------
# TWGCB-01-012-0236 & 0239 整合檢查 (TMOUT 與 umask)
# ---------------------------------------------------------
FIX_FILE="/etc/profile.d/TWGCB.sh"
CHECK_FILES=("/etc/bashrc" "/etc/profile" /etc/profile.d/*.sh)

# --- 1. 檢查 TMOUT (0236) ---
TMOUT_OK=0
for FILE in "${CHECK_FILES[@]}"; do
    [ ! -f "$FILE" ] && continue
    # 抓取非註解的 TMOUT 設定
    T_VAL=$(grep -E '^\s*TMOUT=[0-9]+' "$FILE" | grep -oE '[0-9]+' | head -1)
    if [[ -n "$T_VAL" && "$T_VAL" -le 900 && "$T_VAL" -gt 0 ]]; then
        TMOUT_OK=1
        break
    fi
done

# --- 2. 檢查 umask (0239) ---
UMASK_OK=0
for FILE in "${CHECK_FILES[@]}"; do
    [ ! -f "$FILE" ] && continue
    if grep -Eq '^\s*umask\s+0*27' "$FILE" 2>/dev/null; then
        UMASK_OK=1
        break
    fi
done

# --- 3. 判斷結果與執行整合修復 ---
if [ "$TMOUT_OK" -eq 1 ] && [ "$UMASK_OK" -eq 1 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0236 & 0239 (TMOUT and umask) are compliant."
else
    # 只要有一項不合格，就建立/覆蓋整合修復檔
    # 呼叫您定案的備份函式 (選擇性)
    [ -f "$FIX_FILE" ] && smart_backup "$FIX_FILE"

    cat << 'EOF' > "$FIX_FILE"
#!/bin/bash
# TWGCB-01-012-0236: Set Bash shell timeout to 900 seconds
# Check if the shell is interactive ($PS1 is set) before applying TMOUT.
if [ -n "$PS1" ]; then
    # Use readonly to prevent users from changing it during the session
    readonly TMOUT=900 ; export TMOUT
fi

# TWGCB-01-012-0239: Set global default umask for Login Shells
# Normal users (GID > 999) get 027; System accounts get 077.
if [[ $(id -g) -gt 999 ]] ; then
    umask 027
else
    # For system accounts, maintain stricter 077 permissions
    umask 077
fi
EOF

    chmod 644 "$FIX_FILE"
    
    # 輸出提示訊息告知哪邊修復了
    [ "$TMOUT_OK" -eq 0 ] && echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0236 (TMOUT) applied to $FIX_FILE"
    [ "$UMASK_OK" -eq 0 ] && echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0239 (umask) applied to $FIX_FILE"
fi

# TWGCB-01-012-0240 檢查 /etc/login.defs 的預設 UMASK，UMASK 應設為 027 或更嚴格 (如 077) 。
# --- 變數定義 ---
FILE="/etc/login.defs"
# 1. 抓取 UMASK 行且排除註解
# 2. 提取數值並檢查是否符合 027 
CURRENT_UMASK=$(grep -iE '^\s*UMASK' "$FILE" 2>/dev/null | awk '{print $2}')
if [[ "$CURRENT_UMASK" == "027" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0240 UMASK in $FILE is correctly set to $CURRENT_UMASK."
else
	sed -i 's/^\s*UMASK\s\+[0-9]\+/UMASK 027/' $FILE
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0240 UMASK is set to 027 ($FILE)"
fi

# ---------------------------------------------------------
# TWGCB-01-012-0309 檢查並修復 root 預設 umask 設定
# ---------------------------------------------------------
FILES=("/root/.bash_profile" "/root/.bashrc")
RESULT="KO"
FOUND_FILE=""

# 1. 執行檢查
for FILE in "${FILES[@]}"; do
    [ ! -f "$FILE" ] && continue
    
    # 使用優化後的 grep 進行精準匹配
    if grep -qE '^[[:space:]]*umask[[:space:]]+0*27([[:space:]]*$|[[:space:]]+#)' "$FILE"; then
        RESULT="OK"
        FOUND_FILE="$FILE"
        break
    fi
done

# 2. 判斷結果與執行修復
if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0309 root umask is set to 027 in $FOUND_FILE"
else
    # 只要 KO，我們就針對這兩個檔案進行修復
    for FIX_TARGET in "${FILES[@]}"; do
        # 如果檔案不存在就跳過 (例如有些系統只有 .bashrc 沒有 .bash_profile)
        [ ! -f "$FIX_TARGET" ] && continue

        # 執行備份 (呼叫您定案的 smart_backup 函式)
        smart_backup "$FIX_TARGET"

        # 檢查檔案中是否已經存在任何 umask 設定 (不論是多少)
        if grep -qE '^[[:space:]]*umask' "$FIX_TARGET"; then
            # 如果已有 umask，則將其修改為 027 (排除掉已註解的行)
            # 使用 sed 取代第一個出現的 umask 設定
            sed -i 's/^[[:space:]]*umask.*/umask 027/' "$FIX_TARGET"
            echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0309 Updated existing umask to 027 in $FIX_TARGET"
        else
            # 如果檔案裡完全沒有 umask，則追加到檔案最末尾
            echo -e "\n# TWGCB-01-012-0309: Set root default umask\numask 027" >> "$FIX_TARGET"
            echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0309 Added umask 027 to the end of $FIX_TARGET"
        fi
    done
fi

# --- TWGCB-01-012-0310 檢測與修復 ---
conf="/etc/security/faillock.conf"
even_deny_root_set=$(grep -E '^[[:space:]]*even_deny_root' "$conf" 2>/dev/null)
unlock_time=$(grep -E '^[[:space:]]*root_unlock_time' "$conf" 2>/dev/null | awk -F'=' '{gsub(/[[:space:]]/, "", $2); print $2}')

if [[ -n "$even_deny_root_set" && "$unlock_time" =~ ^[0-9]+$ && "$unlock_time" -ge 60 ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0310 root_unlock_time=$unlock_time and even_deny_root enabled"
else
    smart_backup "$conf"
    grep -qE '^[[:space:]]*even_deny_root' "$conf" || echo "even_deny_root" >> "$conf"
    if grep -qE '^[[:space:]]*root_unlock_time' "$conf"; then
        sed -i 's/^[[:space:]]*root_unlock_time.*/root_unlock_time = 60/' "$conf"
    else
        echo "root_unlock_time = 60" >> "$conf"
    fi
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0310 root unlock policy has been fixed and backed up."
fi


#207 #220 #221 #222
LOGFILE="$SCRIPT_DIR/TWGCB-012-AUTOFIX.log"
if [ "$NEED_FIX" -eq 1 ]; then
    {
        local CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")		
        echo "===================================================="
        echo "Execution Date: $(date)"
        echo "Action: Automated Fix for TWGCB-01-012-0207 220 221 222"
        echo "The following function was executed:"
        echo "----------------------------------------------------"
		echo "Function Details:"
        declare -f FIX_PAM_POLICIES
        echo "----------------------------------------------------"		
        echo "End of Action - [$CURRENT_TIME]"
        echo "===================================================="
        echo ""		
    } >> "$LOGFILE"
	NEED_FIX=0
fi

}

#稽核系統與日誌管理 (Audit & Logging)
#36 37 134 135 143 145 174 175 176 177 181 182 191 192 193 194 195 196 197 198 199 200 201 202 203 204 308 
fix_logging_audit() {
    echo -e "${GREEN}============================================================"
    echo -e "${GREEN}-----------開始執行4.[稽核系統與日誌管理 (Audit & Logging)]修復"
    echo -e "${GREEN}============================================================"
# TWGCB-01-008-0036
if ! rpm -q aide &>/dev/null; then
	dnf install aide -y
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0036 aide initialling"
fi
if [ ! -f /var/lib/aide/aide.db.gz ]; then
	echo -e "aide initialising (This may take a few minutes)..."
	aide --init
	if [ -f /var/lib/aide/aide.db.new.gz ]; then
        mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0036 aide database created."
    fi
fi

# TWGCB-01-012-0037：設定 AIDE 定期檢查排程,定義要檢查的關鍵字與排程指令 (每天凌晨 05:00 執行)
CRON_CMD="0 5 * * * /usr/sbin/aide --check"
CRON_KEYWORD="/usr/sbin/aide --check"

# 1. 檢查目前排程中是否已存在該指令
# 使用 2>/dev/null 隱藏 "no crontab for root" 訊息
if crontab -l 2>/dev/null | grep -q "$CRON_KEYWORD"; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0037 AIDE schedule check already exists."
else
    # 2. 如果不存在，則自動加入
    echo "正在將 AIDE 定期檢查排程寫入 crontab..."
    
    # 讀取現有排程並加上新排程，再重新匯入
    (crontab -l 2>/dev/null; echo "$CRON_CMD") | crontab -
    
    # 3. 再次驗證
    if crontab -l 2>/dev/null | grep -q "$CRON_KEYWORD"; then
        echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0037 AIDE schedule check added (Daily 05:00)."
    else
        echo -e " [\e[1;31mERR\e[0m] TWGCB-01-012-0037 Failed to add AIDE schedule."
    fi
fi

# TWGCB-01-012-0134：檢查 GRUB 是否設定 audit=1
if grep -qE '^\s*GRUB_CMDLINE_LINUX=.*audit=1' /etc/default/grub; then
	echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0134 audit=1 is set in GRUB_CMDLINE_LINUX"
else
	sed -i '/^GRUB_CMDLINE_LINUX=/ s/"$/ audit=1"/' "/etc/default/grub"	
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0134 audit=1 has been set to /etc/default/grub."
fi	
# TWGCB-01-012-0135：檢查 GRUB 是否設定 audit_backlog_limit >= 8192
CURRENT_BACKLOG=$(grep -oP 'audit_backlog_limit=\K[0-9]+' /etc/default/grub)
if [[ -n "$CURRENT_BACKLOG" ]] && [ "$CURRENT_BACKLOG" -ge 8192 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0135 audit_backlog_limit is $CURRENT_BACKLOG (>= 8192)."
else
	AUTOFIXSHELL0120135
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0135 audit_backlog_limit has been set to /etc/default/grub."
fi

# TWGCB-01-012-0143
chmod 750 /sbin/auditctl
chmod 750 /sbin/aureport
chmod 750 /sbin/ausearch
chmod 750 /sbin/auditd
chmod 750 /sbin/augenrules
chmod 750 /sbin/rsyslogd


# TWGCB-01-012-0145
fix_aide_audit_configs
# TWGCB-01-012-0146 147
fix_auditd_conf_limits
#148~157  159 160
fix_audit_rules


# --- TWGCB-01-012-0174：rsyslog 套件安裝 ---
if rpm -q rsyslog &>/dev/null; then    
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0174 rsyslog package is installed"
else
    dnf install -y rsyslog &>/dev/null
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0174 rsyslog installed successfully."
fi

# --- TWGCB-01-012-0175：rsyslog 服務啟動 ---
if systemctl is-enabled rsyslog &>/dev/null && systemctl is-active rsyslog &>/dev/null; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0175 rsyslog service is active."
else
    systemctl --now enable rsyslog &>/dev/null
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0175 rsyslog service started."
fi

# --- TWGCB-01-012-0176：rsyslog 檔案權限模式 ---
# 邏輯：檢查現有設定，若不合規或沒設，直接在 GCB.conf 強制覆蓋
GCB_RSYSLOG_CONF="/etc/rsyslog.d/GCB.conf"
# 抓取目前生效的模式 (包含所有 .conf)
found_mode=$(grep -rE '^\$FileCreateMode' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null | awk '{print $2}' | tail -n 1)

if [[ "$found_mode" == "0640" || "$found_mode" == "0600" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0176 \$FileCreateMode=$found_mode"
else
    smart_backup "$GCB_RSYSLOG_CONF"
    # 如果原本檔案沒這行就追加，有這行就用 sed 改 (確保只有一行)
    if grep -q "^\$FileCreateMode" "$GCB_RSYSLOG_CONF" 2>/dev/null; then
        sed -i 's/^\$FileCreateMode.*/\$FileCreateMode 0640/' "$GCB_RSYSLOG_CONF"
    else
        echo "\$FileCreateMode 0640" >> "$GCB_RSYSLOG_CONF"
    fi
    systemctl restart rsyslog &>/dev/null
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0176 \$FileCreateMode set to 0640 in $GCB_RSYSLOG_CONF"
fi

# --- TWGCB-01-012-0177：認證與服務資訊記錄至 /var/log/secure ---
# 檢查邏輯：檢查所有設定檔是否已有正確路徑
CHECK_FILES="/etc/rsyslog.conf /etc/rsyslog.d/*.conf"
AUTH_CHK=$(grep -rE '^\s*auth\.\*\s+/var/log/secure' $CHECK_FILES 2>/dev/null)
AUTHPRIV_CHK=$(grep -rE '^\s*authpriv\.\*\s+/var/log/secure' $CHECK_FILES 2>/dev/null)
DAEMON_CHK=$(grep -rE '^\s*daemon\.\*\s+/var/log/secure' $CHECK_FILES 2>/dev/null)
COMBO_CHK=$(grep -rE '^\s*auth\.\*,authpriv\.\*,daemon\.\*\s+/var/log/secure' $CHECK_FILES 2>/dev/null)

if [[ -n "$COMBO_CHK" ]] || [[ -n "$AUTH_CHK" && -n "$AUTHPRIV_CHK" && -n "$DAEMON_CHK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0177 rsyslog secure logging rules ok."
else
    smart_backup "$GCB_RSYSLOG_CONF"
    echo "auth.*,authpriv.*,daemon.* /var/log/secure" >> "$GCB_RSYSLOG_CONF"
    systemctl restart rsyslog &>/dev/null
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0177 rules added to $GCB_RSYSLOG_CONF"
fi




# TWGCB-01-012-0181：檢查 Compress 是否設定為 yes
if grep -iq '^\s*Compress=yes' /etc/systemd/journald.conf; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0181 Compress=yes"
    else
        sed -i '/^\s*Compress=/d' /etc/systemd/journald.conf
		sed -i '/\[Journal\]/a Compress=yes' /etc/systemd/journald.conf
		systemctl restart systemd-journald
    fi
	
# TWGCB-01-012-0182：檢查 Storage 是否設定為 persistent
if grep -iq '^\s*Storage=persistent' /etc/systemd/journald.conf; then
        echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0182 Storage = persistent"
    else
        sed -i '/^\s*Storage=/d' /etc/systemd/journald.conf
		sed -i '/\[Journal\]/a Storage=persistent' /etc/systemd/journald.conf
		systemctl restart systemd-journald
    fi

#191~204
chown root:root /etc/crontab
chmod 600 /etc/crontab
chown root:root /etc/cron.hourly
chmod 700 /etc/cron.hourly
chown root:root /etc/cron.daily
chmod 700 /etc/cron.daily
chown root:root /etc/cron.weekly
chmod 700 /etc/cron.weekly
chown root:root /etc/cron.monthly
chmod 700 /etc/cron.monthly
chown root:root /etc/cron.d
chmod 700 /etc/cron.d
rm -f /etc/cron.deny
rm -f /etc/at.deny
touch /etc/cron.allow
touch /etc/at.allow
chown root:root /etc/cron.allow
chown root:root /etc/at.allow
chmod 600 /etc/cron.allow
chmod 600 /etc/at.allow

# TWGCB-01-012-0308 檢查 rsyslog logrotate 設定
LOG_DIR="/var/log/rsyslog"
LOG_ROTATE_FILE="/etc/logrotate.d/rsyslog"
DIR_OK=false
FILE_OK=false
# 1. 檢查目錄
if [ -d "$LOG_DIR" ]; then
    [ "$(stat -c "%a" "$LOG_DIR")" -eq 750 ] && DIR_OK=true
fi

# 2. 檢查設定檔
[ -f "$LOG_ROTATE_FILE" ] && FILE_OK=true

# 3. 判斷與執行修復
if [[ "$DIR_OK" == true && "$FILE_OK" == true ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0308 rsyslog logrotate is configured correctly."
else
    # 執行修復步驟
    [ -f "$LOG_ROTATE_FILE" ] && smart_backup "$LOG_ROTATE_FILE"

    # 建立目錄並設定 GCB 要求之權限 (750)
    mkdir -p "$LOG_DIR"
    chmod 750 "$LOG_DIR"

    # 產出 logrotate 設定
    cat << 'EOF' > "$LOG_ROTATE_FILE"
# TWGCB-01-012-0308: rsyslog custom log rotation
/var/log/rsyslog/*.log {
    weekly
    rotate 4
    compress
    missingok
    notifempty
    postrotate
        /usr/bin/systemctl reload rsyslog.service >/dev/null || true
    endscript
}
EOF
    echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0308: Rsyslog logrotate policy enforced.(Created $LOG_DIR (750) and configured $LOG_ROTATE_FILE.)"
fi

}


# ---------------------------------------------------------
# SSH 安全性項次整合檢查 (0255, 0264-0281,except 0269)
# ---------------------------------------------------------
# 255 256 263 264 265 266 267 268 270 271 272 273 274 275 276 277 278 279 280 281 
fix_ssh_hardening() {
    echo -e "${GREEN}============================================================"
    echo -e "${GREEN}-----------開始執行5.[SSH 安全性項次整合檢查]修復"
    echo -e "${GREEN}============================================================"
FIX_FILE="/etc/ssh/sshd_config.d/00-GCB.conf"
SSH_RESTART_NEEDED=0
SSH_ISSUE_COUNT=0

# 定義期望值的關聯陣列 (Key: sshd -T 參數名, Value: 期望值)
declare -A SSH_EXPECTS=(
    ["protocol"]="2"
    ["loglevel"]="VERBOSE"
    ["x11forwarding"]="no"
    ["maxauthtries"]="4"
    ["ignorerhosts"]="yes"
    ["hostbasedauthentication"]="no"
    ["permitemptypasswords"]="no"
    ["permituserenvironment"]="no"
    ["clientaliveinterval"]="600"
    ["clientalivecountmax"]="1"
    ["logingracetime"]="60"
    ["usepam"]="yes"
    ["allowtcpforwarding"]="no"
    ["maxstartups"]="10:30:60"
    ["maxsessions"]="4"
    ["strictmodes"]="yes"
    ["compression"]="no"
    ["ignoreuserknownhosts"]="yes"
    ["printlastlog"]="yes"
    ["gssapiauthentication"]="no"
)

# 1. 執行核心檢查
for PARAM in "${!SSH_EXPECTS[@]}"; do
    # 取得系統當前運行值 (sshd -T 會輸出所有生效參數)
    CURRENT=$(sshd -T 2>/dev/null | grep -i "^${PARAM} " | awk '{print $2}' | tr '[:lower:]' '[:upper:]')
    EXPECT=$(echo "${SSH_EXPECTS[$PARAM]}" | tr '[:lower:]' '[:upper:]')

    # 特別處理 ClientAliveInterval (GCB 要求 0 < N <= 600)
    if [[ "$PARAM" == "clientaliveinterval" ]]; then
        if [[ "$CURRENT" -le 0 || "$CURRENT" -gt 600 ]]; then
            ((SSH_ISSUE_COUNT++))
        fi
    # 一般參數比對
    elif [[ "$CURRENT" != "$EXPECT" ]]; then
        ((SSH_ISSUE_COUNT++))
    fi
done

# 2. 判斷結果與執行整合修復
if [ "$SSH_ISSUE_COUNT" -eq 0 ]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB SSH configurations (0255, 0264-0281,except 0269) are compliant."
else
    echo -e " [\e[1;31mKO\e[0m] SSH configuration issues detected ($SSH_ISSUE_COUNT items). Create fix config file $FIX_FILE"

    # 備份現有的 GCB 設定檔 (如果存在)
    [ -f "$FIX_FILE" ] && smart_backup "$FIX_FILE"

    # 產出整合修復檔
    cat << 'EOF' > "$FIX_FILE"
# TWGCB SSH Hardening Configuration
# Items: 0255, 0264-0281,except 0269
Protocol 2
LogLevel VERBOSE
X11Forwarding no
MaxAuthTries 4
IgnoreRhosts yes
HostbasedAuthentication no
PermitEmptyPasswords no
PermitUserEnvironment no
ClientAliveInterval 600
ClientAliveCountMax 1
LoginGraceTime 60
UsePAM yes
AllowTcpForwarding no
MaxStartups 10:30:60
MaxSessions 4
StrictModes yes
Compression no
IgnoreUserKnownHosts yes
PrintLastLog yes
GSSAPIAuthentication no
EOF

    chmod 600 "$FIX_FILE"
    
    # 測試 SSH 設定語法是否正確
    if sshd -t; then
        systemctl restart sshd
        echo -e " [\e[1;33mFIXED\e[0m] TWGCB-01-012-0255, 0264-0281,except 0269 SSH GCB configuration applied and service restarted.(FIX file $FIX_FILE)"
    else
        echo -e " [\e[1;31mERROR\e[0m] SSH configuration syntax error! Please check $FIX_FILE"
    fi
fi

# TWGCB-01-012-0263 檢查 SSH 加密演算法設定
FIX_FILE="/etc/ssh/sshd_config.d/00-GCB.conf"
RESULT="KO"
# 官方建議設定
RECOMMENDED_CIPHERS="aes128-ctr,aes192-ctr,aes256-ctr"
RECOMMENDED_MACS="hmac-sha2-512,hmac-sha2-256"
RECOMMENDED_KEX="ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512"

# 使用 sshd -T 擷取最終生效值
CIPHERS=$(sshd -T 2>/dev/null | grep '^ciphers ' | awk '{$1=""; print $0}' | tr -d '[:space:]')
MACS=$(sshd -T 2>/dev/null | grep '^macs ' | awk '{$1=""; print $0}' | tr -d '[:space:]')
KEX=$(sshd -T 2>/dev/null | grep '^kexalgorithms ' | awk '{$1=""; print $0}' | tr -d '[:space:]')

# 比對是否完全符合建議
if [[ "$CIPHERS" == "$RECOMMENDED_CIPHERS" ]] && \
   [[ "$MACS" == "$RECOMMENDED_MACS" ]] && \
   [[ "$KEX" == "$RECOMMENDED_KEX" ]]; then
    RESULT="OK"
fi

# 輸出結果
if [[ "$RESULT" == "OK" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0263 SSH encryption algorithms are correctly configured"
else
	[ -f "$FIX_FILE" ] && smart_backup "$FIX_FILE"
    cat << 'EOF' >> "$FIX_FILE"
# TWGCB-01-012-0263: SSH Encryption, MACs, and Kex Algorithms Hardening
Ciphers aes128-ctr,aes192-ctr,aes256-ctr
MACs hmac-sha2-512,hmac-sha2-256
KexAlgorithms ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512
EOF

    if sshd -t; then
        systemctl restart sshd
		echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0263 Secure Algorithms enforced in $FIX_FILE."
    else
        echo -e " [\e[1;31mERROR\e[0m] TWGCB-01-012-0263 SSH configuration syntax error! Please check $FIX_FILE"
    fi
fi


#256
chown root:root /etc/ssh/sshd_config
chmod 600 /etc/ssh/sshd_config
find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod 600 {} \;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown root:root {} \;
find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod 644 {} \;

}


#防火牆服務與衝突過濾 (0244-0249)"
fix_firewalld() {
    echo -e "${GREEN}============================================================"
    echo -e "${GREEN}-----------開始執行6.[防火牆服務與衝突過濾(use firewalld]修復"
    echo -e "${GREEN}============================================================"


if [[ "$(systemctl is-enabled iptables 2>/dev/null)" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0244 iptables is masked."
else
	systemctl --now mask iptables
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0244 iptables is masked."
fi

if [[ "$(systemctl is-enabled ip6tables 2>/dev/null)" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0244 ip6tables is masked"
else
	systemctl --now mask ip6tables
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0244 ip6tables is masked."
fi	

if [[ "$(systemctl is-enabled nftables 2>/dev/null)" == "masked" ]]; then
    echo -e " [\e[1;32mOK\e[0m] TWGCB-01-012-0249 nftables is masked"
else
	systemctl --now mask nftables
	echo -e " [\e[1;33mFIX\e[0m] TWGCB-01-012-0249 nftables is masked."
fi	

}





show_fix_menu



####################################################################################################################################

#sleep 1
echo "#########################################################################"
echo
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "Script completed in" $DIFF "seconds"
echo
echo "Executed on :"
echo
echo "Check GCB hostname is" $HOSTNAME
date
echo
echo "#########################################################################"
echo
######################################################################################################
 










            show_menu;
        ;;
        x)exit;
        ;;
        \n)exit;
        ;;
        *)clear;
            option_picked "Pick an option from the menu";
            show_menu;
        ;;
      esac
    fi
done

