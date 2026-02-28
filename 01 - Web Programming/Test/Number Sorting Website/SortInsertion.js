/**
 * Ascending Insertion Sort.
 * @param {String} sortMode Sorting mode (Ascending / Descending).
 * @param {Array|HTMLCollection} arrNum The array for sorting.
 * @param {Boolean} processBool Process mode.
 */
let insertionSort = async function (sortMode, arrNum, processBool) {
    let item, pass, insertIndex;

    if(processBool === true) {
        for(pass = 1; pass < arrNum.length; pass++) {
            item = arrNum[pass].innerText;
            insertIndex = pass;
            while((insertIndex > 0) && sortJudge(sortMode, Number(arrNum[insertIndex - 1].innerText), item)) {
                copyBoxToBox(arrNum[insertIndex - 1], arrNum[insertIndex]);
                insertIndex--;
                await sleep(1000); // Delay to show process.
            }
            copyValueToBox(item, arrNum[insertIndex]);
            await sleep(1000); // Delay to show process.
        }
    }

    else {
        for(pass = 1; pass < arrNum.length; pass++) {
            item = arrNum[pass];
            insertIndex = pass;
            while((insertIndex > 0) && sortJudge(sortMode, arrNum[insertIndex - 1], item)) {
                arrNum[insertIndex] = arrNum[insertIndex - 1];
                insertIndex--;
            }
            arrNum[insertIndex] = item;
        }

        replaceAllBox(arrNum);
    }
};

