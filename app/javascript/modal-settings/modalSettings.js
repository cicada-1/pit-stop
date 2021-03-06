

const  pressExitBtn = () => {
const addMemberOptions = document.getElementById('btn-plus');
const addPhotosOptions = document.getElementById('settings-photos');
const addSocialsOptions = document.getElementById('settings-socials');
const EditOptions = document.getElementById('settings-edit');



addMemberOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
    console.log(document.getElementById('button-user-settings').click());
  });

  addPhotosOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
    console.log(document.getElementById('button-user-settings').click());
  });

  addSocialsOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
    console.log(document.getElementById('button-user-settings').click());
  });

  EditOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
    console.log(document.getElementById('button-user-settings').click());
  });
  
}

export { pressExitBtn } 