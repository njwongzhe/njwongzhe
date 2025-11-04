/**
 * Ascending Selection Sort. 
 * @param {Array|HTMLCollection} arrNum The array for sorting.
 * @param {Boolean} processBool Process mode.
 */
let selectionSort = async function (arrNum, processBool) {
    

    if(processBool === true) {
        for(let last = arrNum.length - 1; last >= 1; last--) {
            let largestIndex = 0;
            for(let p = 1; p < last; p++)
                if(Number(arrNum[p].innerText) > Number(arrNum[largestIndex].innerText))
                    largestIndex = p;
            switchBox(arrNum[largestIndex], arrNum[last]);
            await sleep(1000); // Delay to show process.
        }
    }

    else {
        for(let last = arrNum.length - 1; last >= 1; last--) {
            let largestIndex = 0;
            for(let p = 1; p < last; p++)
                if(arrNum[p] > arrNum[largestIndex])
                    largestIndex = p;
            switchValue(arrNum, largestIndex, last);
        }

        numBoxArea.innerHTML = "";
        
        for(let i = 0; i < arrNum.length; i++)
            numBoxCreate(arrNum[i]);
    }
};