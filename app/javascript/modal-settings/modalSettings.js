

const  pressExitBtn = () => {
const addMemberOptions = document.getElementById('settings-member');
const addPhotosOptions = document.getElementById('settings-photos');
const addSocialsOptions = document.getElementById('settings-socials');
const editOptions = document.getElementById('settings-edit');
const addGig = document.getElementById('setting-gig');


if (addMemberOptions){
  addMemberOptions.addEventListener('click', () => {
      document.getElementById('button-user-settings').click();
    });
}
if (addPhotosOptions) {
  addPhotosOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });
}
if (addSocialsOptions) {
  addSocialsOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });
}
if (editOptions) {
  editOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });
}
if (addGig) {
  addGig.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });
}
  
}

export { pressExitBtn } 