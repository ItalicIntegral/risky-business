// journal.js
const journalJson = `
{
    "rrn": "1234",
    "date": "1980-11-27",
    "location": "location",
    "lines": ["line 1", "line 2", "line 3"]
}`;
// console.log(journalJson);

const journal = JSON.parse(journalJson);
// console.log(journal);

const rrn = document.getElementById("rrn");
rrn.innerHTML = `rrn: ${journal.rrn}`;

const date = document.getElementById("date");
date.innerHTML = `date: ${journal.date}`;

function createline(lineText) {
    console.log(lineText);
    let li = document.createElement('li');
    li.textContent = lineText;
    return li;
}
// lines.innerHTML = `lines: ${journal.lines}`;
// for each line in journal.lines {
    //     console.log
    // }
// journal.lines.forEach(createline);
const lines = document.getElementById("lines");
lines.appendChild(journal.lines.forEach(createline));

// obj.birth = new Date(date);