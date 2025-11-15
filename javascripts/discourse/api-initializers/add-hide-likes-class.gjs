import { apiInitializer } from "discourse/lib/api";

export default apiInitializer("1.0.0", (api) => {
  
  api.onPageChange(() => {
    
    if (typeof document === "undefined") { return; }

    const fieldId = settings.hide_likes_user_field_id;

    if (!fieldId) {
      return;
    }

    const fieldKey = `user_field_${fieldId}`;


    const currentUser = api.getCurrentUser();
    
    // check if the user is logged in AND the dynamic field is checked
    if (currentUser && currentUser.custom_fields && currentUser.custom_fields[fieldKey]) {
      // add the class to the <body> tag
      document.body.classList.add("hide-likes-enabled");
    } else {
      // Remove the class from the <body> tag
      document.body.classList.remove("hide-likes-enabled");
    }
  });
});
