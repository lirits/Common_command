
# Debian System Configuration Script

# Function to disable IPv6
disable_ipv6() {
    echo 'Disabling IPv6...'
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
    echo 'IPv6 disabled.'
}

# Function to enable IPv6
enable_ipv6() {
    echo 'Enabling IPv6...'
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
    echo 'IPv6 enabled.'
}

# Function to set IPv4 as preferred
prefer_ipv4() {
    echo 'Setting IPv4 as preferred...'
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo sysctl -w net.ipv6.conf.all.autoconf=0
    sudo sysctl -w net.ipv6.conf.default.autoconf=0
    echo 'IPv4 set as preferred.'
}

# Function to set IPv6 as preferred
prefer_ipv6() {
    echo 'Setting IPv6 as preferred...'
    sudo sysctl -w net.ipv4.ip_forward=0
    sudo sysctl -w net.ipv6.conf.all.autoconf=1
    sudo sysctl -w net.ipv6.conf.default.autoconf=1
    echo 'IPv6 set as preferred.'
}

# Main script
echo 'Debian Configuration Script'
echo '1. Disable IPv6'
echo '2. Enable IPv6'
echo '3. Prefer IPv4'
echo '4. Prefer IPv6'
read -p 'Please select an option: ' option

case $option in
    1) disable_ipv6 ;;
    2) enable_ipv6 ;;
    3) prefer_ipv4 ;;
    4) prefer_ipv6 ;;
    *) echo 'Invalid option. Exiting.' ;;
esac
