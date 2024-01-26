//^============================================================================
//^ caelusAlert.js
//^    _____          ______ _     _    _  _____
//^   / ____|   /\   |  ____| |   | |  | |/ ____|
//^  | |       /  \  | |__  | |   | |  | | (___
//^  | |      / /\ \ |  __| | |   | |  | |\___ \
//^  | |____ / ____ \| |____| |___| |__| |____) |
//^   \_____/_/    \_\______|______\____/|_____/
//^
//^============================================================================

window.showAlert = showAlert;

//=============================================================================
// IMPORTS
//=============================================================================

import { replaceIcons } from './caelusIcons.js';
import { generateLoremIpsum } from './caelusIpsum.js';

//=============================================================================

let isAlertSystemReady = false;
const alertCallsQueue = [];

//=============================================================================

function processQueuedAlertCalls() {
    alertCallsQueue.forEach(([title, message, alertType, lifetime, ipsum]) => {
        showAlertNow(title, message, alertType, lifetime, ipsum);
    });
    alertCallsQueue.length = 0;
}

//=============================================================================

function showAlertNow(title, message, alertType, lifetime, ipsum=false) {
    const container = document.getElementById('alert-container') || createAlertContainer();
    const alert = document.createElement('div');
    alert.classList.add('will-change-transform', 'alert', 'max-w-md', 'w-full', 'rounded-lg', 'overflow-hidden', 'shadow-lg', 'mb-2', 'transform', 'transition-all', 'duration-500', 'opacity-0', 'translate-y-2');

    // Dynamic alertType classes for header color
    const alertTypeClasses = {
        info: 'bg-blue-500',
        success: 'bg-green-500',
        warning: 'bg-yellow-500',
        error: 'bg-red-500'
    };

    const alertTypeIcons = {
        info: 'info',
        success: 'check-circle',
        warning: 'alert-circle',
        error: 'alert-triangle',
    }

    // Header section with title and close button
    const header = document.createElement('div');
    header.classList.add('flex', 'justify-between', 'items-center', 'p-3', alertTypeClasses[alertType] || 'bg-gray-500', 'text-white');
    const iconName = alertTypeIcons[alertType];
    header.innerHTML = `
        <i data-lucide="${iconName}" data-size=24></i>
        <strong class="font-semibold">${title}</strong>
        <button class="alert-close text-white" onclick="this.parentElement.parentElement.classList.add('opacity-0'); setTimeout(() => this.parentElement.parentElement.remove(), 500);">×</button>
    `;

    // Message section
    const body = document.createElement('div');
    body.classList.add('bg-neutral-800', 'text-white', 'p-3', 'leading-relaxed');
    if(ipsum) {
        body.innerHTML = generateLoremIpsum(2, 'medium');
    }
    else {
        body.innerHTML = message;
    }

    // Assembling the alert
    alert.appendChild(header);
    alert.appendChild(body);
    container.appendChild(alert);

    // Fade in the alert
    setTimeout(() => alert.classList.remove('opacity-0', 'translate-y-2'), 10);

    // Automatically hide with fade-out
    setTimeout(() => {
        alert.classList.add('will-change-auto', 'opacity-0', 'translate-y-2');
        // Wait for fade-out to complete before removing
        alert.addEventListener('transitionend', () => {
            alert.remove();
        });
    }, (lifetime * 1000));
}

//=============================================================================
// EXPORTS
export function showAlert(title, message, alertType, lifetime, ipsum=false) {
    if (isAlertSystemReady) {
        showAlertNow(title, message, alertType, lifetime, ipsum);
        replaceIcons();
    } else {
        alertCallsQueue.push([title, message, alertType, lifetime, ipsum]);
    }
}

export function markAlertSystemReady() {
    isAlertSystemReady = true;
    processQueuedAlertCalls();
}

//^=== EOF ====================================================================