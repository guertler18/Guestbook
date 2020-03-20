package at.fhj.ima.guestbook

import java.time.LocalDateTime

data class GuestBookEntry(
    val name: String,
    val comment: String,
    val addedAt: LocalDateTime = LocalDateTime.now()
)

class GuestBookManager {
    var entries = emptyList<GuestBookEntry>()
    private set

    public  fun add(entry: GuestBookEntry) {
        entries = entries.plus(entry)
    }

    val isEmpty get() = entries.isEmpty()

}