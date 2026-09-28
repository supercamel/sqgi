#include "study-native.h"

struct _StudyCounter {
    GObject parent_instance;
    gint value;
};
G_DEFINE_TYPE(StudyCounter, study_counter, G_TYPE_OBJECT)

enum { PROP_0, PROP_VALUE, N_PROPERTIES };
enum { CHANGED, N_SIGNALS };
static GParamSpec *properties[N_PROPERTIES];
static guint signals[N_SIGNALS];

static void
study_counter_get_property(GObject *object, guint id, GValue *value, GParamSpec *pspec)
{
    if (id == PROP_VALUE)
        g_value_set_int(value, STUDY_COUNTER(object)->value);
    else
        G_OBJECT_WARN_INVALID_PROPERTY_ID(object, id, pspec);
}

static void
study_counter_set_property(GObject *object, guint id, const GValue *value, GParamSpec *pspec)
{
    if (id == PROP_VALUE)
        STUDY_COUNTER(object)->value = g_value_get_int(value);
    else
        G_OBJECT_WARN_INVALID_PROPERTY_ID(object, id, pspec);
}

static void
study_counter_class_init(StudyCounterClass *klass)
{
    GObjectClass *object_class = G_OBJECT_CLASS(klass);
    object_class->get_property = study_counter_get_property;
    object_class->set_property = study_counter_set_property;
    properties[PROP_VALUE] = g_param_spec_int("value", "Value", "Current counter value",
        -1000000, 1000000, 40, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
    g_object_class_install_properties(object_class, N_PROPERTIES, properties);
    /**
     * StudyCounter::changed:
     * @self: the counter
     * @value: the updated value
     *
     * Emitted once after study_counter_add().
     */
    signals[CHANGED] = g_signal_new("changed", G_TYPE_FROM_CLASS(klass),
        G_SIGNAL_RUN_LAST, 0, NULL, NULL, NULL, G_TYPE_NONE, 1, G_TYPE_INT);
}

static void
study_counter_init(StudyCounter *self)
{
    self->value = 40;
}

StudyCounter *
study_counter_new(void)
{
    return g_object_new(STUDY_TYPE_COUNTER, NULL);
}

gint
study_counter_add(StudyCounter *self, gint amount)
{
    g_return_val_if_fail(STUDY_IS_COUNTER(self), 0);
    g_return_val_if_fail(amount >= -1000 && amount <= 1000, self->value);
    g_return_val_if_fail(self->value + amount >= -1000000 && self->value + amount <= 1000000, self->value);
    self->value += amount;
    g_object_notify_by_pspec(G_OBJECT(self), properties[PROP_VALUE]);
    g_signal_emit(self, signals[CHANGED], 0, self->value);
    return self->value;
}

gint
study_counter_get_revision(StudyCounter *self)
{
    g_return_val_if_fail(STUDY_IS_COUNTER(self), 0);
    return 42; /* Change to 43 for the study's source-revision rebuild check. */
}
