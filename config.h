static const char *background_color = "#282828";
static const char *border_color = "#458588";
static const char *font_color = "#ebdbb2";
static const char *font_pattern = "Hack-Bold:size=10:antialias=true:autohint=true";
static const unsigned line_spacing = 5;
static const unsigned int padding = 15;

static const unsigned int width = 350;
static const unsigned int border_size = 2;
static const unsigned int pos_x = 710;
static const unsigned int pos_y = 30;

enum corners { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT };
enum corners corner = TOP_LEFT;

static const unsigned int duration = 5; /* in seconds */

#define DISMISS_BUTTON Button3
#define ACTION_BUTTON Button1
