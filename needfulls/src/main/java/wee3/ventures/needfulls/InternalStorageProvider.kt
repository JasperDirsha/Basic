/*
 * *
 *  * Created by Prabhu Chandran on 4/30/19 2:16 PM
 *  * Copyright (c) 2019 . All rights reserved.
 *  * Last modified 4/30/19 2:16 PM
 *
 */

package wee3.ventures.needfulls

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import java.io.FileInputStream
import java.io.FileNotFoundException
import java.io.FileOutputStream
import java.io.IOException
import kotlin.random.Random

class StoreImage(var context: Context) {

    fun saveBitmap(bitmap: Bitmap) : String? {
        var fileOutputStream: FileOutputStream? = null
        val imagePath = imagePathGenerator()
        try {
            fileOutputStream = context.openFileOutput(imagePath, Context.MODE_PRIVATE)
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, fileOutputStream)
        } catch (e: FileNotFoundException) {
            e.printStackTrace()
        } catch (e: IOException) {
            e.printStackTrace()
        } finally {
            fileOutputStream?.close()
        }
        return imagePath
    }

    fun loadBitmap(picName: String): Bitmap? {
        var bitmap: Bitmap? = null
        var fileInputStream: FileInputStream? = null
        try {
            fileInputStream = context.openFileInput(picName)
            bitmap = BitmapFactory.decodeStream(fileInputStream)
        } catch (e: FileNotFoundException) {
            e.printStackTrace()
        } catch (e: IOException) {
            e.printStackTrace()
        } finally {
            fileInputStream?.close()
        }

        return bitmap
    }

    private fun imagePathGenerator() : String{
        return "JPEG_${Random.nextLong(0,99999999)}_${BuildConfig.BUILD_TYPE}.jpg"
    }
}