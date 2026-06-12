/**
 * Ascending Selection Sort. 
 * @param {String} sortMode Sorting mode (Ascending / Descending).
 * @param {Array|HTMLCollection} arrNum The array for sorting.
 * @param {Boolean} processBool Process mode.
 */
let selectionSort = async function (sortMode, arrNum, processBool) {
    

    if(processBool === true) {
        for(let last = arrNum.length - 1; last >= 1; last--) {
            let largestIndex = 0;
            for(let p = 1; p <= last; p++)
                if(sortJudge(sortMode, Number(arrNum[p].innerText), Number(arrNum[largestIndex].innerText)))
                    largestIndex = p;
            switchBox(arrNum[largestIndex], arrNum[last]);
            await sleep(1000); // Delay to show process.
        }
    }

    else {
        for(let last = arrNum.length - 1; last >= 1; last--) {
            let largestIndex = 0;
            for(let p = 1; p <= last; p++)
                if(sortJudge(sortMode, arrNum[p], arrNum[largestIndex]))
                    largestIndex = p;
            switchValue(arrNum, largestIndex, last);
        }

        replaceAllBox(arrNum);
    }
};

