#!/bin/bash
# DevOps Deployment Script
# Backup feature update
# Soft reset practice

APP_NAME="myapp"
#APP_DIR="/opt/$APP_NAME"
#BACKUP_DIR="/opt/backups"
#LOG_FILE="/var/log/depoly.log"


APP_DIR="$HOME/deployments/$APP_NAME"
BACKUP_DIR="$HOME/deployments/backups"
LOG_FILE="$HOME/deployments/deploy.log"

SERVICE_NAME="myapp"
BACKUP_CREATED=false
BACKUP_PATH=""

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE" 
}

rollback() {

	 if [ "$BACKUP_CREATED" != true ] || [ ! -d "$BACKUP_PATH" ]
then
    log "ERROR: Backup not available. Rollback impossible."
    echo "Rollback failed: Backup not available."
    exit 1
fi


    log "Rollback started"

    rm -rf "$APP_DIR"

    cp -r "$BACKUP_PATH" "$APP_DIR"
    
    if [ $? -ne 0 ]
then
    log "ERROR: Failed to restore backup"
    echo "Rollback failed: Could not restore backup."
    exit 1
fi

    sudo systemctl restart "$SERVICE_NAME"


	if [ ! -d "$APP_DIR" ]
then
    log "ERROR: Application restore failed"
    echo "Rollback failed: Application directory not restored."
    exit 1
fi

    if systemctl is-active --quiet "$SERVICE_NAME"
    then
        log "Rollback completed successfully"
        echo "Rollback successful."
    else
        log "ERROR: Rollback failed"
        echo "Rollback failed."
        exit 1
    fi
}

mkdir -p "$HOME/deployments"

trap 'log "ERROR: Deployment interrupted"; exit 1' SIGINT


if [ -z "$1" ]
then
	echo "Usage: $0 <source_directory>"
	exit 1
fi



SOURCE_DIR="$1"

if [  ! -d "$SOURCE_DIR" ]
then
	echo "Source directory not found : $SOURCE_DIR"
	exit 1
fi
log "Deployment started for $APP_NAME"

mkdir -p "$BACKUP_DIR"


if [ -d "$APP_DIR" ]
then
    BACKUP_PATH="$BACKUP_DIR/${APP_NAME}_$(date '+%Y%m%d_%H%M%S')"

    cp -r "$APP_DIR" "$BACKUP_PATH"

    if [ $? -eq 0 ]
    then
        BACKUP_CREATED=true
        log "Backup completed"
    else
        log "ERROR: Backup failed"
        echo "Backup failed. Deployment stopped."
        exit 1
    fi
fi

mkdir -p "$APP_DIR"
cp -r "$SOURCE_DIR"/* "$APP_DIR/"

log "Application files copied successfully"

if [ $? -ne 0 ]
then
    log "ERROR: Application deployment failed"
    echo "Deployment failed. Starting rollback..."

    if [ "$BACKUP_CREATED" = true ]
    then
        rollback
    else
        log "ERROR: No backup available for rollback"
        echo "Rollback impossible: No backup available."
        exit 1
    fi
fi



sudo systemctl restart "$SERVICE_NAME"
log "Service restarted successfully"

if [ $? -ne 0 ]
then
    log "ERROR: Service restart failed"
    echo "Service restart failed. Starting rollback..."

    if [ "$BACKUP_CREATED" = true ]
    then
        rollback
    else
        log "ERROR: No backup available for rollback"
        echo "Rollback impossible: No backup available."
        exit 1
    fi
fi

if systemctl is-active --quiet "$SERVICE_NAME"
then
	echo "Deployment Successful. Service is running"
	log "Deployment completed successfully"
else
	log "Deployment failed. Starting rollback..."
	 echo "Deployment failed. Starting rollback..."
	 rollback
	
	exit 1
fi



