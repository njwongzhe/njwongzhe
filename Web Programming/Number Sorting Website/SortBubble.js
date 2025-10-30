/**
 * Ascending Bubble Sort. 
 * @param {Array|HTMLCollection} arrNum The array for sorting.
 * @param {Boolean} processBool Process mode.
 */
let bubbleSort = async function (arrNum, processBool) {
    let sorted = false;

    if(processBool === true) {
        for(let pass = 1; (pass < arrNum.length); pass++) {
            sorted = true;
            for(let x = 0; x < (arrNum.length - pass); x++) {
                if(Number(arrNum[x].innerText) > Number(arrNum[x + 1].innerText)) {
                    switchBox(arrNum[x], arrNum[x + 1]);
                    sorted = false;
                    await sleep(1000); // Delay to show process.
                }
            }
        }
    }

    else {
        for(let pass = 1; (pass < arrNum.length); pass++) {
            sorted = true;
            for(let x = 0; x < (arrNum.length - pass); x++) {
                if(arrNum[x] > arrNum[x + 1]) {
                    switchValue(arrNum, x, x + 1)
                    sorted = false;
                }
            }
        }

        numBoxArea.innerHTML = "";
        
        for(let i = 0; i < arrNum.length; i++)
            numBoxCreate(arrNum[i]);
    }
};