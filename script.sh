#!/bin/bash

# Display menu
echo "Choose an action:"
echo "1) Encrypt"
echo "2) Decrypt"

# Get user input
echo
read -p "Enter your choice (1/2): " action

# Handle user selection
case $action in
    1)
        read -p "File to encrypt: " src_file
        read -p "Name of encrypted file: " enc_output
        read -p "Public key file: " pub_key
        echo
        openssl pkeyutl -encrypt -in "$src_file" -out "$enc_output" -inkey "$pub_key" -pubin
        ;;
    2)
        read -p "File to decrypt: " enc_file
        read -p "Name of decrypted file: " dec_output
        read -p "Private key file: " priv_key
        read -s -p "Enter passphrase for the private key: " pass
        echo
        openssl pkeyutl -decrypt -in "$enc_file" -out "$dec_output" -inkey "$priv_key" -passin "pass:$pass"
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac
