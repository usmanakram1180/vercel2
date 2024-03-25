// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// Add this script to your application.js or a separate JavaScript file

// Add this script to your application.js or a separate JavaScript file

$(document).ready(function() {
  // Image preview for multiple images
  $('input[name="home[images][]"]').change(function() {
    const imagePreviewContainer = $('#image-preview');
    imagePreviewContainer.empty();

    for (let i = 0; i < this.files.length; i++) {
      const reader = new FileReader();

      reader.onload = function(e) {
        imagePreviewContainer.append('<img src="' + e.target.result + '" alt="Image Preview"/>');
      };

      reader.readAsDataURL(this.files[i]);
    }
  });
  
  // Video preview
  $('input[name="home[video]"]').change(function() {
    const videoPreviewContainer = $('#video-preview');
    videoPreviewContainer.empty();

    const videoURL = URL.createObjectURL(this.files[0]);
    videoPreviewContainer.append('<video controls><source src="' + videoURL + '" type="video/*"></video>');
  });

  // Music preview
  $('input[name="home[music]"]').change(function() {
    const musicPreviewContainer = $('#music-preview');
    musicPreviewContainer.empty();

    const audioURL = URL.createObjectURL(this.files[0]);
    musicPreviewContainer.append('<audio controls><source src="' + audioURL + '" type="audio/*"></audio>');
  });
});
