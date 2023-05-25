// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDHGagzM0fBXSZ7dwenQ5ouDzWoQU_XjNA",
  authDomain: "apolo-medflashcards.firebaseapp.com",
  projectId: "apolo-medflashcards",
  storageBucket: "apolo-medflashcards.appspot.com",
  messagingSenderId: "557630390067",
  appId: "1:557630390067:web:f9ba02cb6d689ed6b30846",
  measurementId: "G-0T0HZ653LN"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
