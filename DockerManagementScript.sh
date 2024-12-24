#!/bin/bash

show_menu() {
    echo "Docker Management System"
    echo "1. Start a container."
    echo "2. Stop a container."
    echo "3. List all containers."
    echo "4. Exit"
}

start_container() {
    echo "Enter Container Name or ID to start:"
    read container
    docker start "$container" && echo "Container $container started successfully!" || echo "Failed to start container $container."
}

stop_container() {
    echo "Enter container name or ID to stop:"
    read container
    docker stop "$container" && echo "Container $container stopped successfully!" || echo "Failed to stop container $container."
}

list_container() {
    docker ps
}

while :; do
    show_menu
    read -p "Choose an option: " choice
    case $choice in
        1) start_container ;;
        2) stop_container ;;
        3) list_container ;;
        4) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
