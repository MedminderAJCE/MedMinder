package com.example.your_app_package_name

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.media.RingtoneManager
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat

class AlarmReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val notificationBuilder = NotificationCompat.Builder(context, "my_notification_channel")
            .setSmallIcon(R.drawable.ic_launcher)
            .setContentTitle("Alarm")
            .setContentText("Alarm triggered")
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setAutoCancel(true)
            .setSound(RingtoneManager.getDefaultUri(RingtoneManager.TYPE_ALARM))
            .setFullScreenIntent(null, true)

        val notificationManager = NotificationManagerCompat.from(context)
        notificationManager.notify(0, notificationBuilder.build())
    }
}
