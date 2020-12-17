package My.MonthType;

import java.io.IOException;
import java.text.DecimalFormat;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class MonthType {

	public static class Map extends Mapper<Object, Text, Text, IntWritable> {

		public static final IntWritable one = new IntWritable(1);
		private static Text newKey = new Text();

		public void map(Object key, Text value, Context context)
				throws IOException, InterruptedException {
			System.out.println("class start!");

			String line = value.toString();
			String film[] = line.split(",");

			String date = film[3];
			String[] ftype = film[1].split(";");

			for (int i = 0; i < ftype.length; i++) {
				String date1 = date.replace('-', '/');
				String[] time = date1.split("/");
				String year = time[0];
				String month = time[1];

				String thekey = year + "\t" + month + "\t" + ftype[i];
				newKey.set(thekey);
				System.out.println(thekey);
				context.write(newKey, one);

			}
		}
	}

	public static class Reduce extends
			Reducer<Text, IntWritable, Text, IntWritable> {

		private IntWritable result = new IntWritable();

		public void reduce(Text key, Iterable<IntWritable> values,
				Context context) throws IOException, InterruptedException {

			System.out.println("reduce start!");

			int sum = 0;
			for (IntWritable value : values) {
				sum += value.get();
			}
			result.set(sum);
			context.write(key, result);
		}
	}

	public static void main(String[] args) throws IOException,
			ClassNotFoundException, InterruptedException {
		Configuration conf = new Configuration();

		Job job = new Job(conf, "DirectorType");
		job.setJarByClass(MonthType.class);

		job.setMapperClass(Map.class);
		job.setReducerClass(Reduce.class);

		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);

		job.setInputFormatClass(TextInputFormat.class);
		job.setOutputFormatClass(TextOutputFormat.class);

		Path in = new Path("hdfs://localhost:9000/filmdata/in/filmdata3.csv");
		Path out = new Path("hdfs://localhost:9000/mymon/out3");
		FileInputFormat.addInputPath(job, in);
		FileOutputFormat.setOutputPath(job, out);
		System.exit(job.waitForCompletion(true) ? 0 : 1);

	}

	public static boolean isNumeric(String str) {
		for (int i = 0; i < str.length(); i++) {
			if (Character.isDigit(str.charAt(i)) || str.charAt(i) == '.') {
				return true;
			}
		}
		return false;
	}

}