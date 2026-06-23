/* =====================================================================
   CYRENIA TABLETOP — configuration
   Edit the two Supabase values below, then save. Nothing else required.

   Where to find these:
   Supabase dashboard  ->  Project Settings  ->  API
     SUPABASE_URL       = "Project URL"
     SUPABASE_ANON_KEY  = "anon" / "public" key  (this key is meant to be
                          public and safe to ship in client code)

   The two timing values control the exercise. They are read by BOTH
   index.html and display.html, so you only set them once here.
   For a quick end-to-end test, set BREACH_AT_MIN: 2 and REVEAL_AT_MIN: 4,
   then change them back to 60 / 90 for the real session.
   ===================================================================== */

window.CYRENIA_CONFIG = {
  SUPABASE_URL:      "https://zgyqrjhtyyhfvdgjnish.supabase.co",
  SUPABASE_ANON_KEY: "sb_publishable_tGO36B83v1B8dRcMhY3UmQ_IDuRiaiq",

  BREACH_AT_MIN: 2,    // BlackOrchard note seizes every screen, this many minutes after start
  REVEAL_AT_MIN: 4     // consequences auto-reveal, this many minutes after start
};
