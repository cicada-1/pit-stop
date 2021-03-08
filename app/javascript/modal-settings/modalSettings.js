

const  pressExitBtn = () => {
const addMemberOptions = document.getElementById('settings-member');
const addPhotosOptions = document.getElementById('settings-photos');
const addSocialsOptions = document.getElementById('settings-socials');
const editOptions = document.getElementById('settings-edit');
const addGig = document.getElementById('setting-gig');



addMemberOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });

  addPhotosOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });

  addSocialsOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });

  editOptions.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });

  addGig.addEventListener('click', () => {
    document.getElementById('button-user-settings').click();
  });
  
}

export { pressExitBtn } 