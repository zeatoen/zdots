// ==UserScript==
// @name         zoomscroll
// @namespace    http://tampermonkey.net/
// @version      2024-10-01
// @description  Zoom and scroll based on cursor position in Xorg
// @author       Zeatoen
// @match        *://*/*
// @grant        none
// ==/UserScript==
let scale = 1;

// Function to zoom the page
function zoomPage(event) {
  if (!event.ctrlKey) {
    return; // Do nothing if Ctrl is not pressed
  }

  event.preventDefault();

  // Calculate the scroll positions before scaling
  const cursorX = event.clientX;
  const cursorY = event.clientY;
  const scrollX = window.scrollX;
  const scrollY = window.scrollY;
  const offsetX = (cursorX + scrollX) / scale;
  const offsetY = (cursorY + scrollY) / scale;

  // Adjust the scale factor based on wheel direction
  if (event.deltaY < 0) {
    scale *= 1.05;
    if(scale>3){
     scale/=1.05;
        return;
    }
  } else {
    scale /= 1.05;
    if(scale<0.5){
     scale*=1.05;
        return;
    }

  }

  // Set the CSS transform to scale the page
  document.body.style.transformOrigin = "0 0";
  document.body.style.transform = `scale(${scale})`;

  // Recalculate the scroll positions to keep the cursor centered
  const newScrollX = offsetX * scale - cursorX;
  const newScrollY = offsetY * scale - cursorY;

  window.scrollTo(newScrollX, newScrollY);
}

// Attach the zoom function to the mouse wheel event
window.addEventListener("wheel", zoomPage, { passive: false });