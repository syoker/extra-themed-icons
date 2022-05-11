SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false
API_SUPPORT_MIN=31

REPLACE="
"

print_modname() {
  ui_print ""
  ui_print "••••••••••••••••••••••••••"
  ui_print "    Extra Themed Icons"
  ui_print "••••••••••••••••••••••••••"
  ui_print ""
  ui_print "• Module by @Syoker"
  ui_print "• Filled Icons by TeamFiles"
  ui_print "• Line Icons by Lawnchair Team"
  ui_print ""

  sleep 2
}

android_check() {
 if [[ $API < API_SUPPORT_MIN ]]; then
   ui_print "• Sorry, you need Android 12 or later to use this module."
   ui_print ""
   sleep 2
   exit 1
 fi
}

volume_keytest() {
  ui_print "• Volume Key Test"
  ui_print "  Please press any key volume:"
  (/system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > "$TMPDIR"/events) || return 1
  return 0
}

volume_key() {
  while (true); do
    /system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > "$TMPDIR"/events
      if $(cat "$TMPDIR"/events 2>/dev/null | /system/bin/grep VOLUME >/dev/null); then
          break
      fi
  done
  if $(cat "$TMPDIR"/events 2>/dev/null | /system/bin/grep VOLUMEUP >/dev/null); then
      return 1
  else
      return 0
  fi
}

install_line_icons() {
  if [ -f "/system/product/overlay/ThemedIconsOverlay.apk" ]; then
    if [ -f "/system/product/overlay/ThemedIconsPixelOverlay.apk" ]; then
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
        cp -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
        mv -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
      fi
    else
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        mv -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
      fi
    fi
  else
    if [ -f "/system/product/overlay/ThemedIconsPixelOverlay.apk" ]; then
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        mv -f $MODPATH/Files/Line_Icons/ThemedIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
      fi
    else
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        mv -f $MODPATH/system/product/overlay/LineIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
      fi
    fi
  fi
}

install_filled_icons() {
  if [ -f "/system/product/overlay/ThemedIconsOverlay.apk" ]; then
    if [ -f "/system/product/overlay/ThemedIconsPixelOverlay.apk" ]; then
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
        cp -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
      fi
    else
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
      fi
    fi
  else
    if [ -f "/system/product/overlay/ThemedIconsPixelOverlay.apk" ]; then
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay
        cp -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsPixelOverlay.apk
      fi
    else
      if [ -f "/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk" ]; then
        mkdir -p $MODPATH/system/product/overlay/PixelLauncherIconsOverlay
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/PixelLauncherIconsOverlay/PixelLauncherIconsOverlay.apk
      else
        mkdir -p $MODPATH/system/product/overlay
        mv -f $MODPATH/system/product/overlay/FilledIconsOverlay.apk $MODPATH/system/product/overlay/ThemedIconsOverlay.apk
      fi
    fi
  fi
  rm -rf $MODPATH/system/product/overlay/LineIconsOverlay.apk
}

on_install() {

  android_check

  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2

  if volume_keytest; then
    ui_print "  Key test function complete"
    ui_print ""
    sleep 2
    
    ui_print "• Do you want to install filled icons or line icons?"
    ui_print "  Volume up(+): Filled icons"
    ui_print "  Volume down(-): Line icons"
    
    SELECT=volume_key
    
    if "$SELECT"; then
      ui_print "  Install line icons to system/product/overlay"
      ui_print ""
      install_line_icons
      rm -rf $MODPATH/system/product/overlay/FilledIconsOverlay.apk
      sleep 2
    else
      ui_print "  Install filled icons to system/product/overlay"
      ui_print ""
      install_filled_icons
      rm -rf $MODPATH/system/product/overlay/LineIconsOverlay.apk
      sleep 2
    fi

  else
    ui_print "  You have not pressed any key, aborting installation."
    ui_print ""
    sleep 2
    exit 1
  fi
  
  ui_print "- Deleting package cache"
  rm -rf /data/system/package_cache/*
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}