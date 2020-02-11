alert('coucou')
const voyelle = ['a','e', 'y', 'u', 'i', 'o'];
const consonne = ['z','r','t','p', 'q', 's', 'd', 'f', 'g','h','j','k','l','m','w','x','c','v','b','n'];
const lettersss = [];

const buttonVoyelle = document.querySelector('.voyelle');
const buttonConsonne = document.querySelector('.consonne');
const table = document.querySelector('.tableau')
debugger

if (lettersss.length < 10) {
  buttonVoyelle.addEventListerner('click', (event) => {
    let voyelle = letters.push(voyelle.sample)
    table.insertAdjacentHTML('beforeend', '<td class=\'letter-blue\'> ${voyelle} </td>')

  })

  buttonConsonne.addEventListerner('click', (event) => {
    let consonne = letters.push(voyelle.sample)
    table.insertAdjacentHTML('beforeend', '<td class=\'letter-blue\'> ${voyelle} </td>')
  })
}
